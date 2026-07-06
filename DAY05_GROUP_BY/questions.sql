-- Question 1

-- Count customers in each city.
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Question 2

-- Find the average age in each city.
SELECT city, AVG(age) AS average_age
FROM customers
GROUP BY city;

-- Question 3

-- Find the youngest customer in each city.
SELECT city, MIN(age) AS youngest
FROM customers
GROUP BY city;

-- Question 4

-- Find the oldest customer in each city.
SELECT city, MAX(age) AS oldest
FROM customers
GROUP BY city;

-- Question 5

-- Find total sales for each customer.
SELECT customer_id, SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id;

-- Question 6

-- Find the average order amount for each customer.
SELECT customer_id, AVG(amount) AS average_order
FROM orders
GROUP BY customer_id;

-- Question 7

-- Show cities ordered by the highest customer count.
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- Question 8

-- Find the highest order amount for each customer.
SELECT customer_id, MAX(amount) AS highest_order
FROM orders
GROUP BY customer_id;

-- Question 9

-- Find the lowest order amount for each customer.
SELECT customer_id, MIN(amount) AS lowest_order
FROM orders
GROUP BY customer_id;

-- Question 10

-- Count how many orders each customer placed.
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;