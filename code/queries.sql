-- Exercise 1
USE database_womensmell;

SELECT concat(CU.client_name, ' ', CU.client_surname) AS Client_Name, O.due_date AS Order_Date, F.fragrance_name AS Product_Name
FROM Orders AS O, Order_Product AS OP, Client_User AS CU, Fragrance AS F, Product AS P
WHERE O.order_id = OP.order_id AND O.client_id = CU.client_id AND OP.product_id = P.product_id AND P.fragrance_id = F.fragrance_id
AND O.due_date > '2020-01-01 08:00:00' AND O.due_date < '2020-12-31 23:59:59';

-- Exercise 2

-- Exercise 3

-- Exercise 4

-- Exercise 5

