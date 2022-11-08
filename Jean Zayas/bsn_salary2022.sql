--HOW MANY PLAYERS PER TEAM? 

SELECT COUNT(Players),Teams
FROM BSN_playersStats
GROUP BY Teams
HAVING COUNT(Players) >= 1
ORDER BY COUNT(Players) DESC;


 -- WHICH PLAYER FROM WHICH TEAM HAS A DFS SALARY HIGHER THAN $500?



SELECT Teams, Players,Salary
FROM BSN_playersStats

-- JOIN
INNER JOIN BSN_teamstats
ON BSN_playersStats.Teams = BSN_teamstats.Equipo
-- WHERE CONDITIONS
WHERE Salary >= '$500'
-- ORDER BY
ORDER BY Equipo, Salary ASC;--Table 1 or Table Works fine


-- WHICH PLAYER HAS THE HIGHER FIELD GOAL PERCENTAGE (FG%)

SELECT DISTINCT Players,FG
FROM BSN_playersStats ;