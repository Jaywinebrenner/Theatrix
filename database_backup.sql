--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    name character varying,
    runtime integer,
    rating character varying,
    poster character varying
);


ALTER TABLE public.movies OWNER TO "Guest";

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO "Guest";

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: showings; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.showings (
    id integer NOT NULL,
    theatre_id integer,
    movie_id integer,
    showtime character varying
);


ALTER TABLE public.showings OWNER TO "Guest";

--
-- Name: showings_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.showings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.showings_id_seq OWNER TO "Guest";

--
-- Name: showings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.showings_id_seq OWNED BY public.showings.id;


--
-- Name: theatres; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.theatres (
    id integer NOT NULL,
    name character varying,
    location character varying,
    img character varying
);


ALTER TABLE public.theatres OWNER TO "Guest";

--
-- Name: theatres_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.theatres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theatres_id_seq OWNER TO "Guest";

--
-- Name: theatres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.theatres_id_seq OWNED BY public.theatres.id;


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: showings id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.showings ALTER COLUMN id SET DEFAULT nextval('public.showings_id_seq'::regclass);


--
-- Name: theatres id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.theatres ALTER COLUMN id SET DEFAULT nextval('public.theatres_id_seq'::regclass);


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.movies (id, name, runtime, rating, poster) FROM stdin;
\.


--
-- Data for Name: showings; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.showings (id, theatre_id, movie_id, showtime) FROM stdin;
\.


--
-- Data for Name: theatres; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.theatres (id, name, location, img) FROM stdin;
4	MegaPlex	Dayton, OH	https://www.boxofficepro.com/wp-content/uploads/2019/12/Untitled-design-2.png
\.


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.movies_id_seq', 1, false);


--
-- Name: showings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.showings_id_seq', 1, false);


--
-- Name: theatres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.theatres_id_seq', 4, true);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: showings showings_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.showings
    ADD CONSTRAINT showings_pkey PRIMARY KEY (id);


--
-- Name: theatres theatres_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.theatres
    ADD CONSTRAINT theatres_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

