-- Ranking players by pctg player by Team
with 
	base 
		as
		(
			select
				[Teams], 
				[Players], 
				[Games_Played], 
				[PT],
				[FG],
				[Assists],
				[Rbs],
				[TO],
				[Salary]
			from
		[dbo].[BSN_playersStats]
where [Players]  is not null
--Distributed by 
)
,
window
as
(
    --ranking per team for each team
    select 
	base.*
	,row_number() 
	--windowing function
	over (---group by for the query
			partition by base.teams 
			---aggregate criteria per tuple
			order by base.[FG] desc) as 
            ft_rank
from base)
select [Teams], [Players], [Games_Played], [PT], [FG], [Assists],[Rbs], [TO], [Salary]
from window where ft_rank <= 5
ORDER BY [Teams], [PT] -- [FG] , [Players], [Games_Played], [PT], [FG], [Assists],[Rbs], [TO], [Salary]



--COLLATE SQL_Latin1_General_Cp1251_CS_AS
-- COLLATE SQL_Latin1_General_Cp850_CI_AI
--Latin1_General_100_BIN2_UTF8
--Latin1_General_100_CI_AI_SC_UTF8 
--COLLATE Modern_Spanish_CI_AS

ALTER TABLE [dbo].[BSN_playersStats]
ALTER COLUMN Players [nvarchar](50) 

COLLATE Traditional_Spanish_100_CI_AI_SC_UTF8






