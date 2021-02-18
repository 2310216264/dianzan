-- MySQL dump 10.13  Distrib 5.6.49, for Linux (x86_64)
--
-- Host: localhost    Database: dz6
-- ------------------------------------------------------
-- Server version	5.6.49-log

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
-- Table structure for table `mirrormx_customer_chat_data`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `data_type_ix` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_data`
--

LOCK TABLES `mirrormx_customer_chat_data` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_data` DISABLE KEYS */;
INSERT INTO `mirrormx_customer_chat_data` VALUES (1,'canned_message','你好呀','你好!');
/*!40000 ALTER TABLE `mirrormx_customer_chat_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_department`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_department` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_department`
--

LOCK TABLES `mirrormx_customer_chat_department` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `mirrormx_customer_chat_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_message`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `talk_id` int(10) unsigned NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `message_fk_talk` (`talk_id`),
  KEY `message_from_id_ix` (`from_id`),
  KEY `message_to_id_ix` (`to_id`),
  KEY `message_datetime_ix` (`datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_message`
--

LOCK TABLES `mirrormx_customer_chat_message` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mirrormx_customer_chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_shared_file`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_shared_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_shared_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_name` varchar(255) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `upload_id` int(10) unsigned NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shared_file_fk_upload` (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_shared_file`
--

LOCK TABLES `mirrormx_customer_chat_shared_file` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_shared_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mirrormx_customer_chat_shared_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_talk`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_talk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(32) DEFAULT NULL,
  `department_id` smallint(5) unsigned DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `talk_fk_department` (`department_id`),
  KEY `talk_owner_ix` (`owner`),
  KEY `talk_last_activity_ix` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_talk`
--

LOCK TABLES `mirrormx_customer_chat_talk` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_talk` DISABLE KEYS */;
/*!40000 ALTER TABLE `mirrormx_customer_chat_talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_upload`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `state` varchar(16) NOT NULL,
  `files_info` text,
  `size` int(10) unsigned DEFAULT NULL,
  `progress` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_fk_message` (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_upload`
--

LOCK TABLES `mirrormx_customer_chat_upload` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `mirrormx_customer_chat_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_user`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `info` text,
  `roles` varchar(128) DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_mail_ix` (`mail`),
  KEY `user_last_activity_ix` (`last_activity`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_user`
--

LOCK TABLES `mirrormx_customer_chat_user` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_user` DISABLE KEYS */;
INSERT INTO `mirrormx_customer_chat_user` VALUES (1,'admin','admin','e86e685ea0ff10e1ea942ba647e63fea2383fa0b',NULL,'{\"ip\":\"127.0.0.1\"}','ADMIN,OPERATOR','2020-01-17 16:06:34'),(2,'anonymous-1576222526','no@e.mail.provided','x',NULL,'{\"ip\":\"113.98.116.92\",\"referer\":\"http:\\/\\/qd2.hskj2016.com\\/customlivechat\\/php\\/app.php?widget-test\",\"userAgent\":\"Mozilla\\/5.0 (Windows NT 6.1) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"browserName\":\"chrome\",\"browserVersion\":\"78.0\",\"os\":\"windows\",\"engine\":\"webkit\",\"language\":\"zh\",\"geoloc\":{\"countryCode\":\"CN\",\"countryName\":\"China\",\"regionCode\":\"44\",\"regionName\":\"Guangdong\",\"city\":\"Guangzhou\",\"zipCode\":null,\"timeZone\":\"Asia\\/Shanghai\",\"latitude\":23.1167,\"longitude\":113.25,\"metroCode\":null,\"utcOffset\":-480}}','GUEST','2019-12-13 08:13:03');
/*!40000 ALTER TABLE `mirrormx_customer_chat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirrormx_customer_chat_user_department`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_user_department` (
  `user_id` int(11) NOT NULL,
  `department_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `user_department_uq` (`user_id`,`department_id`),
  KEY `user_department_fk_department` (`department_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirrormx_customer_chat_user_department`
--

LOCK TABLES `mirrormx_customer_chat_user_department` WRITE;
/*!40000 ALTER TABLE `mirrormx_customer_chat_user_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `mirrormx_customer_chat_user_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_auth`
--

DROP TABLE IF EXISTS `system_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '权限状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE,
  KEY `index_system_auth_title` (`title`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_auth`
--

LOCK TABLES `system_auth` WRITE;
/*!40000 ALTER TABLE `system_auth` DISABLE KEYS */;
INSERT INTO `system_auth` VALUES (1,'管理员账号',1,0,'拥有全部权限','2019-10-17 06:04:15'),(2,'代理',1,0,'代理','2020-02-06 09:09:03');
/*!40000 ALTER TABLE `system_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_auth_node`
--

DROP TABLE IF EXISTS `system_auth_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色',
  `node` varchar(200) DEFAULT NULL COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`(191)) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1934 DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限-授权';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_auth_node`
--

LOCK TABLES `system_auth_node` WRITE;
/*!40000 ALTER TABLE `system_auth_node` DISABLE KEYS */;
INSERT INTO `system_auth_node` VALUES (1204,2,'admin'),(1205,2,'admin/deal'),(1206,2,'admin/deal/order_list'),(1207,2,'admin/deal/user_recharge'),(1208,2,'admin/deal/deposit_list'),(1209,2,'admin/users'),(1210,2,'admin/users/index'),(1211,2,'admin/users/edit_users_ewm'),(1808,1,'admin'),(1809,1,'admin/auth'),(1810,1,'admin/auth/index'),(1811,1,'admin/auth/apply'),(1812,1,'admin/auth/add'),(1813,1,'admin/auth/edit'),(1814,1,'admin/auth/refresh'),(1815,1,'admin/auth/forbid'),(1816,1,'admin/auth/resume'),(1817,1,'admin/auth/remove'),(1818,1,'admin/config'),(1819,1,'admin/config/info'),(1820,1,'admin/config/clear'),(1821,1,'admin/config/config'),(1822,1,'admin/config/file'),(1823,1,'admin/deal'),(1824,1,'admin/deal/order_list'),(1825,1,'admin/deal/edit_order'),(1826,1,'admin/deal/deal_console'),(1827,1,'admin/deal/goods_list'),(1828,1,'admin/deal/goods_cate'),(1829,1,'admin/deal/add_goods'),(1830,1,'admin/deal/add_cate'),(1831,1,'admin/deal/edit_goods'),(1832,1,'admin/deal/edit_cate'),(1833,1,'admin/deal/edit_goods_status'),(1834,1,'admin/deal/del_goods'),(1835,1,'admin/deal/del_cate'),(1836,1,'admin/deal/user_recharge'),(1837,1,'admin/deal/edit_recharge'),(1838,1,'admin/deal/deposit_list'),(1839,1,'admin/deal/lixibao_log'),(1840,1,'admin/deal/add_lixibao'),(1841,1,'admin/deal/edit_lixibao'),(1842,1,'admin/deal/del_lixibao'),(1843,1,'admin/deal/lixibao_list'),(1844,1,'admin/deal/lxb_forbid'),(1845,1,'admin/deal/lxb_resume'),(1846,1,'admin/deal/do_deposit'),(1847,1,'admin/deal/do_deposit2'),(1848,1,'admin/deal/daochu'),(1849,1,'admin/deal/do_deposit3'),(1850,1,'admin/deal/do_commission'),(1851,1,'admin/deal/order_log'),(1852,1,'admin/deal/team_reward'),(1853,1,'admin/help'),(1854,1,'admin/help/message_ctrl'),(1855,1,'admin/help/add_message'),(1856,1,'admin/help/edit_message'),(1857,1,'admin/help/del_message'),(1858,1,'admin/help/home_msg'),(1859,1,'admin/help/edit_home_msg'),(1860,1,'admin/help/banner'),(1861,1,'admin/help/edit_banner'),(1862,1,'admin/help/add_banner'),(1863,1,'admin/index'),(1864,1,'admin/index/main'),(1865,1,'admin/index/clearruntime'),(1866,1,'admin/index/buildoptimize'),(1867,1,'admin/menu'),(1868,1,'admin/menu/index'),(1869,1,'admin/menu/add'),(1870,1,'admin/menu/edit'),(1871,1,'admin/menu/resume'),(1872,1,'admin/menu/forbid'),(1873,1,'admin/menu/remove'),(1874,1,'admin/oplog'),(1875,1,'admin/oplog/index'),(1876,1,'admin/oplog/clear'),(1877,1,'admin/oplog/remove'),(1878,1,'admin/pay'),(1879,1,'admin/pay/index'),(1880,1,'admin/pay/edit'),(1881,1,'admin/pay/forbid'),(1882,1,'admin/pay/resume'),(1883,1,'admin/queue'),(1884,1,'admin/queue/index'),(1885,1,'admin/queue/redo'),(1886,1,'admin/queue/processstart'),(1887,1,'admin/queue/processstop'),(1888,1,'admin/queue/remove'),(1889,1,'admin/shop'),(1890,1,'admin/shop/order_list'),(1891,1,'admin/shop/goods_list'),(1892,1,'admin/shop/fahuo'),(1893,1,'admin/shop/goods_cate'),(1894,1,'admin/shop/add_goods'),(1895,1,'admin/shop/add_cate'),(1896,1,'admin/shop/edit_goods'),(1897,1,'admin/shop/edit_cate'),(1898,1,'admin/shop/edit_goods_status'),(1899,1,'admin/shop/del_goods'),(1900,1,'admin/shop/del_cate'),(1901,1,'admin/shop/forbid'),(1902,1,'admin/shop/resume'),(1903,1,'admin/shop/daochu'),(1904,1,'admin/shop/do_deposit3'),(1905,1,'admin/user'),(1906,1,'admin/user/index'),(1907,1,'admin/user/add'),(1908,1,'admin/user/edit'),(1909,1,'admin/user/pass'),(1910,1,'admin/user/forbid'),(1911,1,'admin/user/resume'),(1912,1,'admin/user/remove'),(1913,1,'admin/users'),(1914,1,'admin/users/index'),(1915,1,'admin/users/level'),(1916,1,'admin/users/caiwu'),(1917,1,'admin/users/add_users'),(1918,1,'admin/users/edit_users'),(1919,1,'admin/users/edit_users_ankou'),(1920,1,'admin/users/edit_users_status'),(1921,1,'admin/users/edit_users_address'),(1922,1,'admin/users/edit_users_status2'),(1923,1,'admin/users/edit_users_ewm'),(1924,1,'admin/users/tuandui'),(1925,1,'admin/users/open'),(1926,1,'admin/users/cs_list'),(1927,1,'admin/users/add_cs'),(1928,1,'admin/users/edit_cs_status'),(1929,1,'admin/users/edit_cs'),(1930,1,'admin/users/cs_code'),(1931,1,'admin/users/edit_users_bk'),(1932,1,'admin/users/edit_users_level'),(1933,1,'admin/users/daochu');
/*!40000 ALTER TABLE `system_auth_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_auth_node_copy`
--

DROP TABLE IF EXISTS `system_auth_node_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_auth_node_copy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色',
  `node` varchar(200) DEFAULT NULL COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`(191)) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=765 DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限-授权';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_auth_node_copy`
--

LOCK TABLES `system_auth_node_copy` WRITE;
/*!40000 ALTER TABLE `system_auth_node_copy` DISABLE KEYS */;
INSERT INTO `system_auth_node_copy` VALUES (608,1,'admin'),(609,1,'admin/auth'),(610,1,'admin/auth/index'),(611,1,'admin/auth/apply'),(612,1,'admin/auth/add'),(613,1,'admin/auth/edit'),(614,1,'admin/auth/refresh'),(615,1,'admin/auth/forbid'),(616,1,'admin/auth/resume'),(617,1,'admin/auth/remove'),(618,1,'admin/config'),(619,1,'admin/config/info'),(620,1,'admin/config/config'),(621,1,'admin/config/file'),(622,1,'admin/deal'),(623,1,'admin/deal/order_list'),(624,1,'admin/deal/deal_console'),(625,1,'admin/deal/goods_list'),(626,1,'admin/deal/add_goods'),(627,1,'admin/deal/edit_goods'),(628,1,'admin/deal/edit_goods_status'),(629,1,'admin/deal/del_goods'),(630,1,'admin/deal/user_recharge'),(631,1,'admin/deal/edit_recharge'),(632,1,'admin/deal/deposit_list'),(633,1,'admin/deal/do_deposit'),(634,1,'admin/deal/do_commission'),(635,1,'admin/deal/order_log'),(636,1,'admin/deal/team_reward'),(637,1,'admin/help'),(638,1,'admin/help/message_ctrl'),(639,1,'admin/help/add_message'),(640,1,'admin/help/edit_message'),(641,1,'admin/help/del_message'),(642,1,'admin/help/home_msg'),(643,1,'admin/help/edit_home_msg'),(644,1,'admin/index'),(645,1,'admin/index/main'),(646,1,'admin/index/clearruntime'),(647,1,'admin/index/buildoptimize'),(648,1,'admin/menu'),(649,1,'admin/menu/index'),(650,1,'admin/menu/add'),(651,1,'admin/menu/edit'),(652,1,'admin/menu/resume'),(653,1,'admin/menu/forbid'),(654,1,'admin/menu/remove'),(655,1,'admin/oplog'),(656,1,'admin/oplog/index'),(657,1,'admin/oplog/clear'),(658,1,'admin/oplog/remove'),(659,1,'admin/pay'),(660,1,'admin/pay/index'),(661,1,'admin/pay/edit'),(662,1,'admin/pay/forbid'),(663,1,'admin/pay/resume'),(664,1,'admin/queue'),(665,1,'admin/queue/index'),(666,1,'admin/queue/redo'),(667,1,'admin/queue/processstart'),(668,1,'admin/queue/processstop'),(669,1,'admin/queue/remove'),(670,1,'admin/user'),(671,1,'admin/user/index'),(672,1,'admin/user/add'),(673,1,'admin/user/edit'),(674,1,'admin/user/pass'),(675,1,'admin/user/forbid'),(676,1,'admin/user/resume'),(677,1,'admin/user/remove'),(678,1,'admin/users'),(679,1,'admin/users/index'),(680,1,'admin/users/level'),(681,1,'admin/users/add_users'),(682,1,'admin/users/edit_users'),(683,1,'admin/users/edit_users_ankou'),(684,1,'admin/users/edit_users_status'),(685,1,'admin/users/edit_users_ewm'),(686,1,'admin/users/cs_list'),(687,1,'admin/users/add_cs'),(688,1,'admin/users/edit_cs_status'),(689,1,'admin/users/edit_cs'),(690,1,'admin/users/cs_code'),(691,1,'admin/users/edit_users_bk'),(692,1,'admin/users/edit_users_level'),(756,2,'admin'),(757,2,'admin/deal'),(758,2,'admin/deal/order_list'),(759,2,'admin/deal/user_recharge'),(760,2,'admin/deal/deposit_list'),(761,2,'admin/users'),(762,2,'admin/users/index'),(763,2,'admin/users/edit_users_ewm'),(764,2,'admin/users/edit_users_level');
/*!40000 ALTER TABLE `system_auth_node_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '配置名',
  `value` varchar(500) DEFAULT '' COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_config_name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COMMENT='系统-配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (1,'app_name','一桶金'),(2,'site_name','一桶金'),(3,'app_version','V12'),(4,'site_copy','©版权所有 一桶金'),(5,'site_icon','/upload/fe986c2d6efa2ec2/b439a59291738eac.png'),(7,'miitbeian','暂无'),(8,'storage_type','local'),(9,'storage_local_exts','doc,gif,icon,jpg,mp3,mp4,p12,pem,png,rar'),(10,'storage_qiniu_bucket','https'),(11,'storage_qiniu_domain','用你自己的吧'),(12,'storage_qiniu_access_key','用你自己的吧'),(13,'storage_qiniu_secret_key','用你自己的吧'),(14,'storage_oss_bucket','cuci-mytest'),(15,'storage_oss_endpoint','oss-cn-hangzhou.aliyuncs.com'),(16,'storage_oss_domain','用你自己的吧'),(17,'storage_oss_keyid','用你自己的吧'),(18,'storage_oss_secret','用你自己的吧'),(36,'storage_oss_is_https','http'),(43,'storage_qiniu_region','华东'),(44,'storage_qiniu_is_https','https'),(45,'wechat_mch_id','1332187001'),(46,'wechat_mch_key','A82DC5BD1F3359081049C568D8502BC5'),(47,'wechat_mch_ssl_type','p12'),(48,'wechat_mch_ssl_p12','65b8e4f56718182d/1bc857ee646aa15d.p12'),(49,'wechat_mch_ssl_key','cc2e3e1345123930/c407d033294f283d.pem'),(50,'wechat_mch_ssl_cer','966eaf89299e9c95/7014872cc109b29a.pem'),(51,'wechat_token','mytoken'),(52,'wechat_appid','wx60a43dd8161666d4'),(53,'wechat_appsecret','9978422e0e431643d4b42868d183d60b'),(54,'wechat_encodingaeskey',''),(55,'wechat_push_url','消息推送地址：http://127.0.0.1:8000/wechat/api.push'),(56,'wechat_type','thr'),(57,'wechat_thr_appid','wx60a43dd8161666d4'),(58,'wechat_thr_appkey','5caf4b0727f6e46a7e6ccbe773cc955d'),(60,'wechat_thr_appurl','消息推送地址：http://127.0.0.1:2314/wechat/api.push'),(61,'component_appid','wx28b58798480874f9'),(62,'component_appsecret','8d0e1ec14ea0adc5027dd0ad82c64bc9'),(63,'component_token','P8QHTIxpBEq88IrxatqhgpBm2OAQROkI'),(64,'component_encodingaeskey','L5uFIa0U6KLalPyXckyqoVIJYLhsfrg8k9YzybZIHsx'),(65,'system_message_state','0'),(66,'sms_zt_username','可以找CUCI申请'),(67,'sms_zt_password','可以找CUCI申请'),(68,'sms_reg_template','您的验证码为{code}，请在十分钟内完成操作！'),(69,'sms_secure','可以找CUCI申请'),(70,'store_title','测试商城'),(71,'store_order_wait_time','0.50'),(72,'store_order_clear_time','24.00'),(73,'store_order_confirm_time','60.00'),(74,'sms_zt_username2','可以找CUCI申请2'),(75,'sms_zt_password2','可以找CUCI申请2'),(76,'sms_secure2','可以找CUCI申请2'),(77,'sms_reg_template2','您的验证码为{code}，请在十分钟内完成操作！2'),(78,'michat_appid','2882303761518074614'),(79,'michat_appkey','5861807470614'),(80,'michat_appsecert','CP/WUTUgDuyOxgLQ5ztesg==');
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_data`
--

DROP TABLE IF EXISTS `system_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_data` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置名',
  `value` longtext COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_data_name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统-数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_data`
--

LOCK TABLES `system_data` WRITE;
/*!40000 ALTER TABLE `system_data` DISABLE KEYS */;
INSERT INTO `system_data` VALUES (1,'menudata','[{\"name\":\"请输入名称\",\"type\":\"scancode_push\",\"key\":\"scancode_push\"}]');
/*!40000 ALTER TABLE `system_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COMMENT='系统-日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (58,'admin/login/index','183.22.253.23','系统管理','用户登录系统成功','guanliyuan','2020-07-07 16:17:41'),(59,'admin/login/index','183.22.253.23','系统管理','用户登录系统成功','admin','2020-07-07 16:20:45'),(60,'admin/login/index','183.197.46.88','系统管理','用户登录系统成功','guanliyuan','2020-07-07 16:21:19'),(61,'admin/login/index','117.188.16.97','系统管理','用户登录系统成功','guanliyuan','2020-07-07 16:38:29'),(62,'admin/login/index','183.22.253.23','系统管理','用户登录系统成功','admin','2020-07-07 16:46:52'),(63,'admin/login/index','183.22.253.23','系统管理','用户登录系统成功','admin','2020-07-07 16:51:56'),(64,'admin/login/index','122.97.178.85','系统管理','用户登录系统成功','admin','2020-07-08 16:07:05'),(65,'admin/login/index','218.233.153.134','系统管理','用户登录系统成功','admin','2020-07-09 16:00:34'),(66,'admin/login/index','218.233.153.134','系统管理','用户登录系统成功','admin','2020-07-07 08:25:14'),(67,'admin/login/index','113.232.248.178','系统管理','用户登录系统成功','admin','2020-08-31 16:21:57'),(68,'admin/login/index','120.42.130.202','系统管理','用户登录系统成功','admin','2020-07-10 16:49:27'),(69,'admin/login/index','36.155.117.27','系统管理','用户登录系统成功','admin','2020-07-06 16:14:41'),(70,'admin/login/index','103.126.249.161','系统管理','用户登录系统成功','admin','2020-07-06 18:00:22'),(71,'admin/login/index','1.31.115.75','系统管理','用户登录系统成功','admin','2020-07-09 00:26:32'),(72,'admin/login/index','111.174.78.30','系统管理','用户登录系统成功','guanliyuan','2020-07-09 01:05:06'),(73,'admin/login/index','117.162.85.126','系统管理','用户登录系统成功','admin','2020-07-08 02:52:25'),(74,'admin/login/index','58.230.210.87','系统管理','用户登录系统成功','admin','2020-07-09 16:02:50'),(75,'admin/login/index','127.0.0.1','系统管理','用户登录系统成功','guanliyuan','2020-12-13 08:33:58'),(76,'admin/login/index','127.0.0.1','系统管理','用户登录系统成功','admin','2020-12-13 08:41:45'),(77,'admin/login/index','36.161.109.125','系统管理','用户登录系统成功','admin','2020-12-14 04:32:07'),(78,'admin/login/index','36.161.109.125','系统管理','用户登录系统成功','admin','2020-12-14 04:35:22'),(79,'admin/login/index','36.161.109.125','系统管理','用户登录系统成功','admin','2020-12-14 04:37:12'),(80,'admin/login/index','36.161.109.125','系统管理','用户登录系统成功','admin','2020-12-14 04:40:07');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_menu`
--

DROP TABLE IF EXISTS `system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '父ID',
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `node` varchar(200) DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) DEFAULT '_self' COMMENT '打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_menu_node` (`node`(191)) USING BTREE,
  KEY `index_system_menu_status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COMMENT='系统-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_menu`
--

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;
INSERT INTO `system_menu` VALUES (1,0,'后台首页','','','admin/index/main','','_self',500,1,'2018-09-05 09:59:38'),(2,0,'系统管理','','','#','','_self',0,1,'2018-09-05 10:04:52'),(3,4,'系统菜单管理','','layui-icon layui-icon-layouts','admin/menu/index','','_self',1,1,'2018-09-05 10:05:26'),(4,2,'系统配置','','','#','','_self',20,1,'2018-09-05 10:07:17'),(5,12,'系统用户管理','','layui-icon layui-icon-username','admin/user/index','','_self',1,1,'2018-09-06 03:10:42'),(7,12,'访问权限管理','','layui-icon layui-icon-vercode','admin/auth/index','','_self',2,1,'2018-09-06 07:17:14'),(11,4,'系统参数配置','','layui-icon layui-icon-set','admin/config/info','','_self',4,1,'2018-09-06 08:43:47'),(12,2,'权限管理','','','#','','_self',10,1,'2018-09-06 10:01:31'),(62,0,'角色','','layui-icon layui-icon-username','#','','_self',19,1,'2019-10-17 05:43:53'),(63,62,'会员管理','','','#','','_self',0,1,'2019-10-17 05:44:17'),(64,63,'会员列表','','layui-icon layui-icon-username','admin/users/index','','_self',0,1,'2019-10-17 05:44:45'),(65,0,'帮助中心','','fa fa-flag-o','#','','_self',2,1,'2019-10-18 02:42:54'),(66,67,'公告管理','','layui-icon layui-icon-speaker','admin/help/message_ctrl','','_self',0,1,'2019-10-18 02:45:12'),(67,65,'首页文本','','','#','','_self',0,1,'2019-10-18 06:50:42'),(68,67,'文本管理','','fa fa-book','admin/help/home_msg','','_self',0,1,'2019-10-18 07:13:53'),(69,0,'交易','','fa fa-balance-scale','#','','_self',18,1,'2019-10-19 06:38:16'),(70,69,'任务管理','','','#','','_self',1,1,'2019-10-19 06:39:55'),(71,70,'任务列表','','fa fa-shopping-cart','admin/deal/goods_list','','_self',0,1,'2019-10-19 06:40:50'),(72,69,'交易管理','','','#','','_self',2,1,'2019-10-19 07:31:16'),(73,72,'交易控制','','layui-icon layui-icon-console','admin/deal/deal_console','','_self',1,1,'2019-10-19 07:32:25'),(74,72,'充值管理','','layui-icon layui-icon-chart-screen','admin/deal/user_recharge','','_self',3,1,'2019-10-22 06:15:27'),(75,72,'订单列表','','layui-icon layui-icon-cart-simple','admin/deal/order_list','','_self',4,1,'2019-10-24 08:10:29'),(76,72,'提现管理','','fa fa-legal','admin/deal/deposit_list','','_self',2,1,'2019-10-24 08:44:52'),(77,62,'客服管理','','','#','','_self',0,1,'2019-10-25 02:01:53'),(78,77,'客服列表','','layui-icon layui-icon-group','admin/users/cs_list','','_self',0,1,'2019-10-25 02:07:17'),(79,77,'客服代码','','layui-icon layui-icon-fonts-code','admin/users/cs_code','','_self',0,1,'2019-10-29 05:53:55'),(83,70,'任务分类','','','/admin/deal/goods_cate','','_self',0,1,'2020-01-05 03:16:29'),(84,4,'支付方式管理','','','/admin/pay/index','','_self',0,1,'2020-01-14 12:50:29'),(85,63,'会员等级','','','/admin/users/level','','_self',0,1,'2020-02-05 08:55:18'),(88,69,'利息宝','','','#','','_self',0,1,'2020-02-24 18:33:56'),(89,88,'利息宝选项','','','/admin/deal/lixibao_list','','_self',0,1,'2020-02-24 18:34:53'),(90,88,'利息宝记录','','','/admin/deal/lixibao_log','','_self',0,1,'2020-02-24 18:35:19');
/*!40000 ALTER TABLE `system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_queue`
--

DROP TABLE IF EXISTS `system_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `data` longtext NOT NULL COMMENT '执行参数',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '任务状态(1新任务,2处理中,3成功,4失败)',
  `preload` varchar(500) DEFAULT '' COMMENT '执行内容',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `double` tinyint(1) DEFAULT '1' COMMENT '单例模式',
  `desc` varchar(500) DEFAULT '' COMMENT '状态描述',
  `start_at` varchar(20) DEFAULT '' COMMENT '开始时间',
  `end_at` varchar(20) DEFAULT '' COMMENT '结束时间',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_queue_double` (`double`) USING BTREE,
  KEY `index_system_queue_time` (`time`) USING BTREE,
  KEY `index_system_queue_title` (`title`) USING BTREE,
  KEY `index_system_queue_create_at` (`create_at`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='系统-任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_queue`
--

LOCK TABLES `system_queue` WRITE;
/*!40000 ALTER TABLE `system_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) DEFAULT '' COMMENT '用户密码',
  `qq` varchar(16) DEFAULT '' COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT '' COMMENT '联系手机',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(255) DEFAULT '' COMMENT '登录IP',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `authorize` varchar(255) DEFAULT '' COMMENT '权限授权',
  `tags` varchar(255) DEFAULT '' COMMENT '用户标签',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_user_username` (`username`) USING BTREE,
  KEY `index_system_user_status` (`status`) USING BTREE,
  KEY `index_system_user_deleted` (`is_deleted`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8mb4 COMMENT='系统-用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` VALUES (10000,'admin','fa8846f4bd1a82522bb3e7a4c461ebfd','22222222','','','2020-12-14 12:40:07','36.161.109.125',914,'','','',1,0,'2015-11-13 07:14:22'),(10002,'guanliyuan','9974a7099607a27f1d86353298bcf71d','255945416','','','2020-12-13 16:33:58','127.0.0.1',47,'1','','',1,1,'2015-11-13 07:14:22'),(10003,'admin111','200820e3227815ed1756a6b531e7e0d2','','','',NULL,'',0,'2','','',1,1,'2020-07-07 08:19:59');
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_balance_log`
--

DROP TABLE IF EXISTS `xy_balance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_balance_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交易对象id',
  `oid` char(18) NOT NULL COMMENT '交易单号',
  `num` decimal(10,2) NOT NULL COMMENT '交易金额',
  `type` int(2) NOT NULL COMMENT '交易类型 0系统 1充值 2交易 3返佣 4强制交易 5推广返佣 6下级交易返佣  7提现',
  `status` int(1) DEFAULT '1' COMMENT '收入1 支出2',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `f_lv` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='会员-收支明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_balance_log`
--

LOCK TABLES `xy_balance_log` WRITE;
/*!40000 ALTER TABLE `xy_balance_log` DISABLE KEYS */;
INSERT INTO `xy_balance_log` VALUES (8,53,0,'57',1000.00,21,1,1594397070,NULL),(9,53,0,'57',0.60,23,1,1594396857,NULL),(10,53,0,'57',0.60,23,1,1594483222,NULL),(11,53,0,'57',0.60,23,1,1594569648,NULL),(12,53,0,'57',0.60,23,1,1594656006,NULL),(13,53,0,'57',0.60,23,1,1594742422,NULL),(14,53,0,'57',0.60,23,1,1594828818,NULL),(15,53,0,'57',0.60,23,1,1594915212,NULL),(16,53,0,'57',1004.20,22,1,1595088020,NULL),(17,53,0,'58',1000.00,21,1,1595089078,NULL);
/*!40000 ALTER TABLE `xy_balance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_bank_list`
--

DROP TABLE IF EXISTS `xy_bank_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_bank_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(15) NOT NULL COMMENT '银行编号',
  `bankname` varchar(255) NOT NULL COMMENT '银行名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='提现银行编码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_bank_list`
--

LOCK TABLES `xy_bank_list` WRITE;
/*!40000 ALTER TABLE `xy_bank_list` DISABLE KEYS */;
INSERT INTO `xy_bank_list` VALUES (1,'ICBC','工商银行'),(2,'ABC','农业银行'),(3,'CMB','招商银行'),(4,'BCM','交通银行'),(5,'CCB','建设银行'),(6,'CMBC','民生银行'),(7,'CIB','兴业银行'),(8,'BOC','中国银行'),(9,'SPDB','浦发银行'),(10,'CEB ','光大银行'),(11,'PSBC','邮政储蓄银行'),(12,'PAB','平安银行'),(13,'HXB','华夏银行'),(14,'CGB','广发银行'),(15,'HKBEA','东亚银行'),(16,'NBCB','宁波银行'),(17,'CITIC','中信银行'),(18,'CBHB','渤海银行'),(19,'BOB','北京银行'),(20,'BJCB','南京银行'),(21,'SHB','上海银行'),(22,'GZYH','广州银行'),(23,'HZYH','杭州银行'),(24,'HZLHNCSYYH','杭州联合商业银行');
/*!40000 ALTER TABLE `xy_bank_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_bankinfo`
--

DROP TABLE IF EXISTS `xy_bankinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_bankinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `bankname` varchar(100) NOT NULL DEFAULT '' COMMENT '银行名称',
  `cardnum` varchar(50) NOT NULL DEFAULT '' COMMENT '卡号',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `site` varchar(255) NOT NULL DEFAULT '' COMMENT '开户行地址',
  `tel` varchar(20) NOT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，1启用，0禁用',
  `address` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Uid` (`uid`),
  KEY `Cardnum` (`cardnum`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='会员-银行卡信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_bankinfo`
--

LOCK TABLES `xy_bankinfo` WRITE;
/*!40000 ALTER TABLE `xy_bankinfo` DISABLE KEYS */;
INSERT INTO `xy_bankinfo` VALUES (3,46,'工商银行','123','测试','成都','17628142235',1,'成都',''),(4,49,'工商银行','1','admin','1','17773594218',1,'1','11111'),(5,52,'工商银行','1','1','1','17773594218',1,'1','1');
/*!40000 ALTER TABLE `xy_bankinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_banner`
--

DROP TABLE IF EXISTS `xy_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` text,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='首页轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_banner`
--

LOCK TABLES `xy_banner` WRITE;
/*!40000 ALTER TABLE `xy_banner` DISABLE KEYS */;
INSERT INTO `xy_banner` VALUES (3,'http://qdv10.yuhantest.xyz/upload/30a7214540365d47/21a7a5a3108366aa.png|/upload/d7bf674529c078dc/1043fc37e780f846.png',NULL,'无需设置'),(4,'/upload/72b4d501eee81da7/30a00b22dd3947ba.png',NULL,'12212');
/*!40000 ALTER TABLE `xy_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_convey`
--

DROP TABLE IF EXISTS `xy_convey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_convey` (
  `id` char(18) NOT NULL,
  `uid` int(10) NOT NULL COMMENT '会员ID',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '下单时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '完成交易时间',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '订单状态 0待付款 1交易完成 2用户取消  3强制完成 4强制取消  5交易冻结',
  `commission` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `c_status` int(1) NOT NULL DEFAULT '0' COMMENT '佣金发放状态 0未发放 1已发放 2账号冻结',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `cid` int(10) NOT NULL COMMENT '上级id',
  `goods_count` int(2) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `img` varchar(255) NOT NULL COMMENT '图片审核',
  `bz` text NOT NULL COMMENT '管理员备注',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='会员-订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_convey`
--

LOCK TABLES `xy_convey` WRITE;
/*!40000 ALTER TABLE `xy_convey` DISABLE KEYS */;
INSERT INTO `xy_convey` VALUES ('UB2007072336395143',53,1594136199,1594136199,0,20.00,0,2,2,1,'',''),('UB2007072337279804',53,1594136247,1594136247,0,100.00,0,1,1,1,'',''),('UB2007072337305778',53,1594136250,1594136250,0,99.00,0,6,1,1,'',''),('UB2007072337354499',53,1594136255,1594136255,0,30.00,0,7,1,1,'','');
/*!40000 ALTER TABLE `xy_convey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_cs`
--

DROP TABLE IF EXISTS `xy_cs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_cs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL COMMENT '手机号',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `pwd` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '盐',
  `qq` varchar(20) NOT NULL COMMENT 'QQ号',
  `wechat` varchar(150) NOT NULL COMMENT '微信号',
  `qr_code` varchar(150) NOT NULL COMMENT '微信二维码',
  `btime` char(5) NOT NULL DEFAULT '0' COMMENT '上班时间',
  `etime` char(5) NOT NULL COMMENT '下班时间',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '账号状态 1启用 2禁用',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='客服-用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_cs`
--

LOCK TABLES `xy_cs` WRITE;
/*!40000 ALTER TABLE `xy_cs` DISABLE KEYS */;
INSERT INTO `xy_cs` VALUES (1,'1','一号客服','12346578','','123456','','http://qdv10.yuhantest.xyz/upload/30a7214540365d47/21a7a5a3108366aa.png','08:00','22:00',1,1571970644,'http://1616800.xayutu.xyz/index/index/home?visiter_id=&visiter_name=&avatar=&business_id=1&groupid=0&special=1'),(2,'2','二号客服','12345678','','123456','','http://www.kkugea.cn/upload/8d8974e94ea71793/ef08b1ba42a6f787.jpg','22:00','08:00',1,1571971118,'http://1616800.xayutu.xyz/index/index/home?visiter_id=&visiter_name=&avatar=&business_id=1&groupid=0&special=1'),(3,'3','提现客服（首次提现需审核）','c123456789.','','0','微信号： 88888888','/upload/fa948a0773c6364f/f4531af448330598.gif','10:00','22:00',1,1575521614,'http://16816800.xayutu.xyz/index/index/home?visiter_id=&visiter_name=&avatar=&business_id=1&groupid=0&special=1'),(4,'4','充值客服','queen123456','','0','微信号 ：99999999','http://qd.cn/upload/f8a252173a9d2e87/a14ecf487cc2fe1c.png','09:00','22:00',1,1575595897,'http://16816800.xayutu.xyz/index/index/home?visiter_id=&visiter_name=&avatar=&business_id=1&groupid=0&special=1'),(5,'1','1','1','','1','1','/upload/62ffcbf6ad02ca3c/bb9f59890cc66c8d.jpg','00:04','00:05',2,1593852845,'');
/*!40000 ALTER TABLE `xy_cs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_deal_elog`
--

DROP TABLE IF EXISTS `xy_deal_elog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_deal_elog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` char(18) NOT NULL COMMENT '相关订单',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `errmsg` varchar(255) NOT NULL COMMENT '错误信息',
  `addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='交易错误日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_deal_elog`
--

LOCK TABLES `xy_deal_elog` WRITE;
/*!40000 ALTER TABLE `xy_deal_elog` DISABLE KEYS */;
/*!40000 ALTER TABLE `xy_deal_elog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_deposit`
--

DROP TABLE IF EXISTS `xy_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_deposit` (
  `id` char(18) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '提现用户',
  `bk_id` int(11) NOT NULL COMMENT '银行卡信息',
  `num` decimal(12,2) NOT NULL COMMENT '提现金额',
  `addtime` int(10) NOT NULL COMMENT '提交时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 1待处理 2审核通过 3审核不通过',
  `type` varchar(36) DEFAULT NULL,
  `real_num` decimal(12,2) DEFAULT NULL,
  `shouxu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='会员-余额提现表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_deposit`
--

LOCK TABLES `xy_deposit` WRITE;
/*!40000 ALTER TABLE `xy_deposit` DISABLE KEYS */;
INSERT INTO `xy_deposit` VALUES ('CO2007061607532702',49,4,320.00,1594022873,1594022917,3,'card',320.00,'0'),('CO2007061609592571',49,4,320.00,1594022999,1594023075,2,'card',307.20,'0.04'),('CO2007061614241281',49,4,600.00,1594023264,1594023787,3,'card',576.00,'0.04'),('CO2007061621532566',49,4,110.00,1594023713,1594024566,2,'card',105.60,'0.04');
/*!40000 ALTER TABLE `xy_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_goods_cate`
--

DROP TABLE IF EXISTS `xy_goods_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_goods_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商店名称',
  `bili` varchar(255) NOT NULL COMMENT '商品名称',
  `cate_info` varchar(255) DEFAULT '' COMMENT '商品描述',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `cate_pic` varchar(120) DEFAULT '' COMMENT '商品展示图片',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `status` int(1) DEFAULT '0' COMMENT '上架状态 0不上架 1上架',
  `min` varchar(255) DEFAULT NULL COMMENT '最小金额限制',
  `level_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_goods_cate`
--

LOCK TABLES `xy_goods_cate` WRITE;
/*!40000 ALTER TABLE `xy_goods_cate` DISABLE KEYS */;
INSERT INTO `xy_goods_cate` VALUES (1,'抖音','','白银会员专属通道',NULL,'/upload/cc9b16053d7b06d9/8f3dc9c690103c54.png',1594050659,0,'110',1),(2,'快手','','黄金会员专属通道',NULL,'/upload/ea4d507fd67b31ce/4c3e9aa8ff7093a4.png',1594050774,0,'110',2),(3,'火山','','铂金会员专属通道',NULL,'/upload/e49cb1e62868235e/2744ee24b00c3b3e.png',1594102455,0,'110',3),(4,'皮皮虾','','钻石会员专属通道',NULL,'/upload/76d4a1f79e243eab/0d5f0ee17571633d.png',1594137692,0,'110',4);
/*!40000 ALTER TABLE `xy_goods_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_goods_list`
--

DROP TABLE IF EXISTS `xy_goods_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_goods_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_price` float(10,2) NOT NULL COMMENT '价格',
  `shop_name` varchar(255) NOT NULL COMMENT '任务类型(1:供应信息,2:需求信息,)',
  `cid` int(2) DEFAULT NULL COMMENT '任务级别',
  `rw_yq` int(2) NOT NULL COMMENT '任务要求',
  `sp_lj` varchar(255) DEFAULT NULL COMMENT '视频链接',
  `lq_me` int(10) DEFAULT NULL COMMENT '领取名额',
  `sy_me` int(10) NOT NULL COMMENT '剩余名额',
  `end_time` char(50) NOT NULL COMMENT '截止时间',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_goods_list`
--

LOCK TABLES `xy_goods_list` WRITE;
/*!40000 ALTER TABLE `xy_goods_list` DISABLE KEYS */;
INSERT INTO `xy_goods_list` VALUES (1,100.00,'2',1,1,'https://v.douyin.com/JNJbsFT/',10,8,'2020-10-06',1598891824),(2,20.00,'1',2,3,'https://h5.pipix.com/s/JNJG32n/',100,97,'2020-10-10',1598891835),(3,3.00,'1',4,1,'https://h5.pipix.com/s/JNJG32n/',1,0,'2020-10-07',1598891845),(5,112.00,'2',3,1,'https://h5.pipix.com/s/JNJG32n/',11,9,'2020-10-30',1598891925),(6,99.00,'2',1,3,'https://v.kuaishou.com/7e09Po',10,9,'2020-10-22',1598891944),(7,30.00,'1',1,1,'https://v.kuaishou.com/7e09Po',20,16,'2020-08-07',1598891954);
/*!40000 ALTER TABLE `xy_goods_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_goods_list_copy`
--

DROP TABLE IF EXISTS `xy_goods_list_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_goods_list_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) NOT NULL COMMENT '商店名称',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `goods_info` varchar(255) DEFAULT '' COMMENT '商品描述',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_pic` varchar(120) DEFAULT '' COMMENT '商品展示图片',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '上架状态 0不上架 1上架',
  `cid` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_goods_list_copy`
--

LOCK TABLES `xy_goods_list_copy` WRITE;
/*!40000 ALTER TABLE `xy_goods_list_copy` DISABLE KEYS */;
INSERT INTO `xy_goods_list_copy` VALUES (1,'信酷小米专营店','小米/MIUI 小米电视4S 43英寸人工智能语音网络平板电视 1GB+8GB HDR 4K超高清','金属机身',1.00,'/upload/goods_img/大家电/5db3b89a8d174.jpg',1572059510,1,1),(2,'邮乐安阳馆','【汤阴县积分用户专享】洗衣机XpB—126-9896S','',1.00,'/upload/goods_img/大家电/5db3b89a9f288.jpg',1578206762,1,1),(3,'海信电器旗舰店','海信（Hisense）HZ39E35A 39英寸高清手机交互 轻薄金属 WIFI人工智能液晶电视机','',1.00,'/upload/goods_img/大家电/5db3b89ab61bd.jpg',1572059510,0,1),(4,'邮滋味如皋馆专柜','创维9公斤变频滚筒洗衣机  型号：F9015NC-炫金   如皋免费送货上门，南通包邮，华东地区配货','创维洗衣机，安全健康专家，免费上门安装，绝对优惠，每月线下更有现场特惠活动',1.00,'/upload/goods_img/大家电/5db3b89b52437.jpg',1572059510,0,1),(5,'邮滋味如皋馆专柜','创维2P定频立式柜机，型号：KFR-50LW/F2DA1A-3（限如皋地区免费送货上门安装）','创维定频空调，免费上门安装，绝对优惠，每月更有现场特惠活动',4.00,'/upload/goods_img/大家电/5db3b89b6e95e.jpg',1572059510,0,1),(6,'创维电视官方旗舰店','创维/SKYWORTH 58H8M 58英寸4K超高清全面屏防蓝光人工智能语音HDR超薄网络液晶电视','4K超高清，声像自然，一场声觉革新，视觉体验，光学防蓝光，护眼不偏色',3.00,'/upload/goods_img/大家电/5db3b89b79d10.jpg',1572059510,0,1),(7,'邮乐洛阳','【洛阳金融积分兑换】TCL 205升 三门电冰箱 （星空银） BC（邮政网点配送）','',1.00,'/upload/goods_img/大家电/5db3b89bc11c1.jpg',1572059510,0,1),(8,'邮滋味如皋馆专柜','创维9公斤全自动波轮洗衣机，型号XQB90-52BAS淡雅银如皋免费送货上门，南通包邮，华东地区配送','创维家电大品牌，安全可靠，夏季特惠；每月现场有特惠活动',1.00,'/upload/goods_img/大家电/5db3b89bcfc24.jpg',1572059510,0,1),(9,'信阳邮约会','【限信阳地区积分兑换专用，不对外销售】家用洗衣机，图片仅供参考','',1.00,'/upload/goods_img/大家电/5db3b89be0d98.jpg',1572059510,0,1),(10,'邮乐安阳馆','【滑县积分用户专享】创维电器洗衣机9公斤波轮安阳','',1.00,'/upload/goods_img/大家电/5db3b89bee474.jpg',1572059510,0,1),(11,'邮乐安阳馆','美菱3开门冰箱BCD-209M3CX【汤阴县积分兑换专用，其他下单不发货】','',1.00,'/upload/goods_img/大家电/5db3b89c06586.jpg',1572059510,0,1),(12,'邮乐安阳馆','美菱电冰箱209L3CS【安阳县积分兑换用户专用，其他地区发】','',1.00,'/upload/goods_img/大家电/5db3b89c16f2a.jpg',1572059510,0,1),(13,'信阳邮约会','【限信阳地区积分兑换专用，不对外销售】自动洗衣机 家用洗衣机，图片仅供参考','',2.00,'/upload/goods_img/大家电/5db3b89c22e95.jpg',1572059510,0,1),(14,'邮乐安阳馆','【滑县积分用户专享】创维电器电视50寸4K智能安阳','',3.00,'/upload/goods_img/大家电/5db3b89c2bb37.jpg',1572059510,0,1),(15,'邮乐安阳馆','【安阳县积分用户专享】长虹液晶电视55U1','',3.00,'/upload/goods_img/大家电/5db3b89f48109.jpg',1572059510,0,1),(16,'海信电器旗舰店','海信（Hisense）HZ32E30D 32英寸蓝光高清平板液晶电视机 酒店宾馆卧室推荐','【海信今日限时特惠-到手价788元！】限量200台！抢完即止！',749.00,'/upload/goods_img/大家电/5db3b89f51194.jpg',1572059510,0,1),(17,'邮滋味如皋馆专柜','邮乐特卖：庭美家用消毒柜    型号：YTP-280    如皋免费送货上门，南通包邮，华东地区配送','庭美消毒柜，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238',755.00,'/upload/goods_img/大家电/5db3b89f5ec57.jpg',1572059510,0,1),(18,'吉舜诚商城专柜','飞利浦（PHILIPS）  19英寸液晶电视机 显示器两用 hdmi高清接口','19PFF2650',799.00,'/upload/goods_img/大家电/5db3b89fb14ba.jpg',1572059510,0,1),(19,'创维集团官方旗舰店','创维/SKYWORTH 32X3 32英寸窄边非智能老人机蓝光高清节能LED平板液晶电视机工程机','蓝光高清，经典窄边，节能液晶，简单好用，谁用谁知道，实用耐用款',799.00,'/upload/goods_img/大家电/5db3b89fc8fa8.jpg',1572059510,0,1),(20,'吉舜诚商城专柜','飞利浦（PHILIPS）22英寸LED高清液晶平板电视机含底座 黑色','22PFF2650/T3',899.00,'/upload/goods_img/大家电/5db3b89fd917b.jpg',1572059510,0,1),(21,'创维集团官方旗舰店','创维/SKYWORTH 32X6 32英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机','超值钜惠，高清智能电视，WIFI，酷开系统，10核处理器',899.00,'/upload/goods_img/大家电/5db3b89fe6086.jpg',1572059510,0,1),(22,'海信电器旗舰店','海信 (Hisense) HZ32E35A 32英寸AI智能WIFI 轻薄金属 卧室神器高清电视机','',899.00,'/upload/goods_img/大家电/5db3b8a0004c2.jpg',1572059510,0,1),(23,'邮滋味如皋馆专柜','创维邮乐特卖： 32寸液晶电视机，型号：32E381S   如皋免费送货上门，南通包邮，华东地区配货','创维液晶电视大品牌，夏季特惠；每月现场有特惠活动',899.00,'/upload/goods_img/大家电/5db3b8a01be30.jpg',1572059510,0,1),(24,'琥麟电器专柜','海信 XQB60-H3568 6公斤全自动波轮洗衣机','',749.00,'/upload/goods_img/大家电/5db3b8a0279b3.jpg',1572059510,0,1),(25,'邮滋味如皋馆专柜','创维7公斤全自动波轮洗衣机，型号：XQB70-21C淡雅银，如皋免费送货上门，南通包邮，华东地区配送','创维家电大品牌，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238',928.00,'/upload/goods_img/大家电/5db3b8a0367fe.jpg',1572059510,0,1),(26,'邮滋味如皋馆专柜','创维单冷冰柜，型号：BD/C-160雅白，如皋地区免费送货上门安装，南通地区包邮，华东地区配货','创维冰柜，安全健康专家，免费上门安装，绝对优惠，每月线下更有现场特惠活动',999.00,'/upload/goods_img/大家电/5db3b8a042f39.jpg',1572059510,0,1),(27,'创维集团官方旗舰店','创维（SKYWORTH）32H5 32英寸高清HDR 护眼全面屏 AI人工智能语音 网络WIFI 卧','高清HDR 护眼全面屏 AI人工智能语音 网络WIFI',999.00,'/upload/goods_img/大家电/5db3b8a0511cd.jpg',1572059510,0,1),(28,'邮滋味如皋馆专柜','创维/SKYWORTH热水器，型号：DSZF-D5501-80，如皋免费送货上门，南通包邮 创维/','创维家电大品牌，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238',999.00,'/upload/goods_img/大家电/5db3b8a07389d.jpg',1572059510,0,1),(29,'琥麟电器专柜','Hisense/海信 HB80DA332G8KG公斤大容量家用全自动节能波轮洗衣机','',899.00,'/upload/goods_img/大家电/5db3b8a386615.jpg',1572059510,0,1),(30,'琥麟电器专柜','海信 BCD-163N/B 冰柜冷藏冷冻双温家用商用小型卧式','',999.00,'/upload/goods_img/大家电/5db3b8a390a27.jpg',1572059510,0,1),(31,'吉舜诚商城专柜','东芝（TOSHIBA）  32英寸 蓝光液晶电视 高清平板电视机 东芝电视机','32L1500C',1.00,'/upload/goods_img/大家电/5db3b8a69aafd.jpg',1572059510,0,1),(32,'创维集团官方旗舰店','创维/SKYWORTH 40X6 40英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机','超值钜惠！高清智能，10核处理器，可以WIFI上网',1.00,'/upload/goods_img/大家电/5db3b8a9a6b14.jpg',1572059510,0,1),(33,'甲子商城旗舰店','康佳/KONKA  LED39E330C 39英寸卧室电视高清蓝光节能平板液晶电视','',949.00,'/upload/goods_img/大家电/5db3b8a9b22ae.jpg',1572059510,0,1),(34,'邮乐赣州馆','【不支持邮乐卡支付】创维-彩电-40E1C 40英寸全高清HDR 护眼全面屏 AI人工智能语音','',1.00,'/upload/goods_img/大家电/5db3b8a9cf38d.jpg',1572059510,0,1),(35,'琥麟电器专柜','海信 BCD-177F/Q 177升 双门冰箱','',1.00,'/upload/goods_img/大家电/5db3b8a9f0abd.jpg',1572059510,0,1),(36,'创维集团官方旗舰店','创维/SKYWORTH 43X6 43英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机','【买电视选创维】高清智能，10核处理器，质量上乘，价格厚道，可以Wifi上网',1.00,'/upload/goods_img/大家电/5db3b8aa1b4b4.jpg',1572059510,0,1),(37,'创维集团官方旗舰店','创维（SKYWORTH）40H5 40英寸全高清HDR 护眼全面屏 AI人工智能语音 网络WIFI','全高清HDR 护眼全面屏 AI人工智能语音',1.00,'/upload/goods_img/大家电/5db3b8aa26c4f.jpg',1572059510,0,1),(38,'邮乐安阳馆','市区积分用户专享】创维平板电视32X6','',1.00,'/upload/goods_img/大家电/5db3b8aa31c19.jpg',1572059510,0,1),(39,'吉舜诚商城专柜','飞利浦（PHILIPS）32英寸新品高清LED电视 接口丰富窄边高清LED液晶平板电视机','32PHF3282/T3',1.00,'/upload/goods_img/大家电/5db3b8aa3b85c.jpg',1572059510,0,1),(40,'琥麟电器专柜','海信 BD/BC-308NU/A 冰柜家用 顶开式卧式商用冷藏冷冻柜','',1.00,'/upload/goods_img/大家电/5db3b8aa4931f.jpg',1572059510,0,1),(41,'明凰服饰专营店','男女冲锋衣工装棉服外套修身加厚款','邮乐支持微信，支付宝，网银，邮储卡和银联卡支付。（不同商品请分开下单）',85.00,'/upload/goods_img/户外服饰/5db3b8b22c022.jpg',1572059516,0,1),(42,'户外途量工厂专卖店','春夏季运动风衣钓鱼防晒衣男女超薄透气皮肤衣防风外套户外速干潮流衣服情侣款皮肤衣','大码骑行长袖',29.90,'/upload/goods_img/户外服饰/5db3b8b23604c.jpg',1572059516,0,1),(43,'探路者正江专卖店','探路者/TOREAD 冲锋裤 运动裤 秋冬户外软壳裤男透气防风保暖徒步裤KAMG91159','',428.00,'/upload/goods_img/户外服饰/5db3b8b25312b.jpg',1572059516,0,1),(44,'探路者正江专卖店','探路者运动服 探路者冲锋衣 19秋冬户外女式防水透湿套绒冲锋衣TAWH92285','',839.00,'/upload/goods_img/户外服饰/5db3b8b25d925.jpg',1572059516,0,1),(45,'好看哒专营店','防晒衣女中长款薄款防晒服','FSY-6387',45.00,'/upload/goods_img/户外服饰/5db3b8b56628b.jpg',1572059516,0,1),(46,'宝仕母婴专营店专柜','L户外皮肤衣防紫外线防晒衣男女夏季超薄透气防晒服运动风衣','',75.00,'/upload/goods_img/户外服饰/5db3b8b573966.jpg',1572059516,0,1),(47,'好看哒专营店','防晒衣女夏季新款韩版连帽系带长袖防晒衣糖果色沙滩户外披肩防晒衣','FSY-54',19.90,'/upload/goods_img/户外服饰/5db3b8b88f380.jpg',1572059516,0,1),(48,'户外途量工厂专卖店','户外速干T恤男 女休闲跑步运动健身短袖大码情侣快干衣排汗透气','',22.80,'/upload/goods_img/户外服饰/5db3b8b8abc8f.jpg',1572059516,0,1),(49,'好看哒专营店','防晒衣 户外薄款防紫外线印花防晒衣','FSY-1736',25.00,'/upload/goods_img/户外服饰/5db3b8b8c0c84.jpg',1572059516,0,1),(50,'好看哒专营店','防晒衣夏季女蝙蝠袖连帽拉链短款防晒衣','FSY-5423',35.00,'/upload/goods_img/户外服饰/5db3b8b9b16a1.jpg',1572059516,0,1),(51,'好看哒专营店','防晒衣男士薄款纯色连帽防晒衣','FSY-4167',35.00,'/upload/goods_img/户外服饰/5db3b8b9bbe9c.jpg',1572059516,0,1),(52,'户外途量工厂专卖店','城徒 户外春夏单层冲锋衣女防晒衣男轻薄防风钓鱼服透气速干外套长袖衫','',35.80,'/upload/goods_img/户外服饰/5db3b8ba1b847.jpg',1572059516,0,1),(53,'好看哒专营店','防晒衣韩版短款薄款连帽长袖防晒衣','FSY-5439',36.00,'/upload/goods_img/户外服饰/5db3b8ba72314.jpg',1572059516,0,1),(54,'好看哒专营店','防晒衣女中长款涂鸦薄款防晒衣','FSY-5282',36.00,'/upload/goods_img/户外服饰/5db3b8ba99fd5.jpg',1572059516,0,1),(55,'好看哒专营店','防晒衣女中长款薄款防晒衣','FSY-5456',37.90,'/upload/goods_img/户外服饰/5db3b8baa8e20.jpg',1572059516,0,1),(56,'户外途量工厂专卖店','秋冬户外男抓绒衣摇粒绒女外套保暖冲锋衣内胆开衫卫衣','',39.00,'/upload/goods_img/户外服饰/5db3b8bab267b.jpg',1572059516,0,1),(57,'户外途量工厂专卖店','户外秋冬季加绒加厚抓绒衣男女摇粒绒保暖抓绒外套开衫冲锋衣内胆','',49.00,'/upload/goods_img/户外服饰/5db3b8bae0cb5.jpg',1572059516,0,1),(58,'江门新会馆','【江门新会馆】caxa断码 两截速干裤女 韩版修身透气徒步快干裤野外登山跑步长裤','',50.00,'/upload/goods_img/户外服饰/5db3b8baf06b9.jpg',1572059516,0,1),(59,'宝仕母婴专营店专柜','L夏季休闲短裤男宽松5分中裤子男士运动五分裤大码跑步速干沙滩裤','',55.00,'/upload/goods_img/户外服饰/5db3b8bb2ba54.jpg',1572059516,0,1),(60,'江门新会馆','【江门新会馆】caxa修身户外健身速干裤女 快干弹力透气登山大码长裤 弹力户外裤','',60.00,'/upload/goods_img/户外服饰/5db3b8bb513ed.jpg',1572059516,0,1),(61,'探路者正江专卖店','探路者/TOREADt恤女户外夏季快干速干透气运动服TAJG82984','',61.00,'/upload/goods_img/户外服饰/5db3b8bb5ac47.jpg',1572059516,0,1),(62,'铁好家居美妆日用百货专营店','佳钓尼 夏遮阳防晒帽套头面罩透气防紫外线渔夫帽','',48.00,'/upload/goods_img/户外服饰/5db3b8bb8e0a3.jpg',1572059516,0,1),(63,'宝仕母婴专营店专柜','防晒衣男女情侣春夏季防雨风衣超薄透气速干钓鱼防晒服户外皮肤衣MN','',69.00,'/upload/goods_img/户外服饰/5db3b8bb9f9e7.jpg',1572059516,0,1),(64,'户外途量工厂专卖店','城徒 春夏季速干裤男女大码轻薄快干透气户外修身显瘦弹力冲锋裤','',69.00,'/upload/goods_img/户外服饰/5db3b8bbb3e24.jpg',1572059516,0,1),(65,'宝仕母婴专营店专柜','L运动户外夏季速干t恤 男女短袖速干衣快干t恤 吸汗透气','',69.00,'/upload/goods_img/户外服饰/5db3b8bbe33ff.jpg',1572059516,0,1),(66,'宝仕母婴专营店专柜','L健身房教练速干T恤男女 圆领情侣夏季短袖汗衫','',69.00,'/upload/goods_img/户外服饰/5db3b8bc1bca2.jpg',1572059516,0,1),(67,'户外途量工厂专卖店','城徒 冬季正品户外冲锋裤男女抓绒裤保暖防风防水加厚软壳裤登山裤长裤','',75.00,'/upload/goods_img/户外服饰/5db3b8bc42dab.jpg',1572059516,0,1),(68,'江门新会馆','【江门新会馆】caxa修身弹力女款休闲棉裤 户外休闲快干长裤 女士跑步登山健身裤','',78.00,'/upload/goods_img/户外服饰/5db3b8bc96997.jpg',1572059516,0,1),(69,'江门新会馆','【江门新会馆】caxa休闲修身速干裤 透气轻薄运动裤耐磨健身户外裤多袋裤七分裤','',78.00,'/upload/goods_img/户外服饰/5db3b8bcac92c.jpg',1572059516,0,1),(70,'探路者正江专卖店','探路者/TOREAD 运动服 短袖户外女运动跑步排汗透气圆领速干T恤TAJF82784','',78.00,'/upload/goods_img/户外服饰/5db3b8bcc53b9.jpg',1572059516,0,1),(71,'户外途量工厂专卖店','冲锋裤男户外秋冬防风防水软壳裤女加绒加厚抓绒裤保暖徒步登山裤','',79.00,'/upload/goods_img/户外服饰/5db3b8bd362c1.jpg',1572059516,0,1),(72,'探路者正江专卖店','探路者/TOREADT恤女 夏户外女式超轻透气速干衣圆领T恤短袖KAJG82352','',99.00,'/upload/goods_img/户外服饰/5db3b8bd44554.jpg',1572059516,0,1),(73,'探路者正江专卖店','探路者/TOREAD 短袖 18春夏新款户外女式圆领速干透气印花短袖T恤TAJG82939','',99.00,'/upload/goods_img/户外服饰/5db3b8bd602ab.jpg',1572059516,0,1),(74,'探路者正江专卖店','探路者/TOREAD夏新款户外运动透气弹力速干女式半袖短袖T恤KAJG82310','',99.00,'/upload/goods_img/户外服饰/5db3b8be68f86.jpg',1572059516,0,1),(75,'探路者正江专卖店','探路者/TOREAD T恤女款 秋季户外短袖女时尚速干透气短袖T恤TAJG82938','',99.00,'/upload/goods_img/户外服饰/5db3b8be96a09.jpg',1572059516,0,1),(76,'洋湖轩榭官方旗舰店','洋湖轩榭 春秋季新款中老年男装连帽冲锋衣爸爸装休闲夹克衫外套男A','钜惠双十一 感恩惠顾',126.42,'/upload/goods_img/户外服饰/5db3b8bea6025.jpg',1572059516,0,1),(77,'南城百货专营店','秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服','秋冬季加绒加厚冲锋衣男女三合一可拆卸两件套防水户外情侣登山服',158.00,'/upload/goods_img/户外服饰/5db3b8bede68a.jpg',1572059516,0,1),(78,'正江服饰专营店','包邮韵格NT1021男士紧身训练PRO运动健身跑步长袖弹力速干服纯色衣服','',59.00,'/upload/goods_img/户外服饰/5db3b8beeb97d.jpg',1572059516,0,1),(79,'流行饰品运动户外器械','汤河店 户外冲锋裤男女可脱卸秋冬季加绒加厚保暖软壳防风防水登山滑雪裤','',179.00,'/upload/goods_img/户外服饰/5db3b8bf07cf9.jpg',1572059516,0,1),(80,'流行饰品运动户外器械','汤河店 韩国正品vvc防晒衣女经典薄夏季中长款防晒服户外防紫外线皮肤衣','',499.00,'/upload/goods_img/户外服饰/5db3b8bf2bf21.jpg',1572059516,0,1),(81,'乐颐汇数码专营店','荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB','2400万AI高清自拍，麒麟710处理器，炫光渐变色',989.00,'/upload/goods_img/手机数码/5db3b8700e46c.jpg',1572059524,0,1),(82,'乐颐汇数码专营店','华为/HUAWEI 畅享9 手机 全网通 4GB+128GB','6.26英寸珍珠屏 4000mAh大电池',1099.00,'/upload/goods_img/手机数码/5db3b8731cf7b.jpg',1572059524,0,1),(83,'米果商贸专柜','折叠式平板电脑支架底座懒人手机支架【颜色随机发货】','',9.90,'/upload/goods_img/手机数码/5db3b87337179.jpg',1572059524,0,1),(84,'邮乐韵菲专营店','（亏本促销）车载手机支架双面吸盘式家居懒人多功能通用可弯曲创意手机支架','',1.00,'/upload/goods_img/手机数码/5db3b87345fc4.jpg',1572059524,0,1),(85,'麦尚科技专营店','手机支架懒人支架卡通创意平板电脑桌面支撑座【款式随机】','',9.90,'/upload/goods_img/手机数码/5db3b8734f81e.jpg',1572059524,0,1),(86,'邮乐韵菲专营店','无线蓝牙耳机迷你超小苹果安卓通用耳机','送两条充电线+一个收纳盒',15.90,'/upload/goods_img/手机数码/5db3b873b60d7.jpg',1572059524,0,1),(87,'万品好易购商城','XO NB23 八角宝石锌合金数据线','产品颜色：黑色  白色 宝石外观 不拘一格;  锌合金 更出色；  2.4A极速充电，高效传输文件',49.00,'/upload/goods_img/手机数码/5db3b873bf931.jpg',1572059524,0,1),(88,'万品好易购商城','XO F1 户外Mini蓝牙音箱 经典挂扣 防水 防尘/防摔 抗干扰性强 无线链接 免提通话','音量调节/音乐播放、暂停/上下曲切换 语音报号/来电铃声/数据输出/直读SD卡',99.00,'/upload/goods_img/手机数码/5db3b873d7806.jpg',1572059524,0,1),(89,'万品好易购商城','XO  PB39 移动电源 8000mAh','8000mAh大容量 双输出带LED灯  ； 电源保护, 好用更安全； 智能分流 高效输出',119.00,'/upload/goods_img/手机数码/5db3b8740878f.jpg',1572059524,0,1),(90,'万品好易购商城','XO BS8 运动蓝牙耳机源于经典 加以升级 鲨鱼鳍耳翼 舒适牢固','源于经典 加以升级； 鲨鱼鳍耳翼 舒适牢固 ； 无惧雨水  防水防汗； 蓝牙4.2版本，深度降噪',169.00,'/upload/goods_img/手机数码/5db3b87419133.jpg',1572059524,0,1),(91,'万品好易购商城','XO BS7 运动蓝牙耳机 深度降噪 通话更清晰 轻松操控 随意切换','强劲的CSR芯片 提升续航能力； 蓝牙4.1版本，深度降噪，通话更清晰； 霍尔磁控开关，智能感应',199.00,'/upload/goods_img/手机数码/5db3b8742586e.jpg',1572059524,0,1),(92,'万品好易购商城','XO A8 蓝牙音箱 智能触控 自由切换 大容量电池 可连续播放约4-6小时 土豪金 星空银 银色','智能触控，自由切换； 内置1000毫安聚合物电池，全频高清喇叭+低音振膜,可连续播放约4-6小时',169.00,'/upload/goods_img/手机数码/5db3b874390f2.jpg',1572059524,0,1),(93,'普润家居专营店','oppo蓝牙耳机迷你vivo超小隐形运动通用华为无线耳塞超长待机开车','',79.00,'/upload/goods_img/手机数码/5db3b874496ae.jpg',1572059524,0,1),(94,'木易生活专柜','2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线','2米超长  美能格  苹果安卓Type-C数据线 2.4A快充电线',12.90,'/upload/goods_img/手机数码/5db3b874588e2.jpg',1572059524,0,1),(95,'木易生活专柜','沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1*','沃晟伦蓝牙耳机M165蓝牙耳机入耳式商务车载便携式4.1',15.90,'/upload/goods_img/手机数码/5db3b8746c166.jpg',1572059524,0,1),(96,'北京信酷数码商城专柜','iPhone 苹果原装充电器套装/数据线+充电头电源适配器 通用型','【全国包邮】 充电套装更优惠',69.00,'/upload/goods_img/手机数码/5db3b874784b9.jpg',1572059524,0,1),(97,'小牛数码家居专柜','飞利浦/PHILIPS 多功能可伸缩车载手机支架DLK35002','多功能可伸缩车载手机支架',68.00,'/upload/goods_img/手机数码/5db3b87484bf4.jpg',1572059524,0,1),(98,'北京信酷数码商城专柜','苹果 iphone X /XS MAX/XS/XR/钢化膜 全屏全覆盖 手机贴膜','',19.00,'/upload/goods_img/手机数码/5db3b87493e28.jpg',1572059524,0,1),(99,'邮乐萍乡馆','南孚(NANFU)3V纽扣电池两粒 CR2032/CR2025/CR2016锂电池电子汽车钥匙遥控','奔驰c200l福特 新蒙迪欧 高尔夫7 新马自达昂克赛拉阿特兹 手表奔驰大众汽车钥匙电池',9.90,'/upload/goods_img/手机数码/5db3b874a670c.jpg',1572059524,0,1),(100,'信酷小米专营店','小米（MI） 车载充电器快充版 QC3.0 双口输出 智能温度控制 兼容iOS和Android设备','小米正品 全国包邮',89.00,'/upload/goods_img/手机数码/5db3b874b8050.jpg',1572059524,0,1),(101,'北京信酷数码商城专柜','苹果 iPhone6/6S/6Plus/6SPlus/iPhone7/7P防爆钢化玻璃膜高清手机贴膜','进口AGC玻璃板！超薄钢化玻璃膜！秒杀国产玻璃！',26.00,'/upload/goods_img/手机数码/5db3b874c207b.jpg',1572059524,0,1),(102,'北京信酷数码商城专柜','OPPO手机原装耳机R11/PLUS入耳式线控r11s/r15耳机 白色盒装','',38.80,'/upload/goods_img/手机数码/5db3b874d31ef.jpg',1572059524,0,1),(103,'北京信酷数码商城专柜','华为（HUAWEI）小天鹅无线蓝牙免提通话音箱4.0 便携户外/车载迷你音响AM08','音·触即发！360°音效技术，音质真实自然，简洁触控操作，支持蓝牙免提通话。',95.00,'/upload/goods_img/手机数码/5db3b874e280a.jpg',1572059524,0,1),(104,'北京信酷数码商城专柜','三星 32G内存卡(CLASS10 48MB/s)  手机内存卡32g MicroSD存储卡','正品行货 支持专柜验货 实行三包政策 轻放心购买',95.00,'/upload/goods_img/手机数码/5db3b874edfa5.jpg',1572059524,0,1),(105,'北京信酷数码商城专柜','华为/HUAWEI 华为快速充电套装 4.5V/5A充电头+type-c线  华为充电器','支持p20/mate10/9pro/p10plus荣耀10/v10/note10等机型',98.00,'/upload/goods_img/手机数码/5db3b87504947.jpg',1572059524,0,1),(106,'北京信酷数码商城专柜','小米（MI）小米手环2（黑色）智能运动 防水 心率监测 计步器 久坐提醒','正品行货 全国包邮',159.00,'/upload/goods_img/手机数码/5db3b875133ab.jpg',1572059524,0,1),(107,'信酷小米专营店','小米活塞耳机 清新版 黑色 蓝色 入耳式手机耳机 通用耳麦','小米正品 全国包邮',45.00,'/upload/goods_img/手机数码/5db3b8751ef2e.jpg',1572059524,0,1),(108,'信酷小米专营店','小米支架式自拍杆 灰色 黑色 蓝牙遥控迷你便携带三脚架多功能','小米正品 全国包邮',105.00,'/upload/goods_img/手机数码/5db3b875327b2.jpg',1572059524,0,1),(109,'信酷小米专营店','小米（MI）方盒子蓝牙音箱2 无线迷你随身户外便携客厅家用小音响','小米正品 全国包邮',149.00,'/upload/goods_img/手机数码/5db3b87546807.jpg',1572059524,0,1),(110,'信酷小米专营店','小米（MI）小米运动蓝牙耳机mini 黑色白色 无线蓝牙入耳式运动耳机','小米正品 全国包邮',169.00,'/upload/goods_img/手机数码/5db3b8755a85b.jpg',1572059524,0,1),(111,'信酷小米专营店','小米（MI）小钢炮2代 无线蓝牙便携音箱','小米正品 全国包邮',139.00,'/upload/goods_img/手机数码/5db3b87564c6e.jpg',1572059524,0,1),(112,'铁好家居美妆日用百货专营店','公牛BULL 独立3孔位2USB创意魔方插座 1.5米线GN-UUB122【热卖推荐】','立体集成结构 小巧轻便 五重保护',67.00,'/upload/goods_img/手机数码/5db3b87575612.jpg',1572059524,0,1),(113,'九洲科瑞数码专营店','华为 HUAWEI 畅享9 Plus 4GB+128GB','',1.00,'/upload/goods_img/手机数码/5db3b8758639e.jpg',1572059524,0,1),(114,'九洲科瑞数码专营店','华为HUAWEI nova4 4800万超广角三摄8GB+128GB','',2.00,'/upload/goods_img/手机数码/5db3b875932a9.jpg',1572059524,0,1),(115,'九洲科瑞数码专营店','华为 HUAWEI P30 Pro 徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128G','',4.00,'/upload/goods_img/手机数码/5db3b8759d6bb.jpg',1572059524,0,1),(116,'邮乐萍乡馆','南孚 安卓数据线 NF-LM001 小米华为OPPO三星vivo充电器通用','',9.90,'/upload/goods_img/手机数码/5db3b875a923e.jpg',1572059524,0,1),(117,'铁好家电数码专营店','公牛BULL 二合一苹果lighting+micro USB数据线GN-J81N【热卖推荐】','MFi官方认证，快速充电，抗折断',69.00,'/upload/goods_img/手机数码/5db3b875b2e80.jpg',1572059524,0,1),(118,'邮乐萍乡馆','南孚(NANFU)LR6AA聚能环 5号+7号碱性干电池【共4粒装】','',9.90,'/upload/goods_img/手机数码/5db3b875be233.jpg',1572059524,0,1),(119,'岳灵生活专营店','南孚手机充电宝 10000毫安大容量礼盒装NFCT10','',169.00,'/upload/goods_img/手机数码/5db3b875cad56.jpg',1572059524,0,1),(120,'邮乐萍乡馆','南孚(NANFU)LR03AAA聚能环7号电池碱性干电池12粒装儿童玩具遥控器赛车闹钟智能门锁电池','AAA干电池持久电力家用',27.80,'/upload/goods_img/手机数码/5db3b875d3610.jpg',1572059524,0,1),(121,'中国农垦官方旗舰店','买2份送一份【中国农垦】黑龙江北大荒  支豆浆粉早餐豆浆粉 非转基因大豆 五谷豆浆粉28g*10袋','早餐豆粉买2份送一份',18.00,'/upload/goods_img/特色美食/5db3b8d338ebc.jpg',1572059535,0,1),(122,'中国农垦官方旗舰店','【中国农垦】黑龙江 北大荒支装豆浆粉（醇豆浆、红枣味可选） 非转基因大豆','早餐豆粉买2份送一份',15.00,'/upload/goods_img/特色美食/5db3b8d3432ce.jpg',1572059535,0,1),(123,'牛牛食品专营店','(8月新货)蒙牛小真果粒125ml*20盒草莓味果粒酸奶小胖丁迷你装','8月份的新货,超好喝，儿童，果粒，健康营养，',22.70,'/upload/goods_img/特色美食/5db3b8d34deb1.jpg',1572059535,0,1),(124,'中国农垦官方旗舰店','【中国农垦】黑龙江 北大荒 支装豆浆粉 麦香甜豆浆粉 28g*10袋','早餐豆粉买2份送一份',15.00,'/upload/goods_img/特色美食/5db3b8d3651ce.jpg',1572059535,0,1),(125,'禾煜食品旗舰店','禾煜 黄冰糖418g包  冰糖土冰糖  煲汤食材','黄冰糖买2送1',15.00,'/upload/goods_img/特色美食/5db3b8d66e304.jpg',1572059535,0,1),(126,'新农哥旗舰店','【新农哥】板栗仁108gx4袋  休闲零食小吃','',26.90,'/upload/goods_img/特色美食/5db3b8d6832f9.jpg',1572059535,0,1),(127,'新农哥旗舰店','新农哥 每日坚果 混合果仁 缤纷坚果仁175g*2盒  休闲零食','缤纷美味 一吃钟情',59.90,'/upload/goods_img/特色美食/5db3b8d68e2c4.jpg',1572059535,0,1),(128,'众天蜂蜜邮乐农品旗舰店','众天山花蜂蜜500g','秦岭深处 百花酿造而成 最受欢迎的蜂蜜 性价比极高！',19.90,'/upload/goods_img/特色美食/5db3b8d6a2ed1.jpg',1572059535,0,1),(129,'中国农垦官方旗舰店','【中国农垦】黑龙江 北大荒 非转基因大豆 豆浆粉 红枣豆浆粉28g*10袋','早餐豆粉买2份送一份',18.00,'/upload/goods_img/特色美食/5db3b8d6ae283.jpg',1572059535,0,1),(130,'考拉小哥专营店','薛小贱 每日坚果25g*1包','厂家直供、7种混合、日期新鲜',1.66,'/upload/goods_img/特色美食/5db3b8d6b8e66.jpg',1572059535,0,1),(131,'萃涣堂蒲公英茶专柜','【滨州馆】萃涣堂五宝茶 益本茶 男人茶养生茶 草本','【萃涣堂】五宝益本茶 男人茶买2送1五宝茶男人茶枸杞茶玛咖片黄精男肾茶老公八宝茶养生茶 做性福的男人',19.00,'/upload/goods_img/特色美食/5db3b8d6c8481.jpg',1572059535,0,1),(132,'萃涣堂蒲公英茶专柜','【滨州馆】寻味山东新鲜现做手工 滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮','寻味山东 新鲜现做手工滨州黑芝麻红枣饼核桃 枸杞传统工艺 香甜可口 10g独立装包邮',1.00,'/upload/goods_img/特色美食/5db3b8d6cc302.jpg',1572059535,0,1),(133,'正江食品专营店','寿全斋  红枣姜茶 姜茶 12g*10条','',25.00,'/upload/goods_img/特色美食/5db3b8d6debe7.jpg',1572059535,0,1),(134,'阿坝州理县地方扶贫馆','四川浓香菜籽油 5升农家非转基因5l纯菜子粮油食用油约10斤植物油','2019新油，滴滴香浓，四川非转基因纯菜籽油',66.00,'/upload/goods_img/特色美食/5db3b8d6f246b.jpg',1572059535,0,1),(135,'千岛湖品牌农产品馆','千岛湖 千岛渔娘 糍粑（4味）200g','买二赠一 糍粑',15.00,'/upload/goods_img/特色美食/5db3b8d706ecd.jpg',1572059535,0,1),(136,'萃涣堂蒲公英茶专柜','【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶','【滨州馆】萃涣堂 金菊饮 菊花枸杞茶 菊花茶叶贡菊散装杭枸杞菊花茶非解毒去火清热凉茶',0.50,'/upload/goods_img/特色美食/5db3b8d713dd8.jpg',1572059535,0,1),(137,'果蔻食品专营店','果蔻 每日坚果B款20g/包简装无礼盒成人儿童孕妇混合果仁坚果零食大礼包','科学配比  营养美味',1.39,'/upload/goods_img/特色美食/5db3b8d729985.jpg',1572059535,0,1),(138,'萃涣堂蒲公英茶专柜','【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山','【滨州馆】萃涣堂 黑苦荞茶 5克/袋 苦荞茶正品 大凉山',0.50,'/upload/goods_img/特色美食/5db3b8d736890.jpg',1572059535,0,1),(139,'佳林院红枣旗舰店','【0.4元/袋佳林院泡茶煮粥煲汤枣圈】山东特产乐陵红枣每袋约12克袋装50袋起拍包邮部分偏远地区除外','佳林院品牌装，泡茶煮粥枣圈，拼团价0.4元/袋，每袋约12克装，50袋起拍，食用方便，经济实惠！',0.40,'/upload/goods_img/特色美食/5db3b8d798327.jpg',1572059535,0,1),(140,'果蔻食品专营店','果蔻 每日坚果25g*1包成人儿童孕妇混合坚果混合果仁小吃零食','',1.65,'/upload/goods_img/特色美食/5db3b8d7aa43b.jpg',1572059535,0,1),(141,'萃涣堂蒲公英茶专柜','【滨州馆】红枣黑糖姜茶大姨妈水姜糖女老姜块生姜姜汁姜汤红糖姜枣茶小袋装25克/袋','姜味浓,红枣多,顺畅暖暖,效果杠杠“冬吃萝卜夏吃姜。”传统组方真材实料。',0.90,'/upload/goods_img/特色美食/5db3b8dab8392.jpg',1572059535,0,1),(142,'南阳专区专营店','南阳西峡现摘金桃黄心猕猴桃15枚 （单枚60g-90g）买一送一 共30枚，合并发一箱','买一赠一活动',19.90,'/upload/goods_img/特色美食/5db3b8dac3745.jpg',1572059535,0,1),(143,'果然好口福专柜','宁 福吉 5斤起拍新疆原味生核桃新货 特产薄皮核桃 坚果炒货休闲零食包邮','新疆薄皮核桃  送夹子',9.90,'/upload/goods_img/特色美食/5db3b8daea466.jpg',1572059535,0,1),(144,'刘陶生鲜旗舰店','刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果2','',25.50,'/upload/goods_img/特色美食/5db3b8db3a40e.jpg',1572059535,0,1),(145,'丹东邮政农特产品专营店','2019年丹东新鲜板栗4斤东北农家生板栗毛栗子现摘栗子应季水果干','',19.90,'/upload/goods_img/特色美食/5db3b8db3a7f6.jpg',1572059535,0,1),(146,'果然好口福专柜','宁福吉 新疆和田大枣煲粥枣500克包邮','',6.60,'/upload/goods_img/特色美食/5db3b8db578d5.jpg',1572059535,0,1),(147,'小呆妞旗舰店','预售小呆妞四川蒲江金艳黄心猕猴桃90-110g中果24枚 72内小时发货','关于售后：签收24小时内后台申请退款请提供坏果和快递单合照，会根据实际损坏赔付',27.90,'/upload/goods_img/特色美食/5db3b8db63c28.jpg',1572059535,0,1),(148,'萃涣堂蒲公英茶专柜','萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包伴手礼花茶茶包组合玫瑰茉莉绿茶袋泡三','萃涣堂茉莉绿茶三角茶包袋茉莉花茶小袋装绿茶袋泡冷泡茶包',0.90,'/upload/goods_img/特色美食/5db3b8db71303.jpg',1572059535,0,1),(149,'丹东邮政农特产品专营店','新鲜现挖番薯红黄心密署农家自种蒸煮粉糯香甜沙地地瓜烤烟署5斤','',16.80,'/upload/goods_img/特色美食/5db3b8db862f8.jpg',1572059535,0,1),(150,'川锅壹号旗舰店','川锅壹号辣白菜228g韩国泡菜下饭菜正宗朝鲜口味拌饭菜版面菜','酸辣可口 老少皆宜',5.90,'/upload/goods_img/特色美食/5db3b8dbcdf79.jpg',1572059535,0,1),(151,'福香御旗舰店','福香御 慢生长2018东北大米雪花米10斤真空包邮色选米','初霜收割，180天慢生长周期，30天鲜磨直达，大米胚乳含量极为丰富，口感软糯香甜。',27.90,'/upload/goods_img/特色美食/5db3b8dbdb26c.jpg',1572059535,1,1),(152,'兰州鲜合苑百合特产店专营店','现包现发100%新鲜正宗兰州市七里河区产兰州鲜百合3年生兰州百合农家甜百合，约16颗百合一斤','兰州鲜百合，无任何添加剂，宝宝也可以放心食用',19.90,'/upload/goods_img/特色美食/5db3b8dbe8d2f.jpg',1572059535,0,1),(153,'当季鲜果','黄金奇异果12枚包邮（中果70-90克，拍2件多送6枚，合并发30枚）金艳黄心猕猴桃新鲜水果','快递随机，不能指定快递，下单后72小时内发货，下雨天顺延，购买前请阅读售后要求，介意慎拍',9.90,'/upload/goods_img/特色美食/5db3b8dc0be0c.jpg',1572059535,0,1),(154,'丹东邮政农特产品专营店','东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田','东北特产老品种大米  凤城蓝乡生态米 10斤 珍珠米 非蟹田',28.80,'/upload/goods_img/特色美食/5db3b8dc17d77.jpg',1572059535,0,1),(155,'川锅壹号旗舰店','川锅壹号蟹黄酱拌饭酱秃黄油拌面酱蟹粉酱蟹黄膏酱料即食螃蟹酱','金脂香软 经典美味',9.90,'/upload/goods_img/特色美食/5db3b8dc2c59c.jpg',1572059535,0,1),(156,'刘陶生鲜旗舰店','刘陶 云南昭通丑苹果5斤大果（13-15个）新鲜水果','拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买',27.00,'/upload/goods_img/特色美食/5db3b8dc365c6.jpg',1572059535,0,1),(157,'福香御旗舰店','福香御 大米5kg装2018新米圆粒珍珠米寿司香米秋田小町农家东北大米包邮','',29.99,'/upload/goods_img/特色美食/5db3b8de5a091.jpg',1572059535,0,1),(158,'刘陶生鲜旗舰店','刘陶 云南石林人生果圆果净果5斤（25-35个）大果新鲜水果2','拼团的亲想更加快的发货，尽量和已经开团的亲拼团购买',25.00,'/upload/goods_img/特色美食/5db3b8de6ec9e.jpg',1572059535,0,1),(159,'刘陶生鲜旗舰店','刘陶 福建红肉柚子红心蜜柚8.5-9.5斤（3-4个装） 新鲜水果特卖','',25.50,'/upload/goods_img/特色美食/5db3b8de7ac09.jpg',1572059535,0,1),(160,'萃涣堂蒲公英茶专柜','【萃涣堂】 蜜桃乌龙茶  水果茶 三角包共蜜桃白桃乌龙茶袋泡花茶包花','新品上市!独立三角袋泡茶,携带冲泡更便捷!【萃涣堂】 蜜桃乌龙茶 水果茶 三角包',0.90,'/upload/goods_img/特色美食/5db3b8de97517.jpg',1572059535,0,1);
/*!40000 ALTER TABLE `xy_goods_list_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_index_msg`
--

DROP TABLE IF EXISTS `xy_index_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_index_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '文本内容',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1平台公告 2平台简介 3抢单规则 4代理合作 5常见问题',
  `addtime` int(10) NOT NULL COMMENT '发表时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0发布 1不发布',
  `author` varchar(10) NOT NULL DEFAULT '' COMMENT '作者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='首页内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_index_msg`
--

LOCK TABLES `xy_index_msg` WRITE;
/*!40000 ALTER TABLE `xy_index_msg` DISABLE KEYS */;
INSERT INTO `xy_index_msg` VALUES (1,'平台公告','尊敬的会员，您好！关于微信转卡/支付宝转卡，异地转账出现风控问题。由于支付宝，微信属于三方支付软件， 公信部为防止洗黑钱，有此类问题均属于正常现象，请您不用担心，建议您使用手机银行进行充值，简单快捷，祝您生活愉快！',3,1582141939,1,'admin'),(2,'平台简介','<p>尊敬的用户</p>\r\n\r\n<p>平台每天都会将需要提高曝光度的商家产品放到平台上，提供给平台用户进行抢单。为了规避网购平台的检测，提高订单的真实性，新用户在抢单前必须先完善个人真实信息，并填写真实的收货地址。 为了有效的帮助商家提升订单成功率， 规避商家被检查到虚假订单的风险，平台将会根据您当前的操作IP，设备型号对当天的订单进行优化匹配。所有订单匹配均需要通过智能云算法实现， 请您耐心等待。</p>',3,1582142053,1,'admin'),(3,'抢单规则','<p>尊敬的用户你好</p>\r\n\r\n<p>平台为了防止有人恶意进行洗黑钱或者套现一系列不法行为，会员账户未完成60单以上的提现金额为账户的10%，会员需完成60单方可全额提现，提现审核成功后，到账时间为D+1(次日24点前）到账，具体到账时间以银行为准！</p>',3,1582142085,1,'admin'),(4,'代理合作','<p><span><b>平台代理模式</b></span></p>\r\n\r\n<p><span>平台用户可以通过推荐新人成为平台的代理，代理可以获得额外的动态奖励，直推一级用户奖励为一级用户每天所得佣金的16%，二级用户奖励为二级用户每天所得佣金的8%，三级用户奖励为三级用户每天所得佣金4%</span></p>',3,1582142009,1,'admin'),(5,'常见问题','<p>这是常见问题的文本</p>\r\n\r\n<p>q:xxx</p>\r\n\r\n<p>a:xxx</p>',5,1576043987,1,'admin'),(6,'新手指南','<p>详情可查看客服栏说明，订单发货冻结时间为30分钟，充值提现问题可咨询客服24小时在线，云淘商贸有限公司祝大家新年快乐</p>',1,1580219982,1,'admin'),(7,'利息宝规则','',1,1582249982,0,'admin'),(8,'首页滚动内容','<p>平台代理模式：平台用户可以通过推荐新人成为平台的代理，代理可以获得额外的动态奖励，直推一级用户奖励为一级用户每天所得佣金的16%，二级用户奖励为二级用户每天所得佣金的8%，三级用户奖励为三级用户每天所得佣金4%</p>',1,1588242085,0,'admin'),(9,'抢单备注','<p>\r\n                平台将订单匹配给用户的同时，平台将该笔订单的信息提交到商家后台，若用户在两分钟之内不提交订单，为了规避网购平台的监管，该笔订单会被冻结。订单冻结后，该笔订单资金也会被冻结，需等待系统24小时后自行解冻，请各位用户知悉。等级VIP模式（如：账上额度10000内每日最高可获得佣金3%，10001--50000可获最高佣金3.5%，50001--100000每日最高可获得4%）</p>',1,1258888888,0,'admin'),(10,'活动1','2',1,1259999999,0,'admin'),(11,'首页弹窗内容','<p><strong>温馨提醒:</strong></p>\r\n\r\n<p>提现T+1模式&nbsp;&nbsp;&nbsp;次日24点前到账。 提现由提现客服审核（只需首次审核）后发起提现次日24点前到账。感谢您对本平台的支持与厚爱，祝您兼职愉快！</p>',1,1587884050,0,'admin'),(12,'公司资质','<p>尊敬的用户：</p>\r\n\r\n<p>您好，欢迎来到本平台，本平台是一个第三方智能阿里云匹配订单平台，平台与各大网购平台商家合作，（平台与 淘宝&nbsp; &nbsp;京东&nbsp; &nbsp;唯品会等网购平台商家合作&nbsp; 推动区块链核心技术和产品创新发展），通过智能系统将商家订单匹配给平台用户，借此提高各大商家在各大平台的销售量和信誉度。平台用户需在平台提供真实的收货地址，电话和真实的购物信息，传入智能阿里云主机，即可由智能系统匹配订单。</p>\r\n\r\n<p>注：本平台不会以任何形式向平台内所有兼职会员收取任何费用！</p>',1,1587884262,0,'admin');
/*!40000 ALTER TABLE `xy_index_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_io_log`
--

DROP TABLE IF EXISTS `xy_io_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_io_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` char(18) NOT NULL,
  `amount` decimal(7,2) NOT NULL COMMENT '支付金额',
  `tran_amount` decimal(7,2) NOT NULL COMMENT '实收金额',
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '1收入(用户充值) 2支出(用户提现)',
  `addtime` int(10) unsigned NOT NULL COMMENT '交易时间',
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='平台收支记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_io_log`
--

LOCK TABLES `xy_io_log` WRITE;
/*!40000 ALTER TABLE `xy_io_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xy_io_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_level`
--

DROP TABLE IF EXISTS `xy_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `order_num` int(12) DEFAULT NULL COMMENT '接单限制',
  `num` decimal(18,2) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `bili` decimal(18,4) DEFAULT NULL COMMENT '比例',
  `level` int(11) DEFAULT NULL COMMENT 'd等级',
  `tixian_ci` int(11) DEFAULT NULL COMMENT '提现次数',
  `tixian_min` decimal(18,2) DEFAULT NULL,
  `tixian_max` decimal(18,2) DEFAULT NULL COMMENT '提现最大金额',
  `num_min` decimal(18,2) DEFAULT NULL,
  `cids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tixian_nim_order` int(11) DEFAULT NULL COMMENT '提现最少完成订单数',
  `auto_vip_xu_num` int(11) DEFAULT NULL COMMENT '自动升级vip需要邀请的人',
  `tixian_shouxu` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '提现手续费',
  `pic` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_level`
--

LOCK TABLES `xy_level` WRITE;
/*!40000 ALTER TABLE `xy_level` DISABLE KEYS */;
INSERT INTO `xy_level` VALUES (1,'白银会员',5,0.00,'2020-02-05 17:48:29',0.0000,0,1,0.00,5000.00,100.00,'',50,0,'0.02','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAAAkCAMAAABBj89wAAAAM1BMVEW1tbWkpKSkpKT+/v7w8PCpqamurq67u7uysrK2trbGxsbX19fBwcHPz8/j4+Ompqajo6NL/veVAAAAA3RSTlNM6OcrP75FAAADkklEQVR4Xn2X2ZLbMAwEnQC8L/3/1waHKUCHMy6r9GCz1QNa2v18Uu+pJ02RZEnUBMniHJIsH5TT4LPe8kfWN0JJRoiCCIowQuAP+fWXvtayswtBl1dC2QqC2AZCOA0Kfyy+CLwrLAY8DZzCzSCLoQncFX4DuiPk4jvyCqGw5vKAZZSfBqmbgSa7jqIrgOipWEG3tcMvwP87crski+F9favpkWN9qip4gpWkBqeCK8iW9wq/DWwfjdG9Qi/RhlDchOMYURFCeL18M7COEkLzJQFkIkz85lvQCnECTN/RxDPTCGxw7agDVKlIAQNgjFoQvikl6PVPQIRpv/Mw4QzqxZuBJtVGmQBNMhID9GsVIcWYEoAWFIiIOfPh7GhCWpIE6Ax8RQMuqQQoAJOSEHpOnezy4oIqAJbAGKh7gyGMJKlqIG812A4EmDsNYBCgwZQZnxVxQaSllx4igtb0qMgQn7oVyAB5H2mQDRIhua2Iigag8TYGNY2eR1YY7czY/QvAG6BKnoAyZbpIgM5UgLXogN0ViQCZAP0SMeCDGCggbUAxAIW3UfUGa7YYxpkQW+MZwyW6+nHQmyuqzxlMngEnAsRIAAkbBLv/+WeNlKmZALsjGbISFGBRwGBSaxVhqB+v31xGkx80A/IKoXaCxa8BU3QXnQZo30MBTGU1ngGSCrYYM9ySCRAYIBgBLFXgji4GaPc7BpRch8ygM2AyZ0Y1QL0YqSWGvTSx12lwSASgBAUoITGg7BnkwoAEADPHQIhA5526b3JkAQXIb0wxh7yeBl0J5QRksi4MiGHC3I841Bsd6RW91ykAoW2DLbABVQHjjACKAFJjQGodYCihAeo24hMRWG3Gxbw5a5bfgRlI3nZRYUIFSkdAgErnTdcH7h8RKJMATMgVAVqmA2ANx/sMABGnvhSQSwPAxhQccvMupAA7KPcsIpAwZ1BBRc6rn8FGkG9PGp0BE1Ljx8McOt062IA3f01FWqozU0VdLiMsTZoQ3QysIz6mzdjPZkm0BCYFOlq4IH0s7/0fljewMff0ePYrxgEed4rXP7gOb6CE+8NfCR7gCR4iqxvi0NVVgAHjQjgVxOEpEJ4G+rIYhDFqYPfsTXAG+hdYvhs4yuvaCvltwAA9ZCGYgr5+KniKAHaMwIxigxaAN7gLvC6+CZ9e/T7y2/T+/052CoLwAtcpm8HfjyP0R0tpA6IvSd6/Z2AGvP4/n19/hpfx27MAAAAASUVORK5CYII='),(2,'黄金会员',10,88.00,'2020-02-05 17:48:29',0.0000,1,1,1.00,10000.00,100.00,'',60,12,'0.03','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAAAkCAMAAABBj89wAAAATlBMVEXxyozzwXLls2vmsmTvumb////99ej++/b227H77NT00Zr448Lvw3z1w27wuV/ttFnrt2bzvmb90oHns2bptGT4yHPntGr8z3z6zHjqr1KDODylAAAABHRSTlP9TOjnFtbSewAAA/1JREFUeF6Fl4tyozoYg92zvt+4Jmnf/0WPrPw4mGW6wnhIMqOvkg1D1Vf+/v5+vFVES1kovVTRVCfq5+cnUz/QPjc9f9N/Xwr+B6E8Bn+NUbXYi/80zQCoPDUAzHF8pluCoj0BRAwJKo5LgqnZ52fz32gs1n1cpV5CEHsBCEL8p04YC6JIofNtBMWGxgQLRl8EfU4gBe0siL1onMfxa4IhwnIqSQ8dMYCmPzW2RN0C6D8S2tAgHP4kFAKmo6DnSMD56xrcL/Ny6kjTf4b/NGsANBD/TnCOULyH+8NHQTR3hNAxEkH/8i5Ie68lRe//HkDCQwjOIMG3cQCImn8wJtRPQRMK4nfngpLtCteKJEHAb8ZgcpzDO8GiS8BHE7Smv55YkHzXl/oZjGsyDuARcER42Pa7MZg5WUmgrLElY1IsqN0Mc/uYOfUEwah9oyMAuOApa/D6LILpFUlHJaGKUmtBuAQA7Kc9OlqD4CIT7M85mKio2BNspwRQsKyIs2OVsPcOvmhKt6KM8xoBWH+ZoRxAZYgdCboCvbdhkSFnLnJLAbB/zUtbZzBBEvF6BmL3qctvWwNsYBAgiAOElqhWUrRRfYJFb+OUQVEfakToDIISRc6b2A8VcZVlhaHQ77ZatTGyg6DktfZd84xzm/cxf4sgEAIEYc1pGezpiUdA4Q7CDtW8i6l9PuRM6jKO9scirwBIAhMxsyJlLB9HDMVUlJ2q1v4iLHED5H3bYkQ3GYAe4ZLgJMudell5B/9sLspIQsC+4YMAmjkPtb4BLwICZDgDgACiApdSdK2ThhICoEIPpXcCiACwJcEnAgE9QYxrNGZd18g1aCPhIjeAdkEjAAUnBdfEuQXYWVE0diOA9k1MQMRdRYwQjCdgAVP8Z21NmqFoXD4B9mD8LoAeQa30JyGlYEKCrAvJy/sFfAmowUQtgGQsN1K7EEJKuNcQNIWYoyLgSNAjrB79WzyT1hYgKdivMUZnPGqLPKPSEIxQfwjWIWkgAP3HgK+zbeGxl0Q9Ae5juBvn+cx7NZQJpSRzUdIQfClngwceAE+WY0EeDBfPAFlm71L8vL+8koul+NCVOHsm8B5ZMluKgQ8KwFJ87lDzDC4PgL4K40vkgoGTl1VXjdH1uZvhiSnPsJ4J2Fn9DYD+40sklUteFs3jYq8PBMZHtL0F3LxESgC+XoAwJqhg1PaY+DdA9pEgxgTtFkYCDBK6O05GoP/AuAJuIxQMSgKQ0ENUUgCB6j6PATgPgGsEqhQMTvQfM/S/vo4JOuM2wTcJD+lo/G+kI7pYEgPg+Mv/FEGRcLuPDoS46yNBFfcqCWh+Qgz+f9TXQGCEXtL4qk1EF+157pyGAB3x5+t/M0/Jc5v4fv4AAAAASUVORK5CYII='),(3,'铂金会员',20,188.00,'2020-02-05 17:48:29',0.0000,2,3,1.00,15000.00,100.00,'',70,24,'0.02','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAAAkCAMAAABBj89wAAAAQlBMVEWil8WXjbj///+Ogq+Wi7mNgauaj7yTh7aHe6zSzeD6+vu+t9Lf2+nv7fOxqciek7+Pg7OglsOQhK2kmsbIwtiBc6UBWpS4AAAAAnRSTlPiTGWxUe0AAAPvSURBVHhejZfZbuswEEPTGe2rt/7/r95ZpKjxDdowjmr4gQckG6R9fD16705kRJ61iZAUMEx9h2+S2fe+d74Lx9/6eoi/EIxbACHgpgAc/kI49t7PLqjjEz32/krwI4IiAl2o9pogdPY/2N8KAD8BrI6EoP6aYVsJhGA6aRa0HfhBgv19RwqgCOI/M6D4WwaoN35Q0Y2gCdbOTLATwfb7of70wk82uHV0W5nsf6zgV0FsjnTgJwl2NyO8R4QhuwrCN+6WL/smwT4StHP4n/l8GWFrWSCOAVoQ+py9EH7bYgFkhgSnAi4omkAZWABKGAW5IAVt/MyvFLbUp8oNsI8NMqScMzMiXDK0VISmQK1QEMldCwro9ZlfMxdIQ3AHTEQBVm4xkl2MsWmAs0J1jo7GQxmy/z7cfOZQEJYBTUknAewrQEc4E0RSizAUuSRKA8WEYCqkuHNB9GqJrY9Ozxo+E+RTlDmBfZMgQnEkcow5txwZYK4EVNemRUG6PC3gCzO5fn4WDY4EU5xAXy8JTiBjEg/AH7ZMAF/JFIbktgZkZrpUeu/R4pHjU1kA43qcTKDrLLqBY4BRwJZra5UEwGfOtYVOlLaorULqiLa9yA6EJpgd7REgxp8AHgFZAN2RMJDi5TE/dfjrOhCRkEvp2ZHVBPOjkGDnDUomRQUIYlOAYX8BHvxSsbtFm2BVBMnauQEDTk2QoyS4IqgEUJMIIIlqsOivmzxKAkeurXlrHQFWBAKoegFRoQRsUBjgF0ARATcHNzkKMAAAbgKEICPPjlrOADk33cDwBvOLx3FFxnNBmyaoUPlH5MMgWpvUGg4FsL8cWpEidAN3A8TqvQC2WngOPOjcAU5EjKkh+yAK4GhQ7UsCkiRQ/3cAvxXIjgG+QQ0biuhhxAMxQ+pEQDsSFLgGQMQETbAA51VeAezLAIdEwk0JEaqfN0YBMRp7AfRYcm9tLDASrN8j2TJCEjHgbK0l4HFa43fjYjwZUf2l1AQABdXI5UKPXQWAmv0IIAnUnxERoMbzJyDCTZELSqBKtVxJWrmElTKB+lXH3UywRjhj685dKTuuKBEgl6XIR+aO8pVzO7vn+lsxFm0jWGyHVbWSzPw1YoAi/v/rwtNFB0uq50O/pQ+ikJt+hqUiI2aqebsSzIr6IrDEX1nqre64pAxB8PlWssGMsBKILV8itp7vJXV/73xPcI9gZkkkZzx7i/BGsHr8CbhFWCWNgkT3hqwc6o8BfwesCE9/pwUJYAlxIcSWjTGwU/goAWslmFMvf2EsCSLYNcX/qIeOIIDbvwqqZX+LELT+FWL4hluCr0UQxH5bwZNuGywpIeDNe9Hs1z9uZImrYyEicgAAAABJRU5ErkJggg=='),(4,'钻石会员',30,388.00,'2020-02-05 17:48:29',0.0000,3,9,1.00,30000.00,100.00,'',0,48,'0','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAAAkCAMAAABBj89wAAAARVBMVEVocJBaYYZvdZRcY4hhaIxqcJBfZor///9mbI2ytcZ9gp++wc+prMDMztr5+frd3uZ0epdTWoGbn7VXXoTq6++PlK1PVn23O75tAAAAAXRSTlNMP4zV3QAABA9JREFUeF51lgeO60gMRN05B6W9/1GXZEeP/KtlQ/AA9VAsU57PR2otuljXNXV86T8U9yi8k6qLb6q7fCV/LfQi7IiDXtMeDriSPwMA6+50pj+eLo/ns/uLd4Ldn17kzzGAVVO8E+oWwTcGAH5H+I3YBqSHebv2BBvkBZj+bM5oL0GTvwDAZRUeQrQIi7Hsx4j+XfNBZybAqXpFA7KK/Cdi75nvCX5GuH5/kxT61wMHZL8JcN41UwKJgH9HOPYSNMbuAyIRYhHeU9o6AITnnfBE/zMB+dOApFUxUglDu/1ew0gA/iob3gDJnM37jLtcCK7SgIRVyZi0+fN0T6W9ho+Wo4PT5PM8VQO0BLf5o7tq2LbL8mTu2yS+MhSTu0z5GpHUo4VEFp4AUYLYFR3qNsWBAsjhgA5Zb0Dhm98ATyvhMWXVQICegGeDFpwApOciqWw8FGAr6oIA4szgb62/IfMgFBMfUkRAxasDRoRgkkARgPI2wBFMAX9GqTU0gOMv3IJqgSLqAAy9E5CqMe4BMUEdrGWr2TwAwPxVHYdwGfCui+45AmKYcg0wE0hiqFSoRbEAhGDFFFgEyVFwU6HpJ5uhE8bkAfCcu9bC7SXzACGiEIIAI4KDyGkIolzBWRmnLA8B1y2bTXluG6cEg2BNBvuSs6EOHG2C2RWPA8JKkt2kbDYpkFJIC8BbyUQQZ4AEITyzrQCAh0rr+QsAmFbujzgAIIFXiscTKvcE2EdEU5LBkFwxDwKdCYxFKMWZxOhBIIOJl9bc/JG3IAQQZgBG0Z85If/AOJ7HA4CBEICFqmgSLZM9ACB0S3ADGJR6AjusDf8GVAI0htSKOtgAVyj2AoBC4UI43SoApwdKCPmxCu17gtMUtQCV85FAarwWQHQAk/oaAH0QQBCimCBB0WRvUR0AH0/AYKwEWgBARbcDrosA0BUHv2Rc83emKIkK+MgghVSVgz5SiR73QA0CAXRbBuggm1La9/5GACPAUhQQwYKRcyGVG/et2CYfizHB3/hRrB1AJa8IATqNtgw31xI4k4daAjuWKpfk4DMAOGJlhw04YOTIhwjQt7lGTx24E5R6AhnvYCX+rDF3R4ERoovn46uV0sqz4Iwek+9w8v5kfVL2XC3AhtBgoLgEDLPcIkDQylIU0UQ9ozdJAwQI9ev3mVd8Vwuw/F//XiDcCvRnTAxEF/2tnaaJIHf1SkD69teEb/6doClD25z5UHoT3gnkjwSC1optgMEg/3eENacJsLJLzyEtQsvU/QdCdwLCX0/WZU8hXiWT+wQ0m2sBBNsSUOaRYethJyBgj7AgBKBC2QSsGiai6VfNM4GaEbr5akGQuv87A0muDPaVgTroBCpsBVj+FGCPwPYMGNvqV4Yp/vkf+t5wv24grt8AAAAASUVORK5CYII=');
/*!40000 ALTER TABLE `xy_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_lixibao`
--

DROP TABLE IF EXISTS `xy_lixibao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_lixibao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `num` decimal(18,5) DEFAULT NULL,
  `addtime` int(10) DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `yuji_num` decimal(18,5) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `is_qu` int(11) DEFAULT '0',
  `shouxu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `real_num` decimal(18,5) DEFAULT '0.00000',
  `is_sy` int(11) DEFAULT '0',
  `uptime` int(10) NOT NULL COMMENT '今天是否发放收益',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_lixibao`
--

LOCK TABLES `xy_lixibao` WRITE;
/*!40000 ALTER TABLE `xy_lixibao` DISABLE KEYS */;
INSERT INTO `xy_lixibao` VALUES (57,53,1000.00000,1594397070,1595088020,2,1,4.20000,2,1,'0',4.20000,1,1595001600),(58,53,1000.00000,1595088361,1595175478,1,0,0.50000,1,0,'10',0.00000,0,1595088000);
/*!40000 ALTER TABLE `xy_lixibao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_lixibao_list`
--

DROP TABLE IF EXISTS `xy_lixibao_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_lixibao_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `bili` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_num` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_num` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` int(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `shouxu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_lixibao_list`
--

LOCK TABLES `xy_lixibao_list` WRITE;
/*!40000 ALTER TABLE `xy_lixibao_list` DISABLE KEYS */;
INSERT INTO `xy_lixibao_list` VALUES (1,'一天体验',1,'0.0005','100','5000',1594139690,1,'0.01'),(2,'七天体验',7,'0.0006','100','10000',1594139698,1,'0.01'),(3,'一个月体验',30,'0.0007','100','25000',1594139705,1,'0.01'),(4,'一年高收益',365,'0.0008','10000','500000',1594139712,1,'0.01');
/*!40000 ALTER TABLE `xy_lixibao_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_member_address`
--

DROP TABLE IF EXISTS `xy_member_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_member_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '收货姓名',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '收货手机',
  `area` varchar(255) NOT NULL COMMENT '地区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址-详情',
  `is_default` tinyint(1) unsigned DEFAULT '0' COMMENT '默认地址',
  `addtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_xy_member_address_uid` (`uid`) USING BTREE,
  KEY `index_xy_member_address_is_default` (`is_default`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='会员收货地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_member_address`
--

LOCK TABLES `xy_member_address` WRITE;
/*!40000 ALTER TABLE `xy_member_address` DISABLE KEYS */;
INSERT INTO `xy_member_address` VALUES (6,46,'测试','888','测试','测试',0,1588178834),(7,49,'1','1','1','1',1,1594013532);
/*!40000 ALTER TABLE `xy_member_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_message`
--

DROP TABLE IF EXISTS `xy_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '接收人ID',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '发送人ID',
  `title` varchar(150) NOT NULL COMMENT '信息标题',
  `content` text NOT NULL COMMENT '正文内容',
  `addtime` int(10) NOT NULL COMMENT '发表时间',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '消息类型 1公告 2通知',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COMMENT='会员-消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_message`
--

LOCK TABLES `xy_message` WRITE;
/*!40000 ALTER TABLE `xy_message` DISABLE KEYS */;
INSERT INTO `xy_message` VALUES (1,0,0,'信息公告测试','<p>信息公告测试</p>',1587883688,3),(2,32,0,'系统通知','充值订单SY2004261528459144已被退回，如有疑问请联系客服',1587886269,2),(3,32,0,'系统通知','充值订单SY2004261528352723已被退回，如有疑问请联系客服',1587886273,2),(4,32,0,'系统通知','充值订单SY2004261528343198已被退回，如有疑问请联系客服',1587886278,2),(5,32,0,'系统通知','交易订单UB2004270923216805已被系统强制付款，如有疑问请联系客服',1587959837,2),(6,32,0,'系统通知','交易订单UB2004271254565452已被系统强制付款，如有疑问请联系客服',1587963845,2),(7,32,0,'系统通知','交易订单UB2004281849144906已被系统强制付款，如有疑问请联系客服',1588071164,2),(8,32,0,'系统通知','充值订单SY2004282134253842已被退回，如有疑问请联系客服',1588080944,2),(9,32,0,'系统通知','充值订单SY2004282132518198已被退回，如有疑问请联系客服',1588080947,2),(10,32,0,'系统通知','充值订单SY2004282132223110已被退回，如有疑问请联系客服',1588080949,2),(11,32,0,'系统通知','充值订单SY2004282132099816已被退回，如有疑问请联系客服',1588080954,2),(12,46,0,'系统通知','交易订单UB2007041327312128已被系统强制取消，如有疑问请联系客服',1593848600,2),(13,46,0,'系统通知','交易订单UB2007041332025185已被系统强制取消，如有疑问请联系客服',1593848627,2),(14,46,0,'系统通知','交易订单UB2007041336142563已被系统强制取消，如有疑问请联系客服',1593848692,2),(16,46,0,'系统通知','交易订单UB2007041425184560审核失败，请重新提交审核',1593943145,2),(17,46,0,'系统通知','交易订单UB2007041425184560已被系统强制取消，如有疑问请联系客服',1593943169,2),(18,46,0,'系统通知','交易订单UB2007041345181519以提交审核信息，请等待系统审核通过',1593943244,2),(19,46,0,'系统通知','交易订单UB2007041345181519以提交审核信息，请等待系统审核通过',1593943319,2),(20,46,0,'系统通知','交易订单UB2007041336142563以提交审核信息，请等待系统审核通过',1593949586,2),(21,46,0,'系统通知','交易订单UB2007052047113850以提交审核信息，请等待系统审核通过',1593953311,2),(22,46,0,'系统通知','交易订单UB2007052051206781以提交审核信息，请等待系统审核通过',1593953503,2),(23,49,0,'系统通知','交易订单UB2007052216237831以提交审核信息，请等待系统审核通过',1593958625,2),(24,49,0,'系统通知','交易订单UB2007052219389102以提交审核信息，请等待系统审核通过',1593958808,2),(25,49,0,'系统通知','交易订单UB2007052224506693以提交审核信息，请等待系统审核通过',1593959125,2),(26,48,0,'系统通知','交易订单UB2007052252562172以提交审核信息，请等待系统审核通过',1593969839,2),(27,48,0,'系统通知','充值订单SY2007060214301612已被退回，如有疑问请联系客服',1594000019,2),(28,48,0,'系统通知','交易订单UB2007061429179230已被系统强制取消，如有疑问请联系客服',1594017016,2),(29,49,0,'系统通知','交易订单UB2007061414522078已被系统强制取消，如有疑问请联系客服',1594017077,2),(30,49,0,'系统通知','交易订单UB2007061412411229以提交审核信息，请等待系统审核通过',1594017118,2),(31,49,0,'系统通知','交易订单UB2007061412411229审核失败，请重新提交审核',1594017136,2),(32,49,0,'系统通知','交易订单UB2007061412411229以提交审核信息，请等待系统审核通过',1594017160,2),(33,49,0,'系统通知','交易订单UB2007061438182125以提交审核信息，请等待系统审核通过',1594021025,2),(34,46,0,'系统通知','交易订单UB2007061940142024以提交审核信息，请等待系统审核通过',1594038138,2),(35,46,0,'系统通知','交易订单UB2007061941578642已被系统强制取消，如有疑问请联系客服',1594038432,2),(36,46,0,'系统通知','充值订单SY2007071137346061已被退回，如有疑问请联系客服',1594093145,2),(37,46,0,'系统通知','充值订单SY2007071136262354已被退回，如有疑问请联系客服',1594093149,2),(38,54,0,'系统通知','交易订单UB2007080051561081以提交审核信息，请等待系统审核通过',1594140767,2),(39,53,0,'系统通知','交易订单UB2007080028161812以提交审核信息，请等待系统审核通过',1594310503,2),(40,53,0,'系统通知','交易订单UB2007070000582636以提交审核信息，请等待系统审核通过',1594052027,2),(41,53,0,'系统通知','交易订单UB2007110048338472以提交审核信息，请等待系统审核通过',1594052411,2);
/*!40000 ALTER TABLE `xy_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_msg`
--

DROP TABLE IF EXISTS `xy_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '文本内容',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1平台公告 2平台简介 3抢单规则 4代理合作 5常见问题',
  `addtime` int(10) NOT NULL COMMENT '发表时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0发布 1不发布',
  `author` varchar(10) NOT NULL DEFAULT '' COMMENT '作者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_msg`
--

LOCK TABLES `xy_msg` WRITE;
/*!40000 ALTER TABLE `xy_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `xy_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_pay`
--

DROP TABLE IF EXISTS `xy_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min` double(18,2) DEFAULT NULL,
  `max` double(18,2) DEFAULT NULL,
  `ewm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_pay`
--

LOCK TABLES `xy_pay` WRITE;
/*!40000 ALTER TABLE `xy_pay` DISABLE KEYS */;
INSERT INTO `xy_pay` VALUES (1,'支付宝快捷支付','zfb','/public/img/alipay.png',0.01,10000.00,'/upload/c7f81bfdb4910aae/b4b03d17d0fb2d6e.jpg',1,'/index/ctrl/recharge2?type=zfb'),(2,'微信快捷支付','wx','/public/img/wx.png',0.01,10000.00,'http://1.yuhantest.xyz/upload/0cebbd8c52643d0c/036ea484f2c59655.png',1,'/index/ctrl/recharge2?type=wx'),(3,'银行卡转账','card','/public/img/card.png',102.00,10000.00,'',1,'/index/ctrl/recharge'),(4,'比特币支付','bipay','https://cdn.fwtqo.cn/static/web/assets/img/logo/weblogo4x.png',0.01,10000.00,NULL,0,'/index/ctrl/recharge2?type=bipay'),(5,'paysapi支付','paysapi','https://cdn.bearsoftware.net.cn/paysapi/images/logo_red.png',0.01,10000.00,'http://qd.cn/upload/c03e6f88a46358db/0f716faa5667ee36.png',0,'/index/ctrl/recharge2?type=paysapi'),(6,'woai支付','woaipay','/public/img/card.png',0.01,10000.00,NULL,0,'/index/ctrl/recharge_woaipay');
/*!40000 ALTER TABLE `xy_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_reads`
--

DROP TABLE IF EXISTS `xy_reads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_reads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '消息ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '读取时间',
  PRIMARY KEY (`id`),
  KEY `mid-uid` (`mid`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='会员-消息读取记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_reads`
--

LOCK TABLES `xy_reads` WRITE;
/*!40000 ALTER TABLE `xy_reads` DISABLE KEYS */;
INSERT INTO `xy_reads` VALUES (1,30,1,1582140346);
/*!40000 ALTER TABLE `xy_reads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_recharge`
--

DROP TABLE IF EXISTS `xy_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_recharge` (
  `id` char(18) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `real_name` varchar(15) NOT NULL DEFAULT '' COMMENT '充值姓名',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `num` decimal(12,2) NOT NULL COMMENT '充值金额',
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '支付方式 1微信 2支付宝 3qq',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '打款凭证',
  `addtime` int(10) NOT NULL COMMENT '下单时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '订单状态 1下单成功 2充值成功 3充值失败',
  `pay_name` varchar(255) DEFAULT NULL,
  `is_vip` int(11) DEFAULT '0',
  `level` int(11) DEFAULT NULL,
  `pay_type` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='会员-充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_recharge`
--

LOCK TABLES `xy_recharge` WRITE;
/*!40000 ALTER TABLE `xy_recharge` DISABLE KEYS */;
INSERT INTO `xy_recharge` VALUES ('SY2005011338241861',46,'宇瀚演示','17628142235',88.00,1,'',1588311504,1588311505,2,'999',1,1,NULL),('SY2007052203252294',48,'我看258','18276881118',100.68,1,'/upload/xy/2020/07-05/20200705220325-2724952.jpeg',1593957805,1593957847,2,'zfb',0,NULL,NULL),('SY2007052210298788',49,'做违666','17773594218',300.24,1,'/upload/xy/2020/07-05/20200705221029-8554971.png',1593958229,1593958352,2,'zfb',0,NULL,NULL),('SY2007060214301612',48,'我看258','18276881118',88.00,1,'',1593972870,1594000019,3,'2',1,1,NULL),('SY2007060215017324',48,'我看258','18276881118',188.00,1,'',1593972901,1593972901,2,'999',1,2,NULL),('SY2007061120324886',49,'做违666','17773594218',388.00,1,'',1594005632,1594005632,2,'999',1,3,NULL),('SY2007061613483088',49,'做违666','17773594218',5000.93,1,'/upload/xy/2020/07-06/20200706161348-1324682.jpeg',1594023228,1594023238,2,'zfb',0,NULL,NULL),('SY2007071040232991',46,'宇瀚演示','17628142235',100.62,1,'/upload/xy/2020/07-07/20200707104023-7723204.jpeg',1594089623,1594089637,2,'zfb',0,NULL,NULL),('SY2007071136262354',46,'宇瀚演示','17628142235',100.85,1,'/upload/xy/2020/07-07/20200707113626-4420667.jpeg',1594092986,1594093149,3,'zfb',0,NULL,NULL),('SY2007071137346061',46,'宇瀚演示','17628142235',100.63,1,'/upload/xy/2020/07-07/20200707113734-3932086.jpeg',1594093054,1594093145,3,'wx',0,NULL,NULL),('SY2007071357411928',46,'一桶金','18888888888',100.64,1,'/upload/xy/2020/07-07/20200707135741-914958.png',1594101461,1594102155,2,'wx',0,NULL,NULL),('SY2007080002314997',48,'好的很','18276881118',388.00,1,'',1594137751,1594137790,2,'1',1,3,NULL),('SY2007080016256288',52,'main','17773594218',9999.20,1,'/upload/xy/2020/07-08/20200708001625-1011453.jpeg',1594138585,1594138668,2,'zfb',0,NULL,NULL),('SY2007080049061226',55,'哥哥额额','18096145913',5000.63,1,'/upload/xy/2020/07-08/20200708004906-4556486.jpeg',1594140546,1594140589,2,'card',0,NULL,NULL),('SY2007080054194805',54,'13222222222','13222222222',88.00,1,'',1594140859,1594140859,2,'999',1,1,NULL),('SY2007080054554952',54,'13222222222','13222222222',188.00,1,'',1594140895,1594140895,2,'999',1,2,NULL),('SY2007080055006374',54,'13222222222','13222222222',388.00,1,'',1594140900,1594140900,2,'999',1,3,NULL);
/*!40000 ALTER TABLE `xy_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_reward_log`
--

DROP TABLE IF EXISTS `xy_reward_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_reward_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` char(18) NOT NULL COMMENT '订单号',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产生交易用户',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交易对象',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '交易数额',
  `lv` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '级差',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '订单类型 1充值订单(推广返佣) 2交易订单(交易返佣)',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '佣金发放状态 0自动发放 1未发放 2已发放',
  `addtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '处理时间',
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COMMENT='订单佣金发放记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_reward_log`
--

LOCK TABLES `xy_reward_log` WRITE;
/*!40000 ALTER TABLE `xy_reward_log` DISABLE KEYS */;
INSERT INTO `xy_reward_log` VALUES (1,'UB2003300159471543',20,0,45.40,0,2,0,1585504826,0),(112,'UB2007080051561081',54,0,99.00,0,2,0,1594140815,0);
/*!40000 ALTER TABLE `xy_reward_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_script`
--

DROP TABLE IF EXISTS `xy_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_script` (
  `script` text NOT NULL COMMENT '代码块',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_script`
--

LOCK TABLES `xy_script` WRITE;
/*!40000 ALTER TABLE `xy_script` DISABLE KEYS */;
INSERT INTO `xy_script` VALUES ('',1);
/*!40000 ALTER TABLE `xy_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_shop_goods_cate`
--

DROP TABLE IF EXISTS `xy_shop_goods_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_shop_goods_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商店名称',
  `bili` varchar(255) NOT NULL COMMENT '商品名称',
  `cate_info` varchar(255) DEFAULT '' COMMENT '商品描述',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `cate_pic` varchar(120) DEFAULT '' COMMENT '商品展示图片',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `status` int(1) DEFAULT '0' COMMENT '上架状态 0不上架 1上架',
  `min` varchar(255) DEFAULT NULL COMMENT '最小金额限制',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_shop_goods_cate`
--

LOCK TABLES `xy_shop_goods_cate` WRITE;
/*!40000 ALTER TABLE `xy_shop_goods_cate` DISABLE KEYS */;
INSERT INTO `xy_shop_goods_cate` VALUES (1,'服装','0.002','顶顶顶顶',NULL,'http://qd2.cn/upload/4201872b7132c82b/9d3e81fb395d46ff.png',1583381116,0,''),(2,'汽车','0','京东',NULL,'http://qd2.cn/upload/4201872b7132c82b/9d3e81fb395d46ff.png',1583381331,0,''),(3,'零食','0','唯品会专区',NULL,'/statics/img/w.svg',1583409871,0,''),(166,'美妆','0','美妆',NULL,'',1583409885,0,''),(4,'装饰品','0','111',NULL,'http://qd2.cn/upload/4201872b7132c82b/9d3e81fb395d46ff.png',1583381309,0,'');
/*!40000 ALTER TABLE `xy_shop_goods_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_shop_goods_list`
--

DROP TABLE IF EXISTS `xy_shop_goods_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_shop_goods_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) NOT NULL COMMENT '商店名称',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `goods_info` varchar(5000) DEFAULT '' COMMENT '商品描述',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_pic` varchar(120) DEFAULT '' COMMENT '商品展示图片',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '上架状态 0不上架 1上架',
  `cid` int(11) DEFAULT '1',
  `is_tj` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_shop_goods_list`
--

LOCK TABLES `xy_shop_goods_list` WRITE;
/*!40000 ALTER TABLE `xy_shop_goods_list` DISABLE KEYS */;
INSERT INTO `xy_shop_goods_list` VALUES (1,'信酷小米专营店','小米/MIUI','<div style=\"width: 100%;text-align: center\"><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/a5DD5WWZwEdT5mZ5dlDi6cttvO6ttidO.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/xtwBtwyzvzwbtj67q0yyyGGTU0U7ttT7.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/aBnF546904l2jfNNv6333926JLe023q3.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/jEKScyUUGyUEaHvhGCX0VVCHQLakvYAI.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/n0HHNe2W0r22H1WEnsS7jCScws2A1sn2.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/V1sFA4X8U6e1MIU44u8fS1u246i88UFM.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/RI11mTdzSRMWOqS68t26d11R1R3jtSto.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/GEn9IIwNfFI9niU6DPZ9npUV6n66FVnI.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/ZgqMP7iIG5SmA5t5qr5WgTz5miPSmB46.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/Bl0YhM95Q9ap1zB5fpF9PZpy9Bp5yyRA.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/xTtA0bmBhaERfSuEdax8bmBtADFxhNn0.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/I8h3ChhD44C2Ed82D2RFeECrO8chr4C2.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/YOFKzjhCdHCduBD8hR9F6EBUeRUh8eHD.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/Mu8HDkr8UCm7h2auDzxjAAkxkKyK80zz.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/pe0wjlww3WZasWllfGKqea02gRusNZ8w.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/d1aWewWIBYBd41BZYy91wyWdO54PP2zA.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/wE6tY2bBef9JFTya3FZz5ROn65PB99Bb.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/AJS9m33GKgGNG9ehAaaMA60JMWeA7he0.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/Ed2w42xIwa9I3OM3zP5i99I98Isx6D9I.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/IP6HzhnZdn8Zt09nLfzduLX8H0X6iXcD.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/IsQ02d5zAZwqqwdWyQPaQnT5Wu05gMsQ.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/M4855SkJn5Nv67c76AmMkJKm5dnj5aKV.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/dYZ4a5BgsjoAsTBt8Q5BSvs7ovJSs7u7.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/izT2DgGND24d744Lg9HDELlnd9L2D8EQ.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/TVWHzwWwwW12WvWE1abFzXHs21epvw9z.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/V35V03d5z5Q2vIVm7QQVi7I8wv2Zw7qo.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/j16T1tje6HGFjfq3q1zf15V113zt55GQ.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/bEHXWUDA2SrsCUhXEYwDWXEYux5kXc5E.jpg\" /><img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/f2870u4uFBUJj0E8SIope5U0Sn4a6Psb.jpg\" /> <img data-lazyloaded=\"true\" src=\"https://wx.hi.cn/attachment/images/3/2019/12/FYmTqmlD0Dgv7RyhEDLtdgGleQ07Vr40.png\" /></div>',1.00,'/upload/goods_img/大家电/5db3b89a8d174.jpg',1583402400,0,2,1),(2,'邮乐安阳馆','【汤阴县积分用户专享】洗衣机XpB—126-9896S','',1.00,'/upload/goods_img/大家电/5db3b89a9f288.jpg',1578206762,0,1,1),(3,'海信电器旗舰店','海信（Hisense）HZ39E35A 39英寸高清手机交互 轻薄金属 WIFI人工智能液晶电视机','',1.00,'/upload/goods_img/大家电/5db3b89ab61bd.jpg',1572059510,0,1,NULL),(4,'邮滋味如皋馆专柜','创维9公斤变频滚筒洗衣机  型号：F9015NC-炫金   如皋免费送货上门，南通包邮，华东地区配货','创维洗衣机，安全健康专家，免费上门安装，绝对优惠，每月线下更有现场特惠活动',1.00,'/upload/goods_img/大家电/5db3b89b52437.jpg',1572059510,0,1,NULL),(5,'邮滋味如皋馆专柜','创维2P定频立式柜机，型号：KFR-50LW/F2DA1A-3（限如皋地区免费送货上门安装）','创维定频空调，免费上门安装，绝对优惠，每月更有现场特惠活动',4.00,'/upload/goods_img/大家电/5db3b89b6e95e.jpg',1572059510,0,1,NULL),(6,'创维电视官方旗舰店','创维/SKYWORTH 58H8M 58英寸4K超高清全面屏防蓝光人工智能语音HDR超薄网络液晶电视','4K超高清，声像自然，一场声觉革新，视觉体验，光学防蓝光，护眼不偏色',3.00,'/upload/goods_img/大家电/5db3b89b79d10.jpg',1572059510,0,1,NULL),(7,'邮乐洛阳','【洛阳金融积分兑换】TCL 205升 三门电冰箱 （星空银） BC（邮政网点配送）','',1.00,'/upload/goods_img/大家电/5db3b89bc11c1.jpg',1572059510,0,1,NULL),(8,'邮滋味如皋馆专柜','创维9公斤全自动波轮洗衣机，型号XQB90-52BAS淡雅银如皋免费送货上门，南通包邮，华东地区配送','创维家电大品牌，安全可靠，夏季特惠；每月现场有特惠活动',1.00,'/upload/goods_img/大家电/5db3b89bcfc24.jpg',1572059510,0,1,NULL),(9,'信阳邮约会','【限信阳地区积分兑换专用，不对外销售】家用洗衣机，图片仅供参考','',1.00,'/upload/goods_img/大家电/5db3b89be0d98.jpg',1572059510,0,1,NULL),(10,'邮乐安阳馆','【滑县积分用户专享】创维电器洗衣机9公斤波轮安阳','',1.00,'/upload/goods_img/大家电/5db3b89bee474.jpg',1572059510,0,1,NULL),(11,'邮乐安阳馆','美菱3开门冰箱BCD-209M3CX【汤阴县积分兑换专用，其他下单不发货】','',1.00,'/upload/goods_img/大家电/5db3b89c06586.jpg',1572059510,0,1,NULL),(12,'邮乐安阳馆','美菱电冰箱209L3CS【安阳县积分兑换用户专用，其他地区发】','',1.00,'/upload/goods_img/大家电/5db3b89c16f2a.jpg',1572059510,0,1,NULL),(13,'信阳邮约会','【限信阳地区积分兑换专用，不对外销售】自动洗衣机 家用洗衣机，图片仅供参考','',2.00,'/upload/goods_img/大家电/5db3b89c22e95.jpg',1572059510,0,1,NULL),(14,'邮乐安阳馆','【滑县积分用户专享】创维电器电视50寸4K智能安阳','',3.00,'/upload/goods_img/大家电/5db3b89c2bb37.jpg',1572059510,0,1,NULL),(15,'邮乐安阳馆','【安阳县积分用户专享】长虹液晶电视55U1','',3.00,'/upload/goods_img/大家电/5db3b89f48109.jpg',1572059510,0,1,NULL),(16,'海信电器旗舰店','海信（Hisense）HZ32E30D 32英寸蓝光高清平板液晶电视机 酒店宾馆卧室推荐','【海信今日限时特惠-到手价788元！】限量200台！抢完即止！',749.00,'/upload/goods_img/大家电/5db3b89f51194.jpg',1572059510,0,1,NULL),(17,'邮滋味如皋馆专柜','邮乐特卖：庭美家用消毒柜    型号：YTP-280    如皋免费送货上门，南通包邮，华东地区配送','庭美消毒柜，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238',755.00,'/upload/goods_img/大家电/5db3b89f5ec57.jpg',1572059510,0,1,NULL),(18,'吉舜诚商城专柜','飞利浦（PHILIPS）  19英寸液晶电视机 显示器两用 hdmi高清接口','19PFF2650',799.00,'/upload/goods_img/大家电/5db3b89fb14ba.jpg',1572059510,0,1,NULL),(19,'创维集团官方旗舰店','创维/SKYWORTH 32X3 32英寸窄边非智能老人机蓝光高清节能LED平板液晶电视机工程机','蓝光高清，经典窄边，节能液晶，简单好用，谁用谁知道，实用耐用款',799.00,'/upload/goods_img/大家电/5db3b89fc8fa8.jpg',1572059510,0,1,NULL),(20,'吉舜诚商城专柜','飞利浦（PHILIPS）22英寸LED高清液晶平板电视机含底座 黑色','22PFF2650/T3',899.00,'/upload/goods_img/大家电/5db3b89fd917b.jpg',1572059510,0,1,NULL),(21,'创维集团官方旗舰店','创维/SKYWORTH 32X6 32英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机','超值钜惠，高清智能电视，WIFI，酷开系统，10核处理器',899.00,'/upload/goods_img/大家电/5db3b89fe6086.jpg',1572059510,0,1,NULL),(22,'海信电器旗舰店','海信 (Hisense) HZ32E35A 32英寸AI智能WIFI 轻薄金属 卧室神器高清电视机','',899.00,'/upload/goods_img/大家电/5db3b8a0004c2.jpg',1572059510,0,1,NULL),(23,'邮滋味如皋馆专柜','创维邮乐特卖： 32寸液晶电视机，型号：32E381S   如皋免费送货上门，南通包邮，华东地区配货','创维液晶电视大品牌，夏季特惠；每月现场有特惠活动',899.00,'/upload/goods_img/大家电/5db3b8a01be30.jpg',1572059510,0,1,NULL),(24,'琥麟电器专柜','海信 XQB60-H3568 6公斤全自动波轮洗衣机','',749.00,'/upload/goods_img/大家电/5db3b8a0279b3.jpg',1572059510,0,1,NULL),(25,'邮滋味如皋馆专柜','创维7公斤全自动波轮洗衣机，型号：XQB70-21C淡雅银，如皋免费送货上门，南通包邮，华东地区配送','创维家电大品牌，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238',928.00,'/upload/goods_img/大家电/5db3b8a0367fe.jpg',1572059510,0,1,NULL),(26,'邮滋味如皋馆专柜','创维单冷冰柜，型号：BD/C-160雅白，如皋地区免费送货上门安装，南通地区包邮，华东地区配货','创维冰柜，安全健康专家，免费上门安装，绝对优惠，每月线下更有现场特惠活动',999.00,'/upload/goods_img/大家电/5db3b8a042f39.jpg',1572059510,0,1,NULL),(27,'创维集团官方旗舰店','创维（SKYWORTH）32H5 32英寸高清HDR 护眼全面屏 AI人工智能语音 网络WIFI 卧','高清HDR 护眼全面屏 AI人工智能语音 网络WIFI',999.00,'/upload/goods_img/大家电/5db3b8a0511cd.jpg',1572059510,0,1,NULL),(28,'邮滋味如皋馆专柜','创维/SKYWORTH热水器，型号：DSZF-D5501-80，如皋免费送货上门，南通包邮 创维/','创维家电大品牌，安全可靠，邮乐特惠；每月现场有特惠活动——18862731238',999.00,'/upload/goods_img/大家电/5db3b8a07389d.jpg',1572059510,0,1,NULL),(29,'琥麟电器专柜','Hisense/海信 HB80DA332G8KG公斤大容量家用全自动节能波轮洗衣机','',899.00,'/upload/goods_img/大家电/5db3b8a386615.jpg',1572059510,0,1,NULL),(30,'琥麟电器专柜','海信 BCD-163N/B 冰柜冷藏冷冻双温家用商用小型卧式','',999.00,'/upload/goods_img/大家电/5db3b8a390a27.jpg',1572059510,0,1,NULL),(31,'吉舜诚商城专柜','东芝（TOSHIBA）  32英寸 蓝光液晶电视 高清平板电视机 东芝电视机','32L1500C',1.00,'/upload/goods_img/大家电/5db3b8a69aafd.jpg',1572059510,0,1,NULL),(32,'创维集团官方旗舰店','创维/SKYWORTH 40X6 40英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机','超值钜惠！高清智能，10核处理器，可以WIFI上网',1.00,'/upload/goods_img/大家电/5db3b8a9a6b14.jpg',1572059510,0,1,NULL),(33,'甲子商城旗舰店','康佳/KONKA  LED39E330C 39英寸卧室电视高清蓝光节能平板液晶电视','',949.00,'/upload/goods_img/大家电/5db3b8a9b22ae.jpg',1572059510,0,1,NULL),(34,'邮乐赣州馆','【不支持邮乐卡支付】创维-彩电-40E1C 40英寸全高清HDR 护眼全面屏 AI人工智能语音','',1.00,'/upload/goods_img/大家电/5db3b8a9cf38d.jpg',1572059510,0,1,NULL),(35,'琥麟电器专柜','海信 BCD-177F/Q 177升 双门冰箱','',1.00,'/upload/goods_img/大家电/5db3b8a9f0abd.jpg',1572059510,0,1,NULL),(36,'创维集团官方旗舰店','创维/SKYWORTH 43X6 43英寸10核窄边高清 人工智能 网络WIFI 卧室液晶平板电视机','【买电视选创维】高清智能，10核处理器，质量上乘，价格厚道，可以Wifi上网',1.00,'/upload/goods_img/大家电/5db3b8aa1b4b4.jpg',1572059510,0,1,NULL),(37,'创维集团官方旗舰店','创维（SKYWORTH）40H5 40英寸全高清HDR 护眼全面屏 AI人工智能语音 网络WIFI','全高清HDR 护眼全面屏 AI人工智能语音',1.00,'/upload/goods_img/大家电/5db3b8aa26c4f.jpg',1572059510,0,1,NULL),(38,'邮乐安阳馆','市区积分用户专享】创维平板电视32X6','',1.00,'/upload/goods_img/大家电/5db3b8aa31c19.jpg',1572059510,0,1,NULL),(39,'吉舜诚商城专柜','飞利浦（PHILIPS）32英寸新品高清LED电视 接口丰富窄边高清LED液晶平板电视机','32PHF3282/T3',1.00,'/upload/goods_img/大家电/5db3b8aa3b85c.jpg',1572059510,0,1,NULL),(40,'琥麟电器专柜','海信 BD/BC-308NU/A 冰柜家用 顶开式卧式商用冷藏冷冻柜','',1.00,'/upload/goods_img/大家电/5db3b8aa4931f.jpg',1572059510,0,1,NULL),(41,'明凰服饰专营店','男女冲锋衣工装棉服外套修身加厚款','邮乐支持微信，支付宝，网银，邮储卡和银联卡支付。（不同商品请分开下单）',85.00,'/upload/goods_img/户外服饰/5db3b8b22c022.jpg',1572059516,0,1,NULL),(42,'户外途量工厂专卖店','春夏季运动风衣钓鱼防晒衣男女超薄透气皮肤衣防风外套户外速干潮流衣服情侣款皮肤衣','大码骑行长袖',29.90,'/upload/goods_img/户外服饰/5db3b8b23604c.jpg',1572059516,0,1,NULL),(43,'探路者正江专卖店','探路者/TOREAD 冲锋裤 运动裤 秋冬户外软壳裤男透气防风保暖徒步裤KAMG91159','',428.00,'/upload/goods_img/户外服饰/5db3b8b25312b.jpg',1572059516,0,1,NULL),(44,'探路者正江专卖店','探路者运动服 探路者冲锋衣 19秋冬户外女式防水透湿套绒冲锋衣TAWH92285','',839.00,'/upload/goods_img/户外服饰/5db3b8b25d925.jpg',1572059516,0,1,NULL),(45,'好看哒专营店','防晒衣女中长款薄款防晒服','FSY-6387',45.00,'/upload/goods_img/户外服饰/5db3b8b56628b.jpg',1572059516,0,1,NULL),(46,'宝仕母婴专营店专柜','L户外皮肤衣防紫外线防晒衣男女夏季超薄透气防晒服运动风衣','',75.00,'/upload/goods_img/户外服饰/5db3b8b573966.jpg',1572059516,0,1,NULL),(47,'好看哒专营店','防晒衣女夏季新款韩版连帽系带长袖防晒衣糖果色沙滩户外披肩防晒衣','FSY-54',19.90,'/upload/goods_img/户外服饰/5db3b8b88f380.jpg',1572059516,0,1,NULL),(48,'户外途量工厂专卖店','户外速干T恤男 女休闲跑步运动健身短袖大码情侣快干衣排汗透气','',22.80,'/upload/goods_img/户外服饰/5db3b8b8abc8f.jpg',1572059516,0,1,NULL),(49,'好看哒专营店','防晒衣 户外薄款防紫外线印花防晒衣','FSY-1736',25.00,'/upload/goods_img/户外服饰/5db3b8b8c0c84.jpg',1572059516,0,1,NULL),(50,'好看哒专营店','防晒衣夏季女蝙蝠袖连帽拉链短款防晒衣','FSY-5423',35.00,'/upload/goods_img/户外服饰/5db3b8b9b16a1.jpg',1572059516,0,1,NULL),(51,'好看哒专营店','防晒衣男士薄款纯色连帽防晒衣','FSY-4167',35.00,'/upload/goods_img/户外服饰/5db3b8b9bbe9c.jpg',1572059516,0,1,NULL),(52,'户外途量工厂专卖店','城徒 户外春夏单层冲锋衣女防晒衣男轻薄防风钓鱼服透气速干外套长袖衫','',35.80,'/upload/goods_img/户外服饰/5db3b8ba1b847.jpg',1572059516,0,1,NULL),(53,'好看哒专营店','防晒衣韩版短款薄款连帽长袖防晒衣','FSY-5439',36.00,'/upload/goods_img/户外服饰/5db3b8ba72314.jpg',1572059516,0,1,NULL),(54,'好看哒专营店','防晒衣女中长款涂鸦薄款防晒衣','FSY-5282',36.00,'/upload/goods_img/户外服饰/5db3b8ba99fd5.jpg',1572059516,0,1,NULL),(55,'好看哒专营店','防晒衣女中长款薄款防晒衣','FSY-5456',37.90,'/upload/goods_img/户外服饰/5db3b8baa8e20.jpg',1572059516,0,1,NULL),(56,'户外途量工厂专卖店','秋冬户外男抓绒衣摇粒绒女外套保暖冲锋衣内胆开衫卫衣','',39.00,'/upload/goods_img/户外服饰/5db3b8bab267b.jpg',1572059516,0,1,NULL),(57,'户外途量工厂专卖店','户外秋冬季加绒加厚抓绒衣男女摇粒绒保暖抓绒外套开衫冲锋衣内胆','',49.00,'/upload/goods_img/户外服饰/5db3b8bae0cb5.jpg',1572059516,0,1,NULL),(58,'江门新会馆','【江门新会馆】caxa断码 两截速干裤女 韩版修身透气徒步快干裤野外登山跑步长裤','',50.00,'/upload/goods_img/户外服饰/5db3b8baf06b9.jpg',1572059516,0,1,NULL),(59,'宝仕母婴专营店专柜','L夏季休闲短裤男宽松5分中裤子男士运动五分裤大码跑步速干沙滩裤','',55.00,'/upload/goods_img/户外服饰/5db3b8bb2ba54.jpg',1572059516,0,1,NULL),(60,'江门新会馆','【江门新会馆】caxa修身户外健身速干裤女 快干弹力透气登山大码长裤 弹力户外裤','',60.00,'/upload/goods_img/户外服饰/5db3b8bb513ed.jpg',1572059516,0,1,NULL),(61,'探路者正江专卖店','探路者/TOREADt恤女户外夏季快干速干透气运动服TAJG82984','',61.00,'/upload/goods_img/户外服饰/5db3b8bb5ac47.jpg',1572059516,0,1,NULL),(62,'铁好家居美妆日用百货专营店','佳钓尼 夏遮阳防晒帽套头面罩透气防紫外线渔夫帽','',48.00,'/upload/goods_img/户外服饰/5db3b8bb8e0a3.jpg',1572059516,0,1,NULL),(63,'宝仕母婴专营店专柜','防晒衣男女情侣春夏季防雨风衣超薄透气速干钓鱼防晒服户外皮肤衣MN','',69.00,'/upload/goods_img/户外服饰/5db3b8bb9f9e7.jpg',1572059516,0,1,NULL),(64,'户外途量工厂专卖店','城徒 春夏季速干裤男女大码轻薄快干透气户外修身显瘦弹力冲锋裤','',69.00,'/upload/goods_img/户外服饰/5db3b8bbb3e24.jpg',1572059516,0,1,NULL),(65,'宝仕母婴专营店专柜','L运动户外夏季速干t恤 男女短袖速干衣快干t恤 吸汗透气','',69.00,'/upload/goods_img/户外服饰/5db3b8bbe33ff.jpg',1572059516,0,1,NULL),(66,'宝仕母婴专营店专柜','L健身房教练速干T恤男女 圆领情侣夏季短袖汗衫','',69.00,'/upload/goods_img/户外服饰/5db3b8bc1bca2.jpg',1572059516,0,1,NULL),(67,'户外途量工厂专卖店','城徒 冬季正品户外冲锋裤男女抓绒裤保暖防风防水加厚软壳裤登山裤长裤','',75.00,'/upload/goods_img/户外服饰/5db3b8bc42dab.jpg',1572059516,0,1,NULL),(68,'江门新会馆','【江门新会馆】caxa修身弹力女款休闲棉裤 户外休闲快干长裤 女士跑步登山健身裤','',78.00,'/upload/goods_img/户外服饰/5db3b8bc96997.jpg',1572059516,0,1,NULL);
/*!40000 ALTER TABLE `xy_shop_goods_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_shop_order`
--

DROP TABLE IF EXISTS `xy_shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_shop_order` (
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL COMMENT '商品id',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `price` decimal(15,3) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '上架状态 0不上架 1上架',
  `num` int(11) DEFAULT NULL,
  `price2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` char(18) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_shop_order`
--

LOCK TABLES `xy_shop_order` WRITE;
/*!40000 ALTER TABLE `xy_shop_order` DISABLE KEYS */;
INSERT INTO `xy_shop_order` VALUES (20,2,1583407009,1.000,1,1,'1','SP2003052017163927'),(19,1,1583410636,1.000,1,2,'2','SP2003052017163987'),(20,1,1585453110,1.000,1,1,'1','SP2003291138308901'),(20,2,1585453251,1.000,1,1,'1','SP2003291140513132'),(20,2,1585453282,1.000,2,1,'1','SP2003291141221124'),(46,1,1593957116,1.000,1,1,'1','SP2007052151562923'),(48,1,1594022384,1.000,1,1,'1','SP2007061559442372'),(49,1,1594022468,1.000,1,9,'9','SP2007061601085034'),(49,2,1594022552,1.000,1,12,'12','SP2007061602328255'),(48,1,1594022817,1.000,1,1,'1','SP2007061606572129');
/*!40000 ALTER TABLE `xy_shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_user_error`
--

DROP TABLE IF EXISTS `xy_user_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_user_error` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `addtime` int(11) NOT NULL COMMENT '记录时间',
  `oid` char(18) DEFAULT '' COMMENT '交易单号',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型 1解封 2违规操作 3冻结',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='会员-违规操作记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_user_error`
--

LOCK TABLES `xy_user_error` WRITE;
/*!40000 ALTER TABLE `xy_user_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `xy_user_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_users`
--

DROP TABLE IF EXISTS `xy_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `username` varchar(36) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(36) NOT NULL DEFAULT '' COMMENT '昵称',
  `pwd` char(40) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(16) NOT NULL DEFAULT '' COMMENT '密码盐',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `signiture` varchar(120) NOT NULL DEFAULT '' COMMENT '个性签名',
  `pwd_error_num` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '密码错误次数',
  `allow_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '允许登录时间',
  `real_name` varchar(36) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `id_card_num` char(18) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `top_pic` varchar(96) NOT NULL DEFAULT '' COMMENT '身份证正面图',
  `bot_pic` varchar(96) NOT NULL DEFAULT '' COMMENT '身份证背面图',
  `id_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证状态，0未审核，1审核通过，2审核不通过',
  `invite_code` char(6) NOT NULL DEFAULT '' COMMENT '邀请码',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1启用，2禁用',
  `real_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实名时间',
  `pwd2` char(40) NOT NULL DEFAULT '' COMMENT '提现密码',
  `salt2` char(16) NOT NULL DEFAULT '' COMMENT '提现密码盐',
  `headpic` varchar(3000) NOT NULL DEFAULT '' COMMENT '头像',
  `balance` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `freeze_balance` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '账号冻结金额',
  `login_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否登录状态，1：是，0否',
  `recharge_num` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '日充值金额',
  `deposit_num` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '日提现金额',
  `deal_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '交易状态，0交易冻结，1停止交易，2等待交易，3交易中',
  `deal_error` tinyint(1) NOT NULL DEFAULT '0' COMMENT '违规次数',
  `deal_reward_count` int(11) NOT NULL DEFAULT '0' COMMENT '奖励交易次数',
  `deal_count` int(4) NOT NULL DEFAULT '0' COMMENT '当日交易次数',
  `deal_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后交易日期(年月日)',
  `active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '激活状态，0未激活(首次充值发放推广奖励)，1已激活',
  `childs` int(11) NOT NULL DEFAULT '0' COMMENT '直推用户数量',
  `kouchu_balance` decimal(15,2) DEFAULT NULL COMMENT '扣除金额',
  `kouchu_balance_uid` int(11) DEFAULT NULL,
  `show_td` int(11) DEFAULT '1',
  `show_cz` int(11) DEFAULT '1',
  `show_tx` int(11) DEFAULT '1',
  `show_tel` int(11) DEFAULT '1',
  `show_num` int(11) DEFAULT '1',
  `show_tel2` int(11) DEFAULT '1',
  `wx_ewm` varchar(255) DEFAULT NULL,
  `zfb_ewm` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `lixibao_balance` decimal(15,4) DEFAULT '0.0000' COMMENT '利息宝金额',
  `lixibao_dj_balance` decimal(15,4) DEFAULT '0.0000' COMMENT '利息宝冻结金额',
  `ip` varchar(128) DEFAULT NULL,
  `is_jia` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel` (`tel`),
  UNIQUE KEY `invite_code` (`invite_code`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COMMENT='会员-用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_users`
--

LOCK TABLES `xy_users` WRITE;
/*!40000 ALTER TABLE `xy_users` DISABLE KEYS */;
INSERT INTO `xy_users` VALUES (51,'13100000000','13100000000','','59b29539f55b64d2adcb8e1d5447c961b7b19594','94908',0,'',0,0,'','','','',0,'FDQBEA',1594138332,1,0,'','','',9980.00,0.00,1,0.00,0.00,1,0,0,2,1594137600,0,1,NULL,NULL,1,1,1,1,1,1,NULL,NULL,0,0.0000,0.0000,NULL,0),(52,'17773594218','main','','c6c379d0971eb249259c7330b06bf8ffb937e588','18331',51,'',0,0,'','','','',0,'U9TRZ4',1594138478,1,0,'43bf6e02cbd9ff299d7490089b5275cefa1bec7a','10110','',8971.00,0.00,1,0.00,0.00,1,0,0,0,0,1,0,NULL,NULL,1,1,1,1,1,1,NULL,NULL,NULL,0.0000,0.0000,NULL,0),(53,'18888888888','a5yuanma.cn','','867d4cbc54d66dbeaeb655988b7b72ec6e1a6d76','17831',0,'',0,0,'','','','',0,'SFKW6X',1594138652,1,0,'24ba0938fdaaec7f08906f1be8d00718350597e5','22109','/static_new6/headimg/2.8184534.png',17004.70,0.00,1,0.00,0.00,1,0,0,0,1594224000,0,0,NULL,NULL,1,1,1,1,1,1,NULL,NULL,3,1000.0000,0.0000,NULL,0),(54,'13222222222','13222222222','','8d5cb4f10d29c73c867e415d58b52a9851e9f710','43568',0,'',0,0,'','','','',0,'AVB7ME',1594139069,1,0,'','','',9335.00,0.00,1,0.00,0.00,1,0,0,3,1594137600,0,0,NULL,NULL,1,1,1,1,1,1,NULL,NULL,3,0.0000,0.0000,NULL,0),(55,'18096145913','A5源码','','f3719a8ee79a774ebd08216ed11d71aa4e1a38f2','86064',0,'',0,0,'','','','',0,'J4GU93',1594140215,1,0,'12199c3b4b131908cdfad8a85d9571d804bdc002','53339','',5000.63,0.00,1,0.00,0.00,1,0,0,0,1594137600,1,0,2222.00,0,1,1,0,0,0,1,NULL,NULL,0,0.0000,0.0000,NULL,0);
/*!40000 ALTER TABLE `xy_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xy_verify_msg`
--

DROP TABLE IF EXISTS `xy_verify_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xy_verify_msg` (
  `tel` char(11) NOT NULL DEFAULT '' COMMENT '用户ID',
  `msg` char(5) NOT NULL DEFAULT '' COMMENT '验证码',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型，1注册,2修改密码，3修改二级密码',
  PRIMARY KEY (`tel`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xy_verify_msg`
--

LOCK TABLES `xy_verify_msg` WRITE;
/*!40000 ALTER TABLE `xy_verify_msg` DISABLE KEYS */;
INSERT INTO `xy_verify_msg` VALUES ('18096145913','52805',1594140174,1),('17628142235','67805',1594140111,1),('17773594218','83084',1594138435,1);
/*!40000 ALTER TABLE `xy_verify_msg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14 12:41:27
