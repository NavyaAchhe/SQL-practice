<!-- Day 16: Date Functions

What are Date Functions?

Date functions are used to manipulate, compare, calculate, and format dates.

They are heavily used in ETL pipelines, reporting, dashboards, and BigQuery analytics.

Common BigQuery Date Functions

CURRENT_DATE() : Returns today's date 
EXTRACT() : Extracts year, month, day, etc. 
DATE_DIFF() : Difference between two dates 
DATE_ADD() : Adds days, months, or years 
DATE_SUB() : Subtracts days, months, or years 
DATE_TRUNC() : Truncates a date to month, year, etc. 
LAST_DAY() : Returns the last day of the month 
FORMAT_DATE() : Formats a date as text 

Common Examples

Current Date

SELECT CURRENT_DATE();

Extract Month

SELECT EXTRACT(MONTH FROM order_date);

Difference Between Dates

SELECT DATE_DIFF(delivery_date, order_date, DAY);

Add 7 Days

SELECT DATE_ADD(order_date, INTERVAL 7 DAY);

Month Start

SELECT DATE_TRUNC(order_date, MONTH);

Month End

SELECT LAST_DAY(order_date);

Best Practices

- Store dates as DATE or DATETIME, not strings.
- Use CURRENT_DATE() for dynamic queries.
- Use DATE_TRUNC() for monthly reporting.
- Use DATE_DIFF() to measure durations.
- Format dates only for display.

Key Takeaways

- Date functions are used in almost every analytics query.
- BigQuery primarily uses EXTRACT(), DATE_DIFF(), DATE_ADD(), DATE_SUB(), and DATE_TRUNC().
- These functions are essential for reporting, ETL, and dashboard development. -->