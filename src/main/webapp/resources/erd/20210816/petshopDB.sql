-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: petshopdb
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `address_num` int(11) NOT NULL AUTO_INCREMENT,
  `member_num` int(11) NOT NULL,
  `address_recipent` varchar(20) NOT NULL,
  `address_phone` varchar(13) NOT NULL,
  `address_1` varchar(10) NOT NULL,
  `address_2` varchar(30) NOT NULL,
  `address_3` varchar(40) NOT NULL,
  `address_request` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`address_num`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (8,10,'ㅁㄴㅇㄹ','010-1234-1234','34578','대전 동구 가양로123번길 60','123123','ㅁㄴㅇㄹ'),(16,12,'ㅁㄴㅇㄹ','010-1234-1234','34578','대전 동구 가양로123번길 60','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ'),(18,12,'gdgd','010-1234-1234','34589','대전 동구 우암로 181','ㅁㄴㅇㄻㄴㅇㄹ','없음'),(19,12,'asdf','010-1234-1234','39596','경북 김천시 중앙공원4길 10','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ'),(20,12,'ASDF','010-1234-1234','34578','대전 동구 가양로123번길 60','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ'),(21,12,'ㅁㄴㅇㄹ','010-1234-1234','34589','대전 동구 우암로 181','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ'),(22,12,'ㅁㄴㅇㄹ','010-1234-1234','34578','대전 동구 가양로123번길 60','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ'),(23,12,'ㅁㄴㅇㄹ','010-1234-1234','34578','대전 동구 가양로123번길 62-1','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ'),(24,12,'ㅁㄴㅇㄹ','010-1234-1234','34578','대전 동구 가양로123번길 60','ㅁㄴㅇㄹ',''),(25,12,'ㅁㄴㅇㄹ','010-1234-1234','34578','대전 동구 가양로123번길 60','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ'),(26,12,'ㅁㄴㅇㄹ','010-1234-1234','34578','대전 동구 가양로123번길 60','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ'),(28,0,'ㅁㄴㅇㄹ','010-1234-1234','34578','대전 동구 가양로123번길 60','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ'),(29,21,'ㅁㄴㅇㄹ','010-1234-1234','34589','대전 동구 우암로 181','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_members`
--

DROP TABLE IF EXISTS `backup_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backup_members` (
  `Member_Num` int(11) NOT NULL,
  `Member_ID` varchar(200) NOT NULL,
  `Member_name` varchar(45) NOT NULL,
  `Member_Phone` varchar(13) NOT NULL,
  `Member_Nick` varchar(20) NOT NULL,
  `Member_joindate` timestamp NOT NULL,
  `Member_manager` int(11) NOT NULL,
  `Member_logindate` timestamp NULL DEFAULT NULL,
  `member_point` int(11) NOT NULL,
  `modType` char(2) NOT NULL,
  `modDate` timestamp NOT NULL,
  `modUser` varchar(256) NOT NULL,
  PRIMARY KEY (`Member_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_members`
--

LOCK TABLES `backup_members` WRITE;
/*!40000 ALTER TABLE `backup_members` DISABLE KEYS */;
INSERT INTO `backup_members` VALUES (16,'son12345','아아','아아','아아','2021-08-01 16:26:14',0,'2021-08-01 16:26:14',12,'삭제','2021-08-01 16:26:29','root@localhost'),(17,'son12345','손영원','010-1231-1234','아아아','2021-08-01 16:27:51',0,'2021-08-01 16:29:14',500,'삭제','2021-08-01 16:29:50','root@localhost'),(21,'YB_9O6Ks26wcDNqVYeJkvjJJDfhkVEe4BJsiZLQ4fXY','손영원','010-9163-5375','손영원','2021-08-02 03:45:19',0,'2021-08-02 06:13:31',2630,'삭제','2021-08-03 01:49:56','root@localhost'),(23,'YB_9O6Ks26wcDNqVYeJkvjJJDfhkVEe4BJsiZLQ4fXY','손영원','010-9163-5375','손영원','2021-08-03 01:50:04',0,'2021-08-03 01:50:04',500,'삭제','2021-08-03 02:14:10','root@localhost'),(24,'mungmungshopKakaoID1832531817','손영원','123123','손영원','2021-08-03 02:13:59',0,'2021-08-03 02:13:59',500,'삭제','2021-08-03 02:16:37','root@localhost'),(25,'mungmungshopNaverIDYB_9O6Ks26wcDNqVYeJkvjJJDfhkVEe4BJsiZLQ4fXY','손영원','010-9163-5375','손영원','2021-08-03 02:14:37',0,'2021-08-03 02:14:37',500,'삭제','2021-08-03 02:16:37','root@localhost'),(26,'naverYB_9O6Ks26wcDNqVYeJkvjJJDfhkVEe4BJsiZLQ4fXY','손영원','010-9163-5375','손영원','2021-08-03 02:19:20',0,'2021-08-03 02:19:20',3000,'삭제','2021-08-16 08:14:09','root@localhost'),(27,'Kakao1832531817','손영원','null','손영원','2021-08-03 02:19:35',0,'2021-08-03 02:19:35',3000,'삭제','2021-08-16 08:14:09','root@localhost');
/*!40000 ALTER TABLE `backup_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `cart_code` int(11) NOT NULL AUTO_INCREMENT,
  `member_num` int(11) NOT NULL,
  `p_code` char(7) NOT NULL,
  `cart_quantity` int(11) NOT NULL,
  `cart_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_code`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (87,10,'PRD0003',1,'2021-08-10 14:41:00'),(92,12,'PRD0100',1,'2021-08-11 13:36:25'),(93,12,'PRD0002',1,'2021-08-11 13:36:29'),(94,12,'PRD0083',1,'2021-08-11 13:36:33'),(95,26,'PRD0002',1,'2021-08-14 08:15:35'),(96,10,'PRD0052',1,'2021-08-15 09:12:32');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery` (
  `deli_num` int(11) NOT NULL AUTO_INCREMENT,
  `member_num` int(11) NOT NULL,
  `order_code` char(7) NOT NULL,
  `deli_name` varchar(20) NOT NULL,
  `deli_tel` varchar(13) NOT NULL,
  `deli_address1` varchar(10) NOT NULL,
  `deli_address2` varchar(30) NOT NULL,
  `deli_address3` varchar(40) NOT NULL,
  `deli_traking` int(11) DEFAULT NULL,
  `deli_request` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`deli_num`),
  KEY `fk_delivery_ordercode` (`order_code`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (43,10,'ORD0066','ㅁㄴㅇㄹ','010-1234-1234','34578','대전 동구 가양로123번길 60','123123',NULL,'ㅁㄴㅇㄹ');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventboard`
--

DROP TABLE IF EXISTS `eventboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `eventboard` (
  `event_no` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(45) NOT NULL,
  `event_writer` varchar(11) NOT NULL,
  `event_content` varchar(1000) NOT NULL,
  `event_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event_hits` int(11) NOT NULL DEFAULT '0',
  `event_image_filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`event_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventboard`
--

LOCK TABLES `eventboard` WRITE;
/*!40000 ALTER TABLE `eventboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqboard`
--

DROP TABLE IF EXISTS `faqboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faqboard` (
  `faq_no` int(11) NOT NULL AUTO_INCREMENT,
  `faq_title` varchar(45) NOT NULL,
  `faq_writer` varchar(11) NOT NULL,
  `faq_content` varchar(1000) NOT NULL,
  `faq_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `faq_hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`faq_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqboard`
--

LOCK TABLES `faqboard` WRITE;
/*!40000 ALTER TABLE `faqboard` DISABLE KEYS */;
INSERT INTO `faqboard` VALUES (1,'결제를 했는데 배송은 언제쯤 오나요?','admin','보통 고객님께 배송되기까지 2~3일 정도 소요됩니다.','2021-06-22 02:17:55',2),(3,'비밀번호를 잊어버렸는데 가입할 때 등록한 이메일을 삭제해버렸어요. 어떡하죠?','admin','이런 경우, 신용카드 결제 내역이 있다면 고객센터로 문의 주시면 처리가 가능합니다. 하지만 결제 내역이 없다면 아쉽게도 계정을 찾으실 수가 없습니다.','2021-07-29 07:13:42',0),(4,'반품을 하고 싶은데 반품은 어떻게 해야하나요?','admin','마이페이지 - 주문내역조회 - 환불요청 버튼 클릭으로 하실 수 있습니다','2021-07-29 14:17:31',0);
/*!40000 ALTER TABLE `faqboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inquiry` (
  `inq_no` int(11) NOT NULL AUTO_INCREMENT,
  `inq_originNo` int(11) NOT NULL,
  `inq_groupOrd` int(11) NOT NULL DEFAULT '0',
  `inq_groupLayer` int(11) NOT NULL DEFAULT '0',
  `p_code` char(7) NOT NULL,
  `inq_title` varchar(45) NOT NULL,
  `inq_writer` varchar(11) NOT NULL,
  `inq_content` varchar(1000) NOT NULL,
  `inq_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inq_secret` varchar(3) DEFAULT 'N',
  `inq_hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`inq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `love`
--

DROP TABLE IF EXISTS `love`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `love` (
  `love_num` int(11) NOT NULL,
  `member_num` int(11) NOT NULL,
  `p_code` char(7) NOT NULL,
  PRIMARY KEY (`love_num`),
  KEY `fk_love_memberNum` (`member_num`),
  KEY `fk_love_pCode` (`p_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `love`
--

LOCK TABLES `love` WRITE;
/*!40000 ALTER TABLE `love` DISABLE KEYS */;
INSERT INTO `love` VALUES (1,12,'PRD0144'),(2,10,'PRD0003');
/*!40000 ALTER TABLE `love` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager` (
  `manager_num` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` varchar(11) NOT NULL,
  `manager_pw` varchar(20) NOT NULL,
  PRIMARY KEY (`manager_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'admin','asdf1234!!');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `members` (
  `Member_Num` int(11) NOT NULL AUTO_INCREMENT,
  `Member_ID` varchar(200) NOT NULL,
  `Member_PW` varchar(100) NOT NULL,
  `Member_name` varchar(45) NOT NULL,
  `Member_email` varchar(50) NOT NULL,
  `Member_Phone` varchar(13) NOT NULL,
  `Member_Nick` varchar(20) NOT NULL,
  `Member_joindate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Member_manager` int(11) DEFAULT NULL,
  `Member_logindate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `member_point` int(11) DEFAULT NULL,
  `member_type` varchar(10) NOT NULL,
  PRIMARY KEY (`Member_Num`),
  KEY `idx_test` (`Member_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (10,'manager','$2a$10$ek4onq7.04pzAY8JvVJVs.3KIPCbIqaIwH.U4cxhLNKxNVF1EW9Rq','손영원','zerone015@naver.com','010-1234-1234','운영자','2021-07-16 08:44:50',1,'2021-08-16 08:37:39',24270,'일반'),(12,'son1234','$2a$10$vWdiQcFiDNSXGmTokHdM1eAGmwMZ2EKHSaEV0qnr.VsFk90W13g8m','손영원','zerone015@naver.com','010-1234-1234','gkdl','2021-07-22 05:43:18',0,'2021-08-16 08:22:43',31303,'일반'),(22,'test123','$2a$10$x3jL72BFEpfO9OlgYL3HKu1p1BHr9D5sV7uMRGAG7WnLl49nmUQK6','테스트','test@naver.com','010-1234-1234','테스트','2021-08-02 04:10:06',0,'2021-08-16 08:25:57',3000,'일반'),(28,'naverYB_9O6Ks26wcDNqVYeJkvjJJDfhkVEe4BJsiZLQ4fXY','null','손영원','zerone015@naver.com','010-9163-5375','손영원','2021-08-16 08:14:16',0,'2021-08-16 08:14:16',500,'�꽕�씠踰�');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticeboard`
--

DROP TABLE IF EXISTS `noticeboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `noticeboard` (
  `notice_no` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(45) NOT NULL,
  `notice_writer` varchar(11) NOT NULL,
  `notice_content` varchar(1000) NOT NULL,
  `notice_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notice_hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeboard`
--

LOCK TABLES `noticeboard` WRITE;
/*!40000 ALTER TABLE `noticeboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticeboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `order_code` char(7) NOT NULL DEFAULT '0',
  `order_num` int(11) NOT NULL,
  `member_num` int(11) NOT NULL,
  `member_name` varchar(45) NOT NULL,
  `member_phone` varchar(13) NOT NULL,
  `member_email` varchar(50) NOT NULL,
  `address_recipent` varchar(20) NOT NULL,
  `order_totalQuantity` int(11) NOT NULL,
  `order_totalPrice` int(11) NOT NULL,
  `order_usePoint` int(11) NOT NULL,
  `order_addPoint` int(11) NOT NULL,
  `order_method` varchar(10) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_code`),
  KEY `fk_order_customer` (`member_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ORD0066',0,10,'손영원','010-1234-1234','zerone015@naver.com','ㅁㄴㅇㄹ',2,164070,18230,3038,'신용카드','2021-08-10 14:41:42');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders_detail` (
  `order_detailCode` char(7) NOT NULL DEFAULT '0',
  `member_num` int(11) NOT NULL,
  `order_code` char(7) NOT NULL,
  `p_code` char(7) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_imageFileName` varchar(100) NOT NULL,
  `order_status` varchar(20) NOT NULL,
  PRIMARY KEY (`order_detailCode`),
  KEY `fk_ordersDetail_orderCode` (`order_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES ('ODD0049',10,'ORD0066','PRD0002','오리젠 오리지널 독 6kg',1,71800,'origen_originalDog_6kg.PNG','구매확정'),('ODD0050',10,'ORD0066','PRD0003','아카나 프리런 덕 독 11.4kg',1,110500,'acana_freeRunDuckDog_11.4kg.PNG','구매확정');
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_seq`
--

DROP TABLE IF EXISTS `orders_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders_seq` (
  `order_code` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_code`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_seq`
--

LOCK TABLES `orders_seq` WRITE;
/*!40000 ALTER TABLE `orders_seq` DISABLE KEYS */;
INSERT INTO `orders_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(28),(29),(30),(31),(32),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66);
/*!40000 ALTER TABLE `orders_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersdetail_seq`
--

DROP TABLE IF EXISTS `ordersdetail_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ordersdetail_seq` (
  `order_detailCode` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_detailCode`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersdetail_seq`
--

LOCK TABLES `ordersdetail_seq` WRITE;
/*!40000 ALTER TABLE `ordersdetail_seq` DISABLE KEYS */;
INSERT INTO `ordersdetail_seq` VALUES (4),(5),(6),(8),(9),(10),(11),(12),(13),(14),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50);
/*!40000 ALTER TABLE `ordersdetail_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_history`
--

DROP TABLE IF EXISTS `point_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `point_history` (
  `point_num` int(11) NOT NULL AUTO_INCREMENT,
  `member_num` int(11) NOT NULL,
  `point_status` char(2) NOT NULL,
  `point_value` int(11) NOT NULL,
  `point_contents` varchar(50) NOT NULL,
  `order_code` char(7) DEFAULT NULL,
  `point_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`point_num`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_history`
--

LOCK TABLES `point_history` WRITE;
/*!40000 ALTER TABLE `point_history` DISABLE KEYS */;
INSERT INTO `point_history` VALUES (40,10,'사용',18230,'주문결제 사용','ORD0066','2021-08-10 14:41:42'),(41,10,'적립',500,'후기 작성 지급',NULL,'2021-08-13 03:15:36'),(42,10,'적립',500,'후기 작성 지급',NULL,'2021-08-13 03:16:49'),(43,10,'적립',500,'후기 작성 지급',NULL,'2021-08-13 04:08:45'),(44,10,'적립',500,'후기 작성 지급',NULL,'2021-08-13 06:05:06'),(45,10,'적립',500,'후기 작성 지급',NULL,'2021-08-13 06:08:10'),(46,28,'적립',500,'회원가입 적립',NULL,'2021-08-16 08:14:16');
/*!40000 ALTER TABLE `point_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `p_code` char(7) NOT NULL DEFAULT '0',
  `p_cl1` varchar(10) NOT NULL,
  `p_cl2` varchar(10) NOT NULL,
  `p_brand` varchar(20) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_salePrice` int(11) DEFAULT NULL,
  `p_stock` int(11) NOT NULL,
  `p_imageFileName` varchar(100) NOT NULL,
  `p_imageFileName2` varchar(100) DEFAULT NULL,
  `p_description` varchar(1000) NOT NULL,
  `p_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `p_loves` int(11) NOT NULL DEFAULT '0',
  `p_origin` varchar(56) NOT NULL,
  PRIMARY KEY (`p_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('PRD0001','사료','전연령','오리젠','오리젠 오리지널 독 11.4kg',118600,NULL,11,'origen_originalDog_11.4kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 10월 21일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>11.4kg<br/><br/>원료구성<br/>신선한 닭 살코기, 신선한 칠면조 살코기, 신선한 통 계란, 신선한 태평양 청어, 신선한 닭 간, 신선한 가자미, 신선한 칠면조 간, 신선한 닭 심장 등<br/><br/>성분구성<br/>조단백 38%이상, 조지방 18%이상, 조회분 8% 이하, 조섬유 5%이하, 수분 12%이하, 칼슘 1.4%, 인 1.1%, 오메가6 3%이상, 오메가3 1%이상, DHA 0.3%이상, EPA 0.2%이상, 글루코사민 1400 mg/kg 이상, 콘드로이틴 1200 mg/kg이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:13:49',23,'캐나다'),('PRD0002','사료','전연령','오리젠','오리젠 오리지널 독 6kg',71800,NULL,8,'origen_originalDog_6kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 09월 21일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>6kg<br/><br/>원료구성<br/>신선한 닭 살코기, 신선한 칠면조 살코기, 신선한 통 계란, 신선한 태평양 청어, 신선한 닭 간, 신선한 가자미, 신선한 칠면조 간, 신선한 닭 심장 등<br/><br/>성분구성<br/>조단백 38%이상, 조지방 18%이상, 조회분 8% 이하, 조섬유 5%이하, 수분 12%이하, 칼슘 1.4%, 인 1.1%, 오메가6 3%이상, 오메가3 1%이상, DHA 0.3%이상, EPA 0.2%이상, 글루코사민 1400 mg/kg 이상, 콘드로이틴 1200 mg/kg이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:14:46',1,'캐나다'),('PRD0003','사료','전연령','아카나','아카나 프리런 덕 독 11.4kg',110500,NULL,21,'acana_freeRunDuckDog_11.4kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 06월 10일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>11.4kg<br/><br/>원료구성<br/>뼈를 발라낸 신선한 오리고기, 건조 오리고기, 녹색 완두콩, 붉은 렌틸콩, 신선한 오리 내장육(간, 심장, 신장), 오리 지방, 신선한 바틀릿 배, 가반조 빈, 녹색 렌틸콩, 황색 완두콩, 건조 오리 연골 등<br/><br/>성분구성<br/>조단백 31% 이상, 조지방 15% 이상, 조회분 7.5% 이하, 조섬유 5% 이하, 수분 12% 이하, 칼슘 1.3% 이상, 인 0.9% 이상, 오메가6 2.2% 이상, 오메가3 0.8% 이상, DHA 0.15% 이상, EPA 0.1% 이상, 글루코사민 1200mg/kg 이상, 콘드로이틴 1000mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:18:08',6,'캐나다'),('PRD0004','사료','전연령','오리젠','오리젠 피트 앤 트림 독 11.4kg',118600,NULL,3,'origen_pitAndTrimDog_11.4kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 10월 06일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>11.4kg<br/><br/>원료구성<br/>신선한 닭 살코기, 신선한 통 계란, 신선한 칠면조 살코기, 신선한 태평양 청어, 신선한 닭 간, 신선한 가자미, 신선한 태평양 고등어, 신선한 태평양 메를루사 등<br/><br/>성분구성<br/>조단백 42%이상, 조지방 13%이상, 조회분 8% 이하, 조섬유 8%이하, 수분 12%이하, 칼슘 1.4%, 인 1.1%, 오메가6 2.2%이상, 오메가3 0.9%이상, DHA 0.25%이상, EPA 0.15%이상, 글루코사민 1000 mg/kg 이상, 콘드로이틴 900 mg/kg이상, L-카르니틴 33 mg/kg<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:19:15',2,'캐나다'),('PRD0005','사료','전연령','오리젠','오리젠 6 피쉬 독 11.4kg',133000,NULL,15,'origen_6fishDog_11.4kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 10월 22일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>11.4kg<br/><br/>원료구성<br/>신선한 태평양 정어리, 신선한 태평양 고등어, 신선한 태평양 메를루사, 신성한 태평양 가자미, 신선한 볼락, 신선한 솔 피쉬, 고등어, 청어, 대구 등<br/><br/>성분구성<br/>조단백 38%이상, 조지방 18%이상, 조회분 8% 이하, 조섬유 5%이하, 수분 12%이하, 칼슘 1.5%, 인 1.1%, 오메가6 2.2%이상, 오메가3 2.2%이상, DHA 0.7%이상, EPA 0.5%이상, 글루코사민 1250 mg/kg 이상, 콘드로이틴 1000 mg/kg이상<br/><br/>소비자상담전화번호<br/>도그팡 고객센터 1234-5678<br/>','2021-07-05 08:20:00',123,'캐나다'),('PRD0006','사료','전연령','아카나','아카나 프리런 덕 독 6kg',68200,NULL,8,'acana_freeRunDuckDog_6kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 07월 10일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>6kg<br/><br/>원료구성<br/>뼈를 발라낸 신선한 오리고기, 건조 오리고기, 녹색 완두콩, 붉은 렌틸콩, 신선한 오리 내장육(간, 심장, 신장), 오리 지방, 신선한 바틀릿 배, 가반조 빈, 녹색 렌틸콩, 황색 완두콩, 건조 오리 연골 등<br/><br/>성분구성<br/>조단백 31% 이상, 조지방 15% 이상, 조회분 7.5% 이하, 조섬유 5% 이하, 수분 12% 이하, 칼슘 1.3% 이상, 인 0.9% 이상, 오메가6 2.2% 이상, 오메가3 0.8% 이상, DHA 0.15% 이상, EPA 0.1% 이상, 글루코사민 1200mg/kg 이상, 콘드로이틴 1000mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:21:21',11,'캐나다'),('PRD0007','사료','전연령','오리젠','오리젠 오리지널 독 2kg',36700,NULL,4,'origen_originalDog_2kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 10월 21일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>2kg<br/><br/>원료구성<br/>신선한 닭 살코기, 신선한 칠면조 살코기, 신선한 통 계란, 신선한 태평양 청어, 신선한 닭 간, 신선한 가자미, 신선한 칠면조 간, 신선한 닭 심장 등<br/><br/>성분구성<br/>조단백 38%이상, 조지방 18%이상, 조회분 8% 이하, 조섬유 5%이하, 수분 12%이하, 칼슘 1.4%, 인 1.1%, 오메가6 3%이상, 오메가3 1%이상, DHA 0.3%이상, EPA 0.2%이상, 글루코사민 1400 mg/kg 이상, 콘드로이틴 1200 mg/kg이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678<br/>','2021-07-05 08:22:13',55,'캐나다'),('PRD0008','사료','전연령','오리젠','오리젠 피트 앤 트림 독 6kg',71800,NULL,11,'origen_pitAndTrimDog_6kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 08월 10일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>6kg<br/><br/>원료구성<br/>신선한 닭 살코기, 신선한 통 계란, 신선한 칠면조 살코기, 신선한 태평양 청어, 신선한 닭 간, 신선한 가자미, 신선한 태평양 고등어, 신선한 태평양 메를루사 등<br/><br/>성분구성<br/>조단백 42%이상, 조지방 13%이상, 조회분 8% 이하, 조섬유 8%이하, 수분 12%이하, 칼슘 1.4%, 인 1.1%, 오메가6 2.2%이상, 오메가3 0.9%이상, DHA 0.25%이상, EPA 0.15%이상, 글루코사민 1000 mg/kg 이상, 콘드로이틴 900 mg/kg이상, L-카르니틴 33 mg/kg<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:23:10',33,'캐나다'),('PRD0009','사료','전연령','오리젠','오리젠 6 피쉬 독 6kg',79900,NULL,31,'origen_6fishDog_6kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 09월 14일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>6kg<br/><br/>원료구성<br/>신선한 태평양 정어리, 신선한 태평양 고등어, 신선한 태평양 메를루사, 신성한 태평양 가자미, 신선한 볼락, 신선한 솔 피쉬, 고등어, 청어, 대구 등<br/><br/>성분구성<br/>조단백 38%이상, 조지방 18%이상, 조회분 8% 이하, 조섬유 5%이하, 수분 12%이하, 칼슘 1.5%, 인 1.1%, 오메가6 2.2%이상, 오메가3 2.2%이상, DHA 0.7%이상, EPA 0.5%이상, 글루코사민 1250 mg/kg 이상, 콘드로이틴 1000 mg/kg이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:24:05',77,'캐나다'),('PRD0010','사료','전연령','오리젠','오리젠 스몰브리드 독 1.8kg',38500,NULL,20,'origen_smallBridDog_1.8kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 05월 20일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>1.8kg<br/><br/>원료구성<br/>신선한 칠면조고기, 신선한 닭고기, 생 메추리 고기, 신선한 통계란, 생 통 볼락, 생 통 청어, 신선한 칠면조 간 등<br/><br/>성분구성<br/>조단백질 38% 이상, 조지방 18% 이상, 조섬유 4% 이하, 조회분 9% 이하, 칼슘 1.2% 이상, 인0.9% 이상, 수분 12% 이하<br/><br/>소비자상담전화번호<br/>도그팡 고객센터 1588-3010<br/>','2021-07-05 08:24:50',31,'캐나다'),('PRD0011','사료','전연령','아카나','아카나 요크셔 포크 독 6kg',65500,NULL,15,'acana_yokshuForkDog_6kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 07월 24일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>6kg<br/><br/>원료구성<br/>신선한 요크셔 돼지고기, 건조 돼지고기, 녹색 완두콩, 붉은 렌틸콩, 신선한 돼지 간, 돼지 지방, 신선한 돼지 신장, 신선한 버터넛 스쿼시, 가반조 빈, 녹색 렌틸콩, 황색 완두콩, 건조 돼지 연골 등<br/><br/>성분구성<br/>조단백 31% 이상, 조지방 15% 이상, 조회분 7.5% 이하, 조섬유 5% 이하, 수분 12% 이하, 칼슘 1.2% 이상, 인 0.9% 이상, 오메가6 2.6% 이상, 오메가3 0.9% 이상, DHA 0.15% 이상, EPA 0.1% 이상, 글루코사민 600mg/kg 이상, 콘드로이틴 800mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:26:48',5,'캐나다'),('PRD0012','사료','전연령','아카나','아카나 프리런 덕 독 2kg',33100,NULL,9,'acana_freeRunDuckDog_2kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 06월 10일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>2kg<br/><br/>원료구성<br/>뼈를 발라낸 신선한 오리고기, 건조 오리고기, 녹색 완두콩, 붉은 렌틸콩, 신선한 오리 내장육(간, 심장, 신장), 오리 지방, 신선한 바틀릿 배, 가반조 빈, 녹색 렌틸콩, 황색 완두콩, 건조 오리 연골 등<br/><br/>성분구성<br/>조단백 31% 이상, 조지방 15% 이상, 조회분 7.5% 이하, 조섬유 5% 이하, 수분 12% 이하, 칼슘 1.3% 이상, 인 0.9% 이상, 오메가6 2.2% 이상, 오메가3 0.8% 이상, DHA 0.15% 이상, EPA 0.1% 이상, 글루코사민 1200mg/kg 이상, 콘드로이틴 1000mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:27:44',7,'캐나다'),('PRD0013','사료','전연령','오리젠','오리젠 피트 앤 트림 독 2kg',35100,NULL,11,'origen_pitAndTrimDog_2kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 06월 15일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>2kg<br/><br/>원료구성<br/>신선한 닭 살코기, 신선한 통 계란, 신선한 칠면조 살코기, 신선한 태평양 청어, 신선한 닭 간, 신선한 가자미, 신선한 태평양 고등어, 신선한 태평양 메를루사 등<br/><br/>성분구성<br/>조단백 42%이상, 조지방 13%이상, 조회분 8% 이하, 조섬유 8%이하, 수분 12%이하, 칼슘 1.4%, 인 1.1%, 오메가6 2.2%이상, 오메가3 0.9%이상, DHA 0.25%이상, EPA 0.15%이상, 글루코사민 1000 mg/kg 이상, 콘드로이틴 900 mg/kg이상, L-카르니틴 33 mg/kg<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:28:42',50,'캐나다'),('PRD0014','사료','전연령','아카나','아카나 요크셔 포크 독 11.4kg',106000,NULL,13,'acana_yokshuForkDog_11.4kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 08월 13일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>11.4kg<br/><br/>원료구성<br/>신선한 요크셔 돼지고기, 건조 돼지고기, 녹색 완두콩, 붉은 렌틸콩, 신선한 돼지 간, 돼지 지방, 신선한 돼지 신장, 신선한 버터넛 스쿼시, 가반조 빈, 녹색 렌틸콩, 황색 완두콩, 건조 돼지 연골 등<br/><br/>성분구성<br/>조단백 31% 이상, 조지방 15% 이상, 조회분 7.5% 이하, 조섬유 5% 이하, 수분 12% 이하, 칼슘 1.2% 이상, 인 0.9% 이상, 오메가6 2.6% 이상, 오메가3 0.9% 이상, DHA 0.15% 이상, EPA 0.1% 이상, 글루코사민 600mg/kg 이상, 콘드로이틴 800mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:29:32',12,'캐나다'),('PRD0015','사료','전연령','오리젠','오리젠 6 피쉬 독 2kg',39400,NULL,17,'origen_6fishDog_2kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 09월 30일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>2kg<br/><br/>원료구성<br/>신선한 태평양 정어리, 신선한 태평양 고등어, 신선한 태평양 메를루사, 신성한 태평양 가자미, 신선한 볼락, 신선한 솔 피쉬, 고등어, 청어, 대구 등<br/><br/>성분구성<br/>조단백 38%이상, 조지방 18%이상, 조회분 8% 이하, 조섬유 5%이하, 수분 12%이하, 칼슘 1.5%, 인 1.1%, 오메가6 2.2%이상, 오메가3 2.2%이상, DHA 0.7%이상, EPA 0.5%이상, 글루코사민 1250 mg/kg 이상, 콘드로이틴 1000 mg/kg이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:30:31',34,'캐나다'),('PRD0016','사료','전연령','아카나','아카나 와일드 프레이리 독 11.4kg',103300,NULL,20,'acana_wildPrayliDog_11.4kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 07월 27일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>11.4kg<br/><br/>원료구성<br/>뼈를 발라낸 신선한 닭고기, 뼈를 발라낸 신선한 칠면조고기, 신선한 닭 내장육(간, 심장, 신장), 건조 닭고기, 건조 칠면조고기, 건조 청어, 녹색 완두콩 등<br/><br/>성분구성<br/>조단백 35% 이상, 조지방 17% 이상, 조회분 7% 이하, 조섬유 6% 이하, 수분 12% 이하, 칼슘 1.5% 이상, 인 1.1% 이상, 오메가6 2.6% 이상, 오메가3 0.9% 이상, DHA 0.2% 이상, EPA 0.2% 이상, 글루코사민 700mg/kg 이상, 콘드로이틴 1500mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678<br/>','2021-07-05 08:32:06',57,'캐나다'),('PRD0017','사료','전연령','오리젠','오리젠 스몰브리드 독 4.5kg',73200,NULL,5,'origen_smallBridDog_4.5kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 03월 20일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>4.5kg<br/><br/>원료구성<br/>신선한 칠면조고기, 신선한 닭고기, 생 메추리 고기, 신선한 통계란, 생 통 볼락, 생 통 청어, 신선한 칠면조 간 등<br/><br/>성분구성<br/>조단백질 38% 이상, 조지방 18% 이상, 조섬유 4% 이하, 조회분 9% 이하, 칼슘 1.2% 이상, 인0.9% 이상, 수분 12% 이하<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:32:57',54,'캐나다'),('PRD0018','사료','전연령','아카나','아카나 요크셔 포크 독 2kg',29700,NULL,18,'acana_yokshuForkDog_2kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 04월 21일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>2kg<br/><br/>원료구성<br/>신선한 요크셔 돼지고기, 건조 돼지고기, 녹색 완두콩, 붉은 렌틸콩, 신선한 돼지 간, 돼지 지방, 신선한 돼지 신장, 신선한 버터넛 스쿼시, 가반조 빈, 녹색 렌틸콩, 황색 완두콩, 건조 돼지 연골 등<br/><br/>성분구성<br/>조단백 31% 이상, 조지방 15% 이상, 조회분 7.5% 이하, 조섬유 5% 이하, 수분 12% 이하, 칼슘 1.2% 이상, 인 0.9% 이상, 오메가6 2.6% 이상, 오메가3 0.9% 이상, DHA 0.15% 이상, EPA 0.1% 이상, 글루코사민 600mg/kg 이상, 콘드로이틴 800mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:33:45',1,'캐나다'),('PRD0019','사료','전연령','아카나','아카나 패시피카 독 11.4kg',113200,NULL,33,'acana_paesipikaDog_11.4kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 08월 11일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>11.4kg<br/><br/>원료구성<br/>신선한 태평양 청어, 신선한 태평양 정어리, 신선한 첨치가자미, 건조 청어, 건조 태평양 대구, 건조 명태, 녹색 완두콩, 붉은 렌틸콩, 병아리콩, 녹색 렌틸콩, 대구유 등<br/><br/>성분구성<br/>조단백 35% 이상, 조지방 17% 이상, 조회분 7% 이하, 조섬유 6% 이하, 수분 12% 이하, 칼슘 1.3% 이상, 인 1% 이상, 오메가6 2% 이상, 오메가3 2% 이상, DHA 0.9% 이상, EPA 0.7% 이상, 글루코사민 700mg/kg 이상, 콘드로이틴 900mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:34:29',4,'캐나다'),('PRD0020','사료','전연령','아카나','아카나 와일드 프레이리 독 6kg',62800,NULL,1,'acana_wildPrayliDog_6kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 07월 27일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>6kg<br/><br/>원료구성<br/>뼈를 발라낸 신선한 닭고기, 뼈를 발라낸 신선한 칠면조고기, 신선한 닭 내장육(간, 심장, 신장), 건조 닭고기, 건조 칠면조고기, 건조 청어, 녹색 완두콩 등<br/><br/>성분구성<br/>조단백 35% 이상, 조지방 17% 이상, 조회분 7% 이하, 조섬유 6% 이하, 수분 12% 이하, 칼슘 1.5% 이상, 인 1.1% 이상, 오메가6 2.6% 이상, 오메가3 0.9% 이상, DHA 0.2% 이상, EPA 0.2% 이상, 글루코사민 700mg/kg 이상, 콘드로이틴 1500mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:35:17',10,'캐나다'),('PRD0021','사료','전연령','아카나','아카나 와일드 프레이리 독 2kg',28500,NULL,6,'acana_wildPrayliDog_2kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 04월 03일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>2kg<br/><br/>원료구성<br/>뼈를 발라낸 신선한 닭고기, 뼈를 발라낸 신선한 칠면조고기, 신선한 닭 내장육(간, 심장, 신장), 건조 닭고기, 건조 칠면조고기, 건조 청어, 녹색 완두콩 등<br/><br/>성분구성<br/>조단백 35% 이상, 조지방 17% 이상, 조회분 7% 이하, 조섬유 6% 이하, 수분 12% 이하, 칼슘 1.5% 이상, 인 1.1% 이상, 오메가6 2.6% 이상, 오메가3 0.9% 이상, DHA 0.2% 이상, EPA 0.2% 이상, 글루코사민 700mg/kg 이상, 콘드로이틴 1500mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:36:03',77,'캐나다'),('PRD0022','사료','전연령','아카나','아카나 패시피카 독 2kg',35800,NULL,2,'acana_paesipikaDog_2kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 2022년 05월 27일 이후 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>2kg<br/><br/>원료구성<br/>신선한 태평양 청어, 신선한 태평양 정어리, 신선한 첨치가자미, 건조 청어, 건조 태평양 대구, 건조 명태, 녹색 완두콩, 붉은 렌틸콩, 병아리콩, 녹색 렌틸콩, 대구유 등<br/><br/>성분구성<br/>조단백 35% 이상, 조지방 17% 이상, 조회분 7% 이하, 조섬유 6% 이하, 수분 12% 이하, 칼슘 1.3% 이상, 인 1% 이상, 오메가6 2% 이상, 오메가3 2% 이상, DHA 0.9% 이상, EPA 0.7% 이상, 글루코사민 700mg/kg 이상, 콘드로이틴 900mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:36:46',12,'캐나다'),('PRD0023','사료','전연령','아카나','아카나 패시피카 독 6kg',69100,NULL,10,'acana_paesipikaDog_6kg.PNG','frd.jpg','원산지<br/>캐나다<br/><br/>제조사/수입사<br/>챔피온펫푸드/두원실업(주)<br/><br/>유통기한<br/>18개월 / 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>6kg<br/><br/>원료구성<br/>신선한 태평양 청어, 신선한 태평양 정어리, 신선한 첨치가자미, 건조 청어, 건조 태평양 대구, 건조 명태, 녹색 완두콩, 붉은 렌틸콩, 병아리콩, 녹색 렌틸콩, 대구유 등<br/><br/>성분구성<br/>조단백 35% 이상, 조지방 17% 이상, 조회분 7% 이하, 조섬유 6% 이하, 수분 12% 이하, 칼슘 1.3% 이상, 인 1% 이상, 오메가6 2% 이상, 오메가3 2% 이상, DHA 0.9% 이상, EPA 0.7% 이상, 글루코사민 700mg/kg 이상, 콘드로이틴 900mg/kg 이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:48:32',11,'캐나다'),('PRD0024','사료','전연령','퓨리나','퓨리나 프로플랜 퍼포먼스 17kg',83000,NULL,4,'purina_performance_17kg.PNG','frd.jpg','원산지<br/>미국<br/><br/>제조사/수입사<br/>네슬레퓨리나/한국네슬레(주)<br/><br/>유통기한<br/>18개월 / 상세보기<br/>본 상품은 제조일자와 유통기한이 함께 표기<br/>년/월/일으로 표기 예) 2022.07.05 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>17kg<br/><br/>원료구성<br/>순살 닭고기, 옥수수글루텐밀, 양조쌀, 혼합토코페롤(비타민 E형태)로 보존된 동물성 지방, 가금가공분(천연 글루코사민 함유), 통옥수수, 옥수수겨, 어분(천연 글루코사민 포함), 동물성 다이제스트, 생선오일, 건조계란, 염화칼륨, 염분, 인산칼슘, 탄산칼슘, 비타민E, 염화콜린, L-아스코빌-2-폴리포스페이트(비타민 C 원료), 황산아연, 황산제1철, 황산마그네슘, 나이아신, 비타민A, 판토텐산 칼슘, 질산 티아민, 황산구리, 리보플라빈 등<br/><br/>성분구성<br/>조단백 30%이상, 조지방 20%이상, 조섬유 3%이하, 조회분 9%이하, 인 1.6%이하, 칼슘 0.9%이상<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:58:40',10,'미국'),('PRD0025','사료','전연령','내츄럴발란스','내추럴발란스 오리지널 울트라 그레인프리 닭고기 포뮬라 스몰바이트 3kg',33800,NULL,7,'naturalbalance_originalUltraGraynFree_3kg.PNG','frd.jpg','원산지<br/>미국<br/><br/>제조사/수입사<br/>내추럴발란스/내추럴발란스코리아<br/><br/>유통기한<br/>14개월 / 상세보기<br/>본 상품에 유통기한 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>3kg<br/><br/>원료구성<br/>오리, 건조오리, 병아리콩, 완두콩갈, 완두콩, 해바라기 오일, 아마씨, 건조 알팔파, 천연향료, 염화칼륨, 소금, 염화콜린 등<br/><br/>성분구성<br/>조단백질 27% 이상, 조지방 15% 이상, 조섬유 5% 이하, 칼슘 1.2% 이상, 인 1% 이상, 수분 10% 이하<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 08:59:55',8,'미국'),('PRD0026','사료','전연령','내츄럴발란스','내추럴발란스 오리지널 울트라 그레인프리 닭고기 포뮬라 스몰바이트 6.12kg',62800,NULL,19,'naturalbalance_originalUltraGraynFree_6.12kg.PNG','frd.jpg','원산지<br/>미국<br/><br/>제조사/수입사<br/>내추럴발란스/내추럴발란스코리아<br/><br/>유통기한<br/>14개월 / 상세보기<br/>본 상품에 유통기한 표기<br/>일/월/년으로 표기 예) 05.07.2022 →2022년 07월 05일<br/><br/>권장연령<br/>모든연령<br/><br/>용량/중량<br/>6.12kg<br/><br/>원료구성<br/>닭고기, 완두콩, 닭고기분말, 렌즈콩, 닭고기지방, 고구마, 아마씨, 완두분말, 천연향, 건조계란, 청어오일, 소금, 타우린 등<br/><br/>성분구성<br/>조단백질 27% 이상, 조지방 15% 이상, 조섬유 5% 이하, 칼슘 1.2% 이상, 인 1% 이상, 수분 10% 이하<br/><br/>소비자상담전화번호<br/>뭉뭉샵 고객센터 1234-5678','2021-07-05 09:00:42',22,'미국'),('PRD0028','사료','퍼피','로얄캐닌','로얄캐닌 미니 퍼피 파우치 85g x 12개 세트',13800,NULL,20,'royalCanin_miniPuppy_pouch_85g_x12.PNG','frd.jpg','제품명<br/>로얄캐닌 미니 퍼피 파우치<br/><br/>원료<br/>닭, 돼지, 쌀, 사탕무박, 분말셀룰로스, 금잔화추출물, 베타카로틴, 어유, 해바라기유, 미네랄, 효모, 캐러맬, 비타민D3, 철, 요오드, 구리, 망간, 아연, 제올라이트<br/><br/>등록성분<br/>조단백 6.0% 이상<br/>조지방 4.0% 이상<br/>칼슘 0.12% 이상<br/>인 0.05% 이상<br/>조섬유 2.0% 이하<br/>조회분 2.2% 이하<br/>수분 82% 이하<br/><br/>주의사항<br/>1. 반추동물 급여금지<br/>2. 개봉 후 냉장보관하거나 빨리 사용하시기 바랍니다<br/>3. 직사광선이 닿는 장소 및 해충이 있는 장소를 피하여 서늘하고 건조한 장소에 보관하여 주십시오<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 24개월 전<br/><br/>제조원 및 원산지<br/>MARS, 오스트리아','2021-07-08 15:20:11',1,'royalCanin'),('PRD0030','사료','퍼피','로얄캐닌','로얄캐닌 스타터 무스 마더 베이비독 캔 195g x 6개 세트',14700,NULL,15,'royalCanin_starterMoos_motherBabyDogCaen_195g_x6.PNG','frd.jpg','☞ 등록성분 및 주원료<br/>상세페이지를 참고해 주세요.<br/><br/>☞ 유통기한<br/>뒷면 하단에 표시 (일 월 년 순서로 표기)<br/><br/>☞ 제조일자<br/>유통기한으로부터 24개월 전<br/><br/>☞ 제조공급원<br/>MARS Austria, AUSRTIA<br/><br/><br/>☞ 주의사항<br/>반추가축에게 급여하지 마십시오. 직사광선이 닿는 장소 및 해충이 있는 장소를 피하여 서늘하고 건조한 장소에 보관하여 주십시오.','2021-07-08 15:24:48',20,'오스트리아'),('PRD0031','사료','퍼피','로얄캐닌','로얄캐닌 미니 스타터 1kg',14800,NULL,11,'royalCanin_miniStarter_1kg.PNG','frd.jpg','제품명<br/>로얄캐닌 사료<br/>로얄캔닌 퍼피 사료<br/>로얄캐닌 미니 스타터 사료<br/>로얄캐닌 미니 스타터 마더 베이비독<br/><br/>원재료<br/>육분, 쌀, 동물성 지방 가금류 돼지, 밀글루텐, 옥수수, 사탕무박, 가수분해 동물단백질, 혼합광물질류 합제, 어유, 대두유, 프락토올리고당, 가수분해효모, 낙산나트륨, 효모추출물, 금잔화추출물, 비타민, 철, 요오드, 구리, 망간, 아연, 셀레늄, 제올라이트, 소르빈산칼륨, 항산화제<br/><br/>등록성분<br/>조단백 30% 이상<br/>조지방 22% 이상<br/>조섬유 1.3% 이하<br/>조회분 8% 이하<br/>칼슘 1.29% 이상<br/>인 1.01% 이상<br/><br/>주의사항<br/>1. 반추가축에게는 급여하지 마십시오<br/>2. 직사광선이 닿는 장소 및 해충이 있는 장소를 피하여 서늘하고 건조한 장소에 보관하여 주십시오<br/><br/>유통기한<br/>제품 후면 하단에 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>프랑스','2021-07-08 15:28:15',8,'프랑스'),('PRD0032','사료','퍼피','로얄캐닌','로얄캐닌 푸들 퍼피 1.5kg',20000,NULL,15,'royalCanin_poodlePuppy_1.5kg.PNG','frd.jpg','제품명<br/>로얄캐닌 사료<br/>로얄케닌 사료<br/>로얄캐닌 푸들사료<br/>로얄캐닌 푸들 퍼피 사료<br/><br/>원재료<br/>탈수 가금육, 식물성 단백질, 동물성 지방, 마이즈, 쌀, 마이즈 글루텐, 밀, 가수분해 동물 단백질, 사탕무 과육, 미네랄, 생선오일, 효모, 콩 오일, 프락토올리고당, 차전자피, 가수분해 효모, 보라지오일, 금잔화추출물, 비타민A, 비타민D3, 철, 요오드, 구리, 망간, 아연, 셀레늄, 제올라이트, 소르빈산칼륨, 항산화제<br/><br/>등록성분<br/>조단백 33% 이상<br/>조지방 19% 이상<br/>조섬유 1.4% 이하<br/>조회분 7.1% 이하<br/>칼슘 0.65% 이상<br/>인 0.89% 이상<br/><br/>주의사항<br/>1. 반추가축에게는 급여하지 마십시오<br/>2. 직사광선이 닿는 장소 및 해충이 있는 장소를 피하여 서늘하고 건조한 장소에 보관하여 주십시오<br/><br/>유통기한<br/>제품 후면 하단에 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/> 프랑스','2021-07-08 15:27:55',78,'프랑스'),('PRD0033','사료','퍼피','아카나','아카나 퍼피 스몰브리드 2kg',26100,NULL,44,'acana_puppy_smallbrid_2kg.PNG','frd.jpg','제품명<br/>아카나 사료<br/>아카나 퍼피 스몰 브리드 사료<br/><br/>원료<br/>뼈를 발라낸 신선한 닭고기, 건조 닭고기, 건조 칠면조고기, 붉은 렌틸콩, 녹색 완두콩, 잠두, 닭 지방, 신선한 닭 내장육, 건조 청어, 신선한 통 계란, 신선한 가자미, 청어유, 햇볕에 건조한 알팔파, 녹색 렌틸콩, 황색 완두콩, 완두 섬유질, 신선한 닭 연골, 갈색 켈프, 신선한 호박, 버터넛 스쿼시, 파스닙, 케일, 시금치, 겨잣잎, 순무잎, 당근, 사과, 배, 냉동건조 닭간, 냉동건조 칠면조간, 크랜베리, 블루베리, 치커리뿌리, 강황, 밀크시슬, 우엉뿌리, 라벤더, 마시멜로뿌리, 로즈힙<br/><br/>등록성분<br/>조단백 33.0% 이상<br/>조지방 20.0% 이상<br/>조섬유 5.0% 이하<br/>조회분 7.0% 이하<br/>수분 12.0% 이하<br/>칼슘 1.5% 이상<br/>인 1.1% 이상<br/>칼로리 1kg 당 3660kcal<br/><br/>급여시 주의사항<br/>1. 급여량은 체질, 환경, 나이, 운동량 등에 따라 달라질 수 있습니다<br/>2. 반려견의 체중변화와 변상태 등에 따라 식사량을 조절합니다<br/>3. 하루에 두번 가급적 지정된 시간에 급여하는 것을 권장합니다<br/>4. 항상 신선하고 깨끗한 물을 마실 수 있도록 준비하시기 바랍니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>Champion Petfoods 챔피온펫푸드, 캐나다<br/><br/>','2021-07-08 15:29:41',4,'캐나다'),('PRD0034','사료','퍼피','아카나','아카나 퍼피 스몰브리드 6kg',56500,NULL,8,'acana_puppy_smallbrid_6kg.PNG','frd.jpg','제품명<br/>아카나 사료<br/>아카나 퍼피 스몰 브리드 사료<br/><br/>원료<br/>뼈를 발라낸 신선한 닭고기, 건조 닭고기, 건조 칠면조고기, 붉은 렌틸콩, 녹색 완두콩, 잠두, 닭 지방, 신선한 닭 내장육, 건조 청어, 신선한 통 계란, 신선한 가자미, 청어유, 햇볕에 건조한 알팔파, 녹색 렌틸콩, 황색 완두콩, 완두 섬유질, 신선한 닭 연골, 갈색 켈프, 신선한 호박, 버터넛 스쿼시, 파스닙, 케일, 시금치, 겨잣잎, 순무잎, 당근, 사과, 배, 냉동건조 닭간, 냉동건조 칠면조간, 크랜베리, 블루베리, 치커리뿌리, 강황, 밀크시슬, 우엉뿌리, 라벤더, 마시멜로뿌리, 로즈힙<br/><br/>등록성분<br/>조단백 33.0% 이상<br/>조지방 20.0% 이상<br/>조섬유 5.0% 이하<br/>조회분 7.0% 이하<br/>수분 12.0% 이하<br/>칼슘 1.5% 이상<br/>인 1.1% 이상<br/>칼로리 1kg 당 3660kcal<br/><br/>급여시 주의사항<br/>1. 급여량은 체질, 환경, 나이, 운동량 등에 따라 달라질 수 있습니다<br/>2. 반려견의 체중변화와 변상태 등에 따라 식사량을 조절합니다<br/>3. 하루에 두번 가급적 지정된 시간에 급여하는 것을 권장합니다<br/>4. 항상 신선하고 깨끗한 물을 마실 수 있도록 준비하시기 바랍니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>Champion Petfoods 챔피온펫푸드, 캐나다<br/>','2021-07-08 15:30:51',11,'캐나다'),('PRD0035','사료','퍼피','오리젠','오리젠 퍼피 2kg',34200,NULL,55,'orijen_puppy_2kg.PNG','frd.jpg','제품명<br/>오리젠 사료<br/>오리젠 퍼피 사료<br/><br/>원료<br/>닭살코기, 칠면조살코기, 통계란, 닭간, 청어, 가자미, 칠면조간, 닭목, 닭심장, 칠면조심장, 건조닭고기, 건조칠면조고기, 건조고등어, 건조정어리, 건조청어, 붉은렌틸콩, 녹색렌틸콩, 풋완두, 렌틸섬유질, 병아리콩, 노란완두콩, 호랑이콩, 닭연골, 흰강낭콩, 청어유, 닭지방, 칠면조연골, 건조닭간, 건조칠면조간, 호박, 버터넛스쿼시, 주키니, 파스닙, 당근, 사과, 배, 케일, 시금치, 비트그린, 순무잎, 켈프, 크랜베리, 블루베리, 사스카툰베리, 치커리뿌리, 강황뿌리, 밀크시슬, 우엉뿌리, 라벤더, 마시멜로뿌리, 로즈힙<br/><br/>등록성분<br/>조단백질 38%<br/>조지방 20%<br/>조회분 8%<br/>조섬유 5%<br/>수분 12%<br/>칼슘 1.4%<br/>인 1.1%<br/>칼로리 1kg 당 4000kcal<br/><br/>급여시 주의사항<br/>1. 급여량은 체질, 환경, 나이, 운동량 등에 따라 달라질 수 있습니다<br/>2. 반려견의 체중변화와 변상태 등에 따라 식사량을 조절합니다<br/>3. 하루에 두번 가급적 지정된 시간에 급여하는 것을 권장합니다<br/>4. 항상 신선하고 깨끗한 물을 마실 수 있도록 준비하시기 바랍니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>Champion Petfoods 챔피온펫푸드, 캐나다<br/><br/>','2021-07-08 15:32:05',1,'캐나다'),('PRD0036','사료','퍼피','오리젠','오리젠 퍼피 6kg',71800,NULL,15,'orijen_puppy_6kg.PNG','frd.jpg','제품명<br/>오리젠 사료<br/>오리젠 퍼피 사료<br/><br/>원료<br/>닭살코기, 칠면조살코기, 통계란, 닭간, 청어, 가자미, 칠면조간, 닭목, 닭심장, 칠면조심장, 건조닭고기, 건조칠면조고기, 건조고등어, 건조정어리, 건조청어, 붉은렌틸콩, 녹색렌틸콩, 풋완두, 렌틸섬유질, 병아리콩, 노란완두콩, 호랑이콩, 닭연골, 흰강낭콩, 청어유, 닭지방, 칠면조연골, 건조닭간, 건조칠면조간, 호박, 버터넛스쿼시, 주키니, 파스닙, 당근, 사과, 배, 케일, 시금치, 비트그린, 순무잎, 켈프, 크랜베리, 블루베리, 사스카툰베리, 치커리뿌리, 강황뿌리, 밀크시슬, 우엉뿌리, 라벤더, 마시멜로뿌리, 로즈힙<br/><br/>등록성분<br/>조단백질 38%<br/>조지방 20%<br/>조회분 8%<br/>조섬유 5%<br/>수분 12%<br/>칼슘 1.4%<br/>인 1.1%<br/>칼로리 1kg 당 4000kcal<br/><br/>급여시 주의사항<br/>1. 급여량은 체질, 환경, 나이, 운동량 등에 따라 달라질 수 있습니다<br/>2. 반려견의 체중변화와 변상태 등에 따라 식사량을 조절합니다<br/>3. 하루에 두번 가급적 지정된 시간에 급여하는 것을 권장합니다<br/>4. 항상 신선하고 깨끗한 물을 마실 수 있도록 준비하시기 바랍니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>Champion Petfoods 챔피온펫푸드, 캐나다<br/>','2021-07-08 15:33:15',2,'캐나다'),('PRD0037','사료','퍼피','나우','나우 그레인프리 퍼피 스몰브리드 2.7kg',38000,NULL,14,'now_graynFree_puppy_smallbrid_2.7kg.PNG','frd.jpg','☞ 유통기한 안내<br/>GO 사료와 NOW사료는 모두 제조일로부터 유통기한이 1년 4개월인 사료입니다.<br/>구매하시는 모든 고객님들 참고 부탁드립니다.~!!!<br/><br/>☞ 등록성분<br/>조단백: 28% 이상, 조지방:18% 이상, 칼슘: 1.2% 이상, 인: 0.8% 이상, 조섬유: 4.0% 이하, 조회분: 7.6% 이하, 오메가6: 3.0% 이상, 오메가3: 0.6% 이상, 유산균 90,000,000CFU/lb 이상, DHA: 0.07% 이상, EPA: 0.02% 이상, 타우린: 1,000mg/kg 이상, L-카르니틴: 100mg/kg 이상, 아르기닌, 엘라이신, 메티오닌, 트립토판, 티아민, 리보플라빈, 베타카로틴 등 필수 비타민 미네랄 함유<br/><br/>☞ 사용원료<br/>제품설명 참고<br/><br/>☞ 원산지<br/>Petcurean Pet Nutrition inc. MADE IN CANADA','2021-07-08 15:34:57',3,'캐나다'),('PRD0038','사료','퍼피','나우','나우 그레인프리 퍼피 스몰브리드 11.3kg',103500,NULL,5,'now_graynFree_puppy_smallbrid_11.3kg.PNG','frd.jpg','☞ 유통기한 안내<br/>GO 사료와 NOW사료는 모두 제조일로부터 유통기한이 1년 4개월인 사료입니다.<br/>구매하시는 모든 고객님들 참고 부탁드립니다.~!!!<br/><br/>☞ 등록성분<br/>조단백: 28% 이상, 조지방:18% 이상, 칼슘: 1.2% 이상, 인: 0.8% 이상, 조섬유: 4.0% 이하, 조회분: 7.6% 이하, 오메가6: 3.0% 이상, 오메가3: 0.6% 이상, 유산균 90,000,000CFU/lb 이상, DHA: 0.07% 이상, EPA: 0.02% 이상, 타우린: 1,000mg/kg 이상, L-카르니틴: 100mg/kg 이상, 아르기닌, 엘라이신, 메티오닌, 트립토판, 티아민, 리보플라빈, 베타카로틴 등 필수 비타민 미네랄 함유<br/><br/>☞ 사용원료<br/>제품설명 참고<br/><br/>☞ 원산지<br/>Petcurean Pet Nutrition inc. MADE IN CANADA','2021-07-08 15:36:02',33,'캐나다'),('PRD0041','사료','어덜트','아카나','아카나 어덜트 스몰브리드 2kg',26100,NULL,22,'acana_adult_smallbrid_2kg.PNG','frd.jpg','제품명<br/>아카나 사료<br/>아카나 어덜트 스몰 브리드 사료<br/><br/>원료<br/>뼈를 발라낸 신선한 닭고기, 건조 닭고기, 건조 칠면조고기, 붉은 렌틸콩, 녹색 완두콩, 잠두, 닭 지방, 신선한 닭 내장육, 건조 청어, 신선한 통 계란, 신선한 가자미, 청어유, 햇볕에 건조한 알팔파, 녹색 렌틸콩, 황색 완두콩, 완두 섬유질, 신선한 닭 연골, 갈색 켈프, 신선한 호박, 버터넛 스쿼시, 파스닙, 케일, 시금치, 겨잣잎, 순무잎, 당근, 사과, 배, 냉동건조 닭간, 냉동건조 칠면조간, 크랜베리, 블루베리, 치커리뿌리, 강황, 밀크시슬, 우엉뿌리, 라벤더, 마시멜로뿌리, 로즈힙<br/><br/>등록성분<br/>조단백 31.0% 이상<br/>조지방 17.0% 이상<br/>조섬유 5.0% 이하<br/>조회분 7.0% 이하<br/>수분 12.0% 이하<br/>칼슘 1.4% 이상<br/>인 1.1% 이상<br/>칼로리 1kg 당 3510kcal<br/><br/>급여시 주의사항<br/>1. 급여량은 체질, 환경, 나이, 운동량 등에 따라 달라질 수 있습니다<br/>2. 반려견의 체중변화와 변상태 등에 따라 식사량을 조절합니다<br/>3. 하루에 두번 가급적 지정된 시간에 급여하는 것을 권장합니다<br/>4. 항상 신선하고 깨끗한 물을 마실 수 있도록 준비하시기 바랍니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>Champion Petfoods 챔피온펫푸드, 캐나다<br/>','2021-07-09 02:23:48',6,'캐나다'),('PRD0042','사료','어덜트','아카나','아카나 어덜트 스몰브리드 6kg',56500,NULL,10,'acana_adult_smallbrid_6kg.PNG','frd.jpg','제품명<br/>아카나 사료<br/>아카나 어덜트 스몰 브리드 사료<br/><br/>원료<br/>뼈를 발라낸 신선한 닭고기, 건조 닭고기, 건조 칠면조고기, 붉은 렌틸콩, 녹색 완두콩, 잠두, 닭 지방, 신선한 닭 내장육, 건조 청어, 신선한 통 계란, 신선한 가자미, 청어유, 햇볕에 건조한 알팔파, 녹색 렌틸콩, 황색 완두콩, 완두 섬유질, 신선한 닭 연골, 갈색 켈프, 신선한 호박, 버터넛 스쿼시, 파스닙, 케일, 시금치, 겨잣잎, 순무잎, 당근, 사과, 배, 냉동건조 닭간, 냉동건조 칠면조간, 크랜베리, 블루베리, 치커리뿌리, 강황, 밀크시슬, 우엉뿌리, 라벤더, 마시멜로뿌리, 로즈힙<br/><br/>등록성분<br/>조단백 31.0% 이상<br/>조지방 17.0% 이상<br/>조섬유 5.0% 이하<br/>조회분 7.0% 이하<br/>수분 12.0% 이하<br/>칼슘 1.4% 이상<br/>인 1.1% 이상<br/>칼로리 1kg 당 3510kcal<br/><br/>급여시 주의사항<br/>1. 급여량은 체질, 환경, 나이, 운동량 등에 따라 달라질 수 있습니다<br/>2. 반려견의 체중변화와 변상태 등에 따라 식사량을 조절합니다<br/>3. 하루에 두번 가급적 지정된 시간에 급여하는 것을 권장합니다<br/>4. 항상 신선하고 깨끗한 물을 마실 수 있도록 준비하시기 바랍니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>Champion Petfoods 챔피온펫푸드, 캐나다','2021-07-09 02:24:50',4,'캐나다'),('PRD0043','사료','어덜트','나우','나우 그레인프리 어덜트 스몰브리드 2.7kg',35700,NULL,8,'now_graynFree_adult_smallbrid_2.7kg.PNG','frd.jpg','☞ 유통기한 안내<br/>GO 사료와 NOW사료는 모두 제조일로부터 유통기한이 1년 4개월인 사료입니다.<br/>구매하시는 모든 고객님들 참고 부탁드립니다.~!!!<br/><br/>☞ 등록성분<br/>조단백: 27% 이상, 조지방:17% 이상, 칼슘: 1.2% 이상, 인: 0.8% 이상, 조섬유: 4.0% 이하, 조회분: 9.0% 이하, 오메가6: 2.5% 이상, 오메가3: 0.5% 이상, 유산균 90,000,000CFU/lb 이상, DHA: 0.07% 이상, EPA: 0.02% 이상, 타우린: 1,000mg/kg 이상, L-카르니틴: 100mg/kg 이상, 아르기닌, 엘라이신, 메티오닌, 트립토판, 티아민, 리보플라빈, 베타카로틴 등 필수 비타민 미네랄 함유<br/><br/>☞ 사용원료<br/>제품 상세 설명 참조<br/><br/>☞ 원산지<br/>Petcurean Pet Nutrition inc. MADE IN CANADA','2021-07-09 02:26:08',1,'캐나다'),('PRD0044','사료','어덜트','나우','나우 그레인프리 어덜트 스몰브리드 5.4kg',65000,NULL,15,'now_graynFree_adult_smallbrid_5.4kg.PNG','frd.jpg','☞ 유통기한 안내<br/>GO 사료와 NOW사료는 모두 제조일로부터 유통기한이 1년 4개월인 사료입니다.<br/>구매하시는 모든 고객님들 참고 부탁드립니다.~!!!<br/><br/>☞ 등록성분<br/>조단백: 27% 이상, 조지방:17% 이상, 칼슘: 1.2% 이상, 인: 0.8% 이상, 조섬유: 4.0% 이하, 조회분: 9.0% 이하, 오메가6: 2.5% 이상, 오메가3: 0.5% 이상, 유산균 90,000,000CFU/lb 이상, DHA: 0.07% 이상, EPA: 0.02% 이상, 타우린: 1,000mg/kg 이상, L-카르니틴: 100mg/kg 이상, 아르기닌, 엘라이신, 메티오닌, 트립토판, 티아민, 리보플라빈, 베타카로틴 등 필수 비타민 미네랄 함유<br/><br/>☞ 사용원료<br/>제품 상세 설명 참조<br/><br/>☞ 원산지<br/>Petcurean Pet Nutrition inc. MADE IN CANADA','2021-07-09 02:27:28',2,'캐나다'),('PRD0045','사료','어덜트','나우','나우 그레인프리 피쉬 어덜트 스몰브리드 2.7kg',44000,NULL,14,'now_graynFree_fishAdult_smallbrid_2.7kg.PNG','frd.jpg','제품명<br/>나우 그레인프리 피쉬 어덜트(송어,연어,청어)<br/><br/>제조연월<br/>유통기한으로부터 1년 4개월 전 제조<br/><br/>유통기한<br/>제품 후면 별도 표시(읽는법 예시 : BB/MA 2019(년도) FE(월) 10(일)<br/><br/>주의사항<br/>직사광선을 피해 습기가 없고 시원한곳에 보관하십시오.<br/><br/>수출원/수입판매원<br/>Petcurean Pet Nutrition Inc / (주)이글벳','2021-07-09 02:28:44',5,'캐나다'),('PRD0047','사료','어덜트','로얄캐닌','로얄캐닌 미니 어덜트 파우치 85g x 12개 세트',13800,NULL,44,'royalCanin_mini_adult_pouch_85g_x12.PNG','frd.jpg','제품명<br/>로얄캐닌 미니 어덜트 파우치<br/><br/>원료<br/>닭, 돼지, 쌀, 분말셀룰로스, 금잔화추출물, 어유, 해바라기유, 미네랄, 효모, 캐러맬, 비타민D3, 철, 요오드, 구리, 망간, 아연, 제올라이트<br/><br/>등록성분<br/>조단백 5.5% 이상<br/>조지방 3.5% 이상<br/>칼슘 0.05% 이상<br/>인 0.01% 이상<br/>조섬유 2.1% 이하<br/>조회분 1.8% 이하<br/>수분 82.5% 이하<br/><br/>주의사항<br/>1. 반추동물 급여금지<br/>2. 개봉 후 냉장보관하거나 빨리 사용하시기 바랍니다<br/>3. 직사광선이 닿는 장소 및 해충이 있는 장소를 피하여 서늘하고 건조한 장소에 보관하여 주십시오<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 24개월 전<br/><br/>제조원 및 원산지<br/>MARS, 오스트리아','2021-07-09 02:31:20',7,'오스트리아'),('PRD0049','사료','시니어','로얄캐닌','로얄캐닌 미니 에이징 파우치 85g x 12개 세트',13800,NULL,50,'royalCanin_mini_ajing_pouch_85g_x12.PNG','frd.jpg','제품명<br/>로얄캐닌 미니 에이징 12+ 파우치<br/><br/>원료<br/>닭, 돼지, 쌀, 밀글루텐, 분말셀룰로스, 금잔화추출물, 어유, 해바라기유, 토마토, 미네랄, 효모, 캐러맬, 비타민D3, 철, 요오드, 구리, 망간, 아연, 제올라이트<br/><br/>등록성분<br/>조단백 6.0% 이상<br/>조지방 3.6% 이상<br/>칼슘 0.01% 이상<br/>인 0.01% 이상<br/>조섬유 2.1% 이하<br/>조회분 1.4% 이하<br/>수분 81.5% 이하<br/><br/>주의사항<br/>1. 반추동물 급여금지<br/>2. 개봉 후 냉장보관하거나 빨리 사용하시기 바랍니다<br/>3. 직사광선이 닿는 장소 및 해충이 있는 장소를 피하여 서늘하고 건조한 장소에 보관하여 주십시오<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 24개월 전<br/><br/>제조원 및 원산지<br/>MARS, 오스트리아','2021-07-09 02:37:47',1,'오스트리아'),('PRD0050','사료','시니어','나우','나우 그레인프리 시니어 스몰브리드 2.7kg',35700,NULL,15,'now_graynFree_senior_smallbrid_2.7kg.PNG','frd.jpg','☞ 유통기한 안내<br/>GO 사료와 NOW사료는 모두 제조일로부터 유통기한이 1년 4개월인 사료입니다.<br/>구매하시는 모든 고객님들 참고 부탁드립니다.~!!!<br/><br/>☞ 등록성분<br/>제품 상세 설명 참조<br/><br/>☞ 사용원료<br/>제품 상세 설명 참조<br/><br/>☞ 보증성분<br/>조단백(최소) 24%<br/>조지방(최소) 11%<br/>조섬유(최대) 4.5%<br/>습기(최대) 10%<br/>인(최소) 0.6%<br/>클루코사민(최소) 400mg/kg<br/>콘드로이친(최소) 100mg/kg<br/>L 카르니틴 (최소) 100mg/kg<br/>타우린(최소) 1,000mg/kg<br/>오메가 6 (최소) 2.0%<br/>오메가 3 (최소) 0.4%<br/>미생물 (최소) 90,000,000 CFU/lb<br/>(젖산간 유산균, 엔테로구균 페시움)<br/><br/>☞ 원산지<br/>Petcurean Pet Nutrition inc. MADE IN CANADA','2021-07-09 02:39:39',6,'캐나다'),('PRD0051','사료','시니어','나우','나우 그레인프리 시니어 스몰브리드 5.4kg',65000,NULL,4,'now_graynFree_senior_smallbrid_5.4kg.PNG','frd.jpg','☞ 유통기한 안내<br/>GO 사료와 NOW사료는 모두 제조일로부터 유통기한이 1년 4개월인 사료입니다.<br/>구매하시는 모든 고객님들 참고 부탁드립니다.~!!!<br/><br/>☞ 등록성분<br/>제품 상세 설명 참조<br/><br/>☞ 사용원료<br/>제품 상세 설명 참조<br/><br/>☞ 보증성분<br/>조단백(최소) 24%<br/>조지방(최소) 11%<br/>조섬유(최대) 4.5%<br/>습기(최대) 10%<br/>인(최소) 0.6%<br/>클루코사민(최소) 400mg/kg<br/>콘드로이친(최소) 100mg/kg<br/>L 카르니틴 (최소) 100mg/kg<br/>타우린(최소) 1,000mg/kg<br/>오메가 6 (최소) 2.0%<br/>오메가 3 (최소) 0.4%<br/>미생물 (최소) 90,000,000 CFU/lb<br/>(젖산간 유산균, 엔테로구균 페시움)<br/><br/>☞ 원산지<br/>Petcurean Pet Nutrition inc. MADE IN CANADA','2021-07-09 02:40:48',8,'캐나다'),('PRD0052','사료','시니어','오리젠','오리젠 시니어 독 6kg',71800,NULL,7,'orijen_seniorDog_6kg.PNG','frd.jpg','제품명<br/>오리젠 사료<br/>오리젠 시니어 독 사료<br/><br/>원료<br/>닭살코기, 통 계란, 칠면조살코기, 청어, 닭간, 가자미, 칠면조간, 닭목, 닭심장, 칠면조심장, 건조닭고기, 건조칠면조고기, 건조고등어, 건조정어리, 건조청어, 붉은렌틸콩, 녹색렌틸콩, 풋완두, 렌틸섬유질, 병아리콩, 노란완두콩, 호랑이콩, 닭연골, 흰강낭콩, 청어유, 닭지방, 칠면조연골, 건조닭간, 건조칠면조간, 호박, 버터넛스쿼시, 주키니, 파스닙, 당근, 사과, 배, 케일, 시금치, 비트그린, 순무잎, 켈프, 크랜베리, 블루베리, 사스카툰베리, 치커리뿌리, 강황뿌리, 밀크시슬, 우엉뿌리, 라벤더, 마시멜로뿌리, 로즈힙<br/><br/>등록성분<br/>조단백질 38%<br/>조지방 15%<br/>조회분 8%<br/>조섬유 8%<br/>수분 12%<br/>칼슘 1.3%<br/>인 1.1%<br/>칼로리 1kg 당 3630kcal<br/><br/>급여시 주의사항<br/>1. 급여량은 체질, 환경, 나이, 운동량 등에 따라 달라질 수 있습니다<br/>2. 반려견의 체중변화와 변상태 등에 따라 식사량을 조절합니다<br/>3. 하루에 두번 가급적 지정된 시간에 급여하는 것을 권장합니다<br/>4. 항상 신선하고 깨끗한 물을 마실 수 있도록 준비하시기 바랍니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>Champion Petfoods 챔피온펫푸드, 캐나다','2021-07-09 02:41:58',2,'캐나다'),('PRD0053','사료','시니어','오리젠','오리젠 시니어 독 11.4kg',119000,NULL,10,'orijen_seniorDog_11.4kg.PNG','frd.jpg','제품명<br/>오리젠 사료<br/>오리젠 시니어 독 사료<br/><br/>원료<br/>닭살코기, 통 계란, 칠면조살코기, 청어, 닭간, 가자미, 칠면조간, 닭목, 닭심장, 칠면조심장, 건조닭고기, 건조칠면조고기, 건조고등어, 건조정어리, 건조청어, 붉은렌틸콩, 녹색렌틸콩, 풋완두, 렌틸섬유질, 병아리콩, 노란완두콩, 호랑이콩, 닭연골, 흰강낭콩, 청어유, 닭지방, 칠면조연골, 건조닭간, 건조칠면조간, 호박, 버터넛스쿼시, 주키니, 파스닙, 당근, 사과, 배, 케일, 시금치, 비트그린, 순무잎, 켈프, 크랜베리, 블루베리, 사스카툰베리, 치커리뿌리, 강황뿌리, 밀크시슬, 우엉뿌리, 라벤더, 마시멜로뿌리, 로즈힙<br/><br/>등록성분<br/>조단백질 38%<br/>조지방 15%<br/>조회분 8%<br/>조섬유 8%<br/>수분 12%<br/>칼슘 1.3%<br/>인 1.1%<br/>칼로리 1kg 당 3630kcal<br/><br/>급여시 주의사항<br/>1. 급여량은 체질, 환경, 나이, 운동량 등에 따라 달라질 수 있습니다<br/>2. 반려견의 체중변화와 변상태 등에 따라 식사량을 조절합니다<br/>3. 하루에 두번 가급적 지정된 시간에 급여하는 것을 권장합니다<br/>4. 항상 신선하고 깨끗한 물을 마실 수 있도록 준비하시기 바랍니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>Champion Petfoods 챔피온펫푸드, 캐나다','2021-07-09 02:43:00',5,'캐나다'),('PRD0054','간식','사사미','더주스','THINK YOUR DOG TEETH 연어우유껌 6개입',6900,NULL,39,'thinkYourDogTeeth_yeonuh_240g.PNG','frd.jpg','제품명<br/>띵크유어독티스 껌<br/>띵크유어독티스 연어우유껌<br/>THINK YOUR DOG TEETH 껌<br/>THINK YOUR DOG TEETH 연어우유껌<br/><br/>원료<br/>연어, 소가죽, 감자전분, 대구, 글리세린, 식물성단백질, 솔피톨, 소금, 소르빈산칼륨<br/><br/>등록성분<br/>조단백 47% 이상<br/>조지방 8% 이하<br/>조회분 7% 이하<br/>수분 18% 이하<br/><br/>권장급여량<br/>5kg 이하 30g<br/>5~10kg 60g<br/>10~25kg 90g<br/>25kg 이상 120g<br/><br/>주의사항<br/>1. 반려견 이외의 동물에는 급여하지 마십시오<br/>2. 천연소가죽을 사용하므로 색, 형태 등에 다소 차이가 있을 수 있지만 품질에는 전혀 문제가 없습니다<br/>3. 생후 3개월 미만의 반려견에게는 급여하지 마십시오<br/>4. 어린이의 손이 닿지 않는 곳에 보관하십시오<br/>5. 본 제품은 반려견 간식으로만 사용하십시오<br/><br/>보관방법<br/>1. 직사광선과 고온, 다습한 곳은 피해서 보관하여 주십시오<br/>2. 개봉 후에는 빠른 시일내에 급여하시고 가급적 냉방보관하여 주십시오<br/><br/>수입판매원 및 원산지<br/>더주스, 중국','2021-07-09 06:25:15',12,'중국'),('PRD0055','간식','사사미','더주스','THINK YOUR DOG TEETH 소고기우유껌 6개입',6900,NULL,45,'thinkYourDogTeeth_sogogi_240g.PNG','frd.jpg','제품명<br/>띵크유어독티스 껌<br/>띵크유어독티스 소고기우유껌<br/>THINK YOUR DOG TEETH 껌<br/>THINK YOUR DOG TEETH 소고기우유껌<br/><br/>원료<br/>소고기, 소가죽, 감자전분, 대구, 글리세린, 식물성단백질, 솔피톨, 소금, 소르빈산칼륨<br/><br/>등록성분<br/>조단백 47% 이상<br/>조지방 8% 이하<br/>조회분 7% 이하<br/>수분 18% 이하<br/><br/>권장급여량<br/>5kg 이하 30g<br/>5~10kg 60g<br/>10~25kg 90g<br/>25kg 이상 120g<br/><br/>주의사항<br/>1. 반려견 이외의 동물에는 급여하지 마십시오<br/>2. 천연소가죽을 사용하므로 색, 형태 등에 다소 차이가 있을 수 있지만 품질에는 전혀 문제가 없습니다<br/>3. 생후 3개월 미만의 반려견에게는 급여하지 마십시오<br/>4. 어린이의 손이 닿지 않는 곳에 보관하십시오<br/>5. 본 제품은 반려견 간식으로만 사용하십시오<br/><br/>보관방법<br/>1. 직사광선과 고온, 다습한 곳은 피해서 보관하여 주십시오<br/>2. 개봉 후에는 빠른 시일내에 급여하시고 가급적 냉방보관하여 주십시오<br/><br/>수입판매원 및 원산지<br/>더주스, 중국','2021-07-09 06:26:25',51,'중국'),('PRD0056','간식','사사미','더주스','THINK YOUR DOG TEETH 치킨우유껌 6개입',6900,NULL,50,'thinkYourDogTeeth_chicken_240g.PNG','frd.jpg','제품명<br/>띵크유어독티스 껌<br/>띵크유어독티스 치킨우유껌<br/>THINK YOUR DOG TEETH 껌<br/>THINK YOUR DOG TEETH 치킨우유껌<br/><br/>원료<br/>소가죽, 닭고기<br/><br/>등록성분<br/>조단백 70% 이상<br/>조지방 4.0% 이하<br/>조회분 2.0% 이하<br/>수분 18% 이하<br/><br/>권장급여량<br/>5kg 이하 30g<br/>5~10kg 60g<br/>10~25kg 90g<br/>25kg 이상 120g<br/><br/>주의사항<br/>1. 반려견 이외의 동물에는 급여하지 마십시오<br/>2. 천연소가죽을 사용하므로 색, 형태 등에 다소 차이가 있을 수 있지만 품질에는 전혀 문제가 없습니다<br/>3. 생후 3개월 미만의 반려견에게는 급여하지 마십시오<br/>4. 어린이의 손이 닿지 않는 곳에 보관하십시오<br/>5. 본 제품은 반려견 간식으로만 사용하십시오<br/><br/>보관방법<br/>1. 직사광선과 고온, 다습한 곳은 피해서 보관하여 주십시오<br/>2. 개봉 후에는 빠른 시일내에 급여하시고 가급적 냉방보관하여 주십시오<br/><br/>수입판매원 및 원산지<br/>더주스, 중국','2021-07-09 06:27:31',2,'중국'),('PRD0057','간식','사사미','더주스','THINK YOUR DOG TEETH 오리우유껌 6개입',6900,NULL,44,'thinkYourDogTeeth_ori_240g.PNG','frd.jpg','제품명<br/>띵크유어독티스 껌<br/>띵크유어독티스 오리우유껌<br/>THINK YOUR DOG TEETH 껌<br/>THINK YOUR DOG TEETH 오리우유껌<br/><br/>원료<br/>소가죽, 오리고기<br/><br/>등록성분<br/>조단백 70% 이상<br/>조지방 4.0% 이하<br/>조회분 2.0% 이하<br/>수분 18% 이하<br/><br/>권장급여량<br/>5kg 이하 30g<br/>5~10kg 60g<br/>10~25kg 90g<br/>25kg 이상 120g<br/><br/>주의사항<br/>1. 반려견 이외의 동물에는 급여하지 마십시오<br/>2. 천연소가죽을 사용하므로 색, 형태 등에 다소 차이가 있을 수 있지만 품질에는 전혀 문제가 없습니다<br/>3. 생후 3개월 미만의 반려견에게는 급여하지 마십시오<br/>4. 어린이의 손이 닿지 않는 곳에 보관하십시오<br/>5. 본 제품은 반려견 간식으로만 사용하십시오<br/><br/>보관방법<br/>1. 직사광선과 고온, 다습한 곳은 피해서 보관하여 주십시오<br/>2. 개봉 후에는 빠른 시일내에 급여하시고 가급적 냉방보관하여 주십시오<br/><br/>수입판매원 및 원산지<br/>더주스, 중국','2021-07-09 06:29:00',3,'중국'),('PRD0058','간식','사사미','에스엠펫','더담은 일키로 고구마치킨 1kg',17000,NULL,28,'thedameun_gogoomaChicken_1kg.PNG','frd.jpg','☞ 제품명<br/>더담은 일키로 고구마치킨 1kg<br/>더담은 고구마사사미<br/><br/>☞ 등록성분<br/>조단백 40%이상, 조지방 10%이하, 조회분 7%이하, 수분 30%이하<br/><br/>☞ 사용원료<br/>고구마, 닭가슴살, 글리세린, 솔비톨, 콩단백질, 옥수수전분, 소금, 소르빈산칼슘<br/><br/>☞ 실중량<br/>1kg<br/><br/>☞ 제조일자/유통기한<br/>별도표기<br/><br/>☞ 보존방법<br/>- 직사광선 및 고온다습한 장소를 피하여 보관하십시오.<br/>- 개봉후에는 밀봉하여 냉장보관하여 주세요.<br/>- 섭씨 25도 이하에 보관하여 주십시오.<br/><br/>☞ 수입판매원<br/>에스엠펫<br/><br/>☞ 원산지<br/>중국<br/><br/>☞ 주의사항<br/>- 반추동물에게 급여하지 마십시오.<br/>- 어린이 손이 닿지 않는 곳에 보관하세요.<br/>- 생후 3개월 미만의 반려견에게 급여하지 마십시오.<br/>- 본 제품은 반려견 간식으로만 사용하세요.','2021-07-09 06:30:35',11,'중국'),('PRD0059','간식','사사미','에스엠펫','더담은 일키로 닭갈비 1kg',17000,NULL,22,'thedameun_dakgalbi_1kg.PNG','frd.jpg','☞ 제품명<br/>더담은 일키로 닭갈비 1kg<br/>더담은 닭갈비<br/><br/>☞ 등록성분<br/>조단백 50%이상, 조지방 2.50%이하, 조회분 5%이하, 수분 25%이하<br/><br/>☞ 사용원료<br/>닭가슴살, 글리세린, 솔비톨, 콩단백질, 옥수수전분, 소금, 소르빈산칼슘<br/><br/>☞ 실중량<br/>1kg<br/><br/>☞ 제조일자/유통기한<br/>별도표기<br/><br/>☞ 보존방법<br/>- 직사광선 및 고온다습한 장소를 피하여 보관하십시오.<br/>- 개봉후에는 밀봉하여 냉장보관하여 주세요.<br/>- 섭씨 25도 이하에 보관하여 주십시오.<br/><br/>☞ 수입판매원<br/>에스엠펫<br/><br/>☞ 원산지<br/>중국<br/><br/>☞ 주의사항<br/>- 반추동물에게 급여하지 마십시오.<br/>- 어린이 손이 닿지 않는 곳에 보관하세요.<br/>- 생후 3개월 미만의 반려견에게 급여하지 마십시오.<br/>- 본 제품은 반려견 간식으로만 사용하세요.','2021-07-09 06:31:47',66,'중국'),('PRD0060','간식','사사미','에스엠펫','더담은 일키로 소프트꽈배기 1kg',17000,NULL,30,'thedameun_softGgwaBaeGi_1kg.PNG','frd.jpg','☞ 제품명<br/>더담은 일키로 소프트꽈배기 1kg<br/>더담은 소프트꽈배기<br/><br/>☞ 등록성분<br/>조단백 40%이상, 조지방 2.50%이하, 조회분 5%이하, 수분 25%이하<br/><br/>☞ 사용원료<br/>닭가슴살, 글리세린, 솔비톨, 콩단백질, 옥수수전분, 소금, 소르빈산칼슘<br/><br/>☞ 실중량<br/>1kg<br/><br/>☞ 제조일자/유통기한<br/>별도표기<br/><br/>☞ 보존방법<br/>- 직사광선 및 고온다습한 장소를 피하여 보관하십시오.<br/>- 개봉후에는 밀봉하여 냉장보관하여 주세요.<br/>- 섭씨 25도 이하에 보관하여 주십시오.<br/><br/>☞ 수입판매원<br/>에스엠펫<br/><br/>☞ 원산지<br/>중국<br/><br/>☞ 주의사항<br/>- 반추동물에게 급여하지 마십시오.<br/>- 어린이 손이 닿지 않는 곳에 보관하세요.<br/>- 생후 3개월 미만의 반려견에게 급여하지 마십시오.<br/>- 본 제품은 반려견 간식으로만 사용하세요.','2021-07-09 06:33:10',1,'중국'),('PRD0061','간식','사사미','에스엠펫','더담은 일키로 오리와 고구마 1kg',17000,NULL,27,'thedameun_oriANDgogooma_1kg.PNG','frd.jpg','☞ 제품명<br/>더담은 일키로 오리와 고구마 1kg<br/>더담은 오리와 고구마<br/><br/>☞ 등록성분<br/>조단백 38%이상, 조지방 2.50%이하, 조회분 5%이하, 수분 25%이하<br/><br/>☞ 사용원료<br/>오리가슴살, 고구마, 글리세린, 솔비톨, 콩단백질, 옥수수전분, 소금, 소르빈산칼슘<br/><br/>☞ 실중량<br/>1kg<br/><br/>☞ 제조일자/유통기한<br/>별도표기<br/><br/>☞ 보존방법<br/>- 직사광선 및 고온다습한 장소를 피하여 보관하십시오.<br/>- 개봉후에는 밀봉하여 냉장보관하여 주세요.<br/>- 섭씨 25도 이하에 보관하여 주십시오.<br/><br/>☞ 수입판매원<br/>에스엠펫<br/><br/>☞ 원산지<br/>중국<br/><br/>☞ 주의사항<br/>- 반추동물에게 급여하지 마십시오.<br/>- 어린이 손이 닿지 않는 곳에 보관하세요.<br/>- 생후 3개월 미만의 반려견에게 급여하지 마십시오.<br/>- 본 제품은 반려견 간식으로만 사용하세요.','2021-07-09 06:34:26',33,'중국'),('PRD0062','간식','사사미','후코홀릭','후코홀릭 황태 오리김밥 80g',6300,NULL,40,'whocoholic_hwangtae_origimbab_80g.PNG','frd.jpg','제품명<br/>후코홀릭 수제간식<br/>후코홀릭 프리미엄 수제간식<br/>후코홀릭 프리미엄 수제간식 황태 오리김밥<br/><br/>원료<br/>황태껍질, 오리고기, 당근, 고구마, 글리세린 등<br/><br/>등록성분<br/>조단백 35% 이상<br/>조지방 4% 이하<br/>조회분 5% 이하<br/>수분 16.5% 이하<br/><br/>중량<br/>80g<br/><br/>주의사항<br/>1. 직사광선이 닿는 장소, 해충이 있는 장소 등을 피하시고 서늘하고 건조한 장소에 보관하세요<br/>2. 개봉 후에는 빠른 시일 내에 급여하시고 밀봉하여 보관하시기 바랍니다<br/>3. 애견의 크기와 운동량에 따라 급여량을 조절해주십시오<br/>4. 애견전용 간식이므로 훈련 및 간식 용도 외에 주식으로 급여하지 마십시오<br/><br/>제조일자<br/>포장에 별도 표기, 유통기한은 제조일로부터 12개월 후<br/><br/>제조원 및 원산지<br/>씨엔케이, 한국','2021-07-09 06:36:16',32,'한국'),('PRD0063','간식','사사미','네추럴EX','네츄럴EX 한우껌 오리 40개입',24000,NULL,18,'naturalEX_hanwooGgum_ori_x40.PNG','frd.jpg','제품명<br/>네추럴EX 한우껌 오리<br/><br/>중량<br/>6g 이상<br/><br/>크기<br/>길이 10cm 정도<br/>두께 1.5cm 정도<br/>원재료를 변형없이 가공하여 크기 차이가 있을 수 있습니다<br/><br/>원재료명<br/>한우우피, 오리, 베타카로틴 추출물<br/><br/>성분<br/>조단백 95% 이상<br/>조지방 6% 이하<br/>조회분 2.5% 이하<br/>수분 10% 이하<br/><br/>주의사항<br/>1. 간혹 제품 표면에 하얗거나 검은 색깔이 나타날 수 있으나, 성분의 일부이니 안심하고 급여하셔도 됩니다<br/>2. 서늘하고 건조한 곳에 보관하시고 유효기간을 준수하세요<br/>3. 해충 및 직사광선을 피하고 어린이의 손에 닿지 않는 곳에 보관 하십시오<br/>4. 포장 불량 등으로 유통 과정 중 변질된 제품은 절대 급여하지 마시고 구입처에서 교환, 환불 바랍니다<br/>5. 반추 동물에게 급여하지 마십시오<br/>6. 반려동물이 씹지 않고 급하게 섭취할 경우 목에 걸려 심각한 상해가 발생할 수 있으니 급여시 주의가 필요합니다<br/><br/>유통기한<br/>제품 포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전','2021-07-09 06:37:56',15,'한국'),('PRD0064','간식','사사미','네추럴EX','네츄럴EX 한우껌 칠면조 40개입',24000,NULL,10,'naturalEX_hanwooGgum_7myunjo_x40.PNG','frd.jpg','제품명<br/>네추럴EX 한우껌 칠면조<br/><br/>중량<br/>6g 이상<br/><br/>크기<br/>길이 10cm 정도<br/>두께 1.5cm 정도<br/>원재료를 변형없이 가공하여 크기 차이가 있을 수 있습니다<br/><br/>원재료명<br/>한우우피, 칠면조, 베타카로틴 추출물<br/><br/>성분<br/>조단백 75% 이상<br/>조지방 1% 이하<br/>조회분 1% 이하<br/>수분 13% 이하<br/><br/>주의사항<br/>1. 간혹 제품 표면에 하얗거나 검은 색깔이 나타날 수 있으나, 성분의 일부이니 안심하고 급여하셔도 됩니다<br/>2. 서늘하고 건조한 곳에 보관하시고 유효기간을 준수하세요<br/>3. 해충 및 직사광선을 피하고 어린이의 손에 닿지 않는 곳에 보관 하십시오<br/>4. 포장 불량 등으로 유통 과정 중 변질된 제품은 절대 급여하지 마시고 구입처에서 교환, 환불 바랍니다<br/>5. 반추 동물에게 급여하지 마십시오<br/>6. 반려동물이 씹지 않고 급하게 섭취할 경우 목에 걸려 심각한 상해가 발생할 수 있으니 급여시 주의가 필요합니다<br/><br/>유통기한<br/>제품 포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전','2021-07-09 06:38:53',9,'한국'),('PRD0066','간식','껌','에스엠펫','더담은 일키로 오리와 스틱껌 1kg',17000,NULL,17,'thedameun_sasamiANDstickggum_1kg.PNG','frd.jpg','☞ 제품명<br/>더담은 일키로 오리와 스틱껌 1kg<br/>더담은 오리고기 스틱껌<br/>더담은 오리꼬치<br/><br/>☞ 등록성분<br/>조단백 40%이상, 조지방 10%이하, 조회분 7%이하, 수분 30%이하<br/><br/>☞ 사용원료<br/>오리가슴살, 글리세린, 솔비톨, 콩단백질, 옥수수전분, 소금, 소르빈산칼슘<br/><br/>☞ 실중량<br/>1kg<br/><br/>☞ 제조일자/유통기한<br/>별도표기<br/><br/>☞ 보존방법<br/>- 직사광선 및 고온다습한 장소를 피하여 보관하십시오.<br/>- 개봉후에는 밀봉하여 냉장보관하여 주세요.<br/>- 섭씨 25도 이하에 보관하여 주십시오.<br/><br/>☞ 수입판매원<br/>에스엠펫<br/><br/>☞ 원산지<br/>중국<br/><br/>☞ 주의사항<br/>- 반추동물에게 급여하지 마십시오.<br/>- 어린이 손이 닿지 않는 곳에 보관하세요.<br/>- 생후 3개월 미만의 반려견에게 급여하지 마십시오.<br/>- 본 제품은 반려견 간식으로만 사용하세요.','2021-07-09 06:47:07',5,'중국'),('PRD0067','간식','껌','에스엠펫','더담은 일키로 오리와 스틱껌 1kg',17000,NULL,22,'thedameun_oriANDstickggum_1kg.PNG','frd.jpg','☞ 제품명<br/>더담은 일키로 오리와 스틱껌 1kg<br/>더담은 오리고기 스틱껌<br/>더담은 오리꼬치<br/><br/>☞ 등록성분<br/>조단백 40%이상, 조지방 10%이하, 조회분 7%이하, 수분 30%이하<br/><br/>☞ 사용원료<br/>오리가슴살, 글리세린, 솔비톨, 콩단백질, 옥수수전분, 소금, 소르빈산칼슘<br/><br/>☞ 실중량<br/>1kg<br/><br/>☞ 제조일자/유통기한<br/>별도표기<br/><br/>☞ 보존방법<br/>- 직사광선 및 고온다습한 장소를 피하여 보관하십시오.<br/>- 개봉후에는 밀봉하여 냉장보관하여 주세요.<br/>- 섭씨 25도 이하에 보관하여 주십시오.<br/><br/>☞ 수입판매원<br/>에스엠펫<br/><br/>☞ 원산지<br/>중국<br/><br/>☞ 주의사항<br/>- 반추동물에게 급여하지 마십시오.<br/>- 어린이 손이 닿지 않는 곳에 보관하세요.<br/>- 생후 3개월 미만의 반려견에게 급여하지 마십시오.<br/>- 본 제품은 반려견 간식으로만 사용하세요.','2021-07-09 06:48:00',1,'중국'),('PRD0071','간식','껌','네추럴EX','네츄럴EX 한우껌 닭가슴살 40개입',24000,NULL,11,'naturalEX_hanwooGgum_chicken_x40.PNG','frd.jpg','제품명<br/>네추럴EX 한우껌 닭가슴살<br/><br/>중량<br/>6g 이상<br/><br/>크기<br/>길이 10cm 정도<br/>두께 1.5cm 정도<br/>원재료를 변형없이 가공하여 크기 차이가 있을 수 있습니다<br/><br/>원재료명<br/>한우우피, 닭가슴살, 베타카로틴 추출물<br/><br/>성분<br/>조단백 80% 이상<br/>조지방 2% 이하<br/>조회분 3.5% 이하<br/>수분 12% 이하<br/><br/>주의사항<br/>1. 간혹 제품 표면에 하얗거나 검은 색깔이 나타날 수 있으나, 성분의 일부이니 안심하고 급여하셔도 됩니다<br/>2. 서늘하고 건조한 곳에 보관하시고 유효기간을 준수하세요<br/>3. 해충 및 직사광선을 피하고 어린이의 손에 닿지 않는 곳에 보관 하십시오<br/>4. 포장 불량 등으로 유통 과정 중 변질된 제품은 절대 급여하지 마시고 구입처에서 교환, 환불 바랍니다<br/>5. 반추 동물에게 급여하지 마십시오<br/>6. 반려동물이 씹지 않고 급하게 섭취할 경우 목에 걸려 심각한 상해가 발생할 수 있으니 급여시 주의가 필요합니다<br/><br/>유통기한<br/>제품 포장에 별도 표기, 제조일은 유통기한으로부터 18개월 전<br/><br/>제조원 및 원산지<br/>네추럴EX 055-342-3776, 한국','2021-07-09 07:57:49',4,'한국'),('PRD0072','간식','건조','바우와우','바우와우 올백프로 동결건조 연어 50g',8000,NULL,33,'bowwow_all100pro_geonjo_50g.PNG','frd.jpg','제품명<br/>바우와우 올백프로 동결건조 트릿<br/>바우와우 올백프로 동결건조 연어 트릿<br/><br/>원료<br/>연어<br/><br/>등록성분<br/>조단백질 60.0% 이상<br/>조지방 35.0% 이하<br/>조회분 10.0% 이하<br/>수분 10.0% 이하<br/><br/>급여방법<br/>1. 동결건조 트릿 형태 그대로 반려동물에게 급여합니다<br/>2. 사료, 간식 등 위에 뿌려서 토핑으로 급여합니다<br/>3. 미온수에 불려 먹기 쉽게 급여합니다<br/><br/>권장 급여량<br/>소형견 10kg 미만 5~8개<br/>중형견 10~20kg 8~12개<br/>대형견 20kg 이상 12~16개<br/>1. 일일 권장 급여량을 기준으로 하루에 2~3회가량 나누어 급여합니다<br/>2. 급여량은 견종, 체형, 운동량, 임신 여부에 따라 달라질 수 있습니다<br/><br/>주의사항<br/>1. 반려동물용 제품이므로 반려동물 이외에는 급여하지 않습니다<br/>2. 습기나 직사광선에 장시간 노출되지 않도록 보관하여 주시고 개봉 후에는 시원하고 그늘진 곳에 보관합니다<br/>3. 간혹 제품 표면에 하얀 성분 또는 검은 점이 나타날 때가 있으나 원료성분이므로 안심하고 급여합니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 24개월 전<br/><br/>제조원 및 원산지<br/>바우와우코리아 070-4364-4133, 한국','2021-07-09 08:02:39',5,'한국'),('PRD0073','간식','건조','바우와우','바우와우 올백프로 동결건조 오리고기 50g',8000,NULL,27,'bowwow_all100pro_geonjo_ori_50g.PNG','frd.jpg','제품명<br/>바우와우 올백프로 동결건조 트릿<br/>바우와우 올백프로 동결건조 오리고기 트릿<br/><br/>원료<br/>오리고기<br/><br/>등록성분<br/>조단백질 80.0% 이상<br/>조지방 10.0% 이하<br/>조회분 15.0% 이하<br/>수분 10.0% 이하<br/><br/>급여방법<br/>1. 동결건조 트릿 형태 그대로 반려동물에게 급여합니다<br/>2. 사료, 간식 등 위에 뿌려서 토핑으로 급여합니다<br/>3. 미온수에 불려 먹기 쉽게 급여합니다<br/><br/>권장 급여량<br/>소형견 10kg 미만 5~8개<br/>중형견 10~20kg 8~12개<br/>대형견 20kg 이상 12~16개<br/>1. 일일 권장 급여량을 기준으로 하루에 2~3회가량 나누어 급여합니다<br/>2. 급여량은 견종, 체형, 운동량, 임신 여부에 따라 달라질 수 있습니다<br/><br/>주의사항<br/>1. 반려동물용 제품이므로 반려동물 이외에는 급여하지 않습니다<br/>2. 습기나 직사광선에 장시간 노출되지 않도록 보관하여 주시고 개봉 후에는 시원하고 그늘진 곳에 보관합니다<br/>3. 간혹 제품 표면에 하얀 성분 또는 검은 점이 나타날 때가 있으나 원료성분이므로 안심하고 급여합니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 24개월 전<br/><br/>제조원 및 원산지<br/>바우와우코리아 070-4364-4133, 한국','2021-07-09 08:04:00',1,'한국'),('PRD0074','간식','건조','더 뉴질랜드 펫푸드','워프 동결건조 간식 녹색입홍합 50g ',13000,NULL,17,'woof_geonjo_gansik_noksaek_50g.PNG','frd.jpg','제품명<br/>워프 동결건조 간식<br/>워프 녹색입홍합 간식<br/>워프 동결건조 간식 녹색입홍합<br/><br/>원료<br/>뉴질랜드 녹색입홍합<br/><br/>등록성분<br/>조단백질 58.0% 이상<br/>조지방 9.0% 이하<br/>조섬유 2.0% 이하<br/>조회분 3.0% 이하<br/>수분 8.0% 이하<br/><br/>급여 방법<br/>1. 하루에 간식으로 반려동물 체중 2.5kg당 1개를 급여합니다<br/>2. 사료 위에 토핑으로 뿌려서 급여하셔도 됩니다<br/>3. 미지근한 물에 담가서 불리면 통통하고 부드러운 식감으로 급여할 수 있습니다<br/><br/>주의사항<br/>1. 천연 간식이므로 혈액, 지방이 응고되어 색상에 차이가 있을 수 있습니다<br/>2. 급여량은 견종, 나이에 따라 적절히 조절합니다<br/>3. 급여 시 한 번에 삼키지 않도록 끝까지 지켜봐 주시고 치아손상에 주의하여 급여합니다<br/>4. 개봉 후에는 가급적 빨리 급여하시고 잔량은 밀봉하여 냉장보관합니다<br/>5. 반려동물용이므로 반추동물에게는 급여하면 안 됩니다<br/>6. 직사광선을 피하고 습기가 없는 서늘한 곳에 보관합니다<br/>7. 제품 표면에 하얀 가루나 검은 점이 나타날 수 있으나 성분이 굳어서 생기는 현상으로 품질에는 이상이 없습니다<br/>8. 원재료를 변형 없이 가공하여 크기와 중량의 차이가 있을 수 있습니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 24개월 전<br/><br/>제조원 및 원산지<br/>더 뉴질랜드 펫푸드, 뉴질랜드','2021-07-09 08:05:32',8,'뉴질랜드'),('PRD0075','간식','건조','벅시','벅시 동결건조 간식 캐치미 이프 유 캔 소고기 소힘줄 강황 50g',13000,NULL,39,'bugsy_geonjo_gansik_sogogiGangHwang_50g.PNG','frd.jpg','제품명<br/>벅시 동결건조 간식<br/>벅시 동결건조 간식 캐치미 이프 유 캔<br/>벅시 동결건조 간식 호주산 소고기 소힘줄 강황<br/><br/>원료<br/>소고기, 소힘줄, 강황<br/><br/>등록성분<br/>조단백질 60% 이상<br/>조지방 26% 이상<br/>조회분 3.0% 이하<br/>조섬유 5.5% 이하<br/>수분 5.0% 이하<br/><br/>급여량<br/>소형견 1~2개<br/>중형견 2~3개<br/>급여량은 반려동물의 체중, 나이, 활동량 등에 따라 달라질 수 있습니다<br/><br/>주의사항<br/>1. 휴먼 그레이드 및 천연 원재료를 사용하여 기호성이 높아 과식할 우려가 있으니 주의가 필요합니다<br/>2. 습기가 많은 곳과 직사광선을 피해 건조하고 서늘한 장소에 보관합니다<br/>3. 개봉 후에는 최대한 빠른 시일 내에 급여하시기 바라며 한 달 이내에 급여를 권장합니다<br/><br/>유통기한<br/>포장에 별도 표기, 제조일은 유통기한으로부터 24개월 전<br/><br/>제조원 및 원산지<br/>벅시, 호주','2021-07-09 08:06:44',12,'호주'),('PRD0078','간식','캔','ANF','ANF 캔 95g x 24개 세트',27000,NULL,19,'anf_chicken_can_95g_x24.PNG','frd.jpg','제품명<br/>ANF캔 95g<br/>ANF 캔 95g<br/>ANF 치킨캔 95g<br/>ANF 치킨 캔 95g<br/><br/>주의사항<br/>1. 건조하고 서늘한 곳에 보관하세요<br/>2. 개봉 후 냉장보관하시고 빠른 시일내에 급여하여 주십시오<br/>3. 캔 절단부분이 날카로우므로 개봉, 보관 및 폐기시에는 절단면에 손이 닿지 않도록 주의하십시오<br/>4. 반추동물에게 급여하지 마십시오<br/><br/>유통기한<br/>용기에 별도 표기, 제조일은 유통기한으로부터 24개월 전<br/><br/>제조원 및 원산지<br/>Unicord Public, 태국','2021-07-09 08:13:18',7,'태국'),('PRD0081','리빙','하우스/방석','쥬쥬베','쥬쥬베 트라이앵글 하우스 스칸디나비아별 블루',35000,NULL,11,'jujube_tryAngle_house_blue.PNG','frd.jpg','제품명<br/>강아지 집<br/>강아지 하우스<br/>쥬쥬베 트라이앵글 하우스<br/><br/>규격<br/>가로 50cm<br/>세로 64cm<br/>높이 50cm<br/>측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>재질<br/>하우스 면원단, PE폼<br/>방석 극세사원단, 면원단, 버블구름솜<br/><br/>세탁 및 관리 방법<br/>1. 세탁은 손빨래 또는 드라이클리닝을 권장합니다<br/>2. 중성세제로 미지근한 물 또는 차가운 물에 손세탁하시기 바랍니다<br/>3. 세탁기 사용 시에는 울 코스로 약하게 세탁하시기 바랍니다<br/>4. 단독 세탁을 권장하며 통풍이 잘 되는 그늘진 곳에서 건조하시기 바랍니다<br/><br/>판매원 및 원산지<br/>위버스코리아 070-7720-0067, 한국','2021-07-09 08:34:13',12,'한국'),('PRD0082','리빙','하우스/방석','쥬쥬베','쥬쥬베 트라이앵글 하우스 스칸디나비아별 핑크',35000,NULL,21,'jujube_tryAngle_house_pink.PNG','frd.jpg','제품명<br/>강아지 집<br/>강아지 하우스<br/>쥬쥬베 트라이앵글 하우스<br/><br/>규격<br/>가로 50cm<br/>세로 64cm<br/>높이 50cm<br/>측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>재질<br/>하우스 면원단, PE폼<br/>방석 극세사원단, 면원단, 버블구름솜<br/><br/>세탁 및 관리 방법<br/>1. 세탁은 손빨래 또는 드라이클리닝을 권장합니다<br/>2. 중성세제로 미지근한 물 또는 차가운 물에 손세탁하시기 바랍니다<br/>3. 세탁기 사용 시에는 울 코스로 약하게 세탁하시기 바랍니다<br/>4. 단독 세탁을 권장하며 통풍이 잘 되는 그늘진 곳에서 건조하시기 바랍니다<br/><br/>판매원 및 원산지<br/>위버스코리아 070-7720-0067, 한국','2021-07-09 08:35:00',1,'한국'),('PRD0083','리빙','하우스/방석','쥬쥬베','쥬쥬베 트라이앵글 하우스 스칸디나비아별 화이트',35000,NULL,17,'jujube_tryAngle_house_white.PNG','frd.jpg','제품명<br/>강아지 집<br/>강아지 하우스<br/>쥬쥬베 트라이앵글 하우스<br/><br/>규격<br/>가로 50cm<br/>세로 64cm<br/>높이 50cm<br/>측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>재질<br/>하우스 면원단, PE폼<br/>방석 극세사원단, 면원단, 버블구름솜<br/><br/>세탁 및 관리 방법<br/>1. 세탁은 손빨래 또는 드라이클리닝을 권장합니다<br/>2. 중성세제로 미지근한 물 또는 차가운 물에 손세탁하시기 바랍니다<br/>3. 세탁기 사용 시에는 울 코스로 약하게 세탁하시기 바랍니다<br/>4. 단독 세탁을 권장하며 통풍이 잘 되는 그늘진 곳에서 건조하시기 바랍니다<br/><br/>판매원 및 원산지<br/>위버스코리아 070-7720-0067, 한국','2021-07-09 08:35:52',6,'한국'),('PRD0084','리빙','하우스/방석','쥬쥬베','쥬쥬베 트라이앵글 하우스 스트라이프 블루',35000,NULL,30,'jujube_tryAngle_house_stripe_blue.PNG','frd.jpg','제품명<br/>강아지 집<br/>강아지 하우스<br/>쥬쥬베 트라이앵글 하우스<br/><br/>규격<br/>가로 50cm<br/>세로 64cm<br/>높이 50cm<br/>측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>재질<br/>하우스 면원단, PE폼<br/>방석 극세사원단, 면원단, 버블구름솜<br/><br/>세탁 및 관리 방법<br/>1. 세탁은 손빨래 또는 드라이클리닝을 권장합니다<br/>2. 중성세제로 미지근한 물 또는 차가운 물에 손세탁하시기 바랍니다<br/>3. 세탁기 사용 시에는 울 코스로 약하게 세탁하시기 바랍니다<br/>4. 단독 세탁을 권장하며 통풍이 잘 되는 그늘진 곳에서 건조하시기 바랍니다<br/><br/>판매원 및 원산지<br/>위버스코리아 070-7720-0067, 한국','2021-07-09 08:37:06',8,'한국'),('PRD0085','리빙','하우스/방석','쥬쥬베','쥬쥬베 트라이앵글 하우스 스트라이프 핑크',35000,NULL,20,'jujube_tryAngle_house_stripe_pink.PNG','frd.jpg','제품명<br/>강아지 집<br/>강아지 하우스<br/>쥬쥬베 트라이앵글 하우스<br/><br/>규격<br/>가로 50cm<br/>세로 64cm<br/>높이 50cm<br/>측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>재질<br/>하우스 면원단, PE폼<br/>방석 극세사원단, 면원단, 버블구름솜<br/><br/>세탁 및 관리 방법<br/>1. 세탁은 손빨래 또는 드라이클리닝을 권장합니다<br/>2. 중성세제로 미지근한 물 또는 차가운 물에 손세탁하시기 바랍니다<br/>3. 세탁기 사용 시에는 울 코스로 약하게 세탁하시기 바랍니다<br/>4. 단독 세탁을 권장하며 통풍이 잘 되는 그늘진 곳에서 건조하시기 바랍니다<br/><br/>판매원 및 원산지<br/>위버스코리아 070-7720-0067, 한국','2021-07-09 08:37:59',78,'한국'),('PRD0086','리빙','하우스/방석','도그플렉스','도그플렉스 주사위하우스 파스텔민트',54000,NULL,20,'dogflex_joosawi_mint.PNG','frd.jpg','제품명<br/>도그플렉스 강아지집<br/>도그플렉스 강아지 하우스<br/>도그플렉스 주사위하우스<br/>도그플렉스 강아지집 주사위하우스<br/>도그플렉스 주사위 강아지하우스<br/><br/>소재<br/>플라스틱<br/><br/>구성<br/>하우스, 방석, 스티커<br/><br/>규격<br/>본체 49 x 49 x 49cm<br/>입구 지름 38cm<br/>방석 49 x 49cm<br/><br/>주의사항<br/>1. 강한 충격은 파손의 원인이 될 수 있으니 주의하시기 바랍니다<br/>2. 스티커를 부착할실 때 손으로 꾹 눌러 붙여주세요<br/>3. 직사광선에 오래 노출되면 접착력이 떨어질 수 있습니다<br/><br/>제조원 및 원산지<br/>도그플렉스, 한국','2021-07-09 08:39:14',45,'한국'),('PRD0087','리빙','하우스/방석','도그플렉스','도그플렉스 주사위하우스 초콜렛브라운',54000,NULL,15,'dogflex_joosawi_brown.PNG','frd.jpg','제품명<br/>도그플렉스 강아지집<br/>도그플렉스 강아지 하우스<br/>도그플렉스 주사위하우스<br/>도그플렉스 강아지집 주사위하우스<br/>도그플렉스 주사위 강아지하우스<br/><br/>소재<br/>플라스틱<br/><br/>구성<br/>하우스, 방석, 스티커<br/><br/>규격<br/>본체 49 x 49 x 49cm<br/>입구 지름 38cm<br/>방석 49 x 49cm<br/><br/>주의사항<br/>1. 강한 충격은 파손의 원인이 될 수 있으니 주의하시기 바랍니다<br/>2. 스티커를 부착할실 때 손으로 꾹 눌러 붙여주세요<br/>3. 직사광선에 오래 노출되면 접착력이 떨어질 수 있습니다<br/><br/>제조원 및 원산지<br/>도그플렉스, 한국','2021-07-09 08:40:19',12,'한국'),('PRD0088','리빙','하우스/방석','도그플렉스','도그플렉스 주사위하우스 라떼아이보리',54000,NULL,30,'dogflex_joosawi_ivory.PNG','frd.jpg','제품명<br/>도그플렉스 강아지집<br/>도그플렉스 강아지 하우스<br/>도그플렉스 주사위하우스<br/>도그플렉스 강아지집 주사위하우스<br/>도그플렉스 주사위 강아지하우스<br/><br/>소재<br/>플라스틱<br/><br/>구성<br/>하우스, 방석, 스티커<br/><br/>규격<br/>본체 49 x 49 x 49cm<br/>입구 지름 38cm<br/>방석 49 x 49cm<br/><br/>주의사항<br/>1. 강한 충격은 파손의 원인이 될 수 있으니 주의하시기 바랍니다<br/>2. 스티커를 부착할실 때 손으로 꾹 눌러 붙여주세요<br/>3. 직사광선에 오래 노출되면 접착력이 떨어질 수 있습니다<br/><br/>제조원 및 원산지<br/>도그플렉스, 한국','2021-07-09 08:41:16',63,'한국'),('PRD0089','리빙','하우스/방석','도그플렉스','도그플렉스 주사위하우스 코랄핑크',54000,NULL,20,'dogflex_joosawi_pink.PNG','frd.jpg','제품명<br/>도그플렉스 강아지집<br/>도그플렉스 강아지 하우스<br/>도그플렉스 주사위하우스<br/>도그플렉스 강아지집 주사위하우스<br/>도그플렉스 주사위 강아지하우스<br/><br/>소재<br/>플라스틱<br/><br/>구성<br/>하우스, 방석, 스티커<br/><br/>규격<br/>본체 49 x 49 x 49cm<br/>입구 지름 38cm<br/>방석 49 x 49cm<br/><br/>주의사항<br/>1. 강한 충격은 파손의 원인이 될 수 있으니 주의하시기 바랍니다<br/>2. 스티커를 부착할실 때 손으로 꾹 눌러 붙여주세요<br/>3. 직사광선에 오래 노출되면 접착력이 떨어질 수 있습니다<br/><br/>제조원 및 원산지<br/>도그플렉스, 한국','2021-07-09 08:42:08',1,'한국'),('PRD0090','리빙','하우스/방석','캐티맨','캐티맨 숨숨집 레드',16000,NULL,17,'cattyman_red.PNG','frd.jpg','제품명<br/>캐티맨 숨숨집<br/>캐티맨 울펠트 숨숨집 레드<br/><br/>재질<br/>양모펠트<br/><br/>규격<br/>지름 42cm, 높이 20cm, 입구 지름 17cm<br/>측정하는 위치에 따라 길이 차이가 있을 수 있습니다<br/><br/>주의사항<br/>1. 용도 대상을 지켜서 사용합니다<br/>2. 유아의 손이 닿는 곳에 보관하면 안 됩니다<br/>3. 화기 근처를 피해서 보관하시기 바랍니다<br/><br/>제조원 및 원산지<br/>도기맨, 네팔','2021-07-09 08:43:31',1,'네팔'),('PRD0091','리빙','하우스/방석','캐티맨','캐티맨 숨숨집 블루',16000,NULL,16,'cattyman_blue.PNG','frd.jpg','제품명<br/>캐티맨 숨숨집<br/>캐티맨 울펠트 숨숨집 블루<br/><br/>재질<br/>양모펠트<br/><br/>규격<br/>지름 42cm, 높이 20cm, 입구 지름 17cm<br/>측정하는 위치에 따라 길이 차이가 있을 수 있습니다<br/><br/>주의사항<br/>1. 용도 대상을 지켜서 사용합니다<br/>2. 유아의 손이 닿는 곳에 보관하면 안 됩니다<br/>3. 화기 근처를 피해서 보관하시기 바랍니다<br/><br/>제조원 및 원산지<br/>도기맨, 네팔','2021-07-09 08:44:39',98,'네팔'),('PRD0092','리빙','하우스/방석','캐티맨','캐티맨 숨숨집 옐로우',16000,NULL,11,'cattyman_yellow.PNG','frd.jpg','제품명<br/>캐티맨 숨숨집<br/>캐티맨 울펠트 숨숨집 옐로우<br/><br/>재질<br/>양모펠트<br/><br/>규격<br/>지름 42cm, 높이 20cm, 입구 지름 17cm<br/>측정하는 위치에 따라 길이 차이가 있을 수 있습니다<br/><br/>주의사항<br/>1. 용도 대상을 지켜서 사용합니다<br/>2. 유아의 손이 닿는 곳에 보관하면 안 됩니다<br/>3. 화기 근처를 피해서 보관하시기 바랍니다<br/><br/>제조원 및 원산지<br/>도기맨, 네팔','2021-07-09 08:45:45',7,'네팔'),('PRD0096','리빙','울타리/안전문','우리아지','우리아지 더올림 강아지울타리 라이트그레이 12단',13200,NULL,15,'wooriarji_12dan.PNG','frd.jpg','제품명<br/>우리아지 더올림 애견울타리 라이트그레이<br/><br/>규격<br/>가로 37.5cm<br/>세로 34cm<br/>두께 1cm<br/>측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>구성<br/>12피스<br/><br/>재질<br/>PP 폴리프로필렌<br/><br/>무게<br/>1피스 당 210g<br/><br/>주의사항<br/>1. 강한 충격에 의한 파손을 주의하세요<br/>2. 화기류 근처에 두면 화재의 위험이 있습니다<br/>3. 신체 일부 끼임에 주의하세요<br/><br/>제조원 및 원산지<br/>피앤피산업, 한국','2021-07-09 08:57:20',45,'한국'),('PRD0097','리빙','울타리/안전문','푸르미','푸르미 매직울타리 소형 브라운 24단',32400,NULL,20,'poormi_magicUltari_brown.PNG','frd.jpg','☞ 제품규격<br/>가로 35cm, 세로 37cm인 블럭 24개로 구성되어 있습니다.<br/><br/>☞ 원산지<br/>한국','2021-07-09 08:58:20',12,'한국'),('PRD0098','리빙','계단','쥬쥬베','쥬쥬베 3단 스텝 스칸디나비아별 블루',38000,NULL,17,'jujube_3step_blue.PNG','frd.jpg','제품명<br/>강아지 계단<br/>강아지 스텝<br/>쥬쥬베 3단 스텝<br/><br/>규격<br/>가로 38cm<br/>세로 58cm<br/>높이 39cm<br/>측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>재질<br/>면원단, PE폼<br/><br/>세탁 및 관리 방법<br/>1. 세탁은 손빨래 또는 드라이클리닝을 권장합니다<br/>2. 중성세제로 미지근한 물 또는 차가운 물에 손세탁하시기 바랍니다<br/>3. 세탁기 사용 시에는 울 코스로 약하게 세탁하시기 바랍니다<br/>4. 단독 세탁을 권장하며 통풍이 잘 되는 그늘진 곳에서 건조하시기 바랍니다<br/><br/>판매원 및 원산지<br/>위버스코리아 070-7720-0067, 한국','2021-07-09 09:13:11',6,'한국'),('PRD0099','리빙','계단','쥬쥬베','쥬쥬베 3단 스텝 스칸디나비아별 핑크',38000,NULL,20,'jujube_3step_pink.PNG','frd.jpg','제품명<br/>강아지 계단<br/>강아지 스텝<br/>쥬쥬베 3단 스텝<br/><br/>규격<br/>가로 38cm<br/>세로 58cm<br/>높이 39cm<br/>측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>재질<br/>면원단, PE폼<br/><br/>세탁 및 관리 방법<br/>1. 세탁은 손빨래 또는 드라이클리닝을 권장합니다<br/>2. 중성세제로 미지근한 물 또는 차가운 물에 손세탁하시기 바랍니다<br/>3. 세탁기 사용 시에는 울 코스로 약하게 세탁하시기 바랍니다<br/>4. 단독 세탁을 권장하며 통풍이 잘 되는 그늘진 곳에서 건조하시기 바랍니다<br/><br/>판매원 및 원산지<br/>위버스코리아 070-7720-0067, 한국','2021-07-09 09:13:53',5,'한국'),('PRD0100','케어','배변','우리아지','우리아지 더올림 초대형 레몬향 패드 20매 (77 x 60cm)',8200,NULL,50,'wooriarji_pad_x20.PNG','frd.jpg','제품명<br/>우리아지 더올림 패드<br/>우리아지 더올림 초대형 패드<br/>우리아지 더올림 애견 배변패드<br/>우리아지 더올림 강아지 배변패드<br/>우리아지 더올림 반려동물 배변패드<br/><br/>용도<br/>1. 반려동물을 위한 화장실 패드<br/>2. 반려동물의 배변 훈련용 패드<br/>3. 외출시 휴대용 패드<br/>4. 분만, 수술시 바닥 흡수지로 사용<br/><br/>규격<br/>77 x 60cm<br/>장당 무게 75g<br/><br/>재료<br/>표면 부직포<br/>흡수층 분쇄펄프, 고흡수성수지<br/>방수막 폴리에틸렌필름<br/><br/>포장단위<br/>20매<br/><br/>사용시 주의사항<br/>1. 반려동물 외에는 사용하지 마시기 바랍니다<br/>2. 장시간 방치시 악취의 우려가 있으니 적절한 시기에 교체 바랍니다<br/>3. 반려동물이 찢거나 삼키지 않도록 주의하시기 바랍니다<br/>4. 화기를 피하고 습기가 없는 곳에 보관 바랍니다<br/>5. 수세식 변기에 버릴시 막힐 염려가 있으니 휴지통에 개별적으로 버리시기 바랍니다<br/><br/>제조사 및 원산지<br/>피앤피산업, 한국','2021-07-09 09:25:46',21,'한국'),('PRD0101','케어','배변','우리아지','우리아지 더올림 초대형 레몬향 패드 20매 x 2개 세트',15000,NULL,50,'wooriarji_pad_x40.PNG','frd.jpg','제품명<br/>우리아지 더올림 패드<br/>우리아지 더올림 초대형 패드<br/>우리아지 더올림 애견 배변패드<br/>우리아지 더올림 강아지 배변패드<br/>우리아지 더올림 반려동물 배변패드<br/><br/>용도<br/>1. 반려동물을 위한 화장실 패드<br/>2. 반려동물의 배변 훈련용 패드<br/>3. 외출시 휴대용 패드<br/>4. 분만, 수술시 바닥 흡수지로 사용<br/><br/>규격<br/>77 x 60cm<br/>장당 무게 75g<br/><br/>재료<br/>표면 부직포<br/>흡수층 분쇄펄프, 고흡수성수지<br/>방수막 폴리에틸렌필름<br/><br/>포장단위<br/>20매<br/><br/>사용시 주의사항<br/>1. 반려동물 외에는 사용하지 마시기 바랍니다<br/>2. 장시간 방치시 악취의 우려가 있으니 적절한 시기에 교체 바랍니다<br/>3. 반려동물이 찢거나 삼키지 않도록 주의하시기 바랍니다<br/>4. 화기를 피하고 습기가 없는 곳에 보관 바랍니다<br/>5. 수세식 변기에 버릴시 막힐 염려가 있으니 휴지통에 개별적으로 버리시기 바랍니다<br/><br/>제조사 및 원산지<br/>피앤피산업, 한국','2021-07-09 09:26:27',12,'한국'),('PRD0102','케어','배변','우리아지','우리아지 더올림 초대형 레몬향 패드 20매 x 4개 세트',28000,NULL,50,'wooriarji_pad_x80.PNG','frd.jpg','제품명<br/>우리아지 더올림 패드<br/>우리아지 더올림 초대형 패드<br/>우리아지 더올림 애견 배변패드<br/>우리아지 더올림 강아지 배변패드<br/>우리아지 더올림 반려동물 배변패드<br/><br/>용도<br/>1. 반려동물을 위한 화장실 패드<br/>2. 반려동물의 배변 훈련용 패드<br/>3. 외출시 휴대용 패드<br/>4. 분만, 수술시 바닥 흡수지로 사용<br/><br/>규격<br/>77 x 60cm<br/>장당 무게 75g<br/><br/>재료<br/>표면 부직포<br/>흡수층 분쇄펄프, 고흡수성수지<br/>방수막 폴리에틸렌필름<br/><br/>포장단위<br/>20매<br/><br/>사용시 주의사항<br/>1. 반려동물 외에는 사용하지 마시기 바랍니다<br/>2. 장시간 방치시 악취의 우려가 있으니 적절한 시기에 교체 바랍니다<br/>3. 반려동물이 찢거나 삼키지 않도록 주의하시기 바랍니다<br/>4. 화기를 피하고 습기가 없는 곳에 보관 바랍니다<br/>5. 수세식 변기에 버릴시 막힐 염려가 있으니 휴지통에 개별적으로 버리시기 바랍니다<br/><br/>제조사 및 원산지<br/>피앤피산업, 한국','2021-07-09 09:27:20',1,'한국'),('PRD0103','케어','배변','우리아지','우리아지 더올림 초대형 레몬향 패드 20매 x 6개 세트',39000,NULL,50,'wooriarji_pad_x120.PNG','frd.jpg','제품명<br/>우리아지 더올림 패드<br/>우리아지 더올림 초대형 패드<br/>우리아지 더올림 애견 배변패드<br/>우리아지 더올림 강아지 배변패드<br/>우리아지 더올림 반려동물 배변패드<br/><br/>용도<br/>1. 반려동물을 위한 화장실 패드<br/>2. 반려동물의 배변 훈련용 패드<br/>3. 외출시 휴대용 패드<br/>4. 분만, 수술시 바닥 흡수지로 사용<br/><br/>규격<br/>77 x 60cm<br/>장당 무게 75g<br/><br/>재료<br/>표면 부직포<br/>흡수층 분쇄펄프, 고흡수성수지<br/>방수막 폴리에틸렌필름<br/><br/>포장단위<br/>20매<br/><br/>사용시 주의사항<br/>1. 반려동물 외에는 사용하지 마시기 바랍니다<br/>2. 장시간 방치시 악취의 우려가 있으니 적절한 시기에 교체 바랍니다<br/>3. 반려동물이 찢거나 삼키지 않도록 주의하시기 바랍니다<br/>4. 화기를 피하고 습기가 없는 곳에 보관 바랍니다<br/>5. 수세식 변기에 버릴시 막힐 염려가 있으니 휴지통에 개별적으로 버리시기 바랍니다<br/><br/>제조사 및 원산지<br/>피앤피산업, 한국','2021-07-09 09:28:11',4,'한국'),('PRD0104','케어','배변','우리아지','우리아지 더올림 프리미엄 레몬향 패드 50매 (50 x 40cm)',8400,NULL,50,'wooriarji_primeum_x50.PNG','frd.jpg','제품명<br/>우리아지 더올림 패드<br/>우리아지 더올림 프리미엄 패드<br/>우리아지 더올림 애견 배변패드<br/>우리아지 더올림 강아지 배변패드<br/>우리아지 더올림 반려동물 배변패드<br/><br/>용도<br/>1. 반려동물을 위한 화장실 패드<br/>2. 반려동물의 배변 훈련용 패드<br/>3. 외출시 휴대용 패드<br/>4. 분만, 수술시 바닥 흡수지로 사용<br/><br/>규격<br/>40 x 50cm<br/>장당 무게 35g<br/><br/>재료<br/>표면 부직포<br/>흡수층 분쇄펄프, 고흡수성수지<br/>방수막 폴리에틸렌필름<br/><br/>포장단위<br/>50매<br/><br/>사용시 주의사항<br/>1. 반려동물 외에는 사용하지 마시기 바랍니다<br/>2. 장시간 방치시 악취의 우려가 있으니 적절한 시기에 교체 바랍니다<br/>3. 반려동물이 찢거나 삼키지 않도록 주의하시기 바랍니다<br/>4. 화기를 피하고 습기가 없는 곳에 보관 바랍니다<br/>5. 수세식 변기에 버릴시 막힐 염려가 있으니 휴지통에 개별적으로 버리시기 바랍니다<br/><br/>제조사 및 원산지<br/>피앤피산업, 한국','2021-07-09 09:29:25',22,'한국'),('PRD0105','케어','배변','우리아지','우리아지 더올림 프리미엄 레몬향 패드 50매 x 2개 세트',16320,NULL,50,'wooriarji_primeum_x100.PNG','frd.jpg','제품명<br/>우리아지 더올림 패드<br/>우리아지 더올림 프리미엄 패드<br/>우리아지 더올림 애견 배변패드<br/>우리아지 더올림 강아지 배변패드<br/>우리아지 더올림 반려동물 배변패드<br/><br/>용도<br/>1. 반려동물을 위한 화장실 패드<br/>2. 반려동물의 배변 훈련용 패드<br/>3. 외출시 휴대용 패드<br/>4. 분만, 수술시 바닥 흡수지로 사용<br/><br/>규격<br/>40 x 50cm<br/>장당 무게 35g<br/><br/>재료<br/>표면 부직포<br/>흡수층 분쇄펄프, 고흡수성수지<br/>방수막 폴리에틸렌필름<br/><br/>포장단위<br/>50매<br/><br/>사용시 주의사항<br/>1. 반려동물 외에는 사용하지 마시기 바랍니다<br/>2. 장시간 방치시 악취의 우려가 있으니 적절한 시기에 교체 바랍니다<br/>3. 반려동물이 찢거나 삼키지 않도록 주의하시기 바랍니다<br/>4. 화기를 피하고 습기가 없는 곳에 보관 바랍니다<br/>5. 수세식 변기에 버릴시 막힐 염려가 있으니 휴지통에 개별적으로 버리시기 바랍니다<br/><br/>제조사 및 원산지<br/>피앤피산업, 한국','2021-07-09 09:30:30',42,'한국'),('PRD0106','케어','배변','우리아지','우리아지 더올림 프리미엄 레몬향 패드 50매 x 4개 세트',30720,NULL,50,'wooriarji_primeum_x200.PNG','frd.jpg','제품명<br/>우리아지 더올림 패드<br/>우리아지 더올림 프리미엄 패드<br/>우리아지 더올림 애견 배변패드<br/>우리아지 더올림 강아지 배변패드<br/>우리아지 더올림 반려동물 배변패드<br/><br/>용도<br/>1. 반려동물을 위한 화장실 패드<br/>2. 반려동물의 배변 훈련용 패드<br/>3. 외출시 휴대용 패드<br/>4. 분만, 수술시 바닥 흡수지로 사용<br/><br/>규격<br/>40 x 50cm<br/>장당 무게 35g<br/><br/>재료<br/>표면 부직포<br/>흡수층 분쇄펄프, 고흡수성수지<br/>방수막 폴리에틸렌필름<br/><br/>포장단위<br/>50매<br/><br/>사용시 주의사항<br/>1. 반려동물 외에는 사용하지 마시기 바랍니다<br/>2. 장시간 방치시 악취의 우려가 있으니 적절한 시기에 교체 바랍니다<br/>3. 반려동물이 찢거나 삼키지 않도록 주의하시기 바랍니다<br/>4. 화기를 피하고 습기가 없는 곳에 보관 바랍니다<br/>5. 수세식 변기에 버릴시 막힐 염려가 있으니 휴지통에 개별적으로 버리시기 바랍니다<br/><br/>제조사 및 원산지<br/>피앤피산업, 한국','2021-07-09 09:31:13',3,'한국'),('PRD0107','케어','배변','우리아지','우리아지 더올림 프리미엄 레몬향 패드 50매 x 6개 세트',43200,NULL,50,'wooriarji_primeum_x300.PNG','frd.jpg','제품명<br/>우리아지 더올림 패드<br/>우리아지 더올림 프리미엄 패드<br/>우리아지 더올림 애견 배변패드<br/>우리아지 더올림 강아지 배변패드<br/>우리아지 더올림 반려동물 배변패드<br/><br/>용도<br/>1. 반려동물을 위한 화장실 패드<br/>2. 반려동물의 배변 훈련용 패드<br/>3. 외출시 휴대용 패드<br/>4. 분만, 수술시 바닥 흡수지로 사용<br/><br/>규격<br/>40 x 50cm<br/>장당 무게 35g<br/><br/>재료<br/>표면 부직포<br/>흡수층 분쇄펄프, 고흡수성수지<br/>방수막 폴리에틸렌필름<br/><br/>포장단위<br/>50매<br/><br/>사용시 주의사항<br/>1. 반려동물 외에는 사용하지 마시기 바랍니다<br/>2. 장시간 방치시 악취의 우려가 있으니 적절한 시기에 교체 바랍니다<br/>3. 반려동물이 찢거나 삼키지 않도록 주의하시기 바랍니다<br/>4. 화기를 피하고 습기가 없는 곳에 보관 바랍니다<br/>5. 수세식 변기에 버릴시 막힐 염려가 있으니 휴지통에 개별적으로 버리시기 바랍니다<br/><br/>제조사 및 원산지<br/>피앤피산업, 한국','2021-07-09 09:31:56',33,'한국'),('PRD0108','케어','배변','초심','초심 패드 100매 (40 x 50cm, 대용량 절약형 패드)',8000,NULL,50,'chosim_pad_x100.PNG','frd.jpg','제품명<br/>초심 애견 패드<br/>초심 반려견 패드<br/>초심 강아지 배변패드<br/><br/>성분<br/>안감: 부직포<br/>흡수층: 분쇄펄트, 고흡수성수지(SAP)<br/>방수막: 폴리에틸렌필름<br/><br/>포장단위<br/>100매<br/><br/>규격<br/>(가로)43 x (세로)53cm<br/>장당 무게 20g<br/><br/>사용상 주의사항<br/>1. 반려동물용 이외의 다른 용도로 사용하지 마십시오<br/>2. 이 패드는 일회용패드이며, 적절한 시기에 바로 교체해주세요<br/>3. 배변패드 사용후 변기에 버리면 변기가 막힐수 있으니 휴지통에 버려주세요<br/>4. 천연펄프로 만들어졌습니다.벌레가 파먹지 않도록 건조한 곳에 보관해주세요<br/>5. 배변패드 포장지는 얆기 때문에 칼과 가우이를 사용하지 마세요<br/><br/>제조,수입판매원 및 원산지<br/>wopwahan laoban co,.ltd<br/>(주)이수 / 중국','2021-07-09 09:32:45',5,'중국'),('PRD0109','케어','배변','초심','초심 패드 100매 x 2개 세트',15400,NULL,50,'chosim_pad_x200.PNG','frd.jpg','제품명<br/>초심 애견 패드<br/>초심 반려견 패드<br/>초심 강아지 배변패드<br/><br/>성분<br/>안감: 부직포<br/>흡수층: 분쇄펄트, 고흡수성수지(SAP)<br/>방수막: 폴리에틸렌필름<br/><br/>포장단위<br/>100매<br/><br/>규격<br/>(가로)43 x (세로)53cm<br/>장당 무게 20g<br/><br/>사용상 주의사항<br/>1. 반려동물용 이외의 다른 용도로 사용하지 마십시오<br/>2. 이 패드는 일회용패드이며, 적절한 시기에 바로 교체해주세요<br/>3. 배변패드 사용후 변기에 버리면 변기가 막힐수 있으니 휴지통에 버려주세요<br/>4. 천연펄프로 만들어졌습니다.벌레가 파먹지 않도록 건조한 곳에 보관해주세요<br/>5. 배변패드 포장지는 얆기 때문에 칼과 가우이를 사용하지 마세요<br/><br/>제조,수입판매원 및 원산지<br/>wopwahan laoban co,.ltd<br/>(주)이수 / 중국','2021-07-09 09:33:26',51,'중국'),('PRD0110','케어','배변','초심','초심 패드 100매 x 4개 세트',28600,NULL,50,'chosim_pad_x400.PNG','frd.jpg','제품명<br/>초심 애견 패드<br/>초심 반려견 패드<br/>초심 강아지 배변패드<br/><br/>성분<br/>안감: 부직포<br/>흡수층: 분쇄펄트, 고흡수성수지(SAP)<br/>방수막: 폴리에틸렌필름<br/><br/>포장단위<br/>100매<br/><br/>규격<br/>(가로)43 x (세로)53cm<br/>장당 무게 20g<br/><br/>사용상 주의사항<br/>1. 반려동물용 이외의 다른 용도로 사용하지 마십시오<br/>2. 이 패드는 일회용패드이며, 적절한 시기에 바로 교체해주세요<br/>3. 배변패드 사용후 변기에 버리면 변기가 막힐수 있으니 휴지통에 버려주세요<br/>4. 천연펄프로 만들어졌습니다.벌레가 파먹지 않도록 건조한 곳에 보관해주세요<br/>5. 배변패드 포장지는 얆기 때문에 칼과 가우이를 사용하지 마세요<br/><br/>제조,수입판매원 및 원산지<br/>wopwahan laoban co,.ltd<br/>(주)이수 / 중국','2021-07-09 09:34:21',23,'중국'),('PRD0111','케어','영양제','인트라젠','인트라젠 플러스 영양제 파우더 30개입',7200,NULL,30,'intragen_plus_pouder_x30.PNG','frd.jpg','제품명<br/>인트라젠 플러스<br/>인트라젠 영양제<br/><br/>원료<br/>락토바실러스, 바실러스균, 효모, 비타민C, 비타민E, 칼슘, 각종비타민, 필수아미노산, 유익효소, 포도당<br/><br/>등록성분<br/>로도박터 캡슐레이타<br/><br/>용량<br/>30개입, 2g<br/><br/>급여방법<br/>1. 사료나 간식 등에 혼합하여 급여하되 손으로 직접 급여하셔도 됩니다<br/>2. 반려동물의 종류, 건강상태, 연령, 체중, 급여주기, 생활환경 등에 따라서 적절하게 급여량을 조절할 수 있으며 질병 등의 경우 병원치료와 병행하여 급여할 수 있습니다<br/>3. 설사의 경우 1일 급여량을 2~3배 증량하되 하루 2~3회 나누어서 급여하시기 바랍니다<br/><br/>유의사항<br/>1. 반려동물의 설사는 다양한 원인이 있을 수 있습니다<br/>2. 일시적이거나 가벼운 설사는 1~3일 이상, 만성적이거나 심한 설사는 7~30일 이상 꾸준히 급여 바랍니다<br/>3. 급여 초기에 변이 다소 물러진다면 일시적으로 제한급식을 하면서 최소 7~15일 이상 꾸준히 급여 바랍니다<br/>4. 급여 도중에 동물의 배변활동이 다소 지체된다면 일시적으로 제한급식을 하면서 적당량의 수분을 섭취시키기 바랍니다<br/>5. 변비나 숙변의 해소를 위한 경우에는 수분을 충분히 섭취시키면서 급여하시기 바랍니다<br/>6. 피부 건강, 털빠짐 감소, 피모의 윤택성 증대를 위한 경우에는 최소 15~30일 이상 꾸준히 급여하시기 바랍니다<br/><br/>제조일자<br/>포장에 별도 표기, 유통기한은 제조일로부터 24개월<br/><br/>제조원 및 원산지<br/>알켐바이오 033-763-2196, 한국','2021-07-09 09:37:49',11,'한국'),('PRD0112','케어','영양제','인트라젠','인트라젠 영양제 타블렛 200정',7200,NULL,50,'intragen_tablet_x200.PNG','frd.jpg','제품명<br/>인트라젠 정<br/>인트라젠 영양제<br/><br/>원료<br/>락토바실러스, 바실러스균, 효모, 비타민C, 비타민E, 마그네슘, 칼슘, 각종비타민, 필수아미노산, 유익효소, 포도당<br/><br/>등록성분<br/>로도박터 캡슐레이타<br/><br/>용량<br/>200정, 60g<br/><br/>급여방법<br/>1. 사료나 간식 등에 혼합하여 급여하되 손으로 직접 급여하셔도 됩니다<br/>2. 반려동물의 종류, 건강상태, 연령, 체중, 급여주기, 생활환경 등에 따라서 적절하게 급여량을 조절할 수 있으며 질병 등의 경우 병원치료와 병행하여 급여할 수 있습니다<br/>3. 설사의 경우 1일 급여량을 2~3배 증량하되 하루 2~3회 나누어서 급여하시기 바랍니다<br/><br/>유의사항<br/>1. 반려동물의 설사는 다양한 원인이 있을 수 있습니다<br/>2. 일시적이거나 가벼운 설사는 1~3일 이상, 만성적이거나 심한 설사는 7~30일 이상 꾸준히 급여 바랍니다<br/>3. 급여 초기에 변이 다소 물러진다면 일시적으로 제한급식을 하면서 최소 7~15일 이상 꾸준히 급여 바랍니다<br/>4. 급여 도중에 동물의 배변활동이 다소 지체된다면 일시적으로 제한급식을 하면서 적당량의 수분을 섭취시키기 바랍니다<br/>5. 변비나 숙변의 해소를 위한 경우에는 수분을 충분히 섭취시키면서 급여하시기 바랍니다<br/>6. 피부 건강, 털빠짐 감소, 피모의 윤택성 증대를 위한 경우에는 최소 15~30일 이상 꾸준히 급여하시기 바랍니다<br/><br/>제조일자<br/>포장에 별도 표기, 유통기한은 제조일로부터 24개월<br/><br/>제조원 및 원산지<br/>알켐바이오 033-763-2196, 한국','2021-07-09 09:38:47',13,'한국'),('PRD0113','케어','영양제','빅스비','빅스비 버섯영양제 이뮤니티 체력증진 면역력 파우더 60g',43000,NULL,50,'bixbi_pouder_60g.PNG','frd.jpg','제품명<br/>빅스비 이뮤니티<br/>빅스비 버섯영양제 이뮤니티<br/><br/>성분구성<br/>조단백질 7.68%이상, 수분 7.68%이하, 조섬유 1.74%이하, 조회분 6.19%이하<br/><br/>사용원료<br/>구름버섯, 신령버섯, 영지버섯, 표고버섯, 잎새버섯, 동충하초, 아위버섯, 노루궁뎅이버섯<br/><br/>용량<br/>파우더 60g<br/><br/>유통기한<br/>별도 표기<br/><br/>제조년원일<br/>유통기한으로 부터 36개월 전 제조<br/><br/>원산지<br/>BIXBIPET / 미국산<br/><br/>주의사항<br/>1) 위 사용 용도 외 사용하지 마십시오.<br/>2) 본 제품은 진단, 치료 등의 목적으로 생산된 의약품이 아닙니다.<br/>3) 질병이 있거나 특이알러지가 잇는 경우 급여전 수의사 상담을 권장합니다.','2021-07-09 09:39:36',15,'미국'),('PRD0116','외출','이동 가방','쏘아베','쏘아베 캡슐가방 실버',18900,NULL,50,'ssoabe_capsul_silver.PNG','frd.jpg','제품명<br/>쏘아베 캡슐가방<br/>쏘아베 강아지 캡슐가방<br/>쏘아베 애견 캡슐가방<br/>쏘아베 고양이 캡슐가방<br/>쏘아베 강아지 우주선가방<br/>쏘아베 애견 우주선가방<br/>쏘아베 고양이 우주선가방<br/><br/>소재<br/>ABS, PC, 폴리에스테르, PP<br/><br/>규격<br/>가로 32cm<br/>세로 29cm<br/>높이 42cm<br/>바닥을 기준으로 측정하였으며 측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>중량<br/>1.3kg 정도<br/><br/>주의사항<br/>1. 반려동물 이외 사용하지 마십시오<br/>2. 화기 근처에 두지 마십시오<br/>3. 충격으로 인한 파손이 있을 수 있으니 주의 하십시오<br/>4. 체중 5kg 미만 반려동물의 탑승을 권장합니다<br/>5. 체중 5kg 미만이어도 견종, 묘종에 따라 체형이 다르기에 규격을 확인하시기 바랍니다<br/>6. 보호필름을 제거하였거나 사용흔적이 있는 경우 반품 및 교환은 불가합니다<br/>7. 보호필름 제거시 부주의로 발생하는 스크레치는 반품사유가 될 수 없습니다<br/><br/>판매원 및 원산지<br/>펫앤드림 031-791-5569, 중국','2021-07-09 09:45:40',1,'중국'),('PRD0117','외출','이동 가방','쏘아베','쏘아베 캡슐가방 핑크',18900,NULL,50,'ssoabe_capsul_pink.PNG','frd.jpg','제품명<br/>쏘아베 캡슐가방<br/>쏘아베 강아지 캡슐가방<br/>쏘아베 애견 캡슐가방<br/>쏘아베 고양이 캡슐가방<br/>쏘아베 강아지 우주선가방<br/>쏘아베 애견 우주선가방<br/>쏘아베 고양이 우주선가방<br/><br/>소재<br/>ABS, PC, 폴리에스테르, PP<br/><br/>규격<br/>가로 32cm<br/>세로 29cm<br/>높이 42cm<br/>바닥을 기준으로 측정하였으며 측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>중량<br/>1.3kg 정도<br/><br/>주의사항<br/>1. 반려동물 이외 사용하지 마십시오<br/>2. 화기 근처에 두지 마십시오<br/>3. 충격으로 인한 파손이 있을 수 있으니 주의 하십시오<br/>4. 체중 5kg 미만 반려동물의 탑승을 권장합니다<br/>5. 체중 5kg 미만이어도 견종, 묘종에 따라 체형이 다르기에 규격을 확인하시기 바랍니다<br/>6. 보호필름을 제거하였거나 사용흔적이 있는 경우 반품 및 교환은 불가합니다<br/>7. 보호필름 제거시 부주의로 발생하는 스크레치는 반품사유가 될 수 없습니다<br/><br/>판매원 및 원산지<br/>펫앤드림 031-791-5569, 중국','2021-07-09 09:46:23',5,'중국'),('PRD0118','외출','이동 가방','쏘아베','쏘아베 캡슐가방 블루',18900,NULL,50,'ssoabe_capsul_blue.PNG','frd.jpg','제품명<br/>쏘아베 캡슐가방<br/>쏘아베 강아지 캡슐가방<br/>쏘아베 애견 캡슐가방<br/>쏘아베 고양이 캡슐가방<br/>쏘아베 강아지 우주선가방<br/>쏘아베 애견 우주선가방<br/>쏘아베 고양이 우주선가방<br/><br/>소재<br/>ABS, PC, 폴리에스테르, PP<br/><br/>규격<br/>가로 32cm<br/>세로 29cm<br/>높이 42cm<br/>바닥을 기준으로 측정하였으며 측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>중량<br/>1.3kg 정도<br/><br/>주의사항<br/>1. 반려동물 이외 사용하지 마십시오<br/>2. 화기 근처에 두지 마십시오<br/>3. 충격으로 인한 파손이 있을 수 있으니 주의 하십시오<br/>4. 체중 5kg 미만 반려동물의 탑승을 권장합니다<br/>5. 체중 5kg 미만이어도 견종, 묘종에 따라 체형이 다르기에 규격을 확인하시기 바랍니다<br/>6. 보호필름을 제거하였거나 사용흔적이 있는 경우 반품 및 교환은 불가합니다<br/>7. 보호필름 제거시 부주의로 발생하는 스크레치는 반품사유가 될 수 없습니다<br/><br/>판매원 및 원산지<br/>펫앤드림 031-791-5569, 중국','2021-07-09 09:47:01',6,'중국'),('PRD0119','외출','이동 가방','쏘아베','쏘아베 캡슐가방 냥이',18900,NULL,50,'ssoabe_capsul_cat.PNG','frd.jpg','제품명<br/>쏘아베 캡슐가방<br/>쏘아베 강아지 캡슐가방<br/>쏘아베 애견 캡슐가방<br/>쏘아베 고양이 캡슐가방<br/>쏘아베 강아지 우주선가방<br/>쏘아베 애견 우주선가방<br/>쏘아베 고양이 우주선가방<br/><br/>소재<br/>옥스퍼드, ABS, PC, 폴리에스테르, PP<br/><br/>규격<br/>가로 32cm<br/>세로 34cm<br/>높이 42cm<br/>바닥을 기준으로 측정하였으며 측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>중량<br/>1.3kg 정도<br/><br/>주의사항<br/>1. 반려동물 이외 사용하지 마십시오<br/>2. 화기 근처에 두지 마십시오<br/>3. 충격으로 인한 파손이 있을 수 있으니 주의 하십시오<br/>4. 체중 5kg 미만 반려동물의 탑승을 권장합니다<br/>5. 체중 5kg 미만이어도 견종, 묘종에 따라 체형이 다르기에 규격을 확인하시기 바랍니다<br/>6. 보호필름을 제거하였거나 사용흔적이 있는 경우 반품 및 교환은 불가합니다<br/>7. 보호필름 제거시 부주의로 발생하는 스크레치는 반품사유가 될 수 없습니다<br/><br/>판매원 및 원산지<br/>펫앤드림 031-791-5569, 중국','2021-07-09 09:47:44',8,'중국'),('PRD0120','외출','유모차','패리스독','패리스독 벨라 유모차 핑크',65100,NULL,50,'paerisdog_vella_pink.PNG','frd.jpg','제품명<br/>개모차<br/>반려동물 유모차<br/>패리스독 벨라 유모차<br/><br/>규격<br/>펼친 상태 높이 95cm 길이 70cm 폭 41cm<br/>1. 접은 상태, 캐리어 규격은 상세정보를 확인하시기 바랍니다<br/>2. 측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>탑승 하중<br/>4kg 이하 2마리, 최대 8kg<br/><br/>유모차 무게<br/>4.8kg<br/><br/>구성<br/>유모차 본체, 대용량 매쉬 파우치<br/><br/>주의사항<br/>1. 본 제품은 수입 완제품으로 제품 개봉 시 제품 가치 상실로 인해 반품 불가함을 안내드립니다<br/>2. 교환 및 반품은 개봉 안한 상태에서 7일 이내에만 가능합니다<br/>3. 구입 전 상세 이미지와 제원상 사이즈를 참고하시어 신중하게 구매하시기 바랍니다<br/>4. 공정상 발생할 수 있는 티끌, 미세 스크래치가 있을 수 있는데 이는 사용 성능과 관련 없는 부분으로 예민한 분들은 구매를 삼가시기 바랍니다<br/>5. 품질보증기간은 1년이며 외부 충격, 환경, 천재지변, 무리한 사용 등으로 인한 훼손은 무상 AS에서 제외됩니다<br/><br/>판매원 및 원산지<br/>패리스독 031-902-8986, 중국','2021-07-09 09:50:04',7,'중국'),('PRD0121','외출','유모차','패리스독','패리스독 벨라 유모차 레드 ',65100,NULL,50,'paerisdog_vella_red.PNG','frd.jpg','제품명<br/>개모차<br/>반려동물 유모차<br/>패리스독 벨라 유모차<br/><br/>규격<br/>펼친 상태 높이 95cm 길이 70cm 폭 41cm<br/>1. 접은 상태, 캐리어 규격은 상세정보를 확인하시기 바랍니다<br/>2. 측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>탑승 하중<br/>4kg 이하 2마리, 최대 8kg<br/><br/>유모차 무게<br/>4.8kg<br/><br/>구성<br/>유모차 본체, 대용량 매쉬 파우치<br/><br/>주의사항<br/>1. 본 제품은 수입 완제품으로 제품 개봉 시 제품 가치 상실로 인해 반품 불가함을 안내드립니다<br/>2. 교환 및 반품은 개봉 안한 상태에서 7일 이내에만 가능합니다<br/>3. 구입 전 상세 이미지와 제원상 사이즈를 참고하시어 신중하게 구매하시기 바랍니다<br/>4. 공정상 발생할 수 있는 티끌, 미세 스크래치가 있을 수 있는데 이는 사용 성능과 관련 없는 부분으로 예민한 분들은 구매를 삼가시기 바랍니다<br/>5. 품질보증기간은 1년이며 외부 충격, 환경, 천재지변, 무리한 사용 등으로 인한 훼손은 무상 AS에서 제외됩니다<br/><br/>판매원 및 원산지<br/>패리스독 031-902-8986, 중국','2021-07-09 09:50:50',3,'중국'),('PRD0122','외출','차량용 이동장','MPS','스쿠도1 메탈 켄넬 이동장',43200,NULL,50,'scoodo1_metal.PNG','frd.jpg','제품명<br/>강아지 켄넬 이동장<br/>강아지 바리켄넬 이동장<br/>MPS 스쿠도1 메탈 이동장<br/><br/>규격 및 중량<br/>가로 48cm 세로 31.5cm 높이 31cm 무게 1.3kg<br/>측정하는 위치에 따라 차이가 있을 수 있습니다<br/><br/>추천 견종<br/>치와와, 말티즈, 요크셔테리어, 포메라니안 등 5kg 미만의 초소형견과 고양이<br/>같은 견종이라도 체형, 체중이 각각 다르기에 참고하시기 바랍니다<br/><br/>주의사항<br/>1. 강한 충격은 파손의 원인이 될 수 있으니 주의하시기 바랍니다<br/>2. 화기 근처는 피해서 보관하시기 바랍니다<br/>3. 어깨끈과 바퀴는 구성에 포함되지 않습니다<br/>4. 항공기를 이용하는 경우 반드시 기준 규격에 맞는지 사전에 항공사에 문의하시기 바랍니다<br/>5. 사용을 하지 않고 보관 시에는 직사광선을 피해서 보관하시기 바랍니다<br/>6. 세척은 물로 씻어낸 후 물기를 닦아 그늘진 곳에서 건조하면 됩니다<br/><br/>제조원 및 원산지<br/>MPS, 이탈리아<br/><br/>판매원<br/>씨씨펫 031-474-0474','2021-07-09 09:52:58',5,'이탈리아'),('PRD0123','외출','차량용 이동장','유로펫','유로펫(Europet) 스프래시 캐리어 이동장 ML 그린',25400,NULL,40,'europet_sprash_green.PNG','frd.jpg','☞ 제품규격<br/>- 겉면[가로x세로x높이(H)] : 49 x 32 x 32 cm정도<br/>- 내면[가로x세로x높이(H)] : 43 x 30 x 30 cm정도<br/>- 5kg 미만의 소형견들에게 추천<br/><br/>☞ 제품중량<br/>약 1.5kg정도<br/><br/>☞ 재질<br/>폴리프로필랜, ABS 수지, 메탈<br/><br/>☞ 원산지<br/>대만<br/><br/>☞ 주의사항<br/>- 오염시 중성세제를 사용하여 세척해주세요.<br/>(신나, 벤젠, 알콜 등을 사용하지 마세요.)<br/>- 불에 가까이 하지 말아주세요.<br/>- 세척 후 직사광선을 피해서 통풍이 잘되는 그늘진 곳에서 말려주세요.','2021-07-09 09:53:57',4,'대만'),('PRD0127','외출','이름표/인식표','이지독','이지독 LED 목걸이 그린',6400,NULL,50,'easydog_LEG_pendant_green.PNG','frd.jpg','☞ 제품명<br/>이지독 LED 플래쉬 밴드<br/><br/>☞ 길이<br/>최소 40cm<br/><br/>☞ 소재<br/>실리콘, LED등, ABS, USB<br/><br/>☞ 판매원 및 원산지<br/>펫앤드림 (소비자상담실: 031-791-5569) / 중국','2021-07-09 10:02:18',3,'중국'),('PRD0128','외출','가슴줄','조이프렌드','조이프렌드 가슴줄 리드줄 세트 S 10mm (색상 임의)',6000,NULL,50,'joyfriend_gasuemjool_10mm.PNG','frd.jpg','☞ 제품규격<br/>리드줄의 길이는 120cm랍니다...<br/>small의 경우 줄의 폭은 1.0cm 이고 줄 두께는 2mm이며 가슴둘레는 28~40cm정도랍니다.<br/>medium의 경우 줄의 폭은 1.5cm 이고 줄 두께는 2mm이며 가슴둘레는 38~50cm정도랍니다.<br/><br/>작은 견종들에게는 small 어깨줄을...조금 큰 강아지들의 경우 medium 어깨줄을 해주시면 되겠습니다....<br/><br/><br/>☞ 원산지<br/>펫스컴퍼니 inc. 한국','2021-07-09 10:04:25',67,'한국'),('PRD0129','외출','가슴줄','주랜드','주랜드 심플리 H 하네스 리드줄 민트*',12000,NULL,40,'jooland_simply_mint.PNG','frd.jpg','제품명<br/>강아지 하네스<br/>강아지 H하네스<br/>주랜드 H하네스<br/>주랜드 심플리 H하네스 리드줄<br/><br/>재질<br/>폴리에스터, 스테인리스, 플라스틱<br/><br/>주의사항<br/>1. 반려견 전용 제품으로 다른 용도로 사용하지 마십시오<br/>2. 화기 근처에 보관하지 마십시오<br/>3. 반려견이나 어린이의 손이 닿지 않는 곳에 보관하십시오<br/>4. 반려견의 목과 가슴둘레를 측정 후 제품 규격을 참고하시기 바랍니다<br/>5. 제품 규격에 맞더라도 견종에 따라 체형이 달라 착용이 불가할 수 있습니다<br/>6. 반려견의 체형에 맞춰 길이를 조절하는데 강하게 조이지는 마십시오<br/>7. 모니터 사양에 따라 색상이 다르게 보일 수 있습니다<br/><br/>제조원 및 원산지<br/>주랜드, 중국OEM','2021-07-09 10:05:12',5,'중국'),('PRD0130','외출','리드줄','페로가토','페로가토 룽고 리드줄 4m',8500,NULL,40,'perogato_readjool_4m.PNG','frd.jpg','제품명<br/>페로가토 룽고 리드줄<br/>페로 가토 룽고 리드줄<br/>페로앤가토 룽고 리드줄<br/><br/>재질<br/>폴리에스터, 철<br/><br/>규격<br/>길이 4m<br/>폭 1.5cm<br/><br/>주의사항<br/>1. 화기 근처에 두지 마십시오<br/>2. 용도 외 사용하지 마십시오<br/>3. 반려동물이 먹거나 삼키지 않도록 주의하십시오<br/>4. 반려동물이나 영유아의 손이 닿지 않는 곳에 보관하십시오<br/>5. 고온 또는 저온의 장소 및 직사광선이 닿는 곳에는 보관하지 마십시오<br/><br/>제조원 및 원산지<br/>로뎀사, 한국','2021-08-09 10:06:37',35,'한국'),('PRD0131','외출','리드줄','쥬쥬베','쥬쥬베 핸즈프리 리드줄',14400,NULL,40,'joojoobe_readjool.PNG','frd.jpg','제품명<br/>쥬쥬베 핸즈프리 리드줄<br/><br/>재질<br/>벨트, 포켓: 메쉬 소재, 나일론, 스테인레스, 플라스틱<br/><br/>주의사항<br/>1. 본 상품은 반려동물용 벨트 리드줄이며, 이외 목적으로 사용하지 마세요<br/>2. 리드줄의 스프링처럼 사용하는 힘에 따라 늘어날 수 있습니다<br/>3. 좁은 길이나 도로근처 등 주변이 혼잡한 곳에서는 리드줄의 탄력성을 감안하여 우리아지의 급작스런 돌방행동에 주의해주세요<br/>4. 화기에 가까이하지 마시고, 고온에 주의하십시오<br/>5. 직사광선에 장시간 노출시 변형 될 수 있습니다<br/>6. 세탁은 가벼운 손세탁을 하시고, 통풍이 잘되고 그늘진 곳에서 건조하시기 바랍니다<br/><br/>판매원 및 원산지<br/>위버스코리아, 중국','2021-08-09 10:07:25',12,'중국'),('PRD0132','패션','의류','이츠독','이츠독 플러피 보아 베스트 베이지',29000,NULL,50,'itsdog_boa_best_beige.PNG','frd.jpg','제품명<br/>이츠독 플러피 보아 베스트 베이지','2021-08-09 10:26:21',23,'한국'),('PRD0133','패션','의류','이츠독','이츠독 플러피 보아 베스트 블루',29000,NULL,50,'itsdog_boa_best_blue.PNG','frd.jpg','제품명<br/>이츠독 플러피 보아 베스트 블루','2021-08-09 10:27:21',53,'한국'),('PRD0134','패션','의류','이츠독','이츠독 플러피 보아 베스트 핑크',29000,NULL,50,'itsdog_boa_best_pink.PNG','frd.jpg','제품명<br/>이츠독 플러피 보아 베스트 핑크','2021-08-09 10:28:13',56,'한국'),('PRD0135','패션','액세서리','이츠독','이츠독 조이 엔젤 캡 옐로우',22000,NULL,40,'itsdog_joy_angelCap_yellow.PNG','frd.jpg','제품명<br/>이츠독 조이 엔젤 캡 옐로우','2021-08-09 10:29:41',23,'한국'),('PRD0136','패션','액세서리','이츠독','이츠독 조이 엔젤 캡 핑크',22000,NULL,40,'itsdog_joy_angelCap_pink.PNG','frd.jpg','제품명<br/>이츠독 조이 엔젤 캡 핑크','2021-08-09 10:30:35',42,'한국'),('PRD0138','패션','디자인/소품','패리스독','패리스독 파인애플 매너벨트 핑크',7500,NULL,49,'paerisdog_maenubelt_pink.PNG','frd.jpg','제품명<br/>패리스독 파인애플 매너벨트<br/>패리스독 파인애플 수컷용 매너벨트<br/><br/>소재<br/>순면, 매쉬<br/><br/>규격<br/>S 허리둘레 25~30cm<br/>M 허리둘레 31~38cm<br/>L 허리둘레 39~44cm<br/><br/>주의사항<br/>1. 위 권장 규격은 측정하는 위치에 따라 차이가 있을 수 있습니다<br/>2. 몸무게가 같더라도 견종마다 체형이 다르기에 반려견의 허리둘레 측정 후 구매하시기 바랍니다<br/>3. 화기근처는 피해서 보관하시기 바랍니다<br/>4. 용도 이외 사용을 금지합니다<br/>5. 세제를 풀어 가볍게 손세탁하시고 통풍이 잘되는 그늘진 곳에 건조하시면 변형없이 오랫동안 사용할 수 있습니다<br/>6. 벨크로에 이물질이 붙으면 접착력이 떨어지기에 붙지 않도록 주의하시고 붙은 경우 이물질만 제거하시기 바랍니다<br/>7. 개봉 또는 착용 후에는 반품 및 환불이 불가합니다<br/><br/><br/>판매원 및 원산지<br/>패리스독, 중국','2021-08-09 10:37:02',5,'중국'),('PRD0139','패션','디자인/소품','이츠독','이츠독 오가닉 삐약이 매너벨트',13900,NULL,40,'itsdog_oganic_maenubelt.PNG','frd.jpg','☞ 제품사이즈<br/><br/>* 원단특성 및 디자인마다 사이즈 다를 수 있습니다. 꼭 확인해주세요.<br/>* 옷을 직선길이로 잰 수치이므로 1~2cm의 오차는 있을 수 있습니다.<br/><br/>★ 상품 배송 및 교환 및 환불안내<br/><br/>1. 본 제품은 공급처에서 별도로 배송되므로 2~3일 정도 소요된답니다.<br/>2. 제품특성상 수령후 2주가 지나면 반품 및 교환은 불가합니다. 물품에 이상이 있을시엔 100% 교환,환불해 드립니다(왕복배송비 공급처 부담).<br/>단, 고객님의 변심으로 사이즈,색상 교환, 또는 반품시엔 왕복 배송비(\\5,000원)가 추가됩니다.<br/>꼭 아가의 사이즈를 재어 보시고 사이표와 비교 후 사이즈를 선택해주세요.<br/>3. 티셔츠, 나시는 몸통 기준으로 하시고, 바지는 등길이 기준으로 보세요~<br/>4. 일부 옷 중에 XXL사이즈가 판매중일 경우는 추가비용이 들어가므로 꼭 옵션선택시 확인해주세요.<br/>5. 이츠독(ITS DOG) 반품 및 A/S 주소지<br/>- 연락처 : 070-4006-3449<br/>- 주소 : 서울시 강동구 길동 381-11 지하 1층 이츠독','2021-08-09 10:37:58',6,'한국'),('PRD0144','장난감','훈련','그래닉스','그래닉스 비터애플 반려동물 행동교정 스프레이 235ml',20000,NULL,40,'granix_spray.PNG','frd.jpg','제품명<br/>그래닉스 비터애플 스프레이<br/>그래닉스 비터애플 행동교정 스프레이<br/><br/>성분<br/>정제수, 비터애플엑기스 등<br/><br/>용량<br/>235ml<br/><br/>사용 방법<br/>1. 반려동물이 사고를 친 곳에 살짝 뿌려줍니다<br/>2. 휘발성이므로 필요에 따라 2~3번 또는 수시로 뿌려줍니다<br/>3. 예방 차원에서도 사용할 수 있습니다<br/>4. 위험한 행동을 할 경우 코나 입에 살짝 뿌려줍니다<br/>5. 간혹 지나치게 자주 사용하는 경우 아이가 비터애플에 적응되어 즐길 수도 있으니 참고하시기 바랍니다<br/><br/>주의사항<br/>1. 판매자가 고시한 용도로만 사용하세요<br/>2. 사용 시 눈에 들어가지 않도록 주의하며 눈에 들어갔을 경우 즉시 흐르는 물에서 씻어냅니다<br/>3. 어린이의 손이 닿지 않는 곳에 보관하시기 바랍니다<br/>4. 화기로부터 멀리 떨어지고 그늘진 상온에 보관하시기 바랍니다<br/>5. 온도가 급증할 수 있는 자동차 안에는 보관하지 마세요<br/><br/>유통기한<br/>용기에 별도 표시<br/><br/>제조원 및 원산지<br/>그래닉스 비터애플, 미국<br/><br/>판매원<br/>시소퍼블릭레이션즈 02-515-5009','2021-08-09 10:45:46',3,'미국'),('PRD0145','장난감','노즈워크','시소플레이','시소플레이 후각놀이매트 블루 M ',19000,NULL,50,'sisoplay_blue.PNG','frd.jpg','☞ 제품명<br/>시소플레이 후각놀이매트<br/><br/>☞ 규격<br/>중형 70 x 48cm<br/><br/>☞ 재질<br/>국내산 폴라폴리스 원단 (실리콘 논슬립 원단)<br/><br/>☞ 제조원 및 원산지<br/>시소네트웍스 / 한국','2021-08-09 10:47:17',2,'한국');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_seq`
--

DROP TABLE IF EXISTS `products_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_seq` (
  `p_code` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`p_code`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_seq`
--

LOCK TABLES `products_seq` WRITE;
/*!40000 ALTER TABLE `products_seq` DISABLE KEYS */;
INSERT INTO `products_seq` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122),(123),(124),(125),(126),(127),(128),(129),(130),(131),(132),(133),(134),(135),(136),(137),(138),(139),(140),(141),(142),(143),(144),(145),(149),(150),(151),(152),(153),(154),(155),(156),(160);
/*!40000 ALTER TABLE `products_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qnaboard`
--

DROP TABLE IF EXISTS `qnaboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qnaboard` (
  `qna_no` int(11) NOT NULL AUTO_INCREMENT,
  `qna_originNo` int(11) NOT NULL,
  `qna_groupOrd` int(11) NOT NULL DEFAULT '0',
  `qna_groupLayer` int(11) NOT NULL DEFAULT '0',
  `qna_title` varchar(45) NOT NULL,
  `qna_writer` varchar(20) NOT NULL,
  `qna_content` varchar(1000) NOT NULL,
  `qna_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qna_secret` varchar(3) DEFAULT 'N',
  `qna_hits` int(11) NOT NULL DEFAULT '0',
  `qna_originWriter` varchar(20) NOT NULL,
  PRIMARY KEY (`qna_no`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qnaboard`
--

LOCK TABLES `qnaboard` WRITE;
/*!40000 ALTER TABLE `qnaboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `qnaboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `refund` (
  `refund_num` int(11) NOT NULL AUTO_INCREMENT,
  `member_num` int(11) NOT NULL,
  `order_code` char(7) NOT NULL,
  `order_detailCode` char(7) NOT NULL,
  `refund_quantity` int(11) NOT NULL,
  `refund_price` int(11) NOT NULL,
  `refund_name` varchar(20) NOT NULL,
  `refund_tel` varchar(13) NOT NULL,
  `refund_address1` varchar(10) NOT NULL,
  `refund_address2` varchar(30) NOT NULL,
  `refund_address3` varchar(40) NOT NULL,
  `refund_traking` int(11) DEFAULT NULL,
  `order_status` varchar(20) NOT NULL,
  `buyer_reason` varchar(50) DEFAULT NULL,
  `seller_reason` varchar(50) DEFAULT NULL,
  `refund_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`refund_num`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviews` (
  `review_num` int(11) NOT NULL AUTO_INCREMENT,
  `p_code` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Member_Nick` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `review_title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `review_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `review_recommend` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `review_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `review_imageFileName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `review_test` char(1) NOT NULL,
  PRIMARY KEY (`review_num`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (8,'PRD0002','운영자','테스트2','하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇하잇','5','2021-08-13 06:04:39','부서지기.jpg','C'),(9,'PRD0003','운영자','ㅁㄴㅇㄻㄴㅇㄹ','ㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹㄹㅇㅁㅇㄹㄴㅁㅇㄹ','5','2021-08-13 06:07:52','iumini5mvkbk_201.jpg','Y');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-16 17:41:36
