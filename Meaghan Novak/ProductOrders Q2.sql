USE [ProductOrders]
GO


/*How many customers are in each state and what count of distinct artists are in each state?*/

SELECT CustID, CustState
FROM Customers
WHERE CustState = 'CA'
ORDER BY CustID
-- AZ has 1 customer
-- CA has 11 customers
-- DC has 2 customers
-- IA has 1 customer
-- MD has 1 customer
-- NC has 1 customer
-- NJ has 1 customer
-- NY has 2 customers
-- OH has 4 customers
-- WI has 1 customer

SELECT [CustState]
FROM [dbo].[Customers]
JOIN Items ON CustState = CustState


SELECT CustState, Artist
FROM [dbo].[Customers], [dbo].[Items]
WHERE CustState = 'OH'
ORDER BY Artist
-- AZ has 7 artists
-- CA has 7 artists
-- DC has 7 artists
-- IA has 7 artists
-- MD has 7 artists
-- NC has 7 artists
-- NJ has 7 artists
-- NY has 7 artists
-- OH has 7 artists
-- WI has 7 artists


create view Allof2 as
select
    custstate,
    count(custstate) as [Customers],
    count(distinct(artist)) as [Artists]
from customers
join orders on customers.CustID=Orders.custid
join orderdetails on Orders.orderid=orderdetails.orderid
join items on orderdetails.itemid=items.itemid
group by custstate

select *
from Allof2
order by 3


 
/*For a given Artist how many orders, units and distinct states were sold?*/
-- moved to new query after following along with classmates

SELECT [OrderID], [Quantity]
FROM [dbo].[OrderDetails]
JOIN Items ON Quantity = Quantity
JOIN Customers ON CustState = CustState

SELECT [Artist], [Quantity], [OrderID], [CustState]
FROM [dbo].[Items], [dbo].[OrderDetails], [dbo].[Customers]
WHERE Artist = 'Onn & Onn'
ORDER BY CustState, OrderID
