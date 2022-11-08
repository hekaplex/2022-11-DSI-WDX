/* 
How many states have each of our vendor's terms
(show due days)
*/

--Terms<->Vendors
--group by terms
--distinct count
Select
	TermsDueDays
	,Count(
		distinct VendorState
		) as DistinctStates
		from 
		--cartesian Join or Cross Join
		Vendors,
		Terms 
		Group By TermsDueDays









SELECT
	t.TermsDueDays
	,COUNT(
		DISTINCT v.VendorState
		) 
		AS DistinctStates
FROM 
--table alias
--left hand side of the join
		Vendors v
left outer Join
--right hand side of join
		Terms t
		on
			--SARG or search argument True/False
			v.DefaultTermsID = t.TermsID

Group By TermsDueDays
	

/*
Vendor Activity based on Invoice totals

*/

SELECT
	v.VendorName
	,ISNULL(Sum(
		i.InvoiceTotal
		) 
		,0)
		AS invoicetotals
FROM 
--table alias
--left hand side of the join
		Vendors v
--implicit inner
Left Join
--right hand side of join
		Invoices i
		ON
			--SARG or search argument True/False
			v.VendorID = t.TermsID

Group By VendorName
order by 2 desc
	


/* Do we have any orphaned invoices
invoice ID with no vendor */

SELECT
	i.VendorID
	--return 0 if null
,	Count(
		*
	)
		AS InvoiceTotals
FROM
--table alias
--left hand side of the join
		Vendors v
--implicit inner
Right Join
--right hand side of join
		Invoices i
		ON
			--SARG or search argument True/False
			v.VendorID = i.VendorID
Where
	v.VendorID is null
Group By i.VendorID

	