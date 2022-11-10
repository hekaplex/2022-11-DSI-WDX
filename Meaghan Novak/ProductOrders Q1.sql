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
--The largest order has 3 items
