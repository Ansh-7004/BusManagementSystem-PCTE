
-- Create the Database
CREATE DATABASE BusManagementSystem;
GO

-- Use the Database
USE BusManagementSystem;
GO

-- Table: Admin
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL
);

-- Table: Bus
CREATE TABLE Bus (
    BusID INT PRIMARY KEY IDENTITY(1,1),
    BusNumber VARCHAR(20) NOT NULL UNIQUE,
    Capacity INT NOT NULL,
    DriverName VARCHAR(100),
    ContactNumber VARCHAR(15)
);

-- Table: Route
CREATE TABLE Route (
    RouteID INT PRIMARY KEY IDENTITY(1,1),
    Source VARCHAR(100) NOT NULL,
    Destination VARCHAR(100) NOT NULL,
    Distance FLOAT,
    EstimatedTime VARCHAR(50)
);

-- Table: Student
CREATE TABLE Student (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    RollNumber VARCHAR(20) NOT NULL UNIQUE,
    Department VARCHAR(50),
    ContactNumber VARCHAR(15)
);

-- Table: Booking
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    BusID INT NOT NULL,
    RouteID INT NOT NULL,
    BookingDate DATE DEFAULT GETDATE(),

    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (BusID) REFERENCES Bus(BusID),
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);

-- Sample Admin Insert
INSERT INTO Admin (Username, PasswordHash)
VALUES ('admin', 'admin@123');

-- Sample Bus Insert
INSERT INTO Bus (BusNumber, Capacity, DriverName, ContactNumber)
VALUES 
('PB10AB1234', 50, 'Ramesh Kumar', '9876543210'),
('PB10CD5678', 40, 'Suresh Sharma', '9876543211');

-- Sample Route Insert
INSERT INTO Route (Source, Destination, Distance, EstimatedTime)
VALUES 
('Ludhiana', 'PCTE Campus', 8.5, '25 mins'),
('Model Town', 'PCTE Campus', 6.0, '20 mins');

-- Sample Student Insert
INSERT INTO Student (Name, RollNumber, Department, ContactNumber)
VALUES 
('Simran Kaur', 'PCTE2023CS01', 'Computer Science', '9876500011'),
('Aman Verma', 'PCTE2023IT02', 'Information Technology', '9876500022');

-- Sample Booking Insert
INSERT INTO Booking (StudentID, BusID, RouteID)
VALUES 
(1, 1, 1),
(2, 2, 2);
