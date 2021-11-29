CREATE DATABASE IF NOT EXISTS `database_womensmell`;
USE database_womensmell;


CREATE TABLE IF NOT EXISTS `Company` (
  `company_id` SERIAL NOT NULL PRIMARY KEY,
  `company_name` VARCHAR(15) NOT NULL,
  `company_email` VARCHAR(20) NOT NULL,
  `company_phone` VARCHAR(14) NOT NULL,
  `company_website` VARCHAR(20) NOT NULL,
  `company_address` VARCHAR(100) NOT NULL,
  `company_postalcode` VARCHAR(10) NOT NULL,
  `company_city` VARCHAR(20) NOT NULL,
  `company_country` VARCHAR(20) NOT NULL,
  `create_time` DATETIME,
  `update_time` DATETIME
);


CREATE TABLE `Client_User` (
  `client_id` SERIAL NOT NULL PRIMARY KEY,
  `client_name` VARCHAR(15) DEFAULT NULL,
  `client_surname` VARCHAR(15) DEFAULT NULL,
  `client_email` VARCHAR(20) NOT NULL,
  `client_password` VARCHAR(20) NOT NULL,
  `client_phone` VARCHAR(14) DEFAULT NULL,
  `create_time` DATETIME,
  `update_time` DATETIME
);

CREATE TABLE IF NOT EXISTS `Client_Address` (
  `client_address_id` SERIAL NOT NULL PRIMARY KEY,
  `client_id` BIGINT UNSIGNED NOT NULL,
  `client_address` VARCHAR(100) NOT NULL,
  `client_city` VARCHAR(20) NOT NULL,
  `client_postalcode` VARCHAR(10) NOT NULL,
  `client_country` VARCHAR(20) NOT NULL,
  `create_time` DATETIME,
  `update_time` DATETIME,
  FOREIGN KEY(`client_id`) REFERENCES Client_User(`client_id`)
);

CREATE TABLE IF NOT EXISTS `Warehouse`(
  `warehouse_id` SERIAL NOT NULL PRIMARY KEY,
  `warehouse_name` VARCHAR(20) NOT NULL,
  `warehouse_address` VARCHAR(100) NOT NULL,
  `warehouse_city` VARCHAR(20) NOT NULL,
  `warehouse_postalcode` VARCHAR(10) NOT NULL,
  `create_time` DATETIME,
  `update_time` DATETIME
);

CREATE TABLE IF NOT EXISTS `Product_Class`(
  `product_class_id` SERIAL NOT NULL PRIMARY KEY,
  `product_class_name` VARCHAR(20) NOT NULL,
  `create_time` DATETIME,
  `update_time` DATETIME
);

CREATE TABLE IF NOT EXISTS `Product_Color`(
  `product_color_id` SERIAL NOT NULL PRIMARY KEY,
  `product_color_name` VARCHAR(20) NOT NULL,
  `create_time` DATETIME,
  `update_time` DATETIME
);

CREATE TABLE IF NOT EXISTS `Product_Size`(
  `product_size_id` SERIAL NOT NULL PRIMARY KEY,
  `product_size_name` VARCHAR(20) NOT NULL,
  `create_time` DATETIME,
  `update_time` DATETIME
);

CREATE TABLE IF NOT EXISTS `Product`(
  `product_id` SERIAL NOT NULL,
  `product_color_id` BIGINT UNSIGNED NOT NULL,
  `product_size_id` BIGINT UNSIGNED NOT NULL,
  `product_class_id` BIGINT UNSIGNED NOT NULL,
  `warehouse_id` BIGINT UNSIGNED NOT NULL,
  `product_name` VARCHAR(20) NOT NULL,
  `product_price` FLOAT NOT NULL,
  `product_quantity` INTEGER NOT NULL DEFAULT 0,
  `create_time` DATETIME,
  `update_time` DATETIME,
  FOREIGN KEY(product_color_id) REFERENCES Product_Color(product_color_id),
  FOREIGN KEY(product_size_id) REFERENCES Product_Size(product_size_id),
  FOREIGN KEY(product_class_id) REFERENCES Product_Class(product_class_id),
  FOREIGN KEY(warehouse_id) REFERENCES Warehouse(warehouse_id),
  PRIMARY KEY(`product_id`, product_color_id, product_size_id, product_class_id, warehouse_id)
);

CREATE TABLE IF NOT EXISTS `Product_Rating` (
  `product_rating_id` SERIAL NOT NULL PRIMARY KEY,
  `product_id` BIGINT UNSIGNED NOT NULL,
  `client_id` BIGINT UNSIGNED NOT NULL,
  `grade` INTEGER CHECK (`grade` > 0 AND `grade` < 6),
  `create_time` DATETIME,
  `update_time` DATETIME,
  FOREIGN KEY(product_id) REFERENCES Product(product_id),
  FOREIGN KEY(client_id) REFERENCES Client_User(client_id)
);

CREATE TABLE IF NOT EXISTS `Discount` (
  `discount_id`SERIAL NOT NULL PRIMARY KEY,
  `discount_name` VARCHAR(25) DEFAULT NULL,
  `discount_description` VARCHAR(50) DEFAULT NULL,
  `discount_value` FLOAT NOT NULL,
  `discount_validation` BOOLEAN DEFAULT FALSE,
  `create_time` DATETIME,
  `update_time` DATETIME
);

CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` SERIAL NOT NULL PRIMARY KEY,
  `client_id` BIGINT UNSIGNED NOT NULL,
  `discount_id` BIGINT UNSIGNED DEFAULT NULL,
  `total_amount` INT NOT NULL DEFAULT 0,
  `create_time` DATETIME,
  `update_time` DATETIME,
  FOREIGN KEY(client_id) REFERENCES Client_User(client_id),
  FOREIGN KEY(discount_id) REFERENCES Discount(discount_id)
);

CREATE TABLE IF NOT EXISTS `Order_Product` (
  `order_product_id` SERIAL NOT NULL PRIMARY KEY,
  `order_id` BIGINT UNSIGNED NOT NULL,
  `product_id` BIGINT UNSIGNED NOT NULL,
  `quantity` INTEGER NOT NULL,
  `create_time` DATETIME,
  `update_time` DATETIME,
  FOREIGN KEY(order_id) REFERENCES Orders(order_id),
  FOREIGN KEY(product_id) REFERENCES Product(product_id)
);

CREATE TABLE IF NOT EXISTS `Invoice` (
  `invoice_id` SERIAL NOT NULL PRIMARY KEY,
  `order_id` BIGINT UNSIGNED NOT NULL,
  `sales_amount` FLOAT NOT NULL,
  `tax_rate` FLOAT NOT NULL,
  `tax_amount` FLOAT NOT NULL,
  `status` BOOLEAN NOT NULL DEFAULT FALSE,
  `due_date` DATE NOT NULL,
  `create_time` DATETIME,
  `update_time` DATETIME,
  FOREIGN KEY(`order_id`) REFERENCES `Orders`(`order_id`)
);

-- The source table to track the changes
CREATE TABLE IF NOT EXISTS `All_Data` (
 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `time_stamp` TIMESTAMP,
 `data1` VARCHAR(255) NOT NULL,
 `data2` DECIMAL(5,2) NOT NULL 
);

-- Track the nature of the action (insert, update or delete),
-- the time of the action and the values of each column in the source table
CREATE TABLE IF NOT EXISTS `Log` (
   `act` VARCHAR(255),
   `action_time` TIMESTAMP,
   `id` INT,
   `time_stamp` TIMESTAMP,
   `data1` VARCHAR(255) NOT NULL,
   `data2` DECIMAL(5,2) NOT NULL 
);