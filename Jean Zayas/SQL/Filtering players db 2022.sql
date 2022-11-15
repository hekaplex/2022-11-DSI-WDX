
--
SELECT * FROM [dbo].[BSN_playersStats]
GO
CREATE FUNCTION [dbo].[BSN_playersStats BY Players]
(@Players nvarchar(50))
Returns table 


-- filter players by name letters but it can be filtered by column
return
(SELECT * FROM  [dbo].[BSN_playersStats] WHERE Players LIKE '%'+ @Players + '%')
GO
SELECT * FROM [dbo].[BSN_playersStats BY Players] ('J')
GO


/*
[3:08 PM] Drew Minkin
UPDATE Players set Position = 'forward' where Players in('tom','harry')

[3:09 PM] Drew Minkin
update p set position = xl.position
from players p join excelimport xl
on xl.players = p.players


*/

