-- Question 1
-- The finance team wants to know the total company revenue, but they also want to see every individual order.

-- Display:
-- Order ID
-- Customer ID
-- Amount
-- Total Company Revenue

SELECT
    order_id,
    customer_id,
    amount,
    SUM(amount) OVER() AS company_revenue
FROM orders;

-- Question 2
-- For every order, display:

-- Order ID
-- Customer ID
-- Amount
-- Total amount spent by that customer.

SELECT
    order_id,
    customer_id,
    amount,
    SUM(amount) OVER(PARTITION BY customer_id) AS customer_total_sales
FROM orders;

-- Question 3
-- Display:

-- Order ID
-- Order Date
-- Amount
-- Running Total Revenue

SELECT
    order_id,
    order_date,
    amount,
    SUM(amount)
    OVER(
        ORDER BY order_date, order_id
    ) AS running_revenue
FROM orders;

-- Why order_id also?
-- If two orders have the same order_date, adding order_id ensures a deterministic running total.

-- Question 4
-- Display:

-- Order ID
-- Customer ID
-- Amount
-- Average order amount for that customer.

SELECT
    order_id,
    customer_id,
    amount,
    AVG(amount)
    OVER(PARTITION BY customer_id) AS avg_order
FROM orders;

-- Question 5

-- Display:
-- Order ID
-- Customer ID
-- Amount
-- Number of orders placed by each customer.

SELECT
    order_id,
    customer_id,
    amount,
    COUNT(*)
    OVER(PARTITION BY customer_id) AS total_orders
FROM orders;

-- Question 6
-- The business wants a report showing:

-- Customer Name (UPPERCASE)
-- Order Date
-- Amount
-- Customer Lifetime Sales
-- Sort by customer name.

SELECT
    UPPER(c.customer_name) AS customer_name,
    o.order_date,
    o.amount,
    SUM(o.amount)
    OVER(PARTITION BY c.customer_id) AS lifetime_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_name;

-- Question 7
-- Display

-- Customer Name
-- Month
-- Order Amount
-- Running Monthly Revenue

SELECT
    c.customer_name,
    DATE_TRUNC(o.order_date, MONTH) AS month,
    o.amount,
    SUM(o.amount)
    OVER(
        PARTITION BY DATE_TRUNC(o.order_date, MONTH)
        ORDER BY o.order_date, o.order_id
    ) AS running_monthly_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 8
-- The marketing team wants to classify customers.

-- Display:

-- Customer Name
-- Order Amount
-- Customer Total Sales
-- Category
-- Gold ≥5000
-- Silver ≥3000
-- Bronze Otherwise

SELECT
    c.customer_name,
    o.amount,
    SUM(o.amount)
    OVER(PARTITION BY c.customer_id) AS total_sales,
    CASE
        WHEN SUM(o.amount)
             OVER(PARTITION BY c.customer_id) >= 5000
            THEN 'Gold'

        WHEN SUM(o.amount)
             OVER(PARTITION BY c.customer_id) >= 3000
            THEN 'Silver'

        ELSE 'Bronze'
    END AS customer_category
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 9
-- Display:

-- Customer Name
-- Order Date
-- Delivery Days
-- Average Delivery Days for that customer

SELECT
    c.customer_name,
    o.order_date,
    DATE_DIFF(o.delivery_date, o.order_date, DAY) AS delivery_days,
    AVG(
        DATE_DIFF(o.delivery_date, o.order_date, DAY)
    ) OVER(PARTITION BY c.customer_id)
    AS avg_delivery_days
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 10

-- Display:

-- Customer Name
-- City (UPPERCASE)
-- Order Amount
-- Company Average Order Amount

SELECT
    c.customer_name,
    UPPER(c.city) AS city,
    o.amount,
    AVG(o.amount)
    OVER() AS company_avg_order
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 11
-- Display:

-- Customer Name
-- Order Date
-- Order Amount
-- Running Sales for that Customer

SELECT
    c.customer_name,
    o.order_date,
    o.amount,
    SUM(o.amount)
    OVER(
        PARTITION BY c.customer_id
        ORDER BY o.order_date, o.order_id
    ) AS running_customer_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 12
-- Display:

-- Customer Name
-- Order Amount
-- Highest Order by that Customer
-- Lowest Order by that Customer

SELECT
    c.customer_name,
    o.amount,
    MAX(o.amount)
    OVER(PARTITION BY c.customer_id) AS highest_order,
    MIN(o.amount)
    OVER(PARTITION BY c.customer_id) AS lowest_order
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 13
-- Display:

-- Customer Name
-- Total Orders
-- Total Sales
-- Order Amount

SELECT
    c.customer_name,
    COUNT(*)
    OVER(PARTITION BY c.customer_id) AS total_orders,
    SUM(o.amount)
    OVER(PARTITION BY c.customer_id) AS total_sales,
    o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 14
-- The sales team wants to know how much each order contributes to the customer's total sales.

-- Display:

-- Customer Name
-- Order Amount
-- Customer Total Sales
-- Contribution Percentage

SELECT
    c.customer_name,
    o.amount,
    SUM(o.amount)
    OVER(PARTITION BY c.customer_id) AS total_sales,

    ROUND(
        (o.amount * 100.0)
        /
        SUM(o.amount)
        OVER(PARTITION BY c.customer_id),
        2
    ) AS contribution_percentage
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 15 (Business Report)

-- Generate a report showing:

-- Customer Name (UPPERCASE)
-- Order Date
-- Order Amount
-- Running Customer Sales
-- Customer Lifetime Sales
-- Average Customer Order
-- Customer Category

-- Rules

-- Platinum ≥7000
-- Gold ≥5000
-- Silver ≥3000
-- Bronze Otherwise

SELECT
    UPPER(c.customer_name) AS customer_name,

    o.order_date,

    o.amount,

    SUM(o.amount)
    OVER(
        PARTITION BY c.customer_id
        ORDER BY o.order_date, o.order_id
    ) AS running_sales,

    SUM(o.amount)
    OVER(
        PARTITION BY c.customer_id
    ) AS lifetime_sales,

    AVG(o.amount)
    OVER(
        PARTITION BY c.customer_id
    ) AS average_order,

    CASE

        WHEN SUM(o.amount)
             OVER(PARTITION BY c.customer_id) >=7000
             THEN 'Platinum'

        WHEN SUM(o.amount)
             OVER(PARTITION BY c.customer_id) >=5000
             THEN 'Gold'

        WHEN SUM(o.amount)
             OVER(PARTITION BY c.customer_id) >=3000
             THEN 'Silver'

        ELSE 'Bronze'

    END AS customer_category

FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id

ORDER BY customer_name,
         o.order_date;