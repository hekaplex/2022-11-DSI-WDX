3a. select distinct(artist), count(orderdetails.itemid) as [ordercount]
from items
join orderdetails on items.itemid=orderdetails.itemid
group by artist
order by ordercount desc




3b. select distinct(artist), sum(orderdetails.Quantity) as [unitcount]
from items
join orderdetails on items.itemid=orderdetails.itemid
group by artist
order by unitcount desc




3c. select distinct(artist), count(distinct(custstate)) as [statecount]
from items
join orderdetails on items.itemid=orderdetails.itemid
join orders on orderdetails.orderid=Orders.OrderID
join Customers on orders.CustID=customers.custid
group by artist
order by statecount desc




3all. CREATE PROCEDURE Allof3
AS
SELECT
    distinct(artist),
    count(orderdetails.itemid)  as [ordercount],
    sum(orderdetails.Quantity) as [unitcount],
    count(distinct(custstate)) as [statecount]
from items
join orderdetails on items.itemid=orderdetails.itemid
join orders on orderdetails.orderid=Orders.OrderID
join Customers on orders.CustID=customers.custid
group by artist



exec Allof3