<!-- Day 13: Common Table Expressions (CTEs)

What is a CTE?

A Common Table Expression (CTE) is a temporary named result set that exists only during the execution of a SQL query.

A CTE is created using the `WITH` keyword.

Syntax

WITH cte_name AS
(
    SELECT ...
)

SELECT *
FROM cte_name;

Why Use CTEs?

- Makes queries easier to read.
- Breaks complex logic into smaller steps.
- Avoids repeating the same subquery.
- Makes debugging easier.
- Improves query maintainability.

Example

WITH customer_sales AS
(
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales;

Multiple CTEs

WITH customer_sales AS
(
    ...
),

order_count AS
(
    ...
)

SELECT ...

Multiple CTEs are separated by commas.


CTE vs Subquery

Subquery

- Nested inside another query.
- Harder to read for large queries.

CTE

- Named query.
- Easier to read.
- Easier to debug.
- Preferred in production code.

Execution Order

1. WITH
2. FROM
3. JOIN
4. WHERE
5. GROUP BY
6. HAVING
7. SELECT
8. ORDER BY
9. LIMIT

Best Practices

- Use meaningful CTE names.
- Keep each CTE focused on one task.
- Use multiple CTEs for complex transformations.
- Avoid unnecessary CTEs for very simple queries.

What is a CTE?

A temporary named result set created using the `WITH` clause.

Is a CTE stored permanently?

No. It exists only during the execution of the query.

Can one query have multiple CTEs?

Yes.

Why use CTEs instead of subqueries?

Because they improve readability, maintainability, and make complex SQL easier to understand.

Real-World Uses

- ETL pipelines
- Data cleaning
- Reporting
- Dashboard queries
- BigQuery transformations
- Dataform SQLX models

Key Takeaways

- CTEs are temporary result sets.
- Created using the `WITH` keyword.
- Improve readability.
- Can have multiple CTEs in one query.
- Widely used in BigQuery and Data Engineering projects. -->