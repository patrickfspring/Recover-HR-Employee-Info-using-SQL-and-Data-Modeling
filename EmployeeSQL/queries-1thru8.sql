select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s on e.emp_no = s.emp_no;

select first_name, last_name, hire_date
from employees
where (select extract(year from (hire_date))) in (1986);

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager dm
left join departments d on dm.dept_no = d.dept_no 
left join employees e on dm.emp_no = e.emp_no;

select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
left join employees e on de.emp_no = e.emp_no
left join departments d on de.dept_no = d.dept_no; 

select first_name, last_name, sex
from employees
where (first_name in ('Hercules') and last_name like 'B%'); 

select de.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
left join dept_emp de on d.dept_no = de.dept_no 
left join employees e on de.emp_no = e.emp_no
where d.dept_name in ('Sales');

select de.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
left join dept_emp de on d.dept_no = de.dept_no 
left join employees e on de.emp_no = e.emp_no
where d.dept_name in ('Sales', 'Development');

select last_name, count(last_name) as "count"
from employees
group by last_name
order by "count" desc;
