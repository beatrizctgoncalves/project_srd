-- Exercise 1
USE database_womensmell;

/*SELECT concat(Client_User.client_name, ' ', Client_User.client_surname) AS Client_Name, Orders.create_time as Order_Date, Product.product_name as Product_Name
FROM Orders, Order_Product, Client_User, Product
WHERE Orders.order_id = Order_Product.order_id AND Orders.client_id = Client_User.client_id AND Order_Product.order_product_id = Product.product_id
AND Orders.create_time > '2020-01-01 08:00:00' AND Orders.create_time < '2020-08-21 23:59:59';
*/
SELECT * FROM Log;
-- Exercise 2

-- Exercise 3

-- Exercise 4

-- Exercise 5

