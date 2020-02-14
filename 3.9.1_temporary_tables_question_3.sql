USE employees;

SELECT AVG(salary)
FROM salaries
JOIN employees ON employees.emp_no = salaries.emp_no
/* WHERE to_date > NOW() */;
-- 72012.2359
SELECT STDDEV(salary)
FROM salaries;
-- 16904.82828800014

SELECT dept_name, (
	(SELECT AVG(salary)
	FROM salaries
	) -AVG(salary)) / 
	(SELECT STDDEV(salary)
	FROM salaries) AS 'salary_z_score'
	FROM employees_with_departments
JOIN salaries ON salaries.emp_no = employees_with_departments.emp_no
GROUP BY dept_name;

SELECT dept_name, (
	(SELECT AVG(salary)
	FROM salaries
	) -AVG(salary)) / 
	(SELECT STDDEV(salary)
	FROM salaries) AS 'salary_z_score'
	FROM employees e
JOIN employees.salaries s USING (emp_no)
JOIN employees.dept_emp de USING (emp_no)
JOIN employees.departments d USING (dept_no)
GROUP BY dept_name;


