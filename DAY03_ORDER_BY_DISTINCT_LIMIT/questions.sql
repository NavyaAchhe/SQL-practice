Question 1

Show customers ordered by age.

SELECT *
FROM customers
ORDER BY age;

Question 2

Show customers ordered by age descending.

SELECT *
FROM customers
ORDER BY age DESC;

Question 3

Show customers ordered by name.

SELECT *
FROM customers
ORDER BY name;

Question 4

Show unique cities.

SELECT DISTINCT city
FROM customers;

Question 5

Show unique ages.

SELECT DISTINCT age
FROM customers;

Question 6

Show the first three customers.

SELECT *
FROM customers
LIMIT 3;

Question 7

Show the oldest two customers.

SELECT *
FROM customers
ORDER BY age DESC
LIMIT 2;

Question 8

Show Hyderabad customers ordered by age descending.

SELECT *
FROM customers
WHERE city='Hyderabad'
ORDER BY age DESC;

Question 9

Show only names ordered alphabetically.

SELECT name
FROM customers
ORDER BY name;

Question 10

Show cities in alphabetical order.

SELECT city
FROM customers
ORDER BY city;