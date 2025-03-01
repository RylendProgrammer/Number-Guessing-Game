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
-- Name: user_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_data (
    user_name character varying(22),
    number_of_user_guesses integer,
    games_played integer
);


ALTER TABLE public.user_data OWNER TO freecodecamp;

--
-- Data for Name: user_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_data VALUES ('user_1721671187176', 84, 1);
INSERT INTO public.user_data VALUES ('user_1721671187177', 565, 1);
INSERT INTO public.user_data VALUES ('user_1721671219101', 410, 1);
INSERT INTO public.user_data VALUES ('user_1721671219102', 255, 1);
INSERT INTO public.user_data VALUES ('user_1721671245112', 325, 1);
INSERT INTO public.user_data VALUES ('user_1721671245113', 776, 1);
INSERT INTO public.user_data VALUES ('user_1721671329729', 558, 1);
INSERT INTO public.user_data VALUES ('user_1721671329730', 496, 1);


--
-- PostgreSQL database dump complete
--

