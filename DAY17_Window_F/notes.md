<!-- Day 17: Window Functions 

What are Window Functions?

Window functions perform calculations across a set of related rows while keeping every row in the output.

Unlike GROUP BY, they do not collapse rows.

Syntax

FUNCTION(...) OVER(
    PARTITION BY ...
    ORDER BY ...
)

Components

- OVER() → Defines the window.
- PARTITION BY → Divides rows into groups without collapsing them.
- ORDER BY → Controls calculation order within the window.

Common Window Aggregates

- SUM() OVER()
- AVG() OVER()
- COUNT() OVER()
- MAX() OVER()
- MIN() OVER()

Running Total

SUM(amount) OVER(ORDER BY order_date)

GROUP BY vs Window Functions

- GROUP BY summarizes data into fewer rows.
- Window functions retain all rows and add analytical values.

Real-World Uses

- Customer lifetime value
- Running totals
- Sales analysis
- Financial reports
- Dashboard metrics

Key Takeaways

- Window functions preserve detail rows.
- PARTITION BY groups data without collapsing it.
- ORDER BY inside OVER() enables cumulative calculations. -->