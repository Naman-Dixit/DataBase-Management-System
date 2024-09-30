
#question1

CREATE SEQUENCE EMPID_SEQ
    START WITH 100
    INCREMENT BY 1;


  select *
from user_sequences
where sequence_name = 'EMPID_SEQ';


#question2

select EMPID_SEQ.currval as current_value, EMPID_SEQ.nextval as next_value
from dual;
#question3


alter sequence EMPID_SEQ
cache 20
maxvalue 1000

select sequence_name, cache_size, max_value
from user_sequences
where sequence_name = 'EMPID_SEQ'
  
#question4
create table Employee(
    employee_id number,
    employee_name varchar2(100),
    department varchar2(100)
)

  
insert into Employee (employee_id, employee_name, department)
values (empid_seq.nextval, 'Naman Dixit', 'Data Scientist')


select * from Employee

#question5
DROP SEQUENCE EMPID_SEQ;

#question6

create sequence reverse
start with 10000
increment by -5
minvalue 1000
maxvalue 10000;


--description of reverse sequence

select * from user_sequences where sequence_name = 'REVERSE'


  
#QUESTION7
CREATE TABLE Inventory(
    inventory_id number,
    product_name varchar2(100),
    quantity number
)

desc Inventory


insert into Inventory(inventory_id, product_name, quantity)
values(reverse.nextval, 'Audi V12 Supercharger suspension', 50)

select * from Inventory


