-- GROUP BY clause

--Exercise 1

-- Create file named 3.7_group_by_exercises.sql

--Exercise 2

SELECT DISTINCT title
FROM titles;

--Exercise 3

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

--Exercise 4

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

--Exercise 5

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

--Exercise 6

SELECT 
	last_name,
	COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

--Exercise 7

SELECT gender, COUNT(*)
FROM employees 
WHERE (first_name = 'Irena' OR 
first_name = 'Vidya' OR 
first_name = 'Maya')
GROUP BY gender;

--Exercise 8

SELECT (LOWER(CONCAT(SUBSTR(first_name,1, 1), SUBSTR(last_name, 1, 4), '_', 
    SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))))
    AS user_name
FROM employees
LIMIT 10;

-- Bonus
# There are 13,251 unique user_name's

