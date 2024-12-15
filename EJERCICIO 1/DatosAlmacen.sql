insert into [dbo].[Almacen] values
(1, 'Juan Perez'),
(2, 'Jose Basualdo'),
(3, 'Rogelio Rodriguez')
insert into [dbo].[Articulo] values
(1, 'Sandwich JyQ', 5),
(2, 'Pancho', 6),
(3, 'Hamburguesa', 10),
(4, 'Hamburguesa completa', 15)
insert into [dbo].[Material] values
(1, 'Pan'),
(2, 'Jamon'),
(3, 'Queso'),
(4, 'Salchicha'),
(5, 'Pan Pancho'),
(6, 'Paty'),
(7, 'Lechuga'),
(8, 'Tomate')
insert into [dbo].[Proveedor] values
(1, 'Panader�a Carlitos', 'Carlos Calvo 1212', 'CABA'),
(2, 'Fiambres Perez', 'San Martin 121', 'Pergamino'),
(3, 'Almacen San Pedrito', 'San Pedrito 1244', 'CABA'),
(4, 'Carnicer�a Boedo', 'Av. Boedo 3232', 'CABA'),
(5, 'Verduler�a Platense', '5 3232', 'La Plata')
insert into [dbo].[Tiene] values
--Juan Perez
(1, 1),
--Jose Basualdo
(2, 1),
(2, 2),
(2, 3),
(2, 4),
--Rogelio Rodriguez
(3, 3),
(3, 4)
insert into [dbo].[Compuesto_Por] values
--Sandwich JyQ
(1, 1), (1, 2), (1, 3),
--Pancho
(2, 4), (2, 5),
--Hamburguesa
(3, 1), (3, 6),
--Hamburguesa completa
(4, 1), (4, 6), (4, 7), (4, 8)
insert into [dbo].[Provisto_Por] values
--Pan
(1, 1), (3, 1),
--Jamon
(2, 2), (3, 2), (4, 2),
--Queso
(2, 3), (3, 3),
--Salchicha
(3, 4), (4, 4),
--Pan Pancho
(1, 5), (3, 5),
--Paty
(3, 6), (4, 6),
--Lechuga
(3, 7), (5, 7),
--Tomate
(3, 8), (5, 8)
GO

