CREATE TABLE Owner (
    ownerID INT PRIMARY KEY,
    name NVARCHAR(50)
);
CREATE TABLE Vehicle (
    vehicleID INT PRIMARY KEY,
    maker VARCHAR(30),
    model VARCHAR(30),
    year INT,
    ownerID INT FOREIGN KEY REFERENCES Owner(ownerID)
);
CREATE TABLE Car (
    vehicleID INT PRIMARY KEY REFERENCES Vehicle(vehicleID),
    NumDoors INT,
    bodyStyle VARCHAR(30)
);
CREATE TABLE Motorcycle (
    vehicleID INT PRIMARY KEY REFERENCES Vehicle(vehicleID),
    type VARCHAR(30),
    engineSize INT
);
