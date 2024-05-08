--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.11 (Homebrew)

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
-- Name: Event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Event" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    organization text NOT NULL,
    "isFinished" boolean NOT NULL,
    "fightsNumber" integer NOT NULL,
    "needsUpdate" boolean DEFAULT true NOT NULL,
    city text,
    country text,
    "titleCategory" text
);


ALTER TABLE public."Event" OWNER TO postgres;

--
-- Name: Fight; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fight" (
    id text NOT NULL,
    "eventId" text NOT NULL,
    "winnerId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    type text,
    weight text,
    description text,
    "titleShot" boolean NOT NULL,
    stats jsonb,
    "matchNumber" integer
);


ALTER TABLE public."Fight" OWNER TO postgres;

--
-- Name: Fighter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fighter" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL,
    "shortName" text,
    "firstName" text,
    "lastName" text,
    nickname text,
    age integer,
    height integer,
    weight integer,
    reach integer,
    record text,
    flag text,
    stats jsonb,
    color jsonb,
    images jsonb
);


ALTER TABLE public."Fighter" OWNER TO postgres;

--
-- Name: FightsOnFighters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FightsOnFighters" (
    id text NOT NULL,
    "fightId" text NOT NULL,
    "fighterId" text NOT NULL
);


ALTER TABLE public."FightsOnFighters" OWNER TO postgres;

--
-- Name: Odd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Odd" (
    id text NOT NULL,
    "fightId" text NOT NULL,
    "fighterId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    provider text NOT NULL,
    priority integer NOT NULL,
    favorite boolean NOT NULL,
    value double precision NOT NULL
);


ALTER TABLE public."Odd" OWNER TO postgres;

--
-- Data for Name: Event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Event" (id, "createdAt", "updatedAt", title, description, date, organization, "isFinished", "fightsNumber", "needsUpdate", city, country, "titleCategory") FROM stdin;
600040474	2024-05-08 00:52:30.502	2024-01-13 01:51:00	ONE Fight Night 18	Gasanov vs. Oh	2024-01-13 04:00:00	ofc	t	4	f	Bangkok	Thailand	\N
600042033	2024-05-08 00:52:30.502	2024-01-14 14:39:00	LFA 174	Jones vs. Gennrich	2024-01-13 05:00:00	lfa	t	2	f	Prior Lake	USA	\N
600039893	2024-05-08 00:52:30.502	2024-01-14 01:45:00	UFC Fight Night	Ankalaev vs. Walker 2	2024-01-14 00:00:00	ufc	t	11	f	Las Vegas	USA	Light Heavyweight
600043154	2024-05-08 00:52:30.502	2024-02-21 21:47:00	KSW 90	Wrzosek vs. Vitasović	2024-01-20 21:00:00	ksw	t	4	f	\N	\N	\N
600039713	2024-05-08 00:52:30.502	2024-02-27 14:24:00	UFC 297	Strickland vs. Du Plessis	2024-01-21 02:30:00	ufc	t	12	f	Toronto	USA	Middleweight
600042493	2024-05-08 00:52:30.502	2024-01-29 19:17:00	LFA 175	Lopes vs. Brigagão	2024-01-28 04:00:00	lfa	t	2	f	Sao Paulo	\N	\N
600040313	2024-05-08 00:52:30.502	2024-01-28 11:19:00	ONE 165	Superlek vs. Takeru	2024-01-28 11:00:00	ofc	t	6	f	Tokyo	\N	\N
600040373	2024-05-08 00:52:30.502	2024-04-11 16:54:00	UFC Fight Night	Dolidze vs. Imavov	2024-02-04 00:00:00	ufc	t	13	f	Las Vegas	USA	Middleweight
600043153	2024-05-08 00:52:30.502	2024-02-21 21:39:00	LFA 176	Johns vs. Walker	2024-02-10 06:00:00	lfa	t	3	f	Phoenix	USA	\N
600040033	2024-05-08 00:52:30.502	2024-02-11 00:40:00	UFC Fight Night	Hermansson vs. Pyfer	2024-02-11 00:00:00	ufc	t	14	f	Las Vegas	USA	Middleweight
600043133	2024-05-08 00:52:30.502	2024-02-21 20:10:00	ONE Fight Night 19	Haggerty vs. Lobo	2024-02-17 04:00:00	ofc	t	2	f	Bangkok	Thailand	\N
600039753	2024-05-08 00:52:30.502	2024-04-26 18:06:00	UFC 298	Volkanovski vs. Topuria	2024-02-18 02:30:00	ufc	t	12	f	Anaheim	USA	Featherweight
600043273	2024-05-08 00:52:30.502	2024-02-27 23:31:00	CW 166		2024-02-24 05:00:00	cage-warriors	t	3	f	El Cajon	USA	\N
600043693	2024-05-08 00:52:30.502	2024-03-09 18:40:00	LFA 177	Smyth vs. Magomedov	2024-02-24 05:00:00	lfa	t	1	f	Niagara Falls	USA	\N
600043636	2024-05-08 00:52:30.502	2024-03-06 20:19:00	Rizin FF		2024-02-24 08:00:00	rizin	t	3	f	\N	\N	\N
600042093	2024-05-08 00:52:30.502	2024-02-25 21:28:00	PFL Champions vs. Bellator Champions		2024-02-24 20:00:00	pfl	t	10	f	Riyadh	Saudi Arabia	Heavyweight
600041054	2024-05-08 00:52:30.502	2024-02-25 03:36:00	UFC Fight Night	Moreno vs. Royval 2	2024-02-25 03:00:00	ufc	t	12	f	Mexico City	Mexico	Flyweight
600040653	2024-05-08 00:52:30.502	2024-03-01 17:11:00	ONE 166	De Ridder vs. Malykhin 2	2024-03-01 15:30:00	ofc	t	5	f	Lusail	Qatar	Middleweight
600042433	2024-05-08 00:52:30.502	2024-03-02 21:37:00	UFC Fight Night	Rozenstruik vs. Gaziev	2024-03-02 21:30:00	ufc	t	11	f	Las Vegas	USA	Heavyweight
600044034	2024-05-08 00:52:30.502	2024-03-22 01:46:00	ONE Fight Night 20	Todd vs. Phetjeeja	2024-03-09 04:00:00	ofc	t	1	f	Bangkok	Thailand	\N
600043945	2024-05-08 00:52:30.502	2024-03-18 22:10:00	LFA 178	Satybaldiev vs. Assis	2024-03-09 06:00:00	lfa	t	4	f	Santa Cruz	USA	\N
600039754	2024-05-08 00:52:30.502	2024-03-10 04:05:00	UFC 299	O'Malley vs. Vera 2	2024-03-10 02:00:00	ufc	t	14	f	Miami	USA	Bantamweight
600044035	2024-05-08 00:52:30.502	2024-03-22 02:01:00	CW 167		2024-03-15 19:30:00	cage-warriors	t	3	f	Manchester	United Kingdom	\N
600044695	2024-05-08 00:52:30.502	2024-04-09 22:00:00	KSW 92	Wikłacz vs. Jojua	2024-03-16 20:00:00	ksw	t	2	f	\N	\N	\N
600044036	2024-05-08 00:52:30.502	2024-03-22 02:02:00	CW 168		2024-03-16 21:30:00	cage-warriors	t	3	f	Manchester	United Kingdom	\N
600041993	2024-05-08 00:52:30.502	2024-04-11 16:54:00	UFC Fight Night	Tuivasa vs. Tybura	2024-03-16 23:00:00	ufc	t	13	f	Las Vegas	USA	Heavyweight
600042873	2024-05-08 00:52:30.502	2024-03-22 19:52:00	Bellator Champions Series Belfast	Anderson vs. Moore	2024-03-22 20:00:00	bellator	t	10	f	Belfast	Ireland	Light Heavyweight
600044393	2024-05-08 00:52:30.502	2024-03-30 00:27:00	LFA 179	Neto vs. Antunes	2024-03-23 23:00:00	lfa	t	2	f	Rio De Janeiro	Brazil	\N
600041994	2024-05-08 00:52:30.502	2024-03-24 02:40:00	UFC Fight Night	Ribas vs. Namajunas	2024-03-24 02:00:00	ufc	t	13	f	Las Vegas	USA	Women's Flyweight
600044662	2024-05-08 00:52:30.502	2024-04-08 19:41:00	ACA 173	Frolov vs. Yankovskiy	2024-03-29 18:00:00	absolute	t	1	f	\N	\N	\N
600044493	2024-05-08 00:52:30.502	2024-04-02 01:14:00	LFA 180	Lawrence vs. Ward	2024-03-30 04:00:00	lfa	t	2	f	Louisville	USA	\N
600044573	2024-05-08 00:52:30.502	2024-04-06 20:51:00	CW 169		2024-03-30 20:30:00	cage-warriors	t	4	f	London	England	\N
600041055	2024-05-08 00:52:30.502	2024-04-11 16:27:00	UFC Fight Night	Blanchfield vs. Fiorot	2024-03-31 02:00:00	ufc	t	13	f	Atlantic City	USA	Women's Flyweight
600045360	2024-05-08 00:52:30.502	2024-05-04 00:01:00	Pancrase		2024-03-31 07:00:00	pancrase	t	1	f	\N	\N	\N
600043113	2024-05-08 00:52:30.502	2024-04-05 00:59:00	2024 PFL Regular Season		2024-04-05 01:30:00	pfl	t	12	f	San Antonio	USA	Heavyweight
600045143	2024-05-08 00:52:30.502	2024-04-26 20:06:00	LFA 181	Siqueira vs. Hernandez	2024-04-06 04:00:00	lfa	t	3	f	Prior Lake	USA	\N
600044696	2024-05-08 00:52:30.502	2024-04-09 22:00:00	KSW 93	Parnasse vs. Mircea	2024-04-06 20:00:00	ksw	t	3	f	Paris	France	\N
600044613	2024-05-08 00:52:30.502	2024-04-07 16:09:00	CW 170		2024-04-06 20:00:00	cage-warriors	t	3	f	Dublin	Ireland	\N
600041733	2024-05-08 00:52:30.502	2024-04-06 22:23:00	UFC Fight Night	Allen vs. Curtis 2	2024-04-06 22:00:00	ufc	t	12	f	Las Vegas	USA	Middleweight
600043114	2024-05-08 00:52:30.502	2024-04-13 00:13:00	2024 PFL Regular Season		2024-04-13 01:30:00	pfl	t	11	f	Las Vegas	USA	Light Heavyweight
600041053	2024-05-08 00:52:30.502	2024-04-14 03:22:00	UFC 300	Pereira vs. Hill	2024-04-14 01:00:00	ufc	t	13	f	Las Vegas	USA	Light Heavyweight
600043115	2024-05-08 00:52:30.502	2024-04-20 01:18:00	2024 PFL Regular Season		2024-04-20 02:00:00	pfl	t	12	f	Chicago	USA	Welterweight
600045475	2024-05-08 00:52:30.502	2024-05-05 15:18:00	CW 171		2024-04-20 18:30:00	cage-warriors	t	4	f	Glasgow	Scotland	\N
600045193	2024-05-08 00:52:30.502	2024-04-28 14:51:00	LFA 182	McKee vs. Hernandez	2024-04-27 04:00:00	lfa	t	2	f	Sioux Falls	USA	\N
600043333	2024-05-08 00:52:30.502	2024-04-29 12:03:00	UFC Fight Night	Nicolau vs. Perez	2024-04-27 23:00:00	ufc	t	13	f	Las Vegas	USA	Flyweight
600044935	2024-05-08 00:52:30.502	2024-05-04 01:28:00	ONE Fight Night 22	Sundell vs. Diachkova	2024-05-04 03:00:00	ofc	t	3	f	Bangkok	Thailand	\N
600043073	2024-05-08 00:52:30.502	2024-05-05 02:31:00	UFC 301	Pantoja vs. Erceg	2024-05-05 01:00:00	ufc	t	13	f	Rio De Janeiro	Brazil	Flyweight
600043713	2024-05-08 00:52:30.502	2024-05-03 18:44:00	UFC Fight Night	Lewis vs. Nascimento	2024-05-11 23:00:00	ufc	f	13	f	St. Louis	USA	Heavyweight
600043633	2024-05-08 00:52:30.502	2024-04-25 18:24:00	Bellator Champions Series Paris	Mix vs. Magomedov 2	2024-05-17 19:00:00	bellator	f	10	f	Paris	France	Bantamweight
600044353	2024-05-08 00:52:30.502	2024-05-02 22:45:00	UFC Fight Night	Barboza vs. Murphy	2024-05-18 23:00:00	ufc	f	11	f	Las Vegas	USA	Featherweight
600044413	2024-05-08 00:52:30.502	2024-05-05 00:02:00	UFC 302	Makhachev vs. Poirier	2024-06-02 01:00:00	ufc	f	12	f	Newark	USA	Lightweight
600044936	2024-05-08 00:52:30.502	2024-04-19 18:30:00	ONE 167	Stamp vs. Zamboanga	2024-06-08 03:00:00	ofc	f	2	f	Bangkok	Thailand	\N
600044933	2024-05-08 00:52:30.502	2024-04-25 20:18:00	UFC Fight Night		2024-06-09 00:00:00	ufc	f	14	f	Louisville	USA	Bantamweight
600044553	2024-05-08 00:52:30.502	2024-04-22 16:06:00	2024 PFL Regular Season		2024-06-14 00:00:00	pfl	f	12	f	Uncasville	USA	Heavyweight
600044554	2024-05-08 00:52:30.502	2024-04-29 12:08:00	2024 PFL Regular Season		2024-06-22 00:00:00	pfl	f	13	f	Salt Lake City	USA	\N
600044093	2024-05-08 00:52:30.502	2024-04-19 19:27:00	Bellator Champions Series Dublin	Jackson vs. Kuramagomedov	2024-06-22 18:00:00	bellator	f	10	f	Dublin	Ireland	\N
600042393	2024-05-08 00:52:30.502	2024-05-04 23:56:00	UFC Fight Night	Whittaker vs. Chimaev	2024-06-22 19:00:00	ufc	f	6	f	Riyadh	Saudi Arabia	Middleweight
600044555	2024-05-08 00:52:30.502	2024-05-06 20:36:00	2024 PFL Regular Season		2024-06-29 01:00:00	pfl	f	14	f	Sioux Falls	USA	Featherweight
600043173	2024-05-08 00:52:30.502	2024-04-26 17:24:00	UFC 303	McGregor vs. Chandler	2024-06-30 01:00:00	ufc	f	8	f	Las Vegas	USA	Welterweight
600045073	2024-05-08 00:52:30.502	2024-04-24 21:21:00	UFC 304		2024-07-28 01:00:00	ufc	f	3	f	Manchester	United Kingdom	\N
600044937	2024-05-08 00:52:30.502	2024-04-22 17:49:00	2024 PFL Playoffs		2024-08-03 00:30:00	pfl	f	2	f	\N	\N	\N
600043635	2024-05-08 00:52:30.502	2024-05-06 10:38:00	UFC Fight Night	Sandhagen vs. Nurmagomedov	2024-08-03 19:00:00	ufc	f	2	f	Abu Dhabi	United Arab Emirates	Bantamweight
600044938	2024-05-08 00:52:30.502	2024-04-22 17:49:00	2024 PFL Playoffs		2024-08-17 00:30:00	pfl	f	2	f	\N	\N	\N
600044293	2024-05-08 00:52:30.502	2024-03-29 01:12:00	UFC 305		2024-08-18 01:00:00	ufc	f	3	f	Perth	USA	\N
600044939	2024-05-08 00:52:30.502	2024-04-22 17:50:00	2024 PFL Playoffs		2024-08-24 00:30:00	pfl	f	2	f	\N	\N	\N
600044094	2024-05-08 00:52:30.502	2024-03-22 22:48:00	Bellator Champions Series San Diego		2024-09-07 19:00:00	bellator	f	1	f	San Diego	USA	\N
600044095	2024-05-08 00:52:30.502	2024-03-22 22:55:00	Bellator Champions Series London		2024-09-14 19:00:00	bellator	f	1	f	London	England	\N
600039853	2024-05-08 00:52:30.502	2024-02-25 01:08:00	UFC 306		2024-09-15 01:00:00	ufc	f	3	f	Las Vegas	USA	\N
600044096	2024-05-08 00:52:30.502	2024-03-22 22:56:00	Bellator Champions Series Chicago		2024-10-12 19:00:00	bellator	f	1	f	Chicago	USA	\N
600044733	2024-05-08 00:52:30.502	2024-04-25 16:50:00	UFC 308		2024-10-26 17:00:00	ufc	f	2	f	Abu Dhabi	United Arab Emirates	\N
600044097	2024-05-08 00:52:30.502	2024-03-22 22:57:00	Bellator Champions Series Paris		2024-11-16 20:00:00	bellator	f	1	f	Paris	France	\N
\.


--
-- Data for Name: Fight; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Fight" (id, "eventId", "winnerId", "createdAt", "updatedAt", type, weight, description, "titleShot", stats, "matchNumber") FROM stdin;
401617808	600040474	5105154	2024-05-08 00:52:30.528	2024-01-13 01:51:00	\N	\N		f	\N	1
401617081	600040474	4907790	2024-05-08 00:52:30.528	2024-01-13 01:51:00	\N	\N		f	\N	2
401617809	600040474	5146877	2024-05-08 00:52:30.528	2024-01-13 01:51:00	\N	\N		f	\N	3
401626879	600040474	4714416	2024-05-08 00:52:30.528	2024-01-13 01:51:00	\N	\N		f	\N	4
401631439	600042033	4610021	2024-05-08 00:52:30.643	2024-01-14 14:39:00	Lightweight Title	\N		t	\N	1
401631440	600042033	5138563	2024-05-08 00:52:30.643	2024-01-14 14:39:00	\N	\N		f	\N	2
401613930	600039893	4273399	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Light Heavyweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 26, "takedowns": 0, "legStrikes": 19, "bodyStrikes": 3, "controlTime": 0, "headStrikes": 2, "submissions": 0, "strikesAttempted": 73, "significantStrikes": 24, "significantStrikesAttempted": 71}, "fighterB": {"ko": 1, "strikes": 39, "takedowns": 0, "legStrikes": 25, "bodyStrikes": 6, "controlTime": 5, "headStrikes": 8, "submissions": 0, "strikesAttempted": 58, "significantStrikes": 39, "significantStrikesAttempted": 58}}	1
401616185	600039893	2335718	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 96, "takedowns": 2, "legStrikes": 20, "bodyStrikes": 10, "controlTime": 235, "headStrikes": 50, "submissions": 1, "strikesAttempted": 157, "significantStrikes": 80, "significantStrikesAttempted": 140}, "fighterB": {"ko": 0, "strikes": 84, "takedowns": 0, "legStrikes": 16, "bodyStrikes": 13, "controlTime": 1, "headStrikes": 51, "submissions": 0, "strikesAttempted": 188, "significantStrikes": 80, "significantStrikesAttempted": 182}}	2
401616187	600039893	4410868	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 52, "takedowns": 2, "legStrikes": 8, "bodyStrikes": 4, "controlTime": 180, "headStrikes": 33, "submissions": 0, "strikesAttempted": 115, "significantStrikes": 45, "significantStrikesAttempted": 108}, "fighterB": {"ko": 0, "strikes": 118, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 31, "controlTime": 14, "headStrikes": 76, "submissions": 0, "strikesAttempted": 276, "significantStrikes": 112, "significantStrikesAttempted": 270}}	3
401613931	600039893	5077131	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 13, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 4, "controlTime": 0, "headStrikes": 8, "submissions": 0, "strikesAttempted": 28, "significantStrikes": 13, "significantStrikesAttempted": 27}, "fighterB": {"ko": 1, "strikes": 24, "takedowns": 1, "legStrikes": 1, "bodyStrikes": 0, "controlTime": 97, "headStrikes": 18, "submissions": 0, "strikesAttempted": 49, "significantStrikes": 19, "significantStrikesAttempted": 43}}	4
401616188	600039893	4903365	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 58, "takedowns": 0, "legStrikes": 23, "bodyStrikes": 22, "controlTime": 0, "headStrikes": 13, "submissions": 0, "strikesAttempted": 127, "significantStrikes": 58, "significantStrikesAttempted": 127}, "fighterB": {"ko": 0, "strikes": 50, "takedowns": 0, "legStrikes": 14, "bodyStrikes": 11, "controlTime": 0, "headStrikes": 24, "submissions": 0, "strikesAttempted": 137, "significantStrikes": 49, "significantStrikesAttempted": 136}}	5
401624039	600039893	4038105	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 116, "takedowns": 7, "legStrikes": 13, "bodyStrikes": 9, "controlTime": 386, "headStrikes": 25, "submissions": 2, "strikesAttempted": 165, "significantStrikes": 47, "significantStrikesAttempted": 87}, "fighterB": {"ko": 0, "strikes": 33, "takedowns": 1, "legStrikes": 6, "bodyStrikes": 4, "controlTime": 188, "headStrikes": 18, "submissions": 2, "strikesAttempted": 77, "significantStrikes": 28, "significantStrikesAttempted": 69}}	6
401616190	600039893	4895760	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 28, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 7, "controlTime": 4, "headStrikes": 14, "submissions": 0, "strikesAttempted": 82, "significantStrikes": 28, "significantStrikesAttempted": 81}, "fighterB": {"ko": 1, "strikes": 74, "takedowns": 1, "legStrikes": 1, "bodyStrikes": 7, "controlTime": 107, "headStrikes": 57, "submissions": 0, "strikesAttempted": 134, "significantStrikes": 65, "significantStrikesAttempted": 123}}	7
401616192	600039893	5016786	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 41, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 11, "controlTime": 2, "headStrikes": 24, "submissions": 0, "strikesAttempted": 94, "significantStrikes": 40, "significantStrikesAttempted": 93}, "fighterB": {"ko": 0, "strikes": 55, "takedowns": 5, "legStrikes": 21, "bodyStrikes": 7, "controlTime": 418, "headStrikes": 14, "submissions": 1, "strikesAttempted": 116, "significantStrikes": 42, "significantStrikesAttempted": 100}}	8
401624040	600039893	5145766	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 11, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 0, "controlTime": 4, "headStrikes": 8, "submissions": 0, "strikesAttempted": 36, "significantStrikes": 11, "significantStrikesAttempted": 36}, "fighterB": {"ko": 1, "strikes": 25, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 8, "headStrikes": 24, "submissions": 0, "strikesAttempted": 36, "significantStrikes": 25, "significantStrikesAttempted": 36}}	9
401639773	600042873	4913833	2024-05-08 00:52:47.551	2024-03-23 00:13:00	Featherweight	\N		f	\N	9
401639772	600042873	4820893	2024-05-08 00:52:47.551	2024-03-22 16:38:00	Lightweight	\N		f	\N	10
401652536	600044393	4896556	2024-05-08 00:52:48.051	2024-03-30 00:27:00	LFA Welterweight Title	\N		t	\N	1
401652537	600044393	4969974	2024-05-08 00:52:48.051	2024-03-30 00:27:00	\N	\N		f	\N	2
401618480	600039893	3897242	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 21, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 9, "headStrikes": 19, "submissions": 0, "strikesAttempted": 40, "significantStrikes": 21, "significantStrikesAttempted": 40}, "fighterB": {"ko": 0, "strikes": 12, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 5, "controlTime": 0, "headStrikes": 5, "submissions": 0, "strikesAttempted": 20, "significantStrikes": 12, "significantStrikesAttempted": 20}}	10
401623977	600039893	5120301	2024-05-08 00:52:30.709	2024-01-14 01:45:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 57, "takedowns": 2, "legStrikes": 10, "bodyStrikes": 11, "controlTime": 122, "headStrikes": 29, "submissions": 0, "strikesAttempted": 101, "significantStrikes": 50, "significantStrikesAttempted": 91}, "fighterB": {"ko": 1, "strikes": 154, "takedowns": 1, "legStrikes": 5, "bodyStrikes": 15, "controlTime": 74, "headStrikes": 63, "submissions": 0, "strikesAttempted": 222, "significantStrikes": 83, "significantStrikesAttempted": 141}}	11
401641362	600043154	5080648	2024-05-08 00:52:32.062	2024-02-21 21:47:00	\N	\N		f	\N	1
401641363	600043154	4580867	2024-05-08 00:52:32.062	2024-02-21 21:47:00	\N	\N		f	\N	2
401641364	600043154	5143190	2024-05-08 00:52:32.062	2024-02-21 21:47:00	\N	\N		f	\N	3
401641365	600043154	5143886	2024-05-08 00:52:32.062	2024-02-21 21:47:00	\N	\N		f	\N	4
401612908	600039713	3166126	2024-05-08 00:52:32.152	2024-02-27 14:24:00	UFC Middleweight Title	\N	5 Round (5 min)	t	{"fighterA": {"ko": 0, "strikes": 183, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 10, "controlTime": 0, "headStrikes": 157, "submissions": 0, "strikesAttempted": 419, "significantStrikes": 173, "significantStrikesAttempted": 408}, "fighterB": {"ko": 0, "strikes": 140, "takedowns": 6, "legStrikes": 24, "bodyStrikes": 32, "controlTime": 128, "headStrikes": 81, "submissions": 0, "strikesAttempted": 358, "significantStrikes": 137, "significantStrikesAttempted": 354}}	1
401613219	600039713	2995167	2024-05-08 00:52:32.153	2024-02-27 14:24:00	UFC Women's Bantamweight Title	\N	5 Round (5 min)	t	{"fighterA": {"ko": 0, "strikes": 265, "takedowns": 1, "legStrikes": 11, "bodyStrikes": 32, "controlTime": 688, "headStrikes": 91, "submissions": 2, "strikesAttempted": 342, "significantStrikes": 134, "significantStrikesAttempted": 201}, "fighterB": {"ko": 0, "strikes": 96, "takedowns": 3, "legStrikes": 11, "bodyStrikes": 26, "controlTime": 538, "headStrikes": 32, "submissions": 3, "strikesAttempted": 118, "significantStrikes": 69, "significantStrikesAttempted": 88}}	2
401613159	600039713	3001914	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 110, "takedowns": 1, "legStrikes": 2, "bodyStrikes": 3, "controlTime": 107, "headStrikes": 52, "submissions": 0, "strikesAttempted": 159, "significantStrikes": 57, "significantStrikesAttempted": 102}, "fighterB": {"ko": 0, "strikes": 100, "takedowns": 4, "legStrikes": 22, "bodyStrikes": 4, "controlTime": 362, "headStrikes": 19, "submissions": 0, "strikesAttempted": 128, "significantStrikes": 45, "significantStrikesAttempted": 67}}	3
401613160	600039713	2984770	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 144, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 35, "controlTime": 0, "headStrikes": 101, "submissions": 0, "strikesAttempted": 262, "significantStrikes": 140, "significantStrikesAttempted": 258}, "fighterB": {"ko": 0, "strikes": 124, "takedowns": 0, "legStrikes": 12, "bodyStrikes": 33, "controlTime": 0, "headStrikes": 77, "submissions": 0, "strikesAttempted": 245, "significantStrikes": 122, "significantStrikesAttempted": 243}}	4
401613440	600039713	4029275	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 61, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 17, "controlTime": 3, "headStrikes": 41, "submissions": 1, "strikesAttempted": 143, "significantStrikes": 59, "significantStrikesAttempted": 140}, "fighterB": {"ko": 0, "strikes": 72, "takedowns": 5, "legStrikes": 4, "bodyStrikes": 12, "controlTime": 211, "headStrikes": 35, "submissions": 0, "strikesAttempted": 141, "significantStrikes": 51, "significantStrikesAttempted": 118}}	5
401613442	600039713	4686270	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 76, "takedowns": 4, "legStrikes": 7, "bodyStrikes": 8, "controlTime": 275, "headStrikes": 49, "submissions": 0, "strikesAttempted": 172, "significantStrikes": 64, "significantStrikesAttempted": 155}, "fighterB": {"ko": 0, "strikes": 130, "takedowns": 0, "legStrikes": 10, "bodyStrikes": 21, "controlTime": 0, "headStrikes": 74, "submissions": 0, "strikesAttempted": 193, "significantStrikes": 105, "significantStrikesAttempted": 168}}	6
401612909	600039713	4566991	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 78, "takedowns": 0, "legStrikes": 21, "bodyStrikes": 20, "controlTime": 118, "headStrikes": 19, "submissions": 1, "strikesAttempted": 175, "significantStrikes": 60, "significantStrikesAttempted": 156}, "fighterB": {"ko": 0, "strikes": 102, "takedowns": 1, "legStrikes": 11, "bodyStrikes": 10, "controlTime": 39, "headStrikes": 59, "submissions": 0, "strikesAttempted": 193, "significantStrikes": 80, "significantStrikesAttempted": 168}}	7
401652482	600044353	\N	2024-05-08 00:53:02.367	2024-05-02 22:45:00	Featherweight	\N	5 Round (5 min)	f	\N	1
401655507	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Welterweight	\N	3 Round (5 min)	f	\N	2
401655508	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Light Heavyweight	\N	3 Round (5 min)	f	\N	3
401655509	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Bantamweight	\N	3 Round (5 min)	f	\N	4
401652483	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Women's Strawweight	\N	3 Round (5 min)	f	\N	5
401613161	600039713	5152409	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 81, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 20, "controlTime": 24, "headStrikes": 51, "submissions": 0, "strikesAttempted": 229, "significantStrikes": 79, "significantStrikesAttempted": 226}, "fighterB": {"ko": 1, "strikes": 62, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 8, "controlTime": 6, "headStrikes": 48, "submissions": 0, "strikesAttempted": 148, "significantStrikes": 62, "significantStrikesAttempted": 147}}	8
401613762	600039713	4089026	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 49, "takedowns": 2, "legStrikes": 3, "bodyStrikes": 0, "controlTime": 366, "headStrikes": 20, "submissions": 1, "strikesAttempted": 91, "significantStrikes": 23, "significantStrikesAttempted": 39}, "fighterB": {"ko": 0, "strikes": 33, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 27, "headStrikes": 10, "submissions": 0, "strikesAttempted": 66, "significantStrikes": 12, "significantStrikesAttempted": 41}}	9
401613763	600039713	5088916	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 1, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 5, "headStrikes": 1, "submissions": 0, "strikesAttempted": 9, "significantStrikes": 1, "significantStrikesAttempted": 9}, "fighterB": {"ko": 0, "strikes": 5, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 41, "headStrikes": 5, "submissions": 1, "strikesAttempted": 10, "significantStrikes": 5, "significantStrikesAttempted": 10}}	10
401614939	600039713	4835135	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Women's Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 26, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 3, "controlTime": 5, "headStrikes": 19, "submissions": 0, "strikesAttempted": 52, "significantStrikes": 24, "significantStrikesAttempted": 50}, "fighterB": {"ko": 1, "strikes": 326, "takedowns": 2, "legStrikes": 3, "bodyStrikes": 6, "controlTime": 685, "headStrikes": 84, "submissions": 3, "strikesAttempted": 398, "significantStrikes": 93, "significantStrikesAttempted": 120}}	11
401613764	600039713	2989380	2024-05-08 00:52:32.153	2024-02-27 14:24:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 7, "takedowns": 1, "legStrikes": 1, "bodyStrikes": 0, "controlTime": 67, "headStrikes": 2, "submissions": 4, "strikesAttempted": 11, "significantStrikes": 3, "significantStrikesAttempted": 7}, "fighterB": {"ko": 0, "strikes": 74, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 253, "headStrikes": 35, "submissions": 1, "strikesAttempted": 116, "significantStrikes": 37, "significantStrikesAttempted": 70}}	12
401636419	600042493	4691323	2024-05-08 00:52:33.775	2024-01-29 19:17:00	LFA Light Heavyweight Title	\N		t	\N	1
401636420	600042493	5138111	2024-05-08 00:52:33.775	2024-01-29 19:17:00	\N	\N		f	\N	2
401616699	600040313	2354244	2024-05-08 00:52:33.848	2024-01-28 11:19:00	\N	\N		f	\N	1
401618460	600040313	4197779	2024-05-08 00:52:33.848	2024-01-28 11:19:00	\N	\N		f	\N	2
401624932	600040313	4421752	2024-05-08 00:52:33.848	2024-01-28 11:19:00	\N	\N		f	\N	3
401624933	600040313	4046614	2024-05-08 00:52:33.848	2024-01-28 11:19:00	\N	\N		f	\N	4
401624934	600040313	4385252	2024-05-08 00:52:33.848	2024-01-28 11:19:00	\N	\N		f	\N	5
401624935	600040313	4239519	2024-05-08 00:52:33.848	2024-01-28 11:19:00	\N	\N		f	\N	6
401616899	600040373	4690539	2024-05-08 00:52:34.005	2024-04-11 16:54:00	Middleweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 59, "takedowns": 0, "legStrikes": 12, "bodyStrikes": 8, "controlTime": 611, "headStrikes": 14, "submissions": 0, "strikesAttempted": 190, "significantStrikes": 34, "significantStrikesAttempted": 152}, "fighterB": {"ko": 1, "strikes": 154, "takedowns": 0, "legStrikes": 17, "bodyStrikes": 24, "controlTime": 232, "headStrikes": 71, "submissions": 1, "strikesAttempted": 248, "significantStrikes": 112, "significantStrikesAttempted": 189}}	1
401619043	600040373	3028863	2024-05-08 00:52:34.005	2024-04-11 16:54:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 36, "takedowns": 1, "legStrikes": 2, "bodyStrikes": 4, "controlTime": 62, "headStrikes": 17, "submissions": 0, "strikesAttempted": 73, "significantStrikes": 23, "significantStrikesAttempted": 59}, "fighterB": {"ko": 0, "strikes": 142, "takedowns": 3, "legStrikes": 1, "bodyStrikes": 2, "controlTime": 633, "headStrikes": 20, "submissions": 0, "strikesAttempted": 177, "significantStrikes": 23, "significantStrikesAttempted": 42}}	2
401628310	600040373	3960071	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 10, "takedowns": 0, "legStrikes": 9, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 0, "submissions": 0, "strikesAttempted": 22, "significantStrikes": 10, "significantStrikesAttempted": 22}, "fighterB": {"ko": 1, "strikes": 13, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 1, "controlTime": 3, "headStrikes": 6, "submissions": 0, "strikesAttempted": 46, "significantStrikes": 13, "significantStrikesAttempted": 46}}	3
401619050	600040373	4054605	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Women's Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 65, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 8, "controlTime": 0, "headStrikes": 24, "submissions": 0, "strikesAttempted": 157, "significantStrikes": 38, "significantStrikesAttempted": 128}, "fighterB": {"ko": 0, "strikes": 63, "takedowns": 1, "legStrikes": 5, "bodyStrikes": 1, "controlTime": 361, "headStrikes": 20, "submissions": 0, "strikesAttempted": 110, "significantStrikes": 26, "significantStrikesAttempted": 67}}	4
401619049	600040373	\N	2024-05-08 00:52:34.006	2024-04-11 16:55:00	Middleweight	\N	3 Round (5 min)	f	\N	5
401657037	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:48:00	Light Heavyweight	\N		f	\N	6
401619048	600040373	4416297	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 16, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 6, "controlTime": 5, "headStrikes": 4, "submissions": 0, "strikesAttempted": 38, "significantStrikes": 16, "significantStrikesAttempted": 38}, "fighterB": {"ko": 2, "strikes": 33, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 0, "controlTime": 8, "headStrikes": 23, "submissions": 0, "strikesAttempted": 51, "significantStrikes": 30, "significantStrikesAttempted": 47}}	6
401617805	600040373	4200455	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 29, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 13, "controlTime": 0, "headStrikes": 9, "submissions": 0, "strikesAttempted": 77, "significantStrikes": 29, "significantStrikesAttempted": 77}, "fighterB": {"ko": 0, "strikes": 43, "takedowns": 2, "legStrikes": 1, "bodyStrikes": 14, "controlTime": 68, "headStrikes": 27, "submissions": 1, "strikesAttempted": 92, "significantStrikes": 42, "significantStrikesAttempted": 91}}	7
401630114	600040373	4375156	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 81, "takedowns": 2, "legStrikes": 27, "bodyStrikes": 20, "controlTime": 47, "headStrikes": 29, "submissions": 3, "strikesAttempted": 149, "significantStrikes": 76, "significantStrikesAttempted": 140}, "fighterB": {"ko": 1, "strikes": 40, "takedowns": 2, "legStrikes": 7, "bodyStrikes": 6, "controlTime": 149, "headStrikes": 25, "submissions": 1, "strikesAttempted": 166, "significantStrikes": 38, "significantStrikesAttempted": 163}}	8
401630113	600040373	4963269	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 0, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 0, "headStrikes": 0, "submissions": 0, "strikesAttempted": 5, "significantStrikes": 0, "significantStrikesAttempted": 5}, "fighterB": {"ko": 1, "strikes": 12, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 1, "controlTime": 5, "headStrikes": 10, "submissions": 0, "strikesAttempted": 18, "significantStrikes": 12, "significantStrikesAttempted": 18}}	9
401617807	600040373	5068724	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 75, "takedowns": 2, "legStrikes": 2, "bodyStrikes": 14, "controlTime": 269, "headStrikes": 33, "submissions": 0, "strikesAttempted": 121, "significantStrikes": 49, "significantStrikesAttempted": 82}, "fighterB": {"ko": 0, "strikes": 36, "takedowns": 0, "legStrikes": 14, "bodyStrikes": 2, "controlTime": 318, "headStrikes": 3, "submissions": 0, "strikesAttempted": 77, "significantStrikes": 19, "significantStrikesAttempted": 54}}	10
401619052	600040373	4372194	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Women's Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 21, "takedowns": 1, "legStrikes": 3, "bodyStrikes": 6, "controlTime": 227, "headStrikes": 7, "submissions": 3, "strikesAttempted": 68, "significantStrikes": 16, "significantStrikesAttempted": 59}, "fighterB": {"ko": 0, "strikes": 138, "takedowns": 2, "legStrikes": 10, "bodyStrikes": 15, "controlTime": 327, "headStrikes": 41, "submissions": 0, "strikesAttempted": 230, "significantStrikes": 66, "significantStrikesAttempted": 136}}	11
401619053	600040373	5157668	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 78, "takedowns": 1, "legStrikes": 3, "bodyStrikes": 11, "controlTime": 124, "headStrikes": 41, "submissions": 0, "strikesAttempted": 176, "significantStrikes": 55, "significantStrikesAttempted": 149}, "fighterB": {"ko": 0, "strikes": 74, "takedowns": 0, "legStrikes": 14, "bodyStrikes": 18, "controlTime": 253, "headStrikes": 28, "submissions": 0, "strikesAttempted": 165, "significantStrikes": 60, "significantStrikesAttempted": 146}}	12
401619054	600040373	4565641	2024-05-08 00:52:34.006	2024-04-11 16:54:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 66, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 15, "controlTime": 4, "headStrikes": 43, "submissions": 0, "strikesAttempted": 125, "significantStrikes": 65, "significantStrikesAttempted": 124}, "fighterB": {"ko": 0, "strikes": 116, "takedowns": 1, "legStrikes": 2, "bodyStrikes": 30, "controlTime": 167, "headStrikes": 26, "submissions": 0, "strikesAttempted": 153, "significantStrikes": 58, "significantStrikesAttempted": 86}}	13
401641360	600043153	4424219	2024-05-08 00:52:35.704	2024-02-21 21:39:00	LFA Featherweight Title	\N		t	\N	1
401641361	600043153	5200305	2024-05-08 00:52:35.704	2024-02-21 21:39:00	\N	\N		f	\N	2
401658318	600043153	5211221	2024-05-08 00:52:35.704	2024-05-04 19:10:00	\N	\N		f	\N	3
401615559	600040033	3074102	2024-05-08 00:52:35.842	2024-02-11 00:40:00	Middleweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 188, "takedowns": 1, "legStrikes": 32, "bodyStrikes": 15, "controlTime": 188, "headStrikes": 74, "submissions": 0, "strikesAttempted": 327, "significantStrikes": 121, "significantStrikesAttempted": 235}, "fighterB": {"ko": 0, "strikes": 95, "takedowns": 0, "legStrikes": 11, "bodyStrikes": 25, "controlTime": 50, "headStrikes": 56, "submissions": 0, "strikesAttempted": 254, "significantStrikes": 92, "significantStrikesAttempted": 250}}	1
401655510	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Welterweight	\N	3 Round (5 min)	f	\N	6
401655511	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Middleweight	\N	3 Round (5 min)	f	\N	7
401655512	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Lightweight	\N	3 Round (5 min)	f	\N	8
401655513	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Women's Bantamweight	\N	3 Round (5 min)	f	\N	9
401655514	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Women's Strawweight	\N	3 Round (5 min)	f	\N	10
401657038	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:49:00	Light Heavyweight	\N		f	\N	7
401636105	600040033	4074001	2024-05-08 00:52:35.842	2024-02-11 00:45:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 8, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 7, "submissions": 0, "strikesAttempted": 33, "significantStrikes": 8, "significantStrikesAttempted": 33}, "fighterB": {"ko": 1, "strikes": 11, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 2, "controlTime": 1, "headStrikes": 4, "submissions": 0, "strikesAttempted": 19, "significantStrikes": 11, "significantStrikesAttempted": 19}}	2
401638479	600040033	4873642	2024-05-08 00:52:35.842	2024-02-11 00:40:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 41, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 10, "controlTime": 30, "headStrikes": 19, "submissions": 0, "strikesAttempted": 143, "significantStrikes": 32, "significantStrikesAttempted": 133}, "fighterB": {"ko": 1, "strikes": 77, "takedowns": 0, "legStrikes": 15, "bodyStrikes": 5, "controlTime": 157, "headStrikes": 47, "submissions": 0, "strikesAttempted": 181, "significantStrikes": 67, "significantStrikesAttempted": 168}}	3
401620731	600040033	4690541	2024-05-08 00:52:35.842	2024-02-11 00:40:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 42, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 4, "controlTime": 0, "headStrikes": 28, "submissions": 0, "strikesAttempted": 90, "significantStrikes": 37, "significantStrikesAttempted": 84}, "fighterB": {"ko": 0, "strikes": 79, "takedowns": 2, "legStrikes": 10, "bodyStrikes": 8, "controlTime": 198, "headStrikes": 53, "submissions": 0, "strikesAttempted": 135, "significantStrikes": 71, "significantStrikesAttempted": 123}}	4
401620733	600040033	2488476	2024-05-08 00:52:35.842	2024-02-11 00:40:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 80, "takedowns": 4, "legStrikes": 9, "bodyStrikes": 36, "controlTime": 362, "headStrikes": 16, "submissions": 0, "strikesAttempted": 138, "significantStrikes": 61, "significantStrikesAttempted": 112}, "fighterB": {"ko": 0, "strikes": 52, "takedowns": 0, "legStrikes": 14, "bodyStrikes": 9, "controlTime": 43, "headStrikes": 10, "submissions": 0, "strikesAttempted": 86, "significantStrikes": 33, "significantStrikesAttempted": 64}}	5
401620734	600040033	4426250	2024-05-08 00:52:35.842	2024-02-11 00:45:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 14, "takedowns": 3, "legStrikes": 2, "bodyStrikes": 0, "controlTime": 166, "headStrikes": 4, "submissions": 1, "strikesAttempted": 21, "significantStrikes": 6, "significantStrikesAttempted": 11}, "fighterB": {"ko": 0, "strikes": 14, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 1, "submissions": 0, "strikesAttempted": 25, "significantStrikes": 9, "significantStrikesAttempted": 20}}	6
401620735	600040033	4294832	2024-05-08 00:52:35.842	2024-02-11 00:45:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 70, "takedowns": 0, "legStrikes": 41, "bodyStrikes": 2, "controlTime": 88, "headStrikes": 25, "submissions": 0, "strikesAttempted": 105, "significantStrikes": 68, "significantStrikesAttempted": 102}, "fighterB": {"ko": 1, "strikes": 38, "takedowns": 0, "legStrikes": 16, "bodyStrikes": 18, "controlTime": 0, "headStrikes": 3, "submissions": 0, "strikesAttempted": 73, "significantStrikes": 37, "significantStrikesAttempted": 72}}	7
401638739	600040033	5145682	2024-05-08 00:52:35.843	2024-02-11 00:40:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 35, "takedowns": 1, "legStrikes": 5, "bodyStrikes": 8, "controlTime": 115, "headStrikes": 20, "submissions": 0, "strikesAttempted": 96, "significantStrikes": 33, "significantStrikesAttempted": 94}, "fighterB": {"ko": 0, "strikes": 61, "takedowns": 1, "legStrikes": 4, "bodyStrikes": 5, "controlTime": 109, "headStrikes": 51, "submissions": 0, "strikesAttempted": 157, "significantStrikes": 60, "significantStrikesAttempted": 152}}	8
401615560	600040033	4292347	2024-05-08 00:52:35.843	2024-02-11 00:40:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 73, "takedowns": 1, "legStrikes": 14, "bodyStrikes": 29, "controlTime": 55, "headStrikes": 15, "submissions": 0, "strikesAttempted": 131, "significantStrikes": 58, "significantStrikesAttempted": 112}, "fighterB": {"ko": 0, "strikes": 52, "takedowns": 1, "legStrikes": 7, "bodyStrikes": 12, "controlTime": 149, "headStrikes": 9, "submissions": 0, "strikesAttempted": 99, "significantStrikes": 28, "significantStrikesAttempted": 63}}	9
401620760	600040033	3998068	2024-05-08 00:52:35.843	2024-02-11 00:40:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 53, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 13, "controlTime": 14, "headStrikes": 36, "submissions": 0, "strikesAttempted": 127, "significantStrikes": 53, "significantStrikesAttempted": 127}, "fighterB": {"ko": 0, "strikes": 112, "takedowns": 1, "legStrikes": 22, "bodyStrikes": 37, "controlTime": 44, "headStrikes": 42, "submissions": 0, "strikesAttempted": 204, "significantStrikes": 101, "significantStrikesAttempted": 189}}	10
401620736	600040033	3040385	2024-05-08 00:52:35.843	2024-02-11 00:40:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 36, "takedowns": 1, "legStrikes": 1, "bodyStrikes": 4, "controlTime": 100, "headStrikes": 21, "submissions": 0, "strikesAttempted": 65, "significantStrikes": 26, "significantStrikesAttempted": 53}, "fighterB": {"ko": 0, "strikes": 43, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 5, "controlTime": 100, "headStrikes": 27, "submissions": 0, "strikesAttempted": 97, "significantStrikes": 32, "significantStrikesAttempted": 86}}	11
401655515	600044353	\N	2024-05-08 00:53:02.367	2024-04-30 17:45:00	Women's Strawweight	\N	3 Round (5 min)	f	\N	11
401620738	600040033	5152109	2024-05-08 00:52:35.843	2024-02-11 00:45:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 19, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 2, "controlTime": 64, "headStrikes": 7, "submissions": 0, "strikesAttempted": 28, "significantStrikes": 17, "significantStrikesAttempted": 26}, "fighterB": {"ko": 1, "strikes": 25, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 4, "headStrikes": 10, "submissions": 0, "strikesAttempted": 44, "significantStrikes": 10, "significantStrikesAttempted": 29}}	12
401638740	600040033	5027356	2024-05-08 00:52:35.843	2024-02-11 00:40:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 31, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 3, "controlTime": 56, "headStrikes": 22, "submissions": 0, "strikesAttempted": 87, "significantStrikes": 26, "significantStrikesAttempted": 79}, "fighterB": {"ko": 1, "strikes": 109, "takedowns": 1, "legStrikes": 5, "bodyStrikes": 14, "controlTime": 140, "headStrikes": 60, "submissions": 2, "strikesAttempted": 194, "significantStrikes": 79, "significantStrikesAttempted": 144}}	13
401620759	600040033	\N	2024-05-08 00:52:35.843	2024-02-11 00:40:00	Bantamweight	\N	3 Round (5 min)	f	\N	14
401641343	600043133	3893071	2024-05-08 00:52:37.625	2024-02-21 20:10:00	\N	\N		f	\N	1
401641344	600043133	5173846	2024-05-08 00:52:37.625	2024-02-21 20:10:00	\N	\N		f	\N	2
401612970	600039753	4350812	2024-05-08 00:52:37.716	2024-04-26 18:06:00	UFC Featherweight Title	\N	5 Round (5 min)	t	{"fighterA": {"ko": 0, "strikes": 47, "takedowns": 0, "legStrikes": 15, "bodyStrikes": 11, "controlTime": 0, "headStrikes": 21, "submissions": 0, "strikesAttempted": 107, "significantStrikes": 47, "significantStrikesAttempted": 107}, "fighterB": {"ko": 1, "strikes": 36, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 12, "controlTime": 3, "headStrikes": 17, "submissions": 0, "strikesAttempted": 78, "significantStrikes": 35, "significantStrikesAttempted": 77}}	1
401622060	600039753	3009717	2024-05-08 00:52:37.716	2024-04-26 18:06:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 95, "takedowns": 0, "legStrikes": 28, "bodyStrikes": 4, "controlTime": 0, "headStrikes": 63, "submissions": 0, "strikesAttempted": 175, "significantStrikes": 95, "significantStrikesAttempted": 175}, "fighterB": {"ko": 0, "strikes": 67, "takedowns": 0, "legStrikes": 20, "bodyStrikes": 8, "controlTime": 0, "headStrikes": 39, "submissions": 0, "strikesAttempted": 151, "significantStrikes": 67, "significantStrikesAttempted": 151}}	2
401622064	600039753	4738092	2024-05-08 00:52:37.716	2024-04-26 18:06:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 57, "takedowns": 0, "legStrikes": 11, "bodyStrikes": 10, "controlTime": 225, "headStrikes": 25, "submissions": 0, "strikesAttempted": 102, "significantStrikes": 46, "significantStrikesAttempted": 89}, "fighterB": {"ko": 0, "strikes": 80, "takedowns": 0, "legStrikes": 10, "bodyStrikes": 18, "controlTime": 12, "headStrikes": 39, "submissions": 0, "strikesAttempted": 148, "significantStrikes": 67, "significantStrikesAttempted": 135}}	3
401618438	600039753	3948572	2024-05-08 00:52:37.716	2024-04-26 18:06:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 54, "takedowns": 1, "legStrikes": 11, "bodyStrikes": 5, "controlTime": 125, "headStrikes": 13, "submissions": 0, "strikesAttempted": 106, "significantStrikes": 29, "significantStrikesAttempted": 78}, "fighterB": {"ko": 0, "strikes": 167, "takedowns": 5, "legStrikes": 10, "bodyStrikes": 20, "controlTime": 263, "headStrikes": 44, "submissions": 1, "strikesAttempted": 273, "significantStrikes": 74, "significantStrikesAttempted": 172}}	4
401636439	600039753	4290956	2024-05-08 00:52:37.716	2024-04-26 18:06:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 39, "takedowns": 3, "legStrikes": 2, "bodyStrikes": 4, "controlTime": 245, "headStrikes": 28, "submissions": 2, "strikesAttempted": 82, "significantStrikes": 34, "significantStrikesAttempted": 77}, "fighterB": {"ko": 0, "strikes": 41, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 8, "controlTime": 0, "headStrikes": 21, "submissions": 0, "strikesAttempted": 63, "significantStrikes": 35, "significantStrikesAttempted": 57}}	5
401632998	600039753	4233196	2024-05-08 00:52:37.716	2024-04-26 18:06:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 50, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 360, "headStrikes": 21, "submissions": 0, "strikesAttempted": 85, "significantStrikes": 21, "significantStrikesAttempted": 54}, "fighterB": {"ko": 1, "strikes": 47, "takedowns": 2, "legStrikes": 7, "bodyStrikes": 8, "controlTime": 242, "headStrikes": 26, "submissions": 0, "strikesAttempted": 86, "significantStrikes": 41, "significantStrikesAttempted": 80}}	6
401640699	600039753	2558075	2024-05-08 00:52:37.716	2024-04-26 18:06:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 63, "takedowns": 1, "legStrikes": 12, "bodyStrikes": 2, "controlTime": 206, "headStrikes": 19, "submissions": 0, "strikesAttempted": 78, "significantStrikes": 33, "significantStrikesAttempted": 46}, "fighterB": {"ko": 0, "strikes": 17, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 9, "submissions": 0, "strikesAttempted": 33, "significantStrikes": 11, "significantStrikesAttempted": 27}}	7
401652641	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:02:00	UFC Lightweight Title	\N	5 Round (5 min)	t	\N	1
401654716	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:02:00	Middleweight	\N	5 Round (5 min)	f	\N	2
401655682	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:17:00	Middleweight	\N	3 Round (5 min)	f	\N	4
401655680	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:02:00	Heavyweight	\N	3 Round (5 min)	f	\N	4
401655681	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:17:00	Welterweight	\N	3 Round (5 min)	f	\N	5
401653085	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:51:00	Lightweight	\N		f	\N	7
401628313	600039753	5068624	2024-05-08 00:52:37.717	2024-04-26 18:06:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 55, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 7, "submissions": 0, "strikesAttempted": 79, "significantStrikes": 12, "significantStrikesAttempted": 25}, "fighterB": {"ko": 0, "strikes": 73, "takedowns": 3, "legStrikes": 2, "bodyStrikes": 6, "controlTime": 783, "headStrikes": 30, "submissions": 0, "strikesAttempted": 114, "significantStrikes": 38, "significantStrikesAttempted": 70}}	8
401618442	600039753	4845284	2024-05-08 00:52:37.717	2024-04-26 18:06:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 14, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 0, "headStrikes": 14, "submissions": 0, "strikesAttempted": 31, "significantStrikes": 14, "significantStrikesAttempted": 31}, "fighterB": {"ko": 1, "strikes": 17, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 2, "controlTime": 2, "headStrikes": 13, "submissions": 0, "strikesAttempted": 28, "significantStrikes": 17, "significantStrikesAttempted": 28}}	9
401631983	600039753	5152138	2024-05-08 00:52:37.717	2024-04-26 18:06:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 39, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 14, "controlTime": 0, "headStrikes": 22, "submissions": 0, "strikesAttempted": 90, "significantStrikes": 39, "significantStrikesAttempted": 90}, "fighterB": {"ko": 1, "strikes": 96, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 13, "controlTime": 13, "headStrikes": 77, "submissions": 0, "strikesAttempted": 186, "significantStrikes": 95, "significantStrikesAttempted": 185}}	10
401628312	600039753	4900808	2024-05-08 00:52:37.717	2024-04-26 18:06:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 136, "takedowns": 3, "legStrikes": 3, "bodyStrikes": 7, "controlTime": 538, "headStrikes": 60, "submissions": 0, "strikesAttempted": 188, "significantStrikes": 70, "significantStrikesAttempted": 111}, "fighterB": {"ko": 1, "strikes": 30, "takedowns": 2, "legStrikes": 2, "bodyStrikes": 2, "controlTime": 116, "headStrikes": 19, "submissions": 0, "strikesAttempted": 70, "significantStrikes": 23, "significantStrikesAttempted": 61}}	11
401612972	600039753	4065598	2024-05-08 00:52:37.717	2024-04-26 18:06:00	Women's Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 59, "takedowns": 2, "legStrikes": 9, "bodyStrikes": 13, "controlTime": 42, "headStrikes": 14, "submissions": 1, "strikesAttempted": 126, "significantStrikes": 36, "significantStrikesAttempted": 102}, "fighterB": {"ko": 0, "strikes": 106, "takedowns": 3, "legStrikes": 22, "bodyStrikes": 16, "controlTime": 185, "headStrikes": 28, "submissions": 0, "strikesAttempted": 180, "significantStrikes": 66, "significantStrikesAttempted": 136}}	12
401643257	600043273	2512984	2024-05-08 00:52:39.936	2024-02-27 23:31:00	\N	\N		f	\N	1
401643258	600043273	4419470	2024-05-08 00:52:39.936	2024-02-27 23:31:00	\N	\N		f	\N	2
401643259	600043273	5193167	2024-05-08 00:52:39.936	2024-02-27 23:31:00	\N	\N		f	\N	3
401647376	600043693	5131950	2024-05-08 00:52:40	2024-03-09 18:40:00	Welterweight Title	\N		t	\N	1
401645306	600043636	4371905	2024-05-08 00:52:40.025	2024-03-06 20:19:00	\N	\N		f	\N	1
401645307	600043636	4039836	2024-05-08 00:52:40.025	2024-03-06 20:19:00	\N	\N		f	\N	2
401656121	600043636	5011094	2024-05-08 00:52:40.025	2024-04-23 15:21:00	\N	\N		f	\N	3
401631970	600042093	4408708	2024-05-08 00:52:40.096	2024-02-25 21:28:00	EMMA Women's Strawweight Title	\N		t	\N	1
401631971	600042093	4697390	2024-05-08 00:52:40.096	2024-02-24 19:14:00	Middleweight Title	\N		t	\N	2
401631972	600042093	3120931	2024-05-08 00:52:40.096	2024-02-25 21:29:00	Catch Weight	\N		f	\N	3
401631974	600042093	3955014	2024-05-08 00:52:40.096	2024-02-25 21:29:00	Heavyweight	\N		f	\N	4
401631975	600042093	2569939	2024-05-08 00:52:40.096	2024-02-24 17:48:00	Light Heavyweight	\N		f	\N	5
401631976	600042093	3821379	2024-05-08 00:52:40.096	2024-02-25 21:30:00	Lightweight	\N		f	\N	6
401631977	600042093	4199009	2024-05-08 00:52:40.096	2024-02-25 21:31:00	Featherweight	\N		f	\N	7
401631978	600042093	5103717	2024-05-08 00:52:40.096	2024-02-24 16:39:00	Lightweight	\N		f	\N	8
401631979	600042093	4708687	2024-05-08 00:52:40.096	2024-02-24 16:08:00	Women's Catch Weight	\N		f	\N	9
401631980	600042093	5123585	2024-05-08 00:52:40.096	2024-02-25 21:30:00	Featherweight	\N		f	\N	10
401630119	600041054	4239928	2024-05-08 00:52:40.59	2024-02-25 03:36:00	Flyweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 119, "takedowns": 3, "legStrikes": 27, "bodyStrikes": 37, "controlTime": 174, "headStrikes": 48, "submissions": 0, "strikesAttempted": 219, "significantStrikes": 112, "significantStrikesAttempted": 211}, "fighterB": {"ko": 0, "strikes": 177, "takedowns": 1, "legStrikes": 10, "bodyStrikes": 38, "controlTime": 35, "headStrikes": 97, "submissions": 0, "strikesAttempted": 556, "significantStrikes": 145, "significantStrikesAttempted": 510}}	1
401622062	600041054	3045737	2024-05-08 00:52:40.591	2024-02-25 03:36:00	Featherweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 47, "takedowns": 3, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 321, "headStrikes": 26, "submissions": 1, "strikesAttempted": 104, "significantStrikes": 28, "significantStrikesAttempted": 73}, "fighterB": {"ko": 1, "strikes": 64, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 11, "controlTime": 92, "headStrikes": 36, "submissions": 0, "strikesAttempted": 135, "significantStrikes": 55, "significantStrikesAttempted": 115}}	2
401630559	600041054	4863327	2024-05-08 00:52:40.591	2024-02-25 03:36:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 120, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 25, "controlTime": 5, "headStrikes": 87, "submissions": 0, "strikesAttempted": 272, "significantStrikes": 120, "significantStrikesAttempted": 272}, "fighterB": {"ko": 0, "strikes": 91, "takedowns": 0, "legStrikes": 34, "bodyStrikes": 26, "controlTime": 25, "headStrikes": 30, "submissions": 0, "strikesAttempted": 249, "significantStrikes": 90, "significantStrikesAttempted": 246}}	3
401624930	600041054	5063403	2024-05-08 00:52:40.591	2024-02-25 11:09:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 88, "takedowns": 0, "legStrikes": 26, "bodyStrikes": 17, "controlTime": 17, "headStrikes": 40, "submissions": 0, "strikesAttempted": 206, "significantStrikes": 83, "significantStrikesAttempted": 197}, "fighterB": {"ko": 0, "strikes": 97, "takedowns": 0, "legStrikes": 18, "bodyStrikes": 24, "controlTime": 0, "headStrikes": 52, "submissions": 0, "strikesAttempted": 272, "significantStrikes": 94, "significantStrikesAttempted": 269}}	4
401625759	600041054	4896616	2024-05-08 00:52:40.591	2024-02-25 03:37:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 1, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 40, "headStrikes": 1, "submissions": 0, "strikesAttempted": 2, "significantStrikes": 1, "significantStrikesAttempted": 2}, "fighterB": {"ko": 0, "strikes": 5, "takedowns": 2, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 42, "headStrikes": 2, "submissions": 1, "strikesAttempted": 7, "significantStrikes": 3, "significantStrikesAttempted": 5}}	5
401630118	600041054	3075570	2024-05-08 00:52:40.591	2024-02-25 11:10:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 48, "takedowns": 2, "legStrikes": 12, "bodyStrikes": 5, "controlTime": 62, "headStrikes": 26, "submissions": 2, "strikesAttempted": 81, "significantStrikes": 43, "significantStrikesAttempted": 74}, "fighterB": {"ko": 0, "strikes": 43, "takedowns": 2, "legStrikes": 9, "bodyStrikes": 3, "controlTime": 193, "headStrikes": 17, "submissions": 0, "strikesAttempted": 99, "significantStrikes": 29, "significantStrikesAttempted": 82}}	6
401625319	600041054	5074274	2024-05-08 00:52:40.591	2024-02-25 11:10:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 38, "takedowns": 1, "legStrikes": 5, "bodyStrikes": 4, "controlTime": 291, "headStrikes": 10, "submissions": 1, "strikesAttempted": 62, "significantStrikes": 19, "significantStrikesAttempted": 36}, "fighterB": {"ko": 0, "strikes": 43, "takedowns": 4, "legStrikes": 0, "bodyStrikes": 3, "controlTime": 524, "headStrikes": 15, "submissions": 1, "strikesAttempted": 90, "significantStrikes": 18, "significantStrikesAttempted": 40}}	7
401623299	600041054	5076027	2024-05-08 00:52:40.591	2024-02-25 11:09:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 7, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 41, "headStrikes": 2, "submissions": 0, "strikesAttempted": 22, "significantStrikes": 4, "significantStrikesAttempted": 17}, "fighterB": {"ko": 0, "strikes": 9, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 2, "controlTime": 0, "headStrikes": 3, "submissions": 1, "strikesAttempted": 15, "significantStrikes": 9, "significantStrikesAttempted": 15}}	8
401632039	600041054	4083018	2024-05-08 00:52:40.591	2024-02-25 11:10:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 17, "takedowns": 7, "legStrikes": 0, "bodyStrikes": 3, "controlTime": 434, "headStrikes": 1, "submissions": 0, "strikesAttempted": 27, "significantStrikes": 4, "significantStrikesAttempted": 9}, "fighterB": {"ko": 0, "strikes": 58, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 6, "controlTime": 270, "headStrikes": 23, "submissions": 1, "strikesAttempted": 82, "significantStrikes": 31, "significantStrikesAttempted": 48}}	9
401628005	600041054	4685888	2024-05-08 00:52:40.591	2024-02-25 11:10:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 50, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 7, "controlTime": 176, "headStrikes": 19, "submissions": 1, "strikesAttempted": 93, "significantStrikes": 31, "significantStrikesAttempted": 69}, "fighterB": {"ko": 0, "strikes": 46, "takedowns": 4, "legStrikes": 11, "bodyStrikes": 8, "controlTime": 172, "headStrikes": 22, "submissions": 0, "strikesAttempted": 77, "significantStrikes": 41, "significantStrikesAttempted": 63}}	10
401619306	600041054	5143333	2024-05-08 00:52:40.591	2024-02-25 11:09:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 52, "takedowns": 9, "legStrikes": 10, "bodyStrikes": 23, "controlTime": 302, "headStrikes": 7, "submissions": 0, "strikesAttempted": 97, "significantStrikes": 40, "significantStrikesAttempted": 74}, "fighterB": {"ko": 0, "strikes": 62, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 8, "controlTime": 51, "headStrikes": 24, "submissions": 1, "strikesAttempted": 120, "significantStrikes": 37, "significantStrikesAttempted": 87}}	11
401632040	600041054	4690540	2024-05-08 00:52:40.591	2024-02-25 11:10:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 3, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 11, "headStrikes": 1, "submissions": 0, "strikesAttempted": 4, "significantStrikes": 1, "significantStrikesAttempted": 2}, "fighterB": {"ko": 0, "strikes": 0, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 13, "headStrikes": 0, "submissions": 0, "strikesAttempted": 1, "significantStrikes": 0, "significantStrikesAttempted": 1}}	12
401623219	600040653	4566264	2024-05-08 00:52:42.058	2024-03-01 17:11:00	Middleweight Title	\N		t	\N	1
401624931	600040653	4420538	2024-05-08 00:52:42.058	2024-03-01 17:11:00	ONE Featherweight Championship	\N		f	\N	2
401617839	600040653	4054997	2024-05-08 00:52:42.058	2024-03-01 17:11:00	ONE Strawweight Championship	\N		f	\N	3
401617840	600040653	4076779	2024-05-08 00:52:42.058	2024-03-01 17:11:00	Heavyweight	\N		f	\N	4
401641345	600040653	5194556	2024-05-08 00:52:42.058	2024-03-01 17:11:00	\N	\N		f	\N	5
401652649	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:02:00	Lightweight	\N	3 Round (5 min)	f	\N	6
401656118	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:17:00	Welterweight	\N		f	\N	7
401652642	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:02:00	Welterweight	\N	3 Round (5 min)	f	\N	8
401652644	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:02:00	Welterweight	\N	3 Round (5 min)	f	\N	9
401636111	600042433	4410084	2024-05-08 00:52:42.187	2024-03-02 21:37:00	Heavyweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 140, "takedowns": 0, "legStrikes": 19, "bodyStrikes": 30, "controlTime": 1, "headStrikes": 78, "submissions": 0, "strikesAttempted": 230, "significantStrikes": 127, "significantStrikesAttempted": 215}, "fighterB": {"ko": 0, "strikes": 27, "takedowns": 1, "legStrikes": 1, "bodyStrikes": 5, "controlTime": 272, "headStrikes": 16, "submissions": 0, "strikesAttempted": 75, "significantStrikes": 22, "significantStrikesAttempted": 68}}	1
401636112	600042433	5060483	2024-05-08 00:52:42.187	2024-03-02 21:37:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 33, "takedowns": 0, "legStrikes": 16, "bodyStrikes": 11, "controlTime": 10, "headStrikes": 3, "submissions": 0, "strikesAttempted": 64, "significantStrikes": 30, "significantStrikesAttempted": 60}, "fighterB": {"ko": 0, "strikes": 33, "takedowns": 3, "legStrikes": 7, "bodyStrikes": 4, "controlTime": 324, "headStrikes": 16, "submissions": 0, "strikesAttempted": 82, "significantStrikes": 27, "significantStrikesAttempted": 75}}	2
401638480	600042433	4905261	2024-05-08 00:52:42.187	2024-03-02 21:37:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 47, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 3, "controlTime": 224, "headStrikes": 22, "submissions": 0, "strikesAttempted": 114, "significantStrikes": 30, "significantStrikesAttempted": 87}, "fighterB": {"ko": 0, "strikes": 56, "takedowns": 3, "legStrikes": 4, "bodyStrikes": 9, "controlTime": 269, "headStrikes": 34, "submissions": 0, "strikesAttempted": 119, "significantStrikes": 47, "significantStrikesAttempted": 104}}	3
401639776	600042433	4569549	2024-05-08 00:52:42.187	2024-03-02 21:37:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 145, "takedowns": 5, "legStrikes": 4, "bodyStrikes": 0, "controlTime": 686, "headStrikes": 64, "submissions": 0, "strikesAttempted": 197, "significantStrikes": 68, "significantStrikesAttempted": 98}, "fighterB": {"ko": 1, "strikes": 5, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 34, "headStrikes": 1, "submissions": 0, "strikesAttempted": 25, "significantStrikes": 3, "significantStrikesAttempted": 16}}	4
401638239	600042433	4997217	2024-05-08 00:52:42.187	2024-03-02 21:37:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 25, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 18, "submissions": 0, "strikesAttempted": 84, "significantStrikes": 22, "significantStrikesAttempted": 78}, "fighterB": {"ko": 1, "strikes": 34, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 9, "controlTime": 5, "headStrikes": 24, "submissions": 0, "strikesAttempted": 72, "significantStrikes": 34, "significantStrikesAttempted": 72}}	5
401639775	600042433	4082125	2024-05-08 00:52:42.187	2024-03-02 21:37:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 83, "takedowns": 5, "legStrikes": 2, "bodyStrikes": 7, "controlTime": 608, "headStrikes": 14, "submissions": 0, "strikesAttempted": 147, "significantStrikes": 23, "significantStrikesAttempted": 59}, "fighterB": {"ko": 1, "strikes": 26, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 8, "controlTime": 16, "headStrikes": 11, "submissions": 0, "strikesAttempted": 64, "significantStrikes": 20, "significantStrikesAttempted": 55}}	6
401643236	600042433	4884877	2024-05-08 00:52:42.187	2024-03-02 21:37:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 88, "takedowns": 2, "legStrikes": 17, "bodyStrikes": 11, "controlTime": 96, "headStrikes": 39, "submissions": 0, "strikesAttempted": 170, "significantStrikes": 67, "significantStrikesAttempted": 144}, "fighterB": {"ko": 0, "strikes": 92, "takedowns": 3, "legStrikes": 2, "bodyStrikes": 1, "controlTime": 268, "headStrikes": 42, "submissions": 0, "strikesAttempted": 146, "significantStrikes": 45, "significantStrikesAttempted": 86}}	7
401638484	600042433	4079149	2024-05-08 00:52:42.188	2024-03-02 21:37:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 77, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 16, "controlTime": 13, "headStrikes": 51, "submissions": 0, "strikesAttempted": 176, "significantStrikes": 75, "significantStrikesAttempted": 174}, "fighterB": {"ko": 0, "strikes": 67, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 27, "controlTime": 0, "headStrikes": 33, "submissions": 0, "strikesAttempted": 205, "significantStrikes": 67, "significantStrikesAttempted": 205}}	8
401638482	600042433	4848674	2024-05-08 00:52:42.188	2024-03-02 21:37:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 75, "takedowns": 1, "legStrikes": 18, "bodyStrikes": 8, "controlTime": 135, "headStrikes": 39, "submissions": 0, "strikesAttempted": 105, "significantStrikes": 65, "significantStrikesAttempted": 92}, "fighterB": {"ko": 0, "strikes": 13, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 1, "controlTime": 63, "headStrikes": 1, "submissions": 0, "strikesAttempted": 39, "significantStrikes": 4, "significantStrikesAttempted": 26}}	9
401643237	600042433	4193694	2024-05-08 00:52:42.188	2024-03-02 21:37:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 63, "takedowns": 2, "legStrikes": 1, "bodyStrikes": 21, "controlTime": 27, "headStrikes": 38, "submissions": 0, "strikesAttempted": 95, "significantStrikes": 60, "significantStrikesAttempted": 91}, "fighterB": {"ko": 0, "strikes": 36, "takedowns": 0, "legStrikes": 11, "bodyStrikes": 10, "controlTime": 26, "headStrikes": 15, "submissions": 0, "strikesAttempted": 77, "significantStrikes": 36, "significantStrikesAttempted": 75}}	10
401652650	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:02:00	Women's Bantamweight	\N	3 Round (5 min)	f	\N	11
401657039	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:52:00	Light Heavyweight	\N		f	\N	8
401639777	600042433	4419434	2024-05-08 00:52:42.188	2024-03-02 21:37:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 57, "takedowns": 4, "legStrikes": 0, "bodyStrikes": 6, "controlTime": 87, "headStrikes": 33, "submissions": 0, "strikesAttempted": 115, "significantStrikes": 39, "significantStrikesAttempted": 90}, "fighterB": {"ko": 0, "strikes": 50, "takedowns": 3, "legStrikes": 15, "bodyStrikes": 8, "controlTime": 164, "headStrikes": 15, "submissions": 0, "strikesAttempted": 84, "significantStrikes": 38, "significantStrikesAttempted": 68}}	11
401649537	600044034	5207722	2024-05-08 00:52:43.949	2024-03-22 01:46:00	\N	\N		f	\N	1
401648938	600043945	5206516	2024-05-08 00:52:43.987	2024-03-18 22:10:00	LFA Light Heavyweight Title	\N		t	\N	1
401648939	600043945	4878555	2024-05-08 00:52:43.987	2024-03-18 22:10:00	\N	\N		f	\N	2
401648940	600043945	4944080	2024-05-08 00:52:43.987	2024-03-18 22:10:00	\N	\N		f	\N	3
401648941	600043945	4629138	2024-05-08 00:52:43.987	2024-03-18 22:10:00	\N	\N		f	\N	4
401612973	600039754	4205093	2024-05-08 00:52:44.163	2024-03-10 04:05:00	UFC Bantamweight Title	\N	5 Round (5 min)	t	{"fighterA": {"ko": 0, "strikes": 89, "takedowns": 0, "legStrikes": 34, "bodyStrikes": 14, "controlTime": 0, "headStrikes": 41, "submissions": 0, "strikesAttempted": 241, "significantStrikes": 89, "significantStrikesAttempted": 241}, "fighterB": {"ko": 0, "strikes": 232, "takedowns": 0, "legStrikes": 19, "bodyStrikes": 61, "controlTime": 3, "headStrikes": 150, "submissions": 0, "strikesAttempted": 358, "significantStrikes": 230, "significantStrikesAttempted": 356}}	1
401626639	600039754	2506549	2024-05-08 00:52:44.163	2024-03-10 04:45:00	Lightweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 30, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 3, "controlTime": 31, "headStrikes": 24, "submissions": 4, "strikesAttempted": 37, "significantStrikes": 28, "significantStrikesAttempted": 34}, "fighterB": {"ko": 0, "strikes": 69, "takedowns": 3, "legStrikes": 7, "bodyStrikes": 18, "controlTime": 293, "headStrikes": 25, "submissions": 1, "strikesAttempted": 97, "significantStrikes": 50, "significantStrikesAttempted": 74}}	2
401619340	600039754	3022067	2024-05-08 00:52:44.164	2024-03-10 04:05:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 59, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 8, "controlTime": 86, "headStrikes": 28, "submissions": 0, "strikesAttempted": 81, "significantStrikes": 41, "significantStrikesAttempted": 62}, "fighterB": {"ko": 0, "strikes": 64, "takedowns": 2, "legStrikes": 14, "bodyStrikes": 4, "controlTime": 262, "headStrikes": 11, "submissions": 1, "strikesAttempted": 99, "significantStrikes": 29, "significantStrikesAttempted": 61}}	3
401619341	600039754	4828707	2024-05-08 00:52:44.164	2024-03-10 04:45:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 31, "takedowns": 7, "legStrikes": 3, "bodyStrikes": 8, "controlTime": 307, "headStrikes": 16, "submissions": 0, "strikesAttempted": 63, "significantStrikes": 27, "significantStrikesAttempted": 58}, "fighterB": {"ko": 1, "strikes": 85, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 9, "controlTime": 16, "headStrikes": 54, "submissions": 0, "strikesAttempted": 146, "significantStrikes": 67, "significantStrikesAttempted": 123}}	4
401619342	600039754	4293517	2024-05-08 00:52:44.164	2024-03-10 04:05:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 104, "takedowns": 1, "legStrikes": 6, "bodyStrikes": 9, "controlTime": 100, "headStrikes": 71, "submissions": 0, "strikesAttempted": 192, "significantStrikes": 86, "significantStrikesAttempted": 172}, "fighterB": {"ko": 0, "strikes": 129, "takedowns": 2, "legStrikes": 9, "bodyStrikes": 22, "controlTime": 107, "headStrikes": 68, "submissions": 0, "strikesAttempted": 217, "significantStrikes": 99, "significantStrikesAttempted": 183}}	5
401618435	600039754	3922557	2024-05-08 00:52:44.164	2024-03-10 04:45:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 19, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 9, "headStrikes": 16, "submissions": 0, "strikesAttempted": 28, "significantStrikes": 16, "significantStrikesAttempted": 25}, "fighterB": {"ko": 0, "strikes": 9, "takedowns": 9, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 279, "headStrikes": 1, "submissions": 0, "strikesAttempted": 11, "significantStrikes": 1, "significantStrikesAttempted": 3}}	6
401618434	600039754	4246307	2024-05-08 00:52:44.164	2024-03-10 04:05:00	Women's Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 99, "takedowns": 1, "legStrikes": 1, "bodyStrikes": 21, "controlTime": 172, "headStrikes": 44, "submissions": 0, "strikesAttempted": 186, "significantStrikes": 66, "significantStrikesAttempted": 152}, "fighterB": {"ko": 0, "strikes": 122, "takedowns": 4, "legStrikes": 7, "bodyStrikes": 18, "controlTime": 285, "headStrikes": 59, "submissions": 0, "strikesAttempted": 189, "significantStrikes": 84, "significantStrikesAttempted": 150}}	7
401618436	600039754	3068125	2024-05-08 00:52:44.164	2024-03-10 04:05:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 39, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 5, "controlTime": 11, "headStrikes": 24, "submissions": 0, "strikesAttempted": 82, "significantStrikes": 36, "significantStrikesAttempted": 78}, "fighterB": {"ko": 0, "strikes": 111, "takedowns": 11, "legStrikes": 0, "bodyStrikes": 9, "controlTime": 421, "headStrikes": 48, "submissions": 0, "strikesAttempted": 163, "significantStrikes": 57, "significantStrikesAttempted": 102}}	8
401655684	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:02:00	Flyweight	\N	3 Round (5 min)	f	\N	12
401657357	600044413	\N	2024-05-08 00:53:02.772	2024-05-05 00:02:00	Flyweight	\N	3 Round (5 min)	f	\N	13
401655688	600044936	\N	2024-05-08 00:53:03.395	2024-04-19 18:30:00	ONE Strawweight Championship	\N		f	\N	1
401655689	600044936	\N	2024-05-08 00:53:03.395	2024-04-19 18:31:00	\N	\N		f	\N	2
401618437	600039754	4237015	2024-05-08 00:52:44.164	2024-03-10 04:05:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 52, "takedowns": 1, "legStrikes": 12, "bodyStrikes": 17, "controlTime": 24, "headStrikes": 23, "submissions": 0, "strikesAttempted": 140, "significantStrikes": 52, "significantStrikesAttempted": 140}, "fighterB": {"ko": 0, "strikes": 115, "takedowns": 0, "legStrikes": 23, "bodyStrikes": 17, "controlTime": 2, "headStrikes": 74, "submissions": 0, "strikesAttempted": 276, "significantStrikes": 114, "significantStrikesAttempted": 275}}	9
401640420	600039754	2959588	2024-05-08 00:52:44.164	2024-03-10 04:06:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 73, "takedowns": 2, "legStrikes": 23, "bodyStrikes": 7, "controlTime": 334, "headStrikes": 37, "submissions": 0, "strikesAttempted": 121, "significantStrikes": 67, "significantStrikesAttempted": 115}, "fighterB": {"ko": 0, "strikes": 119, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 9, "controlTime": 16, "headStrikes": 33, "submissions": 0, "strikesAttempted": 171, "significantStrikes": 47, "significantStrikesAttempted": 97}}	10
401628004	600039754	4418962	2024-05-08 00:52:44.164	2024-03-10 04:45:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 1, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 0, "submissions": 0, "strikesAttempted": 4, "significantStrikes": 1, "significantStrikesAttempted": 4}, "fighterB": {"ko": 0, "strikes": 11, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 6, "controlTime": 18, "headStrikes": 5, "submissions": 1, "strikesAttempted": 15, "significantStrikes": 11, "significantStrikesAttempted": 15}}	11
401628003	600039754	5189560	2024-05-08 00:52:44.164	2024-03-10 04:45:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 2, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 1, "submissions": 0, "strikesAttempted": 5, "significantStrikes": 2, "significantStrikesAttempted": 5}, "fighterB": {"ko": 1, "strikes": 7, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 2, "headStrikes": 7, "submissions": 0, "strikesAttempted": 9, "significantStrikes": 7, "significantStrikesAttempted": 9}}	12
401612975	600039754	4294926	2024-05-08 00:52:44.164	2024-03-10 04:06:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 85, "takedowns": 9, "legStrikes": 13, "bodyStrikes": 9, "controlTime": 572, "headStrikes": 22, "submissions": 0, "strikesAttempted": 132, "significantStrikes": 44, "significantStrikesAttempted": 77}, "fighterB": {"ko": 0, "strikes": 66, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 14, "controlTime": 14, "headStrikes": 13, "submissions": 0, "strikesAttempted": 92, "significantStrikes": 29, "significantStrikesAttempted": 53}}	13
401635439	600039754	3028064	2024-05-08 00:52:44.164	2024-03-10 04:06:00	Women's Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 173, "takedowns": 1, "legStrikes": 23, "bodyStrikes": 39, "controlTime": 12, "headStrikes": 74, "submissions": 0, "strikesAttempted": 290, "significantStrikes": 136, "significantStrikesAttempted": 249}, "fighterB": {"ko": 0, "strikes": 156, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 23, "controlTime": 371, "headStrikes": 79, "submissions": 0, "strikesAttempted": 255, "significantStrikes": 102, "significantStrikesAttempted": 195}}	14
401649539	600044035	4349719	2024-05-08 00:52:45.763	2024-03-22 02:01:00	\N	\N		f	\N	1
401649540	600044035	5099723	2024-05-08 00:52:45.763	2024-03-22 02:01:00	\N	\N		f	\N	2
401649541	600044035	4848704	2024-05-08 00:52:45.763	2024-03-22 02:01:00	\N	\N		f	\N	3
401654042	600044695	4371005	2024-05-08 00:52:45.862	2024-04-09 22:00:00	Bantamweight Title	\N		t	\N	1
401654043	600044695	5149924	2024-05-08 00:52:45.862	2024-04-09 22:00:00	\N	\N		f	\N	2
401649542	600044036	4030249	2024-05-08 00:52:45.931	2024-03-22 02:02:00	Light Heavyweight Title	\N		t	\N	1
401649543	600044036	5146696	2024-05-08 00:52:45.931	2024-03-22 02:02:00	\N	\N		f	\N	2
401649544	600044036	4709157	2024-05-08 00:52:45.931	2024-03-22 02:02:00	Cage Warriors Bantamweight Title	\N		t	\N	3
401630739	600041993	3093559	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Heavyweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 73, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 4, "controlTime": 168, "headStrikes": 23, "submissions": 1, "strikesAttempted": 96, "significantStrikes": 27, "significantStrikesAttempted": 41}, "fighterB": {"ko": 0, "strikes": 18, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 9, "submissions": 0, "strikesAttempted": 27, "significantStrikes": 15, "significantStrikesAttempted": 24}}	1
401634801	600041993	\N	2024-05-08 00:52:46.056	2024-04-11 16:55:00	Welterweight	\N	3 Round (5 min)	f	\N	2
401634774	600041993	2500735	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 143, "takedowns": 0, "legStrikes": 13, "bodyStrikes": 32, "controlTime": 6, "headStrikes": 98, "submissions": 0, "strikesAttempted": 276, "significantStrikes": 143, "significantStrikesAttempted": 276}, "fighterB": {"ko": 0, "strikes": 106, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 19, "controlTime": 8, "headStrikes": 85, "submissions": 0, "strikesAttempted": 250, "significantStrikes": 106, "significantStrikesAttempted": 250}}	3
401634778	600041993	4875511	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 97, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 4, "controlTime": 199, "headStrikes": 43, "submissions": 0, "strikesAttempted": 135, "significantStrikes": 48, "significantStrikesAttempted": 76}, "fighterB": {"ko": 0, "strikes": 56, "takedowns": 7, "legStrikes": 3, "bodyStrikes": 2, "controlTime": 562, "headStrikes": 17, "submissions": 2, "strikesAttempted": 89, "significantStrikes": 22, "significantStrikesAttempted": 44}}	4
401630740	600041993	4334306	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Women's Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 29, "takedowns": 1, "legStrikes": 1, "bodyStrikes": 0, "controlTime": 52, "headStrikes": 1, "submissions": 0, "strikesAttempted": 35, "significantStrikes": 2, "significantStrikesAttempted": 6}, "fighterB": {"ko": 0, "strikes": 5, "takedowns": 2, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 148, "headStrikes": 3, "submissions": 1, "strikesAttempted": 11, "significantStrikes": 4, "significantStrikesAttempted": 10}}	5
401634799	600041993	2553261	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 30, "takedowns": 3, "legStrikes": 2, "bodyStrikes": 2, "controlTime": 303, "headStrikes": 7, "submissions": 2, "strikesAttempted": 36, "significantStrikes": 11, "significantStrikesAttempted": 17}, "fighterB": {"ko": 0, "strikes": 25, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 0, "controlTime": 3, "headStrikes": 9, "submissions": 0, "strikesAttempted": 50, "significantStrikes": 12, "significantStrikesAttempted": 37}}	6
401634775	600041993	4339145	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 10, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 311, "headStrikes": 3, "submissions": 1, "strikesAttempted": 15, "significantStrikes": 3, "significantStrikesAttempted": 7}, "fighterB": {"ko": 0, "strikes": 18, "takedowns": 1, "legStrikes": 1, "bodyStrikes": 5, "controlTime": 34, "headStrikes": 2, "submissions": 0, "strikesAttempted": 20, "significantStrikes": 8, "significantStrikesAttempted": 9}}	7
401634800	600041993	4319785	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Women's Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 100, "takedowns": 2, "legStrikes": 2, "bodyStrikes": 13, "controlTime": 422, "headStrikes": 43, "submissions": 0, "strikesAttempted": 176, "significantStrikes": 58, "significantStrikesAttempted": 130}, "fighterB": {"ko": 0, "strikes": 49, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 9, "controlTime": 26, "headStrikes": 37, "submissions": 0, "strikesAttempted": 108, "significantStrikes": 47, "significantStrikesAttempted": 105}}	8
401634802	600041993	3896934	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 43, "takedowns": 1, "legStrikes": 1, "bodyStrikes": 2, "controlTime": 201, "headStrikes": 18, "submissions": 2, "strikesAttempted": 66, "significantStrikes": 21, "significantStrikesAttempted": 35}, "fighterB": {"ko": 0, "strikes": 1, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 4, "headStrikes": 0, "submissions": 0, "strikesAttempted": 6, "significantStrikes": 0, "significantStrikesAttempted": 5}}	9
401634776	600041993	4702589	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 89, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 20, "controlTime": 3, "headStrikes": 59, "submissions": 0, "strikesAttempted": 205, "significantStrikes": 87, "significantStrikesAttempted": 202}, "fighterB": {"ko": 0, "strikes": 56, "takedowns": 4, "legStrikes": 6, "bodyStrikes": 11, "controlTime": 328, "headStrikes": 28, "submissions": 1, "strikesAttempted": 119, "significantStrikes": 45, "significantStrikesAttempted": 107}}	10
401634803	600041993	4901883	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 8, "takedowns": 1, "legStrikes": 3, "bodyStrikes": 0, "controlTime": 56, "headStrikes": 1, "submissions": 0, "strikesAttempted": 17, "significantStrikes": 4, "significantStrikesAttempted": 11}, "fighterB": {"ko": 0, "strikes": 3, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 0, "headStrikes": 1, "submissions": 4, "strikesAttempted": 5, "significantStrikes": 3, "significantStrikesAttempted": 5}}	11
401646556	600041993	3955778	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 53, "takedowns": 2, "legStrikes": 12, "bodyStrikes": 3, "controlTime": 396, "headStrikes": 10, "submissions": 1, "strikesAttempted": 72, "significantStrikes": 25, "significantStrikesAttempted": 39}, "fighterB": {"ko": 0, "strikes": 28, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 5, "controlTime": 21, "headStrikes": 4, "submissions": 0, "strikesAttempted": 65, "significantStrikes": 16, "significantStrikesAttempted": 48}}	12
401634804	600041993	4816062	2024-05-08 00:52:46.056	2024-04-11 16:54:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 144, "takedowns": 0, "legStrikes": 18, "bodyStrikes": 10, "controlTime": 94, "headStrikes": 57, "submissions": 0, "strikesAttempted": 220, "significantStrikes": 85, "significantStrikesAttempted": 155}, "fighterB": {"ko": 0, "strikes": 26, "takedowns": 4, "legStrikes": 3, "bodyStrikes": 2, "controlTime": 324, "headStrikes": 16, "submissions": 0, "strikesAttempted": 70, "significantStrikes": 21, "significantStrikesAttempted": 65}}	13
401638363	600042873	3112020	2024-05-08 00:52:47.551	2024-03-22 19:52:00	Bellator Light Heavyweight Title	\N		t	\N	1
401643876	600042873	2532870	2024-05-08 00:52:47.551	2024-03-22 19:52:00	Bellator Featherweight Title	\N		t	\N	2
401639768	600042873	4341543	2024-05-08 00:52:47.551	2024-03-22 18:42:00	Middleweight	\N		f	\N	3
401639770	600042873	5085291	2024-05-08 00:52:47.551	2024-03-23 00:14:00	Lightweight	\N		f	\N	5
401639769	600042873	3028866	2024-05-08 00:52:47.551	2024-03-22 18:12:00	Featherweight	\N		f	\N	5
401639771	600042873	4881912	2024-05-08 00:52:47.551	2024-03-23 00:14:00	Bantamweight	\N		f	\N	6
401639774	600042873	5080573	2024-05-08 00:52:47.551	2024-03-22 16:38:00	Heavyweight	\N		f	\N	8
401643878	600042873	4875324	2024-05-08 00:52:47.551	2024-03-22 16:38:00	Light Heavyweight	\N		f	\N	9
401630741	600041994	3032973	2024-05-08 00:52:48.13	2024-03-24 02:40:00	Women's Flyweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 169, "takedowns": 1, "legStrikes": 4, "bodyStrikes": 44, "controlTime": 419, "headStrikes": 45, "submissions": 0, "strikesAttempted": 281, "significantStrikes": 93, "significantStrikesAttempted": 188}, "fighterB": {"ko": 0, "strikes": 137, "takedowns": 4, "legStrikes": 25, "bodyStrikes": 19, "controlTime": 98, "headStrikes": 39, "submissions": 0, "strikesAttempted": 342, "significantStrikes": 83, "significantStrikesAttempted": 270}}	1
401647483	600041994	4915907	2024-05-08 00:52:48.13	2024-03-24 02:41:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 27, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 6, "controlTime": 0, "headStrikes": 15, "submissions": 0, "strikesAttempted": 50, "significantStrikes": 21, "significantStrikesAttempted": 43}, "fighterB": {"ko": 0, "strikes": 123, "takedowns": 7, "legStrikes": 7, "bodyStrikes": 7, "controlTime": 631, "headStrikes": 26, "submissions": 1, "strikesAttempted": 176, "significantStrikes": 40, "significantStrikesAttempted": 61}}	2
401647484	600041994	4354318	2024-05-08 00:52:48.13	2024-03-24 02:41:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 31, "takedowns": 1, "legStrikes": 6, "bodyStrikes": 2, "controlTime": 49, "headStrikes": 19, "submissions": 0, "strikesAttempted": 51, "significantStrikes": 27, "significantStrikesAttempted": 43}, "fighterB": {"ko": 0, "strikes": 20, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 2, "controlTime": 75, "headStrikes": 7, "submissions": 0, "strikesAttempted": 54, "significantStrikes": 15, "significantStrikesAttempted": 46}}	3
401637515	600041994	5144008	2024-05-08 00:52:48.13	2024-03-24 02:41:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 33, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 11, "controlTime": 0, "headStrikes": 13, "submissions": 0, "strikesAttempted": 66, "significantStrikes": 31, "significantStrikesAttempted": 64}, "fighterB": {"ko": 1, "strikes": 83, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 21, "controlTime": 30, "headStrikes": 52, "submissions": 0, "strikesAttempted": 135, "significantStrikes": 79, "significantStrikesAttempted": 129}}	4
401648336	600041994	4351319	2024-05-08 00:52:48.13	2024-03-24 02:41:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 26, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 0, "controlTime": 21, "headStrikes": 8, "submissions": 0, "strikesAttempted": 74, "significantStrikes": 10, "significantStrikesAttempted": 50}, "fighterB": {"ko": 0, "strikes": 37, "takedowns": 2, "legStrikes": 10, "bodyStrikes": 5, "controlTime": 175, "headStrikes": 18, "submissions": 2, "strikesAttempted": 62, "significantStrikes": 33, "significantStrikesAttempted": 56}}	5
401637045	600041994	4239738	2024-05-08 00:52:48.13	2024-03-24 02:41:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 35, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 6, "controlTime": 47, "headStrikes": 24, "submissions": 1, "strikesAttempted": 64, "significantStrikes": 34, "significantStrikesAttempted": 61}, "fighterB": {"ko": 0, "strikes": 7, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 2, "controlTime": 0, "headStrikes": 1, "submissions": 0, "strikesAttempted": 15, "significantStrikes": 5, "significantStrikesAttempted": 13}}	6
401637041	600041994	4294378	2024-05-08 00:52:48.13	2024-03-24 02:41:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 129, "takedowns": 0, "legStrikes": 11, "bodyStrikes": 9, "controlTime": 10, "headStrikes": 9, "submissions": 0, "strikesAttempted": 188, "significantStrikes": 29, "significantStrikesAttempted": 68}, "fighterB": {"ko": 0, "strikes": 225, "takedowns": 3, "legStrikes": 9, "bodyStrikes": 4, "controlTime": 669, "headStrikes": 22, "submissions": 0, "strikesAttempted": 320, "significantStrikes": 35, "significantStrikesAttempted": 66}}	7
401637042	600041994	3955577	2024-05-08 00:52:48.13	2024-03-24 02:41:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 12, "takedowns": 2, "legStrikes": 1, "bodyStrikes": 1, "controlTime": 87, "headStrikes": 5, "submissions": 0, "strikesAttempted": 23, "significantStrikes": 7, "significantStrikesAttempted": 17}, "fighterB": {"ko": 0, "strikes": 11, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 0, "headStrikes": 2, "submissions": 1, "strikesAttempted": 21, "significantStrikes": 4, "significantStrikesAttempted": 11}}	8
401647485	600041994	4010864	2024-05-08 00:52:48.13	2024-03-24 02:41:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 52, "takedowns": 1, "legStrikes": 5, "bodyStrikes": 4, "controlTime": 115, "headStrikes": 9, "submissions": 0, "strikesAttempted": 108, "significantStrikes": 18, "significantStrikesAttempted": 62}, "fighterB": {"ko": 0, "strikes": 64, "takedowns": 2, "legStrikes": 2, "bodyStrikes": 5, "controlTime": 389, "headStrikes": 18, "submissions": 0, "strikesAttempted": 137, "significantStrikes": 25, "significantStrikesAttempted": 79}}	9
401636107	600041994	5093447	2024-05-08 00:52:48.131	2024-03-24 02:41:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 63, "takedowns": 1, "legStrikes": 8, "bodyStrikes": 8, "controlTime": 23, "headStrikes": 47, "submissions": 0, "strikesAttempted": 227, "significantStrikes": 63, "significantStrikesAttempted": 226}, "fighterB": {"ko": 1, "strikes": 106, "takedowns": 0, "legStrikes": 25, "bodyStrikes": 29, "controlTime": 12, "headStrikes": 51, "submissions": 0, "strikesAttempted": 208, "significantStrikes": 105, "significantStrikesAttempted": 207}}	10
401655679	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 20:18:00	Bantamweight	\N	3 Round (5 min)	f	\N	1
401655678	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	\N	\N		f	\N	1
401630742	600041994	4894780	2024-05-08 00:52:48.131	2024-03-24 02:41:00	Women's Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 73, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 21, "controlTime": 1, "headStrikes": 36, "submissions": 0, "strikesAttempted": 171, "significantStrikes": 57, "significantStrikesAttempted": 150}, "fighterB": {"ko": 0, "strikes": 28, "takedowns": 3, "legStrikes": 2, "bodyStrikes": 4, "controlTime": 324, "headStrikes": 19, "submissions": 0, "strikesAttempted": 156, "significantStrikes": 25, "significantStrikesAttempted": 147}}	11
401640423	600041994	5157669	2024-05-08 00:52:48.131	2024-03-24 02:41:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 40, "takedowns": 5, "legStrikes": 10, "bodyStrikes": 9, "controlTime": 180, "headStrikes": 17, "submissions": 0, "strikesAttempted": 85, "significantStrikes": 36, "significantStrikesAttempted": 78}, "fighterB": {"ko": 0, "strikes": 38, "takedowns": 1, "legStrikes": 6, "bodyStrikes": 8, "controlTime": 24, "headStrikes": 16, "submissions": 2, "strikesAttempted": 66, "significantStrikes": 30, "significantStrikesAttempted": 58}}	12
401637040	600041994	5060505	2024-05-08 00:52:48.131	2024-03-24 02:41:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 57, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 30, "controlTime": 0, "headStrikes": 26, "submissions": 0, "strikesAttempted": 168, "significantStrikes": 57, "significantStrikesAttempted": 167}, "fighterB": {"ko": 0, "strikes": 72, "takedowns": 0, "legStrikes": 31, "bodyStrikes": 4, "controlTime": 0, "headStrikes": 37, "submissions": 0, "strikesAttempted": 150, "significantStrikes": 72, "significantStrikesAttempted": 150}}	13
401654004	600044662	2558487	2024-05-08 00:52:50.028	2024-04-08 19:41:00	\N	\N		f	\N	1
401652816	600044493	4424478	2024-05-08 00:52:50.059	2024-04-02 01:14:00	\N	\N		f	\N	1
401652817	600044493	5092208	2024-05-08 00:52:50.059	2024-04-02 01:14:00	\N	\N		f	\N	2
401653759	600044573	4712353	2024-05-08 00:52:50.121	2024-04-06 20:51:00	\N	\N		f	\N	1
401653760	600044573	5147737	2024-05-08 00:52:50.121	2024-04-06 20:51:00	\N	\N		f	\N	2
401653761	600044573	4848673	2024-05-08 00:52:50.121	2024-04-06 20:51:00	\N	\N		f	\N	3
401653762	600044573	2499867	2024-05-08 00:52:50.121	2024-04-06 20:51:00	\N	\N		f	\N	4
401622059	600041055	4608674	2024-05-08 00:52:50.275	2024-04-11 16:27:00	Women's Flyweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 135, "takedowns": 0, "legStrikes": 25, "bodyStrikes": 25, "controlTime": 48, "headStrikes": 80, "submissions": 1, "strikesAttempted": 394, "significantStrikes": 130, "significantStrikesAttempted": 386}, "fighterB": {"ko": 0, "strikes": 181, "takedowns": 1, "legStrikes": 11, "bodyStrikes": 18, "controlTime": 53, "headStrikes": 143, "submissions": 0, "strikesAttempted": 369, "significantStrikes": 172, "significantStrikesAttempted": 359}}	1
401641171	600041055	4024714	2024-05-08 00:52:50.275	2024-04-11 16:27:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 22, "takedowns": 0, "legStrikes": 10, "bodyStrikes": 4, "controlTime": 9, "headStrikes": 7, "submissions": 0, "strikesAttempted": 65, "significantStrikes": 21, "significantStrikesAttempted": 63}, "fighterB": {"ko": 0, "strikes": 63, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 6, "controlTime": 49, "headStrikes": 42, "submissions": 0, "strikesAttempted": 142, "significantStrikes": 55, "significantStrikesAttempted": 131}}	2
401619308	600041055	2553993	2024-05-08 00:52:50.275	2024-04-11 16:27:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 88, "takedowns": 1, "legStrikes": 17, "bodyStrikes": 14, "controlTime": 195, "headStrikes": 44, "submissions": 0, "strikesAttempted": 129, "significantStrikes": 75, "significantStrikesAttempted": 111}, "fighterB": {"ko": 0, "strikes": 30, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 0, "headStrikes": 28, "submissions": 0, "strikesAttempted": 88, "significantStrikes": 30, "significantStrikesAttempted": 88}}	3
401641172	600041055	4422103	2024-05-08 00:52:50.275	2024-04-11 16:27:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 12, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 4, "headStrikes": 11, "submissions": 0, "strikesAttempted": 32, "significantStrikes": 12, "significantStrikesAttempted": 32}, "fighterB": {"ko": 0, "strikes": 1, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 0, "controlTime": 0, "headStrikes": 1, "submissions": 0, "strikesAttempted": 16, "significantStrikes": 1, "significantStrikesAttempted": 16}}	4
401641169	600041055	4408436	2024-05-08 00:52:50.275	2024-04-11 16:27:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 44, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 11, "controlTime": 0, "headStrikes": 11, "submissions": 0, "strikesAttempted": 73, "significantStrikes": 30, "significantStrikesAttempted": 58}, "fighterB": {"ko": 0, "strikes": 40, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 6, "controlTime": 48, "headStrikes": 20, "submissions": 0, "strikesAttempted": 68, "significantStrikes": 32, "significantStrikesAttempted": 59}}	5
401634320	600041055	2959422	2024-05-08 00:52:50.275	2024-04-11 16:27:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 96, "takedowns": 0, "legStrikes": 29, "bodyStrikes": 18, "controlTime": 53, "headStrikes": 17, "submissions": 0, "strikesAttempted": 139, "significantStrikes": 64, "significantStrikesAttempted": 98}, "fighterB": {"ko": 0, "strikes": 40, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 5, "controlTime": 401, "headStrikes": 21, "submissions": 0, "strikesAttempted": 105, "significantStrikes": 30, "significantStrikesAttempted": 93}}	6
401656368	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 20:18:00	Bantamweight	\N	3 Round (5 min)	f	\N	2
401656400	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	Welterweight	\N		f	\N	3
401655796	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 20:18:00	Bantamweight	\N	3 Round (5 min)	f	\N	3
401647486	600041055	3821549	2024-05-08 00:52:50.276	2024-04-11 16:27:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 37, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 3, "controlTime": 5, "headStrikes": 34, "submissions": 0, "strikesAttempted": 76, "significantStrikes": 37, "significantStrikesAttempted": 76}, "fighterB": {"ko": 0, "strikes": 39, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 13, "controlTime": 1, "headStrikes": 24, "submissions": 0, "strikesAttempted": 78, "significantStrikes": 39, "significantStrikesAttempted": 78}}	7
401637620	600041055	4289516	2024-05-08 00:52:50.276	2024-04-11 16:27:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 86, "takedowns": 2, "legStrikes": 0, "bodyStrikes": 3, "controlTime": 395, "headStrikes": 27, "submissions": 3, "strikesAttempted": 180, "significantStrikes": 30, "significantStrikesAttempted": 108}, "fighterB": {"ko": 0, "strikes": 50, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 11, "controlTime": 112, "headStrikes": 25, "submissions": 0, "strikesAttempted": 116, "significantStrikes": 38, "significantStrikesAttempted": 95}}	8
401636219	600041055	4227122	2024-05-08 00:52:50.276	2024-04-11 16:27:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 20, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 5, "controlTime": 76, "headStrikes": 9, "submissions": 0, "strikesAttempted": 63, "significantStrikes": 15, "significantStrikesAttempted": 57}, "fighterB": {"ko": 2, "strikes": 29, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 9, "controlTime": 8, "headStrikes": 19, "submissions": 0, "strikesAttempted": 79, "significantStrikes": 29, "significantStrikesAttempted": 79}}	9
401641174	600041055	4686735	2024-05-08 00:52:50.276	2024-04-11 16:27:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 84, "takedowns": 0, "legStrikes": 21, "bodyStrikes": 18, "controlTime": 6, "headStrikes": 44, "submissions": 0, "strikesAttempted": 202, "significantStrikes": 83, "significantStrikesAttempted": 201}, "fighterB": {"ko": 0, "strikes": 62, "takedowns": 1, "legStrikes": 9, "bodyStrikes": 14, "controlTime": 40, "headStrikes": 37, "submissions": 0, "strikesAttempted": 140, "significantStrikes": 60, "significantStrikesAttempted": 138}}	10
401636108	600041055	4684240	2024-05-08 00:52:50.276	2024-04-11 16:27:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 76, "takedowns": 0, "legStrikes": 13, "bodyStrikes": 4, "controlTime": 1, "headStrikes": 57, "submissions": 0, "strikesAttempted": 183, "significantStrikes": 74, "significantStrikesAttempted": 180}, "fighterB": {"ko": 0, "strikes": 58, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 11, "controlTime": 18, "headStrikes": 36, "submissions": 0, "strikesAttempted": 162, "significantStrikes": 55, "significantStrikesAttempted": 157}}	11
401639419	600041055	4687434	2024-05-08 00:52:50.276	2024-04-11 16:27:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 21, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 4, "controlTime": 32, "headStrikes": 16, "submissions": 0, "strikesAttempted": 41, "significantStrikes": 20, "significantStrikesAttempted": 40}, "fighterB": {"ko": 0, "strikes": 13, "takedowns": 1, "legStrikes": 5, "bodyStrikes": 2, "controlTime": 13, "headStrikes": 6, "submissions": 0, "strikesAttempted": 43, "significantStrikes": 13, "significantStrikesAttempted": 42}}	12
401634319	600041055	5077789	2024-05-08 00:52:50.276	2024-04-11 16:27:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 95, "takedowns": 0, "legStrikes": 12, "bodyStrikes": 32, "controlTime": 9, "headStrikes": 44, "submissions": 0, "strikesAttempted": 241, "significantStrikes": 88, "significantStrikesAttempted": 234}, "fighterB": {"ko": 0, "strikes": 148, "takedowns": 3, "legStrikes": 10, "bodyStrikes": 18, "controlTime": 282, "headStrikes": 112, "submissions": 0, "strikesAttempted": 286, "significantStrikes": 140, "significantStrikesAttempted": 268}}	13
401658231	600045360	5210074	2024-05-08 00:52:51.964	2024-05-04 00:01:00	Lightweight Title	\N		t	\N	1
401641165	600043113	4076780	2024-05-08 00:52:51.994	2024-04-05 00:59:00	Heavyweight	\N		f	\N	1
401647701	600043113	3024604	2024-05-08 00:52:51.994	2024-04-05 00:37:00	Heavyweight	\N		f	\N	2
401647702	600043113	2554674	2024-05-08 00:52:51.994	2024-04-05 00:00:00	Women's Flyweight	\N		f	\N	3
401641499	600043113	5080570	2024-05-08 00:52:51.994	2024-04-04 23:20:00	Women's Flyweight	\N		f	\N	4
401647703	600043113	4215221	2024-05-08 00:52:51.994	2024-04-04 22:46:00	Heavyweight	\N		f	\N	5
401647704	600043113	4293151	2024-05-08 00:52:51.994	2024-04-04 22:22:00	Heavyweight	\N		f	\N	6
401647705	600043113	3170347	2024-05-08 00:52:51.994	2024-04-04 21:44:00	Women's Flyweight	\N		f	\N	7
401647706	600043113	4336342	2024-05-08 00:52:51.994	2024-04-04 21:30:00	Heavyweight	\N		f	\N	8
401647707	600043113	4609439	2024-05-08 00:52:51.994	2024-04-04 21:07:00	Women's Flyweight	\N		f	\N	9
401647708	600043113	5110272	2024-05-08 00:52:51.994	2024-04-04 20:36:00	Women's Lightweight	\N		f	\N	10
401647711	600043113	4033449	2024-05-08 00:52:51.994	2024-04-04 20:24:00	Featherweight	\N		f	\N	11
401651462	600043113	5127795	2024-05-08 00:52:51.994	2024-04-04 19:56:00	Bantamweight	\N		f	\N	12
401656572	600045143	4836889	2024-05-08 00:52:52.567	2024-04-26 20:06:00	LFA Flyweight Title	\N		t	\N	1
401656573	600045143	5138563	2024-05-08 00:52:52.567	2024-04-26 20:06:00	\N	\N		f	\N	2
401656574	600045143	4701012	2024-05-08 00:52:52.567	2024-04-26 20:06:00	\N	\N		f	\N	3
401654044	600044696	4312859	2024-05-08 00:52:52.69	2024-04-09 22:00:00	Lightweight Title	\N		t	\N	1
401654045	600044696	4695351	2024-05-08 00:52:52.69	2024-04-09 22:00:00	\N	\N		f	\N	2
401654046	600044696	4426144	2024-05-08 00:52:52.69	2024-04-09 22:00:00	\N	\N		f	\N	3
401653873	600044613	4379868	2024-05-08 00:52:52.807	2024-04-07 16:09:00	Cage Warriors Welterweight Title	\N		t	\N	1
401653874	600044613	4712360	2024-05-08 00:52:52.807	2024-04-07 16:09:00	\N	\N		f	\N	2
401653875	600044613	4024129	2024-05-08 00:52:52.807	2024-04-07 16:09:00	\N	\N		f	\N	3
401656401	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	Lightweight	\N		f	\N	4
401656402	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	Light Heavyweight	\N		f	\N	5
401625039	600041733	4025699	2024-05-08 00:52:52.943	2024-04-06 22:23:00	Middleweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 141, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 25, "controlTime": 78, "headStrikes": 96, "submissions": 0, "strikesAttempted": 261, "significantStrikes": 124, "significantStrikesAttempted": 241}, "fighterB": {"ko": 0, "strikes": 128, "takedowns": 6, "legStrikes": 15, "bodyStrikes": 25, "controlTime": 365, "headStrikes": 72, "submissions": 0, "strikesAttempted": 242, "significantStrikes": 112, "significantStrikesAttempted": 222}}	1
401643537	600041733	3099187	2024-05-08 00:52:52.943	2024-04-06 22:23:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 85, "takedowns": 3, "legStrikes": 12, "bodyStrikes": 10, "controlTime": 378, "headStrikes": 20, "submissions": 0, "strikesAttempted": 135, "significantStrikes": 42, "significantStrikesAttempted": 85}, "fighterB": {"ko": 1, "strikes": 56, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 6, "controlTime": 142, "headStrikes": 20, "submissions": 0, "strikesAttempted": 119, "significantStrikes": 32, "significantStrikesAttempted": 87}}	2
401648097	600041733	4040926	2024-05-08 00:52:52.943	2024-04-06 22:24:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 121, "takedowns": 1, "legStrikes": 19, "bodyStrikes": 10, "controlTime": 218, "headStrikes": 42, "submissions": 0, "strikesAttempted": 199, "significantStrikes": 71, "significantStrikesAttempted": 137}, "fighterB": {"ko": 0, "strikes": 75, "takedowns": 2, "legStrikes": 3, "bodyStrikes": 16, "controlTime": 222, "headStrikes": 30, "submissions": 1, "strikesAttempted": 139, "significantStrikes": 49, "significantStrikesAttempted": 104}}	3
401636139	600041733	4038116	2024-05-08 00:52:52.943	2024-04-06 22:24:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 18, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 3, "controlTime": 10, "headStrikes": 7, "submissions": 0, "strikesAttempted": 46, "significantStrikes": 17, "significantStrikesAttempted": 45}, "fighterB": {"ko": 1, "strikes": 40, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 8, "controlTime": 15, "headStrikes": 26, "submissions": 0, "strikesAttempted": 69, "significantStrikes": 40, "significantStrikesAttempted": 68}}	4
401643536	600041733	4786358	2024-05-08 00:52:52.943	2024-04-06 22:23:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 100, "takedowns": 4, "legStrikes": 16, "bodyStrikes": 18, "controlTime": 341, "headStrikes": 20, "submissions": 0, "strikesAttempted": 153, "significantStrikes": 54, "significantStrikesAttempted": 100}, "fighterB": {"ko": 0, "strikes": 62, "takedowns": 2, "legStrikes": 9, "bodyStrikes": 6, "controlTime": 195, "headStrikes": 32, "submissions": 0, "strikesAttempted": 118, "significantStrikes": 47, "significantStrikesAttempted": 97}}	5
401643539	600041733	3088232	2024-05-08 00:52:52.943	2024-04-06 22:23:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 78, "takedowns": 1, "legStrikes": 17, "bodyStrikes": 29, "controlTime": 200, "headStrikes": 14, "submissions": 0, "strikesAttempted": 184, "significantStrikes": 60, "significantStrikesAttempted": 160}, "fighterB": {"ko": 0, "strikes": 42, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 9, "controlTime": 0, "headStrikes": 26, "submissions": 1, "strikesAttempted": 149, "significantStrikes": 38, "significantStrikesAttempted": 141}}	6
401643540	600041733	4710386	2024-05-08 00:52:52.943	2024-04-06 22:23:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 135, "takedowns": 0, "legStrikes": 15, "bodyStrikes": 16, "controlTime": 43, "headStrikes": 27, "submissions": 0, "strikesAttempted": 200, "significantStrikes": 58, "significantStrikesAttempted": 102}, "fighterB": {"ko": 0, "strikes": 56, "takedowns": 4, "legStrikes": 8, "bodyStrikes": 6, "controlTime": 439, "headStrikes": 19, "submissions": 0, "strikesAttempted": 101, "significantStrikes": 33, "significantStrikesAttempted": 67}}	7
401635962	600041733	4418784	2024-05-08 00:52:52.943	2024-04-06 22:23:00	Women's Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 91, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 7, "controlTime": 141, "headStrikes": 7, "submissions": 0, "strikesAttempted": 126, "significantStrikes": 16, "significantStrikesAttempted": 33}, "fighterB": {"ko": 0, "strikes": 49, "takedowns": 6, "legStrikes": 0, "bodyStrikes": 5, "controlTime": 604, "headStrikes": 6, "submissions": 0, "strikesAttempted": 76, "significantStrikes": 11, "significantStrikesAttempted": 29}}	8
401652996	600041733	4293183	2024-05-08 00:52:52.944	2024-04-06 22:23:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 58, "takedowns": 1, "legStrikes": 9, "bodyStrikes": 6, "controlTime": 430, "headStrikes": 27, "submissions": 0, "strikesAttempted": 128, "significantStrikes": 42, "significantStrikesAttempted": 106}, "fighterB": {"ko": 1, "strikes": 84, "takedowns": 0, "legStrikes": 16, "bodyStrikes": 21, "controlTime": 49, "headStrikes": 31, "submissions": 0, "strikesAttempted": 148, "significantStrikes": 68, "significantStrikesAttempted": 124}}	9
401643541	600041733	5149439	2024-05-08 00:52:52.944	2024-04-06 22:23:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 39, "takedowns": 9, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 361, "headStrikes": 13, "submissions": 0, "strikesAttempted": 69, "significantStrikes": 14, "significantStrikesAttempted": 39}, "fighterB": {"ko": 0, "strikes": 29, "takedowns": 2, "legStrikes": 8, "bodyStrikes": 1, "controlTime": 94, "headStrikes": 10, "submissions": 1, "strikesAttempted": 47, "significantStrikes": 19, "significantStrikesAttempted": 35}}	10
401656403	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	Lightweight	\N		f	\N	6
401656404	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	Middleweight	\N		f	\N	7
401651464	600041733	5144068	2024-05-08 00:52:52.944	2024-04-06 22:24:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 6, "takedowns": 3, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 353, "headStrikes": 0, "submissions": 0, "strikesAttempted": 11, "significantStrikes": 1, "significantStrikesAttempted": 5}, "fighterB": {"ko": 0, "strikes": 87, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 7, "controlTime": 12, "headStrikes": 21, "submissions": 0, "strikesAttempted": 101, "significantStrikes": 29, "significantStrikesAttempted": 38}}	11
401625041	600041733	4916974	2024-05-08 00:52:52.944	2024-04-06 22:23:00	Women's Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 60, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 13, "controlTime": 30, "headStrikes": 17, "submissions": 0, "strikesAttempted": 83, "significantStrikes": 36, "significantStrikesAttempted": 51}, "fighterB": {"ko": 0, "strikes": 13, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 320, "headStrikes": 9, "submissions": 0, "strikesAttempted": 28, "significantStrikes": 11, "significantStrikesAttempted": 24}}	12
401647712	600043114	4573208	2024-05-08 00:52:54.971	2024-04-13 00:13:00	Light Heavyweight	\N		f	\N	1
401641166	600043114	4249028	2024-05-08 00:52:54.971	2024-04-12 23:46:00	Light Heavyweight	\N		f	\N	2
401647782	600043114	2984772	2024-05-08 00:52:54.971	2024-04-12 23:46:00	Lightweight	\N		f	\N	3
401647783	600043114	4408081	2024-05-08 00:52:54.971	2024-04-12 22:44:00	Lightweight	\N		f	\N	4
401647784	600043114	4821018	2024-05-08 00:52:54.971	2024-04-12 23:47:00	Light Heavyweight	\N		f	\N	5
401647785	600043114	3108772	2024-05-08 00:52:54.971	2024-04-12 21:50:00	Light Heavyweight	\N		f	\N	6
401641500	600043114	4018603	2024-05-08 00:52:54.971	2024-04-12 21:22:00	Light Heavyweight	\N		f	\N	7
401647786	600043114	3902688	2024-05-08 00:52:54.971	2024-04-12 21:04:00	Lightweight	\N		f	\N	8
401647787	600043114	4423241	2024-05-08 00:52:54.971	2024-04-12 20:42:00	Lightweight	\N		f	\N	9
401647789	600043114	4875864	2024-05-08 00:52:54.971	2024-04-12 20:31:00	Lightweight	\N		f	\N	10
401647791	600043114	3968345	2024-05-08 00:52:54.971	2024-04-12 20:30:00	Heavyweight	\N		f	\N	11
401619309	600041053	4705658	2024-05-08 00:52:55.4	2024-04-14 03:22:00	UFC Light Heavyweight Title	\N	5 Round (5 min)	t	{"fighterA": {"ko": 0, "strikes": 12, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 3, "controlTime": 0, "headStrikes": 1, "submissions": 0, "strikesAttempted": 22, "significantStrikes": 12, "significantStrikesAttempted": 22}, "fighterB": {"ko": 1, "strikes": 24, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 6, "controlTime": 7, "headStrikes": 12, "submissions": 0, "strikesAttempted": 30, "significantStrikes": 24, "significantStrikesAttempted": 30}}	1
401629521	600041053	4350762	2024-05-08 00:52:55.4	2024-04-14 03:22:00	UFC Women's Strawweight Title	\N	5 Round (5 min)	t	{"fighterA": {"ko": 1, "strikes": 73, "takedowns": 3, "legStrikes": 18, "bodyStrikes": 4, "controlTime": 140, "headStrikes": 21, "submissions": 0, "strikesAttempted": 116, "significantStrikes": 43, "significantStrikesAttempted": 85}, "fighterB": {"ko": 0, "strikes": 256, "takedowns": 6, "legStrikes": 9, "bodyStrikes": 13, "controlTime": 764, "headStrikes": 84, "submissions": 2, "strikesAttempted": 327, "significantStrikes": 106, "significantStrikesAttempted": 157}}	2
401632020	600041053	2614933	2024-05-08 00:52:55.4	2024-04-14 03:45:00	Lightweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 181, "takedowns": 0, "legStrikes": 57, "bodyStrikes": 62, "controlTime": 0, "headStrikes": 62, "submissions": 0, "strikesAttempted": 309, "significantStrikes": 181, "significantStrikesAttempted": 309}, "fighterB": {"ko": 0, "strikes": 103, "takedowns": 0, "legStrikes": 33, "bodyStrikes": 26, "controlTime": 0, "headStrikes": 44, "submissions": 0, "strikesAttempted": 199, "significantStrikes": 103, "significantStrikesAttempted": 199}}	3
401626640	600041053	4419372	2024-05-08 00:52:55.4	2024-04-14 03:22:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 33, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 5, "controlTime": 152, "headStrikes": 11, "submissions": 4, "strikesAttempted": 53, "significantStrikes": 19, "significantStrikesAttempted": 37}, "fighterB": {"ko": 0, "strikes": 75, "takedowns": 2, "legStrikes": 2, "bodyStrikes": 10, "controlTime": 521, "headStrikes": 37, "submissions": 0, "strikesAttempted": 117, "significantStrikes": 49, "significantStrikesAttempted": 83}}	4
401619310	600041053	5061870	2024-05-08 00:52:55.4	2024-04-14 03:22:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 33, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 3, "controlTime": 3, "headStrikes": 1, "submissions": 0, "strikesAttempted": 41, "significantStrikes": 4, "significantStrikesAttempted": 12}, "fighterB": {"ko": 0, "strikes": 45, "takedowns": 3, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 445, "headStrikes": 6, "submissions": 2, "strikesAttempted": 59, "significantStrikes": 8, "significantStrikesAttempted": 13}}	5
401622061	600041053	3156612	2024-05-08 00:52:55.4	2024-04-14 03:45:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 69, "takedowns": 1, "legStrikes": 8, "bodyStrikes": 5, "controlTime": 38, "headStrikes": 56, "submissions": 0, "strikesAttempted": 118, "significantStrikes": 69, "significantStrikesAttempted": 118}, "fighterB": {"ko": 0, "strikes": 58, "takedowns": 0, "legStrikes": 23, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 34, "submissions": 0, "strikesAttempted": 109, "significantStrikes": 58, "significantStrikesAttempted": 109}}	6
401656405	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	Bantamweight	\N		f	\N	8
401656406	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	Women's Strawweight	\N		f	\N	11
401656407	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	Middleweight	\N		f	\N	12
401656408	600044933	\N	2024-05-08 00:53:03.489	2024-04-25 17:12:00	Women's Flyweight	\N		f	\N	13
401656409	600044933	\N	2024-05-08 00:53:03.489	2024-04-28 16:57:00	Women's Strawweight	\N		f	\N	14
401622063	600041053	3031559	2024-05-08 00:52:55.4	2024-04-14 03:22:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 89, "takedowns": 8, "legStrikes": 12, "bodyStrikes": 15, "controlTime": 643, "headStrikes": 12, "submissions": 0, "strikesAttempted": 128, "significantStrikes": 39, "significantStrikesAttempted": 71}, "fighterB": {"ko": 0, "strikes": 19, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 5, "headStrikes": 7, "submissions": 0, "strikesAttempted": 40, "significantStrikes": 8, "significantStrikesAttempted": 29}}	7
401634819	600041053	4332765	2024-05-08 00:52:55.401	2024-04-14 03:22:00	Women's Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 7, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 1, "controlTime": 15, "headStrikes": 1, "submissions": 0, "strikesAttempted": 17, "significantStrikes": 2, "significantStrikesAttempted": 12}, "fighterB": {"ko": 0, "strikes": 68, "takedowns": 2, "legStrikes": 1, "bodyStrikes": 4, "controlTime": 291, "headStrikes": 46, "submissions": 1, "strikesAttempted": 91, "significantStrikes": 51, "significantStrikesAttempted": 71}}	8
401635298	600041053	4881999	2024-05-08 00:52:55.401	2024-04-14 03:22:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 2, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 0, "controlTime": 0, "headStrikes": 1, "submissions": 0, "strikesAttempted": 5, "significantStrikes": 2, "significantStrikesAttempted": 5}, "fighterB": {"ko": 2, "strikes": 29, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 2, "controlTime": 34, "headStrikes": 21, "submissions": 0, "strikesAttempted": 35, "significantStrikes": 26, "significantStrikesAttempted": 32}}	9
401647436	600041053	3028863	2024-05-08 00:52:55.401	2024-04-14 03:22:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 87, "takedowns": 2, "legStrikes": 1, "bodyStrikes": 3, "controlTime": 350, "headStrikes": 32, "submissions": 0, "strikesAttempted": 128, "significantStrikes": 36, "significantStrikesAttempted": 67}, "fighterB": {"ko": 1, "strikes": 16, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 3, "controlTime": 2, "headStrikes": 10, "submissions": 0, "strikesAttempted": 40, "significantStrikes": 16, "significantStrikesAttempted": 40}}	10
401636110	600041053	3024395	2024-05-08 00:52:55.401	2024-04-14 03:23:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 124, "takedowns": 1, "legStrikes": 40, "bodyStrikes": 14, "controlTime": 233, "headStrikes": 35, "submissions": 0, "strikesAttempted": 220, "significantStrikes": 89, "significantStrikesAttempted": 180}, "fighterB": {"ko": 0, "strikes": 94, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 9, "controlTime": 0, "headStrikes": 70, "submissions": 1, "strikesAttempted": 241, "significantStrikes": 82, "significantStrikesAttempted": 228}}	11
401632019	600041053	2502364	2024-05-08 00:52:55.401	2024-04-14 03:23:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 58, "takedowns": 0, "legStrikes": 18, "bodyStrikes": 10, "controlTime": 1, "headStrikes": 29, "submissions": 0, "strikesAttempted": 145, "significantStrikes": 57, "significantStrikesAttempted": 144}, "fighterB": {"ko": 1, "strikes": 187, "takedowns": 1, "legStrikes": 10, "bodyStrikes": 40, "controlTime": 54, "headStrikes": 136, "submissions": 0, "strikesAttempted": 320, "significantStrikes": 186, "significantStrikesAttempted": 319}}	12
401630738	600041053	4189320	2024-05-08 00:52:55.401	2024-04-14 03:23:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 18, "takedowns": 0, "legStrikes": 10, "bodyStrikes": 0, "controlTime": 2, "headStrikes": 6, "submissions": 0, "strikesAttempted": 33, "significantStrikes": 16, "significantStrikesAttempted": 31}, "fighterB": {"ko": 0, "strikes": 21, "takedowns": 1, "legStrikes": 2, "bodyStrikes": 2, "controlTime": 223, "headStrikes": 9, "submissions": 2, "strikesAttempted": 27, "significantStrikes": 13, "significantStrikesAttempted": 19}}	13
401641167	600043115	4832859	2024-05-08 00:52:56.843	2024-04-20 01:18:00	Welterweight	\N		f	\N	1
401647792	600043115	3009725	2024-05-08 00:52:56.843	2024-04-20 00:44:00	Featherweight	\N		f	\N	2
401647793	600043115	4688510	2024-05-08 00:52:56.843	2024-04-20 00:24:00	Welterweight	\N		f	\N	3
401647794	600043115	5124792	2024-05-08 00:52:56.843	2024-04-19 23:53:00	Featherweight	\N		f	\N	4
401647795	600043115	3076910	2024-05-08 00:52:56.843	2024-04-19 23:28:00	Welterweight	\N		f	\N	5
401647816	600043115	4688447	2024-05-08 00:52:56.843	2024-04-19 22:54:00	Featherweight	\N		f	\N	6
401641501	600043115	4208418	2024-05-08 00:52:56.843	2024-04-19 22:23:00	Featherweight	\N		f	\N	7
401647817	600043115	4894428	2024-05-08 00:52:56.843	2024-04-19 21:51:00	Featherweight	\N		f	\N	8
401647818	600043115	4911955	2024-05-08 00:52:56.843	2024-04-19 21:27:00	Welterweight	\N		f	\N	9
401647819	600043115	4331588	2024-05-08 00:52:56.843	2024-04-19 20:57:00	Welterweight	\N		f	\N	10
401647821	600043115	4350873	2024-05-08 00:52:56.843	2024-04-19 20:42:00	Featherweight	\N		f	\N	11
401647822	600043115	5120974	2024-05-08 00:52:56.843	2024-04-19 20:12:00	Welterweight	\N		f	\N	12
401658421	600045475	5211391	2024-05-08 00:52:57.308	2024-05-05 15:18:00	\N	\N		f	\N	1
401658422	600045475	3991050	2024-05-08 00:52:57.308	2024-05-05 15:18:00	\N	\N		f	\N	2
401658423	600045475	4708881	2024-05-08 00:52:57.308	2024-05-05 15:18:00	\N	\N		f	\N	3
401658424	600045475	4373246	2024-05-08 00:52:57.308	2024-05-05 15:18:00	\N	\N		f	\N	4
401656837	600045193	5083027	2024-05-08 00:52:57.459	2024-04-28 14:51:00	\N	\N		f	\N	1
401656839	600045193	5148533	2024-05-08 00:52:57.459	2024-04-28 14:51:00	\N	\N		f	\N	2
401653082	600044553	\N	2024-05-08 00:53:04.034	2024-04-22 16:06:00	Heavyweight	\N		f	\N	1
401656002	600044553	\N	2024-05-08 00:53:04.034	2024-04-22 16:06:00	Women's Flyweight	\N		f	\N	2
401656004	600044553	\N	2024-05-08 00:53:04.034	2024-04-22 16:06:00	Heavyweight	\N		f	\N	3
401656005	600044553	\N	2024-05-08 00:53:04.034	2024-04-22 16:06:00	Women's Flyweight	\N		f	\N	4
401656006	600044553	\N	2024-05-08 00:53:04.034	2024-04-22 16:06:00	Heavyweight	\N		f	\N	5
401656007	600044553	\N	2024-05-08 00:53:04.034	2024-04-22 16:06:00	Women's Flyweight	\N		f	\N	6
401656008	600044553	\N	2024-05-08 00:53:04.034	2024-05-06 19:07:00	Heavyweight	\N		f	\N	7
401652884	600043333	3155425	2024-05-08 00:52:57.528	2024-04-29 12:03:00	Flyweight	\N	5 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 22, "takedowns": 0, "legStrikes": 5, "bodyStrikes": 4, "controlTime": 0, "headStrikes": 13, "submissions": 0, "strikesAttempted": 55, "significantStrikes": 22, "significantStrikesAttempted": 55}, "fighterB": {"ko": 1, "strikes": 28, "takedowns": 0, "legStrikes": 9, "bodyStrikes": 8, "controlTime": 2, "headStrikes": 11, "submissions": 0, "strikesAttempted": 71, "significantStrikes": 28, "significantStrikesAttempted": 71}}	1
401651957	600043333	5152109	2024-05-08 00:52:57.528	2024-04-29 12:03:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 20, "takedowns": 1, "legStrikes": 2, "bodyStrikes": 3, "controlTime": 209, "headStrikes": 10, "submissions": 1, "strikesAttempted": 44, "significantStrikes": 15, "significantStrikesAttempted": 38}, "fighterB": {"ko": 1, "strikes": 49, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 0, "controlTime": 20, "headStrikes": 30, "submissions": 0, "strikesAttempted": 67, "significantStrikes": 31, "significantStrikesAttempted": 48}}	2
401651964	600043333	3309918	2024-05-08 00:52:57.528	2024-04-29 12:03:00	Women's Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 53, "takedowns": 5, "legStrikes": 10, "bodyStrikes": 9, "controlTime": 452, "headStrikes": 8, "submissions": 0, "strikesAttempted": 120, "significantStrikes": 27, "significantStrikesAttempted": 75}, "fighterB": {"ko": 0, "strikes": 89, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 22, "controlTime": 126, "headStrikes": 12, "submissions": 0, "strikesAttempted": 153, "significantStrikes": 42, "significantStrikesAttempted": 81}}	3
401651963	600043333	5145497	2024-05-08 00:52:57.528	2024-04-29 12:03:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 43, "takedowns": 1, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 269, "headStrikes": 15, "submissions": 0, "strikesAttempted": 73, "significantStrikes": 17, "significantStrikesAttempted": 37}, "fighterB": {"ko": 1, "strikes": 31, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 4, "controlTime": 32, "headStrikes": 15, "submissions": 0, "strikesAttempted": 45, "significantStrikes": 20, "significantStrikesAttempted": 33}}	4
401655506	600043333	4897850	2024-05-08 00:52:57.528	2024-04-29 12:03:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 87, "takedowns": 5, "legStrikes": 7, "bodyStrikes": 13, "controlTime": 289, "headStrikes": 37, "submissions": 1, "strikesAttempted": 165, "significantStrikes": 57, "significantStrikesAttempted": 129}, "fighterB": {"ko": 0, "strikes": 66, "takedowns": 0, "legStrikes": 2, "bodyStrikes": 6, "controlTime": 135, "headStrikes": 50, "submissions": 1, "strikesAttempted": 115, "significantStrikes": 58, "significantStrikesAttempted": 104}}	5
401652438	600043333	4685870	2024-05-08 00:52:57.528	2024-04-29 12:03:00	Welterweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 10, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 5, "controlTime": 78, "headStrikes": 1, "submissions": 0, "strikesAttempted": 21, "significantStrikes": 7, "significantStrikesAttempted": 17}, "fighterB": {"ko": 1, "strikes": 11, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 1, "controlTime": 4, "headStrikes": 5, "submissions": 0, "strikesAttempted": 16, "significantStrikes": 7, "significantStrikesAttempted": 12}}	6
401648164	600043333	3114234	2024-05-08 00:52:57.528	2024-04-29 12:03:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 56, "takedowns": 0, "legStrikes": 20, "bodyStrikes": 6, "controlTime": 48, "headStrikes": 28, "submissions": 0, "strikesAttempted": 111, "significantStrikes": 54, "significantStrikesAttempted": 109}, "fighterB": {"ko": 2, "strikes": 150, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 21, "controlTime": 189, "headStrikes": 84, "submissions": 0, "strikesAttempted": 260, "significantStrikes": 109, "significantStrikesAttempted": 205}}	7
401651965	600043333	4397797	2024-05-08 00:52:57.528	2024-04-29 12:03:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 99, "takedowns": 3, "legStrikes": 11, "bodyStrikes": 22, "controlTime": 48, "headStrikes": 55, "submissions": 0, "strikesAttempted": 220, "significantStrikes": 88, "significantStrikesAttempted": 206}, "fighterB": {"ko": 0, "strikes": 100, "takedowns": 0, "legStrikes": 16, "bodyStrikes": 16, "controlTime": 97, "headStrikes": 60, "submissions": 0, "strikesAttempted": 218, "significantStrikes": 92, "significantStrikesAttempted": 210}}	8
401651960	600043333	4249193	2024-05-08 00:52:57.528	2024-04-29 12:03:00	Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 73, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 18, "controlTime": 36, "headStrikes": 42, "submissions": 0, "strikesAttempted": 190, "significantStrikes": 67, "significantStrikesAttempted": 183}, "fighterB": {"ko": 0, "strikes": 77, "takedowns": 0, "legStrikes": 18, "bodyStrikes": 25, "controlTime": 0, "headStrikes": 33, "submissions": 0, "strikesAttempted": 160, "significantStrikes": 76, "significantStrikesAttempted": 159}}	9
401651961	600043333	4566308	2024-05-08 00:52:57.529	2024-04-29 12:03:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 93, "takedowns": 1, "legStrikes": 14, "bodyStrikes": 28, "controlTime": 191, "headStrikes": 38, "submissions": 0, "strikesAttempted": 132, "significantStrikes": 80, "significantStrikesAttempted": 116}, "fighterB": {"ko": 0, "strikes": 111, "takedowns": 2, "legStrikes": 18, "bodyStrikes": 5, "controlTime": 174, "headStrikes": 8, "submissions": 1, "strikesAttempted": 159, "significantStrikes": 31, "significantStrikesAttempted": 77}}	10
401656000	600044553	\N	2024-05-08 00:53:04.034	2024-04-22 16:06:00	Women's Flyweight	\N		f	\N	8
401655999	600044553	\N	2024-05-08 00:53:04.034	2024-05-06 19:08:00	Heavyweight	\N		f	\N	9
401656037	600043333	3163772	2024-05-08 00:52:57.529	2024-04-29 12:03:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 14, "takedowns": 3, "legStrikes": 5, "bodyStrikes": 1, "controlTime": 80, "headStrikes": 6, "submissions": 1, "strikesAttempted": 29, "significantStrikes": 12, "significantStrikesAttempted": 26}, "fighterB": {"ko": 0, "strikes": 19, "takedowns": 0, "legStrikes": 10, "bodyStrikes": 2, "controlTime": 0, "headStrikes": 7, "submissions": 0, "strikesAttempted": 40, "significantStrikes": 19, "significantStrikesAttempted": 40}}	11
401645176	600043333	5132151	2024-05-08 00:52:57.529	2024-04-29 12:03:00	Women's Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 49, "takedowns": 1, "legStrikes": 6, "bodyStrikes": 10, "controlTime": 171, "headStrikes": 8, "submissions": 0, "strikesAttempted": 89, "significantStrikes": 24, "significantStrikesAttempted": 52}, "fighterB": {"ko": 0, "strikes": 101, "takedowns": 3, "legStrikes": 0, "bodyStrikes": 8, "controlTime": 337, "headStrikes": 28, "submissions": 1, "strikesAttempted": 150, "significantStrikes": 36, "significantStrikesAttempted": 73}}	12
401643543	600043333	4895360	2024-05-08 00:52:57.529	2024-04-29 12:03:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 121, "takedowns": 0, "legStrikes": 27, "bodyStrikes": 13, "controlTime": 0, "headStrikes": 81, "submissions": 0, "strikesAttempted": 296, "significantStrikes": 121, "significantStrikesAttempted": 295}, "fighterB": {"ko": 0, "strikes": 97, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 26, "controlTime": 3, "headStrikes": 67, "submissions": 0, "strikesAttempted": 312, "significantStrikes": 97, "significantStrikesAttempted": 312}}	13
401655687	600044935	5210077	2024-05-08 00:52:59.232	2024-05-04 01:28:00	\N	\N		f	\N	1
401657426	600044935	5139002	2024-05-08 00:52:59.232	2024-05-04 01:00:00	\N	\N		f	\N	2
401657427	600044935	3871760	2024-05-08 00:52:59.232	2024-05-03 23:27:00	\N	\N		f	\N	3
401648468	600043073	2560746	2024-05-08 00:52:59.317	2024-05-05 02:31:00	UFC Flyweight Title	\N	5 Round (5 min)	t	{"fighterA": {"ko": 0, "strikes": 143, "takedowns": 9, "legStrikes": 17, "bodyStrikes": 33, "controlTime": 495, "headStrikes": 75, "submissions": 0, "strikesAttempted": 262, "significantStrikes": 125, "significantStrikesAttempted": 242}, "fighterB": {"ko": 0, "strikes": 129, "takedowns": 1, "legStrikes": 8, "bodyStrikes": 16, "controlTime": 32, "headStrikes": 87, "submissions": 0, "strikesAttempted": 233, "significantStrikes": 111, "significantStrikesAttempted": 212}}	1
401649508	600043073	2447641	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Bantamweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 101, "takedowns": 1, "legStrikes": 10, "bodyStrikes": 26, "controlTime": 105, "headStrikes": 41, "submissions": 0, "strikesAttempted": 174, "significantStrikes": 77, "significantStrikesAttempted": 139}, "fighterB": {"ko": 0, "strikes": 80, "takedowns": 0, "legStrikes": 7, "bodyStrikes": 9, "controlTime": 80, "headStrikes": 36, "submissions": 0, "strikesAttempted": 151, "significantStrikes": 52, "significantStrikesAttempted": 118}}	2
401648470	600043073	2512976	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Light Heavyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 11, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 0, "controlTime": 0, "headStrikes": 7, "submissions": 1, "strikesAttempted": 20, "significantStrikes": 11, "significantStrikesAttempted": 20}, "fighterB": {"ko": 0, "strikes": 10, "takedowns": 1, "legStrikes": 2, "bodyStrikes": 4, "controlTime": 14, "headStrikes": 4, "submissions": 0, "strikesAttempted": 22, "significantStrikes": 10, "significantStrikesAttempted": 22}}	3
401656096	600043073	4418962	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 6, "takedowns": 0, "legStrikes": 0, "bodyStrikes": 2, "controlTime": 9, "headStrikes": 4, "submissions": 1, "strikesAttempted": 10, "significantStrikes": 6, "significantStrikesAttempted": 10}, "fighterB": {"ko": 0, "strikes": 2, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 1, "controlTime": 0, "headStrikes": 0, "submissions": 0, "strikesAttempted": 3, "significantStrikes": 2, "significantStrikesAttempted": 3}}	4
401640861	600043073	4835137	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Middleweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 22, "takedowns": 0, "legStrikes": 6, "bodyStrikes": 12, "controlTime": 30, "headStrikes": 4, "submissions": 0, "strikesAttempted": 50, "significantStrikes": 22, "significantStrikesAttempted": 48}, "fighterB": {"ko": 1, "strikes": 43, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 3, "controlTime": 19, "headStrikes": 29, "submissions": 0, "strikesAttempted": 57, "significantStrikes": 36, "significantStrikesAttempted": 50}}	5
401648471	600043073	4422355	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Featherweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 31, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 7, "controlTime": 48, "headStrikes": 16, "submissions": 0, "strikesAttempted": 47, "significantStrikes": 24, "significantStrikesAttempted": 40}, "fighterB": {"ko": 0, "strikes": 57, "takedowns": 1, "legStrikes": 22, "bodyStrikes": 4, "controlTime": 309, "headStrikes": 4, "submissions": 0, "strikesAttempted": 86, "significantStrikes": 30, "significantStrikesAttempted": 56}}	6
401655997	600044553	\N	2024-05-08 00:53:04.034	2024-04-22 16:06:00	Women's Flyweight	\N		f	\N	10
401658548	600044553	\N	2024-05-08 00:53:04.034	2024-05-06 19:22:00	Women's Flyweight	\N		f	\N	12
401655973	600044553	\N	2024-05-08 00:53:04.034	2024-05-06 19:11:00	Women's Flyweight	\N		f	\N	12
401653084	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:08:00	\N	\N		f	\N	1
401657034	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:31:00	Light Heavyweight	\N		f	\N	3
401657035	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:45:00	Lightweight	\N		f	\N	4
401657036	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:46:00	Light Heavyweight	\N		f	\N	5
401648472	600043073	5080935	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Women's Strawweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 47, "takedowns": 0, "legStrikes": 10, "bodyStrikes": 15, "controlTime": 0, "headStrikes": 17, "submissions": 0, "strikesAttempted": 119, "significantStrikes": 42, "significantStrikesAttempted": 111}, "fighterB": {"ko": 0, "strikes": 91, "takedowns": 2, "legStrikes": 7, "bodyStrikes": 23, "controlTime": 356, "headStrikes": 53, "submissions": 0, "strikesAttempted": 144, "significantStrikes": 83, "significantStrikesAttempted": 136}}	7
401640862	600043073	5050129	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 83, "takedowns": 5, "legStrikes": 3, "bodyStrikes": 10, "controlTime": 432, "headStrikes": 52, "submissions": 0, "strikesAttempted": 138, "significantStrikes": 65, "significantStrikesAttempted": 119}, "fighterB": {"ko": 0, "strikes": 79, "takedowns": 3, "legStrikes": 17, "bodyStrikes": 7, "controlTime": 175, "headStrikes": 24, "submissions": 0, "strikesAttempted": 125, "significantStrikes": 48, "significantStrikesAttempted": 91}}	8
401648473	600043073	4079621	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 143, "takedowns": 0, "legStrikes": 13, "bodyStrikes": 21, "controlTime": 55, "headStrikes": 25, "submissions": 1, "strikesAttempted": 179, "significantStrikes": 59, "significantStrikesAttempted": 93}, "fighterB": {"ko": 0, "strikes": 96, "takedowns": 0, "legStrikes": 8, "bodyStrikes": 22, "controlTime": 333, "headStrikes": 40, "submissions": 0, "strikesAttempted": 151, "significantStrikes": 70, "significantStrikesAttempted": 123}}	9
401651970	600043073	5122238	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 14, "takedowns": 0, "legStrikes": 3, "bodyStrikes": 4, "controlTime": 0, "headStrikes": 7, "submissions": 0, "strikesAttempted": 38, "significantStrikes": 14, "significantStrikesAttempted": 38}, "fighterB": {"ko": 1, "strikes": 25, "takedowns": 0, "legStrikes": 4, "bodyStrikes": 0, "controlTime": 4, "headStrikes": 21, "submissions": 0, "strikesAttempted": 40, "significantStrikes": 25, "significantStrikesAttempted": 40}}	10
401648476	600043073	4801725	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Women's Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 87, "takedowns": 2, "legStrikes": 4, "bodyStrikes": 14, "controlTime": 231, "headStrikes": 21, "submissions": 1, "strikesAttempted": 124, "significantStrikes": 39, "significantStrikesAttempted": 71}, "fighterB": {"ko": 0, "strikes": 100, "takedowns": 1, "legStrikes": 6, "bodyStrikes": 8, "controlTime": 205, "headStrikes": 39, "submissions": 0, "strikesAttempted": 220, "significantStrikes": 53, "significantStrikesAttempted": 156}}	11
401651969	600043073	3093513	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Lightweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 0, "strikes": 64, "takedowns": 1, "legStrikes": 21, "bodyStrikes": 14, "controlTime": 29, "headStrikes": 26, "submissions": 0, "strikesAttempted": 147, "significantStrikes": 61, "significantStrikesAttempted": 142}, "fighterB": {"ko": 0, "strikes": 112, "takedowns": 1, "legStrikes": 18, "bodyStrikes": 13, "controlTime": 30, "headStrikes": 80, "submissions": 0, "strikesAttempted": 217, "significantStrikes": 111, "significantStrikesAttempted": 216}}	12
401648475	600043073	5074121	2024-05-08 00:52:59.317	2024-05-05 02:31:00	Flyweight	\N	3 Round (5 min)	f	{"fighterA": {"ko": 1, "strikes": 60, "takedowns": 0, "legStrikes": 12, "bodyStrikes": 2, "controlTime": 43, "headStrikes": 32, "submissions": 0, "strikesAttempted": 104, "significantStrikes": 46, "significantStrikesAttempted": 86}, "fighterB": {"ko": 0, "strikes": 18, "takedowns": 0, "legStrikes": 1, "bodyStrikes": 5, "controlTime": 0, "headStrikes": 12, "submissions": 0, "strikesAttempted": 56, "significantStrikes": 18, "significantStrikesAttempted": 56}}	13
401647487	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Heavyweight	\N	5 Round (5 min)	f	\N	1
401656366	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Welterweight	\N	3 Round (5 min)	f	\N	2
401652961	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Light Heavyweight	\N	3 Round (5 min)	f	\N	3
401658193	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Lightweight	\N		f	\N	4
401652964	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Featherweight	\N	3 Round (5 min)	f	\N	5
401647488	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Heavyweight	\N	3 Round (5 min)	f	\N	6
401652966	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Lightweight	\N	3 Round (5 min)	f	\N	7
401652962	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Lightweight	\N	3 Round (5 min)	f	\N	8
401652963	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Women's Strawweight	\N	3 Round (5 min)	f	\N	9
401652967	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Welterweight	\N	3 Round (5 min)	f	\N	10
401652968	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Flyweight	\N	3 Round (5 min)	f	\N	11
401652969	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Welterweight	\N	3 Round (5 min)	f	\N	12
401652970	600043713	\N	2024-05-08 00:53:00.964	2024-05-03 18:44:00	Women's Flyweight	\N	3 Round (5 min)	f	\N	13
401645297	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	Bellator Bantamweight Title	\N		t	\N	1
401656119	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	Welterweight	\N		f	\N	2
401645298	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	Middleweight	\N		f	\N	3
401654419	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	\N	\N		f	\N	4
401654420	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	Lightweight	\N		f	\N	5
401645300	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	Heavyweight	\N		f	\N	6
401645299	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	Lightweight	\N		f	\N	7
401654316	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	Middleweight	\N		f	\N	8
401654025	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	Women's Featherweight	\N		f	\N	9
401654317	600043633	\N	2024-05-08 00:53:02.083	2024-04-25 18:24:00	Featherweight	\N		f	\N	10
401657040	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:53:00	Lightweight	\N		f	\N	9
401657041	600044554	\N	2024-05-08 00:53:04.46	2024-04-29 12:55:00	Lightweight	\N		f	\N	10
401657042	600044554	\N	2024-05-08 00:53:04.46	2024-05-06 19:30:00	Lightweight	\N		f	\N	11
401657043	600044554	\N	2024-05-08 00:53:04.46	2024-05-06 19:31:00	Light Heavyweight	\N		f	\N	12
401657044	600044554	\N	2024-05-08 00:53:04.46	2024-05-06 19:33:00	Featherweight	\N		f	\N	13
401650677	600044093	\N	2024-05-08 00:53:04.739	2024-04-19 19:27:00	Bellator Welterweight Title	\N		t	\N	1
401657119	600044093	\N	2024-05-08 00:53:04.739	2024-04-29 20:45:00	Lightweight	\N		f	\N	2
401653627	600044093	\N	2024-05-08 00:53:04.739	2024-04-19 19:27:00	Women's Featherweight	\N		f	\N	3
401653628	600044093	\N	2024-05-08 00:53:04.739	2024-04-19 19:27:00	Bantamweight	\N		f	\N	4
401654667	600044093	\N	2024-05-08 00:53:04.739	2024-04-19 19:27:00	Featherweight	\N		f	\N	5
401655690	600044093	\N	2024-05-08 00:53:04.739	2024-04-19 19:27:00	Middleweight	\N		f	\N	6
401653626	600044093	\N	2024-05-08 00:53:04.739	2024-04-19 19:27:00	Women's Featherweight	\N		f	\N	7
401654853	600044093	\N	2024-05-08 00:53:04.739	2024-04-19 19:27:00	Bantamweight	\N		f	\N	8
401654854	600044093	\N	2024-05-08 00:53:04.739	2024-04-19 19:27:00	Bantamweight	\N		f	\N	9
401655691	600044093	\N	2024-05-08 00:53:04.739	2024-04-19 19:27:00	Women's Featherweight	\N		f	\N	10
401635960	600042393	\N	2024-05-08 00:53:05.05	2024-05-04 23:56:00	Middleweight	\N	5 Round (5 min)	f	\N	1
401651972	600042393	\N	2024-05-08 00:53:05.05	2024-05-04 23:56:00	Welterweight	\N	3 Round (5 min)	f	\N	2
401658189	600042393	\N	2024-05-08 00:53:05.05	2024-05-04 23:56:00	Middleweight	\N	3 Round (5 min)	f	\N	3
401651973	600042393	\N	2024-05-08 00:53:05.05	2024-05-04 23:56:00	Light Heavyweight	\N	3 Round (5 min)	f	\N	4
401651971	600042393	\N	2024-05-08 00:53:05.05	2024-05-04 23:56:00	Heavyweight	\N	3 Round (5 min)	f	\N	5
401635961	600042393	\N	2024-05-08 00:53:05.05	2024-05-03 18:34:00	\N	\N		f	\N	6
401653086	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Featherweight	\N		f	\N	1
401658171	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Welterweight	\N		f	\N	2
401658172	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Welterweight	\N		f	\N	3
401658173	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Featherweight	\N		f	\N	4
401658549	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Welterweight	\N		f	\N	5
401653087	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Welterweight	\N		f	\N	6
401658174	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Featherweight	\N		f	\N	7
401658175	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Welterweight	\N		f	\N	8
401658176	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Featherweight	\N		f	\N	9
401658177	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Welterweight	\N		f	\N	10
401658178	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Featherweight	\N		f	\N	11
401658550	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Featherweight	\N		f	\N	12
401658179	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Welterweight	\N		f	\N	13
401658180	600044555	\N	2024-05-08 00:53:05.362	2024-05-06 20:36:00	Featherweight	\N		f	\N	14
401642605	600043173	\N	2024-05-08 00:53:05.902	2024-04-26 17:24:00	Welterweight	\N	5 Round (5 min)	f	\N	1
401655716	600043173	\N	2024-05-08 00:53:05.902	2024-04-26 17:24:00	Light Heavyweight	\N	3 Round (5 min)	f	\N	2
401656117	600043173	\N	2024-05-08 00:53:05.902	2024-04-29 14:36:00	Women's Bantamweight	\N	3 Round (5 min)	f	\N	3
401656369	600043173	\N	2024-05-08 00:53:05.902	2024-04-29 14:36:00	Featherweight	\N	3 Round (5 min)	f	\N	4
401642606	600043173	\N	2024-05-08 00:53:05.902	2024-04-29 14:36:00	Middleweight	\N	3 Round (5 min)	f	\N	5
401642608	600043173	\N	2024-05-08 00:53:05.902	2024-04-29 14:37:00	Women's Strawweight	\N	3 Round (5 min)	f	\N	6
401656526	600043173	\N	2024-05-08 00:53:05.902	2024-04-29 14:37:00	Flyweight	\N		f	\N	7
401658551	600043173	\N	2024-05-08 00:53:05.902	2024-05-06 20:39:00	Bantamweight	\N		f	\N	8
401656356	600045073	\N	2024-05-08 00:53:06.309	2024-04-24 21:21:00	\N	\N		f	\N	1
401656357	600045073	\N	2024-05-08 00:53:06.309	2024-04-24 21:21:00	\N	\N		f	\N	2
401656358	600045073	\N	2024-05-08 00:53:06.309	2024-04-24 21:39:00	\N	\N		f	\N	3
401655692	600044937	\N	2024-05-08 00:53:06.368	2024-04-22 17:49:00	\N	\N		f	\N	1
401655693	600044937	\N	2024-05-08 00:53:06.368	2024-04-22 17:49:00	\N	\N		f	\N	2
401645302	600043635	\N	2024-05-08 00:53:06.415	2024-05-06 10:38:00	Bantamweight	\N		f	\N	1
401645303	600043635	\N	2024-05-08 00:53:06.415	2024-05-06 10:36:00	\N	\N		f	\N	2
401655694	600044938	\N	2024-05-08 00:53:06.458	2024-04-22 17:49:00	\N	\N		f	\N	1
401655695	600044938	\N	2024-05-08 00:53:06.458	2024-04-22 17:49:00	\N	\N		f	\N	2
401652459	600044293	\N	2024-05-08 00:53:06.497	2024-03-29 01:12:00	\N	\N		f	\N	1
401652460	600044293	\N	2024-05-08 00:53:06.497	2024-03-29 01:12:00	\N	\N		f	\N	2
401652461	600044293	\N	2024-05-08 00:53:06.497	2024-03-29 01:11:00	\N	\N		f	\N	3
401655696	600044939	\N	2024-05-08 00:53:06.55	2024-04-22 17:50:00	\N	\N		f	\N	1
401655697	600044939	\N	2024-05-08 00:53:06.55	2024-04-22 17:50:00	\N	\N		f	\N	2
401650678	600044094	\N	2024-05-08 00:53:06.598	2024-03-22 22:48:00	\N	\N		f	\N	1
401650679	600044095	\N	2024-05-08 00:53:06.619	2024-03-22 22:55:00	\N	\N		f	\N	1
401613669	600039853	\N	2024-05-08 00:53:06.638	2024-02-25 01:08:00	\N	\N		f	\N	1
401613670	600039853	\N	2024-05-08 00:53:06.638	2024-02-25 01:08:00	\N	\N		f	\N	2
401613671	600039853	\N	2024-05-08 00:53:06.638	2024-02-25 01:08:00	\N	\N		f	\N	3
401650680	600044096	\N	2024-05-08 00:53:06.712	2024-03-22 22:56:00	\N	\N		f	\N	1
401654336	600044733	\N	2024-05-08 00:53:06.734	2024-04-25 16:50:00	\N	\N		f	\N	1
401654338	600044733	\N	2024-05-08 00:53:06.734	2024-04-25 16:50:00	\N	\N		f	\N	2
401650681	600044097	\N	2024-05-08 00:53:06.785	2024-03-22 22:57:00	\N	\N		f	\N	1
\.


--
-- Data for Name: Fighter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Fighter" (id, "createdAt", "updatedAt", name, "shortName", "firstName", "lastName", nickname, age, height, weight, reach, record, flag, stats, color, images) FROM stdin;
5105154	2024-05-08 00:52:30.531	2024-05-08 00:52:30.531	Shamil Gasanov	S. Gasanov	Shamil	Gasanov	The Cobra	28	67	145	0	14-1-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5105154.png"}
5119017	2024-05-08 00:52:30.537	2024-05-08 00:52:30.537	Ho Taek Oh	H. Oh	Ho Taek	Oh	Spider	30	71	155	71	1-3-0	https://a.espncdn.com/i/teamlogos/countries/500/kor.png	\N	{"primary": "#ED1C27", "secondary": "#024FA2"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5119017.png"}
4801479	2024-05-08 00:52:30.569	2024-05-08 00:52:30.569	Shinechagtga Zoltsetseg	S. Zoltsetseg	Shinechagtga	Zoltsetseg	\N	27	68	155	69	7-5-0	https://a.espncdn.com/i/teamlogos/countries/500/mgl.png	\N	{"primary": "#0026F5", "secondary": "#EB3223"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4801479.png"}
4907790	2024-05-08 00:52:30.574	2024-05-08 00:52:30.574	Won Il Kwon	W. Kwon	Won Il	Kwon	Pretty Boy	28	70	145	71	14-4-0	https://a.espncdn.com/i/teamlogos/countries/500/kor.png	\N	{"primary": "#ED1C27", "secondary": "#024FA2"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4907790.png"}
4581351	2024-05-08 00:52:30.598	2024-05-08 00:52:30.598	Enkh-Orgil Baatarkhuu	E. Baatarkhuu	Enkh-Orgil	Baatarkhuu	\N	35	66	155	0	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/mgl.png	\N	{"primary": "#0026F5", "secondary": "#EB3223"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4581351.png"}
5146877	2024-05-08 00:52:30.602	2024-05-08 00:52:30.602	Artem Belakh	A. Belakh	Artem	Belakh	\N	28	69	135	73	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5146877.png"}
4714416	2024-05-08 00:52:30.621	2024-05-08 00:52:30.621	Ji Won Kang	J. Kang	Ji Won	Kang	Mighty Warrior	28	72	265	0	7-2-0	https://www.espn.com/i/teamlogos/countries/500/blank.png	\N	{"primary": "#CD2E3A", "secondary": "#0047A0"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4714416.png"}
5195117	2024-05-08 00:52:30.625	2024-05-08 00:52:30.625	Mikhail Jamal Abdul-Latif	M. Abdul-Latif	Mikhail Jamal	Abdul-Latif	\N	40	73	265	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/ned.png	\N	{"primary": "#AE1C28", "secondary": "#21468B"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5195117.png"}
4610021	2024-05-08 00:52:30.646	2024-05-08 00:52:30.646	Kegan Gennrich	K. Gennrich	Kegan	Gennrich	Machine Gun	\N	74	155	0	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4610021.png"}
5077056	2024-05-08 00:52:30.651	2024-05-08 00:52:30.651	Jacobi Jones	J. Jones	Jacobi	Jones	Big Toe	27	69	156	72	6-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5077056.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5077056.png"}
3944331	2024-05-08 00:52:30.681	2024-05-08 00:52:30.681	Cody Peterson	C. Peterson	Cody	Peterson	The Real Deal	35	69	145	73	1-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3944331.png"}
4273399	2024-05-08 00:52:30.732	2024-05-08 00:52:30.732	Magomed Ankalaev	M. Ankalaev	Magomed	Ankalaev	\N	31	75	204	75	19-1-1	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4273399.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4273399.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4273399.png"}
3922491	2024-05-08 00:52:30.992	2024-05-08 00:52:30.992	Ricky Simon	R. Simon	Ricky	Simon	\N	31	66	136	69	20-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3922491.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3922491.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3922491.png"}
4410868	2024-05-08 00:52:30.999	2024-05-08 00:52:30.999	Mario Bautista	M. Bautista	Mario	Bautista	\N	30	69	135	69	14-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4410868.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4410868.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4410868.png"}
3913473	2024-05-08 00:52:31.18	2024-05-08 00:52:31.18	Phil Hawes	P. Hawes	Phil	Hawes	No Hype	35	72	185	77	12-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3913473.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3913473.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3913473.png"}
4686270	2024-05-08 00:52:32.747	2024-05-08 00:52:32.747	Garrett Armfield	G. Armfield	Garrett	Armfield	\N	27	66	135	70	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4686270.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4686270.png"}
3032218	2024-05-08 00:52:59.137	2024-05-08 00:52:59.137	Gabriel Benitez	G. Benitez	Gabriel	Benitez	Moggly	35	68	155	71	23-13-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3032218.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3032218.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3032218.png"}
3146944	2024-05-08 00:53:05.238	2024-05-08 00:53:05.238	Johnny Walker	J. Walker	Johnny	Walker	\N	32	78	205	82	21-8-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3146944.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3146944.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3146944.png"}
2354269	2024-05-08 00:52:31.277	2024-05-08 00:52:31.277	Andrei Arlovski	A. Arlovski	Andrei	Arlovski	The Pitbull	45	75	247	77	34-23-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2354269.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2354269.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2354269.png"}
4038105	2024-05-08 00:52:31.418	2024-05-08 00:52:31.418	Preston Parsons	P. Parsons	Preston	Parsons	Pressure	28	71	170	71	11-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4038105.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4038105.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4038105.png"}
4688408	2024-05-08 00:52:31.424	2024-05-08 00:52:31.424	Matthew Semelsberger	M. Semelsberger	Matthew	Semelsberger	Semi the Jedi	31	73	170	75	11-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4688408.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4688408.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4688408.png"}
4393818	2024-05-08 00:52:31.511	2024-05-08 00:52:31.511	Gaston Bolaños	G. Bolaños	Gaston	Bolaños	The Dreamkiller	31	67	135	69	7-4-0	https://a.espncdn.com/i/teamlogos/countries/500/per.png	\N	{"primary": "#D91023", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4393818.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4393818.png"}
4895760	2024-05-08 00:52:31.517	2024-05-08 00:52:31.517	Marcus McGhee	M. McGhee	Marcus	McGhee	The Maniac	34	68	135	69	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4895760.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4895760.png"}
5016786	2024-05-08 00:52:31.61	2024-05-08 00:52:31.61	Farid Basharat	F. Basharat	Farid	Basharat	Ferocious	26	68	136	71	12-0-0	https://a.espncdn.com/i/teamlogos/countries/500/afg.png	\N	{"primary": "#EB3223", "secondary": "#377D22"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5016786.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5016786.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5016786.png"}
4305514	2024-05-08 00:52:31.709	2024-05-08 00:52:31.709	Westin Wilson	W. Wilson	Westin	Wilson	\N	35	73	145	73	16-9-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4305514.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4305514.png"}
5145766	2024-05-08 00:52:31.715	2024-05-08 00:52:31.715	Jean Silva	J. Silva	Jean	Silva	Lord	27	67	145	69	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5145766.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5145766.png"}
3897242	2024-05-08 00:52:31.83	2024-05-08 00:52:31.83	Nikolas Motta	N. Motta	Nikolas	Motta	Iron	31	69	155	70	14-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3897242.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3897242.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3897242.png"}
4916248	2024-05-08 00:52:31.96	2024-05-08 00:52:31.96	Felipe Bunes	F. Bunes	Felipe	Bunes	Felipinho	34	67	125	69	13-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4916248.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4916248.png"}
4334401	2024-05-08 00:52:32.065	2024-05-08 00:52:32.065	Ivan Vitasovic	I. Vitasovic	Ivan	Vitasovic	\N	32	74	231	75	0-3-0	https://a.espncdn.com/i/teamlogos/countries/500/cro.png	\N	{"primary": "#FF0000", "secondary": "#171796"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4334401.png"}
5080648	2024-05-08 00:52:32.071	2024-05-08 00:52:32.071	Arkadiusz Wrzosek	A. Wrzosek	Arkadiusz	Wrzosek	Hightower	31	79	265	0	4-0-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5080648.png"}
5193167	2024-05-08 00:52:39.983	2024-05-08 00:52:39.983	Chasen Blair	C. Blair	Chasen	Blair	Paper	\N	70	170	0	1-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5193167.png"}
5144007	2024-05-08 00:53:02.623	2024-05-08 00:53:02.623	Tom Nolan	T. Nolan	Tom	Nolan	Big Train	24	75	155	73	6-1-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5144007.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5144007.png"}
5120301	2024-05-08 00:53:03.367	2024-05-08 00:53:03.367	Joshua Van	J. Van	Joshua	Van	The Fearless	22	65	125	65	10-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5120301.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5120301.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5120301.png"}
3151934	2024-05-08 00:53:03.566	2024-05-08 00:53:03.566	Taylor Lapilus	T. Lapilus	Taylor	Lapilus	Double Impact	32	66	136	73	19-4-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3151934.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3151934.png"}
5077131	2024-05-08 00:53:03.817	2024-05-08 00:53:03.817	Brunno Ferreira	B. Ferreira	Brunno	Ferreira	The Hulk	31	70	185	72	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5077131.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5077131.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5077131.png"}
3152443	2024-05-08 00:52:32.088	2024-05-08 00:52:32.088	Bartosz Fabinski	B. Fabinski	Bartosz	Fabinski	The Butcher	38	72	184	75	15-6-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3152443.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3152443.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3152443.png"}
4580867	2024-05-08 00:52:32.095	2024-05-08 00:52:32.095	Laid Zerhouni	L. Zerhouni	Laid	Zerhouni	\N	28	68	185	74	1-4-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4580867.png"}
3728368	2024-05-08 00:52:32.113	2024-05-08 00:52:32.113	Damian Stasiak	D. Stasiak	Damian	Stasiak	Webster	34	68	145	70	13-10-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3728368.png"}
5143190	2024-05-08 00:52:32.118	2024-05-08 00:52:32.118	Adam Soldaev	A. Soldaev	Adam	Soldaev	\N	26	68	145	67	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5143190.png"}
5031199	2024-05-08 00:52:32.133	2024-05-08 00:52:32.133	Werlleson Martins	W. Martins	Werlleson	Martins	Galinho	28	70	135	70	18-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5031199.png"}
5143886	2024-05-08 00:52:32.137	2024-05-08 00:52:32.137	Oleksii Polischuck	O. Polischuck	Oleksii	Polischuck	\N	28	69	145	74	1-1-0	https://a.espncdn.com/i/teamlogos/countries/500/ukr.png	\N	{"primary": "#005BBB", "secondary": "#FFD500"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5143886.png"}
3166126	2024-05-08 00:52:32.172	2024-05-08 00:52:32.172	Dricus Du Plessis	D. Du Plessis	Dricus	Du Plessis	Stilknocks	30	73	184	76	21-2-0	https://a.espncdn.com/i/teamlogos/countries/500/rsa.png	\N	{"primary": "#FFB81C", "secondary": "#007749"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3166126.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3166126.png"}
2995167	2024-05-08 00:52:32.254	2024-05-08 00:52:32.254	Raquel Pennington	R. Pennington	Raquel	Pennington	Rocky	35	67	135	67	16-9-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2995167.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2995167.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2995167.png"}
3001914	2024-05-08 00:52:32.349	2024-05-08 00:52:32.349	Neil Magny	N. Magny	Neil	Magny	The Haitian Sensation	36	75	170	80	29-12-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3001914.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3001914.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3001914.png"}
3165120	2024-05-08 00:52:32.354	2024-05-08 00:52:32.354	Mike Malott	M. Malott	Mike	Malott	Proper	32	73	170	73	10-2-1	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3165120.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3165120.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3165120.png"}
3902098	2024-05-08 00:52:32.588	2024-05-08 00:52:32.588	Arnold Allen	A. Allen	Arnold	Allen	Almighty	30	68	145	70	19-3-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3902098.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3902098.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3902098.png"}
4029275	2024-05-08 00:52:32.594	2024-05-08 00:52:32.594	Movsar Evloev	M. Evloev	Movsar	Evloev	\N	30	67	145	72	18-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4029275.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4029275.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4029275.png"}
5202209	2024-05-08 00:52:39.986	2024-05-08 00:52:39.986	Orlando Sanders	O. Sanders	Orlando	Sanders	\N	28	69	170	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5202209.png"}
3093653	2024-05-08 00:53:02.894	2024-05-08 00:53:02.894	Sean Strickland	S. Strickland	Sean	Strickland	Tarzan	33	73	185	76	28-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3093653.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3093653.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3093653.png"}
4350871	2024-05-08 00:53:03.491	2024-05-08 00:53:03.491	Brad Katona	B. Katona	Brad	Katona	Superman	32	66	136	64	15-3-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4350871.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4350871.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4350871.png"}
4371001	2024-05-08 00:53:06.159	2024-05-08 00:53:06.159	Mayra Bueno Silva	M. Bueno Silva	Mayra	Bueno Silva	Sheetara	32	66	135	66	10-3-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4371001.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4371001.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4371001.png"}
4415883	2024-05-08 00:53:06.202	2024-05-08 00:53:06.202	Marc-Andre Barriault	M. Barriault	Marc-Andre	Barriault	Powerbar	34	73	184	74	16-7-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4415883.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4415883.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4415883.png"}
4421978	2024-05-08 00:52:32.888	2024-05-08 00:52:32.888	Charles Jourdain	C. Jourdain	Charles	Jourdain	Air	28	69	145	69	15-7-1	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4421978.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4421978.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4421978.png"}
5146229	2024-05-08 00:52:32.996	2024-05-08 00:52:32.996	Serhiy Sidey	S. Sidey	Serhiy	Sidey	\N	27	71	135	72	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/ukr.png	\N	{"primary": "#005BBB", "secondary": "#FFD500"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5146229.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5146229.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5146229.png"}
5152409	2024-05-08 00:52:33.001	2024-05-08 00:52:33.001	Ramon Taveras	R. Taveras	Ramon	Taveras	The Savage	30	68	139	70	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5152409.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5152409.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5152409.png"}
4227055	2024-05-08 00:52:33.13	2024-05-08 00:52:33.13	Polyana Viana	P. Viana	Polyana	Viana	Dama de Ferro	31	65	115	67	13-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4227055.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4227055.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4227055.png"}
4880807	2024-05-08 00:52:33.305	2024-05-08 00:52:33.305	Yohan Lainesse	Y. Lainesse	Yohan	Lainesse	White Lion	31	73	170	76	9-3-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4880807.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4880807.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4880807.png"}
5088916	2024-05-08 00:52:33.312	2024-05-08 00:52:33.312	Sam Patterson	S. Patterson	Sam	Patterson	The Future	28	75	169	78	11-2-1	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5088916.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5088916.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5088916.png"}
4277049	2024-05-08 00:52:33.476	2024-05-08 00:52:33.476	Priscila Cachoeira	P. Cachoeira	Priscila	Cachoeira	Zombie Girl	35	67	133	65	12-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4277049.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4277049.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4277049.png"}
4835135	2024-05-08 00:52:33.482	2024-05-08 00:52:33.482	Jasmine Jasudavicius	J. Jasudavicius	Jasmine	Jasudavicius	\N	35	67	133	68	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4835135.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4835135.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4835135.png"}
2989380	2024-05-08 00:52:33.632	2024-05-08 00:52:33.632	Jimmy Flick	J. Flick	Jimmy	Flick	The Brick	33	67	126	68	17-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2989380.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2989380.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2989380.png"}
3153250	2024-05-08 00:52:33.638	2024-05-08 00:52:33.638	Malcolm Gordon	M. Gordon	Malcolm	Gordon	X	33	67	127	71	14-8-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3153250.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3153250.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3153250.png"}
4570799	2024-05-08 00:52:33.78	2024-05-08 00:52:33.78	Marcos Brigagão	M. Brigagão	Marcos	Brigagão	Ironside	28	75	205	76	12-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4570799.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4570799.png"}
4691323	2024-05-08 00:52:33.788	2024-05-08 00:52:33.788	Bruno Lopes	B. Lopes	Bruno	Lopes	Brunao	31	74	205	75	12-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4691323.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4691323.png"}
4693162	2024-05-08 00:52:33.815	2024-05-08 00:52:33.815	Cemey dos Santos	C. dos Santos	Cemey	dos Santos	Meiota	\N	74	185	0	0-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4693162.png"}
5138111	2024-05-08 00:52:33.82	2024-05-08 00:52:33.82	Marco Tulio	M. Tulio	Marco	Tulio	Matuto	29	72	185	74	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5138111.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5138111.png"}
2354244	2024-05-08 00:52:33.851	2024-05-08 00:52:33.851	Shinya Aoki	S. Aoki	Shinya	Aoki	Tobikan Judan	40	71	155	0	48-11-0	https://www.espn.com/i/teamlogos/countries/500/blank.png	\N	{}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2354244.png"}
4089026	2024-05-08 00:53:06.238	2024-05-08 00:53:06.238	Gillian Robertson	G. Robertson	Gillian	Robertson	The Savage	28	65	115	63	13-8-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4089026.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4089026.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4089026.png"}
2617539	2024-05-08 00:52:33.855	2024-05-08 00:52:33.855	John Lineker	J. Lineker	John	Lineker	Hands of Stone	33	63	135	67	37-11-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2617539.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2617539.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2617539.png"}
3943550	2024-05-08 00:52:33.877	2024-05-08 00:52:33.877	Martin Nguyen	M. Nguyen	Martin	Nguyen	The Situ-Asian	35	68	145	70	15-7-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3943550.png"}
4197779	2024-05-08 00:52:33.884	2024-05-08 00:52:33.884	Garry Tonon	G. Tonon	Garry	Tonon	The Lion Killer	32	70	145	69	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4197779.png"}
4421752	2024-05-08 00:52:33.909	2024-05-08 00:52:33.909	Ayaka Miura	A. Miura	Ayaka	Miura	\N	33	62	125	0	13-5-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4421752.png"}
4788951	2024-05-08 00:52:33.914	2024-05-08 00:52:33.914	Itsuki Hirata	I. Hirata	Itsuki	Hirata	Strong Heart Fighter	24	62	115	63	6-3-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4788951.png"}
4046614	2024-05-08 00:52:33.932	2024-05-08 00:52:33.932	Yuya Wakamatsu	Y. Wakamatsu	Yuya	Wakamatsu	Little Piranha	29	65	135	0	17-6-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4046614.png"}
4280293	2024-05-08 00:52:33.936	2024-05-08 00:52:33.936	Danny Kingad	D. Kingad	Danny	Kingad	The King	28	65	125	0	15-4-0	https://a.espncdn.com/i/teamlogos/countries/500/phi.png	\N	{"primary": "#0038A8", "secondary": "#CE0F26"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4280293.png"}
4385252	2024-05-08 00:52:33.954	2024-05-08 00:52:33.954	Bokang Masunyane	B. Masunyane	Bokang	Masunyane	Little Giant	29	62	125	59	10-1-0	https://a.espncdn.com/i/teamlogos/countries/500/rsa.png	\N	{"primary": "#FFB81C", "secondary": "#007749"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4385252.png"}
4239519	2024-05-08 00:52:33.981	2024-05-08 00:52:33.981	Gustavo Balart	G. Balart	Gustavo	Balart	El Gladiador	40	59	125	0	12-4-0	https://a.espncdn.com/i/teamlogos/countries/500/cub.png	\N	{"primary": "#CF142B", "secondary": "#002A8F"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4239519.png"}
4409575	2024-05-08 00:52:33.985	2024-05-08 00:52:33.985	Hiroba Minowa	H. Minowa	Hiroba	Minowa	\N	24	63	125	0	13-5-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4409575.png"}
4411508	2024-05-08 00:52:34.029	2024-05-08 00:52:34.029	Roman Dolidze	R. Dolidze	Roman	Dolidze	\N	35	74	186	76	12-3-0	https://a.espncdn.com/i/teamlogos/countries/500/geo.png	\N	{"primary": "#FF0000", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4411508.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4411508.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4411508.png"}
4690539	2024-05-08 00:52:34.033	2024-05-08 00:52:34.033	Nassourdine Imavov	N. Imavov	Nassourdine	Imavov	The Sniper	29	75	185	75	13-4-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4690539.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4690539.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4690539.png"}
2951202	2024-05-08 00:52:34.139	2024-05-08 00:52:34.139	Drew Dober	D. Dober	Drew	Dober	\N	35	68	156	70	27-13-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2951202.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2951202.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2951202.png"}
3132513	2024-05-08 00:52:34.273	2024-05-08 00:52:34.273	Muslim Salikhov	M. Salikhov	Muslim	Salikhov	King of Kung Fu	39	71	171	70	19-5-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3132513.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3132513.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3132513.png"}
4054605	2024-05-08 00:52:34.36	2024-05-08 00:52:34.36	Natalia Silva	N. Silva	Natalia	Silva	\N	27	64	125	65	17-5-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4054605.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4054605.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4054605.png"}
4379362	2024-05-08 00:52:34.365	2024-05-08 00:52:34.365	Viviane Araujo	V. Araujo	Viviane	Araujo	Vivi	37	64	126	68	12-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4379362.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4379362.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4379362.png"}
3028863	2024-05-08 00:52:56.492	2024-05-08 00:52:56.492	Renato Moicano	R. Moicano	Renato	Moicano	Moicano	34	71	156	72	19-5-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3028863.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3028863.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3028863.png"}
3960071	2024-05-08 00:53:03.09	2024-05-08 00:53:03.09	Randy Brown	R. Brown	Randy	Brown	Rudeboy	33	75	171	78	18-5-0	https://a.espncdn.com/i/teamlogos/countries/500/jam.png	\N	{"primary": "#009C3A", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3960071.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3960071.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3960071.png"}
4045420	2024-05-08 00:52:34.452	2024-05-08 00:52:34.452	Aliaskhab Khizriev	A. Khizriev	Aliaskhab	Khizriev	Black Wolf	33	69	186	74	14-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4045420.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4045420.png"}
4426130	2024-05-08 00:52:34.461	2024-05-08 00:52:34.461	Makhmud Muradov	M. Muradov	Makhmud	Muradov	Mach	34	74	185	75	26-8-0	https://a.espncdn.com/i/teamlogos/countries/500/uzb.png	\N	{"primary": "#0099B5", "secondary": "#1EB53A"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4426130.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4426130.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4426130.png"}
4375574	2024-05-08 00:52:34.552	2024-05-08 00:52:34.552	Gilbert Urbina	G. Urbina	Gilbert	Urbina	The RGV Bad Boy	28	75	171	75	7-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4375574.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4375574.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4375574.png"}
3977987	2024-05-08 00:52:34.66	2024-05-08 00:52:34.66	Diana Belbita	D. Belbita	Diana	Belbita	The Warrior Princess	27	67	116	68	15-9-0	https://a.espncdn.com/i/teamlogos/countries/500/rom.png	\N	{"primary": "#FCD116", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3977987.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3977987.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3977987.png"}
4200455	2024-05-08 00:52:34.666	2024-05-08 00:52:34.666	Molly McCann	M. McCann	Molly	McCann	Meatball	34	64	116	62	14-6-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4200455.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4200455.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4200455.png"}
5141967	2024-05-08 00:52:34.791	2024-05-08 00:52:34.791	Azat Maksum	A. Maksum	Azat	Maksum	Kazakh	29	67	126	70	17-1-0	https://a.espncdn.com/i/teamlogos/countries/500/kaz.png	\N	{"primary": "#00AFCA", "secondary": "#FEC50D"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5141967.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5141967.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5141967.png"}
4914568	2024-05-08 00:52:34.927	2024-05-08 00:52:34.927	Pete Rodriguez	P. Rodriguez	Pete	Rodriguez	Dead Game	27	69	170	71	5-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4914568.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4914568.png"}
5068724	2024-05-08 00:52:35.094	2024-05-08 00:52:35.094	JeongYeong Lee	J. Lee	JeongYeong	Lee	Korean Tiger	28	70	146	73	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/kor.png	\N	{"primary": "#ED1C27", "secondary": "#024FA2"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5068724.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5068724.png"}
5080936	2024-05-08 00:52:35.1	2024-05-08 00:52:35.1	Blake Bilder	B. Bilder	Blake	Bilder	El Animal	33	68	144	68	8-2-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5080936.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5080936.png"}
3157454	2024-05-08 00:52:35.242	2024-05-08 00:52:35.242	Julija Stoliarenko	J. Stoliarenko	Julija	Stoliarenko	\N	31	67	126	66	11-9-2	https://a.espncdn.com/i/teamlogos/countries/500/ltu.png	\N	{"primary": "#FDB913", "secondary": "#006A44"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3157454.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3157454.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3157454.png"}
4372194	2024-05-08 00:52:35.25	2024-05-08 00:52:35.25	Luana Carolina	L. Carolina	Luana	Carolina	Dread	30	66	128	69	10-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4372194.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4372194.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4372194.png"}
4690546	2024-05-08 00:52:35.393	2024-05-08 00:52:35.393	Landon Quiñones	L. Quiñones	Landon	Quiñones	The Lone Wolf	28	69	155	70	7-3-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4690546.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4690546.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4690546.png"}
5157668	2024-05-08 00:52:35.409	2024-05-08 00:52:35.409	MarQuel Mederos	M. Mederos	MarQuel	Mederos	\N	27	70	155	69	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5157668.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5157668.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5157668.png"}
4199009	2024-05-08 00:52:40.385	2024-05-08 00:52:40.385	Aaron Pico	A. Pico	Aaron	Pico	\N	27	68	155	71	13-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4199009.png"}
4963269	2024-05-08 00:53:02.553	2024-05-08 00:53:02.553	Themba Gorimbo	T. Gorimbo	Themba	Gorimbo	The Answer	33	73	170	77	12-4-0	https://a.espncdn.com/i/teamlogos/countries/500/zim.png	\N	{"primary": "#FFD502", "secondary": "#026300"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4963269.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4963269.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4963269.png"}
4416297	2024-05-08 00:53:03.773	2024-05-08 00:53:03.773	Charles Radtke	C. Radtke	Charles	Radtke	Chuck Buffalo	33	69	170	72	9-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4416297.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4416297.png"}
4565641	2024-05-08 00:52:35.542	2024-05-08 00:52:35.542	Jamal Pogues	J. Pogues	Jamal	Pogues	Stormtrooper	28	75	265	77	11-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4565641.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4565641.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4565641.png"}
4869702	2024-05-08 00:52:35.549	2024-05-08 00:52:35.549	Thomas Petersen	T. Petersen	Thomas	Petersen	The Train	29	73	261	74	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4869702.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4869702.png"}
3027538	2024-05-08 00:52:35.709	2024-05-08 00:52:35.709	Alfred Walker	A. Walker	Alfred	Walker	Freight Train	37	68	145	70	2-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3027538.png"}
4424219	2024-05-08 00:52:35.714	2024-05-08 00:52:35.714	Elijah Johns	E. Johns	Elijah	Johns	\N	28	68	145	71	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4424219.png"}
5120918	2024-05-08 00:52:35.758	2024-05-08 00:52:35.758	Miguel Sanson	M. Sanson	Miguel	Sanson	\N	24	67	125	0	4-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5120918.png"}
5200305	2024-05-08 00:52:35.765	2024-05-08 00:52:35.765	An Tuan Ho	A. Ho	An Tuan	Ho	The Highlight	23	66	125	66	6-0-0	https://a.espncdn.com/i/teamlogos/countries/500/vie.png	\N	{"primary": "#DA251D", "secondary": "#FFFF00"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5200305.png"}
5211221	2024-05-08 00:52:35.8	2024-05-08 00:52:35.8	Mansur Abdul-Malik	M. Abdul-Malik	Mansur	Abdul-Malik	\N	26	74	185	80	5-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5211221.png"}
5211352	2024-05-08 00:52:35.807	2024-05-08 00:52:35.807	Allan St-Gelais	A. St-Gelais	Allan	St-Gelais	\N	34	0	185	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5211352.png"}
3074102	2024-05-08 00:52:35.87	2024-05-08 00:52:35.87	Jack Hermansson	J. Hermansson	Jack	Hermansson	The Joker	35	73	185	77	24-8-0	https://a.espncdn.com/i/teamlogos/countries/500/nor.png	\N	{"primary": "#EF2B2D", "secondary": "#002868"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3074102.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3074102.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3074102.png"}
4074001	2024-05-08 00:52:36.049	2024-05-08 00:52:36.049	Dan Ige	D. Ige	Dan	Ige	50K	32	67	146	71	18-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4074001.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4074001.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4074001.png"}
4341572	2024-05-08 00:52:36.204	2024-05-08 00:52:36.204	Robert Bryczek	R. Bryczek	Robert	Bryczek	\N	33	72	185	75	17-6-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4341572.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4341572.png"}
2504643	2024-05-08 00:52:36.37	2024-05-08 00:52:36.37	Brad Tavares	B. Tavares	Brad	Tavares	\N	36	73	186	74	20-10-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2504643.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2504643.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2504643.png"}
4690541	2024-05-08 00:52:36.375	2024-05-08 00:52:36.375	Gregory Rodrigues	G. Rodrigues	Gregory	Rodrigues	Robocop	32	75	186	75	15-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4690541.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4690541.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4690541.png"}
2488476	2024-05-08 00:52:36.474	2024-05-08 00:52:36.474	Michael Johnson	M. Johnson	Michael	Johnson	The Menace	37	70	156	73	23-19-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2488476.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2488476.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2488476.png"}
4358252	2024-05-08 00:52:36.481	2024-05-08 00:52:36.481	Darrius Flowers	D. Flowers	Darrius	Flowers	Beast Mode	29	69	156	71	12-7-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4358252.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4358252.png"}
5103717	2024-05-08 00:52:40.414	2024-05-08 00:52:40.414	Biaggio Ali Walsh	B. Ali Walsh	Biaggio	Ali Walsh	\N	25	70	155	72	1-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5103717.png"}
4684135	2024-05-08 00:53:06.205	2024-05-08 00:53:06.205	Joe Pyfer	J. Pyfer	Joe	Pyfer	Bodybagz	27	74	185	75	12-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4684135.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4684135.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4684135.png"}
4426250	2024-05-08 00:52:36.566	2024-05-08 00:52:36.566	Rodolfo Vieira	R. Vieira	Rodolfo	Vieira	The Black Belt Hunter	34	72	185	73	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4426250.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4426250.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4426250.png"}
4894791	2024-05-08 00:52:36.571	2024-05-08 00:52:36.571	Armen Petrosyan	A. Petrosyan	Armen	Petrosyan	Superman	33	75	186	71	9-3-0	https://a.espncdn.com/i/teamlogos/countries/500/arm.png	\N	{"primary": "#D90012", "secondary": "#F2A800"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4894791.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4894791.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4894791.png"}
4024732	2024-05-08 00:52:36.657	2024-05-08 00:52:36.657	Trevin Giles	T. Giles	Trevin	Giles	\N	31	72	171	74	16-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4024732.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4024732.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4024732.png"}
5123311	2024-05-08 00:52:36.788	2024-05-08 00:52:36.788	Timmy Cuamba	T. Cuamba	Timmy	Cuamba	Twilight	25	69	155	71	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5123311.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5123311.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5123311.png"}
5145682	2024-05-08 00:52:36.793	2024-05-08 00:52:36.793	Bolaji Oki	B. Oki	Bolaji	Oki	The Zulu Warrior	28	70	156	73	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bel.png	\N	{"primary": "#EF3340", "secondary": "#FDDA24"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5145682.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5145682.png"}
4292347	2024-05-08 00:52:36.873	2024-05-08 00:52:36.873	Loma Lookboonmee	L. Lookboonmee	Loma	Lookboonmee	\N	28	61	115	61	9-3-0	https://a.espncdn.com/i/teamlogos/countries/500/tha.png	\N	{"primary": "#A51931", "secondary": "#2D2A4A"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4292347.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4292347.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4292347.png"}
4394200	2024-05-08 00:52:36.877	2024-05-08 00:52:36.877	Bruna Brasil	B. Brasil	Bruna	Brasil	The Special One	30	66	115	65	9-4-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4394200.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4394200.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4394200.png"}
3971496	2024-05-08 00:52:36.961	2024-05-08 00:52:36.961	Devin Clark	D. Clark	Devin	Clark	Brown Bear	34	72	204	75	14-9-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3971496.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3971496.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3971496.png"}
3998068	2024-05-08 00:52:36.965	2024-05-08 00:52:36.965	Marcin Prachnio	M. Prachnio	Marcin	Prachnio	\N	35	75	204	74	17-7-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3998068.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3998068.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3998068.png"}
3040385	2024-05-08 00:52:37.067	2024-05-08 00:52:37.067	Max Griffin	M. Griffin	Max	Griffin	Pain	38	71	170	76	20-10-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3040385.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3040385.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3040385.png"}
3970873	2024-05-08 00:52:37.072	2024-05-08 00:52:37.072	Jeremiah Wells	J. Wells	Jeremiah	Wells	\N	37	69	171	74	12-4-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3970873.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3970873.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3970873.png"}
4896541	2024-05-08 00:52:37.187	2024-05-08 00:52:37.187	Zac Pauga	Z. Pauga	Zac	Pauga	The High Chief	36	74	206	76	6-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4896541.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4896541.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4896541.png"}
4880596	2024-05-08 00:52:37.32	2024-05-08 00:52:37.32	Fernie Garcia	F. Garcia	Fernie	Garcia	Fernie	32	67	146	67	10-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4880596.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4880596.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4880596.png"}
5027356	2024-05-08 00:52:37.327	2024-05-08 00:52:37.327	Hyder Amil	H. Amil	Hyder	Amil	The Hurricane	33	69	145	70	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/phi.png	\N	{"primary": "#0038A8", "secondary": "#CE0F26"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5027356.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5027356.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5027356.png"}
4294832	2024-05-08 00:53:03.769	2024-05-08 00:53:03.769	Carlos Prates	C. Prates	Carlos	Prates	The Nightmare	30	73	171	78	18-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4294832.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4294832.png"}
4389085	2024-05-08 00:52:37.476	2024-05-08 00:52:37.476	Aoriqileng	Aoriqileng	Aoriqileng	\N	The Mongolian Murderer	30	67	136	69	25-10-0	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4389085.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4389085.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4389085.png"}
3893071	2024-05-08 00:52:37.631	2024-05-08 00:52:37.631	Lito Adiwang	L. Adiwang	Lito	Adiwang	Thunder Kid	31	64	125	65	15-5-0	https://a.espncdn.com/i/teamlogos/countries/500/phi.png	\N	{"primary": "#0038A8", "secondary": "#CE0F26"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3893071.png"}
5105155	2024-05-08 00:52:37.638	2024-05-08 00:52:37.638	Danial Williams	D. Williams	Danial	Williams	Mini T	30	66	125	67	6-3-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5105155.png"}
4031353	2024-05-08 00:52:37.672	2024-05-08 00:52:37.672	Yosuke Saruta	Y. Saruta	Yosuke	Saruta	Tobizaru	36	63	125	64	21-12-3	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4031353.png"}
5173846	2024-05-08 00:52:37.682	2024-05-08 00:52:37.682	Mansur Malachiev	M. Malachiev	Mansur	Malachiev	\N	\N	66	125	68	12-1-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5173846.png"}
3949584	2024-05-08 00:52:37.74	2024-05-08 00:52:37.74	Alexander Volkanovski	A. Volkanovski	Alexander	Volkanovski	The Great	35	66	144	71	26-4-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3949584.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3949584.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3949584.png"}
4350812	2024-05-08 00:52:37.749	2024-05-08 00:52:37.749	Ilia Topuria	I. Topuria	Ilia	Topuria	El Matador	27	67	144	69	15-0-0	https://a.espncdn.com/i/teamlogos/countries/500/geo.png	\N	{"primary": "#FF0000", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4350812.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4350812.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4350812.png"}
3111997	2024-05-08 00:52:38.172	2024-05-08 00:52:38.172	Geoff Neal	G. Neal	Geoff	Neal	Handz of Steel	33	71	170	75	15-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3111997.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3111997.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3111997.png"}
4738092	2024-05-08 00:52:38.18	2024-05-08 00:52:38.18	Ian Machado Garry	I. Machado Garry	Ian	Machado Garry	The Future	26	75	170	74	14-0-0	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4738092.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4738092.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4738092.png"}
3023388	2024-05-08 00:52:38.378	2024-05-08 00:52:38.378	Henry Cejudo	H. Cejudo	Henry	Cejudo	Triple C	37	64	135	64	16-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3023388.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3023388.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3023388.png"}
3948572	2024-05-08 00:52:38.385	2024-05-08 00:52:38.385	Merab Dvalishvili	M. Dvalishvili	Merab	Dvalishvili	The Machine	33	66	135	68	17-4-0	https://a.espncdn.com/i/teamlogos/countries/500/geo.png	\N	{"primary": "#FF0000", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3948572.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3948572.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3948572.png"}
4290956	2024-05-08 00:52:38.614	2024-05-08 00:52:38.614	Anthony Hernandez	A. Hernandez	Anthony	Hernandez	Fluffy	30	72	185	75	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4290956.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4290956.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4290956.png"}
4021217	2024-05-08 00:52:38.848	2024-05-08 00:52:38.848	Mackenzie Dern	M. Dern	Mackenzie	Dern	\N	31	64	116	63	13-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4021217.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4021217.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4021217.png"}
4300149	2024-05-08 00:53:03.005	2024-05-08 00:53:03.005	Roman Kopylov	R. Kopylov	Roman	Kopylov	\N	33	72	185	75	12-3-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4300149.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4300149.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4300149.png"}
5088886	2024-05-08 00:53:03.85	2024-05-08 00:53:03.85	Daniel Marcos	D. Marcos	Daniel	Marcos	Soncora	31	67	136	69	15-0-0	https://a.espncdn.com/i/teamlogos/countries/500/per.png	\N	{"primary": "#D91023", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5088886.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5088886.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5088886.png"}
3009717	2024-05-08 00:53:05.052	2024-05-08 00:53:05.052	Robert Whittaker	R. Whittaker	Robert	Whittaker	The Reaper	33	72	185	73	26-7-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3009717.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3009717.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3009717.png"}
4233196	2024-05-08 00:52:38.854	2024-05-08 00:52:38.854	Amanda Lemos	A. Lemos	Amanda	Lemos	Amandinha	36	64	115	65	14-3-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4233196.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4233196.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4233196.png"}
2558075	2024-05-08 00:52:39.061	2024-05-08 00:52:39.061	Marcos Rogerio de Lima	M. de Lima	Marcos Rogerio	de Lima	Pezao	38	73	261	75	22-10-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2558075.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2558075.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2558075.png"}
5122234	2024-05-08 00:52:39.07	2024-05-08 00:52:39.07	Junior Tafa	J. Tafa	Junior	Tafa	The Juggernaut	27	75	249	72	5-2-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5122234.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5122234.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5122234.png"}
4684059	2024-05-08 00:52:39.302	2024-05-08 00:52:39.302	Carlos Vera	C. Vera	Carlos	Vera	Pequeno	36	66	135	69	11-4-0	https://a.espncdn.com/i/teamlogos/countries/500/ecu.png	\N	{"primary": "#034EA2", "secondary": "#FFDD00"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4684059.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4684059.png"}
5068624	2024-05-08 00:52:39.308	2024-05-08 00:52:39.308	Rinya Nakamura	R. Nakamura	Rinya	Nakamura	Hybrid	29	67	135	68	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5068624.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5068624.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5068624.png"}
4379328	2024-05-08 00:52:39.507	2024-05-08 00:52:39.507	Brendson Ribeiro	B. Ribeiro	Brendson	Ribeiro	The Gorilla	27	75	205	81	15-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4379328.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4379328.png"}
4845284	2024-05-08 00:52:39.515	2024-05-08 00:52:39.515	Zhang Mingyang	Z. Mingyang	Zhang	Mingyang	Mountain Tiger	25	74	204	75	17-6-0	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4845284.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4845284.png"}
4788300	2024-05-08 00:52:39.633	2024-05-08 00:52:39.633	Josh Quinlan	J. Quinlan	Josh	Quinlan	Bushido	31	72	169	72	6-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4788300.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4788300.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4788300.png"}
5152138	2024-05-08 00:52:39.638	2024-05-08 00:52:39.638	Danny Barlow	D. Barlow	Danny	Barlow	LEFTHAND2GOD	28	74	171	79	8-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5152138.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5152138.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5152138.png"}
4900808	2024-05-08 00:52:39.723	2024-05-08 00:52:39.723	Oban Elliott	O. Elliott	Oban	Elliott	The Welsh Gangster	26	72	170	72	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/wal.png	\N	{"primary": "#BA0F30", "secondary": "#00AB39"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4900808.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4900808.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4900808.png"}
4926991	2024-05-08 00:52:39.73	2024-05-08 00:52:39.73	Val Woodburn	V. Woodburn	Val	Woodburn	The Animal	30	68	169	74	7-2-0	https://a.espncdn.com/i/teamlogos/countries/500/jam.png	\N	{"primary": "#009C3A", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4926991.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4926991.png"}
4065598	2024-05-08 00:52:39.821	2024-05-08 00:52:39.821	Miranda Maverick	M. Maverick	Miranda	Maverick	Fear The	26	63	126	65	15-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4065598.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4065598.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4065598.png"}
2512984	2024-05-08 00:52:39.939	2024-05-08 00:52:39.939	Wilson Reis	W. Reis	Wilson	Reis	\N	39	64	145	65	28-13-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2512984.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2512984.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2512984.png"}
3020395	2024-05-08 00:52:39.943	2024-05-08 00:52:39.943	Toby Misech	T. Misech	Toby	Misech	2 Quick	36	68	135	68	12-9-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3020395.png"}
3961957	2024-05-08 00:52:39.962	2024-05-08 00:52:39.962	Bryce Logan	B. Logan	Bryce	Logan	\N	34	69	155	70	13-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3961957.png"}
4419470	2024-05-08 00:52:39.967	2024-05-08 00:52:39.967	Mason Jones	M. Jones	Mason	Jones	Dragon	29	70	155	74	14-2-0	https://a.espncdn.com/i/teamlogos/countries/500/wal.png	\N	{"primary": "#BA0F30", "secondary": "#00AB39"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4419470.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4419470.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4419470.png"}
4565646	2024-05-08 00:52:40.002	2024-05-08 00:52:40.002	Devin Smyth	D. Smyth	Devin	Smyth	The Prodigy	28	70	170	73	10-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4565646.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4565646.png"}
5131950	2024-05-08 00:52:40.005	2024-05-08 00:52:40.005	Shamidkhan Magomedov	S. Magomedov	Shamidkhan	Magomedov	\N	29	70	170	71	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5131950.png"}
4371905	2024-05-08 00:52:40.028	2024-05-08 00:52:40.028	Luiz Gustavo	L. Gustavo	Luiz	Gustavo	Killer	27	69	145	0	14-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4371905.png"}
4565904	2024-05-08 00:52:40.032	2024-05-08 00:52:40.032	Yoshinori Horie	Y. Horie	Yoshinori	Horie	Rising Star	28	68	145	70	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4565904.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4565904.png"}
4378414	2024-05-08 00:52:40.055	2024-05-08 00:52:40.055	Rikuto Shirakawa	R. Shirakawa	Rikuto	Shirakawa	Dark	32	68	155	0	0-3-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4378414.png"}
4410700	2024-05-08 00:52:40.073	2024-05-08 00:52:40.073	Kenta Takizawa	K. Takizawa	Kenta	Takizawa	\N	29	69	135	0	13-10-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4410700.png"}
5011094	2024-05-08 00:52:40.078	2024-05-08 00:52:40.078	Shohei Nose	S. Nose	Shohei	Nose	\N	26	66	135	68	12-4-2	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5011094.png"}
2335530	2024-05-08 00:52:40.099	2024-05-08 00:52:40.099	Ryan Bader	R. Bader	Ryan	Bader	Darth	40	74	231	73	31-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2335530.png"}
4408708	2024-05-08 00:52:40.104	2024-05-08 00:52:40.104	Renan Ferreira	R. Ferreira	Renan	Ferreira	Problema	34	80	263	85	13-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4408708.png"}
4697390	2024-05-08 00:52:40.145	2024-05-08 00:52:40.145	Johnny Eblen	J. Eblen	Johnny	Eblen	Pressure	32	73	185	74	15-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4697390.png"}
4339208	2024-05-08 00:52:40.186	2024-05-08 00:52:40.186	Ray Cooper III	R. Cooper III	Ray	Cooper III	Bradda	31	67	182	70	25-10-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4339208.png"}
3949930	2024-05-08 00:52:40.221	2024-05-08 00:52:40.221	Bruno Cappelozza	B. Cappelozza	Bruno	Cappelozza	\N	34	74	236	79	15-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3949930.png"}
3955014	2024-05-08 00:52:40.226	2024-05-08 00:52:40.226	Vadim Nemkov	V. Nemkov	Vadim	Nemkov	\N	31	72	238	76	18-2-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3955014.png"}
2569939	2024-05-08 00:52:40.269	2024-05-08 00:52:40.269	Yoel Romero	Y. Romero	Yoel	Romero	Soldier of God	47	72	205	73	16-7-0	https://a.espncdn.com/i/teamlogos/countries/500/cub.png	\N	{"primary": "#CF142B", "secondary": "#002A8F"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2569939.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2569939.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2569939.png"}
3045798	2024-05-08 00:52:40.275	2024-05-08 00:52:40.275	Thiago Santos	T. Santos	Thiago	Santos	Marreta	40	74	205	78	22-12-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3045798.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3045798.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3045798.png"}
3821379	2024-05-08 00:52:40.335	2024-05-08 00:52:40.335	AJ McKee	A. McKee	AJ	McKee	The Mercenary	29	70	155	74	22-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3821379.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3821379.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3821379.png"}
3892809	2024-05-08 00:52:40.379	2024-05-08 00:52:40.379	Henry Corrales	H. Corrales	Henry	Corrales	OK	37	68	155	70	21-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3892809.png"}
3120931	2024-05-08 00:53:04.74	2024-05-08 00:53:04.74	Jason Jackson	J. Jackson	Jason	Jackson	\N	33	73	182	79	18-4-0	https://a.espncdn.com/i/teamlogos/countries/500/jam.png	\N	{"primary": "#009C3A", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3120931.png"}
4039836	2024-05-08 00:53:02.257	2024-05-08 00:53:02.257	Yusuke Yachi	Y. Yachi	Yusuke	Yachi	\N	33	69	155	69	26-13-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4039836.png"}
2984772	2024-05-08 00:53:04.462	2024-05-08 00:53:04.462	Clay Collard	C. Collard	Clay	Collard	Cassius	31	72	155	74	25-12-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2984772.png"}
5195884	2024-05-08 00:52:40.421	2024-05-08 00:52:40.421	Emmanuel Palacio	E. Palacio	Emmanuel	Palacio	El Vikingo	19	67	152	0	1-1-0	https://a.espncdn.com/i/teamlogos/countries/500/arg.png	\N	{"primary": "#74ACDF", "secondary": "#F6B40E"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5195884.png"}
3031588	2024-05-08 00:52:40.461	2024-05-08 00:52:40.461	Kelsey DeSantis	K. DeSantis	Kelsey	DeSantis	\N	35	70	164	66	1-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3031588.png"}
4708687	2024-05-08 00:52:40.468	2024-05-08 00:52:40.468	Claressa Shields	C. Shields	Claressa	Shields	T-Rex	29	68	164	68	2-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4708687.png"}
5123585	2024-05-08 00:52:40.543	2024-05-08 00:52:40.543	Abdullah Al-Qahtani	A. Al-Qahtani	Abdullah	Al-Qahtani	The Reaper	\N	69	146	74	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/ksa.png	\N	{"primary": "#006C35", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5123585.png"}
5195513	2024-05-08 00:52:40.548	2024-05-08 00:52:40.548	Edukondal Rao	E. Rao	Edukondal	Rao	Badger	30	68	145	69	4-2-0	https://a.espncdn.com/i/teamlogos/countries/500/ind.png	\N	{"primary": "#FF9933", "secondary": "#138808"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5195513.png"}
3027545	2024-05-08 00:52:40.609	2024-05-08 00:52:40.609	Brandon Moreno	B. Moreno	Brandon	Moreno	The Assassin Baby	30	67	126	70	21-8-2	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3027545.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3027545.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3027545.png"}
4239928	2024-05-08 00:52:40.614	2024-05-08 00:52:40.614	Brandon Royval	B. Royval	Brandon	Royval	Raw Dawg	31	69	126	68	16-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4239928.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4239928.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4239928.png"}
3045737	2024-05-08 00:52:40.765	2024-05-08 00:52:40.765	Brian Ortega	B. Ortega	Brian	Ortega	T-City	33	68	146	69	16-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3045737.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3045737.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3045737.png"}
3155420	2024-05-08 00:52:40.772	2024-05-08 00:52:40.772	Yair Rodriguez	Y. Rodriguez	Yair	Rodriguez	El Pantera	31	71	146	71	16-5-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3155420.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3155420.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3155420.png"}
4863327	2024-05-08 00:52:40.957	2024-05-08 00:52:40.957	Daniel Zellhuber	D. Zellhuber	Daniel	Zellhuber	Golden Boy	24	73	156	77	15-1-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4863327.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4863327.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4863327.png"}
5123216	2024-05-08 00:52:40.965	2024-05-08 00:52:40.965	Francisco Prado	F. Prado	Francisco	Prado	\N	21	70	156	69	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/arg.png	\N	{"primary": "#74ACDF", "secondary": "#F6B40E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5123216.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5123216.png"}
4348673	2024-05-08 00:52:41.134	2024-05-08 00:52:41.134	Sam Hughes	S. Hughes	Sam	Hughes	Sampage	31	65	115	64	8-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4348673.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4348673.png"}
5063403	2024-05-08 00:52:41.142	2024-05-08 00:52:41.142	Yazmin Jauregui	Y. Jauregui	Yazmin	Jauregui	\N	25	63	115	64	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5063403.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5063403.png"}
4867356	2024-05-08 00:52:41.302	2024-05-08 00:52:41.302	Chris Duncan	C. Duncan	Chris	Duncan	The Problem	30	70	156	71	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/sct.png	\N	{"primary": "#0065BD", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4867356.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4867356.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4867356.png"}
4896616	2024-05-08 00:52:41.313	2024-05-08 00:52:41.313	Manuel Torres	M. Torres	Manuel	Torres	El Loco	29	70	155	73	15-2-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4896616.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4896616.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4896616.png"}
3075570	2024-05-08 00:52:41.432	2024-05-08 00:52:41.432	Raoni Barcelos	R. Barcelos	Raoni	Barcelos	\N	37	67	135	67	18-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3075570.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3075570.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3075570.png"}
4884868	2024-05-08 00:52:41.441	2024-05-08 00:52:41.441	Cristian Quiñonez	C. Quiñonez	Cristian	Quiñonez	Problema	28	68	135	70	18-5-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4884868.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4884868.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4884868.png"}
5074274	2024-05-08 00:52:41.527	2024-05-08 00:52:41.527	Jesus Aguilar	J. Aguilar	Jesus	Aguilar	\N	28	64	126	62	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5074274.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5074274.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5074274.png"}
5088891	2024-05-08 00:52:41.532	2024-05-08 00:52:41.532	Mateus Mendonca	M. Mendonca	Mateus	Mendonca	Bocao	25	66	126	71	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5088891.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5088891.png"}
4895772	2024-05-08 00:52:41.62	2024-05-08 00:52:41.62	Daniel Lacerda	D. Lacerda	Daniel	Lacerda	Miojo	27	66	127	70	11-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4895772.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4895772.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4895772.png"}
5076027	2024-05-08 00:52:41.625	2024-05-08 00:52:41.625	Édgar Cháirez	É. Cháirez	Édgar	Cháirez	Puro Chicali	28	67	131	71	11-5-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5076027.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5076027.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5076027.png"}
4070701	2024-05-08 00:52:41.658	2024-05-08 00:52:41.658	Claudio Puelles	C. Puelles	Claudio	Puelles	Prince of Peru	28	70	156	72	13-4-0	https://a.espncdn.com/i/teamlogos/countries/500/per.png	\N	{"primary": "#D91023", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4070701.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4070701.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4070701.png"}
4083018	2024-05-08 00:52:41.663	2024-05-08 00:52:41.663	Farés Ziam	F. Ziam	Farés	Ziam	Smile Killer	27	73	156	75	15-4-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4083018.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4083018.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4083018.png"}
4685888	2024-05-08 00:52:41.766	2024-05-08 00:52:41.766	Ronaldo Rodriguez	R. Rodriguez	Ronaldo	Rodriguez	Lazy Boy	25	66	124	65	17-2-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4685888.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4685888.png"}
4713086	2024-05-08 00:52:41.772	2024-05-08 00:52:41.772	Denys Bondar	D. Bondar	Denys	Bondar	Psycho	31	66	126	69	14-5-0	https://a.espncdn.com/i/teamlogos/countries/500/ukr.png	\N	{"primary": "#005BBB", "secondary": "#FFD500"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4713086.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4713086.png"}
4713584	2024-05-08 00:52:41.879	2024-05-08 00:52:41.879	Victor Altamirano	V. Altamirano	Victor	Altamirano	El Magnífico	33	68	125	70	12-4-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4713584.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4713584.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4713584.png"}
5143333	2024-05-08 00:52:41.883	2024-05-08 00:52:41.883	Felipe dos Santos	F. dos Santos	Felipe	dos Santos	Lipe Detona	23	67	124	70	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5143333.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5143333.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5143333.png"}
4690540	2024-05-08 00:52:41.969	2024-05-08 00:52:41.969	Muhammad Naimov	M. Naimov	Muhammad	Naimov	Hillman	29	69	146	70	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/tjk.png	\N	{"primary": "#CE0F26", "secondary": "#026601"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4690540.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4690540.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4690540.png"}
5075335	2024-05-08 00:52:41.975	2024-05-08 00:52:41.975	Erik Silva	E. Silva	Erik	Silva	The King	37	69	146	71	9-3-0	https://a.espncdn.com/i/teamlogos/countries/500/ven.png	\N	{"primary": "#CE1126", "secondary": "#003893"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5075335.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5075335.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5075335.png"}
4423880	2024-05-08 00:52:42.061	2024-05-08 00:52:42.061	Reinier de Ridder	R. de Ridder	Reinier	de Ridder	The Dutch Knight	33	75	205	79	16-2-0	https://a.espncdn.com/i/teamlogos/countries/500/ned.png	\N	{"primary": "#AE1C28", "secondary": "#21468B"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4423880.png"}
4566264	2024-05-08 00:52:42.065	2024-05-08 00:52:42.065	Anatoly Malykhin	A. Malykhin	Anatoly	Malykhin	Sladkiy	36	71	265	0	14-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4566264.png"}
3895524	2024-05-08 00:52:42.082	2024-05-08 00:52:42.082	Thanh Le	T. Le	Thanh	Le	\N	38	69	145	74	14-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3895524.png"}
4420538	2024-05-08 00:52:42.088	2024-05-08 00:52:42.088	Kai Tang	K. Tang	Kai	Tang	\N	28	70	155	0	16-2-0	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4420538.png"}
4036094	2024-05-08 00:52:42.106	2024-05-08 00:52:42.106	Jarred Brooks	J. Brooks	Jarred	Brooks	The Monkey God	31	63	125	62	20-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4036094.png"}
4054997	2024-05-08 00:52:42.113	2024-05-08 00:52:42.113	Joshua Pacio	J. Pacio	Joshua	Pacio	The Passion	28	64	125	0	22-4-0	https://a.espncdn.com/i/teamlogos/countries/500/phi.png	\N	{"primary": "#0038A8", "secondary": "#CE0F26"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4054997.png"}
4076779	2024-05-08 00:52:42.137	2024-05-08 00:52:42.137	Amir Aliakbari	A. Aliakbari	Amir	Aliakbari	\N	39	75	250	0	13-3-0	https://a.espncdn.com/i/teamlogos/countries/500/iri.png	\N	{"primary": "#239F40", "secondary": "#DA0000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4076779.png"}
2560723	2024-05-08 00:52:45.896	2024-05-08 00:52:45.896	Michal Materla	M. Materla	Michal	Materla	Cipao	40	72	185	0	33-11-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2560723.png"}
4230824	2024-05-08 00:52:42.142	2024-05-08 00:52:42.142	Arjan Bhullar	A. Bhullar	Arjan	Bhullar	\N	37	73	240	75	11-3-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4230824.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4230824.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4230824.png"}
4251381	2024-05-08 00:52:42.166	2024-05-08 00:52:42.166	Jeremy Miado	J. Miado	Jeremy	Miado	The Jaguar	31	68	125	70	12-7-0	https://a.espncdn.com/i/teamlogos/countries/500/phi.png	\N	{"primary": "#0038A8", "secondary": "#CE0F26"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4251381.png"}
5194556	2024-05-08 00:52:42.169	2024-05-08 00:52:42.169	Keito Yamakita	K. Yamakita	Keito	Yamakita	Pocket Monk	27	61	125	0	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5194556.png"}
4410084	2024-05-08 00:52:42.208	2024-05-08 00:52:42.208	Jairzinho Rozenstruik	J. Rozenstruik	Jairzinho	Rozenstruik	Bigi Boy	36	74	257	78	14-5-0	https://a.espncdn.com/i/teamlogos/countries/500/sur.png	\N	{"primary": "#377F3F", "secondary": "#ECC81B"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4410084.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4410084.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4410084.png"}
5145498	2024-05-08 00:52:42.214	2024-05-08 00:52:42.214	Shamil Gaziev	S. Gaziev	Shamil	Gaziev	\N	34	76	261	78	12-1-0	https://a.espncdn.com/i/teamlogos/countries/500/brn.png	\N	{"primary": "#CE1126", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5145498.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5145498.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5145498.png"}
4071969	2024-05-08 00:52:42.333	2024-05-08 00:52:42.333	Tyson Pedro	T. Pedro	Tyson	Pedro	\N	32	75	205	79	10-5-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4071969.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4071969.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4071969.png"}
4905261	2024-05-08 00:52:42.48	2024-05-08 00:52:42.48	Muhammad Mokaev	M. Mokaev	Muhammad	Mokaev	The Punisher	23	67	126	70	12-0-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4905261.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4905261.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4905261.png"}
5196459	2024-05-08 00:52:42.634	2024-05-08 00:52:42.634	Bekzat Almakhan	B. Almakhan	Bekzat	Almakhan	The Turan Warrior	26	67	136	68	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/kaz.png	\N	{"primary": "#00AFCA", "secondary": "#FEC50D"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5196459.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5196459.png"}
2994349	2024-05-08 00:52:42.785	2024-05-08 00:52:42.785	Matt Schnell	M. Schnell	Matt	Schnell	Danger	34	68	126	70	16-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2994349.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2994349.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2994349.png"}
4082125	2024-05-08 00:52:42.963	2024-05-08 00:52:42.963	Eryk Anders	E. Anders	Eryk	Anders	Ya Boi	37	73	185	75	16-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4082125.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4082125.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4082125.png"}
4237148	2024-05-08 00:52:42.969	2024-05-08 00:52:42.969	Jamie Pickett	J. Pickett	Jamie	Pickett	The Night Wolf	35	74	186	80	13-11-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4237148.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4237148.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4237148.png"}
4884877	2024-05-08 00:52:43.142	2024-05-08 00:52:43.142	Vinicius Oliveira	V. Oliveira	Vinicius	Oliveira	LokDog	28	69	135	70	20-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4884877.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4884877.png"}
5080883	2024-05-08 00:52:43.148	2024-05-08 00:52:43.148	Bernardo Sopaj	B. Sopaj	Bernardo	Sopaj	The Lion King	23	66	135	66	11-3-0	https://a.espncdn.com/i/teamlogos/countries/500/alb.png	\N	{"primary": "#CE1126", "secondary": "#002B7F"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5080883.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5080883.png"}
4997217	2024-05-08 00:52:59.334	2024-05-08 00:52:59.334	Steve Erceg	S. Erceg	Steve	Erceg	Astroboy	28	68	125	68	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4997217.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4997217.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4997217.png"}
5060483	2024-05-08 00:52:59.54	2024-05-08 00:52:59.54	Vitor Petrino	V. Petrino	Vitor	Petrino	Icao	26	74	206	77	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5060483.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5060483.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5060483.png"}
4569549	2024-05-08 00:53:06.426	2024-05-08 00:53:06.426	Umar Nurmagomedov	U. Nurmagomedov	Umar	Nurmagomedov	\N	28	68	136	69	17-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4569549.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4569549.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4569549.png"}
4079149	2024-05-08 00:52:43.34	2024-05-08 00:52:43.34	Aiemann Zahabi	A. Zahabi	Aiemann	Zahabi	\N	36	68	135	68	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4079149.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4079149.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4079149.png"}
4867357	2024-05-08 00:52:43.347	2024-05-08 00:52:43.347	Javid Basharat	J. Basharat	Javid	Basharat	The Snow Leopard	28	69	136	69	14-1-0	https://a.espncdn.com/i/teamlogos/countries/500/afg.png	\N	{"primary": "#EB3223", "secondary": "#377D22"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4867357.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4867357.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4867357.png"}
4848674	2024-05-08 00:52:43.56	2024-05-08 00:52:43.56	Christian Leroy Duncan	C. Duncan	Christian Leroy	Duncan	CLD	28	74	186	79	10-1-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4848674.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4848674.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4848674.png"}
5074126	2024-05-08 00:52:43.569	2024-05-08 00:52:43.569	Claudio Ribeiro	C. Ribeiro	Claudio	Ribeiro	\N	31	73	185	77	11-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5074126.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5074126.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5074126.png"}
4685730	2024-05-08 00:52:43.734	2024-05-08 00:52:43.734	AJ Cunningham	A. Cunningham	AJ	Cunningham	The Savage	29	70	155	71	11-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4685730.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4685730.png"}
4419434	2024-05-08 00:52:43.885	2024-05-08 00:52:43.885	Loik Radzhabov	L. Radzhabov	Loik	Radzhabov	The Tajik Tank	33	71	155	69	18-5-1	https://a.espncdn.com/i/teamlogos/countries/500/tjk.png	\N	{"primary": "#CE0F26", "secondary": "#026601"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4419434.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4419434.png"}
4695485	2024-05-08 00:52:43.897	2024-05-08 00:52:43.897	Abdul-Kareem Al-Selwady	A. Al-Selwady	Abdul-Kareem	Al-Selwady	Pride of Palestine	29	68	155	69	15-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4695485.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4695485.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4695485.png"}
4826633	2024-05-08 00:52:43.953	2024-05-08 00:52:43.953	Jihin Radzuan	J. Radzuan	Jihin	Radzuan	Shadowcat	25	62	115	0	9-4-0	https://a.espncdn.com/i/teamlogos/countries/500/mas.png	\N	{"primary": "#040065", "secondary": "#C90100"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4826633.png"}
5207722	2024-05-08 00:52:43.96	2024-05-08 00:52:43.96	Chihiro Sawada	C. Sawada	Chihiro	Sawada	\N	26	59	125	60	1-0-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5207722.png"}
4081147	2024-05-08 00:52:43.991	2024-05-08 00:52:43.991	Bruno Assis	B. Assis	Bruno	Assis	Brunao	31	74	185	78	13-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4081147.png"}
5206516	2024-05-08 00:52:43.997	2024-05-08 00:52:43.997	Uran Satybaldiev	U. Satybaldiev	Uran	Satybaldiev	Gorilla	\N	76	185	0	7-1-0	https://a.espncdn.com/i/teamlogos/countries/500/kgz.png	\N	{"primary": "#E8112D", "secondary": "#FFE704"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5206516.png"}
4878555	2024-05-08 00:52:44.038	2024-05-08 00:52:44.038	Jeff Creighton	J. Creighton	Jeff	Creighton	Jazzy	\N	71	170	74	8-2-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4878555.png"}
5125014	2024-05-08 00:52:44.045	2024-05-08 00:52:44.045	Miguel Jacob	M. Jacob	Miguel	Jacob	\N	27	71	170	72	1-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5125014.png"}
4704451	2024-05-08 00:52:44.079	2024-05-08 00:52:44.079	Chuck Campbell	C. Campbell	Chuck	Campbell	\N	\N	76	205	78	6-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4704451.png"}
4944080	2024-05-08 00:52:44.087	2024-05-08 00:52:44.087	Ozzy Diaz	O. Diaz	Ozzy	Diaz	One Hit	33	76	185	79	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4944080.png"}
4629138	2024-05-08 00:52:44.123	2024-05-08 00:52:44.123	Jean-Paul Lebosnoyani	J. Lebosnoyani	Jean-Paul	Lebosnoyani	Mufasa	25	71	155	72	6-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4629138.png"}
4976728	2024-05-08 00:52:44.131	2024-05-08 00:52:44.131	Adam Wamsley	A. Wamsley	Adam	Wamsley	\N	33	72	185	70	2-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4976728.png"}
3155424	2024-05-08 00:52:44.193	2024-05-08 00:52:44.193	Marlon Vera	M. Vera	Marlon	Vera	Chito	31	68	135	70	23-9-1	https://a.espncdn.com/i/teamlogos/countries/500/ecu.png	\N	{"primary": "#034EA2", "secondary": "#FFDD00"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3155424.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3155424.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3155424.png"}
5149924	2024-05-08 00:52:45.905	2024-05-08 00:52:45.905	Piotr Kuberski	P. Kuberski	Piotr	Kuberski	QBear	\N	75	185	75	13-1-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5149924.png"}
4205093	2024-05-08 00:52:44.199	2024-05-08 00:52:44.199	Sean O'Malley	S. O'Malley	Sean	O'Malley	Suga	29	71	135	72	18-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4205093.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4205093.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4205093.png"}
4895362	2024-05-08 00:52:44.368	2024-05-08 00:52:44.368	Benoît Saint Denis	B. Saint Denis	Benoît	Saint Denis	God of War	28	71	155	73	13-2-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4895362.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4895362.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4895362.png"}
3022067	2024-05-08 00:52:44.519	2024-05-08 00:52:44.519	Michael Page	M. Page	Michael	Page	Venom	37	75	170	79	22-2-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3022067.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3022067.png"}
3943695	2024-05-08 00:52:44.525	2024-05-08 00:52:44.525	Kevin Holland	K. Holland	Kevin	Holland	Trailblazer	31	75	170	81	25-11-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3943695.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3943695.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3943695.png"}
3090197	2024-05-08 00:52:44.649	2024-05-08 00:52:44.649	Gilbert Burns	G. Burns	Gilbert	Burns	Durinho	37	70	171	71	22-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3090197.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3090197.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3090197.png"}
4828707	2024-05-08 00:52:44.654	2024-05-08 00:52:44.654	Jack Della Maddalena	J. Della Maddalena	Jack	Della Maddalena	\N	27	71	170	73	17-2-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4828707.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4828707.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4828707.png"}
3151289	2024-05-08 00:52:44.737	2024-05-08 00:52:44.737	Song Yadong	S. Yadong	Song	Yadong	Kung Fu Kid	26	68	136	67	21-8-1	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3151289.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3151289.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3151289.png"}
4293517	2024-05-08 00:52:44.742	2024-05-08 00:52:44.742	Petr Yan	P. Yan	Petr	Yan	No Mercy	31	67	135	67	17-5-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4293517.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4293517.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4293517.png"}
3922557	2024-05-08 00:52:44.827	2024-05-08 00:52:44.827	Curtis Blaydes	C. Blaydes	Curtis	Blaydes	Razor	33	76	257	80	18-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3922557.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3922557.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3922557.png"}
4026490	2024-05-08 00:52:44.914	2024-05-08 00:52:44.914	Katlyn Cerminara	K. Cerminara	Katlyn	Cerminara	Blonde Fighter	35	69	125	68	18-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4026490.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4026490.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4026490.png"}
4246307	2024-05-08 00:52:44.918	2024-05-08 00:52:44.918	Maycee Barber	M. Barber	Maycee	Barber	The Future	25	65	125	65	14-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4246307.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4246307.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4246307.png"}
2335687	2024-05-08 00:52:45.012	2024-05-08 00:52:45.012	Rafael Dos Anjos	R. Dos Anjos	Rafael	Dos Anjos	\N	39	68	156	70	32-16-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2335687.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2335687.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2335687.png"}
3068125	2024-05-08 00:52:45.017	2024-05-08 00:52:45.017	Mateusz Gamrot	M. Gamrot	Mateusz	Gamrot	Gamer	33	70	156	70	24-2-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3068125.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3068125.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3068125.png"}
3045734	2024-05-08 00:52:45.123	2024-05-08 00:52:45.123	Pedro Munhoz	P. Munhoz	Pedro	Munhoz	The Young Punisher	37	66	135	65	20-9-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3045734.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3045734.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3045734.png"}
4873640	2024-05-08 00:53:03.054	2024-05-08 00:53:03.054	Jailton Almeida	J. Almeida	Jailton	Almeida	Malhadinho	32	75	241	79	20-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4873640.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4873640.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4873640.png"}
4237015	2024-05-08 00:52:45.129	2024-05-08 00:52:45.129	Kyler Phillips	K. Phillips	Kyler	Phillips	The Matrix	28	68	135	72	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4237015.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4237015.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4237015.png"}
2959588	2024-05-08 00:52:45.241	2024-05-08 00:52:45.241	Philipe Lins	P. Lins	Philipe	Lins	Monstro	38	74	206	78	18-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2959588.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2959588.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2959588.png"}
3994033	2024-05-08 00:52:45.247	2024-05-08 00:52:45.247	Ion Cutelaba	I. Cutelaba	Ion	Cutelaba	The Hulk	30	73	205	75	17-10-1	https://a.espncdn.com/i/teamlogos/countries/500/mda.png	\N	{"primary": "#0146AE", "secondary": "#FFD200"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3994033.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3994033.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3994033.png"}
4012999	2024-05-08 00:52:45.401	2024-05-08 00:52:45.401	Michal Oleksiejczuk	M. Oleksiejczuk	Michal	Oleksiejczuk	Hussar	29	72	185	74	19-7-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4012999.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4012999.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4012999.png"}
4276994	2024-05-08 00:52:45.483	2024-05-08 00:52:45.483	Josh Parisian	J. Parisian	Josh	Parisian	\N	34	76	266	79	15-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4276994.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4276994.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4276994.png"}
4294926	2024-05-08 00:52:45.569	2024-05-08 00:52:45.569	Asu Almabayev	A. Almabayev	Asu	Almabayev	Zulfikar	30	64	125	65	19-2-0	https://a.espncdn.com/i/teamlogos/countries/500/kaz.png	\N	{"primary": "#00AFCA", "secondary": "#FEC50D"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4294926.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4294926.png"}
4396359	2024-05-08 00:52:45.574	2024-05-08 00:52:45.574	CJ Vergara	C. Vergara	CJ	Vergara	C.J.	32	66	127	68	12-5-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4396359.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4396359.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4396359.png"}
3028064	2024-05-08 00:52:45.665	2024-05-08 00:52:45.665	Joanne Wood	J. Wood	Joanne	Wood	JoJo	38	66	125	65	17-8-0	https://a.espncdn.com/i/teamlogos/countries/500/sct.png	\N	{"primary": "#0065BD", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3028064.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3028064.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3028064.png"}
3281606	2024-05-08 00:52:45.671	2024-05-08 00:52:45.671	Maryna Moroz	M. Moroz	Maryna	Moroz	Iron Lady	32	67	125	67	11-6-0	https://a.espncdn.com/i/teamlogos/countries/500/ukr.png	\N	{"primary": "#005BBB", "secondary": "#FFD500"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3281606.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3281606.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3281606.png"}
4349719	2024-05-08 00:52:45.768	2024-05-08 00:52:45.768	Stefano Paterno	S. Paterno	Stefano	Paterno	\N	28	71	170	0	14-4-1	https://a.espncdn.com/i/teamlogos/countries/500/ita.png	\N	{"primary": "#CD212A", "secondary": "#008C45"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4349719.png"}
4916607	2024-05-08 00:52:45.774	2024-05-08 00:52:45.774	Scottie Stockman	S. Stockman	Scottie	Stockman	\N	30	69	155	0	3-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4916607.png"}
4893010	2024-05-08 00:52:45.795	2024-05-08 00:52:45.795	Rafael Aronov	R. Aronov	Rafael	Aronov	The Cop	29	73	170	0	0-2-0	https://a.espncdn.com/i/teamlogos/countries/500/isr.png	\N	{"primary": "#0038B8", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4893010.png"}
5099723	2024-05-08 00:52:45.801	2024-05-08 00:52:45.801	Omiel Brown	O. Brown	Omiel	Brown	\N	\N	71	170	0	7-3-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5099723.png"}
4848704	2024-05-08 00:52:45.823	2024-05-08 00:52:45.823	Michele Martignoni	M. Martignoni	Michele	Martignoni	Italian Thunder	28	69	125	0	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/ita.png	\N	{"primary": "#CD212A", "secondary": "#008C45"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4848704.png"}
5207724	2024-05-08 00:52:45.831	2024-05-08 00:52:45.831	Raz Bring	R. Bring	Raz	Bring	New Level	28	66	135	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/isr.png	\N	{"primary": "#0038B8", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5207724.png"}
4371005	2024-05-08 00:52:45.865	2024-05-08 00:52:45.865	Jakub Wikłacz	J. Wikłacz	Jakub	Wikłacz	\N	27	69	135	69	15-3-2	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4371005.png"}
5007637	2024-05-08 00:52:45.87	2024-05-08 00:52:45.87	Zuriko Jojua	Z. Jojua	Zuriko	Jojua	Zura	28	67	135	68	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/geo.png	\N	{"primary": "#FF0000", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5007637.png"}
5189560	2024-05-08 00:53:01.462	2024-05-08 00:53:01.462	Robelis Despaigne	R. Despaigne	Robelis	Despaigne	The Big Boy	35	79	261	84	5-0-0	https://a.espncdn.com/i/teamlogos/countries/500/cub.png	\N	{"primary": "#CF142B", "secondary": "#002A8F"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5189560.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5189560.png"}
4030249	2024-05-08 00:52:45.935	2024-05-08 00:52:45.935	Andy Clamp	A. Clamp	Andy	Clamp	The Vice	\N	0	205	0	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4030249.png"}
5121867	2024-05-08 00:52:45.941	2024-05-08 00:52:45.941	Matthew Byfield	M. Byfield	Matthew	Byfield	Matty	31	78	205	0	2-1-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5121867.png"}
4295251	2024-05-08 00:52:45.97	2024-05-08 00:52:45.97	John de Jesus	J. de Jesus	John	de Jesus	Platano	33	70	145	76	17-12-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4295251.png"}
5146696	2024-05-08 00:52:45.976	2024-05-08 00:52:45.976	Luke Riley	L. Riley	Luke	Riley	\N	24	69	145	0	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5146696.png"}
4709157	2024-05-08 00:52:46.019	2024-05-08 00:52:46.019	Liam Gittins	L. Gittins	Liam	Gittins	Nightmare	\N	66	125	0	13-4-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4709157.png"}
4763836	2024-05-08 00:52:46.026	2024-05-08 00:52:46.026	Roberto Hernandez	R. Hernandez	Roberto	Hernandez	Green Light	30	68	145	0	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4763836.png"}
3093559	2024-05-08 00:52:46.074	2024-05-08 00:52:46.074	Marcin Tybura	M. Tybura	Marcin	Tybura	Tybur	38	75	247	78	25-8-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3093559.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3093559.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3093559.png"}
3722422	2024-05-08 00:52:46.079	2024-05-08 00:52:46.079	Tai Tuivasa	T. Tuivasa	Tai	Tuivasa	Bam Bam	31	74	265	75	15-7-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3722422.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3722422.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3722422.png"}
4815998	2024-05-08 00:52:46.196	2024-05-08 00:52:46.196	Bryan Battle	B. Battle	Bryan	Battle	The Butcher	29	73	170	77	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4815998.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4815998.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4815998.png"}
4875506	2024-05-08 00:52:46.204	2024-05-08 00:52:46.204	Ange Loosa	A. Loosa	Ange	Loosa	The Last Ninja	31	70	171	74	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/drc.png	\N	{}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4875506.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4875506.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4875506.png"}
2500735	2024-05-08 00:52:46.354	2024-05-08 00:52:46.354	Ovince Saint Preux	O. Saint Preux	Ovince	Saint Preux	OSP	41	75	206	80	27-17-0	https://a.espncdn.com/i/teamlogos/countries/500/hai.png	\N	{"primary": "#00209F", "secondary": "#D21034"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2500735.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2500735.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2500735.png"}
4245094	2024-05-08 00:52:46.36	2024-05-08 00:52:46.36	Kennedy Nzechukwu	K. Nzechukwu	Kennedy	Nzechukwu	African Savage	31	77	205	83	12-5-0	https://a.espncdn.com/i/teamlogos/countries/500/ngr.png	\N	{"primary": "#008753", "secondary": "#992F24"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4245094.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4245094.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4245094.png"}
4875511	2024-05-08 00:52:46.462	2024-05-08 00:52:46.462	Christian Rodriguez	C. Rodriguez	Christian	Rodriguez	\N	26	67	145	71	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4875511.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4875511.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4875511.png"}
4918083	2024-05-08 00:52:46.466	2024-05-08 00:52:46.466	Isaac Dulgarian	I. Dulgarian	Isaac	Dulgarian	The Midwest Choppa	27	67	145	71	6-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4918083.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4918083.png"}
3104720	2024-05-08 00:52:46.548	2024-05-08 00:52:46.548	Pannie Kianzad	P. Kianzad	Pannie	Kianzad	Banzai	32	67	136	66	17-8-0	https://a.espncdn.com/i/teamlogos/countries/500/swe.png	\N	{"primary": "#FECC00", "secondary": "#006AA7"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3104720.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3104720.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3104720.png"}
2553261	2024-05-08 00:52:46.633	2024-05-08 00:52:46.633	Gerald Meerschaert	G. Meerschaert	Gerald	Meerschaert	GM3	36	73	185	77	36-17-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2553261.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2553261.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2553261.png"}
3111927	2024-05-08 00:52:46.638	2024-05-08 00:52:46.638	Bryan Barberena	B. Barberena	Bryan	Barberena	Bam Bam	35	72	186	72	18-12-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3111927.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3111927.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3111927.png"}
4339145	2024-05-08 00:52:46.721	2024-05-08 00:52:46.721	Mike Davis	M. Davis	Mike	Davis	Beast Boy	31	72	155	72	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4339145.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4339145.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4339145.png"}
4702563	2024-05-08 00:52:46.725	2024-05-08 00:52:46.725	Natan Levy	N. Levy	Natan	Levy	Lethal	32	69	157	71	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/isr.png	\N	{"primary": "#0038B8", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4702563.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4702563.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4702563.png"}
4319785	2024-05-08 00:52:46.808	2024-05-08 00:52:46.808	Chelsea Chandler	C. Chandler	Chelsea	Chandler	\N	33	68	137	68	6-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4319785.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4319785.png"}
4801267	2024-05-08 00:52:46.813	2024-05-08 00:52:46.813	Josiane Nunes	J. Nunes	Josiane	Nunes	Josi	30	62	135	67	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4801267.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4801267.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4801267.png"}
3896934	2024-05-08 00:52:46.92	2024-05-08 00:52:46.92	Jafel Filho	J. Filho	Jafel	Filho	Pastor	31	67	125	68	16-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3896934.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3896934.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3896934.png"}
4424224	2024-05-08 00:52:46.923	2024-05-08 00:52:46.923	Ode' Osbourne	O. Osbourne	Ode'	Osbourne	The Jamaican Sensation	32	67	125	73	12-7-0	https://a.espncdn.com/i/teamlogos/countries/500/jam.png	\N	{"primary": "#009C3A", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4424224.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4424224.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4424224.png"}
4616087	2024-05-08 00:52:47.009	2024-05-08 00:52:47.009	Josh Culibao	J. Culibao	Josh	Culibao	Kuya	29	70	146	73	11-3-1	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4616087.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4616087.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4616087.png"}
4702589	2024-05-08 00:52:47.014	2024-05-08 00:52:47.014	Danny Silva	D. Silva	Danny	Silva	El Puma	27	71	148	70	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4702589.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4702589.png"}
4565671	2024-05-08 00:52:47.122	2024-05-08 00:52:47.122	Cory McKenna	C. McKenna	Cory	McKenna	Poppins	24	63	115	58	8-3-0	https://a.espncdn.com/i/teamlogos/countries/500/wal.png	\N	{"primary": "#BA0F30", "secondary": "#00AB39"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4565671.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4565671.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4565671.png"}
4901883	2024-05-08 00:52:47.127	2024-05-08 00:52:47.127	Jaqueline Amorim	J. Amorim	Jaqueline	Amorim	\N	28	63	116	67	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4901883.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4901883.png"}
4816283	2024-05-08 00:52:47.251	2024-05-08 00:52:47.251	Mitch Ramirez	M. Ramirez	Mitch	Ramirez	\N	31	71	155	71	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4816283.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4816283.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4816283.png"}
4816062	2024-05-08 00:52:47.392	2024-05-08 00:52:47.392	Chad Anheliger	C. Anheliger	Chad	Anheliger	The Monster	37	66	135	64	13-7-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4816062.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4816062.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4816062.png"}
4878592	2024-05-08 00:52:47.398	2024-05-08 00:52:47.398	Charalampos Grigoriou	C. Grigoriou	Charalampos	Grigoriou	Ferocious	32	67	136	67	8-4-0	https://a.espncdn.com/i/teamlogos/countries/500/cyp.png	\N	{"primary": "#D57701", "secondary": "#48562B"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4878592.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4878592.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4878592.png"}
3112020	2024-05-08 00:52:47.556	2024-05-08 00:52:47.556	Corey Anderson	C. Anderson	Corey	Anderson	Overtime	34	75	205	79	19-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3112020.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3112020.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3112020.png"}
3950364	2024-05-08 00:52:47.564	2024-05-08 00:52:47.564	Karl Moore	K. Moore	Karl	Moore	\N	32	74	205	74	12-3-0	https://a.espncdn.com/i/teamlogos/countries/500/nir.png	\N	{"primary": "#CC0000", "secondary": "#9E7E1C"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3950364.png"}
2532870	2024-05-08 00:52:47.606	2024-05-08 00:52:47.606	Patricio Freire	P. Freire	Patricio	Freire	Pitbull	36	66	145	65	36-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2532870.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2532870.png"}
4034830	2024-05-08 00:52:47.612	2024-05-08 00:52:47.612	Jeremy Kennedy	J. Kennedy	Jeremy	Kennedy	JBC	31	70	145	71	19-4-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4034830.png"}
4255574	2024-05-08 00:52:47.667	2024-05-08 00:52:47.667	Aaron Jeffery	A. Jeffery	Aaron	Jeffery	\N	31	74	185	73	14-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4255574.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4255574.png"}
4341543	2024-05-08 00:52:47.674	2024-05-08 00:52:47.674	Fabian Edwards	F. Edwards	Fabian	Edwards	The Assassin	31	73	185	79	13-3-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4341543.png"}
3109287	2024-05-08 00:52:47.726	2024-05-08 00:52:47.726	Tim Wilde	T. Wilde	Tim	Wilde	The Experiment	36	71	155	74	17-5-1	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3109287.png"}
5085291	2024-05-08 00:52:47.732	2024-05-08 00:52:47.732	Manoel Sousa	M. Sousa	Manoel	Sousa	Manumito	26	69	155	69	11-0-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5085291.png"}
3028866	2024-05-08 00:52:47.776	2024-05-08 00:52:47.776	Leandro Higo	L. Higo	Leandro	Higo	Pitbull	35	68	145	70	23-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3028866.png"}
4024128	2024-05-08 00:52:47.781	2024-05-08 00:52:47.781	James Gallagher	J. Gallagher	James	Gallagher	The Strabanimal	27	68	145	68	12-3-0	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4024128.png"}
4881912	2024-05-08 00:52:47.823	2024-05-08 00:52:47.823	Ciaran Clarke	C. Clarke	Ciaran	Clarke	\N	28	68	135	66	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4881912.png"}
5088781	2024-05-08 00:52:47.828	2024-05-08 00:52:47.828	Darius Mafi	D. Mafi	Darius	Mafi	\N	31	67	135	65	4-2-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5088781.png"}
3049739	2024-05-08 00:52:47.876	2024-05-08 00:52:47.876	Isaiah Pinson	I. Pinson	Isaiah	Pinson	\N	29	75	242	71	3-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3049739.png"}
5080573	2024-05-08 00:52:47.882	2024-05-08 00:52:47.882	Abraham Bably	A. Bably	Abraham	Bably	The One and Only	28	70	257	74	4-0-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5080573.png"}
4703598	2024-05-08 00:52:47.913	2024-05-08 00:52:47.913	Grant Neal	G. Neal	Grant	Neal	The Truth	28	72	205	74	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4703598.png"}
4875324	2024-05-08 00:52:47.919	2024-05-08 00:52:47.919	Luke Trainer	L. Trainer	Luke	Trainer	The Gent	28	78	204	81	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4875324.png"}
5124793	2024-05-08 00:52:47.96	2024-05-08 00:52:47.96	Vikas Singh Ruhil	V. Singh Ruhil	Vikas	Singh Ruhil	\N	31	65	147	71	12-8-0	https://a.espncdn.com/i/teamlogos/countries/500/ind.png	\N	{"primary": "#FF9933", "secondary": "#138808"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5124793.png"}
4820893	2024-05-08 00:52:47.999	2024-05-08 00:52:47.999	Alfie Davis	A. Davis	Alfie	Davis	The Axe Man	32	71	155	70	17-4-1	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4820893.png"}
5137436	2024-05-08 00:52:48.005	2024-05-08 00:52:48.005	Oscar Ownsworth	O. Ownsworth	Oscar	Ownsworth	Ginger Fury	\N	73	155	0	8-3-1	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5137436.png"}
3120446	2024-05-08 00:52:48.054	2024-05-08 00:52:48.054	Geraldo Neto	G. Neto	Geraldo	Neto	Luan Santana	33	72	170	0	18-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3120446.png"}
4896556	2024-05-08 00:52:48.06	2024-05-08 00:52:48.06	Vanilto Antunes	V. Antunes	Vanilto	Antunes	\N	29	0	170	0	16-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4896556.png"}
4969974	2024-05-08 00:52:48.094	2024-05-08 00:52:48.094	Jose Delano	J. Delano	Jose	Delano	Ze	27	68	145	0	14-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4969974.png"}
5014675	2024-05-08 00:52:48.101	2024-05-08 00:52:48.101	Alan Villalba	A. Villalba	Alan	Villalba	El Gaucho	28	69	155	0	0-2-0	https://a.espncdn.com/i/teamlogos/countries/500/arg.png	\N	{"primary": "#74ACDF", "secondary": "#F6B40E"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5014675.png"}
3032973	2024-05-08 00:52:48.159	2024-05-08 00:52:48.159	Rose Namajunas	R. Namajunas	Rose	Namajunas	Thug	31	65	125	65	13-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3032973.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3032973.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3032973.png"}
4221863	2024-05-08 00:52:48.166	2024-05-08 00:52:48.166	Amanda Ribas	A. Ribas	Amanda	Ribas	\N	30	63	125	66	12-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4221863.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4221863.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4221863.png"}
4566145	2024-05-08 00:52:48.378	2024-05-08 00:52:48.378	Justin Tafa	J. Tafa	Justin	Tafa	Bad Man	30	72	265	74	7-4-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4566145.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4566145.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4566145.png"}
4915907	2024-05-08 00:52:48.387	2024-05-08 00:52:48.387	Karl Williams	K. Williams	Karl	Williams	\N	34	75	246	79	10-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4915907.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4915907.png"}
4354318	2024-05-08 00:52:48.464	2024-05-08 00:52:48.464	Edmen Shahbazyan	E. Shahbazyan	Edmen	Shahbazyan	The Golden Boy	26	74	185	75	13-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4354318.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4354318.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4354318.png"}
4374436	2024-05-08 00:52:48.473	2024-05-08 00:52:48.473	AJ Dobson	A. Dobson	AJ	Dobson	\N	32	73	185	76	7-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4374436.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4374436.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4374436.png"}
5077399	2024-05-08 00:52:48.702	2024-05-08 00:52:48.702	Cameron Saaiman	C. Saaiman	Cameron	Saaiman	MSP	23	68	135	67	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/rsa.png	\N	{"primary": "#FFB81C", "secondary": "#007749"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5077399.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5077399.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5077399.png"}
3900088	2024-05-08 00:52:48.918	2024-05-08 00:52:48.918	Billy Quarantillo	B. Quarantillo	Billy	Quarantillo	\N	35	70	145	70	18-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3900088.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3900088.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3900088.png"}
4351319	2024-05-08 00:52:48.927	2024-05-08 00:52:48.927	Youssef Zalal	Y. Zalal	Youssef	Zalal	The Moroccan Devil	27	70	145	72	14-5-1	https://a.espncdn.com/i/teamlogos/countries/500/mar.png	\N	{"primary": "#C1272D", "secondary": "#006233"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4351319.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4351319.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4351319.png"}
4239738	2024-05-08 00:52:49.144	2024-05-08 00:52:49.144	Fernando Padilla	F. Padilla	Fernando	Padilla	El Valiente	27	73	145	76	16-5-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4239738.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4239738.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4239738.png"}
5144312	2024-05-08 00:52:49.153	2024-05-08 00:52:49.153	Luis Pajuelo	L. Pajuelo	Luis	Pajuelo	Corazón de Leon	29	70	145	69	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/per.png	\N	{"primary": "#D91023", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5144312.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5144312.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5144312.png"}
3019246	2024-05-08 00:52:49.347	2024-05-08 00:52:49.347	Kurt Holobaugh	K. Holobaugh	Kurt	Holobaugh	\N	37	71	155	70	21-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3019246.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3019246.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3019246.png"}
4294378	2024-05-08 00:52:49.351	2024-05-08 00:52:49.351	Trey Ogden	T. Ogden	Trey	Ogden	Shamurai	34	71	155	72	17-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4294378.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4294378.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4294378.png"}
3571515	2024-05-08 00:52:49.433	2024-05-08 00:52:49.433	Ricardo Ramos	R. Ramos	Ricardo	Ramos	\N	28	69	146	72	16-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3571515.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3571515.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3571515.png"}
3955577	2024-05-08 00:52:49.44	2024-05-08 00:52:49.44	Julian Erosa	J. Erosa	Julian	Erosa	Juicy J	34	73	145	74	29-12-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3955577.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3955577.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3955577.png"}
2591306	2024-05-08 00:52:49.524	2024-05-08 00:52:49.524	Cody Gibson	C. Gibson	Cody	Gibson	The Renegade	36	70	135	71	20-10-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2591306.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2591306.png"}
4010864	2024-05-08 00:52:49.533	2024-05-08 00:52:49.533	Miles Johns	M. Johns	Miles	Johns	Chapo	30	67	136	66	14-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4010864.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4010864.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4010864.png"}
4426305	2024-05-08 00:52:49.626	2024-05-08 00:52:49.626	Steven Nguyen	S. Nguyen	Steven	Nguyen	The Ninja	30	71	145	73	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4426305.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4426305.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4426305.png"}
5093447	2024-05-08 00:52:49.633	2024-05-08 00:52:49.633	Jarno Errens	J. Errens	Jarno	Errens	\N	29	71	145	73	14-5-1	https://a.espncdn.com/i/teamlogos/countries/500/ned.png	\N	{"primary": "#AE1C28", "secondary": "#21468B"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5093447.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5093447.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5093447.png"}
4894780	2024-05-08 00:52:49.733	2024-05-08 00:52:49.733	Daria Zhelezniakova	D. Zhelezniakova	Daria	Zhelezniakova	Iron Lady	28	69	135	68	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4894780.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4894780.png"}
5093484	2024-05-08 00:52:49.737	2024-05-08 00:52:49.737	Montserrat Rendon	M. Rendon	Montserrat	Rendon	Monster	35	68	135	68	6-1-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5093484.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5093484.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5093484.png"}
5145496	2024-05-08 00:52:49.781	2024-05-08 00:52:49.781	Igor Severino	I. Severino	Igor	Severino	\N	21	67	125	69	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5145496.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5145496.png"}
2312150	2024-05-08 00:52:49.897	2024-05-08 00:52:49.897	Mohammed Usman	M. Usman	Mohammed	Usman	The Motor	35	74	237	79	11-3-0	https://a.espncdn.com/i/teamlogos/countries/500/ngr.png	\N	{"primary": "#008753", "secondary": "#992F24"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2312150.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2312150.png"}
5060505	2024-05-08 00:52:49.903	2024-05-08 00:52:49.903	Mick Parkin	M. Parkin	Mick	Parkin	\N	28	76	262	79	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5060505.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5060505.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5060505.png"}
2558487	2024-05-08 00:52:50.031	2024-05-08 00:52:50.031	Tony Johnson Jr.	T. Johnson Jr.	Tony	Johnson Jr.	Hulk	38	73	265	74	13-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2558487.png"}
4257695	2024-05-08 00:52:50.036	2024-05-08 00:52:50.036	Carlos Felipe	C. Felipe	Carlos	Felipe	Boi	29	72	259	75	12-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4257695.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4257695.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4257695.png"}
4424478	2024-05-08 00:52:50.062	2024-05-08 00:52:50.062	Lance Lawrence	L. Lawrence	Lance	Lawrence	The Tornado	30	72	145	74	8-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4424478.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4424478.png"}
5172392	2024-05-08 00:52:50.067	2024-05-08 00:52:50.067	Landry Ward	L. Ward	Landry	Ward	The Lone Star Kid	27	72	145	0	8-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5172392.png"}
5092208	2024-05-08 00:52:50.094	2024-05-08 00:52:50.094	Richie Miranda	R. Miranda	Richie	Miranda	El Machete	\N	69	155	74	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5092208.png"}
5129084	2024-05-08 00:52:50.099	2024-05-08 00:52:50.099	Kegan Agnew	K. Agnew	Kegan	Agnew	The Violent Hippie	28	72	155	0	0-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5129084.png"}
4375231	2024-05-08 00:52:50.125	2024-05-08 00:52:50.125	Simone D'Anna	S. D'Anna	Simone	D'Anna	The Tiger	28	69	145	0	1-4-0	https://a.espncdn.com/i/teamlogos/countries/500/ita.png	\N	{"primary": "#CD212A", "secondary": "#008C45"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4375231.png"}
4712353	2024-05-08 00:52:50.132	2024-05-08 00:52:50.132	Jordan Vucenic	J. Vucenic	Jordan	Vucenic	The Epidemic	28	69	145	72	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4712353.png"}
5147737	2024-05-08 00:52:50.159	2024-05-08 00:52:50.159	Lone'er Kavanagh	L. Kavanagh	Lone'er	Kavanagh	\N	24	64	125	0	6-0-0	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5147737.png"}
5147739	2024-05-08 00:52:50.165	2024-05-08 00:52:50.165	Shawn Da Silva	S. Da Silva	Shawn	Da Silva	\N	28	67	125	0	6-1-0	https://a.espncdn.com/i/teamlogos/countries/500/ger.png	\N	{"primary": "#000000", "secondary": "#FF0000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5147739.png"}
4584163	2024-05-08 00:52:50.201	2024-05-08 00:52:50.201	Leon Aliu	L. Aliu	Leon	Aliu	The Albanian Lion	34	72	186	74	11-4-0	https://a.espncdn.com/i/teamlogos/countries/500/alb.png	\N	{"primary": "#CE1126", "secondary": "#002B7F"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4584163.png"}
4848673	2024-05-08 00:52:50.207	2024-05-08 00:52:50.207	Will Currie	W. Currie	Will	Currie	Drago	25	75	185	0	12-3-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4848673.png"}
2499867	2024-05-08 00:52:50.238	2024-05-08 00:52:50.238	Carlos Pereira	C. Pereira	Carlos	Pereira	Indio	45	72	185	73	4-6-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2499867.png"}
4064854	2024-05-08 00:52:50.244	2024-05-08 00:52:50.244	Darren Stewart	D. Stewart	Darren	Stewart	The Dentist	33	72	185	74	16-10-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4064854.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4064854.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4064854.png"}
4350796	2024-05-08 00:52:50.304	2024-05-08 00:52:50.304	Erin Blanchfield	E. Blanchfield	Erin	Blanchfield	Cold Blooded	25	64	125	66	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4350796.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4350796.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4350796.png"}
4608674	2024-05-08 00:52:50.312	2024-05-08 00:52:50.312	Manon Fiorot	M. Fiorot	Manon	Fiorot	The Beast	34	67	125	65	12-1-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4608674.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4608674.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4608674.png"}
3045887	2024-05-08 00:52:50.479	2024-05-08 00:52:50.479	Vicente Luque	V. Luque	Vicente	Luque	The Silent Assassin	32	71	170	75	22-10-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3045887.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3045887.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3045887.png"}
2553993	2024-05-08 00:52:50.649	2024-05-08 00:52:50.649	Chris Weidman	C. Weidman	Chris	Weidman	The All-American	39	74	186	78	16-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2553993.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2553993.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2553993.png"}
4333158	2024-05-08 00:52:50.656	2024-05-08 00:52:50.656	Bruno Silva	B. Silva	Bruno	Silva	Blindado	34	72	186	74	23-11-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4333158.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4333158.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4333158.png"}
5060467	2024-05-08 00:52:50.807	2024-05-08 00:52:50.807	Sedriques Dumas	S. Dumas	Sedriques	Dumas	The Reaper	28	74	185	79	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5060467.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5060467.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5060467.png"}
4076472	2024-05-08 00:52:50.962	2024-05-08 00:52:50.962	Bill Algeo	B. Algeo	Bill	Algeo	Señor Perfecto	34	72	146	73	18-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4076472.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4076472.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4076472.png"}
4408436	2024-05-08 00:52:50.971	2024-05-08 00:52:50.971	Kyle Nelson	K. Nelson	Kyle	Nelson	The Monster	33	71	145	71	16-5-1	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4408436.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4408436.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4408436.png"}
2959422	2024-05-08 00:52:51.119	2024-05-08 00:52:51.119	Chidi Njokuani	C. Njokuani	Chidi	Njokuani	Bang Bang	35	75	170	80	23-10-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2959422.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2959422.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2959422.png"}
4078243	2024-05-08 00:52:51.127	2024-05-08 00:52:51.127	Rhys McKee	R. McKee	Rhys	McKee	Skeletor	28	74	170	78	13-6-1	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4078243.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4078243.png"}
3821549	2024-05-08 00:52:51.278	2024-05-08 00:52:51.278	Nate Landwehr	N. Landwehr	Nate	Landwehr	The Train	35	69	145	72	18-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3821549.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3821549.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3821549.png"}
3915502	2024-05-08 00:52:51.283	2024-05-08 00:52:51.283	Jamall Emmers	J. Emmers	Jamall	Emmers	Pretty Boy	34	70	145	74	20-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3915502.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3915502.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3915502.png"}
4289516	2024-05-08 00:52:51.422	2024-05-08 00:52:51.422	Virna Jandiroba	V. Jandiroba	Virna	Jandiroba	Carcara	35	63	115	64	20-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4289516.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4289516.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4289516.png"}
4700617	2024-05-08 00:52:51.428	2024-05-08 00:52:51.428	Loopy Godínez	L. Godínez	Loopy	Godínez	\N	30	62	115	61	12-4-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4700617.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4700617.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4700617.png"}
3089633	2024-05-08 00:52:51.522	2024-05-08 00:52:51.522	Herbert Burns	H. Burns	Herbert	Burns	The Blaze	36	69	145	73	11-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3089633.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3089633.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3089633.png"}
4227122	2024-05-08 00:52:51.527	2024-05-08 00:52:51.527	Julio Arce	J. Arce	Julio	Arce	\N	34	67	147	70	19-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4227122.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4227122.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4227122.png"}
4686735	2024-05-08 00:52:51.611	2024-05-08 00:52:51.611	Dennis Buzukja	D. Buzukja	Dennis	Buzukja	The Great	26	69	145	70	12-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4686735.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4686735.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4686735.png"}
5044438	2024-05-08 00:52:51.615	2024-05-08 00:52:51.615	Connor Matthews	C. Matthews	Connor	Matthews	The Controller	31	68	145	71	7-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5044438.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5044438.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5044438.png"}
4684240	2024-05-08 00:52:51.691	2024-05-08 00:52:51.691	Ibo Aslan	I. Aslan	Ibo	Aslan	The Last Ottoman	28	75	205	77	13-1-0	https://a.espncdn.com/i/teamlogos/countries/500/tur.png	\N	{"primary": "#E30A17", "secondary": "#73DCD0"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4684240.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4684240.png"}
4875513	2024-05-08 00:52:51.696	2024-05-08 00:52:51.696	Anton Turkalj	A. Turkalj	Anton	Turkalj	The Pleasure Man	27	76	205	78	8-4-0	https://a.espncdn.com/i/teamlogos/countries/500/swe.png	\N	{"primary": "#FECC00", "secondary": "#006AA7"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4875513.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4875513.png"}
4687434	2024-05-08 00:52:51.776	2024-05-08 00:52:51.776	Jacob Malkoun	J. Malkoun	Jacob	Malkoun	Mamba	28	69	185	73	8-3-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4687434.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4687434.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4687434.png"}
4697476	2024-05-08 00:52:51.781	2024-05-08 00:52:51.781	Andre Petroski	A. Petroski	Andre	Petroski	\N	32	72	186	73	10-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4697476.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4697476.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4697476.png"}
4893608	2024-05-08 00:52:51.868	2024-05-08 00:52:51.868	Angel Pacheco	A. Pacheco	Angel	Pacheco	\N	32	68	135	70	7-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4893608.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4893608.png"}
5077789	2024-05-08 00:52:51.873	2024-05-08 00:52:51.873	Caolán Loughran	C. Loughran	Caolán	Loughran	The Don	27	66	135	68	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5077789.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5077789.png"}
4065050	2024-05-08 00:52:51.968	2024-05-08 00:52:51.968	Akira Okada	A. Okada	Akira	Okada	\N	37	66	155	0	0-5-1	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4065050.png"}
5210074	2024-05-08 00:52:51.973	2024-05-08 00:52:51.973	Tatsuya Saika	T. Saika	Tatsuya	Saika	Yanbo	33	71	155	0	11-4-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5210074.png"}
3041315	2024-05-08 00:52:51.997	2024-05-08 00:52:51.997	Ante Delija	A. Delija	Ante	Delija	Walking Trouble	33	77	242	79	24-6-0	https://a.espncdn.com/i/teamlogos/countries/500/cro.png	\N	{"primary": "#FF0000", "secondary": "#171796"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3041315.png"}
5210640	2024-05-08 00:52:52.576	2024-05-08 00:52:52.576	Eimar Hernandez	E. Hernandez	Eimar	Hernandez	\N	27	65	125	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5210640.png"}
3024604	2024-05-08 00:53:04.191	2024-05-08 00:53:04.191	Denis Goltsov	D. Goltsov	Denis	Goltsov	\N	33	77	244	78	33-8-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3024604.png"}
4273352	2024-05-08 00:52:52.169	2024-05-08 00:52:52.169	Marcelo Golm	M. Golm	Marcelo	Golm	\N	31	75	260	75	10-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4273352.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4273352.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4273352.png"}
2556638	2024-05-08 00:52:52.208	2024-05-08 00:52:52.208	Blagoy Ivanov	B. Ivanov	Blagoy	Ivanov	Baga	37	71	259	73	19-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bul.png	\N	{"primary": "#009B75", "secondary": "#D01C1F"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2556638.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2556638.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2556638.png"}
4043438	2024-05-08 00:52:52.316	2024-05-08 00:52:52.316	Steve Mowry	S. Mowry	Steve	Mowry	Tall	31	80	254	79	10-2-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4043438.png"}
4033449	2024-05-08 00:52:52.469	2024-05-08 00:52:52.469	Dimitre Ivy	D. Ivy	Dimitre	Ivy	Poison	34	69	145	71	13-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4033449.png"}
4795284	2024-05-08 00:52:52.474	2024-05-08 00:52:52.474	Lucas Brennan	L. Brennan	Lucas	Brennan	Skywalker	23	70	145	71	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4795284.png"}
4701284	2024-05-08 00:52:52.517	2024-05-08 00:52:52.517	Ty Johnson	T. Johnson	Ty	Johnson	La Pollona	27	67	135	67	13-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4701284.png"}
5127795	2024-05-08 00:52:52.527	2024-05-08 00:52:52.527	Bryce Meredith	B. Meredith	Bryce	Meredith	Misfit	29	69	135	68	6-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5127795.png"}
4836889	2024-05-08 00:52:52.571	2024-05-08 00:52:52.571	Igor Siqueira	I. Siqueira	Igor	Siqueira	The Golden Boy	30	66	125	0	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4836889.png"}
4215221	2024-05-08 00:53:04.113	2024-05-08 00:53:04.113	Daniel James	D. James	Daniel	James	The American Predator	42	77	263	82	15-7-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4215221.png"}
2554674	2024-05-08 00:53:04.143	2024-05-08 00:53:04.143	Liz Carmouche	L. Carmouche	Liz	Carmouche	Girl-Rilla	40	66	125	66	21-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2554674.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2554674.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2554674.png"}
4609439	2024-05-08 00:53:04.147	2024-05-08 00:53:04.147	Kana Watanabe	K. Watanabe	Kana	Watanabe	\N	35	66	125	66	13-2-1	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4609439.png"}
4293151	2024-05-08 00:53:04.195	2024-05-08 00:53:04.195	Sergei Bilostenniy	S. Bilostenniy	Sergei	Bilostenniy	\N	28	73	246	75	12-3-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4293151.png"}
3170347	2024-05-08 00:53:04.23	2024-05-08 00:53:04.23	Taila Santos	T. Santos	Taila	Santos	\N	30	66	124	68	20-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3170347.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3170347.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3170347.png"}
5110272	2024-05-08 00:53:04.234	2024-05-08 00:53:04.234	Jena Bishop	J. Bishop	Jena	Bishop	\N	38	64	125	66	7-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5110272.png"}
4336342	2024-05-08 00:53:04.268	2024-05-08 00:53:04.268	Oleg Popov	O. Popov	Oleg	Popov	\N	32	74	248	75	17-1-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4336342.png"}
4065617	2024-05-08 00:53:04.297	2024-05-08 00:53:04.297	Shanna Young	S. Young	Shanna	Young	The Shanimal	33	67	126	65	9-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4065617.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4065617.png"}
4070802	2024-05-08 00:53:04.301	2024-05-08 00:53:04.301	Ilara Joanne	I. Joanne	Ilara	Joanne	\N	29	63	125	64	11-9-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4070802.png"}
4257422	2024-05-08 00:53:04.369	2024-05-08 00:53:04.369	Juliana Velasquez	J. Velasquez	Juliana	Velasquez	\N	37	66	125	67	12-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4257422.png"}
4684171	2024-05-08 00:53:04.373	2024-05-08 00:53:04.373	Lisa Mauldin	L. Mauldin	Lisa	Mauldin	\N	34	67	125	66	6-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4684171.png"}
5138563	2024-05-08 00:52:52.602	2024-05-08 00:52:52.602	Quang Le	Q. Le	Quang	Le	Bang	32	66	135	70	8-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5138563.png"}
5210641	2024-05-08 00:52:52.608	2024-05-08 00:52:52.608	Tial Thang	T. Thang	Tial	Thang	The Dragon Leg	30	69	135	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/mya.png	\N	{"primary": "#EA2839", "secondary": "#34B233"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5210641.png"}
4701012	2024-05-08 00:52:52.649	2024-05-08 00:52:52.649	Shaheen Santana	S. Santana	Shaheen	Santana	Shazam	32	73	145	75	7-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4701012.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4701012.png"}
5210642	2024-05-08 00:52:52.656	2024-05-08 00:52:52.656	Isaac Thomson	I. Thomson	Isaac	Thomson	\N	22	71	145	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5210642.png"}
4013570	2024-05-08 00:52:52.695	2024-05-08 00:52:52.695	Valeriu Mircea	V. Mircea	Valeriu	Mircea	The Solitary Wolf	30	69	145	72	29-9-1	https://a.espncdn.com/i/teamlogos/countries/500/mda.png	\N	{"primary": "#0146AE", "secondary": "#FFD200"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4013570.png"}
4312859	2024-05-08 00:52:52.702	2024-05-08 00:52:52.702	Salahdine Parnasse	S. Parnasse	Salahdine	Parnasse	\N	26	68	145	69	20-2-1	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4312859.png"}
4695351	2024-05-08 00:52:52.734	2024-05-08 00:52:52.734	Madars Fleminas	M. Fleminas	Madars	Fleminas	Latvian Express	36	74	170	75	13-5-0	https://a.espncdn.com/i/teamlogos/countries/500/lat.png	\N	{"primary": "#9E1B34", "secondary": "#77353D"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4695351.png"}
4895371	2024-05-08 00:52:52.741	2024-05-08 00:52:52.741	Artur Szczepaniak	A. Szczepaniak	Artur	Szczepaniak	\N	27	71	170	73	9-3-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4895371.png"}
3132497	2024-05-08 00:52:52.772	2024-05-08 00:52:52.772	Prince Aounallah	P. Aounallah	Prince	Aounallah	His Majesty	\N	74	240	77	2-4-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3132497.png"}
4426144	2024-05-08 00:52:52.779	2024-05-08 00:52:52.779	Michal Martinek	M. Martinek	Michal	Martinek	Blackbeard	34	74	220	78	11-5-0	https://a.espncdn.com/i/teamlogos/countries/500/cze.png	\N	{"primary": "#D71619", "secondary": "#10457E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4426144.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4426144.png"}
4379868	2024-05-08 00:52:52.812	2024-05-08 00:52:52.812	James Sheehan	J. Sheehan	James	Sheehan	Jimbo Slice	\N	74	170	0	7-3-0	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4379868.png"}
5202423	2024-05-08 00:52:52.82	2024-05-08 00:52:52.82	Daniel Konrad	D. Konrad	Daniel	Konrad	Swiss Army Knife	28	72	170	0	1-1-0	https://a.espncdn.com/i/teamlogos/countries/500/sui.png	\N	{"primary": "#D52B1E", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5202423.png"}
3956788	2024-05-08 00:52:52.864	2024-05-08 00:52:52.864	Fabiano Silva	F. Silva	Fabiano	Silva	Jacarezinho	36	65	145	67	0-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3956788.png"}
4024129	2024-05-08 00:52:52.908	2024-05-08 00:52:52.908	Decky McAleenan	D. McAleenan	Decky	McAleenan	Decky	32	73	145	0	9-5-1	https://a.espncdn.com/i/teamlogos/countries/500/nir.png	\N	{"primary": "#CC0000", "secondary": "#9E7E1C"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4024129.png"}
5209332	2024-05-08 00:52:52.914	2024-05-08 00:52:52.914	Ville Mankinen	V. Mankinen	Ville	Mankinen	\N	\N	70	145	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/fin.png	\N	{"primary": "#002F6C", "secondary": "#C8102D"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5209332.png"}
2984770	2024-05-08 00:52:52.969	2024-05-08 00:52:52.969	Chris Curtis	C. Curtis	Chris	Curtis	Action-Man	36	70	186	75	31-11-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2984770.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2984770.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2984770.png"}
4025699	2024-05-08 00:52:52.975	2024-05-08 00:52:52.975	Brendan Allen	B. Allen	Brendan	Allen	All In	28	74	186	75	24-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4025699.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4025699.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4025699.png"}
3099187	2024-05-08 00:52:53.179	2024-05-08 00:52:53.179	Damon Jackson	D. Jackson	Damon	Jackson	The Leech	35	71	146	71	23-6-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3099187.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3099187.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3099187.png"}
4018757	2024-05-08 00:52:53.186	2024-05-08 00:52:53.186	Alexander Hernandez	A. Hernandez	Alexander	Hernandez	The Great Ape	31	69	147	72	14-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4018757.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4018757.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4018757.png"}
4040926	2024-05-08 00:52:53.379	2024-05-08 00:52:53.379	Chepe Mariscal	C. Mariscal	Chepe	Mariscal	Machine Gun	31	67	145	69	16-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4040926.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4040926.png"}
4324622	2024-05-08 00:52:53.387	2024-05-08 00:52:53.387	Morgan Charrière	M. Charrière	Morgan	Charrière	The Last Pirate	28	68	145	69	19-10-1	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4324622.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4324622.png"}
3089069	2024-05-08 00:52:53.615	2024-05-08 00:52:53.615	Christos Giagos	C. Giagos	Christos	Giagos	The Spartan	34	70	156	71	20-12-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3089069.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3089069.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3089069.png"}
4038116	2024-05-08 00:52:53.624	2024-05-08 00:52:53.624	Ignacio Bahamondes	I. Bahamondes	Ignacio	Bahamondes	La Jaula	26	75	156	75	15-5-0	https://a.espncdn.com/i/teamlogos/countries/500/chi.png	\N	{"primary": "#D52B1E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4038116.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4038116.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4038116.png"}
4786358	2024-05-08 00:52:53.885	2024-05-08 00:52:53.885	Charlie Campbell	C. Campbell	Charlie	Campbell	The Cannibal	28	72	155	72	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4786358.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4786358.png"}
5048900	2024-05-08 00:52:53.892	2024-05-08 00:52:53.892	Trevor Peek	T. Peek	Trevor	Peek	\N	29	69	155	70	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5048900.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5048900.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5048900.png"}
2504639	2024-05-08 00:52:54.098	2024-05-08 00:52:54.098	Court McGee	C. McGee	Court	McGee	The Crusher	39	71	170	75	22-13-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2504639.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2504639.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2504639.png"}
4710386	2024-05-08 00:52:54.258	2024-05-08 00:52:54.258	Lukasz Brzeski	L. Brzeski	Lukasz	Brzeski	The Bull	31	76	236	78	9-4-1	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4710386.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4710386.png"}
5147389	2024-05-08 00:52:54.264	2024-05-08 00:52:54.264	Valter Walker	V. Walker	Valter	Walker	The Clean Monster	26	78	264	78	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5147389.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5147389.png"}
2552777	2024-05-08 00:52:54.423	2024-05-08 00:52:54.423	Germaine de Randamie	G. de Randamie	Germaine	de Randamie	The Iron Lady	40	69	135	71	10-5-0	https://a.espncdn.com/i/teamlogos/countries/500/ned.png	\N	{"primary": "#AE1C28", "secondary": "#21468B"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2552777.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2552777.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2552777.png"}
4418784	2024-05-08 00:52:54.429	2024-05-08 00:52:54.429	Norma Dumont	N. Dumont	Norma	Dumont	The Immortal	33	67	136	67	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4418784.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4418784.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4418784.png"}
3936279	2024-05-08 00:52:54.568	2024-05-08 00:52:54.568	Pedro Falcão	P. Falcão	Pedro	Falcão	Pedrinho	31	66	136	66	16-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3936279.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3936279.png"}
4293183	2024-05-08 00:52:54.572	2024-05-08 00:52:54.572	Victor Hugo	V. Hugo	Victor	Hugo	Striker	31	67	135	71	25-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4293183.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4293183.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4293183.png"}
4815973	2024-05-08 00:52:54.661	2024-05-08 00:52:54.661	Dan Argueta	D. Argueta	Dan	Argueta	The Determined	30	67	136	68	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4815973.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4815973.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4815973.png"}
5149439	2024-05-08 00:52:54.664	2024-05-08 00:52:54.664	Jean Matsumoto	J. Matsumoto	Jean	Matsumoto	\N	24	66	136	68	15-0-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5149439.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5149439.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5149439.png"}
5032015	2024-05-08 00:52:54.752	2024-05-08 00:52:54.752	Dylan Budka	D. Budka	Dylan	Budka	The Mindless Hulk	24	72	185	75	7-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5032015.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5032015.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5032015.png"}
3250008	2024-05-08 00:53:04.644	2024-05-08 00:53:04.644	Adam Piccolotti	A. Piccolotti	Adam	Piccolotti	The Bomb	35	71	155	71	14-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3250008.png"}
4916974	2024-05-08 00:52:54.848	2024-05-08 00:52:54.848	Nora Cornolle	N. Cornolle	Nora	Cornolle	\N	34	67	138	67	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4916974.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4916974.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4916974.png"}
5127984	2024-05-08 00:52:54.852	2024-05-08 00:52:54.852	Melissa Mullins	M. Mullins	Melissa	Mullins	No Mess	32	67	138	68	6-1-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5127984.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5127984.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5127984.png"}
4251918	2024-05-08 00:53:04.465	2024-05-08 00:53:04.465	Mads Burnell	M. Burnell	Mads	Burnell	\N	30	68	156	68	18-6-0	https://a.espncdn.com/i/teamlogos/countries/500/den.png	\N	{"primary": "#C60C30", "secondary": "#0081d6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4251918.png"}
4573208	2024-05-08 00:53:04.479	2024-05-08 00:53:04.479	Impa Kasanganay	I. Kasanganay	Impa	Kasanganay	Tshilobo	30	72	205	73	16-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4573208.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4573208.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4573208.png"}
2553999	2024-05-08 00:53:04.504	2024-05-08 00:53:04.504	Patricky Freire	P. Freire	Patricky	Freire	Pitbull	37	67	155	71	25-13-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2553999.png"}
4917144	2024-05-08 00:53:04.507	2024-05-08 00:53:04.507	Bruno Miranda	B. Miranda	Bruno	Miranda	Robusto	33	68	155	67	16-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4917144.png"}
4249028	2024-05-08 00:53:04.522	2024-05-08 00:53:04.522	Robert Wilkinson	R. Wilkinson	Robert	Wilkinson	Razor	32	75	206	80	18-2-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4249028.png"}
4821018	2024-05-08 00:53:04.525	2024-05-08 00:53:04.525	Joshua Silveira	J. Silveira	Joshua	Silveira	\N	31	73	205	75	13-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4821018.png"}
4018603	2024-05-08 00:53:04.541	2024-05-08 00:53:04.541	Dovletdzhan Yagshimuradov	D. Yagshimuradov	Dovletdzhan	Yagshimuradov	Wolfhound	34	71	205	72	22-7-1	https://a.espncdn.com/i/teamlogos/countries/500/tkm.png	\N	{"primary": "#01843D", "secondary": "#CD6930"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4018603.png"}
4689220	2024-05-08 00:53:04.544	2024-05-08 00:53:04.544	Simon Biyong	S. Biyong	Simon	Biyong	Hemlé	33	78	205	74	9-4-0	https://a.espncdn.com/i/teamlogos/countries/500/cmr.png	\N	{"primary": "#027A5E", "secondary": "#FCD116"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4689220.png"}
3108772	2024-05-08 00:53:04.56	2024-05-08 00:53:04.56	Antonio Carlos Jr.	A. Carlos Jr.	Antonio	Carlos Jr.	Shoeface	34	74	205	79	17-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3108772.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3108772.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3108772.png"}
4610008	2024-05-08 00:53:04.563	2024-05-08 00:53:04.563	Alex Polizzi	A. Polizzi	Alex	Polizzi	Eazy	32	72	204	72	10-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4610008.png"}
3902688	2024-05-08 00:53:04.583	2024-05-08 00:53:04.583	Brent Primus	B. Primus	Brent	Primus	\N	39	70	156	73	13-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3902688.png"}
4878384	2024-05-08 00:53:04.588	2024-05-08 00:53:04.588	Solomon Renfro	S. Renfro	Solomon	Renfro	The Black Dragon	27	69	155	72	11-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4878384.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4878384.png"}
3140871	2024-05-08 00:53:04.604	2024-05-08 00:53:04.604	Tom Breese	T. Breese	Tom	Breese	\N	32	75	205	74	18-5-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3140871.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3140871.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3140871.png"}
4231144	2024-05-08 00:53:04.607	2024-05-08 00:53:04.607	Sadibou Sy	S. Sy	Sadibou	Sy	The Swedish Denzel	37	75	205	80	16-8-2	https://a.espncdn.com/i/teamlogos/countries/500/swe.png	\N	{"primary": "#FECC00", "secondary": "#006AA7"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4231144.png"}
4423241	2024-05-08 00:53:04.622	2024-05-08 00:53:04.622	Gadzhi Rabadanov	G. Rabadanov	Gadzhi	Rabadanov	\N	31	68	156	71	21-4-2	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4423241.png"}
4408081	2024-05-08 00:53:04.647	2024-05-08 00:53:04.647	Michael Dufort	M. Dufort	Michael	Dufort	The Machine	30	68	156	72	13-4-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4408081.png"}
3040120	2024-05-08 00:52:55.368	2024-05-08 00:52:55.368	Jordan Heiderman	J. Heiderman	Jordan	Heiderman	Thor	32	75	264	78	7-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3040120.png"}
4705658	2024-05-08 00:52:55.432	2024-05-08 00:52:55.432	Alex Pereira	A. Pereira	Alex	Pereira	Poatan	36	76	205	79	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4705658.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4705658.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4705658.png"}
4275487	2024-05-08 00:52:55.587	2024-05-08 00:52:55.587	Yan Xiaonan	Y. Xiaonan	Yan	Xiaonan	Nine	34	65	115	63	18-4-0	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4275487.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4275487.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4275487.png"}
4350762	2024-05-08 00:52:55.598	2024-05-08 00:52:55.598	Zhang Weili	Z. Weili	Zhang	Weili	Magnum	34	64	115	63	25-3-0	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4350762.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4350762.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4350762.png"}
2614933	2024-05-08 00:52:55.73	2024-05-08 00:52:55.73	Max Holloway	M. Holloway	Max	Holloway	Blessed	32	71	156	69	26-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2614933.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2614933.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2614933.png"}
3022345	2024-05-08 00:52:55.735	2024-05-08 00:52:55.735	Justin Gaethje	J. Gaethje	Justin	Gaethje	The Highlight	35	71	156	70	25-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3022345.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3022345.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3022345.png"}
2504169	2024-05-08 00:52:55.826	2024-05-08 00:52:55.826	Charles Oliveira	C. Oliveira	Charles	Oliveira	Do Bronxs	34	70	156	74	34-10-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2504169.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2504169.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2504169.png"}
4419372	2024-05-08 00:52:55.831	2024-05-08 00:52:55.831	Arman Tsarukyan	A. Tsarukyan	Arman	Tsarukyan	Ahalkalakets	27	67	156	72	22-3-0	https://a.espncdn.com/i/teamlogos/countries/500/arm.png	\N	{"primary": "#D90012", "secondary": "#F2A800"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4419372.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4419372.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4419372.png"}
4684474	2024-05-08 00:52:55.92	2024-05-08 00:52:55.92	Cody Brundage	C. Brundage	Cody	Brundage	\N	29	72	186	72	10-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4684474.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4684474.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4684474.png"}
5061870	2024-05-08 00:52:55.925	2024-05-08 00:52:55.925	Bo Nickal	B. Nickal	Bo	Nickal	\N	28	73	186	76	6-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5061870.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5061870.png"}
3156612	2024-05-08 00:52:56.028	2024-05-08 00:52:56.028	Jiří Procházka	J. Procházka	Jiří	Procházka	BJP	31	75	206	80	30-4-1	https://a.espncdn.com/i/teamlogos/countries/500/cze.png	\N	{"primary": "#D71619", "secondary": "#10457E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3156612.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3156612.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3156612.png"}
4079314	2024-05-08 00:52:56.033	2024-05-08 00:52:56.033	Aleksandar Rakic	A. Rakic	Aleksandar	Rakic	\N	32	76	206	78	14-4-0	https://a.espncdn.com/i/teamlogos/countries/500/ser.png	\N	{"primary": "#A12D2E", "secondary": "#0C4076"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4079314.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4079314.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4079314.png"}
3031559	2024-05-08 00:52:56.132	2024-05-08 00:52:56.132	Aljamain Sterling	A. Sterling	Aljamain	Sterling	Funk Master	34	67	146	71	24-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3031559.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3031559.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3031559.png"}
3164030	2024-05-08 00:52:56.137	2024-05-08 00:52:56.137	Calvin Kattar	C. Kattar	Calvin	Kattar	The Boston Finisher	36	71	145	72	23-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3164030.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3164030.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3164030.png"}
4875864	2024-05-08 00:53:04.626	2024-05-08 00:53:04.626	Elvin Espinoza	E. Espinoza	Elvin	Espinoza	The Prodigy	31	69	155	74	10-0-0	https://a.espncdn.com/i/teamlogos/countries/500/nca.png	\N	{"primary": "#0267C5", "secondary": "#CBDB3F"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4875864.png"}
3028404	2024-05-08 00:52:56.244	2024-05-08 00:52:56.244	Holly Holm	H. Holm	Holly	Holm	The Preacher's Daughter	42	68	136	69	15-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3028404.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3028404.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3028404.png"}
4332765	2024-05-08 00:52:56.251	2024-05-08 00:52:56.251	Kayla Harrison	K. Harrison	Kayla	Harrison	\N	33	68	136	66	17-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4332765.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4332765.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4332765.png"}
4289274	2024-05-08 00:52:56.38	2024-05-08 00:52:56.38	Sodiq Yusuff	S. Yusuff	Sodiq	Yusuff	Super	30	69	146	71	13-4-0	https://a.espncdn.com/i/teamlogos/countries/500/ngr.png	\N	{"primary": "#008753", "secondary": "#992F24"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4289274.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4289274.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4289274.png"}
4881999	2024-05-08 00:52:56.386	2024-05-08 00:52:56.386	Diego Lopes	D. Lopes	Diego	Lopes	\N	29	71	146	72	24-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4881999.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4881999.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4881999.png"}
4339490	2024-05-08 00:52:56.496	2024-05-08 00:52:56.496	Jalin Turner	J. Turner	Jalin	Turner	The Tarantula	28	75	155	77	14-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4339490.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4339490.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4339490.png"}
3024395	2024-05-08 00:52:56.584	2024-05-08 00:52:56.584	Jessica Andrade	J. Andrade	Jessica	Andrade	Bate Estaca	32	61	116	62	26-12-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3024395.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3024395.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3024395.png"}
4379258	2024-05-08 00:52:56.588	2024-05-08 00:52:56.588	Marina Rodriguez	M. Rodriguez	Marina	Rodriguez	\N	37	66	116	65	17-4-2	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4379258.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4379258.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4379258.png"}
2335718	2024-05-08 00:52:56.671	2024-05-08 00:52:56.671	Jim Miller	J. Miller	Jim	Miller	A-10	40	68	155	71	37-18-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2335718.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2335718.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2335718.png"}
2502364	2024-05-08 00:52:56.677	2024-05-08 00:52:56.677	Bobby Green	B. Green	Bobby	Green	King	37	70	156	71	32-15-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2502364.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2502364.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2502364.png"}
3163637	2024-05-08 00:52:56.757	2024-05-08 00:52:56.757	Cody Garbrandt	C. Garbrandt	Cody	Garbrandt	No Love	32	68	136	65	14-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3163637.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3163637.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3163637.png"}
4189320	2024-05-08 00:52:56.76	2024-05-08 00:52:56.76	Deiveson Figueiredo	D. Figueiredo	Deiveson	Figueiredo	Deus da Guerra	36	65	135	68	23-3-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4189320.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4189320.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4189320.png"}
4234873	2024-05-08 00:53:05.395	2024-05-08 00:53:05.395	Logan Storley	L. Storley	Logan	Storley	Storm	31	69	170	71	15-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4234873.png"}
4832859	2024-05-08 00:53:05.428	2024-05-08 00:53:05.428	Magomed Umalatov	M. Umalatov	Magomed	Umalatov	Prince	32	73	170	78	15-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4832859.png"}
4688510	2024-05-08 00:53:05.526	2024-05-08 00:53:05.526	Shamil Musaev	S. Musaev	Shamil	Musaev	\N	30	70	171	71	17-0-1	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4688510.png"}
2980488	2024-05-08 00:53:05.592	2024-05-08 00:53:05.592	Andrey Koreshkov	A. Koreshkov	Andrey	Koreshkov	Spartan	33	72	170	76	27-5-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2980488.png"}
4330789	2024-05-08 00:53:05.635	2024-05-08 00:53:05.635	Pedro Carvalho	P. Carvalho	Pedro	Carvalho	The Game	28	71	146	70	13-9-0	https://a.espncdn.com/i/teamlogos/countries/500/por.png	\N	{"primary": "#FF0000", "secondary": "#006600"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4330789.png"}
4291177	2024-05-08 00:52:57.239	2024-05-08 00:52:57.239	Otto Rodrigues	O. Rodrigues	Otto	Rodrigues	\N	36	66	145	64	14-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4291177.png"}
5075978	2024-05-08 00:52:57.275	2024-05-08 00:52:57.275	Romain Debienne	R. Debienne	Romain	Debienne	\N	\N	70	170	74	10-5-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5075978.png"}
5120974	2024-05-08 00:52:57.281	2024-05-08 00:52:57.281	Thad Jean	T. Jean	Thad	Jean	Silverback	25	74	170	76	7-0-0	https://a.espncdn.com/i/teamlogos/countries/500/hai.png	\N	{"primary": "#00209F", "secondary": "#D21034"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5120974.png"}
4289880	2024-05-08 00:52:57.312	2024-05-08 00:52:57.312	Chris Bungard	C. Bungard	Chris	Bungard	\N	35	71	155	72	19-9-0	https://a.espncdn.com/i/teamlogos/countries/500/sct.png	\N	{"primary": "#0065BD", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4289880.png"}
5211391	2024-05-08 00:52:57.318	2024-05-08 00:52:57.318	Dumitru Girlean	D. Girlean	Dumitru	Girlean	\N	29	69	155	0	1-0-0	https://a.espncdn.com/i/teamlogos/countries/500/ita.png	\N	{"primary": "#CD212A", "secondary": "#008C45"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5211391.png"}
3991050	2024-05-08 00:52:57.347	2024-05-08 00:52:57.347	Cameron Else	C. Else	Cameron	Else	Camchida	37	69	135	71	11-6-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3991050.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3991050.png"}
5188022	2024-05-08 00:52:57.353	2024-05-08 00:52:57.353	Reece McEwan	R. McEwan	Reece	McEwan	\N	29	67	135	0	0-2-0	https://a.espncdn.com/i/teamlogos/countries/500/sct.png	\N	{"primary": "#0065BD", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5188022.png"}
3065566	2024-05-08 00:53:05.425	2024-05-08 00:53:05.425	Brennan Ward	B. Ward	Brennan	Ward	Irish	35	70	170	71	17-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3065566.png"}
2611321	2024-05-08 00:53:05.452	2024-05-08 00:53:05.452	Bubba Jenkins	B. Jenkins	Bubba	Jenkins	Bad Man	36	68	145	72	21-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2611321.png"}
5124792	2024-05-08 00:53:05.456	2024-05-08 00:53:05.456	Gabriel Braga	G. Braga	Gabriel	Braga	\N	26	69	144	72	13-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5124792.png"}
4911955	2024-05-08 00:53:05.53	2024-05-08 00:53:05.53	Murad Ramazanov	M. Ramazanov	Murad	Ramazanov	\N	28	71	185	74	12-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4911955.png"}
3901014	2024-05-08 00:53:05.558	2024-05-08 00:53:05.558	Enrique Barzola	E. Barzola	Enrique	Barzola	El Fuerte	35	67	135	70	20-8-2	https://a.espncdn.com/i/teamlogos/countries/500/per.png	\N	{"primary": "#D91023", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3901014.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3901014.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3901014.png"}
3076910	2024-05-08 00:53:05.596	2024-05-08 00:53:05.596	Goiti Yamauchi	G. Yamauchi	Goiti	Yamauchi	\N	31	70	170	75	29-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3076910.png"}
4688447	2024-05-08 00:53:05.639	2024-05-08 00:53:05.639	Kai Kamaka III	K. Kamaka III	Kai	Kamaka III	The Fighting Hawaiian	29	67	145	69	13-5-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4688447.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4688447.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4688447.png"}
3056388	2024-05-08 00:53:05.67	2024-05-08 00:53:05.67	Neiman Gracie	N. Gracie	Neiman	Gracie	\N	35	72	170	74	12-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3056388.png"}
4331588	2024-05-08 00:53:05.675	2024-05-08 00:53:05.675	Don Madge	D. Madge	Don	Madge	Magic Man	33	72	155	72	11-4-1	https://a.espncdn.com/i/teamlogos/countries/500/rsa.png	\N	{"primary": "#FFB81C", "secondary": "#007749"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4331588.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4331588.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4331588.png"}
3075589	2024-05-08 00:53:05.708	2024-05-08 00:53:05.708	Brett Johns	B. Johns	Brett	Johns	The Pikey	32	67	136	69	20-4-0	https://a.espncdn.com/i/teamlogos/countries/500/wal.png	\N	{"primary": "#BA0F30", "secondary": "#00AB39"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3075589.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3075589.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3075589.png"}
4208418	2024-05-08 00:53:05.715	2024-05-08 00:53:05.715	Adam Borics	A. Borics	Adam	Borics	The Kid	30	71	145	70	19-2-0	https://a.espncdn.com/i/teamlogos/countries/500/hun.png	\N	{"primary": "#CD2A3E", "secondary": "#436F4D"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4208418.png"}
4350873	2024-05-08 00:53:05.743	2024-05-08 00:53:05.743	Tyler Diamond	T. Diamond	Tyler	Diamond	\N	33	67	145	69	13-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4350873.png"}
4419469	2024-05-08 00:52:57.39	2024-05-08 00:52:57.39	Scott Malone	S. Malone	Scott	Malone	Boom Boom	36	67	125	0	9-7-0	https://a.espncdn.com/i/teamlogos/countries/500/sct.png	\N	{"primary": "#0065BD", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4419469.png"}
4708881	2024-05-08 00:52:57.397	2024-05-08 00:52:57.397	Nicolas Leblond	N. Leblond	Nicolas	Leblond	\N	\N	0	125	0	10-4-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4708881.png"}
4373246	2024-05-08 00:52:57.43	2024-05-08 00:52:57.43	Paull McBain	P. McBain	Paull	McBain	The Locomotive	35	72	145	0	8-3-0	https://a.espncdn.com/i/teamlogos/countries/500/sct.png	\N	{"primary": "#0065BD", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4373246.png"}
4637428	2024-05-08 00:52:57.434	2024-05-08 00:52:57.434	Alberth Dias	A. Dias	Alberth	Dias	\N	32	70	145	0	6-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4637428.png"}
5083027	2024-05-08 00:52:57.462	2024-05-08 00:52:57.462	Mitch McKee	M. McKee	Mitch	McKee	Merciless	26	67	135	66	6-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5083027.png"}
5210733	2024-05-08 00:52:57.467	2024-05-08 00:52:57.467	Jose Hernandez	J. Hernandez	Jose	Hernandez	\N	30	69	135	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5210733.png"}
5148533	2024-05-08 00:52:57.494	2024-05-08 00:52:57.494	Michael Blockhus	M. Blockhus	Michael	Blockhus	\N	\N	67	145	68	2-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5148533.png"}
5210732	2024-05-08 00:52:57.501	2024-05-08 00:52:57.501	Jonathan Griffin	J. Griffin	Jonathan	Griffin	Cochino	34	74	155	76	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5210732.png"}
3020090	2024-05-08 00:52:57.55	2024-05-08 00:52:57.55	Matheus Nicolau	M. Nicolau	Matheus	Nicolau	\N	31	66	125	66	19-5-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3020090.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3020090.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3020090.png"}
3155425	2024-05-08 00:52:57.554	2024-05-08 00:52:57.554	Alex Perez	A. Perez	Alex	Perez	\N	32	66	126	65	25-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3155425.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3155425.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3155425.png"}
3887606	2024-05-08 00:52:57.694	2024-05-08 00:52:57.694	Ryan Spann	R. Spann	Ryan	Spann	Superman	32	77	205	79	21-10-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3887606.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3887606.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3887606.png"}
5152109	2024-05-08 00:52:57.698	2024-05-08 00:52:57.698	Bogdan Guskov	B. Guskov	Bogdan	Guskov	Czarevitch	31	75	204	76	16-3-0	https://a.espncdn.com/i/teamlogos/countries/500/uzb.png	\N	{"primary": "#0099B5", "secondary": "#1EB53A"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5152109.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5152109.png"}
3309918	2024-05-08 00:52:57.818	2024-05-08 00:52:57.818	Karine Silva	K. Silva	Karine	Silva	Killer	30	65	125	67	18-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3309918.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3309918.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3309918.png"}
4227318	2024-05-08 00:52:57.824	2024-05-08 00:52:57.824	Ariane da Silva	A. da Silva	Ariane	da Silva	The Queen	30	66	126	67	17-9-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4227318.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4227318.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4227318.png"}
2223033	2024-05-08 00:52:57.951	2024-05-08 00:52:57.951	Austen Lane	A. Lane	Austen	Lane	\N	36	78	254	80	12-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2223033.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2223033.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2223033.png"}
5145497	2024-05-08 00:52:57.956	2024-05-08 00:52:57.956	Jhonata Diniz	J. Diniz	Jhonata	Diniz	\N	32	76	255	79	7-0-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5145497.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5145497.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5145497.png"}
4245092	2024-05-08 00:52:58.093	2024-05-08 00:52:58.093	Jonathan Pearce	J. Pearce	Jonathan	Pearce	JSP	32	72	146	71	14-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4245092.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4245092.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4245092.png"}
4897850	2024-05-08 00:52:58.099	2024-05-08 00:52:58.099	David Onama	D. Onama	David	Onama	\N	29	71	148	74	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/uga.png	\N	{}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4897850.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4897850.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4897850.png"}
2500946	2024-05-08 00:52:58.213	2024-05-08 00:52:58.213	Tim Means	T. Means	Tim	Means	The Dirty Bird	40	74	171	75	33-16-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2500946.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2500946.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2500946.png"}
4685870	2024-05-08 00:52:58.219	2024-05-08 00:52:58.219	Uros Medic	U. Medic	Uros	Medic	The Doctor	31	73	171	71	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/ser.png	\N	{"primary": "#A12D2E", "secondary": "#0C4076"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4685870.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4685870.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4685870.png"}
2503659	2024-05-08 00:52:58.352	2024-05-08 00:52:58.352	Rani Yahya	R. Yahya	Rani	Yahya	\N	39	66	136	67	28-12-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2503659.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2503659.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2503659.png"}
3114234	2024-05-08 00:52:58.358	2024-05-08 00:52:58.358	Victor Henry	V. Henry	Victor	Henry	La Mangosta	37	67	135	68	24-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3114234.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3114234.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3114234.png"}
4397797	2024-05-08 00:52:58.487	2024-05-08 00:52:58.487	Austin Hubbard	A. Hubbard	Austin	Hubbard	Thud	32	70	156	71	17-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4397797.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4397797.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4397797.png"}
4900807	2024-05-08 00:52:58.494	2024-05-08 00:52:58.494	Michal Figlak	M. Figlak	Michal	Figlak	Mad Dog	27	70	156	70	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4900807.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4900807.png"}
4249193	2024-05-08 00:52:58.636	2024-05-08 00:52:58.636	Don'Tale Mayes	D. Mayes	Don'Tale	Mayes	Lord Kong	32	78	264	81	11-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4249193.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4249193.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4249193.png"}
5007668	2024-05-08 00:52:58.643	2024-05-08 00:52:58.643	Caio Machado	C. Machado	Caio	Machado	Bigfoot	29	76	251	78	8-3-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5007668.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5007668.png"}
4566308	2024-05-08 00:52:58.798	2024-05-08 00:52:58.798	Ketlen Souza	K. Souza	Ketlen	Souza	Esquentadinha	28	63	115	63	14-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4566308.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4566308.png"}
4891678	2024-05-08 00:52:58.805	2024-05-08 00:52:58.805	Marnic Mann	M. Mann	Marnic	Mann	The Sawed-Off Savage	31	60	115	64	6-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4891678.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4891678.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4891678.png"}
3163772	2024-05-08 00:52:58.956	2024-05-08 00:52:58.956	Chris Padilla	C. Padilla	Chris	Padilla	Taco	28	69	155	74	14-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3163772.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3163772.png"}
5075748	2024-05-08 00:52:58.962	2024-05-08 00:52:58.962	James Llontop	J. Llontop	James	Llontop	Goku	24	72	157	73	14-3-0	https://a.espncdn.com/i/teamlogos/countries/500/per.png	\N	{"primary": "#D91023", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5075748.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5075748.png"}
4295932	2024-05-08 00:52:59.046	2024-05-08 00:52:59.046	Liang Na	L. Na	Liang	Na	The Dragon Girl	27	65	126	67	19-8-0	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4295932.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4295932.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4295932.png"}
5132151	2024-05-08 00:52:59.052	2024-05-08 00:52:59.052	Ivana Petrovic	I. Petrovic	Ivana	Petrovic	\N	29	68	126	70	7-1-0	https://a.espncdn.com/i/teamlogos/countries/500/cro.png	\N	{"primary": "#FF0000", "secondary": "#171796"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5132151.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5132151.png"}
4895360	2024-05-08 00:52:59.144	2024-05-08 00:52:59.144	Maheshate	Maheshate	Maheshate	\N	\N	24	72	155	71	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4895360.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4895360.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4895360.png"}
5094692	2024-05-08 00:52:59.235	2024-05-08 00:52:59.235	Halil Amir	H. Amir	Halil	Amir	\N	29	71	155	73	10-1-0	https://a.espncdn.com/i/teamlogos/countries/500/tur.png	\N	{"primary": "#E30A17", "secondary": "#73DCD0"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5094692.png"}
5210077	2024-05-08 00:52:59.239	2024-05-08 00:52:59.239	Akbar Abdullaev	A. Abdullaev	Akbar	Abdullaev	Bakal	26	67	155	70	11-0-0	https://a.espncdn.com/i/teamlogos/countries/500/kgz.png	\N	{"primary": "#E8112D", "secondary": "#FFE704"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5210077.png"}
3090555	2024-05-08 00:52:59.261	2024-05-08 00:52:59.261	Lipeng Zhang	L. Zhang	Lipeng	Zhang	The Warrior	34	71	170	71	12-11-1	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3090555.png"}
5139002	2024-05-08 00:52:59.265	2024-05-08 00:52:59.265	Maurice Abevi	M. Abevi	Maurice	Abevi	\N	24	72	170	75	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/sui.png	\N	{"primary": "#D52B1E", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5139002.png"}
3871760	2024-05-08 00:52:59.289	2024-05-08 00:52:59.289	Reece McLaren	R. McLaren	Reece	McLaren	Lightning	32	66	125	0	17-9-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3871760.png"}
4896583	2024-05-08 00:52:59.294	2024-05-08 00:52:59.294	Yong Hu	Y. Hu	Yong	Hu	Wolf Warrior	28	66	135	0	12-5-0	https://a.espncdn.com/i/teamlogos/countries/500/chn.png	\N	{"primary": "#DE2910", "secondary": "#FFDE00"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4896583.png"}
2560746	2024-05-08 00:52:59.331	2024-05-08 00:52:59.331	Alexandre Pantoja	A. Pantoja	Alexandre	Pantoja	The Cannibal	34	65	125	67	28-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2560746.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2560746.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2560746.png"}
2447641	2024-05-08 00:52:59.427	2024-05-08 00:52:59.427	Jose Aldo	J. Aldo	Jose	Aldo	Junior	37	67	136	70	32-8-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2447641.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2447641.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2447641.png"}
3928690	2024-05-08 00:52:59.431	2024-05-08 00:52:59.431	Jonathan Martinez	J. Martinez	Jonathan	Martinez	Dragon	30	68	136	70	19-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3928690.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3928690.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3928690.png"}
2512976	2024-05-08 00:52:59.53	2024-05-08 00:52:59.53	Anthony Smith	A. Smith	Anthony	Smith	Lionheart	35	76	205	76	38-19-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2512976.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2512976.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2512976.png"}
4418962	2024-05-08 00:52:59.636	2024-05-08 00:52:59.636	Michel Pereira	M. Pereira	Michel	Pereira	Demolidor	30	73	186	73	31-11-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4418962.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4418962.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4418962.png"}
3946951	2024-05-08 00:52:59.707	2024-05-08 00:52:59.707	Paul Craig	P. Craig	Paul	Craig	BearJew	36	75	185	76	17-8-1	https://a.espncdn.com/i/teamlogos/countries/500/sct.png	\N	{"primary": "#0065BD", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3946951.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3946951.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3946951.png"}
4835137	2024-05-08 00:52:59.712	2024-05-08 00:52:59.712	Caio Borralho	C. Borralho	Caio	Borralho	The Natural	31	73	186	75	16-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4835137.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4835137.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4835137.png"}
4319793	2024-05-08 00:52:59.825	2024-05-08 00:52:59.825	Jack Shore	J. Shore	Jack	Shore	Tank	29	68	145	71	17-2-0	https://a.espncdn.com/i/teamlogos/countries/500/wal.png	\N	{"primary": "#BA0F30", "secondary": "#00AB39"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4319793.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4319793.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4319793.png"}
4422355	2024-05-08 00:52:59.831	2024-05-08 00:52:59.831	Joanderson Brito	J. Brito	Joanderson	Brito	Tubarao	29	68	146	72	17-3-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4422355.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4422355.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4422355.png"}
3102702	2024-05-08 00:52:59.994	2024-05-08 00:52:59.994	Karolina Kowalkiewicz	K. Kowalkiewicz	Karolina	Kowalkiewicz	\N	38	63	116	64	16-8-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3102702.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3102702.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3102702.png"}
5080935	2024-05-08 00:53:00.004	2024-05-08 00:53:00.004	Iasmin Lucindo	I. Lucindo	Iasmin	Lucindo	Yasmin	22	63	116	66	16-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5080935.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5080935.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5080935.png"}
5050129	2024-05-08 00:53:00.097	2024-05-08 00:53:00.097	Myktybek Orolbai	M. Orolbai	Myktybek	Orolbai	\N	26	70	155	75	13-1-1	https://a.espncdn.com/i/teamlogos/countries/500/kgz.png	\N	{"primary": "#E8112D", "secondary": "#FFE704"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5050129.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5050129.png"}
5110006	2024-05-08 00:53:00.103	2024-05-08 00:53:00.103	Elves Brener	E. Brener	Elves	Brener	\N	26	70	156	72	16-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5110006.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5110006.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5110006.png"}
3897005	2024-05-08 00:53:00.161	2024-05-08 00:53:00.161	Joaquim Silva	J. Silva	Joaquim	Silva	Netto BJJ	35	68	155	69	13-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3897005.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3897005.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3897005.png"}
4079621	2024-05-08 00:53:00.166	2024-05-08 00:53:00.166	Drakkar Klose	D. Klose	Drakkar	Klose	\N	36	69	156	70	15-2-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4079621.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4079621.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4079621.png"}
4064883	2024-05-08 00:53:00.281	2024-05-08 00:53:00.281	Jamie Mullarkey	J. Mullarkey	Jamie	Mullarkey	\N	29	72	155	74	17-8-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4064883.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4064883.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4064883.png"}
5122238	2024-05-08 00:53:00.286	2024-05-08 00:53:00.286	Mauricio Ruffy	M. Ruffy	Mauricio	Ruffy	\N	27	71	156	75	10-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5122238.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5122238.png"}
4801725	2024-05-08 00:53:00.429	2024-05-08 00:53:00.429	Dione Barbosa	D. Barbosa	Dione	Barbosa	The Witch	32	66	126	66	7-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4801725.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4801725.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4801725.png"}
5149147	2024-05-08 00:53:00.433	2024-05-08 00:53:00.433	Ernesta Kareckaite	E. Kareckaite	Ernesta	Kareckaite	Heavy-Handed	25	69	125	71	5-1-1	https://a.espncdn.com/i/teamlogos/countries/500/ltu.png	\N	{"primary": "#FDB913", "secondary": "#006A44"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5149147.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5149147.png"}
2960679	2024-05-08 00:53:00.634	2024-05-08 00:53:00.634	Vinc Pichel	V. Pichel	Vinc	Pichel	From Hell	41	70	156	72	14-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2960679.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2960679.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2960679.png"}
3093513	2024-05-08 00:53:00.64	2024-05-08 00:53:00.64	Ismael Bonfim	I. Bonfim	Ismael	Bonfim	Marreta	28	68	156	71	20-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3093513.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3093513.png"}
5074121	2024-05-08 00:53:00.779	2024-05-08 00:53:00.779	Alessandro Costa	A. Costa	Alessandro	Costa	Nono	28	64	125	67	14-4-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5074121.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5074121.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5074121.png"}
5144066	2024-05-08 00:53:00.785	2024-05-08 00:53:00.785	Kevin Borjas	K. Borjas	Kevin	Borjas	El Gallo Negro	26	65	125	68	9-3-0	https://a.espncdn.com/i/teamlogos/countries/500/per.png	\N	{"primary": "#D91023", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5144066.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5144066.png"}
2560713	2024-05-08 00:53:00.969	2024-05-08 00:53:00.969	Derrick Lewis	D. Lewis	Derrick	Lewis	The Black Beast	39	75	265	79	27-12-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2560713.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2560713.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2560713.png"}
4426192	2024-05-08 00:53:00.979	2024-05-08 00:53:00.979	Rodrigo Nascimento	R. Nascimento	Rodrigo	Nascimento	Ze Colmeia	31	74	264	80	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4426192.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4426192.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4426192.png"}
4024714	2024-05-08 00:53:01.128	2024-05-08 00:53:01.128	Joaquin Buckley	J. Buckley	Joaquin	Buckley	New Mansa	30	70	170	76	18-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4024714.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4024714.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4024714.png"}
4422103	2024-05-08 00:53:01.134	2024-05-08 00:53:01.134	Nursulton Ruziboev	N. Ruziboev	Nursulton	Ruziboev	Black	30	77	170	76	34-8-2	https://a.espncdn.com/i/teamlogos/countries/500/uzb.png	\N	{"primary": "#0099B5", "secondary": "#1EB53A"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4422103.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4422103.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4422103.png"}
3948876	2024-05-08 00:53:01.19	2024-05-08 00:53:01.19	Alonzo Menifield	A. Menifield	Alonzo	Menifield	Atomic	36	72	204	76	15-3-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3948876.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3948876.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3948876.png"}
4695736	2024-05-08 00:53:01.197	2024-05-08 00:53:01.197	Carlos Ulberg	C. Ulberg	Carlos	Ulberg	Black Jag	33	76	204	77	10-1-0	https://a.espncdn.com/i/teamlogos/countries/500/nzl.png	\N	{"primary": "#01237E", "secondary": "#CC142B"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4695736.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4695736.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4695736.png"}
3026133	2024-05-08 00:53:01.337	2024-05-08 00:53:01.337	Diego Ferreira	D. Ferreira	Diego	Ferreira	\N	39	69	154	74	18-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3026133.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3026133.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3026133.png"}
4689965	2024-05-08 00:53:01.345	2024-05-08 00:53:01.345	Mateusz Rębecki	M. Rębecki	Mateusz	Rębecki	Chinczyk	31	67	155	66	19-1-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4689965.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4689965.png"}
2552906	2024-05-08 00:53:01.398	2024-05-08 00:53:01.398	Alex Caceres	A. Caceres	Alex	Caceres	Bruce Leeroy	35	70	145	73	21-14-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2552906.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2552906.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2552906.png"}
4566991	2024-05-08 00:53:01.403	2024-05-08 00:53:01.403	Sean Woodson	S. Woodson	Sean	Woodson	The Sniper	31	74	145	78	11-1-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4566991.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4566991.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4566991.png"}
4903365	2024-05-08 00:53:01.459	2024-05-08 00:53:01.459	Waldo Cortes-Acosta	W. Cortes-Acosta	Waldo	Cortes-Acosta	Salsa Boy	32	76	261	78	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/dom.png	\N	{"primary": "#0026F5", "secondary": "#EB3223"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4903365.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4903365.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4903365.png"}
4354421	2024-05-08 00:53:01.51	2024-05-08 00:53:01.51	Chase Hooper	C. Hooper	Chase	Hooper	The Dream	24	73	155	74	13-3-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4354421.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4354421.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4354421.png"}
4877915	2024-05-08 00:53:01.518	2024-05-08 00:53:01.518	Viacheslav Borshchev	V. Borshchev	Viacheslav	Borshchev	Slava Claus	32	71	154	69	7-3-1	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4877915.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4877915.png"}
4425604	2024-05-08 00:53:01.571	2024-05-08 00:53:01.571	Terrance McKinney	T. McKinney	Terrance	McKinney	T. Wrecks	29	70	155	73	15-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4425604.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4425604.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4425604.png"}
5074131	2024-05-08 00:53:01.578	2024-05-08 00:53:01.578	Esteban Ribovics	E. Ribovics	Esteban	Ribovics	El Gringo	28	70	156	69	12-1-0	https://a.espncdn.com/i/teamlogos/countries/500/arg.png	\N	{"primary": "#74ACDF", "secondary": "#F6B40E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5074131.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5074131.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5074131.png"}
3032972	2024-05-08 00:53:01.701	2024-05-08 00:53:01.701	Tecia Pennington	T. Pennington	Tecia	Pennington	The Tiny Tornado	34	61	115	60	13-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3032972.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3032972.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3032972.png"}
4868095	2024-05-08 00:53:01.711	2024-05-08 00:53:01.711	Tabatha Ricci	T. Ricci	Tabatha	Ricci	Baby Shark	29	61	115	61	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4868095.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4868095.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4868095.png"}
4706975	2024-05-08 00:53:01.814	2024-05-08 00:53:01.814	Billy Goff	B. Goff	Billy	Goff	\N	25	70	170	72	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4706975.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4706975.png"}
5092403	2024-05-08 00:53:01.827	2024-05-08 00:53:01.827	Trey Waters	T. Waters	Trey	Waters	The Truth	29	77	171	77	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5092403.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5092403.png"}
4375156	2024-05-08 00:53:01.872	2024-05-08 00:53:01.872	Charles Johnson	C. Johnson	Charles	Johnson	InnerG	33	69	125	70	14-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4375156.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4375156.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4375156.png"}
4705600	2024-05-08 00:53:01.879	2024-05-08 00:53:01.879	Jake Hadley	J. Hadley	Jake	Hadley	White Kong	27	67	125	70	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4705600.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4705600.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4705600.png"}
4375621	2024-05-08 00:53:01.947	2024-05-08 00:53:01.947	Jared Gooden	J. Gooden	Jared	Gooden	Nite Train	30	72	171	77	23-9-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4375621.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4375621.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4375621.png"}
4830364	2024-05-08 00:53:01.954	2024-05-08 00:53:01.954	Kevin Jousset	K. Jousset	Kevin	Jousset	Air	31	74	170	75	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4830364.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4830364.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4830364.png"}
3136289	2024-05-08 00:53:02.025	2024-05-08 00:53:02.025	JJ Aldrich	J. Aldrich	JJ	Aldrich	\N	31	65	125	67	13-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3136289.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3136289.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3136289.png"}
4044708	2024-05-08 00:53:02.029	2024-05-08 00:53:02.029	Veronica Hardy	V. Hardy	Veronica	Hardy	\N	28	64	125	64	8-4-1	https://a.espncdn.com/i/teamlogos/countries/500/ven.png	\N	{"primary": "#CE1126", "secondary": "#003893"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4044708.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4044708.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4044708.png"}
2966188	2024-05-08 00:53:02.088	2024-05-08 00:53:02.088	Magomed Magomedov	M. Magomedov	Magomed	Magomedov	Tiger	32	67	135	69	20-3-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2966188.png"}
4350925	2024-05-08 00:53:02.092	2024-05-08 00:53:02.092	Patchy Mix	P. Mix	Patchy	Mix	No Love	30	71	135	71	19-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4350925.png"}
3960085	2024-05-08 00:53:02.116	2024-05-08 00:53:02.116	Jaleel Willis	J. Willis	Jaleel	Willis	The Realest	32	71	170	74	16-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3960085.png"}
5082905	2024-05-08 00:53:02.122	2024-05-08 00:53:02.122	Cedric Doumbé	C. Doumbé	Cedric	Doumbé	Le Meilleur	31	68	170	75	5-1-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5082905.png"}
2559789	2024-05-08 00:53:02.15	2024-05-08 00:53:02.15	Gregory Babene	G. Babene	Gregory	Babene	Blade	40	72	185	73	23-11-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2559789.png"}
4330791	2024-05-08 00:53:02.154	2024-05-08 00:53:02.154	Costello van Steenis	C. van Steenis	Costello	van Steenis	The Spaniard	31	73	185	77	14-3-0	https://a.espncdn.com/i/teamlogos/countries/500/ned.png	\N	{"primary": "#AE1C28", "secondary": "#21468B"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4330791.png"}
3022308	2024-05-08 00:53:02.171	2024-05-08 00:53:02.171	Yves Landu	Y. Landu	Yves	Landu	You Know	37	68	145	73	20-9-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3022308.png"}
4884867	2024-05-08 00:53:02.175	2024-05-08 00:53:02.175	Jonas Bilharinho	J. Bilharinho	Jonas	Bilharinho	\N	33	71	146	75	11-2-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4884867.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4884867.png"}
3965445	2024-05-08 00:53:02.195	2024-05-08 00:53:02.195	Thibault Gouti	T. Gouti	Thibault	Gouti	GT	37	70	170	73	17-6-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3965445.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3965445.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3965445.png"}
4878438	2024-05-08 00:53:02.199	2024-05-08 00:53:02.199	Archie Colgan	A. Colgan	Archie	Colgan	King	28	69	155	69	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4878438.png"}
5080572	2024-05-08 00:53:02.225	2024-05-08 00:53:02.225	Louie Sutherland	L. Sutherland	Louie	Sutherland	Vanilla Gorilla	30	75	243	76	6-2-0	https://a.espncdn.com/i/teamlogos/countries/500/sct.png	\N	{"primary": "#0065BD", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5080572.png"}
5101131	2024-05-08 00:53:02.23	2024-05-08 00:53:02.23	Slim Trabelsi	S. Trabelsi	Slim	Trabelsi	\N	30	73	239	74	6-0-0	https://a.espncdn.com/i/teamlogos/countries/500/tun.png	\N	{"primary": "#E70013", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5101131.png"}
3067201	2024-05-08 00:53:02.254	2024-05-08 00:53:02.254	Mansour Barnaoui	M. Barnaoui	Mansour	Barnaoui	Tarzan	31	72	155	77	20-6-0	https://a.espncdn.com/i/teamlogos/countries/500/tun.png	\N	{"primary": "#E70013", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3067201.png"}
4084363	2024-05-08 00:53:02.279	2024-05-08 00:53:02.279	Mike Shipman	M. Shipman	Mike	Shipman	Seabass	33	73	185	74	15-4-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4084363.png"}
5076088	2024-05-08 00:53:02.284	2024-05-08 00:53:02.284	Imamshafi Aliev	I. Aliev	Imamshafi	Aliev	\N	25	72	185	0	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5076088.png"}
3167160	2024-05-08 00:53:02.304	2024-05-08 00:53:02.304	Aspen Ladd	A. Ladd	Aspen	Ladd	\N	29	66	150	66	11-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3167160.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3167160.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3167160.png"}
5120811	2024-05-08 00:53:02.309	2024-05-08 00:53:02.309	Kateryna Shakalova	K. Shakalova	Kateryna	Shakalova	\N	26	62	145	62	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/ukr.png	\N	{"primary": "#005BBB", "secondary": "#FFD500"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5120811.png"}
4894845	2024-05-08 00:53:02.332	2024-05-08 00:53:02.332	Asaël Adjoudj	A. Adjoudj	Asaël	Adjoudj	The Sultan	25	72	146	71	7-1-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4894845.png"}
5209577	2024-05-08 00:53:02.337	2024-05-08 00:53:02.337	Bruno Fontes	B. Fontes	Bruno	Fontes	Guerra	29	68	145	0	7-0-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5209577.png"}
2526299	2024-05-08 00:53:02.371	2024-05-08 00:53:02.371	Edson Barboza	E. Barboza	Edson	Barboza	Junior	38	71	146	75	24-11-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2526299.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2526299.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2526299.png"}
4576101	2024-05-08 00:53:02.378	2024-05-08 00:53:02.378	Lerone Murphy	L. Murphy	Lerone	Murphy	The Miracle	32	69	146	73	13-0-1	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4576101.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4576101.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4576101.png"}
3901011	2024-05-08 00:53:02.406	2024-05-08 00:53:02.406	Carlston Harris	C. Harris	Carlston	Harris	Mocambique	36	72	170	76	19-5-0	https://a.espncdn.com/i/teamlogos/countries/500/guy.png	\N	{"primary": "#FCF595", "secondary": "#44913E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3901011.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3901011.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3901011.png"}
4612580	2024-05-08 00:53:02.411	2024-05-08 00:53:02.411	Khaos Williams	K. Williams	Khaos	Williams	The Ox Fighter	30	72	169	77	14-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4612580.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4612580.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4612580.png"}
5060489	2024-05-08 00:53:02.439	2024-05-08 00:53:02.439	Rodolfo Bellato	R. Bellato	Rodolfo	Bellato	Trator	28	75	205	75	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5060489.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5060489.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5060489.png"}
5074120	2024-05-08 00:53:02.444	2024-05-08 00:53:02.444	Oumar Sy	O. Sy	Oumar	Sy	\N	28	77	205	84	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5074120.png"}
3998248	2024-05-08 00:53:02.468	2024-05-08 00:53:02.468	Adrian Yanez	A. Yanez	Adrian	Yanez	\N	30	67	135	70	16-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3998248.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3998248.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3998248.png"}
4869425	2024-05-08 00:53:02.475	2024-05-08 00:53:02.475	Vinicius Salvador	V. Salvador	Vinicius	Salvador	Fenomeno	27	67	128	70	14-6-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4869425.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4869425.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4869425.png"}
3115931	2024-05-08 00:53:02.51	2024-05-08 00:53:02.51	Angela Hill	A. Hill	Angela	Hill	Overkill	39	63	115	64	16-13-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3115931.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3115931.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3115931.png"}
4689229	2024-05-08 00:53:02.519	2024-05-08 00:53:02.519	Luana Pinheiro	L. Pinheiro	Luana	Pinheiro	\N	31	62	115	62	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4689229.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4689229.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4689229.png"}
4297311	2024-05-08 00:53:02.549	2024-05-08 00:53:02.549	Ramiz Brahimaj	R. Brahimaj	Ramiz	Brahimaj	\N	31	70	170	72	10-4-0	https://a.espncdn.com/i/teamlogos/countries/500/kos.png	\N	{}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4297311.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4297311.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4297311.png"}
3077822	2024-05-08 00:53:02.585	2024-05-08 00:53:02.585	Abus Magomedov	A. Magomedov	Abus	Magomedov	Abus	33	74	185	78	25-6-1	https://a.espncdn.com/i/teamlogos/countries/500/ger.png	\N	{"primary": "#000000", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3077822.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3077822.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3077822.png"}
3108775	2024-05-08 00:53:02.593	2024-05-08 00:53:02.593	Warlley Alves	W. Alves	Warlley	Alves	\N	33	71	185	72	15-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3108775.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3108775.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3108775.png"}
4252258	2024-05-08 00:53:02.618	2024-05-08 00:53:02.618	Victor Martinez	V. Martinez	Victor	Martinez	The Brick	32	68	156	70	13-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4252258.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4252258.png"}
4374742	2024-05-08 00:53:02.65	2024-05-08 00:53:02.65	Hailey Cowan	H. Cowan	Hailey	Cowan	All Hail	32	68	137	67	7-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4374742.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4374742.png"}
4434010	2024-05-08 00:53:02.658	2024-05-08 00:53:02.658	Tamires Vidal	T. Vidal	Tamires	Vidal	Tractor	25	66	134	68	7-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4434010.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4434010.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4434010.png"}
5088844	2024-05-08 00:53:03.66	2024-05-08 00:53:03.66	Raul Rosas Jr.	R. Rosas Jr.	Raul	Rosas Jr.	El Niño Problema	19	69	136	67	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5088844.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5088844.png"}
4565903	2024-05-08 00:53:02.698	2024-05-08 00:53:02.698	Ariane Carnelossi	A. Carnelossi	Ariane	Carnelossi	Sorriso	31	62	115	61	14-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4565903.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4565903.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4565903.png"}
4816066	2024-05-08 00:53:02.704	2024-05-08 00:53:02.704	Piera Rodriguez	P. Rodriguez	Piera	Rodriguez	La Fiera	31	63	116	63	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/ven.png	\N	{"primary": "#CE1126", "secondary": "#003893"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4816066.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4816066.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4816066.png"}
4034272	2024-05-08 00:53:02.734	2024-05-08 00:53:02.734	Emily Ducote	E. Ducote	Emily	Ducote	Gordinha	30	62	115	63	13-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4034272.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4034272.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4034272.png"}
4683395	2024-05-08 00:53:02.739	2024-05-08 00:53:02.739	Vanessa Demopoulos	V. Demopoulos	Vanessa	Demopoulos	Lil' Monster	35	62	116	59	10-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4683395.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4683395.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4683395.png"}
2506549	2024-05-08 00:53:02.775	2024-05-08 00:53:02.775	Dustin Poirier	D. Poirier	Dustin	Poirier	The Diamond	35	69	156	72	30-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2506549.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2506549.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2506549.png"}
3332412	2024-05-08 00:53:02.781	2024-05-08 00:53:02.781	Islam Makhachev	I. Makhachev	Islam	Makhachev	\N	32	70	155	70	25-1-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3332412.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3332412.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3332412.png"}
4080826	2024-05-08 00:53:02.899	2024-05-08 00:53:02.899	Paulo Costa	P. Costa	Paulo	Costa	The Eraser	33	73	185	72	14-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4080826.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4080826.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4080826.png"}
5144068	2024-05-08 00:53:03.009	2024-05-08 00:53:03.009	Cesar Almeida	C. Almeida	Cesar	Almeida	Cesinha	36	73	185	74	5-0-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5144068.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5144068.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5144068.png"}
4421473	2024-05-08 00:53:03.039	2024-05-08 00:53:03.039	Alexandr Romanov	A. Romanov	Alexandr	Romanov	King Kong	33	74	264	75	17-2-0	https://a.espncdn.com/i/teamlogos/countries/500/mda.png	\N	{"primary": "#0146AE", "secondary": "#FFD200"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4421473.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4421473.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4421473.png"}
3039886	2024-05-08 00:53:03.085	2024-05-08 00:53:03.085	Elizeu Zaleski dos Santos	E. Zaleski dos Santos	Elizeu	Zaleski dos Santos	Capoeira	37	71	171	73	24-7-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3039886.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3039886.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3039886.png"}
3931156	2024-05-08 00:53:03.125	2024-05-08 00:53:03.125	Grant Dawson	G. Dawson	Grant	Dawson	KGD	30	70	156	72	20-2-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3931156.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3931156.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3931156.png"}
4423876	2024-05-08 00:53:03.133	2024-05-08 00:53:03.133	Joe Solecki	J. Solecki	Joe	Solecki	\N	30	69	155	70	13-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4423876.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4423876.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4423876.png"}
3088232	2024-05-08 00:53:03.16	2024-05-08 00:53:03.16	Alex Morono	A. Morono	Alex	Morono	The Great White	33	71	171	72	24-9-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3088232.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3088232.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3088232.png"}
4077451	2024-05-08 00:53:03.166	2024-05-08 00:53:03.166	Niko Price	N. Price	Niko	Price	The Hybrid	34	72	171	76	15-7-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4077451.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4077451.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4077451.png"}
3089915	2024-05-08 00:53:03.195	2024-05-08 00:53:03.195	Jake Matthews	J. Matthews	Jake	Matthews	The Celtic Kid	29	71	170	73	19-7-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3089915.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3089915.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3089915.png"}
5080570	2024-05-08 00:53:04.08	2024-05-08 00:53:04.08	Dakota Ditcheva	D. Ditcheva	Dakota	Ditcheva	Dangerous	25	68	125	70	11-0-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5080570.png"}
3924096	2024-05-08 00:53:03.202	2024-05-08 00:53:03.202	Phil Rowe	P. Rowe	Phil	Rowe	The Fresh Prince	33	75	171	80	10-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3924096.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3924096.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3924096.png"}
3960470	2024-05-08 00:53:03.243	2024-05-08 00:53:03.243	Mickey Gall	M. Gall	Mickey	Gall	\N	32	74	170	74	7-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3960470.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3960470.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3960470.png"}
4351085	2024-05-08 00:53:03.25	2024-05-08 00:53:03.25	Bassil Hafez	B. Hafez	Bassil	Hafez	The Habibi	32	71	170	72	8-4-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4351085.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4351085.png"}
4397782	2024-05-08 00:53:03.282	2024-05-08 00:53:03.282	Joselyne Edwards	J. Edwards	Joselyne	Edwards	La Pantera	28	68	136	70	13-5-0	https://a.espncdn.com/i/teamlogos/countries/500/pan.png	\N	{"primary": "#D20F34", "secondary": "#005293"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4397782.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4397782.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4397782.png"}
5075333	2024-05-08 00:53:03.288	2024-05-08 00:53:03.288	Ailin Perez	A. Perez	Ailin	Perez	Fiona	29	65	136	66	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/arg.png	\N	{"primary": "#74ACDF", "secondary": "#F6B40E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5075333.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5075333.png"}
5068545	2024-05-08 00:53:03.327	2024-05-08 00:53:03.327	HyunSung Park	H. Park	HyunSung	Park	Peace of Mind	28	67	126	66	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/kor.png	\N	{"primary": "#ED1C27", "secondary": "#024FA2"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5068545.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5068545.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5068545.png"}
5157669	2024-05-08 00:53:03.331	2024-05-08 00:53:03.331	Andre Lima	A. Lima	Andre	Lima	Mascote	25	67	125	67	8-0-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5157669.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5157669.png"}
4917772	2024-05-08 00:53:03.363	2024-05-08 00:53:03.363	Tatsuro Taira	T. Taira	Tatsuro	Taira	\N	24	67	125	70	15-0-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4917772.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4917772.png"}
4712960	2024-05-08 00:53:03.398	2024-05-08 00:53:03.398	Nong Stamp	N. Stamp	Nong	Stamp	Stamp Fairtex	26	62	115	63	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/tha.png	\N	{"primary": "#A51931", "secondary": "#2D2A4A"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4712960.png"}
4788959	2024-05-08 00:53:03.405	2024-05-08 00:53:03.405	Denice Zamboanga	D. Zamboanga	Denice	Zamboanga	The Menace	27	62	115	0	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/phi.png	\N	{"primary": "#0038A8", "secondary": "#CE0F26"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4788959.png"}
5173773	2024-05-08 00:53:03.448	2024-05-08 00:53:03.448	Blake Cooper	B. Cooper	Blake	Cooper	\N	27	67	170	0	0-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5173773.png"}
5210076	2024-05-08 00:53:03.454	2024-05-08 00:53:03.454	Kade Ruotolo	K. Ruotolo	Kade	Ruotolo	\N	21	71	155	75	0-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5210076.png"}
4397795	2024-05-08 00:53:03.497	2024-05-08 00:53:03.497	Jesse Butler	J. Butler	Jesse	Butler	\N	31	70	145	73	12-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4397795.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4397795.png"}
4046059	2024-05-08 00:53:03.572	2024-05-08 00:53:03.572	Cody Stamann	C. Stamann	Cody	Stamann	The Spartan	34	66	139	64	21-6-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4046059.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4046059.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4046059.png"}
4423214	2024-05-08 00:53:03.602	2024-05-08 00:53:03.602	Punahele Soriano	P. Soriano	Punahele	Soriano	Puna	31	71	185	72	9-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4423214.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4423214.png"}
4423448	2024-05-08 00:53:03.608	2024-05-08 00:53:03.608	Miguel Baeza	M. Baeza	Miguel	Baeza	Caramel Thunder	31	74	171	74	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4423448.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4423448.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4423448.png"}
3928693	2024-05-08 00:53:03.653	2024-05-08 00:53:03.653	Ricky Turcios	R. Turcios	Ricky	Turcios	Pretty	30	69	136	71	13-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3928693.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3928693.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3928693.png"}
4402367	2024-05-08 00:53:06.79	2024-05-08 00:53:06.79	Opponent TBA	O. TBA	Opponent	TBA	\N	\N	0	0	0	\N	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4402367.png"}
3955778	2024-05-08 00:53:03.698	2024-05-08 00:53:03.698	Thiago Moises	T. Moises	Thiago	Moises	\N	29	69	155	70	18-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3955778.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3955778.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3955778.png"}
4193694	2024-05-08 00:53:03.702	2024-05-08 00:53:03.702	Ludovit Klein	L. Klein	Ludovit	Klein	Mr. Highlight	29	67	156	72	21-4-1	https://a.espncdn.com/i/teamlogos/countries/500/svk.png	\N	{"primary": "#0A4FA3", "secondary": "#EE1D24"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4193694.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4193694.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4193694.png"}
2594871	2024-05-08 00:53:03.735	2024-05-08 00:53:03.735	Dustin Jacoby	D. Jacoby	Dustin	Jacoby	The Hanyak	36	75	204	76	19-8-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2594871.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2594871.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2594871.png"}
4233039	2024-05-08 00:53:03.741	2024-05-08 00:53:03.741	Dominick Reyes	D. Reyes	Dominick	Reyes	The Devastator	34	76	205	77	12-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4233039.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4233039.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4233039.png"}
4685871	2024-05-08 00:53:03.811	2024-05-08 00:53:03.811	Dustin Stoltzfus	D. Stoltzfus	Dustin	Stoltzfus	\N	32	72	185	75	15-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4685871.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4685871.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4685871.png"}
4063869	2024-05-08 00:53:03.845	2024-05-08 00:53:03.845	John Castaneda	J. Castaneda	John	Castaneda	Sexy Mexi	32	66	137	71	21-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4063869.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4063869.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4063869.png"}
4963343	2024-05-08 00:53:03.88	2024-05-08 00:53:03.88	Denise Gomes	D. Gomes	Denise	Gomes	Dee	24	62	115	63	8-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4963343.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4963343.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4963343.png"}
5143888	2024-05-08 00:53:03.888	2024-05-08 00:53:03.888	Eduarda Moura	E. Moura	Eduarda	Moura	Ronda	30	66	119	67	10-0-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5143888.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5143888.png"}
4077475	2024-05-08 00:53:03.916	2024-05-08 00:53:03.916	Julian Marquez	J. Marquez	Julian	Marquez	The Cuban Missile Crisis	34	74	185	72	9-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4077475.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4077475.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4077475.png"}
5143223	2024-05-08 00:53:03.924	2024-05-08 00:53:03.924	Zachary Reese	Z. Reese	Zachary	Reese	Savage	30	76	185	77	6-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5143223.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5143223.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5143223.png"}
3153106	2024-05-08 00:53:03.953	2024-05-08 00:53:03.953	Andrea Lee	A. Lee	Andrea	Lee	KGB	35	66	125	69	13-9-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3153106.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3153106.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3153106.png"}
4046629	2024-05-08 00:53:03.96	2024-05-08 00:53:03.96	Montana De La Rosa	M. De La Rosa	Montana	De La Rosa	\N	29	67	126	68	12-9-1	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4046629.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4046629.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4046629.png"}
4292760	2024-05-08 00:53:04.001	2024-05-08 00:53:04.001	Puja Tomar	P. Tomar	Puja	Tomar	The Cyclone	30	61	115	0	8-4-0	https://a.espncdn.com/i/teamlogos/countries/500/ind.png	\N	{"primary": "#FF9933", "secondary": "#138808"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4292760.png"}
4601333	2024-05-08 00:53:04.007	2024-05-08 00:53:04.007	Rayanne dos Santos	R. dos Santos	Rayanne	dos Santos	\N	28	62	115	62	14-7-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4601333.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4601333.png"}
3068118	2024-05-08 00:53:04.037	2024-05-08 00:53:04.037	Linton Vassell	L. Vassell	Linton	Vassell	Big Swarm	40	76	239	82	23-9-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3068118.png"}
4076780	2024-05-08 00:53:04.041	2024-05-08 00:53:04.041	Valentin Moldavsky	V. Moldavsky	Valentin	Moldavsky	\N	32	73	238	75	13-3-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4076780.png"}
4689226	2024-05-08 00:53:04.075	2024-05-08 00:53:04.075	Chelsea Hackett	C. Hackett	Chelsea	Hackett	Hammer	25	64	125	66	4-2-1	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4689226.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4689226.png"}
4065006	2024-05-08 00:53:04.108	2024-05-08 00:53:04.108	Tyrell Fortune	T. Fortune	Tyrell	Fortune	\N	33	74	245	77	13-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4065006.png"}
3968345	2024-05-08 00:53:04.263	2024-05-08 00:53:04.263	Marcelo Nunes	M. Nunes	Marcelo	Nunes	\N	35	75	241	75	11-2-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3968345.png"}
4205213	2024-05-08 00:53:04.329	2024-05-08 00:53:04.329	Danilo Marques	D. Marques	Danilo	Marques	\N	38	76	248	78	15-5-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4205213.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4205213.png"}
4588192	2024-05-08 00:53:04.334	2024-05-08 00:53:04.334	Gokhan Saricam	G. Saricam	Gokhan	Saricam	\N	33	75	247	76	9-2-0	https://a.espncdn.com/i/teamlogos/countries/500/tur.png	\N	{"primary": "#E30A17", "secondary": "#73DCD0"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4588192.png"}
4842488	2024-05-08 00:53:04.404	2024-05-08 00:53:04.404	Kristina Katsikis	K. Katsikis	Kristina	Katsikis	The Meat Grinder	33	64	125	63	1-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4842488.png"}
5211416	2024-05-08 00:53:04.41	2024-05-08 00:53:04.41	Melissa Balic	M. Balic	Melissa	Balic	Statick	26	67	125	0	0-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5211416.png"}
4408681	2024-05-08 00:53:04.437	2024-05-08 00:53:04.437	Saray Orozco	S. Orozco	Saray	Orozco	Killer Queen	32	65	125	65	0-3-0	https://a.espncdn.com/i/teamlogos/countries/500/mex.png	\N	{"primary": "#006847", "secondary": "#CE1126"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4408681.png"}
4842487	2024-05-08 00:53:04.442	2024-05-08 00:53:04.442	Sumiko Inaba	S. Inaba	Sumiko	Inaba	Lady Samurai	33	64	125	64	6-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4842487.png"}
5127818	2024-05-08 00:53:04.483	2024-05-08 00:53:04.483	Jakob Nedoh	J. Nedoh	Jakob	Nedoh	The Gorilla	27	75	205	73	8-2-0	https://a.espncdn.com/i/teamlogos/countries/500/slo.png	\N	{"primary": "#0F00BF", "secondary": "#D50002"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5127818.png"}
4684470	2024-05-08 00:53:04.667	2024-05-08 00:53:04.667	Anthony Romero	A. Romero	Anthony	Romero	The Genius	27	71	155	70	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/can.png	\N	{"primary": "#FF0000", "secondary": "#000000"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4684470.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4684470.png"}
3156663	2024-05-08 00:53:04.689	2024-05-08 00:53:04.689	Ibragim Chuzhigaev	I. Chuzhigaev	Ibragim	Chuzhigaev	The Million First	32	72	205	74	18-5-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3156663.png"}
4078664	2024-05-08 00:53:04.695	2024-05-08 00:53:04.695	Karl Albrektsson	K. Albrektsson	Karl	Albrektsson	King	30	74	205	75	14-5-0	https://a.espncdn.com/i/teamlogos/countries/500/swe.png	\N	{"primary": "#FECC00", "secondary": "#006AA7"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4078664.png"}
4425611	2024-05-08 00:53:04.746	2024-05-08 00:53:04.746	Ramazan Kuramagomedov	R. Kuramagomedov	Ramazan	Kuramagomedov	\N	27	72	170	73	12-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4425611.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4425611.png"}
4712360	2024-05-08 00:53:04.767	2024-05-08 00:53:04.767	Paul Hughes	P. Hughes	Paul	Hughes	Big News	\N	69	145	0	11-1-0	https://a.espncdn.com/i/teamlogos/countries/500/nir.png	\N	{"primary": "#CC0000", "secondary": "#9E7E1C"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4712360.png"}
4814452	2024-05-08 00:53:04.771	2024-05-08 00:53:04.771	Bobby King	B. King	Bobby	King	\N	40	69	155	70	12-6-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4814452.png"}
3161696	2024-05-08 00:53:04.792	2024-05-08 00:53:04.792	Arlene Blencowe	A. Blencowe	Arlene	Blencowe	Angerfist	41	66	145	64	15-10-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3161696.png"}
4078216	2024-05-08 00:53:04.796	2024-05-08 00:53:04.796	Sinead Kavanagh	S. Kavanagh	Sinead	Kavanagh	KO	38	67	146	68	9-6-0	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4078216.png"}
3896616	2024-05-08 00:53:04.822	2024-05-08 00:53:04.822	Matheus Mattos	M. Mattos	Matheus	Mattos	Adamas	31	65	135	67	14-2-1	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3896616.png"}
5152982	2024-05-08 00:53:04.828	2024-05-08 00:53:04.828	Kasum Kasumov	K. Kasumov	Kasum	Kasumov	\N	29	66	135	66	15-1-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5152982.png"}
4878524	2024-05-08 00:53:04.852	2024-05-08 00:53:04.852	Fabacary Diatta	F. Diatta	Fabacary	Diatta	\N	27	69	145	70	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4878524.png"}
4913833	2024-05-08 00:53:04.859	2024-05-08 00:53:04.859	Nathan Kelly	N. Kelly	Nathan	Kelly	\N	26	68	146	71	10-2-0	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4913833.png"}
4588646	2024-05-08 00:53:04.883	2024-05-08 00:53:04.883	Norbert Novenyi Jr.	N. Novenyi Jr.	Norbert	Novenyi Jr.	Magic	24	72	185	75	7-0-0	https://a.espncdn.com/i/teamlogos/countries/500/hun.png	\N	{"primary": "#CD2A3E", "secondary": "#436F4D"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4588646.png"}
4744150	2024-05-08 00:53:04.888	2024-05-08 00:53:04.888	Dalton Rosta	D. Rosta	Dalton	Rosta	Hercules	28	72	185	74	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4744150.png"}
4916255	2024-05-08 00:53:04.91	2024-05-08 00:53:04.91	Karolina Sobek	K. Sobek	Karolina	Sobek	\N	24	69	145	0	4-2-0	https://a.espncdn.com/i/teamlogos/countries/500/pol.png	\N	{"primary": "#DD143C", "secondary": "#FFFFFF"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4916255.png"}
4916259	2024-05-08 00:53:04.915	2024-05-08 00:53:04.915	Michelle Montague	M. Montague	Michelle	Montague	The Wild One	30	68	145	69	4-0-0	https://a.espncdn.com/i/teamlogos/countries/500/nzl.png	\N	{"primary": "#01237E", "secondary": "#CC142B"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4916259.png"}
3016688	2024-05-08 00:53:04.94	2024-05-08 00:53:04.94	Brian Moore	B. Moore	Brian	Moore	The Pikeman	36	68	145	69	16-10-0	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3016688.png"}
5080560	2024-05-08 00:53:04.948	2024-05-08 00:53:04.948	Francesco Nuzzi	F. Nuzzi	Francesco	Nuzzi	Berserker	27	63	135	69	10-1-0	https://a.espncdn.com/i/teamlogos/countries/500/ita.png	\N	{"primary": "#CD212A", "secondary": "#008C45"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5080560.png"}
5022142	2024-05-08 00:53:04.982	2024-05-08 00:53:04.982	Sarvarjon Khamidov	S. Khamidov	Sarvarjon	Khamidov	Sarvar	27	66	135	68	15-0-0	https://a.espncdn.com/i/teamlogos/countries/500/tjk.png	\N	{"primary": "#CE0F26", "secondary": "#026601"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5022142.png"}
5120295	2024-05-08 00:53:04.988	2024-05-08 00:53:04.988	Marcirley Alves	M. Alves	Marcirley	Alves	Durin	24	64	135	68	12-3-0	https://a.espncdn.com/i/teamlogos/countries/500/bra.png	\N	{"primary": "#FFDF00", "secondary": "#002776"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5120295.png"}
4229422	2024-05-08 00:53:05.018	2024-05-08 00:53:05.018	Olena Kolesnyk	O. Kolesnyk	Olena	Kolesnyk	Cannon	33	69	148	68	9-6-0	https://a.espncdn.com/i/teamlogos/countries/500/ukr.png	\N	{"primary": "#005BBB", "secondary": "#FFD500"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4229422.png"}
5127785	2024-05-08 00:53:05.023	2024-05-08 00:53:05.023	Sara Collins	S. Collins	Sara	Collins	\N	33	67	145	68	5-0-0	https://a.espncdn.com/i/teamlogos/countries/500/aus.png	\N	{"primary": "#00008B", "secondary": "#FF0000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5127785.png"}
4684751	2024-05-08 00:53:05.058	2024-05-08 00:53:05.058	Khamzat Chimaev	K. Chimaev	Khamzat	Chimaev	Borz	30	74	185	75	13-0-0	https://a.espncdn.com/i/teamlogos/countries/500/uae.png	\N	{"primary": "#FF0000", "secondary": "#02732F"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4684751.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4684751.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4684751.png"}
3026011	2024-05-08 00:53:05.16	2024-05-08 00:53:05.16	Kelvin Gastelum	K. Gastelum	Kelvin	Gastelum	\N	32	69	170	71	18-9-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3026011.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3026011.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3026011.png"}
4426312	2024-05-08 00:53:05.167	2024-05-08 00:53:05.167	Daniel Rodriguez	D. Rodriguez	Daniel	Rodriguez	D-Rod	37	73	170	74	17-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4426312.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4426312.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4426312.png"}
4421784	2024-05-08 00:53:05.2	2024-05-08 00:53:05.2	Shara Magomedov	S. Magomedov	Shara	Magomedov	Bullet	29	74	186	73	12-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4421784.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4421784.png"}
4873642	2024-05-08 00:53:05.205	2024-05-08 00:53:05.205	Ihor Potieria	I. Potieria	Ihor	Potieria	Duelist	27	75	185	75	20-6-0	https://a.espncdn.com/i/teamlogos/countries/500/ukr.png	\N	{"primary": "#005BBB", "secondary": "#FFD500"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4873642.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4873642.png"}
3110836	2024-05-08 00:53:05.233	2024-05-08 00:53:05.233	Volkan Oezdemir	V. Oezdemir	Volkan	Oezdemir	No Time	34	74	205	75	19-7-0	https://a.espncdn.com/i/teamlogos/countries/500/sui.png	\N	{"primary": "#D52B1E", "secondary": "#FFFFFF"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3110836.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3110836.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3110836.png"}
2993650	2024-05-08 00:53:05.266	2024-05-08 00:53:05.266	Alexander Volkov	A. Volkov	Alexander	Volkov	Drago	35	79	263	80	37-10-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2993650.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2993650.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2993650.png"}
4217395	2024-05-08 00:53:05.272	2024-05-08 00:53:05.272	Sergei Pavlovich	S. Pavlovich	Sergei	Pavlovich	\N	31	75	259	84	18-2-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4217395.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4217395.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4217395.png"}
3009725	2024-05-08 00:53:05.364	2024-05-08 00:53:05.364	Brendan Loughnane	B. Loughnane	Brendan	Loughnane	\N	34	69	145	71	28-5-0	https://a.espncdn.com/i/teamlogos/countries/500/eng.png	\N	{"primary": "#CE1124", "secondary": "#001CC3"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3009725.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3009725.png"}
4423425	2024-05-08 00:53:05.368	2024-05-08 00:53:05.368	Justin Gonzales	J. Gonzales	Justin	Gonzales	J-Train	33	69	145	72	14-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4423425.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4423425.png"}
4399701	2024-05-08 00:53:05.399	2024-05-08 00:53:05.399	Laureano Staropoli	L. Staropoli	Laureano	Staropoli	Pepi	31	73	185	71	13-6-0	https://a.espncdn.com/i/teamlogos/countries/500/arg.png	\N	{"primary": "#74ACDF", "secondary": "#F6B40E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4399701.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4399701.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4399701.png"}
2556793	2024-05-08 00:53:05.497	2024-05-08 00:53:05.497	Lorenz Larkin	L. Larkin	Lorenz	Larkin	The Monsoon	37	71	171	72	25-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2556793.png"}
4894428	2024-05-08 00:53:05.563	2024-05-08 00:53:05.563	Timur Khizriev	T. Khizriev	Timur	Khizriev	Imam	28	69	146	68	15-0-0	https://a.espncdn.com/i/teamlogos/countries/500/rus.png	\N	{"primary": "#D00B0E", "secondary": "#0039A6"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4894428.png"}
5120973	2024-05-08 00:53:05.75	2024-05-08 00:53:05.75	Jose Perez	J. Perez	Jose	Perez	\N	29	70	145	0	8-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5120973.png"}
3004926	2024-05-08 00:53:05.786	2024-05-08 00:53:05.786	Zach Juusola	Z. Juusola	Zach	Juusola	The Juice	36	72	170	74	14-9-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3004926.png"}
3084476	2024-05-08 00:53:05.792	2024-05-08 00:53:05.792	Luca Poclit	L. Poclit	Luca	Poclit	\N	34	72	170	73	9-1-0	https://a.espncdn.com/i/teamlogos/countries/500/esp.png	\N	{"primary": "#AA151B", "secondary": "#F1BF00"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3084476.png"}
4833637	2024-05-08 00:53:05.846	2024-05-08 00:53:05.846	Isaiah Hokit	I. Hokit	Isaiah	Hokit	The Central Valley Gangster	28	70	145	69	3-1-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4833637.png"}
5150515	2024-05-08 00:53:05.855	2024-05-08 00:53:05.855	Jordan Oliver	J. Oliver	Jordan	Oliver	That Dude	34	66	145	70	1-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5150515.png"}
2504988	2024-05-08 00:53:05.907	2024-05-08 00:53:05.907	Michael Chandler	M. Chandler	Michael	Chandler	Iron	38	68	156	71	23-8-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2504988.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2504988.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2504988.png"}
3022677	2024-05-08 00:53:05.914	2024-05-08 00:53:05.914	Conor McGregor	C. McGregor	Conor	McGregor	The Notorious	35	69	156	74	22-6-0	https://a.espncdn.com/i/teamlogos/countries/500/irl.png	\N	{"primary": "#169B62", "secondary": "#FF883E"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3022677.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3022677.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3022677.png"}
4028627	2024-05-08 00:53:06.086	2024-05-08 00:53:06.086	Khalil Rountree Jr.	K. Rountree Jr.	Khalil	Rountree Jr.	The War Horse	34	73	204	76	14-5-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4028627.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4028627.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4028627.png"}
4425355	2024-05-08 00:53:06.09	2024-05-08 00:53:06.09	Jamahal Hill	J. Hill	Jamahal	Hill	Sweet Dreams	32	76	205	79	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4425355.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4425355.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4425355.png"}
4334306	2024-05-08 00:53:06.152	2024-05-08 00:53:06.152	Macy Chiasson	M. Chiasson	Macy	Chiasson	\N	32	71	135	72	10-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4334306.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4334306.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4334306.png"}
2354087	2024-05-08 00:53:06.181	2024-05-08 00:53:06.181	Cub Swanson	C. Swanson	Cub	Swanson	\N	40	68	146	70	29-13-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2354087.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2354087.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2354087.png"}
3074464	2024-05-08 00:53:06.184	2024-05-08 00:53:06.184	Andre Fili	A. Fili	Andre	Fili	Touchy	33	71	146	74	23-11-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3074464.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3074464.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3074464.png"}
2951504	2024-05-08 00:53:06.233	2024-05-08 00:53:06.233	Michelle Waterson-Gomez	M. Waterson-Gomez	Michelle	Waterson-Gomez	The Karate Hottie	38	63	115	62	18-12-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/2951504.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/2951504.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2951504.png"}
3249894	2024-05-08 00:53:06.264	2024-05-08 00:53:06.264	Carlos Hernandez	C. Hernandez	Carlos	Hernandez	\N	30	68	125	67	9-3-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/3249894.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/3249894.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/3249894.png"}
5137012	2024-05-08 00:53:06.269	2024-05-08 00:53:06.269	Rei Tsuruya	R. Tsuruya	Rei	Tsuruya	\N	21	66	125	68	9-0-0	https://a.espncdn.com/i/teamlogos/countries/500/jpn.png	\N	{"primary": "#B00010", "secondary": "#000000"}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5137012.png"}
5144008	2024-05-08 00:53:06.288	2024-05-08 00:53:06.288	Payton Talbott	P. Talbott	Payton	Talbott	\N	25	70	136	70	8-0-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/5144008.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5144008.png"}
5152931	2024-05-08 00:53:06.293	2024-05-08 00:53:06.293	Yanis Ghemmouri	Y. Ghemmouri	Yanis	Ghemmouri	The Desert Warrior	29	69	146	69	12-2-0	https://a.espncdn.com/i/teamlogos/countries/500/fra.png	\N	{"primary": "#0055A4", "secondary": "#EF4135"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/right/5152931.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/5152931.png"}
4294504	2024-05-08 00:53:06.417	2024-05-08 00:53:06.417	Cory Sandhagen	C. Sandhagen	Cory	Sandhagen	\N	32	71	140	70	17-4-0	https://a.espncdn.com/i/teamlogos/countries/500/usa.png	\N	{"primary": "#3C3B6E", "secondary": "#B22234"}	{"left": "https://a.espncdn.com/i/headshots/mma/players/stance/left/4294504.png", "right": "https://a.espncdn.com/i/headshots/mma/players/stance/right/4294504.png", "profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/4294504.png"}
2431356	2024-05-08 00:53:06.787	2024-05-08 00:53:06.787	TBA	O. TBA	Opponent	TBA	\N	\N	0	0	0	\N	https://www.espn.com/i/teamlogos/countries/500/blank.png	\N	{}	{"profil": "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2431356.png"}
\.


--
-- Data for Name: FightsOnFighters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FightsOnFighters" (id, "fightId", "fighterId") FROM stdin;
clvx3umzf0003cxyjux7jl0hf	401617808	5105154
clvx3umzl0005cxyj6guc32l8	401617808	5119017
clvx3un0a000acxyj7aserb82	401617081	4801479
clvx3un0c000ccxyjxi4msna4	401617081	4907790
clvx3un0z000hcxyjinm2y00b	401617809	4581351
clvx3un11000jcxyjbwhsnwmh	401617809	5146877
clvx3un1l000ocxyjc0mgp20r	401626879	4714416
clvx3un1o000qcxyjsdbg5jt9	401626879	5195117
clvx3un2l000vcxyjnuggyze1	401631439	4610021
clvx3un2o000xcxyjmmhk83ao	401631439	5077056
clvx3un3b0012cxyj927qa9aq	401631440	3944331
clvx3un3e0014cxyjxgsxm7u4	401631440	5138563
clvx3un4n0019cxyj5n2ivuoe	401613930	3146944
clvx3un4q001bcxyjpz0hzlr0	401613930	4273399
clvx3un8a001kcxyjiwrs2ftj	401616185	2335718
clvx3un8d001mcxyj3o4uzzsa	401616185	3032218
clvx3unc7001vcxyjcsviw338	401616187	3922491
clvx3uncb001xcxyjzrngxu9k	401616187	4410868
clvx3unh50026cxyjz16gsk49	401613931	3913473
clvx3unh70028cxyjla0d5sc7	401613931	5077131
clvx3unjz002hcxyj8c2zh3o0	401616188	2354269
clvx3unk2002jcxyjxfvsuphg	401616188	4903365
clvx3unnu002scxyjc5nhm9dk	401624039	4038105
clvx3unnw002ucxyjy1n251pc	401624039	4688408
clvx3unqg0033cxyjxmml6kn7	401616190	4393818
clvx3unqi0035cxyj39m7zaam	401616190	4895760
clvx3unsz003ecxyj3b36zvj7	401616192	3151934
clvx3unt3003gcxyjataqbgt4	401616192	5016786
clvx3unvx003pcxyj40nbwads	401624040	4305514
clvx3unw2003rcxyjpytgovgl	401624040	5145766
clvx3unzf0040cxyjbeovc2zo	401618480	3897242
clvx3unzi0042cxyj07a5m0fe	401618480	5144007
clvx3uo2y004bcxyjax2idg8r	401623977	4916248
clvx3uo31004dcxyjqy7ya7od	401623977	5120301
clvx3uo5r004mcxyjwgoq75im	401641362	4334401
clvx3uo5t004ocxyjji1wgb4o	401641362	5080648
clvx3uo6f004tcxyj6w7hms35	401641363	3152443
clvx3uo6h004vcxyjhvvkid8q	401641363	4580867
clvx3uo700050cxyj7h3d25e8	401641364	3728368
clvx3uo720052cxyjgvt8btgn	401641364	5143190
clvx3uo7k0057cxyj6evh5ns8	401641365	5031199
clvx3uo7m0059cxyjboepl4vt	401641365	5143886
clvx3uo8l005ecxyjjmrxurtf	401612908	3093653
clvx3uo8n005gcxyjlmpn1zai	401612908	3166126
clvx3uoax005pcxyj1z9wgrzn	401613219	2995167
clvx3uob4005rcxyjp72hlfa2	401613219	4371001
clvx3uodn0060cxyjp6z01byt	401613159	3001914
clvx3uodq0062cxyjiblkxk2g	401613159	3165120
clvx3uogr006bcxyjo56x7yjp	401613160	2984770
clvx3uogt006dcxyjm90jrzjt	401613160	4415883
clvx3uokg006mcxyjkf9zejb7	401613440	3902098
clvx3uokj006ocxyjf74hyy5c	401613440	4029275
clvx3uooo006xcxyjp1wquhkm	401613442	4350871
clvx3uoor006zcxyjmtcr8rw5	401613442	4686270
clvx3uost0078cxyj2w3mzjlj	401612909	4421978
clvx3uosw007acxyjv8s6esp6	401612909	4566991
clvx3uovm007jcxyjwdlqeqhl	401613161	5146229
clvx3uovo007lcxyjrp2ltgxb	401613161	5152409
clvx3uozd007ucxyj9msyt1ik	401613762	4089026
clvx3uozj007wcxyjgd62mtqc	401613762	4227055
clvx3up4i0085cxyjczrtqg43	401613763	4880807
clvx3up4n0087cxyjbgg42ptg	401613763	5088916
clvx3up95008gcxyj20xwzyz4	401614939	4277049
clvx3up99008icxyj4cmeew6q	401614939	4835135
clvx3upde008rcxyjsosuhnjx	401613764	2989380
clvx3updh008tcxyjuz2wy2dr	401613764	3153250
clvx3uphm0092cxyjw2ayntw6	401636419	4570799
clvx3uphp0094cxyj1mvp7pxz	401636419	4691323
clvx3upie0099cxyjd1yo7xz1	401636420	4693162
clvx3upii009bcxyj1y7kghtq	401636420	5138111
clvx3upje009gcxyj6b44zmeu	401616699	2354244
clvx3upjh009icxyjhry03h6t	401616699	2617539
clvx3upk6009ncxyjltwlyxmq	401618460	3943550
clvx3upk9009pcxyj1d6aczto	401618460	4197779
clvx3upky009ucxyjqzpnq3in	401624932	4421752
clvx3upl0009wcxyjyal5jc0v	401624932	4788951
clvx3uplk00a1cxyjbjsesfif	401624933	4046614
clvx3uplm00a3cxyjpnnqgajm	401624933	4280293
clvx3upm700a8cxyjcd3t4w05	401624934	4385252
clvx3upmd00aacxyjqltj8rtq	401624934	5194556
clvx3upmy00afcxyjd4jri9um	401624935	4239519
clvx3upn000ahcxyjrd3gh8cd	401624935	4409575
clvx3upo900amcxyjjz2dm50b	401616899	4411508
clvx3upod00aocxyjamg98bbs	401616899	4690539
clvx3uprl00axcxyjw7n9vhyu	401619043	2951202
clvx3upro00azcxyjbf3q84r9	401619043	3028863
clvx3upv200b8cxyj2rlzj79z	401628310	3132513
clvx3upv400bacxyjjtsuif7x	401628310	3960071
clvx3upxj00bjcxyji87n04v7	401619050	4054605
clvx3upxl00blcxyjx8dl59k7	401619050	4379362
clvx3uq0800bucxyji4n1ftaw	401619049	4045420
clvx3uq0a00bwcxyjpm0m8ey9	401619049	4426130
clvx3uq2z00c5cxyjms560cew	401619048	4375574
clvx3uq3200c7cxyj3q3bszkv	401619048	4416297
clvx3uq5x00cgcxyj8k9akduw	401617805	3977987
clvx3uq6200cicxyj7eza8knr	401617805	4200455
clvx3uq9g00crcxyj8jvqsgmu	401630114	4375156
clvx3uq9j00ctcxyj3v8pfdkb	401630114	5141967
clvx3uqdh00d2cxyj3620i6gz	401630113	4914568
clvx3uqdl00d4cxyjmdf5al7b	401630113	4963269
clvx3uqi400ddcxyjukwwbgmw	401617807	5068724
clvx3uqi800dfcxyjq9fkzwp3	401617807	5080936
clvx3uqm700docxyjadsc0lsh	401619052	3157454
clvx3uqma00dqcxyjtyj5j5vp	401619052	4372194
clvx3uqqn00dzcxyjx08jvjb1	401619053	4690546
clvx3uqqr00e1cxyjo2vx11ce	401619053	5157668
clvx3uquu00eacxyjp4qz7t8i	401619054	4565641
clvx3uqux00eccxyjk7gu6ka1	401619054	4869702
clvx3uqze00elcxyjx5njcs6w	401641360	3027538
clvx3uqzi00encxyjux6s5bm8	401641360	4424219
clvx3ur0i00escxyj4kxavonw	401641361	5120918
clvx3ur0q00eucxyjidu4ju1z	401641361	5200305
clvx3ur1s00ezcxyjygxk0wrw	401658318	5211221
clvx3ur1x00f1cxyj7okjhc4n	401658318	5211352
clvx3ur3p00f6cxyjyx0t53wd	401615559	3074102
clvx3ur3t00f8cxyjlov04vao	401615559	4684135
clvx3ur8e00fhcxyj9ubnuf0p	401636105	3074464
clvx3ur8i00fjcxyjh7cconsr	401636105	4074001
clvx3urcw00fscxyj2wynj00i	401638479	4341572
clvx3urd000fucxyj883m824x	401638479	4873642
clvx3urhg00g3cxyjkr66k3nq	401620731	2504643
clvx3urhk00g5cxyj77raguiw	401620731	4690541
clvx3urka00gecxyjca1io7z2	401620733	2488476
clvx3urkd00ggcxyjasy8zp2f	401620733	4358252
clvx3urmr00gpcxyjvw1d3wgu	401620734	4426250
clvx3urmu00grcxyjj7fitvis	401620734	4894791
clvx3urpc00h0cxyjbs6hh1mr	401620735	4024732
clvx3urpf00h2cxyjewxqvduz	401620735	4294832
clvx3ursy00hbcxyjw21eyxui	401638739	5123311
clvx3urt000hdcxyjy8dkomld	401638739	5145682
clvx3urv900hmcxyjcc397dse	401615560	4292347
clvx3urvb00hocxyjhk3svup1	401615560	4394200
clvx3urxq00hxcxyjnj9t5vxx	401620760	3971496
clvx3urxt00hzcxyje4u7qg97	401620760	3998068
clvx3us0p00i8cxyjsyfhguwe	401620736	3040385
clvx3us0t00iacxyjl10gq96d	401620736	3970873
clvx3us4800ijcxyj7kaw61j6	401620738	4896541
clvx3us4b00ilcxyj1x8x57hk	401620738	5152109
clvx3us7w00iucxyj373anejc	401638740	4880596
clvx3us8400iwcxyjmxabs0vw	401638740	5027356
clvx3uscb00j5cxyjorkdbvit	401620759	4389085
clvx3uscj00j7cxyjffta7iel	401620759	5088886
clvx3usgj00jgcxyj0zhz53ek	401641343	3893071
clvx3usgn00jicxyj2mngj5h3	401641343	5105155
clvx3ushx00jncxyjp37yq45w	401641344	4031353
clvx3usi100jpcxyjh5keirp1	401641344	5173846
clvx3usjr00jucxyjyidr84wy	401612970	3949584
clvx3usjy00jwcxyjhzwa8t4n	401612970	4350812
clvx3usq800k5cxyjedpbvz2e	401622060	3009717
clvx3usqd00k7cxyjj0yr1qyj	401622060	4080826
clvx3usvo00kgcxyje8qrzlrs	401622064	3111997
clvx3usvt00kicxyjx0xjzu4k	401622064	4738092
clvx3ut1f00krcxyj00kkgl5p	401618438	3023388
clvx3ut1l00ktcxyjbk8rreeq	401618438	3948572
clvx3ut8000l2cxyjn9gf6glw	401636439	4290956
clvx3ut8500l4cxyju3ljpu9u	401636439	4300149
clvx3utei00ldcxyjrxssu1jb	401632998	4021217
clvx3utem00lfcxyj25f0o5eg	401632998	4233196
clvx3utkj00locxyjzq01cqpd	401640699	2558075
clvx3utkq00lqcxyjlatp1t7s	401640699	5122234
clvx3utr200lzcxyju43k9myo	401628313	4684059
clvx3utr700m1cxyjf18gpxmg	401628313	5068624
clvx3utwt00macxyjynnohf7f	401618442	4379328
clvx3utwy00mccxyj3urhjgwb	401618442	4845284
clvx3uu0100mlcxyjgrknkbhm	401631983	4788300
clvx3uu0300mncxyj0hcguhlv	401631983	5152138
clvx3uu2j00mwcxyj5ksecl7e	401628312	4900808
clvx3uu2l00mycxyj1vr6g5fo	401628312	4926991
clvx3uu5100n7cxyjvagwr2rk	401612972	3153106
clvx3uu5300n9cxyjh01gcfdw	401612972	4065598
clvx3uu8g00nicxyjlwurlava	401643257	2512984
clvx3uu8i00nkcxyj7y87raht	401643257	3020395
clvx3uu9200npcxyjiu9jdtbx	401643258	3961957
clvx3uu9400nrcxyjkaf2qgi0	401643258	4419470
clvx3uu9k00nwcxyj60aqyfdy	401643259	5193167
clvx3uu9m00nycxyjlkan8czm	401643259	5202209
clvx3uua400o3cxyjfqoidl93	401647376	4565646
clvx3uuac00o5cxyjfw8ixjil	401647376	5131950
clvx3uuav00oacxyj7tqlxe6j	401645306	4371905
clvx3uuax00occxyjv53cmiae	401645306	4565904
clvx3uubh00ohcxyjnfn7js6m	401645307	4039836
clvx3uubk00ojcxyjk9m30zmj	401645307	4378414
clvx3uuc600oocxyjodj7ydbm	401656121	4410700
clvx3uuc800oqcxyjp4iqp0xu	401656121	5011094
clvx3uucx00ovcxyj6kvag7pg	401631970	2335530
clvx3uud000oxcxyjhz9uptz9	401631970	4408708
clvx3uue400p6cxyj2dwckcdk	401631971	4573208
clvx3uue600p8cxyjbl7mq12m	401631971	4697390
clvx3uuf800phcxyjfewta8to	401631972	3120931
clvx3uufb00pjcxyj2urbtedp	401631972	4339208
clvx3uugf00pscxyj8lca622b	401631974	3949930
clvx3uugj00pucxyjed5kxvwg	401631974	3955014
clvx3uuhu00q3cxyjhw527ezq	401631975	2569939
clvx3uuhx00q5cxyje81rgcoq	401631975	3045798
clvx3uujj00qecxyj3d4jzscd	401631976	2984772
clvx3uujn00qgcxyjj9er608y	401631976	3821379
clvx3uuku00qpcxyjqp1w94dz	401631977	3892809
clvx3uuky00qrcxyjfb0t7tdu	401631977	4199009
clvx3uulu00qwcxyjjfuq3r5g	401631978	5103717
clvx3uuly00qycxyjyuqrvf38	401631978	5195884
clvx3uun600r7cxyju8qrtbbl	401631979	3031588
clvx3uuna00r9cxyjrkazd5hc	401631979	4708687
clvx3uupe00ricxyjweyx3mdz	401631980	5123585
clvx3uupi00rkcxyjqzjmrv8a	401631980	5195513
clvx3uur900rtcxyj7nrivezy	401630119	3027545
clvx3uurd00rvcxyjxf0r66xg	401630119	4239928
clvx3uuvp00s4cxyjm4fckpma	401622062	3045737
clvx3uuvt00s6cxyjd9a1wedr	401622062	3155420
clvx3uv1100sfcxyjmgfrcxaz	401630559	4863327
clvx3uv1900shcxyj0lmczz3t	401630559	5123216
clvx3uv5w00sqcxyjj5hju6s7	401624930	4348673
clvx3uv6100sscxyjafst7wop	401624930	5063403
clvx3uval00t1cxyjyroy0h4g	401625759	4867356
clvx3uvap00t3cxyj6foifxro	401625759	4896616
clvx3uve400tccxyj2agbcn7v	401630118	3075570
clvx3uve600tecxyjeb8b1oym	401630118	4884868
clvx3uvgm00tncxyj70unyf0s	401625319	5074274
clvx3uvgo00tpcxyjf0it74ug	401625319	5088891
clvx3uvj600tycxyjds1h36bt	401623299	4895772
clvx3uvj800u0cxyjvsrad2f6	401623299	5076027
clvx3uvk800u9cxyj048i4lhs	401632039	4070701
clvx3uvka00ubcxyj9qaq6swi	401632039	4083018
clvx3uvna00ukcxyj8i2yw4nm	401628005	4685888
clvx3uvnd00umcxyjry3jm9re	401628005	4713086
clvx3uvqb00uvcxyjoas2p9kv	401619306	4713584
clvx3uvqd00uxcxyjs8gbheqn	401619306	5143333
clvx3uvsw00v6cxyjddeezw3x	401632040	4690540
clvx3uvsy00v8cxyjc4qu3rz4	401632040	5075335
clvx3uvvc00vhcxyj4ptxvtpf	401623219	4423880
clvx3uvve00vjcxyjfkmvvbzj	401623219	4566264
clvx3uvw100vocxyj7e92f29p	401624931	3895524
clvx3uvw300vqcxyj4crxa810	401624931	4420538
clvx3uvwq00vvcxyj5retfcx7	401617839	4036094
clvx3uvwx00vxcxyjmp8cqn0k	401617839	4054997
clvx3uvxl00w2cxyj1b1bvakc	401617840	4076779
clvx3uvxn00w4cxyj4wkdwlp4	401617840	4230824
clvx3uvy900w9cxyjolfms0pr	401641345	4251381
clvx3uvyc00wbcxyjw224s9wh	401641345	5194556
clvx3uvzl00wgcxyjkj6rlavq	401636111	4410084
clvx3uvzo00wicxyjcnkx3vt8	401636111	5145498
clvx3uw3500wrcxyj482dfp7g	401636112	4071969
clvx3uw3800wtcxyjitzeosjb	401636112	5060483
clvx3uw6z00x2cxyjgyk00rk0	401638480	3155425
clvx3uw7300x4cxyjdw5ihb60	401638480	4905261
clvx3uwbb00xdcxyjkelnabq0	401639776	4569549
clvx3uwbf00xfcxyjort6mefw	401639776	5196459
clvx3uwfp00xocxyjcbwe4ikv	401638239	2994349
clvx3uwft00xqcxyj69rd8j10	401638239	4997217
clvx3uwkn00xzcxyjclfxnz8b	401639775	4082125
clvx3uwkr00y1cxyjtdwetbqf	401639775	4237148
clvx3uwpo00yacxyj1udo0gz4	401643236	4884877
clvx3uwps00yccxyjo5xanrue	401643236	5080883
clvx3uwva00ylcxyji2i7gu2r	401638484	4079149
clvx3uwvf00yncxyj8es2vrr9	401638484	4867357
clvx3ux1f00ywcxyjdxbxzz1z	401638482	4848674
clvx3ux1n00yycxyjex4z8zia	401638482	5074126
clvx3ux5x00z7cxyjwk9trt1z	401643237	4193694
clvx3ux6300z9cxyjyoshr9s0	401643237	4685730
clvx3uxah00zicxyjk35zghv1	401639777	4419434
clvx3uxal00zkcxyj33fsnghp	401639777	4695485
clvx3uxc500ztcxyj3yjhbsdn	401649537	4826633
clvx3uxc900zvcxyjlhxmfv0k	401649537	5207722
clvx3uxd70100cxyj9vgq3vzv	401648938	4081147
clvx3uxdb0102cxyjrvblxntl	401648938	5206516
clvx3uxei0107cxyj68jzec1f	401648939	4878555
clvx3uxep0109cxyj1itvtiwu	401648939	5125014
clvx3uxft010ecxyjt3l7gtkz	401648940	4704451
clvx3uxfw010gcxyj15e4jpd2	401648940	4944080
clvx3uxgz010lcxyj57q0qtsy	401648941	4629138
clvx3uxh3010ncxyjyz302xyg	401648941	4976728
clvx3uxj0010scxyjo9gtan3h	401612973	3155424
clvx3uxj4010ucxyjwf7q1mf0	401612973	4205093
clvx3uxnj0113cxyjth3n5op7	401626639	2506549
clvx3uxnn0115cxyjy540h7v7	401626639	4895362
clvx3uxrv011ecxyjbo31z4pr	401619340	3022067
clvx3uxrz011gcxyjehnbvu8w	401619340	3943695
clvx3uxva011pcxyjm6yf22rr	401619341	3090197
clvx3uxvc011rcxyjiim7aspv	401619341	4828707
clvx3uxxr0120cxyj6ewtvy3g	401619342	3151289
clvx3uxxt0122cxyj10pwox4f	401619342	4293517
clvx3uy07012bcxyj0vftb3xl	401618435	3922557
clvx3uy08012dcxyjydc1qs7r	401618435	4873640
clvx3uy2m012mcxyjhi9n2jm6	401618434	4026490
clvx3uy2n012ocxyjkgonkab2	401618434	4246307
clvx3uy5e012xcxyj4xklji5z	401618436	2335687
clvx3uy5h012zcxyjehmvdcwh	401618436	3068125
clvx3uy8j0138cxyjmhurn6j8	401618437	3045734
clvx3uy8m013acxyjxn7je1n6	401618437	4237015
clvx3uybw013jcxyjl92wfyq1	401640420	2959588
clvx3uybz013lcxyj53vj0tzh	401640420	3994033
clvx3uyg8013ucxyjjzxh5vui	401628004	4012999
clvx3uyga013wcxyj1cu2sqa8	401628004	4418962
clvx3uyif0145cxyjxdicbmul	401628003	4276994
clvx3uyih0147cxyje2a0zi85	401628003	5189560
clvx3uykw014gcxyj8jnqa9z5	401612975	4294926
clvx3uyky014icxyj889ek7ax	401612975	4396359
clvx3uynk014rcxyjsagtq5ll	401635439	3028064
clvx3uynm014tcxyje6dgnfcu	401635439	3281606
clvx3uyqf0152cxyj6676nys4	401649539	4349719
clvx3uyqi0154cxyjr26g9phy	401649539	4916607
clvx3uyr70159cxyjagkq3ah1	401649540	4893010
clvx3uyr9015bcxyj4rxm06lf	401649540	5099723
clvx3uys3015gcxyjzz41zl1i	401649541	4848704
clvx3uys6015icxyjbddiuw71	401649541	5207724
clvx3uyt6015ncxyj82fo70rd	401654042	4371005
clvx3uyt9015pcxyjh1qec5qf	401654042	5007637
clvx3uyu4015ucxyj91ew04p9	401654043	2560723
clvx3uyu8015wcxyjumscnxem	401654043	5149924
clvx3uyv70161cxyj9rwjl59o	401649542	4030249
clvx3uyvb0163cxyjt8ffn5h4	401649542	5121867
clvx3uyw50168cxyj5ocylan0	401649543	4295251
clvx3uywb016acxyjtgel7yb8	401649543	5146696
clvx3uyxh016fcxyjlk7s3ig4	401649544	4709157
clvx3uyxr016hcxyjau44sjl5	401649544	4763836
clvx3uyz0016mcxyjxbrfnv18	401630739	3093559
clvx3uyz3016ocxyjnmh8almu	401630739	3722422
clvx3uz2s016xcxyj5pv621qn	401634801	4815998
clvx3uz2v016zcxyj2whyl86z	401634801	4875506
clvx3uz6x0178cxyjazo6878h	401634774	2500735
clvx3uz70017acxyjjtr09cml	401634774	4245094
clvx3uz9p017jcxyjnqf8zs5a	401634778	4875511
clvx3uz9r017lcxyjo568ami5	401634778	4918083
clvx3uzc3017ucxyjr9nh8mgp	401630740	3104720
clvx3uzc5017wcxyjmamxsk6r	401630740	4334306
clvx3uzef0185cxyjf3r8opin	401634799	2553261
clvx3uzeh0187cxyjh6nd5smu	401634799	3111927
clvx3uzgt018gcxyj5ajy70hs	401634775	4339145
clvx3uzgv018icxyjbasyhyx9	401634775	4702563
clvx3uzja018rcxyjr62ic7gb	401634800	4319785
clvx3uzjc018tcxyj89vjcjsi	401634800	4801267
clvx3uzma0192cxyjmlb1uoyg	401634802	3896934
clvx3uzmc0194cxyj4m931il9	401634802	4424224
clvx3uzow019dcxyjofv9gn8r	401634776	4616087
clvx3uzoz019fcxyjwwkedbvt	401634776	4702589
clvx3uzs2019ocxyj7ppme5yp	401634803	4565671
clvx3uzs5019qcxyjxa47khee	401634803	4901883
clvx3uzvk019zcxyj5h74fdg0	401646556	3955778
clvx3uzvn01a1cxyjp3gyvrv2	401646556	4816283
clvx3uzzo01aacxyj2xdbzy5s	401634804	4816062
clvx3uzzs01accxyjo4mzyb8j	401634804	4878592
clvx3v04a01alcxyj5u78fh2f	401638363	3112020
clvx3v04f01ancxyjsz2rzlp1	401638363	3950364
clvx3v05n01awcxyj8qvoximt	401643876	2532870
clvx3v05s01aycxyjj6817r0l	401643876	4034830
clvx3v07f01b7cxyjjh1ubkcp	401639768	4255574
clvx3v07j01b9cxyjy246adks	401639768	4341543
clvx3v09001bicxyjqehlhrxz	401639770	3109287
clvx3v09401bkcxyj2330es8x	401639770	5085291
clvx3v0aa01btcxyjmuiw68dk	401639769	3028866
clvx3v0ae01bvcxyjnnrvzav3	401639769	4024128
clvx3v0bu01c4cxyjmujhbjin	401639771	4881912
clvx3v0bx01c6cxyjf0ipuh41	401639771	5088781
clvx3v0d201cfcxyjjhgc5pm2	401639774	3049739
clvx3v0d901chcxyjdgx0aiwe	401639774	5080573
clvx3v0e401cmcxyjldaobxwq	401643878	4703598
clvx3v0e701cocxyjphudwk6k	401643878	4875324
clvx3v0f901cxcxyjg8u3dnsn	401639773	4913833
clvx3v0fc01czcxyjqva9t6ks	401639773	5124793
clvx3v0gr01d8cxyjudakrr5d	401639772	4820893
clvx3v0gu01dacxyjc1kl61wa	401639772	5137436
clvx3v0i401djcxyjm7mydqrc	401652536	3120446
clvx3v0i801dlcxyjcvsjlrzl	401652536	4896556
clvx3v0j601dqcxyj203zkufc	401652537	4969974
clvx3v0jb01dscxyjtntj1sar	401652537	5014675
clvx3v0l301dxcxyjfscg6ire	401630741	3032973
clvx3v0lb01dzcxyj5dkexsmz	401630741	4221863
clvx3v0rc01e8cxyjr1n9egb0	401647483	4566145
clvx3v0rj01eacxyjk9a9c892	401647483	4915907
clvx3v0tz01ejcxyjusdg9doz	401647484	4354318
clvx3v0u301elcxyj8tgkm0nd	401647484	4374436
clvx3v10r01eucxyj7r8fiu53	401637515	5077399
clvx3v10y01ewcxyjvuhme3hg	401637515	5144008
clvx3v16p01f5cxyj6a8506ql	401648336	3900088
clvx3v16w01f7cxyj1g4t2p4z	401648336	4351319
clvx3v1ck01fgcxyjjn0729eh	401637045	4239738
clvx3v1d401ficxyj208l6tw3	401637045	5144312
clvx3v1hq01frcxyjhhj6z1uc	401637041	3019246
clvx3v1hs01ftcxyjhcabhxv7	401637041	4294378
clvx3v1k801g2cxyjlzfnf3vs	401637042	3571515
clvx3v1ka01g4cxyjka2s691b	401637042	3955577
clvx3v1mu01gdcxyjztpukcuq	401647485	2591306
clvx3v1mx01gfcxyj6wn34t6q	401647485	4010864
clvx3v1pn01gocxyj2jksrq6j	401636107	4426305
clvx3v1pq01gqcxyj4ryete7y	401636107	5093447
clvx3v1sl01gzcxyjmnvh1hq6	401630742	4894780
clvx3v1so01h1cxyjhw05b9jm	401630742	5093484
clvx3v1ty01hacxyj1yijqa43	401640423	5145496
clvx3v1u001hccxyjktd9uv5x	401640423	5157669
clvx3v1x801hlcxyjfx1w49j4	401637040	2312150
clvx3v1xb01hncxyjz0l2dwmf	401637040	5060505
clvx3v20w01hwcxyjv7ej1cgq	401654004	2558487
clvx3v20z01hycxyjzo84yyfx	401654004	4257695
clvx3v21t01i3cxyjaa85mtnj	401652816	4424478
clvx3v21w01i5cxyjmed1kvn0	401652816	5172392
clvx3v22m01iacxyjyg6mcskk	401652817	5092208
clvx3v22p01iccxyj4h113p6j	401652817	5129084
clvx3v23l01ihcxyjaak6i302	401653759	4375231
clvx3v23o01ijcxyjl9lc6945	401653759	4712353
clvx3v24i01iocxyjtxmexrj9	401653760	5147737
clvx3v24u01iqcxyjri0wdb3p	401653760	5147739
clvx3v25n01ivcxyjh5ysxkgc	401653761	4584163
clvx3v25r01ixcxyjekjy6uq0	401653761	4848673
clvx3v26q01j2cxyj457q9z5y	401653762	2499867
clvx3v26w01j4cxyjmvmgz2d9	401653762	4064854
clvx3v28n01j9cxyj5r1b8da7	401622059	4350796
clvx3v28s01jbcxyjkv2hq3x7	401622059	4608674
clvx3v2di01jkcxyjtlxtv6vt	401641171	3045887
clvx3v2dm01jmcxyjlmpnzcd1	401641171	4024714
clvx3v2i401jvcxyjq3kirroe	401619308	2553993
clvx3v2i801jxcxyj29g9942z	401619308	4333158
clvx3v2me01k6cxyj0ko92a9w	401641172	4422103
clvx3v2mi01k8cxyjlu4wp36l	401641172	5060467
clvx3v2qw01khcxyjk4ecsqtz	401641169	4076472
clvx3v2r001kjcxyj63w5vcdq	401641169	4408436
clvx3v2vc01kscxyji4xde3oe	401634320	2959422
clvx3v2vg01kucxyj5dyx4wtd	401634320	4078243
clvx3v2zn01l3cxyjusg24wig	401647486	3821549
clvx3v2zr01l5cxyjczgogege	401647486	3915502
clvx3v33h01lecxyjqryh4ueo	401637620	4289516
clvx3v33o01lgcxyjf3ty6ult	401637620	4700617
clvx3v36601lpcxyjp7tq6fk1	401636219	3089633
clvx3v36901lrcxyj1rzfu2wo	401636219	4227122
clvx3v38m01m0cxyjbnd0xnnz	401641174	4686735
clvx3v38o01m2cxyjhy78k52j	401641174	5044438
clvx3v3ax01mbcxyjuc2bfkgw	401636108	4684240
clvx3v3az01mdcxyjpuspm2rg	401636108	4875513
clvx3v3dc01mmcxyjv5ek0a32	401639419	4687434
clvx3v3de01mocxyj0lm6ubx0	401639419	4697476
clvx3v3fw01mxcxyj920rx0m4	401634319	4893608
clvx3v3fy01mzcxyjp95xr8p3	401634319	5077789
clvx3v3io01n8cxyjq90ebvqn	401658231	4065050
clvx3v3ir01nacxyjakduu2l8	401658231	5210074
clvx3v3ji01nfcxyjn4uz7ttt	401641165	3041315
clvx3v3jl01nhcxyjzecnr5pj	401641165	4076780
clvx3v3kh01nqcxyjdpefwnrb	401647701	3024604
clvx3v3kk01nscxyjaqrrke1t	401647701	3068118
clvx3v3lp01o1cxyjxcvdpjpq	401647702	2554674
clvx3v3ls01o3cxyj92ez5fyn	401647702	4257422
clvx3v3my01occxyjymojaaw6	401641499	4684171
clvx3v3n101oecxyj1ssnqmh1	401641499	5080570
clvx3v3o501oncxyjxen5xeer	401647703	4215221
clvx3v3o901opcxyjk9mn1gnn	401647703	4273352
clvx3v3pe01oycxyjv1gp07oa	401647704	2556638
clvx3v3pi01p0cxyjgwqx0bto	401647704	4293151
clvx3v3r001p9cxyjh3nx35e1	401647705	3170347
clvx3v3r601pbcxyjmw7pj8zi	401647705	4070802
clvx3v3sg01pkcxyj2n2xzh1l	401647706	4043438
clvx3v3sj01pmcxyj0gi5znxs	401647706	4336342
clvx3v3tp01pvcxyjfft7144a	401647707	4065617
clvx3v3tt01pxcxyj2hcq2u28	401647707	4609439
clvx3v3uz01q6cxyj9i8aulwy	401647708	4689226
clvx3v3vd01q8cxyjgyrquego	401647708	5110272
clvx3v3wm01qhcxyjw7uqczj4	401647711	4033449
clvx3v3wp01qjcxyjdoqdwzy5	401647711	4795284
clvx3v3y701qscxyj8htj7e9e	401651462	4701284
clvx3v3yc01qucxyjrweaujto	401651462	5127795
clvx3v3zh01r3cxyjqrno04ij	401656572	4836889
clvx3v3zk01r5cxyjg9pt1fle	401656572	5210640
clvx3v40e01racxyjmv8pkmeu	401656573	5138563
clvx3v40s01rccxyjqmovn6ml	401656573	5210641
clvx3v41r01rhcxyjbybq1ksd	401656574	4701012
clvx3v41w01rjcxyj3atzh9iu	401656574	5210642
clvx3v42z01rocxyjwj8l5gmk	401654044	4013570
clvx3v43501rqcxyjzut7sefm	401654044	4312859
clvx3v44301rvcxyjz02btput	401654045	4695351
clvx3v44801rxcxyji5o6p9se	401654045	4895371
clvx3v45601s2cxyjxjghe5us	401654046	3132497
clvx3v45a01s4cxyjas9cyof0	401654046	4426144
clvx3v46n01s9cxyjj60hwnc8	401653873	4379868
clvx3v46r01sbcxyjvj2h2r8e	401653873	5202423
clvx3v47q01sgcxyjq0ljv72n	401653874	3956788
clvx3v47u01sicxyjsuxqpyks	401653874	4712360
clvx3v48x01sncxyjahw6vkbv	401653875	4024129
clvx3v49001spcxyjeax4aos7	401653875	5209332
clvx3v4an01sucxyjgm4u655t	401625039	2984770
clvx3v4as01swcxyjkohzst9v	401625039	4025699
clvx3v4gj01t3cxyj4vi4xmh7	401643537	3099187
clvx3v4gn01t5cxyjok3fju7h	401643537	4018757
clvx3v4m501tecxyjcuqvuxzr	401648097	4040926
clvx3v4mb01tgcxyjzfbenk6s	401648097	4324622
clvx3v4sw01tpcxyj1mqyvh3v	401636139	3089069
clvx3v4t401trcxyja7b4o2he	401636139	4038116
clvx3v50701u0cxyjcng5yrjd	401643536	4786358
clvx3v50c01u2cxyj4nu79p8u	401643536	5048900
clvx3v55y01ubcxyjfvyw5ark	401643539	2504639
clvx3v56201udcxyjidu595tv	401643539	3088232
clvx3v5ar01umcxyjx5ouv4kz	401643540	4710386
clvx3v5b001uocxyjttsk6i41	401643540	5147389
clvx3v5ez01uxcxyjqk7c66kc	401635962	2552777
clvx3v5f201uzcxyj4gob6opm	401635962	4418784
clvx3v5is01v8cxyj8hlpnkfm	401652996	3936279
clvx3v5iu01vacxyjmjsw57eu	401652996	4293183
clvx3v5lc01vjcxyjmt5yyht0	401643541	4815973
clvx3v5le01vlcxyj123qjsbz	401643541	5149439
clvx3v5nz01vucxyjwvfv9rd3	401651464	5032015
clvx3v5o201vwcxyjsvfv2p42	401651464	5144068
clvx3v5ql01w5cxyjewfph704	401625041	4916974
clvx3v5qn01w7cxyjhijpjmc3	401625041	5127984
clvx3v5u401wgcxyjncyg3zjk	401647712	4573208
clvx3v5u601wicxyjo7sbdz6j	401647712	4610008
clvx3v5ux01wpcxyjj7b5ngvu	401641166	3140871
clvx3v5v001wrcxyjxxvztmya	401641166	4249028
clvx3v5vu01x0cxyjqa1s08d0	401647782	2553999
clvx3v5vw01x2cxyjqjip8gd0	401647782	2984772
clvx3v5wx01x9cxyjoqt4uau9	401647783	4251918
clvx3v5x001xbcxyjz3g0lmrh	401647783	4408081
clvx3v5xw01xkcxyjeoiodxll	401647784	4231144
clvx3v5xy01xmcxyj976znidk	401647784	4821018
clvx3v5yx01xvcxyj2hsr5o3t	401647785	3108772
clvx3v5z001xxcxyjec42muqb	401647785	4689220
clvx3v60801y6cxyjd8ogko8e	401641500	4018603
clvx3v60c01y8cxyji4ehyp3x	401641500	5127818
clvx3v61k01yhcxyj2pruz7rz	401647786	3902688
clvx3v61q01yjcxyjuo5qtj08	401647786	4917144
clvx3v62v01yscxyj5u0rjyu6	401647787	4423241
clvx3v62z01yucxyj2dkhwxi0	401647787	4878384
clvx3v64901z3cxyjqagixkkl	401647789	3250008
clvx3v64c01z5cxyjw8usojbb	401647789	4875864
clvx3v65801zacxyj5o2ectel	401647791	3040120
clvx3v65b01zccxyjrjfs5t5h	401647791	3968345
clvx3v66t01zhcxyj5psupcbn	401619309	4425355
clvx3v66x01zjcxyjuen3txm3	401619309	4705658
clvx3v6bg01zscxyjontfuc3v	401629521	4275487
clvx3v6bi01zucxyj2f343g8p	401629521	4350762
clvx3v6f70203cxyjw39pfq1s	401632020	2614933
clvx3v6f90205cxyjxgywo0j2	401632020	3022345
clvx3v6hs020ecxyjravwgjkf	401626640	2504169
clvx3v6hv020gcxyjgcd5fj9e	401626640	4419372
clvx3v6kf020pcxyjiy6a81sr	401619310	4684474
clvx3v6kh020rcxyjjzz2jiff	401619310	5061870
clvx3v6nd0210cxyjpv7gysl7	401622061	3156612
clvx3v6nf0212cxyjhlsu1rxc	401622061	4079314
clvx3v6qc021bcxyjjdpbjg7z	401622063	3031559
clvx3v6qf021dcxyjpv733rdr	401622063	3164030
clvx3v6ti021mcxyj2r8250bq	401634819	3028404
clvx3v6tl021ocxyjw45ez9zm	401634819	4332765
clvx3v6x8021xcxyjct8gvgrf	401635298	4289274
clvx3v6xa021zcxyjt8wtv2bl	401635298	4881999
clvx3v7070228cxyjyd3sq7q2	401647436	3028863
clvx3v70a022acxyjeznkbw1v	401647436	4339490
clvx3v72s022hcxyjdao5xw2x	401636110	3024395
clvx3v72u022jcxyj8o0y9txh	401636110	4379258
clvx3v759022scxyjl883xyag	401632019	2335718
clvx3v75b022ucxyjacsvb1a9	401632019	2502364
clvx3v77k0231cxyj2rybtjia	401630738	3163637
clvx3v77m0233cxyjif3qglip	401630738	4189320
clvx3v7a6023ccxyjerm1phoi	401641167	2980488
clvx3v7a8023ecxyjc5wxmqcv	401641167	4832859
clvx3v7b1023ncxyje54m2dev	401647792	3009725
clvx3v7b7023pcxyj9eo4aftr	401647792	4330789
clvx3v7c5023ycxyj9nf1yg6h	401647793	4234873
clvx3v7c90240cxyjvqgnkd9l	401647793	4688510
clvx3v7d40249cxyjreevq55s	401647794	4423425
clvx3v7d6024bcxyj1ufbefyx	401647794	5124792
clvx3v7e1024kcxyjsy7kqbck	401647795	3056388
clvx3v7e4024mcxyjb11s0aoj	401647795	3076910
clvx3v7fp024vcxyjs70vdyev	401647816	2611321
clvx3v7fs024xcxyjbp7i1zfk	401647816	4688447
clvx3v7gt0256cxyjzwerfqu9	401641501	3901014
clvx3v7gv0258cxyjlgz1k54g	401641501	4208418
clvx3v7hs025hcxyj73p4bbbf	401647817	3075589
clvx3v7hv025jcxyj07cmodlw	401647817	4894428
clvx3v7iu025scxyjsryn6kdw	401647818	4399701
clvx3v7ix025ucxyj1flsbpud	401647818	4911955
clvx3v7k90263cxyjaq7yqyx2	401647819	3065566
clvx3v7kd0265cxyjec07bxlw	401647819	4331588
clvx3v7l7026acxyjnx7ajltm	401647821	4291177
clvx3v7la026ccxyjvqxlypz9	401647821	4350873
clvx3v7m8026hcxyj5nxvkubd	401647822	5075978
clvx3v7mb026jcxyj9bzi5aol	401647822	5120974
clvx3v7n6026ocxyjwesi6ubf	401658421	4289880
clvx3v7nb026qcxyjxr7214x8	401658421	5211391
clvx3v7of026vcxyjr5nhwfhi	401658422	3991050
clvx3v7oj026xcxyj80vdj2qf	401658422	5188022
clvx3v7pg0272cxyjlf6scfba	401658423	4419469
clvx3v7pk0274cxyj2j9929a3	401658423	4708881
clvx3v7qf0279cxyjukwuounj	401658424	4373246
clvx3v7qj027bcxyjjf3cvuvb	401658424	4637428
clvx3v7rb027gcxyjozdd54gj	401656837	5083027
clvx3v7re027icxyj6x8maj1m	401656837	5210733
clvx3v7s9027ncxyjondz75i2	401656839	5148533
clvx3v7se027pcxyjl7yn2fmj	401656839	5210732
clvx3v7u1027ucxyjtthbdbtt	401652884	3020090
clvx3v7u4027wcxyjmo2iw5yh	401652884	3155425
clvx3v7xv0283cxyjo9cxsunm	401651957	3887606
clvx3v7xy0285cxyjs6j5p5yb	401651957	5152109
clvx3v81e028ccxyjntv7edpr	401651964	3309918
clvx3v81i028ecxyjvfiejyhz	401651964	4227318
clvx3v84x028ncxyjoborpobw	401651963	2223033
clvx3v858028pcxyj669vpi4r	401651963	5145497
clvx3v88v028ycxyjccu7z2xp	401655506	4245092
clvx3v88z0290cxyj7bjjdym9	401655506	4897850
clvx3v8c70299cxyjfw27jrb2	401652438	2500946
clvx3v8ca029bcxyjnaija7wb	401652438	4685870
clvx3v8g3029kcxyjjz8rboia	401648164	2503659
clvx3v8g6029mcxyjaatzao1j	401648164	3114234
clvx3v8jv029vcxyjqh7mx0lu	401651965	4397797
clvx3v8jy029xcxyjnkb3f3yv	401651965	4900807
clvx3v8o102a6cxyjof48gjy7	401651960	4249193
clvx3v8o402a8cxyj3ah9it5h	401651960	5007668
clvx3v8sl02ahcxyjncghdlux	401651961	4566308
clvx3v8sp02ajcxyjybtgpoj0	401651961	4891678
clvx3v8x202ascxyj8yavumgy	401656037	3163772
clvx3v8x602aucxyjfvce446d	401656037	5075748
clvx3v8za02b3cxyjsokt7jv9	401645176	4295932
clvx3v8zc02b5cxyjihxs4dki	401645176	5132151
clvx3v91u02becxyj5ypudaud	401643543	3032218
clvx3v91w02bgcxyjk5w6poi4	401643543	4895360
clvx3v94h02bncxyj0akw2275	401655687	5094692
clvx3v94k02bpcxyjk2gv3nfn	401655687	5210077
clvx3v95602bucxyj779c4xrf	401657426	3090555
clvx3v95d02bwcxyjgvkpdekn	401657426	5139002
clvx3v96002c1cxyj7419s8yd	401657427	3871760
clvx3v96302c3cxyjmfi1hl6t	401657427	4896583
clvx3v97202c8cxyjhq3d0d03	401648468	2560746
clvx3v97502cacxyjfudkdavg	401648468	4997217
clvx3v99t02chcxyj2es118fu	401649508	2447641
clvx3v99x02cjcxyj2bsn7qm2	401649508	3928690
clvx3v9cw02cscxyjm0xhdeyd	401648470	2512976
clvx3v9cz02cucxyjvjkkdqm2	401648470	5060483
clvx3v9fq02d1cxyjlczz0lam	401656096	4418962
clvx3v9fv02d3cxyjsqz7jl9e	401656096	4873642
clvx3v9hs02d8cxyjh3mzc4hs	401640861	3946951
clvx3v9hw02dacxyjkgac2vxu	401640861	4835137
clvx3v9l302djcxyjx7ot8eyz	401648471	4319793
clvx3v9l702dlcxyjicrncz6n	401648471	4422355
clvx3v9pz02ducxyjhuldqfck	401648472	3102702
clvx3v9q302dwcxyjtsavo36e	401648472	5080935
clvx3v9si02e5cxyj737lheqm	401640862	5050129
clvx3v9sq02e7cxyjinzy43cp	401640862	5110006
clvx3v9ug02egcxyj3t9lkyg9	401648473	3897005
clvx3v9un02eicxyjbztm52qt	401648473	4079621
clvx3v9xt02ercxyje2nd75d1	401651970	4064883
clvx3v9xz02etcxyjkxf5lshb	401651970	5122238
clvx3va1q02f2cxyjjlnom6i4	401648476	4801725
clvx3va1u02f4cxyj7yb72m84	401648476	5149147
clvx3va7j02fdcxyj6ilbblwd	401651969	2960679
clvx3va7q02ffcxyji4qkk8ie	401651969	3093513
clvx3vac402focxyj55xxjy7s	401648475	5074121
clvx3vac902fqcxyjtowlm237	401648475	5144066
clvx3vahd02fzcxyjowzahox8	401647487	2560713
clvx3vahl02g1cxyjxtbu63an	401647487	4426192
clvx3valc02gacxyjd29hznzh	401656366	4024714
clvx3valj02gccxyj4biei6o0	401656366	4422103
clvx3van402ghcxyju7stfu7b	401652961	3948876
clvx3van902gjcxyjkvp3olvy	401652961	4695736
clvx3vard02gscxyjt31qkmjm	401658193	3026133
clvx3vari02gucxyjoa4hej7b	401658193	4689965
clvx3vask02h3cxyj5lsnb05d	401652964	2552906
clvx3vasn02h5cxyj9m3tsog1	401652964	4566991
clvx3vau602hccxyj5rnjxjky	401647488	4903365
clvx3vau802hecxyjhgc4r2u0	401647488	5189560
clvx3vavq02hjcxyjp1rrcyxc	401652966	4354421
clvx3vavs02hlcxyjfeaqsvbl	401652966	4877915
clvx3vaxj02hucxyjykanmu7m	401652962	4425604
clvx3vaxo02hwcxyjqc89v0fm	401652962	5074131
clvx3vb1902i5cxyjpz1j3y7k	401652963	3032972
clvx3vb1f02i7cxyj2zn1grnp	401652963	4868095
clvx3vb4i02igcxyjm4jncvlo	401652967	4706975
clvx3vb4n02iicxyjdty29zw5	401652967	5092403
clvx3vb5x02ircxyju62zcnfd	401652968	4375156
clvx3vb6002itcxyje8ordhjh	401652968	4705600
clvx3vb7y02j0cxyj2oyvchdl	401652969	4375621
clvx3vb8402j2cxyjzozd84zi	401652969	4830364
clvx3vb9y02jbcxyjoro1bfk9	401652970	3136289
clvx3vba002jdcxyj0drjtx65	401652970	4044708
clvx3vbbq02jmcxyj7yf0el36	401645297	2966188
clvx3vbbs02jocxyjei3v7h46	401645297	4350925
clvx3vbco02jtcxyjy7z8a0sx	401656119	3960085
clvx3vbcs02jvcxyjglmhosw6	401656119	5082905
clvx3vbde02k0cxyjfz8rgfu0	401645298	2559789
clvx3vbdg02k2cxyja96w3woe	401645298	4330791
clvx3vbe002k7cxyjryost7c4	401654419	3022308
clvx3vbe302k9cxyjjoo5oupn	401654419	4884867
clvx3vbet02kecxyj5pes56fg	401654420	3965445
clvx3vbew02kgcxyjoasaw2z9	401654420	4878438
clvx3vbfk02klcxyjtd0pfzp9	401645300	5080572
clvx3vbfn02kncxyj1o3cl712	401645300	5101131
clvx3vbgb02kscxyjlmz6b2yt	401645299	3067201
clvx3vbge02kucxyj9ruqjr1m	401645299	4039836
clvx3vbh002kzcxyjxy33ojan	401654316	4084363
clvx3vbh302l1cxyjywh1zfni	401654316	5076088
clvx3vbhr02l6cxyjs90bbc7c	401654025	3167160
clvx3vbhu02l8cxyj6z69w5u3	401654025	5120811
clvx3vbiq02ldcxyjs8loi622	401654317	4894845
clvx3vbit02lfcxyjgr3nwln4	401654317	5209577
clvx3vbjp02lkcxyj5jnw4894	401652482	2526299
clvx3vbjv02lmcxyjzcifmc8b	401652482	4576101
clvx3vbko02lrcxyjyxuo583f	401655507	3901011
clvx3vbks02ltcxyj9zq0gjgh	401655507	4612580
clvx3vblj02lycxyjfaohyaz9	401655508	5060489
clvx3vblm02m0cxyjrn4cnp1f	401655508	5074120
clvx3vbmf02m5cxyj2wqz59fp	401655509	3998248
clvx3vbmj02m7cxyjpy9amra1	401655509	4869425
clvx3vbnp02mccxyj9u7aww2w	401652483	3115931
clvx3vbns02mecxyjv06ilhah	401652483	4689229
clvx3vboq02mjcxyjtlpr37oc	401655510	4297311
clvx3vbou02mlcxyjhbp1yjbj	401655510	4963269
clvx3vbpp02mqcxyjhkg4nuos	401655511	3077822
clvx3vbps02mscxyjx2wfa2ls	401655511	3108775
clvx3vbqj02mxcxyjjk3ke8x1	401655512	4252258
clvx3vbqm02mzcxyjkj4i6po3	401655512	5144007
clvx3vbrk02n4cxyj43r6ys2x	401655513	4374742
clvx3vbrp02n6cxyjkm24vi34	401655513	4434010
clvx3vbsu02nbcxyjq3g1wpay	401655514	4565903
clvx3vbsy02ndcxyj37av8wqz	401655514	4816066
clvx3vbtx02nicxyjam5ujitb	401655515	4034272
clvx3vbu102nkcxyjxr9m0euq	401655515	4683395
clvx3vbv002npcxyjloax1rnd	401652641	2506549
clvx3vbv502nrcxyjujrt80cw	401652641	3332412
clvx3vbyb02nycxyjci0egmbv	401654716	3093653
clvx3vbyg02o0cxyj5e2t3y9k	401654716	4080826
clvx3vc1a02o5cxyjd6r7ht0l	401655682	4300149
clvx3vc1e02o7cxyj1qwhqszg	401655682	5144068
clvx3vc2k02occxyjm1nkwg1d	401655680	4421473
clvx3vc2p02oecxyjyd1cn3zx	401655680	4873640
clvx3vc3n02ojcxyjqt4feuxp	401655681	3039886
clvx3vc3s02olcxyjblyvnvpm	401655681	3960071
clvx3vc4q02oqcxyjbz5rbc60	401652649	3931156
clvx3vc4u02oscxyj9en0imy3	401652649	4423876
clvx3vc5n02oxcxyjn32us1a5	401656118	3088232
clvx3vc5r02ozcxyjhwa74bxh	401656118	4077451
clvx3vc6o02p4cxyjid1iotoy	401652642	3089915
clvx3vc6t02p6cxyjg2hzkbz0	401652642	3924096
clvx3vc8202pbcxyja5vnokk1	401652644	3960470
clvx3vc8602pdcxyj6msf47sf	401652644	4351085
clvx3vc9802picxyjnuw7h10q	401652650	4397782
clvx3vc9c02pkcxyjpz4wdjr0	401652650	5075333
clvx3vca902ppcxyjkxuffyta	401655684	5068545
clvx3vcae02prcxyjg13b0gif	401655684	5157669
clvx3vcb902pwcxyjsyk1e0c4	401657357	4917772
clvx3vcbd02pycxyjs78alq4p	401657357	5120301
clvx3vccc02q3cxyj8hy41un5	401655688	4712960
clvx3vccr02q5cxyj85nh49gh	401655688	4788959
clvx3vcdq02qacxyj6y9vyky2	401655689	5173773
clvx3vcdu02qccxyjraob4wk1	401655689	5210076
clvx3vcev02qhcxyjs3o2c719	401655679	4350871
clvx3vcf102qjcxyjyr5j0kl0	401655679	4397795
clvx3vcg002qocxyjx5erjsjc	401655678	2431356
clvx3vcg402qqcxyjr8jc8ls2	401655678	4402367
clvx3vcgy02qvcxyjp4rtoxua	401656368	3151934
clvx3vch202qxcxyjuwz5kneb	401656368	4046059
clvx3vcia02r2cxyjlek3we8p	401656400	4423214
clvx3vcie02r4cxyjvihtlp6r	401656400	4423448
clvx3vcji02r9cxyjab3pdpu1	401655796	3928693
clvx3vcjr02rbcxyjx3iltz8d	401655796	5088844
clvx3vckm02rgcxyjf3j9qi7l	401656401	3955778
clvx3vckq02ricxyj1zuzindw	401656401	4193694
clvx3vclm02rncxyjow2l1l40	401656402	2594871
clvx3vclq02rpcxyj4lcufx53	401656402	4233039
clvx3vcmi02rucxyjbdp5awd2	401656403	4294832
clvx3vcmm02rwcxyjdmioa4tb	401656403	4416297
clvx3vcnp02s1cxyjsssiegtx	401656404	4685871
clvx3vcns02s3cxyj6vu7894s	401656404	5077131
clvx3vcoo02s8cxyjmxbk1frr	401656405	4063869
clvx3vcot02sacxyj720u37eb	401656405	5088886
clvx3vcpo02sfcxyj30jwzc7x	401656406	4963343
clvx3vcps02shcxyj314agf97	401656406	5143888
clvx3vcqq02smcxyjtilumftx	401656407	4077475
clvx3vcqu02socxyjda187ymg	401656407	5143223
clvx3vcrs02stcxyjp6mcd6xi	401656408	3153106
clvx3vcrx02svcxyjm6gmp20j	401656408	4046629
clvx3vct002t0cxyj0j6auo8k	401656409	4292760
clvx3vct402t2cxyjwkkon1b5	401656409	4601333
clvx3vcu302t7cxyj052y120l	401653082	3068118
clvx3vcu702t9cxyj4ryk7mh6	401653082	4076780
clvx3vcv002tecxyj23mhiewl	401656002	4689226
clvx3vcv402tgcxyj959rq2wk	401656002	5080570
clvx3vcvz02tlcxyjevo8kni9	401656004	4065006
clvx3vcw402tncxyjsjeue5xa	401656004	4215221
clvx3vcwz02tscxyjjcx0e8sl	401656005	2554674
clvx3vcxf02tucxyjaj9sc3pq	401656005	4609439
clvx3vcya02tzcxyjxtixiemg	401656006	3024604
clvx3vcyf02u1cxyj5vqeiiq1	401656006	4293151
clvx3vcza02u6cxyjhq2kf50b	401656007	3170347
clvx3vcze02u8cxyjzox27l4n	401656007	5110272
clvx3vd0a02udcxyj5yj5lnui	401656008	3968345
clvx3vd0e02ufcxyjn6as6z18	401656008	4336342
clvx3vd1602ukcxyjw2uo1c7j	401656000	4065617
clvx3vd1a02umcxyjw7pjvpft	401656000	4070802
clvx3vd2b02urcxyjxh73xp7e	401655999	4205213
clvx3vd2f02utcxyjop35kd5b	401655999	4588192
clvx3vd3702uycxyj5ip98plv	401655997	4257422
clvx3vd3a02v0cxyjcng5mc0d	401655997	4684171
clvx3vd4802v5cxyjq67l29c6	401658548	4842488
clvx3vd4c02v7cxyjksn6t16x	401658548	5211416
clvx3vd5002vccxyj82gff7ki	401655973	4408681
clvx3vd5202vecxyjyogzspzg	401655973	4842487
clvx3vd5k02vjcxyjan6tfeof	401653084	2984772
clvx3vd5m02vlcxyjbksj2itq	401653084	4251918
clvx3vd6702vqcxyjwuhlpubl	401657034	4573208
clvx3vd6902vscxyjyvvc0934	401657034	5127818
clvx3vd6q02vxcxyjd13e0p2y	401657035	2553999
clvx3vd6t02vzcxyjx0shkhqq	401657035	4917144
clvx3vd7902w4cxyjtw7ujzxu	401657036	4249028
clvx3vd7b02w6cxyj0m4jjamw	401657036	4821018
clvx3vd7s02wbcxyjjq68uttw	401657037	4018603
clvx3vd7t02wdcxyjkum2pjbg	401657037	4689220
clvx3vd8c02wicxyjvdjpphrr	401657038	3108772
clvx3vd8d02wkcxyjr3szdnhc	401657038	4610008
clvx3vd9002wpcxyjjla89e76	401653085	3902688
clvx3vd9202wrcxyjw308thxh	401653085	4878384
clvx3vd9i02wwcxyj9hpuf8fm	401657039	3140871
clvx3vd9l02wycxyjxt9m9d95	401657039	4231144
clvx3vda302x3cxyjv0hujq0i	401657040	4423241
clvx3vda602x5cxyjjjjrz0kc	401657040	4875864
clvx3vdan02xacxyj53n0vxvj	401657041	3250008
clvx3vdap02xccxyjgh75ysof	401657041	4408081
clvx3vdb602xhcxyjq4shl04x	401657042	2431356
clvx3vdb902xjcxyjidpev2a6	401657042	4684470
clvx3vdc102xocxyjtjhn3su6	401657043	3156663
clvx3vdc402xqcxyja382eoka	401657043	4078664
clvx3vdco02xvcxyj6i7v91fp	401657044	2431356
clvx3vdcq02xxcxyjyjjq2jdt	401657044	4402367
clvx3vddh02y2cxyjzd5q4cmx	401650677	3120931
clvx3vddk02y4cxyjqs2ebh9d	401650677	4425611
clvx3vde502y9cxyj9ydtanl1	401657119	4712360
clvx3vde802ybcxyjjhtqbq8j	401657119	4814452
clvx3vdeu02ygcxyj9bf1ikzr	401653627	3161696
clvx3vdew02yicxyjxevbmvwy	401653627	4078216
clvx3vdfs02yncxyjerytbr2x	401653628	3896616
clvx3vdfw02ypcxyj9jph6dgo	401653628	5152982
clvx3vdgm02yucxyjp1a6ceb8	401654667	4878524
clvx3vdgp02ywcxyjsew8b8gr	401654667	4913833
clvx3vdhd02z1cxyjicizbtlu	401655690	4588646
clvx3vdhh02z3cxyj3b62qc0g	401655690	4744150
clvx3vdi602z8cxyjvqysog3b	401653626	4916255
clvx3vdi902zacxyjkrrslwkh	401653626	4916259
clvx3vdj502zfcxyjqaoe6xr0	401654853	3016688
clvx3vdjg02zhcxyjc0d2dcs3	401654853	5080560
clvx3vdka02zmcxyjgn22oxw8	401654854	5022142
clvx3vdkd02zocxyjrtppxfv6	401654854	5120295
clvx3vdl702ztcxyj2qecugu6	401655691	4229422
clvx3vdlc02zvcxyj8fwjk5hg	401655691	5127785
clvx3vdm70300cxyjg4ky0kdu	401635960	3009717
clvx3vdmb0302cxyjl31ky492	401635960	4684751
clvx3vdp80309cxyjt1ijolue	401651972	3026011
clvx3vdpg030bcxyjfgmwxj26	401651972	4426312
clvx3vdqb030gcxyj6crmh20l	401658189	4421784
clvx3vdqe030icxyj0gsja44n	401658189	4873642
clvx3vdr6030ncxyjghr0ptm8	401651973	3110836
clvx3vdra030pcxyjwzhs12i1	401651973	3146944
clvx3vds5030ucxyjkc8mt35y	401651971	2993650
clvx3vdsa030wcxyjrnr35yo3	401651971	4217395
clvx3vdtv0315cxyjqxro7fxn	401635961	2431356
clvx3vdty0317cxyjbfoigw76	401635961	4402367
clvx3vdut031ccxyj7z539jyx	401653086	3009725
clvx3vduy031ecxyju49uapyz	401653086	4423425
clvx3vdvo031jcxyjwl00958b	401658171	4234873
clvx3vdvr031lcxyjfqqfr6g6	401658171	4399701
clvx3vdwg031qcxyj90fo0eto	401658172	3065566
clvx3vdwj031scxyj47v5z4fh	401658172	4832859
clvx3vdxh031xcxyju61mixu8	401658173	2611321
clvx3vdxk031zcxyjj160q1vs	401658173	5124792
clvx3vdyd0324cxyjcyryxkce	401658549	2431356
clvx3vdyk0326cxyj7yz1pm1z	401658549	2556793
clvx3vdzd032bcxyj61sm1wbs	401653087	4688510
clvx3vdzg032dcxyj5c3tjit9	401653087	4911955
clvx3ve09032icxyj26o0mz3l	401658174	3901014
clvx3ve0e032kcxyjo554xxpt	401658174	4894428
clvx3ve15032pcxyj93yd7nql	401658175	2980488
clvx3ve19032rcxyj19shvasj	401658175	3076910
clvx3ve2c032wcxyjywc47vjc	401658176	4330789
clvx3ve2g032ycxyjpyk548z3	401658176	4688447
clvx3ve3h0333cxyjpptz3lwi	401658177	3056388
clvx3ve3l0335cxyjfnmzuacp	401658177	4331588
clvx3ve4h033acxyjzbyw7p42	401658178	3075589
clvx3ve4l033ccxyj3im29px0	401658178	4208418
clvx3ve5i033hcxyjaj62sury	401658550	4350873
clvx3ve5n033jcxyj4p64jajr	401658550	5120973
clvx3ve6s033ocxyjxqandcbe	401658179	3004926
clvx3ve6y033qcxyjjomehs7l	401658179	3084476
clvx3ve8k033vcxyjwe6hucs9	401658180	4833637
clvx3ve8y033xcxyjgwkvecc6	401658180	5150515
clvx3veaa0342cxyjdyl99ykf	401642605	2504988
clvx3veaf0344cxyj8a28ltw4	401642605	3022677
clvx3vefd034dcxyjvblch089	401655716	4028627
clvx3vefp034fcxyjgkza23mm	401655716	4425355
clvx3vegp034kcxyjiu7j3al4	401656117	4334306
clvx3vegs034mcxyj9t33enf0	401656117	4371001
clvx3vehd034rcxyj6lw6xk7r	401656369	2354087
clvx3vehg034tcxyjzeee5fif	401656369	3074464
clvx3vei4034ycxyjxlun5t7m	401642606	4415883
clvx3vei70350cxyjjl92wtuh	401642606	4684135
clvx3veiu0355cxyjn2tjmalo	401642608	2951504
clvx3veiw0357cxyj06h2cy8o	401642608	4089026
clvx3vejr035ccxyjwrhgesqr	401656526	3249894
clvx3vejt035ecxyjb0x8pagn	401656526	5137012
clvx3vekd035jcxyje0b0whl4	401658551	5144008
clvx3vekf035lcxyjcjlaxcii	401658551	5152931
clvx3vekv035qcxyjk32bz31b	401656356	2431356
clvx3vekx035scxyj7g7g5onl	401656356	4402367
clvx3veld035xcxyjr2c71ewb	401656357	2431356
clvx3velf035zcxyjty188esp	401656357	4402367
clvx3velz0364cxyj77bikf79	401656358	2431356
clvx3vem30366cxyjhpah2zgj	401656358	4402367
clvx3vemo036bcxyjfo789ang	401655692	2431356
clvx3vems036dcxyj11cbpmx2	401655692	4402367
clvx3venb036icxyj8974itu6	401655693	2431356
clvx3vene036kcxyjumj2z2a7	401655693	4402367
clvx3veo4036pcxyjphg0ofj9	401645302	4294504
clvx3veo6036rcxyjz5zvw5r8	401645302	4569549
clvx3veoj036wcxyjyc793irb	401645303	2431356
clvx3veol036ycxyj0gr6rban	401645303	4402367
clvx3vep30373cxyjaxe7a8wg	401655694	2431356
clvx3vep50375cxyjojnck1y8	401655694	4402367
clvx3vepj037acxyj5716pcpf	401655695	2431356
clvx3vepn037ccxyjqh0o2xcf	401655695	4402367
clvx3veq4037hcxyjs0jzx1xk	401652459	2431356
clvx3veq6037jcxyjdcl04ivz	401652459	4402367
clvx3veql037ocxyjd1b33qi8	401652460	2431356
clvx3veqn037qcxyj1ch43q0t	401652460	4402367
clvx3ver2037vcxyj43de74ca	401652461	2431356
clvx3ver4037xcxyjyfuyn3re	401652461	4402367
clvx3verr0382cxyj563jsws3	401655696	2431356
clvx3vert0384cxyjwolfbchn	401655696	4402367
clvx3vesd0389cxyjl647oi4a	401655697	2431356
clvx3vesf038bcxyj8icx9emk	401655697	4402367
clvx3vet0038gcxyj068mzeze	401650678	2431356
clvx3vet2038icxyjk9teuvxm	401650678	4402367
clvx3veti038ncxyjcxu28fwl	401650679	2431356
clvx3vetk038pcxyj74ftmy1u	401650679	4402367
clvx3veu3038ucxyjev3dci9y	401613669	2431356
clvx3veu5038wcxyjc1psgs6r	401613669	4402367
clvx3veuu0391cxyj2yhwte6k	401613670	2431356
clvx3veuy0393cxyj9tszrncj	401613670	4402367
clvx3vevi0398cxyjx217f6lo	401613671	2431356
clvx3vevk039acxyjk5xsnk3x	401613671	4402367
clvx3vew5039fcxyjy31uzqgy	401650680	2431356
clvx3vew7039hcxyj9kc3gxse	401650680	4402367
clvx3vewr039mcxyjbfyf2yqs	401654336	2431356
clvx3vewt039ocxyj597pls2u	401654336	4402367
clvx3vexd039tcxyjntc9mkv1	401654338	2431356
clvx3vexm039vcxyjbm047mpu	401654338	4402367
clvx3veyb03a0cxyj9aucm30q	401650681	2431356
clvx3veye03a2cxyjbhaq86at	401650681	4402367
\.


--
-- Data for Name: Odd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Odd" (id, "fightId", "fighterId", "createdAt", "updatedAt", provider, priority, favorite, value) FROM stdin;
clvx3uncm0020cxyja0yp7eyx	401616187	3922491	2024-05-08 00:52:31.026	2024-05-08 00:52:31.026	Unibet	0	t	-200
clvx3unu9003lcxyj0ixallh3	401616192	3151934	2024-05-08 00:52:31.628	2024-05-08 00:52:31.628	Unibet	0	f	225
clvx3uoe50065cxyjxfh0kxjs	401613159	3001914	2024-05-08 00:52:32.378	2024-05-08 00:52:32.378	Unibet	0	f	295
clvx3unkc002mcxyj1zkhfmph	401616188	2354269	2024-05-08 00:52:31.302	2024-05-08 00:52:31.302	Unibet	0	f	440
clvx3un50001ecxyj0vyb6koq	401613930	4273399	2024-05-08 00:52:30.751	2024-05-08 00:52:30.751	Unibet	0	t	-560
clvx3uo0x0047cxyjb550qbxw	401618480	5144007	2024-05-08 00:52:31.862	2024-05-08 00:52:31.862	Unibet	0	t	-360
clvx3unee0022cxyjxoiuihb2	401616187	4410868	2024-05-08 00:52:31.026	2024-05-08 00:52:31.026	Unibet	0	f	160
clvx3unqo0038cxyj206d3lv2	401616190	4895760	2024-05-08 00:52:31.533	2024-05-08 00:52:31.533	Unibet	0	t	-240
clvx3un67001gcxyj90q0frug	401613930	3146944	2024-05-08 00:52:30.751	2024-05-08 00:52:30.751	Unibet	0	f	390
clvx3uoku006rcxyjty97h6bj	401613440	3902098	2024-05-08 00:52:32.618	2024-05-08 00:52:32.618	Unibet	0	f	160
clvx3unw9003ucxyj8ho8vnug	401624040	4305514	2024-05-08 00:52:31.734	2024-05-08 00:52:31.734	Unibet	0	f	700
clvx3unhe002bcxyj7rl4ihek	401613931	3913473	2024-05-08 00:52:31.199	2024-05-08 00:52:31.199	Unibet	0	f	112
clvx3uo9p005lcxyjphd7nd7q	401612908	3166126	2024-05-08 00:52:32.186	2024-05-08 00:52:32.186	Unibet	0	t	-118
clvx3unrh003acxyj6yrdj374	401616190	4393818	2024-05-08 00:52:31.533	2024-05-08 00:52:31.533	Unibet	0	f	188
clvx3uno3002xcxyjcfc00gyo	401624039	4688408	2024-05-08 00:52:31.44	2024-05-08 00:52:31.44	Unibet	0	t	-114
clvx3uni6002dcxyjapvtfzzu	401613931	5077131	2024-05-08 00:52:31.199	2024-05-08 00:52:31.199	Unibet	0	t	-137
clvx3uop10072cxyjjr08gujj	401613442	4350871	2024-05-08 00:52:32.769	2024-05-08 00:52:32.769	Unibet	0	t	-215
clvx3unxh003wcxyj9fkouqxg	401624040	5145766	2024-05-08 00:52:31.734	2024-05-08 00:52:31.734	Unibet	0	t	-1250
clvx3uof70067cxyj4esuwbln	401613159	3165120	2024-05-08 00:52:32.378	2024-05-08 00:52:32.378	Unibet	0	t	-400
clvx3uo4b004icxyj7xbo62rn	401623977	4916248	2024-05-08 00:52:31.987	2024-05-08 00:52:31.987	Unibet	0	f	225
clvx3unlq002ocxyj9a2hob5u	401647488	4903365	2024-05-08 00:53:01.475	2024-05-08 00:53:01.475	Titanbets	0	f	140
clvx3untc003jcxyjbbygdvo0	401616192	5016786	2024-05-08 00:52:31.628	2024-05-08 00:52:31.628	Unibet	0	t	-295
clvx3uoca005wcxyjsdhixesr	401613219	4371001	2024-05-08 00:52:32.277	2024-05-08 00:52:32.277	Unibet	0	t	-167
clvx3uot5007dcxyjs83c96st	401612909	4421978	2024-05-08 00:52:32.917	2024-05-08 00:52:32.917	Unibet	0	t	-215
clvx3unzu0045cxyjclzrhv2i	401618480	3897242	2024-05-08 00:52:31.862	2024-05-08 00:52:31.862	Unibet	0	f	270
clvx3unoy002zcxyjd5puatw7	401624039	4038105	2024-05-08 00:52:31.44	2024-05-08 00:52:31.44	Unibet	0	f	-109
clvx3uo3e004gcxyj6s22gpjy	401623977	5120301	2024-05-08 00:52:31.987	2024-05-08 00:52:31.987	Unibet	0	t	-295
clvx3uoik006icxyjg8fdfikf	401613160	4415883	2024-05-08 00:52:32.482	2024-05-08 00:52:32.482	Unibet	0	f	150
clvx3un9w001rcxyjbin6tytf	401643543	3032218	2024-05-08 00:52:59.16	2024-05-08 00:52:59.16	Unibet	0	f	155
clvx3uovv007ocxyj2bc9l6io	401613161	5146229	2024-05-08 00:52:33.016	2024-05-08 00:52:33.016	Unibet	0	t	-186
clvx3uoml006tcxyjbqti4iga	401613440	4029275	2024-05-08 00:52:32.618	2024-05-08 00:52:32.618	Unibet	0	t	-200
clvx3uobb005ucxyjgsokf6pl	401613219	2995167	2024-05-08 00:52:32.277	2024-05-08 00:52:32.277	Unibet	0	f	133
clvx3un8n001pcxyjlpg7v5pc	401632019	2335718	2024-05-08 00:52:56.69	2024-05-08 00:52:56.69	Unibet	0	f	163
clvx3uoqq0074cxyjnuyvlsna	401613442	4686270	2024-05-08 00:52:32.769	2024-05-08 00:52:32.769	Unibet	0	f	170
clvx3uozv007zcxyj1k8co62w	401613762	4089026	2024-05-08 00:52:33.158	2024-05-08 00:52:33.158	Unibet	0	t	-305
clvx3up50008acxyjkw5fezve	401613763	4880807	2024-05-08 00:52:33.343	2024-05-08 00:52:33.343	Unibet	0	t	-152
clvx3up9j008lcxyjkkbc3i30	401614939	4835135	2024-05-08 00:52:33.507	2024-05-08 00:52:33.507	Unibet	0	t	-420
clvx3uo8s005jcxyj1dneepov	401654716	3093653	2024-05-08 00:53:02.929	2024-05-08 00:53:02.929	Unibet	0	t	-245
clvx3uox8007qcxyjcze7by01	401613161	5152409	2024-05-08 00:52:33.016	2024-05-08 00:52:33.016	Unibet	0	f	148
clvx3upds008wcxyjpwqaf3hc	401613764	3153250	2024-05-08 00:52:33.66	2024-05-08 00:52:33.66	Unibet	0	t	-210
clvx3up1z0081cxyjkygw8o0w	401613762	4227055	2024-05-08 00:52:33.158	2024-05-08 00:52:33.158	Unibet	0	f	235
clvx3uoh9006gcxyjlhj4cygn	401625039	2984770	2024-05-08 00:52:53.003	2024-05-08 00:52:53.003	Unibet	0	f	180
clvx3up6y008ccxyjgiihrwji	401613763	5088916	2024-05-08 00:52:33.343	2024-05-08 00:52:33.343	Unibet	0	f	123
clvx3uou8007fcxyjunly5wgz	401652964	4566991	2024-05-08 00:53:01.419	2024-05-08 00:53:01.419	Titanbets	0	t	-200
clvx3upb9008ncxyj09dg881z	401614939	4277049	2024-05-08 00:52:33.507	2024-05-08 00:52:33.507	Unibet	0	f	310
clvx3upff008ycxyj2wv5et2e	401613764	2989380	2024-05-08 00:52:33.66	2024-05-08 00:52:33.66	Unibet	0	f	165
clvx3ur4700fbcxyjhl48n44j	401615559	3074102	2024-05-08 00:52:35.906	2024-05-08 00:52:35.906	Unibet	0	f	200
clvx3upva00bdcxyjxjuhqpof	401628310	3960071	2024-05-08 00:52:34.292	2024-05-08 00:52:34.292	Unibet	0	t	-278
clvx3uqjt00dkcxyjliy5nqzs	401617807	5080936	2024-05-08 00:52:35.125	2024-05-08 00:52:35.125	Unibet	0	f	155
clvx3uq0f00bzcxyjv0x5ns1q	401619049	4045420	2024-05-08 00:52:34.477	2024-05-08 00:52:34.477	Unibet	0	t	-162
clvx3upol00arcxyjvmw5qtrp	401616899	4411508	2024-05-08 00:52:34.05	2024-05-08 00:52:34.05	Unibet	0	f	145
clvx3ur8t00fmcxyj2cnnxp1i	401636105	4074001	2024-05-08 00:52:36.073	2024-05-08 00:52:36.073	Unibet	0	t	-186
clvx3uq6a00clcxyjyjkj3kpt	401617805	4200455	2024-05-08 00:52:34.687	2024-05-08 00:52:34.687	Unibet	0	t	-305
clvx3upw200bfcxyjc02tb92b	401628310	3132513	2024-05-08 00:52:34.292	2024-05-08 00:52:34.292	Unibet	0	f	215
clvx3uppl00atcxyjgkny8doz	401616899	4690539	2024-05-08 00:52:34.05	2024-05-08 00:52:34.05	Unibet	0	t	-182
clvx3uqsh00e6cxyjqar8gzvw	401619053	5157668	2024-05-08 00:52:35.434	2024-05-08 00:52:35.434	Unibet	0	t	-148
clvx3uqe100d7cxyjsolx28p3	401630113	4963269	2024-05-08 00:52:34.964	2024-05-08 00:52:34.964	Unibet	0	t	-220
clvx3uq1a00c1cxyj6l673uhe	401619049	4426130	2024-05-08 00:52:34.477	2024-05-08 00:52:34.477	Unibet	0	f	130
clvx3urda00fxcxyjqs65suc5	401638479	4341572	2024-05-08 00:52:36.234	2024-05-08 00:52:36.234	Unibet	0	t	-175
clvx3upxs00bocxyjcli3h8mn	401619050	4379362	2024-05-08 00:52:34.381	2024-05-08 00:52:34.381	Unibet	0	f	265
clvx3urf500fzcxyjt72h7w3y	401656096	4873642	2024-05-08 00:52:59.665	2024-05-08 00:52:59.665	Unibet	0	f	310
clvx3uq7f00cncxyjx8svczhs	401617805	3977987	2024-05-08 00:52:34.687	2024-05-08 00:52:34.687	Unibet	0	f	235
clvx3uqmn00dtcxyj37j1b50n	401619052	4372194	2024-05-08 00:52:35.274	2024-05-08 00:52:35.274	Unibet	0	f	143
clvx3uqfl00d9cxyj39e84af4	401630113	4914568	2024-05-08 00:52:34.964	2024-05-08 00:52:34.964	Unibet	0	f	170
clvx3uq3b00cacxyjlxsmeybm	401619048	4375574	2024-05-08 00:52:34.58	2024-05-08 00:52:34.58	Unibet	0	t	-215
clvx3upyl00bqcxyjj9s0iue2	401619050	4054605	2024-05-08 00:52:34.381	2024-05-08 00:52:34.381	Unibet	0	t	-360
clvx3upt900b4cxyj6wh18hlm	401619043	2951202	2024-05-08 00:52:34.171	2024-05-08 00:52:34.171	Unibet	0	f	155
clvx3ur6400fdcxyjxiwr29av	401615559	4684135	2024-05-08 00:52:35.906	2024-05-08 00:52:35.906	Unibet	0	t	-265
clvx3uqob00dvcxyji4w3v8is	401619052	3157454	2024-05-08 00:52:35.274	2024-05-08 00:52:35.274	Unibet	0	t	-180
clvx3urhs00g8cxyj0c8i84j0	401620731	2504643	2024-05-08 00:52:36.397	2024-05-08 00:52:36.397	Unibet	0	f	200
clvx3uq9w00cwcxyj5f713ujr	401630114	5141967	2024-05-08 00:52:34.816	2024-05-08 00:52:34.816	Unibet	0	t	-265
clvx3uqwo00ehcxyjzcfz8np1	401619054	4565641	2024-05-08 00:52:35.584	2024-05-08 00:52:35.584	Unibet	0	f	143
clvx3uqil00dicxyjevkvk3pw	401617807	5068724	2024-05-08 00:52:35.125	2024-05-08 00:52:35.125	Unibet	0	t	-195
clvx3uq4900cccxyj8u27egt3	401619048	4416297	2024-05-08 00:52:34.58	2024-05-08 00:52:34.58	Unibet	0	f	170
clvx3urkj00gjcxyj9kmdevf5	401620733	2488476	2024-05-08 00:52:36.496	2024-05-08 00:52:36.496	Unibet	0	t	-143
clvx3urak00focxyj7ov8q1fl	401636105	3074464	2024-05-08 00:52:36.073	2024-05-08 00:52:36.073	Unibet	0	f	150
clvx3uqb700cycxyjf61b9bm9	401652968	4375156	2024-05-08 00:53:01.901	2024-05-08 00:53:01.901	Titanbets	0	f	125
clvx3uqr200e4cxyji3jtweed	401619053	4690546	2024-05-08 00:52:35.434	2024-05-08 00:52:35.434	Unibet	0	f	120
clvx3urn000gucxyjjmpmrna9	401620734	4426250	2024-05-08 00:52:36.585	2024-05-08 00:52:36.585	Unibet	0	t	-117
clvx3uqva00efcxyjcrvmewd3	401619054	4869702	2024-05-08 00:52:35.584	2024-05-08 00:52:35.584	Unibet	0	t	-180
clvx3urpy00h5cxyjo37ua2d1	401620735	4024732	2024-05-08 00:52:36.68	2024-05-08 00:52:36.68	Unibet	0	f	205
clvx3urt700hgcxyj69lcc7fx	401638739	5145682	2024-05-08 00:52:36.809	2024-05-08 00:52:36.809	Unibet	0	t	-180
clvx3uriv00gacxyj30l9d30c	401620731	4690541	2024-05-08 00:52:36.397	2024-05-08 00:52:36.397	Unibet	0	t	-250
clvx3urvh00hrcxyjxewls8i3	401615560	4292347	2024-05-08 00:52:36.891	2024-05-08 00:52:36.891	Unibet	0	t	-315
clvx3urle00glcxyjqh3sa3ya	401620733	4358252	2024-05-08 00:52:36.496	2024-05-08 00:52:36.496	Unibet	0	f	117
clvx3uro000gwcxyjke746f4l	401620734	4894791	2024-05-08 00:52:36.585	2024-05-08 00:52:36.585	Unibet	0	f	-106
clvx3ury100i2cxyj7d9fpf0y	401620760	3971496	2024-05-08 00:52:36.982	2024-05-08 00:52:36.982	Unibet	0	t	-230
clvx3urro00h7cxyjbmwny0nu	401620735	4294832	2024-05-08 00:52:36.68	2024-05-08 00:52:36.68	Unibet	0	t	-265
clvx3uru000hicxyjfahsbd7j	401638739	5123311	2024-05-08 00:52:36.809	2024-05-08 00:52:36.809	Unibet	0	f	143
clvx3upry00b2cxyjxxy4gsak	401647436	3028863	2024-05-08 00:52:56.51	2024-05-08 00:52:56.51	Unibet	0	t	-227
clvx3urwa00htcxyjk6fuow81	401615560	4394200	2024-05-08 00:52:36.891	2024-05-08 00:52:36.891	Unibet	0	f	240
clvx3uu0a00mqcxyj3qegf54j	401631983	4788300	2024-05-08 00:52:39.655	2024-05-08 00:52:39.655	Unibet	0	f	160
clvx3uryz00i4cxyj300fwhxm	401620760	3998068	2024-05-08 00:52:36.982	2024-05-08 00:52:36.982	Unibet	0	f	180
clvx3ut4t00kycxyjr8egyjd9	401618438	3023388	2024-05-08 00:52:38.418	2024-05-08 00:52:38.418	Unibet	0	f	225
clvx3us8e00izcxyjkpbvbsna	401638740	4880596	2024-05-08 00:52:37.354	2024-05-08 00:52:37.354	Unibet	0	f	170
clvx3uufp00pocxyjco1wpzu1	401631972	3120931	2024-05-08 00:52:40.206	2024-05-08 00:52:40.206	ESPN BET	1	t	-725
clvx3uugu00pxcxyjeioqi09z	401631974	3949930	2024-05-08 00:52:40.248	2024-05-08 00:52:40.248	ESPN BET	1	f	290
clvx3uskd00jzcxyj08hvvsna	401612970	3949584	2024-05-08 00:52:37.783	2024-05-08 00:52:37.783	Unibet	0	t	-155
clvx3uu2r00n1cxyjwh4aibhl	401628312	4900808	2024-05-08 00:52:39.745	2024-05-08 00:52:39.745	Unibet	0	t	-335
clvx3us1100idcxyjt67450cg	401620736	3040385	2024-05-08 00:52:37.09	2024-05-08 00:52:37.09	Unibet	0	f	148
clvx3uthf00lkcxyjvim8wf2w	401632998	4021217	2024-05-08 00:52:38.886	2024-05-08 00:52:38.886	Unibet	0	f	120
clvx3usw600klcxyjj5o7twnj	401622064	3111997	2024-05-08 00:52:38.208	2024-05-08 00:52:38.208	Unibet	0	f	195
clvx3us9s00j1cxyj5cnpa198	401638740	5027356	2024-05-08 00:52:37.354	2024-05-08 00:52:37.354	Unibet	0	t	-220
clvx3uttd00m6cxyjmvjs6zkc	401628313	4684059	2024-05-08 00:52:39.34	2024-05-08 00:52:39.34	Unibet	0	f	750
clvx3uugy00pzcxyj5khhpatg	401631974	3955014	2024-05-08 00:52:40.248	2024-05-08 00:52:40.248	ESPN BET	1	t	-385
clvx3us2500ifcxyjl5i9ackx	401620736	3970873	2024-05-08 00:52:37.09	2024-05-08 00:52:37.09	Unibet	0	t	-186
clvx3ut8i00l7cxyj3wl4a3ew	401636439	4290956	2024-05-08 00:52:38.653	2024-05-08 00:52:38.653	Unibet	0	t	-235
clvx3usn800k1cxyj6n5t34cj	401612970	4350812	2024-05-08 00:52:37.783	2024-05-08 00:52:37.783	Unibet	0	f	125
clvx3uuij00q8cxyjrdykqm1k	401631975	3045798	2024-05-08 00:52:40.299	2024-05-08 00:52:40.299	ESPN BET	1	f	-105
clvx3uscu00jacxyjuj64ojwr	401620759	5088886	2024-05-08 00:52:37.514	2024-05-08 00:52:37.514	Unibet	0	t	-275
clvx3uu5b00nccxyjzzrryqu4	401612972	3153106	2024-05-08 00:52:39.836	2024-05-08 00:52:39.836	Unibet	0	f	160
clvx3us4o00iocxyjys6ialj9	401620738	4896541	2024-05-08 00:52:37.22	2024-05-08 00:52:37.22	Unibet	0	t	-134
clvx3uuio00qacxyjin4wmmil	401631975	2569939	2024-05-08 00:52:40.299	2024-05-08 00:52:40.299	ESPN BET	1	t	-115
clvx3usym00kncxyjikxar7gw	401622064	4738092	2024-05-08 00:52:38.208	2024-05-08 00:52:38.208	Unibet	0	t	-250
clvx3utl600ltcxyjksw1udbn	401640699	2558075	2024-05-08 00:52:39.106	2024-05-08 00:52:39.106	Unibet	0	t	-220
clvx3utb600l9cxyjholskayu	401636439	4300149	2024-05-08 00:52:38.653	2024-05-08 00:52:38.653	Unibet	0	f	180
clvx3use700jccxyjqw9iobic	401620759	4389085	2024-05-08 00:52:37.514	2024-05-08 00:52:37.514	Unibet	0	f	210
clvx3utng00lvcxyjkwlwejzb	401640699	5122234	2024-05-08 00:52:39.106	2024-05-08 00:52:39.106	Unibet	0	f	170
clvx3uu1100mscxyj7cx3u2m2	401631983	5152138	2024-05-08 00:52:39.655	2024-05-08 00:52:39.655	Unibet	0	t	-205
clvx3uuk400qlcxyj8a5557ui	401631976	3821379	2024-05-08 00:52:40.36	2024-05-08 00:52:40.36	ESPN BET	1	t	-320
clvx3uum800r1cxyjspszxdyj	401631978	5103717	2024-05-08 00:52:40.444	2024-05-08 00:52:40.444	ESPN BET	1	t	-1600
clvx3ut2100kwcxyjegcb46zg	401618438	3948572	2024-05-08 00:52:38.418	2024-05-08 00:52:38.418	Unibet	0	t	-295
clvx3utyf00mhcxyjzf2wt8bz	401618442	4379328	2024-05-08 00:52:39.546	2024-05-08 00:52:39.546	Unibet	0	f	110
clvx3uumc00r3cxyjs0moced3	401631978	5195884	2024-05-08 00:52:40.444	2024-05-08 00:52:40.444	ESPN BET	1	f	850
clvx3uuo600rccxyjo3b5imfr	401631979	4708687	2024-05-08 00:52:40.492	2024-05-08 00:52:40.492	ESPN BET	1	t	-550
clvx3utf100licxyjqjcr0ba9	401632998	4233196	2024-05-08 00:52:38.886	2024-05-08 00:52:38.886	Unibet	0	t	-150
clvx3uuof00recxyjx0nr77rn	401631979	3031588	2024-05-08 00:52:40.492	2024-05-08 00:52:40.492	ESPN BET	1	f	385
clvx3uupw00rncxyjb5zvulal	401631980	5123585	2024-05-08 00:52:40.571	2024-05-08 00:52:40.571	ESPN BET	1	t	-1800
clvx3utrl00m4cxyjc8tf7xu8	401628313	5068624	2024-05-08 00:52:39.34	2024-05-08 00:52:39.34	Unibet	0	t	-1430
clvx3uuq000rpcxyj3o9t45u8	401631980	5195513	2024-05-08 00:52:40.571	2024-05-08 00:52:40.571	ESPN BET	1	f	950
clvx3uu3j00n3cxyjr7h6fk1k	401628312	4926991	2024-05-08 00:52:39.745	2024-05-08 00:52:39.745	Unibet	0	f	250
clvx3uu6600necxyjyhjzpp7m	401612972	4065598	2024-05-08 00:52:39.836	2024-05-08 00:52:39.836	Unibet	0	t	-200
clvx3uud800p0cxyjgeglskhf	401631970	4408708	2024-05-08 00:52:40.121	2024-05-08 00:52:40.121	ESPN BET	1	t	-180
clvx3uuef00pbcxyjq9ovlfu4	401647712	4573208	2024-05-08 00:52:54.994	2024-05-08 00:52:54.994	ESPN BET	1	t	-320
clvx3uujw00qjcxyj4u99tihl	401647782	2984772	2024-05-08 00:52:55.055	2024-05-08 00:52:55.055	ESPN BET	1	t	-230
clvx3utxb00mfcxyjcfg9pk19	401618442	4845284	2024-05-08 00:52:39.546	2024-05-08 00:52:39.546	Unibet	0	t	-136
clvx3uudb00p2cxyjlphfloar	401631970	2335530	2024-05-08 00:52:40.121	2024-05-08 00:52:40.121	ESPN BET	1	f	150
clvx3usqq00kacxyjzo3zsuw8	401635960	3009717	2024-05-08 00:53:05.082	2024-05-08 00:53:05.082	Unibet	0	f	145
clvx3uuei00pdcxyjofp3ktqh	401631971	4697390	2024-05-08 00:52:40.164	2024-05-08 00:52:40.164	ESPN BET	1	t	-450
clvx3uufm00pmcxyjwatgbw3g	401631972	4339208	2024-05-08 00:52:40.206	2024-05-08 00:52:40.206	ESPN BET	1	f	475
clvx3ust600kccxyjx1ql0o6z	401654716	4080826	2024-05-08 00:53:02.929	2024-05-08 00:53:02.929	Unibet	0	f	180
clvx3uurn00rycxyjwk1s7vgk	401630119	3027545	2024-05-08 00:52:40.639	2024-05-08 00:52:40.639	Unibet	0	t	-345
clvx3us5u00iqcxyj4xcl5tie	401651957	5152109	2024-05-08 00:52:57.723	2024-05-08 00:52:57.723	Unibet	0	f	163
clvx3uvjl00u5cxyjgaqxhbqg	401623299	4895772	2024-05-08 00:52:41.64	2024-05-08 00:52:41.64	ESPN Bet - Live Odds	0	f	220
clvx3uved00thcxyja0rsns2m	401630118	4884868	2024-05-08 00:52:41.459	2024-05-08 00:52:41.459	Unibet	0	f	133
clvx3uusx00s0cxyjg9njr6og	401630119	4239928	2024-05-08 00:52:40.639	2024-05-08 00:52:40.639	Unibet	0	f	260
clvx3uv6e00svcxyjzd4t2xoo	401624930	5063403	2024-05-08 00:52:41.17	2024-05-08 00:52:41.17	Unibet	0	t	-625
clvx3uvor00urcxyjlhkvi6tx	401628005	4713086	2024-05-08 00:52:41.79	2024-05-08 00:52:41.79	Unibet	0	f	-103
clvx3uwbq00xicxyjmkchqwif	401639776	4569549	2024-05-08 00:52:42.657	2024-05-08 00:52:42.657	Unibet	0	t	-1430
clvx3uvu200vdcxyj1419bxfl	401632040	4690540	2024-05-08 00:52:41.99	2024-05-08 00:52:41.99	Unibet	0	t	-590
clvx3uuw400s9cxyj4g5eenjs	401622062	3155420	2024-05-08 00:52:40.799	2024-05-08 00:52:40.799	Unibet	0	t	-159
clvx3uvki00uecxyjukmxoqd3	401632039	4070701	2024-05-08 00:52:41.679	2024-05-08 00:52:41.679	Unibet	0	f	165
clvx3uvf700tjcxyj2qzsg409	401630118	3075570	2024-05-08 00:52:41.459	2024-05-08 00:52:41.459	Unibet	0	t	-167
clvx3uv8000sxcxyjz3rz0sk3	401624930	4348673	2024-05-08 00:52:41.17	2024-05-08 00:52:41.17	Unibet	0	f	430
clvx3uxay00zncxyja4hwmxy0	401639777	4695485	2024-05-08 00:52:43.925	2024-05-08 00:52:43.925	ESPN Bet - Live Odds	0	t	-325
clvx3uwg500xtcxyj35if3z7t	401638239	2994349	2024-05-08 00:52:42.816	2024-05-08 00:52:42.816	Unibet	0	f	350
clvx3uuxw00sbcxyju9xd2hhh	401622062	3045737	2024-05-08 00:52:40.799	2024-05-08 00:52:40.799	Unibet	0	f	128
clvx3uw5100wycxyjwr9b0anv	401636112	4071969	2024-05-08 00:52:42.361	2024-05-08 00:52:42.361	Unibet	0	f	310
clvx3uvqj00v0cxyj3z7yvhh7	401619306	4713584	2024-05-08 00:52:41.897	2024-05-08 00:52:41.897	Unibet	0	f	255
clvx3uvln00ugcxyj30iguu77	401632039	4083018	2024-05-08 00:52:41.679	2024-05-08 00:52:41.679	Unibet	0	t	-210
clvx3uvb200t6cxyj15dzwckq	401625759	4896616	2024-05-08 00:52:41.337	2024-05-08 00:52:41.337	Unibet	0	t	-190
clvx3uvgv00tscxyjje2k0w42	401625319	5074274	2024-05-08 00:52:41.548	2024-05-08 00:52:41.548	Unibet	0	f	104
clvx3uv1m00skcxyjz3nl596h	401630559	4863327	2024-05-08 00:52:40.997	2024-05-08 00:52:40.997	Unibet	0	t	-305
clvx3uvrh00v2cxyjwesqptj0	401619306	5143333	2024-05-08 00:52:41.897	2024-05-08 00:52:41.897	Unibet	0	t	-335
clvx3uxb700zpcxyjqq79pwxe	401639777	4419434	2024-05-08 00:52:43.925	2024-05-08 00:52:43.925	ESPN Bet - Live Odds	0	f	220
clvx3uwl100y4cxyj8hyvlk1i	401639775	4082125	2024-05-08 00:52:42.993	2024-05-08 00:52:42.993	Unibet	0	t	-560
clvx3uw1600wncxyjfuf63qr8	401636111	5145498	2024-05-08 00:52:42.233	2024-05-08 00:52:42.233	Unibet	0	t	-210
clvx3uvce00t8cxyjnm882xiw	401625759	4867356	2024-05-08 00:52:41.337	2024-05-08 00:52:41.337	Unibet	0	f	150
clvx3uv3700smcxyj4txwrz8b	401630559	5123216	2024-05-08 00:52:40.997	2024-05-08 00:52:40.997	Unibet	0	f	235
clvx3uw9200x9cxyjxyv0ez30	401638480	4905261	2024-05-08 00:52:42.502	2024-05-08 00:52:42.502	Unibet	0	t	-420
clvx3uvnl00upcxyjijwy006e	401628005	4685888	2024-05-08 00:52:41.79	2024-05-08 00:52:41.79	Unibet	0	t	-121
clvx3uvhr00tucxyjiau43m55	401625319	5088891	2024-05-08 00:52:41.548	2024-05-08 00:52:41.548	Unibet	0	t	-129
clvx3uvjf00u3cxyj46pcplvz	401623299	5076027	2024-05-08 00:52:41.64	2024-05-08 00:52:41.64	ESPN Bet - Live Odds	0	t	-325
clvx3uwq400yfcxyj9asn11hv	401643236	4884877	2024-05-08 00:52:43.175	2024-05-08 00:52:43.175	Unibet	0	t	-122
clvx3uvt500vbcxyjdinhbjt5	401632040	5075335	2024-05-08 00:52:41.99	2024-05-08 00:52:41.99	Unibet	0	f	400
clvx3uwdl00xkcxyjcxmze1uw	401639776	5196459	2024-05-08 00:52:42.658	2024-05-08 00:52:42.658	Unibet	0	f	750
clvx3uvzv00wlcxyjb7jomyhl	401636111	4410084	2024-05-08 00:52:42.233	2024-05-08 00:52:42.233	Unibet	0	f	165
clvx3uw3h00wwcxyjso1oijjx	401648470	5060483	2024-05-08 00:52:59.561	2024-05-08 00:52:59.561	Unibet	0	t	-435
clvx3uwvs00yqcxyjxgd5frp6	401638484	4079149	2024-05-08 00:52:43.379	2024-05-08 00:52:43.379	Unibet	0	f	575
clvx3ux1z00z1cxyjl6r5mwkp	401638482	4848674	2024-05-08 00:52:43.601	2024-05-08 00:52:43.601	Unibet	0	t	-400
clvx3uwmt00y6cxyjiggl27lk	401639775	4237148	2024-05-08 00:52:42.993	2024-05-08 00:52:42.993	Unibet	0	f	380
clvx3ux6e00zccxyjjxi4i4k3	401643237	4193694	2024-05-08 00:52:43.761	2024-05-08 00:52:43.761	Unibet	0	t	-910
clvx3uwhm00xvcxyj3lzcrlug	401648468	4997217	2024-05-08 00:52:59.348	2024-05-08 00:52:59.348	Unibet	0	f	210
clvx3uwrz00yhcxyj9smbeltv	401643236	5080883	2024-05-08 00:52:43.175	2024-05-08 00:52:43.175	Unibet	0	f	-108
clvx3uwxy00yscxyjyh1z2ou2	401638484	4867357	2024-05-08 00:52:43.379	2024-05-08 00:52:43.379	Unibet	0	t	-910
clvx3uxjf010xcxyje2azs6gg	401612973	4205093	2024-05-08 00:52:44.23	2024-05-08 00:52:44.23	Unibet	0	t	-275
clvx3ux3h00z3cxyjoz1kfqx1	401638482	5074126	2024-05-08 00:52:43.601	2024-05-08 00:52:43.601	Unibet	0	f	300
clvx3uw7e00x7cxyjdul83w2i	401652884	3155425	2024-05-08 00:52:57.586	2024-05-08 00:52:57.586	Unibet	0	f	150
clvx3ux7u00zecxyjk4bncomq	401643237	4685730	2024-05-08 00:52:43.761	2024-05-08 00:52:43.761	Unibet	0	f	575
clvx3uxlb010zcxyjjwvo2sja	401612973	3155424	2024-05-08 00:52:44.23	2024-05-08 00:52:44.23	Unibet	0	f	210
clvx3uya1013fcxyj079324os	401618437	4237015	2024-05-08 00:52:45.146	2024-05-08 00:52:45.146	Unibet	0	t	-220
clvx3uxvi011ucxyjkljcucjl	401619341	3090197	2024-05-08 00:52:44.667	2024-05-08 00:52:44.667	Unibet	0	f	123
clvx3uy0e012gcxyjqya6523j	401618435	3922557	2024-05-08 00:52:44.844	2024-05-08 00:52:44.844	Unibet	0	f	114
clvx3uz7a017dcxyjnw45p2yh	401634774	2500735	2024-05-08 00:52:46.386	2024-05-08 00:52:46.386	Unibet	0	f	450
clvx3uyh50141cxyj58rg662a	401628004	4012999	2024-05-08 00:52:45.422	2024-05-08 00:52:45.422	Unibet	0	f	120
clvx3uy5n0132cxyj31lg6pjf	401618436	3068125	2024-05-08 00:52:45.032	2024-05-08 00:52:45.032	Unibet	0	t	-500
clvx3uxwf011wcxyjsbcs6530	401619341	4828707	2024-05-08 00:52:44.667	2024-05-08 00:52:44.667	Unibet	0	t	-155
clvx3uygg013zcxyjhka31sf0	401656096	4418962	2024-05-08 00:52:59.665	2024-05-08 00:52:59.665	Unibet	0	t	-420
clvx3uym5014ncxyj8fbggz4d	401612975	4294926	2024-05-08 00:52:45.59	2024-05-08 00:52:45.59	Unibet	0	t	-590
clvx3uxpl011acxyj3mrgut9q	401626639	4895362	2024-05-08 00:52:44.393	2024-05-08 00:52:44.393	Unibet	0	t	-220
clvx3uyc8013ocxyj4x8kc0d3	401640420	3994033	2024-05-08 00:52:45.268	2024-05-08 00:52:45.268	Unibet	0	t	-143
clvx3uy1a012icxyj87pmfghy	401618435	4873640	2024-05-08 00:52:44.844	2024-05-08 00:52:44.844	Unibet	0	t	-141
clvx3uz0j016tcxyj1rkopqqa	401630739	3093559	2024-05-08 00:52:46.1	2024-05-08 00:52:46.1	Unibet	0	f	-108
clvx3uxxz0125cxyjq0vvfc34	401619342	4293517	2024-05-08 00:52:44.757	2024-05-08 00:52:44.757	Unibet	0	t	-175
clvx3uz9y017ocxyjin3cv62y	401634778	4875511	2024-05-08 00:52:46.482	2024-05-08 00:52:46.482	Unibet	0	f	155
clvx3uxsa011jcxyjtd1cjjzg	401619340	3943695	2024-05-08 00:52:44.55	2024-05-08 00:52:44.55	Unibet	0	t	-139
clvx3uy6s0134cxyj59n4cgqa	401618436	2335687	2024-05-08 00:52:45.032	2024-05-08 00:52:45.032	Unibet	0	f	360
clvx3uydp013qcxyjag89qehz	401640420	2959588	2024-05-08 00:52:45.268	2024-05-08 00:52:45.268	Unibet	0	f	116
clvx3uy2u012rcxyjysnz95gr	401618434	4026490	2024-05-08 00:52:44.931	2024-05-08 00:52:44.931	Unibet	0	f	165
clvx3uzcb017zcxyjfngatx4x	401630740	3104720	2024-05-08 00:52:46.569	2024-05-08 00:52:46.569	Unibet	0	f	195
clvx3uxyv0127cxyj4fibyoee	401619342	3151289	2024-05-08 00:52:44.757	2024-05-08 00:52:44.757	Unibet	0	f	140
clvx3uxtx011lcxyjk9g515da	401619340	3022067	2024-05-08 00:52:44.55	2024-05-08 00:52:44.55	Unibet	0	f	112
clvx3uyjl014ccxyjdqs1sk2o	401628003	4276994	2024-05-08 00:52:45.501	2024-05-08 00:52:45.501	Unibet	0	f	275
clvx3uzer018acxyjy9ur94vh	401634799	2553261	2024-05-08 00:52:46.653	2024-05-08 00:52:46.653	Unibet	0	t	-250
clvx3uy8t013dcxyjuukj2el0	401618437	3045734	2024-05-08 00:52:45.146	2024-05-08 00:52:45.146	Unibet	0	f	170
clvx3uyot014ycxyjpd8gie68	401635439	3281606	2024-05-08 00:52:45.686	2024-05-08 00:52:45.686	Unibet	0	t	-250
clvx3uz8b017fcxyjicyxy8jw	401634774	4245094	2024-05-08 00:52:46.386	2024-05-08 00:52:46.386	Unibet	0	t	-670
clvx3uy3w012tcxyj17r415wm	401618434	4246307	2024-05-08 00:52:44.931	2024-05-08 00:52:44.931	Unibet	0	t	-210
clvx3uz4o0174cxyjgaavbd6o	401634801	4875506	2024-05-08 00:52:46.237	2024-05-08 00:52:46.237	Unibet	0	f	155
clvx3uyl5014lcxyjyx9tag1b	401612975	4396359	2024-05-08 00:52:45.59	2024-05-08 00:52:45.59	Unibet	0	f	390
clvx3uyio014acxyjl5n3dx6x	401647488	5189560	2024-05-08 00:53:01.475	2024-05-08 00:53:01.475	Titanbets	0	t	-189
clvx3uzh2018lcxyj2hfvjw9o	401634775	4702563	2024-05-08 00:52:46.739	2024-05-08 00:52:46.739	Unibet	0	f	350
clvx3uynt014wcxyj45alw5jh	401635439	3028064	2024-05-08 00:52:45.686	2024-05-08 00:52:45.686	Unibet	0	f	195
clvx3uyzf016rcxyj68tu75t5	401630739	3722422	2024-05-08 00:52:46.1	2024-05-08 00:52:46.1	Unibet	0	t	-114
clvx3uz360172cxyjcq6z2nfu	401634801	4815998	2024-05-08 00:52:46.237	2024-05-08 00:52:46.237	Unibet	0	t	-195
clvx3uzar017qcxyjpe5zcj3x	401634778	4918083	2024-05-08 00:52:46.482	2024-05-08 00:52:46.482	Unibet	0	t	-195
clvx3uzd50181cxyjatdw1645	401630740	4334306	2024-05-08 00:52:46.569	2024-05-08 00:52:46.569	Unibet	0	t	-250
clvx3uzji018wcxyjzlpmrotq	401634800	4801267	2024-05-08 00:52:46.828	2024-05-08 00:52:46.828	Unibet	0	t	-165
clvx3uzmh0197cxyjpqw6to1o	401634802	3896934	2024-05-08 00:52:46.935	2024-05-08 00:52:46.935	Unibet	0	t	-165
clvx3uzfk018ccxyjbyah3t8z	401634799	3111927	2024-05-08 00:52:46.653	2024-05-08 00:52:46.653	Unibet	0	f	195
clvx3uzhz018ncxyj5bje4uiz	401634775	4339145	2024-05-08 00:52:46.739	2024-05-08 00:52:46.739	Unibet	0	t	-500
clvx3uxny0118cxyj1k0lnwjb	401652641	2506549	2024-05-08 00:53:02.806	2024-05-08 00:53:02.806	Unibet	0	f	335
clvx3uzki018ycxyji12u4f08	401634800	4319785	2024-05-08 00:52:46.828	2024-05-08 00:52:46.828	Unibet	0	f	132
clvx3uznj0199cxyj71ib5xbg	401634802	4424224	2024-05-08 00:52:46.935	2024-05-08 00:52:46.935	Unibet	0	f	132
clvx3uzvx01a4cxyj0wumz9nn	401646556	3955778	2024-05-08 00:52:47.273	2024-05-08 00:52:47.273	Unibet	0	t	-315
clvx3v09e01bncxyjz2w93nzk	401639770	3109287	2024-05-08 00:52:47.758	2024-05-08 00:52:47.758	ESPN BET	1	f	-110
clvx3v09j01bpcxyj8v885ws0	401639770	5085291	2024-05-08 00:52:47.758	2024-05-08 00:52:47.758	ESPN BET	1	t	-120
clvx3v0ap01bycxyjgij7j3nx	401639769	4024128	2024-05-08 00:52:47.804	2024-05-08 00:52:47.804	ESPN BET	1	f	-110
clvx3v0au01c0cxyjt66ugtds	401639769	3028866	2024-05-08 00:52:47.804	2024-05-08 00:52:47.804	ESPN BET	1	t	-120
clvx3v0c701c9cxyj08yv3npo	401639771	4881912	2024-05-08 00:52:47.859	2024-05-08 00:52:47.859	ESPN BET	1	t	-2000
clvx3v0cb01cbcxyj5nnrcxro	401639771	5088781	2024-05-08 00:52:47.859	2024-05-08 00:52:47.859	ESPN BET	1	f	800
clvx3v0eg01crcxyj8sz7ea1m	401643878	4875324	2024-05-08 00:52:47.94	2024-05-08 00:52:47.94	ESPN BET	1	f	-110
clvx3v0ek01ctcxyjtrwqb8s3	401643878	4703598	2024-05-08 00:52:47.94	2024-05-08 00:52:47.94	ESPN BET	1	t	-120
clvx3uzp6019icxyjzor4cqae	401634776	4616087	2024-05-08 00:52:47.031	2024-05-08 00:52:47.031	Unibet	0	t	-200
clvx3v0fm01d2cxyjj3kyekbp	401639773	4913833	2024-05-08 00:52:47.981	2024-05-08 00:52:47.981	ESPN BET	1	t	-4000
clvx3v0fr01d4cxyj0ypmw0rr	401639773	5124793	2024-05-08 00:52:47.981	2024-05-08 00:52:47.981	ESPN BET	1	f	1100
clvx3uzxh01a6cxyjzpxrx7ug	401646556	4816283	2024-05-08 00:52:47.273	2024-05-08 00:52:47.273	Unibet	0	f	235
clvx3v0h301ddcxyjcyf2x6gc	401639772	4820893	2024-05-08 00:52:48.035	2024-05-08 00:52:48.035	ESPN BET	1	t	-1000
clvx3v0h901dfcxyjeabdshhs	401639772	5137436	2024-05-08 00:52:48.035	2024-05-08 00:52:48.035	ESPN BET	1	f	500
clvx3uzqg019kcxyjxcgxtdiv	401634776	4702589	2024-05-08 00:52:47.031	2024-05-08 00:52:47.031	Unibet	0	f	160
clvx3v00301afcxyjnf0xd0qk	401634804	4878592	2024-05-08 00:52:47.423	2024-05-08 00:52:47.423	Unibet	0	t	-175
clvx3v0ui01eocxyjb9s65bdo	401647484	4354318	2024-05-08 00:52:48.516	2024-05-08 00:52:48.516	Unibet	0	t	-200
clvx3v11d01ezcxyjevwc50lz	401637515	5144008	2024-05-08 00:52:48.762	2024-05-08 00:52:48.762	Unibet	0	t	-167
clvx3uzsf019tcxyjqfbglse3	401634803	4901883	2024-05-08 00:52:47.147	2024-05-08 00:52:47.147	Unibet	0	f	130
clvx3v0lr01e2cxyjskgyjdbl	401630741	4221863	2024-05-08 00:52:48.199	2024-05-08 00:52:48.199	Unibet	0	f	175
clvx3v17a01facxyjftk95wob	401648336	3900088	2024-05-08 00:52:48.975	2024-05-08 00:52:48.975	Unibet	0	f	112
clvx3v01y01ahcxyjtysoswcf	401634804	4816062	2024-05-08 00:52:47.423	2024-05-08 00:52:47.423	Unibet	0	f	138
clvx3v04p01aqcxyjsag9bap2	401638363	3112020	2024-05-08 00:52:47.588	2024-05-08 00:52:47.588	ESPN BET	1	t	-700
clvx3uztr019vcxyjzsz49tnj	401634803	4565671	2024-05-08 00:52:47.147	2024-05-08 00:52:47.147	Unibet	0	t	-162
clvx3v1dk01flcxyjjahulskx	401637045	4239738	2024-05-08 00:52:49.201	2024-05-08 00:52:49.201	Unibet	0	t	-182
clvx3v0x201eqcxyj33mkwppn	401647484	4374436	2024-05-08 00:52:48.516	2024-05-08 00:52:48.516	Unibet	0	f	155
clvx3v0o101e4cxyjjfd7p7ee	401630741	3032973	2024-05-08 00:52:48.199	2024-05-08 00:52:48.199	Unibet	0	t	-225
clvx3v0s101edcxyjj6c6x455	401647483	4915907	2024-05-08 00:52:48.425	2024-05-08 00:52:48.425	ESPN Bet - Live Odds	0	t	-3000
clvx3v0se01efcxyjx2ybo5wk	401647483	4566145	2024-05-08 00:52:48.425	2024-05-08 00:52:48.425	ESPN Bet - Live Odds	0	f	700
clvx3v04t01ascxyjymj14wea	401638363	3950364	2024-05-08 00:52:47.588	2024-05-08 00:52:47.588	ESPN BET	1	f	425
clvx3v06d01b1cxyjhydqwuwe	401643876	2532870	2024-05-08 00:52:47.639	2024-05-08 00:52:47.639	ESPN BET	1	f	-110
clvx3v06i01b3cxyjuzekazvf	401643876	4034830	2024-05-08 00:52:47.639	2024-05-08 00:52:47.639	ESPN BET	1	t	-120
clvx3v08001bccxyj0xyrtwep	401639768	4341543	2024-05-08 00:52:47.701	2024-05-08 00:52:47.701	ESPN BET	1	t	-150
clvx3v08501becxyjhuk5ftxo	401639768	4255574	2024-05-08 00:52:47.701	2024-05-08 00:52:47.701	ESPN BET	1	f	115
clvx3v1i101fwcxyjul58pb7k	401637041	3019246	2024-05-08 00:52:49.367	2024-05-08 00:52:49.367	Unibet	0	f	104
clvx3v13l01f1cxyjultaccdq	401637515	5077399	2024-05-08 00:52:48.762	2024-05-08 00:52:48.762	Unibet	0	f	135
clvx3v1kl01g7cxyjnd3xyqaj	401637042	3571515	2024-05-08 00:52:49.459	2024-05-08 00:52:49.459	Unibet	0	t	-180
clvx3v19m01fccxyj0iydmxci	401648336	4351319	2024-05-08 00:52:48.975	2024-05-08 00:52:48.975	Unibet	0	t	-139
clvx3v1n801gicxyj41ozslr3	401647485	4010864	2024-05-08 00:52:49.549	2024-05-08 00:52:49.549	Unibet	0	t	-137
clvx3v1g501fncxyjaola3nl8	401637045	5144312	2024-05-08 00:52:49.201	2024-05-08 00:52:49.201	Unibet	0	f	145
clvx3v1iv01fycxyjkxqm4zm4	401637041	4294378	2024-05-08 00:52:49.367	2024-05-08 00:52:49.367	Unibet	0	t	-129
clvx3v1lf01g9cxyj7c21o7rz	401637042	3955577	2024-05-08 00:52:49.459	2024-05-08 00:52:49.459	Unibet	0	f	143
clvx3v1o801gkcxyjxbz6f99x	401647485	2591306	2024-05-08 00:52:49.549	2024-05-08 00:52:49.549	Unibet	0	f	110
clvx3v2k301k2cxyj49hh5n6g	401619308	4333158	2024-05-08 00:52:50.677	2024-05-08 00:52:50.677	Unibet	0	t	-215
clvx3v3kv01nxcxyj2ul16c1m	401647701	3068118	2024-05-08 00:52:52.056	2024-05-08 00:52:52.056	ESPN BET	1	f	-110
clvx3v38u01m5cxyjw7c6fdrx	401641174	4686735	2024-05-08 00:52:51.628	2024-05-08 00:52:51.628	Unibet	0	t	-118
clvx3v2sr01kocxyju4fhl2pe	401641169	4408436	2024-05-08 00:52:50.995	2024-05-08 00:52:50.995	Unibet	0	f	210
clvx3v1xk01hqcxyjwfvz7y3u	401637040	2312150	2024-05-08 00:52:49.925	2024-05-08 00:52:49.925	Unibet	0	f	116
clvx3v1pw01gtcxyj6oertk4x	401636107	5093447	2024-05-08 00:52:49.65	2024-05-08 00:52:49.65	Unibet	0	f	138
clvx3v2dy01jpcxyjta54g4fx	401641171	3045887	2024-05-08 00:52:50.513	2024-05-08 00:52:50.513	Unibet	0	t	-122
clvx3v3m201o6cxyjy311z6j3	401647702	2554674	2024-05-08 00:52:52.101	2024-05-08 00:52:52.101	ESPN BET	1	t	-220
clvx3v3m501o8cxyjgfp5qgdo	401647702	4257422	2024-05-08 00:52:52.101	2024-05-08 00:52:52.101	ESPN BET	1	f	170
clvx3v3b501mgcxyjpkxmuw2c	401636108	4684240	2024-05-08 00:52:51.711	2024-05-08 00:52:51.711	Unibet	0	t	-127
clvx3v31m01lacxyjssjtdfi6	401647486	3915502	2024-05-08 00:52:51.31	2024-05-08 00:52:51.31	Unibet	0	t	-200
clvx3v1yz01hscxyjkpqts8r4	401637040	5060505	2024-05-08 00:52:49.925	2024-05-08 00:52:49.925	Unibet	0	t	-143
clvx3v1r101gvcxyjvix9j2wz	401636107	4426305	2024-05-08 00:52:49.65	2024-05-08 00:52:49.65	Unibet	0	t	-175
clvx3v1sv01h4cxyjrp0iircj	401630742	5093484	2024-05-08 00:52:49.756	2024-05-08 00:52:49.756	ESPN Bet - Live Odds	0	t	-165
clvx3v1t801h6cxyjw7m1tq2v	401630742	4894780	2024-05-08 00:52:49.756	2024-05-08 00:52:49.756	ESPN Bet - Live Odds	0	f	120
clvx3v3na01ohcxyjmlb9qo0n	401641499	5080570	2024-05-08 00:52:52.146	2024-05-08 00:52:52.146	ESPN BET	1	t	-10000
clvx3v3dk01mrcxyjupsk3qc3	401639419	4697476	2024-05-08 00:52:51.797	2024-05-08 00:52:51.797	Unibet	0	f	190
clvx3v2on01kdcxyjfw2u91vv	401641172	5060467	2024-05-08 00:52:50.832	2024-05-08 00:52:50.832	Unibet	0	f	170
clvx3v37901lwcxyjzr1rzgv6	401636219	3089633	2024-05-08 00:52:51.541	2024-05-08 00:52:51.541	Unibet	0	f	300
clvx3v1ua01hfcxyjzvep3szt	401640423	5145496	2024-05-08 00:52:49.804	2024-05-08 00:52:49.804	Unibet	0	f	132
clvx3v29701jecxyjie472ls7	401622059	4350796	2024-05-08 00:52:50.339	2024-05-08 00:52:50.339	Unibet	0	t	-195
clvx3v2x701kzcxyj8aqb28a7	401634320	4078243	2024-05-08 00:52:51.154	2024-05-08 00:52:51.154	Unibet	0	f	112
clvx3v3ng01ojcxyjpvptvlp6	401641499	4684171	2024-05-08 00:52:52.146	2024-05-08 00:52:52.146	ESPN BET	1	f	1500
clvx3v3oj01oscxyj8s4lvmvu	401647703	4273352	2024-05-08 00:52:52.191	2024-05-08 00:52:52.191	ESPN BET	1	t	-195
clvx3v34s01llcxyjdnk3py8l	401637620	4700617	2024-05-08 00:52:51.453	2024-05-08 00:52:51.453	Unibet	0	t	-215
clvx3v2ih01k0cxyjmu0yeigd	401619308	2553993	2024-05-08 00:52:50.677	2024-05-08 00:52:50.677	Unibet	0	f	170
clvx3v1vc01hhcxyj4i99jxx0	401640423	5157669	2024-05-08 00:52:49.804	2024-05-08 00:52:49.804	Unibet	0	t	-165
clvx3v3g501n2cxyjte9drdbf	401634319	4893608	2024-05-08 00:52:51.89	2024-05-08 00:52:51.89	Unibet	0	f	360
clvx3v2rb01kmcxyjd0eth56y	401641169	4076472	2024-05-08 00:52:50.995	2024-05-08 00:52:50.995	Unibet	0	t	-275
clvx3v3on01oucxyjop72bdpl	401647703	4215221	2024-05-08 00:52:52.191	2024-05-08 00:52:52.191	ESPN BET	1	f	155
clvx3v2b401jgcxyjee1ia0zn	401622059	4608674	2024-05-08 00:52:50.339	2024-05-08 00:52:50.339	Unibet	0	f	155
clvx3v2vq01kxcxyj5od1fb3w	401634320	2959422	2024-05-08 00:52:51.154	2024-05-08 00:52:51.154	Unibet	0	t	-137
clvx3v39l01m7cxyjzzgwpxem	401641174	5044438	2024-05-08 00:52:51.628	2024-05-08 00:52:51.628	Unibet	0	f	-105
clvx3v3pt01p3cxyj8be7jjjk	401647704	2556638	2024-05-08 00:52:52.236	2024-05-08 00:52:52.236	ESPN BET	1	f	160
clvx3v30301l8cxyj9fy52l0o	401647486	3821549	2024-05-08 00:52:51.31	2024-05-08 00:52:51.31	Unibet	0	f	160
clvx3v3px01p5cxyj5flei3og	401647704	4293151	2024-05-08 00:52:52.236	2024-05-08 00:52:52.236	ESPN BET	1	t	-200
clvx3v3rf01pecxyjeqi95tpi	401647705	3170347	2024-05-08 00:52:52.295	2024-05-08 00:52:52.295	ESPN BET	1	t	-1500
clvx3v3bz01micxyj6dn92kow	401636108	4875513	2024-05-08 00:52:51.711	2024-05-08 00:52:51.711	Unibet	0	f	102
clvx3v3rj01pgcxyjcsi0a34h	401647705	4070802	2024-05-08 00:52:52.295	2024-05-08 00:52:52.295	ESPN BET	1	f	700
clvx3v34001ljcxyjhfellkvl	401637620	4289516	2024-05-08 00:52:51.453	2024-05-08 00:52:51.453	Unibet	0	f	170
clvx3v3ss01ppcxyji8f4doyk	401647706	4043438	2024-05-08 00:52:52.344	2024-05-08 00:52:52.344	ESPN BET	1	f	-110
clvx3v3ed01mtcxyjd1tjyeb5	401639419	4687434	2024-05-08 00:52:51.797	2024-05-08 00:52:51.797	Unibet	0	t	-245
clvx3v3sw01prcxyjrcqgpgh5	401647706	4336342	2024-05-08 00:52:52.344	2024-05-08 00:52:52.344	ESPN BET	1	t	-120
clvx3v36f01lucxyjhttqnh5q	401636219	4227122	2024-05-08 00:52:51.541	2024-05-08 00:52:51.541	Unibet	0	t	-400
clvx3v3u201q0cxyjqf5lmaz4	401647707	4609439	2024-05-08 00:52:52.39	2024-05-08 00:52:52.39	ESPN BET	1	t	-300
clvx3v3u701q2cxyj9vet8k3o	401647707	4065617	2024-05-08 00:52:52.39	2024-05-08 00:52:52.39	ESPN BET	1	f	225
clvx3v3vo01qbcxyjpu71898r	401647708	4689226	2024-05-08 00:52:52.447	2024-05-08 00:52:52.447	ESPN BET	1	f	185
clvx3v3vt01qdcxyjxw8z95rn	401647708	5110272	2024-05-08 00:52:52.447	2024-05-08 00:52:52.447	ESPN BET	1	t	-240
clvx3v3x301qmcxyjw9hbi39u	401647711	4795284	2024-05-08 00:52:52.499	2024-05-08 00:52:52.499	ESPN BET	1	t	-1800
clvx3v3h001n4cxyjo3zlzto2	401634319	5077789	2024-05-08 00:52:51.89	2024-05-08 00:52:51.89	Unibet	0	t	-530
clvx3v3jr01nkcxyjf9j7soob	401641165	3041315	2024-05-08 00:52:52.02	2024-05-08 00:52:52.02	ESPN BET	1	f	110
clvx3v3x801qocxyj8ppiij4y	401647711	4033449	2024-05-08 00:52:52.499	2024-05-08 00:52:52.499	ESPN BET	1	f	750
clvx3v3ym01qxcxyjfgkbn0qw	401651462	5127795	2024-05-08 00:52:52.553	2024-05-08 00:52:52.553	ESPN BET	1	t	-650
clvx3v3ju01nmcxyjy07657u5	401641165	4076780	2024-05-08 00:52:52.02	2024-05-08 00:52:52.02	ESPN BET	1	t	-145
clvx3v3ks01nvcxyjhekkx6vn	401647701	3024604	2024-05-08 00:52:52.056	2024-05-08 00:52:52.056	ESPN BET	1	t	-120
clvx3v3yq01qzcxyjc9pknxk9	401651462	4701284	2024-05-08 00:52:52.553	2024-05-08 00:52:52.553	ESPN BET	1	f	400
clvx3v2fu01jrcxyjvci3lext	401656366	4024714	2024-05-08 00:53:01.167	2024-05-08 00:53:01.167	ESPN BET	1	t	-140
clvx3v2mt01kbcxyjc30bdet5	401656366	4422103	2024-05-08 00:53:01.167	2024-05-08 00:53:01.167	ESPN BET	1	f	120
clvx3v63d01yzcxyju3zjoijf	401647787	4878384	2024-05-08 00:52:55.312	2024-05-08 00:52:55.312	ESPN BET	1	f	250
clvx3v5ju01vfcxyjd2t0u3x6	401652996	4293183	2024-05-08 00:52:54.586	2024-05-08 00:52:54.586	Unibet	0	t	-141
clvx3v4b401szcxyjcyb351lg	401625039	4025699	2024-05-08 00:52:53.003	2024-05-08 00:52:53.003	Unibet	0	t	-230
clvx3v4tn01tucxyj83rss7mo	401636139	4038116	2024-05-08 00:52:53.667	2024-05-08 00:52:53.667	Unibet	0	t	-315
clvx3v56g01ugcxyjwgt72b9m	401643539	2504639	2024-05-08 00:52:54.13	2024-05-08 00:52:54.13	Unibet	0	f	255
clvx3v5p301w1cxyj918ze7aa	401651464	5144068	2024-05-08 00:52:54.775	2024-05-08 00:52:54.775	Unibet	0	f	120
clvx3v4h201t8cxyjabaw2n57	401643537	4018757	2024-05-08 00:52:53.215	2024-05-08 00:52:53.215	Unibet	0	t	-195
clvx3v5fc01v2cxyji4fi6rjt	401635962	4418784	2024-05-08 00:52:54.451	2024-05-08 00:52:54.451	Unibet	0	t	-125
clvx3v4x001twcxyjcna35nm4	401636139	3089069	2024-05-08 00:52:53.667	2024-05-08 00:52:53.667	Unibet	0	f	240
clvx3v5ll01vocxyjoizpmdtu	401643541	4815973	2024-05-08 00:52:54.678	2024-05-08 00:52:54.678	Unibet	0	f	143
clvx3v58801uicxyj6muiq508	401643539	3088232	2024-05-08 00:52:54.13	2024-05-08 00:52:54.13	Unibet	0	t	-345
clvx3v4jh01tacxyjzfbp2r7n	401643537	3099187	2024-05-08 00:52:53.215	2024-05-08 00:52:53.215	Unibet	0	f	155
clvx3v67b01zmcxyj52wwxrrz	401619309	4705658	2024-05-08 00:52:55.459	2024-05-08 00:52:55.459	Unibet	0	t	-295
clvx3v5gq01v4cxyj0tcji05a	401635962	2552777	2024-05-08 00:52:54.451	2024-05-08 00:52:54.451	Unibet	0	f	100
clvx3v50q01u5cxyj9a3eo5cz	401643536	5048900	2024-05-08 00:52:53.924	2024-05-08 00:52:53.924	Unibet	0	f	135
clvx3v4mp01tjcxyj7kfww37j	401648097	4324622	2024-05-08 00:52:53.419	2024-05-08 00:52:53.419	Unibet	0	t	-129
clvx3v5mh01vqcxyjced4piz4	401643541	5149439	2024-05-08 00:52:54.678	2024-05-08 00:52:54.678	Unibet	0	t	-180
clvx3v5bc01urcxyjfr2r8pvz	401643540	5147389	2024-05-08 00:52:54.308	2024-05-08 00:52:54.308	Unibet	0	t	-230
clvx3v6bv01zxcxyj0rje3qpy	401629521	4350762	2024-05-08 00:52:55.619	2024-05-08 00:52:55.619	Unibet	0	t	-588
clvx3v5rs01wccxyj9uuddraw	401625041	4916974	2024-05-08 00:52:54.869	2024-05-08 00:52:54.869	Unibet	0	f	255
clvx3v53h01u7cxyjd8y9oavh	401643536	4786358	2024-05-08 00:52:53.924	2024-05-08 00:52:53.924	Unibet	0	t	-167
clvx3v4pg01tlcxyjdmdwufuz	401648097	4040926	2024-05-08 00:52:53.419	2024-05-08 00:52:53.419	Unibet	0	f	105
clvx3v5uf01wlcxyjduyxup79	401647712	4610008	2024-05-08 00:52:54.994	2024-05-08 00:52:54.994	ESPN BET	1	f	230
clvx3v5v801wucxyjtpcznnv5	401641166	4249028	2024-05-08 00:52:55.024	2024-05-08 00:52:55.024	ESPN BET	1	t	-155
clvx3v5vb01wwcxyj3qr04pt3	401641166	3140871	2024-05-08 00:52:55.024	2024-05-08 00:52:55.024	ESPN BET	1	f	120
clvx3v5j001vdcxyjot8qtw9h	401652996	3936279	2024-05-08 00:52:54.586	2024-05-08 00:52:54.586	Unibet	0	f	115
clvx3v5wa01x5cxyj6ha8wv6v	401647782	2553999	2024-05-08 00:52:55.055	2024-05-08 00:52:55.055	ESPN BET	1	f	180
clvx3v5x901xecxyj35cnepfx	401647783	4251918	2024-05-08 00:52:55.095	2024-05-08 00:52:55.095	ESPN BET	1	t	-190
clvx3v5xb01xgcxyjv0l0ezng	401647783	4408081	2024-05-08 00:52:55.095	2024-05-08 00:52:55.095	ESPN BET	1	f	150
clvx3v5y501xpcxyjhm07kfa0	401647784	4231144	2024-05-08 00:52:55.13	2024-05-08 00:52:55.13	ESPN BET	1	t	-160
clvx3v5oa01vzcxyjhr8id73f	401651464	5032015	2024-05-08 00:52:54.775	2024-05-08 00:52:54.775	Unibet	0	t	-150
clvx3v5cm01utcxyjr5u1pljv	401643540	4710386	2024-05-08 00:52:54.308	2024-05-08 00:52:54.308	Unibet	0	f	180
clvx3v5qw01wacxyjflf6deqz	401625041	5127984	2024-05-08 00:52:54.869	2024-05-08 00:52:54.869	Unibet	0	t	-345
clvx3v5y901xrcxyjct4huyr2	401647784	4821018	2024-05-08 00:52:55.13	2024-05-08 00:52:55.13	ESPN BET	1	f	125
clvx3v5z801y0cxyjcus6afal	401647785	3108772	2024-05-08 00:52:55.168	2024-05-08 00:52:55.168	ESPN BET	1	t	-500
clvx3v5zc01y2cxyjwxfuulny	401647785	4689220	2024-05-08 00:52:55.168	2024-05-08 00:52:55.168	ESPN BET	1	f	325
clvx3v60l01ybcxyjvvaj6pdm	401641500	4018603	2024-05-08 00:52:55.217	2024-05-08 00:52:55.217	ESPN BET	1	f	120
clvx3v60p01ydcxyj0lcft00p	401641500	5127818	2024-05-08 00:52:55.217	2024-05-08 00:52:55.217	ESPN BET	1	t	-155
clvx3v6fg0208cxyjnik7zhcv	401632020	3022345	2024-05-08 00:52:55.753	2024-05-08 00:52:55.753	Unibet	0	t	-195
clvx3v61z01ymcxyjmzjvq8pb	401647786	4917144	2024-05-08 00:52:55.268	2024-05-08 00:52:55.268	ESPN BET	1	f	110
clvx3v62401yocxyj7vf7hn3e	401647786	3902688	2024-05-08 00:52:55.268	2024-05-08 00:52:55.268	ESPN BET	1	t	-145
clvx3v63801yxcxyj8nmn3y0m	401647787	4423241	2024-05-08 00:52:55.312	2024-05-08 00:52:55.312	ESPN BET	1	t	-360
clvx3v68r01zocxyj8e9uzc73	401619309	4425355	2024-05-08 00:52:55.459	2024-05-08 00:52:55.459	Unibet	0	f	215
clvx3v6da01zzcxyjsa00b89s	401629521	4275487	2024-05-08 00:52:55.619	2024-05-08 00:52:55.619	Unibet	0	f	410
clvx3v6yv0224cxyj96uqury3	401635298	4881999	2024-05-08 00:52:56.402	2024-05-08 00:52:56.402	Unibet	0	t	-155
clvx3v6gd020acxyj0qtqi29x	401632020	2614933	2024-05-08 00:52:55.753	2024-05-08 00:52:55.753	Unibet	0	f	155
clvx3v7y70288cxyj8co2hyhj	401651957	3887606	2024-05-08 00:52:57.723	2024-05-08 00:52:57.723	Unibet	0	t	-205
clvx3v77s0236cxyjf69c6crz	401630738	4189320	2024-05-08 00:52:56.773	2024-05-08 00:52:56.773	Unibet	0	t	-420
clvx3v730022mcxyjghvsn0jp	401636110	3024395	2024-05-08 00:52:56.602	2024-05-08 00:52:56.602	Unibet	0	t	-1111
clvx3v6tv021rcxyj5eawgvel	401634819	3028404	2024-05-08 00:52:56.271	2024-05-08 00:52:56.271	Unibet	0	f	1050
clvx3v6nn0215cxyji6kgnpmg	401622061	3156612	2024-05-08 00:52:56.048	2024-05-08 00:52:56.048	Unibet	0	f	195
clvx3v6i2020jcxyj0gbl62md	401626640	2504169	2024-05-08 00:52:55.847	2024-05-08 00:52:55.847	Unibet	0	f	1500
clvx3v70i022dcxyjq4k5z0ri	401647436	4339490	2024-05-08 00:52:56.51	2024-05-08 00:52:56.51	Unibet	0	f	170
clvx3v6os0217cxyjl0md8wmf	401622061	4079314	2024-05-08 00:52:56.048	2024-05-08 00:52:56.048	Unibet	0	t	-265
clvx3v6j1020lcxyjnhxgns23	401626640	4419372	2024-05-08 00:52:55.847	2024-05-08 00:52:55.847	Unibet	0	t	-10000
clvx3v6vb021tcxyjklm95edl	401634819	4332765	2024-05-08 00:52:56.271	2024-05-08 00:52:56.271	Unibet	0	t	-2500
clvx3v7ug027zcxyjz9h1jd9d	401652884	3020090	2024-05-08 00:52:57.586	2024-05-08 00:52:57.586	Unibet	0	t	-189
clvx3v73x022ocxyjdoevap1k	401636110	4379258	2024-05-08 00:52:56.602	2024-05-08 00:52:56.602	Unibet	0	f	600
clvx3v78r0238cxyj8k5o5y3m	401630738	3163637	2024-05-08 00:52:56.773	2024-05-08 00:52:56.773	Unibet	0	f	290
clvx3v6qn021gcxyjr03mbvlq	401622063	3164030	2024-05-08 00:52:56.156	2024-05-08 00:52:56.156	Unibet	0	f	1600
clvx3v6kq020ucxyjn2n5g3q0	401619310	5061870	2024-05-08 00:52:55.943	2024-05-08 00:52:55.943	Unibet	0	t	-5000
clvx3v7ad023hcxyjotc63cxc	401641167	2980488	2024-05-08 00:52:56.867	2024-05-08 00:52:56.867	ESPN BET	1	f	170
clvx3v7ag023jcxyjvc454ugm	401641167	4832859	2024-05-08 00:52:56.867	2024-05-08 00:52:56.867	ESPN BET	1	t	-220
clvx3v7be023scxyj35s9b0dr	401647792	3009725	2024-05-08 00:52:56.903	2024-05-08 00:52:56.903	ESPN BET	1	t	-1100
clvx3v7bh023ucxyj6wqzfock	401647792	4330789	2024-05-08 00:52:56.903	2024-05-08 00:52:56.903	ESPN BET	1	f	550
clvx3v6xg0222cxyj3lsn5stp	401635298	4289274	2024-05-08 00:52:56.402	2024-05-08 00:52:56.402	Unibet	0	f	125
clvx3v7cg0243cxyjhivnqwmv	401647793	4234873	2024-05-08 00:52:56.941	2024-05-08 00:52:56.941	ESPN BET	1	t	-270
clvx3v7cj0245cxyjnjja4gdi	401647793	4688510	2024-05-08 00:52:56.941	2024-05-08 00:52:56.941	ESPN BET	1	f	200
clvx3v7de024ecxyj3e310igs	401647794	5124792	2024-05-08 00:52:56.974	2024-05-08 00:52:56.974	ESPN BET	1	t	-180
clvx3v7dh024gcxyj8dtbhg4c	401647794	4423425	2024-05-08 00:52:56.974	2024-05-08 00:52:56.974	ESPN BET	1	f	140
clvx3v6rt021icxyj6uofbjue	401622063	3031559	2024-05-08 00:52:56.156	2024-05-08 00:52:56.156	Unibet	0	t	-10000
clvx3v6lw020wcxyj4oqpj5z0	401619310	4684474	2024-05-08 00:52:55.943	2024-05-08 00:52:55.943	Unibet	0	f	1400
clvx3v7eb024pcxyjr2qhh5hm	401647795	3076910	2024-05-08 00:52:57.008	2024-05-08 00:52:57.008	ESPN BET	1	t	-230
clvx3v75h022xcxyjcoad0a98	401632019	2502364	2024-05-08 00:52:56.69	2024-05-08 00:52:56.69	Unibet	0	t	-205
clvx3v7ed024rcxyjj1w26lw8	401647795	3056388	2024-05-08 00:52:57.008	2024-05-08 00:52:57.008	ESPN BET	1	f	180
clvx3v7g10250cxyjr1ns4n4h	401647816	2611321	2024-05-08 00:52:57.068	2024-05-08 00:52:57.068	ESPN BET	1	t	-140
clvx3v7g40252cxyjr95bn7ya	401647816	4688447	2024-05-08 00:52:57.068	2024-05-08 00:52:57.068	ESPN BET	1	f	105
clvx3v7h4025bcxyjsy36jgge	401641501	4208418	2024-05-08 00:52:57.107	2024-05-08 00:52:57.107	ESPN BET	1	t	-170
clvx3v81s028hcxyj44hu4wsd	401651964	4227318	2024-05-08 00:52:57.852	2024-05-08 00:52:57.852	Unibet	0	f	128
clvx3v89j0293cxyjxcbsryxb	401655506	4245092	2024-05-08 00:52:58.13	2024-05-08 00:52:58.13	Unibet	0	t	-180
clvx3v7h7025dcxyj1e8c0y6a	401641501	3901014	2024-05-08 00:52:57.107	2024-05-08 00:52:57.107	ESPN BET	1	f	130
clvx3v7i2025mcxyjbdcm9mbz	401647817	4894428	2024-05-08 00:52:57.143	2024-05-08 00:52:57.143	ESPN BET	1	t	-550
clvx3v85i028scxyjtwc5mu9d	401651963	2223033	2024-05-08 00:52:57.986	2024-05-08 00:52:57.986	Unibet	0	f	200
clvx3v7i5025ocxyjzux1jtkm	401647817	3075589	2024-05-08 00:52:57.143	2024-05-08 00:52:57.143	ESPN BET	1	f	350
clvx3v7j6025xcxyj6hyvx33e	401647818	4399701	2024-05-08 00:52:57.182	2024-05-08 00:52:57.182	ESPN BET	1	f	750
clvx3v7ji025zcxyje9pjn6c0	401647818	4911955	2024-05-08 00:52:57.182	2024-05-08 00:52:57.182	ESPN BET	1	t	-1800
clvx3v8ck029ecxyjuggqnbzh	401652438	2500946	2024-05-08 00:52:58.24	2024-05-08 00:52:58.24	Unibet	0	f	250
clvx3v835028jcxyjszvfrwfh	401651964	3309918	2024-05-08 00:52:57.852	2024-05-08 00:52:57.852	Unibet	0	t	-159
clvx3v8an0295cxyj32wee13p	401655506	4897850	2024-05-08 00:52:58.13	2024-05-08 00:52:58.13	Unibet	0	f	143
clvx3v86x028ucxyjdbeg4guk	401651963	5145497	2024-05-08 00:52:57.986	2024-05-08 00:52:57.986	Unibet	0	t	-250
clvx3v8e3029gcxyjyiqlj7yj	401652438	4685870	2024-05-08 00:52:58.24	2024-05-08 00:52:58.24	Unibet	0	t	-334
clvx3v9i902ddcxyjrrmbzkx7	401640861	3946951	2024-05-08 00:52:59.737	2024-05-08 00:52:59.737	Unibet	0	f	320
clvx3v8y502azcxyjoub4g565	401656037	3163772	2024-05-08 00:52:58.991	2024-05-08 00:52:58.991	Unibet	0	f	255
clvx3va2402f7cxyjnsh8dxuw	401648476	4801725	2024-05-08 00:53:00.456	2024-05-08 00:53:00.456	Unibet	0	t	-205
clvx3v97b02cdcxyjzvrj0aiy	401648468	2560746	2024-05-08 00:52:59.348	2024-05-08 00:52:59.348	Unibet	0	t	-278
clvx3v9qf02dzcxyj2a2uorko	401648472	3102702	2024-05-08 00:53:00.035	2024-05-08 00:53:00.035	Unibet	0	f	230
clvx3v8gg029pcxyjhp9qm9nu	401648164	2503659	2024-05-08 00:52:58.38	2024-05-08 00:52:58.38	Unibet	0	f	310
clvx3v8pw02adcxyj4yk1x7v3	401651960	5007668	2024-05-08 00:52:58.666	2024-05-08 00:52:58.666	Unibet	0	t	-115
clvx3vai702g4cxyjpyzord3q	401647487	2560713	2024-05-08 00:53:01.026	2024-05-08 00:53:01.026	Titanbets	0	t	-175
clvx3v8zm02b8cxyjmnjerje7	401645176	5132151	2024-05-08 00:52:59.067	2024-05-08 00:52:59.067	Unibet	0	t	-500
clvx3v9jc02dfcxyj7uv2tvd6	401640861	4835137	2024-05-08 00:52:59.737	2024-05-08 00:52:59.737	Unibet	0	t	-435
clvx3v8hu029rcxyjq6z2okfn	401648164	3114234	2024-05-08 00:52:58.38	2024-05-08 00:52:58.38	Unibet	0	t	-420
clvx3v8t002amcxyjghsk4htp	401651961	4891678	2024-05-08 00:52:58.83	2024-05-08 00:52:58.83	Unibet	0	f	255
clvx3v9a802cmcxyjhzyb4tt8	401649508	2447641	2024-05-08 00:52:59.451	2024-05-08 00:52:59.451	Unibet	0	f	102
clvx3v9yb02ewcxyjzqt2ydsr	401651970	5122238	2024-05-08 00:53:00.318	2024-05-08 00:53:00.318	Unibet	0	t	-175
clvx3v9rb02e1cxyjy1bzo2qa	401648472	5080935	2024-05-08 00:53:00.035	2024-05-08 00:53:00.035	Unibet	0	t	-303
clvx3v8k802a0cxyjexmoorgp	401651965	4397797	2024-05-08 00:52:58.515	2024-05-08 00:52:58.515	Unibet	0	f	138
clvx3v90g02bacxyj75l2cgyv	401645176	4295932	2024-05-08 00:52:59.067	2024-05-08 00:52:59.067	Unibet	0	f	350
clvx3v9t402eacxyjtfinelag	401640862	5110006	2024-05-08 00:53:00.13	2024-05-08 00:53:00.13	ESPN Bet - Live Odds	0	f	320
clvx3v8uj02aocxyjj8d3riz8	401651961	4566308	2024-05-08 00:52:58.83	2024-05-08 00:52:58.83	Unibet	0	t	-334
clvx3v9th02eccxyj65gjg2gv	401640862	5050129	2024-05-08 00:53:00.13	2024-05-08 00:53:00.13	ESPN Bet - Live Odds	0	t	-600
clvx3v9ls02docxyjl9xpzg6k	401648471	4319793	2024-05-08 00:52:59.857	2024-05-08 00:52:59.857	Unibet	0	f	138
clvx3v8lv02a2cxyj9jcpvcja	401651965	4900807	2024-05-08 00:52:58.515	2024-05-08 00:52:58.515	Unibet	0	t	-175
clvx3v9b602cocxyj1grikf9n	401649508	3928690	2024-05-08 00:52:59.451	2024-05-08 00:52:59.451	Unibet	0	t	-127
clvx3vay402hzcxyjxvjgk5xx	401652962	4425604	2024-05-08 00:53:01.605	2024-05-08 00:53:01.605	Titanbets	0	f	165
clvx3vast02h8cxyjop5wpawb	401652964	2552906	2024-05-08 00:53:01.419	2024-05-08 00:53:01.419	Titanbets	0	f	150
clvx3vajj02g6cxyjoftdxa3i	401647487	4426192	2024-05-08 00:53:01.026	2024-05-08 00:53:01.026	Titanbets	0	f	135
clvx3v93102bjcxyjt7gqg68f	401643543	4895360	2024-05-08 00:52:59.16	2024-05-08 00:52:59.16	Unibet	0	t	-195
clvx3v8og02abcxyjjs37iy55	401651960	4249193	2024-05-08 00:52:58.666	2024-05-08 00:52:58.666	Unibet	0	f	-107
clvx3va9e02fkcxyjofqecrvw	401651969	2960679	2024-05-08 00:53:00.668	2024-05-08 00:53:00.668	Unibet	0	f	335
clvx3v8xg02axcxyjhaccinsj	401656037	5075748	2024-05-08 00:52:58.991	2024-05-08 00:52:58.991	Unibet	0	t	-345
clvx3v9d902cxcxyjt3m8i8hi	401648470	2512976	2024-05-08 00:52:59.561	2024-05-08 00:52:59.561	Unibet	0	f	320
clvx3v9v302elcxyjub676lbh	401648473	3897005	2024-05-08 00:53:00.2	2024-05-08 00:53:00.2	Unibet	0	f	143
clvx3va4c02f9cxyjm006zb4k	401648476	5149147	2024-05-08 00:53:00.456	2024-05-08 00:53:00.456	Unibet	0	f	163
clvx3v9zt02eycxyjcave1nak	401651970	4064883	2024-05-08 00:53:00.318	2024-05-08 00:53:00.318	Unibet	0	f	138
clvx3v9w302encxyj6e458hxk	401648473	4079621	2024-05-08 00:53:00.2	2024-05-08 00:53:00.2	Unibet	0	t	-180
clvx3v9nj02dqcxyjd5qiy7on	401648471	4422355	2024-05-08 00:52:59.857	2024-05-08 00:52:59.857	Unibet	0	t	-175
clvx3vb8d02j5cxyjx2yl5kz7	401652969	4375621	2024-05-08 00:53:01.977	2024-05-08 00:53:01.977	Titanbets	0	f	175
clvx3vann02gmcxyjg98m569v	401652961	3948876	2024-05-08 00:53:01.229	2024-05-08 00:53:01.229	Titanbets	0	f	180
clvx3vae302fvcxyj2q05a7bl	401648475	5144066	2024-05-08 00:53:00.83	2024-05-08 00:53:00.83	Unibet	0	f	116
clvx3vavy02hocxyjazmui777	401652966	4354421	2024-05-08 00:53:01.531	2024-05-08 00:53:01.531	Titanbets	0	f	155
clvx3vaov02gocxyjr9dgz065	401652961	4695736	2024-05-08 00:53:01.229	2024-05-08 00:53:01.229	Titanbets	0	t	-238
clvx3varu02gxcxyj2jwynu3a	401658193	3026133	2024-05-08 00:53:01.381	2024-05-08 00:53:01.381	ESPN BET	1	f	315
clvx3vary02gzcxyj40p0f4ck	401658193	4689965	2024-05-08 00:53:01.381	2024-05-08 00:53:01.381	ESPN BET	1	t	-425
clvx3va8002ficxyj3v9f99g0	401651969	3093513	2024-05-08 00:53:00.668	2024-05-08 00:53:00.668	Unibet	0	t	-481
clvx3vacg02ftcxyj01fvcf6q	401648475	5074121	2024-05-08 00:53:00.83	2024-05-08 00:53:00.83	Unibet	0	t	-143
clvx3vazb02i1cxyj06600167	401652962	5074131	2024-05-08 00:53:01.605	2024-05-08 00:53:01.605	Titanbets	0	t	-222
clvx3vb6p02iwcxyj510ii2vj	401652968	4705600	2024-05-08 00:53:01.901	2024-05-08 00:53:01.901	Titanbets	0	t	-167
clvx3vawd02hqcxyj7ctnkyv7	401652966	4877915	2024-05-08 00:53:01.531	2024-05-08 00:53:01.531	Titanbets	0	t	-208
clvx3vb2u02iccxyjm0mz74s3	401652963	3032972	2024-05-08 00:53:01.738	2024-05-08 00:53:01.738	Titanbets	0	f	120
clvx3vb4x02ilcxyjhpg3pa5j	401652967	4706975	2024-05-08 00:53:01.853	2024-05-08 00:53:01.853	ESPN BET	1	f	140
clvx3vb1u02iacxyj2ynz5nnx	401652963	4868095	2024-05-08 00:53:01.738	2024-05-08 00:53:01.738	Titanbets	0	t	-154
clvx3vb5202incxyjick4iwk2	401652967	5092403	2024-05-08 00:53:01.853	2024-05-08 00:53:01.853	ESPN BET	1	t	-170
clvx3vba602jgcxyj8844efqt	401652970	3136289	2024-05-08 00:53:02.043	2024-05-08 00:53:02.043	Titanbets	0	f	120
clvx3vb8x02j7cxyjx7spg6ij	401652969	4830364	2024-05-08 00:53:01.977	2024-05-08 00:53:01.977	Titanbets	0	t	-238
clvx3vdsj030zcxyjpcb9xw61	401651971	4217395	2024-05-08 00:53:05.295	2024-05-08 00:53:05.295	DraftKings	0	t	-192
clvx3vdt20311cxyj5vtla4bq	401651971	2993650	2024-05-08 00:53:05.295	2024-05-08 00:53:05.295	DraftKings	0	f	160
clvx3vbal02jicxyjvu34b6kk	401652970	4044708	2024-05-08 00:53:02.043	2024-05-08 00:53:02.043	Titanbets	0	t	-154
clvx3vbvf02nucxyjtdjwmz0l	401652641	3332412	2024-05-08 00:53:02.806	2024-05-08 00:53:02.806	Unibet	0	t	-500
clvx3vdne0305cxyjkdqruio7	401635960	4684751	2024-05-08 00:53:05.082	2024-05-08 00:53:05.082	Unibet	0	t	-182
clvx3veax0347cxyjplnd0ubj	401642605	3022677	2024-05-08 00:53:05.951	2024-05-08 00:53:05.951	Titanbets	0	t	-125
clvx3vec90349cxyjk7ooiu82	401642605	2504988	2024-05-08 00:53:05.951	2024-05-08 00:53:05.951	Titanbets	0	f	100
\.


--
-- Name: Event Event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (id);


--
-- Name: Fight Fight_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fight"
    ADD CONSTRAINT "Fight_pkey" PRIMARY KEY (id);


--
-- Name: Fighter Fighter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fighter"
    ADD CONSTRAINT "Fighter_pkey" PRIMARY KEY (id);


--
-- Name: FightsOnFighters FightsOnFighters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FightsOnFighters"
    ADD CONSTRAINT "FightsOnFighters_pkey" PRIMARY KEY (id);


--
-- Name: Odd Odd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Odd"
    ADD CONSTRAINT "Odd_pkey" PRIMARY KEY (id);


--
-- Name: Fight Fight_eventId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fight"
    ADD CONSTRAINT "Fight_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES public."Event"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Fight Fight_winnerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fight"
    ADD CONSTRAINT "Fight_winnerId_fkey" FOREIGN KEY ("winnerId") REFERENCES public."Fighter"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: FightsOnFighters FightsOnFighters_fightId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FightsOnFighters"
    ADD CONSTRAINT "FightsOnFighters_fightId_fkey" FOREIGN KEY ("fightId") REFERENCES public."Fight"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: FightsOnFighters FightsOnFighters_fighterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FightsOnFighters"
    ADD CONSTRAINT "FightsOnFighters_fighterId_fkey" FOREIGN KEY ("fighterId") REFERENCES public."Fighter"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Odd Odd_fightId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Odd"
    ADD CONSTRAINT "Odd_fightId_fkey" FOREIGN KEY ("fightId") REFERENCES public."Fight"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Odd Odd_fighterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Odd"
    ADD CONSTRAINT "Odd_fighterId_fkey" FOREIGN KEY ("fighterId") REFERENCES public."Fighter"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

