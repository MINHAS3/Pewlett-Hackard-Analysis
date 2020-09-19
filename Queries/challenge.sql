-- Technical Analysis Deliverable 1: Number of Retiring Employees by Title. You will create three 
-- new tables, one showing number of [titles] retiring, one showing number of employees with each 
-- title, and one showing a list of current employees born between Jan. 1, 1952 and Dec. 31, 1955. 
-- New tables are exported as CSVs. 
-- Technical Analysis Deliverable 2: Mentorship Eligibility. A table containing employees who are 
-- eligible for the mentorship program You will submit your table and the CSV containing the data 
-- (and the CSV containing the data)
-- Partition the data to show only most recent title per employee


-- one showing number of employees with each title
drop table if exists emp_info;
SELECT 
	e.emp_no
	,e.first_name
	,e.last_name
	,e.birth_date
	,tmp.title
	,tmp.from_date
	,tmp.to_date
	,s.salary
INTO emp_info
FROM
	employees e
inner join
 (SELECT 
  	* 
  	,ROW_NUMBER() OVER (PARTITION BY (emp_no) ORDER BY to_date DESC) rn
 FROM 
  	titles
 ) tmp 
on 
	e.emp_no = tmp.emp_no
	and tmp.rn = 1
inner join
	salaries s 
	on e.emp_no = s.emp_no
;

-- list of current employees born between Jan. 1, 1952 and Dec. 31, 1955. 
select 
	*
from
	emp_info
where 
	to_date = '9999-01-01'
	and birth_date between '1952-01-01' and '1955-12-31'
;

-- grouped by title
select 
	title
	,count(distinct emp_no) as num_emp
from
	emp_info
where 
	to_date = '9999-01-01'
	and birth_date between '1952-01-01' and '1955-12-31'
group by 
	title
;

select 
	count(distinct title) as num_titles
from
	emp_info
where 
	to_date = '9999-01-01'
	and birth_date between '1952-01-01' and '1955-12-31'
;

-- Mentorship Eligibility. A table containing employees who are 
-- eligible for the mentorship program
select *
from
	(SELECT 
  	* 
  	,ROW_NUMBER() OVER (PARTITION BY (emp_no) ORDER BY to_date DESC) rn
 FROM 
  	titles) tmp
where
	tmp.rn = 1
;

-- For this table, you will need to include the following information:

-- Employee number
-- First and last name
-- Title
-- from_date and to_date
-- To be eligible to participate in the mentorship program, 
-- employees will need to have a date of birth that falls between January 1, 1965 and December 31, 1965. 
-- You’ll need to use two inner joins to create this new table. 
-- Please refer to your ERD to determine which tables contain the information that you need.

select emp_no, first_name, last_name, title, from_date, to_date
from emp_info 
where birth_date between '1965-01-01' and '1965-12-31';
