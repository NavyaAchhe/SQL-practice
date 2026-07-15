<!-- Day 14: CASE WHEN

What is CASE WHEN?

`CASE WHEN` is SQL's conditional statement.

It works like an `if-elif-else` statement in programming languages.

Syntax

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE result3
END

How CASE Works

- SQL evaluates conditions from top to bottom.
- The first matching condition is returned.
- Remaining conditions are ignored.
- If none match, the `ELSE` value is returned.
- `ELSE` is optional. If omitted, SQL returns `NULL` when no condition matches.

Example

SELECT amount,
       CASE
           WHEN amount >= 4000 THEN 'High'
           WHEN amount >= 2000 THEN 'Medium'
           ELSE 'Low'
       END AS category
FROM orders;

Uses of CASE

- Categorizing values
- Creating flags
- Assigning grades
- Calculating discounts
- Data transformations
- Dashboard reporting

CASE with Aggregate Functions

SELECT
SUM(
CASE
WHEN amount >= 3000 THEN amount
ELSE 0
END
) AS premium_sales
FROM orders;

CASE with ORDER BY

ORDER BY
CASE
WHEN amount >= 4000 THEN 1
WHEN amount >= 2000 THEN 2
ELSE 3
END;

CASE with GROUP BY

The same CASE expression must usually be repeated in the `GROUP BY` clause (or use a subquery/CTE).

CASE vs WHERE

 CASE :

 Creates new values          
 Returns all rows                     
 Used in SELECT, ORDER BY, GROUP BY     

WHERE:

 Filters rows 
 Returns only matching rows
 Used before GROUP BY

Best Practices

- Write the most specific conditions first.
- Always include an `ELSE` clause when appropriate.
- Use aliases for readability.
- Keep CASE expressions simple.
- Use CTEs if the CASE logic becomes very long.

What is CASE WHEN?

A SQL conditional expression used to return different values based on different conditions.

Does CASE stop after the first match?

Yes.

Is ELSE mandatory?

No, but if omitted and no condition matches, SQL returns `NULL`.

Real-World Uses

- Customer segmentation
- Sales categorization
- Employee grading
- Fraud detection flags
- Dashboard metrics
- ETL transformations

Key Takeaways

- CASE is SQL's version of if-else.
- Conditions are evaluated from top to bottom.
- The first matching condition is returned.
- CASE can be used with SELECT, ORDER BY, GROUP BY, and aggregate functions.
- It is one of the most frequently used SQL features in production. -->