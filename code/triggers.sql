USE database_womensmell;

-- Add a log entry for insert actions
DELIMITER $$
CREATE TRIGGER InsertDataIntoTableLog
AFTER UPDATE ON Product
FOR EACH ROW
BEGIN
	INSERT INTO Log_Product(product_id, old_price, new_price, timestamp)
	VALUES(OLD.product_id, OLD.product_price, NEW.product_price, NOW());
END$$

-- Update the available stock of products
CREATE TRIGGER StockUpdate
AFTER INSERT ON Order_Product
FOR EACH ROW
BEGIN
	UPDATE Product
		SET product_quantity = product_quantity - NEW.quantity
		WHERE product_id = NEW.product_id;
END$$
DELIMITER ;