-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: productdb
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cateID` int NOT NULL AUTO_INCREMENT,
  `cateName` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`cateID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Home Soccer Kit 2023/24'),(2,'Away Soccer Kit 2023/24'),(3,'Third Soccer Kit 2023/24'),(4,'Nike Soccer Boots'),(5,'Adidas Soccer Boots'),(6,'Puma Soccer Boots'),(7,'Mizuno Soccer Boots'),(8,'Umbro Soccer Boots');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `InvoiceID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `InvoiceDate` datetime NOT NULL,
  `TotalAmount` int NOT NULL DEFAULT '0',
  `IsProcessed` enum('y','n') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineitem`
--

DROP TABLE IF EXISTS `lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineitem` (
  `LineItemID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL DEFAULT '0',
  `ProductID` int NOT NULL DEFAULT '0',
  `Quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LineItemID`),
  KEY `lineitem_ibfk_1_idx` (`UserID`),
  CONSTRAINT `lineitem_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineitem`
--

LOCK TABLES `lineitem` WRITE;
/*!40000 ALTER TABLE `lineitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `ProductDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `ProductPrice` int NOT NULL DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cateID` int NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `fk_categories_idx` (`cateID`),
  CONSTRAINT `fk_category` FOREIGN KEY (`cateID`) REFERENCES `category` (`cateID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'mun_home','Manchester United Home Kit 2023/24',100000,'home',1),(2,'rma_home','Real Madrid Home Kit 2023/24',120000,'home',1),(3,'mci_home','Manchester City Home Kit 2023/24',80000,'home',1),(4,'bar_home','FC Barcelona Home Kit 2023/24',100000,'home',1),(5,'bay_home','FC Bayern Munchen Home Kit 2023/24',100000,'home',1),(6,'psg_home','Paris Saint-Germain Home Kit 2023/24',90000,'home',1),(7,'acm_home','AC Milan Home Kit 2023/24',100000,'home',1),(8,'tot_home','Tottenham Hotspur Home Kit 2023/24',100000,'home',1),(9,'dor_home','Borussia Dortmund Home Kit 2023/24',90000,'home',1),(10,'liv_home','Liverpool Home Kit 2023/24',120000,'home',1),(11,'nike1','Nike Phantom Elite GX Firm Ground',350000,'boots',4),(12,'nike2','Nike Mecurial Superfly 9 Academy Multi-Ground',180000,'boots',4),(13,'nike3','Nike Tiempo Legend 9 Elite FG Firm-Ground',370000,'boots',4),(14,'nike4','Nike Premier 3 Firm-Ground',300000,'boots',4),(15,'nike5','Nike Phantom GX Pro FG',430000,'boots',4),(16,'adidas1','Adidas Predator Accuracy.3 Laceless Firm Ground',100000,'boots',5),(17,'adidas2','Adidas X SpeedPortal Messi.1 Firm Ground',310000,'boots',5),(18,'adidas3','Adidas X Crazyfast.3 Firm Ground',170000,'boots',5),(19,'adidas4','Adidas Copa Pure+ Firm Ground',350000,'boots',5),(20,'adidas5','Adidas Deportivo II Flexible Ground',130000,'boots',5),(21,'puma1','Puma Future Ultimate Neymar Jr FG/AG',500000,'boots',6),(22,'puma2','Puma Ultra Ultimate FG/AG',250000,'boots',6),(23,'puma3','Puma King Ultimate Energy FG/AG',500000,'boots',6),(24,'mizuno1','Mizuno Morelia Neo II Beta x SR4 Elite FG',330000,'boots',7),(25,'mizuno2','Mizuno Monarcida Neo II Select FG',110000,'boots',7),(26,'mizuno3','Mizuno Alpha Made In Japan SG',530000,'boots',7),(27,'umbro1','Umbro Tocco Pro SG',180000,'boots',8),(28,'umbro2','Umbro Velotica VI Pro SG',270000,'boots',8),(29,'umbro3','Umbro Medusae II Elite FG',180000,'boots',8),(30,'umbro4','Umbro Velotica VI Premier FG',160000,'boots',8),(31,'juv_home','Juventus Home Kit 2023/24',90000,'home',1),(32,'int_home','Inter Milan Home Kit 2023/24',80000,'home',1),(33,'ars_home','Arsenal Home Kit 2023/24',100000,'home',1),(34,'che_home','Chelsea Home Kit 2023/24',100000,'home',1),(35,'mar_home','Olympique Marseille Home Kit 2023/24',80000,'home',1),(36,'nas_home','Al Nassr Home Kit 2023/24',100000,'home',1),(37,'mia_home','Inter Miami home Kit 2023/24',100000,'home',1),(38,'mun_away','Manchester United Away Kit 2023/24',100000,'away',2),(39,'rma_away','Real Madrid Away Kit 2023/24',120000,'away',2),(40,'mci_away','Manchester City Away Kit 2023/24',80000,'away',2),(41,'bar_away','FC Barcelona Away Kit 2023/24',100000,'away',2),(42,'bay_away','FC Bayern Munchen Away Kit 2023/24',100000,'away',2),(43,'psg_away','Paris Saint-Germain Away Kit 2023/24',90000,'away',2),(44,'acm_away','AC Milan Home Away 2023/24',100000,'away',2),(45,'tot_away','Tottenham Hotspur Away Kit 2023/24',100000,'away',2),(46,'dor_away','Borussia Dortmund Away Kit 2023/24',90000,'away',2),(47,'liv_away','Liverpool Away Kit 2023/24',120000,'away',2),(48,'juv_away','Juventus Away Kit 2023/24',90000,'away',2),(49,'int_away','Inter Milan Away Kit 2023/24',80000,'away',2),(50,'ars_away','Arsenal Away Kit 2023/24',100000,'away',2),(51,'che_away','Chelsea Away Kit 2023/24',100000,'away',2),(52,'mun_third','Manchester United Third Kit 2023/24',100000,'third',3),(53,'rma_third','Real Madrid Third Kit 2023/24',120000,'third',3),(54,'mci_third','Manchester City Third Kit 2023/24',80000,'third',3),(55,'bar_third','FC Barcelona Third Kit 2023/24',100000,'third',3),(56,'bay_third','FC Bayern Munchen Third Kit 2023/24',100000,'third',3),(57,'psg_third','Paris Saint-Germain Third Kit 2023/24',90000,'third',3),(58,'acm_third','AC Milan Home Third 2023/24',100000,'third',3),(59,'tot_third','Tottenham Hotspur Third Kit 2023/24',100000,'third',3),(60,'dor_third','Borussia Dortmund Third Kit 2023/24',90000,'third',3),(61,'liv_third','Liverpool Third Kit 2023/24',120000,'third',3),(62,'juv_third','Juventus Third Kit 2023/24',90000,'third',3),(63,'int_third','Inter Milan Third Kit 2023/24',80000,'third',3),(64,'ars_third','Arsenal Third Kit 2023/24',100000,'third',3),(65,'che_third','Chelsea Third Kit 2023/24',100000,'third',3),(66,'mar_away','Olympique Marseille Away Kit 2023/24',80000,'away',2),(67,'mar_third','Olympique Marseille Third Kit 2023/24',80000,'third',3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pltbinh@gmail.com','Le Thanh Binh','Phan','120202','0972762172','So 1 Vo Van Ngan'),(2,'phisach@gmail.com','Phi Sach','Thach','123456','0387030336','484 Le Van Viet'),(3,'phamductin@gmail.com','Duc Tin','Pham','123456','0396493104','Hoang Dieu 2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 19:37:03
