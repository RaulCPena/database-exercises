SHOW DATABASES;

-- Exercise 1
USE employees;

-- Exercise 2
SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
ORDER BY first_name ASC;

-- Exercise 3
SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
ORDER BY first_name, last_name ASC;

-- Exercise 4
SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
ORDER BY last_name DESC;

-- Exercise 5
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no;

-- Exercise 6
SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
ORDER BY last_name ASC;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;

-- Exercise 7
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2000 AND MONTH(birth_date) = 12 AND DAY(birth_date) = 25
ORDER BY hire_date DESC;
