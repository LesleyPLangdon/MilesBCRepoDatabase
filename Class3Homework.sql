use MilesBootcamp;
/*1. The system should also be able to track Rooms. Rooms should have a status and an associated tavern. 
There should be a way to track Room Stays which will contain a sale, guest, room, the date it was stayed in and the rate*/

DROP TABLE IF EXISTS RoomStatus;
CREATE TABLE RoomStatus(ID INT IDENTITY(1,1), RoomStatus varchar(50), PRIMARY KEY(ID));
INSERT INTO RoomStatus(RoomStatus) VALUES ('Occupied'), ('VacantDirty'), ('VacantCleanAvailable'), ('VacantCleanReserved');

DROP TABLE IF EXISTS Rooms;
CREATE TABLE Rooms(ID INT IDENTITY(1,1), TavernID INT, RoomNumber INT, RoomStatusID INT, PRIMARY KEY(ID), FOREIGN KEY(TavernID) REFERENCES Tavern(ID), FOREIGN KEY(RoomStatusID) REFERENCES RoomStatus(ID));
INSERT INTO Rooms(TavernID, RoomNumber, RoomStatusID) VALUES (1, 101, 1), (1, 102, 2), (1, 103, 2), (1, 104, 4), (1, 105, 4), (1, 201, 4);

DROP TABLE IF EXISTS RoomSales;
CREATE TABLE RoomSales(ID INT IDENTITY(1,1), GuestID INT, RoomID INT, CheckInDate DATE, CheckOutDate DATE, Rate Float, 
	PRIMARY KEY(ID), FOREIGN KEY(GuestID) REFERENCES Guest(ID), FOREIGN KEY(RoomID) REFERENCES Rooms(ID));
INSERT INTO RoomSales(GuestID, RoomID, CheckInDate, CheckOutDate, Rate) VALUES
	(1, 1, '2020-12-30', '2021-01-02', 250.00),
	(1, 3, '2021-01-14', '2021-01-18', 125.98),
	(3, 1, '2021-01-07', '2021-01-08', 87.50);

/*2. Write a query that returns guests with a birthday before 2000. */

select * 
FROM dbo.Guest WHERE Birthday < '2000-01-01';

/*3. Write a query to return rooms that cost more than 100 gold a night*/
select * FROM dbo.RoomSales WHERE Rate > 100.00;

/*4.Write a query that returns UNIQUE guest names. */
SELECT DISTINCT Name From Guest;

/*5. Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]*/
SELECT * FROM Guest ORDER BY Name ASC;

/*6. Write a query that returns the top 10 highest price sales*/
use FantasyTavern;
/*Select * FROM ServicesSales;*/
SELECT TOP 10 * FROM ServicesSales
ORDER BY (Price * QuantityPurchased) DESC;

/*7. Write a query to return all the values stored in all Lookup Tables - 
Lookup tables are the tables we reference typically with just an ID and a name. This should be a dynamic combining of all of the tables*/
use MilesBootcamp;
SELECT * FROM Location 
UNION ALL
SELECT * FROM Role
UNION ALL
SELECT * FROM Status
UNION ALL
SELECT * FROM Class;



/*8. Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-10, 10-20, etc)*/
/*SELECT * FROM Level;*/
SELECT (CASE WHEN [Level] = 1 THEN 'Novice'
WHEN [Level] > 1 and [Level] < 5 THEN 'Intermediate'
ELSE 'Expert' END) AS ClassLevel, * FROM [Level];
/*9. Write a series of INSERT commands that will insert the statuses of one table into another of your choosing using SELECT statements */


SELECT * FROM dbo.Level;

