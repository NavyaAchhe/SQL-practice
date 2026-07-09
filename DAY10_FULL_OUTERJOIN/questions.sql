-- Question 1
-- Show all customers and all orders.

SELECT c.customer_name,
       o.order_id,
       o.amount
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 2
-- Find customers without orders.

SELECT c.customer_name
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- Question 3
-- Find orders without customers.

SELECT o.order_id,
       o.customer_id
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- Question 4
-- Find all unmatched records.

SELECT c.customer_name,
       o.order_id
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL
   OR o.customer_id IS NULL;

-- Question 5
-- Find total sales for each customer.

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Question 6
-- Replace NULL total sales with 0.

SELECT c.customer_name,
       COALESCE(SUM(o.amount),0) AS total_sales
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Question 7
-- Count orders for every customer.

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Question 8
-- Find customers whose total sales exceed 3000.

SELECT c.customer_name,
       SUM(o.amount) AS total_sales
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > 3000;

-- Question 9
-- Show all records ordered by amount in descending order.

SELECT c.customer_name,
       o.amount
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;

-- Question 10
-- Count the total number of matched records.

SELECT COUNT(*) AS matched_records
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;