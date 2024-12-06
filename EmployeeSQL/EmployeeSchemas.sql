--Data Engineering

DROP TABLE IF EXISTS dept_manager, dept_emp, salaries, employees, titles, departments;

-- Set Up The Table Schemas Structures

-- Create 'departments' table
CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

-- View table
SELECT * FROM departments;

-- Create 'titles' table
CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(20) NOT NULL
);

-- View table
SELECT * FROM titles;

-- Create 'employees' table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY, 
	emp_title_id VARCHAR(5) NOT NULL, 
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL, 
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(1) NOT NULL, 
	hire_date DATE NOT NULL, 
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

-- View table
SELECT * FROM employees;

-- Create 'salaries' table
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- View table
SELECT * FROM salaries;

-- Create 'dept_emp' table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL, 
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- View table
SELECT * FROM dept_emp;

-- Create 'dept_manager' table
CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL, 
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
	PRIMARY KEY (dept_no, emp_no)
);

-- View table
SELECT * FROM dept_manager;