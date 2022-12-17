ALTER TABLE [Atleticos Roster] ALTER COLUMN Player_Image varchar(255)




	   update [Atleticos Roster] set Player_Image = 'https://www.bsnpr.com/uploads/equipos/E7.png'
	 where Player_Numbers = 1 AND Last_Name LIKE '%ason jr'  

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J13079.jpg'
	 where Player_Numbers = 2 AND Last_Name LIKE '%ernandez'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J12964.png'
	 where Player_Numbers = 6 AND Last_Name LIKE '%aniels'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J13233.jpg'
	 where Player_Numbers = 7 AND Last_Name LIKE '%razo'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J13398.jpg'
	 where Player_Numbers = 10 AND Last_Name LIKE '%anabria'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J13320.jpg'
	 where Player_Numbers = 11 AND Last_Name LIKE '%antos'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J2780.jpg'
	 where Player_Numbers = 12 AND Last_Name LIKE '%iaz'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/equipos/E7.png'
	 where Player_Numbers = 13 AND Last_Name LIKE '%ac'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/equipos/E7.png'
	 where Player_Numbers = 14 AND Last_Name LIKE '%ollis jefferson'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J12969.jpg'
	 where Player_Numbers = 15 AND Last_Name LIKE '%ranch'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J13340.jpg'
	 where Player_Numbers = 16 AND Last_Name LIKE '%illaman'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J13393.jpg'
	 where Player_Numbers = 23 AND Last_Name LIKE '%onzalez'--  goree venable gonzalez

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/equipos/E7.png'
	 where Player_Numbers = 23 AND Last_Name LIKE '%anabria' --  jorge sanabria

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J13323.jpg'
	 where Player_Numbers = 24 AND Last_Name LIKE '%uinones'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J2637.jpg'
	 where Player_Numbers = 35 AND Last_Name LIKE '%ernandez'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J13055.jpg'
	 where Player_Numbers = 45 AND Last_Name LIKE '%odriguez'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/equipos/E7.png'
	 where Player_Numbers = 55 AND Last_Name LIKE '%yala'

	update [Atleticos Roster] set Player_Image =  'https://www.bsnpr.com/uploads/jugadores_small/J2476.png'
	 where Player_Numbers = 77 AND Last_Name LIKE '%lamo'


ALTER TABLE [BSN_TEAMS] ALTER COLUMN Logo varchar(255)
 
DELETE FROM [BSN_TEAMS] WHERE Teams IS NULL

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E7.png'
	 where Teams LIKE '%tleticos'  --Atleticos

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E13.png'
	where Teams LIKE '%rujos' --Brujos
	
 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E1.png'
	where Teams LIKE '%angrejeros' --Cangrejeros

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E2.png'
	where Teams LIKE '%apitanes' --Capitanes

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E15.png'
	where Teams LIKE '%ariduros' --Cariduros

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E10.png'
	where Teams LIKE '%igantes' --Gigantes

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E73.png'
	where Teams LIKE '%rises' --Grises

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E12.png'
	where Teams LIKE '%ndios' --Indios

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E5.jpg'
	where Teams LIKE '%eones' --Leones

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E14.png'
	where Teams LIKE '%ets' --Mets

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E6.png'
	where Teams LIKE '%iratas' --Piratas

 update [BSN_TEAMS] set Logo = 'https://www.bsnpr.com/uploads/equipos/E9.png'
 	where Teams LIKE '%aqueros' --Vaqueros


