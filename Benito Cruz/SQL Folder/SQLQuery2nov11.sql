-- Ranking players by pctg player by Team
WITH
    base
        AS
        (
            SELECT
                [Teams],
                [Players],
                [Games_Played],
                [FG]
            FROM
        [dbo].[BSN_playersStats]
WHERE [Players]  is not null
--Distributed by
)
,
window
AS
(
    --ranking per team for each team
    SELECT
    base.*
    ,ROW_NUMBER()
    --windowing function
    OVER (---group by for the query
            PARTITION BY base.teams
            ---aggregate criteria per tuple
            ORDER BY base.[FG] desc) AS
            ft_rank
FROM base
)
SELECT [Teams], [Players], [Games_Played], [FG]
FROM window WHERE ft_rank <= 5
ORDER BY [Teams]-- [FG]