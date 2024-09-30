#question1

-- Step a: Create the Orders table.
CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    OrderDate DATE,
    CustomerID NUMBER
);

-- Step b: Create a synonym for the Orders table.
CREATE SYNONYM OrderSyn FOR Orders;

-- Step c: Drop the Orders table.
DROP TABLE Orders;

-- Step d: Query using the synonym (this will fail because the table is dropped).
SELECT * FROM OrderSyn;  -- Error: ORA-00942: table or view does not exist.

-- Step e: Recreate the Orders table and check synonym behavior.
CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    OrderDate DATE,
    CustomerID NUMBER
);

-- The synonym should now work again.
SELECT * FROM OrderSyn;

#question2

-- Step a: Create the Contracts table.
CREATE TABLE Contracts (
    ContractID NUMBER PRIMARY KEY,
    ContractDate DATE
);

-- Step b: Create a synonym for the Contracts table.
CREATE SYNONYM ContractSyn FOR Contracts;

-- Step c: Alter the table to add a new column.
ALTER TABLE Contracts ADD (ContractType VARCHAR2(50));

-- Step d: Query the table using the synonym to check for the new column.
SELECT * FROM ContractSyn;

#question3

-- Step a: Create a view for Employee summary.
CREATE VIEW Employee_Summary AS
SELECT EmployeeID, EmployeeName, salary
FROM Employees;

-- Step b: Create a synonym for the view.
CREATE SYNONYM Emp_Summary_Syn FOR Employee_Summary;

-- Step c: Query the view using the synonym.
SELECT * FROM Emp_Summary_Syn;



#question4

-- Step a: Create the Invoices table.
CREATE TABLE Invoices (
    InvoiceID NUMBER PRIMARY KEY,
    Amount NUMBER
);

-- Step b: Create a sequence for generating Invoice IDs.
CREATE SEQUENCE Invoice_Seq
START WITH 1
INCREMENT BY 1;

-- Step c: Create a synonym for the sequence.
CREATE SYNONYM InvoiceSeqSyn FOR Invoice_Seq;

-- Step d: Create a synonym for the Invoices table.
CREATE SYNONYM InvoiceSyn FOR Invoices;

-- Step e: Insert data into Invoices using the synonym and the sequence.
INSERT INTO InvoiceSyn (InvoiceID, Amount)
VALUES (InvoiceSeqSyn.NEXTVAL, 1000);

-- Step f: Query the data to verify.
SELECT * FROM InvoiceSyn;


#question5

-- Step a: Create the Products table.
CREATE TABLE Products (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(100)
);

-- Step b: Create a synonym for the Products table.
CREATE SYNONYM ProdSyn FOR Products;

-- Step c: Create another synonym that points to the first synonym.
CREATE SYNONYM ChainSyn FOR ProdSyn;

-- Step d: Query data from the chained synonym and validate.
SELECT * FROM ChainSyn;


