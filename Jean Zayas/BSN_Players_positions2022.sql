



-- Are there any Free Agent for this season?

SELECT [Teams]
FROM [BSN_playersStats]
WHERE [Teams] IS NULL
UNION
SELECT [Equipo] FROM [BSN_teamstats]
WHERE [Equipo] IS NULL;



-- Which players needs their stats updated?
select mvp.*
FROM 
(SELECT [Players], [Position]

FROM [BSN_playersStats]
WHERE [Position] IS NULL
) AS mvp

-- are there any Duplicates or Empty slots on Teams table?
SELECT [Teams] FROM [BSN_playersStats]
WHERE [Teams] IS NOT NULL
UNION
SELECT [Equipo] FROM [BSN_teamstats]
WHERE [Equipo] IS NOT NULL;