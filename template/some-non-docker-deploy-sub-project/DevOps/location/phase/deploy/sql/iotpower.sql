--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.11
-- Dumped by pg_dump version 9.6.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;
SET timezone = 'Asia/Shanghai';

-- DROP DATABASE IF EXISTS iotpower;
--
-- Name: iotpower; Type: DATABASE; Schema: -; Owner: iotpower
--

-- CREATE DATABASE iotpower WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'zh_CN.UTF-8' LC_CTYPE = 'zh_CN.UTF-8';


-- ALTER DATABASE iotpower OWNER TO iotpower;

-- \connect iotpower

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;
SEt timezone = 'Asia/Shanghai';

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_token; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.auth_token (
    id bigint NOT NULL,
    value character varying NOT NULL,
    "user" bigint NOT NULL,
    expire timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_token OWNER TO iotpower;

--
-- Name: auth_token_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.auth_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_token_id_seq OWNER TO iotpower;

--
-- Name: auth_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.auth_token_id_seq OWNED BY public.auth_token.id;


--
-- Name: auth_user_group; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.auth_user_group (
    id bigint NOT NULL,
    name character varying NOT NULL,
    parent bigint
);


ALTER TABLE public.auth_user_group OWNER TO iotpower;

--
-- Name: auth_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.auth_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_group_id_seq OWNER TO iotpower;

--
-- Name: auth_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.auth_user_group_id_seq OWNED BY public.auth_user_group.id;


--
-- Name: auth_user_group_perms; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.auth_user_group_perms (
    id bigint NOT NULL,
    "group" bigint NOT NULL,
    permission character varying NOT NULL
);


ALTER TABLE public.auth_user_group_perms OWNER TO iotpower;

--
-- Name: auth_user_group_perms_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.auth_user_group_perms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_group_perms_id_seq OWNER TO iotpower;

--
-- Name: auth_user_group_perms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.auth_user_group_perms_id_seq OWNED BY public.auth_user_group_perms.id;


--
-- Name: auth_user_group_users; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.auth_user_group_users (
    id bigint NOT NULL,
    "group" bigint NOT NULL,
    "user" bigint NOT NULL
);


ALTER TABLE public.auth_user_group_users OWNER TO iotpower;

--
-- Name: auth_user_group_users_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.auth_user_group_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_group_users_id_seq OWNER TO iotpower;

--
-- Name: auth_user_group_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.auth_user_group_users_id_seq OWNED BY public.auth_user_group_users.id;


--
-- Name: user_impl; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.user_impl (
    id bigint NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.user_impl OWNER TO iotpower;

--
-- Name: user_impl_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.user_impl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_impl_id_seq OWNER TO iotpower;

--
-- Name: user_impl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.user_impl_id_seq OWNED BY public.user_impl.id;


--
-- Name: user_perm; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.user_perm (
    id bigint NOT NULL,
    "user" bigint NOT NULL,
    permission character varying NOT NULL
);


ALTER TABLE public.user_perm OWNER TO iotpower;

--
-- Name: user_perm_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.user_perm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_perm_id_seq OWNER TO iotpower;

--
-- Name: user_perm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.user_perm_id_seq OWNED BY public.user_perm.id;


--
-- Name: user_restore; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.user_restore (
    id bigint NOT NULL,
    value character varying NOT NULL,
    "user" bigint NOT NULL,
    expire timestamp with time zone NOT NULL
);


ALTER TABLE public.user_restore OWNER TO iotpower;

--
-- Name: user_restore_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.user_restore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_restore_id_seq OWNER TO iotpower;

--
-- Name: user_restore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.user_restore_id_seq OWNED BY public.user_restore.id;


--
-- Name: user_single_use_code; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.user_single_use_code (
    id bigint NOT NULL,
    value character varying NOT NULL,
    "user" bigint NOT NULL,
    expire timestamp with time zone,
    used timestamp with time zone
);


ALTER TABLE public.user_single_use_code OWNER TO iotpower;

--
-- Name: user_single_use_code_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.user_single_use_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_single_use_code_id_seq OWNER TO iotpower;

--
-- Name: user_single_use_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.user_single_use_code_id_seq OWNED BY public.user_single_use_code.id;


--
-- Name: auth_token id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_token ALTER COLUMN id SET DEFAULT nextval('public.auth_token_id_seq'::regclass);


--
-- Name: auth_user_group id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group ALTER COLUMN id SET DEFAULT nextval('public.auth_user_group_id_seq'::regclass);


--
-- Name: auth_user_group_perms id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group_perms ALTER COLUMN id SET DEFAULT nextval('public.auth_user_group_perms_id_seq'::regclass);


--
-- Name: auth_user_group_users id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group_users ALTER COLUMN id SET DEFAULT nextval('public.auth_user_group_users_id_seq'::regclass);


--
-- Name: user_impl id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_impl ALTER COLUMN id SET DEFAULT nextval('public.user_impl_id_seq'::regclass);


--
-- Name: user_perm id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_perm ALTER COLUMN id SET DEFAULT nextval('public.user_perm_id_seq'::regclass);


--
-- Name: user_restore id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_restore ALTER COLUMN id SET DEFAULT nextval('public.user_restore_id_seq'::regclass);


--
-- Name: user_single_use_code id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_single_use_code ALTER COLUMN id SET DEFAULT nextval('public.user_single_use_code_id_seq'::regclass);


--
-- Data for Name: auth_token; Type: TABLE DATA; Schema: public; Owner: iotpower
--

COPY public.auth_token (id, value, "user", expire) FROM stdin;
\.


--
-- Data for Name: auth_user_group; Type: TABLE DATA; Schema: public; Owner: iotpower
--

COPY public.auth_user_group (id, name, parent) FROM stdin;
\.

INSERT INTO public.auth_user_group VALUES (0, '系统管理', null);
INSERT INTO public.auth_user_group VALUES (1, '中洲供电所', null);
INSERT INTO public.auth_user_group VALUES (2, '梁村供电所', null);
INSERT INTO public.auth_user_group VALUES (3, '诗洞供电所', null);
INSERT INTO public.auth_user_group VALUES (4, 'deleted', null);
INSERT INTO public.auth_user_group VALUES (5, '其他', null);
INSERT INTO public.auth_user_group VALUES (6, '安全监察', null);

SELECT setval('public.auth_user_group_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.auth_user_group), 1), false);

--
-- Data for Name: user_impl; Type: TABLE DATA; Schema: public; Owner: iotpower
--

COPY public.user_impl (id, login, password, email) FROM stdin;
0	admin	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	admin@system
1	admin1	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	admin1@system
2	lcuser	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	一般用户@梁村
3	lcadmin	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	管理员@梁村
4	13929829728	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	罗贰明@梁村
5	13609657208	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李天铎@梁村
6	13929829503	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	磨向东@梁村
7	13929822774	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	钱素玲@梁村
8	13556562818	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李国定@梁村
9	13556561662	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	黄达开@梁村
10	13059355182	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	覃颖兴@梁村
11	13922634068	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	余水育@梁村
12	13556563311	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	严文广@梁村
13	18998599807	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	姚精香@梁村
14	13536999901	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	孔棣屏@梁村
15	13536956588	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	陈汝标@梁村
16	13527032918	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李棣辉@梁村
17	15975281913	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	梁盛优@梁村
18	13536971143	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	莫演生@梁村
19	13556564991	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	陈水养@梁村
20	15016388995	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	黄华生@梁村
21	13560901680	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	阮如善@梁村
22	13432419485	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	谭雄伟@梁村
23	13556505889	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	莫有镜@梁村
24	13426938378	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	莫墩@梁村
25	13929822613	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	郭东生@梁村
26	13929837965	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李振文@梁村
27	13556562242	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李天文@梁村
28	13542982989	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李树攀@梁村
29	13556505027	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李国武@梁村
30	13929826366	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	黎华波@梁村
31	13536971168	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	莫勇明@梁村
32	13527070107	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	何英云@梁村
33	13527083139	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	潘和开@梁村
34	13822650395	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李伯球@梁村
35	13536997512	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李新芳@梁村
36	13509974348	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	梁德贤@梁村
37	13660902610	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李定征@梁村
38	13536997397	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	谢汝科@梁村
39	13542980888	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	梁杰明@梁村
40	15875839409	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	高殿梅@梁村
41	13727226378	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	黄周文@梁村
42	18575832277	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李京生@梁村
43	15089678988	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	何以祥@梁村
44	13542947660	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	张对彪@梁村
45	13189387003	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	李为创@梁村
46	13556563868	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	陈港文@梁村
47	18718832508	sha256|17|7Lk6hkKV5moLWCkL4DW/Qw==|Zx6SK+Lrr8v8wDHEDbGqqP+4CR3nKSM/beNh/+QqbzU=	钟志驹@梁村
\.

SELECT setval('public.user_impl_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.user_impl), 1), false);

--
-- Data for Name: auth_user_group_perms; Type: TABLE DATA; Schema: public; Owner: iotpower
--

COPY public.auth_user_group_perms (id, "group", permission) FROM stdin;
\.

insert into public.auth_user_group_perms values(1,2,'ptm-normal');
SELECT setval('public.auth_user_group_perms_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.auth_user_group_perms), 1), false);

--
-- Data for Name: auth_user_group_users; Type: TABLE DATA; Schema: public; Owner: iotpower
--

COPY public.auth_user_group_users (id, "group", "user") FROM stdin;
\.

insert into public.auth_user_group_users values(1,2,2);
insert into public.auth_user_group_users values(2,2,3);
insert into public.auth_user_group_users values(3,2,25);
insert into public.auth_user_group_users values(4,2,26);
insert into public.auth_user_group_users values(5,2,27);
insert into public.auth_user_group_users values(6,2,28);
insert into public.auth_user_group_users values(7,2,29);
insert into public.auth_user_group_users values(8,2,30);
insert into public.auth_user_group_users values(9,2,31);
insert into public.auth_user_group_users values(10,2,32);
insert into public.auth_user_group_users values(11,2,33);
insert into public.auth_user_group_users values(12,2,34);
insert into public.auth_user_group_users values(13,2,35);
insert into public.auth_user_group_users values(14,2,36);
insert into public.auth_user_group_users values(15,2,37);
insert into public.auth_user_group_users values(16,2,38);
insert into public.auth_user_group_users values(17,2,39);
insert into public.auth_user_group_users values(18,2,40);
insert into public.auth_user_group_users values(19,2,41);
insert into public.auth_user_group_users values(20,2,42);
insert into public.auth_user_group_users values(21,2,43);
insert into public.auth_user_group_users values(22,2,44);
insert into public.auth_user_group_users values(23,2,45);
insert into public.auth_user_group_users values(24,2,46);
insert into public.auth_user_group_users values(25,2,47);

SELECT setval('public.auth_user_group_users_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.auth_user_group_users), 1), false);

--
-- Data for Name: user_perm; Type: TABLE DATA; Schema: public; Owner: iotpower
--

COPY public.user_perm (id, "user", permission) FROM stdin;
\.

insert into public.user_perm values(1,0,'admin');
insert into public.user_perm values(2,3,'ptm-admin');

SELECT setval('public.user_perm_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.user_perm), 1), false);

--
-- Data for Name: user_restore; Type: TABLE DATA; Schema: public; Owner: iotpower
--

COPY public.user_restore (id, value, "user", expire) FROM stdin;
\.


--
-- Data for Name: user_single_use_code; Type: TABLE DATA; Schema: public; Owner: iotpower
--

COPY public.user_single_use_code (id, value, "user", expire, used) FROM stdin;
\.


--
-- Name: auth_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iotpower
--

-- SELECT pg_catalog.setval('public.auth_token_id_seq', 7, true);


--
-- Name: auth_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iotpower
--

-- SELECT pg_catalog.setval('public.auth_user_group_id_seq', 1, false);


--
-- Name: auth_user_group_perms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iotpower
--

-- SELECT pg_catalog.setval('public.auth_user_group_perms_id_seq', 1, false);


--
-- Name: auth_user_group_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iotpower
--

-- SELECT pg_catalog.setval('public.auth_user_group_users_id_seq', 1, false);


--
-- Name: user_impl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iotpower
--

-- SELECT pg_catalog.setval('public.user_impl_id_seq', 1, true);


--
-- Name: user_perm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iotpower
--

-- SELECT pg_catalog.setval('public.user_perm_id_seq', 1, true);


--
-- Name: user_restore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iotpower
--

-- SELECT pg_catalog.setval('public.user_restore_id_seq', 1, false);


--
-- Name: user_single_use_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iotpower
--

-- SELECT pg_catalog.setval('public.user_single_use_code_id_seq', 1, false);


--
-- Name: auth_token auth_token_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_token
    ADD CONSTRAINT auth_token_pkey PRIMARY KEY (id);


--
-- Name: auth_user_group_perms auth_user_group_perms_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group_perms
    ADD CONSTRAINT auth_user_group_perms_pkey PRIMARY KEY (id);


--
-- Name: auth_user_group auth_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group
    ADD CONSTRAINT auth_user_group_pkey PRIMARY KEY (id);


--
-- Name: auth_user_group_users auth_user_group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group_users
    ADD CONSTRAINT auth_user_group_users_pkey PRIMARY KEY (id);


--
-- Name: user_impl unique_login; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_impl
    ADD CONSTRAINT unique_login UNIQUE (login);


--
-- Name: user_impl user_impl_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_impl
    ADD CONSTRAINT user_impl_pkey PRIMARY KEY (id);


--
-- Name: user_perm user_perm_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_perm
    ADD CONSTRAINT user_perm_pkey PRIMARY KEY (id);


--
-- Name: user_restore user_restore_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_restore
    ADD CONSTRAINT user_restore_pkey PRIMARY KEY (id);


--
-- Name: user_single_use_code user_single_use_code_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_single_use_code
    ADD CONSTRAINT user_single_use_code_pkey PRIMARY KEY (id);


--
-- Name: auth_token auth_token_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_token
    ADD CONSTRAINT auth_token_user_fkey FOREIGN KEY ("user") REFERENCES public.user_impl(id);


--
-- Name: auth_user_group auth_user_group_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group
    ADD CONSTRAINT auth_user_group_parent_fkey FOREIGN KEY (parent) REFERENCES public.auth_user_group(id);


--
-- Name: auth_user_group_perms auth_user_group_perms_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group_perms
    ADD CONSTRAINT auth_user_group_perms_group_fkey FOREIGN KEY ("group") REFERENCES public.auth_user_group(id);


--
-- Name: auth_user_group_users auth_user_group_users_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group_users
    ADD CONSTRAINT auth_user_group_users_group_fkey FOREIGN KEY ("group") REFERENCES public.auth_user_group(id);


--
-- Name: auth_user_group_users auth_user_group_users_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.auth_user_group_users
    ADD CONSTRAINT auth_user_group_users_user_fkey FOREIGN KEY ("user") REFERENCES public.user_impl(id);


--
-- Name: user_perm user_perm_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_perm
    ADD CONSTRAINT user_perm_user_fkey FOREIGN KEY ("user") REFERENCES public.user_impl(id);


--
-- Name: user_restore user_restore_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_restore
    ADD CONSTRAINT user_restore_user_fkey FOREIGN KEY ("user") REFERENCES public.user_impl(id);


--
-- Name: user_single_use_code user_single_use_code_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.user_single_use_code
    ADD CONSTRAINT user_single_use_code_user_fkey FOREIGN KEY ("user") REFERENCES public.user_impl(id);


--
-- Name: enter_room; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.enter_room (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    room_id bigint NOT NULL,
    user_id bigint NOT NULL,
    task_id bigint NOT NULL,
    enter_time timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.enter_room OWNER TO iotpower;

--
-- Name: enter_room_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.enter_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enter_room_id_seq OWNER TO iotpower;

--
-- Name: enter_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.enter_room_id_seq OWNED BY public.enter_room.id;


--
-- Name: operate_tool; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.operate_tool (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    team_id bigint NOT NULL,
    user_id bigint NOT NULL,
    task_id bigint NOT NULL,
    tool_id bigint NOT NULL,
    operation_type character varying NOT NULL,
    operation_time timestamp with time zone DEFAULT now() NOT NULL,
    condition_upon_operation character varying NOT NULL,
    operation_result character varying NOT NULL
);


ALTER TABLE public.operate_tool OWNER TO iotpower;

--
-- Name: operate_tool_history; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.operate_tool_history (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    team_id bigint NOT NULL,
    user_id bigint NOT NULL,
    task_id bigint NOT NULL,
    tool_id bigint NOT NULL,
    operation_type character varying NOT NULL,
    operation_time timestamp with time zone DEFAULT now() NOT NULL,
    condition_upon_operation character varying NOT NULL,
    operation_result character varying NOT NULL
);


ALTER TABLE public.operate_tool_history OWNER TO iotpower;

--
-- Name: operate_tool_history_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.operate_tool_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operate_tool_history_id_seq OWNER TO iotpower;

--
-- Name: operate_tool_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.operate_tool_history_id_seq OWNED BY public.operate_tool_history.id;


--
-- Name: operate_tool_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.operate_tool_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operate_tool_id_seq OWNER TO iotpower;

--
-- Name: operate_tool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.operate_tool_id_seq OWNED BY public.operate_tool.id;


--
-- Name: service; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.service (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    mac_address character varying NOT NULL,
    port bigint NOT NULL,
    name character varying NOT NULL,
    status character varying NOT NULL,
    description character varying
);


ALTER TABLE public.service OWNER TO iotpower;

--
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_id_seq OWNER TO iotpower;

--
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.service_id_seq OWNED BY public.service.id;


--
-- Name: station; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.station (
    id bigint NOT NULL,
    name character varying NOT NULL,
    remarks character varying
);


ALTER TABLE public.station OWNER TO iotpower;

--
-- Name: station_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.station_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.station_id_seq OWNER TO iotpower;

--
-- Name: station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.station_id_seq OWNED BY public.station.id;


--
-- Name: store_room; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.store_room (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    name character varying NOT NULL,
    status character varying NOT NULL,
    description character varying
);


ALTER TABLE public.store_room OWNER TO iotpower;

--
-- Name: store_room_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.store_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_room_id_seq OWNER TO iotpower;

--
-- Name: store_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.store_room_id_seq OWNED BY public.store_room.id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    team_id bigint NOT NULL,
    user_id bigint NOT NULL,
    type_id bigint NOT NULL,
    ticket_num character varying NOT NULL,
    status character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.task OWNER TO iotpower;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO iotpower;

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.teams (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO iotpower;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO iotpower;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: tool; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.tool (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    "position" character varying NOT NULL,
    board_num character varying NOT NULL,
    port_num character varying NOT NULL,
    class_id bigint NOT NULL,
    name character varying NOT NULL,
    model character varying NOT NULL,
    number character varying NOT NULL,
    subject character varying NOT NULL,
    manufacture_time timestamp with time zone DEFAULT now() NOT NULL,
    purchase_time timestamp with time zone DEFAULT now() NOT NULL,
    test_cycle bigint NOT NULL,
    life_cycle bigint NOT NULL,
    vendor character varying NOT NULL
);


ALTER TABLE public.tool OWNER TO iotpower;

--
-- Name: tool_class; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.tool_class (
    id bigint NOT NULL,
    name character varying NOT NULL,
    remarks character varying
);


ALTER TABLE public.tool_class OWNER TO iotpower;

--
-- Name: tool_class_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.tool_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_class_id_seq OWNER TO iotpower;

--
-- Name: tool_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.tool_class_id_seq OWNED BY public.tool_class.id;


--
-- Name: tool_defect; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.tool_defect (
    id bigint NOT NULL,
    tool_class_id bigint NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE public.tool_defect OWNER TO iotpower;

--
-- Name: tool_defect_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.tool_defect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_defect_id_seq OWNER TO iotpower;

--
-- Name: tool_defect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.tool_defect_id_seq OWNED BY public.tool_defect.id;


--
-- Name: tool_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.tool_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_id_seq OWNER TO iotpower;

--
-- Name: tool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.tool_id_seq OWNED BY public.tool.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    station_id bigint NOT NULL,
    team_id bigint NOT NULL,
    display_name character varying NOT NULL,
    team_name character varying NOT NULL,
    wechat_id character varying,
    username character varying NOT NULL,
    password character varying NOT NULL,
    email character varying,
    remarks character varying
);


ALTER TABLE public."user" OWNER TO iotpower;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO iotpower;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: work_type; Type: TABLE; Schema: public; Owner: iotpower
--

CREATE TABLE public.work_type (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE public.work_type OWNER TO iotpower;

--
-- Name: work_type_id_seq; Type: SEQUENCE; Schema: public; Owner: iotpower
--

CREATE SEQUENCE public.work_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_type_id_seq OWNER TO iotpower;

--
-- Name: work_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iotpower
--

ALTER SEQUENCE public.work_type_id_seq OWNED BY public.work_type.id;


--
-- Name: enter_room id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.enter_room ALTER COLUMN id SET DEFAULT nextval('public.enter_room_id_seq'::regclass);


--
-- Name: operate_tool id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool ALTER COLUMN id SET DEFAULT nextval('public.operate_tool_id_seq'::regclass);


--
-- Name: operate_tool_history id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool_history ALTER COLUMN id SET DEFAULT nextval('public.operate_tool_history_id_seq'::regclass);


--
-- Name: service id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.service ALTER COLUMN id SET DEFAULT nextval('public.service_id_seq'::regclass);


--
-- Name: station id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.station ALTER COLUMN id SET DEFAULT nextval('public.station_id_seq'::regclass);


--
-- Name: store_room id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.store_room ALTER COLUMN id SET DEFAULT nextval('public.store_room_id_seq'::regclass);


--
-- Name: task id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: tool id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool ALTER COLUMN id SET DEFAULT nextval('public.tool_id_seq'::regclass);


--
-- Name: tool_class id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool_class ALTER COLUMN id SET DEFAULT nextval('public.tool_class_id_seq'::regclass);


--
-- Name: tool_defect id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool_defect ALTER COLUMN id SET DEFAULT nextval('public.tool_defect_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: work_type id; Type: DEFAULT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.work_type ALTER COLUMN id SET DEFAULT nextval('public.work_type_id_seq'::regclass);


--
-- Name: enter_room enter_room_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.enter_room
    ADD CONSTRAINT enter_room_pkey PRIMARY KEY (id);


--
-- Name: operate_tool_history operate_tool_history_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool_history
    ADD CONSTRAINT operate_tool_history_pkey PRIMARY KEY (id);


--
-- Name: operate_tool operate_tool_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool
    ADD CONSTRAINT operate_tool_pkey PRIMARY KEY (id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: station station_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (id);


--
-- Name: store_room store_room_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.store_room
    ADD CONSTRAINT store_room_pkey PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: tool_class tool_class_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool_class
    ADD CONSTRAINT tool_class_pkey PRIMARY KEY (id);


--
-- Name: tool_defect tool_defect_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool_defect
    ADD CONSTRAINT tool_defect_pkey PRIMARY KEY (id);


--
-- Name: tool tool_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool
    ADD CONSTRAINT tool_pkey PRIMARY KEY (id);


--
-- Name: service unique_deployed_service; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT unique_deployed_service UNIQUE (station_id, name);


--
-- Name: service unique_service; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT unique_service UNIQUE (mac_address, port);


--
-- Name: station unique_station; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT unique_station UNIQUE (name);


--
-- Name: store_room unique_store_room; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.store_room
    ADD CONSTRAINT unique_store_room UNIQUE (station_id, name);


--
-- Name: task unique_task; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT unique_task UNIQUE (ticket_num);


--
-- Name: teams unique_team; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT unique_team UNIQUE (station_id, name);


--
-- Name: tool unique_tool; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool
    ADD CONSTRAINT unique_tool UNIQUE (station_id, "position");

--
-- Name: tool unique_tool_board_port; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool
    ADD CONSTRAINT unique_tool_board_port UNIQUE (station_id, board_num, port_num);


--
-- Name: tool_class unique_tool_class_name; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool_class
    ADD CONSTRAINT unique_tool_class_name UNIQUE (name);


--
-- Name: work_type unique_work_type; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.work_type
    ADD CONSTRAINT unique_work_type UNIQUE (name);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: work_type work_type_pkey; Type: CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.work_type
    ADD CONSTRAINT work_type_pkey PRIMARY KEY (id);


--
-- Name: enter_room enter_room_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.enter_room
    ADD CONSTRAINT enter_room_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.store_room(id);


--
-- Name: enter_room enter_room_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.enter_room
    ADD CONSTRAINT enter_room_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.auth_user_group(id);


--
-- Name: enter_room enter_room_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.enter_room
    ADD CONSTRAINT enter_room_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: enter_room enter_room_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.enter_room
    ADD CONSTRAINT enter_room_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_impl(id);


--
-- Name: operate_tool_history operate_tool_history_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool_history
    ADD CONSTRAINT operate_tool_history_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.auth_user_group(id);


--
-- Name: operate_tool_history operate_tool_history_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool_history
    ADD CONSTRAINT operate_tool_history_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: operate_tool_history operate_tool_history_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool_history
    ADD CONSTRAINT operate_tool_history_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.auth_user_group(id);


--
-- Name: operate_tool_history operate_tool_history_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool_history
    ADD CONSTRAINT operate_tool_history_tool_id_fkey FOREIGN KEY (tool_id) REFERENCES public.tool(id);


--
-- Name: operate_tool_history operate_tool_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool_history
    ADD CONSTRAINT operate_tool_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_impl(id);


--
-- Name: operate_tool operate_tool_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool
    ADD CONSTRAINT operate_tool_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.auth_user_group(id);


--
-- Name: operate_tool operate_tool_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool
    ADD CONSTRAINT operate_tool_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: operate_tool operate_tool_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool
    ADD CONSTRAINT operate_tool_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.auth_user_group(id);


--
-- Name: operate_tool operate_tool_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool
    ADD CONSTRAINT operate_tool_tool_id_fkey FOREIGN KEY (tool_id) REFERENCES public.tool(id);


--
-- Name: operate_tool operate_tool_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.operate_tool
    ADD CONSTRAINT operate_tool_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_impl(id);


--
-- Name: service service_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.auth_user_group(id);


--
-- Name: store_room store_room_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.store_room
    ADD CONSTRAINT store_room_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.auth_user_group(id);


--
-- Name: task task_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.auth_user_group(id);


--
-- Name: task task_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.auth_user_group(id);


--
-- Name: task task_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.work_type(id);


--
-- Name: task task_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_impl(id);


--
-- Name: teams teams_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.auth_user_group(id);


--
-- Name: tool tool_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool
    ADD CONSTRAINT tool_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.tool_class(id);


--
-- Name: tool_defect tool_defect_tool_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool_defect
    ADD CONSTRAINT tool_defect_tool_class_id_fkey FOREIGN KEY (tool_class_id) REFERENCES public.tool_class(id);


--
-- Name: tool tool_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public.tool
    ADD CONSTRAINT tool_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.auth_user_group(id);


--
-- Name: user user_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.auth_user_group(id);


--
-- Name: user user_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: iotpower
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.auth_user_group(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: chenjinfen
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


-- work_type data
INSERT INTO public.work_type VALUES (0, 'SystemAdmin', '系统管理任务');
INSERT INTO public.work_type VALUES (1, 'PlanWork', '计划工作');
INSERT INTO public.work_type VALUES (2, 'WorkingTask', '已建任务');
INSERT INTO public.work_type VALUES (3, 'PlanOperation', '计划操作');
INSERT INTO public.work_type VALUES (4, 'Emergency', '故障抢修');
INSERT INTO public.work_type VALUES (5, 'OutTest', '外送试验');
INSERT INTO public.work_type VALUES (6, 'RoutineCheck', '定期检查');
SELECT setval('public.work_type_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.work_type), 1), false);

-- task data - for test only, remember to remove before rolling out to production
INSERT INTO public.task VALUES (0, 0, 0, 0, 0, 'SystemAdmin', 'AlwaysOn');
SELECT setval('public.task_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.task), 1), false);

--
-- trigger to init the operate_tool_history for each tool inserted
--
CREATE OR REPLACE FUNCTION public.init_operate_tool_history_for_new_tool()
RETURNS trigger AS
$BODY$
BEGIN
  INSERT INTO public.operate_tool_history(station_id,team_id,user_id,task_id,tool_id,operation_type,operation_time,condition_upon_operation,operation_result) values(NEW.station_id,NEW.station_id,0,0,NEW.id,'InStore',now(),'完好','完成');
  RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER init_operate_tool_history_trigger
AFTER INSERT
ON public.tool
FOR EACH ROW
EXECUTE PROCEDURE public.init_operate_tool_history_for_new_tool();

CREATE OR REPLACE FUNCTION public.upsert_operate_tool_for_tool()
RETURNS trigger AS
$BODY$
BEGIN
if NEW.operation_type = 'InStore' then
  INSERT INTO public.operate_tool(station_id,team_id,user_id,task_id,tool_id,operation_type,operation_time,condition_upon_operation,operation_result) values(NEW.station_id,NEW.team_id,NEW.user_id,NEW.task_id,NEW.tool_id,NEW.operation_type,NEW.operation_time,NEW.condition_upon_operation,NEW.operation_result);
else
  UPDATE public.operate_tool set team_id=NEW.team_id, user_id=NEW.user_id, task_id=NEW.task_id, operation_type=NEW.operation_type, operation_time=NEW.operation_time, condition_upon_operation=NEW.condition_upon_operation, operation_result=NEW.operation_result where station_id=NEW.station_id and tool_id=NEW.tool_id;
end if;
RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER upsert_operate_tool_trigger
  AFTER INSERT
  ON public.operate_tool_history
  FOR EACH ROW
  EXECUTE PROCEDURE public.upsert_operate_tool_for_tool();

-- initialize data

-- station data
INSERT INTO public.station VALUES (0, '系统管理', null);
INSERT INTO public.station VALUES (1, '中洲供电所', null);
INSERT INTO public.station VALUES (2, '梁村供电所', null);
INSERT INTO public.station VALUES (3, '诗洞供电所', null);
INSERT INTO public.station VALUES (4, 'deleted', null);
INSERT INTO public.station VALUES (5, '其他', null);
INSERT INTO public.station VALUES (6, '安全监察', null);
SELECT setval('public.station_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.station), 1), false);

-- teams data
INSERT INTO public.teams VALUES (0, 0, '系统管理');
INSERT INTO public.teams VALUES (1, 1, '中洲供电所');
INSERT INTO public.teams VALUES (2, 2, '梁村供电所');
INSERT INTO public.teams VALUES (3, 3, '诗洞供电所');
INSERT INTO public.teams VALUES (4, 4, 'deleted');
INSERT INTO public.teams VALUES (5, 5, '其他');
INSERT INTO public.teams VALUES (6, 6, '安全监察');
SELECT setval('public.teams_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.teams), 1), false);

-- user data
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (5, 5, '罗贰明', '其他', '13929829728', '9728', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '李天铎', '副所长', '13609657208', '7208', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '磨向东', '副所长', '13929829503', '9503', 'a8422165dfe6f75f31ebef31eb480596');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '钱素玲', '综合', '13929822774', '2774', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '李国定', '运行', '13556562818', '2818', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '黄达开', '副班长', '13556561662', '1662', 'b2531e7bb29bf22e1daae486fae3417a');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '覃颖兴', '运行班班员', '13059355182', '5182', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '余水育', '副班长', '13922634068', '4068', 'e8344811493fb439b086125ef9824962');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '严文广', '营业', '13556563311', '3311', '68053af2923e00204c3ca7c6a3150cf7');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '姚精香', '运行班班员', '18998599807', '9807', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '孔棣屏', '安全', '13536999901', '9901', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '陈汝标', '运行班班员', '13536956588', '6588', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '李棣辉', '班长', '13527032918', '2918', 'f6c9dc70ecfd8f90ba8598aa2401cd1a');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '梁盛优', '营业厅', '15975281913', '1913', 'c44799b04a1c72e3c8593a53e8000c78');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '莫演生', '抄表', '13536971143', '1143', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '陈水养', '抄表', '13556564991', '4991', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '黄华生', '计件', '15016388995', '8995', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '阮如善', '抄表', '13560901680', '1680', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '谭雄伟', '运行班班员', '13432419485', '9485', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '莫有镜', '班长', '13556505889', '5889', 'a3bf6e4db673b6449c2f7d13ee6ec9c0');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '莫墩', '#', '13426938378', '8378', '25f9e794323b453885f5181f1b624d0b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '郭东生', '梁村供电所', '#', '13929822613', 'a88852296c336dca7360a76e1d35175f');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '李振文', '梁村供电所', '#', '13929837965', 'b33489f4702d9530e8652194551922a8');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '李天文', '梁村供电所', '#', '13556562242', 'c59dc391e8d60d24105ff04d05152e9c');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '李树攀', '梁村供电所', '#', '13542982989', '71f55003c9a36b40c4a094908f11fb77');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '李国武', '梁村供电所', '#', '13556505027', '8d35c99d35eee54bf0eeaf053b6bf2df');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '黎华波', '梁村供电所', '#', '13929826366', '5b85134db05dcc9abbdf7fba8015e8f3');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '莫勇明', '梁村供电所', '#', '13536971168', '51024d4a01b2ccd4deec92b4fa1adbb8');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '何英云', '梁村供电所', '#', '13527070107', '77e03b5ee9b1840a550e035c8e3f0134');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '潘和开', '梁村供电所', '#', '13527083139', '55abdca9cffff7a323432a86e69faf04');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '李伯球', '梁村供电所', '#', '13822650395', '831f101aa05afbeedc12f5d415d64fd0');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '李新芳', '梁村供电所', '#', '13536997512', 'bdbc4f1016dd4d3ed0f7fb74d9cc8c20');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '梁德贤', '梁村供电所', '#', '13509974348', 'ceaf5bb722e8b438919c62ed9541b62b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '李定征', '梁村供电所', '#', '13660902610', 'cf62ccfab80c23d26ad6563d05525519');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '谢汝科', '梁村供电所', '#', '13536997397', 'c4b58542339497f62d50a72cb77517b2');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '梁杰明', '梁村供电所', '#', '13542980888', 'edefda8160a8021df0ab3d950728060f');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '高殿梅', '梁村供电所', '#', '15875839409', '7c7983eb098abc56418455336252c9f2');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '黄周文', '梁村供电所', '#', '13727226378', '1d0a732ab652a00edde070a4125b9202');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '李京生', '梁村供电所', '#', '18575832277', '5080b534889195ebdeb3a7aaa8187bbc');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '何以祥', '梁村供电所', '#', '15089678988', '661600272c99deee0af6ba70f03472a0');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '张对彪', '梁村供电所', '#', '13542947660', 'c74b61cdec6bb0a31dae6e34859c9838');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '李为创', '梁村供电所', '#', '13189387003', '6f95fb5868092aeebc6331ac1bdee85d');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '陈港文', '梁村供电所', '#', '13556563868', '60f5de2bfcecb8c1976e64ee41910164');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '翁民杰', '运维', '#', '95598', 'e7ab4900eedf6ca77aedd5bf1c978f5f');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '8525', '管理员', '#', '8525', '4f52c16c93e61c9e1c25f529932b0071');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (2, 2, '钟志驹', '梁村供电所', '#', '18718832508', '0aba0779edb67147eff3a047cdf2471e');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (6, 6, '张健雄', '安监', '#', '2200', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (6, 6, '罗立志', '安监', '#', '1834', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (1, 1, '测试1', '中洲', '#', '7088', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '苏振彬', '所长', '#', 'suzhenbin', 'd07642024590a2d4946f5760afe3deb4');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '周华元', '所长', '#', 'zhouhuayuan', '04c5a7b84274ee01aae4972dcb471965');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '莫五娇', '综合业务员', '#', 'mowujiao', '2a1c2d6a518aca6ac55ca66b74f121f0');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '植中全', '运维', '#', 'zhizhongquan', 'b937232e6db71e47acde8a93deebe304');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '植树忠', '运维', '#', 'zhishuzhong', '008c56d5f6c8a1b5dbe0aee2b506d185');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '梁树登', '配网管理员', '#', 'liangshudeng', 'f3550b43e5660c9fe0c05b968862fa9b');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '范强', '基建管理员', '#', 'fanqiang', '33432e31ea9221137c5939101e2157b8');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '苏雄', '营销业务员', '#', 'suxiong', '221ec8e4332636e9ae863950ea21232f');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '黄支凤', '运维', '#', 'huangzhifeng', '75cb2ec79aa689743dd7f246cac54bad');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '张日杰', '运维', '#', 'zhangrijie', '65a68b4330eeef8db374e76657b795fd');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '梁高元', '运维', '#', 'lianggaoyuan', 'ae47f0f8bbf2b2fa9ab8cb78bd0275ed');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '植胜', '营配', '#', 'zhisheng', '54f681153c0cdad6224312508205d5f6');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '植秀富', '营配', '#', 'zhixiufu', 'e7b4b737573e83f6155e8cc58d38bfd6');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '陈维全', '营配', '#', 'chenweiquan', 'fa5e2f4f8d59f450169b8dc2fd75e10c');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '莫移', '营配', '#', 'moyi', '11e8f0fd3325a4f5945879eacc9990fc');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '植育怀', '营配', '#', 'zhiyuhuai', '7ac50823ed4232ffe2ab0a8acf496743');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '黄长新', '营配', '#', 'huangchangxin', 'cf656d2c9c1d81572b2d192333d5b046');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '周丽芳', '营配', '#', 'zhoulifang', '75e24a0d87193888f9164dc6b26f82e8');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '孔令华', '营配', '#', 'konglinghua', '0c823a985bfb8a6c09af1e25e4e49026');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '植中棣', '营配', '#', 'zhizhongdi', '58fa16465a421eec95dbbe613aa31f56');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '孔维明', '营配', '#', 'kongweiming', '83fa1eb4659d17ca0f1b6c79ef84de88');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '植贤仕', '营配', '#', 'zhixianshi', 'd947e1356d9a982380a3fe5b9fb408ef');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '冯淑彬', '营配', '#', 'fengshubin', '86a94a6da8bfc399dff25c2da18bb84a');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '孔繁坚', '营配', '#', 'kongfanjian', 'b0d796e938c618a01fcb8b736351c220');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '罗少英', '营配', '#', 'luoshaoying', '1a8061d2cd2f975bb53be798cb2048f0');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '梁雪美', '营配', '#', 'liangxuemei', '7b9dd476e83e25a2ab9d72bb94a278e3');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '徐嗣卓', '运维', '#', 'xusizhuo', 'd477f56d1b8fe24a1786e7249006e6a8');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '欧志钊', '运维', '#', 'ouzhizhao', '79018673dd70eef8b34572632ff3e994');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '周俊升', '运维', '#', 'zhoujunsheng', '4482d02853bd3b34aee72bbf480779a3');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '梁柏林', '运维', '#', 'Liangbailin', '85341392114b03cd69574ba505078ea5');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '温朝阳', '营配', '#', 'wenchaoyang', '694fed5a51216c3cad36eea9afb73436');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '周妹兰', '营配', '#', 'zhoumeilan', 'e08e39090729946f737967f5ec4d4c63');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '陈金梅', '营配', '#', 'chenjinmei', 'dc6918bc99931ac9e8b52ff7eb53beda');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '周烨怡', '营配', '#', 'zhouyeyi', '413bcb96c3674a548473e2b8ea1a2b9e');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '冼泳燕', '营配', '#', 'xianyongyan', '1fc9ba99a40fe83f82f64576568b9ec6');
INSERT INTO public."user"(station_id, team_id, display_name, team_name, wechat_id, username, password) VALUES (3, 3, '黄英云', '营配', '#', 'huangyingyun', 'cb785ba223b69ce5434dec3ea62a57c3');
SELECT setval('public.user_id_seq', COALESCE((SELECT MAX(id)+1 FROM public."user"), 1), false);

-- tool class data
INSERT INTO public.tool_class VALUES (1, '安全帽', '');
INSERT INTO public.tool_class VALUES (2, '绝缘手套', '');
INSERT INTO public.tool_class VALUES (3, '安全带', null);
INSERT INTO public.tool_class VALUES (4, '接地线', null);
INSERT INTO public.tool_class VALUES (5, '验电器', null);
INSERT INTO public.tool_class VALUES (6, '绝缘棒', null);
INSERT INTO public.tool_class VALUES (7, '绝缘鞋', null);
INSERT INTO public.tool_class VALUES (8, '脚扣', null);
INSERT INTO public.tool_class VALUES (9, '呼吸器', null);
INSERT INTO public.tool_class VALUES (10, '绝缘档板', null);
INSERT INTO public.tool_class VALUES (11, '标示牌', null);
INSERT INTO public.tool_class VALUES (12, '升降板', null);
INSERT INTO public.tool_class VALUES (13, '防护眼镜', null);
INSERT INTO public.tool_class VALUES (14, '安全绳', null);
INSERT INTO public.tool_class VALUES (15, '竹梯', null);
INSERT INTO public.tool_class VALUES (16, '绝缘梯', null);
INSERT INTO public.tool_class VALUES (17, '防电弧服', null);
INSERT INTO public.tool_class VALUES (18, '绝缘绳', null);
INSERT INTO public.tool_class VALUES (19, '绝缘垫', null);
INSERT INTO public.tool_class VALUES (20, '防毒面具', null);
INSERT INTO public.tool_class VALUES (21, '绝缘台', null);
INSERT INTO public.tool_class VALUES (22, '其他', null);
SELECT setval('public.tool_class_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.tool_class), 1), false);

-- tool defect data
INSERT INTO public.tool_defect VALUES (1, 1, 'A1外壳破损', null);
INSERT INTO public.tool_defect VALUES (2, 1, 'A2内衬损坏', null);
INSERT INTO public.tool_defect VALUES (3, 1, 'A3帽带损坏或断裂', null);
INSERT INTO public.tool_defect VALUES (4, 1, 'A4内衬无缓冲作用', null);
INSERT INTO public.tool_defect VALUES (5, 1, 'A5安全帽标志不符合规定', null);
INSERT INTO public.tool_defect VALUES (6, 1, 'A6摆放混乱', null);
INSERT INTO public.tool_defect VALUES (7, 1, 'A7其它', null);
INSERT INTO public.tool_defect VALUES (8, 2, 'B1外表破损、漏气，内部粘连', null);
INSERT INTO public.tool_defect VALUES (9, 2, 'B2外表脏污，有油脂', null);
INSERT INTO public.tool_defect VALUES (10, 2, 'B3超期未试验', null);
INSERT INTO public.tool_defect VALUES (11, 2, 'B4无试验标签', null);
INSERT INTO public.tool_defect VALUES (12, 2, 'B5摆放时堆压或放置在潮湿的地方', null);
INSERT INTO public.tool_defect VALUES (13, 2, 'B6不合格手套与日常使用的混放', null);
INSERT INTO public.tool_defect VALUES (14, 2, 'B7未按规定使用', null);
INSERT INTO public.tool_defect VALUES (15, 2, 'B8其它', null);
INSERT INTO public.tool_defect VALUES (16, 3, 'C1安全带变质、破损', null);
INSERT INTO public.tool_defect VALUES (17, 3, 'C2金属配件断裂或锈蚀', null);
INSERT INTO public.tool_defect VALUES (18, 3, 'C3超期未试验', null);
INSERT INTO public.tool_defect VALUES (19, 3, 'C4无试验标签', null);
INSERT INTO public.tool_defect VALUES (20, 3, 'C5超过使用周期', null);
INSERT INTO public.tool_defect VALUES (21, 3, 'C6放置处易接触高温、明火、酸类物质、有锐角的坚硬物体或化学药品', null);
INSERT INTO public.tool_defect VALUES (22, 3, 'C7其它', null);
INSERT INTO public.tool_defect VALUES (23, 4, 'D1夹头与铜线连接不牢固', null);
INSERT INTO public.tool_defect VALUES (24, 4, 'D2外皮破损，铜线外露或断股', null);
INSERT INTO public.tool_defect VALUES (25, 4, 'D3夹口部分锈蚀或损坏', null);
INSERT INTO public.tool_defect VALUES (26, 4, 'D4接地线无编号', null);
INSERT INTO public.tool_defect VALUES (27, 4, 'D5接地线未标明电压等级', null);
INSERT INTO public.tool_defect VALUES (28, 4, 'D6不合格地线与日常使用的混放', null);
INSERT INTO public.tool_defect VALUES (29, 4, 'D7未对号存放', null);
INSERT INTO public.tool_defect VALUES (30, 4, 'D8其它', null);
INSERT INTO public.tool_defect VALUES (31, 5, 'E1绝缘部分有污垢、损伤或裂纹', null);
INSERT INTO public.tool_defect VALUES (32, 5, 'E2声光指示失灵', null);
INSERT INTO public.tool_defect VALUES (33, 5, 'E3超期未试验', null);
INSERT INTO public.tool_defect VALUES (34, 5, 'E4无试验标签', null);
INSERT INTO public.tool_defect VALUES (35, 5, 'E5未标明电压等级', null);
INSERT INTO public.tool_defect VALUES (36, 5, 'E6存放处可能损害绝缘或验电头', null);
INSERT INTO public.tool_defect VALUES (37, 5, 'E7不合格验电器与日常使用的混放', null);
INSERT INTO public.tool_defect VALUES (38, 5, 'E8其它', null);
INSERT INTO public.tool_defect VALUES (39, 6, 'F1绝缘部分有污垢、损伤或裂纹', null);
INSERT INTO public.tool_defect VALUES (40, 6, 'F2机械连接部分或头部锈蚀或损坏', null);
INSERT INTO public.tool_defect VALUES (41, 6, 'F3超期未试验', null);
INSERT INTO public.tool_defect VALUES (42, 6, 'F4无试验标签', null);
INSERT INTO public.tool_defect VALUES (43, 6, 'F5未标明电压等级', null);
INSERT INTO public.tool_defect VALUES (44, 6, 'F6存放处可能损害绝缘', null);
INSERT INTO public.tool_defect VALUES (45, 6, 'F7不合格绝缘棒与日常使用的混放', null);
INSERT INTO public.tool_defect VALUES (46, 6, 'F8其它', null);
INSERT INTO public.tool_defect VALUES (47, 7, 'G1无清楚的编号', null);
INSERT INTO public.tool_defect VALUES (48, 7, 'G2外表磨损、破漏或有沙眼气孔', null);
INSERT INTO public.tool_defect VALUES (49, 7, 'G3鞋底磨损严重，绝缘层已外露', null);
INSERT INTO public.tool_defect VALUES (50, 7, 'G4 鞋内受潮', null);
INSERT INTO public.tool_defect VALUES (51, 7, 'G5超期未试验', null);
INSERT INTO public.tool_defect VALUES (52, 7, 'G6无试验标签', null);
INSERT INTO public.tool_defect VALUES (53, 7, 'G7摆放时堆压或放置处易接触石油类油脂', null);
INSERT INTO public.tool_defect VALUES (54, 7, 'G8作雨具使用', null);
INSERT INTO public.tool_defect VALUES (55, 7, 'G9其它', null);
INSERT INTO public.tool_defect VALUES (56, 8, 'H1金属部分腐蚀或有裂纹', null);
INSERT INTO public.tool_defect VALUES (57, 8, 'H2系脚皮带损坏', null);
INSERT INTO public.tool_defect VALUES (58, 8, 'H3超期未试验', null);
INSERT INTO public.tool_defect VALUES (59, 8, 'H4无试验标签', null);
INSERT INTO public.tool_defect VALUES (60, 8, 'H5冲击试登时变形', null);
INSERT INTO public.tool_defect VALUES (61, 8, 'H6其它', null);
INSERT INTO public.tool_defect VALUES (62, 9, 'Q1背负带损坏', null);
INSERT INTO public.tool_defect VALUES (63, 9, 'Q2 软管有裂纹', null);
INSERT INTO public.tool_defect VALUES (64, 9, 'Q3正压式呼气器压力过低或过高', null);
INSERT INTO public.tool_defect VALUES (65, 9, 'Q4呼吸面罩损坏', null);
INSERT INTO public.tool_defect VALUES (66, 9, 'Q5排气口堵塞', null);
INSERT INTO public.tool_defect VALUES (67, 9, 'Q6超过使用期限', null);
INSERT INTO public.tool_defect VALUES (68, 9, 'Q7其它', null);
INSERT INTO public.tool_defect VALUES (69, 10, 'J1绝缘部分有污垢、损伤或裂纹', null);
INSERT INTO public.tool_defect VALUES (70, 10, 'J2超期未试验', null);
INSERT INTO public.tool_defect VALUES (71, 10, 'J3无试验标签', null);
INSERT INTO public.tool_defect VALUES (72, 10, 'J4存放处可能损害绝缘', null);
INSERT INTO public.tool_defect VALUES (73, 10, 'J5未编号', null);
INSERT INTO public.tool_defect VALUES (74, 10, 'J6其他', null);
INSERT INTO public.tool_defect VALUES (75, 11, 'K1文字图案不符合规范', null);
INSERT INTO public.tool_defect VALUES (76, 11, 'K2放置位置不正确', null);
INSERT INTO public.tool_defect VALUES (77, 11, 'K3残缺、破损', null);
INSERT INTO public.tool_defect VALUES (78, 11, 'K4文字、图案脱落、不清晰', null);
INSERT INTO public.tool_defect VALUES (79, 11, 'K5缺少标示牌', null);
INSERT INTO public.tool_defect VALUES (80, 11, 'K6安装不牢固', null);
INSERT INTO public.tool_defect VALUES (81, 11, 'K7其它', null);
INSERT INTO public.tool_defect VALUES (82, 12, 'L1 拉力绳磨损、断股', null);
INSERT INTO public.tool_defect VALUES (83, 12, 'L2板端绑扎不牢', null);
INSERT INTO public.tool_defect VALUES (84, 12, 'L3超期未试验', null);
INSERT INTO public.tool_defect VALUES (85, 12, 'L4无试验标签', null);
INSERT INTO public.tool_defect VALUES (86, 12, 'L5冲击试登时变形', null);
INSERT INTO public.tool_defect VALUES (87, 13, 'L6其他', null);
INSERT INTO public.tool_defect VALUES (88, 13, 'M1镜片损坏                    ', null);
INSERT INTO public.tool_defect VALUES (89, 13, 'M2镜架损坏', null);
INSERT INTO public.tool_defect VALUES (90, 13, 'M3未存放在专用镜盒内 ', null);
INSERT INTO public.tool_defect VALUES (91, 13, 'M4其它', null);
INSERT INTO public.tool_defect VALUES (92, 14, 'N1连接金属锈蚀或有裂纹        ', null);
INSERT INTO public.tool_defect VALUES (93, 14, 'N2锁扣失灵                 ', null);
INSERT INTO public.tool_defect VALUES (94, 14, 'N3断股     ', null);
INSERT INTO public.tool_defect VALUES (95, 14, 'N4超期未试验 ', null);
INSERT INTO public.tool_defect VALUES (96, 14, 'N5其它', null);
INSERT INTO public.tool_defect VALUES (97, 15, 'O1有裂纹、破损或虫蛀、变形', null);
INSERT INTO public.tool_defect VALUES (98, 15, 'O2无在竹梯上、中、下规定位置使用铁线加固', null);
INSERT INTO public.tool_defect VALUES (99, 15, 'O3竹梯脚无防滑装置', null);
INSERT INTO public.tool_defect VALUES (100, 15, 'O4无清楚的编号', null);
INSERT INTO public.tool_defect VALUES (101, 15, 'O5在竹梯2米以下无涂有红白相间的防撞标识', null);
INSERT INTO public.tool_defect VALUES (102, 15, 'O6其它', null);
INSERT INTO public.tool_defect VALUES (103, 16, 'P1无清楚的编号', null);
INSERT INTO public.tool_defect VALUES (104, 16, 'P2构件无连接完好', null);
INSERT INTO public.tool_defect VALUES (105, 16, 'P3有裂纹、破损或污渍、变形', null);
INSERT INTO public.tool_defect VALUES (106, 16, 'P4梯脚无防滑装置', null);
INSERT INTO public.tool_defect VALUES (107, 16, 'P5人字梯无限制开度的拉链', null);
INSERT INTO public.tool_defect VALUES (108, 16, 'P6其它', null);
INSERT INTO public.tool_defect VALUES (109, 17, 'R1表面不平滑', null);
INSERT INTO public.tool_defect VALUES (110, 17, 'R2内外面有疵点、破损、缝合缺陷、走纱等各种缺陷', null);
INSERT INTO public.tool_defect VALUES (111, 17, 'R3有污染痕迹', null);
INSERT INTO public.tool_defect VALUES (112, 17, 'R4出厂后使用年限5年及以上', null);
INSERT INTO public.tool_defect VALUES (113, 17, 'R5其它', null);
INSERT INTO public.tool_defect VALUES (114, 18, 'S1有松散,分股现象；', null);
INSERT INTO public.tool_defect VALUES (115, 18, 'S2有叠痕,凸起,压伤,背股,抽筋等缺陷', null);
INSERT INTO public.tool_defect VALUES (116, 18, 'S3有错乱、交叉的丝、线、股', null);
INSERT INTO public.tool_defect VALUES (117, 18, 'S4.有股接头.单丝接头外露', null);
INSERT INTO public.tool_defect VALUES (118, 18, 'S5股绳和股线的捻距在其全长上不均匀', null);
INSERT INTO public.tool_defect VALUES (119, 18, 'S6其它', null);
INSERT INTO public.tool_defect VALUES (120, 19, 'T1表面脏污、损坏破洞或裂纹；', null);
INSERT INTO public.tool_defect VALUES (121, 19, 'T2厚度减薄;', null);
INSERT INTO public.tool_defect VALUES (122, 19, 'T3超期未试验', null);
INSERT INTO public.tool_defect VALUES (123, 19, 'T4无试验标签', null);
INSERT INTO public.tool_defect VALUES (124, 19, 'T5未标明电压等级', null);
INSERT INTO public.tool_defect VALUES (125, 19, 'T6其它', null);
INSERT INTO public.tool_defect VALUES (126, 20, 'U1面罩不完整；', null);
INSERT INTO public.tool_defect VALUES (127, 20, 'U2面罩气密性不良；', null);
INSERT INTO public.tool_defect VALUES (128, 20, 'U3面罩密合框与佩戴者颜面不密合或有明显压痛感', null);
INSERT INTO public.tool_defect VALUES (129, 20, 'U4超过使用期限', null);
INSERT INTO public.tool_defect VALUES (130, 20, 'U5其他', null);
INSERT INTO public.tool_defect VALUES (131, 21, 'V1表面或边角有损坏；', null);
INSERT INTO public.tool_defect VALUES (132, 21, 'V2表面脏污；', null);
INSERT INTO public.tool_defect VALUES (133, 21, 'V3构件无连接完好', null);
INSERT INTO public.tool_defect VALUES (134, 21, 'V4无清楚编号；', null);
INSERT INTO public.tool_defect VALUES (135, 21, 'V5其它', null);
INSERT INTO public.tool_defect VALUES (136, 22, 'W1无清楚的编号；', null);
INSERT INTO public.tool_defect VALUES (137, 22, 'W2定期试验不合格、没有合格标签或未超期；', null);
INSERT INTO public.tool_defect VALUES (138, 22, 'W3绝缘部分表面有裂纹、破损或污渍；', null);
INSERT INTO public.tool_defect VALUES (139, 22, 'W4构件组合、连接部分不可靠牢固。', null);
INSERT INTO public.tool_defect VALUES (140, 22, 'W5其他', null);
SELECT setval('public.tool_defect_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.tool_defect), 1), false);

-- tool data
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C1', 'C', '1', 14, '白棕绳', '15M', '中洲所#3', '个人安全防护用品', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C2', 'C', '2', 14, '白棕绳', '25M', '中洲所#2', '个人安全防护用品', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C3', 'C', '3', 14, '白棕绳', '25M', '中洲所#1', '个人安全防护用品', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C4', 'C', '4', 14, '白棕绳', '15M', '中洲所#4', '个人安全防护用品', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C7', 'C', '7', 22, '车辆', '工具车', 'H07S82', '车辆', '2018-2-1 00:00:00', '2018-2-1 00:00:00', 30, 30, '1236');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C8', 'C', '8', 22, '车辆', '工具车', 'HZ1696', '车辆', '2018-2-1 00:00:00', '2018-2-1 00:00:00', 30, 30, '1235');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C10', 'C', '10', 22, '车 辆', '工具车', 'H75512', '车辆', '2018-2-1 00:00:00', '2018-2-1 00:00:00', 30, 30, '1234');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C11', 'C', '11', 6, '绝缘操作棒', '10kV-2M?', '中洲所#02', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 12, 120, '河北安电电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C12', 'C', '12', 5, '交流声光验电器', '10kV-YQD-2', '中州所#01', '绝缘安全工器具', '2017-10-1 00:00:00', '2017-10-1 00:00:00', 12, 36, '河北信得利有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C13', 'C', '13', 22, '车辆', '工具车', 'HZ1620', '车辆', '2018-2-1 00:00:00', '2018-2-1 00:00:00', 30, 30, '1233');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C15', 'C', '15', 6, '绝缘操作棒', '10kV-2M?', '中洲所#04', '绝缘安全工器具', '2017-8-1 00:00:00', '2017-8-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C16', 'C', '16', 6, '绝缘棒', '10KV2M*3', '中洲所#06', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 12, 60, '河北安电');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C17', 'C', '17', 5, '声光验电器', '0.4kV', '中洲所#42', '绝缘安全工器具', '2014-8-12 00:00:00', '2014-8-12 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C18', 'C', '18', 5, '交流声光验电器', '10kV-YQD-2', '中洲所#03', '绝缘安全工器具', '2017-8-30 00:00:00', '2017-12-1 00:00:00', 12, 60, '河北信得利有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C19', 'C', '19', 6, '绝缘操作棒', '10kV-2M?', '中洲所#03', '绝缘安全工器具', '2014-8-1 00:00:00', '2014-8-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C21', 'C', '21', 22, '卡线钳', 'LGJ150-240', '中洲所#4', '机具仪表类', '2017-6-4 00:00:00', '2017-7-4 00:00:00', 12, 120, '扬州毕益电力机具有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C22', 'C', '22', 22, '卡线钳', 'LGJ95-120', '中洲所#2', '机具仪表类', '2017-6-4 00:00:00', '2017-7-4 00:00:00', 12, 120, '扬州毕益电力机具有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C23', 'C', '23', 6, '绝缘操作棒', '10kV-2M?', '中洲所#05', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C24', 'C', '24', 4, '接地线', '10kV-1.5M?', '中洲所#02', '绝缘安全工器具', '2012-12-1 00:00:00', '2012-12-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C26', 'C', '26', 4, '接地线', '10kV-1.5M?', '中洲所#03', '绝缘安全工器具', '2004-7-10 00:00:00', '2004-7-10 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C27', 'C', '27', 5, '交流声光验电器', '10kV-YQD-2', '中洲所#04', '绝缘安全工器具', '2017-8-30 00:00:00', '2017-12-1 00:00:00', 12, 60, '河北信得利有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C30', 'C', '30', 5, '交流声光验电器', '10kV-YQD-2', '中洲所#02', '绝缘安全工器具', '2017-11-30 00:00:00', '2017-12-1 00:00:00', 12, 60, '河北信得利有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C31', 'C', '31', 22, '手枪钻', '-', '中洲所#1', '用电设备', '2006-5-2 00:00:00', '2008-5-3 00:00:00', 240, 240, '番禺裕丰电器设备厂');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C32', 'C', '32', 22, '砂轮机', '-', '中洲所#1', '用电设备', '2016-5-2 00:00:00', '2016-5-20 00:00:00', 240, 240, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C34', 'C', '34', 22, '防爆头灯', '-', '中洲所#1', '用电设备', '2015-12-5 00:00:00', '2015-12-10 00:00:00', 240, 240, '海洋王有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C36', 'C', '36', 22, '卡线钳', 'LGJ25-50', '中洲所#5', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '浙江象山金星电力机具厂');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C41', 'C', '41', 4, '接地线', '10kV-1.5M?', '中洲所#01', '绝缘安全工器具', '2012-12-1 00:00:00', '2012-12-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C42', 'C', '42', 4, '接地线', '10kV-1.5M?', '中洲所#05', '绝缘安全工器具', '2004-7-10 00:00:00', '2004-7-10 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C43', 'C', '43', 4, '接地线', '10kV-1.5M?', '中洲所#06', '绝缘安全工器具', '2004-7-10 00:00:00', '2004-7-10 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C44', 'C', '44', 4, '接地线', '10kV-1.5M?', '中洲所#07', '绝缘安全工器具', '2012-12-1 00:00:00', '2012-12-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C45', 'C', '45', 5, '声光验电器', '0.4kV', '中洲所#41', '绝缘安全工器具', '2014-8-12 00:00:00', '2014-8-12 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C46', 'C', '46', 22, '电缆剪', 'J-30', '中洲所#2', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'C48', 'C', '48', 22, '防爆头灯', '-', '中洲所#2', '用电设备', '2015-12-5 00:00:00', '2015-12-10 00:00:00', 240, 240, '海洋王有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D1', 'D', '1', 22, '强光灯', '-', '中洲所#1', '用电设备', '2010-6-4 00:00:00', '2011-10-5 00:00:00', 240, 240, '海洋王有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D2', 'D', '2', 2, '绝缘手套', '12KV', '中洲所#05', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 6, 60, 'ELECTROSOFF');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D3', 'D', '3', 2, '绝缘手套', '12KV', '中洲所#02', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 6, 60, '天津双安');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D4', 'D', '4', 2, '绝缘手套', '12KV', '中洲所#04', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 6, 60, '双津双安');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D5', 'D', '5', 3, '安全带', '腰带式双保险', '中洲所#2', '个人安全防护用品', '2015-12-1 00:00:00', '2015-12-1 00:00:00', 12, 36, '河北安电电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D7', 'D', '7', 3, '安全带', '腰带式双保险', '中洲所#3', '个人安全防护用品', '2015-12-1 00:00:00', '2015-12-1 00:00:00', 12, 36, '河北安电电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D8', 'D', '8', 3, '安全带', '腰带式双保险', '中洲所#1', '个人安全防护用品', '2016-10-1 00:00:00', '2016-10-1 00:00:00', 12, 36, '河北安电电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D9', 'D', '9', 3, '安全带', '双背式双保险', '中洲所#5', '个人安全防护用品', '2016-10-1 00:00:00', '2016-10-10 00:00:00', 12, 36, '河北安电电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D10', 'D', '10', 3, '安全带', '腰带式双保险', '中洲所#4', '个人安全防护用品', '2016-10-1 00:00:00', '2016-10-10 00:00:00', 12, 36, '河北安电电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D11', 'D', '11', 2, '绝缘手套', '12KV', '中洲所#03', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 6, 60, '天津双安');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D12', 'D', '12', 22, '轻携电源架', 'JD（F）300', '中洲所#1', '用电设备', '2010-6-4 00:00:00', '2011-10-5 00:00:00', 240, 240, '番禺裕丰电器设备厂');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D13', 'D', '13', 22, '轻携电源架', '-', '中洲所#3', '用电设备', '2015-12-5 00:00:00', '2015-12-10 00:00:00', 240, 240, '上海德勒');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D14', 'D', '14', 22, '轻携电源架', 'JD（F）300', '中洲所#2', '用电设备', '2010-6-4 00:00:00', '2011-10-5 00:00:00', 240, 240, '番禺裕丰电器设备厂');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D15', 'D', '15', 22, '冲击转', 'HC7502', '中州所#4', '用电设备', '2016-5-4 00:00:00', '2016-5-5 00:00:00', 240, 240, '上海沪川工具有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D16', 'D', '16', 22, '冲击钻', '-', '中洲所#1', '用电设备', '2013-5-3 00:00:00', '2013-5-4 00:00:00', 240, 240, '上海沪川工具有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D17', 'D', '17', 22, '线缆剪', 'SLT-100-J100', '中州所#02', '机具仪表类', '2017-8-1 00:00:00', '2017-8-1 00:00:00', 120, 240, '长信');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D18', 'D', '18', 22, '铁锤', '8LB', '中洲所#1', '机具仪表类', '2017-11-1 00:00:00', '2017-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D19', 'D', '19', 22, '冲击钻', 'HC7502', '中洲所#3', '用电设备', '2016-5-4 00:00:00', '2016-5-5 00:00:00', 240, 240, '上海沪川工具有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D20', 'D', '20', 22, '冲击钻', 'HC7502', '中洲所#2', '用电设备', '2016-5-4 00:00:00', '2016-5-5 00:00:00', 240, 240, '上海沪川工具有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D21', 'D', '21', 22, '铁锤', '8LB', '中洲所#2', '机具仪表类', '2017-11-1 00:00:00', '2017-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D22', 'D', '22', 22, '线缆剪', 'J13', '中州所#01', '机具仪表类', '2017-8-1 00:00:00', '2017-9-1 00:00:00', 120, 240, '长信');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D23', 'D', '23', 22, '液压钳', 'QW-18A', '中洲所#1', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D24', 'D', '24', 22, '汽油锯', 'YD-YTH02-52', '中洲所#1', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D25', 'D', '25', 22, '手板葫芦', 'HXZ2', '中洲所#2', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '广州广鸽起重设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D26', 'D', '26', 2, '绝缘手套', '12KV', '中洲所#01', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 6, 60, '天津双安');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D27', 'D', '27', 22, '手板葫芦', 'HXZ3', '中洲所#3', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '广州广鸽起重设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D28', 'D', '28', 22, '手板葫芦', 'HXZ2', '中洲所#1', '机具仪表类', '2014-10-31 00:00:00', '2014-12-10 00:00:00', 12, 120, '广州广鸽起重设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D29', 'D', '29', 22, '液压钳', 'QW-13A', '中洲所#2', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D31', 'D', '31', 22, '大剪', '-', '中洲所#1', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D32', 'D', '32', 22, '大剪', '-', '中洲所#2', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D34', 'D', '34', 22, '电缆剪', 'J-30', '中洲所#1', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D35', 'D', '35', 22, '大扳手', '-', '中洲所#1', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D36', 'D', '36', 22, '大剪', '-', '中洲所#3', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D39', 'D', '39', 22, '电缆剪', 'J-30', '中洲所#3', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D42', 'D', '42', 8, '脚扣', 'JK-T350', '中洲所#5', '一般安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D43', 'D', '43', 8, '脚扣', 'JK-T350', '中洲所#13', '一般安全工器具', '2011-10-1 00:00:00', '2011-10-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D44', 'D', '44', 8, '脚扣', 'JK-T400', '中洲所#1', '一般安全工器具', '2015-11-1 00:00:00', '2015-11-1 00:00:00', 12, 120, '保定阳光电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D45', 'D', '45', 8, '脚扣', 'JK-T400', '中洲所#2', '一般安全工器具', '2015-11-1 00:00:00', '2015-11-1 00:00:00', 12, 120, '保定阳光电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'D46', 'D', '46', 8, '脚扣', 'JK-T350', '中洲所#4', '一般安全工器具', '2011-10-1 00:00:00', '2011-10-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A1', 'A', '1', 11, '安全警示带', '5米', '中洲所#6', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A2', 'A', '2', 11, '安全警示带', '5米', '中洲所#5', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A3', 'A', '3', 11, '安全警示带', '5米', '中洲所#3', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A4', 'A', '4', 11, '安全警示带', '5米', '中洲所#4', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A5', 'A', '5', 11, '安全警示带', '5米', '中洲所#1', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A6', 'A', '6', 11, '安全警示带', '5米', '中洲所#2', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
-- INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A07', 'A', '07', 6, '绝缘操作棒', '10kV-2M?', '中洲所#01', '绝缘安全工器具', '2016-10-1 00:00:00', '2016-10-1 00:00:00', 12, 120, '河北信得利电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A7', 'A', '7', 11, '安全围栏', '1?0', '中洲所#5', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A8', 'A', '8', 11, '安全围栏', '1?0', '中洲所#4', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A9', 'A', '9', 13, '防护眼镜', '-', '中洲所#1、#2、#3', '辅助安全工器具', '2014-2-22 00:00:00', '2014-2-22 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A10', 'A', '10', 11, '安全围栏', '1?0', '中洲所#3', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A11', 'A', '11', 22, '手持红外线测温仪', 'F59', 'ZQHJ-ZZ-CS-032', '测试设备', '2014-4-14 00:00:00', '2014-4-15 00:00:00', 12, 120, '上海世禄仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A12', 'A', '12', 22, '接地电子测试仪', 'VICTOR4105B', 'ZQHJ-ZZ-CS-029', '测试设备', '2014-4-14 00:00:00', '2014-4-15 00:00:00', 12, 120, '深圳胜利电子科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A13', 'A', '13', 22, '手持红外线测温仪', 'F59', 'ZQHJ-ZZ-CS-033', '测试设备', '2014-4-14 00:00:00', '2014-4-15 00:00:00', 12, 120, '上海世禄仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A14', 'A', '14', 22, '数字万用表', '15B', 'ZQHJ-ZZ-CS-031', '测试设备', '2014-4-14 00:00:00', '2014-4-15 00:00:00', 12, 120, '安徽世福仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A15', 'A', '15', 22, '数字万用表', '15B', 'ZQHJ-ZZ-CS-030', '测试设备', '2014-4-14 00:00:00', '2014-4-15 00:00:00', 12, 120, '安徽世福仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A16', 'A', '16', 22, '接地电子测试仪', 'VICTOR4105B', 'ZQHJ-ZZ-CS-028', '测试设备', '2014-4-14 00:00:00', '2014-4-15 00:00:00', 12, 120, '深圳胜利电子科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A17', 'A', '17', 11, '安全围栏', '1?0', '中洲所#2', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A18', 'A', '18', 11, '安全围栏', '1?0', '中洲所#1', '一般安全工器具', '2011-6-10 00:00:00', '2011-6-20 00:00:00', 120, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A19', 'A', '19', 2, '羊皮手套', '0.4kV', '中洲所#1', '辅助安全工器具', '2014-2-22 00:00:00', '2014-2-22 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A20', 'A', '20', 22, '望远镜', '123M/1000M', 'ZQHJ-ZZ-CS-014', '测试设备', '2014-4-1 00:00:00', '2014-4-12 00:00:00', 240, 240, 'tasco');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A21', 'A', '21', 2, '羊皮手套', '0.4kV', '中洲所#2', '辅助安全工器具', '2014-2-22 00:00:00', '2014-2-22 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A22', 'A', '22', 2, '绝缘手套', '12KV', '中洲所#06', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 6, 60, 'ELECTROSOFF');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A23', 'A', '23', 7, '绝缘靴', '25kV', '中洲所#06', '绝缘安全工器具', '2015-6-16 00:00:00', '2015-6-16 00:00:00', 6, 60, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A24', 'A', '24', 7, '绝缘靴', '25kV', '中洲所#07', '绝缘安全工器具', '2016-12-1 00:00:00', '2016-12-1 00:00:00', 6, 60, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A25', 'A', '25', 22, '望远镜', '123M/1000M', 'ZQHJ-ZZ-CS-016', '测试设备', '2014-4-1 00:00:00', '2014-4-12 00:00:00', 240, 240, 'canon');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A26', 'A', '26', 22, '皮尺', 'GREAT', 'ZQHJ-ZZ-CS-019', '测试设备', '2014-4-1 00:00:00', '2014-4-12 00:00:00', 240, 240, '昆城里');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A27', 'A', '27', 22, '皮尺', 'LD-5012-1', 'ZQHJ-ZZ-CS-018', '测试设备', '2014-4-1 00:00:00', '2014-4-12 00:00:00', 240, 240, '蓝达');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A28', 'A', '28', 22, '皮尺', 'LD-5012-1', 'ZQHJ-ZZ-CS-017', '测试设备', '2014-4-1 00:00:00', '2014-4-12 00:00:00', 240, 240, '蓝达');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A30', 'A', '30', 22, '望远镜', '123M/1000M', 'ZQHJ-ZZ-CS-015', '测试设备', '2014-4-1 00:00:00', '2014-4-12 00:00:00', 240, 240, 'tasco');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A31', 'A', '31', 22, '接地电阻表', 'ZC-11D', 'ZQHJ-ZZ-CS-023', '测试设备', '2014-2-1 00:00:00', '2014-2-2 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A37', 'A', '37', 22, '测距仪', 'LR600M', 'ZQHJ-ZZ-CS-034', '测试设备', '2016-10-1 00:00:00', '2016-11-2 00:00:00', 12, 120, '上海世禄仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A39', 'A', '39', 22, '接地电阻表', 'ZC-8型', 'ZQHJ-ZZ-CS-021', '测试设备', '2014-4-1 00:00:00', '2014-4-12 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A41', 'A', '41', 22, '数字兆欧表', 'VC60D+', 'ZQHJ-ZZ-CS-026', '测试设备', '2013-12-25 00:00:00', '2013-12-26 00:00:00', 12, 120, '深圳胜利电子科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A43', 'A', '43', 22, '钳型表', '302+', 'ZQHJ-ZZ-CS-024', '测试设备', '2014-3-2 00:00:00', '2014-3-10 00:00:00', 12, 120, '安徽世福仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'A44', 'A', '44', 22, '接地电阻表', 'ZC-11D', 'ZQHJ-ZZ-CS-022', '测试设备', '2014-2-1 00:00:00', '2014-2-2 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B1', 'B', '1', 3, '安全带', '双背式双保险', '中洲所#6', '个人安全防护用品', '2016-10-1 00:00:00', '2016-10-10 00:00:00', 12, 36, '河北安电电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B5', 'B', '5', 3, '安全带', '双背式双保险', '中洲所#10、#11', '个人安全防护用品', '2017-8-1 00:00:00', '2017-9-1 00:00:00', 12, 36, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B6', 'B', '6', 3, '安全带', '双背式双保险', '中洲所#9', '个人安全防护用品', '2017-8-1 00:00:00', '2017-9-1 00:00:00', 12, 36, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B7', 'B', '7', 3, '安全带', '腰间式双保险', '中洲所#8', '个人安全防护用品', '2015-12-1 00:00:00', '2015-12-1 00:00:00', 12, 36, '河北安电电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B8', 'B', '8', 3, '安全带', '双背式双保险', '中洲所#7', '个人安全防护用品', '2016-10-1 00:00:00', '2016-10-10 00:00:00', 12, 36, '河北安电电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B9', 'B', '9', 8, '脚扣', 'JK-T300', '中洲所#14、#15', '一般安全工器具', '2017-8-1 00:00:00', '2017-9-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B10', 'B', '10', 8, '脚扣', 'JK-T400', '中洲所#12', '一般安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B11', 'B', '11', 8, '脚扣', 'JK-T400', '中洲所#10', '一般安全工器具', '2016-12-1 00:00:00', '2016-12-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B12', 'B', '12', 8, '脚扣', 'JK-T400', '中洲所#11', '一般安全工器具', '2016-12-1 00:00:00', '2016-12-1 00:00:00', 12, 120, '保定阳光电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B14', 'B', '14', 8, '脚扣', 'JK-T350', '中洲所#9', '一般安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B15', 'B', '15', 22, '卡线钳', 'LGJ70-95', '中洲所#7', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B16', 'B', '16', 22, '卡线钳', 'LGJ150-240', '中洲所#10', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B17', 'B', '17', 22, '卡线钳', 'LGJ150-240', '中洲所#9', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B18', 'B', '18', 22, '卡线钳', 'LGJ95-120', '中洲所#8', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B19', 'B', '19', 22, '卡线钳', 'LGJ25-70', '中洲所#6', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '浙江象山金星电力机具厂');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B20', 'B', '20', 22, '反光标志工作服', '-', '中洲所#8', '个人安全防护用品', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B21', 'B', '21', 22, '反光标志工作服', '-', '中洲所#7', '个人安全防护用品', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B22', 'B', '22', 22, '反光标志工作服', '-', '中洲所#5、#6', '个人安全防护用品', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B23', 'B', '23', 17, '防电弧长大褂', 'ADH-D-ARC12.7', '中洲所#4', '个人安全防护用品', '2013-10-8 00:00:00', '2013-10-8 00:00:00', 120, 120, '上海圣欧同安防用品开发有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B24', 'B', '24', 17, '防电弧长大褂', 'ADH-D-ARC12.7', '中洲所#2', '个人安全防护用品', '2013-10-8 00:00:00', '2013-10-8 00:00:00', 120, 120, '上海圣欧同安防用品开发有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B25', 'B', '25', 5, '声光验电器', '0.4kV', '中洲所#43', '绝缘安全工器具', '2014-8-12 00:00:00', '2014-8-12 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B26', 'B', '26', 17, '防电弧长大褂', 'ADH-D-ARC12.7', '中洲所#1', '个人安全防护用品', '2013-10-8 00:00:00', '2013-10-8 00:00:00', 120, 120, '上海圣欧同安防用品开发有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B27', 'B', '27', 4, '接地线', '0.4kV-0.3M?', '中洲所#44', '绝缘安全工器具', '2011-9-18 00:00:00', '2011-9-18 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B28', 'B', '28', 17, '防电弧长大褂', 'ADH-D-ARC12.7', '中洲所#3', '个人安全防护用品', '2013-10-8 00:00:00', '2013-10-8 00:00:00', 120, 120, '上海圣欧同安防用品开发有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B29', 'B', '29', 22, '反光标志工作服', '-', '中洲所#3、#4', '个人安全防护用品', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B31', 'B', '31', 7, '绝缘靴', '25kV', '中洲所#05', '绝缘安全工器具', '2015-6-16 00:00:00', '2015-6-16 00:00:00', 6, 60, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B33', 'B', '33', 7, '绝缘靴', '25kV', '中洲所#02', '绝缘安全工器具', '2014-4-22 00:00:00', '2014-4-22 00:00:00', 6, 60, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B34', 'B', '34', 22, '反光标志工作服', '-', '中洲所#1、#2', '个人安全防护用品', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B35', 'B', '35', 2, '绝缘手套', '0.5kV', '中洲所#43', '绝缘安全工期句', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 6, 36, '天津双安');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B36', 'B', '36', 4, '接地线', '0.4kV-0.3M?', '中洲所#43', '绝缘安全工器具', '2011-9-18 00:00:00', '2011-9-18 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B37', 'B', '37', 4, '接地线', '0.4kV-0.3M?', '中洲所#42', '绝缘安全工器具', '2014-9-2 00:00:00', '2014-9-2 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B38', 'B', '38', 4, '接地线', '0.4kV-0.3M?', '中洲所#41', '绝缘安全工器具', '2005-3-10 00:00:00', '2005-3-10 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B40', 'B', '40', 2, '绝缘手套', '0.5kV', '中洲所#42', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 6, 36, '天津双安');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B42', 'B', '42', 7, '绝缘靴', '25kV', '中洲所#04', '绝缘安全工器具', '2014-4-22 00:00:00', '2014-4-22 00:00:00', 6, 60, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B43', 'B', '43', 2, '绝缘手套', '0.5Kv', '中洲所#46', '绝缘安全工器具', '2018-3-31 00:00:00', '2018-3-31 00:00:00', 6, 36, '天津双安');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B44', 'B', '44', 2, '绝缘手套', '0.5kV ', '中洲所#44', '绝缘安全工器具', '2017-8-1 00:00:00', '2017-9-1 00:00:00', 6, 36, '天津双安');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B45', 'B', '45', 22, '防坠器', 'TS-10', '中洲所#1', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B47', 'B', '47', 22, '防坠器', 'TS-10', '中洲所#2', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (1, 'B48', 'B', '48', 22, '防坠器', 'TS-10', '中洲所#3', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B1', 'B', '1', 2, '低压绝缘手套', '0.4kV', '梁村所#45', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 6, 60, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B2', 'B', '2', 2, '低压绝缘手套', '0.4kV', '梁村所#46', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 6, 60, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B3', 'B', '3', 2, '低压绝缘手套', '0.4kV', '梁村所#44', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 6, 60, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B4', 'B', '4', 7, '绝缘靴', '10kV', '梁村所#07', '绝缘安全工器具', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 6, 60, '天津王顶堤双安防护用品科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B5', 'B', '5', 7, '绝缘靴', '10kV', '梁村所#06', '绝缘安全工器具', '2014-12-1 00:00:00', '2014-12-15 00:00:00', 6, 60, '天津王顶堤双安防护用品科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B6', 'B', '6', 5, '声光验电器', '10kV', '梁村所#05', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 36, '河北信得利电器设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B7', 'B', '7', 5, '声光验电器', '10kV', '梁村所#04', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 36, '河北信得利电器设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B8', 'B', '8', 5, '声光验电器', '10kV', '梁村所#22', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 36, '河北信得利电器设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B9', 'B', '9', 5, '声光验电器', '10kV', '梁村所#2', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 36, '河北信得利电器设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B10', 'B', '10', 5, '声光验电器', '10kV', '梁村所#6', '绝缘安全工器具', '2015-11-1 00:00:00', '2015-12-1 00:00:00', 12, 36, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B11', 'B', '11', 4, '接地线', '0.4kV', '梁村所#41', '绝缘安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B13', 'B', '13', 4, '接地线', '0.4kV', '梁村所#43', '绝缘安全工器具', '2014-1-1 00:00:00', '2014-9-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B14', 'B', '14', 1, '接地线', '0.4kV', '梁村所#44', '绝缘安全工器具', '2014-1-1 00:00:00', '2014-9-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B15', 'B', '15', 22, '数字钳形表', 'BM5266', '梁村所#2', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 120, 240, '深圳市滨江电子科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B16', 'B', '16', 1, '接地线', '0.4kV', '梁村所#42', '绝缘安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B17', 'B', '17', 1, '数显卡尺#1', '0.4kV', '数显卡尺#1', '绝缘安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B18', 'B', '18', 22, '数字钳形表', 'BM5266', '梁村所#3', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 12, 240, '深圳市滨江电子科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B19', 'B', '19', 22, '数字钳形表', 'BM5266', '梁村所#4', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 120, 240, '深圳市滨江电子科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B20', 'B', '20', 22, '测距仪', 'UNI-T', '梁村所#2', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 12, 240, '优德利科技（中国）有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B21', 'B', '21', 22, '红外测温枪', 'MT4 MAX', '梁村所#2', '机具仪表', '2017-9-1 00:00:00', '2017-10-1 00:00:00', 12, 240, 'FLUKE');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B22', 'B', '22', 22, '红外测温枪', 'F-59', '梁村所#1', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 12, 240, 'FLUKE');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B23', 'B', '23', 22, '数字钳形表', 'BM5266', '梁村所#1', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 12, 240, '深圳市滨江电子科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B24', 'B', '24', 22, '数字钳形表', '312', '梁村所#5', '机具仪表', '2017-9-1 00:00:00', '2017-10-1 00:00:00', 12, 240, 'FLUKE');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B26', 'B', '26', 22, '测距仪', 'Pro1500', '梁村所#1', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 12, 240, 'Apresye');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B27', 'B', '27', 22, '水平尺', '2005B', '梁村所#01', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, 'BERRY LION');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B28', 'B', '28', 22, '皮尺', 'LD-5012-1 50M', '梁村所#02', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '蓝达');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B29', 'B', '29', 22, '单相电能表现场校验仪#1', 'LD-5012-1 50M', '梁村所单相电能表现场校验仪#1', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '蓝达');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B30', 'B', '30', 7, '绝缘靴', '10kV', '梁村所#01', '绝缘安全工器具', '2014-12-1 00:00:00', '2014-12-15 00:00:00', 6, 60, '天津王顶堤双安防护用品科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B31', 'B', '31', 22, '皮尺', 'LD-5012-1  50M', '梁村所#01', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '蓝达');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B33', 'B', '33', 7, '绝缘靴', '0.4kV', '梁村所#04', '绝缘安全工器具', '2014-12-1 00:00:00', '2014-12-15 00:00:00', 6, 60, '天津王顶堤双安防护用品科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B34', 'B', '34', 7, '绝缘靴', '10kV', '梁村所#03', '绝缘安全工器具', '2013-9-1 00:00:00', '2013-10-1 00:00:00', 6, 60, '天津王顶堤双安防护用品科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B35', 'B', '35', 7, '绝缘靴', '10kV', '梁村所#01', '绝缘安全工器具', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 6, 60, '天津王顶堤双安防护用品科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B36', 'B', '36', 7, '绝缘靴', '0.4kV', '梁村所#05', '绝缘安全工器具', '2014-12-1 00:00:00', '2014-12-15 00:00:00', 6, 60, '天津王顶堤双安防护用品科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B37', 'B', '37', 7, '绝缘靴', '10kV', '梁村所#02', '绝缘安全工器具', '2013-9-1 00:00:00', '2013-10-1 00:00:00', 6, 60, '天津王顶堤双安防护用品科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B38', 'B', '38', 2, '绝缘手套', '10kV', '梁村所#03', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 6, 60, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B39', 'B', '39', 2, '绝缘手套', '10kV', '梁村所#07', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-3-15 00:00:00', 6, 24, 'Hongywell');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B40', 'B', '40', 2, '绝缘手套', '10kV', '梁村所#04', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 6, 60, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B41', 'B', '41', 2, '绝缘手套', '10kV', '梁村所#06', '绝缘安全工器具', '2014-12-1 00:00:00', '2014-12-31 00:00:00', 6, 60, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B42', 'B', '42', 2, '绝缘手套', '10kV', '梁村所#05', '绝缘安全工器具', '2014-12-1 00:00:00', '2014-12-31 00:00:00', 6, 60, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B43', 'B', '43', 5, '声光验电器', '0.4kV', '梁村所#44', '绝缘安全工器具', '2016-11-1 00:00:00', '2016-11-30 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B44', 'B', '44', 5, '声光验电器', '0.4kV', '梁村所#42', '绝缘安全工器具', '2013-9-1 00:00:00', '2013-10-1 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B45', 'B', '45', 5, '声光验电器', '0.4kV', '梁村所#41', '绝缘安全工器具', '2016-11-1 00:00:00', '2016-11-30 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B46', 'B', '46', 5, '声光验电器', '10kV', '梁村所#01', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 36, '河北信得利电器设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B47', 'B', '47', 5, '声光验电器', '0.4kV', '梁村所#45', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'B48', 'B', '48', 5, '声光验电器', '0.4kV', '梁村所#43', '绝缘安全工器具', '2016-11-1 00:00:00', '2016-11-30 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A2', 'A', '2', 22, '安全警示带', '50米', '梁村所#1-#2', '安全围栏', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 240, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A4', 'A', '4', 17, '操作袍', 'FDH-D', '梁村所#1', '个人安全防护用品', '2013-8-1 00:00:00', '2013-8-30 00:00:00', 240, 240, '圣欧同安防护用品开发有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A7', 'A', '7', 17, '操作袍', 'FDH-D', '梁村所#2', '个人安全防护用品', '2013-8-1 00:00:00', '2013-8-30 00:00:00', 240, 240, '圣欧同安防护用品开发有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A9', 'A', '9', 22, '安全警示带', '50米', '梁村所#3-#4', '安全围栏', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 240, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A10', 'A', '10', 22, '安全警示带', '50米', '梁村所#3', '安全围栏', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 240, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A11', 'A', '11', 22, '安全围栏', '10米', '梁村所#2', '一般安全工器具', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 240, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A13', 'A', '13', 3, '安全带', '肩背式', '梁村所#12', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A14', 'A', '14', 22, '反光衣', '普通型', '梁村所#1-#4', '个人安全防护用品', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 240, 240, '不详');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A15', 'A', '15', 22, '安全围栏', '10米', '梁村所#1', '一般安全工器具', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 240, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A16', 'A', '16', 8, '脚扣', 'JK-T400', '梁村所#12', '一般安全工器具', '2017-8-1 00:00:00', '2017-8-30 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A17', 'A', '17', 3, '安全带', '肩背式', '梁村所#14', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A18', 'A', '18', 3, '安全带', '肩背式', '梁村所#13', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A19', 'A', '19', 3, '安全带', '腰间式', '梁村所#11', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A20', 'A', '20', 13, '防护眼镜', '普通型L', '梁村所#1-#5', '个人安全防护用品', '2011-9-1 00:00:00', '2011-10-1 00:00:00', 240, 240, 'Honeywell');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A21', 'A', '21', 3, '安全带', '腰间式', '梁村所#10', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A22', 'A', '22', 3, '安全带', '腰间式', '梁村所#9', '个人安全防护用品', '2014-4-1 00:00:00', '2014-4-10 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A23', 'A', '23', 3, '安全带', '肩背式', '梁村所#7', '个人安全防护用品', '2017-8-1 00:00:00', '2017-8-30 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A24', 'A', '24', 3, '安全带', '肩背式', '梁村所#6', '个人安全防护用品', '2017-8-1 00:00:00', '2017-8-30 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A25', 'A', '25', 3, '安全带', '肩背式', '梁村所#8', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A26', 'A', '26', 8, '脚扣', 'JK-T400', '梁村所#7', '一般安全工器具', '2014-1-1 00:00:00', '2014-9-1 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A27', 'A', '27', 8, '脚扣', 'JK-T400', '梁村所#8', '一般安全工器具', '2014-1-1 00:00:00', '2014-9-1 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A28', 'A', '28', 8, '脚扣', 'JK-T400', '梁村所#9', '一般安全工器具', '2014-1-1 00:00:00', '2014-9-1 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A29', 'A', '29', 3, '安全带', '肩背式', '梁村所#1', '个人安全防护用品', '2017-8-1 00:00:00', '2017-8-15 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A30', 'A', '30', 8, '脚扣', 'JK-T400', '梁村所#10', '一般安全工器具', '2014-1-1 00:00:00', '2014-9-1 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A31', 'A', '31', 3, '安全带', '腰间式', '梁村所#4', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A32', 'A', '32', 3, '安全带', '腰间式', '梁村所#2', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A33', 'A', '33', 3, '安全带', '腰间式', '梁村所#5', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A34', 'A', '34', 3, '安全带', '腰间式', '梁村所#3', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 60, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A35', 'A', '35', 8, '脚扣', 'JK-T400', '梁村所#11', '一般安全工器具', '2017-8-1 00:00:00', '2017-8-30 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A36', 'A', '36', 8, '脚扣', 'JK-T300', '梁村所#3', '一般安全工器具', '2009-1-1 00:00:00', '2009-2-1 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A37', 'A', '37', 8, '脚扣', 'JK-T300', '梁村所#4', '一般安全工器具', '2009-1-1 00:00:00', '2009-2-1 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A38', 'A', '38', 8, '脚扣', 'JK-T300', '梁村所#2', '一般安全工器具', '2009-1-1 00:00:00', '2009-2-1 00:00:00', 12, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A39', 'A', '39', 2, '绝缘手套', '10kV', '梁村所#08', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-3-15 00:00:00', 6, 24, 'Hongywell');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A40', 'A', '40', 2, '绝缘手套', '10kV', '梁村所#09', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-3-15 00:00:00', 6, 24, 'Hongywell');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A41', 'A', '41', 2, '绝缘手套', '0.4kV', '梁村所#41', '绝缘安全工器具', '2017-8-1 00:00:00', '2017-8-15 00:00:00', 6, 60, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A42', 'A', '42', 2, '绝缘手套', '0.4kV', '梁村所#42', '绝缘安全工器具', '2017-8-1 00:00:00', '2017-8-15 00:00:00', 6, 60, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A43', 'A', '43', 4, '个人保安线', '10kV', '梁村所#01', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 240, '河北信得利电器设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A44', 'A', '44', 2, '绝缘手套', '0.4kV', '梁村所#43', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 6, 24, '天津双安劳保橡胶有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A45', 'A', '45', 4, '接地线', '0.4kV', '梁村所#45', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 60, 240, '河北信得利电器设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A47', 'A', '47', 4, '个人保安线', '10kV', '梁村所#02', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 240, '河北信得利电器设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'A48', 'A', '48', 22, '数字万用表', '15B', '梁村所#01', '机具仪表类', '2015-6-1 00:00:00', '2017-6-25 00:00:00', 12, 120, 'KLUKE');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C1', 'C', '1', 6, '绝缘操作棒', '10kC', '梁村所#08', '绝缘安全工器具', '2015-11-1 00:00:00', '2016-3-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C2', 'C', '2', 6, '绝缘操作棒', '10kV', '梁村所#09', '绝缘安全工器具', '2016-11-1 00:00:00', '2016-12-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C3', 'C', '3', 6, '绝缘操作棒', '10kV', '梁村所#01', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-4-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C4', 'C', '4', 6, '绝缘操作棒', '10kV', '梁村所#02', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-4-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C5', 'C', '5', 6, '绝缘操作棒', '10kV', '梁村所#06', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-4-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C6', 'C', '6', 6, '绝缘操作棒', '10kV', '梁村所#07', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-4-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C7', 'C', '7', 6, '绝缘操作棒', '10kV', '梁村所#07', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-4-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C8', 'C', '8', 6, '绝缘操作棒', '10kV', '梁村所#10', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-4-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C9', 'C', '9', 6, '绝缘操作棒', '10kV', '梁村所#05', '绝缘安全工器具', '2014-7-1 00:00:00', '2014-9-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C10', 'C', '10', 4, '接地线', '10kV', '梁村所#03', '绝缘安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C11', 'C', '11', 4, '接地线', '10kV', '梁村所#04', '绝缘安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C12', 'C', '12', 6, '绝缘操作棒', '10kV', '梁村所#03', '绝缘安全工器具', '2013-3-1 00:00:00', '2013-12-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C13', 'C', '13', 4, '接地线', '10kV', '梁村所#08', '绝缘安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C14', 'C', '14', 6, '绝缘操作棒', '10kV', '梁村所#04', '绝缘安全工器具', '2013-3-1 00:00:00', '2013-12-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C15', 'C', '15', 4, '接地线', '10kV', '梁村所#02', '绝缘安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C16', 'C', '16', 4, '接地线', '10kV', '梁村所#01', '绝缘安全工器具', '2011-7-1 00:00:00', '2011-9-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C17', 'C', '17', 4, '接地线', '10kV', '梁村所#06', '绝缘安全工器具', '2014-6-1 00:00:00', '2014-9-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C18', 'C', '18', 4, '接地线', '10kV', '梁村所#05', '绝缘安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C19', 'C', '19', 22, '卡线钳', 'LGJ95-120', '梁村所#01', '机具仪表类', '2017-6-4 00:00:00', '2017-7-4 00:00:00', 12, 120, '扬州毕益电力机具有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C20', 'C', '20', 6, '绝缘操作棒', '10kV', '梁村所#09', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-4-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C21', 'C', '21', 22, '卡线钳', 'LGJ95-120', '梁村所#02', '机具仪表类', '2017-6-4 00:00:00', '2017-7-4 00:00:00', 12, 120, '扬州毕益电力机具有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C22', 'C', '22', 22, '卡线钳', 'LGJ95-120', '梁村所#04', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '浙江象山金星电力机具厂');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C23', 'C', '23', 22, '卡线钳', 'LGJ120-150', '梁村所#03', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '浙江象山金星电力机具厂');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C24', 'C', '24', 22, '紧线器', '0.5T', '梁村所#02', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '帮强');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C25', 'C', '25', 22, '手拉葫芦', 'HXZ2', '梁村所#01', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '广州广鸽起重设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C26', 'C', '26', 22, '手拉葫芦', 'HXZ2', '梁村所#02', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '广州广鸽起重设备有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C27', 'C', '27', 22, '紧线器', '0.5T', '梁村所#01', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 12, 120, '帮强');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C28', 'C', '28', 22, '手提磨砂机', 'TWS6600', '梁村所#01', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '博世包装技术（成都）有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C29', 'C', '29', 22, '手提磨砂机', 'TWS6600', '梁村所#02', '机具仪表类', '2014-11-1 00:00:00', '2014-12-10 00:00:00', 120, 120, '博世包装技术（成都）有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C30', 'C', '30', 22, '强光灯', 'RJW7102A/LT', '梁村所#1', '机具仪表', '2017-8-1 00:00:00', '2017-9-1 00:00:00', 120, 240, '海洋王照明科技股份有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C31', 'C', '31', 22, '强光灯', 'RJW7102A/LT', '梁村所#2', '机具仪表', '2017-8-1 00:00:00', '2017-9-1 00:00:00', 120, 240, '海洋王照明科技股份有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C32', 'C', '32', 22, '强光灯', 'RJW7102A/LT', '梁村所#3', '机具仪表', '2017-8-1 00:00:00', '2017-9-1 00:00:00', 120, 240, '海洋王照明科技股份有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C33', 'C', '33', 22, '数字接地电阻测量仪', 'KEW 4105A', '梁村所#2', '机具仪表', '2017-9-1 00:00:00', '2017-10-1 00:00:00', 12, 240, 'KYORITSU');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C34', 'C', '34', 22, '数字接地电阻测量仪', 'KEW 4105A', '梁村所#1', '机具仪表', '2017-9-1 00:00:00', '2017-10-1 00:00:00', 12, 240, 'KYORITSU');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C35', 'C', '35', 22, '接地电阻表', '机械', '梁村所#02', '机具仪表类', '2015-6-2 00:00:00', '2017-6-25 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C36', 'C', '36', 22, '兆欧表', '机械', '梁村所#02', '机具仪表类', '2015-6-2 00:00:00', '2017-6-25 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C37', 'C', '37', 22, '兆欧表', '机械', '梁村所#01', '机具仪表类', '2015-6-2 00:00:00', '2017-6-25 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C38', 'C', '38', 22, '冲击钻', 'GBH2000DRE', '梁村所#1', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 120, 240, '博世电动工具（中国）有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C39', 'C', '39', 22, '电缆剪', 'XLG-720-J13', '梁村所#3', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 120, 240, '长信');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C40', 'C', '40', 22, '冲击钻', 'METBOSBE760', '梁村所#2', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 120, 240, 'metabo');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C41', 'C', '41', 22, '万用电表', 'MF-47', '梁村所#01', '机具仪表类', '2017-6-1 00:00:00', '2017-6-25 00:00:00', 24, 120, '南京科华仪器表有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C42', 'C', '42', 22, '电缆剪', 'J30', '梁村所#2', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 120, 240, 'CUTTER-LIU');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C43', 'C', '43', 22, '电缆剪', 'J30', '梁村所#1', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 120, 240, 'CUTTER-LIU');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C44', 'C', '44', 22, '数显卡尺#2', 'NS2001', '梁村所数显卡尺#2', '机具仪表', '2014-11-1 00:00:00', '2014-12-1 00:00:00', 12, 240, '不详');
-- INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C45', 'C', '45', 22, '数字万用表', '15B', '梁村所#02', '机具仪表类', '2015-6-1 00:00:00', '2017-6-25 00:00:00', 12, 120, 'KLUKE');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C45', 'C', '45', 22, '数字万用表#2', '机械', '梁村所数字万用表#2', '机具仪表类', '2015-6-2 00:00:00', '2017-6-25 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C46', 'C', '46', 22, '数字相序电压表#1', '相序电压型', '梁村所数字相序电压表#1', '机具仪表类', '2015-6-2 00:00:00', '2017-6-25 00:00:00', 12, 120, '珠海伊万电子科技有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C47', 'C', '47', 22, '万用电表', 'MF-47', '梁村所#02', '机具仪表类', '2017-6-1 00:00:00', '2017-6-25 00:00:00', 24, 120, '南京科华仪器表有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (2, 'C48', 'C', '48', 22, '数字万用表', '15B', '梁村所#01', '机具仪表类', '2015-6-1 00:00:00', '2017-6-25 00:00:00', 12, 120, 'KLUKE');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A1', 'A', '1', 3, '安全带', '腰带式双保险', '诗洞所#02', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 36, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A2', 'A', '2', 5, '交流声光验电器', '10kV-YQD-2', '诗洞所#04', '绝缘安全工器具', '2015-11-5 00:00:00', '2015-12-1 00:00:00', 12, 60, '河北信得利有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A4', 'A', '4', 5, '交流声光验电器', '10kV-YQD-2', '诗洞所#03', '绝缘安全工器具', '2015-11-5 00:00:00', '2015-12-1 00:00:00', 12, 60, '河北信得利有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A5', 'A', '5', 3, '双背式双保险', 'DWY', '诗洞所#6', '个人安全防护用品', '2016-1-1 00:00:00', '2016-11-1 00:00:00', 12, 36, '河北沈三开电气有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A6', 'A', '6', 5, '交流声光验电器', '10kV-YQD-2', '诗洞所#01', '绝缘安全工器具', '2017-11-1 00:00:00', '2017-12-2 00:00:00', 12, 60, '河北信得利有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A7', 'A', '7', 5, '交流声光验电器', '10kV-YQD-2', '诗洞所#02', '绝缘安全工器具', '2015-11-5 00:00:00', '2015-12-1 00:00:00', 12, 60, '河北信得利有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A8', 'A', '8', 4, '接地线', 'DYB(0.4kV)', '诗洞所#41', '绝缘安全工器具', '2005-8-10 00:00:00', '2005-11-10 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
-- INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A10', 'A', '10', 3, '安全带', '双背式双保险', '诗洞所#04', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 36, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A10', 'A', '10', 3, '双背式双保险安全带', 'DWY', '诗洞所#05', '个人安全防护用品', '2014-8-1 00:00:00', '2014-9-1 00:00:00', 12, 36, '河北沈三开电器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A11', 'A', '11', 4, '个人保安线', 'HW-1（10kV）', '诗洞所#01', '个人安全防护用品', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 60, '河北信得利电器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A12', 'A', '12', 3, '安全带', '腰带式双保险', '诗洞所#01', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 36, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A13', 'A', '13', 4, '接地线', 'DYB(0.4kV)', '诗洞所#42', '绝缘安全工器具', '2011-9-2 00:00:00', '2011-11-2 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A14', 'A', '14', 4, '接地线', 'DYB(0.4kV)', '诗洞所#43', '绝缘安全工器具', '2011-9-1 00:00:00', '2011-11-18 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A15', 'A', '15', 4, '接地线', 'DYB(0.4kV)', '诗洞所#44', '绝缘安全工器具', '2013-10-1 00:00:00', '2014-9-18 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A16', 'A', '16', 8, '脚扣', 'JK-T350', '诗洞所#02', '一般安全工器具', '2015-11-1 00:00:00', '2015-11-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A17', 'A', '17', 4, '个人保安线', 'HW-1（10kV）', '诗洞所#02', '个人安全防护用品', '2017-11-1 00:00:00', '2017-12-1 00:00:00', 12, 60, '河北信得利电器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A18', 'A', '18', 3, '安全带', '双背式双保险', '诗洞所#10', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 36, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A19', 'A', '19', 8, '脚扣', 'JK-T300', '诗洞所#01', '一般安全工器具', '2015-11-1 00:00:00', '2015-11-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A21', 'A', '21', 8, '脚扣', 'JK-T300', '诗洞所#04', '一般安全工器具', '2011-10-1 00:00:00', '2011-10-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A22', 'A', '22', 8, '脚扣', 'JK-T300', '诗洞所#10', '一般安全工器具', '2017-8-1 00:00:00', '2017-9-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A23', 'A', '23', 2, '绝缘手套', '10kV', '诗洞所#04', '个人安全防护用品', '2018-4-1 00:00:00', '2018-5-1 00:00:00', 6, 36, '天津双安防护用品公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A24', 'A', '24', 2, '绝缘手套', '10kV', '诗洞所#03', '绝缘安全工器具', '2016-9-5 00:00:00', '2016-11-2 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A25', 'A', '25', 8, '脚扣', 'JK-T300', '诗洞所#03', '一般安全工器具', '2011-10-1 00:00:00', '2011-10-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A26', 'A', '26', 2, '绝缘手套', '10kV', '诗洞所#02', '绝缘安全工器具', '2016-9-5 00:00:00', '2016-11-1 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A27', 'A', '27', 8, '脚扣', 'JK-T300', '诗洞所#08', '一般安全工器具', '2016-12-1 00:00:00', '2016-12-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A28', 'A', '28', 2, '绝缘手套', '10kV', '诗洞所#06', '绝缘安全工器具', '2016-9-5 00:00:00', '2016-11-1 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A30', 'A', '30', 2, '绝缘手套', '10kV', '诗洞所#05', '绝缘安全工器具', '2014-8-1 00:00:00', '2014-9-2 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A31', 'A', '31', 8, '脚扣', 'JK-T300', '诗洞所#09', '一般安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A35', 'A', '35', 7, '绝缘靴', '25kV', '诗洞所#05', '绝缘安全工器具', '2014-8-1 00:00:00', '2014-9-2 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A36', 'A', '36', 7, '绝缘靴', '25kV', '诗洞所#02', '绝缘安全工器具', '2016-8-29 00:00:00', '2016-11-1 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A38', 'A', '38', 3, '安全带', '双背式双保险', '诗洞所#11', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 36, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A39', 'A', '39', 7, '绝缘靴', '25kV', '诗洞所#01', '绝缘安全工器具', '2016-8-29 00:00:00', '2016-11-1 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A40', 'A', '40', 7, '绝缘靴', '25kV', '诗洞所#04', '绝缘安全工器具', '2014-8-1 00:00:00', '2014-9-2 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A42', 'A', '42', 3, '双保险安全带', 'DWY', '诗洞所#9', '个人安全防护用品', '2016-1-1 00:00:00', '2016-11-1 00:00:00', 12, 36, '河北沈三开电器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A43', 'A', '43', 7, '绝缘靴', '25kV', '诗洞所#03', '绝缘安全工器具', '2016-8-29 00:00:00', '2016-11-1 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'A44', 'A', '44', 7, '绝缘靴', '25kV', '诗洞所#06', '绝缘安全工器具', '2016-8-29 00:00:00', '2016-11-1 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B1', 'B', '1', 22, '钳型表', 'NS1201', 'ZQHJ-SD-CS-008', '测试设备', '2014-3-2 00:00:00', '2014-3-10 00:00:00', 12, 120, '安徽世福仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B2', 'B', '2', 22, '测距仪', 'LR600', 'ZQHJ-SD-CS-011', '测试设备', '2016-7-1 00:00:00', '2016-11-2 00:00:00', 12, 120, '优利德科技（中国）有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B3', 'B', '3', 22, '接地电阻表', 'ZC-11D', 'ZQHJ-SD-CS-013', '测试设备', '2014-4-1 00:00:00', '2014-6-2 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B4', 'B', '4', 22, '测距仪', 'LR600', 'ZQHJ-SD-CS-009', '测试设备', '2016-7-1 00:00:00', '2016-11-2 00:00:00', 12, 120, '优利德科技（中国）有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B5', 'B', '5', 22, '接地电阻表', 'ZC11D-10', 'ZQHJ-SD-CS-014', '测试设备', '2014-4-1 00:00:00', '2014-6-2 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B6', 'B', '6', 22, '测距仪', 'LR600', 'ZQHJ-SD-CS-010', '测试设备', '2016-7-1 00:00:00', '2016-11-2 00:00:00', 12, 120, '优利德科技（中国）有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B7', 'B', '7', 22, '钳型表', 'FLUKE-312', 'ZQHJ-SD-CS-006', '测试设备', '2014-3-2 00:00:00', '2014-3-10 00:00:00', 12, 120, '安徽世福仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B8', 'B', '8', 22, '相序电压表', 'TG3B', 'ZQHJ-SD-CS-012', '测试设备', '2016-7-1 00:00:00', '2016-11-1 00:00:00', 12, 120, '中国柳市陈秀莲仪器厂');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B9', 'B', '9', 22, '手持红外线测温仪', 'F-59', 'ZQHJ-SD-CS-002', '测试设备', '2014-4-14 00:00:00', '2014-4-15 00:00:00', 12, 120, '上海世禄仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B10', 'B', '10', 22, '手持红外线测温仪', 'F-59', 'ZQHJ-SD-CS-001', '测试设备', '2014-4-14 00:00:00', '2014-4-15 00:00:00', 12, 120, '上海世禄仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B11', 'B', '11', 22, '钳型表', 'NS1200', 'ZQHJ-SD-CS-007', '测试设备', '2014-3-2 00:00:00', '2014-3-10 00:00:00', 12, 120, '安徽世福仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B12', 'B', '12', 22, '手持红外测温仪', 'FLUKE', 'ZQHJ-SD-CS-003', '测试设备', '2016-8-1 00:00:00', '2017-1-1 00:00:00', 12, 120, '上海世禄仪器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B13', 'B', '13', 22, '望远镜', 'NIKON', 'ZQHJ-SD-CS-004', '望远镜', '2016-8-1 00:00:00', '2017-1-1 00:00:00', 12, 120, '日本');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B14', 'B', '14', 22, '望远镜', 'tasco', 'ZQHJ-SD-CS-005', '望远镜', '2016-8-1 00:00:00', '2017-1-1 00:00:00', 12, 120, '日本');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B15', 'B', '15', 22, '单相电能表校验仪', 'PEC-HA', 'ZQHJ-SD-CS-020', '测试设备', '2014-4-14 00:00:00', '2014-4-15 00:00:00', 12, 120, '-');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B16', 'B', '16', 22, '接地电阻表', 'ZC-8', 'ZQHJ-SD-CS-015', '测试设备', '2014-4-1 00:00:00', '2014-6-2 00:00:00', 12, 120, '南京金川电表制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B17', 'B', '17', 22, '绝缘电阻测试仪（电子智能）', 'MOEN-6545', 'ZQHJ-SD-CS-017', '测试设备', '2018-7-1 00:00:00', '2018-9-1 00:00:00', 12, 120, '武汉摩恩智能电器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B18', 'B', '18', 22, '接地电阻测试仪', '4105B', 'ZQHJ-SD-CS-018', '测试设备', '2016-6-27 00:00:00', '2017-9-1 00:00:00', 12, 120, '日本共立');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B19', 'B', '19', 22, '绝缘电阻测试仪（电子智能）', 'MOEN-6545', 'ZQHJ-SD-CS-016', '测试设备', '2018-7-1 00:00:00', '2018-9-1 00:00:00', 12, 120, '武汉摩恩智能电器有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B20', 'B', '20', 22, '红外热像仪', 'HM-200/300', 'ZQHJ-SD-CS-021', '测试设备', '2012-8-7 00:00:00', '2014-4-15 00:00:00', 12, 120, '广州特红外股份有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B22', 'B', '22', 22, '接地电阻测试仪', '4105B', 'ZQHJ-SD-CS-019', '测试设备', '2016-6-27 00:00:00', '2016-9-1 00:00:00', 12, 120, '日本共立');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B25', 'B', '25', 22, '配电网单相接地故障定位装置', 'DXJ-IVZ', 'ZQHJ-SD-CS-022', '测试设备', '2018-5-1 00:00:00', '2018-7-1 00:00:00', 12, 120, '浙江科畅电子股份有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B30', 'B', '30', 4, '接地线', 'HW-1(10kV)', '诗洞所#03', '绝缘安全工器具', '2011-8-10 00:00:00', '2011-11-10 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B32', 'B', '32', 4, '接地线', 'HW-1(10kV)', '诗洞所#06', '绝缘安全工器具', '2017-7-10 00:00:00', '2004-11-10 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B33', 'B', '33', 4, '接地线', 'HW-1(10kV)', '诗洞所#01', '绝缘安全工器具', '2006-9-1 00:00:00', '2006-11-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B35', 'B', '35', 4, '接地线', 'HW-1(10kV)', '诗洞所#05', '绝缘安全工器具', '2014-6-10 00:00:00', '2014-9-10 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B36', 'B', '36', 4, '接地线', 'HW-1(10kV)', '诗洞所#02', '绝缘安全工器具', '2006-9-1 00:00:00', '2006-11-1 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B37', 'B', '37', 6, '绝缘操作棒', 'JYB-1(10kV)', '诗洞所#04', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-5-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B39', 'B', '39', 4, '接地线', 'HW-1(10kV)', '诗洞所#04', '绝缘安全工器具', '2011-8-10 00:00:00', '2011-11-10 00:00:00', 60, 240, '河北沈三开电器制造有限公司');
-- INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B44', 'B', '44', 6, '绝缘操作棒', 'JYB-1(10kV)', '诗洞所#03', '绝缘安全工器具', '2017-8-1 00:00:00', '2017-9-7 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B44', 'B', '44', 6, '绝缘操作棒', 'JYB-1', '诗洞所#03', '绝缘安全工器具', '2017-8-1 00:00:00', '2018-1-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B45', 'B', '45', 6, '绝缘操作棒', 'JYB-1(10kV)', '诗洞所#02', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-5-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'B46', 'B', '46', 6, '绝缘操作棒', 'JYB-1(10kV)', '诗洞所#01', '绝缘安全工器具', '2018-3-1 00:00:00', '2018-5-1 00:00:00', 12, 120, '河北安电电力器材有限公司');
-- INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C01', 'C', '01', 5, '声光验电器', '0.4kV', '诗洞所#43', '绝缘安全工器具', '2011-11-12 00:00:00', '2012-4-2 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C1', 'C', '1', 2, '绝缘手套', '0.4kV', '诗洞所#43', '绝缘安全工器具', '2017-10-5 00:00:00', '2017-12-18 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C3', 'C', '3', 2, '绝缘手套', '10kV', '诗洞所#07', '绝缘安全工器具', '2016-9-5 00:00:00', '2016-11-1 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C4', 'C', '4', 5, '声光验电器', '0.4kV', '诗洞所#41', '绝缘安全工器具', '2011-11-12 00:00:00', '2011-12-13 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C5', 'C', '5', 2, '绝缘手套', '0.4kV', '诗洞所#41', '绝缘安全工器具', '2017-10-5 00:00:00', '2017-12-18 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C6', 'C', '6', 5, '声光验电器', '0.4kV', '诗洞所#44', '绝缘安全工器具', '2015-11-5 00:00:00', '2015-12-1 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C7', 'C', '7', 2, '绝缘手套', '10kV（进口）', '诗洞所#08', '绝缘安全工器具', '2016-10-16 00:00:00', '2016-11-1 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C8', 'C', '8', 2, '绝缘手套', '10KV', '诗洞所#09', '个人安全防护用品', '2017-12-1 00:00:00', '2018-5-1 00:00:00', 6, 36, '天津双安防护用品公司');
-- INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C27', 'C', '27', 5, '声光验电器', '0.4kV', '诗洞所#42', '绝缘安全工器具', '2011-11-12 00:00:00', '2012-4-1 00:00:00', 12, 60, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C27', 'C', '27', 2, '绝缘手套', '0.4kV', '诗洞所#42', '绝缘安全工器具', '2015-11-5 00:00:00', '2015-12-5 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C29', 'C', '29', 3, '安全带', '腰带式双保险', '诗洞所#03', '个人安全防护用品', '2016-10-1 00:00:00', '2016-11-1 00:00:00', 12, 36, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C30', 'C', '30', 8, '脚扣', 'JK-T350', '诗洞所#06', '一般安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C31', 'C', '31', 2, '绝缘手套', '10kV', '诗洞所#01', '绝缘安全工器具', '2018-4-5 00:00:00', '2018-5-18 00:00:00', 6, 36, '天津双安防护用品有限公司');
INSERT INTO public.tool(station_id, "position", board_num, port_num, class_id, name, model, number, subject, manufacture_time, purchase_time, test_cycle, life_cycle, vendor) VALUES (3, 'C32', 'C', '32', 8, '脚扣', 'JK-T350', '诗洞所#05', '一般安全工器具', '2009-1-1 00:00:00', '2009-1-1 00:00:00', 12, 120, '河北沈三开电器制造有限公司');
SELECT setval('public.tool_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.tool), 1), false);

--
-- function to query tool operations
--
CREATE OR REPLACE FUNCTION public.get_tool_operation(my_station_id bigint)
RETURNS TABLE (id bigint
              , tool_name VARCHAR
              , tool_number VARCHAR
              , tool_position VARCHAR
              , tool_class_name VARCHAR
              , tool_operation_type VARCHAR
              , tool_operation_time timestamp with time zone
              , tool_operation_user_name VARCHAR) AS
$MYBODY$
BEGIN
RETURN QUERY select T.id, T.name as tool_name, T.number as tool_number, T.position, C.name as tool_class_name, O.operation_type, O.operation_time, U.email as operate_user_name from public.tool as T, public.operate_tool as O, public.user_impl as U, public.tool_class as C where T.id=O.tool_id and O.user_id=U.id and T.class_id=C.id and O.station_id=my_station_id and T.station_id=my_station_id;
END;
$MYBODY$ LANGUAGE plpgsql IMMUTABLE;

--
-- function to query tool operations within history table
--
CREATE OR REPLACE FUNCTION public.get_tool_operation_history(my_station_id bigint)
RETURNS TABLE (id bigint
, tool_name VARCHAR
, tool_number VARCHAR
, tool_position VARCHAR
, tool_class_name VARCHAR
, tool_operation_type VARCHAR
, tool_operation_time timestamp with time zone
, tool_operation_user_name VARCHAR) AS
$MYBODY$
BEGIN
RETURN QUERY select T.id, T.name as tool_name, T.number as tool_number, T.position, C.name as tool_class_name, O.operation_type, O.operation_time, U.email as operate_user_name from public.tool as T, public.operate_tool_history as O, public.user_impl as U, public.tool_class as C where T.id=O.tool_id and O.user_id=U.id and T.class_id=C.id and O.station_id=my_station_id and T.station_id=my_station_id;
END;
$MYBODY$ LANGUAGE plpgsql IMMUTABLE;

--
-- function to query task with the user name
--
CREATE OR REPLACE FUNCTION public.get_task_with_user_name_by_status(my_station_id bigint, my_work_type_list text[], my_task_status text)
RETURNS TABLE (id bigint
, station_id bigint
, team_id bigint
, user_id bigint
, type_id bigint
, ticket_num character varying
, status character varying
, created_at timestamp with time zone
, updated_at timestamp with time zone
, user_name varchar) AS
$MYBODY$
BEGIN
RETURN QUERY select T.id, T.station_id, T.team_id, T.user_id, T.type_id, T.ticket_num, T.status, T.created_at, T.updated_at, U.email as user_name from public.task as T, public.user_impl as U, public.work_type as W where T.station_id=my_station_id and T.status=my_task_status and T.user_id=U.id and T.type_id=W.id and W.name=ANY(my_work_type_list);
END;
$MYBODY$ LANGUAGE plpgsql IMMUTABLE;
