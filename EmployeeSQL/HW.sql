----1. Create table for departments and import data
Create table departments(
dept_no varchar (10)PRIMARY KEY,
dept_name varchar(30) not null) ;
select * from departments

copy departments(dept_no,dept_name)
from '/tmp/departments.csv'
delimiter ','
CSV HEADER;



----2. Create table for department_emp and import data
Create table department_emp(
emp_no INT not null ,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no varchar(30) not null,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no, dept_no)
);	

select * from department_emp

copy department_emp(emp_no,dept_no)
from '/tmp/dept_emp.csv'
delimiter ','
CSV HEADER;

----3.Create table for department manager and import data
Create table department_manager(
dept_no varchar(30) not null,
emp_no INT not null,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (dept_no, emp_no)
) ;

select * from department_manager

copy department_manager(dept_no,emp_no)
from '/tmp/dept_manager.csv'
delimiter ','
CSV HEADER;

--4. Create table for employees
Create table employees(
emp_no INT not null PRIMARY KEY,
emp_title_id varchar(30) not null,
birth_date DATE not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
sex varchar(30) not null,
hire_date DATE not null 
) ;

select * from employees

copy employees(emp_no,emp_title_id, birth_date, first_name, last_name, sex, hire_date)
from '/tmp/employees.csv'
delimiter ','
CSV HEADER;

select * from employees

--5. Create table for salaries 
Create table salaries(
emp_no INT not null,
salary INT not null,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (emp_no)
);

select * from salaries 

copy salaries(emp_no,salary)
from '/tmp/salaries.csv'
delimiter ','
CSV HEADER;


--6. Create table for titles
Create table titles(
title_id varchar(30) not null PRIMARY KEY,
title varchar(30) not null
) ;

copy titles(title_id,title)
from '/tmp/titles.csv'
delimiter ','
CSV HEADER;

select * from titles

---1. List the following details of each employee: 
--employee number, last name, first name
--, sex, and salary.


SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);


select * from employees
emp_no, last_name, first_name, sex

select * from salaries
(emp_no), salary. 

--- 2. List first name, last name, and hire date for employees who were hired in 1986.
select * from employees
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT( YEAR FROM hire_date) = 1986
;

--- 3. List the manager of each department with the following information: department number,
--department name, the manager's employee number, last name, first name.
SELECT de.dept_no,de.dept_name, d.emp_no, e.last_name,e.first_name
FROM employees e
JOIN department_manager d 
ON (e.emp_no = d.emp_no)
JOIN departments de
ON (d.dept_no = de.dept_no);

--- 4. List the department of each employee with the following information: employee number, last name, 
--first name, and department name.
SELECT d.emp_no, e.last_name,e.first_name, de.dept_name
FROM employees e
JOIN department_manager d 
ON (e.emp_no = d.emp_no)
JOIN departments de
ON (d.dept_no = de.dept_no);

--- 5. List first name, last name, and sex for employees whose first name 
--is "Hercules" and last names begin with "B."
SELECT first_name, last_name,sex
FROM employees
WHERE first_name= 'Hercules' AND last_name LIKE 'B%';
	
 --- 6. List all employees in the Sales department, 
 --including their employee number, last name, first name, and department name.
SELECT de.dept_name, d.emp_no, e.last_name,e.first_name
FROM employees e
JOIN department_manager d 
ON (e.emp_no = d.emp_no)
JOIN departments de
ON (d.dept_no = de.dept_no)
WHERE de.dept_name = 'Sales';

--- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT de.dept_name, d.emp_no, e.last_name,e.first_name
FROM employees e
JOIN department_manager d 
ON (e.emp_no = d.emp_no)
JOIN departments de
ON (d.dept_no = de.dept_no)
WHERE de.dept_name IN ( 'Sales', 'Development'); 

--- 8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name,  COUNT(last_name) AS "employee last name count"
FROM employees
GROUP BY last_name 
ORDER BY "employee last name count" DESC;






  
