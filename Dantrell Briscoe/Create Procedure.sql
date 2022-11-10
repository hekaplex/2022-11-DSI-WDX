Create procedure State_Sales @Customer_State varchar (30)
AS
 	begin
	--declare @Customer_State varchar (30)
	select [CustState], count([CustID]) as Customers 
	from [dbo].[Customers]
	where [CustState] = @Customer_State
	group by [CustState]
	end
	go
	;

	exec State_Sales @customer_State ='CA'

	Create procedure State_Concerts @Concerts varchar (30)
AS
 	begin

	select distinct [dbo].[Orders_by_STATE].CustState, [dbo].[artist_orders_db].[Artist]
from [dbo].[Orders_by_STATE]
join [dbo].[artist_orders_db] on [dbo].[Orders_by_STATE].[OrderID]=[dbo].[artist_orders_db].OrderID
--group by [CustState],[Artist]
where [CustState] = @Concerts