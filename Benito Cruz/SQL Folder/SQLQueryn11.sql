SELECT
	*
FROM
	StringSample
ORDER BY ID
;

SELECT
	[Name]
	,RIGHT
	
FROM
	DataSample
WHERE DATEPART(HOUR,StartDate) BETWEEN 9 AND 13

--How many days have I been alive?
SELECT DATEIFF(DAY,'APR 16 1970 03:25 AM',GETDATE())
--19202
--how many seconds have I been alive?
