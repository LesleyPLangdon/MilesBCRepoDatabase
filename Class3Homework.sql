use MilesBootcamp;

DROP TABLE IF EXISTS RoomStatus;
CREATE TABLE RoomStatus(ID INT IDENTITY(1,1), RoomStatus varchar(50), PRIMARY KEY(ID));
INSERT INTO RoomStatus(RoomStatus) VALUES ('Occupied', 'VacantDirty', 'VacantCleanAvailable', 'VacantCleanReserved');

DROP TABLE IF EXISTS Rooms;
CREATE TABLE Rooms(ID INT IDENTITY(1,1), TavernID INT, RoomNumber INT, RoomStatusID INT, PRIMARY KEY(ID), FOREIGN KEY(TavernID) REFERENCES Tavern(ID), FOREIGN KEY(RoomStatusID) REFERENCES RoomStatus(ID));
INSERT INTO Rooms(TavernID, RoomNumber, RoomStatusID) VALUES (1, 101, 1), (1, 102, 2), (1, 103, 2), (1, 104, 4), (1, 105, 4), (1, 201, 4);

DROP TABLE IF EXISTS RoomSales;
CREATE TABLE RoomSales(ID INT IDENTITY(1,1), GuestID INT, RoomID INT, CheckInDate DATE, CheckOutDate DATE, Rate Float, 
	PRIMARY KEY(ID), FOREIGN KEY(GuestID) REFERENCES Guest(ID), FOREIGN KEY(RoomID) REFERENCES Room(ID));
INSERT INTO RoomSales(GuestID, RoomID, CheckInDate, CheckOutDate, Rate) VALUES
	(1, 1, '2020-12-30', '2021-01-02', 250.00),
	(1, 3, '2021-01-14', '2021-01-18', 125.98),
	(3, 1, '2021-01-07', '2021-01-08', 87.50);




select * 
FROM dbo.Guest WHERE Birthday < '2000-01-01';

SELECT * FROM dbo.Level;

