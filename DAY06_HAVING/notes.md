<!-- Day 6 - HAVING

What is HAVING?

The `HAVING` clause is used to filter **groups** after the `GROUP BY` clause has been applied.

Unlike `WHERE`, which filters individual rows, `HAVING` filters the grouped results.

Why do we use HAVING?

Suppose we want to find cities that have more than one customer.

First, SQL groups the rows by city.

Then, `HAVING` filters those groups based on the aggregate value.

Syntax

SELECT column_name,
       aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING aggregate_function(column_name) condition;

Example 1 - Cities with more than one customer

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;
Output:

 city        total_customers 
 Hyderabad        3 
 Chennai          2 
 Pune             2 

Example 2 - Cities with average age greater than 26

SELECT city,
       AVG(age) AS average_age
FROM customers
GROUP BY city
HAVING AVG(age) > 26;

Example 3 - Customers whose total sales are greater than 3000

SELECT customer_id,
       SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 3000;

WHERE vs HAVING

WHERE:

- Filters individual rows.
- Executes before `GROUP BY`.
- Cannot use aggregate functions like `COUNT()`, `SUM()`, `AVG()`, etc.

Example:

SELECT *
FROM customers
WHERE city = 'Hyderabad';

HAVING:

- Filters grouped data.
- Executes after `GROUP BY`.
- Can use aggregate functions.

Example:

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;
Execution Order

A simplified SQL execution order is:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT

Understanding this order helps explain why `WHERE` cannot use aggregate functions, while `HAVING` can.

WHERE + GROUP BY + HAVING

These clauses are often used together.

Example:

SELECT city,
       AVG(age) AS average_age
FROM customers
WHERE city = 'Hyderabad'
GROUP BY city
HAVING AVG(age) > 25;

Explanation:

- `WHERE` filters only Hyderabad customers.
- `GROUP BY` creates the group.
- `HAVING` filters the group based on the average age.

Common Aggregate Functions Used with HAVING

- `COUNT()` ,`SUM()`, `AVG()`, `MIN()`, `MAX()`

Example:

SELECT customer_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 2;

Best Practices

- Use meaningful aliases with `AS`.

Example:

SUM(amount) AS total_sales

- Format SQL with proper indentation.
- Keep `WHERE` and `HAVING` responsibilities separate.
- Use `HAVING` only when filtering aggregated results.

Important Rules

Rule 1

`WHERE` cannot use aggregate functions.

Incorrect

SELECT city,
       COUNT(*)
FROM customers
WHERE COUNT(*) > 1
GROUP BY city;

Rule 2

Use `HAVING` for aggregate conditions.

Correct

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;

Rule 3

Aliases can be used in `ORDER BY`.

Example:

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

Rule 4

For better compatibility (especially with BigQuery), use the aggregate function instead of the alias in `HAVING`.

Recommended:

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;

Instead of: HAVING total_customers > 1;

Interview Questions:

What is the difference between WHERE and HAVING?

WHERE:
- Filters rows.
- Executes before grouping.
- Cannot use aggregate functions.

HAVING:
- Filters groups.
- Executes after grouping.
- Can use aggregate functions.

Can HAVING be used without GROUP BY?

Yes. Some databases allow `HAVING` without `GROUP BY` when filtering aggregate results over the entire table. However, in most real-world queries, `HAVING` is 
used together with `GROUP BY`.

Can HAVING use COUNT(), SUM(), AVG(), MIN(), and MAX()?

Yes.

Can aliases be used in ORDER BY?

Yes.

Example:

SELECT customer_id,
       SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id
ORDER BY total_sales DESC;

Can aliases be used in HAVING?

It depends on the database.

- MySQL often allows it.
- BigQuery, PostgreSQL, and SQL Server generally require the aggregate expression instead of the alias.

For portability, use:

HAVING COUNT(*) > 1

instead of: HAVING total_customers > 1

Real-World Uses

The `HAVING` clause is commonly used in:

- Sales reports
- Customer analytics
- Revenue analysis
- Dashboard queries
- ETL pipelines
- BigQuery reporting

Examples:

- Cities with more than 100 customers.
- Products with total sales greater than ₹1,00,000.
- Customers who placed more than 10 orders.
- Departments with an average salary above ₹50,000.

Key Takeaways

- `WHERE` filters rows.
- `GROUP BY` creates groups.
- `HAVING` filters groups.
- `HAVING` is used with aggregate functions.
- `ORDER BY` can use aliases.
- Understanding the execution order of SQL is essential for writing correct queries. 