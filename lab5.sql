DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

CREATE TABLE IF NOT EXISTS Departments (
    dept_no INT PRIMARY KEY,
    dept_name VARCHAR(50),
    dept_location VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_salary DECIMAL(10,2)
);
SHOW TABLES;

	CREATE USER IF NOT EXISTS 'Radha'@'localhost'
    
	IDENTIFIED BY 'Radha123';
	GRANT ALL PRIVILEGES
	ON company_db.Employees
	TO 'Radha'@'localhost';
	SHOW GRANTS FOR 'Radha'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON company_db.Departments
TO 'Radha'@'localhost'
WITH GRANT OPTION;
SHOW GRANTS FOR 'Radha'@'localhost';

REVOKE ALL PRIVILEGES
ON company_db.Employees
FROM 'Radha'@'localhost';
SHOW GRANTS FOR 'Radha'@'localhost';

REVOKE SELECT, INSERT, UPDATE
ON company_db.Departments
FROM 'Radha'@'localhost';
SHOW GRANTS FOR 'Radha'@'localhost';

SET autocommit=0;
CREATE TABLE IF NOT EXISTS Class (
    Name VARCHAR(50),
    ID INT PRIMARY KEY
) ENGINE=InnoDB;

INSERT INTO Class VALUES
('Joshan Koirala',1),('Sagar Koirala',2),('Diwash Shrestha',3),
('Pritik Thapa Magar',4);
COMMIT;
SELECT * FROM Class;

INSERT INTO Class VALUES ('Joshan Koirala',9);
SELECT * FROM Class;

UPDATE Class
SET Name='Sagar Koirala'
WHERE ID=9;
SAVEPOINT A;
SELECT * FROM Class;

INSERT INTO Class VALUES ('Diwash Shrestha',11);
SAVEPOINT B;

INSERT INTO Class VALUES ('Pritik Thapa Magar',13);

SELECT * FROM Class;

ROLLBACK TO B;
SELECT * FROM Class;

ROLLBACK TO A;
SELECT * FROM Class;
COMMIT;
