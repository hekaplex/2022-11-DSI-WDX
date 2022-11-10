-- Created  [ProductQuantity_MN] in previous query

/*How many items are in the largest order?*/
SELECT [ProductQuantity_MN].*
FROM 
(SELECT 
	TOP 10
	Quantity, ItemID, OrderID
FROM
	OrderDetails
ORDER BY Quantity DESC)
AS [ProductQuantity_MN]
--The largest order has 5 items

--collab with Nick 

CREATE FUNCTION TopSale()
RETURNS TABLE AS
RETURN
	SELECT TOP 1 OrderID, SUM(Quantity) AS OrderTotal
	FROM OrderDetails
	Group BY OrderID
	Order BY OrderTotal DESC

SELECT *
FROM TopSale()
