# **NEEDS** #

- Teams table

- Players table 
- Roster table 

(currently in need to reduce tables and simply the work. Reason why i should do these three tables and modifications to current ones.)

**BSN Teams table:**


    [] 1. Team Username (T - Alphanumeric)(Primary Key)
    [] 2. Coach Usermane (U - Alphanumeric)
    [] 3. Coach Name divide (F.Name & L. Name)
    [] 4. Include Ranking per league
    [] 5. Field goal per game (Made & Attempted)
    [] 6. 2 points per game (Made & Attempted)
    [] 7. 3 points per game (Made & Attempted)
    [] 8. Free throws per game (Made & Attempted)
    [] 9. Rebounds per game (Deffensive, Offensive & Total)
    [] 10. Total Double double and Triple Double

---
**Main Players Roster table:**


    [] 1. Players Username (Primary Key)
    [] 2. DOB 
    [] 3. Place of birth
    [] 4. College
    [] 5. Accolades
    [] 6. Vertical 
    [] 7. Wingspan 
    [] 8. Standing Reach
    [] 9. Benchpress
    [] 10. Join Height & weight
    [] 11. Raise minimum player ranking to 50%
    [] 12. Field goal per game (Made & Attempted)
    [] 13. 2 points per game (Made & Attempted)
    [] 14. 3 points per game (Made & Attempted)
    [] 15. Free throws per game (Made & Attempted)
    [] 16. Rebounds per game (Deffensive, Offensive & Total)
    [] 17. Include Personal Fouls 
    [] 18. Include Technical Fouls
    [] 19. Double Double 
    [] 20. Triple Double
    [] 21. Offensive Real +/-
    [] 22. Deffensive Real +/- 
    [] 23. Real +/-
    [] 24. Wins Real +/- 
 ---

 ## **ORPM:** ##
 
 **Offensive Real Plus or Minus**

 *Player's estimated on-court impact on team offensive performance, measured in points scored per 100 offensive possessions*

 ## **DRPM:** #
 **Deffensive Real Plus or Minus**
 
 *Player's estimated on-court impact on team defensive performance, measured in points allowed per 100 defensive possessions*

 ## **RPM:** ##
**Real Plus or Minus**

*Player's estimated on-court impact on team performance, measured in net point differential per 100 offensive and defensive possessions. RPM takes into account teammates, opponents and additional factors*

 ## **WRPM:** ##
**Wins Real Plus or Minus**

*WRPM Provide an estimate of the number of wins each player has contributed to his team's win total on the season. WRPM include the player's Real Plus-Minus and his number of possessions played.*

---
 ## **Tables to create:** ##

 **USER**
 
 - username VARCHAR(16) PRIMARY KEY
 - password VARCHAR(64)
 - UserID  INT (12) 
 - 
 - F.Name VARCHAR (16)
 - L.Name VARCHAR (16)
 - Date of Birth DATE (MM-DD-YYYY)
 - gender BINARY (M|F)
 - player_nationality VARCHAR(16)
 - Last_Leauge_Attended VARCHAR(16)
 - Experience_Level VARCHAR(16)
 - League_claimed_player VARCHAR(128)

 - create_time TIMESTAMP

 *This format we must try to have the (ñ,á,é,í,ó,ú) included into the charset and collation*

---


  ### *side note* # 


 >Funny enough i was so focused writing what i needed that for one second i thought that for sure i was writing a query so i was renaming the columns to add the , lol. =)
---

 **LEAGUE**

 - league_id INT(12)

 *side note*

 Funny enough i was so focused writing what i needed that for one second i thought that for sure i was writing a query so i was renaming the columns to add the , lol. =)

 **TEAM**

 - id INT PRIMARY KEY
 - name_en VARCHAR(32)

 **EVENT**

 **GAME**

 
