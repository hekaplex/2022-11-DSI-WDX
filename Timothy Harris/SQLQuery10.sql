/*SQL Server Coding Exercise - Nov 6
Steps to complete exercise
Choose one tool ( SQL Server Management Studio (SSMS or Azure data Studio (ADS))
Review code for understanding on the following SQL syntax
Mandatory Clauses
JOIN..ON
ORDER BY
GROUP BY
WHERE
HAVING
Optional Clauses
DISTINCT
IN
LIKE
Think about what three different queries you can write that will across all three use all of the mandatory clauses and at least one of the optional clauses
Each answer will have three parts:
Write the business questions commented out in SSMS/in a .sql file in ADS or in a Markdown cell in a notebook in ADS
write the SQL query
include at least 3 rows of the results in comments in SSMS or save the results in the notebook in ADS
*/
USE [StarSystem]
--what are the 10 largest planets 
select TOP 10 [Planet_Name],[Planet_Mass_or_Mass_sin_i_Earth_Mass],[Planet_Radius_Earth_Radius]
FROM TerraformingCandidates
WHERE Planet_Mass_or_Mass_sin_i_Earth_Mass>=
1.02
ORDER BY [Planet_Mass_or_Mass_sin_i_Earth_Mass] DESC





-- How many Star Systems has more than 4 planets?
SELECT Distance_ly, Planet_Name, Number_of_Planets
FROM TerraformingCandidates
WHERE Number_of_Planets >= 4
ORDER BY Distance_ly DESC;


--Relatiopships exsit between host 
SELECT [dbo].[PriorityStarSystemTargets].[Host_Name]
FROM [dbo].[PriorityStarSystemTargets]
INNER JOIN [dbo].[TerraformingCandidates] ON [dbo].[PriorityStarSystemTargets].[Host_Name]=[dbo].[TerraformingCandidates].Host_Name