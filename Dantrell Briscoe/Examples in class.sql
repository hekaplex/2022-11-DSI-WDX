select distinct(artist), count([dbo].[OrderDetails].ItemID) as [ordercount]
from [dbo].[Items]
join OrderDetails on Items.ItemID=OrderDetails.ItemID
group by Artist
order by ordercount desc

select distinct(artist), sum([dbo].[OrderDetails].[Quantity]) as [unitcount]
from [dbo].[Items]
join OrderDetails on Items.ItemID=OrderDetails.ItemID
group by Artist
order by unitcount desc

Select distinct(artist), count(Distinct(custstate)) as [statecount]
from [dbo].[Items]
join OrderDetails on [dbo].[Items].[ItemID] = [dbo].[OrderDetails].[ItemID]
join [dbo].[Orders] on [dbo].[OrderDetails].OrderID=[dbo].[Orders].OrderID
join [dbo].[Customers] on [dbo].[Orders].CustID=[dbo].[Customers].CustID
group by Artist
order by statecount desc

alter view [ArtistSales] as
select custstate as [State],
	count(custstate) as [Fans],
	count (distinct(artist)) as [Performers]
from Customers
join orders on customers.CustID=Orders.CustID
join OrderDetails on Orders.OrderID=OrderDetails.OrderID
join Items on OrderDetails.ItemID=Items.ItemID
group by custstate

select *
from ArtistSales
order by 3