DROP DATABASE IF EXISTS joshan_db;
CREATE DATABASE joshan_db;
USE joshan_db;
SELECT DATABASE();

CREATE TABLE IF NOT EXISTS Employees (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Hire_Date DATE
);
INSERT INTO Employees VALUES
(101,'Joshan','Shrestha','2026-01-10'),
(102,'Asha','Karki','2024-05-15'),
(103,'Nabin','Rai','2025-03-20');
DESCRIBE Employees;


ALTER TABLE Employees
ADD Email VARCHAR(100);

UPDATE Employees SET Email='joshan@gmail.com' WHERE Employee_ID=101;
UPDATE Employees SET Email='asha@gmail.com' WHERE Employee_ID=102;
UPDATE Employees SET Email='nabin@gmail.com' WHERE Employee_ID=103;
SELECT * FROM Employees;

ALTER TABLE Employees
RENAME TO Staff;
SHOW TABLES;

ALTER TABLE Staff
ADD Age INT CHECK (Age >= 0);

UPDATE Staff SET Age=21 WHERE Employee_ID=101;
UPDATE Staff SET Age=24 WHERE Employee_ID=102;
UPDATE Staff SET Age=23 WHERE Employee_ID=103;
SELECT * FROM Staff;


CREATE TABLE IF NOT EXISTS Customers (
    Customer_ID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50) DEFAULT 'Kathmandu'
);
DESCRIBE Customers;

CREATE TABLE IF NOT EXISTS Orders (
    Order_ID INT PRIMARY KEY,
    OrderDate DATE,
    Customer_ID INT,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID)
);
DESCRIBE Orders;
DROP TABLE Staff;
SHOW TABLES;
