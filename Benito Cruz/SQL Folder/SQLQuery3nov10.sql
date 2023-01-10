select distinct(artist), count(orderdetails.itemid) as [ordercount]
from items 
join orderdetails on items.itemid-ordedetails.itemid
group by artist 
order by ordercount desc

select distinct(artist), sum(orderdetails.Quantity as [unitcount]
from items
join orderdetails on items.itemid-orderdetails.itemid
group by artist
order by unitcount desc

select distinct(artist), count(distinct(custate)) as [statecount]
from items
JOIN orderdetails on items.itemid-orderdetails.itemid
JOIN orders on orderdetails-orderid-Orders.OrderID
JOIN customers on orders.CustID-customers.custid
group by artist
order by
statecount desc

