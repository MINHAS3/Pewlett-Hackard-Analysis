select * from employees; 
select * from titles;
select * from salaries;
select * from employees where employees.birth_date between '1952-01-01' and '1955-12-31';

select e.emp_no as Employee_Number, e.first_name,e.last_name, t.title, t.from_date, s.salary 
from employees e inner join salaries s on e.emp_no = s.emp_no inner join Titles t on t.emp_no = e.emp_no
where e.birth_date 
between '1952-01-01' and '1955-12-31';