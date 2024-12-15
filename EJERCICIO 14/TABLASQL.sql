CREATE DATABASE EJERCICIO_14
USE EJERCICIO_14

-- Tabla Cliente
CREATE TABLE Cliente (
    NroCliente INT PRIMARY KEY NOT NULL,
    RazonSocial VARCHAR(100) NOT NULL
);

-- Tabla Festejo
CREATE TABLE Festejo (
    NroFestejo INT PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(150) NOT NULL,
    Fecha DATE NOT NULL,
    NroCliente INT NOT NULL,
    CONSTRAINT FK_FESTEJO_CLIENTE FOREIGN KEY (NroCliente) REFERENCES Cliente(NroCliente)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    NroServicio INT PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL -- Precio con hasta 2 decimales
);

-- Tabla Contrata
CREATE TABLE Contrata (
    NroFestejo INT NOT NULL,
    Item INT NOT NULL, -- Identificador único por item dentro de un festejo
    NroServicio INT NOT NULL,
    HDesde TIME NOT NULL,
    HHasta TIME NOT NULL,
    CONSTRAINT PK_CONTRATA PRIMARY KEY (NroFestejo, Item), -- Clave primaria compuesta
    CONSTRAINT FK_CONTRATA_FESTEJO FOREIGN KEY (NroFestejo) REFERENCES Festejo(NroFestejo),
    CONSTRAINT FK_CONTRATA_SERVICIO FOREIGN KEY (NroServicio) REFERENCES Servicio(NroServicio)
);
