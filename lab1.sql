DROP DATABASE IF EXISTS joshan_lab1_db;
CREATE DATABASE joshan_lab1_db;
USE joshan_lab1_db;

CREATE TABLE IF NOT EXISTS BOOK (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    Price DECIMAL(8,2)
);

CREATE TABLE IF NOT EXISTS MEMBER (
    Member_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    Phone_Number VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS BORROWS (
    Member_ID INT,
    Book_ID INT,
    Borrow_Date DATE,
    Return_Date DATE,
    PRIMARY KEY (Member_ID, Book_ID, Borrow_Date),
    FOREIGN KEY (Member_ID) REFERENCES MEMBER(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES BOOK(Book_ID)
);
INSERT INTO BOOK VALUES
(101,'Database Systems','XYZ',850.00),
(102,'Operating System','Silberschatz',950.00),
(103,'Computer Networks','XYZ',700.00),
(104,'Java Programming','Herbert Schildt',1000.00);

INSERT INTO MEMBER VALUES
(1,'Joshan Koirala','Kathmandu','9841000001'),
(2,'Sita Karki','Pokhara','9841000002'),
(3,'Hari Thapa','Kathmandu','9841000003');

INSERT INTO BORROWS VALUES
(1,101,'2083-03-29',NULL),
(2,102,'2083-03-30','2083-04-10'),
(3,103,'2083-03-31',NULL);

-- 1
SELECT Name, Phone_Number
FROM MEMBER
WHERE Address = 'Kathmandu';
-- 2
SELECT
    M.Name AS Member_Name,
    B.Title AS Book_Title,
    BR.Borrow_Date
FROM BORROWS BR
JOIN MEMBER M ON BR.Member_ID = M.Member_ID
JOIN BOOK B ON BR.Book_ID = B.Book_ID
WHERE BR.Return_Date IS NULL;
SELECT *
FROM BOOK
WHERE Author = 'XYZ';

