--

-- Feelight Database Initialization
-- Run this file to setup the database

--
-- PostgreSQL database dump
--

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-26 14:31:09 +03

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
-- TOC entry 220 (class 1259 OID 16491)
-- Name: moods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moods (
    id integer NOT NULL,
    mood character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 219 (class 1259 OID 16490)
-- Name: moods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 219
-- Name: moods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moods_id_seq OWNED BY public.moods.id;


--
-- TOC entry 224 (class 1259 OID 16510)
-- Name: music; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.music (
    id integer NOT NULL,
    mood character varying(50),
    title text,
    file_path text
);


--
-- TOC entry 223 (class 1259 OID 16509)
-- Name: music_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.music_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 223
-- Name: music_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.music_id_seq OWNED BY public.music.id;


--
-- TOC entry 222 (class 1259 OID 16500)
-- Name: quotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quotes (
    id integer NOT NULL,
    mood character varying(50),
    text text
);


--
-- TOC entry 221 (class 1259 OID 16499)
-- Name: quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 221
-- Name: quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quotes_id_seq OWNED BY public.quotes.id;


--
-- TOC entry 3680 (class 2604 OID 16494)
-- Name: moods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moods ALTER COLUMN id SET DEFAULT nextval('public.moods_id_seq'::regclass);


--
-- TOC entry 3683 (class 2604 OID 16513)
-- Name: music id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.music ALTER COLUMN id SET DEFAULT nextval('public.music_id_seq'::regclass);


--
-- TOC entry 3682 (class 2604 OID 16503)
-- Name: quotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quotes ALTER COLUMN id SET DEFAULT nextval('public.quotes_id_seq'::regclass);


--
-- TOC entry 3838 (class 0 OID 16491)
-- Dependencies: 220
-- Data for Name: moods; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.moods VALUES (3, 'Happy', '2026-03-21 01:00:39.642838');
INSERT INTO public.moods VALUES (4, 'Calm', '2026-03-21 01:03:18.844321');
INSERT INTO public.moods VALUES (5, 'Anxious', '2026-03-21 01:07:26.039521');
INSERT INTO public.moods VALUES (6, 'Happy', '2026-03-21 01:16:43.905742');
INSERT INTO public.moods VALUES (7, 'Angry', '2026-03-21 01:19:48.66547');
INSERT INTO public.moods VALUES (8, 'Sad', '2026-03-21 01:22:46.263436');
INSERT INTO public.moods VALUES (9, 'Happy', '2026-03-21 01:27:18.330699');
INSERT INTO public.moods VALUES (10, 'Calm', '2026-03-21 01:29:48.877302');
INSERT INTO public.moods VALUES (11, 'Calm', '2026-03-21 17:17:41.922478');
INSERT INTO public.moods VALUES (12, 'Calm', '2026-03-21 18:15:53.700756');
INSERT INTO public.moods VALUES (13, 'Calm', '2026-03-21 18:15:54.914602');


--
-- TOC entry 3842 (class 0 OID 16510)
-- Dependencies: 224
-- Data for Name: music; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.music VALUES (1, 'Happy', 'Sunshine Rush ☀️', 'music/happy1.mp3');
INSERT INTO public.music VALUES (2, 'Happy', 'Golden Days ✨', 'music/happy2.mp3');
INSERT INTO public.music VALUES (3, 'Happy', 'Lighthearted Beats 🌈', 'music/happy3.mp3');
INSERT INTO public.music VALUES (4, 'Sad', 'Fading Echo 💔', 'music/sad1.mp3');
INSERT INTO public.music VALUES (5, 'Sad', 'Midnight Tears 🌙', 'music/sad2.mp3');
INSERT INTO public.music VALUES (6, 'Calm', 'Inner Waves 🌊', 'music/calm1.mp3');
INSERT INTO public.music VALUES (7, 'Calm', 'Silent Pulse 🫀', 'music/calm2.mp3');
INSERT INTO public.music VALUES (8, 'Calm', 'Mind Drift 🧠', 'music/calm3.mp3');
INSERT INTO public.music VALUES (9, 'Calm', 'Distant Horizon 🌫️', 'music/angry1.mp3');
INSERT INTO public.music VALUES (10, 'Angry', 'Inner Waves 🌊', 'music/calm1.mp3');
INSERT INTO public.music VALUES (11, 'Angry', 'Silent Pulse 🫀', 'music/calm2.mp3');
INSERT INTO public.music VALUES (12, 'Angry', 'Mind Drift 🧠', 'music/calm3.mp3');
INSERT INTO public.music VALUES (13, 'Angry', 'Distant Horizon 🌫️', 'music/angry1.mp3');
INSERT INTO public.music VALUES (14, 'Anxious', 'Inner Waves 🌊', 'music/calm1.mp3');
INSERT INTO public.music VALUES (15, 'Anxious', 'Silent Pulse 🫀', 'music/calm2.mp3');
INSERT INTO public.music VALUES (16, 'Anxious', 'Mind Drift 🧠', 'music/calm3.mp3');
INSERT INTO public.music VALUES (17, 'Anxious', 'Distant Horizon 🌫️', 'music/angry1.mp3');


--
-- TOC entry 3840 (class 0 OID 16500)
-- Dependencies: 222
-- Data for Name: quotes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.quotes VALUES (1, 'Happy', 'You’re glowing today — don’t dim it. ✨💌');
INSERT INTO public.quotes VALUES (2, 'Happy', 'This moment matters more than you think. 🌼');
INSERT INTO public.quotes VALUES (3, 'Happy', 'Stay in this feeling a little longer. 💫🌾');
INSERT INTO public.quotes VALUES (4, 'Happy', 'Something is going right — let it be. ☀️');
INSERT INTO public.quotes VALUES (5, 'Happy', 'You deserve to feel this light. 🌿');
INSERT INTO public.quotes VALUES (6, 'Happy', 'Don’t rush — just enjoy being here. 🎈🧸 🎀');
INSERT INTO public.quotes VALUES (7, 'Happy', 'Keep this feeling, you’ll need it someday. 💛');
INSERT INTO public.quotes VALUES (8, 'Sad', 'It’s okay to feel heavy sometimes. 🌧️');
INSERT INTO public.quotes VALUES (9, 'Sad', 'You don’t have to fix everything right now. 🫂');
INSERT INTO public.quotes VALUES (10, 'Sad', 'This feeling will pass, even if slowly. 🌙');
INSERT INTO public.quotes VALUES (11, 'Sad', 'Be softer with yourself today. 🤍🪞🫧');
INSERT INTO public.quotes VALUES (12, 'Sad', 'You’re allowed to just feel, nothing more. 🕊️');
INSERT INTO public.quotes VALUES (13, 'Sad', 'Not every day has to be a good one. 🍂');
INSERT INTO public.quotes VALUES (14, 'Sad', 'Even small steps count today. 💧');
INSERT INTO public.quotes VALUES (15, 'Angry', 'Your anger is valid — don’t ignore it. 🔥');
INSERT INTO public.quotes VALUES (16, 'Angry', 'You don’t have to react immediately. ⏸️️');
INSERT INTO public.quotes VALUES (17, 'Angry', 'Pause — not everything needs a response. 🌪️️');
INSERT INTO public.quotes VALUES (18, 'Angry', 'Th️is feeling is strong, but temporary. 🌬️🍃🫧');
INSERT INTO public.quotes VALUES (19, 'Angry', 'Let it guide you, not control you. 🕯️📜🖋️');
INSERT INTO public.quotes VALUES (20, 'Angry', 'Protect your peace before proving a point.⏸️️');
INSERT INTO public.quotes VALUES (21, 'Angry', 'Step back — clarity comes after space. 🔥');
INSERT INTO public.quotes VALUES (22, 'Anxious', 'This is anxiety, not danger. 🌫️🫧☁️');
INSERT INTO public.quotes VALUES (23, 'Anxious', 'Breathe — your body knows what to do. 🌬️️🍃');
INSERT INTO public.quotes VALUES (24, 'Anxious', 'Not every thought is true. 💌');
INSERT INTO public.quotes VALUES (25, 'Anxious', 'Take one small step, that’s enough. 🪶️🕊️🌿');
INSERT INTO public.quotes VALUES (26, 'Anxious', 'This feeling will pass like a wave. 🌊️');
INSERT INTO public.quotes VALUES (27, 'Anxious', 'You are safe right now. 🔒🕊️💌');
INSERT INTO public.quotes VALUES (28, 'Anxious', 'Slow down — you don’t need all the answers. 🕯️️');
INSERT INTO public.quotes VALUES (29, 'Calm', 'Stay here — this peace is yours. 🍃️🌿');
INSERT INTO public.quotes VALUES (30, 'Calm', 'You don’t need to rush anything. 🌅️🎠');
INSERT INTO public.quotes VALUES (31, 'Calm', 'This stillness is enough. 🪷️');
INSERT INTO public.quotes VALUES (32, 'Calm', 'Let things unfold gently. ☁️️🍵🌿');
INSERT INTO public.quotes VALUES (33, 'Calm', 'You’re exactly where you need to be. 🌊️🫧☁️');
INSERT INTO public.quotes VALUES (34, 'Calm', 'Nothing needs fixing right now. 🧘️');
INSERT INTO public.quotes VALUES (35, 'Calm', 'Just breathe and exist for a moment. 🌙 ✨');


--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 219
-- Name: moods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moods_id_seq', 13, true);


--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 223
-- Name: music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.music_id_seq', 17, true);


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 221
-- Name: quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quotes_id_seq', 35, true);


--
-- TOC entry 3685 (class 2606 OID 16498)
-- Name: moods moods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moods
    ADD CONSTRAINT moods_pkey PRIMARY KEY (id);


--
-- TOC entry 3689 (class 2606 OID 16518)
-- Name: music music_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.music
    ADD CONSTRAINT music_pkey PRIMARY KEY (id);


--
-- TOC entry 3687 (class 2606 OID 16508)
-- Name: quotes quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_pkey PRIMARY KEY (id);


-- Completed on 2026-03-26 14:31:09 +03

--
-- PostgreSQL database dump complete
--


