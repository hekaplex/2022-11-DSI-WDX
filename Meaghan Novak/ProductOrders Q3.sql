 /*For a given Artist how many orders, units and distinct states were sold?*/

SELECT DISTINCT(Artist), COUNT(orderdetails.itemid) as [OrderCount]
FROM Items 
JOIN orderdetails ON items.itemid = orderdetails.itemid
GROUP BY Artist
ORDER BY ordercount DESC
-- Artists Umami had an order count of 17

SELECT DISTINCT(Artist), SUM(orderdetails.Quantity) AS [UnitCount]
FROM Items
JOIN OrderDetails ON Items.ItemID = OrderDetails.ItemID
GROUP BY Artist
ORDER BY UnitCount DESC
-- Artist Umami had a unit count of 18

SELECT DISTINCT(ARTIST), COUNT(DISTINCT(CustState)) AS [StateCount]
FROM Items
JOIN OrderDetails ON Items.ItemID = OrderDetails.ItemID
JOIN Orders ON ORderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustID = Customers.CustID
GROUP BY Artist
ORDER BY StateCount DESC
-- Artist Umami had state count of 7

ALTER PROCEDURE ALLof3
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

/*What are the top ten artist by units sold?*/ /*What are the top ten artist by dollars ( UnitPrice * Qty) sold?*/
--There are only 7 artists
