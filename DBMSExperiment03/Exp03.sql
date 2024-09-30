-- Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(255),
    DateOfBirth DATE
);

-- Create Professor Table
CREATE TABLE Professor (
    ProfessorID INT PRIMARY KEY,
    Name VARCHAR(255),
    Department VARCHAR(255)
);

-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(255),
    Credits INT,
    ProfessorID INT,
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);

-- Create Enrollment Table
CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

#QUESTION2
-- Insert values into Student Table
INSERT INTO Student (StudentID, Name, DateOfBirth) VALUES
(1, 'John Smith', '1998-05-15'),
(2, 'Alice Johnson', NULL),
(3, 'Bob Williams', '2000-10-20'),
(4, 'Emma Brown', '1999-07-08');

-- Insert values into Professor Table
INSERT INTO Professor (ProfessorID, Name, Department) VALUES
(101, 'Professor Adams', 'Computer Science'),
(102, 'Professor Baker', 'Mathematics'),
(103, 'Professor Clark', 'Physics'),
(104, 'Professor Dennis', 'Computer Science

--QUESTION3
SELECT 
    p.Name AS ProfessorName,
    AVG(c.Credits) AS AverageCredits
FROM 
    Professor p
JOIN 
    Course c ON p.ProfessorID = c.ProfessorID
GROUP BY 
    p.Name;


--QUESTION4
SELECT 
    s.Name AS StudentName,
    COUNT(e.CourseID) AS TotalCourses
FROM 
    Student s
JOIN 
    Enrollment e ON s.StudentID = e.StudentID
GROUP BY 
    s.Name;

--OUESTION5
  
SELECT DISTINCT 
    p.Name AS ProfessorName
FROM 
    Professor p
JOIN 
    Course c ON p.ProfessorID = c.ProfessorID
WHERE 
    c.Credits > 3;

#QUESTION6
SELECT 
    s.Name AS StudentName
FROM 
    Student s
JOIN 
    Enrollment e ON s.StudentID = e.StudentID
GROUP BY 
    s.Name
HAVING 
    COUNT(e.CourseID) >= 2;

#QUESTION7
SELECT 
    c.Title AS CourseTitle,
    COUNT(e.StudentID) AS NumberOfStudents
FROM 
    Course c
JOIN 
    Enrollment e ON c.CourseID = e.CourseID
GROUP BY 
    c.Title
ORDER BY 
    NumberOfStudents DESC
LIMIT 1;

#QUESTION8
SELECT 
    p.Name AS ProfessorName
FROM 
    Professor p
LEFT JOIN 
    Course c ON p.ProfessorID = c.ProfessorID
WHERE 
    c.CourseID IS NULL;

#QUESTION9
SELECT 
    s.Name AS StudentName
FROM 
    Student s
JOIN 
    Enrollment e ON s.StudentID = e.StudentID
WHERE 
    e.CourseID = :CourseID;

#QUESTION10
SELECT 
    Title AS CourseTitle
FROM 
    Course
ORDER BY 
    Credits DESC
LIMIT 1;

#QUESTION11
SELECT 
    s.Name AS StudentName,
    c.Title AS CourseTitle
FROM 
    Student s
JOIN 
    Enrollment e ON s.StudentID = e.StudentID
JOIN 
    Course c ON e.CourseID = c.CourseID;

#QUESTION12
SELECT 
    p.Name AS ProfessorName,
    c.Title AS CourseTitle
FROM 
    Professor p
JOIN 
    Course c ON p.ProfessorID = c.ProfessorID;

#QUESTION13
SELECT 
    AVG(Credits) AS AverageCredits
FROM 
    Course;

#QUESTION14
SELECT 
    c.Title AS CourseTitle,
    COUNT(e.StudentID) AS TotalStudents
FROM 
    Course c
LEFT JOIN 
    Enrollment e ON c.CourseID = e.CourseID
GROUP BY 
    c.Title;

#QUESTION15
SELECT 
    Name AS StudentName
FROM 
    Student
WHERE 
    DateOfBirth > :24:05:2005;

#QUESTION16
SELECT Course.Title
FROM Course
JOIN Professor ON Course.ProfessorID = Professor.ProfessorID
WHERE Professor.Department = 'Computer Science'
ORDER BY Course.Title ASC;


#QUESTION17
UPDATE Course
SET Credits = 5
WHERE CourseID = 1001;

#QUESTION18

-- First, delete the courses taught by the professor
DELETE FROM Course
WHERE ProfessorID = 103;

-- Then, delete the professor
DELETE FROM Professor
WHERE ProfessorID = 103;

#QUESTION19
INSERT INTO Enrollment (StudentID, CourseID) VALUES (999, 1001);

#QUESTION20
UPDATE Student SET StudentID = 100 WHERE StudentID = 1;
