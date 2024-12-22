#Question1
declare
  num number := :P1_NUM;  -- Assuming P1_NUM is a page item where user enters the number
begin
  -- Check if the number is even or odd
  if mod(num, 2) = 0 then
    dbms_output.put_line('even');
  else
    dbms_output.put_line('odd');
  end if;
end;

#Question2

declare
  a number := 0;
  b number := 1;
  c number;
  counter number := 1;
begin
  dbms_output.put_line(a); -- first fibonacci number
  dbms_output.put_line(b); -- second fibonacci number

  while counter <= 8 loop
    c := a + b;
    dbms_output.put_line(c);
    a := b;
    b := c;
    counter := counter + 1;
  end loop;
end;
/



#Question3

declare
  dept_id number := :P1_DEPT_ID;  -- Assume P1_DEPT_ID is a page item in APEX or replace it with a value
begin
  for emp_rec in (select first_name, last_name from employees where department_id = dept_id) loop
    dbms_output.put_line(emp_rec.first_name || ' ' || emp_rec.last_name);
  end loop;
end;
/

desc department

#Question4 
declare
  emp_id number := :P1_EMP_ID;  -- Assume P1_EMP_ID is a page item in APEX
  v_salary employees.salary%type;
  v_department_id employees.department_id%type;
begin
  select salary, department_id into v_salary, v_department_id 
  from employees
  where employee_id = emp_id;

  dbms_output.put_line('Salary: ' || v_salary);
  dbms_output.put_line('Department ID: ' || v_department_id);
end;
/




#Question5
→create or replace procedure update_salary(emp_id number, percent_increase number) is 
v_salary employees.salary%type; 
begin 
select salary into v_salary 
from employees 
where employee_id = emp_id; 
v_salary := v_salary + (v_salary * percent_increase / 100); 
update employees 
set salary = v_salary 
where employee_id = emp_id; 
dbms_output.put_line('updated salary: ' || v_salary); 
commit; 
end; 



#Question6


 declare 
avg_salary number; 
highest_salary number; 
lowest_salary number; 
begin 
select avg(salary) into avg_salary 
from employees; 
dbms_output.put_line('average salary: ' || avg_salary); 
declare 
begin 
select max(salary), min(salary) into highest_salary, lowest_salary 
from employees; 
dbms_output.put_line('highest salary: ' || highest_salary); 
dbms_output.put_line('lowest salary: ' || lowest_salary); 
end; 
end;





