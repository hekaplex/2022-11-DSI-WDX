--How many items are in the largest order
--How many customers and distinct artists are sold in any given state
--For a given artist how many orders, units and distinct states were sold
--What are the top ten artists by units sold
--What are the top ten artist by dollar (UnitPrice * Qty) sold

Create View items_view as
Select ItemID, OrderID, Quantity
FROM OrderDetails

Select *
From items_view
Order by Quantity DESC
--There are 3 items in the largest order

Create View Q2 as
Select c.CustState, c.CustFirstName, c.CustLastName, i.Artist
FROM Customers as c
Join Orders as ord
on c.CustID = ord.CustID
Join OrderDetails as os
on ord.OrderID = os.OrderID
Join Items as i
on os.itemID = i.ItemID


Select CustState, Count(CustFirstName) #_Of_Customers , Count(Distinct Artist) Artists
From Q2
Group By CustState
AZ	4	4
CA	35	35
DC	2	2
IA	1	1
MD	2	2
NC	6	6
NJ	1	1
NY	4	4
OH	8	8
WI	5	5


--For a given artist how many orders, units and distinct states were sold
Alter View Q3 as 
Select  i.Artist, os.OrderID, c.CustState, os.Quantity
FROM Customers as c
Join Orders as ord
on c.CustID = ord.CustID
Join OrderDetails as os
on ord.OrderID = os.OrderID
Join Items as i
on os.itemID = i.ItemID

Select Artist, Count(OrderID) #_of_order, CustState ,Count(Quantity)#_of_Units
From Q3
GROUP BY Artist, CustState
Order by Artist ASC


Select Artist, Count(OrderID) #_of_orders, Count(DISTINCT CustState) State,SUM(Quantity)#_of_Units
From Q3
GROUP BY Artist
Order BY Artist ASC

--What are the top ten artists by units sold

Alter procedure X1 @State varchar(20) as 
Select  i.Artist, os.OrderID, c.CustState, os.Quantity
FROM Customers as c
Join Orders as ord
on c.CustID = ord.CustID
Join OrderDetails as os
on ord.OrderID = os.OrderID
Join Items as i
on os.itemID = i.ItemID
Where CustState = @State

X1 'OH'

--What are the top ten artists by units sold
Alter View Q4 as
SELECT i.Artist, os.Quantity, i.UnitPrice
FROM Customers as c
Join Orders as ord
on c.CustID = ord.CustID
Join OrderDetails as os
on ord.OrderID = os.OrderID
Join Items as i
on os.itemID = i.ItemID


Select Artist, Count(Quantity) Units_sold
From Q4
GROUP BY Artist
ORDER BY Units_sold DESC

----What are the top ten artist by dollar (UnitPrice * Qty) sold

select Artist, SUM(Quantity)*SUM(Unitprice) AS Total_Price
FROM Q4
Group BY Artist

Select Artist, 
From Q4
Group By Artist
