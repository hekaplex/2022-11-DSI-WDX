Select Type_1,COUNT(Type_1)AS "Type Count" , COUNT(Type_2)AS "Other Type"
From Pokemon
GROUP By Type_1 
Having COUNT(Type_1) < 25
Order By [Type Count] DESC
