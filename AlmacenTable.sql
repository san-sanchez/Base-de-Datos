create table Almacen (		
	Nro int primary key not null,
	Responsable varchar(60)  
);
create table  Articulo(
	CodArt int primary key not null,
	Descripcion char(120),
	precio decimal (6,3) not null
);
create table Material(
	CodMat int primary key not null,
	Descripcion char(120)
);
create table Proveedor(
	CodProv int primary key not null,
	Nombre char(60),
	Domicilio char(30)not null,
	Ciudad char(30) not null
);
create table Tiene(
	Nro int not null,
	CodArt int not null
	CONSTRAINT PKTIENE PRIMARY KEY(Nro,CodArt),
	constraint FKALMACEN FOREIGN KEY(Nro) REFERENCES Almacen(Nro),
	constraint FKARTICULO FOREIGN KEY(CodArt) REFERENCES Articulo(CodArt)
);
Create table Compuesto_Por(
	CodArt int not null,
	CodMat int not null,
	CONSTRAINT PKCOMPUESTO PRIMARY KEY(CodArt,CodMat),
	CONSTRAINT FK_Compuesto_Articulo FOREIGN KEY(CodArt) REFERENCES Articulo(CodArt),
	CONSTRAINT FK_Compuesto_Material FOREIGN KEY(CodMat) REFERENCES Material(CodMat)
); 
Create table Provisto_Por(
	CodProv int not null,
	CodMat int not null,
	CONSTRAINT PKPROVISTO PRIMARY KEY(CodProv,CodMat),
	CONSTRAINT FK_PROVISTO_ARTICULO FOREIGN KEY(CodProv) REFERENCES Proveedor(CodProv),
	CONSTRAINT FK_PROVISTO_MATERIAL FOREIGN KEY(CodMat) REFERENCES Material(CodMat)
); 