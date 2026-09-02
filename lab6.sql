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
(4,'Pritik','Thapa Magar','pritik.thapa.magar@yahoo.com');



INSERT INTO Orders VALUES
(101,1,'2026-07-01',250.00),(102,1,'2026-07-01',350.00),
(103,2,'2026-07-02',200.00),(104,2,'2026-07-03',400.00),
(105,3,'2026-07-02',150.00),(106,4,'2026-07-04',700.00);

SELECT * FROM Customers
WHERE Email LIKE '%gmail.com%'
  AND CustomerID BETWEEN 2 AND 5;

SELECT OrderDate,
       SUM(TotalAmount) AS Total_Amount
FROM Orders
GROUP BY OrderDate
ORDER BY OrderDate;

SELECT C.CustomerID,
       COUNT(O.OrderID) AS Total_Orders
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID=O.CustomerID
GROUP BY C.CustomerID
ORDER BY C.CustomerID;

SELECT LastName,
       COUNT(*) AS Customer_Count
FROM Customers
GROUP BY LastName
ORDER BY LastName;

SELECT CustomerID,
       SUM(TotalAmount) AS Total_Order_Amount
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount)>500
ORDER BY CustomerID;

SELECT C.FirstName,
       SUM(O.TotalAmount) AS Total_Amount_Spent
FROM Customers C
JOIN Orders O ON C.CustomerID=O.CustomerID
GROUP BY C.CustomerID,C.FirstName
HAVING COUNT(O.OrderID)>1
ORDER BY C.CustomerID;
