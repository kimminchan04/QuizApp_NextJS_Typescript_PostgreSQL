--
-- PostgreSQL database dump
--

\restrict Bv65Q221UfI8F1kUiHNuAQWkQn37I4x0iJgTErlOtDZ8CUxHZmYPO5YkvpOH188

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: quiz_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_attempts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    word_id integer NOT NULL,
    is_correct boolean NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.quiz_attempts OWNER TO postgres;

--
-- Name: quiz_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_attempts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_attempts_id_seq OWNER TO postgres;

--
-- Name: quiz_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_attempts_id_seq OWNED BY public.quiz_attempts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    device_id uuid NOT NULL,
    created timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: word; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.word (
    id integer NOT NULL,
    english character varying(50) NOT NULL,
    korean_correct character varying(50) NOT NULL,
    korean_wrong character varying(50)[] NOT NULL,
    created timestamp with time zone DEFAULT now()
);


ALTER TABLE public.word OWNER TO postgres;

--
-- Name: word_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.word_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.word_id_seq OWNER TO postgres;

--
-- Name: word_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.word_id_seq OWNED BY public.word.id;


--
-- Name: quiz_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts ALTER COLUMN id SET DEFAULT nextval('public.quiz_attempts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: word id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word ALTER COLUMN id SET DEFAULT nextval('public.word_id_seq'::regclass);


--
-- Data for Name: quiz_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_attempts (id, user_id, word_id, is_correct, created) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, device_id, created) FROM stdin;
\.


--
-- Data for Name: word; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.word (id, english, korean_correct, korean_wrong, created) FROM stdin;
1	apple	사과	{바나나,포도,오렌지}	2026-09-26 17:57:25.013372+09
2	strong	강하다	{진보적이다,재미있다,놀다}	2026-09-26 17:57:25.013372+09
3	dream	꿈	{전쟁,슬프다,화나다}	2026-09-26 18:00:23.855622+09
5	dog	강아지	{토끼,고양이,호랑이}	2026-09-26 18:05:56.706879+09
6	book	책	{연필,노트,책상}	2026-09-26 18:05:56.706879+09
7	water	물	{불,흙,바람}	2026-09-26 18:05:56.706879+09
9	school	학교	{서점,도서관,공원}	2026-09-26 18:05:56.706879+09
10	run	뛰다	{앉다,걷다,눕다}	2026-09-26 18:05:56.706879+09
11	blue	파란색	{노란색,초록색,흰색}	2026-09-26 18:05:56.706879+09
12	mother	어머니	{아버지,언니,동생}	2026-09-26 18:05:56.706879+09
13	friend	친구	{이웃,친척,가족}	2026-09-26 18:05:56.706879+09
14	understand	이해하다	{감지하다,사랑하다,터득하다}	2026-09-27 15:34:11.439019+09
15	employee	고용자	{사장,월급,퇴근하다}	2026-09-27 15:34:11.439019+09
16	habit	취미	{전쟁,살피다,싫다}	2026-09-27 15:34:11.439019+09
17	relationship	관계	{정렬,사기,죄}	2026-09-27 19:43:21.671245+09
18	attitude	태도	{사랑,하늘,땅}	2026-09-27 19:43:21.671245+09
19	influence	영향, 영향을 끼치다	{때리다,밀다,당기다}	2026-09-27 19:43:21.671245+09
20	material	자료	{명령하다,낙하하다,도전하다}	2026-09-27 19:43:21.671245+09
21	opportunity	기회	{공정,철폐하다,조롱하다}	2026-09-27 19:43:21.671245+09
8	happy	행복한	{화난,즐거운,피곤한}	2026-09-26 18:05:56.706879+09
22	environment	환경	{사람,중성적인,저장하다}	2026-09-29 19:32:42.260765+09
23	expense	비용	{할인,이익,저축}	2026-09-29 19:32:42.260765+09
24	local	지방의	{국제적인,임시의,개인적인}	2026-09-29 19:32:42.260765+09
25	involve	관련되다	{분리하다,무시하다,완성하다}	2026-09-29 19:32:42.260765+09
26	stress	강조, 압력을 주다	{완화하다,축소하다,입력하다}	2026-09-29 19:32:42.260765+09
27	therefore	그러므로	{그러나,게다가,"예를 들어"}	2026-09-29 19:32:42.260765+09
28	contain	포함하다	{제외하다,파괴하다,판매하다}	2026-09-29 19:32:42.260765+09
29	average	평균	{최대,합계,최소}	2026-09-29 19:32:42.260765+09
30	ride	타다	{던지다,걷다,두르다}	2026-09-29 19:32:42.260765+09
31	consume	소비하다	{생산하다,저장하다,판매하다}	2026-09-29 19:32:42.260765+09
32	impress	깊은 인상을 주다	{실망하다,무시하다,방해하다}	2026-09-29 19:32:42.260765+09
33	object	물체	{생각,감정,소리}	2026-09-29 19:32:42.260765+09
\.


--
-- Name: quiz_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_attempts_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: word_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.word_id_seq', 33, true);


--
-- Name: quiz_attempts quiz_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT quiz_attempts_pkey PRIMARY KEY (id);


--
-- Name: users users_device_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_device_id_key UNIQUE (device_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: word word_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word
    ADD CONSTRAINT word_pkey PRIMARY KEY (id);


--
-- Name: idx_quiz_attempts_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_attempts_user ON public.quiz_attempts USING btree (user_id);


--
-- Name: quiz_attempts quiz_attempts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT quiz_attempts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: quiz_attempts quiz_attempts_word_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT quiz_attempts_word_id_fkey FOREIGN KEY (word_id) REFERENCES public.word(id);


--
-- PostgreSQL database dump complete
--

\unrestrict Bv65Q221UfI8F1kUiHNuAQWkQn37I4x0iJgTErlOtDZ8CUxHZmYPO5YkvpOH188

