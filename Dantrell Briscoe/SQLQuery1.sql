
--Create table ARTIST_SALES_DB

select [dbo].[OrderDetails].[Quantity],[dbo].[Items].[Artist],[dbo].[Items].[UnitPrice]
FROM [dbo].[Items]
join [dbo].[OrderDetails] on [dbo].[Items].[ItemID]=[dbo].[OrderDetails].[ItemID]
order by [Artist] asc
	;
select count([CustID]) as Customers, [CustState]
from [dbo].[Customers]
group by [CustState]
;

select [dbo].[Items].[Artist],[dbo].[OrderDetails].OrderID
into artist_orders_db
from [dbo].[Items]
join [dbo].[OrderDetails] on [dbo].[OrderDetails].[ItemID]=[dbo].[Items].[ItemID]

Select [dbo].[Orders].OrderID,[dbo].[Customers].[CustState]
into Orders_by_STATE
from [dbo].[Customers]
join  [dbo].[Orders] on [dbo].[Customers].CustID=[dbo].[Orders].CustID

select [dbo].[Orders_by_STATE].CustState, [dbo].[artist_orders_db].[Artist], COUNT(distinct[dbo].[Orders_by_STATE].[CustState]) as StateSales
from [dbo].[Orders_by_STATE]
join [dbo].[artist_orders_db] on [dbo].[Orders_by_STATE].[OrderID]=[dbo].[artist_orders_db].OrderID
order by [dbo].[Orders_by_STATE].CustState

select distinct [dbo].[Orders_by_STATE].CustState, [dbo].[artist_orders_db].[Artist]
from [dbo].[Orders_by_STATE]
join [dbo].[artist_orders_db] on [dbo].[Orders_by_STATE].[OrderID]=[dbo].[artist_orders_db].OrderID
--group by [CustState],[Artist]
where [CustState] = 'CA'

	;

select count([CustID]) as Customers, [CustState]
from [dbo].[Customers]
where [CustState] = 'CA'
group by [CustState]



	select [dbo].[Customers].[CustID],[dbo].[Customers].[CustState],
	from [dbo].[Customers]
	join [dbo].[Customers] on 