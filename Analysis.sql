--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name, e.last_name, to_date (e.hire_date,'MM/DD/YYYY')
FROM employees as e
WHERE to_date (e.hire_date,'MM/DD/YYYY') between '1986-01-01' and '1986-12-31'


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
	departments.dept_no, 
	departments.dept_name, 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name
FROM 
	departments as departments
INNER JOIN
	dept_manager as dept_manager ON dept_manager.dept_no = departments.dept_no
INNER JOIN
	employees as employees ON employees.emp_no = dept_manager.emp_no
	
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
	departments.dept_no, 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name
FROM 
	departments as departments
INNER JOIN
	dept_emp as dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN
	employees as employees ON employees.emp_no = dept_emp.emp_no
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
