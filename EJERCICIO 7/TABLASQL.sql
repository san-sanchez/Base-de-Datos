CREATE DATABASE EJERCICIO_7
USE EJERCICIO_7

CREATE TABLE Auto(
	matrícula INT PRIMARY KEY NOT NULL, 
	modelo CHAR(30) NOT NULL,
	año DATE NOT NULL
);
CREATE TABLE Chofer(
	nroLicencia INT PRIMARY KEY NOT NULL,
	nombre CHAR(30),
	apellido CHAR(30),
	fecha_ingreso DATE NOT NULL,
	teléfono INT NOT NULL
);
CREATE TABLE Viaje(
	FechaHoraInicio DATE NOT NULL,
	FechaHoraFin DATE NOT NULL,
	chofer int NOT NULL, 
	cliente CHAR(30),
	Autos CHAR(30),
	kmTotales DECIMAL(7,3), 
	esperaTotal DECIMAL(3,2), 
	costoEspera DECIMAL(6,2),
	costoKms  DECIMAL(7,2),
	CONSTRAINT PK_VIAJE PRIMARY KEY(FechaHoraInicio,chofer),
	CONSTRAINT FK_VIAJE_CHOFER FOREIGN KEY(chofer) REFERENCES Chofer(nroLicencia)
);
CREATE TABLE Cliente(
	nroCliente INT PRIMARY KEY NOT NULL, 
	calle CHAR(30) NOT NULL, 
	nro CHAR(30) NOT NULL, 
	localidad CHAR(30) NOT NULL
);