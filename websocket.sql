-- MariaDB dump 10.19-11.2.2-MariaDB, for osx10.19 (arm64)
--
-- Host: localhost    Database: websocket
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_account`
--

DROP TABLE IF EXISTS `account_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account`
--

LOCK TABLES `account_account` WRITE;
/*!40000 ALTER TABLE `account_account` DISABLE KEYS */;
INSERT INTO `account_account` VALUES
(1,'pbkdf2_sha256$600000$8y1KcebcPUDXNhkQ7o4Qga$99gJmH5u9oYpyYs9/jucyp01CCE+et/Di/2APfJ5Qss=','2024-02-26 15:45:12.382942',1,'Adam','','','a@gmail.com',1,1,'2023-12-16 15:34:02.729514'),
(2,'pbkdf2_sha256$600000$aHJcMACbbVJWX4Jg1GXYZm$KSXGwnW8nAYk5lNW8eAUuV6anLAIS6wdq7sFe9yC5JA=',NULL,1,'Eve','','','',1,1,'2024-02-29 15:21:44.583994');
/*!40000 ALTER TABLE `account_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_account_groups`
--

DROP TABLE IF EXISTS `account_account_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_account_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_account_groups_account_id_group_id_33a11f43_uniq` (`account_id`,`group_id`),
  KEY `account_account_groups_group_id_31ca8e7b_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_account_groups_account_id_7aa27e9f_fk_account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `account_account_groups_group_id_31ca8e7b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account_groups`
--

LOCK TABLES `account_account_groups` WRITE;
/*!40000 ALTER TABLE `account_account_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_account_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_account_user_permissions`
--

DROP TABLE IF EXISTS `account_account_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_account_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_account_user_per_account_id_permission_id_fa4fbca7_uniq` (`account_id`,`permission_id`),
  KEY `account_account_user_permission_id_e6a453ba_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_account_user_account_id_8c2c4a68_fk_account_a` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `account_account_user_permission_id_e6a453ba_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account_user_permissions`
--

LOCK TABLES `account_account_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_account_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_account_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add user',6,'add_account'),
(22,'Can change user',6,'change_account'),
(23,'Can delete user',6,'delete_account'),
(24,'Can view user',6,'view_account'),
(25,'Can add category',7,'add_category'),
(26,'Can change category',7,'change_category'),
(27,'Can delete category',7,'delete_category'),
(28,'Can view category',7,'view_category'),
(29,'Can add server',8,'add_server'),
(30,'Can change server',8,'change_server'),
(31,'Can delete server',8,'delete_server'),
(32,'Can view server',8,'view_server'),
(33,'Can add channel',9,'add_channel'),
(34,'Can change channel',9,'change_channel'),
(35,'Can delete channel',9,'delete_channel'),
(36,'Can view channel',9,'view_channel'),
(37,'Can add conversation',10,'add_conversation'),
(38,'Can change conversation',10,'change_conversation'),
(39,'Can delete conversation',10,'delete_conversation'),
(40,'Can view conversation',10,'view_conversation'),
(41,'Can add message',11,'add_message'),
(42,'Can change message',11,'change_message'),
(43,'Can delete message',11,'delete_message'),
(44,'Can view message',11,'view_message');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_account_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2023-12-16 15:44:04.705157','1','server1',1,'[{\"added\": {}}]',7,1),
(2,'2023-12-16 15:44:26.242192','2','server2',1,'[{\"added\": {}}]',7,1),
(3,'2023-12-16 15:44:51.419279','2','category2',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',7,1),
(4,'2023-12-16 15:45:02.787571','1','category1',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',7,1),
(5,'2023-12-16 15:53:09.038393','1','server1-1',1,'[{\"added\": {}}]',8,1),
(6,'2023-12-16 15:53:28.278945','2','server2-2',1,'[{\"added\": {}}]',8,1),
(7,'2023-12-16 15:54:50.916689','1','channel1',1,'[{\"added\": {}}]',9,1),
(8,'2023-12-16 15:55:02.581430','2','channel2',1,'[{\"added\": {}}]',9,1),
(9,'2023-12-21 14:30:43.307564','1','Conversation object (1)',3,'',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(6,'account','account'),
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'contenttypes','contenttype'),
(7,'server','category'),
(9,'server','channel'),
(8,'server','server'),
(5,'sessions','session'),
(10,'webchat','conversation'),
(11,'webchat','message');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2023-12-16 15:08:40.974765'),
(2,'contenttypes','0002_remove_content_type_name','2023-12-16 15:08:40.992138'),
(3,'auth','0001_initial','2023-12-16 15:08:41.044445'),
(4,'auth','0002_alter_permission_name_max_length','2023-12-16 15:08:41.056273'),
(5,'auth','0003_alter_user_email_max_length','2023-12-16 15:08:41.058830'),
(6,'auth','0004_alter_user_username_opts','2023-12-16 15:08:41.061110'),
(7,'auth','0005_alter_user_last_login_null','2023-12-16 15:08:41.063807'),
(8,'auth','0006_require_contenttypes_0002','2023-12-16 15:08:41.064725'),
(9,'auth','0007_alter_validators_add_error_messages','2023-12-16 15:08:41.067823'),
(10,'auth','0008_alter_user_username_max_length','2023-12-16 15:08:41.070120'),
(11,'auth','0009_alter_user_last_name_max_length','2023-12-16 15:08:41.072384'),
(12,'auth','0010_alter_group_name_max_length','2023-12-16 15:08:41.077612'),
(13,'auth','0011_update_proxy_permissions','2023-12-16 15:08:41.080831'),
(14,'auth','0012_alter_user_first_name_max_length','2023-12-16 15:08:41.084058'),
(15,'account','0001_initial','2023-12-16 15:08:41.138818'),
(16,'admin','0001_initial','2023-12-16 15:08:41.166057'),
(17,'admin','0002_logentry_remove_auto_add','2023-12-16 15:08:41.170406'),
(18,'admin','0003_logentry_add_action_flag_choices','2023-12-16 15:08:41.173689'),
(19,'server','0001_initial','2023-12-16 15:08:41.252239'),
(20,'sessions','0001_initial','2023-12-16 15:08:41.260789'),
(21,'webchat','0001_initial','2023-12-16 15:08:41.289354'),
(22,'webchat','0002_rename_conversation_message_conversation','2023-12-16 15:08:41.315244');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('743zk60zl68mpj0twoq3i6w9kl1zgz89','.eJxVjDsOwyAQBe9CHSGM-aZM7zOghWWDkwgkY1dR7h5bcpG0M_PemwXY1hK2npcwI7uygV1-WYT0zPUQ-IB6bzy1ui5z5EfCT9v51DC_bmf7d1Cgl33tso0k5ZCJ0KmUIzqS3ugRhY3OW6UBDZHQSjjAEch6b9TOQTqLqNjnCwAGOC4:1redAG:RUZVfqNa1A5QL5UsswaSJLpDueCmxWXfLv_wvP2IONQ','2024-03-11 15:45:12.384867'),
('vw0aog6gmr1yqccvjf4t5w8j1rdku420','.eJxVjDsOwjAQBe_iGlnxf01Jzxms9WdxANlSnFSIu0OkFNC-mXkvFnBba9hGWcKc2ZkJdvrdIqZHaTvId2y3zlNv6zJHviv8oINfey7Py-H-HVQc9VuDpskTalASiAQpwhIzkkkiTjYVqx1Kn1NRBqRCQPBZeG-lccIREXt_AALXOH4:1rGK4D:ldiEndofX1QGDMRIELKZC0YF1uIB950qwlPrdP7BUkQ','2024-01-04 14:30:29.850061');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_category`
--

DROP TABLE IF EXISTS `server_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_category`
--

LOCK TABLES `server_category` WRITE;
/*!40000 ALTER TABLE `server_category` DISABLE KEYS */;
INSERT INTO `server_category` VALUES
(1,'Facebook','this is category1 channel','category/None/category_icon/candies.png'),
(2,'Instagram','this is category2 channel','category/None/category_icon/deer.png');
/*!40000 ALTER TABLE `server_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_channel`
--

DROP TABLE IF EXISTS `server_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_channel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `owner_id` bigint NOT NULL,
  `server_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `server_channel_owner_id_c255459b_fk_account_account_id` (`owner_id`),
  KEY `server_channel_server_id_e92dff26_fk_server_server_id` (`server_id`),
  CONSTRAINT `server_channel_owner_id_c255459b_fk_account_account_id` FOREIGN KEY (`owner_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `server_channel_server_id_e92dff26_fk_server_server_id` FOREIGN KEY (`server_id`) REFERENCES `server_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_channel`
--

LOCK TABLES `server_channel` WRITE;
/*!40000 ALTER TABLE `server_channel` DISABLE KEYS */;
INSERT INTO `server_channel` VALUES
(1,'channel1','channel_1',1,1),
(2,'channel2','channel_2',1,2);
/*!40000 ALTER TABLE `server_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_server`
--

DROP TABLE IF EXISTS `server_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_server` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `owner_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `server_server_category_id_d05a496b_fk_server_category_id` (`category_id`),
  KEY `server_server_owner_id_f5f38a61_fk_account_account_id` (`owner_id`),
  CONSTRAINT `server_server_category_id_d05a496b_fk_server_category_id` FOREIGN KEY (`category_id`) REFERENCES `server_category` (`id`),
  CONSTRAINT `server_server_owner_id_f5f38a61_fk_account_account_id` FOREIGN KEY (`owner_id`) REFERENCES `account_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_server`
--

LOCK TABLES `server_server` WRITE;
/*!40000 ALTER TABLE `server_server` DISABLE KEYS */;
INSERT INTO `server_server` VALUES
(1,'Server2','Server1','','server/None/server_icons/facebook.png',1,1),
(2,'Server2','Server2','','server/None/server_icons/instagram.png',2,1);
/*!40000 ALTER TABLE `server_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_server_member`
--

DROP TABLE IF EXISTS `server_server_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_server_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `server_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_server_member_server_id_account_id_5daaa904_uniq` (`server_id`,`account_id`),
  KEY `server_server_member_account_id_2123bfd4_fk_account_account_id` (`account_id`),
  CONSTRAINT `server_server_member_account_id_2123bfd4_fk_account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `server_server_member_server_id_64f8b12b_fk_server_server_id` FOREIGN KEY (`server_id`) REFERENCES `server_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_server_member`
--

LOCK TABLES `server_server_member` WRITE;
/*!40000 ALTER TABLE `server_server_member` DISABLE KEYS */;
INSERT INTO `server_server_member` VALUES
(4,1,1),
(25,1,2),
(2,2,1),
(19,2,2);
/*!40000 ALTER TABLE `server_server_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webchat_conversation`
--

DROP TABLE IF EXISTS `webchat_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webchat_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webchat_conversation`
--

LOCK TABLES `webchat_conversation` WRITE;
/*!40000 ALTER TABLE `webchat_conversation` DISABLE KEYS */;
INSERT INTO `webchat_conversation` VALUES
(2,'1','2023-12-21 14:31:07.715730'),
(3,'2','2024-02-21 14:29:05.310297');
/*!40000 ALTER TABLE `webchat_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webchat_message`
--

DROP TABLE IF EXISTS `webchat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webchat_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `conversation_id` bigint NOT NULL,
  `sender_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webchat_message_sender_id_4ec6d6d2_fk_account_account_id` (`sender_id`),
  KEY `webchat_message_conversation_id_bca79d99_fk_webchat_c` (`conversation_id`),
  CONSTRAINT `webchat_message_conversation_id_bca79d99_fk_webchat_c` FOREIGN KEY (`conversation_id`) REFERENCES `webchat_conversation` (`id`),
  CONSTRAINT `webchat_message_sender_id_4ec6d6d2_fk_account_account_id` FOREIGN KEY (`sender_id`) REFERENCES `account_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webchat_message`
--

LOCK TABLES `webchat_message` WRITE;
/*!40000 ALTER TABLE `webchat_message` DISABLE KEYS */;
INSERT INTO `webchat_message` VALUES
(84,'I am Eve','2024-05-11 03:08:01.180449',2,2),
(85,'I am Adam','2024-05-11 03:08:11.633011',2,1),
(86,'I am Eve','2024-05-11 03:08:17.381964',2,2),
(87,'how\'s going?','2024-05-11 03:08:29.293170',2,1),
(88,'hi','2024-05-11 03:26:47.712678',2,2),
(89,'hi','2024-05-11 03:27:13.773554',2,1);
/*!40000 ALTER TABLE `webchat_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-11 11:27:54
