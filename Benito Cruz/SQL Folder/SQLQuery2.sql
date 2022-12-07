--UNION
SELECT
--static column'
	'Invoices' as Source_tbl,
[InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]
FROM
	[dbo].[Invoices]
UNION
SELECT
--static column'
	'InvoiceArchive' as Source_tbl,
	[InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]
FROM
	[dbo].[InvoiceArchive]

SELECT * FROM
--correlated subquery
SELECT
	[InvoiceID], [VendorID], [InvoiceNumber]
FROM
	[dbo].[InvoiceArchive]
Where
	InvoiceID Between 3 and 8


/*
What states are in our invoice sample
*/

--correlated subquery with a table alias

SELECT
v.VendorState
,inv.*
from
	--using an alias to abstract a query
	(SELECT
		[InvoiceID], [VendorID],
		--column alias
		[InvoiceNumber] As invno
	FROM
		[dbo].[InvoiceArchive]
	WHERE
		InvoiceID Between 3 and 8 --include boundaries
		--InvoiceID >=3 AND InvoiceID <= 8 --includes boundaries
		-- InvoiceID > 3 AND InvoiceID < 8 does not include boundaries
		)
		--table alias or inline 
			as inv
RIGHT JOIN




--New Query
/*
New Practice
*/
SELECT
	v.VendorState
	,inv.*
FROM
	inv
JOIN
	Vendors AS v
	on
		inv.