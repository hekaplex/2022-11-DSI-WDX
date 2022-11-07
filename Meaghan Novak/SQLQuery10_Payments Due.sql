/* which vendors still need to pay their invoices?*/

SELECT 
	VendorName, InvoiceNumber, PaymentDate, InvoiceTotal, InvoiceDueDate 
FROM
	Vendors
	Inner Join Invoices ON Vendors.VendorID = Invoices.VendorID
	Right Join InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
	Left Join GLAccounts ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
WHERE PaymentDate IS NULL
ORDER BY VendorName


/* which vendors owe more than $1,000?*/
SELECT 
	VendorName, InvoiceNumber, InvoiceTotal
FROM
	Vendors
	Full Join Invoices ON Vendors.VendorID = Invoices.VendorID
	Full Join InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
GROUP BY VendorName, InvoiceNumber, InvoiceTotal
HAVING COUNT(InvoiceTotal) > 1000.00
Order BY VendorName