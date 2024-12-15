CREATE DATABASE EJERCICIO_12
USE EJERCICIO_12

-- Tabla Proveedor
CREATE TABLE Proveedor (
    CodProv INT PRIMARY KEY NOT NULL,
    RazonSocial VARCHAR(100) NOT NULL,
    FechaInicio DATE NOT NULL
);

-- Tabla Producto
CREATE TABLE Producto (
    CodProd INT PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    CodProv INT NOT NULL,
    StockActual INT NOT NULL DEFAULT 0, -- Stock inicial por defecto 0
    CONSTRAINT FK_PRODUCTO_PROVEEDOR FOREIGN KEY (CodProv) REFERENCES Proveedor(CodProv)
);

-- Tabla Stock
CREATE TABLE Stock (
    Nro INT  NOT NULL, -- Identificador único del movimiento
    Fecha DATE NOT NULL,
    CodProd INT NOT NULL,
    Cantidad INT NOT NULL, -- Puede ser positivo o negativo según ingreso/salida
	CONSTRAINT PK_STOCK PRIMARY KEY (Nro,Fecha,CodProd),
    CONSTRAINT FK_STOCK_PRODUCTO FOREIGN KEY (CodProd) REFERENCES Producto(CodProd)
);
