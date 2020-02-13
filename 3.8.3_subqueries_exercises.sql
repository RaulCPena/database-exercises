SHOW DATABASES;
USE employees;

-- Question 1
SELECT *
FROM employees
WHERE hire_date IN (
	SELECT hire_date
	FROM employees
	WHERE emp_no = 101010
);

-- Question 2
SELECT *
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);

SELECT title
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
)
GROUP BY title;

-- Question 3
SELECT *
FROM employees
WHERE emp_no NOT IN (
	SELECT emp_no
	FROM dept_emp
	WHERE to_date LIKE '999%');

-- Question 4

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE emp_no IN (
    	SELECT emp_no
    	FROM employees
	) AND to_date > NOW()
) AND gender = 'F';

-- Question 5
SELECT AVG(salary) FROM salaries;
SELECT first_name, last_name, salary 
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE salary > (SELECT AVG(salary) FROM salaries) AND to_date > NOW();

-- Question 6
-- Max salary
SELECT STDDEV(salary)
FROM salaries;

-- Find lower bound Standard Deviation
SELECT MAX(salary) - STDDEV(salary) AS 'lb'
FROM salaries;

-- Find upper bound Stamndard Deviation
SELECT MAX(salary) + STDDEV(salary) AS 'up'
FROM salaries;

-- Find total current salaries between 
SELECT *
FROM salaries
WHERE salary BETWEEN 
	(SELECT MAX(salary) - STD(salary) AS 'lb' FROM salaries)
	AND	
	(SELECT MAX(salary) + STD(salary) AS 'up' FROM salaries)
AND to_date > NOW();

-- Find total current number
SELECT COUNT(*)
FROM salaries
WHERE to_date > NOW();

-- Find percentage of salaries
SELECT (SELECT COUNT(*)
FROM salaries
WHERE salary >= /* instead of BETWEEN */
	(SELECT MAX(salary) - STDDEV(salary) AS 'lb' FROM salaries)
	AND	
	(SELECT MAX(salary) + STDDEV(salary) AS 'up' FROM salaries)
AND to_date > NOW()) / (SELECT COUNT(*)
FROM salaries
WHERE to_date > NOW()) * 100;