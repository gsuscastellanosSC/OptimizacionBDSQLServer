-- Curso Optimización SQL SERVER
-- Roy Rojas
-- twitter.com/royrojasdev | linkedin.com/in/royrojas
------------------------------------------------------
-- Clase 13 - Trigger manejo de errores
------------------------------------------------------

USE [PlatziSQL]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or ALTER   TRIGGER [dbo].[t_insert] 
   ON  [dbo].[UsuarioTarget]
   AFTER INSERT
AS 
BEGIN

	IF (ROWCOUNT_BIG() = 0)
	RETURN;

	DECLARE @codigo int
	SELECT @codigo = codigo FROM inserted

	IF @codigo >= 10
	BEGIN
		Print 'NO se realizó el insert'
		select * from UsuarioTarget
		ROLLBACK;
		select * from UsuarioTarget
		RETURN;
	END
		Print 'Se realizó el insert'
		SELECT * FROM inserted;

END;

select * from UsuarioTarget;

ALTER   TRIGGER [dbo].[t_update] 
   ON  [dbo].[UsuarioTarget]
   AFTER INSERT, UPDATE
AS 
BEGIN

	IF (ROWCOUNT_BIG() = 0)
	RETURN;

	DECLARE @codigo int
	SELECT @codigo = codigo FROM inserted

	IF @codigo = 7
	BEGIN
		Print 'NO se realizó un update'
		select * from UsuarioTarget
		ROLLBACK;
		select * from UsuarioTarget
		RETURN;
	END
	
	-- SELECT Codigo, Nombre, Puntos from inserted
	
	Print 'Se realizó un update'

END


GO

select * from UsuarioTarget where Codigo = 8;

insert UsuarioTarget values((select max(Codigo+1) from UsuarioTarget), 'Jesus Castellanos Paez', 9);

update UsuarioTarget set Nombre = 'Andres Soto' where Codigo = 7

select * from UsuarioTarget where Codigo = 8


select max(Codigo+1) from UsuarioTarget;


create or alter procedure  nextValue
as 
BEGIN
	SELECT MAX(Codigo+1) FROM UsuarioTarget
END

exec nextValue;

