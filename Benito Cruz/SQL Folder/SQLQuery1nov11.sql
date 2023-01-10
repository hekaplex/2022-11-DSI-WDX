--who has the best FG% in a team?

/*
0. Team - Player - FG - output column
1. build a rank by team and know where every player stands 
2. best is where rank = 1
*/




	(
		,RIGHT[PlayersSELECT 
			Teams
			,Players
			,[FG%]
		FROM
			[dbo.].[BSN_playersStats]
	 )
	
	CAST
	CONVERT(varchar, InvoicDate, 107) AS varcharDate_107,
	CONVERT(varchar, InvoiceDate, 12) AS varcharDate_12,
	CONVERT(varchar, Invoice, 112) AS varcharDate_112,
	CONVERT
	CONVERT
	CONVERT
	CONVERT 
	CONVERT
	CONVERT
	CONVERT
	CONVERT
	CONVERT
		TRY_CONVERT
		TRY_CONVERT
		TRY_CONVERT
		TRY_CONVERT
		TRY_CONVERT
		TRY_CONVERT
		TRY_CONVERT
		TRY_CONVERT
		TRY_CONVERT
