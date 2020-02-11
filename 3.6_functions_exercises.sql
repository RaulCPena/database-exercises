USE employees;

SELECT CONCAT(first_name, ' ',last_name) AS full_name
FROM employees
WHERE first_name LIKE 'e%' AND last_name LIKE '%e';

SELECT UPPER(CONCAT(first_name, ' ',last_name)) AS full_name
FROM employees
WHERE first_name LIKE 'e%' AND last_name LIKE '%e';

SELECT DATEDIFF(NOW(), hire_date)
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25';

SELECT 
    MIN(salary),
    MAX(salary)
FROM salaries;

SELECT (LOWER(CONCAT(SUBSTR(first_name,1, 1), SUBSTR(last_name, 1, 4), '_', 
    SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))))
    AS user_name
FROM employees
LIMIT 10;

SELECT first_name, last_name,
YEAR(NOW()) - YEAR(hire_date) 
AS Years_with_Company
FROM employees
LIMIT 50;