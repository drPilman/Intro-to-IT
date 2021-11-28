--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-0ubuntu0.21.10.1)

-- Started on 2021-11-28 23:52:48 MSK





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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--



SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 1887362)
-- Name: days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.days (
    id integer NOT NULL,
    number_in_all integer NOT NULL,
    number_in_week integer NOT NULL,
    number_of_week integer NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 1887360)
-- Name: days_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.days_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 202
-- Name: days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.days_id_seq OWNED BY public.days.id;


--
-- TOC entry 205 (class 1259 OID 1887370)
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying NOT NULL,
    comment character varying
);


--
-- TOC entry 204 (class 1259 OID 1887368)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 204
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 217 (class 1259 OID 1887441)
-- Name: lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lessons (
    id integer NOT NULL,
    group_id integer NOT NULL,
    time_id integer NOT NULL,
    day_id integer NOT NULL,
    subject_id integer NOT NULL,
    type_id integer,
    teacher_id integer,
    room_id integer,
    comment character varying
);


--
-- TOC entry 216 (class 1259 OID 1887439)
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 216
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- TOC entry 211 (class 1259 OID 1887403)
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying NOT NULL,
    comment character varying
);


--
-- TOC entry 210 (class 1259 OID 1887401)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 210
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- TOC entry 215 (class 1259 OID 1887425)
-- Name: rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rooms (
    id integer,
    name character varying,
    comment character varying,
    location_id integer
)
INHERITS (public.locations);


--
-- TOC entry 214 (class 1259 OID 1887423)
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 214
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- TOC entry 209 (class 1259 OID 1887392)
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying NOT NULL,
    short character varying NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 1887390)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 208
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- TOC entry 213 (class 1259 OID 1887414)
-- Name: teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    first_name character varying,
    second_name character varying,
    last_name character varying,
    email character varying,
    number character varying,
    hrefs character varying,
    comment character varying
);


--
-- TOC entry 212 (class 1259 OID 1887412)
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
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 212
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 201 (class 1259 OID 1887354)
-- Name: times; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.times (
    id integer NOT NULL,
    start_hour integer NOT NULL,
    start_minute integer NOT NULL,
    end_hour integer NOT NULL,
    end_minute integer NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 1887352)
-- Name: times_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.times_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 200
-- Name: times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.times_id_seq OWNED BY public.times.id;


--
-- TOC entry 207 (class 1259 OID 1887381)
-- Name: types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1887379)
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 206
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- TOC entry 3893 (class 2604 OID 1887365)
-- Name: days id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.days ALTER COLUMN id SET DEFAULT nextval('public.days_id_seq'::regclass);


--
-- TOC entry 3894 (class 2604 OID 1887373)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 3900 (class 2604 OID 1887444)
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- TOC entry 3897 (class 2604 OID 1887406)
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- TOC entry 3899 (class 2604 OID 1887428)
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- TOC entry 3896 (class 2604 OID 1887395)
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- TOC entry 3898 (class 2604 OID 1887417)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- TOC entry 3892 (class 2604 OID 1887357)
-- Name: times id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.times ALTER COLUMN id SET DEFAULT nextval('public.times_id_seq'::regclass);


--
-- TOC entry 3895 (class 2604 OID 1887384)
-- Name: types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- TOC entry 4060 (class 0 OID 1887362)
-- Dependencies: 203
-- Data for Name: days; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (1, 0, 0, 0);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (2, 1, 1, 0);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (3, 2, 2, 0);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (4, 3, 3, 0);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (5, 4, 4, 0);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (6, 5, 5, 0);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (7, 6, 0, 1);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (8, 7, 1, 1);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (9, 8, 2, 1);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (10, 9, 3, 1);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (11, 10, 4, 1);
INSERT INTO public.days (id, number_in_all, number_in_week, number_of_week) VALUES (12, 11, 5, 1);


--
-- TOC entry 4062 (class 0 OID 1887370)
-- Dependencies: 205
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.groups (id, name, comment) VALUES (1, 'Группа №0', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (2, 'Группа №1', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (3, 'Группа №2', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (4, 'Группа №3', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (5, 'Группа №4', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (6, 'Группа №5', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (7, 'Группа №6', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (8, 'Группа №7', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (9, 'Группа №8', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (10, 'Группа №9', NULL);
INSERT INTO public.groups (id, name, comment) VALUES (11, 'БВТ2104', NULL);


--
-- TOC entry 4074 (class 0 OID 1887441)
-- Dependencies: 217
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (1, 11, 1, 1, 1, 2, 11, 57, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (2, 11, 2, 1, 8, 3, 12, 58, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (3, 11, 3, 1, 7, 2, 19, 59, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (4, 11, 4, 1, 2, 2, 16, 60, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (5, 11, 1, 2, 4, 4, 17, 61, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (6, 11, 2, 2, 9, 2, 21, 62, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (7, 11, 4, 3, 1, 2, 11, 63, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (8, 11, 5, 3, 1, 2, 11, 63, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (9, 11, 1, 4, 3, 1, 18, 64, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (10, 11, 2, 4, 8, 1, 20, 65, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (11, 11, 3, 4, 2, 1, 15, 66, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (12, 11, 2, 5, 3, 3, 18, 67, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (13, 11, 3, 5, 5, 2, 13, 68, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (14, 11, 4, 5, 4, 4, 17, 61, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (15, 11, 5, 5, 6, 2, 14, 69, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (16, 11, 1, 7, 1, 2, 11, 57, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (17, 11, 2, 7, 8, 2, 12, 58, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (18, 11, 3, 7, 7, 2, 19, 59, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (19, 11, 4, 7, 2, 2, 16, 60, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (20, 11, 1, 8, 4, 4, 17, 61, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (21, 11, 2, 8, 9, 2, 21, 62, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (22, 11, 1, 9, 5, 1, 13, 70, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (23, 11, 2, 9, 6, 1, 14, 64, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (24, 11, 3, 9, 1, 1, 11, 71, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (25, 11, 1, 10, 9, 1, 21, 72, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (26, 11, 2, 10, 8, 1, 20, 65, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (27, 11, 3, 11, 5, 2, 13, 68, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (28, 11, 4, 11, 4, 4, 17, 61, NULL);
INSERT INTO public.lessons (id, group_id, time_id, day_id, subject_id, type_id, teacher_id, room_id, comment) VALUES (29, 11, 5, 11, 6, 2, 14, 69, NULL);


--
-- TOC entry 4068 (class 0 OID 1887403)
-- Dependencies: 211
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.locations (id, name, comment) VALUES (1, 'Народного Ополчения', NULL);
INSERT INTO public.locations (id, name, comment) VALUES (2, 'Авиамоторная', NULL);


--
-- TOC entry 4072 (class 0 OID 1887425)
-- Dependencies: 215
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.rooms (id, name, comment, location_id) VALUES (1, '0', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (2, '1', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (3, '2', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (4, '3', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (5, '4', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (6, '5', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (7, '6', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (8, '7', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (9, '8', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (10, '9', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (11, '10', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (12, '11', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (13, '12', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (14, '13', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (15, '14', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (16, '15', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (17, '16', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (18, '17', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (19, '18', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (20, '19', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (21, '0', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (22, '1', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (23, '2', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (24, '3', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (25, '4', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (26, '5', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (27, '6', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (28, '7', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (29, '8', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (30, '9', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (31, '10', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (32, '11', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (33, '12', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (34, '13', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (35, '14', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (37, '16', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (38, '17', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (39, '18', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (40, '19', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (36, '15', NULL, 2);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (57, 'ВЦ127', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (58, '314', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (59, '404,301б', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (60, '223', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (61, '', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (62, '318', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (63, 'ВЦ116', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (64, '347', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (65, '310', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (66, '126', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (67, '339', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (68, '504а', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (69, '508', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (70, '522', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (71, '517', NULL, 1);
INSERT INTO public.rooms (id, name, comment, location_id) VALUES (72, '514', NULL, 1);


--
-- TOC entry 4066 (class 0 OID 1887392)
-- Dependencies: 209
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subjects (id, name, short) VALUES (1, 'Введение в информационные технологии', 'инф.тех.');
INSERT INTO public.subjects (id, name, short) VALUES (2, 'Компьютерная графика', 'комп.граф.');
INSERT INTO public.subjects (id, name, short) VALUES (3, 'Информационная экология', 'инф.экология');
INSERT INTO public.subjects (id, name, short) VALUES (4, 'Физическая культура и спорт', 'физ-ра');
INSERT INTO public.subjects (id, name, short) VALUES (5, 'Высшая математика', 'выш.мат.');
INSERT INTO public.subjects (id, name, short) VALUES (6, 'Алгебра и геометрия', 'алгем');
INSERT INTO public.subjects (id, name, short) VALUES (8, 'Вычислительная техника', 'выч.тех.');
INSERT INTO public.subjects (id, name, short) VALUES (9, 'Философия', 'философия');
INSERT INTO public.subjects (id, name, short) VALUES (7, 'Иностранный язык', 'ин.яз.');


--
-- TOC entry 4070 (class 0 OID 1887414)
-- Dependencies: 213
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (1, 'Алон', NULL, 'Сахибов', 'coerced2040@gmail.com', '+7-(968)-630-13-09', 'https://twitter.com/XyloquinonePerfusate_2045', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (2, 'Анора', NULL, 'Коламева', 'suing1835@yandex.com', '+7-(963)-590-67-20', 'https://twitter.com/unaffectionate-1824', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (3, 'Наргиза', NULL, 'Пруленцова', 'regroove1801@protonmail.com', '+7-(965)-797-99-68', 'https://vk.com/uncool-1987', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (4, 'Сафия', NULL, 'Ахидова', 'arcane1949@yahoo.com', '+7-(999)-510-96-33', 'https://twitter.com/DiktatUndiscording_1896', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (5, 'Сион', NULL, 'Бальмаков', 'churn1919@live.com', '+7-(923)-906-41-23', 'https://instagram.com/Sorts_1850', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (6, 'Куца', NULL, 'Шандыкова', 'angry1945@yandex.com', '+7-(966)-365-30-60', 'https://facebook.com/Primeval_1918', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (7, 'Хуана', NULL, 'Акулова', 'agnar2063@yahoo.com', '+7-(917)-928-86-77', 'https://instagram.com/Ambition.1902', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (8, 'Эрке', NULL, 'Чеведаева', 'basco1879@live.com', '+7-(915)-999-63-86', 'https://twitter.com/allgood-1884', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (9, 'Мазахир', NULL, 'Щетрев', 'stengah2008@yandex.com', '+7-(915)-768-01-56', 'https://twitter.com/flighted-1868', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (10, 'Зубаржат', NULL, 'Зарезаева', 'baited2043@yandex.com', '+7-(904)-680-66-41', 'https://facebook.com/Jargoons.1897', NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (11, 'Грач', 'Мкртчян', 'Маратович', NULL, NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (12, 'Анастасия', 'Изотова', 'Андреевна', NULL, NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (13, 'Ирина ', 'Гетманская', 'Васильевна', NULL, NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (14, 'Андрей', 'Куприн', 'Валентинович', NULL, NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (15, 'А', 'Рывлина', 'А', NULL, NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (16, 'Ирина', 'Пискарева', 'Ивановна', NULL, NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (17, 'Наталья', NULL, 'Николаевна', NULL, NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (18, 'Кирилл', 'Шакиров', 'Фаридович', NULL, NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (19, 'Анна', NULL, 'Юрьевна', NULL, NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (20, 'Сергей', 'Симонов', 'Евгеньевич', 'simonov1920@ya.ru', NULL, NULL, NULL);
INSERT INTO public.teachers (id, first_name, second_name, last_name, email, number, hrefs, comment) VALUES (21, 'Андрей', 'Глинский', 'Владимирович', NULL, NULL, NULL, NULL);


--
-- TOC entry 4058 (class 0 OID 1887354)
-- Dependencies: 201
-- Data for Name: times; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.times (id, start_hour, start_minute, end_hour, end_minute) VALUES (1, 9, 30, 11, 5);
INSERT INTO public.times (id, start_hour, start_minute, end_hour, end_minute) VALUES (2, 11, 20, 12, 55);
INSERT INTO public.times (id, start_hour, start_minute, end_hour, end_minute) VALUES (3, 13, 10, 14, 45);
INSERT INTO public.times (id, start_hour, start_minute, end_hour, end_minute) VALUES (4, 15, 25, 17, 0);
INSERT INTO public.times (id, start_hour, start_minute, end_hour, end_minute) VALUES (5, 17, 15, 18, 50);


--
-- TOC entry 4064 (class 0 OID 1887381)
-- Dependencies: 207
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.types (id, name) VALUES (1, 'лек');
INSERT INTO public.types (id, name) VALUES (2, 'пр.з');
INSERT INTO public.types (id, name) VALUES (3, 'лаб');
INSERT INTO public.types (id, name) VALUES (4, 'физ');


--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 202
-- Name: days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.days_id_seq', 12, true);


--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 204
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.groups_id_seq', 11, true);


--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 216
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lessons_id_seq', 29, true);


--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 210
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.locations_id_seq', 2, true);


--
-- TOC entry 4094 (class 0 OID 0)
-- Dependencies: 214
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rooms_id_seq', 72, true);


--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 208
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subjects_id_seq', 9, true);


--
-- TOC entry 4096 (class 0 OID 0)
-- Dependencies: 212
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teachers_id_seq', 21, true);


--
-- TOC entry 4097 (class 0 OID 0)
-- Dependencies: 200
-- Name: times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.times_id_seq', 5, true);


--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 206
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.types_id_seq', 4, true);


--
-- TOC entry 3904 (class 2606 OID 1887367)
-- Name: days days_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.days
    ADD CONSTRAINT days_pkey PRIMARY KEY (id);


--
-- TOC entry 3906 (class 2606 OID 1887378)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3918 (class 2606 OID 1887449)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 3912 (class 2606 OID 1887411)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3916 (class 2606 OID 1887433)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 3910 (class 2606 OID 1887400)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 3914 (class 2606 OID 1887422)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 3902 (class 2606 OID 1887359)
-- Name: times times_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.times
    ADD CONSTRAINT times_pkey PRIMARY KEY (id);


--
-- TOC entry 3908 (class 2606 OID 1887389)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- TOC entry 3922 (class 2606 OID 1887460)
-- Name: lessons lessons_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.days(id);


--
-- TOC entry 3920 (class 2606 OID 1887450)
-- Name: lessons lessons_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 3926 (class 2606 OID 1887480)
-- Name: lessons lessons_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- TOC entry 3923 (class 2606 OID 1887465)
-- Name: lessons lessons_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 3925 (class 2606 OID 1887475)
-- Name: lessons lessons_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- TOC entry 3921 (class 2606 OID 1887455)
-- Name: lessons lessons_time_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_time_id_fkey FOREIGN KEY (time_id) REFERENCES public.times(id);


--
-- TOC entry 3924 (class 2606 OID 1887470)
-- Name: lessons lessons_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- TOC entry 3919 (class 2606 OID 1887434)
-- Name: rooms rooms_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


-- Completed on 2021-11-28 23:53:12 MSK

--
-- PostgreSQL database dump complete
--

