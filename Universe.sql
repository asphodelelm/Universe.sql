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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(30) NOT NULL,
    constellation_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    misc text,
    has_life boolean,
    visible_to_naked_eye boolean,
    galaxy_type character varying(30),
    age_in_millions_of_years_rounded integer,
    distance_in_thousands_of_lightyears integer,
    apparent_magnitude numeric(2,1),
    distance_in_lightyears numeric(5,2),
    constellation text
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    planet_name character varying(30),
    galaxy_id integer NOT NULL,
    galaxy_name character varying(30)
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_name character varying(30),
    host_star_name character varying(30),
    planet_type text,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_name character varying(30),
    visible_to_naked_eye boolean,
    star_type character varying(30),
    spectral_type character varying(30),
    age_in_millions_of_years_rounded integer,
    distance_in_lightyears numeric(5,2),
    apparent_magnitude numeric(4,2),
    constellation text,
    radius_in_solar_radius numeric(4,2)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Taurus', 1, 1);
INSERT INTO public.constellation VALUES ('Aries', 2, 1);
INSERT INTO public.constellation VALUES ('Carina', 3, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, NULL, true, true, 'Spiral', 13800, 100, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Messier 31', 2, 'Andromeda Galaxy', false, true, 'Spiral', 3, 2000, 3.1, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Messier 33', 3, 'Triangulum Galaxy', false, true, 'Spiral', 4, 14000, 5.7, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Messier 81', 4, 'Bode''s Galaxy', false, true, 'Spiral', 13000, 11600, 6.9, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Messier 82', 5, 'Cigar Galazy', false, false, 'Spiral', NULL, 12000, 8.4, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Caldwell 38', 6, 'Needle Galaxy', false, false, 'Spiral', NULL, 40000, 9.6, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 3, 'Earth', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Phobos', 2, 4, 'Mars', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 'Mars', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Ganymede', 4, 5, 'Jupiter', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Callisto', 5, 5, 'Jupiter', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Io', 6, 5, 'Jupiter', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Europa', 7, 5, 'Jupiter', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Titan', 8, 6, 'Saturn', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Hyperion', 9, 6, 'Saturn', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Prometheus', 10, 6, 'Saturn', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Pandora', 11, 6, 'Saturn', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Janus', 12, 6, 'Saturn', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Phoebe', 13, 6, 'Saturn', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Iapetus', 14, 6, 'Saturn', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Tethys', 15, 6, 'Saturn', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Despina', 16, 8, 'Neptune', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Galatea', 17, 8, 'Neptune', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Hippocamp', 18, 8, 'Neptune', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Larissa', 19, 8, 'Neptune', 1, 'Milky Way');
INSERT INTO public.moon VALUES ('Miranda', 20, 7, 'Uranus', 1, 'Milky Way');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 1, 'Milky Way', 'Sun', 'Terrestrial', 3);
INSERT INTO public.planet VALUES ('Venus', 2, 1, 'Milky Way', 'Sun', 'Terrestrial', 3);
INSERT INTO public.planet VALUES ('Earth', 3, 1, 'Milky Way', 'Sun', 'Terrestrial', 3);
INSERT INTO public.planet VALUES ('Mars', 4, 1, 'Milky Way', 'Sun', 'Terrestrial', 3);
INSERT INTO public.planet VALUES ('Jupiter', 5, 1, 'Milky Way', 'Sun', 'Giant', 3);
INSERT INTO public.planet VALUES ('Saturn', 6, 1, 'Milky Way', 'Sun', 'Giant', 3);
INSERT INTO public.planet VALUES ('Uranus', 7, 1, 'Milky Way', 'Sun', 'Giant', 3);
INSERT INTO public.planet VALUES ('Neptune', 8, 1, 'Milky Way', 'Sun', 'Giant', 3);
INSERT INTO public.planet VALUES ('Pluto', 9, 1, 'Milky Way', 'Sun', 'Dwarf', 3);
INSERT INTO public.planet VALUES ('Ceres', 10, 1, 'Milky Way', 'Sun', 'Dwarf', 3);
INSERT INTO public.planet VALUES ('Eris', 11, 1, 'Milky Way', 'Sun', 'Dwarf', 3);
INSERT INTO public.planet VALUES ('Makemake', 12, 1, 'Milky Way', 'Sun', 'Dwarf', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sirius A', 1, 1, 'Milky Way', true, 'main-sequence', 'A-type', 242, 8.60, -1.46, 'Canis Major', 1.71);
INSERT INTO public.star VALUES ('Sirius B', 2, 1, 'Milky Way', true, 'white dwarf', 'DA-type', 228, 8.71, 8.44, 'Canis Major', 0.01);
INSERT INTO public.star VALUES ('Sun', 3, 1, 'Milky Way', true, 'main-sequence', 'G-type', 4600, NULL, -26.74, NULL, 1.00);
INSERT INTO public.star VALUES ('Alcyone', 4, 1, 'Milky Way', true, 'giant', 'B-type', 100, 443.60, 2.87, 'Taurus', 9.30);
INSERT INTO public.star VALUES ('Canopus', 5, 1, 'Milky Way', true, 'main-sequence', 'A-type', 10, 310.00, -0.74, 'Carina', 73.30);
INSERT INTO public.star VALUES ('Hamal', 6, 1, 'Milky Way', true, 'giant', 'K-type', 3400, 65.80, 2.00, 'Aries', 14.90);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--

