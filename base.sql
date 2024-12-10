DROP DATABASE BancoDB;
CREATE DATABASE BancoDB;

DROP USER 'userapp'@'localhost';

CREATE USER 'userapp'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON * . * TO 'userapp'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE BancoDB.Clientes (
    id_cliente int,
    nombre varchar(30),
    ciudad varchar(15),
   	PRIMARY KEY (id_cliente)
);

CREATE TABLE BancoDB.Cuentas (
    id_cuenta int,
    id_cliente int,
    tipo_cuenta varchar(10),
	saldo decimal(10),
	PRIMARY KEY (id_cuenta),
	FOREIGN KEY (id_cliente) REFERENCES BancoDB.Clientes(id_cliente)
);


INSERT INTO BancoDB.Clientes (id_cliente, nombre, ciudad) VALUES(1, 'Pedro',
'Guatemala');
INSERT INTO BancoDB.Clientes (id_cliente, nombre, ciudad) VALUES(2, 'Luis',
'Guatemala');
INSERT INTO BancoDB.Clientes (id_cliente, nombre, ciudad) VALUES(3, 'Ana',
'Guatemala');
INSERT INTO BancoDB.Clientes (id_cliente, nombre, ciudad) VALUES(4, 'Sofia',
'Guatemala');


INSERT INTO BancoDB.Cuentas (id_cuenta, id_cliente, tipo_cuenta, saldo)
VALUES(1, 1, 'Monetaria', 1000.00);
INSERT INTO BancoDB.Cuentas (id_cuenta, id_cliente, tipo_cuenta, saldo)
VALUES(2, 2, 'Monetaria', 1000.00);
INSERT INTO BancoDB.Cuentas (id_cuenta, id_cliente, tipo_cuenta, saldo)
VALUES(3, 3, 'Monetaria', 1000.00);
INSERT INTO BancoDB.Cuentas (id_cuenta, id_cliente, tipo_cuenta, saldo)
VALUES(4, 4, 'Monetaria', 1000.00);



