--UNION
SELECT
--requires: same num cols, same data types
--static column'
	--'Invoices' as Source_tvl,
	[InvoiceID], [VendorID], [InvoiceNumber]
	--, [InvoiceDate], [InvoiceTotal]
	--, [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]
FROM
	[dbo].[Invoices]
	--UNION removes duplicates, Union ALL does not
UNION --ALL
SELECT
--static column'
	--'InvoicesArchive' as Source_tvl,
	[InvoiceID], [VendorID], [InvoiceNumber]
	--, [InvoiceDate], [InvoiceTotal]
	--, [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]
FROM
	[dbo].[InvoiceArchive]	
;

--correlated subquery with a table alias
/*
What states are in our invoice sample
*/
--old school
SELECT 
v.Vendorstate,
inv.* 
FROM
	--using an alias to abstract a query
	( SELECT
	[InvoiceID], [VendorID], 
	--column alias
	[InvoiceNumber] as invno
FROM
	[dbo].[InvoiceArchive]
WHERE 
	Invoiceid between 3 and 8 --include boundaries
	--InvoiceID >=3 and InvoiceID <=8 --include boundaries
	--invoiceID >3 and <8 does not include boundaries
	)
	--table alias
	as inv
	left join
	Vendors as v
	on 
	inv.VendorID
	= v.VendorID
;
--NEW SCHOOL
--common table expression (CTE)

WITH
	inv
		as
	--using an alias to abstract a query
	--CTE
		( SELECT
			[InvoiceID], [VendorID], 
			--column alias
	[InvoiceNumber] as invno
FROM
	[dbo].[InvoiceArchive]
WHERE 
	Invoiceid between 3 and 8
	)
, base
	AS
	--CTE
		(
		SELECT 
		v.vendorstate
		,inv.*
	from
		inv
	JOIN
		Vendors as v
		on 
			inv.VendorID
			= v.VendorID
	)
SELECT
	base.vendorstate
	, count(*) qty
FROM
	base
Group BY
	base.vendorstate

	--subquery as filter

SELECT
	*
FROM
	INVOICES
Where
	INVOICETOTAL
	>
	(
		SELECT
			AVG(INVOICETOTAL)
		FROM
			INVOICES
	)