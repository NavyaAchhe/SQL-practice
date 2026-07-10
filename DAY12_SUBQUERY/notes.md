<!-- Day 12: Subqueries

What is a Subquery?

A subquery is a query written inside another SQL query.

It is also called:

- Inner Query
- Nested Query

The outer query uses the result of the inner query.

Syntax

SELECT columns
FROM table_name
WHERE column_name operator
(
    SELECT column_name
    FROM table_name
);

Types of Subqueries

Single Row Subquery

Returns one value.

Example:

SELECT MAX(amount)
FROM orders;

Used with:

- =
- >
- <
- >=
- <=

Multiple Row Subquery

Returns multiple values.

Example:

SELECT customer_id
FROM orders;

Usually used with:

- IN
- NOT IN
- ANY
- ALL

Example

SELECT *
FROM orders
WHERE amount >
(
    SELECT AVG(amount)
    FROM orders
);

The inner query calculates the average amount.

The outer query returns orders greater than that average.

IN Operator

Checks whether a value exists in the list returned by a subquery.

SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
);

NOT IN Operator

Returns rows whose values are not returned by the subquery.

SELECT *
FROM customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM orders
);

Execution Order

A subquery executes first.

Then the outer query uses the result.

Example:

Step 1

SELECT AVG(amount)
FROM orders;

Step 2

SELECT *
FROM orders
WHERE amount > average_amount;

Best Practices

- Keep subqueries simple.
- Use meaningful formatting.
- Use `IN` for multiple values.
- Use `=` only when the subquery returns one value.
- Use aliases when required.

Common Mistakes

Using = with multiple rows

Incorrect

WHERE customer_id =
(
    SELECT customer_id
    FROM orders
)

If the subquery returns multiple rows, use `IN`.

Correct

WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
)

Real-World Uses

Subqueries are commonly used for:

- Finding top customers
- Comparing with average values
- Sales analysis
- Filtering based on aggregated data
- ETL transformations
- Reporting dashboards

Which query executes first?

The inner query executes first.

When should you use IN?

When the subquery returns multiple values.

When should you use =?

When the subquery returns exactly one value.

Key Takeaways

- A subquery is a query inside another query.
- The inner query runs before the outer query.
- Use `=` for single-row subqueries.
- Use `IN` for multiple-row subqueries.
- Subqueries simplify complex SQL queries. -->