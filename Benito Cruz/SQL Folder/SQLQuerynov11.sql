/*
CREATE TABLE [TABLE]
*/



CREATE FUNCTION apply_tbl(@Keycol int)
RETURNS TABLE 
RETURN
	SELECT * from Table where Keycol = @Keycol

select * from apply_tl(2)



--new practice
--
