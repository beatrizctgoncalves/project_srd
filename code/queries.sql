-- Exercise 1
USE database_womensmell;

SELECT concat(CU.client_name, ' ', CU.client_surname) AS Client_Name, O.due_date AS Order_Date, F.fragrance_name AS Product_Name
FROM Orders AS O, Order_Product AS OP, Client_User AS CU, Fragrance AS F, Product AS P
WHERE O.order_id = OP.order_id AND O.client_id = CU.client_id AND OP.product_id = P.product_id AND P.fragrance_id = F.fragrance_id
AND O.due_date > '2020-01-01 08:00:00' AND O.due_date < '2020-12-31 23:59:59';

-- Exercise 2
USE database_womensmell;

SELECT CU.client_name AS Client_Name, ROUND(SUM(I.sales_amount * ((100 - D.discount_value) / 100)), 2) AS Income
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
USE database_womensmell;

SELECT '01/2018 - 12/2021' AS PeriodOfSales, ROUND(SUM(I.sales_amount * ((100 - D.discount_value) / 100)), 2) AS TotalSales,
ROUND(SUM(Sales_Amount * ((100 - D.discount_value) / 100) / 3), 2) AS YearlyAverage,
ROUND(SUM(Sales_Amount * ((100 - D.discount_value) / 100) / 36), 2) AS MonthlyAverage

FROM Invoice AS I
Join Orders AS O
ON O.order_id = I.order_id
JOIN Discount AS D 
ON O.discount_id = D.discount_id;

-- Exercise 4

-- Exercise 5

