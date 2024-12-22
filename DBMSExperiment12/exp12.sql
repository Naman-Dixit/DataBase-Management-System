#QUESTION1

create table books (
    bookid number,
    title varchar2(200),
    author varchar2(100)
);
insert all 
 into books values (1, 'to kill a mockingbird', 'harper lee')
 into books values (2, '1984', 'george orwell')
 into books values (3, 'pride and prejudice', 'jane austen')
 into books values (4, 'the great gatsby', 'f. scott fitzgerald')
 into books values (5, 'moby dick', 'herman melville')
 select * from dual;

create index idx_title on books (title);

select * from books where author = 'george orwell';



#Question2


create table employees (
    employeeid number,
    email varchar2(100),
    department varchar2(50)
);
insert all
 into employees values (1, 'Ray.doe@example.com', 'hr')
 into employees values (2, 'johny.smith@example.com', 'it')
 into employees values (3, 'michael.jones@example.com', 'finance')
 into employees values (4, 'breick.brown@example.com', 'marketing')
 into employees values (5, 'william.stallings@example.com', 'sales')
 select * from dual;

create unique index idx_email on employees (email);

insert into employees (employeeid, email, department) values (6, 'Ray.doe@example.com', 'admin');




#Question3

create table orders (
    orderid number,
    customerid number,
    orderdate date,
    status varchar2(20)
);
desc orders;
insert all
 into orders values (1, 101, to_date('2023-01-15', 'yyyy-mm-dd'), 'shipped')
 into orders values (2, 102, to_date('2023-01-20', 'yyyy-mm-dd'), 'pending')
 into orders values (3, 103, to_date('2023-01-25', 'yyyy-mm-dd'), 'delivered')
 into orders values (4, 101, to_date('2023-02-10', 'yyyy-mm-dd'), 'pending')
 into orders values (5, 104, to_date('2023-02-15', 'yyyy-mm-dd'), 'cancelled')
 select * from dual;
 select * from orders;

create index idx_customer_orderdate on orders (customerid, orderdate);

select * from orders 
where customerid = 101 
and orderdate between to_date('2023-01-01', 'yyyy-mm-dd') and to_date('2023-01-31', 'yyyy-mm-dd');







#Question4

create table products ( 
productid number, 
category varchar2(50), 
price number, 
stockstatus varchar2(20) 
) 
desc products

insert all 
create table products ( 
productid number, 
category varchar2(50), 
price number, 
stockstatus varchar2(20) 
) 
desc products

insert all 
into products values (1, 'electronics', 299.99, 'in stock') 
into products values (2, 'electronics', 499.99, 'out of stock') 
into products values (3, 'furniture', 150.00, 'in stock') 
into products values (4, 'clothing', 35.00, 'in stock') 
into products values (5, 'furniture', 225.00, 'out of stock') 
select * from dual
select * from products

create bitmap index idx_stockstatus on products (stockstatus); 
select index_name, index_type 
from user_indexes 
where table_name = 'PRODUCTS'; 

select * from products where stockstatus = 'in stock';

Results
Explain
Describe
Saved SQL
History
$0
into products values (1, 'electronics', 299.99, 'in stock') 
into products values (2, 'electronics', 499.99, 'out of stock') 
into products values (3, 'furniture', 150.00, 'in stock') 
into products values (4, 'clothing', 35.00, 'in stock') 
into products values (5, 'furniture', 225.00, 'out of stock') 
select * from dual
select * from products

create bitmap index idx_stockstatus on products (stockstatus); 
select index_name, index_type 
from user_indexes 
where table_name = 'PRODUCTS'; 

select * from products where stockstatus = 'in stock';








#Question5

create table Employes ( 
employeeid number, 
firstname varchar2(50), 
lastname varchar2(50), 
hiredate date 
)
desc Employes

insert all 
into Employes values (1, 'Raghu', 'Goyal', to_date('2022-01-15', 'yyyy-mm-dd')) 
into Employes values (2, 'Pranjal', 'Goyal', to_date('2022-02-20', 'yyyy-mm-dd')) 
into Employes values (3, 'Deepanshu', 'Rathore', to_date('2023-03-25', 'yyyy-mm-dd')) 
into Employes values (4, 'Vansh', 'Bhatt', to_date('2023-04-10', 'yyyy-mm-dd')) 
into Employes values (5, 'Mradul', 'Lakhotiya', to_date('2023-05-15', 'yyyy-mm-dd')) 
select * from dual 
select * from Employes

create index idx_fullname on Employes (upper(firstname || ' ' || lastname));
select index_name
from user_indexes
where table_name = 'EMPLOYES'

select * from Employes  
where (firstname || ' ' || lastname) = 'Raghu Goyal'; 





#question6


create table sales ( 
saleid number, 
saleamount number, 
taxamount as (saleamount * 0.10) virtual 
) 
desc sales

insert all 
into sales (saleid, saleamount) values (1, 1000) 
into sales (saleid, saleamount) values (2, 1500) 
into sales (saleid, saleamount) values (3, 2000) 
into sales (saleid, saleamount) values (4, 2500) 
into sales (saleid, saleamount) values (5, 3000)
select * from dual;
select * from sales;

create index idx_taxamount on sales (taxamount); 
select index_name
from user_indexes
where table_name = 'SALES';


select *  
from sales  
where taxamount > 200;





