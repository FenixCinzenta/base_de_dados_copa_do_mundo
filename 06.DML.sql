--
-- PostgreSQL database dump
--

\restrict RKpMzOAv2YxPC0vP0asX7WQQi6PPCWUC6dfc3nWt6ZngHbFPwx9nMHQ4Cjv0WzL

-- Dumped from database version 14.23 (Ubuntu 14.23-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.23 (Ubuntu 14.23-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: confederacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.confederacoes DISABLE TRIGGER ALL;

COPY public.confederacoes (id, nome) FROM stdin;
1	UEFA
2	CONMEBOL
3	CONCACAF
4	CAF
5	AFC
6	OFC
\.


ALTER TABLE public.confederacoes ENABLE TRIGGER ALL;

--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.paises DISABLE TRIGGER ALL;

COPY public.paises (id, nome, id_confederacao) FROM stdin;
1	Alemanha	1
2	Áustria	1
3	Bélgica	1
4	Bósnia e Herzegovina	1
5	Croácia	1
6	Dinamarca	1
7	Escócia	1
8	Espanha	1
9	França	1
10	Holanda	1
11	Hungria	1
12	Inglaterra	1
13	Noruega	1
14	Nova Zelândia	6
15	Polônia	1
16	Portugal	1
17	República Tcheca	1
18	Romênia	1
19	Suécia	1
20	Suíça	1
21	Turquia	1
22	Ucrânia	1
23	Argentina	2
24	Brasil	2
25	Chile	2
26	Colômbia	2
27	Equador	2
28	Paraguai	2
29	Uruguai	2
30	Venezuela	2
31	Canadá	3
32	Costa Rica	3
33	Curaçao	3
34	Estados Unidos	3
35	Haiti	3
36	Jamaica	3
37	México	3
38	Panamá	3
39	África do Sul	4
40	Argélia	4
41	Camarões	4
42	Costa do Marfim	4
43	Egito	4
44	Gana	4
45	Marrocos	4
46	República Democrática do Congo	4
47	Senegal	4
48	Tunísia	4
49	Arábia Saudita	5
50	Austrália	5
51	Catar	5
52	Coreia do Sul	5
53	Irã	5
54	Iraque	5
55	Japão	5
56	Jordânia	5
57	Uzbequistão	5
58	Cabo Verde	4
59	Congo DR	4
60	China	5
61	El Salvador	3
62	Emirados Árabes Unidos	5
63	Eslovênia	1
64	Gabão	4
65	Honduras	3
66	Itália	1
67	Mauritânia	4
68	Peru	2
69	Somália	4
70	País de Gales	1
71	Sérvia	1
72	Rússia	1
73	Nigéria	4
74	Islândia	1
\.


ALTER TABLE public.paises ENABLE TRIGGER ALL;

--
-- Data for Name: arbitros; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.arbitros DISABLE TRIGGER ALL;

COPY public.arbitros (id, nome, id_pais) FROM stdin;
1	Abdulrahman Al Jassim	51
2	Khalid Al Turais	49
3	Yusuke Araki	55
4	Omar Abdulkadir Artan	69
5	Pierre Atcho	64
6	Iván Barton	61
7	Dahane Beida	67
8	Juan Gabriel Benítez	28
9	Juan Calderón	32
10	Raphael Claus	24
11	Ismail Elfath	34
12	Espen Eskås	13
13	Alireza Faghani	50
14	Yael Falcón Pérez	23
15	Drew Fischer	31
16	Cristian Garay	25
17	Katia García	37
18	Mustapha Ghorbal	40
19	Alejandro Hernández Hernández	8
20	Darío Herrera	23
21	Jalal Jayed	45
22	Campbell-Kirk Kawana-Waugh	14
23	István Kovács	18
24	François Letexier	9
25	Ning Ma	60
26	Adham Makhadmeh	56
27	Danny Makkelie	10
28	Szymon Marciniak	15
29	Maurizio Mariani	66
30	Héctor Said Martínez	65
31	Amin Mohamed	43
32	Oshane Nation	36
33	Glenn Nyberg	19
34	Michael Oliver	12
35	Omar Al Ali	62
36	Kevin Ortega	68
37	Tori Penso	34
38	João Pinheiro	16
39	Ramon Abatti Abel	24
40	César Ramos	37
41	Andrés Rojas	26
42	Sandro Schärer	20
43	Ilgiz Tantashev	57
44	Anthony Taylor	12
45	Gustavo Tejera	29
46	Facundo Tello	23
47	Abongile Tom	39
48	Clément Turpin	9
49	Jesús Valenzuela	30
50	Slavko Vinčić	63
51	Wilton Pereira Sampaio	24
52	Felix Zwayer	1
53	Sandro Meira Ricci	\N
54	Iván Arcides Barton Cisneros	\N
55	Fernando Rapallini	\N
56	César Arturo Ramos Palazuelos	\N
57	Antonio Miguel Mateu Lahoz	\N
58	Daniele Orsato	\N
59	Abdulrahman Al-Jassim	\N
\.


ALTER TABLE public.arbitros ENABLE TRIGGER ALL;

--
-- Data for Name: cidadessede; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.cidadessede DISABLE TRIGGER ALL;

COPY public.cidadessede (id, nome, id_pais) FROM stdin;
1	Toronto	31
2	Vancouver	31
3	Philadelphia	34
4	Boston	34
5	Kansas City	34
6	Houston	34
7	Seattle	34
8	Atlanta	34
9	Miami	34
10	San Francisco	34
11	Dallas	34
12	Los Angeles	34
13	Nova York/Nova Jersey	34
14	Monterrey	37
15	Cidade do México	37
16	Guadalajara	37
17	Cidades-sede 2018 (Rússia)	72
18	Cidades-sede 2022 (Catar)	51
\.


ALTER TABLE public.cidadessede ENABLE TRIGGER ALL;

--
-- Data for Name: selecoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.selecoes DISABLE TRIGGER ALL;

COPY public.selecoes (id, nome, grupo_copa, url_bandeira, id_confederacao, id_pais) FROM stdin;
1	FIFA World Cup 2026	\N	\N	\N	\N
2	Fifa World Cup History	FWCH	\N	\N	\N
51	Países Baixos	F	/flags/nl.png	\N	10
52	País de Gales		\N	1	70
53	Polônia		\N	1	15
54	Dinamarca		\N	1	6
55	Costa Rica		\N	3	32
56	Sérvia		\N	1	71
57	Camarões		\N	4	41
58	Rússia		\N	1	72
59	Nigéria		\N	4	73
60	Islândia		\N	1	74
61	Peru		\N	2	68
14	Escócia	C	/flags/gb-sct.png	1	7
13	Haiti	C	/flags/ht.png	3	35
3	México	A	/flags/mx.png	3	37
7	Canadá	B	/flags/ca.png	3	31
10	Suíça	B	/flags/ch.png	1	20
8	Bósnia e Herzegovina	B	/flags/ba.png	1	4
11	Brasil	C	/flags/br.png	2	24
6	República Tcheca	A	/flags/cz.png	1	17
20	Curaçao	E	/flags/cw.png	3	33
19	Alemanha	E	/flags/de.png	1	1
22	Equador	E	/flags/ec.png	2	27
25	Suécia	F	/flags/se.png	1	19
23	Holanda	F	/flags/nl.png	1	10
15	Estados Unidos	D	/flags/us.png	3	34
18	Turquia	D	/flags/tr.png	1	21
16	Paraguai	D	/flags/py.png	2	28
35	França	I	/flags/fr.png	1	9
38	Noruega	I	/flags/no.png	1	13
9	Catar	B	/flags/qa.png	5	51
12	Marrocos	C	/flags/ma.png	4	45
4	África do Sul	A	/flags/za.png	4	39
5	Coreia do Sul	A	/flags/kr.png	5	52
21	Costa do Marfim	E	/flags/ci.png	4	42
24	Japão	F	/flags/jp.png	5	55
26	Tunísia	F	/flags/tn.png	4	48
17	Austrália	D	/flags/au.png	5	50
36	Senegal	I	/flags/sn.png	4	47
37	Iraque	I	/flags/iq.png	5	54
32	Cabo Verde	H	/flags/cv.png	\N	58
33	Arábia Saudita	H	/flags/sa.png	5	49
31	Espanha	H	/flags/es.png	1	8
34	Uruguai	H	/flags/uy.png	2	29
28	Egito	G	/flags/eg.png	4	43
29	Irã	G	/flags/ir.png	5	53
27	Bélgica	G	/flags/be.png	1	3
30	Nova Zelândia	G	/flags/nz.png	6	14
47	Inglaterra	L	/flags/gb-eng.png	1	12
50	Panamá	L	/flags/pa.png	3	38
48	Croácia	L	/flags/hr.png	1	5
49	Gana	L	/flags/gh.png	4	44
43	Portugal	K	/flags/pt.png	1	16
46	Colômbia	K	/flags/co.png	2	26
44	Congo DR	K	/flags/cd.png	\N	59
45	Uzbequistão	K	/flags/uz.png	5	57
40	Argélia	J	/flags/dz.png	4	40
41	Áustria	J	/flags/at.png	1	2
39	Argentina	J	/flags/ar.png	2	23
42	Jordânia	J	/flags/jo.png	5	56
\.


ALTER TABLE public.selecoes ENABLE TRIGGER ALL;

--
-- Data for Name: edicoescopa; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.edicoescopa DISABLE TRIGGER ALL;

COPY public.edicoescopa (id, ano, nome, data_inicio, data_fim, id_selecao_campea, id_selecao_vice, id_selecao_terceiro) FROM stdin;
1	2026	Copa do Mundo FIFA 2026 (EUA · Canadá · México)	2026-06-11	2026-07-19	\N	\N	\N
2	2018	Copa do Mundo FIFA 2018	2018-06-14	2018-07-15	35	48	27
3	2022	Copa do Mundo FIFA 2022	2022-11-20	2022-12-18	39	35	48
\.


ALTER TABLE public.edicoescopa ENABLE TRIGGER ALL;

--
-- Data for Name: estadios; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.estadios DISABLE TRIGGER ALL;

COPY public.estadios (id, nome, capacidade, id_cidade) FROM stdin;
1	BMO Field	45736	1
2	BC Place	54500	2
3	Lincoln Financial Field	69596	3
4	Gillette Stadium	65878	4
5	Arrowhead Stadium	76416	5
6	NRG Stadium	72220	6
7	Lumen Field	69000	7
8	Mercedes-Benz Stadium	71000	8
9	Hard Rock Stadium	64767	9
10	Levi's Stadium	68500	10
11	AT&T Stadium	80000	11
12	SoFi Stadium	70240	12
13	MetLife Stadium	82500	13
14	Estadio BBVA	53500	14
15	Estadio Azteca	87523	15
16	Estadio Akron	49850	16
17	Estádio Lujniki	81000	17
18	Estádio São Petersburgo	67000	17
19	Estádio Spartak	45000	17
20	Estádio Fisht	47000	17
21	Estádio Volgogrado	45000	17
22	Arena Kazan	45000	17
23	Estádio Niznhi Novgorod	45000	17
24	Arena Samara	45000	17
25	Arena Rostov	45000	17
26	Arena Mordóvia	44000	17
27	Arena Ecaterimburgo	35000	17
28	Estádio Kaliningrado	35000	17
29	Estádio Lusail	80000	18
30	Estádio Al Bayt	60000	18
31	Estádio Khalifa Internacional	45000	18
32	Estádio 974	40000	18
33	Estádio Al Janoub	40000	18
34	Estádio Al Thumama	40000	18
35	Estádio Education City	40000	18
36	Estádio Ahmad bin Ali	40000	18
\.


ALTER TABLE public.estadios ENABLE TRIGGER ALL;

--
-- Data for Name: fases; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.fases DISABLE TRIGGER ALL;

COPY public.fases (id, nome, id_edicao, ordem, eliminatoria) FROM stdin;
1	Fase de Grupos	1	1	f
2	Oitavas de Final	1	3	t
3	Quartas de Final	1	4	t
4	Semifinais	1	5	t
5	Disputa do 3º Lugar	1	6	t
6	Final	1	7	t
7	Fase de 32	1	2	t
8	Fase de Grupos	2	1	f
9	Oitavas de Final	2	2	t
10	Quartas de Final	2	3	t
11	Semifinal	2	4	t
12	Disputa de 3º Lugar	2	5	t
13	Final	2	6	t
14	Fase de Grupos	3	1	f
15	Oitavas de Final	3	2	t
16	Quartas de Final	3	3	t
17	Semifinal	3	4	t
18	Disputa de 3º Lugar	3	5	t
19	Final	3	6	t
\.


ALTER TABLE public.fases ENABLE TRIGGER ALL;

--
-- Data for Name: partidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.partidas DISABLE TRIGGER ALL;

COPY public.partidas (id, id_edicao, id_fase, id_estadio, id_selecao_a, id_selecao_b, data_hora, gols_a, gols_b, gols_a_prorrog, gols_b_prorrog, gols_a_penaltis, gols_b_penaltis, id_selecao_vencedora, status) FROM stdin;
1	1	1	15	3	4	2026-06-11 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
2	1	1	16	5	6	2026-06-12 02:00:00	0	0	\N	\N	\N	\N	\N	agendada
3	1	1	1	7	8	2026-06-12 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
4	1	1	12	15	16	2026-06-13 01:00:00	0	0	\N	\N	\N	\N	\N	agendada
5	1	1	10	9	10	2026-06-13 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
6	1	1	13	11	12	2026-06-13 22:00:00	0	0	\N	\N	\N	\N	\N	agendada
7	1	1	4	13	14	2026-06-14 01:00:00	0	0	\N	\N	\N	\N	\N	agendada
8	1	1	2	17	18	2026-06-14 04:00:00	0	0	\N	\N	\N	\N	\N	agendada
9	1	1	6	19	20	2026-06-14 17:00:00	0	0	\N	\N	\N	\N	\N	agendada
10	1	1	11	23	24	2026-06-14 20:00:00	0	0	\N	\N	\N	\N	\N	agendada
11	1	1	3	21	22	2026-06-14 23:00:00	0	0	\N	\N	\N	\N	\N	agendada
12	1	1	14	25	26	2026-06-15 02:00:00	0	0	\N	\N	\N	\N	\N	agendada
13	1	1	8	31	32	2026-06-15 16:00:00	0	0	\N	\N	\N	\N	\N	agendada
14	1	1	7	27	28	2026-06-15 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
15	1	1	9	33	34	2026-06-15 22:00:00	0	0	\N	\N	\N	\N	\N	agendada
16	1	1	12	29	30	2026-06-16 01:00:00	0	0	\N	\N	\N	\N	\N	agendada
17	1	1	13	35	36	2026-06-16 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
18	1	1	4	37	38	2026-06-16 22:00:00	0	0	\N	\N	\N	\N	\N	agendada
19	1	1	5	39	40	2026-06-17 01:00:00	0	0	\N	\N	\N	\N	\N	agendada
20	1	1	10	41	42	2026-06-17 04:00:00	0	0	\N	\N	\N	\N	\N	agendada
21	1	1	6	43	44	2026-06-17 17:00:00	0	0	\N	\N	\N	\N	\N	agendada
22	1	1	11	47	48	2026-06-17 20:00:00	0	0	\N	\N	\N	\N	\N	agendada
23	1	1	1	49	50	2026-06-17 23:00:00	0	0	\N	\N	\N	\N	\N	agendada
24	1	1	15	45	46	2026-06-18 02:00:00	0	0	\N	\N	\N	\N	\N	agendada
25	1	1	8	6	4	2026-06-18 16:00:00	0	0	\N	\N	\N	\N	\N	agendada
26	1	1	12	10	8	2026-06-18 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
27	1	1	2	7	9	2026-06-18 22:00:00	0	0	\N	\N	\N	\N	\N	agendada
28	1	1	16	3	5	2026-06-19 01:00:00	0	0	\N	\N	\N	\N	\N	agendada
29	1	1	7	15	17	2026-06-19 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
30	1	1	4	14	12	2026-06-19 22:00:00	0	0	\N	\N	\N	\N	\N	agendada
31	1	1	3	11	13	2026-06-20 01:00:00	0	0	\N	\N	\N	\N	\N	agendada
32	1	1	10	18	16	2026-06-20 04:00:00	0	0	\N	\N	\N	\N	\N	agendada
33	1	1	6	23	25	2026-06-20 17:00:00	0	0	\N	\N	\N	\N	\N	agendada
34	1	1	1	19	21	2026-06-20 20:00:00	0	0	\N	\N	\N	\N	\N	agendada
35	1	1	5	22	20	2026-06-21 00:00:00	0	0	\N	\N	\N	\N	\N	agendada
36	1	1	14	26	24	2026-06-21 04:00:00	0	0	\N	\N	\N	\N	\N	agendada
37	1	1	8	31	33	2026-06-21 16:00:00	0	0	\N	\N	\N	\N	\N	agendada
38	1	1	12	27	29	2026-06-21 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
39	1	1	9	34	32	2026-06-21 22:00:00	0	0	\N	\N	\N	\N	\N	agendada
40	1	1	2	30	28	2026-06-22 01:00:00	0	0	\N	\N	\N	\N	\N	agendada
41	1	1	11	39	41	2026-06-22 17:00:00	0	0	\N	\N	\N	\N	\N	agendada
42	1	1	3	35	37	2026-06-22 21:00:00	0	0	\N	\N	\N	\N	\N	agendada
43	1	1	13	38	36	2026-06-23 00:00:00	0	0	\N	\N	\N	\N	\N	agendada
44	1	1	10	42	40	2026-06-23 03:00:00	0	0	\N	\N	\N	\N	\N	agendada
45	1	1	6	43	45	2026-06-23 17:00:00	0	0	\N	\N	\N	\N	\N	agendada
46	1	1	4	47	49	2026-06-23 20:00:00	0	0	\N	\N	\N	\N	\N	agendada
47	1	1	1	50	48	2026-06-23 23:00:00	0	0	\N	\N	\N	\N	\N	agendada
48	1	1	16	46	44	2026-06-24 02:00:00	0	0	\N	\N	\N	\N	\N	agendada
49	1	1	2	10	7	2026-06-24 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
50	1	1	7	8	9	2026-06-24 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
51	1	1	9	14	11	2026-06-24 22:00:00	0	0	\N	\N	\N	\N	\N	agendada
52	1	1	8	12	13	2026-06-24 22:00:00	0	0	\N	\N	\N	\N	\N	agendada
53	1	1	15	6	3	2026-06-25 01:00:00	0	0	\N	\N	\N	\N	\N	agendada
54	1	1	14	4	5	2026-06-25 01:00:00	0	0	\N	\N	\N	\N	\N	agendada
55	1	1	3	20	21	2026-06-25 20:00:00	0	0	\N	\N	\N	\N	\N	agendada
56	1	1	13	22	19	2026-06-25 20:00:00	0	0	\N	\N	\N	\N	\N	agendada
57	1	1	11	24	25	2026-06-25 23:00:00	0	0	\N	\N	\N	\N	\N	agendada
58	1	1	5	26	23	2026-06-25 23:00:00	0	0	\N	\N	\N	\N	\N	agendada
59	1	1	12	18	15	2026-06-26 02:00:00	0	0	\N	\N	\N	\N	\N	agendada
60	1	1	10	16	17	2026-06-26 02:00:00	0	0	\N	\N	\N	\N	\N	agendada
61	1	1	4	38	35	2026-06-26 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
62	1	1	1	36	37	2026-06-26 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
63	1	1	6	32	33	2026-06-27 00:00:00	0	0	\N	\N	\N	\N	\N	agendada
64	1	1	16	34	31	2026-06-27 00:00:00	0	0	\N	\N	\N	\N	\N	agendada
65	1	1	7	28	29	2026-06-27 03:00:00	0	0	\N	\N	\N	\N	\N	agendada
66	1	1	2	30	27	2026-06-27 03:00:00	0	0	\N	\N	\N	\N	\N	agendada
67	1	1	13	50	47	2026-06-27 21:00:00	0	0	\N	\N	\N	\N	\N	agendada
68	1	1	3	48	49	2026-06-27 21:00:00	0	0	\N	\N	\N	\N	\N	agendada
69	1	1	9	46	43	2026-06-27 23:30:00	0	0	\N	\N	\N	\N	\N	agendada
70	1	1	8	44	45	2026-06-27 23:30:00	0	0	\N	\N	\N	\N	\N	agendada
71	1	1	5	40	41	2026-06-28 02:00:00	0	0	\N	\N	\N	\N	\N	agendada
72	1	1	11	42	39	2026-06-28 02:00:00	0	0	\N	\N	\N	\N	\N	agendada
73	2	8	17	58	33	2018-06-14 15:00:00	5	0	\N	\N	\N	\N	\N	agendada
74	2	8	17	28	34	2018-06-15 12:00:00	0	1	\N	\N	\N	\N	\N	agendada
75	2	8	17	12	29	2018-06-15 15:00:00	0	1	\N	\N	\N	\N	\N	agendada
76	2	8	20	43	31	2018-06-15 18:00:00	3	3	\N	\N	\N	\N	\N	agendada
77	2	8	17	35	17	2018-06-16 10:00:00	2	1	\N	\N	\N	\N	\N	agendada
78	2	8	17	39	60	2018-06-16 13:00:00	1	1	\N	\N	\N	\N	\N	agendada
79	2	8	26	61	54	2018-06-16 16:00:00	0	1	\N	\N	\N	\N	\N	agendada
80	2	8	17	48	59	2018-06-16 19:00:00	2	0	\N	\N	\N	\N	\N	agendada
81	2	8	17	55	56	2018-06-17 12:00:00	0	1	\N	\N	\N	\N	\N	agendada
82	2	8	17	19	3	2018-06-17 15:00:00	0	1	\N	\N	\N	\N	\N	agendada
83	2	8	25	11	10	2018-06-17 18:00:00	1	1	\N	\N	\N	\N	\N	agendada
84	2	8	17	25	5	2018-06-18 12:00:00	1	0	\N	\N	\N	\N	\N	agendada
85	2	8	20	27	50	2018-06-18 15:00:00	3	0	\N	\N	\N	\N	\N	agendada
86	2	8	21	26	47	2018-06-18 18:00:00	1	2	\N	\N	\N	\N	\N	agendada
87	2	8	26	46	24	2018-06-19 12:00:00	1	2	\N	\N	\N	\N	\N	agendada
88	2	8	17	53	36	2018-06-19 15:00:00	1	2	\N	\N	\N	\N	\N	agendada
89	2	8	17	58	28	2018-06-19 18:00:00	3	1	\N	\N	\N	\N	\N	agendada
90	2	8	17	43	12	2018-06-20 12:00:00	1	0	\N	\N	\N	\N	\N	agendada
91	2	8	25	34	33	2018-06-20 15:00:00	1	0	\N	\N	\N	\N	\N	agendada
92	2	8	17	29	31	2018-06-20 18:00:00	0	1	\N	\N	\N	\N	\N	agendada
93	2	8	17	54	17	2018-06-21 12:00:00	1	1	\N	\N	\N	\N	\N	agendada
94	2	8	17	35	61	2018-06-21 15:00:00	1	0	\N	\N	\N	\N	\N	agendada
95	2	8	17	39	48	2018-06-21 18:00:00	0	3	\N	\N	\N	\N	\N	agendada
96	2	8	17	11	55	2018-06-22 12:00:00	2	0	\N	\N	\N	\N	\N	agendada
97	2	8	21	59	60	2018-06-22 15:00:00	2	0	\N	\N	\N	\N	\N	agendada
98	2	8	17	56	10	2018-06-22 18:00:00	1	2	\N	\N	\N	\N	\N	agendada
99	2	8	17	27	26	2018-06-23 12:00:00	5	2	\N	\N	\N	\N	\N	agendada
100	2	8	25	5	3	2018-06-23 15:00:00	1	2	\N	\N	\N	\N	\N	agendada
101	2	8	20	19	25	2018-06-23 18:00:00	2	1	\N	\N	\N	\N	\N	agendada
102	2	8	17	47	50	2018-06-24 12:00:00	6	1	\N	\N	\N	\N	\N	agendada
103	2	8	17	24	36	2018-06-24 15:00:00	2	2	\N	\N	\N	\N	\N	agendada
104	2	8	17	53	46	2018-06-24 18:00:00	0	3	\N	\N	\N	\N	\N	agendada
105	2	8	21	33	28	2018-06-25 14:00:00	2	1	\N	\N	\N	\N	\N	agendada
106	2	8	17	34	58	2018-06-25 14:00:00	3	0	\N	\N	\N	\N	\N	agendada
107	2	8	26	29	43	2018-06-25 18:00:00	1	1	\N	\N	\N	\N	\N	agendada
108	2	8	17	31	12	2018-06-25 18:00:00	2	2	\N	\N	\N	\N	\N	agendada
109	2	8	20	17	61	2018-06-26 14:00:00	0	2	\N	\N	\N	\N	\N	agendada
110	2	8	17	54	35	2018-06-26 14:00:00	0	0	\N	\N	\N	\N	\N	agendada
111	2	8	25	60	48	2018-06-26 18:00:00	1	2	\N	\N	\N	\N	\N	agendada
112	2	8	17	59	39	2018-06-26 18:00:00	1	2	\N	\N	\N	\N	\N	agendada
113	2	8	17	3	25	2018-06-27 14:00:00	0	3	\N	\N	\N	\N	\N	agendada
114	2	8	17	5	19	2018-06-27 14:00:00	2	0	\N	\N	\N	\N	\N	agendada
115	2	8	17	56	11	2018-06-27 18:00:00	0	2	\N	\N	\N	\N	\N	agendada
116	2	8	17	10	55	2018-06-27 18:00:00	2	2	\N	\N	\N	\N	\N	agendada
117	2	8	21	24	53	2018-06-28 14:00:00	0	1	\N	\N	\N	\N	\N	agendada
118	2	8	17	36	46	2018-06-28 14:00:00	0	1	\N	\N	\N	\N	\N	agendada
119	2	8	17	47	27	2018-06-28 18:00:00	0	1	\N	\N	\N	\N	\N	agendada
120	2	8	26	50	26	2018-06-28 18:00:00	1	2	\N	\N	\N	\N	\N	agendada
121	2	9	17	35	39	2018-06-30 14:00:00	4	3	\N	\N	\N	\N	35	agendada
122	2	9	20	34	43	2018-06-30 18:00:00	2	1	\N	\N	\N	\N	34	agendada
123	2	9	17	31	58	2018-07-01 14:00:00	1	1	\N	\N	3	4	58	agendada
124	2	9	17	48	54	2018-07-01 18:00:00	1	1	\N	\N	3	2	48	agendada
125	2	9	17	11	3	2018-07-02 14:00:00	2	0	\N	\N	\N	\N	11	agendada
126	2	9	25	27	24	2018-07-02 18:00:00	3	2	\N	\N	\N	\N	27	agendada
127	2	9	17	25	10	2018-07-03 14:00:00	1	0	\N	\N	\N	\N	25	agendada
128	2	9	17	46	47	2018-07-03 18:00:00	1	1	\N	\N	3	4	47	agendada
129	2	10	17	34	35	2018-07-06 14:00:00	0	2	\N	\N	\N	\N	35	agendada
130	2	10	17	11	27	2018-07-06 18:00:00	1	2	\N	\N	\N	\N	27	agendada
131	2	10	17	25	47	2018-07-07 14:00:00	0	2	\N	\N	\N	\N	47	agendada
132	2	10	20	58	48	2018-07-07 18:00:00	2	2	\N	\N	3	4	48	agendada
133	2	11	17	35	27	2018-07-10 18:00:00	1	0	\N	\N	\N	\N	35	agendada
134	2	11	17	48	47	2018-07-11 18:00:00	2	1	\N	\N	\N	\N	48	agendada
135	2	12	17	27	47	2018-07-14 14:00:00	2	0	\N	\N	\N	\N	27	agendada
136	2	13	17	35	48	2018-07-15 15:00:00	4	2	\N	\N	\N	\N	35	agendada
137	3	14	30	9	22	2022-11-20 16:00:00	0	2	\N	\N	\N	\N	\N	agendada
138	3	14	31	47	29	2022-11-21 13:00:00	6	2	\N	\N	\N	\N	\N	agendada
139	3	14	34	36	23	2022-11-21 16:00:00	0	2	\N	\N	\N	\N	\N	agendada
140	3	14	36	15	52	2022-11-21 19:00:00	1	1	\N	\N	\N	\N	\N	agendada
141	3	14	29	39	33	2022-11-22 10:00:00	1	2	\N	\N	\N	\N	\N	agendada
142	3	14	35	54	26	2022-11-22 13:00:00	0	0	\N	\N	\N	\N	\N	agendada
143	3	14	32	3	53	2022-11-22 16:00:00	0	0	\N	\N	\N	\N	\N	agendada
144	3	14	33	35	17	2022-11-22 19:00:00	4	1	\N	\N	\N	\N	\N	agendada
145	3	14	30	12	48	2022-11-23 10:00:00	0	0	\N	\N	\N	\N	\N	agendada
146	3	14	31	19	24	2022-11-23 13:00:00	1	2	\N	\N	\N	\N	\N	agendada
147	3	14	34	31	55	2022-11-23 16:00:00	7	0	\N	\N	\N	\N	\N	agendada
148	3	14	36	27	7	2022-11-23 19:00:00	1	0	\N	\N	\N	\N	\N	agendada
149	3	14	33	10	57	2022-11-24 10:00:00	1	0	\N	\N	\N	\N	\N	agendada
150	3	14	35	34	5	2022-11-24 13:00:00	0	0	\N	\N	\N	\N	\N	agendada
151	3	14	32	43	49	2022-11-24 16:00:00	3	2	\N	\N	\N	\N	\N	agendada
152	3	14	29	11	56	2022-11-24 19:00:00	2	0	\N	\N	\N	\N	\N	agendada
153	3	14	36	52	29	2022-11-25 10:00:00	0	2	\N	\N	\N	\N	\N	agendada
154	3	14	34	9	36	2022-11-25 13:00:00	1	3	\N	\N	\N	\N	\N	agendada
155	3	14	31	23	22	2022-11-25 16:00:00	1	1	\N	\N	\N	\N	\N	agendada
156	3	14	30	47	15	2022-11-25 19:00:00	0	0	\N	\N	\N	\N	\N	agendada
157	3	14	33	26	17	2022-11-26 10:00:00	0	1	\N	\N	\N	\N	\N	agendada
158	3	14	35	53	33	2022-11-26 13:00:00	2	0	\N	\N	\N	\N	\N	agendada
159	3	14	32	35	54	2022-11-26 16:00:00	2	1	\N	\N	\N	\N	\N	agendada
160	3	14	29	39	3	2022-11-26 19:00:00	2	0	\N	\N	\N	\N	\N	agendada
161	3	14	36	24	55	2022-11-27 10:00:00	0	1	\N	\N	\N	\N	\N	agendada
162	3	14	34	27	12	2022-11-27 13:00:00	0	2	\N	\N	\N	\N	\N	agendada
163	3	14	31	48	7	2022-11-27 16:00:00	4	1	\N	\N	\N	\N	\N	agendada
164	3	14	30	31	19	2022-11-27 19:00:00	1	1	\N	\N	\N	\N	\N	agendada
165	3	14	33	57	56	2022-11-28 10:00:00	3	3	\N	\N	\N	\N	\N	agendada
166	3	14	35	5	49	2022-11-28 13:00:00	2	3	\N	\N	\N	\N	\N	agendada
167	3	14	32	11	10	2022-11-28 16:00:00	1	0	\N	\N	\N	\N	\N	agendada
168	3	14	29	43	34	2022-11-28 19:00:00	2	0	\N	\N	\N	\N	\N	agendada
169	3	14	31	22	36	2022-11-29 15:00:00	1	2	\N	\N	\N	\N	\N	agendada
170	3	14	30	23	9	2022-11-29 15:00:00	2	0	\N	\N	\N	\N	\N	agendada
171	3	14	34	29	15	2022-11-29 19:00:00	0	1	\N	\N	\N	\N	\N	agendada
172	3	14	36	52	47	2022-11-29 19:00:00	0	3	\N	\N	\N	\N	\N	agendada
173	3	14	33	17	54	2022-11-30 15:00:00	1	0	\N	\N	\N	\N	\N	agendada
174	3	14	35	26	35	2022-11-30 15:00:00	1	0	\N	\N	\N	\N	\N	agendada
175	3	14	32	53	39	2022-11-30 19:00:00	0	2	\N	\N	\N	\N	\N	agendada
176	3	14	29	33	3	2022-11-30 19:00:00	1	2	\N	\N	\N	\N	\N	agendada
177	3	14	34	7	12	2022-12-01 15:00:00	1	2	\N	\N	\N	\N	\N	agendada
178	3	14	36	48	27	2022-12-01 15:00:00	0	0	\N	\N	\N	\N	\N	agendada
179	3	14	30	55	19	2022-12-01 19:00:00	2	4	\N	\N	\N	\N	\N	agendada
180	3	14	31	24	31	2022-12-01 19:00:00	2	1	\N	\N	\N	\N	\N	agendada
181	3	14	33	49	34	2022-12-02 15:00:00	0	2	\N	\N	\N	\N	\N	agendada
182	3	14	35	5	43	2022-12-02 15:00:00	2	1	\N	\N	\N	\N	\N	agendada
183	3	14	29	57	11	2022-12-02 19:00:00	1	0	\N	\N	\N	\N	\N	agendada
184	3	14	32	56	10	2022-12-02 19:00:00	2	3	\N	\N	\N	\N	\N	agendada
185	3	15	31	23	15	2022-12-03 15:00:00	3	1	\N	\N	\N	\N	23	agendada
186	3	15	36	39	17	2022-12-03 19:00:00	2	1	\N	\N	\N	\N	39	agendada
187	3	15	34	35	53	2022-12-04 15:00:00	3	1	\N	\N	\N	\N	35	agendada
188	3	15	30	47	36	2022-12-04 19:00:00	3	0	\N	\N	\N	\N	47	agendada
189	3	15	33	24	48	2022-12-05 15:00:00	1	1	\N	\N	1	3	48	agendada
190	3	15	32	11	5	2022-12-05 19:00:00	4	1	\N	\N	\N	\N	11	agendada
191	3	15	35	12	31	2022-12-06 15:00:00	0	0	\N	\N	3	0	12	agendada
192	3	15	29	43	10	2022-12-06 19:00:00	6	1	\N	\N	\N	\N	43	agendada
193	3	16	35	48	11	2022-12-09 15:00:00	1	1	\N	\N	4	2	48	agendada
194	3	16	29	23	39	2022-12-09 19:00:00	2	2	\N	\N	3	4	39	agendada
195	3	16	34	12	43	2022-12-10 15:00:00	1	0	\N	\N	\N	\N	12	agendada
196	3	16	30	47	35	2022-12-10 19:00:00	1	2	\N	\N	\N	\N	35	agendada
197	3	17	29	39	48	2022-12-13 19:00:00	3	0	\N	\N	\N	\N	39	agendada
198	3	17	30	35	12	2022-12-14 19:00:00	2	0	\N	\N	\N	\N	35	agendada
199	3	18	31	48	12	2022-12-17 15:00:00	2	1	\N	\N	\N	\N	48	agendada
200	3	19	29	39	35	2022-12-18 15:00:00	3	3	\N	\N	4	2	39	agendada
\.


ALTER TABLE public.partidas ENABLE TRIGGER ALL;

--
-- Data for Name: arbitragempartida; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.arbitragempartida DISABLE TRIGGER ALL;

COPY public.arbitragempartida (id_partida, id_arbitro, funcao) FROM stdin;
132	53	principal
185	51	principal
186	28	principal
187	49	principal
188	54	principal
189	11	principal
190	48	principal
191	55	principal
192	56	principal
193	34	principal
194	57	principal
195	46	principal
196	51	principal
197	58	principal
198	56	principal
199	59	principal
200	28	principal
\.


ALTER TABLE public.arbitragempartida ENABLE TRIGGER ALL;

--
-- Data for Name: jogadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.jogadores DISABLE TRIGGER ALL;

COPY public.jogadores (id, nome, posicao, id_selecao) FROM stdin;
1	Luis Malagón	GK	3
2	Johan Vásquez	DEF	3
3	Jorge Sánchez	DEF	3
4	César Montes	DEF	3
5	Jesús Gallardo	DEF	3
6	Israel Reyes	DEF	3
7	Diego Lainez	FWD	3
8	Carlos Rodríguez	MID	3
9	Edson Álvarez	MID	3
10	Orbelín Pineda	MID	3
11	Marcel Ruiz	MID	3
12	Erick Sánchez	MID	3
13	Hirving Lozano	FWD	3
14	Santiago Giménez	FWD	3
15	Raúl Jiménez	FWD	3
16	Alexis Vega	FWD	3
17	Roberto Alvarado	FWD	3
18	César Huerta	FWD	3
19	Ronwen Williams	GK	4
20	Sipho Chaine	GK	4
21	Aubrey Modiba	DEF	4
22	Samukele Kabini	DEF	4
23	Mbekezeli Mbokazi	DEF	4
24	Khulumani Ndamane	DEF	4
25	Siyabonga Ngezana	DEF	4
26	Khuliso Mudau	DEF	4
27	Nkosinathi Sibisi	DEF	4
28	Tebogo Mokoena	MID	4
29	Thalente Mbatha	MID	4
30	Bathusi Aubaas	MID	4
31	Vava Sithole	MID	4
32	Sipho Mbule	MID	4
33	Lyle Foster	FWD	4
34	Iqram Rayners	FWD	4
35	Mohau Nkota	FWD	4
36	Oswin Appollis	FWD	4
37	Hyeonwoo Jo	GK	5
38	Seunggyu Kim	GK	5
39	Minjae Kim	DEF	5
40	Yumin Cho	DEF	5
41	Youngwoo Seol	DEF	5
42	Hanbeom Lee	DEF	5
43	Taeseok Lee	DEF	5
44	Myungjae Lee	DEF	5
45	Jaesung Lee	MID	5
46	Inbeom Hwang	MID	5
47	Kangin Lee	MID	5
48	Seungho Paik	MID	5
49	Jens Castrop	MID	5
50	Donggyeong Lee	MID	5
51	Guesung Cho	FWD	5
52	Heungmin Son	FWD	5
53	Heechan Hwang	FWD	5
54	Hyeongyu Oh	FWD	5
55	Matěj Kovář	GK	6
56	Jindřich Staněk	GK	6
57	Ladislav Krejčí	DEF	6
58	Vladimír Coufal	DEF	6
59	Jaroslav Zelený	DEF	6
60	Tomáš Holeš	DEF	6
61	David Zima	DEF	6
62	Michal Sadílek	MID	6
63	Lukáš Provod	MID	6
64	Lukáš Červ	MID	6
65	Tomáš Souček	MID	6
66	Pavel Šulc	MID	6
67	Matěj Vydra	FWD	6
68	Vasil Kušej	FWD	6
69	Tomáš Chorý	FWD	6
70	Václav Černý	FWD	6
71	Adam Hložek	FWD	6
72	Patrik Schick	FWD	6
73	Dayne St. Clair	GK	7
74	Alphonso Davies	DEF	7
75	Alistair Johnston	DEF	7
76	Samuel Adekugbe	DEF	7
77	Richie Laryea	DEF	7
78	Derek Cornelius	DEF	7
79	Moïse Bombito	DEF	7
80	Kamal Miller	DEF	7
81	Stephen Eustaquio	MID	7
82	Ismaël Koné	MID	7
83	Jonathan Osorio	MID	7
84	Jacob Shaffelburg	FWD	7
85	Mathieu Choinière	MID	7
86	Niko Sigur	MID	7
87	Tajon Buchanan	FWD	7
88	Liam Millar	FWD	7
89	Cyle Larin	FWD	7
90	Jonathan David	FWD	7
91	Nikola Vasilj	GK	8
92	Amar Dedić	DEF	8
93	Sead Kolašinac	DEF	8
94	Tarik Muharemović	DEF	8
95	Nihad Mujakić	DEF	8
96	Nikola Katić	DEF	8
97	Amir Hadžiahmetović	MID	8
98	Benjamin Tahirović	MID	8
99	Armin Gigović	MID	8
100	Ivan Šunjić	MID	8
101	Ivan Bašić	MID	8
102	Dženis Burnić	MID	8
103	Esmir Bajraktarević	MID	8
104	Amar Memić	FWD	8
105	Ermedin Demirović	FWD	8
106	Edin Džeko	FWD	8
107	Samed Baždar	FWD	8
108	Haris Tabaković	FWD	8
109	Meshaal Barsham	GK	9
110	Sultan Al Brake	DEF	9
111	Lucas Mendes	DEF	9
112	Homam Ahmed	DEF	9
113	Boualem Khoukhi	DEF	9
114	Pedro Miguel	DEF	9
115	Tarek Salman	DEF	9
116	Mohammed Mannaï	MID	9
117	Karim Boudiaf	MID	9
118	Assim Madibo	MID	9
119	Hamed Fathi	MID	9
120	Mohammed Waad	MID	9
121	Abdulaziz Hatem	MID	9
122	Hassan Al-Haydos	FWD	9
123	Edmilson Junior	FWD	9
124	Akram Hassan Afif	FWD	9
125	Ahmed Al-Ganehi	FWD	9
126	Almoez Ali	FWD	9
127	Gregor Kobel	GK	10
128	Yvon Mvogo	GK	10
129	Manuel Akanji	DEF	10
130	Ricardo Rodríguez	DEF	10
131	Nico Elvedi	DEF	10
132	Aurèle Amenda	DEF	10
133	Silvan Widmer	DEF	10
134	Granit Xhaka	MID	10
135	Denis Zakaria	MID	10
136	Remo Freuler	MID	10
137	Fabian Rieder	MID	10
138	Ardon Jashari	MID	10
139	Johan Manzambi	MID	10
140	Michel Aebischer	MID	10
141	Breel Embolo	FWD	10
142	Ruben Vargas	FWD	10
143	Dan Ndoye	FWD	10
144	Zeki Amdouni	FWD	10
145	Alisson	GK	11
146	Bento	GK	11
147	Marquinhos	DEF	11
148	Éder Militão	DEF	11
149	Gabriel Magalhães	DEF	11
150	Danilo	DEF	11
151	Wesley	DEF	11
152	Lucas Paquetá	MID	11
153	Casemiro	MID	11
154	Bruno Guimarães	MID	11
155	Luiz Henrique	FWD	11
156	Vinícius Júnior	FWD	11
157	Rodrygo	FWD	11
158	João Pedro	FWD	11
159	Matheus Cunha	FWD	11
160	Gabriel Martinelli	FWD	11
161	Raphinha	FWD	11
162	Estevão	FWD	11
163	Yassine Bounou	GK	12
164	Munir El Kajoui	GK	12
165	Achraf Hakimi	DEF	12
166	Noussair Mazraoui	DEF	12
167	Nayef Aguerd	DEF	12
168	Romain Saïss	DEF	12
169	Jawad El Yamiq	DEF	12
170	Adam Masina	DEF	12
171	Sofyan Amrabat	MID	12
172	Azzedine Ounahi	MID	12
173	Eliesse Ben Seghir	MID	12
174	Bilal El Khannouss	MID	12
175	Ismael Saibari	MID	12
176	Youssef En-Nesyri	FWD	12
177	Abde Ezzalzouli	FWD	12
178	Soufiane Rahimi	FWD	12
179	Brahim Díaz	FWD	12
180	Ayoub El Kaabi	FWD	12
181	Johny Placide	GK	13
182	Carlens Arcus	DEF	13
183	Martin Expérience	DEF	13
184	Jean-Kévin Duverne	DEF	13
185	Ricardo Ade	DEF	13
186	Duke Lacroix	DEF	13
187	Garven Metusala	DEF	13
188	Hannes Delcroix	DEF	13
189	Leverton Pierre	MID	13
190	Danley Jean Jacques	MID	13
191	Jean-Ricner Bellegarde	MID	13
192	Christopher Attys	MID	13
193	Derrick Étienne Jr.	FWD	13
194	Josué Casimir	FWD	13
195	Ruben Providence	FWD	13
196	Duckens Nazon	FWD	13
197	Louicius Deedson	FWD	13
198	Frantzdy Pierrot	FWD	13
199	Angus Gunn	GK	14
200	Jack Hendry	DEF	14
201	Kieran Tierney	DEF	14
202	Aaron Hickey	DEF	14
203	Andrew Robertson	DEF	14
204	Scott McKenna	DEF	14
205	John Souttar	DEF	14
206	Anthony Ralston	DEF	14
207	Grant Hanley	DEF	14
208	Scott McTominay	MID	14
209	Billy Gilmour	MID	14
210	Lewis Ferguson	MID	14
211	Ryan Christie	MID	14
212	Kenny McLean	MID	14
213	John McGinn	MID	14
214	Lyndon Dykes	FWD	14
215	Che Adams	FWD	14
216	Ben Gannon-Doak	FWD	14
217	Matt Freese	GK	15
218	Chris Richards	DEF	15
219	Tim Ream	DEF	15
220	Mark McKenzie	DEF	15
221	Alex Freeman	DEF	15
222	Antonee Robinson	DEF	15
223	Tyler Adams	MID	15
224	Tanner Tessmann	MID	15
225	Weston McKennie	MID	15
226	Cristian Roldan	MID	15
227	Timothy Weah	FWD	15
228	Diego Luna	MID	15
229	Malik Tillman	MID	15
230	Christian Pulisic	FWD	15
231	Brenden Aaronson	MID	15
232	Ricardo Pepi	FWD	15
233	Haji Wright	FWD	15
234	Folarin Balogun	FWD	15
235	Roberto Fernandez	GK	16
236	Orlando Gill	GK	16
237	Gustavo Gomez	DEF	16
238	Fabián Balbuena	DEF	16
239	Juan Jose Caceres	DEF	16
240	Omar Alderete	DEF	16
241	Junior Alonso	DEF	16
242	Mathias Villasanti	MID	16
243	Diego Gómez	MID	16
244	Damián Bobadilla	MID	16
245	Andres Cubas	MID	16
246	Matías Galarza Fonda	MID	16
247	Julio Enciso	FWD	16
248	Alejandro Romero Gamarra	FWD	16
249	Miguel Almiron	FWD	16
250	Ramon Sosa	FWD	16
251	Ángel Romero	FWD	16
252	Antonio Sanabria	FWD	16
253	Mathew Ryan	GK	17
254	Joe Gauci	GK	17
255	Harry Souttar	DEF	17
256	Alessandro Circati	DEF	17
257	Jordy Bos	DEF	17
258	Aziz Behich	DEF	17
259	Cameron Burgess	DEF	17
260	Lewis Miller	DEF	17
261	Milos Degenek	DEF	17
262	Jackson Irvine	MID	17
263	Riley McGree	MID	17
264	Aiden O'Neill	MID	17
265	Connor Metcalfe	MID	17
266	Patrick Yazbek	MID	17
267	Craig Goodwin	FWD	17
268	Kusini Yengi	FWD	17
269	Nestory Irankunda	FWD	17
270	Mohamed Touré	FWD	17
271	Uğurcan Çakır	GK	18
272	Mert Müldür	DEF	18
273	Zeki Çelik	DEF	18
274	Abdülkerim Bardakcı	DEF	18
275	Caglar Soyuncu	DEF	18
276	Merih Demiral	DEF	18
277	Ferdi Kadıoğlu	DEF	18
278	Kaan Ayhan	MID	18
279	İsmail Yüksek	MID	18
280	Hakan Calhanoglu	MID	18
281	Orkun Kökçü	MID	18
282	Arda Güler	MID	18
283	İrfan Can Kahveci	MID	18
284	Yunus Akgün	FWD	18
285	Can Uzun	FWD	18
286	Barış Alper Yılmaz	FWD	18
287	Kerem Akturkoglu	FWD	18
288	Kenan Yıldız	FWD	18
289	Marc-André ter Stegen	GK	19
290	Jonathan Tah	DEF	19
291	David Raum	DEF	19
292	Nico Schlotterbeck	DEF	19
293	Antonio Rüdiger	DEF	19
294	Waldemar Anton	DEF	19
295	Ridle Baku	DEF	19
296	Maximilian Mittelstädt	DEF	19
297	Joshua Kimmich	MID	19
298	Florian Wirtz	MID	19
299	Felix Nmecha	MID	19
300	Leon Goretzka	MID	19
301	Jamal Musiala	MID	19
302	Serge Gnabry	FWD	19
303	Kai Havertz	FWD	19
304	Leroy Sané	FWD	19
305	Karim Adeyemi	FWD	19
306	Nick Woltemade	FWD	19
307	Eloy Room	GK	20
308	Armando Obispo	DEF	20
309	Sherel Floranus	DEF	20
310	Jurriën Gaari	DEF	20
311	Jurien Gaari	DEF	20
312	Roshon van Eijma	DEF	20
313	Shurandy Sambo	DEF	20
314	Livano Comenencia	MID	20
315	Godfried Roemeratoe	MID	20
316	Juninho Bacuna	MID	20
317	Leandro Bacuna	MID	20
318	Tahith Chong	MID	20
319	Kenji Gorre	FWD	20
320	Jearl Margaritha	FWD	20
321	Jürgen Locadia	FWD	20
322	Jeremy Antonisse	FWD	20
323	Gervane Kastaneer	FWD	20
324	Sonnyje Hansen	FWD	20
325	Yahia Fofana	GK	21
326	Ghislain Konan	DEF	21
327	Wilfried Singo	DEF	21
328	Odilon Kossounou	DEF	21
329	Evan Ndicka	DEF	21
330	Willy Boly	DEF	21
331	Emmanuel Agbadou	DEF	21
332	Ousmane Diomande	DEF	21
333	Franck Kessie	MID	21
334	Seko Fofana	MID	21
335	Ibrahim Sangare	MID	21
336	Jean-Philippe Gbamin	MID	21
337	Amad Diallo	FWD	21
338	Sebastien Haller	FWD	21
339	Simon Adingra	FWD	21
340	Van Ousmane Diomande	FWD	21
341	Evann Guessand	FWD	21
342	Oumar Diakite	FWD	21
343	Hernán Galíndez	GK	22
344	Gonzalo Valle	GK	22
345	Piero Hincapié	DEF	22
346	Pervis Estupiñán	DEF	22
347	Willian Pacho	DEF	22
348	Ángelo Preciado	DEF	22
349	Joel Ordonez	DEF	22
350	Moisés Caicedo	MID	22
351	Alan Franco	MID	22
352	Kendry Paez	MID	22
353	Pedro Vite	MID	22
354	Jhon Yeboah	FWD	22
355	Leonardo Campana	FWD	22
356	Gonzalo Plata	FWD	22
357	Nilson Angulo	FWD	22
358	Alan Minda	FWD	22
359	Kevin Rodriguez	FWD	22
360	Enner Valencia	FWD	22
361	Bart Verbruggen	GK	23
362	Virgil van Dijk	DEF	23
363	Micky van de Ven	DEF	23
364	Jurriën Timber	DEF	23
365	Denzel Dumfries	DEF	23
366	Nathan Aké	DEF	23
367	Jeremie Frimpong	DEF	23
368	Jan Paul van Hecke	DEF	23
369	Tijjani Reijnders	MID	23
370	Ryan Gravenberch	MID	23
371	Teun Koopmeiners	MID	23
372	Frenkie de Jong	MID	23
373	Xavi Simons	MID	23
374	Justin Kluivert	FWD	23
375	Memphis Depay	FWD	23
376	Donyell Malen	FWD	23
377	Wout Weghorst	FWD	23
378	Cody Gakpo	FWD	23
379	Zion Suzuki	GK	24
380	Henry Heroki Mochizuki	DEF	24
381	Ayumu Seku	DEF	24
382	Junnosuke Suzuki	DEF	24
383	Shogo Taniguchi	DEF	24
384	Tsuyoshi Watanabe	DEF	24
385	Kaishu Sano	MID	24
386	Yuki Soma	FWD	24
387	Ao Tanaka	MID	24
388	Daichi Kamada	MID	24
389	Takefusa Kubo	FWD	24
390	Ritsu Doan	FWD	24
391	Keito Nakamura	FWD	24
392	Takumi Minamino	FWD	24
393	Shuto Machino	FWD	24
394	Junya Ito	FWD	24
395	Koki Ogawa	FWD	24
396	Ayase Ueda	FWD	24
397	Viktor Johansson	GK	25
398	Isak Hien	DEF	25
399	Gabriel Gudmundsson	DEF	25
400	Emil Holm	DEF	25
401	Eric Nilsson	DEF	25
402	Gustaf Lagerbielke	DEF	25
403	Lucas Bergvall	MID	25
404	Hugo Larsson	MID	25
405	Yasin Ayari	MID	25
406	Mattias Svanberg	MID	25
407	Daniel Svensson	MID	25
408	Ken Sema	MID	25
409	Roony Bardghji	FWD	25
410	Dejan Kulusevski	FWD	25
411	Anthony Elanga	FWD	25
412	Alexander Isak	FWD	25
413	Viktor Gyokeres	FWD	25
414	Bechir Ben Saïd	GK	26
415	Aymen Dahmen	GK	26
416	Yan Valery	DEF	26
417	Montassar Talbi	DEF	26
418	Yassine Meriah	DEF	26
419	Ali Abdi	DEF	26
420	Anis Ben Slimane	MID	26
421	Ellyes Skhiri	MID	26
422	Aïssa Laïdouni	MID	26
423	Ferjani Sassi	MID	26
424	Mohamed Ali Ben Romdhane	MID	26
425	Hannibal Mejbri	MID	26
426	Elias Achouri	FWD	26
427	Elias Saad	FWD	26
428	Hazem Mastouri	FWD	26
429	Ismaël Gharbi	FWD	26
430	Sayfallah Ltaief	FWD	26
431	Naïm Sliti	FWD	26
432	Thibaut Courtois	GK	27
433	Arthur Theate	DEF	27
434	Timothy Castagne	DEF	27
435	Zeno Debast	DEF	27
436	Brandon Mechele	DEF	27
437	Maxime De Cuyper	DEF	27
438	Thomas Meunier	DEF	27
439	Youri Tielemans	MID	27
440	Amadou Onana	MID	27
441	Nicolas Raskin	MID	27
442	Alexis Saelemaekers	MID	27
443	Hans Vanaken	MID	27
444	Kevin De Bruyne	MID	27
445	Jérémy Doku	FWD	27
446	Charles De Ketelaere	FWD	27
447	Leandro Trossard	FWD	27
448	Loïs Openda	FWD	27
449	Romelu Lukaku	FWD	27
450	Mohamed Elshenawy	GK	28
451	Mohamed Hany	DEF	28
452	Mohamed Hamdy	DEF	28
453	Yasser Ibrahim	DEF	28
454	Khaled Sobhi	DEF	28
455	Rami Rabia	DEF	28
456	Hossam Abdelmaguid	DEF	28
457	Ahmed Fattouh	DEF	28
458	Marwan Attia	MID	28
459	Zizo	MID	28
460	Hamdy Fathy	MID	28
461	Mohanad Lasheen	MID	28
462	Emam Ashour	MID	28
463	Osama Faisal	FWD	28
464	Mohamed Salah	FWD	28
465	Mostafa Mohamed	FWD	28
466	Trezeguet	FWD	28
467	Omar Marmoush	FWD	28
468	Alireza Beiranvand	GK	29
469	Morteza Pouraliganji	DEF	29
470	Ehsan Hajsafi	DEF	29
471	Milad Mohammadi	DEF	29
472	Shouja Khalilzadeh	DEF	29
473	Ramin Rezaeian	DEF	29
474	Hossein Kanaani	DEF	29
475	Sadegh Moharrami	DEF	29
476	Saleh Hardani	DEF	29
477	Saeed Ezatolahi	MID	29
478	Saman Ghoddos	MID	29
479	Omid Noorafkan	MID	29
480	Roozbeh Cheshmi	MID	29
481	Mohammad Mohebi	FWD	29
482	Sardar Azmoun	FWD	29
483	Mehdi Taremi	FWD	29
484	Alireza Jahanbakhsh	FWD	29
485	Ali Gholizadeh	FWD	29
486	Max Crocombe	GK	30
487	Alex Paulsen	GK	30
488	Michael Boxall	DEF	30
489	Liberato Cacace	DEF	30
490	Tim Payne	DEF	30
491	Tyler Bindon	DEF	30
492	Francis de Vries	DEF	30
493	Finn Surman	DEF	30
494	Joe Bell	MID	30
495	Sarpreet Singh	MID	30
496	Ryan Thomas	MID	30
497	Matthew Garbett	MID	30
498	Marko Stamenic	MID	30
499	Ben Old	FWD	30
500	Chris Wood	FWD	30
501	Elijah Just	FWD	30
502	Callum McCowatt	FWD	30
503	Kosta Barbarouses	FWD	30
504	Unai Simón	GK	31
505	Robin Le Normand	DEF	31
506	Aymeric Laporte	DEF	31
507	Dean Huijsen	DEF	31
508	Pedro Porro	DEF	31
509	Dani Carvajal	DEF	31
510	Marc Cucurella	DEF	31
511	Martin Zubimendi	MID	31
512	Rodri	MID	31
513	Pedri	MID	31
514	Fabián Ruiz	MID	31
515	Mikel Merino	MID	31
516	Lamine Yamal	FWD	31
517	Dani Olmo	FWD	31
518	Nico Williams	FWD	31
519	Ferran Torres	FWD	31
520	Álvaro Morata	FWD	31
521	Mikel Oyarzabal	FWD	31
522	Vozinha	GK	32
523	Logan Costa	DEF	32
524	Pico	DEF	32
525	Diney	DEF	32
526	Steven Moreira	DEF	32
527	Wágner Pina	DEF	32
528	Joao Paulo	MID	32
529	Yannick Semedo	MID	32
530	Kevin Pina	MID	32
531	Patrick Andrade	MID	32
532	Jamiro Monteiro	MID	32
533	Deroy Duarte	MID	32
534	Garry Rodrigues	FWD	32
535	Jovane Cabral	FWD	32
536	Ryan Mendes	FWD	32
537	Dailon Livramento	FWD	32
538	Willy Semedo	FWD	32
539	Bebé	FWD	32
540	Nawaf Alaqidi	GK	33
541	Abdulrahman Alsanbi	GK	33
542	Saud Abdulhamid	DEF	33
543	Nawaf Buwashl	DEF	33
544	Jihad Thakri	DEF	33
545	Moteb Alharbi	DEF	33
546	Hassan Altambakti	DEF	33
547	Musab Aljuwayr	MID	33
548	Ziyad Aljohani	MID	33
549	Abdullah Alkhaibari	MID	33
550	Nasser Aldawsari	MID	33
551	Saleh Abualshamat	MID	33
552	Marwan Alsahafi	FWD	33
553	Salem Aldawsari	FWD	33
554	Abdulrahman Alobud	FWD	33
555	Feras Alburaikan	FWD	33
556	Saleh Alshehri	FWD	33
557	Abdullah Alhamddan	FWD	33
558	Sergio Rochet	GK	34
559	Santiago Mele	GK	34
560	Ronald Araújo	DEF	34
561	José María Giménez	DEF	34
562	Sebastian Caceres	DEF	34
563	Mathías Olivera	DEF	34
564	Guillermo Varela	DEF	34
565	Nahitan Nandez	MID	34
566	Federico Valverde	MID	34
567	Giorgian de Arrascaeta	MID	34
568	Rodrigo Bentancur	MID	34
569	Manuel Ugarte	MID	34
570	Nicolás De La Cruz	MID	34
571	Maxi Araújo	FWD	34
572	Darwin Núñez	FWD	34
573	Federico Viñas	FWD	34
574	Rodrigo Aguirre	FWD	34
575	Facundo Pellistri	FWD	34
576	Mike Maignan	GK	35
577	Theo Hernández	DEF	35
578	William Saliba	DEF	35
579	Jules Koundé	DEF	35
580	Ibrahima Konaté	DEF	35
581	Dayot Upamecano	DEF	35
582	Lucas Digne	DEF	35
583	Aurélien Tchouaméni	MID	35
584	Eduardo Camavinga	MID	35
585	Manu Koné	MID	35
586	Adrien Rabiot	MID	35
587	Michael Olise	FWD	35
588	Ousmane Dembélé	FWD	35
589	Bradley Barcola	FWD	35
590	Desire Doue	FWD	35
591	Kingsley Coman	FWD	35
592	Hugo Ekitiké	FWD	35
593	Kylian Mbappé	FWD	35
594	Édouard Mendy	GK	36
595	Yehvann Diouf	GK	36
596	Moussa Niakhate	DEF	36
597	Abdoulaye Seck	DEF	36
598	Ismail Jakobs	DEF	36
599	El Hadji Malick Diouf	DEF	36
600	Kalidou Koulibaly	DEF	36
601	Idrissa Gana Gueye	MID	36
602	Pape Matar Sarr	MID	36
603	Pape Gueye	MID	36
604	Habib Diarra	MID	36
605	Lamine Camara	MID	36
606	Sadio Mané	FWD	36
607	Ismaïla Sarr	FWD	36
608	Boulaye Dia	FWD	36
609	Iliman Ndiaye	FWD	36
610	Nicolas Jackson	FWD	36
611	Krépin Diatta	FWD	36
612	Jalal Hassan	GK	37
613	Rebin Sulaka	DEF	37
614	Hussein Ali	DEF	37
615	Akam Hashem	DEF	37
616	Merchas Doski	DEF	37
617	Zaid Tahseen	DEF	37
618	Manaf Younis	DEF	37
619	Zidane Iqbal	MID	37
620	Amir Al-Ammari	MID	37
621	Ibrahim Bayesh	MID	37
622	Ali Jasim	MID	37
623	Youssef Amyn	MID	37
624	Aymar Sher	MID	37
625	Marju Farji	FWD	37
626	Osama Rashid	FWD	37
627	Ali Al-Hamadi	FWD	37
628	Aymen Hussein	FWD	37
629	Mohanad Ali	FWD	37
630	Orjan Nyland	GK	38
631	Julian Ryerson	DEF	38
632	Leo Østigård	DEF	38
633	Kristoffer Vassbakk Ajer	DEF	38
634	Marcus Holmgren Pedersen	DEF	38
635	David Moller Wolfe	DEF	38
636	Torbjørn Heggem	DEF	38
637	Morten Thorsby	MID	38
638	Martin Ødegaard	MID	38
639	Sander Berge	MID	38
640	Andreas Schjelderup	MID	38
641	Patrick Berg	MID	38
642	Erling Haaland	FWD	38
643	Alexander Sorloth	FWD	38
644	Aron Dønnum	FWD	38
645	Jørgen Strand Larsen	FWD	38
646	Antonio Nusa	FWD	38
647	Oscar Bobb	FWD	38
648	Emiliano Martínez	GK	39
649	Nahuel Molina	DEF	39
650	Cristian Romero	DEF	39
651	Nicolás Otamendi	DEF	39
652	Nicolás Tagliafico	DEF	39
653	Leonardo Balerdi	DEF	39
654	Enzo Fernández	MID	39
655	Alexis Mac Allister	MID	39
656	Rodrigo De Paul	MID	39
657	Exequiel Palacios	MID	39
658	Leandro Paredes	MID	39
659	Nico Paz	MID	39
660	Franco Mastantuono	MID	39
661	Nico González	FWD	39
662	Lionel Messi	FWD	39
663	Lautaro Martínez	FWD	39
664	Julián Álvarez	FWD	39
665	Giuliano Simeone	FWD	39
666	Alexis Guendouz	GK	40
667	Ramy Bensebaini	DEF	40
668	Youcef Atal	DEF	40
669	Rayan Ait-Nouri	DEF	40
670	Mohamed Amine Tougaï	DEF	40
671	Aissa Mandi	DEF	40
672	Ismaël Bennacer	MID	40
673	Houssem Aouar	MID	40
674	Hicham Boudaoui	MID	40
675	Ramiz Zerrouki	MID	40
676	Nabil Bentaleb	MID	40
677	Farès Chaïbi	MID	40
678	Riyad Mahrez	FWD	40
679	Said Benrahma	FWD	40
680	Anis Hadj Moussa	FWD	40
681	Amine Gouiri	FWD	40
682	Baghdad Bounedjah	FWD	40
683	Mohammed Amoura	FWD	40
684	Alexander Schlager	GK	41
685	Patrick Pentz	GK	41
686	David Alaba	DEF	41
687	Kevin Danso	DEF	41
688	Philipp Lienhart	DEF	41
689	Stefan Posch	DEF	41
690	Phillipp Mwene	DEF	41
691	Alexander Prass	MID	41
692	Xaver Schlager	MID	41
693	Marcel Sabitzer	MID	41
694	Konrad Laimer	MID	41
695	Florian Grillitsch	MID	41
696	Nicolas Seiwald	MID	41
697	Romano Schmid	MID	41
698	Patrick Wimmer	FWD	41
699	Christoph Baumgartner	FWD	41
700	Michael Gregoritsch	FWD	41
701	Marko Arnautovic	FWD	41
702	Yazeed Abulaila	GK	42
703	Ehsan Haddad	GK	42
704	Mohammad Abu Hashish	DEF	42
705	Yazan Al-Arab	DEF	42
706	Abdallah Nasib	DEF	42
707	Saleem Obaid	DEF	42
708	Mohammad Abualnadi	DEF	42
709	Ibrahim Saadeh	DEF	42
710	Nizar Al-Rashdan	MID	42
711	Noor Al-Rawabdeh	MID	42
712	Mohannad Abu Taha	MID	42
713	Amer Jamous	MID	42
714	Mousa Al-Taamari	MID	42
715	Yazan Al-Naimat	FWD	42
716	Mahmoud Al-Mardi	FWD	42
717	Ali Olwan	FWD	42
718	Mohammad Abu Zrayq	FWD	42
719	Ibrahim Sabra	FWD	42
720	Diogo Costa	GK	43
721	José Sá	GK	43
722	Rúben Dias	DEF	43
723	João Cancelo	DEF	43
724	Diogo Dalot	DEF	43
725	Nuno Mendes	DEF	43
726	Gonçalo Inácio	DEF	43
727	Bernardo Silva	MID	43
728	Bruno Fernandes	MID	43
729	Rúben Neves	MID	43
730	Vitinha	MID	43
731	Joao Neves	MID	43
732	Cristiano Ronaldo	FWD	43
733	Francisco Trincão	FWD	43
734	João Félix	FWD	43
735	Gonçalo Ramos	FWD	43
736	Pedro Neto	FWD	43
737	Rafael Leão	FWD	43
738	Lionel Mpasi	GK	44
739	Aaron Wan-Bissaka	DEF	44
740	Axel Tuanzebe	DEF	44
741	Arthur Masuaku	DEF	44
742	Chancel Mbemba	DEF	44
743	Joris Kayembe	DEF	44
744	Charles Pickel	MID	44
745	Ngal'ayel Mukau	MID	44
746	Edo Kayembe	MID	44
747	Samuel Moutoussamy	MID	44
748	Noah Sadiki	MID	44
749	Théo Bongonda	FWD	44
750	Meschack Elia	FWD	44
751	Yoane Wissa	FWD	44
752	Brian Cipenga	FWD	44
753	Fiston Mayele	FWD	44
754	Cédric Bakambu	FWD	44
755	Nathanaël Mbuku	FWD	44
756	Utkir Yusupov	GK	45
757	Farrukh Sayfiev	DEF	45
758	Sherzod Nasrullaev	DEF	45
759	Umar Eshmurodov	DEF	45
760	Husniddin Aliqulov	DEF	45
761	Rustam Ashurmatov	DEF	45
762	Akber Ismatullaev	MID	45
763	Abdukodir Khusanov	DEF	45
764	Odiljon Hamrobekov	MID	45
765	Otabek Shukurov	MID	45
766	Jamshid Iskanderov	MID	45
767	Azbek Turgunboev	MID	45
768	Khojimat Erkinov	FWD	45
769	Eldor Shomurodov	FWD	45
770	Oston Urunov	FWD	45
771	Jaloliddin Masharipov	FWD	45
772	Igor Sergeev	FWD	45
773	Abbosbek Fayzullaev	FWD	45
774	Camilo Vargas	GK	46
775	David Ospina	GK	46
776	Davinson Sanchez	DEF	46
777	Yerry Mina	DEF	46
778	Daniel Muñoz	DEF	46
779	Johan Mojica	DEF	46
780	Jhon Lucumí	DEF	46
781	Santiago Arias	DEF	46
782	Jefferson Lerma	MID	46
783	Kevin Castaño	MID	46
784	Richard Ríos	MID	46
785	James Rodríguez	MID	46
786	Juan Fernando Quintero	MID	46
787	Jorge Carrascal	MID	46
788	Jhon Arias	FWD	46
789	Jhon Córdoba	FWD	46
790	Luis Suárez	FWD	46
791	Luis Díaz	FWD	46
792	Jordan Pickford	GK	47
793	John Stones	DEF	47
794	Marc Guehi	DEF	47
795	Ezri Konsa	DEF	47
796	Trent Alexander-Arnold	DEF	47
797	Reece James	DEF	47
798	Dan Burn	DEF	47
799	Jordan Henderson	MID	47
800	Declan Rice	MID	47
801	Jude Bellingham	MID	47
802	Cole Palmer	MID	47
803	Morgan Rogers	FWD	47
804	Anthony Gordon	FWD	47
805	Phil Foden	FWD	47
806	Bukayo Saka	FWD	47
807	Harry Kane	FWD	47
808	Marcus Rashford	FWD	47
809	Ollie Watkins	FWD	47
810	Dominik Livaković	GK	48
811	Duje Ćaleta-Car	DEF	48
812	Joško Gvardiol	DEF	48
813	Josip Stanisic	DEF	48
814	Luka Vušković	DEF	48
815	Josip Šutalo	DEF	48
816	Kristijan Jakić	MID	48
817	Luka Modrić	MID	48
818	Mateo Kovačić	MID	48
819	Martin Baturina	MID	48
820	Lovro Majer	MID	48
821	Mario Pašalić	MID	48
822	Petar Sucic	MID	48
823	Ivan Perišić	FWD	48
824	Marco Pašalić	FWD	48
825	Ante Budimir	FWD	48
826	Andrej Kramarić	FWD	48
827	Franjo Ivanović	FWD	48
828	Lawrence Ati-Zigi	GK	49
829	Tariq Lamptey	DEF	49
830	Mohammed Salisu	DEF	49
831	Alidu Seidu	DEF	49
832	Alexander Djiku	DEF	49
833	Gideon Mensah	DEF	49
834	Caleb Yirenkyi	MID	49
835	Abdul Issahaku Fatawu	FWD	49
836	Thomas Partey	MID	49
837	Salis Abdul Samed	MID	49
838	Kamaldeen Sulemana	FWD	49
839	Mohammed Kudus	FWD	49
840	Inaki Williams	FWD	49
841	Jordan Ayew	FWD	49
842	André Ayew	FWD	49
843	Joseph Paintsil	FWD	49
844	Osman Bukari	FWD	49
845	Antoine Semenyo	FWD	49
846	Orlando Mosquera	GK	50
847	Luis Mejía	GK	50
848	Fidel Escobar	DEF	50
849	Andres Andrade	DEF	50
850	Michael Amir Murillo	DEF	50
851	Eric Davis	DEF	50
852	José Córdoba	DEF	50
853	César Blackman	DEF	50
854	Cristian Martinez	MID	50
855	Anibal Godoy	MID	50
856	Adalberto Carrasquilla	MID	50
857	Edgar Barcenas	MID	50
858	Carlos Harvey	MID	50
859	Ismael Diaz	FWD	50
860	Jose Fajardo	FWD	50
861	Cecilio Waterman	FWD	50
862	Jose Luis Rodriguez	FWD	50
863	Alberto Quintero	FWD	50
884	Florian Wiegele	GK	41
885	Marco Friedl	DEF	41
886	Michael Svoboda	DEF	41
887	David Affengruber	DEF	41
888	Alessandro Schöpf	MID	41
889	Carney Chukwuemeka	MID	41
890	Paul Wanner	MID	41
891	Sasa Kalajdzic	FWD	41
892	Senne Lammens	GK	27
893	Mike Penders	GK	27
894	Koni De Winter	DEF	27
895	Nathan Ngoy	DEF	27
896	Joaquin Seys	DEF	27
897	Axel Witsel	DEF	27
898	Dodi Lukebakio	FWD	27
899	Diego Moreira	FWD	27
900	Matias Fernandez-Pardo	FWD	27
901	Nikola Vasiljev	GK	8
902	Osman Hadzikic	GK	8
903	Martin Zlomislic	GK	8
904	Dennis Hadzikadunic	DEF	8
905	Stjepan Radeljic	DEF	8
906	Nidal Celik	DEF	8
907	Ermin Mahmic	MID	8
908	Jovo Lukic	FWD	8
909	Kerim-Sam Alajbegovic	FWD	8
910	Ederson	GK	11
911	Weverton	GK	11
912	Alex Sandro	DEF	11
913	Léo Pereira	DEF	11
914	Douglas Santos	DEF	11
915	Bremer	DEF	11
916	Ibañez	DEF	11
917	Fabinho	MID	11
918	Danilo	MID	11
919	Neymar	FWD	11
920	Igor Thiago	FWD	11
921	Endrick	FWD	11
922	Rayan	FWD	11
923	Márcio Rosa	GK	32
924	Carlos Dos Santos	GK	32
925	Stopira	DEF	32
926	Roberto Lopes	DEF	32
927	Kelvin Spencer Pires	DEF	32
928	Deroy Duarte	MID	32
929	Telmo Arcanjo	MID	32
930	Nuno da Costa	FWD	32
931	Jovane Cabral	FWD	32
932	Benchimol	FWD	32
933	Hélio Varela	FWD	32
934	Timothy Fayulu	GK	44
935	Matthieu Epolo	GK	44
936	Dylan Batubinsika	DEF	44
937	Gedeon Kalulu	DEF	44
938	Steve Kapuadi	DEF	44
939	Gaël Kakuta	MID	44
940	Aaron Tshibola	MID	44
941	Simon Banza	FWD	44
942	Dominik Kotarski	GK	48
943	Ivor Pandur	GK	48
944	Martin Erlic	DEF	48
945	Marin Pongracic	DEF	48
946	Nikola Vlasic	MID	48
947	Nikola Moro	MID	48
948	Toni Fruk	MID	48
949	Petar Sucic	MID	48
950	Petar Musa	FWD	48
951	Igor Matanovic	FWD	48
952	Trevor Doornbusch	GK	20
953	Tyrick Bodak	GK	20
954	Joshua Brenet	DEF	20
955	Riechedly Bazoer	DEF	20
956	Deveron Fonville	DEF	20
957	Kevin Felida	MID	20
958	Ar'jany Martha	MID	20
959	Tyrese Noslin	MID	20
960	Brandley Kuwas	FWD	20
961	Mahdy Soliman	GK	28
962	Mostafa Shobeir	GK	28
963	Karim Hafez	DEF	28
964	Mohamed Abdelmonem	DEF	28
965	Ahmed Fatouh	DEF	28
966	Tarek Alaa	DEF	28
967	Nabil Emad	MID	28
968	Ibrahim Adel	MID	28
969	Mahmoud Saber	MID	28
970	Haissem Hassan	FWD	28
971	Mostafa Mohamed Zaki Abdelraouf	FWD	28
972	Hamza Abdelkarim	FWD	28
973	Aqtay Abdallah	FWD	28
974	Reece James	DEF	47
975	Djed Spence	DEF	47
976	Jarell Quansah	DEF	47
977	Tino Livramento	DEF	47
978	Nico O'Reilly	DEF	47
979	Jordan Henderson	MID	47
980	Elliot Anderson	MID	47
981	Eberechi Eze	MID	47
982	Kobbie Mainoo	MID	47
983	Ivan Toney	FWD	47
984	Noni Madueke	FWD	47
985	Brice Samba	GK	35
986	Robin Risser	GK	35
987	Theo Hernández	DEF	35
988	Maxence Lacroix	DEF	35
989	Malo Gusto	DEF	35
990	N'Golo Kanté	MID	35
991	Rayan Cherki	MID	35
992	Maghnes Akliouche	MID	35
993	Warren Zaïre-Emery	MID	35
994	Marcus Thuram	FWD	35
995	Jean-Philippe Mateta	FWD	35
996	Manuel Neuer	GK	19
997	Oliver Baumann	GK	19
998	Alexander Nübel	GK	19
999	Nathaniel Brown	DEF	19
1000	Malick Thiaw	DEF	19
1001	Pascal Gross	MID	19
1002	Nadiem Amiri	MID	19
1003	Angelo Stiller	MID	19
1004	Aleksandar Pavlovic	MID	19
1005	Lennart Karl	MID	19
1006	Deniz Undav	FWD	19
1007	Maximilian Beier	FWD	19
1008	Jamie Leweling	FWD	19
1009	Josue Duverger	GK	13
1010	Wilguens Paugain	DEF	13
1011	Keeto Thermoncy	DEF	13
1012	Leverton Pierre	MID	13
1013	Carl-Fred Sainte	MID	13
1014	Dominique Simon	MID	13
1015	Woodensky Pierre	MID	13
1016	Wilson Isidor	FWD	13
1017	Yassine Fortune	FWD	13
1018	Lenny Joseph	FWD	13
1019	Alban Lafont	GK	21
1020	Mohamed Koné	GK	21
1021	Clément Akpa	DEF	21
1022	Guela Doué	DEF	21
1023	Jean Michaël Seri	MID	21
1024	Parfait Guiagon	MID	21
1025	Christ Inao Oulaï	MID	21
1026	Nicolas Pépé	FWD	21
1027	Amad	FWD	21
1028	Ange-Yoan Bonny	FWD	21
1029	Elye Wahi	FWD	21
1030	Bazoumana Touré	FWD	21
1031	Mark Flekken	GK	23
1032	Justin Bijlow	GK	23
1033	Stefan de Vrij	DEF	23
1034	Lutsharel Geertruida	DEF	23
1035	Jorrel Hato	DEF	23
1036	Jerdy Schouten	MID	23
1037	Luciano Valente	MID	23
1038	Kees Smit	MID	23
1039	Noa Lang	FWD	23
1040	Brian Brobbey	FWD	23
1041	Michael Woud	GK	30
1042	Tommy Smith	DEF	30
1043	Callan Elliot	DEF	30
1044	Nando Pijnaker	DEF	30
1045	Alex Rufer	MID	30
1046	Lachlan Bayliss	MID	30
1047	Ben Waine	FWD	30
1048	Jesse Randall	FWD	30
1049	Egil Selvik	GK	38
1050	Sander Tangvik	GK	38
1051	Fredrik André Bjørkan	DEF	38
1052	Henrik Sælebakke Falchener	DEF	38
1053	Sondre Langas	DEF	38
1054	Fredrik Aursnes	MID	38
1055	Jens Petter Hauge	MID	38
1056	Kristian Thorstvedt	MID	38
1057	Thelo Aasgaard	MID	38
1058	Alexander Sørloth	FWD	38
1059	César Samudio	GK	50
1060	Roderick Miller	DEF	50
1061	Jorge Gutiérrez	DEF	50
1062	Jiovany Ramos	DEF	50
1063	Martín Krug	DEF	50
1064	César Yanis	FWD	50
1065	José Kadir	FWD	50
1066	Mário Ricardo Silva Velho	GK	43
1067	Nélson Semedo	DEF	43
1068	Tomás Lemos Araújo	DEF	43
1069	Renato Veiga	MID	43
1070	Samú Costa	MID	43
1071	Bernardo Silva	MID	43
1072	Matheus Nunes	MID	43
1073	Gonçalo Guedes	FWD	43
1074	Francisco Conceição	FWD	43
1075	Liam Kelly	GK	14
1076	Craig Gordon	GK	14
1077	Dominic Hyam	DEF	14
1078	Nathan Patterson	DEF	14
1079	Findlay Curtis	MID	14
1080	Lawrence Shankland	FWD	14
1081	George Hirst	FWD	14
1082	Ross Stewart	FWD	14
1083	Song Bum-Keun	GK	5
1084	Kim Moon-Hwan	DEF	5
1085	Kim Tae-Hyeon	DEF	5
1086	Gi-Hyuk Lee	DEF	5
1087	Jin-Gyu Kim	MID	5
1088	Park Jin-Seop	MID	5
1089	Bae Jun-Ho	MID	5
1090	Eom Ji-Sung	FWD	5
1091	Yang Hyun-Jun	FWD	5
1092	Kristoffer Nordfeldt	GK	25
1093	Jacob Widell Zetterström	GK	25
1094	Carl Starfelt	DEF	25
1095	Eric Anders Smith	DEF	25
1096	Victor Lindelöf	DEF	25
1097	Hjalmar Ekdal	DEF	25
1098	Elliot Stroud	DEF	25
1099	Jesper Karlström	MID	25
1100	Taha Ali	MID	25
1101	Besfort Zeneli	MID	25
1102	Benjamin Nygren	FWD	25
1103	Alexander Bernhardsson	FWD	25
1104	Marvin Keller	GK	10
1105	Eray Cömert	DEF	10
1106	Miro Muheim	DEF	10
1107	Luca Jaquez	DEF	10
1108	Djibril Sow	MID	10
1109	Christian Fassnacht	MID	10
1110	Cedric Itten	FWD	10
1111	Noah Okafor	FWD	10
1112	Patrick Schulte	GK	15
1113	Chris Brady	GK	15
1114	Matt Turner	GK	15
1115	Auston Trusty	DEF	15
1116	Joe Scally	DEF	15
1117	Giovanni Reyna	MID	15
1118	Johnny Cardoso	MID	15
1119	Aidan Morris	MID	15
1120	Sebastian Berhalter	MID	15
1121	Patrick Agyemang	FWD	15
1122	Max Arfsten	FWD	15
864	Virgil van Dijk	DEF	23
1123	Igor Akinfeev	GK	58
1124	Sergey Ignashevich	DEF	58
1125	Ilya Kutepov	DEF	58
1126	Yuri Zhirkov	DEF	58
1127	Mário Fernandes	DEF	58
1128	Alan Dzagoev	MID	58
1129	Roman Zobnin	TEAM	58
1130	Iury Gazinsky	TEAM	58
1131	Fedor Smolov	FWD	58
1132	Aleksandr Golovin	TEAM	58
1133	Aleksandr Samedov	TEAM	58
1134	Anton Miranchuk	TEAM	58
1135	Andrei Semenov	TEAM	58
1136	Vladimir Gabulov	TEAM	58
1137	Artem Dzyuba	TEAM	58
1138	Fedor Kudryashov	TEAM	58
1139	Vladimir Granat	TEAM	58
1140	Alexey Miranchuk	TEAM	58
1141	Andrey Lunev	TEAM	58
1142	Daler Kuzyaev	TEAM	58
1143	Aleksandr Erokhin	TEAM	58
1144	Igor Smolnikov	TEAM	58
1145	Denis Cheryshev	TEAM	58
1146	Abdullah Al-Mayouf	GK	33
1147	Omar Othman	DEF	33
1148	Osama Hawsawi	DEF	33
1149	Abdullah Otayf	DEF	33
1150	Yasser Al-Shahrani	DEF	33
1151	Mohammed Al-Burayk	DEF	33
1152	Salman Al-Faraj	MID	33
1153	Taisir Al-Jassim	MID	33
1154	Salem Al-Dawsari	TEAM	33
1155	Yahya Alshehri	TEAM	33
1156	Mohammed Al-Sahlawi	FWD	33
1157	Muhannad Assiri	TEAM	33
1158	Ali Al-Bulayhi	TEAM	33
1159	Mohamed Kanno	TEAM	33
1160	Abdullah Al-Khaibari	TEAM	33
1161	Abdulmalek Al-Khaibri	TEAM	33
1162	Mansour Al-Harbi	TEAM	33
1163	Mohammed Al-Owais	TEAM	33
1164	Yasser Al-Mosailem	TEAM	33
1165	Hatan Bahbri	TEAM	33
1166	Motaz Hawsawi	TEAM	33
1167	Hussain Almoqahwi	TEAM	33
1168	Fahad Al-Muwallad	TEAM	33
1169	Mohamed El Shenawy	GK	28
1170	Ahmed Hegazi	DEF	28
1171	Ali Gabr	DEF	28
1172	Mohamed Abdel-Shafy	DEF	28
1173	Ahmed Fathi	DEF	28
1174	Abdallah Said	MID	28
1175	Tarek Hamed	TEAM	28
1176	Mohamed Elneny	TEAM	28
1177	Marwan Mohsen	FWD	28
1178	Trézéguet	TEAM	28
1179	Amr Warda	TEAM	28
1180	Ahmed Elmohamady	TEAM	28
1181	Essam El-Hadary	TEAM	28
1182	Ramadan Sobhi	TEAM	28
1183	Kahraba	TEAM	28
1184	Sherif Ekramy	TEAM	28
1185	Sam Morsy	TEAM	28
1186	Samir Saad	TEAM	28
1187	Mahmoud El-Wensh	TEAM	28
1188	Omar Gaber	TEAM	28
1189	Shikabala	TEAM	28
1190	Ayman Ashraf	TEAM	28
1191	Fernando Muslera	GK	34
1192	Diego Godín	DEF	34
1193	Martín Cáceres	DEF	34
1194	Gullermo Varela	DEF	34
1195	Matías Vecino	MID	34
1196	Nahitan Nández	TEAM	34
1197	Edinson Cavani	TEAM	34
1198	Luis Suárez	TEAM	34
1199	Martín Campaña	TEAM	34
1200	Sebastián Coates	TEAM	34
1201	Cristian Rodríguez	TEAM	34
1202	Maxi Gómez	TEAM	34
1203	Jonathan Urretaviscaya	TEAM	34
1204	Maxi Pereira	TEAM	34
1205	Gastón Silva	TEAM	34
1206	Lucas Torreira	TEAM	34
1207	Diego Laxalt	TEAM	34
1208	Martín Silva	TEAM	34
1209	Cristhian Stuani	TEAM	34
1210	Carlos Sánchez	TEAM	34
1211	Medhi Benatia	DEF	12
1212	Nordin Amrabat	DEF	12
1213	Younès Belhanda	MID	12
1214	Mbark Boussoufa	TEAM	12
1215	Karim El Ahmadi	TEAM	12
1216	Amine Harit	TEAM	12
1217	Hakim Ziyech	TEAM	12
1218	Faycal Fajr	TEAM	12
1219	Aziz Bouhaddouz	TEAM	12
1220	Reda Tagnaouti	TEAM	12
1221	Mehdi Carcela-González	TEAM	12
1222	Khalid Boutaïb	TEAM	12
1223	Hamza Mendyl	TEAM	12
1224	Nabil Dirar	TEAM	12
1225	Manuel da Costa	TEAM	12
1226	Youssef Aït Bennasser	TEAM	12
1227	Omid Ebrahimi	DEF	29
1228	Vahid Amiri	MID	29
1229	Masoud Shojaei	MID	29
1230	Karim Ansarifard	TEAM	29
1231	Ashkan Dejagah	TEAM	29
1232	Mehdi Torabi	TEAM	29
1233	Majid Hosseini	TEAM	29
1234	Rashid Mazaheri	TEAM	29
1235	Mohammad Reza Khanzadeh	TEAM	29
1236	Amir Abedzadeh	TEAM	29
1237	Reza Ghoochannejhad	TEAM	29
1238	Pejman Montazeri	TEAM	29
1239	Rui Patrício	GK	43
1240	José Fonte	DEF	43
1241	Pepe	DEF	43
1242	Raphaël Guerreiro	DEF	43
1243	Cédric	DEF	43
1244	William Carvalho	MID	43
1245	João Moutinho	MID	43
1246	Manuel Fernandes	TEAM	43
1247	André Silva	TEAM	43
1248	Anthony Lopes	TEAM	43
1249	Ricardo Quaresma	TEAM	43
1250	Gelson Martins	TEAM	43
1251	João Mário	TEAM	43
1252	Mário Rui	TEAM	43
1253	Bruno Alves	TEAM	43
1254	Beto	TEAM	43
1255	Adrien Silva	TEAM	43
1256	Ricardo Pereira	TEAM	43
1257	David de Gea	GK	31
1258	Sergio Ramos	DEF	31
1259	Gerard Piqué	DEF	31
1260	Jordi Alba	DEF	31
1261	Nacho	DEF	31
1262	Sergio Busquets	MID	31
1263	Andrés Iniesta	TEAM	31
1264	Koke	TEAM	31
1265	Diego Costa	FWD	31
1266	Isco	TEAM	31
1267	David Silva	TEAM	31
1268	Pepe Reina	TEAM	31
1269	Álvaro Odriozola	TEAM	31
1270	César Azpilicueta	TEAM	31
1271	Lucas Vázquez	TEAM	31
1272	Iago Aspas	TEAM	31
1273	Thiago Alcantara	TEAM	31
1274	Marco Asensio	TEAM	31
1275	Kepa Arrizabalaga	TEAM	31
1276	Saúl Ñíguez	TEAM	31
1277	Nacho Monreal	TEAM	31
1278	Rodrigo	TEAM	31
1279	Hugo Lloris	GK	35
1280	Samuel Umtiti	DEF	35
1281	Raphaël Varane	DEF	35
1282	Lucas Hernández	DEF	35
1283	Benjamin Pavard	DEF	35
1284	Paul Pogba	TEAM	35
1285	Corentin Tolisso	TEAM	35
1286	Antoine Griezmann	FWD	35
1287	Blaise Matuidi	TEAM	35
1288	Florian Thauvin	TEAM	35
1289	Alphonse Areola	TEAM	35
1290	Olivier Giroud	TEAM	35
1291	Nabil Fekir	TEAM	35
1292	Steve Mandanda	TEAM	35
1293	Presnel Kimpembe	TEAM	35
1294	Thomas Lemar	TEAM	35
1295	Steven N'Zonzi	TEAM	35
1296	Djibril Sidibé	TEAM	35
1297	Benjamin Mendy	TEAM	35
1298	Adil Rami	TEAM	35
1299	Mark Milligan	DEF	17
1300	Trent Sainsbury	DEF	17
1301	Joshua Risdon	DEF	17
1302	Aaron Mooy	MID	17
1303	Mile Jedinak	MID	17
1304	Robbie Kruse	TEAM	17
1305	Mathew Leckie	TEAM	17
1306	Andrew Nabbout	FWD	17
1307	Tom Rogic	TEAM	17
1308	Massimo Luongo	TEAM	17
1309	Jamie Maclaren	TEAM	17
1310	Dimitrios Petratos	TEAM	17
1311	Danny Vukovic	TEAM	17
1312	Matthew Jurman	TEAM	17
1313	Tomi Juric	TEAM	17
1314	James Meredith	TEAM	17
1315	Brad Jones	TEAM	17
1316	Tim Cahill	TEAM	17
1317	Daniel Arzani	TEAM	17
1318	Wilfredo Caballero	GK	39
1319	Marcos Rojo	DEF	39
1320	Eduardo Salvio	DEF	39
1321	Lucas Biglia	TEAM	39
1322	Javier Mascherano	TEAM	39
1323	Sergio Agüero	FWD	39
1324	Ángel Di María	TEAM	39
1325	Maximiliano Meza	TEAM	39
1326	Enzo Pérez	TEAM	39
1327	Giovani Lo Celso	TEAM	39
1328	Franco Armani	TEAM	39
1329	Paulo Dybala	TEAM	39
1330	Federico Fazio	TEAM	39
1331	Cristian Ansaldi	TEAM	39
1332	Gabriel Mercado	TEAM	39
1333	Cristian Pavón	TEAM	39
1334	Éver Banega	TEAM	39
1335	Gonzalo Higuaín	TEAM	39
1336	Marcos Acuña	TEAM	39
1337	Nahuel Guzmán	TEAM	39
1338	Hannes Halldórsson	GK	60
1339	Ragnar Sigurdsson	DEF	60
1340	Kári Árnason	DEF	60
1341	Hördur Magnússon	DEF	60
1342	Birkir Saevarsson	DEF	60
1343	Emil Hallfredsson	MID	60
1344	Aron Gunnarsson	MID	60
1345	Birkir Bjarnason	TEAM	60
1346	Jóhann Gudmundsson	TEAM	60
1347	Alfred Finnbogason	FWD	60
1348	Gylfi Sigurdsson	TEAM	60
1349	Albert Gudmundsson	TEAM	60
1350	Ólafur Skúlason	TEAM	60
1351	Jón Bödvarsson	TEAM	60
1352	Frederik Schram	TEAM	60
1353	Ari Skúlason	TEAM	60
1354	Arnór Traustason	TEAM	60
1355	Rúrik Gíslason	TEAM	60
1356	Sverrir Ingason	TEAM	60
1357	Björn Sigurdarson	TEAM	60
1358	Samúel Fridjónsson	TEAM	60
1359	Rúnar Rúnarsson	TEAM	60
1360	Hólmar Eyjólfsson	TEAM	60
1361	Pedro Gallese	GK	61
1362	Alberto Rodríguez	DEF	61
1363	Christian Ramos	DEF	61
1364	Miguel Trauco	DEF	61
1365	Luis Advíncula	DEF	61
1366	Christian Cueva	MID	61
1367	Yoshimar Yotún	TEAM	61
1368	Renato Tapia	TEAM	61
1369	Jefferson Farfán	FWD	61
1370	Edison Flores	TEAM	61
1371	André Carrillo	TEAM	61
1372	Nilson Loyola	TEAM	61
1373	Pedro Aquino	TEAM	61
1374	Aldo Corzo	TEAM	61
1375	José Carvallo	TEAM	61
1376	Raúl Ruidíaz	TEAM	61
1377	Paolo Hurtado	TEAM	61
1378	Carlos Cáceda	TEAM	61
1379	Anderson Santamaría	TEAM	61
1380	Andy Polo	TEAM	61
1381	Wilder Cartagena	TEAM	61
1382	Miguel Araujo	TEAM	61
1383	Paolo Guerrero	TEAM	61
1384	Kasper Schmeichel	GK	54
1385	Andreas Christensen	DEF	54
1386	Simon Kjaer	DEF	54
1387	Jens Stryger Larsen	DEF	54
1388	Henrik Dalsgaard	DEF	54
1389	Christian Eriksen	MID	54
1390	Thomas Delaney	TEAM	54
1391	William Kvist	TEAM	54
1392	Nicolai Jørgensen	FWD	54
1393	Pione Sisto	TEAM	54
1394	Yussuf Poulsen	TEAM	54
1395	Lasse Schöne	TEAM	54
1396	Jonas Knudsen	TEAM	54
1397	Mathias Jørgensen	TEAM	54
1398	Kasper Dolberg	TEAM	54
1399	Lukas Lerager	TEAM	54
1400	Martin Braithwaite	TEAM	54
1401	Jannik Vestergaard	TEAM	54
1402	Michael Krohn-Dehli	TEAM	54
1403	Frederik Ronnow	TEAM	54
1404	Andreas Cornelius	TEAM	54
1405	Viktor Fischer	TEAM	54
1406	Jonas Lössl	TEAM	54
1407	Danijel Subasic	GK	48
1408	Domagoj Vida	DEF	48
1409	Dejan Lovren	DEF	48
1410	Ivan Strinic	DEF	48
1411	Sime Vrsaljko	DEF	48
1412	Andrej Kramaric	MID	48
1413	Luka Modric	TEAM	48
1414	Ivan Rakitić	TEAM	48
1415	Mario Mandzukic	FWD	48
1416	Ante Rebic	TEAM	48
1417	Ivan Perisic	TEAM	48
1418	Vedran Corluka	TEAM	48
1419	Dominik Livakovic	TEAM	48
1420	Milan Badelj	TEAM	48
1421	Nikola Kalinic	TEAM	48
1422	Marko Pjaca	TEAM	48
1423	Marcelo Brozovic	TEAM	48
1424	Lovre Kalinic	TEAM	48
1425	Duje Caleta-Car	TEAM	48
1426	Filip Bradaric	TEAM	48
1427	Josip Pivaric	TEAM	48
1428	Mateo Kovacic	TEAM	48
1429	Tin Jedvaj	TEAM	48
1430	Francis Uzoho	GK	59
1431	Leon Balogun	DEF	59
1432	William Troost-Ekong	DEF	59
1433	Brian Idowu	DEF	59
1434	Abdullahi Shehu	DEF	59
1435	John Obi Mikel	MID	59
1436	Peter Etebo	TEAM	59
1437	Wilfred Ndidi	TEAM	59
1438	Odion Ighalo	FWD	59
1439	Victor Moses	TEAM	59
1440	Alex Iwobi	TEAM	59
1441	Chidozie Awaziem	TEAM	59
1442	Ikechukwu Ezenwa	TEAM	59
1443	Joel Obi	TEAM	59
1444	Elderson Echiéjilé	TEAM	59
1445	Tyronne Ebuehi	TEAM	59
1446	John Ogu	TEAM	59
1447	Simy	TEAM	59
1448	Kelechi Iheanacho	TEAM	59
1449	Daniel Akpeyi	TEAM	59
1450	Ogenyi Onazi	TEAM	59
1451	Ahmed Musa	TEAM	59
1452	Kenneth Omeruo	TEAM	59
1453	Keylor Navas	GK	55
1454	Giancarlo González	DEF	55
1455	Óscar Duarte	DEF	55
1456	Johnny Acosta	DEF	55
1457	David Guzmán	MID	55
1458	Celso Borges	MID	55
1459	Francisco Calvo	TEAM	55
1460	Cristian Gamboa	TEAM	55
1461	Marco Ureña	FWD	55
1462	Johan Venegas	TEAM	55
1463	Bryan Ruiz	TEAM	55
1464	Christian Bolaños	TEAM	55
1465	Ian Smith	TEAM	55
1466	Leonel Moreira	TEAM	55
1467	Bryan Oviedo	TEAM	55
1468	Kendall Waston	TEAM	55
1469	Kenner Gutiérrez	TEAM	55
1470	Daniel Colindres	TEAM	55
1471	Patrick Pemberton	TEAM	55
1472	Randall Azofeifa	TEAM	55
1473	Rodney Wallace	TEAM	55
1474	Joel Campbell	TEAM	55
1475	Yeltsin Tejeda	TEAM	55
1476	Vladimir Stojkovic	GK	56
1477	Dusko Tosic	DEF	56
1478	Nikola Milenkovic	DEF	56
1479	Aleksandar Kolarov	DEF	56
1480	Branislav Ivanovic	DEF	56
1481	Sergej Milinkovic-Savic	MID	56
1482	Nemanja Matic	TEAM	56
1483	Luka Milivojevic	TEAM	56
1484	Aleksandar Mitrovic	FWD	56
1485	Adem Ljajic	TEAM	56
1486	Dusan Tadic	TEAM	56
1487	Aleksandar Prijovic	TEAM	56
1488	Andrija Zivkovic	TEAM	56
1489	Milos Veljkovic	TEAM	56
1490	Uros Spajic	TEAM	56
1491	Milan Rodic	TEAM	56
1492	Antonio Rukavina	TEAM	56
1493	Luka Jovic	TEAM	56
1494	Marko Grujic	TEAM	56
1495	Nemanja Radonjic	TEAM	56
1496	Filip Kostic	TEAM	56
1497	Marko Dmitrovic	TEAM	56
1498	Predrag Rajkovic	TEAM	56
1499	Mats Hummels	DEF	19
1500	Jérôme Boateng	DEF	19
1501	Marvin Plattenhardt	DEF	19
1502	Mesut Özil	MID	19
1503	Toni Kroos	TEAM	19
1504	Sami Khedira	TEAM	19
1505	Timo Werner	FWD	19
1506	Julian Draxler	TEAM	19
1507	Thomas Müller	TEAM	19
1508	Marco Reus	TEAM	19
1509	Matthias Ginter	TEAM	19
1510	Kevin Trapp	TEAM	19
1511	Julian Brandt	TEAM	19
1512	Ilkay Gündogan	TEAM	19
1513	Mario Gómez	TEAM	19
1514	Niklas Süle	TEAM	19
1515	Sebastian Rudy	TEAM	19
1516	Guillermo Ochoa	GK	3
1517	Héctor Moreno	DEF	3
1518	Hugo Ayala	DEF	3
1519	Carlos Salcedo	DEF	3
1520	Carlos Vela	MID	3
1521	Andrés Guardado	TEAM	3
1522	Héctor Herrera	TEAM	3
1523	Javier Hernández	FWD	3
1524	Miguel Layún	TEAM	3
1525	Javier Aquino	TEAM	3
1526	Jonathan dos Santos	TEAM	3
1527	Érick Gutiérrez	TEAM	3
1528	Giovani Dos Santos	TEAM	3
1529	Alfredo Talavera	TEAM	3
1530	Rafael Márquez	TEAM	3
1531	Jesús Corona	TEAM	3
1532	José Corona	TEAM	3
1533	Oribe Peralta	TEAM	3
1534	Marco Fabián	TEAM	3
1535	Alisson Becker	GK	11
1536	Miranda	DEF	11
1537	Thiago Silva	DEF	11
1538	Marcelo	DEF	11
1539	Philippe Coutinho	TEAM	11
1540	Paulinho	TEAM	11
1541	Gabriel Jesus	FWD	11
1542	Willian	TEAM	11
1543	Pedro Geromel	TEAM	11
1544	Douglas Costa	TEAM	11
1545	Taison	TEAM	11
1546	Fernandinho	TEAM	11
1547	Cássio	TEAM	11
1548	Renato Augusto	TEAM	11
1549	Filipe Luís	TEAM	11
1550	Fagner	TEAM	11
1551	Roberto Firmino	TEAM	11
1552	Yann Sommer	GK	10
1553	Fabian Schär	DEF	10
1554	Stephan Lichtsteiner	DEF	10
1555	Blerim Džemaili	MID	10
1556	Valon Behrami	TEAM	10
1557	Haris Seferovic	FWD	10
1558	Steven Zuber	TEAM	10
1559	Xherdan Shaqiri	TEAM	10
1560	Mario Gavranovic	TEAM	10
1561	Josip Drmic	TEAM	10
1562	Johan Djourou	TEAM	10
1563	Gelson Fernandes	TEAM	10
1564	Roman Bürki	TEAM	10
1565	Michael Lang	TEAM	10
1566	Francois Moubandje	TEAM	10
1567	Robin Olsen	GK	25
1568	Andreas Granqvist	DEF	25
1569	Pontus Jansson	DEF	25
1570	Ludwig Augustinsson	DEF	25
1571	Mikael Lustig	DEF	25
1572	Albin Ekdal	MID	25
1573	Sebastian Larsson	MID	25
1574	Emil Forsberg	TEAM	25
1575	Viktor Claesson	TEAM	25
1576	Ola Toivonen	TEAM	25
1577	Marcus Berg	TEAM	25
1578	Filip Helander	TEAM	25
1579	Emil Krafth	TEAM	25
1580	John Guidetti	TEAM	25
1581	Gustav Svensson	TEAM	25
1582	Jimmy Durmaz	TEAM	25
1583	Marcus Rohdén	TEAM	25
1584	Oscar Hiljemark	TEAM	25
1585	Isaac Kiese Thelin	TEAM	25
1586	Karl-Johan Johnsson	TEAM	25
1587	Martin Olsson	TEAM	25
1588	Jo Hyeon-Woo	GK	5
1589	Kim Young-Gwon	DEF	5
1590	Jang Hyun-Soo	DEF	5
1591	Park Joo-Ho	DEF	5
1592	Lee Yong	DEF	5
1593	Ki Sung-Yueng	MID	5
1594	Ja-Cheol Koo	TEAM	5
1595	Lee Jae-Sung	TEAM	5
1596	Kim Shin-Wook	FWD	5
1597	Son Heung-Min	TEAM	5
1598	Hwang Hee-Chan	TEAM	5
1599	Kim Jin-Hyeon	TEAM	5
1600	Moon Seon-Min	TEAM	5
1601	Lee Seung-Woo	TEAM	5
1602	Oh Ban-Suk	TEAM	5
1603	Yun Young-Sun	TEAM	5
1604	Go Yo-Han	TEAM	5
1605	Jung Seung-Hyun	TEAM	5
1606	Hong Chul	TEAM	5
1607	Ju Se-Jong	TEAM	5
1608	Kim Seung-Gyu	TEAM	5
1609	Jung Woo-Young	TEAM	5
1610	Kim Min-Woo	TEAM	5
1611	Dedryck Boyata	DEF	27
1612	Jan Vertonghen	DEF	27
1613	Toby Alderweireld	DEF	27
1614	Yannick Carrasco	TEAM	27
1615	Eden Hazard	TEAM	27
1616	Dries Mertens	TEAM	27
1617	Marouane Fellaini	TEAM	27
1618	Vincent Kompany	TEAM	27
1619	Simon Mignolet	TEAM	27
1620	Mousa Dembélé	TEAM	27
1621	Koen Casteels	TEAM	27
1622	Adnan Januzaj	TEAM	27
1623	Michy Batshuayi	TEAM	27
1624	Thorgan Hazard	TEAM	27
1625	Leander Dendoncker	TEAM	27
1626	Nacer Chadli	TEAM	27
1627	Jaime Penedo	GK	50
1628	Román Torres	DEF	50
1629	Gabriel Gómez	DEF	50
1630	Éric Davis	DEF	50
1631	Michael Murillo	DEF	50
1632	Aníbal Godoy	MID	50
1633	Armando Cooper	MID	50
1634	José Luis Rodríguez	TEAM	50
1635	Édgar Bárcenas	TEAM	50
1636	Blas Pérez	FWD	50
1637	Adolfo Machado	TEAM	50
1638	Gabriel Torres	TEAM	50
1639	Valentín Pimentel	TEAM	50
1640	Harold Cummings	TEAM	50
1641	Luis Ovalle	TEAM	50
1642	Ricardo Ávila	TEAM	50
1643	Álex Rodríguez	TEAM	50
1644	Felipe Baloy	TEAM	50
1645	Ismael Díaz	TEAM	50
1646	Luis Tejada	TEAM	50
1647	Abdiel Arroyo	TEAM	50
1648	José Calderón	TEAM	50
1649	Mouez Hassen	GK	26
1650	Syam Ben Youssef	DEF	26
1651	Ali Maâloul	DEF	26
1652	Dylan Bronn	DEF	26
1653	Anice Badri	MID	26
1654	Fakhreddine Ben Youssef	TEAM	26
1655	Wahbi Khazri	FWD	26
1656	Mohamed Ben Amor	TEAM	26
1657	Saber Khalifa	TEAM	26
1658	Ghaylen Chaaleli	TEAM	26
1659	Hamdi Naguez	TEAM	26
1660	Oussama Haddadi	TEAM	26
1661	Rami Bedoui	TEAM	26
1662	Ahmed Khalil	TEAM	26
1663	Farouk Ben Mustapha	TEAM	26
1664	Yohan Benalouane	TEAM	26
1665	Aymen Mathlouthi	TEAM	26
1666	Bassem Srarfi	TEAM	26
1667	Saif-Eddine Khaoui	TEAM	26
1668	Eric Dier	TEAM	47
1669	Nick Pope	TEAM	47
1670	Phil Jones	TEAM	47
1671	Jack Butland	TEAM	47
1672	Gary Cahill	TEAM	47
1673	Danny Welbeck	TEAM	47
1674	Danny Rose	TEAM	47
1675	Jamie Vardy	TEAM	47
1676	Fabian Delph	TEAM	47
1677	Ruben Loftus-Cheek	TEAM	47
1678	Harry Maguire	DEF	47
1679	Kyle Walker	DEF	47
1680	Dele Alli	MID	47
1681	Jesse Lingard	MID	47
1682	Ashley Young	TEAM	47
1683	Kieran Trippier	TEAM	47
1684	Raheem Sterling	TEAM	47
1685	Óscar Murillo	DEF	46
1686	Davinson Sánchez	DEF	46
1687	Carlos Sánchez	TEAM	46
1688	Radamel Falcao	FWD	46
1689	José Izquierdo	TEAM	46
1690	Juan Cuadrado	TEAM	46
1691	Luis Muriel	TEAM	46
1692	Abel Aguilar	TEAM	46
1693	Mateus Uribe	TEAM	46
1694	José Cuadrado	TEAM	46
1695	Farid Díaz	TEAM	46
1696	Miguel Borja	TEAM	46
1697	Carlos Bacca	TEAM	46
1698	Cristián Zapata	TEAM	46
1699	Wilmar Barrios	TEAM	46
1700	Eiji Kawashima	GK	24
1701	Gen Shoji	DEF	24
1702	Maya Yoshida	DEF	24
1703	Yuto Nagatomo	DEF	24
1704	Hiroki Sakai	DEF	24
1705	Shinji Kagawa	MID	24
1706	Makoto Hasebe	TEAM	24
1707	Gaku Shibasaki	TEAM	24
1708	Yuya Osako	FWD	24
1709	Takashi Inui	TEAM	24
1710	Genki Haraguchi	TEAM	24
1711	Takashi Usami	TEAM	24
1712	Shinji Okazaki	TEAM	24
1713	Keisuke Honda	TEAM	24
1714	Kosuke Nakamura	TEAM	24
1715	Naomichi Ueda	TEAM	24
1716	Masaaki Higashiguchi	TEAM	24
1717	Wataru Endo	TEAM	24
1718	Ryota Oshima	TEAM	24
1719	Yoshinori Muto	TEAM	24
1720	Gotoku Sakai	TEAM	24
1721	Tomoaki Makino	TEAM	24
1722	Hotaru Yamaguchi	TEAM	24
1723	Wojciech Szczesny	GK	53
1724	Michal Pazdan	DEF	53
1725	Thiago Cionek	DEF	53
1726	Maciej Rybus	DEF	53
1727	Lukasz Piszczek	DEF	53
1728	Arkadiusz Milik	MID	53
1729	Piotr Zielinski	TEAM	53
1730	Grzegorz Krychowiak	TEAM	53
1731	Robert Lewandowski	FWD	53
1732	Kamil Grosicki	TEAM	53
1733	Jakub Blaszczykowski	TEAM	53
1734	Bartosz Bereszynski	TEAM	53
1735	Kamil Glik	TEAM	53
1736	Slawomir Peszko	TEAM	53
1737	Rafal Kurzawa	TEAM	53
1738	Lukasz Teodorczyk	TEAM	53
1739	Artur Jedrzejczyk	TEAM	53
1740	Dawid Kownacki	TEAM	53
1741	Lukasz Fabianski	TEAM	53
1742	Karol Linetty	TEAM	53
1743	Jan Bednarek	TEAM	53
1744	Bartosz Bialkowski	TEAM	53
1745	Jacek Góralski	TEAM	53
1746	Khadim N'Diaye	GK	36
1747	Salif Sané	DEF	36
1748	Youssouf Sabaly	DEF	36
1749	Moussa Wagué	DEF	36
1750	Alfred N'Diaye	MID	36
1751	Idrissa Gueye	MID	36
1752	M'Baye Niang	TEAM	36
1753	Mame Biram Diouf	TEAM	36
1754	Cheikhou Kouyaté	TEAM	36
1755	Moussa Sow	TEAM	36
1756	Alfred Gomis	TEAM	36
1757	Keita Baldé	TEAM	36
1758	Kara Mbodji	TEAM	36
1759	Abdoulaye Diallo	TEAM	36
1760	Badou N'Diaye	TEAM	36
1761	Cheikh N'Doye	TEAM	36
1762	Moussa Konaté	TEAM	36
1763	Lamine Gassama	TEAM	36
1764	Adama Mbengué	TEAM	36
1765	Diafra Sakho	TEAM	36
1766	Saeid Ezatolahi	DEF	29
1767	Fred	TEAM	11
1768	Thomas Vermaelen	TEAM	27
1769	Jonas Hector	DEF	19
1770	Saad Al-Sheeb	GK	9
1771	Abdelkarim Hassan	DEF	9
1772	Bassam Al-Rawi	DEF	9
1773	Ró-Ró	DEF	9
1774	Akram Afif	TEAM	9
1775	Naif Al Hadhrami	TEAM	9
1776	Salem Al-Hajri	TEAM	9
1777	Musaab Khidir	TEAM	9
1778	Mohammed Muntari	TEAM	9
1779	Khalid Muneer	TEAM	9
1780	Moustafa Tarek Mashal	TEAM	9
1781	Yousof Hassan	TEAM	9
1782	Jassem Gaber	TEAM	9
1783	Ismail Mohamad	TEAM	9
1784	Ahmed Alaaeldin	TEAM	9
1785	Ali Asad	TEAM	9
1786	Félix Torres	DEF	22
1787	Jhegson Méndez	MID	22
1788	Romario Ibarra	TEAM	22
1789	Michael Estrada	TEAM	22
1790	Robert Arboleda	TEAM	22
1791	Jeremy Sarmiento	TEAM	22
1792	Moisés Ramírez	TEAM	22
1793	José Cifuentes	TEAM	22
1794	Alexander Domínguez	TEAM	22
1795	Carlos Gruezo	TEAM	22
1796	Djorkaeff Reasco	TEAM	22
1797	Ángel Mena	TEAM	22
1798	Diego Palacios	TEAM	22
1799	Jackson Porozo	TEAM	22
1800	Xavier Arreaga	TEAM	22
1801	Ayrton Preciado	TEAM	22
1802	Kevin Rodríguez	TEAM	22
1803	Luke Shaw	DEF	47
1804	Mason Mount	MID	47
1805	Ben White	TEAM	47
1806	Jack Grealish	TEAM	47
1807	Aaron Ramsdale	TEAM	47
1808	Kalvin Phillips	TEAM	47
1809	Conor Coady	TEAM	47
1810	Conor Gallagher	TEAM	47
1811	Callum Wilson	TEAM	47
1812	Ali Karimi	MID	29
1813	Ahmad Noorollahi	MID	29
1814	Abolfazl Jalali	TEAM	29
1815	Shoja Khalilzadeh	TEAM	29
1816	Payam Niazmand	TEAM	29
1817	Hossein Hosseini	TEAM	29
1818	Hossein Kanani	TEAM	29
1819	Pape Abou Cissé	DEF	36
1820	Abdou Diallo	DEF	36
1821	Nampalys Mendy	TEAM	36
1822	Seny Dieng	TEAM	36
1823	Bamba Dieng	TEAM	36
1824	Famara Diédhiou	TEAM	36
1825	Pathé Ciss	TEAM	36
1826	Mamadou Loum	TEAM	36
1827	Moustapha Name	TEAM	36
1828	Formose Mendy	TEAM	36
1829	Fodé Ballo-Touré	TEAM	36
1830	N'Diaye Moussa	TEAM	36
1831	Andries Noppert	GK	23
1832	Matthijs de Ligt	DEF	23
1833	Steven Berghuis	MID	23
1834	Daley Blind	TEAM	23
1835	Steven Bergwijn	TEAM	23
1836	Vincent Janssen	TEAM	23
1837	Remko Pasveer	TEAM	23
1838	Luuk de Jong	TEAM	23
1839	Tyrell Malacia	TEAM	23
1840	Davy Klaassen	TEAM	23
1841	Marten de Roon	TEAM	23
1842	Kenneth Taylor	TEAM	23
1843	Walker Zimmerman	DEF	15
1844	Sergiño Dest	DEF	15
1845	Yunus Musah	TEAM	15
1846	Josh Sargent	FWD	15
1847	Kellyn Acosta	TEAM	15
1848	Luca de la Torre	TEAM	15
1849	Sean Johnson	TEAM	15
1850	Cameron Carter-Vickers	TEAM	15
1851	Ethan Horvath	TEAM	15
1852	Jordan Morris	TEAM	15
1853	Jesús Ferreira	TEAM	15
1854	Shaq Moore	TEAM	15
1855	DeAndre Yedlin	TEAM	15
1856	Aaron Long	TEAM	15
1857	Wayne Hennessey	GK	52
1858	Joe Rodon	DEF	52
1859	Ben Davies	DEF	52
1860	Chris Mepham	DEF	52
1861	Harry Wilson	MID	52
1862	Aaron Ramsey	MID	52
1863	Ethan Ampadu	MID	52
1864	Neco Williams	TEAM	52
1865	Connor Roberts	TEAM	52
1866	Daniel James	TEAM	52
1867	Gareth Bale	TEAM	52
1868	Joe Allen	TEAM	52
1869	Adam Rhys Davies	TEAM	52
1870	Joe Morrell	TEAM	52
1871	Chris Gunter	TEAM	52
1872	Sorba Thomas	TEAM	52
1873	Kieffer Moore	TEAM	52
1874	Tom Lockyer	TEAM	52
1875	Danny Ward	TEAM	52
1876	Brennan Johnson	TEAM	52
1877	Dylan Levitt	TEAM	52
1878	Jonny Williams	TEAM	52
1879	Rubin Colwill	TEAM	52
1880	Ben Cabango	TEAM	52
1881	Matt Smith	TEAM	52
1882	Mark Harris	TEAM	52
1883	Alejandro Gómez	TEAM	39
1884	Thiago Almada	TEAM	39
1885	Lisandro Martínez	TEAM	39
1886	Gerónimo Rulli	TEAM	39
1887	Germán Pezzella	TEAM	39
1888	Guido Rodríguez	TEAM	39
1889	Juan Foyth	TEAM	39
1890	Gonzalo Montiel	TEAM	39
1891	Ángel Correa	TEAM	39
1892	Hassan Al-Tombakti	DEF	33
1893	Abdulelah Al-Malki	DEF	33
1894	Feras Al-Brikan	TEAM	33
1895	Saleh Al-Shehri	FWD	33
1896	Nawaf Al-Abid	TEAM	33
1897	Nawaf Al-Aqidi	TEAM	33
1898	Sami Al-Najei	TEAM	33
1899	Mohammed Al-Yami	TEAM	33
1900	Abdullah Madu	TEAM	33
1901	Ali Al-Hassan	TEAM	33
1902	Abdulrahman Al-Obud	TEAM	33
1903	Haitham Asiri	TEAM	33
1904	Abdulelah Al-Amri	TEAM	33
1905	Nasser Al-Dawsari	TEAM	33
1906	Sultan Al-Ghannam	TEAM	33
1907	Joachim Andersen	DEF	54
1908	Pierre-Emile Højbjerg	MID	54
1909	Joakim Maehle	TEAM	54
1910	Rasmus Kristensen	TEAM	54
1911	Andreas Skov Olsen	TEAM	54
1912	Christian Nørgaard	TEAM	54
1913	Victor Nelsson	TEAM	54
1914	Robert Skov	TEAM	54
1915	Daniel Wass	TEAM	54
1916	Alexander Bah	TEAM	54
1917	Jonas Wind	TEAM	54
1918	Mikkel Damsgaard	TEAM	54
1919	Jesper Lindstrom	TEAM	54
1920	Oliver Christensen	TEAM	54
1921	Mathias Jensen	TEAM	54
1922	Mohamed Drager	TEAM	26
1923	Issam Jebali	FWD	26
1924	Youssef Msakni	TEAM	26
1925	Wajdi Kechrida	TEAM	26
1926	Taha Yassine Khenissi	TEAM	26
1927	Seifeddine Jaziri	TEAM	26
1928	Nader Ghandri	TEAM	26
1929	Bilel Ifa	TEAM	26
1930	Luis Chávez	TEAM	3
1931	Henry Martín	FWD	3
1932	Luis Romo	TEAM	3
1933	Uriel Antuna	TEAM	3
1934	Rogelio Funes Mori	TEAM	3
1935	Néstor Araujo	TEAM	3
1936	Gerardo Arteaga	TEAM	3
1937	Rodolfo Cota	TEAM	3
1938	Kevin Álvarez	TEAM	3
1939	Jakub Kiwior	DEF	53
1940	Matty Cash	DEF	53
1941	Sebastian Szymanski	MID	53
1942	Nicola Zalewski	TEAM	53
1943	Jakub Kaminski	TEAM	53
1944	Mateusz Wieteska	TEAM	53
1945	Przemyslaw Frankowski	TEAM	53
1946	Kamil Grabara	TEAM	53
1947	Michal Skoras	TEAM	53
1948	Krzysztof Piatek	TEAM	53
1949	Robert Gumny	TEAM	53
1950	Szymon Zurkowski	TEAM	53
1951	Lukasz Skorupski	TEAM	53
1952	Damian Szymanski	TEAM	53
1953	Krystian Bielik	TEAM	53
1954	Karol Swiderski	TEAM	53
1955	Axel Disasi	TEAM	35
1956	Randal Kolo Muani	TEAM	35
1957	Jordan Veretout	TEAM	35
1958	Youssouf Fofana	TEAM	35
1959	Matteo Guendouzi	TEAM	35
1960	Kye Rowles	DEF	17
1961	Nathaniel Atkinson	DEF	17
1962	Mitchell Duke	FWD	17
1963	Joel King	TEAM	17
1964	Andrew Redmayne	TEAM	17
1965	Fran Karacic	TEAM	17
1966	Jason Cummings	TEAM	17
1967	Marco Tilio	TEAM	17
1968	Bailey Wright	TEAM	17
1969	Garang Kuol	TEAM	17
1970	Ajdin Hrustic	TEAM	17
1971	Awer Mabil	TEAM	17
1972	Cameron Devlin	TEAM	17
1973	Keanu Baccus	TEAM	17
1974	Thomas Deng	TEAM	17
1975	Selim Amallah	TEAM	12
1976	Sofiane Boufal	TEAM	12
1977	Yahya Jabrane	TEAM	12
1978	Abderrazak Hamdallah	TEAM	12
1979	Anass Zaroury	TEAM	12
1980	Abdelhamid Sabiri	TEAM	12
1981	Yahia Attiyat Allah	TEAM	12
1982	Walid Cheddira	TEAM	12
1983	Zakaria Aboukhlal	TEAM	12
1984	Badr Benoun	TEAM	12
1985	Ilias Chair	TEAM	12
1986	Achraf Dari	TEAM	12
1987	Josko Gvardiol	DEF	48
1988	Borna Sosa	DEF	48
1989	Josip Juranovic	DEF	48
1990	Marko Livaja	TEAM	48
1991	Borna Barisic	TEAM	48
1992	Ivo Grbic	TEAM	48
1993	Bruno Petkovic	TEAM	48
1994	Josip Sutalo	TEAM	48
1995	Mislav Orsic	TEAM	48
1996	Mario Pasalic	TEAM	48
1997	Luka Sucic	TEAM	48
1998	Kristijan Jakic	TEAM	48
1999	Ivica Ivusic	TEAM	48
2000	Thilo Kehrer	TEAM	19
2001	Christian Günter	TEAM	19
2002	Jonas Hofmann	TEAM	19
2003	Armel Bella-Kotchap	TEAM	19
2004	Niclas Füllkrug	TEAM	19
2005	Youssoufa Moukoko	TEAM	19
2006	Lukas Klostermann	TEAM	19
2007	Mario Götze	TEAM	19
2008	Shuichi Gonda	GK	24
2009	Kou Itakura	DEF	24
2010	Daizen Maeda	FWD	24
2011	Hidemasa Morita	TEAM	24
2012	Daniel Schmidt	TEAM	24
2013	Takehiro Tomiyasu	TEAM	24
2014	Miki Yamane	TEAM	24
2015	Takuma Asano	TEAM	24
2016	Hiroki Ito	TEAM	24
2017	Kaoru Mitoma	TEAM	24
2018	Gavi	TEAM	31
2019	Hugo Guillamón	TEAM	31
2020	Carlos Soler	TEAM	31
2021	Yéremy Pino	TEAM	31
2022	Eric García	TEAM	31
2023	David Raya	TEAM	31
2024	Pablo Sarabia	TEAM	31
2025	Marcos Llorente	TEAM	31
2026	Alejandro Balde	TEAM	31
2027	Pau Torres	TEAM	31
2028	Ansu Fati	TEAM	31
2029	Robert Sánchez	TEAM	31
2030	Carlos Martinez	DEF	55
2031	Jewison Bennette	TEAM	55
2032	Keysher Fuller	TEAM	55
2033	Anthony Contreras	TEAM	55
2034	Juan Pablo Vargas	TEAM	55
2035	Roan Wilson	TEAM	55
2036	Gerson Torres	TEAM	55
2037	Esteban Alvarado	TEAM	55
2038	Brandon Aguilera	TEAM	55
2039	Daniel Chacón	TEAM	55
2040	Patrick Sequeira	TEAM	55
2041	Álvaro Zamora	TEAM	55
2042	Anthony Hernandez	TEAM	55
2043	Douglas López	TEAM	55
2044	Rónald Matarrita	TEAM	55
2045	Youstin Salas	TEAM	55
2046	Wout Faes	TEAM	27
2047	Milan Borjan	GK	7
2048	Steven Vitória	DEF	7
2049	Stephen Eustáquio	MID	7
2050	Atiba Hutchinson	MID	7
2051	Junior Hoilett	TEAM	7
2052	Mark-Anthony Kaye	TEAM	7
2053	Ike Ugbo	TEAM	7
2054	James Pantemis	TEAM	7
2055	Liam Fraser	TEAM	7
2056	Samuel Piette	TEAM	7
2057	Sam Adekugbe	TEAM	7
2058	Lucas Cavallini	TEAM	7
2059	David Wotherspoon	TEAM	7
2060	Joel Waterman	TEAM	7
2061	Rubén Vargas	TEAM	10
2062	Fabian Frei	TEAM	10
2063	Philipp Köhn	TEAM	10
2064	Jonas Omlin	TEAM	10
2065	Edimilson Fernandes	TEAM	10
2066	André Onana	GK	57
2067	Nicolas Nkoulou	DEF	57
2068	Jean-Charles Castelletto	DEF	57
2069	Nouhou Tolo	DEF	57
2070	Collins Fai	DEF	57
2071	Samuel Oum Gouet	MID	57
2072	Martin Hongla	TEAM	57
2073	Frank Anguissa	TEAM	57
2074	Eric Maxim Choupo-Moting	FWD	57
2075	Karl Toko Ekambi	TEAM	57
2076	Bryan Mbeumo	TEAM	57
2077	Devis Epassy	TEAM	57
2078	Georges-Kévin N'Koudou	TEAM	57
2079	Jean-Pierre Nsame	TEAM	57
2080	Nicolas Moumi Ngamaleu	TEAM	57
2081	Vincent Aboubakar	TEAM	57
2082	Jerome Ngom Mbekeli	TEAM	57
2083	Pierre Kunde	TEAM	57
2084	Christian Bassogog	TEAM	57
2085	Enzo Ebosse	TEAM	57
2086	Olivier Ntcham	TEAM	57
2087	Souaibou Marou	TEAM	57
2088	Simon Ngapandouentnbu	TEAM	57
2089	Christopher Wooh	TEAM	57
2090	Olivier Mbaizo	TEAM	57
2091	Gaël Ondoua	TEAM	57
2092	Nicolás de la Cruz	TEAM	34
2093	José Luis Rodríguez	TEAM	34
2094	Agustín Canobbio	TEAM	34
2095	Sebastián Sosa	TEAM	34
2096	Facundo Torres	TEAM	34
2097	Matías Viña	TEAM	34
2098	Kim Min-Jae	DEF	5
2099	Kim Jin-Su	DEF	5
2100	Hwang In-Beom	TEAM	5
2101	Hwang Ui-Jo	FWD	5
2102	Na Sang-Ho	TEAM	5
2103	Cho Yu-Min	TEAM	5
2104	Paik Seung-Ho	TEAM	5
2105	Kim Tae-Hwan	TEAM	5
2106	Yoon Jong-Gyu	TEAM	5
2107	Son Jun-Ho	TEAM	5
2108	Kwon Kyung-Won	TEAM	5
2109	Cho Gue-Sung	TEAM	5
2110	Lee Kang-in	TEAM	5
2111	Jeong Woo-Yeong	TEAM	5
2112	Song Min-Kyu	TEAM	5
2113	Kwon Chang-Hoon	TEAM	5
2114	Danilo Pereira	DEF	43
2115	Otávio	TEAM	43
2116	António Silva	TEAM	43
2117	João Palhinha	TEAM	43
2118	Ricardo Horta	TEAM	43
2119	Daniel Amartey	DEF	49
2120	Abdul Rahman Baba	DEF	49
2121	Iñaki Williams	TEAM	49
2122	Ibrahim Danlad	TEAM	49
2123	Fatawu Issahaku	TEAM	49
2124	Elisha Owusu	TEAM	49
2125	Abdul Manaf Nurudeen	TEAM	49
2126	Daniel Afriyie Barnieh	TEAM	49
2127	Denis Odoi	TEAM	49
2128	Daniel-Kofi Kyereh	TEAM	49
2129	Joseph Aidoo	TEAM	49
2130	Kamal Sowah	TEAM	49
2131	Richarlison 	FWD	11
2132	Éverton Ribeiro	TEAM	11
2133	Alex Telles	TEAM	11
2134	Dani Alves	TEAM	11
2135	Antony	TEAM	11
2136	Pedro	TEAM	11
2137	Vanja Milinkovic-Savic	GK	56
2138	Strahinja Pavlovic	DEF	56
2139	Nemanja Gudelj	MID	56
2140	Sasa Lukic	MID	56
2141	Filip Mladenovic	TEAM	56
2142	Darko Lazovic	TEAM	56
2143	Nemanja Maksimovic	TEAM	56
2144	Uros Racic	TEAM	56
2145	Strahinja Erakovic	TEAM	56
2146	Ivan Ilic	TEAM	56
2147	Srjdan Babic	TEAM	56
2148	Filip Djuricic	TEAM	56
2149	Dusan Vlahovic	TEAM	56
2150	Stefan Mitrovic	TEAM	56
2151	Renato Steffen	TEAM	10
2152	James Maddison	TEAM	47
2153	Riyadh Sharahili	TEAM	33
2154	Richarlison	FWD	11
\.


ALTER TABLE public.jogadores ENABLE TRIGGER ALL;

--
-- Data for Name: convocacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.convocacoes DISABLE TRIGGER ALL;

COPY public.convocacoes (id_jogador, id_selecao, id_edicao, numero_camisa) FROM stdin;
684	41	1	\N
685	41	1	\N
686	41	1	\N
688	41	1	\N
689	41	1	\N
690	41	1	\N
687	41	1	\N
691	41	1	\N
694	41	1	\N
693	41	1	\N
695	41	1	\N
697	41	1	\N
692	41	1	\N
699	41	1	\N
698	41	1	\N
696	41	1	\N
701	41	1	\N
700	41	1	\N
432	27	1	\N
438	27	1	\N
436	27	1	\N
434	27	1	\N
437	27	1	\N
433	27	1	\N
435	27	1	\N
444	27	1	\N
439	27	1	\N
443	27	1	\N
441	27	1	\N
440	27	1	\N
449	27	1	\N
447	27	1	\N
442	27	1	\N
445	27	1	\N
446	27	1	\N
93	8	1	\N
96	8	1	\N
95	8	1	\N
92	8	1	\N
94	8	1	\N
100	8	1	\N
97	8	1	\N
102	8	1	\N
99	8	1	\N
101	8	1	\N
104	8	1	\N
98	8	1	\N
106	8	1	\N
108	8	1	\N
105	8	1	\N
107	8	1	\N
103	8	1	\N
145	11	1	\N
147	11	1	\N
150	11	1	\N
149	11	1	\N
151	11	1	\N
153	11	1	\N
154	11	1	\N
152	11	1	\N
161	11	1	\N
156	11	1	\N
159	11	1	\N
160	11	1	\N
155	11	1	\N
522	32	1	\N
526	32	1	\N
525	32	1	\N
523	32	1	\N
535	32	1	\N
527	32	1	\N
529	32	1	\N
533	32	1	\N
532	32	1	\N
528	32	1	\N
530	32	1	\N
536	32	1	\N
534	32	1	\N
538	32	1	\N
537	32	1	\N
738	44	1	\N
741	44	1	\N
742	44	1	\N
743	44	1	\N
740	44	1	\N
739	44	1	\N
749	44	1	\N
744	44	1	\N
747	44	1	\N
746	44	1	\N
748	44	1	\N
745	44	1	\N
754	44	1	\N
751	44	1	\N
750	44	1	\N
755	44	1	\N
753	44	1	\N
752	44	1	\N
810	48	1	\N
811	48	1	\N
813	48	1	\N
812	48	1	\N
815	48	1	\N
814	48	1	\N
817	48	1	\N
818	48	1	\N
821	48	1	\N
816	48	1	\N
822	48	1	\N
819	48	1	\N
823	48	1	\N
826	48	1	\N
825	48	1	\N
824	48	1	\N
307	20	1	\N
309	20	1	\N
308	20	1	\N
311	20	1	\N
312	20	1	\N
313	20	1	\N
314	20	1	\N
317	20	1	\N
316	20	1	\N
315	20	1	\N
318	20	1	\N
321	20	1	\N
323	20	1	\N
319	20	1	\N
324	20	1	\N
320	20	1	\N
322	20	1	\N
450	28	1	\N
465	28	1	\N
451	28	1	\N
455	28	1	\N
453	28	1	\N
456	28	1	\N
459	28	1	\N
460	28	1	\N
462	28	1	\N
461	28	1	\N
458	28	1	\N
466	28	1	\N
464	28	1	\N
467	28	1	\N
792	47	1	\N
799	47	1	\N
797	47	1	\N
793	47	1	\N
798	47	1	\N
795	47	1	\N
794	47	1	\N
800	47	1	\N
803	47	1	\N
801	47	1	\N
807	47	1	\N
809	47	1	\N
808	47	1	\N
804	47	1	\N
806	47	1	\N
576	35	1	\N
582	35	1	\N
577	35	1	\N
581	35	1	\N
579	35	1	\N
580	35	1	\N
578	35	1	\N
586	35	1	\N
583	35	1	\N
585	35	1	\N
587	35	1	\N
588	35	1	\N
593	35	1	\N
589	35	1	\N
590	35	1	\N
293	19	1	\N
290	19	1	\N
294	19	1	\N
291	19	1	\N
292	19	1	\N
300	19	1	\N
297	19	1	\N
299	19	1	\N
298	19	1	\N
301	19	1	\N
304	19	1	\N
303	19	1	\N
306	19	1	\N
181	13	1	\N
189	13	1	\N
185	13	1	\N
182	13	1	\N
186	13	1	\N
184	13	1	\N
188	13	1	\N
183	13	1	\N
191	13	1	\N
190	13	1	\N
196	13	1	\N
193	13	1	\N
198	13	1	\N
197	13	1	\N
194	13	1	\N
195	13	1	\N
325	21	1	\N
329	21	1	\N
326	21	1	\N
328	21	1	\N
327	21	1	\N
331	21	1	\N
332	21	1	\N
334	21	1	\N
333	21	1	\N
335	21	1	\N
341	21	1	\N
339	21	1	\N
342	21	1	\N
340	21	1	\N
361	23	1	\N
362	23	1	\N
366	23	1	\N
365	23	1	\N
367	23	1	\N
368	23	1	\N
363	23	1	\N
371	23	1	\N
369	23	1	\N
370	23	1	\N
364	23	1	\N
373	23	1	\N
377	23	1	\N
378	23	1	\N
376	23	1	\N
486	30	1	\N
487	30	1	\N
488	30	1	\N
490	30	1	\N
492	30	1	\N
489	30	1	\N
493	30	1	\N
491	30	1	\N
496	30	1	\N
494	30	1	\N
498	30	1	\N
500	30	1	\N
503	30	1	\N
502	30	1	\N
495	30	1	\N
501	30	1	\N
499	30	1	\N
497	30	1	\N
630	38	1	\N
634	38	1	\N
633	38	1	\N
631	38	1	\N
636	38	1	\N
632	38	1	\N
635	38	1	\N
637	38	1	\N
638	38	1	\N
641	38	1	\N
639	38	1	\N
647	38	1	\N
646	38	1	\N
645	38	1	\N
642	38	1	\N
640	38	1	\N
847	50	1	\N
846	50	1	\N
851	50	1	\N
849	50	1	\N
850	50	1	\N
853	50	1	\N
852	50	1	\N
855	50	1	\N
854	50	1	\N
857	50	1	\N
856	50	1	\N
862	50	1	\N
858	50	1	\N
861	50	1	\N
859	50	1	\N
860	50	1	\N
727	43	1	\N
721	43	1	\N
720	43	1	\N
723	43	1	\N
722	43	1	\N
724	43	1	\N
725	43	1	\N
726	43	1	\N
728	43	1	\N
729	43	1	\N
730	43	1	\N
731	43	1	\N
732	43	1	\N
736	43	1	\N
737	43	1	\N
733	43	1	\N
734	43	1	\N
735	43	1	\N
199	14	1	\N
203	14	1	\N
207	14	1	\N
205	14	1	\N
204	14	1	\N
200	14	1	\N
201	14	1	\N
206	14	1	\N
202	14	1	\N
211	14	1	\N
212	14	1	\N
213	14	1	\N
210	14	1	\N
208	14	1	\N
209	14	1	\N
216	14	1	\N
214	14	1	\N
215	14	1	\N
38	5	1	\N
37	5	1	\N
39	5	1	\N
43	5	1	\N
42	5	1	\N
41	5	1	\N
40	5	1	\N
45	5	1	\N
48	5	1	\N
50	5	1	\N
47	5	1	\N
46	5	1	\N
49	5	1	\N
52	5	1	\N
53	5	1	\N
54	5	1	\N
51	5	1	\N
397	25	1	\N
399	25	1	\N
400	25	1	\N
407	25	1	\N
398	25	1	\N
402	25	1	\N
408	25	1	\N
406	25	1	\N
405	25	1	\N
403	25	1	\N
412	25	1	\N
401	25	1	\N
413	25	1	\N
411	25	1	\N
128	10	1	\N
127	10	1	\N
130	10	1	\N
133	10	1	\N
131	10	1	\N
129	10	1	\N
132	10	1	\N
134	10	1	\N
136	10	1	\N
135	10	1	\N
140	10	1	\N
142	10	1	\N
138	10	1	\N
137	10	1	\N
139	10	1	\N
141	10	1	\N
143	10	1	\N
144	10	1	\N
217	15	1	\N
220	15	1	\N
219	15	1	\N
222	15	1	\N
221	15	1	\N
218	15	1	\N
226	15	1	\N
230	15	1	\N
225	15	1	\N
231	15	1	\N
229	15	1	\N
224	15	1	\N
227	15	1	\N
234	15	1	\N
232	15	1	\N
884	41	1	\N
885	41	1	\N
886	41	1	\N
887	41	1	\N
888	41	1	\N
889	41	1	\N
890	41	1	\N
891	41	1	\N
892	27	1	\N
893	27	1	\N
894	27	1	\N
895	27	1	\N
896	27	1	\N
897	27	1	\N
898	27	1	\N
899	27	1	\N
900	27	1	\N
901	8	1	\N
902	8	1	\N
903	8	1	\N
904	8	1	\N
905	8	1	\N
906	8	1	\N
907	8	1	\N
908	8	1	\N
909	8	1	\N
910	11	1	\N
911	11	1	\N
912	11	1	\N
913	11	1	\N
914	11	1	\N
915	11	1	\N
916	11	1	\N
917	11	1	\N
918	11	1	\N
919	11	1	\N
920	11	1	\N
921	11	1	\N
922	11	1	\N
923	32	1	\N
924	32	1	\N
925	32	1	\N
926	32	1	\N
927	32	1	\N
928	32	1	\N
929	32	1	\N
930	32	1	\N
931	32	1	\N
932	32	1	\N
933	32	1	\N
934	44	1	\N
935	44	1	\N
936	44	1	\N
937	44	1	\N
938	44	1	\N
939	44	1	\N
940	44	1	\N
941	44	1	\N
942	48	1	\N
943	48	1	\N
944	48	1	\N
945	48	1	\N
946	48	1	\N
947	48	1	\N
948	48	1	\N
949	48	1	\N
950	48	1	\N
951	48	1	\N
952	20	1	\N
953	20	1	\N
954	20	1	\N
955	20	1	\N
956	20	1	\N
957	20	1	\N
958	20	1	\N
959	20	1	\N
960	20	1	\N
961	28	1	\N
962	28	1	\N
963	28	1	\N
964	28	1	\N
965	28	1	\N
966	28	1	\N
967	28	1	\N
968	28	1	\N
969	28	1	\N
970	28	1	\N
971	28	1	\N
972	28	1	\N
973	28	1	\N
974	47	1	\N
975	47	1	\N
976	47	1	\N
977	47	1	\N
978	47	1	\N
979	47	1	\N
980	47	1	\N
981	47	1	\N
982	47	1	\N
983	47	1	\N
984	47	1	\N
985	35	1	\N
986	35	1	\N
987	35	1	\N
988	35	1	\N
989	35	1	\N
990	35	1	\N
991	35	1	\N
992	35	1	\N
993	35	1	\N
994	35	1	\N
995	35	1	\N
996	19	1	\N
997	19	1	\N
998	19	1	\N
999	19	1	\N
1000	19	1	\N
1001	19	1	\N
1002	19	1	\N
1003	19	1	\N
1004	19	1	\N
1005	19	1	\N
1006	19	1	\N
1007	19	1	\N
1008	19	1	\N
1009	13	1	\N
1010	13	1	\N
1011	13	1	\N
1012	13	1	\N
1013	13	1	\N
1014	13	1	\N
1015	13	1	\N
1016	13	1	\N
1017	13	1	\N
1018	13	1	\N
1019	21	1	\N
1020	21	1	\N
1021	21	1	\N
1022	21	1	\N
1023	21	1	\N
1024	21	1	\N
1025	21	1	\N
1026	21	1	\N
1027	21	1	\N
1028	21	1	\N
1029	21	1	\N
1030	21	1	\N
1031	23	1	\N
1032	23	1	\N
1033	23	1	\N
1034	23	1	\N
1035	23	1	\N
1036	23	1	\N
1037	23	1	\N
1038	23	1	\N
1039	23	1	\N
1040	23	1	\N
1041	30	1	\N
1042	30	1	\N
1043	30	1	\N
1044	30	1	\N
1045	30	1	\N
1046	30	1	\N
1047	30	1	\N
1048	30	1	\N
1049	38	1	\N
1050	38	1	\N
666	40	1	\N
667	40	1	\N
668	40	1	\N
669	40	1	\N
670	40	1	\N
671	40	1	\N
672	40	1	\N
673	40	1	\N
674	40	1	\N
675	40	1	\N
676	40	1	\N
677	40	1	\N
678	40	1	\N
679	40	1	\N
680	40	1	\N
681	40	1	\N
682	40	1	\N
683	40	1	\N
648	39	1	\N
649	39	1	\N
650	39	1	\N
651	39	1	\N
652	39	1	\N
653	39	1	\N
654	39	1	\N
655	39	1	\N
656	39	1	\N
657	39	1	\N
658	39	1	\N
659	39	1	\N
660	39	1	\N
661	39	1	\N
662	39	1	\N
663	39	1	\N
664	39	1	\N
665	39	1	\N
253	17	1	\N
254	17	1	\N
255	17	1	\N
256	17	1	\N
257	17	1	\N
258	17	1	\N
259	17	1	\N
260	17	1	\N
261	17	1	\N
262	17	1	\N
263	17	1	\N
264	17	1	\N
265	17	1	\N
266	17	1	\N
267	17	1	\N
268	17	1	\N
269	17	1	\N
270	17	1	\N
1123	58	2	1
1124	58	2	4
1125	58	2	3
1126	58	2	18
1127	58	2	2
1128	58	2	9
1129	58	2	11
1130	58	2	8
1131	58	2	10
1132	58	2	17
1133	58	2	19
1134	58	2	16
1135	58	2	5
1136	58	2	20
1137	58	2	22
1138	58	2	13
1139	58	2	14
1140	58	2	15
1141	58	2	12
1142	58	2	7
1143	58	2	21
1144	58	2	23
1145	58	2	6
1146	33	2	1
1147	33	2	5
1148	33	2	3
1149	33	2	14
1150	33	2	13
1151	33	2	6
1152	33	2	7
1153	33	2	17
1154	33	2	18
1155	33	2	8
1156	33	2	10
1157	33	2	20
1158	33	2	4
1159	33	2	12
1160	33	2	15
1161	33	2	11
1162	33	2	2
1163	33	2	22
1164	33	2	21
1165	33	2	9
1166	33	2	23
1167	33	2	16
1168	33	2	19
1169	28	2	23
1170	28	2	6
1171	28	2	2
1172	28	2	13
1173	28	2	7
1174	28	2	19
1175	28	2	8
1176	28	2	17
1177	28	2	9
1178	28	2	21
1179	28	2	22
1180	28	2	3
1181	28	2	1
1182	28	2	14
1183	28	2	11
1184	28	2	16
1185	28	2	5
1186	28	2	20
464	28	2	10
73	7	1	\N
74	7	1	\N
75	7	1	\N
76	7	1	\N
77	7	1	\N
78	7	1	\N
79	7	1	\N
80	7	1	\N
81	7	1	\N
82	7	1	\N
83	7	1	\N
84	7	1	\N
85	7	1	\N
86	7	1	\N
87	7	1	\N
88	7	1	\N
89	7	1	\N
90	7	1	\N
1187	28	2	15
1188	28	2	4
1189	28	2	18
1190	28	2	12
1191	34	2	1
1192	34	2	3
561	34	2	2
1193	34	2	22
1194	34	2	4
568	34	2	6
1195	34	2	15
567	34	2	10
1196	34	2	8
1197	34	2	21
1198	34	2	9
774	46	1	\N
775	46	1	\N
776	46	1	\N
777	46	1	\N
778	46	1	\N
779	46	1	\N
780	46	1	\N
781	46	1	\N
782	46	1	\N
783	46	1	\N
784	46	1	\N
785	46	1	\N
786	46	1	\N
787	46	1	\N
788	46	1	\N
789	46	1	\N
790	46	1	\N
791	46	1	\N
1199	34	2	12
1200	34	2	19
1201	34	2	7
1202	34	2	18
1203	34	2	20
1204	34	2	16
1205	34	2	13
1206	34	2	14
1207	34	2	17
1208	34	2	23
1209	34	2	11
1210	34	2	5
164	12	2	12
168	12	2	6
1211	12	2	5
165	12	2	2
1212	12	2	16
1213	12	2	10
1214	12	2	14
1215	12	2	8
180	12	2	9
1216	12	2	18
1217	12	2	7
1218	12	2	11
1219	12	2	20
1220	12	2	22
1221	12	2	23
163	12	2	1
1222	12	2	13
176	12	2	19
1223	12	2	3
171	12	2	21
1224	12	2	17
1225	12	2	4
1226	12	2	15
468	29	2	1
480	29	2	4
469	29	2	8
1227	29	2	9
470	29	2	3
473	29	2	23
1228	29	2	11
1229	29	2	7
1230	29	2	10
484	29	2	18
482	29	2	20
1231	29	2	21
1232	29	2	2
1233	29	2	19
1234	29	2	12
483	29	2	17
55	6	1	\N
56	6	1	\N
57	6	1	\N
58	6	1	\N
59	6	1	\N
60	6	1	\N
61	6	1	\N
62	6	1	\N
63	6	1	\N
64	6	1	\N
65	6	1	\N
66	6	1	\N
67	6	1	\N
68	6	1	\N
69	6	1	\N
70	6	1	\N
71	6	1	\N
72	6	1	\N
343	22	1	\N
344	22	1	\N
345	22	1	\N
346	22	1	\N
347	22	1	\N
348	22	1	\N
349	22	1	\N
350	22	1	\N
351	22	1	\N
352	22	1	\N
353	22	1	\N
354	22	1	\N
355	22	1	\N
356	22	1	\N
357	22	1	\N
358	22	1	\N
359	22	1	\N
360	22	1	\N
478	29	2	14
1235	29	2	13
471	29	2	5
1236	29	2	22
1237	29	2	16
1238	29	2	15
1239	43	2	1
1240	43	2	6
1241	43	2	3
1242	43	2	5
1243	43	2	21
1244	43	2	14
1245	43	2	8
728	43	2	16
1071	43	2	11
732	43	2	7
1073	43	2	17
1246	43	2	4
1247	43	2	9
1248	43	2	12
722	43	2	13
1249	43	2	20
1250	43	2	18
1251	43	2	10
1252	43	2	19
1253	43	2	2
1254	43	2	22
1255	43	2	23
1256	43	2	15
1257	31	2	1
1258	31	2	15
1259	31	2	3
1260	31	2	18
1261	31	2	4
1262	31	2	5
1263	31	2	6
1264	31	2	8
1265	31	2	19
1266	31	2	22
1267	31	2	21
1268	31	2	23
1269	31	2	12
1270	31	2	14
1271	31	2	11
509	31	2	2
1272	31	2	17
1273	31	2	10
1274	31	2	20
1275	31	2	13
1276	31	2	7
1277	31	2	16
1278	31	2	9
1279	35	2	1
1280	35	2	5
1281	35	2	4
1282	35	2	21
1283	35	2	2
828	49	1	\N
829	49	1	\N
830	49	1	\N
831	49	1	\N
832	49	1	\N
833	49	1	\N
834	49	1	\N
835	49	1	\N
836	49	1	\N
837	49	1	\N
838	49	1	\N
839	49	1	\N
840	49	1	\N
841	49	1	\N
842	49	1	\N
843	49	1	\N
844	49	1	\N
845	49	1	\N
990	35	2	13
1284	35	2	6
1285	35	2	12
1286	35	2	7
588	35	2	11
593	35	2	10
1287	35	2	14
1288	35	2	20
1289	35	2	23
1290	35	2	9
1291	35	2	18
1292	35	2	16
1293	35	2	3
1294	35	2	8
1295	35	2	15
1296	35	2	19
468	29	1	\N
469	29	1	\N
470	29	1	\N
471	29	1	\N
472	29	1	\N
473	29	1	\N
474	29	1	\N
475	29	1	\N
476	29	1	\N
477	29	1	\N
478	29	1	\N
479	29	1	\N
480	29	1	\N
481	29	1	\N
482	29	1	\N
483	29	1	\N
484	29	1	\N
485	29	1	\N
612	37	1	\N
613	37	1	\N
614	37	1	\N
615	37	1	\N
616	37	1	\N
617	37	1	\N
618	37	1	\N
619	37	1	\N
620	37	1	\N
621	37	1	\N
622	37	1	\N
623	37	1	\N
624	37	1	\N
625	37	1	\N
626	37	1	\N
627	37	1	\N
628	37	1	\N
629	37	1	\N
1297	35	2	22
1298	35	2	17
253	17	2	1
1299	17	2	5
1300	17	2	20
258	17	2	16
1301	17	2	19
1302	17	2	13
1303	17	2	15
1304	17	2	10
1305	17	2	7
1306	17	2	11
1307	17	2	23
1308	17	2	8
379	24	1	\N
380	24	1	\N
381	24	1	\N
382	24	1	\N
383	24	1	\N
384	24	1	\N
385	24	1	\N
386	24	1	\N
387	24	1	\N
388	24	1	\N
389	24	1	\N
390	24	1	\N
391	24	1	\N
392	24	1	\N
393	24	1	\N
394	24	1	\N
395	24	1	\N
396	24	1	\N
702	42	1	\N
703	42	1	\N
704	42	1	\N
705	42	1	\N
706	42	1	\N
707	42	1	\N
708	42	1	\N
709	42	1	\N
710	42	1	\N
711	42	1	\N
712	42	1	\N
713	42	1	\N
714	42	1	\N
715	42	1	\N
716	42	1	\N
717	42	1	\N
718	42	1	\N
719	42	1	\N
1	3	1	\N
2	3	1	\N
3	3	1	\N
4	3	1	\N
5	3	1	\N
6	3	1	\N
7	3	1	\N
8	3	1	\N
9	3	1	\N
10	3	1	\N
11	3	1	\N
12	3	1	\N
13	3	1	\N
14	3	1	\N
15	3	1	\N
16	3	1	\N
17	3	1	\N
18	3	1	\N
163	12	1	\N
164	12	1	\N
165	12	1	\N
166	12	1	\N
167	12	1	\N
168	12	1	\N
169	12	1	\N
170	12	1	\N
171	12	1	\N
172	12	1	\N
173	12	1	\N
174	12	1	\N
175	12	1	\N
176	12	1	\N
177	12	1	\N
178	12	1	\N
179	12	1	\N
180	12	1	\N
1309	17	2	14
1310	17	2	21
1311	17	2	18
1312	17	2	6
1313	17	2	9
1314	17	2	3
1315	17	2	12
1316	17	2	4
261	17	2	2
262	17	2	22
1317	17	2	17
1318	39	2	23
1319	39	2	16
651	39	2	17
652	39	2	3
1320	39	2	18
662	39	2	10
1321	39	2	5
1322	39	2	14
1323	39	2	19
1324	39	2	11
1325	39	2	13
1326	39	2	15
1327	39	2	20
1328	39	2	12
1329	39	2	21
1330	39	2	6
1331	39	2	4
1332	39	2	2
1333	39	2	22
1334	39	2	7
1335	39	2	9
1336	39	2	8
1337	39	2	1
1338	60	2	1
1339	60	2	6
1340	60	2	14
1341	60	2	18
1342	60	2	2
1343	60	2	20
1344	60	2	17
1345	60	2	8
1346	60	2	7
1347	60	2	11
1348	60	2	10
1349	60	2	4
1350	60	2	16
1351	60	2	22
1352	60	2	12
1353	60	2	23
1354	60	2	21
1355	60	2	19
1356	60	2	5
1357	60	2	9
1358	60	2	3
1359	60	2	13
1360	60	2	15
1361	61	2	1
1362	61	2	2
1363	61	2	15
1364	61	2	6
1365	61	2	17
1366	61	2	8
1367	61	2	19
1368	61	2	13
235	16	1	\N
236	16	1	\N
237	16	1	\N
238	16	1	\N
239	16	1	\N
240	16	1	\N
241	16	1	\N
242	16	1	\N
243	16	1	\N
244	16	1	\N
245	16	1	\N
246	16	1	\N
247	16	1	\N
248	16	1	\N
249	16	1	\N
250	16	1	\N
251	16	1	\N
252	16	1	\N
1369	61	2	10
1370	61	2	20
1371	61	2	18
1372	61	2	22
1373	61	2	23
1374	61	2	3
1375	61	2	21
1376	61	2	11
1377	61	2	7
1378	61	2	12
1379	61	2	4
1380	61	2	14
1381	61	2	16
1382	61	2	5
1383	61	2	9
1384	54	2	1
1385	54	2	6
1386	54	2	4
109	9	1	\N
110	9	1	\N
111	9	1	\N
112	9	1	\N
113	9	1	\N
114	9	1	\N
115	9	1	\N
116	9	1	\N
117	9	1	\N
118	9	1	\N
119	9	1	\N
120	9	1	\N
121	9	1	\N
122	9	1	\N
123	9	1	\N
124	9	1	\N
125	9	1	\N
126	9	1	\N
540	33	1	\N
541	33	1	\N
542	33	1	\N
543	33	1	\N
544	33	1	\N
545	33	1	\N
546	33	1	\N
547	33	1	\N
548	33	1	\N
549	33	1	\N
550	33	1	\N
551	33	1	\N
552	33	1	\N
553	33	1	\N
554	33	1	\N
555	33	1	\N
556	33	1	\N
557	33	1	\N
1387	54	2	17
1388	54	2	14
1389	54	2	10
1390	54	2	8
1391	54	2	7
1392	54	2	9
1393	54	2	23
1394	54	2	20
1395	54	2	19
1396	54	2	5
1397	54	2	13
1398	54	2	12
1399	54	2	18
1400	54	2	11
1401	54	2	3
1402	54	2	2
1403	54	2	22
1404	54	2	21
594	36	1	\N
595	36	1	\N
596	36	1	\N
597	36	1	\N
598	36	1	\N
599	36	1	\N
600	36	1	\N
601	36	1	\N
602	36	1	\N
603	36	1	\N
604	36	1	\N
605	36	1	\N
606	36	1	\N
607	36	1	\N
608	36	1	\N
609	36	1	\N
610	36	1	\N
611	36	1	\N
19	4	1	\N
20	4	1	\N
21	4	1	\N
22	4	1	\N
23	4	1	\N
24	4	1	\N
25	4	1	\N
26	4	1	\N
27	4	1	\N
28	4	1	\N
29	4	1	\N
30	4	1	\N
31	4	1	\N
32	4	1	\N
33	4	1	\N
34	4	1	\N
35	4	1	\N
36	4	1	\N
1405	54	2	15
1406	54	2	16
1407	48	2	23
1408	48	2	21
1409	48	2	6
1410	48	2	3
1411	48	2	2
1412	48	2	9
1413	48	2	10
1414	48	2	7
1415	48	2	17
1416	48	2	18
1417	48	2	4
1418	48	2	5
1419	48	2	1
1420	48	2	19
1421	48	2	16
504	31	1	\N
505	31	1	\N
506	31	1	\N
507	31	1	\N
508	31	1	\N
509	31	1	\N
510	31	1	\N
511	31	1	\N
512	31	1	\N
513	31	1	\N
514	31	1	\N
515	31	1	\N
516	31	1	\N
517	31	1	\N
518	31	1	\N
519	31	1	\N
520	31	1	\N
521	31	1	\N
1422	48	2	20
1423	48	2	11
1424	48	2	12
1425	48	2	15
1426	48	2	14
1427	48	2	22
1428	48	2	8
1429	48	2	13
1430	59	2	23
1431	59	2	6
1432	59	2	5
1433	59	2	2
1434	59	2	12
1435	59	2	10
1436	59	2	8
1437	59	2	4
1438	59	2	9
1439	59	2	11
1440	59	2	18
1441	59	2	20
1442	59	2	1
1443	59	2	15
1444	59	2	3
1445	59	2	21
1446	59	2	19
1447	59	2	13
1448	59	2	14
1449	59	2	16
1450	59	2	17
1451	59	2	7
1452	59	2	22
1453	55	2	1
414	26	1	\N
415	26	1	\N
416	26	1	\N
417	26	1	\N
418	26	1	\N
419	26	1	\N
420	26	1	\N
421	26	1	\N
422	26	1	\N
423	26	1	\N
424	26	1	\N
425	26	1	\N
426	26	1	\N
427	26	1	\N
428	26	1	\N
429	26	1	\N
430	26	1	\N
431	26	1	\N
271	18	1	\N
272	18	1	\N
273	18	1	\N
274	18	1	\N
275	18	1	\N
276	18	1	\N
277	18	1	\N
278	18	1	\N
279	18	1	\N
280	18	1	\N
281	18	1	\N
282	18	1	\N
283	18	1	\N
284	18	1	\N
285	18	1	\N
286	18	1	\N
287	18	1	\N
288	18	1	\N
1454	55	2	3
1455	55	2	6
1456	55	2	2
1457	55	2	20
1458	55	2	5
1459	55	2	15
1460	55	2	16
1461	55	2	21
1462	55	2	11
1463	55	2	10
1464	55	2	7
1465	55	2	4
1466	55	2	23
1467	55	2	8
1468	55	2	19
558	34	1	\N
559	34	1	\N
560	34	1	\N
561	34	1	\N
562	34	1	\N
563	34	1	\N
564	34	1	\N
565	34	1	\N
566	34	1	\N
567	34	1	\N
568	34	1	\N
569	34	1	\N
570	34	1	\N
571	34	1	\N
572	34	1	\N
573	34	1	\N
574	34	1	\N
575	34	1	\N
756	45	1	\N
757	45	1	\N
758	45	1	\N
759	45	1	\N
760	45	1	\N
761	45	1	\N
762	45	1	\N
763	45	1	\N
764	45	1	\N
765	45	1	\N
766	45	1	\N
767	45	1	\N
768	45	1	\N
769	45	1	\N
770	45	1	\N
771	45	1	\N
772	45	1	\N
773	45	1	\N
1051	38	1	\N
1052	38	1	\N
1053	38	1	\N
1054	38	1	\N
1055	38	1	\N
1056	38	1	\N
1057	38	1	\N
1058	38	1	\N
1059	50	1	\N
1060	50	1	\N
1061	50	1	\N
1062	50	1	\N
1063	50	1	\N
1064	50	1	\N
1065	50	1	\N
1066	43	1	\N
1067	43	1	\N
1068	43	1	\N
1069	43	1	\N
1070	43	1	\N
1071	43	1	\N
1072	43	1	\N
1073	43	1	\N
1074	43	1	\N
1075	14	1	\N
1076	14	1	\N
1077	14	1	\N
1078	14	1	\N
1079	14	1	\N
1080	14	1	\N
1081	14	1	\N
1082	14	1	\N
1083	5	1	\N
1084	5	1	\N
1085	5	1	\N
1086	5	1	\N
1087	5	1	\N
1088	5	1	\N
1089	5	1	\N
1090	5	1	\N
1091	5	1	\N
1092	25	1	\N
1093	25	1	\N
1094	25	1	\N
1095	25	1	\N
1096	25	1	\N
1097	25	1	\N
1098	25	1	\N
1099	25	1	\N
1100	25	1	\N
1101	25	1	\N
1102	25	1	\N
1103	25	1	\N
1104	10	1	\N
1105	10	1	\N
1106	10	1	\N
1107	10	1	\N
1108	10	1	\N
1109	10	1	\N
1110	10	1	\N
1111	10	1	\N
1112	15	1	\N
1113	15	1	\N
1114	15	1	\N
1115	15	1	\N
1116	15	1	\N
1117	15	1	\N
1118	15	1	\N
1119	15	1	\N
1120	15	1	\N
1121	15	1	\N
1122	15	1	\N
1469	55	2	22
1470	55	2	9
1471	55	2	18
1472	55	2	14
1473	55	2	13
1474	55	2	12
1475	55	2	17
1476	56	2	1
1477	56	2	3
1478	56	2	15
1479	56	2	11
1480	56	2	6
1481	56	2	20
1482	56	2	21
1483	56	2	4
1484	56	2	9
1485	56	2	22
1486	56	2	10
1487	56	2	8
1488	56	2	7
1489	56	2	13
1490	56	2	5
1491	56	2	14
1492	56	2	2
1493	56	2	19
1494	56	2	16
1495	56	2	18
1496	56	2	17
1497	56	2	23
1498	56	2	12
996	19	2	1
1499	19	2	5
1500	19	2	17
1501	19	2	2
297	19	2	18
1502	19	2	10
1503	19	2	8
1504	19	2	6
1505	19	2	9
1506	19	2	7
1507	19	2	13
289	19	2	22
1508	19	2	11
1509	19	2	4
1510	19	2	12
1511	19	2	20
293	19	2	16
1512	19	2	21
1513	19	2	23
1514	19	2	15
1515	19	2	19
300	19	2	14
1516	3	2	13
1517	3	2	15
1518	3	2	2
5	3	2	23
1519	3	2	3
1520	3	2	11
1521	3	2	18
1522	3	2	16
1523	3	2	14
13	3	2	22
1524	3	2	7
9	3	2	21
1525	3	2	20
1526	3	2	6
1527	3	2	5
15	3	2	9
1528	3	2	10
1529	3	2	12
1530	3	2	4
1531	3	2	17
1532	3	2	1
1533	3	2	19
1534	3	2	8
1535	11	2	1
1536	11	2	3
1537	11	2	2
1538	11	2	12
918	11	2	14
153	11	2	5
1539	11	2	11
1540	11	2	15
1541	11	2	9
919	11	2	10
1542	11	2	19
1543	11	2	4
910	11	2	23
1544	11	2	7
147	11	2	13
1545	11	2	21
1546	11	2	17
1547	11	2	16
1548	11	2	8
1549	11	2	6
1550	11	2	22
1551	11	2	20
1552	10	2	1
129	10	2	5
1553	10	2	22
130	10	2	13
1554	10	2	2
1555	10	2	15
134	10	2	10
1556	10	2	11
1557	10	2	9
1558	10	2	14
1559	10	2	23
131	10	2	4
141	10	2	7
1560	10	2	18
1561	10	2	19
1562	10	2	20
1563	10	2	16
128	10	2	12
136	10	2	8
1564	10	2	21
1565	10	2	6
135	10	2	17
1566	10	2	3
1567	25	2	1
1568	25	2	4
1569	25	2	18
1570	25	2	6
1571	25	2	2
1572	25	2	8
1573	25	2	7
1574	25	2	10
1575	25	2	17
1576	25	2	20
1577	25	2	9
1578	25	2	14
1579	25	2	16
1580	25	2	11
1581	25	2	13
1582	25	2	21
1583	25	2	19
1092	25	2	23
1584	25	2	15
1585	25	2	22
1586	25	2	12
1587	25	2	5
1588	5	2	23
1589	5	2	19
1590	5	2	20
1591	5	2	6
1592	5	2	2
1593	5	2	16
1594	5	2	13
1595	5	2	17
1596	5	2	9
1597	5	2	7
1598	5	2	11
1599	5	2	21
1600	5	2	18
1601	5	2	10
1602	5	2	4
1603	5	2	5
1604	5	2	22
1605	5	2	3
1606	5	2	14
1607	5	2	8
1608	5	2	1
1609	5	2	15
1610	5	2	12
432	27	2	1
1611	27	2	20
1612	27	2	5
1613	27	2	2
897	27	2	6
444	27	2	7
1614	27	2	11
438	27	2	15
449	27	2	9
1615	27	2	10
1616	27	2	14
1617	27	2	8
1618	27	2	4
439	27	2	17
1619	27	2	12
1620	27	2	19
1621	27	2	13
1622	27	2	18
1623	27	2	21
1624	27	2	16
1625	27	2	23
1626	27	2	22
1627	50	2	1
848	50	2	4
1628	50	2	5
1629	50	2	6
1630	50	2	15
1631	50	2	2
1632	50	2	20
1633	50	2	11
1634	50	2	21
1635	50	2	8
1636	50	2	7
1637	50	2	13
1638	50	2	9
1639	50	2	14
1640	50	2	3
1641	50	2	17
1642	50	2	19
1643	50	2	22
1644	50	2	23
1645	50	2	10
1646	50	2	18
1647	50	2	16
1648	50	2	12
1649	26	2	22
418	26	2	4
1650	26	2	2
421	26	2	17
1651	26	2	12
1652	26	2	11
1653	26	2	9
423	26	2	13
431	26	2	23
1654	26	2	8
1655	26	2	10
1656	26	2	14
1657	26	2	19
1658	26	2	20
1659	26	2	21
1660	26	2	5
1661	26	2	6
1662	26	2	15
1663	26	2	1
1664	26	2	3
1665	26	2	16
1666	26	2	18
1667	26	2	7
1668	47	2	4
1669	47	2	23
1670	47	2	16
808	47	2	19
1671	47	2	13
1672	47	2	15
1673	47	2	14
1674	47	2	3
1675	47	2	11
1676	47	2	17
1677	47	2	21
796	47	2	22
792	47	2	1
793	47	2	5
1678	47	2	6
1679	47	2	2
979	47	2	8
1680	47	2	20
1681	47	2	7
1682	47	2	18
1683	47	2	12
807	47	2	9
1684	47	2	10
775	46	2	1
1685	46	2	3
1686	46	2	23
779	46	2	17
781	46	2	4
786	46	2	20
1687	46	2	6
782	46	2	16
1688	46	2	9
1689	46	2	21
1690	46	2	11
1691	46	2	14
1692	46	2	8
1693	46	2	15
1694	46	2	22
785	46	2	10
1695	46	2	18
774	46	2	12
1696	46	2	19
777	46	2	13
1697	46	2	7
1698	46	2	2
1699	46	2	5
1700	24	2	1
1701	24	2	3
1702	24	2	22
1703	24	2	5
1704	24	2	19
1705	24	2	10
1706	24	2	17
1707	24	2	7
1708	24	2	15
1709	24	2	14
1710	24	2	8
1711	24	2	11
1712	24	2	9
1713	24	2	4
1714	24	2	23
1715	24	2	2
1716	24	2	12
1717	24	2	6
1718	24	2	18
1719	24	2	13
1720	24	2	21
1721	24	2	20
1722	24	2	16
1723	53	2	1
1724	53	2	2
1725	53	2	4
1726	53	2	13
1727	53	2	20
1728	53	2	7
1729	53	2	19
1730	53	2	10
1731	53	2	9
1732	53	2	11
1733	53	2	16
1734	53	2	18
1735	53	2	15
1736	53	2	17
1737	53	2	21
1738	53	2	14
1739	53	2	3
1740	53	2	23
1741	53	2	22
1742	53	2	8
1743	53	2	5
1744	53	2	12
1745	53	2	6
1746	36	2	16
600	36	2	3
1747	36	2	6
1748	36	2	12
1749	36	2	22
1750	36	2	13
1751	36	2	5
606	36	2	10
607	36	2	18
1752	36	2	19
1753	36	2	9
1754	36	2	8
1755	36	2	7
1756	36	2	23
1757	36	2	20
1758	36	2	4
1759	36	2	1
1760	36	2	17
1761	36	2	11
1762	36	2	14
1763	36	2	21
1764	36	2	2
1765	36	2	15
1766	29	2	6
1767	11	2	18
1768	27	2	3
1769	19	2	3
1096	25	2	3
1770	9	3	1
113	9	3	16
1771	9	3	3
1772	9	3	15
112	9	3	14
1773	9	3	2
117	9	3	12
121	9	3	6
122	9	3	10
1774	9	3	11
126	9	3	19
1775	9	3	24
1776	9	3	20
1777	9	3	13
1778	9	3	9
1779	9	3	18
1780	9	3	26
1781	9	3	21
1782	9	3	25
118	9	3	23
1783	9	3	17
120	9	3	4
1784	9	3	7
1785	9	3	8
109	9	3	22
115	9	3	5
343	22	3	1
345	22	3	3
1786	22	3	2
346	22	3	7
348	22	3	17
350	22	3	23
1787	22	3	20
1788	22	3	10
356	22	3	19
1789	22	3	11
360	22	3	13
1790	22	3	4
1791	22	3	16
1792	22	3	12
1793	22	3	5
1794	22	3	22
351	22	3	21
1795	22	3	8
1796	22	3	24
1797	22	3	15
1798	22	3	18
347	22	3	6
1799	22	3	25
1800	22	3	14
1801	22	3	9
1802	22	3	26
792	47	3	1
1678	47	3	6
793	47	3	5
1803	47	3	3
1683	47	3	12
1804	47	3	19
800	47	3	4
801	47	3	22
807	47	3	9
1684	47	3	10
806	47	3	17
1805	47	3	21
1669	47	3	13
1806	47	3	7
1807	47	3	23
979	47	3	8
796	47	3	18
1808	47	3	14
1809	47	3	16
808	47	3	11
1679	47	3	2
1810	47	3	26
1811	47	3	24
1668	47	3	15
805	47	3	20
468	29	3	1
480	29	3	15
1233	29	3	19
469	29	3	8
471	29	3	5
475	29	3	2
1812	29	3	18
1813	29	3	21
470	29	3	3
484	29	3	7
483	29	3	9
478	29	3	14
1232	29	3	16
1228	29	3	11
1814	29	3	25
1230	29	3	10
1815	29	3	4
473	29	3	23
485	29	3	17
1816	29	3	12
1817	29	3	24
1818	29	3	13
1766	29	3	6
1236	29	3	22
482	29	3	20
594	36	3	16
1819	36	3	4
600	36	3	3
1820	36	3	22
1748	36	3	21
1751	36	3	5
1821	36	3	6
1754	36	3	8
608	36	3	9
607	36	3	18
611	36	3	15
1822	36	3	1
1823	36	3	20
602	36	3	17
598	36	3	14
1824	36	3	19
603	36	3	26
1825	36	3	11
1826	36	3	25
1756	36	3	23
1827	36	3	24
1828	36	3	2
1829	36	3	12
1830	36	3	10
610	36	3	7
609	36	3	13
1831	23	3	23
864	23	3	4
366	23	3	5
1832	23	3	3
372	23	3	21
1833	23	3	11
378	23	3	8
1834	23	3	17
365	23	3	22
1835	23	3	7
1836	23	3	18
1837	23	3	1
371	23	3	20
1032	23	3	13
1838	23	3	9
364	23	3	2
377	23	3	19
1033	23	3	6
367	23	3	26
1839	23	3	16
1039	23	3	12
375	23	3	10
1840	23	3	14
1841	23	3	15
373	23	3	25
1842	23	3	24
1114	15	3	1
219	15	3	13
1843	15	3	3
222	15	3	5
1844	15	3	2
223	15	3	4
1845	15	3	6
225	15	3	8
1846	15	3	24
230	15	3	10
227	15	3	21
1847	15	3	23
1848	15	3	14
1849	15	3	25
1117	15	3	7
226	15	3	17
1850	15	3	20
233	15	3	19
1851	15	3	12
231	15	3	11
1852	15	3	16
1853	15	3	9
1854	15	3	18
1855	15	3	22
1116	15	3	26
1856	15	3	15
1857	52	3	1
1858	52	3	6
1859	52	3	4
1860	52	3	5
1861	52	3	8
1862	52	3	10
1863	52	3	15
1864	52	3	3
1865	52	3	14
1866	52	3	20
1867	52	3	11
1868	52	3	7
1869	52	3	21
1870	52	3	16
1871	52	3	2
1872	52	3	22
1873	52	3	13
1874	52	3	17
1875	52	3	12
1876	52	3	9
1877	52	3	23
1878	52	3	18
1879	52	3	25
1880	52	3	24
1881	52	3	26
1882	52	3	19
648	39	3	23
651	39	3	19
650	39	3	13
652	39	3	3
649	39	3	26
658	39	3	5
656	39	3	7
1883	39	3	17
1324	39	3	11
663	39	3	22
662	39	3	10
1884	39	3	16
664	39	3	9
654	39	3	24
1885	39	3	25
1328	39	3	1
1886	39	3	12
657	39	3	14
1887	39	3	6
655	39	3	20
1888	39	3	18
1329	39	3	21
1889	39	3	2
1890	39	3	4
1336	39	3	8
1891	39	3	15
1163	33	3	21
1158	33	3	5
1892	33	3	17
1893	33	3	8
1150	33	3	13
542	33	3	12
1159	33	3	23
1152	33	3	7
1154	33	3	10
1894	33	3	9
1895	33	3	11
1896	33	3	18
1897	33	3	22
1898	33	3	16
1899	33	3	1
1165	33	3	19
1149	33	3	14
1900	33	3	3
1901	33	3	15
1902	33	3	20
1903	33	3	25
1904	33	3	4
1151	33	3	6
1905	33	3	24
1906	33	3	2
1384	54	3	1
1386	54	3	4
1385	54	3	6
1907	54	3	2
1389	54	3	10
1908	54	3	23
1390	54	3	8
1909	54	3	5
1910	54	3	13
1398	54	3	12
1911	54	3	11
1912	54	3	15
1913	54	3	3
1914	54	3	24
1400	54	3	9
1387	54	3	17
1915	54	3	18
1916	54	3	26
1917	54	3	19
1918	54	3	14
1394	54	3	20
1919	54	3	25
1920	54	3	16
1921	54	3	7
1403	54	3	22
1404	54	3	21
415	26	3	16
418	26	3	4
417	26	3	3
1652	26	3	6
422	26	3	14
421	26	3	17
419	26	3	24
1922	26	3	20
1923	26	3	9
1924	26	3	7
420	26	3	25
431	26	3	23
414	26	3	22
1925	26	3	21
1651	26	3	12
1926	26	3	11
1655	26	3	10
425	26	3	8
423	26	3	13
1658	26	3	18
1927	26	3	19
1928	26	3	5
1665	26	3	1
1649	26	3	26
1929	26	3	2
424	26	3	15
1516	3	3	13
1517	3	3	15
4	3	3	3
5	3	3	23
3	3	3	19
9	3	3	4
1930	3	3	24
1522	3	3	16
1931	3	3	20
16	3	3	10
13	3	3	22
1529	3	3	1
1932	3	3	7
1933	3	3	21
1934	3	3	11
1935	3	3	2
15	3	3	9
1521	3	3	18
1936	3	3	6
1937	3	3	12
2	3	3	5
17	3	3	25
1527	3	3	14
1938	3	3	26
10	3	3	17
8	3	3	8
1723	53	3	1
1939	53	3	14
1735	53	3	15
1730	53	3	10
1734	53	3	18
1940	53	3	2
1941	53	3	19
1729	53	3	20
1942	53	3	21
1943	53	3	13
1731	53	3	9
1944	53	3	4
1945	53	3	24
1743	53	3	5
1946	53	3	22
1947	53	3	26
1948	53	3	23
1949	53	3	25
1739	53	3	3
1950	53	3	17
1951	53	3	12
1728	53	3	7
1952	53	3	8
1953	53	3	6
1732	53	3	11
1954	53	3	16
1279	35	3	1
581	35	3	18
580	35	3	24
1282	35	3	21
1283	35	3	2
1286	35	3	7
586	35	3	14
583	35	3	8
1290	35	3	9
593	35	3	10
588	35	3	11
987	35	3	22
591	35	3	20
1955	35	3	3
1956	35	3	12
1957	35	3	15
994	35	3	26
1281	35	3	4
1292	35	3	16
579	35	3	5
1958	35	3	13
1959	35	3	6
1289	35	3	23
584	35	3	25
578	35	3	17
253	17	3	1
1960	17	3	4
255	17	3	19
1302	17	3	13
258	17	3	16
1961	17	3	3
263	17	3	14
262	17	3	22
267	17	3	23
1305	17	3	7
1962	17	3	15
1963	17	3	24
1311	17	3	18
1964	17	3	12
1965	17	3	5
261	17	3	2
1966	17	3	25
1967	17	3	6
1968	17	3	8
1969	17	3	21
1970	17	3	10
1971	17	3	11
1972	17	3	17
1309	17	3	9
1973	17	3	26
1974	17	3	20
163	12	3	1
168	12	3	6
167	12	3	5
166	12	3	3
165	12	3	2
171	12	3	4
1975	12	3	15
172	12	3	8
176	12	3	19
1976	12	3	17
1217	12	3	7
1977	12	3	26
164	12	3	12
1978	12	3	9
1979	12	3	10
1980	12	3	11
169	12	3	18
1981	12	3	25
1220	12	3	22
177	12	3	16
1982	12	3	21
1983	12	3	14
1984	12	3	24
1985	12	3	13
174	12	3	23
1986	12	3	20
1419	48	3	1
1987	48	3	20
1409	48	3	6
1988	48	3	19
1989	48	3	22
1423	48	3	11
1428	48	3	8
1413	48	3	10
1412	48	3	9
1417	48	3	4
946	48	3	13
1990	48	3	14
1991	48	3	3
825	48	3	17
1992	48	3	12
1993	48	3	16
1994	48	3	24
813	48	3	2
820	48	3	7
1995	48	3	18
1408	48	3	21
944	48	3	5
1996	48	3	15
1997	48	3	25
1998	48	3	26
1999	48	3	23
996	19	3	1
292	19	3	23
293	19	3	2
291	19	3	3
1514	19	3	15
1507	19	3	13
1512	19	3	21
297	19	3	6
303	19	3	7
301	19	3	14
302	19	3	10
2000	19	3	5
2001	19	3	20
1509	19	3	4
1510	19	3	12
304	19	3	19
2002	19	3	18
300	19	3	8
289	19	3	22
2003	19	3	25
305	19	3	24
1511	19	3	17
2004	19	3	9
2005	19	3	26
2006	19	3	16
2007	19	3	11
2008	24	3	12
1702	24	3	22
2009	24	3	4
1703	24	3	5
1704	24	3	19
388	24	3	15
387	24	3	17
1717	24	3	6
2010	24	3	25
389	24	3	11
394	24	3	14
2011	24	3	13
393	24	3	20
2012	24	3	23
386	24	3	24
2013	24	3	16
1707	24	3	7
2014	24	3	2
2015	24	3	18
2016	24	3	26
383	24	3	3
2017	24	3	9
390	24	3	8
392	24	3	10
1700	24	3	1
396	24	3	21
504	31	3	23
506	31	3	24
512	31	3	16
1260	31	3	18
1270	31	3	2
1262	31	3	5
513	31	3	26
2018	31	3	9
1274	31	3	10
517	31	3	21
519	31	3	11
520	31	3	7
2019	31	3	15
2020	31	3	19
1264	31	3	8
2021	31	3	17
2022	31	3	3
2023	31	3	13
2024	31	3	22
2025	31	3	6
509	31	3	20
2026	31	3	14
518	31	3	12
2027	31	3	4
2028	31	3	25
2029	31	3	1
1453	55	3	1
1459	55	3	15
1455	55	3	6
1467	55	3	8
2030	55	3	16
1475	55	3	17
1458	55	3	5
2031	55	3	9
2032	55	3	4
2033	55	3	7
1474	55	3	12
2034	55	3	3
1463	55	3	10
1468	55	3	19
2035	55	3	24
2036	55	3	13
2037	55	3	18
2038	55	3	20
2039	55	3	2
2040	55	3	23
2041	55	3	26
2042	55	3	25
2043	55	3	21
1462	55	3	11
2044	55	3	22
2045	55	3	14
432	27	3	1
1613	27	3	2
1612	27	3	5
1625	27	3	19
897	27	3	6
439	27	3	8
1614	27	3	11
434	27	3	21
1623	27	3	23
1615	27	3	10
444	27	3	7
1624	27	3	16
2046	27	3	4
1616	27	3	14
433	27	3	3
448	27	3	24
1619	27	3	12
440	27	3	18
438	27	3	15
1621	27	3	13
446	27	3	22
443	27	3	20
447	27	3	17
435	27	3	26
445	27	3	25
2047	7	3	18
2048	7	3	5
80	7	3	4
75	7	3	2
2049	7	3	7
2050	7	3	13
74	7	3	19
77	7	3	22
90	7	3	20
2051	7	3	10
87	7	3	11
83	7	3	21
2052	7	3	14
2053	7	3	12
89	7	3	17
88	7	3	23
2054	7	3	16
2055	7	3	8
2056	7	3	6
78	7	3	25
2057	7	3	3
82	7	3	15
73	7	3	1
2058	7	3	9
2059	7	3	24
2060	7	3	26
1552	10	3	1
131	10	3	4
129	10	3	5
130	10	3	13
133	10	3	3
1108	10	3	15
134	10	3	10
136	10	3	8
141	10	3	7
2061	10	3	17
1559	10	3	23
1553	10	3	22
135	10	3	6
2062	10	3	20
1557	10	3	9
1111	10	3	19
137	10	3	25
2063	10	3	24
127	10	3	21
2064	10	3	12
138	10	3	26
1109	10	3	16
2065	10	3	2
140	10	3	14
1105	10	3	18
2066	57	3	23
2067	57	3	3
2068	57	3	21
2069	57	3	25
2070	57	3	19
2071	57	3	14
2072	57	3	18
2073	57	3	8
2074	57	3	13
2075	57	3	12
2076	57	3	20
2077	57	3	16
2078	57	3	7
2079	57	3	9
2080	57	3	6
2081	57	3	10
2082	57	3	2
2083	57	3	15
2084	57	3	11
2085	57	3	24
2086	57	3	22
2087	57	3	26
2088	57	3	1
2089	57	3	4
2090	57	3	17
2091	57	3	5
558	34	3	23
561	34	3	2
1192	34	3	3
563	34	3	16
1193	34	3	22
568	34	3	6
1195	34	3	5
566	34	3	15
1198	34	3	9
572	34	3	11
575	34	3	8
2092	34	3	7
1206	34	3	14
1197	34	3	21
2093	34	3	26
1191	34	3	1
2094	34	3	24
2095	34	3	12
1202	34	3	18
567	34	3	10
1194	34	3	13
2096	34	3	20
569	34	3	25
1200	34	3	19
2097	34	3	17
1608	5	3	1
1589	5	3	19
2098	5	3	4
2099	5	3	3
1084	5	3	15
1595	5	3	10
1609	5	3	5
2100	5	3	6
2101	5	3	16
1597	5	3	7
2102	5	3	17
1083	5	3	12
1606	5	3	14
2103	5	3	24
2104	5	3	8
1598	5	3	11
2105	5	3	23
2106	5	3	2
2107	5	3	13
2108	5	3	20
2109	5	3	9
2110	5	3	18
2111	5	3	25
1588	5	3	21
2112	5	3	26
2113	5	3	22
720	43	3	22
2114	43	3	13
722	43	3	4
1242	43	3	5
723	43	3	20
729	43	3	18
2115	43	3	25
1071	43	3	10
732	43	3	7
734	43	3	11
728	43	3	8
1239	43	3	1
1247	43	3	9
721	43	3	12
1251	43	3	17
735	43	3	26
724	43	3	2
1241	43	3	3
2116	43	3	24
2117	43	3	6
730	43	3	16
737	43	3	15
2118	43	3	21
1072	43	3	23
1244	43	3	14
828	49	3	1
832	49	3	23
830	49	3	4
2119	49	3	18
2120	49	3	17
831	49	3	26
837	49	3	21
839	49	3	20
836	49	3	5
2121	49	3	19
842	49	3	10
833	49	3	14
2122	49	3	12
2123	49	3	7
2124	49	3	6
2125	49	3	16
841	49	3	9
2126	49	3	13
845	49	3	25
844	49	3	11
2127	49	3	3
838	49	3	22
2128	49	3	8
829	49	3	2
2129	49	3	15
2130	49	3	24
1535	11	3	1
1537	11	3	3
147	11	3	4
912	11	3	6
918	11	3	2
919	11	3	10
153	11	3	5
152	11	3	7
2131	11	3	9
156	11	3	20
161	11	3	11
2132	11	3	22
2133	11	3	16
917	11	3	15
154	11	3	17
910	11	3	23
2134	11	3	13
2135	11	3	19
915	11	3	24
1541	11	3	18
911	11	3	12
1767	11	3	8
160	11	3	26
157	11	3	21
2136	11	3	25
148	11	3	14
2137	56	3	23
1489	56	3	5
2138	56	3	2
1478	56	3	4
2139	56	3	8
2140	56	3	16
2141	56	3	25
1488	56	3	14
1484	56	3	9
1481	56	3	20
1486	56	3	10
1496	56	3	17
2142	56	3	22
1497	56	3	1
2143	56	3	6
1494	56	3	26
2144	56	3	19
2145	56	3	3
2146	56	3	24
2147	56	3	15
1495	56	3	7
2148	56	3	21
2149	56	3	18
1493	56	3	11
1498	56	3	12
2150	56	3	13
449	27	3	9
2151	10	3	11
725	43	3	19
2152	47	3	25
2153	33	3	26
2154	11	3	9
\.


ALTER TABLE public.convocacoes ENABLE TRIGGER ALL;

--
-- Data for Name: eventosjogo; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.eventosjogo DISABLE TRIGGER ALL;

COPY public.eventosjogo (id, id_partida, id_jogador, id_selecao, tipo, minuto) FROM stdin;
1	73	1145	58	substituicao	24
2	73	1145	58	gol	43
3	73	1168	33	substituicao	64
4	73	1142	58	substituicao	64
5	73	1137	58	substituicao	70
6	73	1165	33	substituicao	72
7	73	1157	33	substituicao	85
8	73	1132	58	cartao_amarelo	88
9	73	1145	58	gol	91
10	73	1153	33	cartao_amarelo	93
11	74	1185	28	substituicao	50
12	74	1210	34	substituicao	58
13	74	1201	34	substituicao	59
14	74	1183	28	substituicao	63
15	74	1182	28	substituicao	82
16	74	1206	34	substituicao	87
17	74	1185	28	cartao_amarelo	93
18	74	1170	28	cartao_amarelo	96
19	75	1229	29	cartao_amarelo	10
20	75	1215	12	cartao_amarelo	34
21	75	484	29	cartao_amarelo	47
22	75	483	29	substituicao	68
23	75	171	12	substituicao	76
24	75	1219	12	substituicao	77
25	75	1233	29	substituicao	81
26	75	1225	12	substituicao	82
27	75	478	29	substituicao	85
28	75	1230	29	cartao_amarelo	92
29	75	\N	29	gol_contra	95
30	76	732	43	penalti_convertido	4
31	76	1262	31	cartao_amarelo	17
32	76	1265	31	gol	24
33	76	728	43	cartao_amarelo	28
34	76	732	43	gol	44
35	76	1265	31	gol	55
36	76	1261	31	gol	58
37	76	1251	43	substituicao	68
38	76	1249	43	substituicao	69
39	76	1273	31	substituicao	70
40	76	1272	31	substituicao	77
41	76	1247	43	substituicao	80
42	76	1271	31	substituicao	86
43	77	1305	17	cartao_amarelo	13
44	77	1301	17	cartao_amarelo	57
45	77	1286	35	penalti_convertido	58
46	77	1303	17	penalti_convertido	62
47	77	1313	17	substituicao	64
48	77	1290	35	substituicao	70
49	77	1291	35	substituicao	70
50	77	262	17	substituicao	72
51	77	1285	35	cartao_amarelo	76
52	77	1287	35	substituicao	78
53	77	\N	35	gol_contra	80
54	77	1317	17	substituicao	84
55	77	258	17	cartao_amarelo	87
56	78	1323	39	gol	19
57	78	1347	60	gol	23
58	78	1334	39	substituicao	54
59	78	1355	60	substituicao	63
60	78	1333	39	substituicao	75
61	78	1353	60	substituicao	76
62	78	1335	39	substituicao	84
63	78	1357	60	substituicao	89
64	79	1395	54	substituicao	35
65	79	1368	61	cartao_amarelo	38
66	79	1394	54	gol	59
67	79	1383	61	substituicao	62
68	79	1400	54	substituicao	67
69	79	1397	54	substituicao	81
70	79	1376	61	substituicao	85
71	79	1390	54	cartao_amarelo	86
72	79	1373	61	substituicao	87
73	79	1394	54	cartao_amarelo	93
74	80	1414	48	cartao_amarelo	30
75	80	\N	48	gol_contra	32
76	80	1423	48	substituicao	60
77	80	1451	59	substituicao	62
78	80	1432	59	cartao_amarelo	70
79	80	1413	48	penalti_convertido	71
80	80	1448	59	substituicao	72
81	80	1428	48	substituicao	78
82	80	1422	48	substituicao	86
83	80	1447	59	substituicao	88
84	80	1423	48	cartao_amarelo	89
85	81	1459	55	cartao_amarelo	22
86	81	1457	55	cartao_amarelo	56
87	81	1480	56	cartao_amarelo	59
88	81	1464	55	substituicao	60
89	81	1474	55	substituicao	67
90	81	1496	56	substituicao	70
91	81	1470	55	substituicao	73
92	81	1492	56	substituicao	83
93	81	1487	56	substituicao	90
94	81	1487	56	cartao_amarelo	98
95	82	13	3	gol	35
96	82	1517	3	cartao_amarelo	40
97	82	9	3	substituicao	58
98	82	1508	19	substituicao	60
99	82	15	3	substituicao	66
100	82	1530	3	substituicao	74
101	82	1513	19	substituicao	79
102	82	1507	19	cartao_amarelo	83
103	82	1499	19	cartao_amarelo	84
104	82	1511	19	substituicao	86
105	82	1522	3	cartao_amarelo	90
106	83	1539	11	gol	20
107	83	1554	10	cartao_amarelo	31
108	83	153	11	cartao_amarelo	47
109	83	1546	11	substituicao	60
110	83	1553	10	cartao_amarelo	65
111	83	1548	11	substituicao	67
112	83	1556	10	cartao_amarelo	68
113	83	135	10	substituicao	71
114	83	1551	11	substituicao	79
115	83	141	10	substituicao	80
116	83	1565	10	substituicao	87
117	84	1596	5	cartao_amarelo	13
118	84	1610	5	substituicao	28
119	84	1598	5	cartao_amarelo	55
120	84	1575	25	cartao_amarelo	61
121	84	1568	25	penalti_convertido	65
122	84	1609	5	substituicao	66
123	84	1584	25	substituicao	71
124	84	1601	5	substituicao	73
125	84	1585	25	substituicao	77
126	84	1581	25	substituicao	81
127	85	438	27	cartao_amarelo	14
128	85	1630	50	cartao_amarelo	18
129	85	1635	50	cartao_amarelo	47
130	85	1616	27	gol	47
131	85	1633	50	cartao_amarelo	49
132	85	1631	50	cartao_amarelo	51
133	85	1632	50	cartao_amarelo	57
134	85	1612	27	cartao_amarelo	59
135	85	1638	50	substituicao	63
136	85	1645	50	substituicao	63
137	85	1646	50	substituicao	73
138	85	1620	27	substituicao	74
139	85	449	27	gol	75
140	85	1624	27	substituicao	83
141	85	444	27	cartao_amarelo	88
142	85	1626	27	substituicao	90
143	86	807	47	gol	11
144	86	1663	26	substituicao	15
145	86	1679	47	cartao_amarelo	33
146	86	423	26	penalti_convertido	35
147	86	808	47	substituicao	68
148	86	1656	26	substituicao	74
149	86	1677	47	substituicao	80
150	86	1657	26	substituicao	85
151	86	1668	47	substituicao	93
152	87	1687	46	cartao_vermelho	3
153	87	1705	24	penalti_convertido	6
154	87	1699	46	substituicao	31
155	87	785	46	substituicao	59
156	87	1699	46	cartao_amarelo	64
157	87	1713	24	substituicao	70
158	87	1697	46	substituicao	70
159	87	1722	24	substituicao	80
160	87	1712	24	substituicao	85
161	87	785	46	cartao_amarelo	86
162	87	1700	24	cartao_amarelo	94
163	88	1730	53	cartao_amarelo	12
164	88	\N	36	gol_contra	37
165	88	1743	53	substituicao	45
166	88	1747	36	cartao_amarelo	49
167	88	1752	36	gol	60
168	88	1761	36	substituicao	62
169	88	1751	36	cartao_amarelo	72
170	88	1740	53	substituicao	73
171	88	1762	36	substituicao	75
172	88	1734	53	substituicao	83
173	88	1754	36	substituicao	87
174	89	\N	58	gol_contra	47
175	89	1178	28	cartao_amarelo	57
176	89	1145	58	gol	59
177	89	1137	58	gol	62
178	89	1179	28	substituicao	64
179	89	1182	28	substituicao	68
180	89	464	28	penalti_convertido	73
181	89	1142	58	substituicao	74
182	89	1131	58	substituicao	79
183	89	1183	28	substituicao	82
184	89	1131	58	cartao_amarelo	84
185	89	1138	58	substituicao	86
186	90	1211	12	cartao_amarelo	40
187	90	1250	43	substituicao	59
188	90	180	12	substituicao	70
189	90	728	43	substituicao	70
190	90	1221	12	substituicao	75
191	90	1218	12	substituicao	86
192	90	1255	43	substituicao	89
193	90	1255	43	cartao_amarelo	92
194	91	1198	34	gol	23
195	91	1167	33	substituicao	44
196	91	1207	34	substituicao	59
197	91	1206	34	substituicao	59
198	91	1159	33	substituicao	75
199	91	1156	33	substituicao	78
200	91	1196	34	substituicao	82
201	92	1265	31	gol	54
202	92	471	29	substituicao	69
203	92	1264	31	substituicao	71
204	92	484	29	substituicao	74
205	92	1228	29	cartao_amarelo	79
206	92	1274	31	substituicao	79
207	92	478	29	substituicao	86
208	92	1278	31	substituicao	89
209	92	1227	29	cartao_amarelo	92
210	93	1389	54	gol	7
211	93	1394	54	cartao_amarelo	37
212	93	1303	17	penalti_convertido	38
213	93	1400	54	substituicao	59
214	93	1404	54	substituicao	68
215	93	1317	17	substituicao	68
216	93	1313	17	substituicao	75
217	93	262	17	substituicao	82
218	93	1393	54	cartao_amarelo	84
219	94	1287	35	cartao_amarelo	16
220	94	1383	61	cartao_amarelo	23
221	94	593	35	gol	34
222	94	1379	61	substituicao	45
223	94	1369	61	substituicao	45
224	94	588	35	substituicao	75
225	94	1291	35	substituicao	80
226	94	1373	61	cartao_amarelo	81
227	94	1376	61	substituicao	82
228	94	1284	35	cartao_amarelo	86
229	94	1295	35	substituicao	89
230	95	1416	48	cartao_amarelo	39
231	95	1332	39	cartao_amarelo	51
232	95	1416	48	gol	53
233	95	1335	39	substituicao	54
234	95	1333	39	substituicao	56
235	95	1412	48	substituicao	57
236	95	1415	48	cartao_amarelo	58
237	95	1411	48	cartao_amarelo	67
238	95	1329	39	substituicao	68
239	95	1413	48	gol	80
240	95	1428	48	substituicao	82
241	95	651	39	cartao_amarelo	85
242	95	1336	39	cartao_amarelo	87
243	95	1414	48	gol	91
244	95	1418	48	substituicao	92
245	95	1418	48	cartao_amarelo	94
246	96	1544	11	substituicao	45
247	96	1464	55	substituicao	54
248	96	1551	11	substituicao	68
249	96	1459	55	substituicao	75
250	96	919	11	cartao_amarelo	81
251	96	1539	11	cartao_amarelo	81
252	96	1475	55	substituicao	83
253	96	1456	55	cartao_amarelo	84
254	96	1539	11	gol	91
255	96	1546	11	substituicao	93
256	96	919	11	gol	97
257	97	1433	59	cartao_amarelo	44
258	97	1445	59	substituicao	45
259	97	1451	59	gol	49
260	97	1356	60	substituicao	65
261	97	1357	60	substituicao	71
262	97	1451	59	gol	75
263	97	1438	59	substituicao	85
264	97	1353	60	substituicao	87
265	97	1440	59	substituicao	90
266	98	1481	56	cartao_amarelo	34
267	98	1483	56	cartao_amarelo	39
268	98	1482	56	cartao_amarelo	47
269	98	1560	10	substituicao	45
270	98	134	10	gol	52
271	98	1485	56	substituicao	64
272	98	141	10	substituicao	73
273	98	1495	56	substituicao	81
274	98	1484	56	cartao_amarelo	87
275	98	1559	10	gol	90
276	98	1559	10	cartao_amarelo	91
277	98	1561	10	substituicao	94
278	99	1615	27	penalti_convertido	6
279	99	423	26	cartao_amarelo	14
280	99	449	27	gol	16
281	99	1659	26	substituicao	24
282	99	1664	26	substituicao	41
283	99	449	27	gol	48
284	99	1615	27	gol	51
285	99	1617	27	substituicao	59
286	99	431	26	substituicao	59
287	99	1623	27	substituicao	68
288	99	439	27	substituicao	86
289	99	1623	27	gol	90
290	99	1655	26	gol	93
291	100	1520	3	penalti_convertido	26
292	100	1589	5	cartao_amarelo	58
293	100	1592	5	cartao_amarelo	63
294	100	1601	5	substituicao	64
295	100	1523	3	gol	66
296	100	1530	3	substituicao	68
297	100	1531	3	substituicao	71
298	100	1601	5	cartao_amarelo	72
299	100	1528	3	substituicao	77
300	100	1609	5	substituicao	77
301	100	1609	5	cartao_amarelo	80
302	100	1606	5	substituicao	84
303	100	1597	5	gol	93
304	101	1512	19	substituicao	31
305	101	1576	25	gol	32
306	101	1513	19	substituicao	45
307	101	1508	19	gol	48
308	101	1572	25	cartao_amarelo	52
309	101	1500	19	cartao_amarelo	71
310	101	1582	25	substituicao	74
311	101	1580	25	substituicao	78
312	101	1500	19	cartao_vermelho	82
313	101	1511	19	substituicao	87
314	101	1585	25	substituicao	90
315	101	1573	25	cartao_amarelo	97
316	102	1633	50	cartao_amarelo	10
317	102	807	47	penalti_convertido	22
318	102	1677	47	cartao_amarelo	24
319	102	1681	47	gol	36
320	102	848	50	cartao_amarelo	44
321	102	807	47	penalti_convertido	46
322	102	807	47	gol	62
323	102	1642	50	substituicao	62
324	102	1675	47	substituicao	63
325	102	1676	47	substituicao	63
326	102	1647	50	substituicao	69
327	102	1644	50	substituicao	69
328	102	1674	47	substituicao	70
329	102	1631	50	cartao_amarelo	72
330	102	1644	50	gol	78
331	103	606	36	gol	11
332	103	1709	24	gol	34
333	103	1752	36	cartao_amarelo	59
334	103	1754	36	substituicao	65
335	103	1709	24	cartao_amarelo	68
336	103	1749	36	gol	71
337	103	1713	24	substituicao	72
338	103	1712	24	substituicao	75
339	103	1713	24	gol	78
340	103	1761	36	substituicao	81
341	103	1753	36	substituicao	86
342	103	1711	24	substituicao	87
343	103	1748	36	cartao_amarelo	90
344	103	1761	36	cartao_amarelo	91
345	103	1706	24	cartao_amarelo	94
346	104	1693	46	substituicao	32
347	104	1732	53	substituicao	57
348	104	1743	53	cartao_amarelo	61
349	104	1688	46	gol	70
350	104	1738	53	substituicao	72
351	104	782	46	substituicao	73
352	104	1690	46	gol	75
353	104	1697	46	substituicao	78
354	104	1735	53	substituicao	80
355	104	1745	53	cartao_amarelo	85
356	105	464	28	gol	22
357	105	1171	28	cartao_amarelo	50
358	105	1152	33	penalti_convertido	51
359	105	1179	28	substituicao	52
360	105	1182	28	substituicao	64
361	105	1157	33	substituicao	65
362	105	1155	33	substituicao	79
363	105	1183	28	substituicao	81
364	105	1173	28	cartao_amarelo	86
365	105	1154	33	gol	95
366	106	1130	58	cartao_amarelo	9
367	106	\N	34	gol_contra	23
368	106	1144	58	cartao_amarelo	28
369	106	1144	58	cartao_vermelho	36
370	106	1127	58	substituicao	38
371	106	1142	58	substituicao	45
372	106	568	34	cartao_amarelo	59
373	106	1131	58	substituicao	60
374	106	567	34	substituicao	63
375	106	1201	34	substituicao	73
376	106	1197	34	gol	90
377	106	1202	34	substituicao	93
378	107	1242	43	cartao_amarelo	33
379	107	1249	43	gol	45
380	107	470	29	cartao_amarelo	52
381	107	482	29	cartao_amarelo	54
382	107	471	29	substituicao	56
383	107	1249	43	cartao_amarelo	64
384	107	1071	43	substituicao	70
385	107	478	29	substituicao	70
386	107	1230	29	substituicao	76
387	107	732	43	cartao_amarelo	83
388	107	1245	43	substituicao	84
389	107	1230	29	penalti_convertido	93
390	107	1073	43	substituicao	96
391	107	1243	43	cartao_amarelo	98
392	108	1222	12	gol	14
393	108	1266	31	gol	19
394	108	1215	12	cartao_amarelo	21
395	108	1212	12	cartao_amarelo	29
396	108	1225	12	cartao_amarelo	31
397	108	1214	12	cartao_amarelo	31
398	108	1218	12	substituicao	63
399	108	176	12	substituicao	72
400	108	1272	31	substituicao	74
401	108	1274	31	substituicao	74
402	108	1278	31	substituicao	84
403	108	1219	12	substituicao	85
404	108	164	12	cartao_amarelo	89
405	108	1272	31	gol	91
406	108	165	12	cartao_amarelo	94
407	109	1303	17	cartao_amarelo	10
408	109	1371	61	gol	18
409	109	1367	61	cartao_amarelo	45
410	109	1373	61	substituicao	45
411	109	1383	61	gol	50
412	109	1316	17	substituicao	53
413	109	1317	17	substituicao	58
414	109	1317	17	cartao_amarelo	60
415	109	1377	61	substituicao	63
416	109	1307	17	cartao_amarelo	66
417	109	262	17	substituicao	72
418	109	1381	61	substituicao	79
419	109	1377	61	cartao_amarelo	79
420	109	1299	17	cartao_amarelo	88
421	110	1397	54	cartao_amarelo	48
422	110	1297	35	substituicao	50
423	110	1405	54	substituicao	60
424	110	1291	35	substituicao	68
425	110	1398	54	substituicao	75
426	110	593	35	substituicao	78
427	110	1399	54	substituicao	92
428	111	1422	48	cartao_amarelo	14
429	111	1420	48	gol	53
430	111	1343	60	cartao_amarelo	59
431	111	1347	60	cartao_amarelo	64
432	111	1426	48	substituicao	65
433	111	1409	48	substituicao	70
434	111	1357	60	substituicao	70
435	111	1348	60	penalti_convertido	76
436	111	1414	48	substituicao	81
437	111	1429	48	cartao_amarelo	83
438	111	1342	60	cartao_amarelo	84
439	111	1349	60	substituicao	85
440	111	1354	60	substituicao	90
441	111	1417	48	gol	90
442	112	662	39	gol	14
443	112	1431	59	cartao_amarelo	32
444	112	1438	59	substituicao	45
445	112	1322	39	cartao_amarelo	49
446	112	1439	59	penalti_convertido	51
447	112	1333	39	substituicao	61
448	112	1334	39	cartao_amarelo	64
449	112	1325	39	substituicao	72
450	112	1323	39	substituicao	80
451	112	1319	39	gol	86
452	112	1440	59	substituicao	90
453	112	1435	59	cartao_amarelo	91
454	112	1447	59	substituicao	92
455	112	662	39	cartao_amarelo	94
456	113	5	3	cartao_amarelo	1
457	113	1573	25	cartao_amarelo	26
458	113	1570	25	gol	50
459	113	1581	25	substituicao	57
460	113	1517	3	cartao_amarelo	61
461	113	1568	25	penalti_convertido	62
462	113	1534	3	substituicao	65
463	113	1585	25	substituicao	68
464	113	\N	25	gol_contra	74
465	113	1531	3	substituicao	75
466	113	1584	25	substituicao	80
467	113	1524	3	cartao_amarelo	86
468	113	1571	25	cartao_amarelo	88
469	113	1533	3	substituicao	89
470	114	1609	5	cartao_amarelo	9
471	114	1595	5	cartao_amarelo	23
472	114	1600	5	cartao_amarelo	48
473	114	1598	5	substituicao	56
474	114	1513	19	substituicao	58
475	114	1507	19	substituicao	63
476	114	1597	5	cartao_amarelo	65
477	114	1607	5	substituicao	69
478	114	1511	19	substituicao	78
479	114	1604	5	substituicao	79
480	114	1589	5	gol	93
481	114	1597	5	gol	96
482	115	1549	11	substituicao	10
483	115	1485	56	cartao_amarelo	33
484	115	1540	11	gol	36
485	115	1482	56	cartao_amarelo	48
486	115	1546	11	substituicao	66
487	115	1484	56	cartao_amarelo	70
488	115	1488	56	substituicao	75
489	115	1548	11	substituicao	80
490	115	1495	56	substituicao	82
491	115	1493	56	substituicao	89
492	116	1460	55	cartao_amarelo	11
493	116	1474	55	cartao_amarelo	29
494	116	1555	10	gol	31
495	116	1554	10	cartao_amarelo	37
496	116	135	10	substituicao	60
497	116	1561	10	substituicao	69
498	116	135	10	cartao_amarelo	75
499	116	1565	10	substituicao	81
500	116	1473	55	substituicao	81
501	116	1553	10	cartao_amarelo	83
502	116	1561	10	gol	88
503	116	1468	55	cartao_amarelo	89
504	116	1472	55	substituicao	91
505	116	1465	55	substituicao	93
506	116	\N	55	gol_contra	93
507	117	1708	24	substituicao	47
508	117	1743	53	gol	59
509	117	1709	24	substituicao	65
510	117	1721	24	cartao_amarelo	66
511	117	1738	53	substituicao	79
512	117	1736	53	substituicao	79
513	117	1706	24	substituicao	82
514	118	1691	46	substituicao	31
515	118	779	46	cartao_amarelo	45
516	118	1752	36	cartao_amarelo	51
517	118	1749	36	substituicao	74
518	118	1762	36	substituicao	80
519	118	782	46	substituicao	83
520	118	1765	36	substituicao	86
521	118	1696	46	substituicao	89
522	119	439	27	cartao_amarelo	19
523	119	1625	27	cartao_amarelo	33
524	119	1678	47	substituicao	45
525	119	1622	27	gol	51
526	119	1618	27	substituicao	74
527	119	1673	47	substituicao	79
528	119	1616	27	substituicao	86
529	120	\N	50	gol_contra	33
530	120	423	26	cartao_amarelo	44
531	120	1640	50	substituicao	45
532	120	1653	26	substituicao	45
533	120	1654	26	gol	51
534	120	1646	50	substituicao	56
535	120	1655	26	gol	66
536	120	1653	26	cartao_amarelo	71
537	120	1662	26	substituicao	77
538	120	1642	50	cartao_amarelo	78
539	120	1629	50	cartao_amarelo	80
540	120	1647	50	substituicao	81
541	120	1666	26	substituicao	89
542	120	1658	26	cartao_amarelo	93
543	120	1646	50	cartao_amarelo	96
544	121	1319	39	cartao_amarelo	11
545	121	1286	35	penalti_convertido	13
546	121	652	39	cartao_amarelo	19
547	121	1324	39	gol	41
548	121	1322	39	cartao_amarelo	43
549	121	1330	39	substituicao	45
550	121	1332	39	gol	48
551	121	1334	39	cartao_amarelo	50
552	121	1283	35	gol	57
553	121	593	35	gol	64
554	121	1323	39	substituicao	66
555	121	593	35	gol	68
556	121	1287	35	cartao_amarelo	72
557	121	1283	35	cartao_amarelo	73
558	121	1325	39	substituicao	75
559	121	1285	35	substituicao	75
560	121	1291	35	substituicao	83
561	121	1288	35	substituicao	89
562	121	651	39	cartao_amarelo	93
563	121	1290	35	cartao_amarelo	93
564	122	1197	34	gol	62
565	122	1201	34	substituicao	63
566	122	1249	43	substituicao	65
567	122	1247	43	substituicao	74
568	122	1209	34	substituicao	74
569	122	1210	34	substituicao	81
570	122	1246	43	substituicao	84
571	122	732	43	cartao_amarelo	93
572	123	\N	31	gol_contra	12
573	123	1259	31	cartao_amarelo	40
574	123	1137	58	penalti_convertido	41
575	123	1139	58	substituicao	45
576	123	1125	58	cartao_amarelo	54
577	123	1145	58	substituicao	61
578	123	1131	58	substituicao	65
579	123	1263	31	substituicao	67
580	123	509	31	substituicao	70
581	123	1129	58	cartao_amarelo	71
582	123	1272	31	substituicao	80
583	123	1143	58	substituicao	97
584	123	1278	31	substituicao	104
585	124	1397	54	gol	1
586	124	1415	48	gol	4
587	124	1395	54	substituicao	45
588	124	1392	54	substituicao	66
589	124	1428	48	substituicao	71
590	124	1427	48	substituicao	81
591	124	1412	48	substituicao	97
592	124	1402	54	substituicao	98
593	124	1393	54	substituicao	105
594	124	1420	48	substituicao	108
595	124	1397	54	cartao_amarelo	115
596	125	9	3	cartao_amarelo	38
597	125	1549	11	cartao_amarelo	43
598	125	1524	3	substituicao	45
599	125	919	11	gol	51
600	125	1522	3	cartao_amarelo	55
601	125	1526	3	substituicao	55
602	125	153	11	cartao_amarelo	59
603	125	15	3	substituicao	60
604	125	1519	3	cartao_amarelo	77
605	125	1546	11	substituicao	80
606	125	1551	11	substituicao	86
607	125	1551	11	gol	88
608	125	147	11	substituicao	91
609	125	1521	3	cartao_amarelo	92
610	126	1707	24	cartao_amarelo	40
611	126	1710	24	gol	48
612	126	1709	24	gol	52
613	126	1617	27	substituicao	65
614	126	1626	27	substituicao	65
615	126	1722	24	substituicao	81
616	126	1713	24	substituicao	81
617	126	1626	27	gol	94
618	127	1571	25	cartao_amarelo	31
619	127	1556	10	cartao_amarelo	61
620	127	1574	25	gol	66
621	127	134	10	cartao_amarelo	68
622	127	141	10	substituicao	73
623	127	1557	10	substituicao	73
624	127	1587	25	substituicao	82
625	127	1579	25	substituicao	82
626	127	1585	25	substituicao	91
627	127	1565	10	cartao_vermelho	94
628	128	1699	46	cartao_amarelo	41
629	128	781	46	cartao_amarelo	52
630	128	1687	46	cartao_amarelo	54
631	128	979	47	cartao_amarelo	56
632	128	807	47	penalti_convertido	57
633	128	1697	46	substituicao	61
634	128	1688	46	cartao_amarelo	63
635	128	1697	46	cartao_amarelo	64
636	128	1681	47	cartao_amarelo	69
637	128	1693	46	substituicao	79
638	128	1668	47	substituicao	81
639	128	1691	46	substituicao	88
640	128	1675	47	substituicao	88
641	128	1674	47	substituicao	102
642	128	808	47	substituicao	113
643	128	1698	46	substituicao	116
644	128	1690	46	cartao_amarelo	118
645	129	1282	35	cartao_amarelo	33
646	129	568	34	cartao_amarelo	38
647	129	1202	34	substituicao	59
648	129	1201	34	substituicao	59
649	129	1286	35	gol	61
650	129	1201	34	cartao_amarelo	69
651	129	593	35	cartao_amarelo	69
652	129	1203	34	substituicao	73
653	129	1295	35	substituicao	80
654	129	588	35	substituicao	88
655	129	1291	35	substituicao	93
656	130	\N	27	gol_contra	13
657	130	444	27	gol	31
658	130	1551	11	substituicao	45
659	130	1613	27	cartao_amarelo	47
660	130	1544	11	substituicao	58
661	130	438	27	cartao_amarelo	71
662	130	1548	11	substituicao	73
663	130	1768	27	substituicao	83
664	130	1546	11	cartao_amarelo	85
665	130	439	27	substituicao	87
666	130	1550	11	cartao_amarelo	90
667	131	1580	25	substituicao	65
668	131	1587	25	substituicao	65
669	131	1676	47	substituicao	77
670	131	1668	47	substituicao	85
671	131	1569	25	substituicao	85
672	131	1678	47	cartao_amarelo	87
673	131	1580	25	cartao_amarelo	87
674	131	808	47	substituicao	91
675	131	1573	25	cartao_amarelo	94
676	132	1145	58	gol	31
677	132	1409	48	cartao_amarelo	35
678	132	1410	48	cartao_amarelo	38
679	132	1143	58	substituicao	54
680	132	1423	48	substituicao	63
681	132	1131	58	substituicao	67
682	132	1427	48	substituicao	74
683	132	1130	58	substituicao	79
684	132	1428	48	substituicao	88
685	132	1418	48	substituicao	97
686	132	1408	48	cartao_amarelo	101
687	132	1128	58	substituicao	102
688	132	1130	58	cartao_amarelo	109
689	132	1427	48	cartao_amarelo	114
690	133	1616	27	substituicao	60
691	133	1615	27	cartao_amarelo	63
692	133	1613	27	cartao_amarelo	71
693	133	1614	27	substituicao	80
694	133	1295	35	substituicao	85
695	133	1285	35	substituicao	86
696	133	990	35	cartao_amarelo	87
697	133	1623	27	substituicao	91
698	133	593	35	cartao_amarelo	93
699	133	1612	27	cartao_amarelo	94
700	134	1415	48	cartao_amarelo	48
701	134	1679	47	cartao_amarelo	54
702	134	1417	48	gol	68
703	134	808	47	substituicao	74
704	134	1674	47	substituicao	90
705	134	1427	48	substituicao	95
706	134	1416	48	cartao_amarelo	96
707	134	1668	47	substituicao	97
708	134	1412	48	substituicao	101
709	134	1415	48	gol	109
710	134	1675	47	substituicao	112
711	134	1418	48	substituicao	115
712	134	1420	48	substituicao	119
713	135	438	27	gol	4
714	135	1768	27	substituicao	39
715	135	808	47	substituicao	45
716	135	1681	47	substituicao	45
717	135	793	47	cartao_amarelo	52
718	135	1616	27	substituicao	60
719	135	1678	47	cartao_amarelo	76
720	135	1620	27	substituicao	78
721	135	1615	27	gol	82
722	135	1680	47	substituicao	84
723	135	897	27	cartao_amarelo	93
724	136	\N	35	gol_contra	18
725	136	990	35	cartao_amarelo	27
726	136	1417	48	gol	28
727	136	1286	35	penalti_convertido	38
728	136	1282	35	cartao_amarelo	41
729	136	1295	35	substituicao	55
730	136	1284	35	gol	59
731	136	593	35	gol	65
732	136	1415	48	gol	69
733	136	1412	48	substituicao	71
734	136	1285	35	substituicao	73
735	136	1291	35	substituicao	81
736	136	1422	48	substituicao	81
737	136	1411	48	cartao_amarelo	92
738	137	1770	9	cartao_amarelo	15
739	137	360	22	penalti_convertido	16
740	137	126	9	cartao_amarelo	22
741	137	350	22	cartao_amarelo	29
742	137	117	9	cartao_amarelo	36
743	137	1787	22	cartao_amarelo	56
744	137	1791	22	substituicao	68
745	137	120	9	substituicao	71
746	137	1778	9	substituicao	72
747	137	1793	22	substituicao	77
748	137	1774	9	cartao_amarelo	78
749	137	1802	22	substituicao	90
750	137	351	22	substituicao	90
751	138	1817	29	substituicao	20
752	138	484	29	cartao_amarelo	25
753	138	1766	29	substituicao	45
754	138	485	29	substituicao	45
755	138	1818	29	substituicao	45
756	138	469	29	cartao_amarelo	48
757	138	806	47	gol	62
758	138	1232	29	substituicao	63
759	138	483	29	gol	65
760	138	1668	47	substituicao	70
761	138	808	47	substituicao	71
762	138	1806	47	substituicao	71
763	138	805	47	substituicao	71
764	138	808	47	gol	71
765	138	1811	47	substituicao	76
766	138	482	29	substituicao	77
767	138	1806	47	gol	90
768	138	483	29	penalti_convertido	103
769	139	1832	23	cartao_amarelo	56
770	139	375	23	substituicao	62
771	139	598	36	substituicao	62
772	139	1823	36	substituicao	69
773	139	603	36	substituicao	73
774	139	610	36	substituicao	73
775	139	1840	23	substituicao	79
776	139	371	23	substituicao	79
777	139	1841	23	substituicao	94
778	139	1821	36	cartao_amarelo	94
779	139	1751	36	cartao_amarelo	96
780	139	1840	23	gol	99
781	140	1844	15	cartao_amarelo	11
782	140	225	15	cartao_amarelo	13
783	140	227	15	gol	36
784	140	1867	52	cartao_amarelo	40
785	140	1860	52	cartao_amarelo	48
786	140	1873	52	substituicao	45
787	140	219	15	cartao_amarelo	51
788	140	231	15	substituicao	66
789	140	233	15	substituicao	74
790	140	1855	15	substituicao	74
791	140	1847	15	substituicao	75
792	140	1876	52	substituicao	79
793	140	1867	52	penalti_convertido	82
794	140	1852	15	substituicao	88
795	140	1872	52	substituicao	93
796	140	1870	52	substituicao	95
797	140	1847	15	cartao_amarelo	100
798	141	662	39	penalti_convertido	10
799	141	1896	33	substituicao	49
800	141	1895	33	gol	48
801	141	1154	33	gol	53
802	141	1885	39	substituicao	59
803	141	664	39	substituicao	59
804	141	654	39	substituicao	59
805	141	1893	33	cartao_amarelo	67
806	141	1336	39	substituicao	71
807	141	1158	33	cartao_amarelo	75
808	141	1906	33	substituicao	78
809	141	1154	33	cartao_amarelo	79
810	141	542	33	cartao_amarelo	82
811	141	1896	33	cartao_amarelo	88
812	141	1904	33	substituicao	88
813	141	1903	33	substituicao	89
814	141	1163	33	cartao_amarelo	92
815	141	1151	33	substituicao	99
816	142	1910	54	cartao_amarelo	24
817	142	1918	54	substituicao	46
818	142	1921	54	substituicao	65
819	142	1404	54	substituicao	65
820	142	1919	54	substituicao	65
821	142	431	26	substituicao	67
822	142	1921	54	cartao_amarelo	78
823	142	425	26	substituicao	80
824	142	1926	26	substituicao	80
825	142	1926	26	cartao_amarelo	86
826	142	1925	26	substituicao	88
827	142	423	26	substituicao	88
828	143	3	3	cartao_amarelo	29
829	143	1953	53	substituicao	45
830	143	1517	3	cartao_amarelo	56
831	143	8	3	substituicao	71
832	143	15	3	substituicao	71
833	143	1945	53	substituicao	72
834	143	1945	53	cartao_amarelo	76
835	143	1933	3	substituicao	84
836	143	1728	53	substituicao	87
837	144	267	17	gol	9
838	144	987	35	substituicao	13
839	144	1290	35	gol	32
840	144	1962	17	cartao_amarelo	55
841	144	1966	17	substituicao	56
842	144	1971	17	substituicao	73
843	144	1969	17	substituicao	73
844	144	1958	35	substituicao	77
845	144	591	35	substituicao	77
846	144	262	17	cartao_amarelo	80
847	144	1973	17	substituicao	85
848	144	261	17	substituicao	85
849	144	579	35	substituicao	89
850	144	994	35	substituicao	89
851	144	1302	17	cartao_amarelo	94
852	145	1996	48	substituicao	45
853	145	1981	12	substituicao	60
854	145	177	12	substituicao	65
855	145	1990	48	substituicao	71
856	145	171	12	cartao_amarelo	78
857	145	820	48	substituicao	79
858	145	1978	12	substituicao	81
859	145	1980	12	substituicao	82
860	145	1995	48	substituicao	90
861	146	1512	19	penalti_convertido	33
862	146	2013	24	substituicao	45
863	146	2017	24	substituicao	57
864	146	2015	24	substituicao	57
865	146	2002	19	substituicao	67
866	146	300	19	substituicao	67
867	146	390	24	substituicao	71
868	146	392	24	substituicao	74
869	146	390	24	gol	75
870	146	2007	19	substituicao	79
871	146	2004	19	substituicao	79
872	146	2015	24	gol	83
873	146	2005	19	substituicao	90
874	147	517	31	gol	11
875	147	1274	31	gol	21
876	147	519	31	penalti_convertido	31
877	147	1468	55	substituicao	45
878	147	519	31	gol	54
879	147	520	31	substituicao	57
880	147	2020	31	substituicao	57
881	147	2041	55	substituicao	61
882	147	1463	55	substituicao	61
883	147	2026	31	substituicao	64
884	147	1264	31	substituicao	64
885	147	1459	55	cartao_amarelo	68
886	147	518	31	substituicao	69
887	147	2038	55	substituicao	72
888	147	2044	55	substituicao	82
889	147	2020	31	gol	90
890	147	520	31	gol	92
891	147	1474	55	cartao_amarelo	97
892	148	1614	27	cartao_amarelo	9
893	148	1623	27	gol	44
894	148	438	27	substituicao	45
895	148	440	27	substituicao	45
896	148	438	27	cartao_amarelo	53
897	148	440	27	cartao_amarelo	56
898	148	89	7	substituicao	58
899	148	82	7	substituicao	58
900	148	447	27	substituicao	62
901	148	2057	7	substituicao	74
902	148	448	27	substituicao	78
903	148	88	7	substituicao	81
904	148	83	7	substituicao	81
905	148	74	7	cartao_amarelo	81
906	148	75	7	cartao_amarelo	83
907	149	2070	57	cartao_amarelo	36
908	149	141	10	gol	48
909	149	131	10	cartao_amarelo	64
910	149	2091	57	substituicao	68
911	149	2062	10	substituicao	71
912	149	1111	10	substituicao	72
913	149	1557	10	substituicao	72
914	149	2081	57	substituicao	74
915	149	2078	57	substituicao	74
916	149	137	10	substituicao	81
917	149	2080	57	substituicao	81
918	149	129	10	cartao_amarelo	83
919	149	1105	10	substituicao	90
920	150	1193	34	cartao_amarelo	57
921	150	1197	34	substituicao	64
922	150	2109	5	substituicao	74
923	150	2107	5	substituicao	74
924	150	2110	5	substituicao	75
925	150	2092	34	substituicao	78
926	150	2097	34	substituicao	79
927	150	1194	34	substituicao	88
928	150	2109	5	cartao_amarelo	88
929	151	839	49	cartao_amarelo	45
930	151	842	49	cartao_amarelo	49
931	151	1244	43	substituicao	56
932	151	831	49	cartao_amarelo	57
933	151	732	43	penalti_convertido	65
934	151	829	49	substituicao	66
935	151	842	49	gol	73
936	151	844	49	substituicao	77
937	151	841	49	substituicao	77
938	151	737	43	substituicao	77
939	151	734	43	gol	78
940	151	737	43	gol	80
941	151	1251	43	substituicao	88
942	151	735	43	substituicao	88
943	151	2117	43	substituicao	88
944	151	2121	49	cartao_amarelo	91
945	151	2114	43	cartao_amarelo	91
946	151	845	49	substituicao	92
947	151	2128	49	substituicao	92
948	151	728	43	cartao_amarelo	95
949	152	2138	56	cartao_amarelo	7
950	152	2139	56	cartao_amarelo	49
951	152	2146	56	substituicao	57
952	152	1495	56	substituicao	57
953	152	2140	56	cartao_amarelo	64
954	152	2142	56	substituicao	66
955	152	2149	56	substituicao	66
956	152	1767	11	substituicao	75
957	152	157	11	substituicao	76
958	152	1541	11	substituicao	79
959	152	2135	11	substituicao	80
960	152	2143	56	substituicao	83
961	152	160	11	substituicao	87
962	153	1858	52	cartao_amarelo	48
963	153	1876	52	substituicao	57
964	153	1866	52	substituicao	58
965	153	1230	29	substituicao	68
966	153	484	29	substituicao	77
967	153	1232	29	substituicao	77
968	153	1868	52	substituicao	77
969	153	480	29	substituicao	78
970	153	1812	29	substituicao	83
971	153	1857	52	cartao_vermelho	86
972	153	1875	52	substituicao	87
973	153	473	29	cartao_amarelo	94
974	153	484	29	cartao_amarelo	95
975	153	480	29	gol	98
976	153	473	29	gol	101
977	154	1783	9	cartao_amarelo	20
978	154	608	36	cartao_amarelo	30
979	154	608	36	gol	41
980	154	112	9	cartao_amarelo	47
981	154	598	36	cartao_amarelo	52
982	154	1825	36	substituicao	64
983	154	121	9	substituicao	69
984	154	1778	9	substituicao	74
985	154	1823	36	substituicao	74
986	154	609	36	substituicao	74
987	154	602	36	substituicao	77
988	154	1819	36	substituicao	77
989	154	120	9	substituicao	83
990	154	115	9	substituicao	83
991	154	1823	36	gol	84
992	154	1825	36	cartao_amarelo	87
993	154	118	9	cartao_amarelo	91
994	155	378	23	gol	6
995	155	375	23	substituicao	45
996	155	1787	22	cartao_amarelo	57
997	155	1833	23	substituicao	69
998	155	1791	22	substituicao	74
999	155	1841	23	substituicao	79
1000	155	377	23	substituicao	80
1001	155	1802	22	substituicao	90
1002	155	1788	22	substituicao	90
1003	156	1806	47	substituicao	68
1004	156	979	47	substituicao	69
1005	156	231	15	substituicao	77
1006	156	1854	15	substituicao	78
1007	156	808	47	substituicao	78
1008	156	1117	15	substituicao	83
1009	156	1846	15	substituicao	83
1010	157	422	26	cartao_amarelo	26
1011	157	423	26	substituicao	45
1012	157	1309	17	substituicao	64
1013	157	1970	17	substituicao	64
1014	157	419	26	cartao_amarelo	64
1015	157	1655	26	substituicao	67
1016	157	1926	26	substituicao	73
1017	157	1925	26	substituicao	73
1018	157	261	17	substituicao	75
1019	157	1971	17	substituicao	85
1020	157	1973	17	substituicao	85
1021	157	423	26	cartao_amarelo	93
1022	158	1939	53	cartao_amarelo	15
1023	158	1940	53	cartao_amarelo	16
1024	158	1728	53	cartao_amarelo	19
1025	158	1893	33	cartao_amarelo	20
1026	158	1729	53	gol	39
1027	158	1904	33	cartao_amarelo	49
1028	158	1896	33	substituicao	45
1029	158	1943	53	substituicao	63
1030	158	1906	33	substituicao	65
1031	158	1948	53	substituicao	71
1032	158	1731	53	gol	82
1033	158	1902	33	substituicao	85
1034	158	1905	33	substituicao	86
1035	158	1165	33	substituicao	95
1036	159	1385	54	cartao_amarelo	20
1037	159	1404	54	cartao_amarelo	23
1038	159	579	35	cartao_amarelo	43
1039	159	1400	54	substituicao	45
1040	159	593	35	gol	61
1041	159	994	35	substituicao	62
1042	159	1398	54	substituicao	73
1043	159	580	35	substituicao	75
1044	159	591	35	substituicao	75
1045	159	1912	54	substituicao	85
1046	159	1916	54	substituicao	92
1047	159	1958	35	substituicao	93
1048	160	1935	3	cartao_amarelo	22
1049	160	1527	3	substituicao	42
1050	160	1890	39	cartao_amarelo	43
1051	160	1527	3	cartao_amarelo	50
1052	160	654	39	substituicao	57
1053	160	664	39	substituicao	63
1054	160	649	39	substituicao	63
1055	160	662	39	gol	64
1056	160	15	3	substituicao	66
1057	160	1933	3	substituicao	66
1058	160	1522	3	cartao_amarelo	66
1059	160	657	39	substituicao	69
1060	160	650	39	substituicao	69
1061	160	17	3	substituicao	73
1062	160	654	39	gol	87
1063	160	17	3	cartao_amarelo	89
1064	161	2033	55	cartao_amarelo	41
1065	161	2014	24	cartao_amarelo	44
1066	161	2016	24	substituicao	45
1067	161	2015	24	substituicao	45
1068	161	1458	55	cartao_amarelo	61
1069	161	2017	24	substituicao	62
1070	161	2038	55	substituicao	65
1071	161	2031	55	substituicao	65
1072	161	394	24	substituicao	67
1073	161	1459	55	cartao_amarelo	70
1074	161	2032	55	gol	81
1075	161	392	24	substituicao	82
1076	161	2009	24	cartao_amarelo	84
1077	161	2045	55	substituicao	89
1078	161	1717	24	cartao_amarelo	93
1079	161	2039	55	substituicao	95
1080	162	440	27	cartao_amarelo	28
1081	162	439	27	substituicao	60
1082	162	1616	27	substituicao	60
1083	162	1981	12	substituicao	67
1084	162	1980	12	substituicao	68
1085	162	1978	12	substituicao	73
1086	162	1983	12	substituicao	73
1087	162	447	27	substituicao	75
1088	162	446	27	substituicao	75
1089	162	169	12	substituicao	78
1090	162	449	27	substituicao	81
1091	162	1983	12	gol	92
1092	162	1980	12	cartao_amarelo	95
1093	163	1412	48	gol	36
1094	163	1990	48	gol	44
1095	163	82	7	substituicao	45
1096	163	83	7	substituicao	45
1097	163	87	7	cartao_amarelo	52
1098	163	1409	48	cartao_amarelo	56
1099	163	1993	48	substituicao	60
1100	163	2051	7	substituicao	62
1101	163	1412	48	gol	70
1102	163	2058	7	substituicao	72
1103	163	946	48	substituicao	73
1104	163	2057	7	substituicao	73
1105	163	80	7	cartao_amarelo	85
1106	163	1413	48	cartao_amarelo	85
1107	163	1995	48	substituicao	86
1108	163	820	48	substituicao	86
1109	163	1996	48	substituicao	86
1110	163	820	48	gol	94
1111	164	2000	19	cartao_amarelo	37
1112	164	1262	31	cartao_amarelo	44
1113	164	520	31	substituicao	54
1114	164	300	19	cartao_amarelo	58
1115	164	297	19	cartao_amarelo	60
1116	164	520	31	gol	62
1117	164	518	31	substituicao	66
1118	164	1264	31	substituicao	66
1119	164	304	19	substituicao	70
1120	164	2004	19	substituicao	70
1121	164	2006	19	substituicao	70
1122	164	2026	31	substituicao	82
1123	164	2004	19	gol	83
1124	164	2002	19	substituicao	85
1125	164	292	19	substituicao	87
1126	165	2067	57	cartao_amarelo	24
1127	165	2084	57	cartao_amarelo	30
1128	165	1481	56	gol	48
1129	165	1493	56	cartao_amarelo	49
1130	165	1484	56	gol	53
1131	165	2081	57	substituicao	55
1132	165	2150	56	substituicao	56
1133	165	2081	57	gol	63
1134	165	2074	57	gol	66
1135	165	2091	57	substituicao	67
1136	165	2084	57	substituicao	67
1137	165	2147	56	substituicao	78
1138	165	1495	56	substituicao	78
1139	165	1494	56	substituicao	79
1140	165	2071	57	substituicao	81
1141	165	2078	57	substituicao	81
1142	165	2148	56	substituicao	92
1143	165	1478	56	cartao_amarelo	93
1144	166	2119	49	cartao_amarelo	21
1145	166	830	49	gol	24
1146	166	1609	5	cartao_amarelo	27
1147	166	2102	5	substituicao	45
1148	166	2110	5	substituicao	57
1149	166	839	49	gol	68
1150	166	829	49	cartao_amarelo	73
1151	166	1589	5	cartao_amarelo	77
1152	166	2128	49	substituicao	78
1153	166	838	49	substituicao	78
1154	166	2127	49	substituicao	78
1155	166	2101	5	substituicao	79
1156	166	832	49	substituicao	83
1157	166	2120	49	substituicao	88
1158	166	2108	5	substituicao	92
1159	167	157	11	substituicao	45
1160	167	137	10	cartao_amarelo	50
1161	167	1767	11	cartao_amarelo	52
1162	167	154	11	substituicao	58
1163	167	2065	10	substituicao	59
1164	167	2151	10	substituicao	59
1165	167	1541	11	substituicao	73
1166	167	2135	11	substituicao	73
1167	167	140	10	substituicao	76
1168	167	1557	10	substituicao	76
1169	167	153	11	gol	83
1170	167	2062	10	substituicao	86
1171	167	2133	11	substituicao	86
1172	168	568	34	cartao_amarelo	6
1173	168	729	43	cartao_amarelo	38
1174	168	1242	43	substituicao	42
1175	168	563	34	cartao_amarelo	44
1176	168	728	43	gol	54
1177	168	567	34	substituicao	62
1178	168	575	34	substituicao	62
1179	168	737	43	substituicao	69
1180	168	1202	34	substituicao	72
1181	168	1198	34	substituicao	73
1182	168	734	43	cartao_amarelo	77
1183	168	735	43	substituicao	82
1184	168	1072	43	substituicao	82
1185	168	2117	43	substituicao	82
1186	168	2097	34	substituicao	86
1187	168	722	43	cartao_amarelo	89
1188	168	728	43	penalti_convertido	93
1189	169	607	36	penalti_convertido	44
1190	169	1793	22	substituicao	45
1191	169	1791	22	substituicao	45
1192	169	1796	22	substituicao	64
1193	169	1751	36	cartao_amarelo	66
1194	169	1821	36	substituicao	74
1195	169	1823	36	substituicao	75
1196	169	1799	22	substituicao	85
1197	169	1819	36	substituicao	95
1198	170	378	23	gol	26
1199	170	366	23	cartao_amarelo	52
1200	170	117	9	substituicao	64
1201	170	1778	9	substituicao	64
1202	170	1785	9	substituicao	64
1203	170	1833	23	substituicao	66
1204	170	1836	23	substituicao	66
1205	170	377	23	substituicao	83
1206	170	371	23	substituicao	83
1207	170	1784	9	substituicao	85
1208	170	1777	9	substituicao	85
1209	170	1842	23	substituicao	86
1210	171	223	15	cartao_amarelo	43
1211	171	1812	29	substituicao	48
1212	171	478	29	substituicao	45
1213	171	231	15	substituicao	45
1214	171	1847	15	substituicao	65
1215	171	1232	29	substituicao	71
1216	171	1814	29	substituicao	72
1217	171	1233	29	cartao_amarelo	77
1218	171	233	15	substituicao	77
1219	171	1230	29	substituicao	78
1220	171	1854	15	substituicao	82
1221	171	1843	15	substituicao	82
1222	171	1818	29	cartao_amarelo	83
1223	171	1814	29	cartao_amarelo	96
1224	172	1866	52	cartao_amarelo	29
1225	172	1865	52	substituicao	36
1226	172	1876	52	substituicao	45
1227	172	805	47	gol	51
1228	172	796	47	substituicao	57
1229	172	1811	47	substituicao	58
1230	172	1808	47	substituicao	58
1231	172	1870	52	substituicao	59
1232	172	1862	52	cartao_amarelo	61
1233	172	1683	47	substituicao	65
1234	172	808	47	gol	68
1235	172	1806	47	substituicao	76
1236	172	1861	52	substituicao	77
1237	172	1879	52	substituicao	81
1238	173	258	17	cartao_amarelo	4
1239	173	1973	17	substituicao	45
1240	173	1916	54	substituicao	45
1241	173	261	17	cartao_amarelo	57
1242	173	1398	54	substituicao	59
1243	173	1918	54	substituicao	59
1244	173	1305	17	gol	60
1245	173	1914	54	substituicao	69
1246	173	1404	54	substituicao	70
1247	173	1968	17	substituicao	74
1248	173	1914	54	cartao_amarelo	75
1249	173	1309	17	substituicao	82
1250	173	1970	17	substituicao	89
1251	174	1925	26	cartao_amarelo	28
1252	174	1655	26	gol	58
1253	174	1923	26	substituicao	60
1254	174	578	35	substituicao	63
1255	174	586	35	substituicao	63
1256	174	593	35	substituicao	63
1257	174	1286	35	substituicao	73
1258	174	1658	26	substituicao	74
1259	174	588	35	substituicao	79
1260	174	419	26	substituicao	83
1261	175	1947	53	substituicao	45
1262	175	1943	53	substituicao	45
1263	175	655	39	gol	46
1264	175	1336	39	cartao_amarelo	49
1265	175	658	39	substituicao	59
1266	175	652	39	substituicao	59
1267	175	1952	53	substituicao	62
1268	175	664	39	gol	67
1269	175	1739	53	substituicao	72
1270	175	1730	53	cartao_amarelo	78
1271	175	1887	39	substituicao	79
1272	175	663	39	substituicao	79
1273	175	1948	53	substituicao	83
1274	175	1884	39	substituicao	84
1275	176	9	3	cartao_amarelo	16
1276	176	1895	33	cartao_amarelo	28
1277	176	1901	33	cartao_amarelo	34
1278	176	2153	33	substituicao	37
1279	176	1900	33	substituicao	45
1280	176	1933	3	substituicao	45
1281	176	1892	33	cartao_amarelo	52
1282	176	1902	33	substituicao	62
1283	176	8	3	substituicao	77
1284	176	15	3	substituicao	77
1285	176	1900	33	cartao_amarelo	81
1286	176	1938	3	substituicao	86
1287	176	1934	3	substituicao	86
1288	176	1165	33	substituicao	88
1289	176	1904	33	cartao_amarelo	91
1290	176	1154	33	gol	95
1291	176	1165	33	cartao_amarelo	97
1292	177	1217	12	gol	4
1293	177	2051	7	cartao_amarelo	7
1294	177	176	12	gol	23
1295	177	83	7	cartao_amarelo	26
1296	177	\N	7	gol_contra	40
1297	177	2057	7	cartao_amarelo	47
1298	177	90	7	substituicao	60
1299	177	2050	7	substituicao	60
1300	177	82	7	substituicao	61
1301	177	1983	12	substituicao	65
1302	177	1975	12	substituicao	65
1303	177	77	7	substituicao	65
1304	177	2059	7	substituicao	76
1305	177	1978	12	substituicao	76
1306	177	169	12	substituicao	77
1307	177	2048	7	cartao_amarelo	84
1308	177	1977	12	substituicao	85
1309	178	449	27	substituicao	45
1310	178	1624	27	substituicao	59
1311	178	1993	48	substituicao	64
1312	178	1996	48	substituicao	64
1313	178	1625	27	cartao_amarelo	66
1314	178	445	27	substituicao	72
1315	178	439	27	substituicao	72
1316	178	1615	27	substituicao	87
1317	178	820	48	substituicao	92
1318	179	2045	55	substituicao	45
1319	179	2006	19	substituicao	45
1320	179	2004	19	substituicao	55
1321	179	1475	55	gol	58
1322	179	303	19	substituicao	66
1323	179	2007	19	substituicao	67
1324	179	2034	55	gol	70
1325	179	303	19	gol	73
1326	179	2044	55	substituicao	74
1327	179	2031	55	substituicao	74
1328	179	1455	55	cartao_amarelo	76
1329	179	303	19	gol	85
1330	179	2033	55	substituicao	93
1331	179	2035	55	substituicao	93
1332	179	1509	19	substituicao	93
1333	180	2009	24	cartao_amarelo	39
1334	180	383	24	cartao_amarelo	44
1335	180	1702	24	cartao_amarelo	45
1336	180	390	24	substituicao	45
1337	180	2017	24	substituicao	45
1338	180	509	31	substituicao	45
1339	180	390	24	gol	48
1340	180	519	31	substituicao	57
1341	180	1274	31	substituicao	57
1342	180	2015	24	substituicao	62
1343	180	1260	31	substituicao	68
1344	180	2028	31	substituicao	68
1345	180	2013	24	substituicao	69
1346	180	1717	24	substituicao	87
1347	181	572	34	cartao_amarelo	19
1348	181	1195	34	substituicao	34
1349	181	838	49	substituicao	45
1350	181	844	49	substituicao	45
1351	181	1198	34	cartao_amarelo	60
1352	181	1197	34	substituicao	66
1353	181	2092	34	substituicao	66
1354	181	845	49	substituicao	72
1355	181	2128	49	substituicao	72
1356	181	1202	34	substituicao	80
1357	181	2094	34	substituicao	80
1358	181	838	49	cartao_amarelo	86
1359	181	1200	34	cartao_amarelo	87
1360	181	2123	49	substituicao	98
1361	181	831	49	cartao_amarelo	99
1362	181	1197	34	cartao_amarelo	100
1363	181	561	34	cartao_amarelo	100
1364	182	2118	43	gol	5
1365	182	1589	5	gol	27
1366	182	2110	5	cartao_amarelo	36
1367	182	2117	43	substituicao	65
1368	182	737	43	substituicao	65
1369	182	1247	43	substituicao	65
1370	182	1598	5	substituicao	66
1371	182	2107	5	substituicao	81
1372	182	2101	5	substituicao	81
1373	182	1071	43	substituicao	81
1374	182	1244	43	substituicao	82
1375	182	1598	5	gol	91
1376	182	1598	5	cartao_amarelo	92
1377	182	2103	5	substituicao	93
1378	183	2069	57	cartao_amarelo	6
1379	183	148	11	cartao_amarelo	7
1380	183	2083	57	cartao_amarelo	28
1381	183	2070	57	cartao_amarelo	32
1382	183	147	11	substituicao	54
1383	183	2132	11	substituicao	55
1384	183	154	11	substituicao	55
1385	183	2075	57	substituicao	64
1386	183	2136	11	substituicao	64
1387	183	2086	57	substituicao	68
1388	183	161	11	substituicao	79
1389	183	2081	57	cartao_amarelo	81
1390	183	154	11	cartao_amarelo	85
1391	183	2082	57	substituicao	86
1392	183	2081	57	cartao_vermelho	93
1393	184	133	10	cartao_amarelo	15
1394	184	1559	10	gol	20
1395	184	2061	10	cartao_amarelo	34
1396	184	2149	56	gol	35
1397	184	141	10	gol	44
1398	184	1481	56	cartao_amarelo	47
1399	184	2139	56	substituicao	55
1400	184	1493	56	substituicao	55
1401	184	2138	56	cartao_amarelo	56
1402	184	1498	56	cartao_amarelo	66
1403	184	2143	56	substituicao	67
1404	184	2065	10	substituicao	68
1405	184	135	10	substituicao	69
1406	184	2148	56	substituicao	78
1407	184	1495	56	substituicao	78
1408	184	2139	56	cartao_amarelo	81
1409	184	1484	56	cartao_amarelo	82
1410	184	1109	10	substituicao	83
1411	184	134	10	cartao_amarelo	95
1412	184	1478	56	cartao_amarelo	95
1413	184	1111	10	substituicao	96
1414	184	1553	10	cartao_amarelo	99
1415	184	2140	56	cartao_amarelo	100
1416	185	375	23	gol	10
1417	185	1834	23	gol	46
1418	185	371	23	substituicao	45
1419	185	1835	23	substituicao	45
1420	185	1117	15	substituicao	45
1421	185	371	23	cartao_amarelo	60
1422	185	233	15	substituicao	67
1423	185	231	15	substituicao	67
1424	185	1855	15	substituicao	75
1425	185	233	15	gol	76
1426	185	373	23	substituicao	83
1427	185	372	23	cartao_amarelo	87
1428	185	1852	15	substituicao	92
1429	185	1832	23	substituicao	93
1430	185	377	23	substituicao	93
1431	186	262	17	cartao_amarelo	15
1432	186	662	39	gol	35
1433	186	261	17	cartao_amarelo	38
1434	186	1885	39	substituicao	50
1435	186	664	39	gol	57
1436	186	267	17	substituicao	58
1437	186	1970	17	substituicao	58
1438	186	663	39	substituicao	71
1439	186	652	39	substituicao	72
1440	186	1969	17	substituicao	72
1441	186	1309	17	substituicao	72
1442	186	1965	17	substituicao	72
1443	186	\N	17	gol_contra	77
1444	186	657	39	substituicao	80
1445	186	1890	39	substituicao	80
1446	187	583	35	cartao_amarelo	31
1447	187	1290	35	gol	44
1448	187	1734	53	cartao_amarelo	47
1449	187	1728	53	substituicao	64
1450	187	1958	35	substituicao	66
1451	187	1942	53	substituicao	71
1452	187	1953	53	substituicao	71
1453	187	593	35	gol	74
1454	187	591	35	substituicao	76
1455	187	994	35	substituicao	76
1456	187	1743	53	substituicao	86
1457	187	1732	53	substituicao	87
1458	187	1940	53	cartao_amarelo	88
1459	187	593	35	gol	91
1460	187	1955	35	substituicao	92
1461	187	1731	53	penalti_convertido	99
1462	188	979	47	gol	39
1463	188	807	47	gol	48
1464	188	603	36	substituicao	45
1465	188	1823	36	substituicao	45
1466	188	602	36	substituicao	45
1467	188	806	47	gol	57
1468	188	808	47	substituicao	65
1469	188	1806	47	substituicao	65
1470	188	1824	36	substituicao	72
1471	188	600	36	cartao_amarelo	76
1472	188	1804	47	substituicao	76
1473	188	1668	47	substituicao	77
1474	188	1808	47	substituicao	82
1475	188	1829	36	substituicao	84
1476	189	2010	24	gol	43
1477	189	825	48	substituicao	62
1478	189	2017	24	substituicao	64
1479	189	2015	24	substituicao	64
1480	189	1996	48	substituicao	68
1481	189	1704	24	substituicao	75
1482	189	392	24	substituicao	87
1483	189	1428	48	cartao_amarelo	90
1484	189	946	48	substituicao	99
1485	189	820	48	substituicao	99
1486	189	387	24	substituicao	105
1487	189	1990	48	substituicao	105
1488	189	1995	48	substituicao	105
1489	189	1991	48	cartao_amarelo	116
1490	190	156	11	gol	7
1491	190	919	11	penalti_convertido	13
1492	190	2131	11	gol	29
1493	190	1609	5	cartao_amarelo	44
1494	190	1606	5	substituicao	45
1495	190	2107	5	substituicao	45
1496	190	2134	11	substituicao	63
1497	190	2104	5	substituicao	65
1498	190	915	11	substituicao	72
1499	190	160	11	substituicao	72
1500	190	2110	5	substituicao	74
1501	190	2104	5	gol	76
1502	190	2101	5	substituicao	80
1503	190	911	11	substituicao	80
1504	190	157	11	substituicao	81
1505	191	520	31	substituicao	63
1506	191	2020	31	substituicao	63
1507	191	177	12	substituicao	66
1508	191	518	31	substituicao	75
1509	191	506	31	cartao_amarelo	76
1510	191	1982	12	substituicao	82
1511	191	1980	12	substituicao	82
1512	191	1981	12	substituicao	82
1513	191	169	12	substituicao	84
1514	191	168	12	cartao_amarelo	90
1515	191	2028	31	substituicao	98
1516	191	2026	31	substituicao	98
1517	191	2024	31	substituicao	118
1518	191	1984	12	substituicao	120
1519	192	735	43	gol	17
1520	192	1553	10	cartao_amarelo	43
1521	192	1105	10	substituicao	45
1522	192	735	43	gol	51
1523	192	135	10	substituicao	54
1524	192	1557	10	substituicao	54
1525	192	1242	43	gol	55
1526	192	129	10	gol	58
1527	192	1105	10	cartao_amarelo	59
1528	192	1111	10	substituicao	66
1529	192	735	43	gol	67
1530	192	732	43	substituicao	73
1531	192	730	43	substituicao	74
1532	192	2118	43	substituicao	74
1533	192	729	43	substituicao	81
1534	192	737	43	substituicao	87
1535	192	138	10	substituicao	89
1536	192	737	43	gol	92
1537	193	918	11	cartao_amarelo	25
1538	193	1423	48	cartao_amarelo	31
1539	193	2135	11	substituicao	56
1540	193	157	11	substituicao	64
1541	193	153	11	cartao_amarelo	68
1542	193	1993	48	substituicao	72
1543	193	946	48	substituicao	72
1544	193	147	11	cartao_amarelo	77
1545	193	2136	11	substituicao	84
1546	193	919	11	gol	106
1547	193	820	48	substituicao	105
1548	193	912	11	substituicao	105
1549	193	1767	11	substituicao	105
1550	193	825	48	substituicao	110
1551	193	1995	48	substituicao	114
1552	193	1993	48	gol	117
1553	193	1993	48	cartao_amarelo	117
1554	194	649	39	gol	35
1555	194	364	23	cartao_amarelo	43
1556	194	1336	39	cartao_amarelo	43
1557	194	650	39	cartao_amarelo	45
1558	194	377	23	cartao_amarelo	47
1559	194	1833	23	substituicao	45
1560	194	371	23	substituicao	45
1561	194	1838	23	substituicao	64
1562	194	658	39	substituicao	66
1563	194	662	39	penalti_convertido	73
1564	194	1885	39	cartao_amarelo	76
1565	194	375	23	cartao_amarelo	76
1566	194	652	39	substituicao	78
1567	194	1887	39	substituicao	78
1568	194	377	23	substituicao	78
1569	194	663	39	substituicao	82
1570	194	1833	23	cartao_amarelo	88
1571	194	658	39	cartao_amarelo	89
1572	194	662	39	cartao_amarelo	100
1573	194	377	23	gol	101
1574	194	651	39	cartao_amarelo	101
1575	194	1835	23	cartao_amarelo	104
1576	194	1890	39	substituicao	105
1577	194	1890	39	cartao_amarelo	109
1578	194	1324	39	substituicao	112
1579	194	1887	39	cartao_amarelo	112
1580	194	1039	23	substituicao	113
1581	194	365	23	cartao_amarelo	120
1582	194	1039	23	cartao_amarelo	120
1583	194	365	23	cartao_vermelho	120
1584	195	723	43	substituicao	51
1585	195	732	43	substituicao	51
1586	195	1986	12	substituicao	57
1587	195	1982	12	substituicao	65
1588	195	1984	12	substituicao	65
1589	195	737	43	substituicao	69
1590	195	730	43	substituicao	69
1591	195	1986	12	cartao_amarelo	70
1592	195	2118	43	substituicao	79
1593	195	1983	12	substituicao	82
1594	195	1977	12	substituicao	82
1595	195	730	43	cartao_amarelo	87
1596	195	1982	12	cartao_amarelo	91
1597	195	1982	12	cartao_vermelho	93
1598	196	583	35	gol	17
1599	196	1286	35	cartao_amarelo	43
1600	196	588	35	cartao_amarelo	46
1601	196	807	47	penalti_convertido	54
1602	196	1804	47	substituicao	79
1603	196	1684	47	substituicao	79
1604	196	591	35	substituicao	79
1605	196	987	35	cartao_amarelo	82
1606	196	808	47	substituicao	85
1607	196	1678	47	cartao_amarelo	90
1608	196	1806	47	substituicao	98
1609	197	1419	48	cartao_amarelo	32
1610	197	1428	48	cartao_amarelo	32
1611	197	662	39	penalti_convertido	34
1612	197	1995	48	substituicao	45
1613	197	946	48	substituicao	45
1614	197	1993	48	substituicao	50
1615	197	1885	39	substituicao	62
1616	197	650	39	cartao_amarelo	68
1617	197	664	39	gol	69
1618	197	651	39	cartao_amarelo	71
1619	197	1990	48	substituicao	72
1620	197	657	39	substituicao	74
1621	197	1329	39	substituicao	74
1622	197	820	48	substituicao	81
1623	197	1891	39	substituicao	86
1624	197	1889	39	substituicao	86
1625	198	1975	12	substituicao	21
1626	198	1976	12	cartao_amarelo	27
1627	198	1981	12	substituicao	45
1628	198	994	35	substituicao	65
1629	198	1978	12	substituicao	66
1630	198	1983	12	substituicao	67
1631	198	177	12	substituicao	78
1632	198	1956	35	substituicao	79
1633	198	1956	35	gol	79
1634	199	1995	48	gol	42
1635	199	1985	12	substituicao	45
1636	199	172	12	substituicao	56
1637	199	946	48	substituicao	61
1638	199	1984	12	substituicao	64
1639	199	1979	12	substituicao	64
1640	199	1993	48	substituicao	66
1641	199	1996	48	substituicao	67
1642	199	1975	12	substituicao	67
1643	199	172	12	cartao_amarelo	69
1644	199	1975	12	cartao_amarelo	84
1645	199	1998	48	substituicao	95
1646	200	662	39	penalti_convertido	23
1647	200	1324	39	gol	36
1648	200	1956	35	substituicao	41
1649	200	994	35	substituicao	41
1650	200	654	39	cartao_amarelo	52
1651	200	586	35	cartao_amarelo	55
1652	200	1336	39	substituicao	64
1653	200	591	35	substituicao	71
1654	200	584	35	substituicao	71
1655	200	593	35	penalti_convertido	80
1656	200	593	35	gol	81
1657	200	994	35	cartao_amarelo	87
1658	200	1290	35	cartao_amarelo	95
1659	200	1336	39	cartao_amarelo	98
1660	200	1890	39	substituicao	90
1661	200	1958	35	substituicao	96
1662	200	658	39	substituicao	102
1663	200	663	39	substituicao	103
1664	200	662	39	gol	108
1665	200	580	35	substituicao	113
1666	200	658	39	cartao_amarelo	114
1667	200	1887	39	substituicao	116
1668	200	1890	39	cartao_amarelo	116
1669	200	593	35	penalti_convertido	118
1670	200	1955	35	substituicao	121
1671	200	1329	39	substituicao	121
1672	200	648	39	cartao_amarelo	120
\.


ALTER TABLE public.eventosjogo ENABLE TRIGGER ALL;

--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.grupos DISABLE TRIGGER ALL;

COPY public.grupos (id, letra, id_edicao) FROM stdin;
1	A	1
2	B	1
3	C	1
4	D	1
5	E	1
6	F	1
7	G	1
8	H	1
9	I	1
10	J	1
11	K	1
12	L	1
13	A	2
14	B	2
15	C	2
16	D	2
17	E	2
18	F	2
19	G	2
20	H	2
21	A	3
22	B	3
23	C	3
24	D	3
25	E	3
26	F	3
27	G	3
28	H	3
\.


ALTER TABLE public.grupos ENABLE TRIGGER ALL;

--
-- Data for Name: participacaogrupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.participacaogrupo DISABLE TRIGGER ALL;

COPY public.participacaogrupo (id_grupo, id_selecao, pontos, jogos, vitorias, empates, derrotas, gols_pro, gols_contra) FROM stdin;
13	58	6	3	2	0	1	8	4
13	33	3	3	1	0	2	2	7
13	28	0	3	0	0	3	2	6
13	34	9	3	3	0	0	5	0
14	43	5	3	1	2	0	5	4
14	31	5	3	1	2	0	6	5
14	12	1	3	0	1	2	2	4
14	29	4	3	1	1	1	2	2
15	35	7	3	2	1	0	3	1
15	17	1	3	0	1	2	2	5
15	61	3	3	1	0	2	2	2
15	54	5	3	1	2	0	2	1
16	39	4	3	1	1	1	3	5
16	60	1	3	0	1	2	2	5
16	48	9	3	3	0	0	7	1
16	59	3	3	1	0	2	3	4
17	11	7	3	2	1	0	5	1
17	10	5	3	1	2	0	5	4
17	55	1	3	0	1	2	2	5
17	56	3	3	1	0	2	2	4
18	19	3	3	1	0	2	2	4
18	3	6	3	2	0	1	3	4
18	25	6	3	2	0	1	5	2
18	5	3	3	1	0	2	3	3
19	27	9	3	3	0	0	9	2
19	50	0	3	0	0	3	2	11
19	26	3	3	1	0	2	5	8
19	47	6	3	2	0	1	8	3
20	53	3	3	1	0	2	2	5
20	36	4	3	1	1	1	4	4
20	46	6	3	2	0	1	5	2
20	24	4	3	1	1	1	4	4
21	9	0	3	0	0	3	1	7
21	22	4	3	1	1	1	4	3
21	36	6	3	2	0	1	5	4
21	23	7	3	2	1	0	5	1
22	47	7	3	2	1	0	9	2
22	29	3	3	1	0	2	4	7
22	15	5	3	1	2	0	2	1
22	52	1	3	0	1	2	1	6
23	39	6	3	2	0	1	5	2
23	33	3	3	1	0	2	3	5
23	3	4	3	1	1	1	2	3
23	53	4	3	1	1	1	2	2
24	35	6	3	2	0	1	6	3
24	17	6	3	2	0	1	3	4
24	54	1	3	0	1	2	1	3
24	26	4	3	1	1	1	1	1
25	31	4	3	1	1	1	9	3
25	55	3	3	1	0	2	3	11
25	19	4	3	1	1	1	6	5
25	24	6	3	2	0	1	4	3
26	27	4	3	1	1	1	1	2
26	7	0	3	0	0	3	2	7
26	12	7	3	2	1	0	4	1
26	48	5	3	1	2	0	4	1
27	11	6	3	2	0	1	3	1
27	56	1	3	0	1	2	5	8
27	10	6	3	2	0	1	4	3
27	57	4	3	1	1	1	4	4
28	43	6	3	2	0	1	6	4
28	49	3	3	1	0	2	5	7
28	34	4	3	1	1	1	2	2
28	5	4	3	1	1	1	4	4
2	7	3	3	0	3	0	0	0
2	10	3	3	0	3	0	0	0
2	8	3	3	0	3	0	0	0
2	9	3	3	0	3	0	0	0
3	11	3	3	0	3	0	0	0
3	14	3	3	0	3	0	0	0
3	12	3	3	0	3	0	0	0
3	13	3	3	0	3	0	0	0
1	3	3	3	0	3	0	0	0
1	6	3	3	0	3	0	0	0
1	4	3	3	0	3	0	0	0
1	5	3	3	0	3	0	0	0
5	20	3	3	0	3	0	0	0
5	21	3	3	0	3	0	0	0
5	19	3	3	0	3	0	0	0
5	22	3	3	0	3	0	0	0
6	24	3	3	0	3	0	0	0
6	25	3	3	0	3	0	0	0
6	23	3	3	0	3	0	0	0
6	26	3	3	0	3	0	0	0
4	15	3	3	0	3	0	0	0
4	18	3	3	0	3	0	0	0
4	16	3	3	0	3	0	0	0
4	17	3	3	0	3	0	0	0
9	35	3	3	0	3	0	0	0
9	38	3	3	0	3	0	0	0
9	36	3	3	0	3	0	0	0
9	37	3	3	0	3	0	0	0
8	32	3	3	0	3	0	0	0
8	33	3	3	0	3	0	0	0
8	31	3	3	0	3	0	0	0
8	34	3	3	0	3	0	0	0
7	28	3	3	0	3	0	0	0
7	29	3	3	0	3	0	0	0
7	27	3	3	0	3	0	0	0
7	30	3	3	0	3	0	0	0
12	47	3	3	0	3	0	0	0
12	50	3	3	0	3	0	0	0
12	48	3	3	0	3	0	0	0
12	49	3	3	0	3	0	0	0
11	43	3	3	0	3	0	0	0
11	46	3	3	0	3	0	0	0
11	44	3	3	0	3	0	0	0
11	45	3	3	0	3	0	0	0
10	40	3	3	0	3	0	0	0
10	41	3	3	0	3	0	0	0
10	39	3	3	0	3	0	0	0
10	42	3	3	0	3	0	0	0
\.


ALTER TABLE public.participacaogrupo ENABLE TRIGGER ALL;

--
-- Data for Name: sedesedicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.sedesedicao DISABLE TRIGGER ALL;

COPY public.sedesedicao (id_edicao, id_pais) FROM stdin;
1	31
1	34
1	37
2	72
3	51
\.


ALTER TABLE public.sedesedicao ENABLE TRIGGER ALL;

--
-- Data for Name: tecnicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.tecnicos DISABLE TRIGGER ALL;

COPY public.tecnicos (id, nome, nacionalidade, id_selecao, id_edicao) FROM stdin;
1	Julian Nagelsmann	Alemanha	19	1
2	Vladimir Petković	Bósnia e Herzegovina	40	1
3	Lionel Scaloni	Argentina	39	1
4	Ralf Rangnick	Alemanha	41	1
5	Rudi Garcia	França	27	1
6	Carlo Ancelotti	Itália	11	1
7	Julen Lopetegui	Espanha	9	1
8	Néstor Lorenzo	Argentina	46	1
9	Hong Myung-bo	Coreia do Sul	5	1
10	Zlatko Dalić	Croácia	48	1
11	Dick Advocaat	Países Baixos	20	1
12	Sebastián Beccacece	Argentina	22	1
13	Steve Clarke	Escócia	14	1
14	Luis de la Fuente	Espanha	31	1
15	Mauricio Pochettino	Argentina	15	1
16	Didier Deschamps	França	35	1
17	Carlos Queiroz	Portugal	49	1
18	Sébastien Migné	França	13	1
19	Ronald Koeman	Países Baixos	23	1
20	Thomas Tuchel	Alemanha	47	1
21	Amir Ghalenoei	Irã	29	1
22	Graham Arnold	Austrália	37	1
23	Hajime Moriyasu	Japão	24	1
24	Walid Regragui	Marrocos	12	1
25	Javier Aguirre	México	3	1
26	Darren Bazeley	Inglaterra	30	1
27	Ståle Solbakken	Noruega	38	1
28	Gustavo Alfaro	Argentina	16	1
29	Roberto Martínez	Espanha	43	1
30	Sébastien Desabre	França	44	1
31	Ivan Hašek	Tchéquia	6	1
32	Pape Thiaw	Senegal	36	1
33	Graham Potter	Inglaterra	25	1
34	Murat Yakin	Suíça	10	1
35	Sami Trabelsi	Tunísia	26	1
36	Vincenzo Montella	Itália	18	1
37	Marcelo Bielsa	Argentina	34	1
38	Fabio Cannavaro	Itália	45	1
39	Não divulgado	\N	4	1
40	Não divulgado	\N	7	1
41	Não divulgado	\N	8	1
42	Não divulgado	\N	17	1
43	Não divulgado	\N	21	1
44	Não divulgado	\N	28	1
45	Não divulgado	\N	32	1
46	Não divulgado	\N	33	1
47	Não divulgado	\N	42	1
48	Não divulgado	\N	50	1
49	Hansi Flick	Alemanha	19	3
50	Hervé Renard	França	33	3
51	Lionel Scaloni	Argentina	39	3
52	Graham Arnold	Austrália	17	3
53	Roberto Martínez	Espanha	27	3
54	Tite	Brasil	11	3
55	Rigobert Song	Camarões	57	3
56	John Herdman	Inglaterra	7	3
57	Félix Sánchez Bas	Espanha	9	3
58	Paulo Bento	Portugal	5	3
59	Luis Fernando Suárez	Colômbia	55	3
60	Zlatko Dalić	Croácia	48	3
61	Kasper Hjulmand	Dinamarca	54	3
62	Gustavo Alfaro	Argentina	22	3
63	Luis Enrique	Espanha	31	3
64	Gregg Berhalter	Estados Unidos	15	3
65	Didier Deschamps	França	35	3
66	Otto Addo	Gana	49	3
67	Louis van Gaal	Holanda	23	3
68	Gareth Southgate	Inglaterra	47	3
69	Carlos Queiroz	Portugal	29	3
70	Hajime Moriyasu	Japão	24	3
71	Walid Regragui	Marrocos	12	3
72	Gerardo Martino	Argentina	3	3
73	Robert Page	País de Gales	52	3
74	Czesław Michniewicz	Polônia	53	3
75	Fernando Santos	Portugal	43	3
76	Aliou Cissé	Senegal	36	3
77	Dragan Stojković	Sérvia	56	3
78	Murat Yakin	Suíça	10	3
79	Jalel Kadri	Tunísia	26	3
80	Diego Alonso	Uruguai	34	3
81	Joachim Löw	Alemanha	19	2
82	Juan Antonio Pizzi	Espanha	33	2
83	Jorge Sampaoli	Argentina	39	2
84	Bert van Marwijk	Holanda	17	2
85	Roberto Martínez	Espanha	27	2
86	Tite	Brasil	11	2
87	José Pékerman	Argentina	46	2
88	Shin Tae-yong	Coreia do Sul	5	2
89	Óscar Ramírez	Costa Rica	55	2
90	Zlatko Dalić	Croácia	48	2
91	Åge Hareide	Noruega	54	2
92	Héctor Cúper	Argentina	28	2
93	Fernando Hierro	Espanha	31	2
94	Didier Deschamps	França	35	2
95	Gareth Southgate	Inglaterra	47	2
96	Carlos Queiroz	Portugal	29	2
97	Heimir Hallgrímsson	Islândia	60	2
98	Akira Nishino	Japão	24	2
99	Hervé Renard	França	12	2
100	Juan Carlos Osorio	Colômbia	3	2
101	Gernot Rohr	Alemanha	59	2
102	Hernán Darío Gómez	Colômbia	50	2
103	Ricardo Gareca	Argentina	61	2
104	Adam Nawałka	Polônia	53	2
105	Fernando Santos	Portugal	43	2
106	Stanislav Tchertchesov	Rússia	58	2
107	Aliou Cissé	Senegal	36	2
108	Mladen Krstajić	Sérvia	56	2
109	Janne Andersson	Suécia	25	2
110	Vladimir Petković	Bósnia e Herzegovina	10	2
111	Nabil Maâloul	Tunísia	26	2
112	Óscar Tabárez	Uruguai	34	2
\.


ALTER TABLE public.tecnicos ENABLE TRIGGER ALL;

--
-- Name: arbitros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arbitros_id_seq', 59, true);


--
-- Name: cidadessede_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cidadessede_id_seq', 18, true);


--
-- Name: confederacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.confederacoes_id_seq', 6, true);


--
-- Name: edicoescopa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.edicoescopa_id_seq', 3, true);


--
-- Name: estadios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estadios_id_seq', 36, true);


--
-- Name: eventosjogo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eventosjogo_id_seq', 1672, true);


--
-- Name: fases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fases_id_seq', 19, true);


--
-- Name: grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupos_id_seq', 28, true);


--
-- Name: jogadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jogadores_id_seq', 2154, true);


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paises_id_seq', 74, true);


--
-- Name: partidas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partidas_id_seq', 200, true);


--
-- Name: selecoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.selecoes_id_seq', 61, true);


--
-- Name: tecnicos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tecnicos_id_seq', 112, true);


--
-- PostgreSQL database dump complete
--

\unrestrict RKpMzOAv2YxPC0vP0asX7WQQi6PPCWUC6dfc3nWt6ZngHbFPwx9nMHQ4Cjv0WzL

