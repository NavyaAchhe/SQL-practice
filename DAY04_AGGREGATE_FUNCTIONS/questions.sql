Question 1

Count total customers.

SELECT COUNT(*)
FROM customers;

Question 2

Find average age.

SELECT AVG(age)
FROM customers;

Question 3

Find youngest customer.

SELECT MIN(age)
FROM customers;

Question 4

Find oldest customer.

SELECT MAX(age)
FROM customers;

Question 5

Count distinct cities.


SELECT COUNT(DISTINCT city)
FROM customers;

Question 6

Find total sales.

SELECT SUM(amount)
FROM orders;

Question 7

Find average order amount.

SELECT AVG(amount)
FROM orders;

Question 8

Find highest order.

SELECT MAX(amount)
FROM orders;

Question 9

Find smallest order.

SELECT MIN(amount)
FROM orders;

Question 10

Count orders greater than 2000.

SELECT COUNT(*)
FROM orders
WHERE amount > 2000;