-- Create the customers table
CREATE TABLE customers (
  customer_id NUMBER,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  email VARCHAR2(100),
  phone VARCHAR2(20),
  created_at DATE
);

-- Insert 3 records into the customers table
INSERT INTO customers (customer_id, first_name, last_name, email, phone, created_at)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', '1234567890', SYSDATE);

INSERT INTO customers (customer_id, first_name, last_name, email, phone, created_at)
VALUES (2, 'Jane', 'Smith', 'janesmith@example.com', '9876543210', SYSDATE);

INSERT INTO customers (customer_id, first_name, last_name, email, phone, created_at)
VALUES (3, 'Bob', 'Johnson', 'bobjohnson@example.com', '5551234567', SYSDATE);

-- Update the email of customer with customer_id 1
UPDATE customers
SET email = 'namanp1dixit@gmail.com'
WHERE customer_id = 1;

-- Increase the length of phone to 25 characters
ALTER TABLE customers
MODIFY phone VARCHAR2(25);

-- Retrieve the first_name and last_name of customers who have a created_at date within the last month
SELECT first_name, last_name
FROM customers
WHERE created_at >= ADD_MONTHS(SYSDATE, -1);

-- Retrieve the list of customers who do not have a phone number
SELECT *
FROM customers
WHERE phone IS NULL;

-- Delete all customers who registered before the year 2020
DELETE FROM customers
WHERE created_at < TO_DATE('2020-01-01', 'YYYY-MM-DD');

-- Delete the phone column from the customers table
ALTER TABLE customers
DROP COLUMN phone;

-- Rename the customers table to client_data
ALTER TABLE customers
RENAME TO client_data;

-- Add a new column status (Varchar2, 20)
ALTER TABLE client_data
ADD status VARCHAR2(20);

-- Rename the status column to account_status
ALTER TABLE client_data
RENAME COLUMN status TO account_status;


-- Create the suppliers table
CREATE TABLE suppliers (
    supplier_id NUMBER,
    supplier_name VARCHAR2(100),
    contact_name VARCHAR2(100),
    phone VARCHAR2(20),
    city VARCHAR2(50),
    country VARCHAR2(50)
);

-- Insert 5 records into the suppliers table
INSERT all
INTO suppliers (supplier_id, supplier_name, contact_name, phone, city, country) VALUES (1, 'Supplier A', 'Contact A', '1234567890', 'New York', 'USA')
INTO suppliers (supplier_id, supplier_name, contact_name, phone, city, country) VALUES (2, 'Supplier B', 'Contact B', '9876543210', 'Mumbai', 'India')
INTO suppliers (supplier_id, supplier_name, contact_name, phone, city, country) VALUES (3, 'Supplier C', 'Contact C', '5551234567', 'Toronto', 'Canada')
INTO suppliers (supplier_id, supplier_name, contact_name, phone, city, country) VALUES (4, 'Supplier D', NULL, '1112223333', 'Delhi', 'India')
INTO suppliers (supplier_id, supplier_name, contact_name, phone, city, country) VALUES (5, 'Supplier E', 'Contact E', '4445556666', 'London', 'UK')
select * from dual


-- Update the city of all suppliers in the country 'India' to 'United States of India'
UPDATE suppliers
SET city = 'United States of India'
WHERE country = 'India';

-- Increase the supplier_name length to 150 characters
ALTER TABLE suppliers
MODIFY supplier_name VARCHAR2(150);

-- Retrieve all suppliers where the contact_name is not provided (null)
SELECT * FROM suppliers WHERE contact_name IS NULL;

-- Retrieve the list of suppliers with a phone number that starts with '555'
SELECT * FROM suppliers WHERE phone LIKE '555%';

-- Delete all suppliers where the country is 'Canada'
DELETE FROM suppliers WHERE country = 'Canada';

-- Delete the contact_name column from the suppliers table
ALTER TABLE suppliers DROP COLUMN contact_name;


