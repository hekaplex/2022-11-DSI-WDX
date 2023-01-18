
--
SELECT * FROM [dbo].[PlayerLIVESTATS]
GO
CREATE FUNCTION [dbo].[PlayerLIVESTATS BY Last_Name]
(@Last_Name nvarchar(50))
Returns table 


-- filter players by name letters but it can be filtered by column
return
(SELECT * FROM  [dbo].[PlayerLIVESTATS] WHERE [Last_Name] LIKE '%'+ @Last_Name + '%')
GO
SELECT * FROM [dbo].[PlayerLIVESTATS BY Last_Name] ('J')
GO


/*
[3:08 PM] Drew Minkin
UPDATE Players set Position = 'forward' where Players in('tom','harry')

[3:09 PM] Drew Minkin
update p set position = xl.position
from players p join excelimport xl
on xl.players = p.players


*/

