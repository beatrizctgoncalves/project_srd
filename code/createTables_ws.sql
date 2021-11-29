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
  INSERT INTO `Log` (act, action_time, id, time_stamp, data1, data2)
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
INSERT INTO `Client_Address` VALUES (1,1,'Rua Cassiano Branco Bairro dos Loios Escola Secundária Damião de Góis','Lisboa',' 1950-005','Portugal'),(2,2,'Rua Cassiano Branco Bairro dos Loios Escola 1ºCiclo Ensino Básico 9','Lisboa','1950-005','Portugal'),(3,3,'Rua Cassiano Branco Bairro dos Loios Lt 221 Lj','Lisboa','1950-005','Portugal'),(4,4,'Rua Cassiano Branco Bairro dos Loios Lt 221','Lisboa','1950-005','Portugal'),(5,5,'Impasse à Rua José do Patrocínio Lt 1','Lisboa','1950-005','Portugal'),(6,6,'Impasse à Rua José do Patrocínio Lt 2','Lisboa','1950-005','Portugal'),(7,7,'Impasse à Rua José do Patrocínio Lt 3','Lisboa','1950-005','Portugal'),(8,8,'Impasse à Rua José do Patrocínio Lt 4','Lisboa','1950-005','Portugal'),(9,9,'Rua Actriz Palmira Bastos Bairro das Amendoeiras Pares de 10','Lisboa','1950-005','Portugal'),(10,10,'Rua Capitão Leitão Ímpares de 5','Lisboa','1950-005','Portugal'),(11,11,'Rua Capitão Leitão JCA','Lisboa','1950-005','Portugal'),(12,12,'Rua Capitão Leitão JCB','Lisboa','1950-005','Portugal'),(13,13,'Rua Capitão Leitão Pares de 10','Lisboa','1950-005','Portugal'),(14,14,'Travessa Frei Carlos Vila Cartuxa','Évora','7000-737','Portugal'),(15,15,'Praça Marcolino Sousa','Évora','7000-737','Portugal'),(16,16,'Rua Doutor João Vieira da Silva','Évora','7000-737','Portugal'),(17,17,'Rua Frei Carlos','Évora','7000-737','Portugal'),(18,18,'Rua Associação de Moradores de São Vítor','Porto','4000-009','Portugal'),(19,19,'Rua Aquilino Ribeiro Bairro de Santa Apolónia','Coimbra','3020-009','Portugal'),(20,20,'Rua Bernardo de Santareno Bairro de Santa Apolónia','Coimbra','3020-009','Portugal'),(21,21,'Rua Ferreira de Castro Bairro de Santa Apolónia','Coimbra','3020-009','Portugal'),(22,22,'Rua Aurélia de Sousa','Porto','4000-009','Portugal'),(23,23,'Praceta da Primavera','Albufeira','8200-008','Portugal'),(24,24,'Praceta Samora Barros','Albufeira','8200-008','Portugal'),(25,25,'Rua de António Emílio de Magalhães','Porto','4000-009','Portugal');
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
INSERT INTO `Discount` VALUES (1,'0% discount','no discount',5,1),(2,'10% discount','special offer',10,1),(3,'20% discount','black friday',0,1);
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
  PRIMARY KEY (`fragrance_id`,`fragrance_class_id`),
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
  `sales_amount` float NOT NULL,
  `tax_rate` float NOT NULL,
  `tax_amount` float NOT NULL,
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
INSERT INTO `Invoice` VALUES (1,1,0,0.23,19.55,1,'2019-04-06'),(2,2,21.87,0.23,50.3,1,'2019-04-15'),(3,3,21.04,0.23,24.2,1,'2019-04-17'),(4,4,0,0.23,6.9,1,'2019-04-18'),(5,5,30.35,0.23,69.8,1,'2019-08-05'),(6,6,11.48,0.23,13.2,1,'2019-08-06'),(7,7,0,0.23,18.63,1,'2019-08-15'),(8,8,15.58,0.23,35.83,1,'2019-08-24'),(9,9,19.44,0.23,22.36,1,'2019-05-19'),(10,10,0,0.23,18.63,1,'2019-05-23'),(11,11,0,0.23,59.62,1,'2019-06-07'),(12,12,8.3,0.23,19,1,'2019-06-29'),(13,13,0,0.23,18.63,1,'2019-07-09'),(14,14,0,0.23,13.2,1,'2019-07-19'),(15,15,0,0.23,24.22,1,'2019-08-13'),(16,16,0,0.23,44.82,1,'2019-08-22'),(17,17,8.1,0.23,18.63,1,'2019-11-03'),(18,18,3.24,0.23,3.73,1,'2019-12-17'),(19,19,0,0.23,9.32,1,'2019-12-19'),(20,20,4.86,0.23,11.18,1,'2020-01-15');
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
  PRIMARY KEY (`order_product_id`),
  UNIQUE KEY `order_product_id` (`order_product_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Product`
--

LOCK TABLES `Order_Product` WRITE;
/*!40000 ALTER TABLE `Order_Product` DISABLE KEYS */;
INSERT INTO `Order_Product` VALUES (1,1,1,1),(2,2,20,2),(3,2,19,1),(4,2,18,3),(5,2,17,4),(6,3,16,5),(7,3,15,2),(8,4,14,1),(9,5,13,1),(10,5,12,2),(11,5,11,1),(12,5,10,1),(13,6,9,4),(14,6,8,3),(15,7,7,5),(16,8,6,2),(17,8,5,1),(18,9,4,2),(19,10,3,1),(20,11,2,2),(21,11,1,1),(22,11,2,3),(23,12,3,1),(24,12,4,4),(25,13,5,1);
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
  `total_amount` int NOT NULL DEFAULT '0',
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
INSERT INTO `Orders` VALUES (1,1,1,85),(2,2,2,219),(3,3,3,105),(4,4,1,30),(5,5,2,303),(6,22,3,57),(7,10,1,81),(8,2,2,156),(9,1,3,97),(10,4,1,81),(11,8,1,259),(12,9,2,83),(13,10,1,81),(14,11,1,57),(15,12,1,105),(16,13,1,195),(17,14,2,81),(18,11,3,16),(19,15,1,41),(20,17,2,49);
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
INSERT INTO `Product` VALUES (1,1,1,1,1,16.2,8),(2,2,3,2,1,20.25,0),(3,3,2,3,1,24.99,4),(4,4,4,4,1,40.5,2),(5,5,5,5,1,35.99,5),(6,6,6,1,1,45.49,7),(7,7,1,2,1,64.8,6),(8,8,2,3,1,44.5,9),(9,9,3,4,1,36.45,2),(10,10,4,5,1,48.6,6),(11,11,5,1,1,81,7),(12,12,6,2,1,97.2,7),(13,1,1,3,1,81,5),(14,2,2,4,1,145.8,5),(15,3,3,5,1,32.4,5),(16,4,4,1,1,52.65,2),(17,5,5,2,1,64.8,4),(18,6,6,3,1,52.65,5),(19,7,1,4,1,19.99,4),(20,8,2,5,1,29.99,7);
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
  CONSTRAINT `product_rating_chk_1` CHECK (((`grade` > 0) and (`grade` < 6)))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Rating`
--

LOCK TABLES `Product_Rating` WRITE;
/*!40000 ALTER TABLE `Product_Rating` DISABLE KEYS */;
INSERT INTO `Product_Rating` VALUES (1,1,2,2),(2,2,16,3),(3,3,9,3),(4,4,12,4),(5,5,16,5),(6,7,4,5),(7,8,1,1),(8,6,15,5),(9,1,13,2),(10,10,15,1),(11,3,24,2),(12,5,18,3),(13,6,20,3),(14,7,14,4),(15,7,3,4),(16,8,11,4),(17,9,5,5),(18,10,10,5),(19,3,18,3),(20,9,1,2),(21,8,5,3),(22,4,1,5),(23,7,4,5),(24,3,7,4),(25,4,10,4);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-29 20:38:14