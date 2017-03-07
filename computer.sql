--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2017-03-07 21:08:13 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2059 (class 1262 OID 18363)
-- Name: computer; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE computer WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_RU.UTF-8' LC_CTYPE = 'ru_RU.UTF-8';


ALTER DATABASE computer OWNER TO admin;

\connect computer

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
-- TOC entry 173 (class 1259 OID 18364)
-- Name: laptop; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE laptop (
    code integer NOT NULL,
    model character varying(50) NOT NULL,
    speed smallint NOT NULL,
    ram smallint NOT NULL,
    hd real NOT NULL,
    price numeric(12,2),
    screen smallint NOT NULL
);


ALTER TABLE laptop OWNER TO admin;

--
-- TOC entry 174 (class 1259 OID 18367)
-- Name: pc; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE pc (
    code integer NOT NULL,
    model character varying(50) NOT NULL,
    speed smallint NOT NULL,
    ram smallint NOT NULL,
    hd real NOT NULL,
    cd character varying(10) NOT NULL,
    price numeric(12,2)
);


ALTER TABLE pc OWNER TO admin;

--
-- TOC entry 176 (class 1259 OID 18373)
-- Name: printer; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE printer (
    code integer NOT NULL,
    model character varying(50) NOT NULL,
    color character(1) NOT NULL,
    type character varying(10) NOT NULL,
    price numeric(12,2)
);


ALTER TABLE printer OWNER TO admin;

--
-- TOC entry 175 (class 1259 OID 18370)
-- Name: product; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE product (
    maker character varying(10) NOT NULL,
    model character varying(50) NOT NULL,
    type character varying(50) NOT NULL
);


ALTER TABLE product OWNER TO admin;

--
-- TOC entry 2051 (class 0 OID 18364)
-- Dependencies: 173
-- Data for Name: laptop; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY laptop (code, model, speed, ram, hd, price, screen) FROM stdin;
1	1298	350	32	4	700.00	11
2	1321	500	64	8	970.00	12
3	1750	750	128	12	1200.00	14
4	1298	600	64	10	1050.00	15
5	1752	750	128	10	1150.00	14
6	1298	450	64	10	950.00	12
\.


--
-- TOC entry 2052 (class 0 OID 18367)
-- Dependencies: 174
-- Data for Name: pc; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY pc (code, model, speed, ram, hd, cd, price) FROM stdin;
1	1232	500	64	5	12x	600.00
2	1121	750	128	14	40x	850.00
3	1233	500	64	5	12x	600.00
4	1121	600	128	14	40x	850.00
5	1121	600	128	8	40x	850.00
6	1233	750	128	20	50x	950.00
7	1232	500	32	10	12x	400.00
8	1232	450	64	8	24x	350.00
9	1232	450	32	10	24x	350.00
10	1260	500	32	10	12x	350.00
11	1233	900	128	40	40x	980.00
12	1233	800	128	20	50x	970.00
\.


--
-- TOC entry 2054 (class 0 OID 18373)
-- Dependencies: 176
-- Data for Name: printer; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY printer (code, model, color, type, price) FROM stdin;
1	1276	n	Laser	400.00
2	1433	y	Jet	270.00
3	1434	y	Jet	290.00
4	1401	n	Matrix	150.00
5	1408	n	Matrix	270.00
6	1288	n	Laser	400.00
\.


--
-- TOC entry 2053 (class 0 OID 18370)
-- Dependencies: 175
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY product (maker, model, type) FROM stdin;
B	1121	PC
A	1232	PC
A	1233	PC
E	1260	PC
A	1276	Printer
D	1288	Printer
A	1298	Laptop
C	1321	Laptop
A	1401	Printer
A	1408	Printer
D	1433	Printer
E	1434	Printer
B	1750	Laptop
A	1752	Laptop
E	2113	PC
E	2112	PC
\.


--
-- TOC entry 1932 (class 2606 OID 18377)
-- Name: pk_laptop; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY laptop
    ADD CONSTRAINT pk_laptop PRIMARY KEY (code);


--
-- TOC entry 1934 (class 2606 OID 18379)
-- Name: pk_pc; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY pc
    ADD CONSTRAINT pk_pc PRIMARY KEY (code);


--
-- TOC entry 1938 (class 2606 OID 18383)
-- Name: pk_printer; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY printer
    ADD CONSTRAINT pk_printer PRIMARY KEY (code);


--
-- TOC entry 1936 (class 2606 OID 18381)
-- Name: pk_product; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT pk_product PRIMARY KEY (model);


--
-- TOC entry 1939 (class 2606 OID 18384)
-- Name: fk_laptop_product; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY laptop
    ADD CONSTRAINT fk_laptop_product FOREIGN KEY (model) REFERENCES product(model);


--
-- TOC entry 1940 (class 2606 OID 18389)
-- Name: fk_pc_product; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY pc
    ADD CONSTRAINT fk_pc_product FOREIGN KEY (model) REFERENCES product(model);


--
-- TOC entry 1941 (class 2606 OID 18394)
-- Name: fk_printer_product; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY printer
    ADD CONSTRAINT fk_printer_product FOREIGN KEY (model) REFERENCES product(model);


--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-07 21:08:13 MSK

--
-- PostgreSQL database dump complete
--

