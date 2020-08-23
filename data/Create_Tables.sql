-- departments 
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
	dept_no VARCHAR(30),
	dept_name VARCHAR(30)
);

SELECT * FROM departments;

-- dept_emp
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(30)
);

-- dept_manager
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	emp_no INT
);

-- employees
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR(30),
	birth_date VARCHAR(30),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(30),
	hire_date DATE
);

-- salaries
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

-- titles
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
	title_id VARCHAR(30),
	title VARCHAR(30)
);
