SELECT * FROM Employees;
SELECT * FROM Jobs;
SELECT * FROM Jobs_History;
SELECT * FROM Departments;
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
