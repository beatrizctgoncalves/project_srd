-- Add a log entry for insert actions
-- This will record action time and newly added data values
DROP TRIGGER IF EXISTS insert_data; 
DELIMITER $$
CREATE TRIGGER ai_data AFTER INSERT ON Log
	FOR EACH ROW
	BEGIN
	  INSERT INTO data_log (action, id, timestamp, data1, data2)
	  VALUES('insert', NEW.id, NOW(), NEW.data1, NEW.data2);
	END$$
DELIMITER ;


-- Update the available stock of products
DROP TRIGGER IF EXISTS StockUpdate;
DELIMITER $$
CREATE TRIGGER StockUpdate
AFTER INSERT ON Order_Product
FOR EACH ROW
BEGIN
	UPDATE Product
		SET product_quantity = product_quantity - New.quantity
	WHERE product_id = NEW.product_id;
END$$
DELIMITER ;
