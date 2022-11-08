-- How many Star Systems has more than 4 planets?
SELECT
Distance_ly,
--Planet_Name, [Number_of_Planets]
COUNT(*) TOTAL_STAR_SYSTEMS
FROM TerraformingCandidates
WHERE Number_of_Planets >=4
GROUP BY Distance_ly
ORDER BY Distance_ly DESC

;
--How many planets were discovered in 2022
SELECT Discovery_Year, Planet_Name, Planet_Radius_Earth_Radius FROM [dbo].[Updated and Filtered Exoplanet Data]
GROUP BY Planet_Radius_Earth_Radius, Discovery_Year, Planet_Name
HAVING  Discovery_Year = 2022
ORDER BY Planet_Radius_Earth_Radius DESC

-- Joining Two tables by Host Name and Planet name
SELECT [dbo].[TerraformingCandidates].Planet_Name, [dbo].[Updated and Filtered Exoplanet Data].Host_Name
FROM [dbo].[TerraformingCandidates]
INNER JOIN [dbo].[Updated and Filtered Exoplanet Data]
ON [dbo].[TerraformingCandidates].Host_Name=[dbo].[Updated and Filtered Exoplanet Data].Host_Name


SELECT [dbo].[TerraformingCandidates].Number_of_Planets, [dbo].[TerraformingCandidates].Planet_Name  FROM [dbo].[TerraformingCandidates]
FULL OUTER JOIN [dbo].[Updated and Filtered Exoplanet Data]
ON [dbo].[TerraformingCandidates].[Planet_Name] = [dbo].[Updated and Filtered Exoplanet Data].[Planet_Name]

--How many unique planets are in TerraformingCandidates Table
SELECT COUNT(DISTINCT Planet_name) FROM [dbo].[TerraformingCandidates]


--List all planets that has Proxima in their name
SELECT Planet_name FROM [dbo].[TerraformingCandidates] 
WHERE Planet_Name LIKE '%Proxima%'