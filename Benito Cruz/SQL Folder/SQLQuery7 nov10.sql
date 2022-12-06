create view Allof2 as 
select
	custstate,
	count(custstate) as [customers],
	count(distinct(artist)) as [Artist]
from customers
join orders on customers.CustID=Orders.custid
join orderdetails on customers.CustID=Orders.custid
join items on orderdetails.itemid-items.itemid
group by custstate

select
from Allof2