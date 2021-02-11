/*1. Write a query to return a “report” of all users and their roles*/
use MilesBootCamp;
SELECT SystemUser.Name, Role.Name FROM SystemUser, Role
Where SystemUser.RoleID = Role.ID;

/*2. Write a query to return all classes and the count of guests that hold those classes*/
use MilesBootCamp;
SELECT Class, COUNT(Name) FROM 
(SELECT c.Class, l.ClassID, g.Name FROM Guest AS g
JOIN Level AS l ON g.ID = l.GuestID
JOIN Class AS c ON l.ClassID = c.ID) AS NT
GROUP BY Class;


/*3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels. 
Add a column that labels them beginner (lvl 1-5), intermediate (5-10) and expert (10+) for their classes (Don’t alter the table for this)*/
use MilesBootCamp;
SELECT (Name), (c.Class), (l.Level), (SELECT (CASE WHEN l.Level = 1 THEN 'Novice'
WHEN l.Level > 1 and l.Level < 5 THEN 'Intermediate'
WHEN l.Level > 5 THEN 'Expert' ELSE 'No Classes' END) AS ClassLevel) FROM Guest AS g
LEFT JOIN Level AS l ON (g.ID = l.GuestID)
LEFT JOIN Class AS c ON (l.ClassID = c.ID)
ORDER BY Name ASC;



/*4. Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)*/
use MilesBootCamp;
GO

CREATE FUNCTION getLevelGroup(@level INT)
RETURNS varchar(50)
AS
BEGIN
DECLARE @ret varchar(50);
SELECT @ret (CASE WHEN @level = 1 THEN @ret = 'Novice'
WHEN @level > 1 and @level < 5 THEN @ret = 'Intermediate'
ELSE @ret = 'Expert'
RETURN @ret;
END;
SELECT * FROM getLevelGroup(6);

/*5. Write a function that returns a report of all open rooms (not used) on a particular day (input) and which tavern they belong to*/

/*I will need to completely rework my room and relating tables in order to complete the next few questions*/


use MilesBootCamp;
SELECT * FROM RoomStatus;
CREATE FUNCTION openRooms (@reqDate DATE)
RETURNS TABLE
AS
RETURN
(
	SELECT t.TavernName, r.RoomNumber FROM Rooms r 
	JOIN Tavern as t ON t.ID = r.TavernID
	JOIN RoomStatus rs ON rs.ID = r.RoomStatusID
	WHERE 
);
SELECT * FROM
SELECT * FROM

/*6. Modify the same function from 5 to instead return a report of prices in a range (min and max prices) - Return Rooms and their taverns based on price inputs*/
use MilesBootCamp;
CREATE FUNCTION openRoomsByPrice (@minPrice FLOAT, @maxPrice FLOAT)
RETURNS TABLE
AS
RETURN
(
	SELECT  
	JOIN
	WHERE
);
SELECT * FROM
SELECT * FROM

/*7. Write a command that uses the result from 6 to Create a Room in another tavern that undercuts (is less than) the cheapest room by a penny - thereby making the new room the cheapest one*/
use MilesBootCamp;