--1. Listar los nombres de los proveedores de la ciudad de La Plata.
FROM Articulo A JOIN Compuesto_por C ON A.CodArt = C.CodArt
WHERE A.Precio<100 AND C.CodMat = 1;
FROM [dbo].[Tiene] T
JOIN [dbo].[Articulo] A ON T.CodArt = A.CodArt
JOIN [dbo].[Almacen] AL ON T.Nro = AL.Nro
WHERE AL.Responsable = 'CABA';