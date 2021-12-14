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

INSERT INTO public.subjects (name) VALUES ('алгем (лекция)');
INSERT INTO public.subjects (name) VALUES ('алгем (практика)');
INSERT INTO public.subjects (name) VALUES ('выч.тех. (лабараторная)');
INSERT INTO public.subjects (name) VALUES ('выч.тех. (лекция)');
INSERT INTO public.subjects (name) VALUES ('выч.тех. (практика)');
INSERT INTO public.subjects (name) VALUES ('выш.мат. (лекция)');
INSERT INTO public.subjects (name) VALUES ('выш.мат. (практика)');
INSERT INTO public.subjects (name) VALUES ('инф.тех. (лабараторная)');
INSERT INTO public.subjects (name) VALUES ('инф.тех. (лекция)');
INSERT INTO public.subjects (name) VALUES ('инф.тех. (практика)');
INSERT INTO public.subjects (name) VALUES ('инф.экология (лабараторная)');
INSERT INTO public.subjects (name) VALUES ('инф.экология (лекция)');
INSERT INTO public.subjects (name) VALUES ('ин.яз. (практика)');
INSERT INTO public.subjects (name) VALUES ('комп.граф. (лекция)');
INSERT INTO public.subjects (name) VALUES ('комп.граф. (практика)');
INSERT INTO public.subjects (name) VALUES ('физ-ра (физ.занятие)');
INSERT INTO public.subjects (name) VALUES ('философия (лекция)');
INSERT INTO public.subjects (name) VALUES ('философия (практика)');


--
-- TOC entry 3008 (class 0 OID 16881)
-- Dependencies: 202
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.teachers (id, full_name, subject) VALUES (1, 'Андрей Валентинович Куприн', 'алгем (лекция)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (2, 'Андрей Валентинович Куприн', 'алгем (практика)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (3, 'Анастасия Андреевна Изотова', 'выч.тех. (лабараторная)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (4, 'Симонов Сергей Евгеньевич', 'выч.тех. (лекция)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (5, 'Анастасия Андреевна Изотова', 'выч.тех. (практика)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (6, 'Ирина Васильевна Гетманская', 'выш.мат. (лекция)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (7, 'Ирина Васильевна Гетманская', 'выш.мат. (практика)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (8, 'Павликов Артем', 'инф.тех. (лабараторная)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (9, 'Городничев Михаил Геннадьевич', 'инф.тех. (лекция)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (10, 'Грач Маратович', 'инф.тех. (практика)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (11, 'Курбатов Валерий Александрович', 'инф.экология (лабараторная)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (12, 'Шакиров Кирилл Фаридович', 'инф.экология (лекция)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (13, 'Анна Юрьевна Москалёва', 'ин.яз. (практика)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (14, 'Рывлина Александра Александровна', 'комп.граф. (лекция)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (15, 'Ирина Ивановна Пискарёва', 'комп.граф. (практика)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (16, 'Наталья Николаевна Г.', 'физ-ра (физ.занятие)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (17, 'Кораблева Елена Валентиновна', 'философия (лекция)');
INSERT INTO public.teachers (id, full_name, subject) VALUES (18, 'Попов Антон Павлович', 'философия (практика)');


--
-- TOC entry 3010 (class 0 OID 16897)
-- Dependencies: 204
-- Data for Name: timetable; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (1, 0, 0, 'инф.тех. (практика)', 'ВЦ127', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (2, 0, 0, 'выч.тех. (лабараторная)', '314', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (3, 0, 0, 'ин.яз. (практика)', '404,301б', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (4, 0, 0, 'комп.граф. (практика)', '223', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (5, 0, 1, 'физ-ра (физ.занятие)', '', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (6, 0, 1, 'философия (практика)', '318', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (7, 0, 2, 'инф.тех. (практика)', 'ВЦ116', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (8, 0, 2, 'инф.тех. (практика)', 'ВЦ116', 1715);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (9, 0, 3, 'инф.экология (лекция)', '347', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (10, 0, 3, 'выч.тех. (лекция)', '310', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (11, 0, 3, 'комп.граф. (лекция)', '126', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (12, 0, 4, 'инф.экология (лабараторная)', '339', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (13, 0, 4, 'выш.мат. (практика)', '504а', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (14, 0, 4, 'физ-ра (физ.занятие)', '', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (15, 0, 4, 'алгем (практика)', '508', 1715);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (16, 1, 0, 'инф.тех. (практика)', 'ВЦ127', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (17, 1, 0, 'выч.тех. (практика)', '314', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (18, 1, 0, 'ин.яз. (практика)', '404,301б', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (19, 1, 0, 'комп.граф. (практика)', '223', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (20, 1, 1, 'физ-ра (физ.занятие)', '', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (21, 1, 1, 'философия (практика)', '318', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (22, 1, 2, 'выш.мат. (лекция)', '522', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (23, 1, 2, 'алгем (лекция)', '347', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (24, 1, 2, 'инф.тех. (лекция)', '517', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (25, 1, 3, 'философия (лекция)', '514', 930);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (26, 1, 3, 'выч.тех. (лекция)', '310', 1120);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (27, 1, 4, 'выш.мат. (практика)', '504а', 1310);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (28, 1, 4, 'физ-ра (физ.занятие)', '', 1525);
INSERT INTO public.timetable (id, week, day, subject, room, start_time) VALUES (29, 1, 4, 'алгем (практика)', '508', 1715);


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
