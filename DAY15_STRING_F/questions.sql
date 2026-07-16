-- Question 1
-- Convert all customer names to uppercase.

SELECT customer_name,
       UPPER(customer_name) AS upper_name
FROM customers;

-- Question 2
-- Display customer names in lowercase.

SELECT customer_name,
       LOWER(customer_name) AS lower_name
FROM customers;

-- Question 3
-- Display customer name and city in one column.

-- Example:
-- Navya Achhe - Hyderabad

SELECT CONCAT(customer_name, ' - ', city) AS customer_details
FROM customers;

-- Question 4
-- Display the first 5 characters of every customer name.

SELECT customer_name,
       SUBSTRING(customer_name,1,5) AS first_five_characters
FROM customers;

-- Question 5
-- Find customers whose names start with 'S'.

SELECT *
FROM customers
WHERE customer_name LIKE 'S%';

-- Question 6

-- Display

-- Customer Name (Uppercase)
-- Total Orders
-- Total Sales

-- Sort by Total Sales descending.

SELECT
    UPPER(c.customer_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;

-- Question 7
-- Find customers whose total sales are greater than 3000. Display:
-- Customer Name in UPPERCASE
-- City in lowercase
-- Total Sales
-- Category (Gold/Silver/Bronze)

WITH customer_sales AS (
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    UPPER(c.customer_name) AS customer_name,
    LOWER(c.city) AS city,
    cs.total_sales,
    CASE
        WHEN cs.total_sales >= 5000 THEN 'Gold'
        WHEN cs.total_sales >= 3000 THEN 'Silver'
        ELSE 'Bronze'
    END AS category
FROM customers c
JOIN customer_sales cs
ON c.customer_id = cs.customer_id
WHERE cs.total_sales > 3000;

-- Question 8
-- Find customers who placed more than one order and whose names 
-- start with N. Display the first 5 characters of the customer name and total orders.

SELECT
    SUBSTRING(c.customer_name,1,5) AS short_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_name LIKE 'N%'
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;

-- Question 9
-- Show customer name and city combined in one column,
-- along with total sales, for customers whose sales are above the average customer sales.

WITH customer_sales AS (
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    CONCAT(UPPER(c.customer_name), ' - ', UPPER(c.city)) AS customer_details,
    cs.total_sales
FROM customers c
JOIN customer_sales cs
ON c.customer_id = cs.customer_id
WHERE cs.total_sales > (
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- Question 10
-- Find the top 2 customers by total sales. Display customer name 
-- in uppercase and the last 3 characters of the city.

SELECT
    UPPER(c.customer_name) AS customer_name,
    RIGHT(c.city,3) AS city_code,
    SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name, c.city
ORDER BY total_sales DESC
LIMIT 2;

-- Question 11
-- Add a cleaned display column using TRIM + UPPER.

    SELECT
    UPPER(TRIM(c.customer_name)) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_sales,
    CASE
        WHEN SUM(o.amount) >= 7000 THEN 'Platinum'
        WHEN SUM(o.amount) >= 5000 THEN 'Gold'
        WHEN SUM(o.amount) >= 3000 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_level
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Question 12
-- Find customers whose city ends with i and total sales > 2000.
--  Display customer name with spaces replaced by underscores.

SELECT
    REPLACE(c.customer_name,' ','_') AS customer_name,
    c.city,
    SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.city LIKE '%i'
GROUP BY c.customer_name, c.city
HAVING SUM(o.amount) > 2000;

-- Question 13

-- Display

-- Customer Name
-- Highest Order
-- Lowest Order
-- Average Order
-- name length.         

SELECT
    c.customer_name,
    LENGTH(c.customer_name) AS name_length,
    MAX(o.amount) AS highest_order,
    MIN(o.amount) AS lowest_order,
    AVG(o.amount) AS average_order
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Question 14
-- Display names in uppercase and city in lowercase for customers with no orders.

SELECT
    UPPER(c.customer_name) AS customer_name,
    LOWER(c.city) AS city
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;