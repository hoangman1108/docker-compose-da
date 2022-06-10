--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-2.pgdg20.04+1)
-- Dumped by pg_dump version 13.1

-- Started on 2022-01-18 21:47:48

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

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 10823996)
-- Name: Admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Admin" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role integer DEFAULT 0,
    fullname character varying(255) NOT NULL,
    "isBan" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10823994)
-- Name: Admin_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Admin_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4078 (class 0 OID 0)
-- Dependencies: 215
-- Name: Admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Admin_id_seq" OWNED BY public."Admin".id;


--
-- TOC entry 203 (class 1259 OID 10823876)
-- Name: Assignment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Assignment" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    point double precision NOT NULL,
    "ClassId" integer,
    "NO" integer
);


--
-- TOC entry 202 (class 1259 OID 10823874)
-- Name: Assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Assignment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4079 (class 0 OID 0)
-- Dependencies: 202
-- Name: Assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Assignment_id_seq" OWNED BY public."Assignment".id;


--
-- TOC entry 201 (class 1259 OID 10823863)
-- Name: Class; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Class" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    "inviteCodeTeacher" character varying(255),
    "inviteCodeStudent" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 10823861)
-- Name: Class_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Class_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4080 (class 0 OID 0)
-- Dependencies: 200
-- Name: Class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Class_id_seq" OWNED BY public."Class".id;


--
-- TOC entry 212 (class 1259 OID 10823974)
-- Name: Comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Comment" (
    id integer NOT NULL,
    "reviewId" integer NOT NULL,
    "isTeacher" boolean,
    comment character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 10823972)
-- Name: Comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Comment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 211
-- Name: Comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Comment_id_seq" OWNED BY public."Comment".id;


--
-- TOC entry 205 (class 1259 OID 10823894)
-- Name: Grade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Grade" (
    id integer NOT NULL,
    "studentId" character varying(255) NOT NULL,
    "fullName" character varying(255),
    point integer,
    "isCompleted" boolean DEFAULT false,
    "AssignmentId" integer,
    "ClassId" integer
);


--
-- TOC entry 204 (class 1259 OID 10823892)
-- Name: Grade_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Grade_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 204
-- Name: Grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Grade_id_seq" OWNED BY public."Grade".id;


--
-- TOC entry 214 (class 1259 OID 10823982)
-- Name: Notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Notification" (
    id integer NOT NULL,
    "userId" integer,
    content character varying(255),
    link character varying(255),
    "isNew" boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 10823980)
-- Name: Notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Notification_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 213
-- Name: Notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Notification_id_seq" OWNED BY public."Notification".id;


--
-- TOC entry 210 (class 1259 OID 10823963)
-- Name: Review; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Review" (
    id integer NOT NULL,
    "gradeId" integer,
    "gradeWant" integer,
    explaination character varying(255),
    final boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 10823961)
-- Name: Review_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Review_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 209
-- Name: Review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Review_id_seq" OWNED BY public."Review".id;


--
-- TOC entry 207 (class 1259 OID 10823928)
-- Name: User; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255),
    "authType" character varying(255) DEFAULT 'local'::character varying,
    "authGoogleID" character varying(255) DEFAULT NULL::character varying,
    fullname character varying(255) NOT NULL,
    "IDstudent" character varying(255),
    avatar character varying(255),
    "isActive" boolean,
    "isBan" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 10823926)
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 206
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- TOC entry 208 (class 1259 OID 10823946)
-- Name: UserinClass; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."UserinClass" (
    role integer NOT NULL,
    "UserId" integer NOT NULL,
    "ClassId" integer NOT NULL
);


--
-- TOC entry 3901 (class 2604 OID 10823999)
-- Name: Admin id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Admin" ALTER COLUMN id SET DEFAULT nextval('public."Admin_id_seq"'::regclass);


--
-- TOC entry 3889 (class 2604 OID 10823879)
-- Name: Assignment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Assignment" ALTER COLUMN id SET DEFAULT nextval('public."Assignment_id_seq"'::regclass);


--
-- TOC entry 3888 (class 2604 OID 10823866)
-- Name: Class id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Class" ALTER COLUMN id SET DEFAULT nextval('public."Class_id_seq"'::regclass);


--
-- TOC entry 3898 (class 2604 OID 10823977)
-- Name: Comment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Comment" ALTER COLUMN id SET DEFAULT nextval('public."Comment_id_seq"'::regclass);


--
-- TOC entry 3890 (class 2604 OID 10823897)
-- Name: Grade id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade" ALTER COLUMN id SET DEFAULT nextval('public."Grade_id_seq"'::regclass);


--
-- TOC entry 3899 (class 2604 OID 10823985)
-- Name: Notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Notification" ALTER COLUMN id SET DEFAULT nextval('public."Notification_id_seq"'::regclass);


--
-- TOC entry 3896 (class 2604 OID 10823966)
-- Name: Review id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Review" ALTER COLUMN id SET DEFAULT nextval('public."Review_id_seq"'::regclass);


--
-- TOC entry 3892 (class 2604 OID 10823931)
-- Name: User id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- TOC entry 4072 (class 0 OID 10823996)
-- Dependencies: 216
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Admin" VALUES (1, 'myclassroom.mailer@gmail.com', '$2b$10$CskveoAfXp.NwQQF8y5EVunzHILVJ5kHFxwtG0DA9dbv6zvesRXNq', 1, 'My Classroom Super Admin', false, '2022-01-17 07:55:05.997+00', '2022-01-17 07:55:05.997+00');
INSERT INTO public."Admin" VALUES (2, 'admin01@gmail.com', '$2b$10$yoax.r1TURrLxM9Q438PEecVGWxwELhna4AoRyvNjNk7ucMfdgCFa', 0, 'Thien Tam Admin', false, '2022-01-18 12:53:23.804+00', '2022-01-18 12:53:23.804+00');


--
-- TOC entry 4059 (class 0 OID 10823876)
-- Dependencies: 203
-- Data for Name: Assignment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Assignment" VALUES (1, 'Bài tập', 1, 2, 0);
INSERT INTO public."Assignment" VALUES (2, 'Đồ án', 3, 2, 1);
INSERT INTO public."Assignment" VALUES (3, 'Thi cuối kỳ', 6, 2, 2);


--
-- TOC entry 4057 (class 0 OID 10823863)
-- Dependencies: 201
-- Data for Name: Class; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Class" VALUES (1, 'PTUDWNC', 'Lớp phát triển ứng dụng Web nâng cao', 'kmgSRG9B', 'BG4BOU70', '2022-01-18 12:35:56.611+00', '2022-01-18 12:35:56.611+00');
INSERT INTO public."Class" VALUES (2, 'PTUDWNC - CQ', 'Lớp phát triển ứng dụng Web nâng cao chính quy', 'SkUlWERF', 'bjO9mdsL', '2022-01-18 12:42:14.024+00', '2022-01-18 12:42:14.024+00');


--
-- TOC entry 4068 (class 0 OID 10823974)
-- Dependencies: 212
-- Data for Name: Comment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Comment" VALUES (1, 1, true, 'Hi', '2022-01-18 12:46:50.267+00', '2022-01-18 12:46:50.267+00');
INSERT INTO public."Comment" VALUES (2, 1, false, 'Hello', '2022-01-18 12:47:02.113+00', '2022-01-18 12:47:02.113+00');


--
-- TOC entry 4061 (class 0 OID 10823894)
-- Dependencies: 205
-- Data for Name: Grade; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Grade" VALUES (2, '18120546', 'Mai Thien Tam', 75, true, 2, 2);
INSERT INTO public."Grade" VALUES (3, '18120546', 'Mai Thien Tam', 75, true, 3, 2);
INSERT INTO public."Grade" VALUES (1, '18120546', 'Mai Thien Tam', 90, true, 1, 2);


--
-- TOC entry 4070 (class 0 OID 10823982)
-- Dependencies: 214
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Notification" VALUES (1, 6, 'Giáo viên đã hoàn thành cột điểm Bài tập', '/class/2', false, '2022-01-18 12:45:47.793+00', '2022-01-18 12:46:07.36+00');
INSERT INTO public."Notification" VALUES (5, 6, 'Giáo viên đã cập nhật điểm Bài tập cho bạn', '/reviewDetail/1/1', true, '2022-01-18 12:47:24.282+00', '2022-01-18 12:47:24.282+00');
INSERT INTO public."Notification" VALUES (3, 6, 'Giáo viên đã thêm bình luận mới vào bài phúc khảo của bạn.', '/reviewDetail/1/0', false, '2022-01-18 12:46:50.271+00', '2022-01-18 12:47:43.249+00');
INSERT INTO public."Notification" VALUES (6, 6, 'Giáo viên đã hoàn thành toàn bộ bảng điểm.', '/class/2', false, '2022-01-18 12:48:07.223+00', '2022-01-18 12:48:19.746+00');
INSERT INTO public."Notification" VALUES (4, 5, 'Tam Google đã thêm bình luận về bài phúc khảo của họ.', '/reviewDetail/1/1', false, '2022-01-18 12:47:03.444+00', '2022-01-18 13:13:57.023+00');
INSERT INTO public."Notification" VALUES (2, 5, 'Tam Google đã yêu cầu phúc khảo.', '/viewGrade/18120546/2/1', false, '2022-01-18 12:46:37.667+00', '2022-01-18 13:14:00.418+00');


--
-- TOC entry 4066 (class 0 OID 10823963)
-- Dependencies: 210
-- Data for Name: Review; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Review" VALUES (1, 1, 90, 'Không làm tốt', true, '2022-01-18 12:46:36.388+00', '2022-01-18 12:47:22.985+00');


--
-- TOC entry 4063 (class 0 OID 10823928)
-- Dependencies: 207
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."User" VALUES (6, 'thientamgg7@gmail.com', NULL, 'google', '107685031570404992154', 'Tam Google 1', '18120546', 'https://res.cloudinary.com/ddjuioczp/image/upload/v1642510127/web-avatar/alwryjiu2k0ygduhxxl7.jpg', true, false, '2022-01-18 12:43:29.266+00', '2022-01-18 12:48:52.881+00');
INSERT INTO public."User" VALUES (5, 'thientamao123@gmail.com', '$2b$10$MEdYmZb53yC9aomi5uOyIOkj5m53DmhiVVtjrUxAKXtbPdj6AI5Fi', 'local', NULL, 'Mai Thiện Tâm 1', '18120547', NULL, true, false, '2022-01-18 12:41:23.434+00', '2022-01-18 12:54:52.795+00');
INSERT INTO public."User" VALUES (1, 'thientamlocal@gmail.com', '$2b$10$Q1lyKCGyO39mO6Icg34tYOcfzflXZLXqhEw.hS6i8mLw2dRoWwK6y', 'local', NULL, 'Mai Thiện Tâm 1', NULL, NULL, true, false, '2022-01-18 11:50:53.814+00', '2022-01-18 13:15:38.802+00');


--
-- TOC entry 4064 (class 0 OID 10823946)
-- Dependencies: 208
-- Data for Name: UserinClass; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."UserinClass" VALUES (2, 1, 1);
INSERT INTO public."UserinClass" VALUES (2, 5, 2);
INSERT INTO public."UserinClass" VALUES (0, 6, 2);


--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 215
-- Name: Admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Admin_id_seq"', 2, true);


--
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 202
-- Name: Assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Assignment_id_seq"', 3, true);


--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 200
-- Name: Class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Class_id_seq"', 2, true);


--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 211
-- Name: Comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Comment_id_seq"', 2, true);


--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 204
-- Name: Grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Grade_id_seq"', 3, true);


--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 213
-- Name: Notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Notification_id_seq"', 6, true);


--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 209
-- Name: Review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Review_id_seq"', 1, true);


--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 206
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."User_id_seq"', 6, true);


--
-- TOC entry 3921 (class 2606 OID 10824012)
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (id);


--
-- TOC entry 3907 (class 2606 OID 10823881)
-- Name: Assignment Assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Assignment"
    ADD CONSTRAINT "Assignment_pkey" PRIMARY KEY (id);


--
-- TOC entry 3905 (class 2606 OID 10823873)
-- Name: Class Class_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_pkey" PRIMARY KEY (id);


--
-- TOC entry 3917 (class 2606 OID 10823979)
-- Name: Comment Comment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY (id);


--
-- TOC entry 3909 (class 2606 OID 10823903)
-- Name: Grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY (id);


--
-- TOC entry 3919 (class 2606 OID 10823991)
-- Name: Notification Notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);


--
-- TOC entry 3915 (class 2606 OID 10823969)
-- Name: Review Review_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "Review_pkey" PRIMARY KEY (id);


--
-- TOC entry 3911 (class 2606 OID 10823939)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 3913 (class 2606 OID 10823950)
-- Name: UserinClass UserinClass_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserinClass"
    ADD CONSTRAINT "UserinClass_pkey" PRIMARY KEY ("UserId", "ClassId");


--
-- TOC entry 3922 (class 2606 OID 10825311)
-- Name: Grade Grade_AssignmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_AssignmentId_fkey" FOREIGN KEY ("AssignmentId") REFERENCES public."Assignment"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3923 (class 2606 OID 10825316)
-- Name: Grade Grade_ClassId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_ClassId_fkey" FOREIGN KEY ("ClassId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3925 (class 2606 OID 10823956)
-- Name: UserinClass UserinClass_ClassId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserinClass"
    ADD CONSTRAINT "UserinClass_ClassId_fkey" FOREIGN KEY ("ClassId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3924 (class 2606 OID 10823951)
-- Name: UserinClass UserinClass_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserinClass"
    ADD CONSTRAINT "UserinClass_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-01-18 21:48:34

--
-- PostgreSQL database dump complete
--

