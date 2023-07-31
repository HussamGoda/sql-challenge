-- Read all tables first to check imported dadta
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM dept_emp;

--List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees
JOIN salaries ON
salaries.emp_no=employees.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';

-- List the manager of each department along with their department number, department name, employee number,
-- last name, and first name
SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON departments.dept_no=dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, 
-- and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN departments ON departments.dept_no=dept_emp.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B 
SELECT first_name, last_name, sex
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--List each employee in the Sales and Development departments,
--including their employee number, last name, first name, and department name
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';
--ORDER By departments.dept_name desc;

-- List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name)
SELECT employees.last_name, COUNT (employees.last_name) AS "Number of Employees Having The Same Last Name"
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT (employees.last_name) desc; 