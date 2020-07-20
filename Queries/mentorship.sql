select * from employees; 
select * from titles;
select * from employees where employees.birth_date between '1965-01-01' and '1965-12-31';

select e.emp_no as Employee_Number, e.first_name,e.last_name, t.title, t.from_date, t.to_date
from employees e inner join salaries s on e.emp_no = s.emp_no inner join Titles t on t.emp_no = e.emp_no
where e.birth_date
between '1965-01-01' and '1965-12-31'

And t.from_date <= current_date
And t.to_date >= current_date

Order by e.emp_no