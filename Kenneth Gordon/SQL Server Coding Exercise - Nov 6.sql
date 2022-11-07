--How many states total payment were less than $1000.00?
select VendorState, sum(PaymentTotal) as Total
from Vendors as v
join Invoices as n
on v.VendorID = n.VendorID 
group by VendorState
having sum (PaymentTotal) < 1000

--What vendor had the highest total payment
select distinct VendorName, VendorState as State, PaymentTotal as Total
from Vendors as v
join Invoices as n
on v.VendorID = n.VendorID
order by Total desc

--What what were the terms for the top 5 highest total payment?
select top 5 TermsDescription, PaymentTotal as Total
From Terms as t
join Invoices as inv
on t.TermsID = inv.TermsID
where TermsDescription = 'Net due 30 days'
order by Total desc 