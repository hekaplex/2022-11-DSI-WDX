Create procedure State_Concerts @Concerts varchar (30)
AS
 	begin
	select [dbo].[Orders_by_STATE].CustState, [dbo].[artist_orders_db].[Artist]
from [dbo].[Orders_by_STATE]
join [dbo].[artist_orders_db] on [dbo].[Orders_by_STATE].[OrderID]=[dbo].[artist_orders_db].OrderID
--group by [CustState],[Artist]

where [dbo].[Orders_by_STATE].[CustState] = @Concerts
end
go

exec State_Concerts @Concerts = 'CA'