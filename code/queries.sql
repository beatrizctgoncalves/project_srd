USE database_womensmell;

-- Exercise 1
EXPLAIN SELECT CONCAT(CU.client_name, ' ', CU.client_surname) AS 'Client Name', O.due_date AS 'Order Date', F.fragrance_name AS 'Product Name'
FROM Orders AS O, Order_Product AS OP, Client_User AS CU, Fragrance AS F, Product AS P
WHERE O.order_id = OP.order_id AND O.client_id = CU.client_id AND OP.product_id = P.product_id AND P.fragrance_id = F.fragrance_id
AND O.due_date BETWEEN '2020-01-01 08:00:00' AND '2020-12-31 23:59:59';
/*
The response time (Duration / Fetch) is under 0.1 seconds for all the actions, hence the system reaction is almost instantaously
and there is no need for feedback.
The query is optimized as well as possible because MySQL can use indexes on columns more efficiently if they are declared
as the same type and size. As it shows in column key_len, all tables have the same length.
The rows column in the output from EXPLAIN is an educated guess from the MySQL join optimizer. The estimated number of rows is 1 for
all the queries, which means that the number of rows read to find the occurance matching a certain item is minimized.
We also have a variey of possible_keys evaluated. 
*/

-- Exercise 2
-- We define a “best product” as a product with the highest ratings from clients.
EXPLAIN SELECT F.fragrance_name AS 'Product Name', PR.grade AS 'Product Rating'
FROM Product_Rating AS PR
JOIN Product AS P ON PR.product_id = P.product_id
JOIN Fragrance AS F ON P.fragrance_id = F.fragrance_id
ORDER BY PR.grade DESC
LIMIT 3;
/*
The response time (Duration / Fetch) is under 0.1 seconds for all the actions, hence the system reaction time is satisfactory.
The query is optimized as well as possible because the indexes on columns are declared as the same type and size.
By looking at key column, we see that the queries use indexes signified by the key column in the preceding output,
another sign that they are well tuned SQL queries.
The estimated number of rows is 1 for all the queries, which means that the number of rows read to find the occurance matching
a certain item is minimized.
We also have a variey of possible_keys evaluated.
*/

-- Exercise 3
EXPLAIN SELECT '01/2018 - 12/2021' AS 'PeriodOfSales',
ROUND(SUM(I.subtotal * (1 - (D.discount_value) / 100)), 2) AS 'TotalSales',
ROUND(SUM(I.subtotal * (1 - (D.discount_value) / 100) / 3), 2) AS 'YearlyAverage',
ROUND(SUM(I.subtotal * (1 - (D.discount_value) / 100) / 36), 2) AS 'MonthlyAverage'
FROM Invoice AS I
JOIN Orders AS O ON O.order_id = I.order_id
JOIN Discount AS D ON O.discount_id = D.discount_id
AND I.due_date BETWEEN '2018-01-01' AND '2020-12-31';

/*
The response time (Duration/Fetch) is under 0.1 seconds for all the actions, hence the system reaction is fast and satisfying.
Looking at key column, we see that the queries use indexes signified by the key column in the preceding output,
another sign that they are well tuned SQL queries.
The estimated number of rows is 1 for all the queries, which means that the number of rows read to find the occurance matching
a certain item is minimized.
The query is optimized as well as possible because the indexes on columns are declared as the same type and size (tables type and key_len).
We also have various possible_keys evaluated. 
*/

-- Exercise 4
EXPLAIN SELECT client_city AS Location, ROUND(SUM(I.subtotal * (1 - (D.discount_value) / 100)), 2) AS 'Total Sales'
FROM Invoice AS I, Orders AS O, Discount AS D, client_address AS CA
WHERE O.order_id = I.order_id  AND O.discount_id = D.discount_id AND O.client_id = CA.client_id
GROUP BY Location;

/*
The response time (Duration/Fetch) is under 0.1 seconds for all the actions, hence the system reaction is fast and satisfying.
Looking at key column, we see that the queries use indexes signified by the key column in the preceding output,
another sign that they are well tuned SQL queries.
The estimated number of rows is 1 for all the queries, which means that the number of rows read to find the occurance matching
a certain item is minimized.
The query is optimized as well as possible because the indexes on columns are declared as the same type and size (tables type and key_len).
We also have various possible_keys evaluated. 
*/

-- Exercise 5
EXPLAIN SELECT DISTINCT client_city AS Location
FROM client_address AS CA, Product_Rating AS PR
WHERE CA.client_id = PR.client_id;

/*
The response time (Duration/Fetch) is under 0.1 seconds for all the actions, hence the system reaction time is satisfactory.
Looking at key column, we see that the queries use indexes signified by the key column in the preceding output,
another sign that they are well tuned SQL queries.
The estimated number of rows is also 1 for most of the queries.
Most of the indexes on columns are also declared as the same type and size (tables type and key_len).
*/