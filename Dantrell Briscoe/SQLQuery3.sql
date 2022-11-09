With
	Base
	AS
	(
	SELECT 
	--Year, Month, Territory, Sales
	Datepart(year,OrderDate) SalesYear
	,DATEPART(MONTH,orderDate) SalesMonth
	,SalesTerritorykey
	,SUM(SALESAMOUNT) SALES Total
FROM
[dbo].[FactInternetSales]
GROUP by 
	datepart(year,OrderDate) SalesYear
	,DATEPART(MONTH,orderDate) SalesMonth
	,SalesTerritorykey
	)
SELECT
	*
	,SUM(SalesTotal) OVER (PARTITION by Territory, SalesYear)C) AS yearbyterritory
	,SUM(SalesTotal) OVER (PARTITION by Territory, SalesYear ORDER BY SALESMOnth ASC) AS yeartodate
	,LAG(SalesTotal,1,0) OVER (PARTITION by Territory, SalesYear ORDER BY SALESMOnth ASC) AS YTD_PREVMONTH
FROM
	base
	)
	select
	*
	,Salestotal/yearbyterritory as pctofyearbyterritory
	,
	--pct change = (newval-oldval)/oldval
	IIF
		(
			--conditional statement to evaluate
			YTD_prevmonth = 0
			--result if true
			,0
			--result if false
			,(SalesTotal- PREVMONTH)/PREVMONTH
		)
	as pctchangefromprevmonth
	from agg_2