DROP TABLE ASUNTOS;
DROP TABLE CLIENTES;
DROP TABLE PROCURADOR;
DROP TABLE EXPEDIENTE_PROCURADOR;

CREATE TABLE ASUNTOS(
ID_EXPEDIENTE NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
NUMERO_EXPEDIENTE NVARCHAR2(255),
DESCRIPCION NVARCHAR2(225),
FECHA_INICIO DATE,
FECHA_FINALIZADO DATE,
ESTADO NVARCHAR2(225),
CLIENTE_ID NVARCHAR2(225)
);
ALTER TABLE ASUNTOS ADD CONSTRAINT CHK_ASUNTOS_CONTROLADO
CHECK(ESTADO IN('TRAMITE','ARCHIVADO'));
SELECT * FROM ASUNTOS;

CREATE TABLE CLIENTES(
ID_CLIENTE NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
DNI NVARCHAR2(255),
NOMBRE NVARCHAR2(255),
DOMICILIO NVARCHAR2(255),
TELEFONO NVARCHAR2(225)
);

CREATE TABLE PROCURADOR(
ID_PROCURADOR  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
CEDULA NVARCHAR2(225),
NOMBRE NVARCHAR2(225),
DOMICILIO NVARCHAR2(225),
TELEFONO NVARCHAR2(225)
);

CREATE TABLE EXPEDIENTE_PROCURADOR(
EXPEDIENTE_ID NUMBER,
PROCURADOR_ID NUMBER
);

ALTER TABLE ASUNTOS ADD CONSTRAINT FK_ASUNTO_CLIENTE_ID
FOREIGN KEY(CLIENTE_ID) --QUIEN RECIBE EL DATO 
REFERENCES CLIENTES(ID_CLIENTE); --DE DONDE VIENE EL DATO 

ALTER TABLE EXPEDIENTE_PROCURADOR ADD CONSTRAINT FK_EXPEDIENTE_ID
FOREIGN KEY(EXPEDIENTE_ID) --QUIEN RECIBE EL DATO 
REFERENCES ASUNTOS(ID_EXPEDIENTE); --DE DONDE VIENE EL DATO 

ALTER TABLE EXPEDIENTE_PROCURADOR ADD CONSTRAINT FK_PROCURADOR_ID
FOREIGN KEY(PROCURADOR_ID) --QUIEN RECIBE EL DATO 
REFERENCES PROCURADOR(ID_PROCURADOR);

SELECT * FROM CLIENTES;
DESCRIBE CLIENTES;
ALTER TABLE ASUNTOS MODIFY CLIENTE_ID NUMBER;
ALTER TABLE CLIENTES ADD CONSTRAINT UQ_DNI
UNIQUE(DNI);
ALTER TABLE CLIENTES ADD CONSTRAINT UQ_TELEFONO
UNIQUE(TELEFONO);


INSERT INTO CLIENTES(DNI,NOMBRE,DOMICILIO,TELEFONO)
VALUES('00000-NN2','ROMAN LAZARO','AV.DOCTOR #50','961-111-1112');

INSERT INTO CLIENTES(DNI,NOMBRE,DOMICILIO,TELEFONO)
VALUES('00000-NN3','MANUEL FUENTES','AV.INGENIERO #57','961-111-1122');

INSERT INTO CLIENTES(DNI,NOMBRE,DOMICILIO,TELEFONO)
VALUES('00000-NN4','ALEX QUIJANO','AV.LICENCIADO #40','961-111-2342');

INSERT INTO CLIENTES(DNI,NOMBRE,DOMICILIO,TELEFONO)
VALUES('00000-NN5','ANTONIO BARRERA','AV.CAMPESINO #35','961-543-2342');

INSERT INTO CLIENTES(DNI,NOMBRE,DOMICILIO,TELEFONO)
VALUES('00000-NN6','FERNANDO D','AV.FILOSOFO #20','966-573-2242');

SELECT * FROM CLIENTES;

SELECT * FROM PROCURADOR;
DESCRIBE PROCURADOR;
ALTER TABLE PROCURADOR ADD CONSTRAINT UQ_CEDULA
UNIQUE(CEDULA);
ALTER TABLE PROCURADOR ADD CONSTRAINT UQ_TELEFONO2
UNIQUE(TELEFONO);

INSERT INTO PROCURADOR(CEDULA,NOMBRE,DOMICILIO,TELEFONO)
VALUES('1234-MN1','FULANITO DDD','AV.UNO','222-111-1111');

INSERT INTO PROCURADOR(CEDULA,NOMBRE,DOMICILIO,TELEFONO)
VALUES('1234-MM2','PEDRITO PE','AV.DOS','222-111-1234');

INSERT INTO PROCURADOR(CEDULA,NOMBRE,DOMICILIO,TELEFONO)
VALUES('1234-DD2','PABLO PICAPIEDRAS','AV.TRES','222-897-1234');

DESCRIBE ASUNTOS;
SELECT * FROM ASUNTOS;
ALTER TABLE ASUNTOS ADD CONSTRAINT UQ_ASUNTOS
UNIQUE(NUMERO_EXPEDIENTE);

INSERT INTO ASUNTOS(NUMERO_EXPEDIENTE,DESCRIPCION,FECHA_INICIO,FECHA_FINALIZADO,ESTADO,CLIENTE_ID)
VALUES('#12345','MALTRATO INFANTIL','27/03/2023','10/11/2023','ARCHIVADO',21);
INSERT INTO ASUNTOS(NUMERO_EXPEDIENTE,DESCRIPCION,FECHA_INICIO,FECHA_FINALIZADO,ESTADO,CLIENTE_ID)
VALUES('#123456','GOLPEADO','27/03/2023','','TRAMITE',22);
INSERT INTO ASUNTOS(NUMERO_EXPEDIENTE,DESCRIPCION,FECHA_INICIO,FECHA_FINALIZADO,ESTADO,CLIENTE_ID)
VALUES('#124','PENSION','20/08/2023','','TRAMITE',24);

SELECT * FROM EXPEDIENTE_PROCURADOR;
SELECT * FROM ASUNTOS;
SELECT *FROM PROCURADOR;
DESCRIBE EXPEDIENTE_PROCURADOR;

INSERT INTO EXPEDIENTE_PROCURADOR(EXPEDIENTE_ID,PROCURADOR_ID)
VALUES(4,5);
INSERT INTO EXPEDIENTE_PROCURADOR(EXPEDIENTE_ID,PROCURADOR_ID)
VALUES(4,6);
INSERT INTO EXPEDIENTE_PROCURADOR(EXPEDIENTE_ID,PROCURADOR_ID)
VALUES(5,6);
INSERT INTO EXPEDIENTE_PROCURADOR(EXPEDIENTE_ID,PROCURADOR_ID)
VALUES(6,6);





SELECT * FROM ASUNTOS;
SELECT * FROM CLIENTES;
SELECT * FROM PROCURADOR;
SELECT * FROM EXPEDIENTE_PROCURADOR;