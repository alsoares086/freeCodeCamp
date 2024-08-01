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
    player_id integer NOT NULL,
    number_of_guesses integer NOT NULL,
    secret_number integer NOT NULL
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 95, 427, 426);
INSERT INTO public.games VALUES (2, 95, 914, 913);
INSERT INTO public.games VALUES (3, 96, 213, 212);
INSERT INTO public.games VALUES (4, 96, 271, 270);
INSERT INTO public.games VALUES (5, 95, 180, 177);
INSERT INTO public.games VALUES (6, 95, 722, 721);
INSERT INTO public.games VALUES (7, 95, 634, 633);
INSERT INTO public.games VALUES (8, 97, 997, 996);
INSERT INTO public.games VALUES (9, 97, 322, 321);
INSERT INTO public.games VALUES (10, 98, 864, 863);
INSERT INTO public.games VALUES (11, 98, 780, 779);
INSERT INTO public.games VALUES (12, 97, 337, 334);
INSERT INTO public.games VALUES (13, 97, 392, 391);
INSERT INTO public.games VALUES (14, 97, 600, 599);
INSERT INTO public.games VALUES (15, 99, 323, 322);
INSERT INTO public.games VALUES (16, 99, 213, 212);
INSERT INTO public.games VALUES (17, 100, 786, 785);
INSERT INTO public.games VALUES (18, 100, 250, 249);
INSERT INTO public.games VALUES (19, 99, 704, 701);
INSERT INTO public.games VALUES (20, 99, 204, 203);
INSERT INTO public.games VALUES (21, 99, 10, 9);
INSERT INTO public.games VALUES (22, 73, 13, 921);
INSERT INTO public.games VALUES (23, 101, 247, 246);
INSERT INTO public.games VALUES (24, 101, 420, 419);
INSERT INTO public.games VALUES (25, 102, 30, 29);
INSERT INTO public.games VALUES (26, 102, 532, 531);
INSERT INTO public.games VALUES (27, 101, 779, 776);
INSERT INTO public.games VALUES (28, 101, 38, 37);
INSERT INTO public.games VALUES (29, 101, 810, 809);
INSERT INTO public.games VALUES (30, 73, 11, 688);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1722542375475');
INSERT INTO public.players VALUES (2, 'user_1722542375474');
INSERT INTO public.players VALUES (3, 'user_1722542406775');
INSERT INTO public.players VALUES (4, 'user_1722542406774');
INSERT INTO public.players VALUES (5, 'user_1722542448190');
INSERT INTO public.players VALUES (6, 'user_1722542448189');
INSERT INTO public.players VALUES (7, 'user_1722542476507');
INSERT INTO public.players VALUES (8, 'user_1722542476506');
INSERT INTO public.players VALUES (9, 'user_1722542569009');
INSERT INTO public.players VALUES (10, 'user_1722542569008');
INSERT INTO public.players VALUES (11, 'user_1722542600259');
INSERT INTO public.players VALUES (12, 'user_1722542600258');
INSERT INTO public.players VALUES (13, 'user_1722542606729');
INSERT INTO public.players VALUES (14, 'user_1722542606728');
INSERT INTO public.players VALUES (15, 'user_1722542688891');
INSERT INTO public.players VALUES (16, 'user_1722542688890');
INSERT INTO public.players VALUES (17, 'user_1722542713171');
INSERT INTO public.players VALUES (18, 'user_1722542713170');
INSERT INTO public.players VALUES (19, 'user_1722542727817');
INSERT INTO public.players VALUES (20, 'user_1722542727816');
INSERT INTO public.players VALUES (21, 'user_1722542737192');
INSERT INTO public.players VALUES (22, 'user_1722542737191');
INSERT INTO public.players VALUES (23, 'user_1722542742091');
INSERT INTO public.players VALUES (24, 'user_1722542742090');
INSERT INTO public.players VALUES (25, 'user_1722543181266');
INSERT INTO public.players VALUES (26, 'user_1722543181266');
INSERT INTO public.players VALUES (27, 'user_1722543181265');
INSERT INTO public.players VALUES (28, 'user_1722543181265');
INSERT INTO public.players VALUES (29, 'user_1722543181266');
INSERT INTO public.players VALUES (30, 'user_1722543181266');
INSERT INTO public.players VALUES (31, 'user_1722543181266');
INSERT INTO public.players VALUES (32, 'user_1722543255467');
INSERT INTO public.players VALUES (33, 'user_1722543255467');
INSERT INTO public.players VALUES (34, 'user_1722543255466');
INSERT INTO public.players VALUES (35, 'user_1722543255466');
INSERT INTO public.players VALUES (36, 'user_1722543255467');
INSERT INTO public.players VALUES (37, 'user_1722543255467');
INSERT INTO public.players VALUES (38, 'user_1722543255467');
INSERT INTO public.players VALUES (39, 'user_1722543261231');
INSERT INTO public.players VALUES (40, 'user_1722543261231');
INSERT INTO public.players VALUES (41, 'user_1722543261230');
INSERT INTO public.players VALUES (42, 'user_1722543261230');
INSERT INTO public.players VALUES (43, 'user_1722543261231');
INSERT INTO public.players VALUES (44, 'user_1722543261231');
INSERT INTO public.players VALUES (45, 'user_1722543261231');
INSERT INTO public.players VALUES (46, 'user_1722543364282');
INSERT INTO public.players VALUES (47, 'user_1722543364282');
INSERT INTO public.players VALUES (48, 'user_1722543364281');
INSERT INTO public.players VALUES (49, 'user_1722543364281');
INSERT INTO public.players VALUES (50, 'user_1722543364282');
INSERT INTO public.players VALUES (51, 'user_1722543364282');
INSERT INTO public.players VALUES (52, 'user_1722543364282');
INSERT INTO public.players VALUES (53, 'user_1722543376175');
INSERT INTO public.players VALUES (54, 'user_1722543376175');
INSERT INTO public.players VALUES (55, 'user_1722543376174');
INSERT INTO public.players VALUES (56, 'user_1722543376174');
INSERT INTO public.players VALUES (57, 'user_1722543376175');
INSERT INTO public.players VALUES (58, 'user_1722543376175');
INSERT INTO public.players VALUES (59, 'user_1722543376175');
INSERT INTO public.players VALUES (60, 'user_1722543404386');
INSERT INTO public.players VALUES (61, 'user_1722543404386');
INSERT INTO public.players VALUES (62, 'user_1722543404385');
INSERT INTO public.players VALUES (63, 'user_1722543404385');
INSERT INTO public.players VALUES (64, 'user_1722543404386');
INSERT INTO public.players VALUES (65, 'user_1722543404386');
INSERT INTO public.players VALUES (66, 'user_1722543404386');
INSERT INTO public.players VALUES (67, 'user_1722545221018');
INSERT INTO public.players VALUES (68, 'user_1722545221017');
INSERT INTO public.players VALUES (69, 'user_1722545324070');
INSERT INTO public.players VALUES (70, 'user_1722545324069');
INSERT INTO public.players VALUES (71, 'user_1722545335926');
INSERT INTO public.players VALUES (72, 'user_1722545335925');
INSERT INTO public.players VALUES (73, 'alice');
INSERT INTO public.players VALUES (74, 'user_1722545469421');
INSERT INTO public.players VALUES (75, 'user_1722545469420');
INSERT INTO public.players VALUES (76, 'user_1722545924803');
INSERT INTO public.players VALUES (77, 'user_1722545924802');
INSERT INTO public.players VALUES (78, 'user_1722546544380');
INSERT INTO public.players VALUES (79, 'user_1722546544379');
INSERT INTO public.players VALUES (80, 'user_1722546549924');
INSERT INTO public.players VALUES (81, 'user_1722546549923');
INSERT INTO public.players VALUES (82, 'user_1722546669300');
INSERT INTO public.players VALUES (83, 'user_1722546669299');
INSERT INTO public.players VALUES (84, 'ALICE');
INSERT INTO public.players VALUES (85, 'user_1722547581519');
INSERT INTO public.players VALUES (86, 'user_1722547581518');
INSERT INTO public.players VALUES (87, 'user_1722547731482');
INSERT INTO public.players VALUES (88, 'user_1722547731481');
INSERT INTO public.players VALUES (89, 'user_1722547966165');
INSERT INTO public.players VALUES (90, 'user_1722547966164');
INSERT INTO public.players VALUES (91, 'user_1722547970137');
INSERT INTO public.players VALUES (92, 'user_1722547970136');
INSERT INTO public.players VALUES (93, 'user_1722547978913');
INSERT INTO public.players VALUES (94, 'user_1722547978912');
INSERT INTO public.players VALUES (95, 'user_1722548384117');
INSERT INTO public.players VALUES (96, 'user_1722548384116');
INSERT INTO public.players VALUES (97, 'user_1722548487250');
INSERT INTO public.players VALUES (98, 'user_1722548487249');
INSERT INTO public.players VALUES (99, 'user_1722548773840');
INSERT INTO public.players VALUES (100, 'user_1722548773839');
INSERT INTO public.players VALUES (101, 'user_1722548837958');
INSERT INTO public.players VALUES (102, 'user_1722548837957');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 30, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 102, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

