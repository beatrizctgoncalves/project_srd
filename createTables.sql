CREATE DATABASE `database_womensmell`;
USE database_womensmell;

CREATE TABLE IF NOT EXISTS `tA` (
  `idx` SERIAL NOT NULL PRIMARY KEY,
  `Attr1` VARCHAR(15),
  `Attr2` VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS `tB` (
  `Idx` SERIAL NOT NULL PRIMARY KEY,
  `Attr1` VARCHAR(15),
  `Attr2` VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_no` SERIAL NOT NULL PRIMARY KEY,
  `birth_date` VARCHAR(20),
  `first_name` VARCHAR(20),
  `last_name` VARCHAR(15),
  `gender`VARCHAR(15),
  `hire_date` DATETIME,
  `salary` INT
);

INSERT INTO `tA` (`idx`, `Attr1`, `Attr2`) VALUES (1, 'a1', 'a2'),
(2, 'b1', 'a2'),
(5, 'a', NULL);
INSERT INTO `tB` VALUES (1, 'A1', 'a2'),
(3, 'C1', 'C2'),
(4, 'A2', 'a2'),
(2, 'f1', 'ola'),
(5, NULL, 'E2');
INSERT INTO `employees` VALUES (259980, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821),
(240104, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821),
(427857, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821),
(295047, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821),
(290672, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821),
(430852, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821),
(48255, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821),
(63128, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821),
(102987, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821),
(431777, '1963-06-11', 'Mary', 'Muntz', 'F', '1962-08-03', 99821);

SELECT * FROM tA
JOIN tB ON tA.Attr2 = tB.Attr2;
-- LIMIT 2;

SELECT * FROM tA
RIGHT JOIN tB ON tA.Attr2 = tB.Attr2
WHERE tA.Attr2 IS NULL;

SELECT tA.`Attr2`, count(1) as c FROM tA
JOIN tB ON tA.Attr2 = tB.Attr2
GROUP BY tA.`Attr2`;

/* ERROR:
SELECT `Attr1`, count(1) as c FROM tA
GROUP BY `Attr1`
HAVING `Attr2` = NULL;
*/

SELECT `Attr2`, count(`Attr2`) as c FROM tA
GROUP BY `Attr2`
HAVING c > 1;

SELECT tB.`Attr1` FROM tA
RIGHT JOIN tB ON tA.idx=tB.idx
WHERE tA.idx IS NULL;

SELECT `Attr1`, count(1) as c FROM tA
WHERE `Attr2` = NULL
GROUP BY `Attr1`;

SELECT YEAR(birth_date) y, AVG(salary) salary, COUNT(1) c
FROM employees
GROUP BY YEAR (birth_date);






CREATE TABLE `Client_User` (
  `client_id` SERIAL NOT NULL PRIMARY KEY,
  `client_name` VARCHAR(15) DEFAULT NULL,
  `client_surname` VARCHAR(15) DEFAULT NULL,
  `client_email` VARCHAR(20) NOT NULL,
  `client_password` VARCHAR(20) NOT NULL,
  `client_phone` VARCHAR(14) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `Client_Address` (
  `client_address_id` SERIAL NOT NULL PRIMARY KEY,
  `client_id` BIGINT UNSIGNED NOT NULL,
  `client_address` VARCHAR(100) NOT NULL,
  `client_city` VARCHAR(20) NOT NULL,
  `client_postalcode` VARCHAR(10) NOT NULL,
  `client_country` VARCHAR(20) NOT NULL,
  FOREIGN KEY(`client_id`) REFERENCES Client_User(`client_id`)
);

DELETE FROM `Client_User` WHERE `client_id`=1;


/*
CREATE TABLE IF NOT EXISTS `Warehouse`(
  `warehouse_id` SERIAL NOT NULL PRIMARY KEY,
  `warehouse_name` VARCHAR(20) NOT NULL,
  `warehouse_address` VARCHAR(100) NOT NULL,
  `warehouse_city` VARCHAR(20) NOT NULL,
  `warehouse_postalcode` VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Fragrance_Class`(
  `fragrance_class_id` SERIAL NOT NULL PRIMARY KEY,
  `fragrance_class_name` VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Fragrance`(
  `fragrance_id` SERIAL NOT NULL PRIMARY KEY,
  `fragrance_class_id` BIGINT UNSIGNED NOT NULL,
  `fragrance_name` VARCHAR(20) NOT NULL,
  FOREIGN KEY(fragrance_class_id) REFERENCES Fragrance_Class(fragrance_class_id)
);

CREATE TABLE IF NOT EXISTS `Product_Color`(
  `product_color_id` SERIAL NOT NULL PRIMARY KEY,
  `product_color_name` VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Product_Size`(
  `product_size_id` SERIAL NOT NULL PRIMARY KEY,
  `product_size_name` VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Product`(
  `product_id` SERIAL NOT NULL,
  `fragrance_id` BIGINT UNSIGNED NOT NULL,
  `product_color_id` BIGINT UNSIGNED NOT NULL,
  `product_size_id` BIGINT UNSIGNED NOT NULL,
  `warehouse_id` BIGINT UNSIGNED NOT NULL,
  `product_price` FLOAT NOT NULL,
  `product_quantity` INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY(fragrance_id) REFERENCES Fragrance(fragrance_id),
  FOREIGN KEY(product_color_id) REFERENCES Product_Color(product_color_id),
  FOREIGN KEY(product_size_id) REFERENCES Product_Size(product_size_id),
  FOREIGN KEY(warehouse_id) REFERENCES Warehouse(warehouse_id),
  PRIMARY KEY(`product_id`, fragrance_id, product_color_id, product_size_id, warehouse_id)
);

CREATE TABLE IF NOT EXISTS `Product_Rating` (
  `product_rating_id` SERIAL NOT NULL PRIMARY KEY,
  `product_id` BIGINT UNSIGNED NOT NULL,
  `client_id` BIGINT UNSIGNED NOT NULL,
  `grade` INTEGER CHECK (`grade` > 0 AND `grade` < 11),
  FOREIGN KEY(product_id) REFERENCES Product(product_id),
  FOREIGN KEY(client_id) REFERENCES Client_User(client_id)
);

CREATE TABLE IF NOT EXISTS `Discount` (
  `discount_id`SERIAL NOT NULL PRIMARY KEY,
  `discount_name` VARCHAR(25) DEFAULT NULL,
  `discount_description` VARCHAR(50) DEFAULT NULL,
  `discount_value` FLOAT NOT NULL,
  `discount_validation` BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` SERIAL NOT NULL PRIMARY KEY,
  `client_id` BIGINT UNSIGNED NOT NULL,
  `discount_id` BIGINT UNSIGNED DEFAULT NULL,
  `due_date` DATETIME NOT NULL,
  FOREIGN KEY(client_id) REFERENCES Client_User(client_id),
  FOREIGN KEY(discount_id) REFERENCES Discount(discount_id)
);

CREATE TABLE IF NOT EXISTS `Order_Product` (
  `order_product_id` SERIAL NOT NULL PRIMARY KEY,
  `order_id` BIGINT UNSIGNED NOT NULL,
  `product_id` BIGINT UNSIGNED NOT NULL,
  `quantity` INTEGER NOT NULL,
  FOREIGN KEY(order_id) REFERENCES Orders(order_id),
  FOREIGN KEY(product_id) REFERENCES Product(product_id)
);

CREATE TABLE IF NOT EXISTS `Invoice` (
  `invoice_id` SERIAL NOT NULL PRIMARY KEY,
  `order_id` BIGINT UNSIGNED NOT NULL,
  `tax_rate` FLOAT NOT NULL,
  `subtotal` FLOAT NOT NULL,
  `status` BOOLEAN NOT NULL DEFAULT FALSE,
  `due_date` DATE NOT NULL,
  FOREIGN KEY(`order_id`) REFERENCES `Orders`(`order_id`)
);

-- The source table to track the changes
CREATE TABLE `Log_Product` (
	log_product_id SERIAL NOT NULL PRIMARY KEY,
	product_id BIGINT UNSIGNED NOT NULL,
	old_price FLOAT NOT NULL,
	new_price FLOAT NOT NULL,
	timestamp TIMESTAMP,
	FOREIGN KEY(`product_id`) REFERENCES `Product`(`product_id`)
);*/