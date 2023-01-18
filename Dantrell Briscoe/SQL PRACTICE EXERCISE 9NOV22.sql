USE [AP]
GO

/****** Object:  Table */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- int foo = 7
-- Mandatory to create a view
CREATE VIEW [dbo].[TOPVendors_db]
AS --equivalent to '='
	SELECT
	TOP 5 PERCENT
	vendorid
	,invoicetotal
	,invoiceduedate
	FROM
	Invoices
	ORDER BY invoicetotal DESC
	-- twobatch delimiter in transact-SQL
	-- semicolon ;
	-- go
	GO


	/****** Object:  StoredProcedure [dbo].[VendorDetails]    Script Date: 11/9/2022 9:41:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--INTERFACE/PROTOTYPE "Contract" --DML+ DQL+ messages
CREATE PROCEDURE 
[dbo].[VendorDetails_DB]
@Vendor int = 95
--one @Vendor parameter of type int with a default of 95
AS
--SANDBOX FOR VARIABLES WE'LL USE IN OUR LOGIC
DECLARE
	@MaxInvoice money
	,@MinInvoice money
	,@PctDiff decimal(8,2)
	,@InvoiceQty int
	,@VendorIDVar int
	--bring in parameter into our logic
SET
	@VendorIDVar = @Vendor
SET
	@MaxInvoice =
		(SELECT	MAX(InvoiceTotal)
			FROM Invoices
				WHERE VendorID = @VendorIDVar)
--Populating data from two variablesin one select
--implies one row or error will occur
SELECT
	@MinInvoice =
			MIN(InvoiceTotal),
	@InvoiceQty =
		 COUNT(*)
			FROM Invoices
				WHERE VendorID = @VendorIDVar
SET @PctDiff =
--operator precedence
	((@MaxInvoice - @MinInvoice)/@MinInvoice) * 100
PRINT 'Vendor ID: '+ CONVERT(varchar,@Vendor)
PRINT 'Max Invoice is $'+CONVERT(varchar,@MaxInvoice ,1)+'.';
PRINT 'Min Invoice is $'+CONVERT(varchar,@MinInvoice ,1)+'.';
PRINT 'Maximum is '+CONVERT(varchar,@PctDiff)+'% more than minimum.';
PRINT 'Number of Invoices: '+CONVERT(varchar,@InvoiceQty)+'.';
GO


[DBO].[VENDORDETAILS_DB] @VENDOR 19


/****** Object:  UserDefinedFunction [dbo].[fnBalanceDue]    Script Date: 11/9/2022 10:09:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnBalanceDue]()
RETURNS money
BEGIN
RETURN (SELECT SUM(InvoiceTotal - PaymentTotal -
CreditTotal)
FROM Invoices
WHERE InvoiceTotal - PaymentTotal -
CreditTotal > 0);
END;
GO

DECLARE @moneyvar MONEY
SELECT @moneyvar = [dbo].[fnbalancedue]
PRINT @moneyvar
