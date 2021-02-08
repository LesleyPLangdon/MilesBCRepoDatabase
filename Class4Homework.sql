USE MilesBootcamp;

/*1. Write a query to return users who have admin roles*/
/*Since I don't have any admins at this time I adjusted to look for owners*/
/*SELECT * FROM SystemUser;
SELECT * FROM Role;*/
SELECT * FROM SystemUser WHERE RoleID = 1;

/*2. Write a query to return users who have admin roles and information about their taverns*/
SELECT * FROM SystemUser 
LEFT JOIN Tavern ON (SystemUser.ID = Tavern.OwnerID) 
WHERE RoleID = 1;

/*3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels*/
SELECT (Name), (Class.Class), (Level.Level) FROM Guest 
LEFT JOIN Level ON (Guest.ID = Level.GuestID)
LEFT JOIN Class ON (Level.ClassID = Class.ID)
ORDER BY Name ASC;

/*4. Write a query that returns the top 10 sales in terms of sales price and what the services were*/


SELECT * FROM RoomSales;
SELECT * FROM ServiceSales;
SELECT TOP 10 FROM ;
/*5. Write a query that returns guests with 2 or more classes*/
/*INSERT INTO Guest (Name, Birthday, Cakeday, StatusID, Notes) VALUES
	('Janice', '1990-09-07', '2017-12-12', 4, 'None'),
	('Sally', '1974-03-22', '2020-03-22', 2, 'VIP Birthday treatment'),
	('Oliver', '1980-01-14', '2016-07-08', 3, 'Former employee of Joes ale House');

INSERT INTO Level (Level, ClassID, GuestID) VALUES
	(11, 1, 1002), (6, 5, 1002), (3, 2, 1002), (7, 3, 1003), (2, 1, 1003), (12, 4, 1004);

SELECT (Guest.Name), COUNT(Guest.Name), (Class.Class), (Level.Level) FROM Guest 
LEFT JOIN Level ON (Guest.ID = Level.GuestID)
LEFT JOIN Class ON (Level.ClassID = Class.ID)
GROUP BY Guest.Name HAVING COUNT(Name)>1;*/

DECLARE @NumLevels,
SELECT g.Name, c.Class, l.Level
FROM Guest g
JOIN Level l ON g.ID = l.GuestID
JOIN Class c on l.ClassID = c.ID,
(SELECT @NumLevels = COUNT(g.Name)
FROM Guest)
WHERE NumLevels > 1;


(SELECT GuestID, MAX(Level) as MaxLevel
FROM Level
GROUP BY GuestID) as MaxClasses
WHERE l.Level = MaxClasses.MaxLevel AND l.GuestID = MaxClasses.GuestID;



SELECT (Name), (Level.Level) FROM Guest
JOIN [Level] ON (Guest.ID = Level.GuestID)
GROUP BY Name
HAVING COUNT(Name) > 1;

SELECT (Name), (Level.Level) FROM Guest
LEFT JOIN Level ON (Guest.ID = Level.GuestID);
HAVING COUNT(Name) > 1;

SELECT COUNT(*) FROM Tavern;

/*6. Write a query that returns guests with 2 or more classes with levels higher than 5*/


/*7. Write a query that returns guests with ONLY their highest level class*/
SELECT g.Name, c.Class, l.Level
FROM Guest g
JOIN Level l ON g.ID = l.GuestID
JOIN Class c on l.ClassID = c.ID,
(SELECT GuestID, MAX(Level) as MaxLevel
FROM Level
GROUP BY GuestID) as MaxClasses
WHERE l.Level = MaxClasses.MaxLevel AND l.GuestID = MaxClasses.GuestID;




/*8. Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)*/
use MilesBootcamp;
SELECT * FROM RoomSales;
DECLARE
@DateStart date = '2021-01-06',
@DateEnd date = '2021-01-16'

Select g.Name
FROM Guest g
	Inner Join RoomSales rs on g.ID = rs.GuestID
WHERE (CheckInDate >= @DateStart AND CheckInDate <= @DateEnd) OR
(CheckOutDate >= @DateStart AND CheckOutDate <= @DateEnd);


/*9. Using the additional queries provided, take the lab’s SELECT ‘CREATE query’ and add any IDENTITY and PRIMARY KEY constraints to it.*/