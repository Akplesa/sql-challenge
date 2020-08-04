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