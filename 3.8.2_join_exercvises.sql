-- Learning join, left join, right join

-- JOIN EXAMPLE DATABASE

-- Question 1
USE join_example_db;
SELECT * FROM users;
SELECT * FROM roles;
-- Question 2
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;

--		LEFT JOIN
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

--      RIGHT JOIN
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- Question 3
SELECT 
	COUNT(*), 
	roles.name AS role_name 
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY role_name;

-- EMPLOYEES DATABASE

-- Question 1
USE employees;

-- Question 2

SELECT 
	d.dept_name as 'Department Name', 
	CONCAT(e.first_name,' ',e.last_name) AS 'Department Manager'
FROM departments as d
JOIN dept_manager as dm ON (dm.dept_no=d.dept_no)
JOIN employees AS e ON (dm.emp_no=e.emp_no)
WHERE dm.to_date='9999-01-01'
ORDER BY d.dept_name ASC;

-- Question 3

SELECT 
	d.dept_name as 'Department Name', 
	CONCAT(e.first_name,' ',e.last_name) AS 'Department Manager'
FROM departments as d
JOIN dept_manager as dm ON (dm.dept_no=d.dept_no)
JOIN employees AS e ON (dm.emp_no=e.emp_no)
WHERE dm.to_date='9999-01-01' AND e.gender='F'
ORDER BY d.dept_name ASC;

-- Question 4

SELECT t.title AS Title,COUNT(*)
FROM departments as d
JOIN dept_emp AS de ON d.dept_no=de.dept_no
JOIN titles AS t ON de.emp_no=t.emp_no
WHERE d.dept_name='Customer Service' AND t.to_date='9999-01-01' AND de.to_date='9999-01-01'
GROUP BY t.title
ORDER BY t.title ASC;

-- Question 5

-- Find the current salary of all current managers.
+---------+--------------------+---------------+
Department Name    | Name              | Salary
-------------------+-------------------+-------
Customer Service   | Yuchang Weedman   |  58745
Development        | Leon DasSarma     |  74510
Finance            | Isamu Legleitner  |  83457
Human Resources    | Karsten Sigstam   |  65400

SELECT
	dept_name AS 'Department Name',
	CONCAT(first_name,' ',last_name) AS 'Name',
	salary AS 'Salary'
FROM salaries 
	JOIN dept_manager ON dept_manager.emp_no = salaries.emp_no
	JOIN employees ON employees.emp_no = dept_manager.emp_no
	JOIN departments ON departments.dept_no = dept_manager.dept_no
	WHERE salaries.to_date > CURDATE()
	AND dept_manager.to_date > CURDATE()
	ORDER BY dept_name;


-- Question 6
-- Find the number of employees in each department.
-- need to use depaertments table to get dept_name
-- dept_emp to get employees the work in each department
+---------+--------------------+---------------+
| dept_no | dept_name          | num_employees |
+---------+--------------------+---------------+
| d001    | Marketing          | 14842         |
| d002    | Finance            | 12437         |
| d003    | Human Resources    | 12898         |

SELECT	
	dept_no,
	dept_name,
	COUNT(*) AS `num_employees`
FROM departments
JOIN dept_emp USING(dept_no)
WHERE to_date > CURDATE()
GROUP BY dept_no
;

-- Question 7
-- Which department has the highest average salary?
-- salaries table for salaries
-- departments table to get dept_name
-- dept_emp table to get all employees that work for each dept
+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+
SELECT 
	dept_name, 
	AVG(salary) AS `Highest Average Salary`
FROM salaries
	JOIN dept_emp USING(emp_no)
	JOIN departments USING(dept_no)
	WHERE dept_emp.to_date > now()
	AND salaries.to_date > now()
	GROUP BY dept_name
	ORDER BY `Highest Average Salary` DESC
	LIMIT 1;

-- Question 8
-- Who is the highest paid employee in the Marketing department?
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+
SELECT first_name, last_name, salary
FROM employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no
JOIN salaries on salaries.emp_no = dept_emp.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE salaries.to_date > CURDATE()
AND dept_emp.to_date > CURDATE()
AND dept_name = "Marketing"
ORDER BY salary DESC
LIMIT 1;
-- Question 9
-- current department manager with highest salary
+------------+-----------+--------+-----------+
| first_name | last_name | salary | dept_name |
+------------+-----------+--------+-----------+
| Vishwani   | Minakawa  | 106491 | Marketing |
+------------+-----------+--------+-----------+
SELECT first_name, last_name, salary, dept_name
FROM dept_manager
JOIN employees USING(emp_no)
JOIN salaries USING(emp_no)
JOIN departments using(dept_no)
WHERE salaries.to_date > CURDATE()
AND dept_manager.to_date > CURDATE()
ORDER BY salary DESC
LIMIT 1;
-- BONUS Question 10
-- Find the names of all current employees, their department name, and their current manager's name
240,124 Rows

Employee Name | Department Name  |  Manager Name
--------------|------------------|-----------------
 Huan Lortz   | Customer Service | Yuchang Weedman

 .....
-- BONUS Question 11
-- Find the highest paid employee in each department






