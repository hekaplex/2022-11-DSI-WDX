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

-- How far away are the Star Systems that have only 1 planet in them?
SELECT [Distance_ly],
--Planet_Name, [Number_of_Planets]
COUNT(*) TOTAL_STAR_SYSTEMS
FROM [dbo].[TerraformingCandidates]
WHERE Number_of_Planets = 1 
GROUP BY Distance_ly
ORDER BY Distance_ly DESC
;

-- What 10 planets has the longest orbit time and was discovered in 2022?
SELECT TOP 10 Discovery_Year, Planet_Name, [Orbital_Period_days]
FROM [Updated and Filtered Exoplanet Data]
GROUP by [Orbital_Period_days], Discovery_Year, Planet_Name  
HAVING Discovery_Year = 2022
ORDER by [Orbital_Period_days] DESC;


--Which planets do we have data for the average temperature? 
SELECT [dbo].[Updated and Filtered Exoplanet Data].Host_Name,[dbo].[TerraformingCandidates].Planet_Name,[dbo].[TerraformingCandidates].Equilibrium_Temperature_K 
FROM [dbo].[TerraformingCandidates]
JOIN [dbo].[Updated and Filtered Exoplanet Data] 
ON [dbo].[TerraformingCandidates].Planet_Name=[dbo].[Updated and Filtered Exoplanet Data].Planet_Name
WHERE [dbo].[TerraformingCandidates].Equilibrium_Temperature_K <> 'NULL'
GROUP BY [dbo].[TerraformingCandidates].Equilibrium_Temperature_K,[dbo].[Updated and Filtered Exoplanet Data].Host_Name, [dbo].[TerraformingCandidates].Planet_Name
ORDER BY [dbo].[TerraformingCandidates].Equilibrium_Temperature_K ASC
;