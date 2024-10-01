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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 360);
INSERT INTO public.games VALUES (2, 2, 733);
INSERT INTO public.games VALUES (3, 3, 135);
INSERT INTO public.games VALUES (4, 4, 537);
INSERT INTO public.games VALUES (5, 5, 414);
INSERT INTO public.games VALUES (6, 6, 206);
INSERT INTO public.games VALUES (7, 7, 928);
INSERT INTO public.games VALUES (8, 8, 483);
INSERT INTO public.games VALUES (9, 9, 913);
INSERT INTO public.games VALUES (10, 10, 115);
INSERT INTO public.games VALUES (11, 11, 580);
INSERT INTO public.games VALUES (12, 12, 415);
INSERT INTO public.games VALUES (13, 13, 685);
INSERT INTO public.games VALUES (14, 14, 678);
INSERT INTO public.games VALUES (15, 15, 56);
INSERT INTO public.games VALUES (16, 16, 699);
INSERT INTO public.games VALUES (17, 17, 778);
INSERT INTO public.games VALUES (18, 18, 878);
INSERT INTO public.games VALUES (19, 19, 967);
INSERT INTO public.games VALUES (20, 20, 947);
INSERT INTO public.games VALUES (21, 21, 31);
INSERT INTO public.games VALUES (22, 22, 463);
INSERT INTO public.games VALUES (23, 23, 301);
INSERT INTO public.games VALUES (24, 24, 389);
INSERT INTO public.games VALUES (25, 25, 345);
INSERT INTO public.games VALUES (26, 26, 945);
INSERT INTO public.games VALUES (27, 27, 131);
INSERT INTO public.games VALUES (28, 28, 230);
INSERT INTO public.games VALUES (29, 29, 113);
INSERT INTO public.games VALUES (30, 30, 160);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1727770268841', 1, 360);
INSERT INTO public.users VALUES (2, 'user_1727770268840', 1, 733);
INSERT INTO public.users VALUES (29, 'user_1727772401361', 1, 113);
INSERT INTO public.users VALUES (3, 'user_1727771295818', 1, 135);
INSERT INTO public.users VALUES (4, 'user_1727771295817', 1, 537);
INSERT INTO public.users VALUES (5, 'user_1727771423537', 1, 414);
INSERT INTO public.users VALUES (30, 'user_1727772401360', 1, 160);
INSERT INTO public.users VALUES (6, 'user_1727771423536', 1, 206);
INSERT INTO public.users VALUES (7, 'user_1727771553261', 1, 928);
INSERT INTO public.users VALUES (8, 'user_1727771553260', 1, 483);
INSERT INTO public.users VALUES (9, 'user_1727771563276', 1, 913);
INSERT INTO public.users VALUES (10, 'user_1727771563275', 1, 115);
INSERT INTO public.users VALUES (11, 'user_1727771631204', 1, 580);
INSERT INTO public.users VALUES (32, 'user_1727772576911', 2, 505);
INSERT INTO public.users VALUES (12, 'user_1727771631203', 1, 415);
INSERT INTO public.users VALUES (48, 'user_1727773143552', 2, 728);
INSERT INTO public.users VALUES (13, 'user_1727771652637', 1, 685);
INSERT INTO public.users VALUES (14, 'user_1727771652636', 1, 678);
INSERT INTO public.users VALUES (31, 'user_1727772576912', 5, 78);
INSERT INTO public.users VALUES (15, 'user_1727771719320', 1, 56);
INSERT INTO public.users VALUES (16, 'user_1727771719319', 1, 699);
INSERT INTO public.users VALUES (17, 'user_1727771778182', 1, 778);
INSERT INTO public.users VALUES (47, 'user_1727773143553', 5, 232);
INSERT INTO public.users VALUES (18, 'user_1727771778181', 1, 878);
INSERT INTO public.users VALUES (19, 'user_1727771892256', 1, 967);
INSERT INTO public.users VALUES (20, 'user_1727771892255', 1, 947);
INSERT INTO public.users VALUES (34, 'user_1727772868559', 2, 427);
INSERT INTO public.users VALUES (21, 'user_1727772139907', 1, 31);
INSERT INTO public.users VALUES (22, 'user_1727772139906', 1, 463);
INSERT INTO public.users VALUES (23, 'user_1727772158771', 1, 301);
INSERT INTO public.users VALUES (33, 'user_1727772868560', 5, 297);
INSERT INTO public.users VALUES (24, 'user_1727772158770', 1, 389);
INSERT INTO public.users VALUES (25, 'user_1727772182019', 1, 345);
INSERT INTO public.users VALUES (26, 'user_1727772182018', 1, 945);
INSERT INTO public.users VALUES (27, 'user_1727772243137', 1, 131);
INSERT INTO public.users VALUES (28, 'user_1727772243136', 1, 230);
INSERT INTO public.users VALUES (50, 'user_1727773305228', 2, 367);
INSERT INTO public.users VALUES (36, 'user_1727772882375', 2, 499);
INSERT INTO public.users VALUES (35, 'user_1727772882376', 5, 175);
INSERT INTO public.users VALUES (49, 'user_1727773305229', 5, 119);
INSERT INTO public.users VALUES (38, 'user_1727772975183', 2, 181);
INSERT INTO public.users VALUES (37, 'user_1727772975184', 5, 435);
INSERT INTO public.users VALUES (52, 'user_1727773328148', 2, 346);
INSERT INTO public.users VALUES (40, 'user_1727773042117', 2, 613);
INSERT INTO public.users VALUES (51, 'user_1727773328149', 5, 161);
INSERT INTO public.users VALUES (39, 'user_1727773042118', 5, 13);
INSERT INTO public.users VALUES (42, 'user_1727773093061', 2, 487);
INSERT INTO public.users VALUES (41, 'user_1727773093062', 5, 268);
INSERT INTO public.users VALUES (54, 'user_1727773453026', 2, 363);
INSERT INTO public.users VALUES (44, 'user_1727773103196', 2, 269);
INSERT INTO public.users VALUES (53, 'user_1727773453027', 5, 159);
INSERT INTO public.users VALUES (43, 'user_1727773103197', 5, 83);
INSERT INTO public.users VALUES (46, 'user_1727773106810', 2, 354);
INSERT INTO public.users VALUES (56, 'user_1727773492257', 2, 146);
INSERT INTO public.users VALUES (45, 'user_1727773106811', 5, 19);
INSERT INTO public.users VALUES (55, 'user_1727773492258', 5, 82);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 30, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 56, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

