--Tables 

-- Table for USER

CREATE TABLE [USER] (
  
  userid INT PRIMARY KEY
 , player_id NVARCHAR
 , league_id NVARCHAR
 , team_id NVARCHAR
 , username VARCHAR NOT NULL 
 , user_password NVARCHAR
 , FirstName NVARCHAR
 , LastName NVARCHAR
 , birthdate DATE
 , player_nationality NVARCHAR   
 , experience_level VARCHAR
 , create_time TIMESTAMP


)


CREATE TABLE [game](

  game_id INT NOT NULL
 , game_date DATE NOT NULL 
 , home_team INT NOT NULL
 , away_team INT NOT NULL
 , venue_name NVARCHAR
 , certifying_official INT NOT NULL  

)

CREATE TABLE [coaches](

 userid INT PRIMARY KEY
 , coach_id INT --increment
 , coach_name NVARCHAR NOT NULL
 , start_year INT NOT NULL
 , winshistory INT 
 , wins_season INT
 , championships INT 
 , league_id NVARCHAR NOT NULL
)

CREATE TABLE [users_to_teams](
 
 userid INT 
 , player_id NVARCHAR
 , coach_id  NVARCHAR
 , team_id NVARCHAR
 , league_id NVARCHAR
 , team_city NVARCHAR
 , venue_name NVARCHAR

)