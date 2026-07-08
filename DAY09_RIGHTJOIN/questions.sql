Question 1
Show all orders with customer names.

SELECT c.customer_name,
       o.order_id,
       o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

Question 2
Find orders that do not have a matching customer.

SELECT o.order_id,
       o.customer_id,
       o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

Question 3
Show customer names, order IDs, and order amounts.

SELECT c.customer_name,
       o.order_id,
       o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

Question 4
Find total sales by customer ID.

SELECT o.customer_id,
       SUM(o.amount) AS total_sales
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id;

Question 5
Find customers (or NULL) whose total sales exceed 3000.

SELECT o.customer_id,
       SUM(o.amount) AS total_sales
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id
HAVING SUM(o.amount) > 3000;

Question 6
Count the number of orders for each customer ID.

SELECT o.customer_id,
       COUNT(o.order_id) AS total_orders
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id;

Question 7
Show orders greater than 1500.

SELECT c.customer_name,
       o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > 1500;

Question 8
Show the top three customer IDs based on total sales.

SELECT o.customer_id,
       SUM(o.amount) AS total_sales
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id
ORDER BY total_sales DESC
LIMIT 3;

Question 9
Find the highest order amount for each customer ID.

SELECT o.customer_id,
       MAX(o.amount) AS highest_order
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id;

Question 10
Find the average order amount for each customer ID.

SELECT o.customer_id,
       AVG(o.amount) AS average_order
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id;