-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: herbal
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_fbfc09f1` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add navigation',9,'add_navigation'),(26,'Can change navigation',9,'change_navigation'),(27,'Can delete navigation',9,'delete_navigation'),(28,'Can add product',10,'add_product'),(29,'Can change product',10,'change_product'),(30,'Can delete product',10,'delete_product');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','ramsey@pixelcode.ca','sha1$ad683$35b40b1a148eb695310c351f205d22b0274d42df',1,1,1,'2011-09-05 23:39:24','2011-09-05 23:38:57');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-09-05 23:40:36',1,9,'1','Homepage',1,''),(2,'2011-09-05 23:40:43',1,9,'2','Herb',1,''),(3,'2011-09-05 23:40:51',1,9,'3','Teas',1,''),(4,'2011-09-05 23:40:58',1,9,'4','Spice',1,''),(5,'2011-09-05 23:41:13',1,9,'5','Aroma therapy',1,''),(6,'2011-09-05 23:41:22',1,9,'6','Shopping guide',1,''),(7,'2011-09-05 23:55:25',1,9,'4','Spice',2,'Changed content.'),(8,'2011-09-05 23:55:44',1,9,'4','Spice',2,'Changed content.'),(9,'2011-09-05 23:58:59',1,9,'1','Homepage',2,'Changed image.'),(10,'2011-09-05 23:59:35',1,9,'1','Homepage',2,'No fields changed.'),(11,'2011-09-06 00:30:06',1,10,'1','Genmaiche Tea',1,''),(12,'2011-09-06 00:30:26',1,10,'2','Osmanthus Chin Husan Tea',1,''),(13,'2011-09-06 00:30:44',1,10,'3','Hight Mountain Oolong Tea',1,''),(14,'2011-09-06 00:31:02',1,10,'4','Jasmine Tea(Whole-Leaf)',1,''),(15,'2011-09-06 00:32:19',1,10,'5','Masala Chai',1,''),(16,'2011-09-06 00:33:16',1,10,'6','Earl Grey',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'navigation','herbal','navigation'),(10,'product','herbal','product');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5bf8de2769962ba4492694bee7b7b2df','NzE2NGM4YTVlODBhMzM3ZTZhM2I2ZDUxZGVkNjk0OGI1NzFkY2RlYTqAAn1xAShVBGNhcnRdcQIo\nY2RqYW5nby5kYi5tb2RlbHMuYmFzZQptb2RlbF91bnBpY2tsZQpxA2NoZXJiYWwubW9kZWxzClBy\nb2R1Y3QKcQRdY2RqYW5nby5kYi5tb2RlbHMuYmFzZQpzaW1wbGVfY2xhc3NfZmFjdG9yeQpxBYdS\ncQZ9cQcoVQtkZXNjcmlwdGlvbnEIWAAAAABVBXRpdGxlcQlYFwAAAEphc21pbmUgVGVhKFdob2xl\nLUxlYWYpVQVwcmljZXEKY2RlY2ltYWwKRGVjaW1hbApxC1UGMjMyLjAwhVJxDFUGX3N0YXRlcQ1j\nZGphbmdvLmRiLm1vZGVscy5iYXNlCk1vZGVsU3RhdGUKcQ4pgXEPfXEQKFUGYWRkaW5ncRGJVQJk\nYnESVQdkZWZhdWx0dWJVB3B1Ymxpc2hxE4hVAmlkcRSKAQRVCGZlYXR1cmVkcRWIVQxwdWJsaXNo\nX2RhdGVxFmNkYXRldGltZQpkYXRldGltZQpxF1UKB9sJBgAcDwAAAIVScRhVBWltYWdlcRlYHAAA\nAGltYWdlcy9wcm9kdWN0cy9wcm9kdWN0NC5wbmdVBW9yZGVycRpOVQhxdWFudGl0eXEbSwF1YmgD\naARdaAWHUnEcfXEdKGgIWAAAAABoCVgZAAAASGlnaHQgTW91bnRhaW4gT29sb25nIFRlYWgKaAtV\nBjMyMC4wMIVScR5oDWgOKYFxH31xIChoEYloElUHZGVmYXVsdHViaBOIaBSKAQNoFYhoFmgXVQoH\n2wkGABwPAAAAhVJxIWgZWBwAAABpbWFnZXMvcHJvZHVjdHMvcHJvZHVjdDMucG5naBpOaBtLAXVi\naANoBF1oBYdScSJ9cSMoaAhYAAAAAGgJWBgAAABPc21hbnRodXMgQ2hpbiBIdXNhbiBUZWFoCmgL\nVQYxMDAuMDCFUnEkaA1oDimBcSV9cSYoaBGJaBJVB2RlZmF1bHR1YmgTiGgUigECaBWIaBZoF1UK\nB9sJBgAcDwAAAIVScSdoGVgcAAAAaW1hZ2VzL3Byb2R1Y3RzL3Byb2R1Y3QyLnBuZ2gaTmgbSwF1\nYmgDaARdaAWHUnEofXEpKGgIWAAAAABoCVgJAAAARWFybCBHcmV5aApoC1UGMjAwLjAwhVJxKmgN\naA4pgXErfXEsKGgRiWgSVQdkZWZhdWx0dWJoE4hoFIoBBmgViGgWaBdVCgfbCQYAHA8AAACFUnEt\naBlYIQAAAGltYWdlcy9wcm9kdWN0cy9lYXJsLWdyZXktdGVhLmpwZ2gaTmgbSwJ1YmVVDV9hdXRo\nX3VzZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNr\nZW5kcy5Nb2RlbEJhY2tlbmR1Lg==\n','2011-09-20 01:59:11');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herbal_navigation`
--

DROP TABLE IF EXISTS `herbal_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herbal_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `content` longtext,
  `image` varchar(100) DEFAULT NULL,
  `publish` tinyint(1) NOT NULL,
  `publish_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herbal_navigation`
--

LOCK TABLES `herbal_navigation` WRITE;
/*!40000 ALTER TABLE `herbal_navigation` DISABLE KEYS */;
INSERT INTO `herbal_navigation` VALUES (1,'Homepage','home',1,'','',1,'2011-09-05 23:37:24'),(2,'Herb','herb',2,'','',1,'2011-09-05 23:37:24'),(3,'Teas','teas',3,'','',1,'2011-09-05 23:37:24'),(4,'Spice','spice',4,'<p>woooo<b>hooo</b></p>','',1,'2011-09-05 23:37:24'),(5,'Aroma therapy','aroma-therapy',5,'','',1,'2011-09-05 23:37:24'),(6,'Shopping guide','shopping-guide',6,'','',1,'2011-09-05 23:37:24');
/*!40000 ALTER TABLE `herbal_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herbal_product`
--

DROP TABLE IF EXISTS `herbal_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herbal_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `description` longtext,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `publish` tinyint(1) NOT NULL,
  `publish_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herbal_product`
--

LOCK TABLES `herbal_product` WRITE;
/*!40000 ALTER TABLE `herbal_product` DISABLE KEYS */;
INSERT INTO `herbal_product` VALUES (1,'Genmaiche Tea',NULL,'','249.00','images/products/product1.png',1,1,'2011-09-06 00:28:15'),(2,'Osmanthus Chin Husan Tea',NULL,'','100.00','images/products/product2.png',1,1,'2011-09-06 00:28:15'),(3,'Hight Mountain Oolong Tea',NULL,'','320.00','images/products/product3.png',1,1,'2011-09-06 00:28:15'),(4,'Jasmine Tea(Whole-Leaf)',NULL,'','232.00','images/products/product4.png',1,1,'2011-09-06 00:28:15'),(5,'Masala Chai',NULL,'','599.00','images/products/Masala_Chai.jpg',1,1,'2011-09-06 00:28:15'),(6,'Earl Grey',NULL,'','200.00','images/products/earl-grey-tea.jpg',1,1,'2011-09-06 00:28:15');
/*!40000 ALTER TABLE `herbal_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-06 12:48:45
