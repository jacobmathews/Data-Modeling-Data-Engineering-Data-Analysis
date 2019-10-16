--1. List the following details of each employee: employee number, last name, 
--first name, gender, and salary.
--Ordered by employee number
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e
join salaries s on s.emp_no = e.emp_no
order by 1;

--2.List employees who were hired in 1986.
select * from employees where hire_date between '1986-01-01' and '1986-12-31'
;
--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, dm.to_date
from dept_manager dm
join departments d on d.dept_no = dm.dept_no
join employees e on e.emp_no = dm.emp_no;

--4. List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
left join departments d on d.dept_no = de.dept_no 
order by 1;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees 
where first_name='Hercules'
and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d
WHERE e.emp_no IN
(
  SELECT de.emp_no
  FROM dept_emp de
  WHERE de.dept_no IN
	(select d.dept_no
	 from departments d
	 join dept_emp de on de.dept_no=d.dept_no
	 where dept_name = 'Sales'))
select * from departments d
	 join dept_emp de on de.dept_no=d.dept_no
	 where dept_name = 'Sales'

----#### cant get it to show dept_no

--7. List all employees in the Sales and Development 
--departments, including their employee number, last name, 
--first name, and department name.



--8. In descending order, list the frequency count of 
--employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as "Total Name Count" 
from employees
group by last_name
order by 2 desc;




select * from salaries
