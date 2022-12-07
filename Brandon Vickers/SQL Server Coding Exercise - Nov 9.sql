/*
1. Choose one tool ( SQL Server Management Studio (SSMS or Azure data Studio (ADS))
2. Review the structure of the ProductOrders database
3. Review code for understanding on the following SQL syntax
	A. Mandatory Objects
		a. CREATE FUNCTION
		b. CREATE PROCEDURE
		c. CREATE VIEW
	B. Optional Clauses
		a. UNION
		b. OVER
		c. WITH
4. Think about what three different queries you can write that will across all three use all of the mandatory clauses and at least one of the optional clauses
5. Write SQL statements that answer the questions below:
		A. Be sure to include the CREATE statement and the SQL query that shows the result of the question
		B. Write the SQL query

Business Questions:
1. How many items are in the largest order?
2. How many Customers and distinct artists are sold in any given state?
3. For a given Artist how many orders, units and distinct states were sold?
4. What are the top ten artist by units sold?
5. What are the top ten atists by dollars (UnitPrice * Qty) sold?
*/

-- How many items are in the largest order?
USE [ProductOrders]
GO 
SELECT
	OrderID,
	MAX(Quantity) AS Max_Quantity
	FROM dbo.OrderDetails
	GROUP BY OrderID
GO

CREATE FUNCTION HighestQuantity
(

)
RETURNS TABLE 
AS
RETURN
    SELECT top 1 orderid, sum(quantity) as ordertotal
    FROM OrderDetails
    group by orderid
    order by 2 desc

select *
from TopSale()

/*CREATE FUNCTION dbo.ufnGetHighestQuantity
(

)
RETURNS INT
AS
BEGIN
	DECLARE	@HighestQuantity AS INT;

	SELECT 
	@HighestQuantity = MAX(Quantity) FROM dbo.OrderDetails

RETURN @HighestQuantity
*/


--bring in parameter int our logic

SELECT
Artist
,COUNT(*) AS Items_Sold_by_Artist
FROM Items
GROUP BY Artist

SELECT
COUNT(CustID) AS TotalCustomers
FROM dbo.Customers

SELECT
	i.ItemID,
	i.Title,
	i.Artist,
	o.Quantity
FROM 
	Items AS i
JOIN 
	OrderDetails AS o
		ON i.ItemID =o.ItemID
GROUP BY i.ItemID, i.Artist, i.Title, o.Quantity
ORDER BY i.Artist

--Clearly didn't get very far