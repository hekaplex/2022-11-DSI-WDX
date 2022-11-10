 /*For a given Artist how many orders, units and distinct states were sold?*/

SELECT DISTINCT(Artist), COUNT(orderdetails.itemid) as [OrderCount]
FROM Items 
JOIN orderdetails ON items.itemid = orderdetails.itemid
GROUP BY Artist
ORDER BY ordercount DESC

SELECT DISTINCT(Artist), SUM(orderdetails.Quantity) AS [UnitCount]
FROM Items
JOIN OrderDetails ON Items.ItemID = OrderDetails.ItemID
GROUP BY Artist
ORDER BY UnitCount DESC

SELECT DISTINCT(ARTIST), COUNT(DISTINCT(CustState)) AS [StateCount]
FROM Items
JOIN OrderDetails ON Items.ItemID = OrderDetails.ItemID
JOIN Orders ON ORderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustID = Customers.CustID
GROUP BY Artist
ORDER BY StateCount DESC

CREATE PROCEDURE ALLof3
AS 
SELECT 
	DISTINCT(Artist)
	, COUNT(orderdetails.itemid) as [OrderCount]
	, SUM(orderdetails.Quantity) AS [UnitCount]
	, COUNT(DISTINCT(CustState)) AS [StateCount]
FROM Items
JOIN OrderDetails ON Items.ItemID = OrderDetails.ItemID
JOIN Orders ON ORderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustID = Customers.CustID
GROUP BY Artist

EXEC ALLof3