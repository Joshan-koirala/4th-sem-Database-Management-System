

DROP DATABASE IF EXISTS joshan_lab8;
CREATE DATABASE joshan_lab8;
USE joshan_lab8;

CREATE TABLE employees (
    employeeNumber INT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(100) NOT NULL,
    salesRepEmployeeNumber INT,
    FOREIGN KEY (salesRepEmployeeNumber)
        REFERENCES employees(employeeNumber)
);

CREATE TABLE products (
    productCode VARCHAR(10) PRIMARY KEY,
    productName VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    orderNumber INT PRIMARY KEY,
    customerNumber INT NOT NULL,
    status VARCHAR(30) NOT NULL,
    FOREIGN KEY (customerNumber)
        REFERENCES customers(customerNumber)
);

CREATE TABLE orderdetails (
    orderNumber INT,
    productCode VARCHAR(10),
    quantityOrdered INT NOT NULL,
    PRIMARY KEY (orderNumber, productCode),
    FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber),
    FOREIGN KEY (productCode) REFERENCES products(productCode)
);

INSERT INTO employees VALUES
(101, 'Joshan', 'Koirala'),
(102, 'Sagar', 'Koirala'),
(103, 'Diwash', 'Shrestha'),
(104, 'Pritik', 'Thapa Magar');

INSERT INTO customers VALUES
(1, 'ABC Traders', 101),
(2, 'Everest Suppliers', 102),
(3, 'Himalayan Mart', 101),
(4, 'Valley Stores', 103),
(5, 'No Order Customer', 104);

INSERT INTO products VALUES
('P001', 'Laptop'),
('P002', 'Keyboard'),
('P003', 'Mouse'),
('P004', 'Printer');

INSERT INTO orders VALUES
(1001, 1, 'Shipped'),
(1002, 2, 'Pending'),
(1003, 3, 'Shipped'),
(1004, 4, 'Pending');

INSERT INTO orderdetails VALUES
(1001, 'P001', 2),
(1001, 'P002', 5),
(1002, 'P003', 4),
(1003, 'P001', 1);


SELECT productCode, productName
FROM products
WHERE productCode IN (
    SELECT productCode
    FROM orderdetails
    WHERE orderNumber IN (
        SELECT orderNumber
        FROM orders
        WHERE customerNumber = 1
    )
);

SELECT customerName
FROM customers
WHERE customerNumber IN (
    SELECT customerNumber
    FROM orders
    WHERE status = 'Shipped'
);

SELECT customerName, salesRepEmployeeNumber
FROM customers
WHERE customerNumber IN (
    SELECT customerNumber
    FROM orders
    WHERE orderNumber IN (1001, 1003)
);


SELECT firstName, lastName
FROM employees
WHERE employeeNumber IN (
    SELECT salesRepEmployeeNumber
    FROM customers
    WHERE customerName = 'ABC Traders'
);

SELECT firstName, lastName
FROM employees
WHERE employeeNumber IN (
    SELECT salesRepEmployeeNumber
    FROM customers
    WHERE customerNumber IN (
        SELECT customerNumber
        FROM orders
        WHERE status = 'Pending'
    )
);

SELECT customerName
FROM customers
WHERE customerNumber IN (
    SELECT customerNumber
    FROM orders
    WHERE orderNumber IN (
        SELECT orderNumber
        FROM orderdetails
        WHERE productCode IN (
            SELECT productCode
            FROM products
            WHERE productName = 'Laptop'
        )
    )
);

SELECT customerName
FROM customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE o.customerNumber = c.customerNumber
);

SELECT productName
FROM products AS p
WHERE NOT EXISTS (
    SELECT 1
    FROM orderdetails AS od
    WHERE od.productCode = p.productCode
);
