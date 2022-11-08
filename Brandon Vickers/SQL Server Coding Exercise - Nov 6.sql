/*Business question 1: Show the number of each Shipping Type, if the number
of items shipped by that method greater than or equal to 600 */

Select COUNT(Customer_ID) AS Total, Ship_Mode
FROM
	dbo.factsales
GROUP BY
	Ship_Mode
HAVING COUNT(Ship_Mode) >= 600
ORDER BY Total desc;

/*
5968	Standard Class
1945	Second Class
1538	First Class

Business Question 2: Show the Vendors whose vendor name starts with letter D and 
who have an average invoice of over $1000. Sort with the highest 
average first */

Select 
	DISTINCT i.VendorID, 
	v.VendorName,
	v.VendorState,
	avg(InvoiceTotal) as Average_Invoice
FROM 
	dbo.Invoices AS i
JOIN 
	dbo.Vendors AS v 
		on v.VendorID = i.VendorID
WHERE v.VendorName LIKE 'D%'
group by i.VendorID, v.VendorName, v.VendorState
having avg(InvoiceTotal) > 1000
order by Average_Invoice desc

/*
72	Data Reproductions Corp	MI	7366.8966
104	Digital Dreamworks	CA	7125.34
103	Dean Witter Reynolds	MA	1367.50

Business Question 3: Show all the vendors that owe us more than $1000 */

Select 
	InvoiceID,
	v.VendorID,
	InvoiceNumber,
	InvoiceTotal,
	PaymentTotal,
	VendorName,
	InvoiceTotal - PaymentTotal as Amount_Owed 
FROM 
	dbo.Invoices AS i
JOIN 
	dbo.Vendors AS v
		on v.VendorID = i.VendorID
WHERE InvoiceTotal != PaymentTotal
GROUP BY 
	InvoiceID,
	v.VendorID,
	InvoiceTotal,
	PaymentTotal,
	InvoiceNumber,
	VendorName
HAVING (InvoiceTotal - PaymentTotal) > 1000
ORDER BY Amount_Owed desc

/*
102	110	P-0608	20551.18	5000.00	Malloy Lithographing Inc	15551.18
120	97	456789	8344.50	0.00	Compuserve	8344.50
121	98	456789	8344.50	0.00	American Express	8344.50
112	110	0-2436	10976.06	5000.00	Malloy Lithographing Inc	5976.06
122	99	456789	4747.50	0.00	Bertelsmann Industry Svcs. Inc	4747.50
106	110	0-2060	23517.58	21221.63	Malloy Lithographing Inc	2295.95
*/