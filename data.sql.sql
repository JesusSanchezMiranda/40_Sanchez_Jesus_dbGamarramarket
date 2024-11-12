/* Crear base de datos modo pro*/
DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE DATABASE IF NOT EXISTS dbGamarraMarket
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish_ci;
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE IF NOT EXISTS CLIENTE
(
    id int auto_increment not null,
    tipo_documento char(3) not null,
    numero_documento CHAR(15) NOT NULL UNIQUE,
    nombres varchar(60) not null,
    apellidos varchar(90)not null,
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool DEFAULT TRUE,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);


-- insertar Datos en la tabla cliente ---
 INSERT INTO CLIENTE (tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo)
VALUES 
('DNI', '77889955', 'Alberto', 'Solano Pariona', 'alberto.pariona@empresa.com', '998456103', STR_TO_DATE('1970-02-10', '%Y-%m-%d'), true),
('DNI', '45781233', 'Alicia', 'Garcia Campos', '', '', STR_TO_DATE('1980-03-20', '%Y-%m-%d'), true),
('CNE', '315487922', 'Juana', 'Avila Chumpitaz', 'juana.avila@gmail.com', '923568741', STR_TO_DATE('1986-06-06', '%Y-%m-%d'), true),
('CNE', '122116633', 'Ana', 'Enriquez Flores', 'ana.enriquez@empresa.com', '983658741', STR_TO_DATE('1965-08-01', '%Y-%m-%d'), true),
('DNI', '088741589', 'Claudia', 'Perales Ortiz', 'claudia.perales@yahoo.com', '979845263', STR_TO_DATE('1981-07-25', '%Y-%m-%d'), true),
('DNI', '41528527', 'Mario', 'Barrios Martinez', 'mario.barrios@outlook.com', '986525871', STR_TO_DATE('1987-01-15', '%Y-%m-%d'), true),
('CNE', '172585864', 'Brunela', 'Tarazona Guerra', 'brunela.tarazona@gmail.com', '995236741', STR_TO_DATE('1995-06-01', '%Y-%m-%d'), true),
('DNI', '213756456', 'Alejandro', 'Jimenez Huapaya', '', '941523656', STR_TO_DATE('1968-06-08', '%Y-%m-%d'), true),
('DNI', '153352585', 'Claudia', 'Marquez Litano', 'claudia.marquez@gmail.com', '985814725', STR_TO_DATE('1991-11-19', '%Y-%m-%d'), true),
('CNE', '465772587', 'Mario', 'Rodriguez Mayo', 'mario.rodriguez@outlook.com', '912665287', STR_TO_DATE('1987-11-10', '%Y-%m-%d'), true),
('DNI', '379525514', 'Luisa', 'Guerra Ibarra', 'luisa.guerra@yahoo.com', '974422135', STR_TO_DATE('1988-12-21', '%Y-%m-%d'), true),
('DNI', '741425858', 'Pedro', 'Candela Valenzuela', 'pedro.candela@gmail.com', '941481525', STR_TO_DATE('1995-06-30', '%Y-%m-%d'), true),
('DNI', '53298147', 'Angel', 'Rojas Avila', 'angel.rojas@outlook.com', '997452301', STR_TO_DATE('1975-03-02', '%Y-%m-%d'), true),
('DNI', '15335265', 'Hilario', 'Avila Huapaya', '', '985143256', STR_TO_DATE('2000-04-25', '%Y-%m-%d'), true),
('CNE', '754721186', 'Octavio', 'Marquez Osorio', 'octavio.marquez@yahoo.es', '966223141', STR_TO_DATE('2000-09-25', '%Y-%m-%d'), true),
('DNI', '558639219', 'Manolo', 'Vasquez Saravia', 'manolo.vasquez@outlook.es', '965325874', STR_TO_DATE('1998-01-01', '%Y-%m-%d'), true),
('DNI', '41552657', 'Genoveva', 'Ortiz Quispe', 'genoveva.ortiz@outlook.es', '925641317', STR_TO_DATE('2003-02-14', '%Y-%m-%d'), true),
('CNE', '49985471', 'Oscar', 'Quiroz Zavala', '', '', STR_TO_DATE('2000-03-17', '%Y-%m-%d'), true),
('DNI', '49942217', 'Veronica', 'Romero Vargas', 'veronica.romero@yahoo.es', '988223145', STR_TO_DATE('2002-08-25', '%Y-%m-%d'), true),
('DNI', '200523641', 'Eliseo', 'Prada Ortiz', 'eliseo.prada@yahoo.com', '', STR_TO_DATE('2004-09-15', '%Y-%m-%d'), true);

SELECT * FROM CLIENTE;

/* Crear la tabla VENDEDOR */
CREATE TABLE IF NOT EXISTS VENDEDOR
(
  id int auto_increment not null,
  tipo_documento char(3) not null,
   numero_documento CHAR(15) NOT NULL UNIQUE,
  nombres varchar(60) not null,
  apellidos varchar(90) not null,
  salario decimal(8,2) not null,
  celular char(9),
  email varchar(80),
  activo bool DEFAULT TRUE,
  CONSTRAINT vendedor_pk PRIMARY KEY (id)
);

INSERT INTO VENDEDOR (tipo_documento, numero_documento, nombres, apellidos, salario, celular, email, activo) VALUES 
('DNI', '85471236', 'Enrique', 'Perez Manzo', '1500.00', '965218732', 'enrique.perez@outolook.com', true),
('DNI', '47259136', 'Sofia', 'Ávila Solis', '1350.00', '', '', true),
('DNI', '61542280', 'Marcela', 'Napaico Cama', '1600.00', '965874357', 'marcela.napaico@gmail.com', true),
('CNE', '742536140', 'Carmelo', 'Rodriguez Chauca', '1550.00', '', 'carmelo.rodriguez@outolook.com', true);

SELECT * FROM VENDEDOR;

/* Crear la tabla VENTA */
CREATE TABLE IF NOT EXISTS VENTA
(
id int auto_increment not null,
fecha_hora timestamp DEFAULT current_timestamp,
activo bool DEFAULT TRUE,
cliente int,
vendedor int,
CONSTRAINT venta_pk PRIMARY KEY (id) 
);

INSERT INTO VENTA (activo, cliente, vendedor) VALUES 
(true, '4', '1'),
(true, '6', '3'),
(true, '10', '1'),
(true, '18', '4');

SELECT * FROM VENTA;


/* Crear la tabla VENTA_DETALLE */
CREATE TABLE IF NOT EXISTS VENTA_DETALLE
(
id int auto_increment not null,
cantidad int not null,
venta int,
prenda int,
CONSTRAINT venta_detalle_pk PRIMARY KEY (id)
);


/* Crear la tabla PRENDA */
CREATE TABLE IF NOT EXISTS PRENDA 
(
id int auto_increment not null,
descripcion varchar(90) not null,
marca varchar(60) not null,
cantidad int not null,
talla varchar(10) not null,
precio decimal(8,2) not null,
activo bool DEFAULT TRUE,
CONSTRAINT prenda_pk PRIMARY KEY (id)
);

INSERT INTO PRENDA (descripcion, marca, cantidad, talla, precio, activo) VALUES ('Pantalon Jean', 'Levis', '60', '28', '65.80', true),
('Camisa Negra corta', 'Adams', '75', '16', '55.80', true),
('Polo Sport', 'Australia', '100', '16', '40.50', true),
('Pijama para caballero', 'Adams', '180', '28', '79.50', true),
('Pantalon Jeans', 'Australia', '200', '28', '68.50', true),
('Camisa Sport', 'Jhon Holden', '85', '16', '88.50', true),
('Shorts Jeans', 'Pepe Jeans', '185', '28', '77.20', true);




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






