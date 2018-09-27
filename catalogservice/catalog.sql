DROP DATABASE IF EXISTS `catalog`;

CREATE DATABASE catalog;

use catalog;

-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: catalog
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
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(60) NOT NULL,
  `product_description` varchar(200) DEFAULT NULL,
  `product_image_links` mediumtext COMMENT 'This should contain comma seprated image links',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_table`
--

LOCK TABLES `product_table` WRITE;
/*!40000 ALTER TABLE `product_table` DISABLE KEYS */;
INSERT INTO `product_table` VALUES (1,'Iphone6c','Latest phone by Apple','www.cdn.com/iphone6s,www.cdn.com/small/iphone6s'),(2,'Nexus6p','Latest phone by Google and Huawei','www.cdn.com/nexus6p,www.cdn.com/small/nexus6p'),(3,'HP 14-AM081TU','2.3GHz Intel Core i5-6200U processor,4GB DDR4 memory is upgradable to 16GB,14-inch screen','www.cdn.com/HP14-AM081TU,www.cdn.com/small/HP14-AM081TU'),(4,'HP 15-ac122tu','2GHz Intel Core i3 5005U 5th Gen Pocessor,4GB DDR3 RAM,15.6-inch screen','www.cdn.com/HP15-ac122tu,www.cdn.com/small/HP15-ac122tu'),(5,'HP 14-AC171TU','2GHz Intel Core i3-5005U 5th Gen Processor,4GB DDR3L RAM,14-inch screen','www.cdn.com/HP14-AC171TU,www.cdn.com/small/HP14-AC171TU'),(6,'Canon EOS 1300D','18MP APS-C CMOS sensor and DIGIC 4+,9-point AF with 1 center cross-type AF point,Standard ISO: 100 to 6400, expandable to 12800','www.cdn.com/CanonEOS1300D,www.cdn.com/small/CanonEOS1300D'),(7,'Canon EOS 1200D','18 megapixel CMOS (APS-C) image sensor,High-performance DIGIC 4 image processor,ISO 100-6400 (expandable to H: 12800) to shoot from bright to dim light','www.cdn.com/CanonEOS1200D,www.cdn.com/small/CanonEOS1200D'),(8,'Nikon D3300','24.2 megapixel effective sensor without an optical low-pass filter,Full-colour RGB metering sensor,Nikon\'s scene recognition system','www.cdn.com/NikonD3300,www.cdn.com/small/NikonD3300 '),(9,'Nikon D5200','Equipped with a 24.1 megapixel DX-format sensor,Powered with EXPEED 3 engine,Sensitivity range from ISO 100 to ISO 6400 and the best in class 39 point AF system','www.cdn.com/NikonD5200,www.cdn.com/small/NikonD5200');
/*!40000 ALTER TABLE `product_table` ENABLE KEYS */;
UNLOCK TABLES;
