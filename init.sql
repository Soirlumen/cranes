--
-- PostgreSQL database dump
--

\restrict GBwrlAIGHijHDTSu1VHSrNkGgAhlHpGvmadeQS1NqVVAKTYudneueM7eb8s06XF

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: crane_models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crane_models (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    capacity_tons numeric(8,2),
    height_meters numeric(8,2),
    needs_disassembly boolean,
    color character varying(50),
    description text
);


ALTER TABLE public.crane_models OWNER TO postgres;

--
-- Name: crane_models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crane_models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.crane_models_id_seq OWNER TO postgres;

--
-- Name: crane_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crane_models_id_seq OWNED BY public.crane_models.id;


--
-- Name: structure_cranes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structure_cranes (
    structure_id integer NOT NULL,
    crane_id integer NOT NULL
);


ALTER TABLE public.structure_cranes OWNER TO postgres;

--
-- Name: structure_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structure_types (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.structure_types OWNER TO postgres;

--
-- Name: structure_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structure_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.structure_types_id_seq OWNER TO postgres;

--
-- Name: structure_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structure_types_id_seq OWNED BY public.structure_types.id;


--
-- Name: structures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.structures (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    city_id integer,
    type_id integer,
    area_sqm integer,
    is_under_construction boolean DEFAULT false NOT NULL,
    location_details character varying(255)
);


ALTER TABLE public.structures OWNER TO postgres;

--
-- Name: structures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.structures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.structures_id_seq OWNER TO postgres;

--
-- Name: structures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.structures_id_seq OWNED BY public.structures.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: crane_models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crane_models ALTER COLUMN id SET DEFAULT nextval('public.crane_models_id_seq'::regclass);


--
-- Name: structure_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structure_types ALTER COLUMN id SET DEFAULT nextval('public.structure_types_id_seq'::regclass);


--
-- Name: structures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structures ALTER COLUMN id SET DEFAULT nextval('public.structures_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name) FROM stdin;
1	Praha
2	Bobrovec
3	Piešťany
4	Garching
5	Bratislava
\.


--
-- Data for Name: crane_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crane_models (id, name, capacity_tons, height_meters, needs_disassembly, color, description) FROM stdin;
1	Tatra AD 20	20.00	21.50	f	žlutá	Autojeřáb
2	Liebherr 150 EC-B	8.00	45.00	t	žlutá	Věžový jeřáb
3	Demag CC 3800-1	650.00	144.00	t	bílo-červená	Pásový jeřáb
4	Praga V3S AD 080	8.00	11.50	f	oranžová	Lehký autojeřáb
5	Grove RT540E	35.00	31.00	f	žlutá	Terénní kolový jeřáb
6	Potain MDT 219	10.00	65.00	t	bílá	Věžový jeřáb
7	Maeda MC285C-3	2.82	8.70	f	modrá	Mini pavoučí jeřáb
8	Liebherr LTM 11200-9.1	1200.00	188.00	t	žlutá	Těžký autojeřáb
9	Konecranes Gottwald	125.00	50.00	t	šedá	Přístavní mobilní jeřáb
10	Manitowoc 31000	2300.00	105.00	t	červená	Gigantický pásový jeřáb
\.


--
-- Data for Name: structure_cranes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structure_cranes (structure_id, crane_id) FROM stdin;
1	7
1	4
8	6
13	2
22	8
25	3
31	1
33	10
44	5
49	4
52	2
61	6
64	8
73	3
73	2
\.


--
-- Data for Name: structure_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structure_types (id, name) FROM stdin;
1	Dům
2	Panelák
3	Komín
4	Pošta
5	Škola
6	MHD
7	Obchod
8	Kanceláře
9	Továrna
10	Výzkumný ústav
11	Obchodní centrum
12	Stadion
13	Park
\.


--
-- Data for Name: structures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.structures (id, name, city_id, type_id, area_sqm, is_under_construction, location_details) FROM stdin;
1	Petřín	1	13	800000	t	Praha 1
2	Divoká Šárka	1	13	2500000	f	Praha 6
3	Zastávka Dejvická	1	6	800	f	Praha 6, Evropská třída
4	Zastávka Karlovo náměstí	1	6	1200	f	Praha 2, Nové Město
5	Zastávka Náměstí Míru	1	6	1000	f	Praha 2, Vinohrady
6	FJFI ČVUT, Trojanova	1	5	8500	f	Praha 2, Nové Město
7	FJFI ČVUT, Břehová	1	5	6000	f	Praha 1, Staré Město
8	FEL ČVUT	1	5	22000	t	Praha 6, Dejvice Kampus
9	IPP AV ČR (Ústav fyziky plazmatu)	1	10	15000	f	Praha 8, Ládví
10	ÚTEF ČVUT	1	10	3000	f	Praha 1, Betlémská kaple
11	OC Nový Smíchov	1	11	85000	f	Praha 5, Anděl
12	OC Černý Most	1	11	102000	f	Praha 9, Černý Most
13	OC Arkády Pankrác	1	11	102000	t	Praha 4, Pankrác
14	Hlavní pošta Praha 2	1	4	1500	f	Praha 2, Karlovo náměstí
15	Indická restaurace	1	7	120	f	Praha 2, Náměstí Míru
16	Starbucks	1	7	90	f	Praha 6, Dejvická
17	Kiosek s kávou	1	7	15	f	Praha 6, Dejvická
18	Billa	1	7	850	f	Praha 6, Dejvická
19	Albert	1	7	600	f	Praha 2, Karlovo náměstí
20	Pivovar Staropramen	1	9	45000	f	Praha 5, Smíchov
21	Mitas (výroba pneumatik)	1	9	85000	f	Praha 10, Záběhlice
22	Spalovna ZEVO	1	9	60000	t	Praha 10, Malešice
23	Florentinum	1	8	49000	f	Praha 1, Na Florenci
24	Quadrio	1	8	16400	f	Praha 1, Národní třída
25	Pankrác City	1	8	55000	t	Praha 4, Pankrác
26	Komín Malešice, Hlavní	1	3	400	f	Průmyslová zóna Malešice
27	Komín Teplárna Malešice, Jih	1	3	300	f	Průmyslová zóna Malešice
28	Komín Hostivař, Starý	1	3	250	f	Průmyslová zóna Hostivař
29	Masarykova kolej	1	2	8500	f	Praha 6, Thákurova
30	Sídliště Jižní Město	1	2	500000	f	Praha 11, Háje
31	Sídliště Bohnice	1	2	250000	t	Praha 8, Bohnice
32	Rodinná vila	1	1	250	f	Praha 6, Ořechovka
33	Olbrachtova, metro D	1	6	6000	t	Praha 4, Krč
34	Západné Tatry (TANAP)	2	13	400000000	f	Severně od obce Bobrovec
35	Nízke Tatry (NAPANT)	2	13	728000000	f	Jižně přes Liptovskou kotlinu
36	Bobrovecká dolina	2	13	5000000	f	Výstup z obce na hory
37	CBA Potraviny	2	7	250	f	Centrum obce
38	M-Club Bobrovec	2	7	120	f	Námestie
39	Espresso	2	7	60	f	Námestie
40	ZŠ s MŠ Bobrovec	2	5	2500	f	Školská ulica
41	Pošta Bobrovec	2	4	100	f	Centrum obce
42	Futbalové ihrisko ŠK Bobrovec	2	12	7500	f	Sportovní areál
43	Autobusová zastávka, námestie	2	6	30	f	Hlavní náměstí
44	Nová zástavba rodinných domů	2	1	4500	t	Okraj obce pri lese
45	Bytovka pri potoku	2	2	800	f	Západní okraj obce
46	Starší rodinný dům	2	1	150	f	Hlavná ulica
47	Sídliště Adam Trajan	3	2	150000	f	Jihozápadní část města Piešťany
48	Kúpeľný ostrov	3	13	450000	f	Ostrov na řece Váh
49	Nová rodinná vilka	3	1	200	t	Banka u Piešťan
50	Max-Planck-Institut für Plasmaphysik	4	10	85000	f	Forschungszentrum Garching
51	European Southern Observatory	4	10	45000	f	Karl-Schwarzschild-Straße
52	Leibniz-Rechenzentrum	4	10	22000	t	Boltzmannstraße
53	TUM, Fakultät für Mathematik	4	5	55000	f	Campus Garching
54	TUM, Fakultät für Maschinenwesen	4	5	80000	f	Campus Garching
55	Mensa Garching	4	7	5000	f	Centrum kampusu
56	Campus Caffe Garching	4	7	150	f	Poblíž TUM
57	Crazy Bean	4	7	80	f	
58	Edeka	4	7	1200	f	Centrum
59	CEWE Fotolabor	4	9	12000	f	Průmyslová zóna Garching-Hochbrück
60	Voith Turbo	4	9	25000	f	Průmyslová zóna Garching-Hochbrück
61	Business Campus München	4	8	150000	t	Garching-Hochbrück
62	U-Bahn Garching-Forschungszentrum	4	6	2500	f	Podzemní stanice kampusu
63	U-Bahn Garching	4	6	2000	f	Centrum města
64	Stadion am See (VfR Garching)	4	12	18000	t	Garchinger See
65	Isarauen Garching	4	13	1200000	f	Břeh řeky Isar
66	Max-Planck-Gästehaus (IPP)	4	1	1500	f	Boltzmannstraße, Campus Garching
67	Wohngebiet Am Anger	4	2	45000	f	Obytná čtvrť Garching
68	Einfamilienhaus (Rodinný dům)	4	1	180	f	Garching Süd
69	Nivy Centrum	5	11	130000	f	Ružinov, Mlynské nivy
70	Gymnázium, Grösslingová 18	5	5	8500	f	Staré Mesto (Gamča)
71	Stredoškolský internát	5	2	6000	f	Ružinov, Vranovská
72	Bratislava hlavná stanica	5	6	25000	f	Námestie Franza Liszta
73	Eurovea	5	11	85000	t	Pribinova ulica, u Dunaje
74	Aupark Bratislava	5	11	58000	f	Petržalka, Einsteinova
75	Urban House	5	7	250	f	Staré Mesto, Laurinská
76	Bratislavský meštiansky pivovar	5	7	400	f	Staré Mesto
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 5, true);


--
-- Name: crane_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crane_models_id_seq', 10, true);


--
-- Name: structure_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structure_types_id_seq', 13, true);


--
-- Name: structures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.structures_id_seq', 76, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: crane_models crane_models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crane_models
    ADD CONSTRAINT crane_models_pkey PRIMARY KEY (id);


--
-- Name: structure_cranes structure_cranes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structure_cranes
    ADD CONSTRAINT structure_cranes_pkey PRIMARY KEY (structure_id, crane_id);


--
-- Name: structure_types structure_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structure_types
    ADD CONSTRAINT structure_types_pkey PRIMARY KEY (id);


--
-- Name: structures structures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structures
    ADD CONSTRAINT structures_pkey PRIMARY KEY (id);


--
-- Name: structure_cranes structure_cranes_crane_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structure_cranes
    ADD CONSTRAINT structure_cranes_crane_id_fkey FOREIGN KEY (crane_id) REFERENCES public.crane_models(id);


--
-- Name: structure_cranes structure_cranes_structure_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structure_cranes
    ADD CONSTRAINT structure_cranes_structure_id_fkey FOREIGN KEY (structure_id) REFERENCES public.structures(id);


--
-- Name: structures structures_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structures
    ADD CONSTRAINT structures_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: structures structures_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.structures
    ADD CONSTRAINT structures_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.structure_types(id);


--
-- PostgreSQL database dump complete
--

\unrestrict GBwrlAIGHijHDTSu1VHSrNkGgAhlHpGvmadeQS1NqVVAKTYudneueM7eb8s06XF

