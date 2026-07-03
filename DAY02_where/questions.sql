-- Question 1

-- Show customers whose age is greater than 25.

SELECT *
FROM customers
WHERE age > 25;

-- Question 2

-- Show customers from Pune.

SELECT *
FROM customers
WHERE city = 'Pune';

-- Question 3

-- Show customers whose age is less than or equal to 27.

SELECT *
FROM customers
WHERE age <= 27;

-- Question 4

-- Show customers from Hyderabad and age greater than 25.

SELECT *
FROM customers
WHERE city = 'Hyderabad'
AND age > 25;

-- Question 5

-- Show customers from Hyderabad or Chennai.

SELECT *
FROM customers
WHERE city = 'Hyderabad'
OR city = 'Chennai';

SELECT *
FROM customers  
WHERE city IN ('Hyderabad', 'Chennai');

-- Question 6

-- Show customers who are not from Bengaluru.

SELECT *
FROM customers
WHERE NOT city = 'Bengaluru';

SELECT *
FROM customers
WHERE city <> 'Bengaluru';

SELECT *
FROM customers
WHERE city != 'Bengaluru';
 
SELECT *
FROM customers  
WHERE city NOT IN ('Bengaluru');

SELECT *
FROM customers 
WHERE city NOT LIKE 'Bengaluru';

-- Question 7

-- Show only the name and city of customers older than 24.

SELECT name, city
FROM customers
WHERE age > 24;