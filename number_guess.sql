--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1728566752674', 1, 835);
INSERT INTO public.users VALUES (1, 'user_1728566752675', 4, 168);
INSERT INTO public.users VALUES (4, 'user_1728566776906', 1, NULL);
INSERT INTO public.users VALUES (20, 'user_1728568008634', 2, 38);
INSERT INTO public.users VALUES (3, 'user_1728566776907', 4, NULL);
INSERT INTO public.users VALUES (5, '', 0, NULL);
INSERT INTO public.users VALUES (7, 'user_1728567142615', 1, NULL);
INSERT INTO public.users VALUES (19, 'user_1728568008635', 5, 159);
INSERT INTO public.users VALUES (6, 'user_1728567142616', 4, NULL);
INSERT INTO public.users VALUES (9, 'user_1728567206780', 1, NULL);
INSERT INTO public.users VALUES (8, 'user_1728567206781', 4, NULL);
INSERT INTO public.users VALUES (11, 'user_1728567221241', 1, NULL);
INSERT INTO public.users VALUES (10, 'user_1728567221242', 4, NULL);
INSERT INTO public.users VALUES (12, 'yooo', 0, NULL);
INSERT INTO public.users VALUES (22, 'user_1728568059929', 2, 595);
INSERT INTO public.users VALUES (14, 'user_1728567694045', 2, 769);
INSERT INTO public.users VALUES (21, 'user_1728568059930', 5, 172);
INSERT INTO public.users VALUES (13, 'user_1728567694046', 5, 5);
INSERT INTO public.users VALUES (24, 'user_1728568168750', 2, 457);
INSERT INTO public.users VALUES (16, 'user_1728567827489', 2, 259);
INSERT INTO public.users VALUES (23, 'user_1728568168751', 5, 387);
INSERT INTO public.users VALUES (15, 'user_1728567827490', 5, 205);
INSERT INTO public.users VALUES (18, 'user_1728567991020', 2, 24);
INSERT INTO public.users VALUES (17, 'user_1728567991021', 5, 150);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

