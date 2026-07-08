<!-- LEFT JOIN

What is LEFT JOIN?

A `LEFT JOIN` returns:

- All rows from the left table.
- Matching rows from the right table.
- If no match exists, NULL values are returned for the right table columns.

Syntax:

SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;

Example

SELECT c.customer_name,
       o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

INNER JOIN vs LEFT JOIN:

INNER JOIN:  

Returns only matching rows 
Excludes unmatched rows
Used when only matching data is needed 

LEFT JOIN :

Returns all rows from the left table 
Includes unmatched rows with NULL values 
Used when all records from the left table are required 

Finding Unmatched Records

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

This returns customers who have not placed any orders.

COUNT() with LEFT JOIN

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Use `COUNT(column)` instead of `COUNT(*)` to correctly count matching rows.

SUM() with LEFT JOIN

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Customers without orders will have `NULL` as the total sales.

COALESCE():

`COALESCE()` replaces NULL values with a specified value.

SELECT c.customer_name,
       COALESCE(SUM(o.amount),0) AS total_sales
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Output:

- Customers without orders will show **0** instead of NULL.

Best Practices:

- Join using primary and foreign keys.
- Use table aliases for readability.
- Use `COUNT(column)` with LEFT JOIN.
- Use `COALESCE()` to replace NULL values where appropriate.
- Avoid using `SELECT *` in production queries.

What is LEFT JOIN?

Returns all rows from the left table and matching rows from the right table.

How do you find rows with no matching records?

WHERE right_table.column IS NULL;

Why use COUNT(column) instead of COUNT(*)?

`COUNT(column)` ignores NULL values, while `COUNT(*)` counts every row.

Real-World Uses

- Find customers who never placed an order.
- Show all employees, even those without assigned projects.
- List all products, including products with no sales.
- Data quality checks in ETL pipelines.

Key Takeaways

- LEFT JOIN keeps all rows from the left table.
- Unmatched rows contain NULL values.
- Use `IS NULL` to find unmatched records.
- Use `COALESCE()` to replace NULL values.
- LEFT JOIN is one of the most commonly used joins in SQL and BigQuery. --> -->