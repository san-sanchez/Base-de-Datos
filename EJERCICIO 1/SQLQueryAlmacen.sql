--1. Listar los nombres de los proveedores de la ciudad de La Plata.

SELECT P.CodProv
FROM [dbo].[Proveedor] p
WHERE P.Ciudad LIKE 'La Plata'
--2. Listar los números de artículos cuyo precio sea inferior a $10.

SELECT A.CodArt
FROM [dbo].[Articulo] A	
WHERE A.precio < 10
--3. Listar los responsables de los almacenes.

SELECT A.Responsable
FROM [dbo].[Almacen] A
--4. Listar los códigos de los materiales que provea el proveedor 10 y no los provea el proveedor 15.

SELECT PP.CodMat
FROM [dbo].[Provisto_Por] PP
WHERE PP.CodProv = 3 AND PP.CodMat NOT IN (SELECT P.CodMat
										FROM [dbo].[Provisto_Por] P
										WHERE P.CodProv = 5);
--OTRA OPCION

SELECT PP.CodMat FROM [dbo].[Provisto_Por] PP WHERE PP.CodProv=3
EXCEPT
SELECT P.CodMat FROM [dbo].[Provisto_Por] P WHERE P.CodProv=5 

--5. Listar los números de almacenes que almacenan el artículo A.

SELECT T.Nro
FROM [dbo].[Tiene] T
WHERE T.CodArt=1

--6. Listar los proveedores de Pergamino que se llamen Pérez.

SELECT P.CodProv 
FROM [dbo].[Proveedor] P
WHERE P.Ciudad LIKE 'Pergamino' AND P.Nombre LIKE '%Pérez'

--7. Listar los almacenes que contienen los artículos A y los artículos B (ambos).

SELECT T.Nro
FROM [dbo].[Tiene] T
WHERE T.CodArt = 1 AND  T.Nro  not in(SELECT TT.Nro
										  FROM [dbo].[Tiene] TT
										  WHERE TT.CodArt = 3);

--OTRA OPCION

SELECT T.Nro FROM [dbo].[Tiene] T WHERE T.CodArt=1 
INTERSECT
SELECT TT.Nro FROM [dbo].[Tiene] TT WHERE TT.CodArt=3;

--8. Listar los artículos que cuesten más de $100 o que estén compuestos por el material M1.

SELECT A.CodArt
FROM Articulo A JOIN Compuesto_por C ON A.CodArt = C.CodArt
WHERE A.Precio<100 AND C.CodMat = 1;

SELECT A.CodArt FROM [dbo].[Articulo] A WHERE A.precio < 100
INTERSECT 
SELECT CP.CodArt FROM [dbo].[Compuesto_Por] CP  WHERE CP.CodMat =1;

--9. Listar los materiales, código y descripción, provistos por proveedores de la ciudad de Rosario

SELECT M.*
FROM [dbo].[Material] M 
JOIN [dbo].[Provisto_Por] PP ON M.CodMat=PP.CodMat 
JOIN [dbo].[Proveedor] P ON PP.CodProv = P.CodProv 
WHERE p.Ciudad = 'Rosario'

--10. Listar el código, descripción y precio de los artículos que se almacenan en A1.

SELECT A.CodArt, A.Descripcion, A.Precio
FROM [dbo].[Tiene] T
JOIN [dbo].[Articulo] A ON T.CodArt = A.CodArt
JOIN [dbo].[Almacen] AL ON T.Nro = AL.Nro
WHERE AL.Responsable = 'CABA';