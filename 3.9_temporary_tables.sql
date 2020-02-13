-- Temporary_Tables 
USE curie_945;

CREATE TEMPORARY TABLE my_numbers(
    n INT UNSIGNED NOT NULL 
);

INSERT INTO my_numbers(n) VALUES (1), (2), (3), (4), (5);

SELECT * FROM my_numbers;

UPDATE my_numbers SET n = n + 1;

SELECT * FROM my_numbers;

DELETE FROM my_numbers WHERE n % 2 = 0;

SELECT * FROM my_numbers;



CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

SELECT * FROM employees_with_departments;

ALTER TABLE employees_with_departments DROP COLUMN dept_no;

SELECT * FROM employees_with_departments;

ALTER TABLE employees_with_departments ADD email VARCHAR(100);

SELECT * FROM employees_with_departments;

-- a simple example where we want the email address to be just the first name
UPDATE employees_with_departments
SET email = CONCAT(first_name, '@company.com');

SELECT * FROM employees_with_departments;
-- Exercise 1
-- A
ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

SELECT * FROM employees_with_departments;

-- B
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

SELECT * FROM employees_with_departments;

-- C
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT * FROM employees_with_departments;

-- D
-- UNKNOWN


-- Question 2
USE curie_945;
DROP TABLE payment_sakila;
CREATE TEMPORARY TABLE payment_sakila
AS
SELECT * FROM sakila.payment;
SELECT * FROM payment_sakila;

DESCRIBE payment_sakila;

ALTER TABLE payment_sakila MODIFY COLUMN amount FLOAT;

SELECT * FROM payment_sakila;

UPDATE payment_sakila SET amount = amount * 100;

SELECT * FROM payment_sakila;

ALTER TABLE payment_sakila MODIFY COLUMN amount INT;

SELECT * FROM payment_sakila;

