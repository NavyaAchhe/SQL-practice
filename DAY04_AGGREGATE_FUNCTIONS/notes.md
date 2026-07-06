<!-- Aggregate functions perform calculations on multiple rows and return a single result.

1. COUNT()

Imagine your manager asks:

How many customers do we have?

SELECT COUNT(*)
FROM customers;

Output
8

SELECT COUNT(city)
FROM customers;

Also returns:

8

because every row has a city value.

COUNT(DISTINCT)

How many different cities?

SELECT COUNT(DISTINCT city)
FROM customers;

Output

4

Cities are:

Hyderabad
Bengaluru
Chennai
Pune
2. SUM()

Let's introduce another table.

orders
order_id    customer_id	amount
101	           1	    1500
102	           2    	3000
103	           1    	2500
104	           3	    1000
105	           5	    4000

Manager asks:

Total sales?

SELECT SUM(amount)
FROM orders;

Output

12000
3. AVG()

Average order amount.

SELECT AVG(amount)
FROM orders;

Calculation:

1500+3000+2500+1000+4000 = 12000/5 = 2400

SQL does it automatically.

Average customer age

SELECT AVG(age)
FROM customers;
4. MIN()

Youngest customer

SELECT MIN(age)
FROM customers;

Output

23

Smallest order

SELECT MIN(amount)
FROM orders;

Output

1000
5. MAX()

Oldest customer

SELECT MAX(age)
FROM customers;

Output

31

Highest order

SELECT MAX(amount)
FROM orders;

Output

4000
Combining with WHERE

How many Hyderabad customers?

SELECT COUNT(*)
FROM customers
WHERE city='Hyderabad';

Output

3

Average age of Hyderabad customers

SELECT AVG(age)
FROM customers
WHERE city='Hyderabad';

Average of 23, 31, 28 is 27.33

Highest order above ₹2000?

SELECT MAX(amount)
FROM orders
WHERE amount>2000;
Real BigQuery Example

Suppose your company stores sales data.

Manager asks:Total sales today?

SELECT SUM(order_amount)
FROM sales
WHERE order_date='2026-07-03';

Manager asks: Highest order today?

SELECT MAX(order_amount)
FROM sales;

Manager asks:Average order value?

SELECT AVG(order_amount)
FROM sales;

This is exactly the type of SQL you'll use with BigQuery. -->