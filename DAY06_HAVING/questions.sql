-- Question 1

-- Show cities having more than one customer.
SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;

-- Question 2

-- Show cities where the average age is greater than 27.
SELECT city,
       AVG(age) AS average_age
FROM customers
GROUP BY city
HAVING AVG(age) > 27;

-- Question 3

-- Show customers whose total sales are greater than 3500.
SELECT customer_id,
       SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 3500;

-- Question 4

-- Show customers who placed more than one order.
SELECT customer_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Question 5

-- Show customers whose maximum order amount is greater than 2500.
SELECT customer_id,
       MAX(amount) AS highest_order
FROM orders
GROUP BY customer_id
HAVING MAX(amount) > 2500;

-- Question 6

-- Show cities having exactly two customers.
SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) = 2;

-- Question 7

-- Show customers whose average order amount is greater than 2000.
SELECT customer_id,
       AVG(amount) AS average_order
FROM orders
GROUP BY customer_id
HAVING AVG(amount) > 2000;

-- Question 8

-- Show cities where the oldest customer is older than 30.
SELECT city,
       MAX(age) AS oldest_customer
FROM customers
GROUP BY city
HAVING MAX(age) > 30;