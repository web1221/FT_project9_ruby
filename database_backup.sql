--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: project; Type: TABLE; Schema: public; Owner: Webs
--

CREATE TABLE public.project (
    title character varying,
    id integer NOT NULL
);


ALTER TABLE public.project OWNER TO "Webs";

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: Webs
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO "Webs";

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Webs
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: Webs
--

CREATE TABLE public.volunteers (
    name character varying,
    id integer NOT NULL,
    project_id integer
);


ALTER TABLE public.volunteers OWNER TO "Webs";

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: Webs
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO "Webs";

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Webs
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: Webs
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: Webs
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: Webs
--

COPY public.project (title, id) FROM stdin;
Humans against Carrots	380
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: Webs
--

COPY public.volunteers (name, id, project_id) FROM stdin;
Donovan Weber	251	380
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Webs
--

SELECT pg_catalog.setval('public.project_id_seq', 380, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Webs
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 251, true);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: Webs
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: Webs
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

