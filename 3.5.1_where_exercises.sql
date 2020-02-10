SHOW DATABASES;

USE employees;

SELECT first_name, gender
FROM employees
WHERE (first_name = ('Irena') OR first_name = ('Vidya') OR first_name = ('Maya')) AND gender = 'M';

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%';

SELECT hire_date
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2000;

SELECT MONTH(birth_date), DAY(birth_date)
FROM employees
WHERE MONTH(birth_date) = 12 AND DAY(birth_date) = 25;

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%';

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E';

SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2000 AND MONTH(birth_date) = 12 AND DAY(birth_date) = 25;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';