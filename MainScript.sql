USE MilesBootcamp;

DROP TABLE IF EXISTS Location;
CREATE TABLE dbo.Location(ID INT IDENTITY(1,1), Region varchar(250));
INSERT INTO dbo.Location(Region) VALUES('South Jersey');
INSERT INTO dbo.Location(Region) VALUES('Central Pennsylvania');
INSERT INTO dbo.Location(Region) VALUES('Maine');
INSERT INTO dbo.Location(Region) VALUES('Greater Atlanta');
INSERT INTO dbo.Location(Region) VALUES('Northern California');
ALTER TABLE dbo.Location ADD CONSTRAINT ID PRIMARY KEY (ID); 

DROP TABLE IF EXISTS Role;
CREATE TABLE Role(ID INT IDENTITY(1,1), Name varchar(10), PRIMARY KEY(ID));
INSERT INTO Role(Name) VALUES ('Owner'), ('Manager'), ('Cook'), ('Server'), ('Guest');

DROP TABLE IF EXISTS Status;
CREATE TABLE Status(ID INT IDENTITY(1,1), Name varchar(250), PRIMARY KEY(ID));
INSERT INTO Status(Name) VALUES ('Active'), ('Inactive'), ('Promotion');


DROP TABLE IF EXISTS Services;
CREATE TABLE Services(ID INT IDENTITY(1,1), Name varchar(250), StatusID INT, PRIMARY KEY(ID));
INSERT INTO Services(Name, StatusID) VALUES ('Pool', 1), ('AirHockey', 1), ('AxeThrowing', 2), ('HappyHour', 3), ('Painting', 3);

DROP TABLE IF EXISTS SystemUser;
CREATE TABLE SystemUser(ID INT IDENTITY(1,1), Name varchar(25), RoleID INT, PRIMARY KEY(ID));
INSERT INTO SystemUser(Name, RoleID) VALUES ('Joe Jones', 1), ('Sally Smith', 1), ('Alex Ashe', 5), ('Brad Black', 5), ('Dave Davis', 5);

DROP TABLE IF EXISTS Tavern;
CREATE TABLE Tavern(ID INT IDENTITY(1,1), TavernName varchar(250), LocationID INT, Floors INT, OwnerID INT, ServiceID INT, PRIMARY KEY(ID));
INSERT INTO Tavern(TavernName, LocationID, Floors, OwnerID, ServiceID) VALUES ('Joes Ale House', 1, 3, 1, 2); 
INSERT INTO Tavern(TavernName, LocationID, Floors, OwnerID, ServiceID) VALUES ('Joes Ale House', 2, 2, 1, 2);
INSERT INTO Tavern(TavernName, LocationID, Floors, OwnerID, ServiceID) VALUES ('Sallys Sandwiches', 3, 1, 2, 4);
INSERT INTO Tavern(TavernName, LocationID, Floors, OwnerID, ServiceID) VALUES ('Smiths Steaks', 4, 2, 2, 1);
INSERT INTO Tavern(TavernName, LocationID, Floors, OwnerID, ServiceID) VALUES ('Jones Juice Bar', 5, 1, 1, 5);
ALTER TABLE Tavern ADD FOREIGN KEY (LocationID) References Location(ID);
ALTER TABLE Tavern ADD FOREIGN KEY (OwnerID) References SystemUser(ID);

DROP TABLE IF EXISTS Rats;
CREATE TABLE Rats(ID INT IDENTITY(1,1), Name varchar(25), TavernID INT, FOREIGN KEY(TavernID) REFERENCES Tavern(ID));
INSERT INTO Rats (Name, TavernID) VALUES ('Jaq', 1), ('Gus', 1), ('Mickey', 3), ('Minnie', 3), ('Remy', 2);

DROP TABLE IF EXISTS Supplies;
CREATE TABLE Supplies(ID INT IDENTITY(1,1), Name varchar(25), Unit varchar(25), PRIMARY KEY(ID));
INSERT INTO Supplies(Name, Unit) VALUES ('Heineken', '12 oz Bottle'), 
('Ground Beef', 'Pound'), ('Pepsi', 'BIB'), ('Pepsi', '16oz Bottle'), ('Cod', 'Pound');

DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory(ID INT IDENTITY(1,1), SupplyID INT, TavernID INT, Date DATE, Count FLOAT, PRIMARY KEY(ID));
INSERT INTO Inventory (SupplyID, TavernID, Date, Count) VALUES (1, 1, '2021-01-10', 72),
(2, 1, '2021-01-10', 40), (4, 1, '2021-01-10', 44), (5, 1, '2021-01-10', 14), (2,3,'2021-01-10', 60), (3, 3, '2021-01-10', 1.3);
ALTER TABLE Inventory ADD FOREIGN KEY (SupplyID) References Supplies(ID);
ALTER TABLE Inventory ADD FOREIGN KEY (TavernID) References Tavern(ID);

DROP TABLE IF EXISTS Receivables;
CREATE TABLE Receivables(ID INT IDENTITY(1,1), SupplyID INT, TavernID INT, Cost FLOAT, Quantitiy FLOAT, DateReceived DATE, PRIMARY KEY(ID));
INSERT INTO Receivables(SupplyID, TavernID, Cost, Quantitiy, DateReceived) VALUES (1, 1, 12.45, 24, '2021-01-14'),
(1, 2, 87.92, 48, '2021-01-14'), (2, 3, 153.00, 60, '2021-01-14'), (5, 2, 43.98, 26, '2021-01-14'), (3, 3, 534.78, 2, '2021-01-14');
ALTER TABLE Receivables ADD FOREIGN KEY (SupplyID) References Supplies(ID);
ALTER TABLE Receivables ADD FOREIGN KEY (TavernID) References Tavern(ID);

DROP TABLE IF EXISTS ServiceSales;
CREATE TABLE ServiceSales(ID INT IDENTITY(1,1), ServiceID INT, TavernID INT NOT NULL, SystemUserID INT, Price FLOAT, Date DATE, Quantitiy INT, PRIMARY KEY(ID));
INSERT INTO ServiceSales(ServiceID, TavernID, SystemUserID, Price, Date, Quantitiy) VALUES(2, 1, 3, 7.95, '2021-01-6', 2), 
(2, 2, 3, 7.95, '2021-01-8', 1), (4, 3, 3, 24.95, '2021-01-6', 4), (1, 4, 5, 12.00, '2021-01-10', 6), (5, 5, 5, 9.95, '2021-01-11', 3);
ALTER TABLE ServiceSales ADD FOREIGN KEY (ServiceID) References Services(ID);
ALTER TABLE ServiceSales ADD FOREIGN KEY (TavernID) References Tavern(ID);
ALTER TABLE ServiceSales ADD FOREIGN KEY (SystemUserID) References SystemUser(ID);


DROP TABLE IF EXISTS GuestStatus;
CREATE TABLE GuestStatus(ID INT IDENTITY(1,1), Name varchar(25), PRIMARY KEY(ID));
INSERT INTO GuestStatus (Name) VALUES ('sick'), ('fine'), ('hangry'), ('raging'), ('placid');

DROP TABLE IF EXISTS Class;
CREATE TABLE Class(ID INT IDENTITY(1,1), Class varchar (25), PRIMARY KEY(ID));

DROP TABLE IF EXISTS Guest
CREATE TABLE Guest(ID INT IDENTITY(1,1), Name varchar(50), Birthday DATE, Cakeday DATE, StatusID INT, Notes varchar(250), PRIMARY KEY(ID));
ALTER TABLE Guest ADD FOREIGN KEY (StatusID) References GuestStatus(ID);



DROP TABLE IF EXISTS Level;
CREATE TABLE Level(ID INT IDENTITY(1,1), Level INT, ClassID INT, GuestID INT, PRIMARY KEY(ID));
ALTER TABLE Level ADD FOREIGN KEY (ClassID) References Class(ID);
ALTER TABLE Level ADD FOREIGN KEY (GuestID) References Guest(ID);

DROP TABLE IF EXISTS Rats;

INSERT INTO Class (Class) VALUES ('Archer'), ('Billiards'), ('CulinaryArts'), ('Painter'), ('Axe Thrower');

ALTER TABLE ServiceSales ADD SupplyID INT;
ALTER TABLE ServiceSales ADD FOREIGN KEY (SupplyID) References Supplies(ID);

INSERT INTO Guest (Name, Birthday, Cakeday, StatusID, Notes) VALUES
	('Joe', '1987-04-27', '2015-12-07', 2, 'Prefers drinks super cold and food super hot'),
	('Jane', '1998-10-06', '2018-03-12', 3, 'Won Karaoke'),
	('Juan', '1994-10-16', '2019-05-07', 1, 'Fan of painting nights'),
	('Erich', '1967-08-12', '2018-11-09', 5, 'We owe a complementary meal'),
	('Janice', '1990-09-07', '2017-12-12', 4, 'None');

INSERT INTO Guest (Name, Birthday, Cakeday, StatusID, Notes) VALUES
	('Sally', '1974-03-22', '2020-03-22', 2, 'VIP Birthday treatment'),
	('Oliver', '1980-01-14', '2016-07-08', 3, 'Former employee of Joes ale House');

INSERT INTO Level (Level, ClassID, GuestID) VALUES
	(11, 1, 1002), (6, 5, 1002), (3, 2, 1002), (7, 3, 1003), (2, 1, 1003), (12, 4, 1004);
	
INSERT INTO Level (Level, ClassID, GuestID) VALUES
	(4, 1, 1), (2, 2, 2), (1, 3, 4);
SELECT * FROM Guest;
