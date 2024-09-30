#question1
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    major VARCHAR(50)
)

-- Create the Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0)
)
drop table Courses cascade constraints
-- Create the Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
)
drop table Enrollments cascade constraints


#question2

--Inserting data into tables
-- Insert sample data into Students, Courses, and Enrollments tables using INSERT ALL

INSERT ALL
    INTO Students  VALUES (01,'Naman', 'Singh', 'Namanp1dixit@gmail', 'Computer Science')
    INTO Students  VALUES (02,'Abhishek', 'Kumar', 'gamer@gmail.com', 'Mechanical Engineering')
    INTO Students  VALUES (03, 'Vansh', 'Sharma', 'vansh@example.com', 'Electrical Engineering')
    INTO Students  VALUES (04,'Deepak', 'Gupta', 'deeepak@gmail.com', 'Information Technology')
    SELECT * FROM DUAL

INSERT ALL
    INTO Courses VALUES (01, 'Data', 'Structures',4)
    INTO Courses VALUES (02, 'Thermodynamics', 'Dr.Patel', 3)
    INTO Courses VALUES (03, 'Circuit Theory', 'Dr. Reddy', 3)
    INTO Courses VALUES (04, 'Database Systems', 'Dr. Sharma', 4)
    SELECT * FROM DUAL

-- Insert data into Enrollments table
INSERT ALL
    INTO Enrollments VALUES (1, 1, 1, 'A')
    INTO Enrollments VALUES (2, 2, 2, 'B')
    INTO Enrollments VALUES (3, 3, 3, 'A') 
    INTO Enrollments VALUES (4, 4, 4, 'B')
    SELECT * FROM DUAL

#question3

CREATE VIEW Student_Info AS
SELECT student_id, first_name, last_name, email
FROM Students;

SELECT * FROM Student_Info;


CREATE VIEW Course_Info AS
SELECT course_id, course_name, instructor
FROM Courses;
SELECT * FROM Course_Info;-



CREATE VIEW Enrollment_Details AS
SELECT student_id, course_id, grade
FROM Enrollments;

SELECT * FROM Enrollment_Details;


CREATE VIEW Student_GPA AS
SELECT S.first_name, S.last_name, S.email,
       AVG(CASE E.grade
           WHEN 'A' THEN 4.0
           WHEN 'B' THEN 3.0
           WHEN 'C' THEN 2.0
           WHEN 'D' THEN 1.0
           WHEN 'F' THEN 0.0
           END) AS GPA
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.first_name, S.last_name, S.email;
SELECT * FROM Student_GPA;


CREATE VIEW Course_Enrollment_Count AS
SELECT C.course_name, COUNT(E.student_id) AS total_enrollments
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;
SELECT * FROM Course_Enrollment_Count;



CREATE VIEW Top_Performers AS
SELECT C.course_name, S.first_name, S.last_name, 
       MAX(CASE E.grade
           WHEN 'A' THEN 4.0
           WHEN 'B' THEN 3.0
           WHEN 'C' THEN 2.0
           WHEN 'D' THEN 1.0
           WHEN 'F' THEN 0.0
           END) AS GPA
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
GROUP BY C.course_name, S.first_name, S.last_name;
SELECT * FROM Top_Performers;



CREATE VIEW Top_Enrolled_Courses AS
SELECT C.course_name, COUNT(E.student_id) AS total_enrollments
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name
ORDER BY total_enrollments DESC
FETCH FIRST 5 ROWS ONLY;
SELECT * FROM Top_Enrolled_Courses;




CREATE VIEW Students_In_Multiple_Courses AS
SELECT S.student_id, S.first_name, S.last_name, S.email
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.student_id, S.first_name, S.last_name, S.email
HAVING COUNT(E.course_id) > 1;
SELECT * FROM Students_In_Multiple_Courses;   -- NO DATA FOUND BEACUSE NOT INSERT LIKE THIS


CREATE VIEW Courses_Taught_By_Same_Instructor AS
SELECT instructor, GROUP_CONCAT(course_name SEPARATOR ', ') AS courses
FROM Courses
GROUP BY instructor
HAVING COUNT(course_id) > 1;
SELECT * FROM Courses_Taught_By_Same_Instructor; -- NO DATA FOUND BEACUS NOT INSERT LIKE THIS 




CREATE VIEW Student_Course_Grade_Details AS
SELECT S.first_name, S.last_name, S.email, C.course_name, E.grade
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id;
SELECT * FROM Student_Course_Grade_Details;
