/*
SQL Language Construct
	DDL - Data Definition		-CREATE, DROP, ALTER
	DQL - Data Query Language	- SELECT, EXEC
	DML - Data Manipulation		- (SELECT...INTO) INSERT, UPDATE, DELETE, MERGE
	*/

-- SELECT...INTO - INSERT, UPDATE, DELETE, MERGE
--nonlogged operation vs logged operation

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
	into
	magnum_opus
FROM
	base
Group BY
	base.vendorstate
--@@RowsCount Returned
--2 rows altered


SELECT * FROM magnum_opus

--INSERT, UPDATE, DELETE, MERGE
INSERT INTO magnum_opus(vendorSTATE, QTY) Values ('OR',47)

SELECT * FROM magnum_opus
--implicit schema
insert into magnum_opus values ('TX', 2)

Insert into magnum_opus
Values 
('NY', 3),
('IL',5),
('FL',4)
--insert...select

INSERT INTO magnum_opus
SELECT * FROM magnum_opus

--DELETE vs DROP
DELETE --removes the data
magnum_opus
WHERE VendorState = 'TN'

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

DELETE --removes the data
	m
SELECT* from
magnum_opus m
join
agg a
on	a.[VendorState]
	= m.VendorState
and
	a.qty
	=m.qty
--update = insert + DELETE with acces to inserted and deleted table in triggers
Update
--preflight check
--SELECT
SELECT *,m.qty *6 as newqty
FROM
magnum_opus 
join
agg a
on	a.[VendorState]
	= m.VendorState
and
	a.qty
	=m.qty

SELECT *
from magnum_opus

SELECT @@ROWCOUNT
--Datawarehouse scenario: Dimension Management or INSERT or UPDATE in one query
MERGE
INTO
--a lot  like...FROM invoicecopy LEFT outer JOIn INVOICE ARCHIVE
--MASTER Copy for Analysis
Invoice Archive ia
--Latest version from Production/Staging
USING InvoiceCopy ic
--exactly like ...FROM InvoiceCopy LEFT Outer JOIN Invoice Archive
on ia.invoicenumber = ic.invoicenumber
--INNER JOIN = UPDATE
WHEN MATCHED
--WHERE ON ia.InvoiceID is not null and ic.invoiceid