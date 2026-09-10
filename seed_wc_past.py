"""
Fetch WC 2018 + 2022 from ESPN public API, plus enrich knockouts with
penalty shootouts and main referee from ESPN's /summary endpoint.

Emits /home/nexus/BD/wc_past_seed.sql with:
- Missing Paises + Selecoes (2018/2022-only teams)
- EdicoesCopa rows for 2018 + 2022
- SedesEdicao rows for 2018 (Rússia), 2022 (Catar) — 2026 backfilled by DDL migration
- Fases per past edição
- CidadesSede + Estadios for Russia (2018) and Qatar (2022)
- Grupos + ParticipacaoGrupo for both editions (real pts/V/E/D from match tallies)
- Partidas with gols_a/gols_b and gols_a_penaltis/gols_b_penaltis where applicable
- Arbitros (new ones) + ArbitragemPartida (principal per knockout match)
"""
import json
import sys
import time
from datetime import date, datetime, timedelta
from urllib.request import urlopen
from urllib.error import URLError

import psycopg2

PG = dict(host="localhost", user="postgres", password="Mv542602", dbname="album_copa")
OUT = "/home/nexus/BD/wc_past_seed.sql"

TEAM_ALIAS = {
    # WC 2022 + 2018 PT-name aliases
    "Qatar": "Catar", "Ecuador": "Equador", "Senegal": "Senegal",
    "Netherlands": "Holanda",
    "England": "Inglaterra", "Iran": "Irã", "IR Iran": "Irã",
    "United States": "Estados Unidos", "USA": "Estados Unidos",
    "Wales": "País de Gales",
    "Argentina": "Argentina", "Saudi Arabia": "Arábia Saudita",
    "Mexico": "México", "Poland": "Polônia",
    "France": "França", "Australia": "Austrália",
    "Denmark": "Dinamarca", "Tunisia": "Tunísia",
    "Spain": "Espanha", "Costa Rica": "Costa Rica",
    "Germany": "Alemanha", "Japan": "Japão",
    "Belgium": "Bélgica", "Canada": "Canadá",
    "Morocco": "Marrocos", "Croatia": "Croácia",
    "Brazil": "Brasil", "Serbia": "Sérvia",
    "Switzerland": "Suíça", "Cameroon": "Camarões",
    "Portugal": "Portugal", "Ghana": "Gana",
    "Uruguay": "Uruguai",
    "Korea Republic": "Coreia do Sul", "South Korea": "Coreia do Sul",
    # 2018-only additions
    "Russia": "Rússia",
    "Egypt": "Egito",
    "Nigeria": "Nigéria",
    "Iceland": "Islândia",
    "Sweden": "Suécia",
    "Peru": "Peru",
    "Panama": "Panamá",
    "Colombia": "Colômbia",
}

# Confederação per "extra" team — for inserts when missing
EXTRA_TEAMS = {
    # 2022-only
    "País de Gales": "UEFA", "Polônia": "UEFA",
    "Dinamarca": "UEFA", "Costa Rica": "CONCACAF",
    "Sérvia": "UEFA", "Camarões": "CAF",
    # 2018-only
    "Rússia": "UEFA", "Egito": "CAF", "Nigéria": "CAF",
    "Islândia": "UEFA", "Suécia": "UEFA", "Peru": "CONMEBOL",
    "Panamá": "CONCACAF", "Colômbia": "CONMEBOL",
}

GROUPS_2022 = {
    "A": ["Catar", "Equador", "Senegal", "Holanda"],
    "B": ["Inglaterra", "Irã", "Estados Unidos", "País de Gales"],
    "C": ["Argentina", "Arábia Saudita", "México", "Polônia"],
    "D": ["França", "Austrália", "Dinamarca", "Tunísia"],
    "E": ["Espanha", "Costa Rica", "Alemanha", "Japão"],
    "F": ["Bélgica", "Canadá", "Marrocos", "Croácia"],
    "G": ["Brasil", "Sérvia", "Suíça", "Camarões"],
    "H": ["Portugal", "Gana", "Uruguai", "Coreia do Sul"],
}
GROUPS_2018 = {
    "A": ["Rússia", "Arábia Saudita", "Egito", "Uruguai"],
    "B": ["Portugal", "Espanha", "Marrocos", "Irã"],
    "C": ["França", "Austrália", "Peru", "Dinamarca"],
    "D": ["Argentina", "Islândia", "Croácia", "Nigéria"],
    "E": ["Brasil", "Suíça", "Costa Rica", "Sérvia"],
    "F": ["Alemanha", "México", "Suécia", "Coreia do Sul"],
    "G": ["Bélgica", "Panamá", "Tunísia", "Inglaterra"],
    "H": ["Polônia", "Senegal", "Colômbia", "Japão"],
}

EDITIONS = [
    dict(ano=2018, nome="Copa do Mundo FIFA 2018",
         start=date(2018, 6, 14), end=date(2018, 7, 15),
         champion="França", vice="Croácia", third="Bélgica",
         sedes_pt=["Rússia"],
         groups=GROUPS_2018,
         stadiums_2018=True),
    dict(ano=2022, nome="Copa do Mundo FIFA 2022",
         start=date(2022, 11, 20), end=date(2022, 12, 18),
         champion="Argentina", vice="França", third="Croácia",
         sedes_pt=["Catar"],
         groups=GROUPS_2022,
         stadiums_2018=False),
]

# Stadiums – minimal set per edition, sufficient as a fallback when ESPN venue name doesn't match
STADIUMS_2022 = [
    ("Estádio Lusail", 80000), ("Estádio Al Bayt", 60000),
    ("Estádio Khalifa Internacional", 45000), ("Estádio 974", 40000),
    ("Estádio Al Janoub", 40000), ("Estádio Al Thumama", 40000),
    ("Estádio Education City", 40000), ("Estádio Ahmad bin Ali", 40000),
]
STADIUMS_2018 = [
    ("Estádio Lujniki", 81000), ("Estádio São Petersburgo", 67000),
    ("Estádio Spartak", 45000), ("Estádio Fisht", 47000),
    ("Estádio Volgogrado", 45000), ("Arena Kazan", 45000),
    ("Estádio Niznhi Novgorod", 45000), ("Arena Samara", 45000),
    ("Arena Rostov", 45000), ("Arena Mordóvia", 44000),
    ("Arena Ecaterimburgo", 35000), ("Estádio Kaliningrado", 35000),
]
STADIUM_ALIAS = {
    # 2022
    "Lusail Stadium": "Estádio Lusail", "Lusail Iconic Stadium": "Estádio Lusail",
    "Al Bayt Stadium": "Estádio Al Bayt",
    "Khalifa International Stadium": "Estádio Khalifa Internacional",
    "Stadium 974": "Estádio 974",
    "Al Janoub Stadium": "Estádio Al Janoub",
    "Al Thumama Stadium": "Estádio Al Thumama",
    "Education City Stadium": "Estádio Education City",
    "Ahmad bin Ali Stadium": "Estádio Ahmad bin Ali",
    "Ahmed bin Ali Stadium": "Estádio Ahmad bin Ali",
    # 2018
    "Luzhniki Stadium": "Estádio Lujniki",
    "Krestovsky Stadium": "Estádio São Petersburgo",
    "Saint Petersburg Stadium": "Estádio São Petersburgo",
    "Spartak Stadium": "Estádio Spartak",
    "Otkritie Arena": "Estádio Spartak",
    "Fisht Olympic Stadium": "Estádio Fisht",
    "Fisht Stadium": "Estádio Fisht",
    "Volgograd Arena": "Estádio Volgogrado",
    "Kazan Arena": "Arena Kazan",
    "Nizhny Novgorod Stadium": "Estádio Niznhi Novgorod",
    "Samara Arena": "Arena Samara",
    "Cosmos Arena": "Arena Samara",
    "Rostov Arena": "Arena Rostov",
    "Mordovia Arena": "Arena Mordóvia",
    "Yekaterinburg Arena": "Arena Ecaterimburgo",
    "Kaliningrad Stadium": "Estádio Kaliningrado",
}

SLUG_TO_FASE = {
    "group-stage":     "Fase de Grupos",
    "round-of-16":     "Oitavas de Final",
    "quarterfinals":   "Quartas de Final",
    "semifinals":      "Semifinal",
    "3rd-place-final": "Disputa de 3º Lugar",
    "3rd-place-match": "Disputa de 3º Lugar",
    "third-place":     "Disputa de 3º Lugar",
    "final":           "Final",
}
FASES_ORDEM = [
    ("Fase de Grupos", 1, False),
    ("Oitavas de Final", 2, True),
    ("Quartas de Final", 3, True),
    ("Semifinal", 4, True),
    ("Disputa de 3º Lugar", 5, True),
    ("Final", 6, True),
]


def fetch_scoreboard(start: date, end: date):
    d = start
    while d <= end:
        url = f"https://site.api.espn.com/apis/site/v2/sports/soccer/fifa.world/scoreboard?dates={d:%Y%m%d}"
        try:
            with urlopen(url, timeout=20) as r:
                data = json.loads(r.read())
            for ev in data.get("events", []):
                yield ev
        except (URLError, json.JSONDecodeError) as e:
            print(f"  ! {d}: {e}", file=sys.stderr)
        d += timedelta(days=1)
        time.sleep(0.1)


# ESPN keyEvent type → our EventosJogo.tipo
EVENT_TYPE_MAP = {
    "Goal":              "gol",
    "Own Goal":          "gol_contra",
    "Penalty - Scored":  "penalti_convertido",
    "Yellow Card":       "cartao_amarelo",
    "Red Card":          "cartao_vermelho",
    "Second Yellow Card":"cartao_vermelho",
    "Yellow-Red Card":   "cartao_vermelho",
    "Substitution":      "substituicao",
}

# ESPN roster position abbreviation → our Jogadores.posicao
def map_position(pos_abbr: str) -> str:
    if not pos_abbr:
        return "TEAM"
    p = pos_abbr.upper()
    if p == "G" or p == "GK":           return "GK"
    if p.startswith(("CD","FB","LB","RB","D")): return "DEF"
    if p in ("CM","DM","AM","M","CM-L","CM-R","CM-C"): return "MID"
    if p.startswith("M"):                return "MID"
    if p in ("F","FW","ST","LW","RW","W","CF","SS"):   return "FWD"
    return "TEAM"


def parse_minute(disp: str) -> int:
    """ESPN clock.displayValue like 23', 45'+7', 120'+5' → integer minute."""
    if not disp:
        return 0
    t = disp.replace("'", "").strip()
    if "+" in t:
        a, b = t.split("+", 1)
        try: return int(a) + int(b)
        except ValueError: return 0
    try: return int(t)
    except ValueError: return 0


def sql_str(s: str) -> str:
    return s.replace("$$", "$ $")


def fetch_summary(event_id: str):
    url = f"https://site.api.espn.com/apis/site/v2/sports/soccer/fifa.world/summary?event={event_id}&enable=commentary"
    for attempt in range(3):
        try:
            with urlopen(url, timeout=20) as r:
                return json.loads(r.read())
        except (URLError, json.JSONDecodeError) as e:
            if attempt < 2:
                time.sleep(1.5 * (attempt + 1))
                continue
            print(f"  ! summary {event_id}: {e}", file=sys.stderr)
    return None


def main():
    cn = psycopg2.connect(**PG); cur = cn.cursor()

    cur.execute("SELECT id, nome FROM Selecoes");      name_to_sid = {n: i for i, n in cur.fetchall()}
    cur.execute("SELECT id, nome FROM Paises");        pais_to_id  = {n: i for i, n in cur.fetchall()}
    cur.execute("SELECT id, nome FROM Confederacoes"); conf_to_id  = {n: i for i, n in cur.fetchall()}
    cur.execute("SELECT id, nome FROM Estadios");      estadio_to_id = {n: i for i, n in cur.fetchall()}
    cur.execute("SELECT id, nome FROM CidadesSede");   cidade_to_id  = {n: i for i, n in cur.fetchall()}
    cur.execute("SELECT id, nome FROM Arbitros");      arb_to_id     = {n: i for i, n in cur.fetchall()}
    # (player_name, id_selecao) -> id_jogador, for de-dup across ESPN inserts
    cur.execute("SELECT id, nome, id_selecao FROM Jogadores")
    jog_by_name_sid = {(n, s): i for i, n, s in cur.fetchall()}

    if "Holanda" in name_to_sid:
        name_to_sid["Países Baixos"] = name_to_sid["Holanda"]

    def nxt(table):
        cur.execute(f"SELECT COALESCE(MAX(id),0)+1 FROM {table}")
        return cur.fetchone()[0]
    next_sid    = nxt("Selecoes")
    next_pid    = nxt("Paises")
    next_eid    = nxt("Estadios")
    next_cid    = nxt("CidadesSede")
    next_fid    = nxt("Fases")
    next_gid    = nxt("Grupos")
    next_mid    = nxt("Partidas")
    next_edid   = nxt("EdicoesCopa")
    next_arbid  = nxt("Arbitros")
    next_jid    = nxt("Jogadores")
    next_evid   = nxt("EventosJogo")

    out = ["-- ============================================================",
           "-- Seed: WC 2018 + WC 2022 (champions, teams, groups, matches,",
           "--       penalty shootouts, principal referees, SedesEdicao)",
           "-- Sources: ESPN scoreboard + ESPN /summary endpoint",
           "-- ============================================================\n",
           "BEGIN;",
           "SET search_path TO public;",
           "SET session_replication_role = replica;  -- skip triggers during bulk seed\n"]

    # 1) Missing teams + their países
    for pt_name, conf in EXTRA_TEAMS.items():
        if pt_name not in pais_to_id:
            out.append(
                f"INSERT INTO Paises (id, nome, id_confederacao) "
                f"VALUES ({next_pid}, $${pt_name}$$, {conf_to_id[conf]});"
            )
            pais_to_id[pt_name] = next_pid; next_pid += 1
        if pt_name not in name_to_sid:
            out.append(
                f"INSERT INTO Selecoes (id, nome, id_pais, id_confederacao, grupo_copa) "
                f"VALUES ({next_sid}, $${pt_name}$$, {pais_to_id[pt_name]}, "
                f"{conf_to_id[conf]}, '');"
            )
            name_to_sid[pt_name] = next_sid; next_sid += 1
    out.append("")

    edicao_id = {}  # ano -> id
    fase_id   = {}  # (ano, fase_nome) -> id

    for ed in EDITIONS:
        ano = ed["ano"]
        # 2) EdicoesCopa
        ed_id = next_edid; next_edid += 1
        edicao_id[ano] = ed_id
        out.append(
            f"INSERT INTO EdicoesCopa (id, ano, nome, data_inicio, data_fim, "
            f"id_selecao_campea, id_selecao_vice, id_selecao_terceiro) VALUES "
            f"({ed_id}, {ano}, $${ed['nome']}$$, '{ed['start']}', '{ed['end']}', "
            f"{name_to_sid[ed['champion']]}, {name_to_sid[ed['vice']]}, "
            f"{name_to_sid[ed['third']]});"
        )
        # 3) SedesEdicao
        for sp in ed["sedes_pt"]:
            out.append(
                f"INSERT INTO SedesEdicao (id_edicao, id_pais) "
                f"VALUES ({ed_id}, {pais_to_id[sp]});"
            )
        # 4) Fases
        for nome, ordem, elim in FASES_ORDEM:
            out.append(
                f"INSERT INTO Fases (id, nome, id_edicao, ordem, eliminatoria) "
                f"VALUES ({next_fid}, $${nome}$$, {ed_id}, {ordem}, {str(elim).upper()});"
            )
            fase_id[(ano, nome)] = next_fid; next_fid += 1
        # 5) Cidades-sede + Estadios
        host_country_name = ed["sedes_pt"][0]
        # Use one cidade-sede umbrella per edition for brevity
        umbrella = f"Cidades-sede {ano} ({host_country_name})"
        umbrella_id = next_cid; next_cid += 1
        out.append(
            f"INSERT INTO CidadesSede (id, nome, id_pais) "
            f"VALUES ({umbrella_id}, $${umbrella}$$, {pais_to_id[host_country_name]});"
        )
        stadiums = STADIUMS_2018 if ed["stadiums_2018"] else STADIUMS_2022
        for nm, cap in stadiums:
            out.append(
                f"INSERT INTO Estadios (id, nome, capacidade, id_cidade) "
                f"VALUES ({next_eid}, $${nm}$$, {cap}, {umbrella_id});"
            )
            estadio_to_id[nm] = next_eid; next_eid += 1
        # 6) Grupos
        group_ids = {}
        for letra in ed["groups"]:
            out.append(
                f"INSERT INTO Grupos (id, letra, id_edicao) "
                f"VALUES ({next_gid}, $${letra}$$, {ed_id});"
            )
            group_ids[letra] = next_gid; next_gid += 1
        # 7) ParticipacaoGrupo placeholders (filled below from match tallies)
        standings = {}
        for letra, teams in ed["groups"].items():
            for t in teams:
                if t not in name_to_sid:
                    print(f"  ! missing team in name_to_sid: {t}", file=sys.stderr)
                    continue
                sid = name_to_sid[t]
                standings[sid] = dict(pontos=0, jogos=0, vitorias=0, empates=0,
                                      derrotas=0, gp=0, gc=0, grupo=group_ids[letra])
        ed["_standings"] = standings
        ed["_stadiums"] = stadiums

        out.append("")

    # 8) Fetch matches per edition (with commentary for events + rosters)
    match_inserts = []
    arbitragem_inserts = []
    new_arbs_added = set()
    jogador_inserts = []           # ordered INSERTs for new Jogadores
    convocacao_keys = set()        # (jid, sid, ed_id) — dedup
    convocacao_inserts = []
    evento_inserts = []

    for ed in EDITIONS:
        ano = ed["ano"]
        print(f"Fetching WC {ano} matches…", file=sys.stderr)
        events = list(fetch_scoreboard(ed["start"], ed["end"]))
        print(f"  {len(events)} events", file=sys.stderr)
        added = skipped = 0

        for ev in events:
            comp = ev["competitions"][0]
            slug = ev.get("season", {}).get("slug", "")
            fase_nome = SLUG_TO_FASE.get(slug)
            if not fase_nome:
                skipped += 1; continue
            fid = fase_id[(ano, fase_nome)]

            competitors = comp.get("competitors", [])
            if len(competitors) != 2:
                skipped += 1; continue
            a = next((c for c in competitors if c.get("homeAway") == "home"), competitors[0])
            b = next((c for c in competitors if c.get("homeAway") == "away"), competitors[1])
            a_en = a.get("team", {}).get("displayName") or a.get("team", {}).get("name")
            b_en = b.get("team", {}).get("displayName") or b.get("team", {}).get("name")
            a_pt = TEAM_ALIAS.get(a_en); b_pt = TEAM_ALIAS.get(b_en)
            if not a_pt or not b_pt or a_pt not in name_to_sid or b_pt not in name_to_sid:
                print(f"  ! skip {a_en} vs {b_en}", file=sys.stderr)
                skipped += 1; continue
            sid_a, sid_b = name_to_sid[a_pt], name_to_sid[b_pt]
            try:
                ga = int(a.get("score", 0) or 0); gb = int(b.get("score", 0) or 0)
            except (TypeError, ValueError):
                ga, gb = 0, 0

            venue_full = comp.get("venue", {}).get("fullName", "")
            est_nm = STADIUM_ALIAS.get(venue_full)
            est_id = estadio_to_id.get(est_nm) if est_nm else estadio_to_id[ed["_stadiums"][0][0]]

            d_iso = comp.get("startDate") or comp.get("date") or f"{ed['start']}T00:00Z"
            try:
                dt = datetime.fromisoformat(d_iso.replace("Z", "+00:00"))
                data_hora = dt.strftime("%Y-%m-%d %H:%M:%S")
            except ValueError:
                data_hora = f"{ed['start']} 00:00:00"

            # Enrich every match with /summary?enable=commentary
            pen_a = pen_b = None
            ref_name = None
            ref_nat  = None
            summary = fetch_summary(ev["id"])
            if summary:
                s_comp = summary.get("header", {}).get("competitions", [{}])[0]
                for c in s_comp.get("competitors", []):
                    ss = c.get("shootoutScore")
                    if ss is not None:
                        t_en = c.get("team", {}).get("displayName")
                        t_pt = TEAM_ALIAS.get(t_en)
                        if t_pt and name_to_sid.get(t_pt) == sid_a:
                            pen_a = int(ss)
                        elif t_pt and name_to_sid.get(t_pt) == sid_b:
                            pen_b = int(ss)
                officials = summary.get("gameInfo", {}).get("officials", []) or []
                for o in officials:
                    ref_name = o.get("displayName")
                    ref_nat  = (o.get("country") or {}).get("name")
                    if ref_name:
                        break
            time.sleep(0.05)

            venc = "NULL"
            if fase_nome != "Fase de Grupos":
                if ga > gb:   venc = str(sid_a)
                elif gb > ga: venc = str(sid_b)
                elif pen_a is not None and pen_b is not None:
                    venc = str(sid_a) if pen_a > pen_b else str(sid_b)

            pen_a_sql = pen_a if pen_a is not None else "NULL"
            pen_b_sql = pen_b if pen_b is not None else "NULL"

            match_inserts.append(
                f"INSERT INTO Partidas (id, id_edicao, id_fase, id_estadio, "
                f"id_selecao_a, id_selecao_b, data_hora, gols_a, gols_b, "
                f"gols_a_penaltis, gols_b_penaltis, id_selecao_vencedora) "
                f"VALUES ({next_mid}, {edicao_id[ano]}, {fid}, {est_id}, "
                f"{sid_a}, {sid_b}, '{data_hora}', {ga}, {gb}, "
                f"{pen_a_sql}, {pen_b_sql}, {venc});"
            )

            # Referee + ArbitragemPartida (only for knockouts where we fetched it)
            if ref_name and fase_nome != "Fase de Grupos":
                # Add Arbitro if new
                if ref_name not in arb_to_id and ref_name not in new_arbs_added:
                    pais_ref = pais_to_id.get(ref_nat) if ref_nat else None
                    pais_sql = pais_ref if pais_ref else "NULL"
                    out.append(
                        f"INSERT INTO Arbitros (id, nome, id_pais) "
                        f"VALUES ({next_arbid}, $${ref_name.replace('$','')}$$, {pais_sql});"
                    )
                    arb_to_id[ref_name] = next_arbid
                    new_arbs_added.add(ref_name)
                    next_arbid += 1
                arb_id = arb_to_id[ref_name]
                arbitragem_inserts.append(
                    f"INSERT INTO ArbitragemPartida (id_partida, id_arbitro, funcao) "
                    f"VALUES ({next_mid}, {arb_id}, 'principal');"
                )

            partida_id = next_mid  # capture before incrementing
            next_mid += 1
            added += 1

            # --- Rosters → Jogadores + Convocacoes (per match lineup) -----
            if summary:
                for r in summary.get("rosters", []):
                    t_en = r.get("team", {}).get("displayName")
                    t_pt = TEAM_ALIAS.get(t_en)
                    if not t_pt or t_pt not in name_to_sid:
                        continue
                    sid = name_to_sid[t_pt]
                    for p in r.get("roster", []) or []:
                        ath = p.get("athlete", {}) or {}
                        nome = ath.get("displayName")
                        if not nome:
                            continue
                        pos = map_position(p.get("position", {}).get("abbreviation"))
                        key = (nome, sid)
                        if key not in jog_by_name_sid:
                            jogador_inserts.append(
                                f"INSERT INTO Jogadores (id, nome, posicao, id_selecao) "
                                f"VALUES ({next_jid}, $${sql_str(nome)}$$, '{pos}', {sid});"
                            )
                            jog_by_name_sid[key] = next_jid
                            next_jid += 1
                        jid = jog_by_name_sid[key]
                        camisa = p.get("jersey")
                        try:
                            camisa_int = int(camisa)
                            if camisa_int < 1 or camisa_int > 99: camisa_int = None
                        except (TypeError, ValueError):
                            camisa_int = None
                        camisa_sql = camisa_int if camisa_int else "NULL"
                        ckey = (jid, sid, edicao_id[ano])
                        if ckey not in convocacao_keys:
                            convocacao_keys.add(ckey)
                            convocacao_inserts.append(
                                f"INSERT INTO Convocacoes (id_jogador, id_selecao, id_edicao, numero_camisa) "
                                f"VALUES ({jid}, {sid}, {edicao_id[ano]}, {camisa_sql});"
                            )

            # --- keyEvents → EventosJogo ----------------------------------
            if summary:
                for e in summary.get("keyEvents", []) or []:
                    pl = e.get("play", e)
                    t_en = pl.get("type", {}).get("text", "")
                    tipo = EVENT_TYPE_MAP.get(t_en)
                    if not tipo:
                        continue
                    minute = parse_minute(pl.get("clock", {}).get("displayValue", ""))
                    if minute > 180:
                        minute = 180
                    ev_team_en = (pl.get("team") or {}).get("displayName")
                    ev_team_pt = TEAM_ALIAS.get(ev_team_en)
                    if not ev_team_pt or ev_team_pt not in name_to_sid:
                        continue
                    ev_sid = name_to_sid[ev_team_pt]
                    parts = pl.get("participants", []) or []
                    ath = parts[0].get("athlete", {}) if parts else {}
                    pl_name = ath.get("displayName")
                    pl_jid = "NULL"
                    if pl_name and (pl_name, ev_sid) in jog_by_name_sid:
                        pl_jid = str(jog_by_name_sid[(pl_name, ev_sid)])
                    evento_inserts.append(
                        f"INSERT INTO EventosJogo (id, id_partida, id_selecao, id_jogador, tipo, minuto) "
                        f"VALUES ({next_evid}, {partida_id}, {ev_sid}, {pl_jid}, '{tipo}', {minute});"
                    )
                    next_evid += 1

            # Group standings
            if fase_nome == "Fase de Grupos":
                st = ed["_standings"]
                if sid_a in st and sid_b in st:
                    st[sid_a]["jogos"] += 1; st[sid_b]["jogos"] += 1
                    st[sid_a]["gp"] += ga;   st[sid_a]["gc"] += gb
                    st[sid_b]["gp"] += gb;   st[sid_b]["gc"] += ga
                    if ga > gb:
                        st[sid_a]["vitorias"] += 1; st[sid_a]["pontos"] += 3
                        st[sid_b]["derrotas"] += 1
                    elif gb > ga:
                        st[sid_b]["vitorias"] += 1; st[sid_b]["pontos"] += 3
                        st[sid_a]["derrotas"] += 1
                    else:
                        st[sid_a]["empates"] += 1;  st[sid_a]["pontos"] += 1
                        st[sid_b]["empates"] += 1;  st[sid_b]["pontos"] += 1

        print(f"  WC {ano}: {added} matches, {skipped} skipped", file=sys.stderr)

    # 9) ParticipacaoGrupo with filled standings (across all editions)
    out.append("")
    for ed in EDITIONS:
        for sid, s in ed["_standings"].items():
            out.append(
                f"INSERT INTO ParticipacaoGrupo (id_grupo, id_selecao, pontos, jogos, "
                f"vitorias, empates, derrotas, gols_pro, gols_contra) "
                f"VALUES ({s['grupo']}, {sid}, {s['pontos']}, {s['jogos']}, "
                f"{s['vitorias']}, {s['empates']}, {s['derrotas']}, {s['gp']}, {s['gc']});"
            )

    # 10) Jogadores (new players discovered in rosters)
    out.append("")
    out.append(f"-- {len(jogador_inserts)} new Jogadores from ESPN rosters")
    out.extend(jogador_inserts)

    # 11) Partidas
    out.append("")
    out.extend(match_inserts)

    # 12) Convocacoes (per-edition squad union of per-match lineups)
    out.append("")
    out.append(f"-- {len(convocacao_inserts)} convocações from ESPN rosters")
    out.extend(convocacao_inserts)

    # 13) ArbitragemPartida
    out.append("")
    out.extend(arbitragem_inserts)

    # 14) EventosJogo
    out.append("")
    out.append(f"-- {len(evento_inserts)} events from ESPN keyEvents")
    out.extend(evento_inserts)

    # 12) Bump SERIAL sequences
    out.append("")
    out.append("-- Bump SERIAL sequences past the explicit IDs we inserted")
    for tbl in ("Paises", "Selecoes", "EdicoesCopa", "Fases", "CidadesSede",
                "Estadios", "Grupos", "Partidas", "Arbitros", "Jogadores",
                "EventosJogo"):
        out.append(
            f"SELECT setval(pg_get_serial_sequence('{tbl.lower()}', 'id'), "
            f"(SELECT COALESCE(MAX(id), 1) FROM {tbl}));"
        )

    out.append("")
    out.append("SET session_replication_role = origin;")
    out.append("COMMIT;")

    with open(OUT, "w") as f:
        f.write("\n".join(out) + "\n")
    print(f"\nWrote {OUT} ({len(out)} lines, {len(match_inserts)} matches, "
          f"{len(arbitragem_inserts)} referee assignments)", file=sys.stderr)
    cur.close(); cn.close()


if __name__ == "__main__":
    main()
