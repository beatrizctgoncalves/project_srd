-- Exercise 1
-- List all the customer’s names, dates, and products or services used/booked/rented/bought
-- by these customers in a range of two dates.
USE database_womensmell;

SELECT CONCAT(CU.client_name, ' ', CU.client_surname) AS 'Client Name', O.due_date AS 'Order Date', F.fragrance_name AS 'Product Name'
FROM Orders AS O, Order_Product AS OP, Client_User AS CU, Fragrance AS F, Product AS P
WHERE O.order_id = OP.order_id AND O.client_id = CU.client_id AND OP.product_id = P.product_id AND P.fragrance_id = F.fragrance_id
AND O.due_date > '2020-01-01 08:00:00' AND O.due_date < '2020-12-31 23:59:59';

-- Exercise 2
-- List the best three customers/products/services/places (you are free to define the criteria for what means “best”).
-- Note: We define a “best product” as a product with the highest ratings from clients.
USE database_womensmell;

SELECT F.fragrance_name AS 'Product Name', PR.grade AS 'Product Rating'
FROM Product_Rating AS PR
JOIN Product AS P ON PR.product_id = P.product_id
JOIN Fragrance AS F ON P.fragrance_id = F.fragrance_id
ORDER BY PR.grade DESC
LIMIT 3;

-- Exercise 3
-- Get the average amount of sales/bookings/rents/deliveries for a period that involves 2 or more years.

SELECT '01/2018 - 12/2021' AS 'PeriodOfSales',
ROUND(SUM(I.subtotal * (1 - (D.discount_value) / 100)), 2) AS 'TotalSales',
ROUND(SUM(I.subtotal * (1 - (D.discount_value) / 100) / 3), 2) AS 'YearlyAverage',
ROUND(SUM(I.subtotal * (1 - (D.discount_value) / 100) / 36), 2) AS 'MonthlyAverage'
FROM Invoice AS I
Join Orders AS O ON O.order_id = I.order_id
JOIN Discount AS D ON O.discount_id = D.discount_id;

-- Exercise 4
-- Get the total sales/bookings/rents/deliveries by geographical location (city/country).

SELECT client_city, ROUND(SUM(I.subtotal * (1 - (D.discount_value) / 100)), 2) AS 'Total Sales'
FROM Invoice AS I
JOIN Orders AS O ON O.order_id = I.order_id
JOIN Discount AS D ON O.discount_id = D.discount_id
JOIN client_address AS CA ON O.client_id = CA.client_id
GROUP BY client_city


-- Exercise 5
-- List all the locations where products/services were sold, and the product has customer’s ratings
-- (Yes, your ERD must consider that customers can give ratings).
