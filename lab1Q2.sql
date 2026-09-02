DROP DATABASE IF EXISTS joshan_school_db;
CREATE DATABASE joshan_school_db;
USE joshan_school_db;

CREATE TABLE IF NOT EXISTS Teacher (
    Teacher_ID INT PRIMARY KEY,
    Teacher_Name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100),
    Class VARCHAR(50),
    Teacher_ID INT,
    FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID)
);

INSERT INTO Teacher VALUES
(1,'Mr. Karki'),
(2,'Mrs. Neupane'),
(3,'Mr. Kafle');

INSERT INTO Student VALUES
(101,'Joshan','BSc CSIT',1),
(102,'Sagar','BSc CSIT',1),
(103,'Sandesh','BCA',2),
(104,'Manish','BSc CSIT',1),
(105,'pragya','BCA',2),
(106,'Soni','BBS',3);

SELECT S.Student_Name, S.Class
FROM Student S
JOIN Teacher T ON S.Teacher_ID = T.Teacher_ID
WHERE T.Teacher_Name = 'Mr. Karki';

SELECT T.Teacher_Name,
       COUNT(S.Student_ID) AS Total_Students
FROM Teacher T
LEFT JOIN Student S ON T.Teacher_ID = S.Teacher_ID
GROUP BY T.Teacher_ID, T.Teacher_Name;
