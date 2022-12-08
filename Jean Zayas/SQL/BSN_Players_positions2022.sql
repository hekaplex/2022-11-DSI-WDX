



-- Are there any Free Agent for this season?

SELECT [Teams]
FROM [PlayerLIVESTATS]
WHERE [Teams] IS NULL
UNION
SELECT [Teams] FROM [BSN_TEAMS]
WHERE [Teams] IS NULL;



-- Which players needs their stats updated?
select mvp.*
FROM 
(SELECT [Players], [Position]

FROM [PlayerLIVESTATS]
WHERE [Position] IS NULL
) AS mvp

-- are there any Duplicates or Empty slots on Teams table?
SELECT [Teams] FROM [PlayerLIVESTATS]
WHERE [Teams] IS NOT NULL
UNION
SELECT [Teams] FROM [BSN_0TEAMS]
WHERE [Teams] IS NOT NULL;