DROP DATABASE IF EXISTS joshan_lab2_db;
CREATE DATABASE joshan_lab2_db;
USE joshan_lab2_db;

CREATE TABLE IF NOT EXISTS DEPARTMENT (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS STUD_MEMBER (
    Roll_No INT PRIMARY KEY,
    FName VARCHAR(30) NOT NULL,
    MName VARCHAR(30),
    SName VARCHAR(30) NOT NULL,
    Dept_ID INT,
    Semester INT,
    Contact_No VARCHAR(15),
    Gender CHAR(1),
    FOREIGN KEY (Dept_ID) REFERENCES DEPARTMENT(Dept_ID)
);

INSERT INTO DEPARTMENT VALUES
(1,'Information Technology'),
(2,'Electrical'),
(3,'Civil'),
(4,'Mechanical'),
(5,'Chemical');

INSERT INTO STUD_MEMBER VALUES
(1,'Ankur','Samir','Kahar',1,1,'272121','M'),
(2,'Dhaval','Dhiren','Joshi',1,1,'232122','M'),
(3,'Ankita','Biren','Shah',1,1,'112121','F'),
(10,'Komal','Maheshkumar','Pandya',2,3,'123123','F'),
(13,'Amit','Jitenkumar','Mehta',3,3,'453667','M'),
(23,'Jinal','Ashish','Gandhi',2,1,'323232','M'),
(22,'Ganesh','Asha','Patel',2,3,'124244','M'),
(4,'Shweta','Mihir','Patel',3,1,'646342','F'),
(7,'Pooja','Mayank','Desai',3,3,'328656','F'),
(8,'Komal','Krishnaraj','Bhatia',2,3,'257422','F'),
(43,'Kiran','Viraj','Shah',1,1,'754124','F');

SELECT FName, MName, SName, Contact_No
FROM STUD_MEMBER;

SELECT S.Roll_No, S.FName, S.MName, S.SName
FROM STUD_MEMBER S
JOIN DEPARTMENT D ON S.Dept_ID = D.Dept_ID
WHERE D.Dept_Name = 'Information Technology';

SELECT DISTINCT D.Dept_Name
FROM DEPARTMENT D
JOIN STUD_MEMBER S ON D.Dept_ID = S.Dept_ID;


SELECT D.Dept_Name
FROM DEPARTMENT D
LEFT JOIN STUD_MEMBER S ON D.Dept_ID = S.Dept_ID
WHERE S.Roll_No IS NULL;

SELECT Dept_Name
FROM DEPARTMENT;

SELECT COUNT(*) AS Total_Students
FROM STUD_MEMBER S
JOIN DEPARTMENT D ON S.Dept_ID = D.Dept_ID
WHERE D.Dept_Name = 'Electrical';

SELECT *
FROM STUD_MEMBER
WHERE FName LIKE 'A%';

SELECT *
FROM STUD_MEMBER
WHERE Gender = 'M';

SELECT *
FROM STUD_MEMBER
WHERE Semester = 3;

SELECT *
FROM STUD_MEMBER
WHERE Gender = 'F'
ORDER BY FName ASC, SName ASC;
