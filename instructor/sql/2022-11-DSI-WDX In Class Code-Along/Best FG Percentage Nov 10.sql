--Best pctg FG player by Team
--CTE expression
--who is the best FG% in a team?

/*
0. Team - Player - FG% - output column
1. build a rank by team and know where every player stands
2. best is where rank = 1
*/
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
--old school - correlated subqueries
select 
	[Teams]
	, [Players]
	, [FG]
from 
	(
	--ranking per team for each player
		select 
			base.*
			,row_number() 
			--windowing function
				over (---group by for the query
					partition by base.teams 
			---aggregate , in our case rank, criteria per tuple
					order by base.FG desc) 
				as fg_rank
		from 
			(
				select
				[Teams], [Players], [FG]
				from
				[dbo].[BSN_playersStats]
				where [Players] is not null
			) as base
) window
where fg_rank = 1


