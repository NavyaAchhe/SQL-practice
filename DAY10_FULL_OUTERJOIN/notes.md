<!-- Day 10: FULL OUTER JOIN

What is FULL OUTER JOIN?

A `FULL OUTER JOIN` returns:

- All rows from the left table.
- All rows from the right table.
- Matching rows are combined.
- Non-matching rows contain NULL values for the missing side.

It combines the behavior of a LEFT JOIN and a RIGHT JOIN.

SELECT columns
FROM table1
FULL OUTER JOIN table2
ON table1.column = table2.column;

SELECT c.customer_name,
       o.order_id,
       o.amount
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;

Result

- Matching records appear once.
- Customers without orders appear with NULL order details.
- Orders without customers appear with NULL customer details.

Comparison of JOIN Types

     JOIN         Left Table       Right Table  
------------------------------------------------ 
 INNER JOIN       Matching only  Matching only 
 LEFT JOIN        All rows       Matching rows 
 RIGHT JOIN       Matching rows  All rows      
 FULL OUTER JOIN  All rows       All rows      

Finding Unmatched Records

Customers without orders

SELECT c.customer_name
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

Orders without customers

SELECT o.order_id
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

Aggregate Functions

Count Orders

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Total Sales

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Using COALESCE()

SELECT c.customer_name,
       COALESCE(SUM(o.amount),0) AS total_sales
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

`COALESCE()` replaces NULL with the first non-NULL value.

Execution Order

1. FROM
2. FULL OUTER JOIN
3. ON
4. WHERE
5. GROUP BY
6. HAVING
7. SELECT
8. ORDER BY
9. LIMIT

Best Practices

- Join on primary and foreign keys.
- Use table aliases.
- Select only the columns you need.
- Use COALESCE() when displaying numeric values.
- Use FULL OUTER JOIN mainly for reconciliation and validation tasks.

What is FULL OUTER JOIN?

It returns all rows from both tables, matching rows where possible, and NULLs for unmatched rows.

When should you use FULL OUTER JOIN?

When you need to compare two datasets and identify both matching and non-matching records.

How do you find unmatched records?

WHERE left_table.column IS NULL
   OR right_table.column IS NULL;

Real-World Uses:

- Data reconciliation between source and target systems.
- Comparing old and new datasets.
- ETL validation.
- Data migration verification.
- Identifying orphan records.

Key Takeaways:

- FULL OUTER JOIN keeps every row from both tables.
- Unmatched rows contain NULL values.
- It combines LEFT JOIN and RIGHT JOIN behavior.
- It is widely used for data validation and reconciliation. -->