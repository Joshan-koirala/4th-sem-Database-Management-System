DROP DATABASE IF EXISTS joshan_lab7_db;
CREATE DATABASE joshan_lab7_db;
USE joshan_lab7_db;

CREATE TABLE IF NOT EXISTS Employee (
    employeeNumber INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(100),
    salesRepEmployeeNumber INT,
    FOREIGN KEY (salesRepEmployeeNumber)
        REFERENCES Employee(employeeNumber)
);
CREATE TABLE IF NOT EXISTS Orders (
    orderNumber INT PRIMARY KEY,
    customerNumber INT,
    status VARCHAR(30),
    FOREIGN KEY (customerNumber)
        REFERENCES Customers(customerNumber)
);
CREATE TABLE IF NOT EXISTS Products (
    productCode VARCHAR(10) PRIMARY KEY,
    productName VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS OrderDetails (
    orderNumber INT,
    productCode VARCHAR(10),
    quantityOrdered INT,
    priceEach DECIMAL(10,2),
    PRIMARY KEY (orderNumber,productCode),
    FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber),
    FOREIGN KEY (productCode) REFERENCES Products(productCode)
);

INSERT INTO Employee VALUES
(1001,'Asha','Sharma'),
(1002,'Raj','Karki'),
(1003,'Mina','Thapa'),
(1004,'Nabin','Rai');

INSERT INTO Customers VALUES
(101,'Himalayan Traders',1001),
(102,'Everest Supplies',1002),
(103,'Kathmandu Mart',1001),
(104,'Pokhara Store',NULL),
(105,'Lalitpur Wholesale',1003);

INSERT INTO Orders VALUES
(5001,101,'Shipped'),
(5002,101,'In Process'),
(5003,102,'Shipped'),
(5004,103,'Cancelled'),
(5005,105,'Shipped');

INSERT INTO Products VALUES
('P101','Keyboard'),('P102','Mouse'),
('P103','Monitor'),('P104','Printer');

INSERT INTO OrderDetails VALUES
(5001,'P101',5,25.00),(5001,'P102',10,15.00),
(5002,'P103',2,180.00),(5003,'P104',1,220.00),
(5004,'P102',4,16.00),(5005,'P101',3,24.00),
(5005,'P103',1,175.00);

SELECT C.customerNumber,C.customerName,
       O.orderNumber,O.status
FROM Customers C
LEFT JOIN Orders O
ON C.customerNumber=O.customerNumber;

SELECT OD.orderNumber,P.productCode,P.productName
FROM OrderDetails OD
JOIN Products P ON OD.productCode=P.productCode
ORDER BY OD.orderNumber,P.productCode;

SELECT O.customerNumber,O.orderNumber,O.status,
       C.customerName
FROM Orders O
JOIN Customers C
ON O.customerNumber=C.customerNumber;

SELECT C.customerNumber,C.customerName,
       C.salesRepEmployeeNumber,E.lastName,E.firstName
FROM Customers C
LEFT JOIN Employee E
ON C.salesRepEmployeeNumber=E.employeeNumber;

SELECT C.customerNumber,C.customerName,
       E.employeeNumber,E.lastName,E.firstName
FROM Employee E
LEFT JOIN Customers C
ON E.employeeNumber=C.salesRepEmployeeNumber
ORDER BY E.employeeNumber,C.customerNumber;

SELECT C.customerNumber,C.customerName,
       E.employeeNumber,E.firstName,E.lastName
FROM Customers C
LEFT JOIN Employee E
ON C.salesRepEmployeeNumber=E.employeeNumber
UNION
SELECT C.customerNumber,C.customerName,
       E.employeeNumber,E.firstName,E.lastName
FROM Customers C
RIGHT JOIN Employee E
ON C.salesRepEmployeeNumber=E.employeeNumber;

SELECT O.customerNumber,O.orderNumber,O.status,C.customerName
FROM Orders O
JOIN Customers C
ON O.customerNumber=C.customerNumber;

SELECT customerNumber,orderNumber,status,customerName
FROM Orders
NATURAL JOIN Customers;

SELECT O.customerNumber,O.orderNumber,O.status,C.customerName
FROM Orders O
INNER JOIN Customers C
ON O.customerNumber=C.customerNumber;

SELECT O.customerNumber,O.orderNumber,O.status,C.customerName
FROM Orders O
JOIN Customers C
ON O.customerNumber=C.customerNumber;

SELECT C.customerNumber,C.customerName,
       O.orderNumber,OD.productCode,
       OD.quantityOrdered,OD.priceEach
FROM Customers C
JOIN Orders O ON C.customerNumber=O.customerNumber
JOIN OrderDetails OD ON O.orderNumber=OD.orderNumber
ORDER BY C.customerNumber,O.orderNumber,OD.productCode;
