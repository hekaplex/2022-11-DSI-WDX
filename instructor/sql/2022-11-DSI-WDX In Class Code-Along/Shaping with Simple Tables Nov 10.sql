/*
CREATE TABLE [Table1]
(
KeyCol int,
TblName char(20),
ColValue int
)
GO
CREATE TABLE [Table2]
(
KeyCol int,
TblName char(20),
ColValue int
)
GO
INSERT INTO 
	[Table2] 
	(KeyCol,TblName,ColValue) 
	VALUES
		 (1,'Table2',2) 
		,(3,'Table2',2) 
		,(4,'Table2',2) 
GO
INSERT INTO 
	[Table1] 
	(KeyCol,TblName,ColValue) 
	VALUES
		 (1,'Table2',1) 
		,(2,'Table2',1) 
GO
*/
SELECT 
	 a.*
FROM Table1 a
GO
SELECT 
	b.*
FROM
	Table2 b
GO
SELECT 
	 a.*
	,b.*,'Full Outer Join' as ShapeType
FROM Table1 a
FULL OUTER
JOIN
	Table2 b
ON
	a.KeyCol = b.KeyCol
GO
SELECT 
	 a.*
	,b.*,'Left Join' as ShapeType
FROM Table1 a
LEFT
JOIN
	Table2 b
ON
	a.KeyCol = b.KeyCol
GO
SELECT 
	 a.*
	,b.*,'Right Join' as ShapeType
FROM Table1 a
RIGHT
JOIN
	Table2 b
ON
	a.KeyCol = b.KeyCol

GO
SELECT 
	 a.*
	,b.*,'Inner Join' as ShapeType
FROM Table1 a
JOIN
	Table2 b
ON
	a.KeyCol = b.KeyCol
SELECT 
	 a.*
	,b.*,'Cross Join' as ShapeType
FROM Table1 a
CROSS JOIN
	Table2 b
GO
SELECT 
	 a.*,'Union' as ShapeType
FROM Table1 a
UNION
SELECT 
	b.*,'Union' as ShapeType
FROM
	Table2 b
GO

