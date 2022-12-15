



-- Are there any Free Agent for this season?

SELECT [Teams]
FROM [PlayerLIVESTATS]
WHERE [Teams] IS NULL
UNION
SELECT [Teams] FROM [BSN_TEAMS]
WHERE [Teams] IS NULL;

-- Which players needs their stats updated?
select mvp.*
FROM 
(SELECT Players, [Position]

FROM [PlayerLIVESTATS]
WHERE [Position] IS NULL
) AS mvp

-- are there any Duplicates or Empty slots on Teams table?
SELECT [Teams] FROM [PlayerLIVESTATS]
WHERE [Teams] IS NOT NULL
UNION
SELECT [Teams] FROM [BSN_0TEAMS]
WHERE [Teams] IS NOT NULL;

-- are there any Duplicates or Empty slots on Teams table?

SELECT [First_Name] + ', ' + [Last_Name] AS Players
FROM PlayerLIVESTATS


SELECT [First_Name] + ', ' + [Last_Name] AS Players 
, COUNT(*)
,COUNT ( DISTINCT [Teams] )
FROM PlayerLIVESTATS
WHERE len ([First_Name] + ', ' + [Last_Name]) IS NOT NULL
GROUP BY [First_Name] + ', ' + [Last_Name]
HAVING COUNT(*) > 1
;
/*
UNION ALL
SELECT [First_Name] + ', ' + [Last_Name] AS Players2
 FROM [BSN_TEAMS]
WHERE Players2 IS NOT NULL;
*/

--Best pctg FG player by Team
with base as
(
select
[Teams], [Players], [FG]
from
[dbo].[BSN_playersStats]
where [Players] is not null
)
,
window
as
(select 
	*
	,row_number() 
	--windowing function
	over (---group by for the query
			partition by teams 
			---aggregate criteria per tuple
			order by FG desc) as fg_rank
from base)
select [Teams], [Players], [FG]
from window where fg_rank = 1



--Best pctg FG player by Team
with base as
,
window
as
(select 
	*
	,row_number() 
	--windowing function
	over (---group by for the query
			partition by teams 
			---aggregate criteria per tuple
			order by FG desc) as fg_rank
from (
select
[Teams], [Players], [FG]
from
[dbo].[BSN_playersStats]
where [Players] is not null
)
 base)
select [Teams], [Players], [FG]
from window where fg_rank = 1