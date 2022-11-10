CREATE FUNCTION Largest_Order()
RETURNS TABLE AS 
RETURN
	(SELECT TOP 1 ORDERID, 
	SUM(QUANTITY) 
	AS ORDERTOTAL
	FROM [dbo].[OrderDetails]
	GROUP BY ORDERID
	ORDER BY ORDERTOTAL DESC)
;
GO
SELECT *
from [dbo].[Largest_Order]()


Create procedure State_Sales @Customer_State
AS
 	--begin
	declare @Customer_State int
	select [CustState], count([CustID]) as Customers 
	from [dbo].[Customers]
	where [CustState] = @Customer_State
	end
	go;





select distinct [dbo].[Orders_by_STATE].CustState, [dbo].[artist_orders_db].[Artist]
from [dbo].[Orders_by_STATE]
join [dbo].[artist_orders_db] on [dbo].[Orders_by_STATE].[OrderID]=[dbo].[artist_orders_db].OrderID
group by [CustState],[Artist]


select count([CustID]) as Customers, [CustState]
from [dbo].[Customers]
group by [CustState]






select distinct [dbo].[Orders_by_STATE].CustState, [dbo].[artist_orders_db].[Artist]
from [dbo].[Orders_by_STATE]
join [dbo].[artist_orders_db] on [dbo].[Orders_by_STATE].[OrderID]=[dbo].[artist_orders_db].OrderID
group by [CustState],[Artist]