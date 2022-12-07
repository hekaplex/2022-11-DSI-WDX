/* which vendors do we have exact addresses for?*/

SELECT 
*
FROM Vendors
WHERE VendorAddress2 IS NOT NULL

--order by state
SELECT VendorState, VendorCity, VendorName,
VendorCity+ ', ' + VendorState+ ' ' + VendorZipCode
AS Address
FROM Vendors
--default ORDER BY is ASC
ORDER BY VendorState, VendorCity, VendorName


/* which of these vendors do we need phone numbers for?*/

--null phone numbers
SELECT VendorState, VendorCity, VendorName,
VendorCity+ ', ' + VendorState+ ' ' + VendorZipCode
AS Address
FROM Vendors
--default ORDER BY is ASC
WHERE VendorAddress2 IS NOT NULL AND VendorPhone IS NULL
ORDER BY VendorState, VendorCity, VendorName
