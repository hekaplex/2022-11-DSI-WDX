/*
How many items are in the largest order?
*/
SELECT distinct(artist), count(orderdetails.itemid) as [ordercount]
FROM
JOIN orderdetails on items.itemID=orderdetails.itemid
GROUP BY artist
ORDER BY ordercount desc

