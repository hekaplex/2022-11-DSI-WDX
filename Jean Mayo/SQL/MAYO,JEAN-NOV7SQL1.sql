/*

    Choose one tool ( SQL Server Management Studio (SSMS or Azure data Studio (ADS))
    Review code for understanding on teh following SQL syntax
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

--What are the Planet Systems to be terraformed with more than one planet?
SELECT
	Planet_Name, 
	[Host_Name],
	[Number_of_Planets]
FROM TerraformingCandidates
GROUP BY 
	Planet_Name,
	[Host_Name],
	[Number_of_Planets]
HAVING SUM(Number_of_Planets) >1
ORDER BY Number_of_Planets DESC
/*
Planet_Name                                        Host_Name                                          Number_of_Planets
-------------------------------------------------- -------------------------------------------------- -----------------
TRAPPIST-1 d                                       TRAPPIST-1                                         7
TRAPPIST-1 e                                       TRAPPIST-1                                         7
GJ 667 C b                                         GJ 667 C                                           5
GJ 667 C c                                         GJ 667 C                                           5
GJ 667 C e                                         GJ 667 C                                           5
*/
;

--Of the Planet Systems with >1 planet how many are hosted in the GJ area?
SELECT
	Planet_Name, 
	[Host_Name],
	[Number_of_Planets]
FROM TerraformingCandidates
WHERE[Host_Name] LIKE 'GJ%' and [Number_of_Planets] >1 
ORDER BY Number_of_Planets DESC
/*
Planet_Name                                        Host_Name                                          Number_of_Planets
-------------------------------------------------- -------------------------------------------------- -----------------
GJ 667 C b                                         GJ 667 C                                           5
GJ 667 C c                                         GJ 667 C                                           5
GJ 667 C e                                         GJ 667 C                                           5
GJ 667 C f                                         GJ 667 C                                           5
GJ 667 C g                                         GJ 667 C                                           5
*/
;
--Of the PriorityStarSystemCandidates how many are TerraformingCandidates with >1 planets?
SELECT TerraformingCandidates.[Host_Name], Number_of_Planets 
FROM [dbo].[TerraformingCandidates]
INNER JOIN [dbo].[PriorityStarSystemTargets]
ON TerraformingCandidates.[Host_Name]= PriorityStarSystemTargets.[Host_Name]
WHERE Number_of_Planets >1
/*
Host_Name                                          Number_of_Planets
-------------------------------------------------- -----------------
tau Cet                                            4
tau Cet                                            4
tau Cet                                            4
tau Cet                                            4
GJ 1061                                            3
*/
;
