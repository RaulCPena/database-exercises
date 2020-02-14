-- Case exercises
-- create 3.10_case_exercises.sql file

USE employees;

-- Question 1

SELECT * FROM dept_emp;

-- return a query for * employees that has their dept_no,
-- start date, end date, and create a new column

SELECT *,
	IF(to_date > NOW(), 1, 0) AS 'is_current_employee'
 FROM dept_emp;

-- Question 2

SELECT first_name, last_name,
    CASE
        WHEN last_name < 'i%' THEN 'A-H'
  		WHEN last_name < 'r%' THEN 'I-Q'
        ELSE 'R-Z'
    END AS alpha_dog
FROM employees
;


-- Question 3
-- query to find how many employees were born in each decade

SELECT COUNT(*),
	CASE
        WHEN birth_date LIKE '195%' THEN "1950's"
       	WHEN birth_date LIKE '196%' THEN "1960's"
        WHEN birth_date LIKE '197%' THEN "1970's"
        WHEN birth_date LIKE '198%' THEN "1980's"
        WHEN birth_date LIKE '199%' THEN "1990's"
    END AS Born_by_decade
FROM employees
GROUP BY Born_by_decade
;









