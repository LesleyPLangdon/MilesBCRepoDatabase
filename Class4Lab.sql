use MilesBootcamp;
SELECT (Name), (Class.Class), (Level.Level),
	(CASE WHEN [Level] = 1 THEN 'Novice'
	WHEN [Level] > 1 and [Level] < 5 THEN 'Intermediate'
	ELSE 'Expert' END) AS ClassLevel FROM Guest
LEFT JOIN Level ON (Guest.ID = Level.GuestID)
LEFT JOIN Class ON (Level.ClassID = Class.ID)
ORDER BY Name ASC;

SELECT (Name), (Class.Class), (Level.Level),
	(CASE WHEN [Level] = 1 THEN 'Novice'
	WHEN [Level] > 1 and [Level] < 5 THEN 'Intermediate'
	ELSE 'Expert' END) AS ClassLevel FROM Guest
LEFT JOIN Level ON (Guest.ID = Level.GuestID)
LEFT JOIN Class ON (Level.ClassID = Class.ID)
WHERE Level >5
ORDER BY Name ASC;

SELECT (Name), (Class.Class), (Level.Level),
	(CASE WHEN [Level] = 1 THEN 'Novice'
	WHEN [Level] > 1 and [Level] < 5 THEN 'Intermediate'
	ELSE 'Expert' END) AS ClassLevel FROM Guest
LEFT JOIN Level ON (Guest.ID = Level.GuestID)
LEFT JOIN Class ON (Level.ClassID = Class.ID)
WHERE Level >5 AND Class = 'AXE Thrower'
ORDER BY Name ASC;


select CONCAT('CREATE TABLE',' ', 'Taverns', ' (')
UNION ALL
select CONCAT(COLUMN_NAME, ' ', DATA_TYPE, ',')
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Tavern'
AND CHARACTER_MAXIMUM_LENGTH is NULL
UNION
select CONCAT(COLUMN_NAME, ' ', DATA_TYPE, '(', CHARACTER_MAXIMUM_LENGTH, '),')
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Tavern'
AND CHARACTER_MAXIMUM_LENGTH is NOT NULL
UNION ALL
select (');');