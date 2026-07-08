<!-- Day 9: RIGHT JOIN

What is RIGHT JOIN?

A `RIGHT JOIN` returns:

- All rows from the right table.
- Matching rows from the left table.
- If no match exists, NULL values are returned for the left table columns.

Syntax

SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;

Example

SELECT c.customer_name,
       o.order_id,
       o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

How RIGHT JOIN Works

- Every row from the **right table** appears in the result.
- If a matching row exists in the left table, data from both tables is returned.
- If no matching row exists, columns from the left table are filled with `NULL`.

Comparing JOIN Types

INNER JOIN : Only matching rows 
LEFT JOIN  : All rows from the left table 
RIGHT JOIN : All rows from the right table 

Finding Unmatched Rows

SELECT o.order_id,
       o.customer_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

This finds orders that do not have a matching customer.

Aggregate Functions with RIGHT JOIN

Count Orders

SELECT o.customer_id,
       COUNT(o.order_id) AS total_orders
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id;

Total Sales

SELECT o.customer_id,
       SUM(o.amount) AS total_sales
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id;

Execution Order

1. FROM
2. RIGHT JOIN
3. ON
4. WHERE
5. GROUP BY
6. HAVING
7. SELECT
8. ORDER BY
9. LIMIT

Best Practices:

- Join using primary and foreign keys.
- Use table aliases for readability.
- Select only the required columns.
- Use RIGHT JOIN only when it makes the query clearer.
- In many production systems, developers prefer LEFT JOIN by swapping the table order.

Common Mistakes

Forgetting the ON clause

Incorrect:

SELECT *
FROM customers
RIGHT JOIN orders;

Always specify the join condition.

Joining on non-key columns

Avoid:

ON c.customer_name = o.customer_name

Prefer:

ON c.customer_id = o.customer_id

Real-World Uses

- Find transactions with missing customer records.
- Identify orphan records during ETL.
- Perform data validation between source and target systems.
- Detect missing reference data.

What is the difference between LEFT JOIN and RIGHT JOIN?

- LEFT JOIN returns all rows from the left table.
- RIGHT JOIN returns all rows from the right table.

Can RIGHT JOIN be replaced with LEFT JOIN?

Yes.

Swap the table positions and use a LEFT JOIN. This is the preferred approach in many real-world SQL codebases.

How do you find unmatched rows using RIGHT JOIN?

WHERE left_table.column IS NULL;

Key Takeaways

- RIGHT JOIN keeps every row from the right table.
- Unmatched rows from the left table appear as NULL.
- RIGHT JOIN is less common than LEFT JOIN but is important to understand.
- Most RIGHT JOIN queries can be rewritten as LEFT JOIN by swapping the tables.