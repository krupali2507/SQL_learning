CREATE TABLE EMPLOYEES (
                          EMP_ID CHAR(9) NOT NULL,
                          F_NAME VARCHAR(15) NOT NULL,
                          L_NAME VARCHAR(15) NOT NULL,
                          SSN CHAR(9),
                          B_DATE DATE,
                          SEX CHAR,
                          ADDRESS VARCHAR(30),
                          JOB_ID CHAR(9),
                          SALARY DECIMAL(10,2),
                          MANAGER_ID CHAR(9),
                          DEP_ID CHAR(9) NOT NULL,
                          PRIMARY KEY (EMP_ID)
                        );

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL,
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP)
                          );

INSERT INTO DEPARTMENTS VALUES
	(2,'Architect Group',30001,'L0001'),
	(5,'Software Group',30002,'L0002'),
	(7,'Design Team',30003,'L0003');


CREATE TABLE JOBS (
                    JOB_IDENT CHAR(9) NOT NULL,
                    JOB_TITLE VARCHAR(30) ,
                    MIN_SALARY DECIMAL(10,2),
                    MAX_SALARY DECIMAL(10,2),
                    PRIMARY KEY (JOB_IDENT)
                  );


INSERT INTO JOBS VALUES
	(100,'Sr. Architect',60000,100000),
	(200,'Sr. Software Developer',60000,80000),
	(300,'Jr. Software Developer',40000,60000),
	(400,'Jr. Software Developer',40000,60000),
	(500,'Jr. Architect',50000,70000),
	(600,'Lead Architect',70000,100000),
	(650,'Jr. Designer',60000,70000),
	(660,'Jr. Designer',60000,70000),
	(234,'Sr. Designer',70000,90000),
	(220,'Sr. Designer',70000,90000);

CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL,
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID)
                          );
INSERT INTO JOB_HISTORY VALUES
	('E1001','08/01/2000',100,2);
INSERT INTO JOB_HISTORY VALUES
	('E1002','08/01/2001',200,5),
	('E1003','08/16/2001',300,5),
	('E1004','08/16/2000',400,5),
	('E1005','05/30/2000',500,2),
	('E1006','08/16/2001',600,2),
	('E1007','05/30/2002',650,7),
	('E1008','05/06/2010',660,7),
	('E1009','08/16/2016',234,7),
	('E1010','08/16/2016',220,5);

CREATE TABLE LOCATIONS (
                          LOCT_ID CHAR(9) NOT NULL,
                          DEP_ID_LOC CHAR(9) NOT NULL,
                          PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
                        );


INSERT INTO LOCATIONS VALUES
	('L0001',2),
	('L0002',5),
	('L0003',7);

SELECT * FROM LOCATIONS;

-- Execute a failing query (i.e. one which gives an error) to retrieve all employees 
-- records whose salary is lower than the average salary.

SELECT * FROM EMPLOYEES WHERE SALARY < AVG(SALARY);

-- Execute a working query using a sub-select to retrieve all employees 
-- records whose salary is lower than the average salary.

SELECT * FROM Employees WHERE SALARY < (SELECT AVG(SaLARY) FROM EMPLOYEES);

-- Execute a failing query (i.e. one which gives an error) to retrieve all employees
-- records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.

SELECT EMP_ID,SALARY, MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES;

-- Execute a Column Expression that retrieves all employees 
-- with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.

SELECT EMP_ID,SALARY,(SELECT MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES) FROM Employees;

-- Execute a Table Expression for the EMPLOYEES table that excludes columns 
-- with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).

SELECT * FROM (SELECT EMP_ID,F_NAME,L_NAME,DEP_ID FROM EMPLOYEES) AS EMP4ALL;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

SELECT * FROM EMPLOYEES
WHERE JOB_ID IN(SELECT JOB_IDENT FROM JOBS);

SELECT * 
FROM EMPLOYEES,JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

-- Redo the previous query, using shorter aliases for table names.
SELECT * FROM EMPLOYEES AS E,JOBS AS J
WHERE E.JOB_ID = J.JOB_IDENT;


-- Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
SELECT EMP_ID,F_NAME,L_NAME,JOB_TITLE
FROM EMPLOYEES AS E,JOBS AS J
WHERE E.JOB_ID = J.JOB_IDENT;


-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
SELECT * FROM EMPLOYEES WHERE JOB_ID IN
	(SELECT JOB_IDENT FROM JOBS WHERE JOB_TITLE = 'Jr. Designer')


-- Retrieve JOB information and list of employees who earn more than $70,000.
SELECT E.* , JOB_Title FROM EMPLOYEES AS E
LEFT JOIN JOBS AS J
ON E.JOB_ID = J.JOB_IDENT
WHERE SALARY > 70000;

-- Retrieve JOB information and list of employees whose birth year is after 1976.
SELECT * FROM JOBS WHERE JOB_IDENT IN 
	(SELECT JOB_ID FROM EMPLOYEES WHERE YEAR(B_DATE) > 1976 AND SEX = 'F') 

SELECT * FROM EMPLOYEES
LEFT JOIN  JOBS 
ON JOB_ID = JOB_IDENT
WHERE YEAR(B_DATE) > 1976 AND SEX = 'F'
ORDER BY JOB_ID;


-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
SELECT * FROM EMPLOYEES,JOBS;