# Day 1 - SELECT and FROM

# What is SQL?

SQL (Structured Query Language) is used to communicate with relational databases.

It helps us:

- Retrieve data
- Insert data
- Update data
- Delete data

---

# SELECT

SELECT is used to retrieve data from a table.

Example:

```sql
SELECT *
FROM customers;
```

This returns all columns.

---

# FROM

FROM tells SQL which table to read.

Example:

```sql
SELECT name
FROM customers;
```

SQL reads the **name** column from the **customers** table.

---

# SELECT *

Returns every column.

Useful while learning.

Avoid using it unnecessarily in BigQuery because it scans more data and can increase query cost.

---

# Selecting Specific Columns

Instead of

```sql
SELECT *
```

prefer

```sql
SELECT customer_id,
       name
```

This improves performance and reduces the amount of data read.

---

# Key Points

- SQL is not case-sensitive.
- Use uppercase for SQL keywords as a best practice.
- SELECT retrieves data.
- FROM specifies the table.