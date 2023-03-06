--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-03-05 23:08:08

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
-- TOC entry 3351 (class 1262 OID 16394)
-- Name: platzi-market; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "platzi-market" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Paraguay.1252';


ALTER DATABASE "platzi-market" OWNER TO postgres;

\connect -reuse-previous=on "dbname='platzi-market'"

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
-- TOC entry 210 (class 1259 OID 16396)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    descripcion character varying(45) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: categorias_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 209
-- Name: categorias_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_categoria_seq OWNED BY public.categorias.id_categoria;


--
-- TOC entry 213 (class 1259 OID 16414)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id character varying(20) NOT NULL,
    nombre character varying(40),
    apellidos character varying(100),
    celular numeric,
    direccion character varying(80),
    correo_electronico character varying(70)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16422)
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras (
    id_compra integer NOT NULL,
    id_cliente character varying(20) NOT NULL,
    fecha timestamp without time zone,
    medio_pago character(1),
    comentario character varying(300),
    estado character(1)
);


ALTER TABLE public.compras OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16421)
-- Name: compras_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compras_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compras_id_compra_seq OWNER TO postgres;

--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 214
-- Name: compras_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_id_compra_seq OWNED BY public.compras.id_compra;


--
-- TOC entry 216 (class 1259 OID 16433)
-- Name: compras_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras_productos (
    id_compra integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer,
    total numeric(16,2),
    estado boolean
);


ALTER TABLE public.compras_productos OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16403)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character varying(45),
    id_categoria integer NOT NULL,
    codigo_barras character varying(150),
    precio_venta numeric(16,2),
    cantidad_stock integer NOT NULL,
    estado boolean
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16402)
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_producto_seq OWNER TO postgres;

--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 211
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;


--
-- TOC entry 3182 (class 2604 OID 24586)
-- Name: categorias id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_id_categoria_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 24587)
-- Name: compras id_compra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras ALTER COLUMN id_compra SET DEFAULT nextval('public.compras_id_compra_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 24588)
-- Name: productos id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);


--
-- TOC entry 3339 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id_categoria, descripcion, estado) FROM stdin;
1	Frutas y verduras	t
2	Pastelería	t
3	Carnes y pescados	t
4	Lácteos y huevos	t
5	Bebidas	t
6	Licores	t
7	Cuidado personal	t
8	Despensa	t
\.


--
-- TOC entry 3342 (class 0 OID 16414)
-- Dependencies: 213
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, apellidos, celular, direccion, correo_electronico) FROM stdin;
4546221	Johannes	Kepler	3104583224	Cl 3 # 33 - 33	kepler@me.com
2552243	Galileo	Galilei	3462257293	Cl 1 # 11 - 11	gali@leo.com
983824	Nicolás	Copernico	3019392466	Cl 2 # 22 - 22	nico@cope.com
\.


--
-- TOC entry 3344 (class 0 OID 16422)
-- Dependencies: 215
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras (id_compra, id_cliente, fecha, medio_pago, comentario, estado) FROM stdin;
1	4546221	1992-08-10 17:30:00	E		P
2	4546221	2023-02-04 17:30:00	T		P
\.


--
-- TOC entry 3345 (class 0 OID 16433)
-- Dependencies: 216
-- Data for Name: compras_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras_productos (id_compra, id_producto, cantidad, total, estado) FROM stdin;
1	1	10	3000.00	t
1	36	1	40000.00	t
1	27	1	9000.00	t
1	49	2	16400.00	t
1	24	1	4000.00	t
2	1	10	3000.00	t
2	24	1	4000.00	t
2	27	1	9000.00	t
2	36	1	40000.00	t
2	49	2	16400.00	t
\.


--
-- TOC entry 3341 (class 0 OID 16403)
-- Dependencies: 212
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) FROM stdin;
1	Guayaba Feijoa	1	7029 A42 23	300.00	500	t
2	Mango	1	0316 R56 01	2100.00	250	t
3	Manzana	1	7923 T23 19	700.00	130	t
4	Aguacate	1	9322 Q33 02	2500.00	98	t
5	Lechuga	1	9742 S22 21	4000.00	86	t
6	Tomate	1	0483 R00 97	290.00	430	t
7	Pera	1	9999 X10 01	750.00	210	t
8	Apio	1	3390 F29 45	150.00	115	t
9	Papaya	1	5291 J34 32	4500.00	73	t
10	Limón	1	7886 N18 32	350.00	425	t
11	Brownie	2	6683 H15 20	2500.00	80	t
12	Pan tajado	2	5745 F05 47	4500.00	120	t
13	Torta	2	3831 D97 99	10000.00	35	t
14	Tortilla	2	4335 Z33 84	6400.00	87	t
15	Tostadas	2	6584 M19 25	4000.00	45	t
16	Chocorramo	2	4487 S00 97	2000.00	105	t
17	Salmón	3	4546 A00 01	28000.00	55	t
18	Punta de anca	3	3678 E57 22	12000.00	32	t
19	Posta	3	8893 O01 03	7800.00	40	t
20	Costilla de cerdo	3	4534 Q12 88	8600.00	70	t
21	Tilapia	3	5684 R53 02	17000.00	60	t
22	Merluza	3	3523 R04 00	23000.00	45	t
23	Leche de vaca	4	2323 T56 33	2500.00	500	t
24	Queso	4	7786 K19 56	4000.00	300	t
25	Huevos de gallina feliz	4	3478 M74 01	400.00	1000	t
26	Clara de huevo	4	7932 R31 46	3200.00	200	t
27	Suero costeño	4	5463 W23 33	9000.00	110	t
28	Agua	5	8965 I32 11	2000.00	600	t
29	Jugo de naranja	5	7445 T87 44	7400.00	200	t
30	Gaseosa Colombiana	5	3434 R34 63	3100.00	175	t
31	Jugo de Lulo	5	9753 W33 19	8250.00	630	t
32	Tea	5	9836 F35 69	1900.00	450	t
33	Cerveza	6	3432 G67 21	2100.00	800	t
34	Tequila	6	9529 E45 98	65000.00	764	t
35	Ron	6	1947 R07 53	55000.00	240	t
36	Aguardiente Antioqueño	6	3160 A54 94	40000.00	480	t
37	Vino	6	7891 W46 95	82000.00	560	t
38	Crema dental	7	6310 C99 73	7500.00	200	t
39	Jabón de manos	7	9371 J14 75	4900.00	90	t
40	Enjuague bucal	7	1942 T68 01	12000.00	105	t
41	Shampoo	7	6789 W01 23	9300.00	200	t
42	Desodorante	7	7333 S21 36	6900.00	85	t
43	Arroz	8	4676 I83 00	3500.00	600	t
44	Lentejas	8	7333 S21 36	3000.00	560	t
45	Harina	8	7333 S21 36	1800.00	300	t
46	Sal	8	7333 S21 36	1400.00	500	t
47	Aceite	8	7333 S21 36	6500.00	135	t
48	Cereal	8	4673 K53 98	7000.00	75	t
49	Frijol	8	2745 F40 45	8200.00	270	t
50	Café	8	6351 R33 92	7200.00	400	t
52	Lechosaaa	1	\N	2000.00	28	t
\.


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 209
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 8, true);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 214
-- Name: compras_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_id_compra_seq', 2, true);


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 211
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 52, true);


--
-- TOC entry 3186 (class 2606 OID 16401)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 3190 (class 2606 OID 16420)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16427)
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id_compra);


--
-- TOC entry 3194 (class 2606 OID 16437)
-- Name: compras_productos compras_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_productos
    ADD CONSTRAINT compras_productos_pkey PRIMARY KEY (id_compra, id_producto);


--
-- TOC entry 3188 (class 2606 OID 16408)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 3196 (class 2606 OID 16428)
-- Name: compras fk_COMPRAS_CLIENTES1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT "fk_COMPRAS_CLIENTES1" FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3198 (class 2606 OID 16443)
-- Name: compras_productos fk_COMPRAS_PRODUCTOS_COMPRAS1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_productos
    ADD CONSTRAINT "fk_COMPRAS_PRODUCTOS_COMPRAS1" FOREIGN KEY (id_compra) REFERENCES public.compras(id_compra);


--
-- TOC entry 3197 (class 2606 OID 16438)
-- Name: compras_productos fk_COMPRAS_PRODUCTOS_PRODUCTOS1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_productos
    ADD CONSTRAINT "fk_COMPRAS_PRODUCTOS_PRODUCTOS1" FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 3195 (class 2606 OID 16409)
-- Name: productos fk_PRODUCTOS_CATEGORIAS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT "fk_PRODUCTOS_CATEGORIAS" FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);


-- Completed on 2023-03-05 23:08:14

--
-- PostgreSQL database dump complete
--

