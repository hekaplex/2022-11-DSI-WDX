/*SELECT * FROM train

ALTER TABLE dbo.train ADD DaysToShip AS DATEDIFF(day, Order_Date, Ship_Date) PERSISTED;
*/

SELECT 
STDEV([DaysToShip]) AS StandardDeviation --sigma = 1.61324721185768
,AVG([DaysToShip]) AS Average -- average = 3
,MIN([DaysToShip]) AS Minimum  -- minimum = 0
,MAX([DaysToShip]) AS Maximum -- maximum = 7
,COUNT(*) -- count = 1000
from dbo.train
;

DECLARE @mean as decimal(8,3)
DECLARE @standardDeviation as decimal(8,3)

SET @mean=(select avg(DaysToShip) from dbo.train)
SET @standardDeviation=(select stdev(DaysToShip) from dbo.train)

SELECT
DaysToShip, 
(DaysToShip - @mean)/(@standardDeviation) AS Z_Score
FROM dbo.train
