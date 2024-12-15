CREATE DATABASE EJERCICIO_13
USE EJERCICIO_13

-- Tabla Nivel
CREATE TABLE Nivel (
    Codigo INT PRIMARY KEY NOT NULL, 
    Descripcion VARCHAR(100) NOT NULL
);

-- Tabla Medición
CREATE TABLE Medicion (
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Metrica VARCHAR(50) NOT NULL,
    Temperatura DECIMAL(5, 2) NOT NULL, -- Ejemplo: hasta 999.99
    Presion DECIMAL(7, 2) NOT NULL, -- Ejemplo: hasta 99999.99
    Humedad DECIMAL(5, 2) NOT NULL, -- Ejemplo: hasta 100.00
    Nivel INT NOT NULL, -- Relación con tabla Nivel
    CONSTRAINT FK_MEDICION_NIVEL FOREIGN KEY (Nivel) REFERENCES Nivel(Codigo),
    CONSTRAINT PK_MEDICION PRIMARY KEY (Fecha, Hora, Metrica)
);

