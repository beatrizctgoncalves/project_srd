-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (arm64)
--
-- Host: localhost    Database: database_womensmell
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `All_Data`
--

DROP TABLE IF EXISTS `All_Data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `All_Data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_stamp` timestamp NULL DEFAULT NULL,
  `data1` varchar(255) NOT NULL,
  `data2` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `All_Data`
--

LOCK TABLES `All_Data` WRITE;
/*!40000 ALTER TABLE `All_Data` DISABLE KEYS */;
/*!40000 ALTER TABLE `All_Data` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_data` AFTER INSERT ON `all_data` FOR EACH ROW BEGIN
  INSERT INTO `Log` (action, action_time, id, time_stamp, data1, data2)
  VALUES('insert', NOW(), NEW.id, NEW.time_stamp, NEW.data1, NEW.data2);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Client_Address`
--

DROP TABLE IF EXISTS `Client_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client_Address` (
  `client_address_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `client_address` varchar(100) NOT NULL,
  `client_city` varchar(20) NOT NULL,
  `client_postalcode` varchar(10) NOT NULL,
  `client_country` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`client_address_id`),
  UNIQUE KEY `client_address_id` (`client_address_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `client_address_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Client_User` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client_Address`
--

LOCK TABLES `Client_Address` WRITE;
/*!40000 ALTER TABLE `Client_Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client_User`
--

DROP TABLE IF EXISTS `Client_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client_User` (
  `client_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_name` varchar(15) DEFAULT NULL,
  `client_surname` varchar(15) DEFAULT NULL,
  `client_email` varchar(20) NOT NULL,
  `client_password` varchar(20) NOT NULL,
  `client_phone` varchar(14) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client_User`
--

LOCK TABLES `Client_User` WRITE;
/*!40000 ALTER TABLE `Client_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Company` (
  `company_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(15) NOT NULL,
  `company_email` varchar(20) NOT NULL,
  `company_phone` varchar(14) NOT NULL,
  `company_website` varchar(20) NOT NULL,
  `company_address` varchar(100) NOT NULL,
  `company_postalcode` varchar(10) NOT NULL,
  `company_city` varchar(20) NOT NULL,
  `company_country` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discount` (
  `discount_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `discount_name` varchar(25) DEFAULT NULL,
  `discount_description` varchar(50) DEFAULT NULL,
  `discount_value` float NOT NULL,
  `discount_validation` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`discount_id`),
  UNIQUE KEY `discount_id` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice` (
  `invoice_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `sales_amount` float NOT NULL,
  `tax_rate` float NOT NULL,
  `tax_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `due_date` date NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_id` (`invoice_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Log` (
  `act` varchar(255) DEFAULT NULL,
  `action_time` timestamp NULL DEFAULT NULL,
  `id` int DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  `data1` varchar(255) NOT NULL,
  `data2` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Product`
--

DROP TABLE IF EXISTS `Order_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Product` (
  `order_product_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_product_id`),
  UNIQUE KEY `order_product_id` (`order_product_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Product`
--

LOCK TABLES `Order_Product` WRITE;
/*!40000 ALTER TABLE `Order_Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order_Product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `StockUpdate` AFTER INSERT ON `order_product` FOR EACH ROW BEGIN
	UPDATE Product
		SET product_quantity = product_quantity - quantity
	WHERE quantity = Order_Product.quantity;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `discount_id` bigint unsigned DEFAULT NULL,
  `total_amount` int NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `client_id` (`client_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Client_User` (`client_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `Discount` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `product_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_color_id` bigint unsigned NOT NULL,
  `product_size_id` bigint unsigned NOT NULL,
  `product_class_id` bigint unsigned NOT NULL,
  `warehouse_id` bigint unsigned NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `product_price` float NOT NULL,
  `product_quantity` int NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`,`product_color_id`,`product_size_id`,`product_class_id`,`warehouse_id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `product_color_id` (`product_color_id`),
  KEY `product_size_id` (`product_size_id`),
  KEY `product_class_id` (`product_class_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_color_id`) REFERENCES `Product_Color` (`product_color_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`product_size_id`) REFERENCES `Product_Size` (`product_size_id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`product_class_id`) REFERENCES `Product_Class` (`product_class_id`),
  CONSTRAINT `product_ibfk_4` FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Class`
--

DROP TABLE IF EXISTS `Product_Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Class` (
  `product_class_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_class_name` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_class_id`),
  UNIQUE KEY `product_class_id` (`product_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Class`
--

LOCK TABLES `Product_Class` WRITE;
/*!40000 ALTER TABLE `Product_Class` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product_Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Color`
--

DROP TABLE IF EXISTS `Product_Color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Color` (
  `product_color_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_color_name` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_color_id`),
  UNIQUE KEY `product_color_id` (`product_color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Color`
--

LOCK TABLES `Product_Color` WRITE;
/*!40000 ALTER TABLE `Product_Color` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product_Color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Rating`
--

DROP TABLE IF EXISTS `Product_Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Rating` (
  `product_rating_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `grade` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_rating_id`),
  UNIQUE KEY `product_rating_id` (`product_rating_id`),
  KEY `product_id` (`product_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `product_rating_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`),
  CONSTRAINT `product_rating_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `Client_User` (`client_id`),
  CONSTRAINT `product_rating_chk_1` CHECK (((`grade` > 0) and (`grade` < 6)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Rating`
--

LOCK TABLES `Product_Rating` WRITE;
/*!40000 ALTER TABLE `Product_Rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product_Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Size`
--

DROP TABLE IF EXISTS `Product_Size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Size` (
  `product_size_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_size_name` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_size_id`),
  UNIQUE KEY `product_size_id` (`product_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Size`
--

LOCK TABLES `Product_Size` WRITE;
/*!40000 ALTER TABLE `Product_Size` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product_Size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouse`
--

DROP TABLE IF EXISTS `Warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Warehouse` (
  `warehouse_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(20) NOT NULL,
  `warehouse_address` varchar(100) NOT NULL,
  `warehouse_city` varchar(20) NOT NULL,
  `warehouse_postalcode` varchar(10) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`),
  UNIQUE KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse`
--

LOCK TABLES `Warehouse` WRITE;
/*!40000 ALTER TABLE `Warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `Warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-29 16:29:20
