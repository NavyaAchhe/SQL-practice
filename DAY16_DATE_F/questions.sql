-- Question 1
-- Display the following for every order:

-- order_id
-- order_date
-- Year
-- Month
-- Day
-- Concepts
-- EXTRACT()

SELECT
    order_id,
    order_date,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(DAY FROM order_date) AS order_day
FROM orders;

-- Question 2

-- Display

-- order_id
-- order_date
-- delivery_date
-- Number of delivery days
-- Concepts
-- DATE_DIFF()

SELECT
    order_id,
    order_date,
    delivery_date,
    DATE_DIFF(delivery_date, order_date, DAY) AS delivery_days
FROM orders;

-- Question 3
-- Display

-- order_date
-- Expected Follow-up Date (7 days after order)
-- Concepts
-- DATE_ADD()

SELECT
    order_date,
    DATE_ADD(order_date, INTERVAL 7 DAY) AS follow_up_date
FROM orders;

-- Question 4
-- Display

-- order_date
-- Month Start
-- Month End
-- Concepts
-- DATE_TRUNC()
-- LAST_DAY()

SELECT
    order_date,
    DATE_TRUNC(order_date, MONTH) AS month_start,
    LAST_DAY(order_date) AS month_end
FROM orders;

-- Question 5
-- Display the order date in the format:

-- 21-07-2026
-- Concepts
-- FORMAT_DATE()

SELECT
    order_id,
    FORMAT_DATE('%d-%m-%Y', order_date) AS formatted_date
FROM orders;

-- Question 6
-- Display

-- Customer Name (UPPERCASE)
-- Order Date
-- Delivery Days
-- Category

-- Fast Delivery → ≤5 days
-- Slow Delivery → >5 days

-- Sort by delivery days.

SELECT
    UPPER(c.customer_name) AS customer_name,
    o.order_date,
    DATE_DIFF(o.delivery_date, o.order_date, DAY) AS delivery_days,
    CASE
        WHEN DATE_DIFF(o.delivery_date, o.order_date, DAY) <= 5
            THEN 'Fast Delivery'
        ELSE 'Slow Delivery'
    END AS delivery_category
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY delivery_days;

-- Question 7
-- Display

-- Customer Name
-- Order Month
-- Total Sales
-- Only include customers whose total sales are greater than 3000.

SELECT
    c.customer_name,
    EXTRACT(MONTH FROM o.order_date) AS order_month,
    SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY
    c.customer_name,
    EXTRACT(MONTH FROM o.order_date)
HAVING SUM(o.amount) > 3000;

-- Question 8
-- Find customers who placed orders in July.

-- Display
-- Customer Name
-- City (UPPERCASE)
-- Order Date

SELECT
    c.customer_name,
    UPPER(c.city) AS city,
    o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE EXTRACT(MONTH FROM o.order_date) = 7;

-- Question 9
-- Find customers whose total sales are greater than the average customer sales.

-- Display
-- Customer Name
-- Total Sales
-- Last Order Date

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(amount) AS total_sales,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales,
    cs.last_order_date
FROM customers c
JOIN customer_sales cs
ON c.customer_id = cs.customer_id
WHERE cs.total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- Question 10
-- Display

-- Customer Name
-- Total Orders
-- First Order Date
-- Latest Order Date

SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS latest_order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Question 11
-- Find customers who ordered in the last 60 days.

-- Display
-- Customer Name
-- Order Date
-- Days Since Order

SELECT
    c.customer_name,
    o.order_date,
    DATE_DIFF(CURRENT_DATE(), o.order_date, DAY) AS days_since_order
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY);

-- Question 12
-- Display

-- Customer Name
-- Month
-- Total Sales
-- Customer Level

-- Rules
-- Gold ≥5000
-- Silver ≥3000
-- Bronze Otherwise

SELECT
    c.customer_name,
    DATE_TRUNC(o.order_date, MONTH) AS month,
    SUM(o.amount) AS total_sales,
    CASE
        WHEN SUM(o.amount) >= 5000 THEN 'Gold'
        WHEN SUM(o.amount) >= 3000 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_level
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY
    c.customer_name,
    DATE_TRUNC(o.order_date, MONTH);

-- Question 13
-- Display

-- Customer Name (UPPERCASE)
-- Month Name (Number is fine using EXTRACT)
-- Highest Order
-- Lowest Order
-- Average Order

SELECT
    UPPER(c.customer_name) AS customer_name,
    EXTRACT(MONTH FROM o.order_date) AS order_month,
    MAX(o.amount) AS highest_order,
    MIN(o.amount) AS lowest_order,
    AVG(o.amount) AS average_order
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY
    c.customer_name,
    EXTRACT(MONTH FROM o.order_date);

-- Question 14
-- Find customers who have never placed an order.

-- Display
-- Customer Name (UPPERCASE)
-- Today's Date

SELECT
    UPPER(c.customer_name) AS customer_name,
    CURRENT_DATE() AS today
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- Question 15
-- Find the Top 3 customers by total sales.

-- Display
-- Customer Name
-- Total Sales
-- Last Order Date

SELECT
    c.customer_name,
    SUM(o.amount) AS total_sales,
    MAX(o.order_date) AS last_order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 3;

--Question 16
-- Generate a monthly sales report showing:

-- Month
-- Total Orders
-- Total Sales
-- Average Order Value

-- Sort by month.

SELECT
    DATE_TRUNC(order_date, MONTH) AS month,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_sales,
    AVG(amount) AS average_order_value
FROM orders
GROUP BY DATE_TRUNC(order_date, MONTH)
ORDER BY month;

--Question 17
-- Generate a customer performance report showing:

-- Customer Name (UPPERCASE)
-- First Order Date
-- Latest Order Date
-- Total Orders
-- Total Sales
-- Highest Order
-- Lowest Order
-- Average Order
-- Customer Category

-- Rules:

-- Platinum ≥7000
-- Gold ≥5000
-- Silver ≥3000
-- Bronze Otherwise

-- Sort by:

-- Total Sales DESC
-- Customer Name ASC

WITH customer_summary AS
(
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS latest_order_date,
        COUNT(order_id) AS total_orders,
        SUM(amount) AS total_sales,
        MAX(amount) AS highest_order,
        MIN(amount) AS lowest_order,
        AVG(amount) AS average_order
    FROM orders
    GROUP BY customer_id
)

SELECT
    UPPER(c.customer_name) AS customer_name,
    cs.first_order_date,
    cs.latest_order_date,
    cs.total_orders,
    cs.total_sales,
    cs.highest_order,
    cs.lowest_order,
    cs.average_order,
    CASE
        WHEN cs.total_sales >= 7000 THEN 'Platinum'
        WHEN cs.total_sales >= 5000 THEN 'Gold'
        WHEN cs.total_sales >= 3000 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_category
FROM customers c
JOIN customer_summary cs
ON c.customer_id = cs.customer_id
ORDER BY
    cs.total_sales DESC,
    c.customer_name ASC;