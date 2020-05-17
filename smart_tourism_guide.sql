-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: smart_tourism_guide
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_fname` varchar(100) NOT NULL,
  `a_lname` varchar(100) DEFAULT NULL,
  `a_age` int NOT NULL,
  `a_phone` varchar(20) DEFAULT NULL,
  `a_mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atm`
--

DROP TABLE IF EXISTS `atm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atm` (
  `atm_id` varchar(20) NOT NULL,
  `atm_name` varchar(50) NOT NULL,
  `atm_type` varchar(20) DEFAULT NULL,
  `atm_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`atm_name`),
  KEY `atm_id` (`atm_id`),
  CONSTRAINT `atm_ibfk_1` FOREIGN KEY (`atm_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atm`
--

LOCK TABLES `atm` WRITE;
/*!40000 ALTER TABLE `atm` DISABLE KEYS */;
/*!40000 ALTER TABLE `atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` varchar(20) NOT NULL,
  `city_name` varchar(20) NOT NULL,
  `city_pin` varchar(20) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_fname` varchar(100) NOT NULL,
  `c_lname` varchar(100) DEFAULT NULL,
  `c_age` int NOT NULL,
  `c_phone` varchar(20) DEFAULT NULL,
  `c_mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `admin` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotel_id` varchar(20) NOT NULL,
  `h_name` varchar(50) NOT NULL,
  `h_contact` varchar(20) DEFAULT NULL,
  `h_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`h_name`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_pics`
--

DROP TABLE IF EXISTS `place_pics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_pics` (
  `pic_id` int NOT NULL,
  `caption` varchar(50) DEFAULT NULL,
  `img` longblob NOT NULL,
  `place_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pic_id`),
  KEY `place_id` (`place_id`),
  CONSTRAINT `place_pics_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `tourist_place` (`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_pics`
--

LOCK TABLES `place_pics` WRITE;
/*!40000 ALTER TABLE `place_pics` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_pics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `railway_station`
--

DROP TABLE IF EXISTS `railway_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `railway_station` (
  `station_id` varchar(20) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `s_contact` varchar(20) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`s_name`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `railway_station_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `railway_station`
--

LOCK TABLES `railway_station` WRITE;
/*!40000 ALTER TABLE `railway_station` DISABLE KEYS */;
/*!40000 ALTER TABLE `railway_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` varchar(20) NOT NULL,
  `ticket_number` varchar(50) DEFAULT NULL,
  `ticket_amount` int NOT NULL,
  `ticket_total` int NOT NULL,
  `ticket_time` datetime NOT NULL,
  PRIMARY KEY (`ticket_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tourist_place` (`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourist_place`
--

DROP TABLE IF EXISTS `tourist_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourist_place` (
  `place_id` varchar(20) NOT NULL,
  `place_name` varchar(50) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `place_pin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`place_id`),
  KEY `place_pin` (`place_pin`),
  CONSTRAINT `tourist_place_ibfk_1` FOREIGN KEY (`place_pin`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist_place`
--

LOCK TABLES `tourist_place` WRITE;
/*!40000 ALTER TABLE `tourist_place` DISABLE KEYS */;
/*!40000 ALTER TABLE `tourist_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `train_id` varchar(20) NOT NULL,
  `train_name` varchar(50) NOT NULL,
  `train_time` datetime DEFAULT NULL,
  PRIMARY KEY (`train_name`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `railway_station` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-18  1:09:00
