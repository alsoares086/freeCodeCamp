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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions integer DEFAULT 0,
    galaxy_type character varying(30),
    has_black_holes boolean DEFAULT false
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    orbital_period numeric(10,2),
    diameter numeric(10,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    nebula_type character varying(50),
    distance numeric(10,2),
    size numeric(10,2)
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    description text,
    has_water boolean DEFAULT false,
    star_id integer,
    galaxy_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity numeric(10,2),
    star_age integer DEFAULT 0
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 13600, 'Irregular', false);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 14000, 'Elliptical', true);
INSERT INTO public.galaxy VALUES (6, 'IC 1101', 13000, 'Elliptical', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 27.30, 3474.80);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.30, 22.20);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1.30, 12.40);
INSERT INTO public.moon VALUES (4, 'Aphrodite', 3, 8.00, 4000.00);
INSERT INTO public.moon VALUES (5, 'Helen', 3, 14.50, 3200.00);
INSERT INTO public.moon VALUES (6, 'Andromeda III Alpha', 6, 10.10, 2000.00);
INSERT INTO public.moon VALUES (7, 'Andromeda III Beta', 6, 12.60, 1800.00);
INSERT INTO public.moon VALUES (8, 'Triangulum II A', 8, 5.40, 1500.00);
INSERT INTO public.moon VALUES (9, 'Triangulum II B', 8, 7.80, 1700.00);
INSERT INTO public.moon VALUES (10, 'Triangulum III Moon', 9, 4.20, 1000.00);
INSERT INTO public.moon VALUES (11, 'Triangulum III Satellite', 9, 6.30, 1100.00);
INSERT INTO public.moon VALUES (12, 'Magellanic Alpha Satellite', 10, 2.50, 800.00);
INSERT INTO public.moon VALUES (13, 'Magellanic Alpha Moon', 10, 3.90, 900.00);
INSERT INTO public.moon VALUES (14, 'Magellanic Beta Orbit', 11, 1.80, 700.00);
INSERT INTO public.moon VALUES (15, 'Magellanic Beta Satellite', 11, 2.20, 600.00);
INSERT INTO public.moon VALUES (16, 'Messier Prime Moon', 12, 9.10, 1200.00);
INSERT INTO public.moon VALUES (17, 'Messier Prime Satellite', 12, 10.50, 1300.00);
INSERT INTO public.moon VALUES (18, 'Messier Beta Satellite', 13, 6.70, 900.00);
INSERT INTO public.moon VALUES (19, 'Messier Beta Moon', 13, 8.20, 1000.00);
INSERT INTO public.moon VALUES (20, 'IC Nova II Satellite', 15, 15.80, 1500.00);
INSERT INTO public.moon VALUES (21, 'IC Nova II Moon', 15, 18.20, 1700.00);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 1, 'Emission', 1344.00, 1234.56);
INSERT INTO public.nebula VALUES (2, 'Crab Nebula', 1, 'Supernova Remnant', 6520.00, 9876.43);
INSERT INTO public.nebula VALUES (3, 'Eagle Nebula', 1, 'H II Region', 7000.00, 5432.10);
INSERT INTO public.nebula VALUES (4, 'Andromeda Nebula', 2, 'Emission', 56000.00, 7890.12);
INSERT INTO public.nebula VALUES (5, 'M31 Nebula', 2, 'Reflection', 57500.00, 3456.78);
INSERT INTO public.nebula VALUES (6, 'Andromeda Strain', 2, 'Dark', 59000.00, 9012.34);
INSERT INTO public.nebula VALUES (7, 'Triangulum Cloud', 3, 'Emission', 15000.00, 6789.01);
INSERT INTO public.nebula VALUES (8, 'Triangulum Deep', 3, 'Reflection', 16000.00, 2345.67);
INSERT INTO public.nebula VALUES (9, 'Triangulum Starburst', 3, 'H II Region', 17000.00, 8901.23);
INSERT INTO public.nebula VALUES (10, 'Tarantula Nebula', 4, 'Emission', 163000.00, 4567.89);
INSERT INTO public.nebula VALUES (11, 'LMC Supernova', 4, 'Supernova Remnant', 168000.00, 9012.34);
INSERT INTO public.nebula VALUES (12, 'LMC Dust Cloud', 4, 'Dark', 170000.00, 3456.78);
INSERT INTO public.nebula VALUES (13, 'M87 Jet', 5, 'Emission', 540000.00, 7890.12);
INSERT INTO public.nebula VALUES (14, 'Messier Ring', 5, 'Reflection', 545000.00, 2345.67);
INSERT INTO public.nebula VALUES (15, 'M87 Dust Lane', 5, 'Dark', 550000.00, 8901.23);
INSERT INTO public.nebula VALUES (16, 'IC 1101 Halo', 6, 'Emission', 1000000.00, 1234.56);
INSERT INTO public.nebula VALUES (17, 'IC 1101 Core', 6, 'Reflection', 1001000.00, 9876.43);
INSERT INTO public.nebula VALUES (18, 'IC 1101 Filament', 6, 'Dark', 1002000.00, 5432.10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'The only known planet with life', true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Red planet with potential for future colonization', false, 2, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'The second planet from the Sun', false, 3, 1);
INSERT INTO public.planet VALUES (4, 'Andromeda I', false, 'Rocky planet in the Andromeda galaxy', false, 4, 2);
INSERT INTO public.planet VALUES (5, 'Andromeda II', false, 'Gas giant in the Andromeda galaxy', false, 5, 2);
INSERT INTO public.planet VALUES (6, 'Andromeda III', true, 'Planet with potential for life', true, 6, 2);
INSERT INTO public.planet VALUES (7, 'Triangulum Prime', false, 'Desert planet', false, 7, 3);
INSERT INTO public.planet VALUES (8, 'Triangulum II', false, 'Ice planet', true, 8, 3);
INSERT INTO public.planet VALUES (9, 'Triangulum III', true, 'Planet with microbial life', true, 9, 3);
INSERT INTO public.planet VALUES (10, 'Magellanic Alpha', false, 'Volcanic planet', false, 10, 4);
INSERT INTO public.planet VALUES (11, 'Magellanic Beta', false, 'Planet with thick atmosphere', false, 11, 4);
INSERT INTO public.planet VALUES (12, 'Messier Prime', false, 'Gaseous planet', false, 12, 5);
INSERT INTO public.planet VALUES (13, 'Messier Beta', false, 'Rocky planet with no atmosphere', false, 13, 5);
INSERT INTO public.planet VALUES (14, 'IC Nova I', false, 'Planet with potential for mining', false, 14, 6);
INSERT INTO public.planet VALUES (15, 'IC Nova II', true, 'Planet with signs of primitive life', true, 15, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 1.00, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.00, 4500);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 1.52, 5500);
INSERT INTO public.star VALUES (4, 'Andromeda Alpha', 2, 1000.00, 5000);
INSERT INTO public.star VALUES (5, 'Andromeda Beta', 2, 1200.00, 6000);
INSERT INTO public.star VALUES (6, 'Andromeda Gamma', 2, 1100.00, 5500);
INSERT INTO public.star VALUES (7, 'Triangulum Star A', 3, 800.00, 7000);
INSERT INTO public.star VALUES (8, 'Triangulum Star B', 3, 750.00, 6800);
INSERT INTO public.star VALUES (9, 'Triangulum Star C', 3, 900.00, 7200);
INSERT INTO public.star VALUES (10, 'Magellanic Nova', 4, 300.00, 10000);
INSERT INTO public.star VALUES (11, 'Magellanic Prime', 4, 250.00, 9500);
INSERT INTO public.star VALUES (12, 'Magellanic Echo', 4, 320.00, 10200);
INSERT INTO public.star VALUES (13, 'Messier Titan', 5, 50000.00, 8000);
INSERT INTO public.star VALUES (14, 'Messier Alpha', 5, 45000.00, 7500);
INSERT INTO public.star VALUES (15, 'IC Nova', 6, 200000.00, 13000);
INSERT INTO public.star VALUES (16, 'IC Titan', 6, 180000.00, 12500);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 18, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: nebula unique_nebula_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT unique_nebula_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: planet fk_galaxy_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_galaxy_planet FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula fk_nebula_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT fk_nebula_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

