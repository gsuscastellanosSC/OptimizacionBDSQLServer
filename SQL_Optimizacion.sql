-- Curso Optimización SQL SERVER
-- Roy Rojas
-- twitter.com/royrojasdev | linkedin.com/in/royrojas
------------------------------------------------------
-- Clase 07 - Crear índices, entender plan de ejecución
------------------------------------------------------

USE WideWorldImporters

GO

-- Activamos las estadísitcas
SET STATISTICS IO ON

SELECT TOP 10000 * 
  FROM Application.People p INNER JOIN 
       Sales.InvoiceLines i ON p.PersonID = i.LastEditedBy INNER JOIN 
       Warehouse.StockItemTransactions s ON p.PersonID = s.LastEditedBy
 ORDER BY i.StockItemID;



/*SET SHOWPLAN_ALL ON;  */
USE WideWorldImporters
GO
	SET STATISTICS IO ON
SELECT [OrderID], [ContactPersonID] ,[PickingCompletedWhen]
 FROM [WideWorldImporters].[Sales].[Orders]
 where ContactPersonID=3176;
