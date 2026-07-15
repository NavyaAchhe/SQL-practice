-- Question 1
-- Categorize orders into High, Medium, and Low.

SELECT order_id,
       amount,
       CASE
           WHEN amount >= 4000 THEN 'High'
           WHEN amount >= 2000 THEN 'Medium'
           ELSE 'Low'
       END AS category
FROM orders;

-- Question 2
-- Assign discounts.
-- High → 20%
-- Medium → 10%
-- Low → 5%

SELECT order_id,
       amount,
       CASE
           WHEN amount >= 4000 THEN 20
           WHEN amount >= 2000 THEN 10
           ELSE 5
       END AS discount
FROM orders;

-- Question 3
-- Show bonus eligibility.

SELECT customer_id,
       amount,
       CASE
           WHEN amount >= 3000 THEN 'Eligible'
           ELSE 'Not Eligible'
       END AS bonus_status
FROM orders;

-- Question 4
-- Display "Big Order" if amount > 2500 else "Small Order".

SELECT order_id,
       amount,
       CASE
           WHEN amount > 2500 THEN 'Big Order'
           ELSE 'Small Order'
       END AS order_size
FROM orders;

-- Question 5
-- Count High, Medium, and Low orders.

SELECT
CASE
    WHEN amount >= 4000 THEN 'High'
    WHEN amount >= 2000 THEN 'Medium'
    ELSE 'Low'
END AS category,
COUNT(*) AS total_orders
FROM orders
GROUP BY
CASE
    WHEN amount >= 4000 THEN 'High'
    WHEN amount >= 2000 THEN 'Medium'
    ELSE 'Low'
END;

-- Question 6
-- Calculate total High sales.

SELECT
SUM(
CASE
WHEN amount >= 4000 THEN amount
ELSE 0
END
) AS high_sales
FROM orders;

-- Question 7
-- Calculate total Low sales.

SELECT
SUM(
CASE
WHEN amount < 2000 THEN amount
ELSE 0
END
) AS low_sales
FROM orders;

-- Question 8
-- Sort orders by category.

SELECT *
FROM orders
ORDER BY
CASE
WHEN amount >= 4000 THEN 1
WHEN amount >= 2000 THEN 2
ELSE 3
END;

-- Question 9
-- Display customer IDs with their category.

SELECT customer_id,
       CASE
           WHEN amount >= 4000 THEN 'High'
           WHEN amount >= 2000 THEN 'Medium'
           ELSE 'Low'
       END AS category
FROM orders;

-- Question 10
-- Create a sales grade.
-- A ≥ 5000
-- B ≥ 3000
-- C ≥ 1500
-- D <1500

SELECT order_id,
       amount,
       CASE
           WHEN amount >= 5000 THEN 'A'
           WHEN amount >= 3000 THEN 'B'
           WHEN amount >= 1500 THEN 'C'
           ELSE 'D'
       END AS sales_grade
FROM orders;