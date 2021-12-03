-- Exercise 1
-- List all the customer’s names, dates, and products or services used/booked/rented/bought
-- by these customers in a range of two dates.
USE database_womensmell;

SELECT concat(CU.client_name, ' ', CU.client_surname) AS 'Client Name', O.due_date AS 'Order Date', F.fragrance_name AS 'Product Name'
FROM Orders AS O, Order_Product AS OP, Client_User AS CU, Fragrance AS F, Product AS P
WHERE O.order_id = OP.order_id AND O.client_id = CU.client_id AND OP.product_id = P.product_id AND P.fragrance_id = F.fragrance_id
AND O.due_date > '2020-01-01 08:00:00' AND O.due_date < '2020-12-31 23:59:59';

-- Exercise 2
-- List the best three customers/products/services/places (you are free to define the criteria for what means “best”).
-- Note: We define a “best customer” as a customer with the highest Earnings Before Interests and Taxes (EBIT).
USE database_womensmell;

SELECT CU.client_name AS 'Client Name', ROUND(SUM(I.sales_amount * ((100 - D.discount_value) / 100)), 2) AS 'Income'
FROM Orders AS O
JOIN Client_User AS CU
ON O.client_id = CU.client_id
JOIN Invoice AS I
ON O.order_id = I.order_id
LEFT JOIN Discount AS D
ON O.discount_id = D.discount_id
GROUP BY Client_Name
ORDER BY Income DESC
LIMIT 3;

-- Exercise 3
-- Get the average amount of sales/bookings/rents/deliveries for a period that involves 2 or more years.
USE database_womensmell;

SELECT '01/2018 - 12/2021' AS 'PeriodOfSales', ROUND(SUM(I.sales_amount * ((100 - D.discount_value) / 100)), 2) AS 'TotalSales',
ROUND(SUM(Sales_Amount * ((100 - D.discount_value) / 100) / 3), 2) AS 'YearlyAverage',
ROUND(SUM(Sales_Amount * ((100 - D.discount_value) / 100) / 36), 2) AS 'MonthlyAverage'

FROM Invoice AS I
Join Orders AS O
ON O.order_id = I.order_id
JOIN Discount AS D 
ON O.discount_id = D.discount_id;

-- Exercise 4
-- Get the total sales/bookings/rents/deliveries by geographical location (city/country).
USE database_womensmell;

SELECT ROUND(Sum(I.sales_amount * ((100 - D.discount_value) / 100)), 2) AS 'Sales', CA.client_city AS 'Location'
FROM Client_User AS CU
JOIN Client_Address AS CA
ON CU.client_id = CA.client_id
JOIN Orders AS O
ON CU.client_id = O.client_id
JOIN Invoice AS I
ON O.order_id = I.order_id
JOIN Discount AS D
ON O.discount_id = D.discount_id
GROUP BY Location;

-- Exercise 5
-- List all the locations where products/services were sold, and the product has customer’s ratings
-- (Yes, your ERD must consider that customers can give ratings).
USE database_womensmell;
 
SELECT DISTINCT CA.client_city AS 'Location'
FROM Client_Address AS CA
INNER JOIN Client_User AS CU
ON CU.client_id = CA.client_id
INNER JOIN Product_Rating AS PR
ON CU.client_id = PR.client_id
INNER JOIN Orders AS O
ON O.client_id = CU.client_id
WHERE CU.client_id IN (
	SELECT PR1.client_id
	FROM Product_Rating AS PR1
) AND CU.client_id IN (
	SELECT O1.client_id
	FROM Orders AS O1
);