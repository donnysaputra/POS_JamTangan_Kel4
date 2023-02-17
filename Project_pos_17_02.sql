CREATE DATABASE  IF NOT EXISTS `project_pos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_pos`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: project_pos
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (4,'CASIO','2023-02-07 07:18:31','2023-02-07 07:18:31'),(5,'GARMIN','2023-02-07 07:18:31','2023-02-07 07:18:31'),(6,'ALEXANDRE CHRISTIE','2023-02-07 07:18:31','2023-02-07 07:18:31'),(7,'ALBA','2023-02-07 07:18:31','2023-02-07 07:18:31'),(8,'ADIDAS','2023-02-07 07:18:31','2023-02-07 07:18:31'),(9,'SEIKO','2023-02-07 07:18:31','2023-02-07 07:18:31'),(10,'TIMEX','2023-02-07 07:18:31','2023-02-07 07:18:31'),(11,'FOSSIL','2023-02-07 07:18:31','2023-02-07 07:18:31'),(12,'ORIS','2023-02-07 07:18:31','2023-02-07 07:18:31'),(13,'GIODARNO','2023-02-07 07:18:31','2023-02-07 07:18:31'),(14,'JEEP','2023-02-07 07:18:31','2023-02-07 07:18:31'),(15,'DUXOT','2023-02-07 07:18:31','2023-02-07 07:18:31'),(16,'CITIZEN','2023-02-07 07:18:31','2023-02-07 07:18:31'),(17,'TISSOT','2023-02-07 07:18:31','2023-02-07 07:18:31'),(18,'JONAS & VERUS','2023-02-07 07:18:31','2023-02-07 07:18:31'),(19,'SPINNAKER','2023-02-07 07:18:31','2023-02-07 07:18:31');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `brand_id` int NOT NULL,
  `stock_update` int NOT NULL,
  `gender` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `Brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Fossil Grant FS4735 Chronograph White Dial Brown Leather Strap',5,1732000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/DW-9052-1VDR/1l.jpg','2023-02-07 07:18:31','2023-02-14 07:40:33',11,1,'men'),(4,'Casio G-Shock GA-700-1BDR Men Digital Analog Dial Black Resin Band',2,1187000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/GA-700-1BDR/1l.jpg','2023-02-07 07:18:31','2023-02-14 07:39:31',4,1,'men'),(5,'Casio G-Shock DW-5600BB-1DR Black Out Men Digital Dial Black Resin Band',56,1169000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/DW-5600BB-1DR/1l.jpg','2023-02-07 07:18:31','2023-02-14 07:39:31',4,1,'men'),(6,'Casio G-Shock AW-591BB-1ADR Military Black Series Digital Analog Dial Black Resin Band',1,1169000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/AW-591BB-1ADR/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',4,1,'men'),(7,'Casio G-Shock DW-5600MS-1DR Batman Men Digital Dial Black Resin Band',0,1229000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/DW-5600MS-1DR/1l.jpg','2023-02-07 07:18:31','2023-02-14 10:32:44',4,1,'men'),(8,'Casio General LRW-200H-4B2VDF White Dial Pink Resin Band',4,287000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/LRW-200H-4B2VDF/1l.jpg','2023-02-07 07:18:31','2023-02-14 10:32:44',4,5,'women'),(10,'Casio General MW-600F-1AVDF 10 Year Battery Life Black Dial Black Resin Band',5,275000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/MW-600F-1AVDF/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',4,5,'unisex'),(11,'Casio General F-200W-1ADF 10 Years Battery Life Digital Dial Black Resin Band',5,209000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/F-200W-1ASDF/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',4,5,'unisex'),(12,'Casio General F-201WA-1ADF Digital Dial Black Resin Band',5,209000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/F-201WA-1ADF/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',4,5,'unisex'),(13,'Casio General F-200W-9ADF 10 Years Battery Life Digital Dial Black Resin Band',5,209000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/casio/F-200W-9ADF/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',4,5,'unisex'),(15,'Garmin Vivomove Sport 010-02566-50 Smartwatch Digital Dial Black Silicone Strap',1,2999000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/garmin/010-02566-50/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',5,1,'unisex'),(16,'Garmin Vivomove Sport 010-02566-51 Smartwatch Digital Dial Ivory Silicone Strap',1,2999000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/garmin/010-02566-51/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',5,1,'unisex'),(17,'Garmin Fenix 6S 010-02159-5F Smartwatch Stainless Steel Digital Dial Black Rubber Strap',1,9779000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/garmin/010-02159-5F/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',5,1,'unisex'),(18,'Garmin Venu Sq 2 010-02701-80 Smartwatch Digital Dial Shadow Gray Silicone Strap',1,3399000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/garmin/010-02701-80/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',5,1,'unisex'),(19,'Alexandre Christie Chronograph AC 6141 MC BIPBA Man Black Dial Stainless Steel Strap',1,1387000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/alexandre-christie/ACF-6141-MCBIPBA/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',6,1,'men'),(20,'Alba ARSY14X1 White Dial Dual Tone Stainless Steel',1,434000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/alba/ARSY14X1/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',7,1,'men'),(21,'Adidas AOST22075 Digital Dial Black Resin Strap',1,987000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/adidas/AOST22075/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',8,1,'unisex'),(22,'Seiko Prospex SRPE37K1 King Samurai White Dial Black Rubber Strap',10,5773000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/seiko/SRPE37K1/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',9,10,'men'),(23,'Seiko 5 Sports SRPD53K1 Automatic Blue Dial Stainless Steel Strap',1,2890000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/seiko/SRPD53K1/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',9,1,'men'),(24,'Timex DGTL TW5M27700 A-Game Digital Dial Black Resin Strap',1,525000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/timex/TW5M27700/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',10,1,'men'),(25,'Timex Q Reissue TW2U61300 Black Dial Stainless Steel Strap',1,1920000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/timex/TW2U61300/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',10,1,'men'),(26,'Fossil Grant FS4735 Chronograph White Dial Brown Leather Strap',1,1732000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/fossil/FS4735/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',11,1,'men'),(27,'Fossil Grant FS4835 Chronograph Blue Dial Navy Leather Strap',1,1992000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/fossil/FS4835/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',11,1,'men'),(28,'Fossil Jacqueline ES3708 Silver Dial Brown Leather Strap',1,1478000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/fossil/ES3708/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',11,1,'women'),(29,'Timex Q TW2U95800 Silver Dial Gold Stainless Steel Strap',1,2088000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/timex/TW2U95800/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',10,1,'women'),(30,'Alba Fashion AXND52X1 White Dial Dual Tone Stainless Steel',1,489000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/alba/AXND52X1/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',7,1,'women'),(31,'Alexandre Christie Passion AC 2723 LH BBRBARG Ladies Black Rose Motif Dial Black Mesh Strap',1,1050000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/alexandre-christie/ACF-2723-LHBBRBARG/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',6,1,'women'),(32,'Oris Aquis 01-733-7766-4158-07-8-22-05PEB Date Relief Red Dial Stainless Steel Strap',2,24500000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/oris/01-733-7766-4158-07-8-22-05PEB/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',12,2,'men'),(33,'Giordano Eleganza GD-1154-33 Men Black Dial Stainless Steel Strap',3,584000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/giordano/GD-1154-33/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',13,3,'men'),(34,'Jeep Montre Wrangler JPW606201M Dragon Men Black Dial Black Leather Strap Limited Edition',0,3525000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/jeep/JPW606201M/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',14,0,'men'),(35,'DUXOT Audentis DX-2022-11 Matte Silver Chronograph Silver Dial Stainless Steel Strap',4,2058000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/duxot/DX-2022-11/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',15,4,'men'),(36,'Citizen Promaster AT0700-53E Eco-Drive Chronograph Black Dial Dual Tone Stainless Steel Strap',2,3640000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/citizen/AT0700-53E/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',16,2,'men'),(37,'Seiko Ladies SUR804P1 Swarovski Crystal Stainless Steel Strap',1,2456000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/seiko/SUR804P1/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',9,1,'women'),(38,'Fossil Carlie Mini ME3188 Automatic Ladies White Mother Of Pearl Dial Rose Gold Steel Mesh Strap',3,2434000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/fossil/ME3188/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',11,3,'women'),(39,'TISSOT Seastar 1000 T120.210.11.041.00 Blue Dial Stainless Steel Strap',1,5701000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/tissot/T120.210.11.041.00/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',17,1,'women'),(40,'Jonas & Verus Real Y01646-Q3.PPBLZ Men Black Dial Brown Leather Strap',4,937000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/jonas-verus/Y01646-Q3.PPBLZ/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',18,4,'men'),(41,'Spinnaker Bradner SP-5062-03 Men Atlantic Blue Dial Black Leather Strap',1,2280000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/spinnaker/SP-5062-03/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',19,1,'men'),(42,'Spinnaker Hull Diver SP-5088-55 Automatic Patriot Blue Dial Stainless Steel Strap',3,3560000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/spinnaker/SP-5088-55/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',19,3,'men'),(43,'Garmin Venu 2 010-02430-70 Smartwatch Digital Dial Blue Granite Rubber Strap',2,6499000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/garmin/010-02430-70/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',5,2,'unisex'),(44,'Garmin Forerunner 255 010-02641-58 Smartwatch Music Digital Dial White Stone Rubber Strap',3,6659000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/garmin/010-02641-58/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',5,3,'unisex'),(45,'Garmin Vivosmart 5 010-02645-21 Smartwatch Sport and Fitness Digital Black Dial White Rubber Strap',7,2499000,'https://www.jamtangan.com/cdn-cgi/image/fit=cover,format=auto/https://assets.jamtangan.com/images/product/garmin/010-02645-21/1l.jpg','2023-02-07 07:18:31','2023-02-07 07:18:31',5,7,'unisex'),(48,'Garmin Venu Sq 010-02426-84 Smartwatch Music Edition Digital Dial White Rubber Strap',5,3999000,'http://localhost:2000/post_image/POST_lRcXiDehMdQGfWi1BmjvN.jpeg','2023-02-14 06:17:22','2023-02-14 06:17:22',5,0,'unisex');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20230203034109-create-user.js'),('20230207043112-create-brand.js'),('20230207043136-create-gender.js'),('20230207045824-create-product.js'),('20230207061810-product-assc-brand-gender.js'),('20230207063655-product-assc-brand-gender2.js'),('20230208033812-create-trans-header.js'),('20230208035514-trans_header-assc-user.js'),('20230208041623-create-trans-item.js'),('20230208044420-trans_item-assc-product-trans_header.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_headers`
--

DROP TABLE IF EXISTS `trans_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trans_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_trans` varchar(255) DEFAULT NULL,
  `total` int DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `trans_headers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_headers`
--

LOCK TABLES `trans_headers` WRITE;
/*!40000 ALTER TABLE `trans_headers` DISABLE KEYS */;
INSERT INTO `trans_headers` VALUES (2,'TRANS001',12187000,'2023-02-07 07:18:31','2023-02-07 07:18:31','2023-02-07 07:18:31',1),(3,'TRANS002',8094000,'2023-02-08 08:18:31','2023-02-08 08:18:31','2023-02-08 08:18:31',1),(4,'TRANS003',4676000,'2023-02-09 07:18:31','2023-02-09 07:18:31','2023-02-09 07:18:31',1),(5,'TRANS004',418000,'2023-02-10 07:18:31','2023-02-10 07:18:31','2023-02-10 07:18:31',1),(6,'TRANS005',41549000,'2023-02-11 07:18:31','2023-02-11 07:18:31','2023-02-11 07:18:31',1),(7,'TRANS006',18572000,'2023-02-12 07:18:31','2023-02-12 07:18:31','2023-02-02 07:18:31',1),(8,'TRANS007',627000,'2023-02-13 07:18:31','2023-02-13 07:18:31','2023-02-13 07:18:31',1),(9,'TRANS008',1050000,'2023-02-14 07:18:31','2023-02-14 07:18:31','2023-02-14 07:18:31',1),(10,'TRANS009',16481000,'2023-02-15 07:18:31','2023-02-15 07:18:31','2023-02-15 07:18:31',1),(12,'TRS-2023021400010',500000,'2023-02-14 00:00:00','2023-02-14 07:05:51','2023-02-14 07:05:51',1),(17,'TRS-2023021400011',450000,'2023-02-14 00:00:00','2023-02-14 07:12:41','2023-02-14 07:12:41',1),(18,'TRS-2023021400012',250000,'2023-02-14 00:00:00','2023-02-14 07:13:12','2023-02-14 07:13:12',1),(19,'TRS-2023021400013',300000,'2023-02-14 00:00:00','2023-02-14 07:16:19','2023-02-14 07:16:19',1),(20,'TRS-2023021400014',800000,'2023-02-14 00:00:00','2023-02-14 07:16:48','2023-02-14 07:16:48',1),(21,'TRS-2023021400015',500000,'2023-02-14 00:00:00','2023-02-14 07:18:42','2023-02-14 07:18:42',1),(22,'TRS-2023021400016',3005000,'2023-02-14 00:00:00','2023-02-14 07:24:17','2023-02-14 07:24:17',1),(23,'TRS-2023021400017',3005000,'2023-02-14 00:00:00','2023-02-14 07:25:41','2023-02-14 07:25:41',1),(24,'TRS-2023021400018',3005000,'2023-02-14 00:00:00','2023-02-14 07:25:59','2023-02-14 07:25:59',1),(25,'TRS-2023021400019',3005000,'2023-02-14 00:00:00','2023-02-14 07:26:13','2023-02-14 07:26:13',1),(26,'TRS-2023021400020',3005000,'2023-02-14 00:00:00','2023-02-14 07:26:16','2023-02-14 07:26:16',1),(27,'TRS-2023021400021',3005000,'2023-02-14 00:00:00','2023-02-14 07:26:33','2023-02-14 07:26:33',1),(28,'TRS-2023021400022',1836000,'2023-02-14 00:00:00','2023-02-14 07:35:15','2023-02-14 07:35:15',1),(29,'TRS-2023021400023',1836000,'2023-02-14 00:00:00','2023-02-14 07:35:43','2023-02-14 07:35:43',1),(30,'TRS-2023021400024',1836000,'2023-02-14 00:00:00','2023-02-14 07:36:49','2023-02-14 07:36:49',1),(31,'TRS-2023021400025',1836000,'2023-02-14 00:00:00','2023-02-14 07:37:29','2023-02-14 07:37:29',1),(32,'TRS-2023021400026',2356000,'2023-02-14 00:00:00','2023-02-14 07:38:17','2023-02-14 07:38:17',1),(33,'TRS-2023021400027',2356000,'2023-02-14 00:00:00','2023-02-14 07:39:31','2023-02-14 07:39:31',1),(34,'TRS-2023021400028',30000,'2023-02-14 00:00:00','2023-02-14 07:40:29','2023-02-14 07:40:29',1),(35,'TRS-2023021400029',649000,'2023-02-14 00:00:00','2023-02-14 07:40:33','2023-02-14 07:40:33',1),(36,'TRS-2023021400030',1516000,'2023-02-14 00:00:00','2023-02-14 10:32:44','2023-02-14 10:32:44',1);
/*!40000 ALTER TABLE `trans_headers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_items`
--

DROP TABLE IF EXISTS `trans_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trans_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `trans_header_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_header_id` (`trans_header_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `trans_items_ibfk_1` FOREIGN KEY (`trans_header_id`) REFERENCES `trans_headers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `trans_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_items`
--

LOCK TABLES `trans_items` WRITE;
/*!40000 ALTER TABLE `trans_items` DISABLE KEYS */;
INSERT INTO `trans_items` VALUES (43,4,11560000,'2023-02-07 07:18:31','2023-02-07 07:18:31',2,21),(44,3,627000,'2023-02-07 07:18:31','2023-02-07 07:18:31',2,10),(45,5,5845000,'2023-02-07 07:18:31','2023-02-07 07:18:31',2,3),(46,1,293000,'2023-02-07 07:18:31','2023-02-07 07:18:31',2,7),(47,4,1956000,'2023-02-07 07:18:31','2023-02-07 07:18:31',2,28),(48,4,4676000,'2023-02-07 07:18:31','2023-02-07 07:18:31',3,4),(49,2,418000,'2023-02-07 07:18:31','2023-02-07 07:18:31',4,11),(50,3,3687000,'2023-02-07 07:18:31','2023-02-07 07:18:31',5,5),(51,3,8997000,'2023-02-07 07:18:31','2023-02-07 07:18:31',5,13),(52,5,28865000,'2023-02-07 07:18:31','2023-02-07 07:18:31',5,20),(53,2,105000,'2023-02-07 07:18:31','2023-02-07 07:18:31',6,22),(54,3,17319000,'2023-02-07 07:18:31','2023-02-07 07:18:31',6,20),(55,4,1148000,'2023-02-07 07:18:31','2023-02-07 07:18:31',6,6),(56,3,627000,'2023-02-07 07:18:31','2023-02-07 07:18:31',7,11),(57,1,1050000,'2023-02-07 07:18:31','2023-02-07 07:18:31',8,29),(58,2,11546000,'2023-02-07 07:18:31','2023-02-07 07:18:31',9,20),(59,5,4935000,'2023-02-07 07:18:31','2023-02-07 07:18:31',9,19),(60,4,2100000,'2023-02-07 07:18:31','2023-02-07 07:18:31',10,22),(61,1,9779000,'2023-02-07 07:18:31','2023-02-07 07:18:31',10,15),(62,5,10440000,'2023-02-07 07:18:31','2023-02-07 07:18:31',10,27),(63,1,649000,'2023-02-14 07:12:41','2023-02-14 07:12:41',17,3),(64,1,1187000,'2023-02-14 07:12:41','2023-02-14 07:12:41',17,4),(65,1,649000,'2023-02-14 07:13:12','2023-02-14 07:13:12',18,3),(66,1,1187000,'2023-02-14 07:13:12','2023-02-14 07:13:12',18,4),(67,1,1229000,'2023-02-14 07:16:19','2023-02-14 07:16:19',19,7),(68,1,287000,'2023-02-14 07:16:19','2023-02-14 07:16:19',19,8),(69,1,1229000,'2023-02-14 07:16:49','2023-02-14 07:16:49',20,7),(70,1,287000,'2023-02-14 07:16:49','2023-02-14 07:16:49',20,8),(71,1,1229000,'2023-02-14 07:18:42','2023-02-14 07:18:42',21,7),(72,1,287000,'2023-02-14 07:18:42','2023-02-14 07:18:42',21,8),(73,1,649000,'2023-02-14 07:24:17','2023-02-14 07:24:17',22,3),(74,1,1187000,'2023-02-14 07:24:17','2023-02-14 07:24:17',22,4),(75,1,1169000,'2023-02-14 07:24:17','2023-02-14 07:24:17',22,6),(76,1,649000,'2023-02-14 07:25:41','2023-02-14 07:25:41',23,3),(77,1,1187000,'2023-02-14 07:25:41','2023-02-14 07:25:41',23,4),(78,1,1169000,'2023-02-14 07:25:41','2023-02-14 07:25:41',23,6),(79,1,649000,'2023-02-14 07:25:59','2023-02-14 07:25:59',24,3),(80,1,1187000,'2023-02-14 07:25:59','2023-02-14 07:25:59',24,4),(81,1,1169000,'2023-02-14 07:25:59','2023-02-14 07:25:59',24,6),(82,1,649000,'2023-02-14 07:26:13','2023-02-14 07:26:13',25,3),(83,1,1187000,'2023-02-14 07:26:13','2023-02-14 07:26:13',25,4),(84,1,1169000,'2023-02-14 07:26:13','2023-02-14 07:26:13',25,6),(85,1,649000,'2023-02-14 07:26:16','2023-02-14 07:26:16',26,3),(86,1,1187000,'2023-02-14 07:26:16','2023-02-14 07:26:16',26,4),(87,1,1169000,'2023-02-14 07:26:16','2023-02-14 07:26:16',26,6),(88,1,649000,'2023-02-14 07:26:33','2023-02-14 07:26:33',27,3),(89,1,1187000,'2023-02-14 07:26:33','2023-02-14 07:26:33',27,4),(90,1,1169000,'2023-02-14 07:26:33','2023-02-14 07:26:33',27,6);
/*!40000 ALTER TABLE `trans_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `isadmin` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username_2` (`username`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `username_3` (`username`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `username_4` (`username`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `username_5` (`username`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `username_6` (`username`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `username_7` (`username`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `username_8` (`username`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `username_9` (`username`),
  UNIQUE KEY `email_9` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Doni123','$2b$10$FfJDsL5PRl5LApNaGy4p8OU2GV0RF66jgXkmbJA52Uijzy4ehhhK2','Doni','Doni@email.com',1,'2023-02-03 07:07:51','2023-02-03 07:07:51'),(3,'Doni1234','$2b$10$Vigx9QRyvXO.Fse00IfEuOkOP5ZPFN899V4nOh0g/gsGXIBoSEHG6','Doni','Doni1234@email.com',0,'2023-02-03 07:10:29','2023-02-03 07:10:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-17  8:03:41
