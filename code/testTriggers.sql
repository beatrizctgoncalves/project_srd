USE database_womensmell;

-- Observe tables before using triggers
SELECT * FROM Order_Product;
SELECT * FROM Product;
SELECT * FROM Log_Product;

-- Insert and update values in order to see triggers working
INSERT INTO `Order_Product`(order_id, product_id, quantity) VALUES(1, 1, 1);
UPDATE Product SET Product.product_price = 3 WHERE Product.product_id = 1;

-- Observe tables after using triggers
SELECT * FROM Order_Product;
SELECT * FROM Product;
SELECT * FROM Log_Product;
