-- Add a log entry for insert actions
DELIMITER $$
CREATE TRIGGER insert_data
AFTER UPDATE ON Product
FOR EACH ROW
BEGIN
	INSERT INTO Log_Product(log_product_id, product_id, old_price, new_price, action, timestamp)
	VALUES(OLD.product_id, OLD.product_price, NEW.product_price, 'update', NOW());
END$$
DELIMITER ;

-- Update the available stock of products
DELIMITER $$
CREATE TRIGGER StockUpdate
AFTER INSERT ON Order_Product
FOR EACH ROW
BEGIN
	UPDATE Product
		SET product_quantity = product_quantity - NEW.quantity
	WHERE product_id = NEW.product_id;
END$$
DELIMITER ;
