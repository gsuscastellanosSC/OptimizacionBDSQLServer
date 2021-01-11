-- Curso Optimización SQL SERVER
-- Roy Rojas
-- twitter.com/royrojasdev | linkedin.com/in/royrojas
------------------------------------------------------
-- Clase 16 - Constraint
------------------------------------------------------

USE [PlatziSQL]
GO

insert into UsuarioSource
values(17,'Vanesa Rojas','')


select * from UsuarioSource where Codigo in(16,17)

delete UsuarioSource where Codigo = 17

update UsuarioSource set Nombre = 'Andres Soto' where Codigo = 8
select * from UsuarioTarget where Codigo = 8

USE [PlatziSQL]
GO

/****** Object:  Table [dbo].[UsuarioSource]    Script Date: 11/10/2020 12:26:13 AM ******/
SET ANSI_NULLS ON
GO

-- Valor default
ALTER TABLE UsuarioSource 
ADD CONSTRAINT [DF_UsuarioSource_Puntos]  DEFAULT ((0)) FOR [Puntos]

select * from UsuarioSource ;

insert into UsuarioSource (Codigo, Nombre) values(8,'Sc');

GO

-- Unico
ALTER TABLE UsuarioSource 
ADD CONSTRAINT UC_Nombre UNIQUE (Nombre)
GO

ALTER TABLE UsuarioSource 
ADD CONSTRAINT CHK_Nombre_Puntos Check (Puntos >=0 AND Nombre <> 'Maria Solis')
GO

insert into UsuarioSource (Codigo, Nombre) values(8,'Maria');

select * from UsuarioSource;
INSERT UsuarioSource
VALUES(9,'Maria Solis1',10);

update UsuarioSource set Puntos=20 where PUNTOS=0;