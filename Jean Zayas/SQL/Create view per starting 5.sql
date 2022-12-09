-- This is a try to create a table that filters all the players info

--create the table first
CREATE VIEW [gameday] AS
SELECT [Teams], [Position], Player_Numbers, Last_Name, Fatnasy_points_2_0, _2pts_Made,_2pts_A,[_3pts_m], _3pts_a, Off_Rebound, Deff_Rebound
FROM PlayerLIVESTATS
WHERE Teams IS NOT NULL;

SELECT [Teams], [Position], Player_Numbers, Last_Name, Fatnasy_points_2_0, 
FROM gameday
 WHERE [Position] <= 5  
ORDER BY [Teams],[Position]
;
/*  

CREATE TABLE starting5 (
    
    p.position varchar(50),
    p.name  varchar(200),
    p.number tinyint,
    p.points int,
    p.fouls tinyint, 
    p.points int,
    p.fta float,
    p.assists float,
    p.steals  float,
    p.blocks  
    p.to


SELECT column_name(s)
    FROM table1 T1, table1 T2
    WHERE condition;


    CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,

CREATE TABLE p.stats AS
SELECT * FROM [PlayerLIVESTATS];

CREATE TABLE p.bio AS 
SELECT [Age], [Height]
FROM [Atleticos Roster], [Cangrejeros Roster], */