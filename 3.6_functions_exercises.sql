USE employees;

-- Exercise 2

SELECT DISTINCT title
FROM titles;

-- Exercise 3

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- Exercise 4

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- Exercise 5

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- Exercise 6

SELECT gender, COUNT(*)
FROM employees 
WHERE (first_name = 'Irena' OR 
first_name = 'Vidya' OR 
first_name = 'Maya')
GROUP BY gender;

-- Exercise 7


SELECT COUNT(*), gender
FROM employees 
WHERE (first_name = 'Irena' OR 
first_name = 'Vidya' OR 
first_name = 'Maya')
GROUP BY gender;

-- Exercise Bonus

SELECT (LOWER(CONCAT(SUBSTR(first_name,1, 1), SUBSTR(last_name, 1, 4), '_', 
    SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))))
    AS user_name, COUNT(*)
FROM employees
GROUP BY user_name
HAVING COUNT(user_name) > 1;

-- BONUS answer

# There are 13,251 unique user_name'so
