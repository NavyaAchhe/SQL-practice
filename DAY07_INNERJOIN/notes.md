<!-- # Week 2 - Day 1: INNER JOIN

What is an INNER JOIN?

An `INNER JOIN` combines rows from two or more tables based on a matching column.

It returns only the rows that have matching values in both tables.

Rows without a match are excluded from the result.

Why do we use INNER JOIN?

In a relational database, data is usually stored in multiple tables.

For example:

customers

customer_id    customer_name     city 
1                   Navya       Hyderabad
2                   Rahul       Bengaluru
3                   Sneha       Chennai
4                   Amit        Pune

orders

order_id   customer_id   amount 
101             1           1500
102             2           3000
103             1           2500
104             3           1000

The `orders` table contains only `customer_id`.

To display the customer's name along with the order details, we join the `customers` and `orders` tables.

Syntax

SELECT column1, column2
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;

Example 1 - Customer Name and Order Amount

SELECT c.customer_name,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

Output:

customer_name       amount 
 Navya               1500
 Rahul               3000
 Navya               2500
 Sneha               1000

Example 2 - Customer Name, City, and Order Amount

SELECT c.customer_name,
       c.city,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

Example 3 - Orders Greater Than 2000

SELECT c.customer_name,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > 2000;

Example 4 - Total Sales by Customer

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Example 5 - Customers with Total Sales Greater Than 3000

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > 3000;

Table Aliases

Aliases make SQL queries shorter and easier to read.

Without aliases:

SELECT customers.customer_name,
       orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

With aliases:

SELECT c.customer_name,
       o.amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

Using aliases is considered a best practice in professional SQL code.

JOIN Condition

The `ON` clause specifies how the tables are related.

Example:

ON c.customer_id = o.customer_id

Here, `customer_id` is the common column between the two tables.

Primary Key vs Foreign Key

Primary Key: A column that uniquely identifies each row in a table.

Example:

customers.customer_id

Characteristics:

- Unique values
- Cannot be NULL

Foreign Key

A column in another table that references the primary key.

Example:

orders.customer_id

It creates a relationship between the two tables.

INNER JOIN Result

An INNER JOIN returns only matching rows.

Example:

customers             orders

1                       1  
2                       2  
3                       3  
4                       5  

Result:

1
2
3

- Customer 4 is excluded because there is no matching order.
- Order with customer_id = 5 is excluded because there is no matching customer.

INNER JOIN with Aggregate Functions

Aggregate functions work after the join.

Example:

SELECT c.customer_name,
       COUNT(*) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

INNER JOIN with ORDER BY

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;

INNER JOIN with HAVING

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > 3000;

Best Practices

- Always join using keys (Primary Key ↔ Foreign Key).
- Use table aliases (`c`, `o`) for better readability.
- Select only the required columns instead of using `SELECT *`.
- Format SQL queries with proper indentation.
- Use meaningful aliases for calculated columns.

Common Mistakes

Incorrect Join Condition

ON c.customer_name = o.customer_name

Avoid joining on names because names may not be unique.

Correct:

ON c.customer_id = o.customer_id

Forgetting the ON Clause

SELECT *
FROM customers
INNER JOIN orders;

This creates a Cartesian product (every row from one table paired with every row from the other), which is usually not what you want.

Real-World Use Cases

INNER JOIN is commonly used to:

- Show customer names with their orders.
- Display employee names with department details.
- Generate sales reports.
- Create analytics dashboards.
- Build ETL pipelines.
- Combine multiple datasets in BigQuery.

What is an INNER JOIN?

An INNER JOIN returns only the rows that have matching values in both tables.

What happens to unmatched rows?

Unmatched rows are excluded from the result.

Why do we use aliases?

- Shorter queries
- Better readability
- Avoid ambiguity when multiple tables have the same column names

Can we use WHERE after INNER JOIN?

Yes.

Example:

SELECT c.customer_name,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > 2000;

Can we use GROUP BY after INNER JOIN?

Yes.

Example:
SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Key Takeaways:

- INNER JOIN combines matching rows from two tables.
- Unmatched rows are not included.
- Always join using related keys.
- Use aliases for cleaner and more readable SQL.
- INNER JOIN is one of the most important SQL concepts for Data Engineering and interviews. -->