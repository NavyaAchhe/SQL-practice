<!-- Day 11: SELF JOIN

What is a SELF JOIN?

A SELF JOIN is a join where a table is joined with itself.

There is no special SELF JOIN keyword. A regular JOIN is used with different aliases for the same table.

Why is SELF JOIN Used?

A SELF JOIN is useful when rows in the same table are related to one another.

Common examples:

- Employees and managers
- Parent and child categories
- Organizational hierarchies
- Referral relationships

Syntax

SELECT e.employee_name,
       m.employee_name AS manager
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id;

Why Use Aliases?

Since the same table is referenced twice, aliases help distinguish between the two roles.

Example:

- `e` → Employee
- `m` → Manager

INNER SELF JOIN

Returns only employees who have a manager.

SELECT e.employee_name,
       m.employee_name AS manager
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id;

LEFT SELF JOIN

Returns all employees, including those without a manager.

SELECT e.employee_name,
       m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

Aggregate Functions

Count Employees per Manager

SELECT m.employee_name,
       COUNT(e.employee_id)
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id
GROUP BY m.employee_name;

Execution Order

1. FROM
2. JOIN
3. ON
4. WHERE
5. GROUP BY
6. HAVING
7. SELECT
8. ORDER BY
9. LIMIT

Best Practices

- Always use aliases.
- Join using the primary key and foreign key relationship.
- Use LEFT JOIN when you want to include top-level employees with no manager.
- Use meaningful alias names.

What is a SELF JOIN?

A SELF JOIN joins a table with itself using aliases.

Why are aliases required?

Because SQL needs to distinguish between the two references to the same table.

Can SELF JOIN use LEFT JOIN?

Yes.

A LEFT SELF JOIN returns all employees, including those without managers.

Real-World Uses

- Employee-manager hierarchy
- Organization charts
- Parent-child relationships
- Product category hierarchy
- Referral systems

Key Takeaways

- SELF JOIN joins a table with itself.
- Aliases are mandatory.
- SELF JOIN is commonly used for hierarchical data.
- It can use INNER JOIN, LEFT JOIN, or other join types depending on the requirement. -->