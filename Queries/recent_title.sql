select * from titles order by emp_no,from_date;


select t.emp_no, t.title, table1.maxdate into recent_title from titles as t inner join
(select emp_no,max(from_date) as maxdate from titles group by emp_no)  as table1
on t.emp_no = table1.emp_no and t.from_Date = table1.maxdate;

select * from recent_title; 