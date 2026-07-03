<!-- Topic 1 - ORDER BY

Imagine your manager says:

Show me customers from oldest to youngest.

Without ORDER BY, SQL does not guarantee the order of the rows.

Syntax
SELECT *
FROM customers
ORDER BY age;

By default,

ORDER BY age;

means

ORDER BY age ASC;

ASC = Ascending

Example 1

Youngest → Oldest

SELECT *
FROM customers
ORDER BY age ASC;
Example 2

Oldest → Youngest

SELECT *
FROM customers
ORDER BY age DESC;

Output starts with:

31
31
28
28
27
25
24
23
Sorting Alphabetically
SELECT *
FROM customers
ORDER BY name;

Output

Amit
Arjun
Kiran
Navya
Neha
Priya
Rahul
Sneha
Sort by Multiple Columns

Suppose you want:

First by city
Then by age
SELECT *
FROM customers
ORDER BY city,
         age;

SQL first sorts by city.

Inside each city it sorts by age.

Example:

Bengaluru

Rahul

Chennai

Arjun
Sneha

Hyderabad

Navya
Neha
Amit
Topic 2 - DISTINCT

Imagine there are 10 million customers.

Many belong to the same city.

Manager asks:

Which cities do we have customers from?

Without DISTINCT:

SELECT city
FROM customers;

Output

Hyderabad

Bengaluru

Chennai

Hyderabad

Pune

Chennai

Hyderabad

Pune

Duplicates.

Using DISTINCT

SELECT DISTINCT city
FROM customers;

Output

Hyderabad

Bengaluru

Chennai

Pune

Duplicates removed.

Another example

Unique ages.

SELECT DISTINCT age
FROM customers;

Output

23

24

25

27

28

31
Topic 3 - LIMIT

Imagine the table has

50 million rows.

You don't want all of them.

You only want the first 5.

SELECT *
FROM customers
LIMIT 5;

Another example

Oldest 3 customers

SELECT *
FROM customers
ORDER BY age DESC
LIMIT 3;

Output

Amit

Kiran

Rahul
Combining Everything

Example

Show the oldest Hyderabad customer.

SELECT *
FROM customers
WHERE city='Hyderabad'
ORDER BY age DESC
LIMIT 1;

This is a very common interview question.

Real BigQuery Example

Suppose you have

sales

with 200 million rows.

Manager asks:

Show me the top 10 highest-value orders.

SELECT *
FROM sales
ORDER BY amount DESC
LIMIT 10;

This is something Data Engineers do almost every day. -->