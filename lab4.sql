DROP DATABASE IF EXISTS joshan_db;
CREATE DATABASE joshan_db;
USE joshan_db;

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES
(1,'Joshan','Koirala','joshan.koirala@gmail.com'),
(2,'Sagar','Koirala','sagar.koirala@gmail.com'),
(3,'Diwash','Shrestha','diwash.shrestha@gmail.com'),
(4,'Pritik','Thapa Magar','pritik.thapa.magar@gmail.com');
SELECT * FROM Customers;

INSERT INTO Orders VALUES
(1,1,'2026-07-16',150.00),
(2,2,'2026-07-17',200.00),
(3,1,'2026-07-18',250.00),
(4,3,'2026-07-19',100.00);
SELECT * FROM Orders;

UPDATE Customers
SET Email='CSIT2080@gmail.com'
WHERE CustomerID=1;
SELECT * FROM Customers;

UPDATE Orders
SET TotalAmount=175.00
WHERE OrderID=1;
SELECT * FROM Orders;

DELETE FROM Orders WHERE OrderID=2;
DELETE FROM Customers WHERE CustomerID=2;
SELECT * FROM Orders;
SELECT * FROM Customers;

SELECT COUNT(*) AS Total_Customers FROM Customers;

SELECT COUNT(*) AS Total_Orders FROM Orders;

SELECT SUM(TotalAmount) AS Total_Sales FROM Orders;

SELECT AVG(TotalAmount) AS Average_Order_Amount FROM Orders;

SELECT MIN(TotalAmount) AS Lowest_Order_Amount FROM Orders;

SELECT MAX(TotalAmount) AS Highest_Order_Amount FROM Orders;

SELECT C.CustomerID,C.FirstName,C.LastName,
       SUM(O.TotalAmount) AS Total_Amount_Spent
FROM Customers C
JOIN Orders O ON C.CustomerID=O.CustomerID
GROUP BY C.CustomerID,C.FirstName,C.LastName;

SELECT C.FirstName,C.LastName,
       SUM(O.TotalAmount) AS Total_Amount_Spent
FROM Customers C
JOIN Orders O ON C.CustomerID=O.CustomerID
GROUP BY C.CustomerID,C.FirstName,C.LastName
HAVING SUM(O.TotalAmount)>200;
