-- this table is supposed to show the basic information of the team. 

CREATE VIEW [gameday] AS
SELECT [Teams], Position, Player_Numbers, Last_Name, Fatnasy_points_2_0, _2pts_Made,_2pts_A,[_3pts_m], _3pts_a, Off_Rebound, Deff_Rebound
FROM PlayerLIVESTATS
WHERE Fatnasy_points_2_0 IS NOT NULL;
GO

SELECT Teams, Position, Player_Numbers, Last_Name, Fatnasy_points_2_0
FROM gameday
 WHERE Teams= 'Atleticos'
 ORDER BY Player_Numbers   ASC
;


CREATE TABLE userinfo (
    username varchar(50),
    password varchar(50),
    firstname varchar(50),
    lastname  varchar(200),
    email varchar(50),
    phonenumber tinyint,
    dob int,
    gender tinyint, 
    city varchar(200),
    state varchar(200),
    country varchar(200))



/*  







    --
    u.league int,
    
    
    
    
    u.fta float,
    u.assists float,
    u.steals  float,
    u.blocks  
    u.to


CREATE TABLE p.stats AS
SELECT * FROM [PlayerLIVESTATS];

CREATE TABLE p.bio AS 
SELECT [Age], [Height]
FROM [Atleticos Roster], [Cangrejeros Roster], */