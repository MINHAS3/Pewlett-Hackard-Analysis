# Pewlett-Hackard-Analysis

The problem that I am solving is the number of employees who are retiring, creating titles for employees and showing current employees born between Jan. 1, 1952 and Dec. 31, 1955. Thirdly creating a table of employees who will have a mentorship. 
The steps that I took to the solve problem was first creating database to import the CSV files, after I was able to tables to apporately according to each CSV file. When I was able to create the tables in the schemas I followed the steps in the practice modules to properly add the codes to get the outcome I wanted. For example, when merging tables for salaries and titles I did used “inner join” syntax to combine the two tables together. The following is what I wrote the code to combine them, 
“select e.emp_no as Employee_Number, e.first_name,e.last_name, t.title, t.from_date, s.salary 
from employees e inner join salaries s on e.emp_no = s.emp_no inner join Titles t on t.emp_no = e.emp_no
where e.birth_date 
between '1952-01-01' and '1955-12-31';”

After I executed the code working smoothly not causing errors displaying the tables in the data output


