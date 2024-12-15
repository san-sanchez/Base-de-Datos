CREATE DATABASE EJERCICIO_3
USE EJERCICIO_3
GO
CREATE TABLE Proveedor(
	idProveedor INT PRIMARY KEY NOT NULL, 
	nombre CHAR(30), 
	respdCivil CHAR(30), 
	cuit INT
);
CREATE TABLE Producto(
	idProducto INT PRIMARY KEY NOT NULL, 
	nombre CHAR(30), 
	descripcion VARCHAR(30), 
	estado CHAR(30), 
	idProveedor INT NOT NULL,
	CONSTRAINT FK_PRODUCTO_PROVEEDOR FOREIGN KEY(idProveedor) REFERENCES Proveedor(idProveedor)
);
CREATE TABLE Cliente(
	idCliente INT PRIMARY KEY NOT NULL, 
	nombre CHAR(30), 
	respIVA CHAR(30) NOT NULL, 
	CUIL INT NOT NULL
);
CREATE TABLE Vendedor(
	idEmpleado INT PRIMARY KEY NOT NULL, 
	nombre CHAR(30), 
	apellido CHAR(30), 
	DNI INT NOT NULL
);
CREATE TABLE Direccion(
	idDir INT PRIMARY KEY NOT NULL, 
	idPers INT NOT NULL, 
	calle CHAR(30) NOT NULL, 
	nro INT NOT NULL, 
	piso INT, 
	dpto CHAR(30)
);
CREATE TABLE Venta(
	nroFactura INT NOT NULL, 
	idCliente INT NOT NULL, 
	fecha DATE NOT NULL, 
	idVendedor INT NOT NULL,
	CONSTRAINT PK_VENTA PRIMARY KEY (nroFactura,idCliente),
	CONSTRAINT FK_VENTA_CLIENTE FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente),
	CONSTRAINT FK_VENTA_VENFDEDOR FOREIGN KEY(idVendedor) REFERENCES Vendedor(idEmpleado)
);
CREATE TABLE Detalle_Venta(
	nroFactura INT PRIMARY KEY NOT NULL,
	nro INT NOT NULL,
	idProducto INT NOT NULL, 
	cantidad INT NOT NULL,
	precioUnitario DECIMAL(6,2),
	CONSTRAINT FK_DETALLE_VENTA FOREIGN KEY(idProducto) REFERENCES Producto(idProducto)
);

