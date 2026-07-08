Question 1
Show all customers with their order amounts.

SELECT c.customer_name,
       o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

Question 2
Find customers who have not placed any orders.

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

Question 3
Count the number of orders placed by each customer.

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Question 4
Find the total sales for each customer.

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Question 5
Replace NULL total sales with 0.

SELECT c.customer_name,
       COALESCE(SUM(o.amount),0) AS total_sales
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

Question 6
Find customers whose total sales exceed 3000.

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > 3000;

Question 7
Show customers ordered by total sales in descending order.

SELECT c.customer_name,
       COALESCE(SUM(o.amount),0) AS total_sales
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;

Question 8
Find customers who placed exactly one order.

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) = 1;

Question 9
Find customers with no orders.

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

Question 10
Show the top two customers based on total sales.

SELECT c.customer_name,
       COALESCE(SUM(o.amount),0) AS total_sales
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 2;