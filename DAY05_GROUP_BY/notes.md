<!-- Day 5 - GROUP BY

What is GROUP BY?

The `GROUP BY` clause is used to group rows that have the same values in one or more columns. It is commonly used with aggregate functions to calculate summaries for each group.

Why do we use GROUP BY?

Without `GROUP BY`, aggregate functions return a single result for the entire table.

Example:

SELECT COUNT(*)
FROM customers;

Output:8

With `GROUP BY`, SQL returns one result for each group.

Example:

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city;

Output:

 city       total_customers 
 Hyderabad       3 
 Bengaluru       1
 Chennai         2
 Pune            2

Syntax:
SELECT column_name,
       aggregate_function(column_name)
FROM table_name
GROUP BY column_name;
Aggregate Functions commonly used with GROUP BY

- `COUNT()` → Counts rows
- `SUM()` → Adds values
- `AVG()` → Calculates average
- `MIN()` → Finds the smallest value
- `MAX()` → Finds the largest value

Example 1 - Count customers in each city

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city;

Example 2 - Average age by city

SELECT city,
       AVG(age) AS average_age
FROM customers
GROUP BY city;

Example 3 - Total sales for each customer

SELECT customer_id,
       SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id;
GROUP BY with ORDER BY

The grouped results can be sorted using `ORDER BY`.

Example:

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;
Rules of GROUP BY

Every column in the `SELECT` statement must satisfy one of these conditions:

- It must be included in the `GROUP BY` clause.
- OR it must be inside an aggregate function.

Correct:

SELECT city,
       COUNT(*)
FROM customers
GROUP BY city;

Incorrect:

SELECT city,
       name
FROM customers
GROUP BY city;

Reason: SQL does not know which `name` to display for a city that has multiple customers.

-GROUP BY vs DISTINCT

DISTINCT

Returns unique values.

SELECT DISTINCT city
FROM customers;

Output:

Hyderabad
Bengaluru
Chennai
Pune

- GROUP BY

Groups rows and allows aggregate calculations.

SELECT city,
       COUNT(*)
FROM customers
GROUP BY city;
GROUP BY in Real-World Projects

Examples:

- Number of customers in each city
- Total sales by customer
- Average salary by department
- Orders per product category
- Revenue by month

GROUP BY is one of the most frequently used clauses in reporting, ETL pipelines, dashboards, and BigQuery analytics.

Best Practices

- Use meaningful aliases with `AS`.

Example:

COUNT(*) AS total_customers

instead of COUNT(*)

- Format SQL with proper indentation.
- Use uppercase for SQL keywords.
- Group only by the columns needed.

What is GROUP BY?

GROUP BY groups rows with the same values together so aggregate functions can be applied to each group.

-Can GROUP BY be used without aggregate functions?
Yes.

Example:

SELECT city
FROM customers
GROUP BY city;

This returns unique city names.

-Can we use ORDER BY after GROUP BY?

Yes.

Example:

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

Difference between WHERE and GROUP BY

- `WHERE` filters individual rows before grouping.
- `GROUP BY` groups rows for aggregate calculations.

Key Takeaways

- `GROUP BY` creates groups of rows with the same values.
- It is usually used with aggregate functions.
- Every selected column must either be grouped or aggregated.
- `ORDER BY` can sort grouped results.
- `GROUP BY` is heavily used in Data Engineering, reporting, and BigQuery. --> 