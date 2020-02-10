SHOW DATABASES;

USE employees;

SELECT first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

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