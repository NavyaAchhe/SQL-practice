<!-- Day 15: String Functions

What are String Functions?

String functions manipulate text values in SQL.

Common uses:

- Convert case
- Extract text
- Find length
- Replace text
- Remove spaces
- Join strings
- Search patterns

Common String Functions

| Function | Purpose |
|----------|---------|
| UPPER() | Converts text to uppercase |
| LOWER() | Converts text to lowercase |
| LENGTH() | Returns number of characters |
| CONCAT() | Joins strings |
| SUBSTRING() | Extracts part of a string |
| LEFT() | Returns left characters |
| RIGHT() | Returns right characters |
| TRIM() | Removes spaces |
| REPLACE() | Replaces text |
| POSITION() | Finds character position |

LIKE Wildcards

`%` → Zero or more characters

Example:

WHERE customer_name LIKE 'N%'

`_` → Exactly one character

Example:

WHERE customer_name LIKE '_a%'

Combining Functions

SELECT UPPER(TRIM(customer_name))
FROM customers;

Best Practices

- Use `TRIM()` before comparisons if data may contain extra spaces.
- Use `UPPER()` or `LOWER()` for case-insensitive comparisons.
- Use `CONCAT()` instead of manually joining strings when supported.
- Avoid applying functions on indexed columns in very large tables if performance is critical.

Difference between LENGTH() and LEN()?

- `LENGTH()` → BigQuery, MySQL, PostgreSQL
- `LEN()` → SQL Server

Difference between `%` and `_` in LIKE?

- `%` matches any number of characters.
- `_` matches exactly one character.

What does TRIM() do?

Removes leading and trailing spaces.

Real-World Uses

- Cleaning customer names.
- Standardizing city names.
- Formatting addresses.
- Searching text fields.
- Building display columns.
- Data cleaning in ETL pipelines.

Key Takeaways

- String functions are essential for text processing.
- LIKE is used for pattern matching.
- Functions can be combined to perform complex transformations.
- These functions are heavily used in BigQuery and Data Engineering workflows.