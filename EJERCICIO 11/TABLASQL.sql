CREATE DATABASE EJERCICIO_11
USE EJERCICIO_11

-- Tabla Genero
CREATE TABLE Genero (
    Id INT PRIMARY KEY NOT NULL,
    NombGenero VARCHAR(50) NOT NULL
);

-- Tabla Director
CREATE TABLE Director (
    Id INT PRIMARY KEY NOT NULL,
    NyA VARCHAR(100) NOT NULL -- Nombre y Apellido
);

-- Tabla Cliente
CREATE TABLE Cliente (
    CodCli INT PRIMARY KEY NOT NULL,
    NyA VARCHAR(100) NOT NULL, -- Nombre y Apellido
    Direccion VARCHAR(150) NOT NULL,
    Tel VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Borrado INT NOT NULL DEFAULT 2 -- 1: Sí, 2: No (por defecto)
);

-- Tabla Película
CREATE TABLE Pelicula (
    CodPel INT PRIMARY KEY NOT NULL,
    Titulo VARCHAR(100) NOT NULL,
    Duracion INT NOT NULL, -- Duración en minutos
    CodGenero INT NOT NULL,
    IdDirector INT NOT NULL,
    CONSTRAINT FK_PELICULA_GENERO FOREIGN KEY (CodGenero) REFERENCES Genero(Id),
    CONSTRAINT FK_PELICULA_DIRECTOR FOREIGN KEY (IdDirector) REFERENCES Director(Id)
);

-- Tabla Ejemplar
CREATE TABLE Ejemplar (
    NroEj INT PRIMARY KEY NOT NULL,
    CodPel INT NOT NULL,
    Estado BIT NOT NULL, -- 1: Disponible, 0: No Disponible
    CONSTRAINT FK_EJEMPLAR_PELICULA FOREIGN KEY (CodPel) REFERENCES Pelicula(CodPel)
);


-- Tabla Alquiler
CREATE TABLE Alquiler (
    Id INT PRIMARY KEY NOT NULL,
    NroEj INT NOT NULL,
    CodPel INT NOT NULL,
    CodCli INT NOT NULL,
    FechaAlq DATE NOT NULL,
    FechaDev DATE NULL, -- Puede ser NULL si aún no se devolvió
    CONSTRAINT FK_ALQUILER_EJEMPLAR FOREIGN KEY (NroEj) REFERENCES Ejemplar(NroEj),
    CONSTRAINT FK_ALQUILER_PELICULA FOREIGN KEY (CodPel) REFERENCES Pelicula(CodPel),
    CONSTRAINT FK_ALQUILER_CLIENTE FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli)
);
