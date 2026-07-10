-- Question 1
-- Find orders greater than the average order amount.

SELECT *
FROM orders
WHERE amount >
(
    SELECT AVG(amount)
    FROM orders
);

-- Question 2
-- Find the highest order.

SELECT *
FROM orders
WHERE amount =
(
    SELECT MAX(amount)
    FROM orders
);

-- Question 3
-- Find the lowest order.

SELECT *
FROM orders
WHERE amount =
(
    SELECT MIN(amount)
    FROM orders
);

-- Question 4
-- Find customers who have placed at least one order.

SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
);

-- Question 5
-- Find customers who have not placed any orders.

SELECT *
FROM customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM orders
);

-- Question 6
-- Find orders below the average amount.

SELECT *
FROM orders
WHERE amount <
(
    SELECT AVG(amount)
    FROM orders
);

-- Question 7
-- Find orders greater than the minimum amount.

SELECT *
FROM orders
WHERE amount >
(
    SELECT MIN(amount)
    FROM orders
);

-- Question 8
-- Find customers who placed more than one order.

SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);

-- Question 9
-- Find customers whose IDs exist in the orders table.

SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
);
  
-- Question 10
-- Find customers whose IDs do not exist in the orders table.

SELECT *
FROM customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM orders
);