-- =============================================================================
-- SCC0640 - Bases de Dados (USP/ICMC) - Projeto de Curso
-- 05.DDL.sql  -- Definição do esquema relacional (PostgreSQL)
-- Tema: Sistema de gerenciamento de Copas do Mundo da FIFA
-- =============================================================================

-- 1. DROP (ordem reversa de dependências)
DROP TABLE IF EXISTS EventosJogo        CASCADE;
DROP TABLE IF EXISTS ArbitragemPartida  CASCADE;
DROP TABLE IF EXISTS Partidas           CASCADE;
DROP TABLE IF EXISTS Fases              CASCADE;
DROP TABLE IF EXISTS ParticipacaoGrupo  CASCADE;
DROP TABLE IF EXISTS Grupos             CASCADE;
DROP TABLE IF EXISTS Convocacoes        CASCADE;
DROP TABLE IF EXISTS Tecnicos           CASCADE;
DROP TABLE IF EXISTS Jogadores          CASCADE;
DROP TABLE IF EXISTS Arbitros           CASCADE;
DROP TABLE IF EXISTS Estadios           CASCADE;
DROP TABLE IF EXISTS CidadesSede        CASCADE;
DROP TABLE IF EXISTS EdicoesCopa        CASCADE;
DROP TABLE IF EXISTS Selecoes           CASCADE;
DROP TABLE IF EXISTS Paises             CASCADE;
DROP TABLE IF EXISTS Confederacoes      CASCADE;

DROP FUNCTION IF EXISTS fn_atualiza_classificacao()   CASCADE;
DROP FUNCTION IF EXISTS fn_limite_jogadores()         CASCADE;
DROP FUNCTION IF EXISTS fn_uma_selecao_por_edicao()   CASCADE;
DROP FUNCTION IF EXISTS fn_valida_partida_duplicada() CASCADE;


-- =============================================================================
-- 2. TABELAS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Confederações (FIFA, UEFA, CONMEBOL, ...)
-- -----------------------------------------------------------------------------
CREATE TABLE Confederacoes (
    id      SERIAL PRIMARY KEY,
    nome    VARCHAR(100) UNIQUE NOT NULL
);

-- -----------------------------------------------------------------------------
-- Países (toda Seleção pertence a um País; todo País a uma Confederação)
-- -----------------------------------------------------------------------------
CREATE TABLE Paises (
    id              SERIAL PRIMARY KEY,
    nome            VARCHAR(100) UNIQUE NOT NULL,
    id_confederacao INT,
    CONSTRAINT fk_pais_conf FOREIGN KEY (id_confederacao)
        REFERENCES Confederacoes(id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- -----------------------------------------------------------------------------
-- Seleções
-- -----------------------------------------------------------------------------
CREATE TABLE Selecoes (
    id              SERIAL PRIMARY KEY,
    nome            VARCHAR(100) UNIQUE NOT NULL,
    grupo_copa      VARCHAR(10),
    url_bandeira    TEXT,
    id_pais         INT,
    id_confederacao INT,
    CONSTRAINT fk_selecao_pais FOREIGN KEY (id_pais)
        REFERENCES Paises(id) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_selecao_confederacao FOREIGN KEY (id_confederacao)
        REFERENCES Confederacoes(id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- -----------------------------------------------------------------------------
-- Edições da Copa (ano, país-sede, campeã, vice e terceira)
-- -----------------------------------------------------------------------------
CREATE TABLE EdicoesCopa (
    id                  SERIAL PRIMARY KEY,
    ano                 INT UNIQUE NOT NULL,
    nome                VARCHAR(100) NOT NULL,
    data_inicio         DATE,
    data_fim            DATE,
    id_selecao_campea   INT,
    id_selecao_vice     INT,
    id_selecao_terceiro INT,
    CONSTRAINT chk_edicao_datas CHECK (
        data_fim IS NULL OR data_inicio IS NULL OR data_fim >= data_inicio
    ),
    CONSTRAINT fk_edicao_campea FOREIGN KEY (id_selecao_campea)
        REFERENCES Selecoes(id) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_edicao_vice FOREIGN KEY (id_selecao_vice)
        REFERENCES Selecoes(id) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_edicao_terceiro FOREIGN KEY (id_selecao_terceiro)
        REFERENCES Selecoes(id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- -----------------------------------------------------------------------------
-- Sedes da edição (N:M): uma edição pode ter múltiplos países-sede (ex: 2026
-- com EUA / Canadá / México). Substitui o antigo FK único id_pais_sede.
-- -----------------------------------------------------------------------------
CREATE TABLE SedesEdicao (
    id_edicao INT NOT NULL,
    id_pais   INT NOT NULL,
    PRIMARY KEY (id_edicao, id_pais),
    CONSTRAINT fk_sede_edicao FOREIGN KEY (id_edicao)
        REFERENCES EdicoesCopa(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_sede_pais FOREIGN KEY (id_pais)
        REFERENCES Paises(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- -----------------------------------------------------------------------------
-- Cidades-sede (pertencem a um país; uma edição pode ter várias)
-- -----------------------------------------------------------------------------
CREATE TABLE CidadesSede (
    id      SERIAL PRIMARY KEY,
    nome    VARCHAR(100) NOT NULL,
    id_pais INT NOT NULL,
    CONSTRAINT uq_cidade_pais UNIQUE (nome, id_pais),
    CONSTRAINT fk_cidade_pais FOREIGN KEY (id_pais)
        REFERENCES Paises(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- Estádios (cada estádio em uma única cidade-sede)
-- -----------------------------------------------------------------------------
CREATE TABLE Estadios (
    id          SERIAL PRIMARY KEY,
    nome        VARCHAR(150) NOT NULL,
    capacidade  INT,
    id_cidade   INT NOT NULL,
    CONSTRAINT chk_capacidade CHECK (capacidade IS NULL OR capacidade > 0),
    CONSTRAINT fk_estadio_cidade FOREIGN KEY (id_cidade)
        REFERENCES CidadesSede(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- Jogadores (pertencem a uma única Seleção)
-- -----------------------------------------------------------------------------
CREATE TABLE Jogadores (
    id          SERIAL PRIMARY KEY,
    nome        VARCHAR(150) NOT NULL,
    posicao     VARCHAR(20)  NOT NULL,
    id_selecao  INT NOT NULL,
    CONSTRAINT chk_posicao CHECK (
        posicao IN ('GK','DEF','MID','FWD','TEAM','SPECIAL')
    ),
    CONSTRAINT fk_jogador_selecao FOREIGN KEY (id_selecao)
        REFERENCES Selecoes(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- Técnicos (um técnico por Seleção em cada Edição)
-- -----------------------------------------------------------------------------
CREATE TABLE Tecnicos (
    id              SERIAL PRIMARY KEY,
    nome            VARCHAR(150) NOT NULL,
    nacionalidade   VARCHAR(100),
    id_selecao      INT NOT NULL,
    id_edicao       INT NOT NULL,
    CONSTRAINT uq_tecnico_selecao_edicao UNIQUE (id_selecao, id_edicao),
    CONSTRAINT fk_tecnico_selecao FOREIGN KEY (id_selecao)
        REFERENCES Selecoes(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_tecnico_edicao FOREIGN KEY (id_edicao)
        REFERENCES EdicoesCopa(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- Árbitros
-- -----------------------------------------------------------------------------
CREATE TABLE Arbitros (
    id      SERIAL PRIMARY KEY,
    nome    VARCHAR(150) NOT NULL,
    id_pais INT,
    CONSTRAINT fk_arbitro_pais FOREIGN KEY (id_pais)
        REFERENCES Paises(id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- -----------------------------------------------------------------------------
-- Convocações (N:M ternária: Jogador × Seleção × Edição)
-- -----------------------------------------------------------------------------
CREATE TABLE Convocacoes (
    id_jogador      INT NOT NULL,
    id_selecao      INT NOT NULL,
    id_edicao       INT NOT NULL,
    numero_camisa   INT,
    PRIMARY KEY (id_jogador, id_selecao, id_edicao),
    CONSTRAINT chk_camisa CHECK (
        numero_camisa IS NULL OR (numero_camisa BETWEEN 1 AND 99)
    ),
    CONSTRAINT fk_conv_jogador FOREIGN KEY (id_jogador)
        REFERENCES Jogadores(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_conv_selecao FOREIGN KEY (id_selecao)
        REFERENCES Selecoes(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_conv_edicao FOREIGN KEY (id_edicao)
        REFERENCES EdicoesCopa(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- Fases da edição (grupos, oitavas, quartas, semi, 3º lugar, final)
-- -----------------------------------------------------------------------------
CREATE TABLE Fases (
    id              SERIAL PRIMARY KEY,
    nome            VARCHAR(60) NOT NULL,
    id_edicao       INT NOT NULL,
    ordem           INT NOT NULL DEFAULT 0,
    eliminatoria    BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT uq_fase_edicao_nome UNIQUE (nome, id_edicao),
    CONSTRAINT fk_fase_edicao FOREIGN KEY (id_edicao)
        REFERENCES EdicoesCopa(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- Grupos da fase de grupos (identificados por letra dentro de uma edição)
-- -----------------------------------------------------------------------------
CREATE TABLE Grupos (
    id          SERIAL PRIMARY KEY,
    letra       VARCHAR(4) NOT NULL,
    id_edicao   INT NOT NULL,
    CONSTRAINT chk_grupo_letra CHECK (letra ~ '^[A-Z]$'),
    CONSTRAINT uq_grupo_letra_edicao UNIQUE (letra, id_edicao),
    CONSTRAINT fk_grupo_edicao FOREIGN KEY (id_edicao)
        REFERENCES EdicoesCopa(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- ParticipacaoGrupo (N:M Seleção ↔ Grupo; mapeamento do relacionamento
-- "Seleção participa de Grupo de uma Edição"; armazena a classificação)
-- -----------------------------------------------------------------------------
CREATE TABLE ParticipacaoGrupo (
    id_grupo    INT NOT NULL,
    id_selecao  INT NOT NULL,
    pontos      INT NOT NULL DEFAULT 0,
    jogos       INT NOT NULL DEFAULT 0,
    vitorias    INT NOT NULL DEFAULT 0,
    empates     INT NOT NULL DEFAULT 0,
    derrotas    INT NOT NULL DEFAULT 0,
    gols_pro    INT NOT NULL DEFAULT 0,
    gols_contra INT NOT NULL DEFAULT 0,
    saldo_gols  INT GENERATED ALWAYS AS (gols_pro - gols_contra) STORED,
    PRIMARY KEY (id_grupo, id_selecao),
    CONSTRAINT chk_part_nao_negativos CHECK (
        pontos >= 0 AND jogos >= 0 AND vitorias >= 0 AND empates >= 0
        AND derrotas >= 0 AND gols_pro >= 0 AND gols_contra >= 0
    ),
    CONSTRAINT fk_part_grupo FOREIGN KEY (id_grupo)
        REFERENCES Grupos(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_part_selecao FOREIGN KEY (id_selecao)
        REFERENCES Selecoes(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- Partidas
--  - exatamente duas seleções distintas
--  - ocorrem em uma edição, fase, estádio, data/hora específicos
--  - guarda gols regulamentares, prorrogação e pênaltis (eliminatórias)
--  - guarda a seleção classificada (mata-mata)
-- -----------------------------------------------------------------------------
CREATE TABLE Partidas (
    id                      SERIAL PRIMARY KEY,
    id_edicao               INT NOT NULL,
    id_fase                 INT NOT NULL,
    id_estadio              INT NOT NULL,
    id_selecao_a            INT NOT NULL,
    id_selecao_b            INT NOT NULL,
    data_hora               TIMESTAMP NOT NULL,
    gols_a                  INT NOT NULL DEFAULT 0,
    gols_b                  INT NOT NULL DEFAULT 0,
    gols_a_prorrog          INT,
    gols_b_prorrog          INT,
    gols_a_penaltis         INT,
    gols_b_penaltis         INT,
    id_selecao_vencedora    INT,
    status                  VARCHAR(20) NOT NULL DEFAULT 'agendada'
        CHECK (status IN ('agendada','em_andamento','encerrada')),
    CONSTRAINT chk_selecoes_distintas  CHECK (id_selecao_a <> id_selecao_b),
    CONSTRAINT chk_gols_nao_negativos  CHECK (gols_a >= 0 AND gols_b >= 0),
    CONSTRAINT chk_vencedora_valida    CHECK (
        id_selecao_vencedora IS NULL
        OR id_selecao_vencedora = id_selecao_a
        OR id_selecao_vencedora = id_selecao_b
    ),
    CONSTRAINT fk_partida_edicao    FOREIGN KEY (id_edicao)
        REFERENCES EdicoesCopa(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_partida_fase      FOREIGN KEY (id_fase)
        REFERENCES Fases(id)       ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_partida_estadio   FOREIGN KEY (id_estadio)
        REFERENCES Estadios(id)    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_partida_sel_a     FOREIGN KEY (id_selecao_a)
        REFERENCES Selecoes(id)    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_partida_sel_b     FOREIGN KEY (id_selecao_b)
        REFERENCES Selecoes(id)    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_partida_vencedora FOREIGN KEY (id_selecao_vencedora)
        REFERENCES Selecoes(id)    ON UPDATE CASCADE ON DELETE SET NULL
);

-- -----------------------------------------------------------------------------
-- ArbitragemPartida (N:M Árbitro ↔ Partida; um árbitro exerce UMA função)
-- -----------------------------------------------------------------------------
CREATE TABLE ArbitragemPartida (
    id_partida  INT NOT NULL,
    id_arbitro  INT NOT NULL,
    funcao      VARCHAR(30) NOT NULL DEFAULT 'principal',
    PRIMARY KEY (id_partida, id_arbitro),
    CONSTRAINT chk_funcao CHECK (
        funcao IN ('principal','assistente1','assistente2','quarto','var')
    ),
    CONSTRAINT fk_arb_partida FOREIGN KEY (id_partida)
        REFERENCES Partidas(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_arb_arbitro FOREIGN KEY (id_arbitro)
        REFERENCES Arbitros(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- EventosJogo (gol, gol contra, pênalti, cartões, substituição)
-- jogador é opcional (substituição pode não envolver registro de jogador)
-- -----------------------------------------------------------------------------
CREATE TABLE EventosJogo (
    id          SERIAL PRIMARY KEY,
    id_partida  INT NOT NULL,
    id_selecao  INT NOT NULL,
    id_jogador  INT,
    tipo        VARCHAR(20) NOT NULL,
    minuto      INT NOT NULL,
    CONSTRAINT chk_minuto CHECK (minuto >= 0 AND minuto <= 180),
    CONSTRAINT chk_tipo CHECK (tipo IN (
        'gol','gol_contra','penalti_convertido',
        'cartao_amarelo','cartao_vermelho','substituicao'
    )),
    CONSTRAINT fk_evento_partida FOREIGN KEY (id_partida)
        REFERENCES Partidas(id)  ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_evento_selecao FOREIGN KEY (id_selecao)
        REFERENCES Selecoes(id)  ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_evento_jogador FOREIGN KEY (id_jogador)
        REFERENCES Jogadores(id) ON UPDATE CASCADE ON DELETE SET NULL
);


-- =============================================================================
-- 3. TRIGGERS  (mínimo de 4 — temos 5)
-- =============================================================================

-- -----------------------------------------------------------------------------
-- T1: Limite de jogadores por seleção (máx. 50, agregando elenco + álbum)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_limite_jogadores()
RETURNS TRIGGER AS $$
DECLARE qtd_atual INT;
BEGIN
    SELECT COUNT(*) INTO qtd_atual
    FROM Jogadores WHERE id_selecao = NEW.id_selecao;
    IF qtd_atual >= 50 THEN
        RAISE EXCEPTION 'Seleção atingiu o limite máximo de 50 jogadores.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_limite_jogadores
BEFORE INSERT ON Jogadores
FOR EACH ROW EXECUTE FUNCTION fn_limite_jogadores();

-- -----------------------------------------------------------------------------
-- T2: Uma seleção só pode estar em UM grupo por edição
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_uma_selecao_por_edicao()
RETURNS TRIGGER AS $$
DECLARE
    v_edicao    INT;
    v_conflito  INT;
BEGIN
    SELECT id_edicao INTO v_edicao FROM Grupos WHERE id = NEW.id_grupo;
    SELECT COUNT(*) INTO v_conflito
    FROM ParticipacaoGrupo pg
    JOIN Grupos g ON g.id = pg.id_grupo
    WHERE pg.id_selecao = NEW.id_selecao
      AND g.id_edicao   = v_edicao
      AND pg.id_grupo  <> NEW.id_grupo;
    IF v_conflito > 0 THEN
        RAISE EXCEPTION 'Seleção % já está em outro grupo da edição %',
                        NEW.id_selecao, v_edicao;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_uma_selecao_por_edicao
BEFORE INSERT OR UPDATE ON ParticipacaoGrupo
FOR EACH ROW EXECUTE FUNCTION fn_uma_selecao_por_edicao();

-- -----------------------------------------------------------------------------
-- T3: Evita partidas duplicadas na fase de grupos (mesmas seleções, mesma fase)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_valida_partida_duplicada()
RETURNS TRIGGER AS $$
DECLARE
    v_eliminatoria  BOOLEAN;
    v_duplicata     INT;
BEGIN
    SELECT eliminatoria INTO v_eliminatoria FROM Fases WHERE id = NEW.id_fase;
    IF v_eliminatoria THEN RETURN NEW; END IF;

    SELECT COUNT(*) INTO v_duplicata
    FROM Partidas
    WHERE id_edicao = NEW.id_edicao
      AND id_fase   = NEW.id_fase
      AND id       <> COALESCE(NEW.id, -1)
      AND (
        (id_selecao_a = NEW.id_selecao_a AND id_selecao_b = NEW.id_selecao_b) OR
        (id_selecao_a = NEW.id_selecao_b AND id_selecao_b = NEW.id_selecao_a)
      );

    IF v_duplicata > 0 THEN
        RAISE EXCEPTION 'Partida duplicada na fase de grupos: seleções % e %',
                        NEW.id_selecao_a, NEW.id_selecao_b;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_valida_partida_duplicada
BEFORE INSERT OR UPDATE ON Partidas
FOR EACH ROW EXECUTE FUNCTION fn_valida_partida_duplicada();

-- -----------------------------------------------------------------------------
-- T4: Atualiza classificação do grupo após cada partida de fase de grupos
--     (pontos, vitórias, empates, derrotas, gols pró/contra)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_atualiza_classificacao()
RETURNS TRIGGER AS $$
DECLARE
    v_fase_eliminatoria BOOLEAN;
    v_id_grupo_a INT;
    v_id_grupo_b INT;
BEGIN
    SELECT eliminatoria INTO v_fase_eliminatoria
    FROM Fases WHERE id = NEW.id_fase;
    IF v_fase_eliminatoria THEN RETURN NEW; END IF;

    SELECT pg.id_grupo INTO v_id_grupo_a
    FROM ParticipacaoGrupo pg
    JOIN Grupos g ON g.id = pg.id_grupo AND g.id_edicao = NEW.id_edicao
    WHERE pg.id_selecao = NEW.id_selecao_a LIMIT 1;

    SELECT pg.id_grupo INTO v_id_grupo_b
    FROM ParticipacaoGrupo pg
    JOIN Grupos g ON g.id = pg.id_grupo AND g.id_edicao = NEW.id_edicao
    WHERE pg.id_selecao = NEW.id_selecao_b LIMIT 1;

    WITH stats AS (
        SELECT p.id_selecao_a AS sel, p.gols_a AS gf, p.gols_b AS ga,
               CASE WHEN p.gols_a > p.gols_b THEN 3
                    WHEN p.gols_a = p.gols_b THEN 1 ELSE 0 END AS pts,
               CASE WHEN p.gols_a > p.gols_b THEN 1 ELSE 0 END AS v,
               CASE WHEN p.gols_a = p.gols_b THEN 1 ELSE 0 END AS e,
               CASE WHEN p.gols_a < p.gols_b THEN 1 ELSE 0 END AS d
        FROM Partidas p
        JOIN Fases   f ON f.id = p.id_fase AND NOT f.eliminatoria
        WHERE p.id_edicao = NEW.id_edicao
          AND p.status = 'encerrada'
          AND p.id_selecao_a IN (NEW.id_selecao_a, NEW.id_selecao_b)
        UNION ALL
        SELECT p.id_selecao_b, p.gols_b, p.gols_a,
               CASE WHEN p.gols_b > p.gols_a THEN 3
                    WHEN p.gols_b = p.gols_a THEN 1 ELSE 0 END,
               CASE WHEN p.gols_b > p.gols_a THEN 1 ELSE 0 END,
               CASE WHEN p.gols_b = p.gols_a THEN 1 ELSE 0 END,
               CASE WHEN p.gols_b < p.gols_a THEN 1 ELSE 0 END
        FROM Partidas p
        JOIN Fases   f ON f.id = p.id_fase AND NOT f.eliminatoria
        WHERE p.id_edicao = NEW.id_edicao
          AND p.status = 'encerrada'
          AND p.id_selecao_b IN (NEW.id_selecao_a, NEW.id_selecao_b)
    ),
    agg AS (
        SELECT sel,
               SUM(pts) AS pontos, COUNT(*) AS jogos,
               SUM(v) AS vitorias, SUM(e) AS empates, SUM(d) AS derrotas,
               SUM(gf) AS gols_pro, SUM(ga) AS gols_contra
        FROM stats GROUP BY sel
    )
    UPDATE ParticipacaoGrupo pg
       SET pontos = agg.pontos, jogos = agg.jogos,
           vitorias = agg.vitorias, empates = agg.empates, derrotas = agg.derrotas,
           gols_pro = agg.gols_pro, gols_contra = agg.gols_contra
      FROM agg
     WHERE pg.id_selecao = agg.sel
       AND pg.id_grupo IN (v_id_grupo_a, v_id_grupo_b);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualiza_classificacao
AFTER INSERT OR UPDATE OF gols_a, gols_b ON Partidas
FOR EACH ROW EXECUTE FUNCTION fn_atualiza_classificacao();

-- -----------------------------------------------------------------------------
-- T5: Em partida eliminatória, o vencedor é validado contra o placar
--     (regra de negócio: se vencedor != null em fase eliminatória,
--      deve corresponder a quem marcou mais gols somando prorrog./pênaltis)
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_valida_vencedor_eliminatoria()
RETURNS TRIGGER AS $$
DECLARE
    v_elim    BOOLEAN;
    v_total_a INT;
    v_total_b INT;
BEGIN
    SELECT eliminatoria INTO v_elim FROM Fases WHERE id = NEW.id_fase;
    IF NOT v_elim OR NEW.id_selecao_vencedora IS NULL THEN
        RETURN NEW;
    END IF;

    v_total_a := NEW.gols_a + COALESCE(NEW.gols_a_prorrog,0)
                            + COALESCE(NEW.gols_a_penaltis,0);
    v_total_b := NEW.gols_b + COALESCE(NEW.gols_b_prorrog,0)
                            + COALESCE(NEW.gols_b_penaltis,0);

    IF v_total_a = v_total_b THEN
        RAISE EXCEPTION
          'Partida eliminatória não pode terminar empatada após prorrogação/pênaltis.';
    END IF;

    IF (v_total_a > v_total_b AND NEW.id_selecao_vencedora <> NEW.id_selecao_a)
       OR (v_total_b > v_total_a AND NEW.id_selecao_vencedora <> NEW.id_selecao_b) THEN
        RAISE EXCEPTION
          'Seleção classificada (%) não confere com o placar da partida.',
          NEW.id_selecao_vencedora;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_valida_vencedor_eliminatoria
BEFORE INSERT OR UPDATE ON Partidas
FOR EACH ROW EXECUTE FUNCTION fn_valida_vencedor_eliminatoria();


-- =============================================================================
-- 4. ÍNDICES auxiliares para as 10 consultas
-- =============================================================================
CREATE INDEX idx_partidas_edicao        ON Partidas(id_edicao);
CREATE INDEX idx_partidas_fase          ON Partidas(id_fase);
CREATE INDEX idx_eventos_partida        ON EventosJogo(id_partida);
CREATE INDEX idx_eventos_jogador        ON EventosJogo(id_jogador);
CREATE INDEX idx_conv_selecao_edicao    ON Convocacoes(id_selecao, id_edicao);
CREATE INDEX idx_jogadores_selecao      ON Jogadores(id_selecao);
CREATE INDEX idx_partgrupo_selecao      ON ParticipacaoGrupo(id_selecao);

-- =============================================================================
-- FIM 05.DDL.sql
-- =============================================================================
