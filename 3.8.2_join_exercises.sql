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

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name,' ',e.last_name) AS 'Department Manager'
FROM departments as d
JOIN dept_manager as dm ON (dm.dept_no=d.dept_no)
JOIN employees AS e ON (dm.emp_no=e.emp_no)
WHERE dm.to_date='9999-01-01'
ORDER BY d.dept_name ASC;

-- Question 3

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name,' ',e.last_name) AS 'Department Manager'
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

-- Question 6
-- Question 7
-- Question 8
-- Question 9
-- BONUS Question 10
-- BONUS Question 11






