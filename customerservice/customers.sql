DROP DATABASE IF EXISTS `customers`;

CREATE DATABASE customers;

use customers;

-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: customers
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer_table`
--

DROP TABLE IF EXISTS `customer_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_table` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_first_name` varchar(45) NOT NULL,
  `customer_last_name` varchar(45) NOT NULL,
  `customer_password` varchar(100) NOT NULL,
  `customer_emailid` varchar(45) NOT NULL,
  `customer_mobile` varchar(45) NOT NULL,
  `customer_address` mediumtext NOT NULL COMMENT 'This should contain json string representing address fields',
  `customer_created_at` date DEFAULT NULL,
  `customer_updated_at` date DEFAULT NULL,
  `customer_username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
  UNIQUE KEY `customer_emailid_UNIQUE` (`customer_emailid`),
  UNIQUE KEY `customer_mobile_UNIQUE` (`customer_mobile`),
  UNIQUE KEY `customer_username_UNIQUE` (`customer_username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_table`
--

LOCK TABLES `customer_table` WRITE;
/*!40000 ALTER TABLE `customer_table` DISABLE KEYS */;
INSERT INTO `customer_table` VALUES (1, 'Forest','Gump','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','forest@gump.com','969-354-0011','New York',curdate(),curdate(),'forest'),(2, 'Tony','Stark','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','tony@stark.com','343-988-0123','Bangalore',curdate(),curdate(),'tony');
/*!40000 ALTER TABLE `customer_table` ENABLE KEYS */;
UNLOCK TABLES;
