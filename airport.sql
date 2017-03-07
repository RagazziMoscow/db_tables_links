--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2017-03-07 21:08:44 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2059 (class 1262 OID 18327)
-- Name: airoport; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE airoport WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_RU.UTF-8' LC_CTYPE = 'ru_RU.UTF-8';


ALTER DATABASE airoport OWNER TO admin;

\connect airoport

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11897)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 18328)
-- Name: company; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE company (
    id_comp integer NOT NULL,
    name character(10) NOT NULL
);


ALTER TABLE company OWNER TO admin;

--
-- TOC entry 174 (class 1259 OID 18331)
-- Name: pass_in_trip; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE pass_in_trip (
    trip_no integer NOT NULL,
    date timestamp without time zone NOT NULL,
    id_psg integer NOT NULL,
    place character(10) NOT NULL
);


ALTER TABLE pass_in_trip OWNER TO admin;

--
-- TOC entry 175 (class 1259 OID 18334)
-- Name: passenger; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE passenger (
    id_psg integer NOT NULL,
    name character(20) NOT NULL
);


ALTER TABLE passenger OWNER TO admin;

--
-- TOC entry 176 (class 1259 OID 18337)
-- Name: trip; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE trip (
    trip_no integer NOT NULL,
    id_comp integer NOT NULL,
    plane character(10) NOT NULL,
    town_from character(25) NOT NULL,
    town_to character(25) NOT NULL,
    time_out timestamp without time zone NOT NULL,
    time_in timestamp without time zone NOT NULL
);


ALTER TABLE trip OWNER TO admin;

--
-- TOC entry 2051 (class 0 OID 18328)
-- Dependencies: 173
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY company (id_comp, name) FROM stdin;
1	Don_avia  
2	Aeroflot  
3	Dale_avia 
4	air_France
5	British_AW
\.


--
-- TOC entry 2052 (class 0 OID 18331)
-- Dependencies: 174
-- Data for Name: pass_in_trip; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY pass_in_trip (trip_no, date, id_psg, place) FROM stdin;
1100	2003-04-29 00:00:00	1	1a        
1123	2003-04-05 00:00:00	3	2a        
1123	2003-04-08 00:00:00	1	4c        
1123	2003-04-08 00:00:00	6	4b        
1124	2003-04-02 00:00:00	2	2d        
1145	2003-04-05 00:00:00	3	2c        
1181	2003-04-01 00:00:00	1	1a        
1181	2003-04-01 00:00:00	6	1b        
1181	2003-04-01 00:00:00	8	3c        
1181	2003-04-13 00:00:00	5	1b        
1182	2003-04-13 00:00:00	5	4b        
1187	2003-04-14 00:00:00	8	3a        
1188	2003-04-01 00:00:00	8	3a        
1182	2003-04-13 00:00:00	9	6d        
1145	2003-04-25 00:00:00	5	1d        
1187	2003-04-14 00:00:00	10	3d        
8882	2005-11-06 00:00:00	37	1a        
7771	2005-11-07 00:00:00	37	1c        
7772	2005-11-07 00:00:00	37	1a        
8881	2005-11-08 00:00:00	37	1d        
7778	2005-11-05 00:00:00	10	2a        
7772	2005-11-29 00:00:00	10	3a        
7771	2005-11-04 00:00:00	11	4a        
7771	2005-11-07 00:00:00	11	1b        
7771	2005-11-09 00:00:00	11	5a        
7772	2005-11-07 00:00:00	12	1d        
7773	2005-11-07 00:00:00	13	2d        
7772	2005-11-29 00:00:00	13	1b        
8882	2005-11-13 00:00:00	14	3d        
7771	2005-11-14 00:00:00	14	4d        
7771	2005-11-16 00:00:00	14	5d        
7772	2005-11-29 00:00:00	14	1c        
\.


--
-- TOC entry 2053 (class 0 OID 18334)
-- Dependencies: 175
-- Data for Name: passenger; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY passenger (id_psg, name) FROM stdin;
1	Bruce Willis        
2	George Clooney      
3	Kevin Costner       
4	Donald Sutherland   
5	Jennifer Lopez      
6	Ray Liotta          
7	Samuel L. Jackson   
8	Nikole Kidman       
9	Alan Rickman        
10	Kurt Russell        
11	Harrison Ford       
12	Russell Crowe       
13	Steve Martin        
14	Michael Caine       
15	Angelina Jolie      
16	Mel Gibson          
17	Michael Douglas     
18	John Travolta       
19	Sylvester Stallone  
20	Tommy Lee Jones     
21	Catherine Zeta-Jones
22	Antonio Banderas    
23	Kim Basinger        
24	Sam Neill           
25	Gary Oldman         
26	Clint Eastwood      
27	Brad Pitt           
28	Johnny Depp         
29	Pierce Brosnan      
30	Sean Connery        
31	Bruce Willis        
37	Mullah Omar         
\.


--
-- TOC entry 2054 (class 0 OID 18337)
-- Dependencies: 176
-- Data for Name: trip; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY trip (trip_no, id_comp, plane, town_from, town_to, time_out, time_in) FROM stdin;
1100	4	Boeing    	Rostov                   	Paris                    	1900-01-01 14:30:00	1900-01-01 17:50:00
1101	4	Boeing    	Paris                    	Rostov                   	1900-01-01 08:12:00	1900-01-01 11:45:00
1123	3	TU-154    	Rostov                   	Vladivostok              	1900-01-01 16:20:00	1900-01-01 03:40:00
1124	3	TU-154    	Vladivostok              	Rostov                   	1900-01-01 09:00:00	1900-01-01 19:50:00
1145	2	IL-86     	Moscow                   	Rostov                   	1900-01-01 09:35:00	1900-01-01 11:23:00
1146	2	IL-86     	Rostov                   	Moscow                   	1900-01-01 17:55:00	1900-01-01 20:01:00
1181	1	TU-134    	Rostov                   	Moscow                   	1900-01-01 06:12:00	1900-01-01 08:01:00
1182	1	TU-134    	Moscow                   	Rostov                   	1900-01-01 12:35:00	1900-01-01 14:30:00
1187	1	TU-134    	Rostov                   	Moscow                   	1900-01-01 15:42:00	1900-01-01 17:39:00
1188	1	TU-134    	Moscow                   	Rostov                   	1900-01-01 22:50:00	1900-01-01 00:48:00
1195	1	TU-154    	Rostov                   	Moscow                   	1900-01-01 23:30:00	1900-01-01 01:11:00
1196	1	TU-154    	Moscow                   	Rostov                   	1900-01-01 04:00:00	1900-01-01 05:45:00
7771	5	Boeing    	London                   	Singapore                	1900-01-01 01:00:00	1900-01-01 11:00:00
7772	5	Boeing    	Singapore                	London                   	1900-01-01 12:00:00	1900-01-01 02:00:00
7773	5	Boeing    	London                   	Singapore                	1900-01-01 03:00:00	1900-01-01 13:00:00
7774	5	Boeing    	Singapore                	London                   	1900-01-01 14:00:00	1900-01-01 06:00:00
7775	5	Boeing    	London                   	Singapore                	1900-01-01 09:00:00	1900-01-01 20:00:00
7776	5	Boeing    	Singapore                	London                   	1900-01-01 18:00:00	1900-01-01 08:00:00
7777	5	Boeing    	London                   	Singapore                	1900-01-01 18:00:00	1900-01-01 06:00:00
7778	5	Boeing    	Singapore                	London                   	1900-01-01 22:00:00	1900-01-01 12:00:00
8881	5	Boeing    	London                   	Paris                    	1900-01-01 03:00:00	1900-01-01 04:00:00
8882	5	Boeing    	Paris                    	London                   	1900-01-01 22:00:00	1900-01-01 23:00:00
\.


--
-- TOC entry 1932 (class 2606 OID 18341)
-- Name: pk2; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT pk2 PRIMARY KEY (id_comp);


--
-- TOC entry 1936 (class 2606 OID 18345)
-- Name: pk_psg; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY passenger
    ADD CONSTRAINT pk_psg PRIMARY KEY (id_psg);


--
-- TOC entry 1934 (class 2606 OID 18343)
-- Name: pk_pt; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY pass_in_trip
    ADD CONSTRAINT pk_pt PRIMARY KEY (trip_no, date, id_psg);


--
-- TOC entry 1938 (class 2606 OID 18347)
-- Name: pk_t; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT pk_t PRIMARY KEY (trip_no);


--
-- TOC entry 1939 (class 2606 OID 18348)
-- Name: fk_pass_in_trip_passenger; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY pass_in_trip
    ADD CONSTRAINT fk_pass_in_trip_passenger FOREIGN KEY (id_psg) REFERENCES passenger(id_psg);


--
-- TOC entry 1940 (class 2606 OID 18353)
-- Name: fk_pass_in_trip_trip; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY pass_in_trip
    ADD CONSTRAINT fk_pass_in_trip_trip FOREIGN KEY (trip_no) REFERENCES trip(trip_no);


--
-- TOC entry 1941 (class 2606 OID 18358)
-- Name: fk_trip_company; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY trip
    ADD CONSTRAINT fk_trip_company FOREIGN KEY (id_comp) REFERENCES company(id_comp);


--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-07 21:08:44 MSK

--
-- PostgreSQL database dump complete
--

