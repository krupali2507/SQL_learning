-- To check available Databases 
SHOW DATABASES;

-- To create Database command. If Databse with given name already exists result in error.
CREATE DATABASE techinfo;

-- To avoid name conflict we can use create command with this syntax. It will only give warning.
CREATE DATABASE IF NOT EXISTS techinfo;

-- To use particulat Database among number of Databases.
USE techinfo;

-- To check which Database we are currently on.
SELECT DATABASE();

-- To create Table
CREATE TABLE employees(
	EID INT PRIMARY KEY AUTO_INCREMENT,
    Firstname VARCHAR(50) NOT NULL,
    Lastname VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    salary INT NOT NULL,
    Location VARCHAR(50) NOT NULL
);

-- To List available Tables in current Database we are.
SHOW TABLES;

-- To Check the structure of particulat Table.
DESC employees;
DESCRIBE employees;

-- Type of comments we can write.
-- this is single line comment
/* Multiline cooment line1
line2
line3 */  

-- To Insert Data into Table. 
INSERT INTO employees (Firstname,Lastname,age,salary,Location) VALUES("Krupali","Rao",29,4000,"Cork");
INSERT INTO employees (Firstname,Lastname,age,salary,Location) VALUES("Pratipal","Rajpurohit",29,5000,"Cork"),("Bhoomi","Rao",31,5000,"Cork"),("Yashraj","Rao",25,7000,"Ahmedabad");
INSERT INTO employees (Firstname,Lastname,age,salary,Location) VALUES("Neel","Amstrong",28,3500,"Germany"),("Bibin","Antony",32,3000,"Dublin");

-- Select all Data from Table.
SELECT * FROM employees; 

-- Select selected columns from Table.
SELECT Firstname,LastName from employees;

-- To Delete the entire Table
DROP TABLE employees;

-- Basic operations
-- Filteration of Data using WHERE
-- 1) Give all the employees details whose salary is bigger than 3500
SELECT * FROM employees WHERE salary >= 3500;

-- 2) Give all the employees details whose age is more than 29
SELECT * FROM employees WHERE age > 29; 


/* Difference between UPDATE and ALTER command you should know.
UPDATE command is DML command and ALTER is DDL command.
Difference between DML and DDL 
1) DML command used to manage and manipulate the data withing the table like SELECT,INSERT,UPDATE and DELETE. This commands can be used with inside values of tables.
2) DDL command generally used to manage the structure and schema of table like CREATE,ALTER,DROP,TRUNCATE. This can create,modify and delete the whole schema(design) of table.
*/

-- UPDATE command
-- 1) Update the last name of "Krupali"
UPDATE employees SET Lastname = "Rajpurohit" WHERE EID = 1;

-- DELETE command
-- 1) Delete employees with EID = 1
DELETE FROM employees where EID = 1;
