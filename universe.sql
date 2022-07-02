--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    discription text,
    galaxy_type character varying(20),
    age_in_milion_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    gravity_in_m_s numeric(4,1),
    planet_id integer NOT NULL,
    distance_from_orbiting_planet_inkm integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_orbiting_moons integer NOT NULL,
    gravity_in_m_s numeric(4,1),
    habitable boolean NOT NULL,
    has_water boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_orbiting_planets integer NOT NULL,
    gravity_in_m_s numeric(4,1),
    galaxy_id integer NOT NULL,
    star_type_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    type character varying(20) NOT NULL,
    color character varying(20),
    name character varying(30)
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, 'spiral', 1000);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf Galaxy', NULL, 'Dwarf', 240);
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', NULL, 'eliptical', 3);
INSERT INTO public.galaxy VALUES (5, 'Maffei 1', NULL, 'lenticular', 1000);
INSERT INTO public.galaxy VALUES (6, 'Maffei 2', NULL, 'spiral', 1000);
INSERT INTO public.galaxy VALUES (7, 'Magellanic Clouds', NULL, 'irregular', 1101);
INSERT INTO public.galaxy VALUES (8, 'Virgo A', NULL, 'spiral', 1324);
INSERT INTO public.galaxy VALUES (1, 'The milky way', 'This is where we live!', 'spiral', 1361);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1.6, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Metis', NULL, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Adrastea', NULL, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Amalthea', NULL, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Thebe', NULL, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Io', NULL, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Europa', NULL, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Ganymede', NULL, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Callisto', NULL, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Themisto', NULL, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Pan', NULL, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Daphnis', NULL, 6, NULL);
INSERT INTO public.moon VALUES (15, 'Atlas', NULL, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Prometheus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Pandora', NULL, 6, NULL);
INSERT INTO public.moon VALUES (18, 'Epimetheus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Janus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (20, 'Aegaeon', NULL, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Cordelia', NULL, 7, NULL);
INSERT INTO public.moon VALUES (22, 'Ophelia', NULL, 7, NULL);
INSERT INTO public.moon VALUES (23, 'Bianca', NULL, 7, NULL);
INSERT INTO public.moon VALUES (24, 'Cressida', NULL, 7, NULL);
INSERT INTO public.moon VALUES (25, 'Desdemona', NULL, 7, NULL);
INSERT INTO public.moon VALUES (26, 'Naiad', NULL, 8, NULL);
INSERT INTO public.moon VALUES (27, 'Thalassa', NULL, 8, NULL);
INSERT INTO public.moon VALUES (28, 'Despina', NULL, 8, NULL);
INSERT INTO public.moon VALUES (29, 'Galatea', NULL, 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 9.8, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', -1, NULL, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', -1, NULL, false, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', -1, NULL, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', -1, NULL, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', -1, NULL, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', -1, NULL, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', -1, NULL, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Proximia Centauri b', -1, NULL, false, false, 2);
INSERT INTO public.planet VALUES (10, 'Proximia Centauri c', -1, NULL, false, false, 2);
INSERT INTO public.planet VALUES (11, 'Proximia Centauri d', -1, NULL, false, false, 2);
INSERT INTO public.planet VALUES (12, 'Gliese 411 b', -1, NULL, false, false, 3);
INSERT INTO public.planet VALUES (13, 'Gliese 411 c', -1, NULL, false, false, 3);
INSERT INTO public.planet VALUES (14, 'Gliese 411 d', -1, NULL, false, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 8, 274.0, 1, 5);
INSERT INTO public.star VALUES (2, 'Proximia Centauri', 3, NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'Lalande 21185', 2, NULL, 1, NULL);
INSERT INTO public.star VALUES (4, 'Lacaille 9352', 2, NULL, 1, NULL);
INSERT INTO public.star VALUES (5, 'Luyten`s Star', 2, NULL, 1, NULL);
INSERT INTO public.star VALUES (6, 'YZ Ceti', 3, NULL, 1, NULL);
INSERT INTO public.star VALUES (7, 'Tau Ceti', 4, NULL, 1, NULL);
INSERT INTO public.star VALUES (8, 'Gliese 1061', 3, NULL, 1, NULL);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (3, 'A', 'Blue', NULL);
INSERT INTO public.star_type VALUES (4, 'F', 'Blue/White', NULL);
INSERT INTO public.star_type VALUES (1, 'O', 'Blue', 'Blue Star');
INSERT INTO public.star_type VALUES (5, 'G', 'White/Yellow', 'Yellow Dwarf');
INSERT INTO public.star_type VALUES (6, 'K', 'range/Red', 'Orange Dwarf');
INSERT INTO public.star_type VALUES (7, 'M', 'Red', 'Main Sequence star');
INSERT INTO public.star_type VALUES (2, 'B', 'Blue', 'Blue Supergiant');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 29, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 14, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 7, true);


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
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: star_type uniquetype_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT uniquetype_const UNIQUE (type);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

