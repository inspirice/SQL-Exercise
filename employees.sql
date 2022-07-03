use employees;

select * from employees order by hire_date desc limit 50,10;

select emp_no, count(emp_no) as adjustment from salaries group by emp_no order by from_date desc;

select first_name, last_name ,salary
from employees inner join salaries 
on employees.emp_no = salaries.emp_no 
order by from_date desc;

select avg(salary) from salaries where from_date like '1999%' and to_date like '1999%';

select gender, avg(salary) from salaries inner join employees on salaries.emp_no = employees.emp_no 
where (from_date like '1999%') && (to_date like '1999%') group by gender;

select dept_name as department, count(DISTINCT employees.emp_no) as employees, avg(salary) as salary
from departments join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
join salaries on employees.emp_no = salaries.emp_no
where salaries.to_date like '9999%' group by dept_name;