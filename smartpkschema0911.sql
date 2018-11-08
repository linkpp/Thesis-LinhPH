-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: smart_parking
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Current Database: `smart_parking`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `smart_parking` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `smart_parking`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'working' COMMENT '1: working, 0: deactive',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park`
--

DROP TABLE IF EXISTS `park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `park` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `park_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `park_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_slots` int(10) unsigned NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park`
--

LOCK TABLES `park` WRITE;
/*!40000 ALTER TABLE `park` DISABLE KEYS */;
INSERT INTO `park` VALUES (1,'BK-D5','Bãi xe D5',10,'Bãi Xe D5'),(2,'BK-KTX','Bãi xe Ký túc xá',500,'Bãi xe phục vụ sinh viên ở KTX'),(3,'BK-D9','Bãi xe D9',400,'Bãi Xe phục vụ cán bộ nhân viên BK');
/*!40000 ALTER TABLE `park` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'staff, ticket, vehicle, other',
  `ticket_id` bigint(20) unsigned NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '0: pending, 1: done.',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_note` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `staff_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `park_id` int(10) unsigned NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'working' COMMENT '1: working, 0: deactive',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `park_id` (`park_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`park_id`) REFERENCES `park` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'S1001','202cb962ac59075b964b07152d234b70','Hà Anh Tuấn',1,'working','2018-11-09 00:00:27'),(2,'S1002','202cb962ac59075b964b07152d234b70','Nam Anh',2,'working','2018-11-09 00:46:19');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(10) unsigned NOT NULL,
  `park_id` int(10) unsigned NOT NULL,
  `ticket_code` int(11) NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'working' COMMENT '1: working, 0: expired',
  `fee` int(11) NOT NULL DEFAULT '1',
  `checkin_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `checkout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `park_id` (`park_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`park_id`) REFERENCES `park` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,2,1,1203,'expired',1,'2018-11-07 07:30:21','2018-11-06 14:12:29'),(2,1,3,2034,'expired',1,'2018-11-06 07:45:12','2018-11-06 14:12:29'),(3,1,1,8493,'working',1,'2018-11-07 07:30:21',NULL),(17,3,1,5566,'working',1,'2018-11-06 07:45:12',NULL),(18,2,2,5467,'working',1,'2018-11-06 07:45:12',NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'working' COMMENT '0: pedding, 1: working, 2:banned',
  `fullname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coin_remain` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'linhph','202cb962ac59075b964b07152d234b70','working','Phan Hồng Lĩnh','linhphanhust@gmail.com','964976895',0,'No note','2018-10-31 16:10:13'),(2,'trangdt','c4ca4238a0b923820dcc509a6f75849b','working','Trang DT','trangdt@ghtk.vn','123456789',0,NULL,'2018-10-31 17:27:28'),(3,'linhphan','202cb962ac59075b964b07152d234b70','working','Phan Hồng Lĩnh','linhphan@gmail.com','111222333',0,NULL,'2018-11-01 17:37:04'),(4,'linhphan1','81dc9bdb52d04dc20036dbd8313ed055','working','Phan Hồng Lĩnh','changvt2401@gmail.com','09123232333',0,NULL,'2018-11-01 17:42:56'),(5,'111','698d51a19d8a121ce581499d7b701668','working','Nguyễn Đình Mẫn','linhph@gmail.com','111',0,NULL,'2018-11-01 18:15:35'),(6,'lanem','698d51a19d8a121ce581499d7b701668','working','Ngô Lan Anh','lananh.ngo.1994@gmail.com','1111',0,NULL,'2018-11-01 18:21:21');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plate` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `model` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'resource/images/defaultImage.jpg',
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '0: pendding, 1: working, 2: deactive',
  `description` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'63-B9 999.99',3,'SH Mode','resources/images/xemay2.jpg','working','Xe máy SH xin xò lắm à nha. hihi'),(2,'47-F1 222.22',3,'Wave RSX 2012','resources/images/xemay3.jpg','pending','Màu đỏ, đẹp, còn mới ưng'),(3,'29S2-12345',3,'SH Anfa','resources/images/xemay.jpg','deactive','Con tym băng giá.'),(4,'29S2-12345',3,'SH Anfa','resources/images/xemay.jpg','deactive','xxxx'),(5,'29S2-12345',3,'Wave Anfa','resources/images/xemay.jpg','pending','Ahihi đồ ngôk');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-09  1:04:31