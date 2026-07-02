-- ==========================================
-- Day 1 - SELECT and FROM
-- ==========================================

-- Assume the table name is customers

/*
Table: customers

customer_id | name   | city       | age
-----------------------------------------
1           | Navya  | Hyderabad  | 23
2           | Rahul  | Bengaluru  | 28
3           | Sneha  | Chennai    | 25
4           | Amit   | Hyderabad  | 31
5           | Priya  | Pune       | 27
*/

--------------------------------------------------
-- Question 1
-- Show all columns from the customers table.
--------------------------------------------------

SELECT *
FROM customers;

--------------------------------------------------
-- Question 2
-- Show only the name column.
--------------------------------------------------

SELECT name
FROM customers;

--------------------------------------------------
-- Question 3
-- Show name and city.
--------------------------------------------------

SELECT name,city
FROM customers;

--------------------------------------------------
-- Question 4
-- Show only the age column.
--------------------------------------------------

SELECT age
FROM customers;

--------------------------------------------------
-- Question 5
-- Show customer_id and name.
--------------------------------------------------

SELECT customer_id,name
FROM customers;