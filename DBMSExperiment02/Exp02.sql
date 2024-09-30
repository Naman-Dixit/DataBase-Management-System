CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    birthdate DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F'))
);
CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100) UNIQUE,
    credits NUMBER CHECK (credits > 0 AND credits <= 5)
);
INSERT INTO students (student_id, first_name, last_name, email, birthdate, gender) VALUES (1, 'John', 'Doe', 'john.doe@example.com', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'M');
INSERT INTO students (student_id, first_name, last_name, email, birthdate, gender) VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', TO_DATE('1999-02-02', 'YYYY-MM-DD'), 'F');

INSERT INTO courses (course_id, course_name, credits) VALUES (1, 'Mathematics', 3);
INSERT INTO courses (course_id, course_name, credits) VALUES (2, 'Science', 4);
INSERT INTO courses (course_id, course_name, credits) VALUES (3, 'History', 2);

-- This will cause a unique constraint violation
INSERT INTO students (student_id, first_name, last_name, email, birthdate, gender) VALUES (4, 'Bob', 'Brown', 'john.doe@example.com', TO_DATE('2002-04-04', 'YYYY-MM-DD'), 'M');

-- This will cause a unique constraint violation
UPDATE students SET email = 'jane.smith@example.com' WHERE student_id = 1;

-- This will cause a check constraint violation
UPDATE courses SET credits = 6 WHERE course_id = 1;

CREATE TABLE enrollments (
    enrollment_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    enrollment_date DATE DEFAULT SYSDATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (enrollment_id, student_id, course_id) VALUES (1, 1, 1);
INSERT INTO enrollments (enrollment_id, student_id, course_id) VALUES (2, 2, 2);

-- This will cause a foreign key constraint violation
DELETE FROM students WHERE student_id = 1;

-- This will cause a foreign key constraint violation if student_id or course_id does not exist
INSERT INTO enrollments (enrollment_id, student_id, course_id) VALUES (3, 999, 999); -- Assuming 999 does not exist in students or courses




CREATE TABLE projects (
    project_id NUMBER PRIMARY KEY,
    project_name VARCHAR2(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget NUMBER NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('assigned', 'not-assigned', 'completed', 'in process'))
);
ALTER TABLE projects
ADD CONSTRAINT check1 CHECK (end_date > start_date);

ALTER TABLE projects
ADD CONSTRAINT check2 CHECK (budget > 1000);

INSERT INTO projects (project_id, project_name, start_date, end_date, budget, status) VALUES (1, 'Project A', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD'), 1500, 'assigned');
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, status) VALUES (2, 'Project B', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-07-01', 'YYYY-MM-DD'), 2000, 'completed');
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, status) VALUES (3, 'Project C', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), 2500, 'in process');

UPDATE projects
SET end_date = TO_DATE('2022-12-31', 'YYYY-MM-DD')
WHERE project_id = 1;

INSERT INTO projects (project_id, project_name, start_date, end_date, budget, status) VALUES (4, 'Project D', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 1200, 'invalid-status');

ALTER TABLE projects
DROP CONSTRAINT check1;

ALTER TABLE projects
ADD CONSTRAINT check1 CHECK (end_date >= start_date);

UPDATE projects
SET end_date = start_date
WHERE project_id = 1;

