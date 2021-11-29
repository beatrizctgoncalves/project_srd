-- Add a log entry for insert actions
-- This will record action time and newly added data values
DELIMITER $$
CREATE TRIGGER ai_data AFTER INSERT ON All_Data
FOR EACH ROW
BEGIN
  INSERT INTO `Log` (act, action_time, id, time_stamp, data1, data2)
  VALUES('insert', NOW(), NEW.id, NEW.time_stamp, NEW.data1, NEW.data2);
END$$
DELIMITER ;
/*
-- Add a log entry for update actions
DELIMITER $$
CREATE TRIGGER au_data AFTER UPDATE ON All_Data
FOR EACH ROW
BEGIN
  INSERT INTO `Log` (act, action_time, id, time_stamp, data1, data2)
  VALUES('update', NOW(), NEW.id, NEW.time_stamp, NEW.data1, NEW.data2);
END$$
DELIMITER ;

-- Add a log entry for delete actions
-- This will log the existing values of the deleted row
DELIMITER $$
CREATE TRIGGER ad_data AFTER DELETE ON All_Data
FOR EACH ROW
BEGIN
  INSERT INTO `Log` (act, action_time, id, time_stamp, data1, data2)
  VALUES('delete', NOW(), OLD.id, OLD.time_stamp, OLD.data1, OLD.data2);
END$$
DELIMITER ;*/

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
