USE employees;



SELECT 
	dept_name,
     AVG(salary) AS avg_salary
FROM salaries
	JOIN dept_emp USING(emp_no)
	JOIN departments USING(dept_no)
	WHERE dept_emp.to_date > now() 
	AND salaries.to_date > now() 
	GROUP BY dept_name;

SELECT
	dept_name AS 'Department Name',
	CONCAT(first_name,' ',last_name) AS 'Name',
	salary AS 'Salary'
FROM salaries 
	JOIN dept_manager ON dept_manager.emp_no = salaries.emp_no
	JOIN employees ON employees.emp_no = dept_manager.emp_no
	JOIN departments ON departments.dept_no = dept_manager.dept_no
	WHERE salaries.to_date > CURDATE()
	AND dept_manager.to_date > CURDATE()
	ORDER BY dept_name;


