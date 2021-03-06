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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--



SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 16871)
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    name character varying NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 16881)
-- Name: teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    full_name character varying NOT NULL,
    subject character varying NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 16879)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 201
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 204 (class 1259 OID 16897)
-- Name: timetable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.timetable (
    id integer NOT NULL,
    week integer NOT NULL,
    day integer NOT NULL,
    subject character varying NOT NULL,
    room character varying,
    start_time integer NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 16895)
-- Name: timetable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.timetable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 203
-- Name: timetable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.timetable_id_seq OWNED BY public.timetable.id;


--
-- TOC entry 2866 (class 2604 OID 16884)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- TOC entry 2867 (class 2604 OID 16900)
-- Name: timetable id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timetable ALTER COLUMN id SET DEFAULT nextval('public.timetable_id_seq'::regclass);


--
-- TOC entry 3006 (class 0 OID 16871)
-- Dependencies: 200
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subjects (name) VALUES ('?????????? (????????????)');
INSERT INTO public.subjects (name) VALUES ('?????????? (????????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.??????. (????????????????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.??????. (????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.??????. (????????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.??????. (????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.??????. (????????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.??????. (????????????????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.??????. (????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.??????. (????????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.???????????????? (????????????????????????)');
INSERT INTO public.subjects (name) VALUES ('??????.???????????????? (????????????)');
INSERT INTO public.subjects (name) VALUES ('????.????. (????????????????)');
INSERT INTO public.subjects (name) VALUES ('????????.????????. (????????????)');
INSERT INTO public.subjects (name) VALUES ('????????.????????. (????????????????)');
INSERT INTO public.subjects (name) VALUES ('??????-???? (??????.??????????????)');
INSERT INTO public.subjects (name) VALUES ('?????????????????? (????????????)');
INSERT INTO public.subjects (name) VALUES ('?????????????????? (????????????????)');


--
-- TOC entry 3008 (class 0 OID 16881)
-- Dependencies: 202
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.teachers (id, full_name, subject) VALUES (1, '???????????? ???????????????????????? ????????????', '?????????? (????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (2, '???????????? ???????????????????????? ????????????', '?????????? (????????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (3, '?????????????????? ?????????????????? ??????????????', '??????.??????. (????????????????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (4, '?????????????? ???????????? ????????????????????', '??????.??????. (????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (5, '?????????????????? ?????????????????? ??????????????', '??????.??????. (????????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (6, '?????????? ???????????????????? ????????????????????', '??????.??????. (????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (7, '?????????? ???????????????????? ????????????????????', '??????.??????. (????????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (8, '???????????????? ??????????', '??????.??????. (????????????????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (9, '???????????????????? ???????????? ??????????????????????', '??????.??????. (????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (10, '???????? ??????????????????', '??????.??????. (????????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (11, '???????????????? ?????????????? ??????????????????????????', '??????.???????????????? (????????????????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (12, '?????????????? ???????????? ??????????????????', '??????.???????????????? (????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (13, '???????? ?????????????? ??????????????????', '????.????. (????????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (14, '?????????????? ???????????????????? ??????????????????????????', '????????.????????. (????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (15, '?????????? ???????????????? ??????????????????', '????????.????????. (????????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (16, '?????????????? ???????????????????? ??.', '??????-???? (??????.??????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (17, '?????????????????? ?????????? ????????????????????????', '?????????????????? (????????????)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (18, '?????????? ?????????? ????????????????', '?????????????????? (????????????????)');


--
-- TOC entry 3010 (class 0 OID 16897)
-- Dependencies: 204
-- Data for Name: timetable; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (1, 0, 0, '??????.??????. (????????????????)', '????127', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (2, 0, 0, '??????.??????. (????????????????????????)', '314', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (3, 0, 0, '????.????. (????????????????)', '404,301??', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (4, 0, 0, '????????.????????. (????????????????)', '223', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (5, 0, 1, '??????-???? (??????.??????????????)', '', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (6, 0, 1, '?????????????????? (????????????????)', '318', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (7, 0, 2, '??????.??????. (????????????????)', '????116', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (8, 0, 2, '??????.??????. (????????????????)', '????116', 1715);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (9, 0, 3, '??????.???????????????? (????????????)', '347', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (10, 0, 3, '??????.??????. (????????????)', '310', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (11, 0, 3, '????????.????????. (????????????)', '126', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (12, 0, 4, '??????.???????????????? (????????????????????????)', '339', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (13, 0, 4, '??????.??????. (????????????????)', '504??', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (14, 0, 4, '??????-???? (??????.??????????????)', '', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (15, 0, 4, '?????????? (????????????????)', '508', 1715);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (16, 1, 0, '??????.??????. (????????????????)', '????127', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (17, 1, 0, '??????.??????. (????????????????)', '314', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (18, 1, 0, '????.????. (????????????????)', '404,301??', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (19, 1, 0, '????????.????????. (????????????????)', '223', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (20, 1, 1, '??????-???? (??????.??????????????)', '', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (21, 1, 1, '?????????????????? (????????????????)', '318', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (22, 1, 2, '??????.??????. (????????????)', '522', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (23, 1, 2, '?????????? (????????????)', '347', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (24, 1, 2, '??????.??????. (????????????)', '517', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (25, 1, 3, '?????????????????? (????????????)', '514', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (26, 1, 3, '??????.??????. (????????????)', '310', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (27, 1, 4, '??????.??????. (????????????????)', '504??', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (28, 1, 4, '??????-???? (??????.??????????????)', '', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (29, 1, 4, '?????????? (????????????????)', '508', 1715);


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 201
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teachers_id_seq', 18, true);


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 203
-- Name: timetable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.timetable_id_seq', 29, true);


--
-- TOC entry 2869 (class 2606 OID 16878)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (name);


--
-- TOC entry 2871 (class 2606 OID 16889)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 2873 (class 2606 OID 16905)
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 16890)
-- Name: teachers teachers_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_subject_fkey FOREIGN KEY (subject) REFERENCES public.subjects(name);


--
-- TOC entry 2875 (class 2606 OID 16906)
-- Name: timetable timetable_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_subject_fkey FOREIGN KEY (subject) REFERENCES public.subjects(name);


-- Completed on 2021-12-14 15:10:41 MSK

--
-- PostgreSQL database dump complete
--
