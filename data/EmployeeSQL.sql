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

SELECT * FROM employees;

-- salaries
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

SELECT * FROM salaries;

-- titles
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
	title_id VARCHAR(30),
	title VARCHAR(30)
);

SELECT * FROM titles;



-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- join employees and salaries
SELECT employees.emp_no, employees.last_name, employees.sex, salaries.salary 
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

SELECT emp_no, last_name, sex
FROM employees;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.first_name, employees.last_name 
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
INNER JOIN dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
;

-- 5. List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
INNER JOIN emp_no ON
employees.emp_no = dept_emp.emp_no
INNER JOIN dept_no ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
;

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
INNER JOIN emp_no ON
employees.emp_no = dept_emp.emp_no
INNER JOIN dept_no ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' AND dept_name = 'Development'
;


-- 8. In descending order, list the frequency count of employee 
-- last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(last_name) AS "employee last name count"
FROM employees
GROUP BY last_name
ORDER BY "employee last name count" DESC;
