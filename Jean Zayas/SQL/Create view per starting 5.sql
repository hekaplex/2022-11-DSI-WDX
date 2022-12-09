-- this table is supposed to show the basic information of the team. 

CREATE VIEW [gameday] AS
SELECT [Teams], Position, Player_Numbers, Last_Name, Fatnasy_points_2_0, _2pts_Made,_2pts_A,[_3pts_m], _3pts_a, Off_Rebound, Deff_Rebound
FROM PlayerLIVESTATS
WHERE Teams IS NOT NULL;

SELECT Teams, Position, Player_Numbers, Last_Name, Fatnasy_points_2_0
FROM gameday
 WHERE Teams= 'Atleticos'
 ORDER BY Player_Numbers   ASC
;
/*  

CREATE TABLE User (
    u.username varchar(50),
    u.password varchar(50),
    u.firstname varchar(50),
    u.lastname  varchar(200),
    u.email varchar(50),
    u.phonenumber tinyint,
    u.dob int,
    u.gender tinyint, 
    u.city varchar(200)
    u.state varchar(200)
    u.country varchar(200)
    
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