SHOW DATABASES;
USE techinfo;

-- create second table courses
CREATE TABLE courses (
	courseId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    courseName VARCHAR(50) NOT NULL,
    courseDuration INT NOT NULL,
    courseFees INT NOT NULL
);

SHOW TABLES;
DESC courses;

-- Insert Data into courses table
INSERT INTO courses (courseName,courseDuration,courseFees) VALUES ("JS Mastery",1,1000),
																  ("DSA",3,2000),
                                                                  ("Python Mastery",1,1000),
                                                                  ("SQL Master",1,2000);
 
-- Fetch all Data from courses table. 
SELECT * FROM Courses;

-- Create Table students
CREATE TABLE STUDENTS (
SID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
S_firstName VARCHAR(50) NOT NULL,
S_lastName VARCHAR(50),
S_email VARCHAR(50) UNIQUE KEY,
S_phoneNumber VARCHAR(20),
S_enrollDate TIMESTAMP NOT NULL,
S_selectedCourse INT NOT NULL,
S_yearsOfExp INT NOT NULL,
S_company VARCHAR(50),
S_sourceOfJoining VARCHAR(50) NOT NULL,
S_batchStartDate TIMESTAMP NOT NULL,
S_location VARCHAR(50) NOT NULL,
FOREIGN KEY(S_selectedCourse) REFERENCES Courses(courseId) 
);

DESC students;

DROP TABLE students;

INSERT INTO students (S_firstName,S_lastName,S_email,S_phoneNumber,S_enrollDate,S_selectedCourse,S_yearsOfExp,S_company,S_sourceOfJoining,S_batchStartDate,S_location)
            VALUES ("Akash", "Mishra", "akash@gmail.com",'9998887776', '2024-01-21', 1, 4, "Amazon", "LinkedIn", '2024-02-29', "Bengaluru");

INSERT INTO students (S_firstName,S_lastName,S_email,S_phoneNumber,S_enrollDate,S_selectedCourse,S_yearsOfExp,S_company,S_sourceOfJoining,S_batchStartDate,S_location)
            VALUES ("Jeevan","Hegde", "jeevanhegdek@yahoo.co.in","9657856732", '2024-01-15', 2, 0, "", "Linkedin", '2024-01-16', "Noida"),
                   ("Akhil","George", "akhil.george.8743@gmail.com","7689558930",  '2024-03-13', 3, 4, "Accenture", "Community", '2024-03-25', "Bengaluru"),
                   ("Sidhish","Kumar", "sidhishkumar@gmail.com","6475765443", '2024-01-10', 1, 4, "Meta", "Youtube", '2024-03-29', "Bengaluru"),
                   ("NagaSai","Sreedhar", "saisreedhar2001@gmail.com", "9182937061",  '2024-03-17', 3, 4, "TCS", "Community", '2024-03-25', "Mumbai");
            
SELECT * FROM students;

INSERT INTO students (S_firstName,S_lastName,S_email,S_phoneNumber,S_enrollDate,S_selectedCourse,S_yearsOfExp,S_company,S_sourceOfJoining,S_batchStartDate,S_location)
            VALUES ("Krupali","Rao",NULL, "8989898989", '2024-03-19', 3, 2, "HCL", "Youtube", '2024-03-25', "Gujrat");
INSERT INTO students (S_firstName,S_lastName,S_email,S_phoneNumber,S_enrollDate,S_selectedCourse,S_yearsOfExp,S_company,S_sourceOfJoining,S_batchStartDate,S_location)
            VALUES ("Rishikesh","Joshi",NULL, "9950192388", '2024-03-19', 3, 2, "HCL", "Youtube", '2024-03-25', "Chennai");
DELETE FROM students WHERE SID = 7;
-- Data Analysis with Tables(courses,employees,students) 
-- 1) Give me the record of the employee getting highest salary
SELECT * FROM employees 
        ORDER BY salary DESC 
         LIMIT 2;
        
        
UPDATE employees SET salary = 7000 WHERE EID = 5;
        
-- 2) Give me the record of employee getting highest salary and age is bigger than 25
SELECT * FROM employees
		WHERE age > 25
        ORDER by salary DESC
        LIMIT 1;
        
-- 3) Display the number of enrollments with this tech platform?
SELECT COUNT(*) AS Number_of_students_on_platform FROM students;

-- 4) How many students have enroll for course 3?
SELECT * FROM students WHERE S_selectedCourse = 3;

-- 5) Count the number of students enrolled in the month of january?
SELECT * FROM students WHERE S_enrollDate LIKE '%-01-%';

-- 6) UPDATE the years of expereince of Jeevan 2 and company as Amazon.
UPDATE students SET S_yearsOfExp = 2,S_company = 'Amazon' WHERE SID = 3;

SELECT * FROM students WHERE SID = 3;

-- 7) Count the number of companies learners belongs to.
SELECT COUNT(DISTINCT(S_company)) AS company_learners_doing_job from students;

-- 8) Count the number of students come from different sources
SELECT S_sourceOfJoining,S_location, count(*) AS no_of_people FROM students GROUP BY S_sourceOfJoining,S_location ORDER BY no_of_people;
UPDATE students SET S_sourceOfJoining = "Linkedin" WHERE SID = 5;

-- 9) Corresponding to each course how many students have enrolled?
SELECT S_selectedCourse,Count(*) AS Number_of_students FROM students GROUP BY S_selectedCourse;

-- 10) MAX,MIN,AVG
-- (i) Correspond to individual source of joining what is the maximum years of expereince students have
SELECT S_sourceOfJoining,MAX(S_yearsOfExp) AS highest_years_of_Exp FROM students GROUP BY S_sourceOfJoining;

-- (ii) Correspond to individual source of joining what is the minimum years of expereince students have
SELECT S_sourceOfJoining, MIN(S_yearsOfExp) AS Minimun_Years_Of_Exp FROM students GROUP BY S_sourceOfJoining;

-- (iii) Correspond to individual source of joining what is the average years of expereince students have
SELECT S_sourceOfJoining, AVG(S_yearsOfExp) AS Avergae_Years_Of_Exp FROM students GROUP BY S_sourceOfJoining;

-- 11) HAVING Clause
-- (i) Display the source_of_joining which have students more than 2
SELECT S_sourceOfJoining, COUNT(*) AS Number_of_students FROM students GROUP BY S_sourceOfJoining HAVING Number_of_students >= 2; 

-- (ii) Display the count of students come via Linkedin.
SELECT S_sourceOfJoining, COUNT(*) FROM students GROUP BY S_sourceOfJoining HAVING S_sourceOfJoining = 'Linkedin';

-- Logical operators (AND,OR,NOT,BETWEEN)
-- (i) Display the courses except 
SELECT * FROM courses WHERE courseName != "SQL Master";

-- Mutiple constraints and all of them should be satisfied, then go for AND Operator in SQL
-- (ii) Display the records of those students who have less than 4 years of experience and source of joining is youtube and location is Chennai
SELECT * FROM students WHERE S_yearsOfExp < 4 AND S_sourceOfJoining = 'Youtube' AND S_location = 'Chennai';

-- Mutiple constraints and any one of them should be satisfied, then go for OR Operator in SQL
-- (iii) Display the records of those students who have less than 4 years of experience or source of joining is youtube or location is Chennai
SELECT * FROM students WHERE S_yearsOfExp < 4 OR S_sourceOfJoining = 'Youtube' OR S_location = 'Chennai';

-- (iv) Display the records of those students who have years of experience between 1 to 2 years
SELECT * FROM students WHERE S_yearsOfExp BETWEEN 1 AND 2;

-- ALTER COMMANDS(ADD,MODIFY,DROP)
DESC students;
ALTER TABLE students ADD COLUMN S_jobPosition VARCHAR(30);
ALTER TABLE students MODIFY COLUMN S_LastName VARCHAR(30);
ALTER TABLE students DROP COLUMN SID;

-- TRUNCATE COMMAND
-- Difference between DELETE v/s TRUNCATE


-- DECIMAL(precision,scale)
-- preccison meand total number of digit allowed before and after decimal in total
-- scale means total number of digit allowed after point
DESC courses;
SELECT * FROM courses;
INSERT INTO courses (courseName,courseDuration,courseFees) VALUES("Advance Frontend", 2.5,3000);
ALTER TABLE courses MODIFY COLUMN courseDuration DECIMAL(3,1);

-- Update the course fee of SQL Master to 3999
UPDATE courses SET courseFees = 3999 WHERE courseId = 4;

