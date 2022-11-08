/* which vendors have credit on file?*/
--unsure why having count command is still pulling accounts with 0 credit balance
SELECT
	VendorName, CreditTotal
FROM Invoices	
	Full Join InvoiceLineItems ON Invoices.CreditTotal = InvoiceLineItems.InvoiceSequence
	Full Join Vendors ON Invoices.VendorID = vendors.VendorID
GROUP By VendorName, CreditTotal
HAVING COUNT(CreditTotal) > 0.00


	