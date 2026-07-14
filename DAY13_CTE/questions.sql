-- Question 1
-- Create a CTE that calculates total sales for each customer.

WITH customer_sales AS
(
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales;

-- Question 2
-- Show customer names along with their total sales.

WITH customer_sales AS
(
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT c.customer_name,
       cs.total_sales
FROM customer_sales cs
INNER JOIN customers c
ON cs.customer_id = c.customer_id;

-- Question 3
-- Find customers whose total sales are greater than 3000.

WITH customer_sales AS
(
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales
WHERE total_sales > 3000;

-- Question 4
-- Create a CTE that counts orders for each customer.

WITH order_count AS
(
    SELECT customer_id,
           COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM order_count;

-- Question 5
-- Find customers with more than one order.

WITH order_count AS
(
    SELECT customer_id,
           COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM order_count
WHERE total_orders > 1;

-- Question 6
-- Create a CTE that finds the highest order amount for each customer.

WITH highest_order AS
(
    SELECT customer_id,
           MAX(amount) AS highest_amount
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM highest_order;

-- Question 7
-- Show only customers whose highest order amount is greater than 2000.

WITH highest_order AS
(
    SELECT customer_id,
           MAX(amount) AS highest_amount
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM highest_order
WHERE highest_amount > 2000;

-- Question 8
-- Create two CTEs:
-- Total Sales
-- Total Orders
-- Join them together.

WITH customer_sales AS
(
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
),
order_count AS
(
    SELECT customer_id,
           COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT cs.customer_id,
       cs.total_sales,
       oc.total_orders
FROM customer_sales cs
INNER JOIN order_count oc
ON cs.customer_id = oc.customer_id;

-- Question 9
-- Find customers whose total orders equal 2.

WITH order_count AS
(
    SELECT customer_id,
           COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM order_count
WHERE total_orders = 2;

-- Question 10
-- Display customer names, total sales, and total orders.

WITH customer_sales AS
(
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
),
order_count AS
(
    SELECT customer_id,
           COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT c.customer_name,
       cs.total_sales,
       oc.total_orders
FROM customers c
INNER JOIN customer_sales cs
ON c.customer_id = cs.customer_id
INNER JOIN order_count oc
ON c.customer_id = oc.customer_id;