
#question1

CREATE TABLE STUDENTS (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50) NOT NULL,
    sem NUMBER,
    dept VARCHAR2(50),
    enrollment_date DATE,
    score NUMBER
);


CREATE TABLE STUDENT_LOG (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id NUMBER REFERENCES STUDENTS(student_id),
    old_name VARCHAR2(50),
    new_name VARCHAR2(50),
    old_score NUMBER,
    new_score NUMBER,
    update_date DATE
);


declare
    exam_score number := 85; -- example input
    grade char(1);
begin
    -- using if statement
    if exam_score between 90 and 100 then
        grade := 'a';
    elsif exam_score between 80 and 89 then
        grade := 'b';
    elsif exam_score between 70 and 79 then
        grade := 'c';
    else
        grade := 'f';
    end if;
    dbms_output.put_line('grade using if statement: ' || grade);

    -- using case statement
    case
        when exam_score between 90 and 100 then grade := 'a';
        when exam_score between 80 and 89 then grade := 'b';
        when exam_score between 70 and 79 then grade := 'c';
        else grade := 'f';
    end case;
    dbms_output.put_line('grade using case statement: ' || grade);
end;





#QUESTION2

DECLARE
    a NUMBER := 0;
    b NUMBER := 1;
    temp NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE(a);
    DBMS_OUTPUT.PUT_LINE(b);
    FOR i IN 1..8 LOOP
        temp := a + b;
        a := b;
        b := temp;
        DBMS_OUTPUT.PUT_LINE(temp);
    END LOOP;
END;
/



#QUESTION3

CREATE OR REPLACE PROCEDURE insert_student(
    p_student_id NUMBER,
    p_student_name VARCHAR2,
    p_score NUMBER
) IS
BEGIN
    INSERT INTO STUDENTS (student_id, student_name, score)
    VALUES (p_student_id, p_student_name, p_score);
    COMMIT;
END;
/




CREATE OR REPLACE FUNCTION get_student_count RETURN NUMBER IS
    total_students NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_students FROM STUDENTS;
    RETURN total_students;
END;
/

BEGIN
    insert_student(1, 'John Doe', 85);
    insert_student(2, 'Jane Smith', 92);
    DBMS_OUTPUT.PUT_LINE('Total Students: ' || get_student_count);
END;
/







#Question4 


CREATE OR REPLACE PACKAGE student_pkg IS
    PROCEDURE display_student_details(p_student_id NUMBER);
    FUNCTION total_students RETURN NUMBER;
END student_pkg;
/


CREATE OR REPLACE PACKAGE student_pkg IS
    PROCEDURE display_student_details(p_student_id NUMBER);
    FUNCTION total_students RETURN NUMBER;
END student_pkg;
/


CREATE OR REPLACE PACKAGE BODY student_pkg IS

    PROCEDURE display_student_details(p_student_id NUMBER) IS
        v_name VARCHAR2(50);
        v_score NUMBER;
    BEGIN
        SELECT student_name, score INTO v_name, v_score 
        FROM STUDENTS WHERE student_id = p_student_id;
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Score: ' || v_score);
    END display_student_details;

    FUNCTION total_students RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM STUDENTS;
        RETURN v_count;
    END total_students;

END student_pkg;
/



BEGIN
    student_pkg.display_student_details(1);
    DBMS_OUTPUT.PUT_LINE('Total Students: ' || student_pkg.total_students);
END;
/




#Question5

DECLARE
    CURSOR high_scorers IS
        SELECT student_name, score FROM STUDENTS WHERE score > 75;

    CURSOR all_scores IS
        SELECT score FROM STUDENTS;

    v_name VARCHAR2(50);
    v_score NUMBER;
    v_total_score NUMBER := 0;
    v_count NUMBER := 0;
    v_average NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Students scoring above 75:');
    OPEN high_scorers;
    LOOP
        FETCH high_scorers INTO v_name, v_score;
        EXIT WHEN high_scorers%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Score: ' || v_score);
    END LOOP;
    CLOSE high_scorers;

    -- Calculate Average Score
    OPEN all_scores;
    LOOP
        FETCH all_scores INTO v_score;
        EXIT WHEN all_scores%NOTFOUND;
        v_total_score := v_total_score + v_score;
        v_count := v_count + 1;
    END LOOP;
    CLOSE all_scores;

    v_average := v_total_score / v_count;
    DBMS_OUTPUT.PUT_LINE('Average Score: ' || v_average);
END;
/



#Question6

CREATE TABLE STUDENTS (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50),
    sem NUMBER,
    dept VARCHAR2(50),
    enrollment_date DATE
);


CREATE OR REPLACE TRIGGER set_enrollment_date
BEFORE INSERT ON STUDENTS
FOR EACH ROW
BEGIN
    :NEW.enrollment_date := SYSDATE;
END;
/



CREATE TABLE STUDENT_LOG (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id NUMBER,
    old_name VARCHAR2(50),
    new_name VARCHAR2(50),
    old_score NUMBER,
    new_score NUMBER,
    update_date DATE
);




CREATE OR REPLACE TRIGGER log_student_updates
AFTER UPDATE ON STUDENTS
FOR EACH ROW
BEGIN
    INSERT INTO STUDENT_LOG (student_id, old_name, new_name, old_score, new_score, update_date)
    VALUES (:OLD.student_id, :OLD.student_name, :NEW.student_name, :OLD.score, :NEW.score, SYSDATE);
END;
/


