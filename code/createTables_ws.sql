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
  PRIMARY KEY (`client_address_id`),
  UNIQUE KEY `client_address_id` (`client_address_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `client_address_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Client_User` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client_Address`
--

LOCK TABLES `Client_Address` WRITE;
/*!40000 ALTER TABLE `Client_Address` DISABLE KEYS */;
INSERT INTO `Client_Address` VALUES (1,1,'Rua Cassiano Branco Bairro dos Loios Escola Secundária Damião de Góis','Lisboa',' 1950-005','Portugal'),(2,2,'Rua Cassiano Branco Bairro dos Loios Escola 1ºCiclo Ensino Básico 9','Lisboa','1950-005','Portugal'),(3,3,'Rua Cassiano Branco Bairro dos Loios Lt 221 Lj','Lisboa','1950-005','Portugal'),(4,4,'Rua Cassiano Branco Bairro dos Loios Lt 221','Lisboa','1950-005','Portugal'),(5,5,'Impasse à Rua José do Patrocínio Lt 1','Lisboa','1950-005','Portugal'),(6,23,'Impasse à Rua José do Patrocínio Lt 2','Lisboa','1950-005','Portugal'),(7,24,'Impasse à Rua José do Patrocínio Lt 3','Lisboa','1950-005','Portugal'),(8,8,'Impasse à Rua José do Patrocínio Lt 4','Lisboa','1950-005','Portugal'),(9,9,'Rua Actriz Palmira Bastos Bairro das Amendoeiras Pares de 10','Lisboa','1950-005','Portugal'),(10,10,'Rua Capitão Leitão Ímpares de 5','Lisboa','1950-005','Portugal'),(11,11,'Rua Capitão Leitão JCA','Santarém','2000-405','Portugal'),(12,12,'Rua Capitão Leitão JCB','Santarém','2000-405','Portugal'),(13,13,'Rua Capitão Leitão Pares de 10','Lisboa','1950-005','Portugal'),(14,14,'Travessa Frei Carlos Vila Cartuxa','Évora','7000-737','Portugal'),(15,15,'Praça Marcolino Sousa','Évora','7000-737','Portugal'),(16,16,'Rua Doutor João Vieira da Silva','Évora','7000-737','Portugal'),(17,17,'Rua Frei Carlos','Évora','7000-737','Portugal'),(18,18,'Rua Associação de Moradores de São Vítor','Porto','4000-009','Portugal'),(19,19,'Rua Aquilino Ribeiro Bairro de Santa Apolónia','Coimbra','3020-009','Portugal'),(20,20,'Rua Bernardo de Santareno Bairro de Santa Apolónia','Coimbra','3020-009','Portugal'),(21,21,'Rua Ferreira de Castro Bairro de Santa Apolónia','Coimbra','3020-009','Portugal'),(22,22,'Rua Aurélia de Sousa','Porto','4000-009','Portugal'),(23,6,'Praceta da Primavera','Albufeira','8200-008','Portugal'),(24,7,'Praceta Samora Barros','Albufeira','8200-008','Portugal'),(25,25,'Rua de António Emílio de Magalhães','Porto','4000-009','Portugal');
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
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client_User`
--

LOCK TABLES `Client_User` WRITE;
/*!40000 ALTER TABLE `Client_User` DISABLE KEYS */;
INSERT INTO `Client_User` VALUES (1,'Alberto','Fernandes','alberto@gmail.com','******','00351918805419'),(2,'Beatriz','Gonçalves','beatriz@gmail.com','*********','00351920089223'),(3,'Ana','Simões','ana@gmail.com','*****','00351937908151'),(4,'David','Garcia','david@hotmail.com','******','00351937809355'),(5,'Toze','Marreco','toze@gmail.com','******','00351937777355'),(6,'Julieta','Batatas','juju@yahoo.com','*********','00351912309355'),(7,'Gervasio','Banana','gerva@gmail.com','****','00351917809111'),(8,'Diogo','Pereira','diogo@gmail.com','*********','00351927255116'),(9,'Luis','Duarte','lulu@gmail.com','****','00351967809444'),(10,'Rodrigo','Luz','rodri@yahoo.com','******','00351967779756'),(11,'Filipa','Oliveira','filipa@gmail.com','****','0035195751122'),(12,'Manuel','Lopes','lopes@hotmail.com','******','00351967779599'),(13,'Joaquim','Bonito','joaquim@loja.pt.com','**********','00351928590816'),(14,'Liliana','Gomes','lili.gomes@gmail.com','******','00351960982354'),(15,'Pedro','Costa','p.costa@outlook.com','******','00351917114653'),(16,'Carolina','Fernandes','carolina@outlook.com','******','00351927465966'),(17,'Matilde','Gordo','m.gordo@hotmail.com','******','00351910294657'),(18,'Mariana','Nunes','mariana@hotmail.com','******','00351969387465'),(19,'Maria','Esteves','esteves@outlook.com','******','00351968293056'),(20,'Afonso','Costa','afonso@yahoo.com','******','00351914502938'),(21,'Xavier','Nunes','xavier.n@outlook.com','******','00351961029645'),(22,'Vasco','Simão','vasco@outlook.com','******','00351947889023'),(23,'João','Papoila','joao.p@yahoo.com','******','00351934598763'),(24,'Diana','Mendes','diana@hotmail.com','******','00351910293856'),(25,'Fátima','Chaves','chaves@yahoo.com','******','00351923347890');
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
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
INSERT INTO `Company` VALUES (1,'WomenSmell','info@womensmell.pt','00351919102219','www.womensmell.pt','Av. da Liberdade 100','1269-046','Lisboa','Portugal');
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
  PRIMARY KEY (`discount_id`),
  UNIQUE KEY `discount_id` (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
INSERT INTO `Discount` VALUES (1,'0% discount','no discount',0,1),(2,'10% discount','special offer',10,1),(3,'20% discount','black friday',20,1);
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fragrance`
--

DROP TABLE IF EXISTS `Fragrance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fragrance` (
  `fragrance_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fragrance_class_id` bigint unsigned NOT NULL,
  `fragrance_name` varchar(20) NOT NULL,
  PRIMARY KEY (`fragrance_id`),
  UNIQUE KEY `fragrance_id` (`fragrance_id`),
  KEY `fragrance_class_id` (`fragrance_class_id`),
  CONSTRAINT `fragrance_ibfk_1` FOREIGN KEY (`fragrance_class_id`) REFERENCES `Fragrance_Class` (`fragrance_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fragrance`
--

LOCK TABLES `Fragrance` WRITE;
/*!40000 ALTER TABLE `Fragrance` DISABLE KEYS */;
INSERT INTO `Fragrance` VALUES (1,1,'Budapest'),(2,2,'Kiev'),(3,3,'Bern'),(4,4,'Luxembourg'),(5,5,'Oslo'),(6,1,'Amesterdam'),(7,2,'Paris'),(8,3,'Prague'),(9,4,'Athens'),(10,5,'Lisbon'),(11,1,'London'),(12,2,'Madrid'),(13,1,'Dublin'),(14,2,'Berlin'),(15,3,'Bucharest'),(16,4,'Moncaco'),(17,5,'Moscow'),(18,1,'Rome'),(19,2,'Vienna'),(20,3,'Zagreb');
/*!40000 ALTER TABLE `Fragrance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fragrance_Class`
--

DROP TABLE IF EXISTS `Fragrance_Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fragrance_Class` (
  `fragrance_class_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fragrance_class_name` varchar(20) NOT NULL,
  PRIMARY KEY (`fragrance_class_id`),
  UNIQUE KEY `fragrance_class_id` (`fragrance_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fragrance_Class`
--

LOCK TABLES `Fragrance_Class` WRITE;
/*!40000 ALTER TABLE `Fragrance_Class` DISABLE KEYS */;
INSERT INTO `Fragrance_Class` VALUES (1,'Parfum'),(2,'Eau de Parfum'),(3,'Eau de Toilette'),(4,'Eau de Cologne'),(5,'Eau Fraiche');
/*!40000 ALTER TABLE `Fragrance_Class` ENABLE KEYS */;
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
  `tax_rate` float NOT NULL,
  `subtotal` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `due_date` date NOT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_id` (`invoice_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES (1,1,23,16.2,1,'2020-04-06'),(2,2,23,59.98,1,'2018-04-15'),(3,3,23,19.99,1,'2019-04-17'),(4,4,23,157.95,1,'2019-04-18'),(5,5,23,259.2,1,'2018-08-05'),(6,6,23,263.25,1,'2021-08-06'),(7,7,23,64.8,1,'2018-08-15'),(8,8,23,145.8,1,'2020-08-24'),(9,9,23,81,1,'2019-05-19'),(10,10,23,194.4,1,'2019-05-23'),(11,11,23,81,1,'2020-06-07'),(12,12,23,48.6,1,'2019-06-29'),(13,13,23,145.8,1,'2019-07-09'),(14,14,23,133.5,1,'2021-07-19'),(15,15,23,324,1,'2021-08-13'),(16,16,23,90.98,1,'2018-08-22'),(17,17,23,35.99,1,'2019-11-03'),(18,18,23,81,1,'2019-12-17'),(19,19,23,24.99,1,'2020-12-19'),(20,20,23,40.5,1,'2020-01-15');
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `invoice_details_view`
--

DROP TABLE IF EXISTS `invoice_details_view`;
/*!50001 DROP VIEW IF EXISTS `invoice_details_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `invoice_details_view` AS SELECT 
 1 AS `INVOICE NUMBER`,
 1 AS `FRAGRANCE NAME`,
 1 AS `UNIT COST`,
 1 AS `QUANTITY`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `invoice_head_totals_view`
--

DROP TABLE IF EXISTS `invoice_head_totals_view`;
/*!50001 DROP VIEW IF EXISTS `invoice_head_totals_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `invoice_head_totals_view` AS SELECT 
 1 AS `INVOICE NUMBER`,
 1 AS `DATE OF ISSUE`,
 1 AS `Client Name`,
 1 AS `Street Address`,
 1 AS `City`,
 1 AS `Country`,
 1 AS `Postal Code`,
 1 AS `Company Name`,
 1 AS `Company Address`,
 1 AS `Company Phone`,
 1 AS `Company E-mail`,
 1 AS `Company Website`,
 1 AS `TERMS`,
 1 AS `SUBTOTAL`,
 1 AS `DISCOUNT RATE (%)`,
 1 AS `DISCOUNT`,
 1 AS `TAX RATE (%)`,
 1 AS `TAX`,
 1 AS `TOTAL`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `data1` varchar(255) NOT NULL,
  `data2` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_data` AFTER INSERT ON `log` FOR EACH ROW BEGIN
	  INSERT INTO Log (action, id, timestamp, data1, data2)
		VALUES('insert', NEW.id, NOW(), NEW.data1, NEW.data2);
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  PRIMARY KEY (`order_product_id`),
  UNIQUE KEY `order_product_id` (`order_product_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Product`
--

LOCK TABLES `Order_Product` WRITE;
/*!40000 ALTER TABLE `Order_Product` DISABLE KEYS */;
INSERT INTO `Order_Product` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,1),(4,4,4,3),(5,5,5,4),(6,6,5,5),(7,7,6,2),(8,8,6,1),(9,9,7,1),(10,10,8,2),(11,11,8,1),(12,12,9,1),(13,13,9,4),(14,14,8,3),(15,15,7,5),(16,16,6,2),(17,17,5,1),(18,18,4,2),(19,19,3,1),(20,20,2,2);
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
		SET product_quantity = product_quantity - New.quantity
	WHERE product_id = NEW.product_id;
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
  `due_date` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `client_id` (`client_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Client_User` (`client_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `Discount` (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,1,'2018-10-04 08:12:34'),(2,2,2,'2020-10-04 17:12:34'),(3,3,3,'2020-01-10 18:21:09'),(4,4,1,'2019-12-14 17:03:26'),(5,5,2,'2020-12-12 16:03:27'),(6,6,3,'2019-10-29 12:31:36'),(7,7,1,'2018-08-17 13:15:43'),(8,8,2,'2019-08-08 21:30:56'),(9,9,3,'2019-07-14 20:10:22'),(10,10,1,'2019-07-04 10:20:12'),(11,11,1,'2019-06-24 18:04:21'),(12,12,2,'2020-10-04 09:45:22'),(13,13,1,'2018-06-02 19:33:38'),(14,14,1,'2019-05-18 16:10:27'),(15,15,1,'2019-05-14 15:10:49'),(16,16,1,'2020-03-19 14:00:51'),(17,17,2,'2018-03-10 22:00:40'),(18,18,3,'2021-02-28 11:10:15'),(19,19,1,'2021-03-01 12:35:24'),(20,20,2,'2021-10-04 10:23:11');
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
  `fragrance_id` bigint unsigned NOT NULL,
  `product_color_id` bigint unsigned NOT NULL,
  `product_size_id` bigint unsigned NOT NULL,
  `warehouse_id` bigint unsigned NOT NULL,
  `product_price` float NOT NULL,
  `product_quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`fragrance_id`,`product_color_id`,`product_size_id`,`warehouse_id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `fragrance_id` (`fragrance_id`),
  KEY `product_color_id` (`product_color_id`),
  KEY `product_size_id` (`product_size_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fragrance_id`) REFERENCES `Fragrance` (`fragrance_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`product_color_id`) REFERENCES `Product_Color` (`product_color_id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`product_size_id`) REFERENCES `Product_Size` (`product_size_id`),
  CONSTRAINT `product_ibfk_4` FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,1,1,1,1,16.2,10),(2,2,3,2,1,20.25,5),(3,3,2,3,1,24.99,6),(4,4,4,4,1,40.5,8),(5,5,5,5,1,35.99,7),(6,6,6,1,1,45.49,9),(7,7,1,2,1,64.8,11),(8,8,2,3,1,44.5,12),(9,9,3,4,1,36.45,6),(10,10,4,5,1,48.6,7),(11,11,5,1,1,81,8),(12,12,6,2,1,97.2,9),(13,1,1,3,1,81,6),(14,2,2,4,1,145.8,6),(15,3,3,5,1,32.4,7),(16,4,4,1,1,52.65,7),(17,5,5,2,1,64.8,8),(18,6,6,3,1,52.65,8),(19,7,1,4,1,19.99,5),(20,8,2,5,1,29.99,9);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
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
  PRIMARY KEY (`product_color_id`),
  UNIQUE KEY `product_color_id` (`product_color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Color`
--

LOCK TABLES `Product_Color` WRITE;
/*!40000 ALTER TABLE `Product_Color` DISABLE KEYS */;
INSERT INTO `Product_Color` VALUES (1,'transparent'),(2,'baby blue'),(3,'milky way'),(4,'sea mist'),(5,'brilliant beige'),(6,'macadamia nut'),(7,'peach shortcake'),(8,'sheer rosebud'),(9,'very pale yellow'),(10,'pistachio green'),(11,'gold'),(12,'silver');
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
  PRIMARY KEY (`product_rating_id`),
  UNIQUE KEY `product_rating_id` (`product_rating_id`),
  KEY `product_id` (`product_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `product_rating_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`),
  CONSTRAINT `product_rating_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `Client_User` (`client_id`),
  CONSTRAINT `product_rating_chk_1` CHECK (((`grade` > 0) and (`grade` < 11)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Rating`
--

LOCK TABLES `Product_Rating` WRITE;
/*!40000 ALTER TABLE `Product_Rating` DISABLE KEYS */;
INSERT INTO `Product_Rating` VALUES (1,1,2,1),(2,2,16,3),(3,3,9,3),(4,4,12,4),(5,5,16,5),(6,7,4,5),(7,8,1,6),(8,6,15,7),(9,1,13,6),(10,10,15,6),(11,3,24,7),(12,5,18,7),(13,6,20,7),(14,7,14,7),(15,7,3,8),(16,8,11,8),(17,9,5,9),(18,10,10,10),(19,3,18,7),(20,9,1,8);
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
  PRIMARY KEY (`product_size_id`),
  UNIQUE KEY `product_size_id` (`product_size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Size`
--

LOCK TABLES `Product_Size` WRITE;
/*!40000 ALTER TABLE `Product_Size` DISABLE KEYS */;
INSERT INTO `Product_Size` VALUES (1,'Tiny'),(2,'Small'),(3,'Medium'),(4,'Large'),(5,'Huge'),(6,'One Size');
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
  PRIMARY KEY (`warehouse_id`),
  UNIQUE KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse`
--

LOCK TABLES `Warehouse` WRITE;
/*!40000 ALTER TABLE `Warehouse` DISABLE KEYS */;
INSERT INTO `Warehouse` VALUES (1,'NewSmell Warehouse','Avenida Infante Dom Henrique Armazém O','Lisboa','1950-408');
/*!40000 ALTER TABLE `Warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `invoice_details_view`
--

/*!50001 DROP VIEW IF EXISTS `invoice_details_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `invoice_details_view` AS select `I`.`invoice_id` AS `INVOICE NUMBER`,`F`.`fragrance_name` AS `FRAGRANCE NAME`,`P`.`product_price` AS `UNIT COST`,`OP`.`quantity` AS `QUANTITY`,round((`P`.`product_price` * `OP`.`quantity`),2) AS `AMOUNT` from ((((`invoice` `I` join `orders` `O` on((`I`.`order_id` = `O`.`order_id`))) join `order_product` `OP` on((`O`.`order_id` = `OP`.`order_id`))) join `product` `P` on((`OP`.`product_id` = `P`.`product_id`))) join `fragrance` `F` on((`P`.`fragrance_id` = `F`.`fragrance_id`))) order by `I`.`invoice_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `invoice_head_totals_view`
--

/*!50001 DROP VIEW IF EXISTS `invoice_head_totals_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `invoice_head_totals_view` AS select `I`.`invoice_id` AS `INVOICE NUMBER`,`I`.`due_date` AS `DATE OF ISSUE`,concat(`CU`.`client_name`,' ',`CU`.`client_surname`) AS `Client Name`,`CA`.`client_address` AS `Street Address`,`CA`.`client_city` AS `City`,`CA`.`client_country` AS `Country`,`CA`.`client_postalcode` AS `Postal Code`,`C`.`company_name` AS `Company Name`,concat(`C`.`company_address`,', ',`C`.`company_postalcode`,' ',`C`.`company_city`,', ',`C`.`company_country`) AS `Company Address`,`C`.`company_phone` AS `Company Phone`,`C`.`company_email` AS `Company E-mail`,`C`.`company_website` AS `Company Website`,cast((`I`.`due_date` + interval 3 day) as date) AS `TERMS`,`I`.`subtotal` AS `SUBTOTAL`,`D`.`discount_value` AS `DISCOUNT RATE (%)`,round((`I`.`subtotal` * (`D`.`discount_value` / 100)),2) AS `DISCOUNT`,`I`.`tax_rate` AS `TAX RATE (%)`,round(((`I`.`subtotal` * (1 - (`D`.`discount_value` / 100))) * (`I`.`tax_rate` / 100)),2) AS `TAX`,round(((`I`.`subtotal` - (`I`.`subtotal` * (`D`.`discount_value` / 100))) + ((`I`.`subtotal` * (1 - (`D`.`discount_value` / 100))) * (`I`.`tax_rate` / 100))),2) AS `TOTAL` from (((((`orders` `O` join `invoice` `I` on((`O`.`order_id` = `I`.`order_id`))) left join `discount` `D` on((`O`.`discount_id` = `D`.`discount_id`))) left join `client_user` `CU` on((`CU`.`client_id` = `O`.`client_id`))) left join `client_address` `CA` on((`CU`.`client_id` = `CA`.`client_id`))) join `company` `C`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-03 16:27:22
