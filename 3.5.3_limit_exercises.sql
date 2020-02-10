SHOW DATABASES;

-- Exercise 1
-- CREATE NEW SQL file
USE employees;

-- Exercise 2

SELECT DISTINCT title FROM titles;

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC LIMIT 10;

-- Exercise 3

SELECT *
FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC 
LIMIT 5;

-- Exercise 4

SELECT *
FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC
LIMIT 5 OFFSET 45;





