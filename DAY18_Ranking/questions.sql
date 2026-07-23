-- Question 1
-- The sales manager wants to assign a unique position to every order based on the order amount (highest amount gets position 1).
-- Display:

-- Order ID
-- Customer ID
-- Amount
-- Position

SELECT
    order_id,
    customer_id,
    amount,
    ROW_NUMBER() OVER(
        ORDER BY amount DESC
    ) AS position
FROM orders;

-- Question 2
-- Display the sales rank of each order. If two orders have the same amount, they should receive the same rank.

SELECT
    order_id,
    customer_id,
    amount,
    RANK() OVER(
        ORDER BY amount DESC
    ) AS sales_rank
FROM orders;

-- Question 3
-- Display the dense rank of every order amount.

SELECT
    order_id,
    customer_id,
    amount,
    DENSE_RANK() OVER(
        ORDER BY amount DESC
    ) AS dense_rank
FROM orders;

-- Question 4
-- Divide all orders into 4 revenue groups.

SELECT
    order_id,
    customer_id,
    amount,
    NTILE(4) OVER(
        ORDER BY amount DESC
    ) AS revenue_group
FROM orders;

-- Question 5
-- Find the highest order placed by every customer.

WITH ranked_orders AS
(
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY customer_id
            ORDER BY amount DESC
        ) AS rn
    FROM orders
)

SELECT
    order_id,
    customer_id,
    amount
FROM ranked_orders
WHERE rn = 1;

-- Question 6
-- The business wants to identify each customer's highest-value order.

-- Display:

-- Customer Name (UPPERCASE)
-- Order Date
-- Amount
-- Rank within that customer

-- Show only the highest order.

WITH ranked_orders AS
(
    SELECT
        c.customer_name,
        o.order_date,
        o.amount,
        ROW_NUMBER() OVER(
            PARTITION BY c.customer_id
            ORDER BY o.amount DESC
        ) AS rn
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
)

SELECT
    UPPER(customer_name) AS customer_name,
    order_date,
    amount,
    rn
FROM ranked_orders
WHERE rn = 1;

-- Question 7
-- Generate a report showing:

-- Customer Name
-- Order Amount
-- Customer Lifetime Sales
-- Rank of the customer based on lifetime sales

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales,
    DENSE_RANK() OVER(
        ORDER BY cs.total_sales DESC
    ) AS sales_rank
FROM customers c
JOIN customer_sales cs
ON c.customer_id = cs.customer_id;

-- Question 8
-- Find the latest order placed by every customer.

-- Display:
-- Customer Name
-- Latest Order Date
-- Amount

WITH latest_orders AS
(
    SELECT
        c.customer_name,
        o.order_date,
        o.amount,
        ROW_NUMBER() OVER(
            PARTITION BY c.customer_id
            ORDER BY o.order_date DESC
        ) AS rn
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
)

SELECT
    customer_name,
    order_date,
    amount
FROM latest_orders
WHERE rn = 1;

-- Question 9
-- Display:

-- Customer Name
-- Order Amount
-- Running Sales
-- Rank based on Order Amount (within the customer)

SELECT
    c.customer_name,
    o.amount,
    SUM(o.amount) OVER(
        PARTITION BY c.customer_id
        ORDER BY o.order_date, o.order_id
    ) AS running_sales,
    RANK() OVER(
        PARTITION BY c.customer_id
        ORDER BY o.amount DESC
    ) AS order_rank
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 10
-- Display the Top 3 customers by total sales.

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales
FROM customers c
JOIN customer_sales cs
ON c.customer_id = cs.customer_id
QUALIFY DENSE_RANK() OVER(
    ORDER BY cs.total_sales DESC
) <= 3;

-- Question 11
-- Display:

-- Customer Name
-- City (UPPERCASE)
-- Total Orders
-- Rank based on Total Orders

WITH customer_orders AS
(
    SELECT
        customer_id,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    UPPER(c.city) AS city,
    co.total_orders,
    DENSE_RANK() OVER(
        ORDER BY co.total_orders DESC
    ) AS order_rank
FROM customers c
JOIN customer_orders co
ON c.customer_id = co.customer_id;

-- Question 12
-- Find the second highest order for every customer.

WITH ranked_orders AS
(
    SELECT
        customer_id,
        order_id,
        amount,
        DENSE_RANK() OVER(
            PARTITION BY customer_id
            ORDER BY amount DESC
        ) AS rnk
    FROM orders
)

SELECT
    customer_id,
    order_id,
    amount
FROM ranked_orders
WHERE rnk = 2;

-- Question 13
-- Display:

-- Customer Name
-- Order Amount
-- Delivery Days
-- Delivery Rank (fastest delivery gets Rank 1)

SELECT
    c.customer_name,
    o.amount,
    DATE_DIFF(o.delivery_date, o.order_date, DAY) AS delivery_days,
    ROW_NUMBER() OVER(
        ORDER BY DATE_DIFF(o.delivery_date, o.order_date, DAY)
    ) AS delivery_rank
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Question 14
-- Display the top order from each month.

WITH monthly_orders AS
(
    SELECT
        order_id,
        order_date,
        amount,
        ROW_NUMBER() OVER(
            PARTITION BY DATE_TRUNC(order_date, MONTH)
            ORDER BY amount DESC
        ) AS rn
    FROM orders
)

SELECT
    order_id,
    order_date,
    amount
FROM monthly_orders
WHERE rn = 1;

-- Question 15 (Business Report)
-- The management wants a dashboard showing:

-- Customer Name (UPPERCASE)
-- Total Sales
-- Customer Rank
-- Customer Category

-- Rules:

-- Platinum ≥7000
-- Gold ≥5000
-- Silver ≥3000
-- Bronze Otherwise

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    UPPER(c.customer_name) AS customer_name,
    cs.total_sales,
    DENSE_RANK() OVER(
        ORDER BY cs.total_sales DESC
    ) AS customer_rank,
    CASE
        WHEN cs.total_sales >= 7000 THEN 'Platinum'
        WHEN cs.total_sales >= 5000 THEN 'Gold'
        WHEN cs.total_sales >= 3000 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_category
FROM customers c
JOIN customer_sales cs
ON c.customer_id = cs.customer_id;