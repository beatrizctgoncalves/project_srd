-- Add a log entry for insert actions
-- This will record action time and newly added data values
DELIMITER $$
CREATE TRIGGER insert_data AFTER INSERT ON Log
	FOR EACH ROW
	BEGIN
	  INSERT INTO Log (action, id, timestamp, data1, data2)
		VALUES('insert', NEW.id, NOW(), NEW.data1, NEW.data2);
	END$$
DELIMITER ;


-- Update the available stock of products
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
