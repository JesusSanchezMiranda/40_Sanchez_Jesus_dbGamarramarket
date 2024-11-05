/* Crear base de datos modo pro*/
CREATE DATABASE IF NOT EXISTS dbGamarraMarket
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish_ci;
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE
(
    id int auto_increment not null,
    tipo_documento char(3) not null,
    numero_documento char(9) not null,
    nombres varchar(60) not null,
    apellidos varchar(90)not null,
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);

/* Crear la tabla VENDEDOR */
CREATE TABLE VENDEDOR
(
  id int auto_increment not null,
  tipo_documento char(3) not null,
  numero_documento char(3) not null,
  nombres varchar(60) not null,
  apellidos varchar(90) not null,
  salario decimal(8,2) not null,
  celular char(9),
  email varchar(80),
  activo bool,
  CONSTRAINT vendedor_pk PRIMARY KEY (id)
);

/* Crear la tabla VENTA */
CREATE TABLE VENTA
(
id int auto_increment not null,
fecha_hora timestamp DEFAULT current_timestamp,
activo bool,
cliente int,
vendedor int,
CONSTRAINT venta_pk PRIMARY KEY (id) 
);

/* Crear la tabla VENTA_DETALLE */
CREATE TABLE VENTA_DETALLE
(
id int auto_increment not null,
cantidad int not null,
venta int,
prenda int,
CONSTRAINT venta_detalle_pk PRIMARY KEY (id)
);

/* Crear la tabla PRENDA */
CREATE TABLE PRENDA 
(
id int auto_increment not null,
descripcion varchar(90) not null,
marca varchar(60) not null,
cantidad int not null,
talla varchar(10) not null,
precio decimal(8,2) not null,
activo bool,
CONSTRAINT prenda_pk PRIMARY KEY (id)
);


/*Listar estructura de tabla CLIENTES*/
SHOW COLUMNS IN CLIENTE;	

/*Listar estructura de tabla VENDEDOR*/
SHOW COLUMNS IN VENDEDOR;

/*Listar estructura de tabla VENTA*/
SHOW COLUMNS IN VENTA;

/*Listar estructura de tabla VENTA_DETALLE*/
SHOW COLUMNS IN VENTA_DETALLE;

/*Listar estructura de tabla PRENDA*/
SHOW COLUMNS IN PRENDA;


/*Listar las tablas en uso dentro de la base de datos*/
SHOW TABLES;

/*Agregar columna estado civil*/
ALTER TABLE CLIENTE
ADD COLUMN estado_civil char(1);

/*Eliminar la columna fecha_nacimiento*/
ALTER TABLE CLIENTE
DROP COLUMN fecha_nacimiento;


/*Crear relacion de VENTA_CLIENTE*/
ALTER TABLE VENTA
ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente)
REFERENCES CLIENTE (id)
ON UPDATE CASCADE 
ON DELETE CASCADE;


ALTER TABLE VENTA 
ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY (vendedor)
REFERENCES VENDEDOR (id)
ON UPDATE CASCADE 
ON DELETE CASCADE;

ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY (venta)
REFERENCES VENTA (id)
ON UPDATE CASCADE 
ON DELETE CASCADE;

ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY (prenda)
REFERENCES PRENDA (id)
ON UPDATE CASCADE 
ON DELETE CASCADE;

SELECT 
    table_name AS 'Tabla',
    column_name AS 'Columna',
    constraint_name AS 'Nombre de la Clave Foránea',
    referenced_table_name AS 'Tabla Referenciada',
    referenced_column_name AS 'Columna Referenciada'
FROM
    information_schema.KEY_COLUMN_USAGE
WHERE
    table_schema = 'dbGamarraMarket'
    AND referenced_table_name IS NOT NULL;







