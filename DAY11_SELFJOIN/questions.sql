Question 1
Show employees and their managers.

SELECT e.employee_name,
       m.employee_name AS manager
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id;

Question 2
Show all employees, including those without a manager.

SELECT e.employee_name,
       m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

Question 3
Show employees working in the HR department along with their managers.

SELECT e.employee_name,
       m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.department = 'HR';

Question 4
Count the number of employees reporting to each manager.

SELECT m.employee_name AS manager,
       COUNT(e.employee_id) AS total_employees
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id
GROUP BY m.employee_name;

Question 5
Find managers who manage more than one employee.

SELECT m.employee_name AS manager,
       COUNT(e.employee_id) AS total_employees
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id
GROUP BY m.employee_name
HAVING COUNT(e.employee_id) > 1;

Question 6
List employees ordered by their managers name.

SELECT e.employee_name,
       m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id
ORDER BY m.employee_name;

Question 7
Show only employees whose manager is John.

SELECT e.employee_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.employee_name = 'John';

Question 8
Find managers with exactly one direct report.

SELECT m.employee_name AS manager,
       COUNT(e.employee_id) AS total_employees
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id
GROUP BY m.employee_name
HAVING COUNT(e.employee_id) = 1;

Question 9
Find the total number of managers.

SELECT COUNT(DISTINCT manager_id) AS total_managers
FROM employees
WHERE manager_id IS NOT NULL;

Question 10
Display employee names, manager names, and departments.

SELECT e.employee_name,
       m.employee_name AS manager,
       e.department
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;