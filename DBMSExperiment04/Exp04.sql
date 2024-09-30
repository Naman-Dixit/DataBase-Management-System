#QUESTION1
Create table sales(
    sale_id number,
    sale_amount number,
    sale_date date

)

desc sales
insert all
   into sales values (1, 1234, to_date('01/01/2024', 'dd/mm/yyyy'))
   into sales values (2, 5678, to_date('02/02/2024', 'dd/mm/yyyy'))
   into sales values (3, 91011, to_date('03/03/2024', 'dd/mm/yyyy'))
   into sales values (4, 12131, to_date('04/04/2024', 'dd/mm/yyyy'))
   into sales values (5, 14151, to_date('05/05/2024', 'dd/mm/yyyy'))
select * from dual
select * from sales

select sale_id, round(sale_amount, -2) as rounded_sale_amount
from sales

select sale_id, sale_amount, mod(sale_amount, 100) as modulus
from sales

#question2
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, Name, HireDate) VALUES
(1, 'John Doe', '2023-01-15'),
(2, 'Jane Smith', '2024-03-20'),
(3, 'Michael Johnson', '2022-11-08'),
(4, 'Emily Davis', '2023-07-12'),
(5, 'David Lee', '2024-05-05');

SELECT EmployeeID, Name, HireDate, TRUNC(SYSDATE - HireDate) AS DaysSinceHire
FROM Employees;
#question3

CREATE TABLE Departments (
    DepartmentID NUMBER,
    DepartmentName VARCHAR2(100)
);


CREATE TABLE EmployeeSalaries (
    EmployeeID NUMBER,
    DepartmentID NUMBER,
    Salary NUMBER
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'HR')
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES  (2, 'Finance')
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (3, 'Marketing')
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (4, 'IT')
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (5, 'Sales')

INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES (1, 1, 50000)
INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES(2, 1, 60000)
INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES(3, 2, 70000)
INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES(4, 3, 80000)
INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES(5, 4, 90000)
INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES(6, 2, 55000)
INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES(7, 3, 65000)
INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES(8, 5, 75000)
INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES(9, 4, 85000)
INSERT INTO EmployeeSalaries (EmployeeID, DepartmentID, Salary) VALUES(10, 5, 95000)

select * from EmployeeSalaries

SELECT DepartmentName,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AverageSalary,
       MAX(Salary) AS HighestSalary,
       MIN(Salary) AS LowestSalary
FROM EmployeeSalaries
JOIN Departments ON EmployeeSalaries.DepartmentID = Departments.DepartmentID
GROUP BY DepartmentName;

#QUESTION4
CREATE TABLE Grades (
    StudentID NUMBER,
    StudentName VARCHAR2(100),
    Grade NUMBER
);

INSERT INTO Grades (StudentID, StudentName, Grade) VALUES (1, 'John Doe', 80);
INSERT INTO Grades (StudentID, StudentName, Grade) VALUES (2, 'Jane Smith', 60);
INSERT INTO Grades (StudentID, StudentName, Grade) VALUES (3, 'Alice Johnson', 95);
INSERT INTO Grades (StudentID, StudentName, Grade) VALUES (4, 'Bob Brown', 75);
INSERT INTO Grades (StudentID, StudentName, Grade) VALUES (5, 'Sarah Lee', 85);

SELECT 
    StudentID,
    StudentName,
    Grade,
    CASE
        WHEN Grade < 70 THEN 'Low'
        WHEN Grade >= 70 AND Grade < 90 THEN 'Medium'
        ELSE 'High'
    END AS GradeCategory
FROM Grades;

#question5

create table Courses (
   CourseID number primary key,
   CourseName varchar(100),
   Credits number
)

create table Enrollments (
    EnrollmentID number primary key,
    StudentID number,
    CourseID number,
    foreign key (CourseID) references Courses(CourseID)   
)

--INSERTING THE RECORDS IN COURSES
insert all
into Courses values (1, 'Mathematics', 4)
into Courses values (2, 'Physics', 3)
into Courses values (3, 'Chemistry', 4)
into Courses values (4, 'Literature', 2)
into Courses values (5, 'Biology', 5)
select * from dual


--INSERTING THE RECORDS IN ENROLMENTS
insert all
into Enrollments values (1, 101, 1)
into Enrollments values (2, 102, 3)
into Enrollments values (3, 103, 2)
into Enrollments values (4, 104, 5)
into Enrollments values (5, 105, 4)
select * from dual

select StudentID
from Enrollments
where CourseID in (
    select CourseID
    from Courses
    where Credits > 3
)

#question6
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    Email VARCHAR2(100)
);

insert all
into Customers values (001, 'Raghvendra', 'raghvendra@gmail.com')
into Customers values (002, 'Pranjal', 'pranjal@email.com')
into Customers values (003, 'Deepanshu', 'deepanshu@fmail.com')
into Customers values (004, 'Vansh', 'vanshu@gmail.com')
into Customers values (005, 'Choubey JI', 'choubey@wmail.com')
select * from dual

SELECT CustomerID, CustomerName, Email
FROM Customers
WHERE Email IN (
  SELECT Email
  FROM Customers
  WHERE INSTR(Email, '@gmail.com') > 0
);
#question 7

 create table orders
(
    orderid number,
    orderAmount number,
    orderdate date
);

insert all
    into orders values(1,8,to_date('01/8/2024'))
    into orders values(2,6,to_date('02/8/2023'))
    into orders values(3,9,to_date('12/1/2023'))
    into orders values(4,89,to_date('1/2/2024'))
    into orders values(5,44,to_date('2/1/2024'))
    select * from dual
    
SELECT orderID, orderAmount, orderDate
FROM orders
WHERE orderAmount > (SELECT AVG(orderAmount) FROM orders);
#question8

create table membership
(
    memeberid number,
    memebername varchar2(100),
    joinDate date
);
insert all
    into membership values(1,'Ragav',to_date('01/8/2024'))
    into membership values(2,'Pranjal',to_date('02/8/2023'))
    into membership values(3,'Deepu',to_date('12/1/2023'))
    into membership values(4,'Rishi',to_date('1/2/2024'))
    into membership values(5,'jon',to_date('2/1/2024'))
    select * from dual

select memeberid, memebername, joinDate
from membership
where joinDate >= ADD_MONTHS(SYSDATE, -12);
#question9

create table SalesData (
    SaleID Number,
    ProductID Number,
    SaleAmount Number 
)

--INSERTING THE RECORDS
insert all
into SalesData values (1, 011, 500)
into SalesData values (2, 022, 600)
into SalesData values (3, 033, 700)
into SalesData values (4, 044, 800)
into SalesData values (5, 055, 1000)
select * from dual

select ProductID
from SalesData
group by ProductID
having sum(SaleAmount) > (select avg(TotalSales)
    from (
        select ProductID, sum(SaleAmount) as TotalSales
        from SalesData
        group by ProductID
    )
)
#QUESTION10
create table employeperformance (
    employeeid number primary key,
    employeename varchar2(100),
    performancescore number
);

insert into employeperformance (employeeid, employeename, performancescore) values (1, 'alice smith', 85);
insert into employeperformance (employeeid, employeename, performancescore) values (2, 'bob johnson', 78);
insert into employeperformance (employeeid, employeename, performancescore) values (3, 'carol williams', 90);
insert into employeperformance (employeeid, employeename, performancescore) values (4, 'david brown', 70);
insert into employeperformance (employeeid, employeename, performancescore) values (5, 'eva davis', 88);
 SELECT *FROM employeperformance;


select employeeid, employeename, performancescore
from employeperformance
where performancescore > (
    select avg(performancescore)
    from employeperformance
);
