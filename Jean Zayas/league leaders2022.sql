

-- how many players in the league according to the data pull prior cleaning?
SELECT COUNT(Players) AS LeaguePlayers  FROM BSN_playersStats;


-- according to the DFS salary formula what is the total salary per team ?
select distinct (Teams), SUM(BSN_playersStats.Salary) AS SalaryPerTeam
FROM BSN_playersStats
WHERE [Teams] IS NOT NULL
GROUP BY Teams
;

-- How many players per team in the league without duplicates?


-- Can we rank players per team by %?

 
 
 --League leaders by FG %?
go
 
CREATE VIEW team_rank AS 
SELECT TOP 100 percent Players, FG 

FROM BSN_playersStats
WHERE FG IS NOT NULL 
;


SELECT * FROM team_rank
ORDER BY 2;




 -- Add Team total points and match them with the players points to see if there is a discrepancy



