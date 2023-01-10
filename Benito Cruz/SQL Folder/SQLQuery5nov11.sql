--PIVOT
--Pivot table with one row and five columns
USE Adventureworks2019
GO
SELECT DaysToManufacture, AVG(StandardCost) AS AverageCost
FROM Production.Product
GROUP BY DaysToManufacture;
/*
