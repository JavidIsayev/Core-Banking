


any 
all

select * from employees where salary > any(select salary from employees where department_id=100);
select * from employees where salary > all(select salary from employees where department_id=100);
--inner join
select * from employees e join departments d
   on e.department_id=d.department_id;
   select * from employees e join departments d
   on e.department_id=d.department_id;
   
   select * from employees e join jobs j on 
   e.job_id=j.job_id

--left join
select * from employees e left join departments d 
  on e.department_id=d.department_id;
-- full join 
select * from employees e full join departments d on e.department_id = d.department_id;

--cross join
select * from employees cross join departments;

-- natural join
select * from employees natural join locations;
     =
select * from employees e join departments d 
  on e.department_id=d.department_id 
    and d.manager_id=e.manager_id;

select e.first_name,e.last_name,d.department_name from employees e,departments d;
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id; 

select e.first_name,e.last_name,j.job_title from employees e left join jobs j on e.job_id=j.job_id;

SELECT e.first_name, e.last_name, j.job_title, d.department_name,l.city,c.country_name,r.region_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id 
LEFT JOIN departments d ON e.department_id = d.department_id
left join locations l ON d.location_id=l.location_id 
left join countries c on c.country_id = l.country_id
left join regions r on r.region_id=c.region_id;
select * from countries c full outer join regions r ON c.region_id=r.region_id;

select e.first_name || ' ' || e.last_name as full_name,d.department_name from employees e
join departments d on e.department_id=d.department_id ;
select * from employees;
select * from jobs;
select e.first_name,e.last_name,j.job_title,e.salary,j.min_salary from employees e
left join jobs j on e.job_id = j.job_id;
select * from job_history;

select m.first_name,m.last_name,e.first_name,e.last_name from employees e join employees m
  on m.manager_id=e.employee_id;
  
  select * from job_history;
  select * from jobs;
  select * from locations;
  select * from employees;

  select * from employees cross join jobs j where j.job_title='President';
  
  select c.country_name,l.state_province from countries c right join locations l ON c.country_id = l.country_id;

--join 15
select e.manager_id,e.salary,d.department_id,e.job_id from employees e join departments d on e.department_id=d.department_id where job_id= 'IT_PROG';
select e.first_name ||' '|| e.last_name as full_name,e.hire_date,jh.start_date,jh.end_date from employees e
 left join job_history jh ON e.employee_id=jh.employee_id;
select d.department_name,m.location_id from departments d JOIN departments m ON
d.department_id=m.department_id;
select d.department_name,l.city from locations l right join departments d ON d.location_id=l.location_id;
select email,region_id from employees cross join regions;
select * from locations natural join jobs;
select e.first_name,e.last_name,e.salary from employees e 
 join departments d ON e.department_id=d.department_id;
select d.department_name,l.postal_code from departments d
 left join locations l ON d.location_id=l.location_id;
select * from employees cross join jobs j where j.job_title = 'President';
select e.first_name,e.last_name,j.job_title,e.salary,j.max_salary from employees e left join jobs j on e.job_id=j.job_id;
select e.first_name,e.last_name,j.job_title,d.department_name,L.city
from employees e
join jobs j ON e.job_id=j.job_id
left join departments d on d.department_id=e.department_id
left join locations L ON L.location_id=d.location_id;
select * from countries c full outer join regions r ON c.region_id=r.region_id;
select c.country_name,l.state_province from countries c left join locations l ON c.country_id=l.country_id;
select e.manager_id,e.salary,d.department_id from employees e join departments d on e.department_id =
d.department_id;
select e.manager_id,e.salary,e.job_id from employees e join departments d ON e.department_id=d.department_id
where job_id='AD_PRES';
select jh.*,j.min_salary,j.max_salary from job_history jh join jobs j ON jh.job_id=j.job_id;

--15 subquery
 select * from employees  where hire_date<(select hire_date from employees where department_id in (select
department_id from departments where location_id =(select location_id from locations where city = 'London')));

select (select avg(salary) from employees e where e1.department_id=e. department_id) from employees e1;

select * from employees where department_id = 100 and salary in(select avg(salary) from employees  where
department_id=100);

select * from employees where salary =(select max(salary)from employees);

select * from departments where department_id in (select department_id from employees group by department_id
having avg(salary)>=5500);

select department_name,(select count(*) from employees where department_id = d.department_id) as num_emp from
departments d;

select department_name from departments where department_id in (select department_id from employees where
department_id is not null);

select * from employees where (salary,department_id) in(select max(salary),department_id from employees group by department_id);

select * from departments d where (select avg(salary)from employees where department_id= d.department_id)
between 3500 and 6500;

select * from employees where (salary,department_id) in (select max(salary),department_id from employees group
by department_id);

select first_name || ' ' || last_name as full_name from employees where employee_id in(select employee_id from
job_history where start_date < hire_date);

SELECT department_id, COUNT(employee_id)
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees)
GROUP BY department_id
HAVING COUNT(employee_id) < 7;

select first_name,last_name from employees where salary < (select sum (salary)*0.01 from employees);

select * from employees where department_id in(select department_id from departments where department_name
like 'IT');

select * from employees where department_id in (select d.department_id from departments d where d.location_id = 1700);

1)select e.first_name || ' ' || e.last_name as full_name,d.department_name from employees e
 join departments d on e.department_id = d.department_id;
2)select e.first_name,e.last_name,j.job_title,e.salary,j.min_salary from employees e
 left join jobs j on e.job_id = j.job_id;
3)select b.id,b.title,a.first_name,a.last_name from books b 
 right join authors a on b.author_id=a.author_id 
 order by b.author_id
4)select s.student_name, c.course_name from students s 
 left join enrolled_courses ec on s.student_id = ec.student_id
 left join courses c on ec.course_id = c.course_id
5)select p.product_name,c.category_name from products p
 cross join categories c;
6)select * from products p 
 join orders o ON p.product_id = o.product_id 
 limit 10;
7)select * from employees natural join departments;
8)select c.*,g.city from DimCustomer
 left join geography g ON c.geographykey = g.geographykey;
9)select e.first_name || ' ' || e.last_name as full_name,e.hire_date, jh.start_date, jh.end_date from employees e
 left join job_history jh ON e.employee_id = jh.employee_id;
10)select e.first_name,e.last_name,d.department_name,l.city from employees e
 left join departments d ON e.department_id = d.department_id 
 left join locations l ON d.location_id = l.location_id;
11)select college.ClassTeacher,student.CourseYear from college
 join student ON college.student_id= student.student_id;
12) select * from salesman 
 full outer join customer c ON salesman_id=c.salesman_id;
13)select id_person,name,id_pos,title from persons
 right outer join positions ON id_pos = position_ref;
14)select employee_name,states from employees
 cross join Addresses
15)select * from movies 
 inner join directors ON directors.id=movies.director_id 
 and director name <> 'Christopher Nolan';
16)select c.country_name,r.region_name from countries
Confidential: 1210473
 right join regions r ON c.region_id=r.region_id
17)select c.customer_id,c.customer_name,o.amount from customers c
 join orders o ON c.customer_id=o.customer_id 
 where o.amount>=300
18)select cu.date,cu.unit,c.country from customer_units cu
 join countries c ON cu.CountryId = c.ID
19)select * from employees 
 left join departments d ON department_id=d.department_id 
 AND manager_id=d.manager_id
20)select * from players 
 join teams t ON players.team_id=t.team_id;
 
 
 Select sum (salary) over (order by extract(year from hire_date)) as ''expense'',e.* from employees e;


SELECT 
    SUM(salary) OVER (PARTITION BY EXTRACT(YEAR FROM hire_date)) AS expense,
    e.*
FROM 
    employees e;


select job_id,hire_date,salary,lag(hire_date) over (partition by job_id order by hire_date) as prehiredate, case when
lag(hire_date) over (partition by job_id order by hire_date)is not null then salary - lag(salary) over (partition by job_id order by hire_date) 
else null end as salary_difference from employees order by job_id,hire_date;

select nth_value(salary,5) over () from employees;



-- Block 1: Division by Zero Exception Handling
BEGIN
  BEGIN
    dbms_output.put_line(1/0); -- Division by zero intentionally triggers an exception
  EXCEPTION
    WHEN others THEN
      dbms_output.put_line('Cannot divide by zero');
  END;
BEGIN
  BEGIN
    dbms_output.put_line(1/0); -- Division by zero intentionally triggers an exception
  EXCEPTION
    WHEN others THEN
      dbms_output.put_line('Cannot divide by zero');
  END; -- End of inner block

  -- This outer block does not have an END statement because it's the end of the script.
END; -- End of outer block
/

  -- Block 2: Null Block
  BEGIN
    NULL; -- This block does nothing
  END;

  -- Block 3: Print Even Numbers
  BEGIN
    FOR i IN 1..10 LOOP
      IF MOD(i,2) = 0 THEN
        dbms_output.put_line(i);
      END IF;
    END LOOP;
  END;

  -- Block 4: Print Characters of a String
  DECLARE
    a VARCHAR2(10) := 'Azerbaijan';
  BEGIN
    FOR i IN 1..LENGTH(a) LOOP -- Changed the loop condition to use LENGTH function
      dbms_output.put_line(SUBSTR(a, i, 1));
    END LOOP;
  END;
END;

DECLARE
  a VARCHAR2(10) := 'Azerbaijan';
BEGIN
  FOR i IN 1..LENGTH(a) LOOP
    dbms_output.put_line(SUBSTR(a, i, 1));
  END LOOP;
END; -- Remove the extra "END" statement

SET SERVEROUTPUT ON;

DECLARE
   i NUMBER := 1;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Salam' || i);
      i := i + 1; -- Fixed the space between : and =
      EXIT WHEN i = 4;
   END LOOP;
END;
/

begin
  for i in 1..10 loop
    if i=1 then
     dbms_output.put_line(i);
     end if;
     end loop;
   end;
   
   begin 
     for i in 1..10 loop
        if mod(i,2)=0 then
         dbms_output.put_line(i);
         end if;
         end loop;
         end;
         
begin 
     for i in 1..10 loop
        if mod(i,2)=1 then
         dbms_output.put_line(i);
         end if;
         end loop;
         end;


create procedure print is
 begin 
  dbms_output.put_line('salam');
  
end;

begin 
 print;
 end;
 --or
 exec print;
 
 drop procedure print;
 /
 create or replace procedure print(p_text varchar2) is
  begin 
  dbms_output.put_line(p_text);
  end;
  /
  begin 
   print('salam');
   end;
   /
   exec print;



DROP PROCEDURE print;

CREATE OR REPLACE PROCEDURE print(p_text VARCHAR2) IS
BEGIN 
  DBMS_OUTPUT.PUT_LINE(p_text);
END;
/

BEGIN 
  print('salam');
END;
/

EXEC print('hello');


create table cb_customers
(id number generated always as identity primary key,
  first_name varchar2(30),
  last_name varchar2(30),
  birth_date date,
  gender char(1));
  /
  create or replace procedure cb_customers_insert 
  (p_first_name varchar2,
  p_last_name varchar2,
  p_birth_date date,
  p_gender char)is
  begin 
  insert into cb_customers(first_name,last_name,birth_date,gender)
  values (p_first_name,p_last_name,p_birth_date,p_gender);
  commit;
  end;
  /
  
  begin 
    cb_customers_insert('Ali','Aliyev',to_date('10.01.2000','DD.MM.YYYY'),'M');
    end;
    select * from cb_customers;
    
 create or replace procedure cb_customers_update
 (p_id number,
 p_first_name varchar2,
 p_last_name varchar2,
 p_birth_date date,
 p_gender char) is
 begin
 update cb_customers set                    
                            first_name=p_first_name,
                            last_name=p_last_name,
                            birth_date=p_birth_date,
                            gender=p_gender
                     where
                           id= p_id;
                 commit;
                 end;
                        
    begin 
       cb_customers_update(1,'Ali','Aliyev', to_date('11.01.2000','DD.MM.YYYY'),'M');
       end;
       
       select * from cb_customers;
    select * from employees;
    select * from employees e join jobs j 
    on e.job_id=j.job_id;
    
    
    
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

drop procedure cb_customers_insert;
drop procedure cb_customers_update;
drop table cb_customers;

create table cb_customers 
(id number generated always as identity primary key,
first_name varchar2(30),
last_name varchar2(30),
birth_date date,
gender char(1));

create or replace procedure cb_customers_insert 
(p_id number,p_first_name varchar2 default null,
p_last_name varchar2 default null, p_birth_date date default null,
p_gender char default null)
is 
begin 
  update cb_customers set
  first_name = nvl (p_first_name, first_name),
  last_name = nvl (p_last_name, last_name),
  birth_date = nvl (p_birth_date, birth_date),
  gender = nvl(p_gender,gender)
  where id = p_id;
  commit;
  end;
    
    
                            
    
  
  
 
            