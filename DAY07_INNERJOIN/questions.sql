Question 1
Show customer names with their order amounts.

SELECT c.customer_name,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

Question 2
Show customer names, cities, and order amounts.

SELECT c.customer_name,
       c.city,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

Question 3
Show orders greater than 2000 with customer names.

SELECT c.customer_name,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > 2000;

Question 4
Find total sales for each customer.

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Question 5
Find customers whose total sales exceed 3000.

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > 3000;

Question 6
Count the number of orders placed by each customer.

SELECT c.customer_name,
       COUNT(*) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Question 7
Find the highest order amount for each customer.

SELECT c.customer_name,
       MAX(o.amount) AS highest_order
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Question 8
Find the average order amount for each customer.

SELECT c.customer_name,
       AVG(o.amount) AS average_order
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Question 9
Show customers ordered by total sales in descending order.

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;

Question 10
Show the top two customers based on total sales.

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 2;