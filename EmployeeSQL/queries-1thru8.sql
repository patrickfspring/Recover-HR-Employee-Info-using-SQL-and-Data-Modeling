-- #1: List the following for each employee: employee #, last name, first name, gender, salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s on e.emp_no = s.emp_no;

-- #2: List the first name, last name, and hire date for employees hired in 1986. 
select first_name, last_name, hire_date
from employees
where (select extract(year from (hire_date))) in (1986);

-- #3: List the manager for each department with dept #, dept name, manager's emp #, last name, first name. 
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager dm
left join departments d on dm.dept_no = d.dept_no 
left join employees e on dm.emp_no = e.emp_no;

-- #4: List the department for each employee: employee #, last name, first name, dept #, dept name.
select de.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
from dept_emp de
left join employees e on de.emp_no = e.emp_no
left join departments d on de.dept_no = d.dept_no; 

-- #5: List the last name, first name, and gender for employees whose first name is Hercules and lasT name starts with "B".
select first_name, last_name, sex
from employees
where (first_name in ('Hercules') and last_name like 'B%'); 

-- #6: List all employees in the Sales department including employee #, last name, first name, dept name.    
select de.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
left join dept_emp de on d.dept_no = de.dept_no 
left join employees e on de.emp_no = e.emp_no
where d.dept_name in ('Sales');

-- #7: List all employees in Sales and Development departments including employee #, last name, first name, dept name.    
select de.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
left join dept_emp de on d.dept_no = de.dept_no 
left join employees e on de.emp_no = e.emp_no
where d.dept_name in ('Sales', 'Development');

-- #8: List the frequency count of employee last names in descending order, i.e., how many empployees share the same last name.
select last_name, count(last_name) as "count"
from employees
group by last_name
order by "count" desc;
