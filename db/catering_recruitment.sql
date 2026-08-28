-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: catering_recruitment
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `aboutus`
--

DROP TABLE IF EXISTS `aboutus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aboutus` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `picture1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片1',
  `picture2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片2',
  `picture3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='关于我们';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aboutus`
--

LOCK TABLES `aboutus` WRITE;
/*!40000 ALTER TABLE `aboutus` DISABLE KEYS */;
INSERT INTO `aboutus` VALUES (1,'2025-01-06 04:20:59','关于我们','ABOUT US','当你设想门外是寒冷可怕的世界时，你还应该开门出去看看，是否真的如此。如果你有信心，你对前途就不犹豫了。如果你有勇气，你就不怕前途是否有困难或危险了每个人心中都应有两盏灯，一盏是希望的灯，一盏是勇气的灯。有了这两盏灯，我们就不怕海上的黑暗和风涛的险恶了。人的一生很像是在雾中行走。远远望去，只是迷蒙一片，辨不出方向和吉凶。可是，当你鼓起勇气，放下恐惧和怀疑，一步一步向前走去的时候，你就会发现，每走一步，你都能把下一步路看得清楚一点。“往前走，别站在远远的地方观望！”你就可以找到你的方向。','upload/aboutus_picture1.jpg','upload/aboutus_picture2.jpg','upload/aboutus_picture3.jpg');
/*!40000 ALTER TABLE `aboutus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatmessage`
--

DROP TABLE IF EXISTS `chatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `uid` bigint NOT NULL COMMENT '用户ID',
  `fid` bigint NOT NULL COMMENT '好友用户ID',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `format` int DEFAULT NULL COMMENT '格式(1:文字，2:图片)',
  `isread` int DEFAULT '0' COMMENT '消息已读(0:未读，1:已读)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatmessage`
--

LOCK TABLES `chatmessage` WRITE;
/*!40000 ALTER TABLE `chatmessage` DISABLE KEYS */;
INSERT INTO `chatmessage` VALUES (1,'2026-03-29 11:58:02',11,21,'你好',1,1),(2,'2026-03-29 11:58:11',21,11,'你好',1,1),(3,'2026-03-29 12:01:57',11,21,'你好',1,1),(4,'2026-03-29 12:02:05',21,11,'你好',1,1),(5,'2026-04-09 12:47:56',32,3,'你好',1,0);
/*!40000 ALTER TABLE `chatmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg',NULL),(2,'picture2','upload/picture2.jpg',NULL),(3,'picture3','upload/picture3.jpg',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diqu`
--

DROP TABLE IF EXISTS `diqu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diqu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `diqu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `diqu` (`diqu`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='地区';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diqu`
--

LOCK TABLES `diqu` WRITE;
/*!40000 ALTER TABLE `diqu` DISABLE KEYS */;
INSERT INTO `diqu` VALUES (1,'2025-12-31 16:00:00','北京'),(2,'2025-12-31 16:00:00','郑州'),(3,'2025-12-31 16:00:00','上海'),(4,'2025-12-31 16:00:00','成都'),(5,'2025-12-31 16:00:00','广州'),(6,'2025-12-31 16:00:00','苏州'),(7,'2025-12-31 16:00:00','杭州'),(8,'2025-12-31 16:00:00','武汉'),(9,'2025-12-31 16:00:00','长沙'),(10,'2025-12-31 16:00:00','哈尔滨'),(11,'2025-12-31 16:00:00','乌鲁木齐'),(12,'2025-12-31 16:00:00','昆明'),(13,'2025-12-31 16:00:00','厦门'),(14,'2025-12-31 16:00:00','合肥'),(15,'2025-12-31 16:00:00','天津'),(16,'2025-12-31 16:00:00','南宁'),(17,'2025-12-31 16:00:00','贵阳'),(18,'2025-12-31 16:00:00','太原'),(19,'2025-12-31 16:00:00','西安'),(20,'2025-12-31 16:00:00','兰州'),(21,'2025-12-31 16:00:00','银川'),(22,'2025-12-31 16:00:00','西宁'),(23,'2025-12-31 16:00:00','拉萨'),(24,'2025-12-31 16:00:00','呼和浩特'),(25,'2025-12-31 16:00:00','济南'),(26,'2025-12-31 16:00:00','南昌'),(27,'2025-12-31 16:00:00','沈阳'),(28,'2025-12-31 16:00:00','长春'),(29,'2025-12-31 16:00:00','扬州'),(30,'2025-12-31 16:00:00','温州'),(31,'2025-12-31 16:00:00','黄山'),(32,'2025-12-31 16:00:00','福州'),(33,'2025-12-31 16:00:00','龙岩'),(34,'2025-12-31 16:00:00','汕头'),(35,'2025-12-31 16:00:00','佛山'),(36,'2025-12-31 16:00:00','桂林'),(37,'2025-12-31 16:00:00','海口'),(38,'2025-12-31 16:00:00','宜昌'),(39,'2025-12-31 16:00:00','岳阳'),(40,'2025-12-31 16:00:00','开封'),(41,'2025-12-31 16:00:00','洛阳'),(42,'2025-12-31 16:00:00','九江'),(43,'2025-12-31 16:00:00','宜宾'),(44,'2025-12-31 16:00:00','乐山'),(45,'2025-12-31 16:00:00','遵义'),(46,'2025-12-31 16:00:00','大理'),(47,'2025-12-31 16:00:00','丽江'),(48,'2025-12-31 16:00:00','延安'),(49,'2025-12-31 16:00:00','酒泉'),(50,'2025-12-31 16:00:00','中卫'),(51,'2025-12-31 16:00:00','喀什'),(52,'2025-12-31 16:00:00','台北'),(53,'2025-12-31 16:00:00','高雄'),(54,'2025-12-31 16:00:00','香港'),(55,'2025-12-31 16:00:00','澳门'),(56,'2025-12-31 16:00:00','青岛'),(57,'2025-12-31 16:00:00','烟台'),(58,'2025-12-31 16:00:00','大连'),(59,'2025-12-31 16:00:00','三亚'),(60,'2025-12-31 16:00:00','北海'),(61,'2025-12-31 16:00:00','珠海'),(62,'2025-12-31 16:00:00','宁波'),(63,'2025-12-31 16:00:00','无锡'),(64,'2025-12-31 16:00:00','常州'),(65,'2025-12-31 16:00:00','镇江');
/*!40000 ALTER TABLE `diqu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussjiuyexinxi`
--

DROP TABLE IF EXISTS `discussjiuyexinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussjiuyexinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint NOT NULL COMMENT '关联表id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  `thumbsupnum` int DEFAULT '0' COMMENT '赞',
  `crazilynum` int DEFAULT '0' COMMENT '踩',
  `istop` int DEFAULT '0' COMMENT '置顶(1:置顶,0:非置顶)',
  `tuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '赞用户ids',
  `cuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '踩用户ids',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='招聘信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussjiuyexinxi`
--

LOCK TABLES `discussjiuyexinxi` WRITE;
/*!40000 ALTER TABLE `discussjiuyexinxi` DISABLE KEYS */;
INSERT INTO `discussjiuyexinxi` VALUES (1,'2026-04-10 09:37:41',160,14,'upload/qiuzhizhe_touxiang4.jpg','liumei','<p>挺好</p>',NULL,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `discussjiuyexinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帖子标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子内容',
  `parentid` bigint DEFAULT NULL COMMENT '父节点id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `isdone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `istop` int DEFAULT '0' COMMENT '是否置顶',
  `toptime` datetime DEFAULT NULL COMMENT '置顶时间',
  `typename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `cover` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '封面',
  `isanon` int DEFAULT '0' COMMENT '是否匿名(1:是,0:否)',
  `delflag` int DEFAULT '0' COMMENT '是否删除(1:是,0:否)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `typename` (`typename`) USING BTREE,
  CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`typename`) REFERENCES `forumtype` (`typename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='互动社区';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,'2025-01-06 04:20:59','帖子标题1','帖子内容1',0,1,'用户名1','upload/forum_avatarurl1.jpg,upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg','开放',0,'2025-01-06 12:20:59','分类名称1','upload/forum_cover1.jpg,upload/forum_cover2.jpg,upload/forum_cover3.jpg',1,0),(2,'2025-01-06 04:20:59','帖子标题2','帖子内容2',0,2,'用户名2','upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg','开放',0,'2025-01-06 12:20:59','分类名称2','upload/forum_cover2.jpg,upload/forum_cover3.jpg,upload/forum_cover4.jpg',2,0),(3,'2025-01-06 04:20:59','帖子标题3','帖子内容3',0,3,'用户名3','upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg','开放',0,'2025-01-06 12:20:59','分类名称3','upload/forum_cover3.jpg,upload/forum_cover4.jpg,upload/forum_cover5.jpg',3,0),(4,'2025-01-06 04:20:59','帖子标题4','帖子内容4',0,4,'用户名4','upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg','开放',0,'2025-01-06 12:20:59','分类名称4','upload/forum_cover4.jpg,upload/forum_cover5.jpg,upload/forum_cover6.jpg',4,0),(5,'2025-01-06 04:20:59','帖子标题5','帖子内容5',0,5,'用户名5','upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg','开放',0,'2025-01-06 12:20:59','分类名称5','upload/forum_cover5.jpg,upload/forum_cover6.jpg,upload/forum_cover7.jpg',5,0),(6,'2025-01-06 04:20:59','帖子标题6','帖子内容6',0,6,'用户名6','upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg','开放',0,'2025-01-06 12:20:59','分类名称6','upload/forum_cover6.jpg,upload/forum_cover7.jpg,upload/forum_cover8.jpg',6,0),(7,'2025-01-06 04:20:59','帖子标题7','帖子内容7',0,7,'用户名7','upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg,upload/forum_avatarurl1.jpg','开放',0,'2025-01-06 12:20:59','分类名称7','upload/forum_cover7.jpg,upload/forum_cover8.jpg,upload/forum_cover1.jpg',7,0),(8,'2025-01-06 04:20:59','帖子标题8','帖子内容8',0,8,'用户名8','upload/forum_avatarurl8.jpg,upload/forum_avatarurl1.jpg,upload/forum_avatarurl2.jpg','开放',0,'2025-01-06 12:20:59','分类名称8','upload/forum_cover8.jpg,upload/forum_cover1.jpg,upload/forum_cover2.jpg',8,0),(9,'2026-04-05 09:11:45',NULL,'<p>1111111</p>',1,14,'liumei','upload/qiuzhizhe_touxiang4.jpg',NULL,0,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forumreport`
--

DROP TABLE IF EXISTS `forumreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forumreport` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `forumid` bigint DEFAULT NULL COMMENT '论坛id',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帖子标题',
  `userid` bigint NOT NULL COMMENT '举报用户id',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '举报用户名',
  `reporteduserid` bigint NOT NULL COMMENT '被举报用户id',
  `reportedusername` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '被举报用户名',
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '举报原因',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片补充',
  `handleadvise` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '处理建议',
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '处理中' COMMENT '状态',
  `reporttype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '主题帖举报' COMMENT '举报类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='互动社区举报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forumreport`
--

LOCK TABLES `forumreport` WRITE;
/*!40000 ALTER TABLE `forumreport` DISABLE KEYS */;
INSERT INTO `forumreport` VALUES (1,'2025-01-06 04:20:59',1,'帖子标题1',1,'举报用户名1',1,'被举报用户名1','举报原因1','upload/forumreport_picture1.jpg,upload/forumreport_picture2.jpg,upload/forumreport_picture3.jpg','处理建议1','处理中','主题帖举报'),(2,'2025-01-06 04:20:59',2,'帖子标题2',2,'举报用户名2',2,'被举报用户名2','举报原因2','upload/forumreport_picture2.jpg,upload/forumreport_picture3.jpg,upload/forumreport_picture4.jpg','处理建议2','处理中','主题帖举报'),(3,'2025-01-06 04:20:59',3,'帖子标题3',3,'举报用户名3',3,'被举报用户名3','举报原因3','upload/forumreport_picture3.jpg,upload/forumreport_picture4.jpg,upload/forumreport_picture5.jpg','处理建议3','处理中','主题帖举报'),(4,'2025-01-06 04:20:59',4,'帖子标题4',4,'举报用户名4',4,'被举报用户名4','举报原因4','upload/forumreport_picture4.jpg,upload/forumreport_picture5.jpg,upload/forumreport_picture6.jpg','处理建议4','处理中','主题帖举报'),(5,'2025-01-06 04:20:59',5,'帖子标题5',5,'举报用户名5',5,'被举报用户名5','举报原因5','upload/forumreport_picture5.jpg,upload/forumreport_picture6.jpg,upload/forumreport_picture7.jpg','处理建议5','处理中','主题帖举报'),(6,'2025-01-06 04:20:59',6,'帖子标题6',6,'举报用户名6',6,'被举报用户名6','举报原因6','upload/forumreport_picture6.jpg,upload/forumreport_picture7.jpg,upload/forumreport_picture8.jpg','处理建议6','处理中','主题帖举报'),(7,'2025-01-06 04:20:59',7,'帖子标题7',7,'举报用户名7',7,'被举报用户名7','举报原因7','upload/forumreport_picture7.jpg,upload/forumreport_picture8.jpg,upload/forumreport_picture1.jpg','处理建议7','处理中','主题帖举报'),(8,'2025-01-06 04:20:59',8,'帖子标题8',8,'举报用户名8',8,'被举报用户名8','举报原因8','','处理建议8','处理中','主题帖举报');
/*!40000 ALTER TABLE `forumreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forumtype`
--

DROP TABLE IF EXISTS `forumtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forumtype` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `typename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `forumtype_snig` (`typename`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='互动社区类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forumtype`
--

LOCK TABLES `forumtype` WRITE;
/*!40000 ALTER TABLE `forumtype` DISABLE KEYS */;
INSERT INTO `forumtype` VALUES (1,'2025-01-06 04:20:59','分类名称1'),(2,'2025-01-06 04:20:59','分类名称2'),(3,'2025-01-06 04:20:59','分类名称3'),(4,'2025-01-06 04:20:59','分类名称4'),(5,'2025-01-06 04:20:59','分类名称5'),(6,'2025-01-06 04:20:59','分类名称6'),(7,'2025-01-06 04:20:59','分类名称7'),(8,'2025-01-06 04:20:59','分类名称8');
/*!40000 ALTER TABLE `forumtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `uid` bigint NOT NULL COMMENT '用户ID',
  `fid` bigint NOT NULL COMMENT '好友用户ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `role` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `tablename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名',
  `alias` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '别名',
  `type` int DEFAULT '0' COMMENT '类型(0:好友申请，1:好友，2:消息)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='好友表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (1,'2026-03-29 11:58:02',11,21,'味香居餐饮管理有限公司','',NULL,'qiye',NULL,2),(2,'2026-03-29 11:58:02',21,11,'zhangwei','upload/qiuzhizhe_touxiang1.jpg',NULL,'qiuzhizhe',NULL,2),(3,'2026-04-09 12:47:56',32,3,'蜀味香川菜馆','',NULL,'qiye',NULL,2),(4,'2026-04-09 12:47:56',3,32,'xuyan','upload/qiuzhizhe_touxiang22.jpg',NULL,'qiuzhizhe',NULL,2);
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gangweifenlei`
--

DROP TABLE IF EXISTS `gangweifenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gangweifenlei` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gangweileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `gangweileixing` (`gangweileixing`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='岗位分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gangweifenlei`
--

LOCK TABLES `gangweifenlei` WRITE;
/*!40000 ALTER TABLE `gangweifenlei` DISABLE KEYS */;
INSERT INTO `gangweifenlei` VALUES (1,'2026-04-06 02:00:00','鱼火锅厨师'),(2,'2026-04-06 02:00:00','饺子店服务员'),(3,'2026-04-06 02:00:00','饺子师傅'),(4,'2026-04-06 02:00:00','餐饮店长'),(5,'2026-04-06 02:00:00','餐厅服务员'),(6,'2026-04-06 02:00:00','顺德菜厨师'),(7,'2026-04-06 02:00:00','面馆服务员'),(8,'2026-04-06 02:00:00','面点师'),(9,'2026-04-06 02:00:00','面点助理'),(10,'2026-04-06 02:00:00','青海菜厨师'),(11,'2026-04-06 02:00:00','陕西小吃师傅'),(12,'2026-04-06 02:00:00','陕北菜厨师'),(13,'2026-04-06 02:00:00','闽菜厨师'),(14,'2026-04-06 02:00:00','铁锅炖厨师'),(15,'2026-04-06 02:00:00','钵钵鸡师傅'),(16,'2026-04-06 02:00:00','酸汤鱼厨师'),(17,'2026-04-06 02:00:00','酸奶制作师'),(18,'2026-04-06 02:00:00','酒吧服务员'),(19,'2026-04-06 02:00:00','辽菜厨师'),(20,'2026-04-06 02:00:00','赣菜厨师'),(21,'2026-04-06 02:00:00','西餐厨师'),(22,'2026-04-06 02:00:00','藏餐厨师'),(23,'2026-04-06 02:00:00','蒿子面师傅'),(24,'2026-04-06 02:00:00','蒙餐火锅厨师'),(25,'2026-04-06 02:00:00','蒙餐厨师'),(26,'2026-04-06 02:00:00','葡国菜厨师'),(27,'2026-04-06 02:00:00','茶餐厅服务员'),(28,'2026-04-06 02:00:00','腊排骨厨师'),(29,'2026-04-06 02:00:00','肉夹馍师傅'),(30,'2026-04-06 02:00:00','羊肉粉师傅'),(31,'2026-04-06 02:00:00','维吾尔菜厨师'),(32,'2026-04-06 02:00:00','红肠加工师'),(33,'2026-04-06 02:00:00','粥品师傅'),(34,'2026-04-06 02:00:00','粉店店员'),(35,'2026-04-06 02:00:00','米线师傅'),(36,'2026-04-06 02:00:00','米粉店店员'),(37,'2026-04-06 02:00:00','米粉师傅'),(38,'2026-04-06 02:00:00','私房菜厨师'),(39,'2026-04-06 02:00:00','盐水鸭师傅'),(40,'2026-04-06 02:00:00','甜品师'),(41,'2026-04-06 02:00:00','牛肉面师傅'),(42,'2026-04-06 02:00:00','牛肉火锅厨师'),(43,'2026-04-06 02:00:00','烧烤师傅'),(44,'2026-04-06 02:00:00','烤鸭师傅'),(45,'2026-04-06 02:00:00','烤肉师傅'),(46,'2026-04-06 02:00:00','炒锅厨师'),(47,'2026-04-06 02:00:00','火锅厨师'),(48,'2026-04-06 02:00:00','湘菜厨师'),(49,'2026-04-06 02:00:00','湖鲜厨师'),(50,'2026-04-06 02:00:00','港式茶餐厅厨师'),(51,'2026-04-06 02:00:00','淮扬菜厨师'),(52,'2026-04-06 02:00:00','海鲜饺子厨师'),(53,'2026-04-06 02:00:00','海鲜杀洗工'),(54,'2026-04-06 02:00:00','海鲜厨师'),(55,'2026-04-06 02:00:00','汤品助理'),(56,'2026-04-06 02:00:00','水饺店服务员'),(57,'2026-04-06 02:00:00','水饺师傅'),(58,'2026-04-06 02:00:00','水席厨师'),(59,'2026-04-06 02:00:00','楚菜厨师'),(60,'2026-04-06 02:00:00','椰子鸡厨师'),(61,'2026-04-06 02:00:00','杀鱼工'),(62,'2026-04-06 02:00:00','朝族菜厨师'),(63,'2026-04-06 02:00:00','服务员'),(64,'2026-04-06 02:00:00','景区服务员'),(65,'2026-04-06 02:00:00','早茶点心师'),(66,'2026-04-06 02:00:00','早班服务员'),(67,'2026-04-06 02:00:00','新疆菜厨师'),(68,'2026-04-06 02:00:00','敦煌菜厨师'),(69,'2026-04-06 02:00:00','收银服务员'),(70,'2026-04-06 02:00:00','手抓羊肉师傅'),(71,'2026-04-06 02:00:00','徽菜厨师'),(72,'2026-04-06 02:00:00','店员'),(73,'2026-04-06 02:00:00','广西菜厨师'),(74,'2026-04-06 02:00:00','川菜厨师'),(75,'2026-04-06 02:00:00','小吃店服务员'),(76,'2026-04-06 02:00:00','小吃店员'),(77,'2026-04-06 02:00:00','小吃制作员'),(78,'2026-04-06 02:00:00','客家菜厨师'),(79,'2026-04-06 02:00:00','宁夏菜厨师'),(80,'2026-04-06 02:00:00','孔府菜厨师'),(81,'2026-04-06 02:00:00','天津菜厨师'),(82,'2026-04-06 02:00:00','夜市服务员'),(83,'2026-04-06 02:00:00','夜宵服务员'),(84,'2026-04-06 02:00:00','咖啡师'),(85,'2026-04-06 02:00:00','后厨学徒'),(86,'2026-04-06 02:00:00','吉菜厨师'),(87,'2026-04-06 02:00:00','台湾小吃师傅'),(88,'2026-04-06 02:00:00','古城服务员'),(89,'2026-04-06 02:00:00','前厅服务员'),(90,'2026-04-06 02:00:00','前厅主管'),(91,'2026-04-06 02:00:00','切配师傅'),(92,'2026-04-06 02:00:00','切配工'),(93,'2026-04-06 02:00:00','刀削面师傅'),(94,'2026-04-06 02:00:00','冷面店店员'),(95,'2026-04-06 02:00:00','冷面师傅'),(96,'2026-04-06 02:00:00','俄式菜厨师'),(97,'2026-04-06 02:00:00','传菜员'),(98,'2026-04-06 02:00:00','云南菜厨师'),(99,'2026-04-06 02:00:00','上海小吃师傅');
/*!40000 ALTER TABLE `gangweifenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiuyexinxi`
--

DROP TABLE IF EXISTS `jiuyexinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jiuyexinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qiyemingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `qiyedizhi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业地址',
  `qiyetupian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '企业图片',
  `fuzeren` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `lianxidianhua` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `gangweileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位类型',
  `diqu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区',
  `xingye` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜系',
  `zhaopinrenshu` int DEFAULT NULL COMMENT '招聘人数',
  `xinzidaiyu` int DEFAULT NULL COMMENT '薪资待遇',
  `zizhiyaoqiu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '技能要求',
  `jingyanyaoqiu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经验要求',
  `gongzuoshijian` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工作时间',
  `gangweijieshao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '岗位介绍',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  `thumbsupnum` int DEFAULT '0' COMMENT '赞',
  `crazilynum` int DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `reversetime` datetime DEFAULT NULL COMMENT '倒计结束时间',
  `clicknum` int DEFAULT '0' COMMENT '点击次数',
  `discussnum` int DEFAULT '0' COMMENT '评论数',
  `storeupnum` int DEFAULT '0' COMMENT '收藏数',
  `sfsh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '待审核',
  `shhf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='招聘信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiuyexinxi`
--

LOCK TABLES `jiuyexinxi` WRITE;
/*!40000 ALTER TABLE `jiuyexinxi` DISABLE KEYS */;
INSERT INTO `jiuyexinxi` VALUES (1,'2026-04-05 02:00:00','味香居餐饮管理有限公司','北京市朝阳区建国路88号','upload/qiye_qiyetupian1.jpg','陈建国','13823888881','餐饮店长','北京','餐饮',3,7800,'高中及以上','有3年以上餐饮管理经验','8小时','<p>负责门店日常运营、人员管理、服务质量监督、成本控制。</p>','2027-04-05 10:00:00',15,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',421,20,55,'待审核',''),(2,'2026-04-05 02:00:00','味香居餐饮管理有限公司','北京市朝阳区建国路88号','upload/qiye_qiyetupian1.jpg','陈建国','13823888881','炒锅厨师','北京','餐饮',2,6500,'初中及以上','有2年以上中餐炒锅经验','8小时','<p>负责中餐菜品炒制、食材处理、后厨卫生维护。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',331,15,42,'待审核',''),(3,'2026-04-05 02:00:00','悦享咖啡有限公司','河南省郑州市金水区林业路123号','upload/qiye_qiyetupian2.jpg','林晓雨','13823888882','咖啡师','郑州','餐饮',1,5200,'高中及以上','有1年以上咖啡制作经验','8小时','<p>负责咖啡、饮品制作，保持吧台整洁，提供优质服务。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',281,13,37,'待审核',''),(4,'2026-04-05 02:00:00','悦享咖啡有限公司','河南省郑州市金水区林业路123号','upload/qiye_qiyetupian2.jpg','林晓雨','13823888882','甜品师','郑州','餐饮',1,5500,'高中及以上','有1年以上甜品制作经验','8小时','<p>负责甜品、蛋糕制作，保证出品新鲜美观。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',250,12,33,'待审核',''),(5,'2026-04-05 02:00:00','蜀味香川菜馆','上海市黄浦区南京东路123号','upload/qiye_qiyetupian3.jpg','刘大川','13823888883','川菜厨师','上海','餐饮',3,7200,'初中及以上','有3年以上川菜制作经验','8小时','<p>负责川菜炒制、锅底调配、口味把控。</p>','2027-04-05 10:00:00',14,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',391,18,50,'待审核',''),(6,'2026-04-05 02:00:00','蜀味香川菜馆','上海市黄浦区南京东路123号','upload/qiye_qiyetupian3.jpg','刘大川','13823888883','后厨学徒','上海','餐饮',0,3800,'不限','吃苦耐劳，愿意学习','8小时','<p>协助厨师处理食材、打扫卫生、学习基础技能。</p>','2027-04-05 10:00:00',8,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(7,'2026-04-05 02:00:00','粤点王茶餐厅','四川省成都市锦江区春熙路56号','upload/qiye_qiyetupian4.jpg','黄志明','13823888884','早茶点心师','成都','餐饮',2,6800,'初中及以上','有2年以上粤式点心经验','8小时','<p>负责早茶点心制作、蒸点、炸点、包点制作。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',360,17,46,'待审核',''),(8,'2026-04-05 02:00:00','粤点王茶餐厅','四川省成都市锦江区春熙路56号','upload/qiye_qiyetupian4.jpg','黄志明','13823888884','餐厅服务员','成都','餐饮',1,4500,'不限','形象良好，服务意识强','8小时','<p>负责点餐、上菜、桌面清洁、客户接待。</p>','2027-04-05 10:00:00',11,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',310,14,39,'待审核',''),(9,'2026-04-05 02:00:00','江南味道私房菜','广州市天河区天河路300号','upload/qiye_qiyetupian5.jpg','周雅琴','13823888885','私房菜厨师','广州','餐饮',4,8500,'高中及以上','有4年以上江浙菜经验','8小时','<p>负责私房菜制作、宴席菜品、口味精细把控。</p>','2027-04-05 10:00:00',16,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',440,21,58,'待审核',''),(10,'2026-04-05 02:00:00','江南味道私房菜','广州市天河区天河路300号','upload/qiye_qiyetupian5.jpg','周雅琴','13823888885','前厅主管','广州','餐饮',2,6200,'高中及以上','有2年以上餐饮前厅管理','8小时','<p>负责前厅服务管理、人员排班、客户投诉处理。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',290,14,38,'待审核',''),(11,'2026-04-05 02:00:00','烧烤部落餐饮有限公司','江苏省苏州市太湖区58号','upload/qiye_qiyetupian6.jpg','赵大勇','13823888886','烧烤师傅','苏州','餐饮',3,7000,'初中及以上','有3年以上烧烤经验','8小时','<p>负责各类烤串制作、火候把控、调料调配。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,49,'待审核',''),(12,'2026-04-05 02:00:00','烧烤部落餐饮有限公司','江苏省苏州市太湖区58号','upload/qiye_qiyetupian6.jpg','赵大勇','13823888886','夜宵服务员','苏州','餐饮',1,4300,'不限','能适应晚班，服务热情','8小时','<p>负责夜宵时段接待、点餐、桌面清理。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(13,'2026-04-05 02:00:00','粥满堂养生粥铺','浙江省杭州市西湖区龙井路78号','upload/qiye_qiyetupian7.jpg','孙文静','13823888887','粥品师傅','杭州','餐饮',2,5400,'初中及以上','会制作各类养生粥','8小时','<p>负责养生粥、面点制作，保证食材新鲜。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',240,11,31,'待审核',''),(14,'2026-04-05 02:00:00','粥满堂养生粥铺','浙江省杭州市西湖区龙井路78号','upload/qiye_qiyetupian7.jpg','孙文静','13823888887','早班服务员','杭州','餐饮',0,4100,'不限','能起早，工作认真','8小时','<p>负责早餐时段点餐、上菜、卫生清洁。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',180,8,24,'待审核',''),(15,'2026-04-05 02:00:00','披萨工坊西餐厅','湖北省武汉市武昌区中南路22号','upload/qiye_qiyetupian8.jpg','吴凯文','13823888888','西餐厨师','武汉','餐饮',2,6900,'高中及以上','有披萨、意面制作经验','8小时','<p>负责披萨、意面、牛排制作，把控出品标准。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,16,44,'待审核',''),(16,'2026-04-05 02:00:00','披萨工坊西餐厅','湖北省武汉市武昌区中南路22号','upload/qiye_qiyetupian8.jpg','吴凯文','13823888888','收银服务员','武汉','餐饮',1,4600,'高中及以上','会使用收银系统','8小时','<p>负责收银、点餐、客户引导、门店卫生。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',230,10,29,'待审核',''),(17,'2026-04-05 02:00:00','老北京涮肉坊','北京市东城区王府井大街99号','upload/qiye_qiyetupian9.jpg','张宝华','13823888889','火锅厨师','北京','餐饮',3,7300,'初中及以上','熟悉铜锅涮肉流程','8小时','<p>负责锅底调制、肉品切配、后厨管理。</p>','2027-04-05 10:00:00',14,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',390,19,51,'待审核',''),(18,'2026-04-05 02:00:00','老北京涮肉坊','北京市东城区王府井大街99号','upload/qiye_qiyetupian9.jpg','张宝华','13823888889','切配师傅','北京','餐饮',2,5200,'初中及以上','会切羊肉卷、处理食材','8小时','<p>负责肉品切配、食材预处理、冰柜整理。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',250,12,32,'待审核',''),(19,'2026-04-05 02:00:00','湘西人家','湖南省长沙市天心区五一大道77号','upload/qiye_qiyetupian10.jpg','李翠花','13823888890','湘菜厨师','长沙','餐饮',3,7100,'初中及以上','擅长湘菜、土家菜','8小时','<p>负责湘菜炒制、口味把控、菜品创新。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'待审核',''),(20,'2026-04-05 02:00:00','湘西人家','湖南省长沙市天心区五一大道77号','upload/qiye_qiyetupian10.jpg','李翠花','13823888890','传菜员','长沙','餐饮',0,4000,'不限','手脚麻利，能吃苦','8小时','<p>负责菜品传递、桌面回收、后厨协助。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',190,9,25,'待审核',''),(21,'2026-04-05 02:00:00','东北大锅炖','黑龙江省哈尔滨市南岗区中央大街88号','upload/qiye_qiyetupian11.jpg','王铁柱','13823888891','铁锅炖厨师','哈尔滨','餐饮',3,6800,'初中及以上','擅长东北铁锅炖菜','8小时','<p>负责铁锅炖、大锅菜制作，保证口味正宗。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,16,43,'待审核',''),(22,'2026-04-05 02:00:00','东北大锅炖','黑龙江省哈尔滨市南岗区中央大街88号','upload/qiye_qiyetupian11.jpg','王铁柱','13823888891','服务员','哈尔滨','餐饮',1,4400,'不限','性格开朗，服务主动','8小时','<p>负责点餐、上菜、倒茶、桌面整理。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(23,'2026-04-05 02:00:00','西域风情餐厅','新疆乌鲁木齐市天山区解放南路66号','upload/qiye_qiyetupian12.jpg','李志强','13823888892','新疆菜厨师','乌鲁木齐','餐饮',4,8200,'初中及以上','擅长烤全羊、大盘鸡制作','8小时','<p>负责新疆特色菜品、烧烤、面点制作。</p>','2027-04-05 10:00:00',15,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',420,20,55,'待审核',''),(24,'2026-04-05 02:00:00','西域风情餐厅','新疆乌鲁木齐市天山区解放南路66号','upload/qiye_qiyetupian12.jpg','李志强','13823888892','面点师','乌鲁木齐','餐饮',2,5600,'初中及以上','会制作馕、烤包子等','8小时','<p>负责新疆特色面点制作、出餐摆盘。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',270,13,35,'待审核',''),(25,'2026-04-05 02:00:00','云味过桥米线','云南省昆明市五华区南屏街45号','upload/qiye_qiyetupian13.jpg','杨丽华','13823888893','米线师傅','昆明','餐饮',2,5300,'初中及以上','会制作过桥米线','8小时','<p>负责米线烫煮、汤底熬制、配料准备。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',240,11,31,'待审核',''),(26,'2026-04-05 02:00:00','云味过桥米线','云南省昆明市五华区南屏街45号','upload/qiye_qiyetupian13.jpg','杨丽华','13823888893','餐厅服务员','昆明','餐饮',0,4100,'不限','工作认真，有责任心','8小时','<p>负责点餐、上菜、门店卫生清洁。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',180,8,24,'待审核',''),(27,'2026-04-05 02:00:00','闽南人家海鲜酒楼','福建省厦门市思明区中山路123号','upload/qiye_qiyetupian14.jpg','陈永强','13823888894','海鲜厨师','厦门','餐饮',4,8800,'高中及以上','擅长闽菜、海鲜烹饪','8小时','<p>负责海鲜加工、闽菜制作、宴席菜品。</p>','2027-04-05 10:00:00',16,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',450,22,60,'待审核',''),(28,'2026-04-05 02:00:00','闽南人家海鲜酒楼','福建省厦门市思明区中山路123号','upload/qiye_qiyetupian14.jpg','陈永强','13823888894','海鲜杀洗工','厦门','餐饮',1,4200,'不限','能处理鱼虾贝类','8小时','<p>负责海鲜杀洗、食材分类、冰柜管理。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(29,'2026-04-05 02:00:00','徽菜馆','安徽省合肥市庐阳区长江中路77号','upload/qiye_qiyetupian15.jpg','胡文景','13823888895','徽菜厨师','合肥','餐饮',3,7400,'初中及以上','会做臭鳜鱼等徽菜','8小时','<p>负责徽菜制作、口味把控、后厨协调。</p>','2027-04-05 10:00:00',14,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',400,19,51,'待审核',''),(30,'2026-04-05 02:00:00','徽菜馆','安徽省合肥市庐阳区长江中路77号','upload/qiye_qiyetupian15.jpg','胡文景','13823888895','服务员','合肥','餐饮',1,4500,'不限','形象端正，服务意识好','8小时','<p>负责客户接待、点餐、上菜、卫生清理。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',230,10,29,'待审核',''),(31,'2026-04-05 02:00:00','津门味道','天津市和平区滨江道88号','upload/qiye_qiyetupian16.jpg','刘津生','13823888896','天津菜厨师','天津','餐饮',2,6600,'初中及以上','擅长天津本地菜','8小时','<p>负责天津特色菜、包子、小吃制作。</p>','2027-04-05 10:00:00',11,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',310,14,39,'待审核',''),(32,'2026-04-05 02:00:00','津门味道','天津市和平区滨江道88号','upload/qiye_qiyetupian16.jpg','刘津生','13823888896','面点助理','天津','餐饮',1,4300,'不限','协助制作包子面点','8小时','<p>协助面点师傅、食材准备、区域卫生。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(33,'2026-04-05 02:00:00','桂北风情','广西南宁市青秀区民族大道66号','upload/qiye_qiyetupian17.jpg','韦国华','13823888897','广西菜厨师','南宁','餐饮',2,6400,'初中及以上','会做螺蛳粉、广西菜','8小时','<p>负责广西特色菜品、小吃制作。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',290,13,37,'待审核',''),(34,'2026-04-05 02:00:00','桂北风情','广西南宁市青秀区民族大道66号','upload/qiye_qiyetupian17.jpg','韦国华','13823888897','小吃制作员','南宁','餐饮',1,4200,'不限','能学习螺蛳粉制作','8小时','<p>负责小吃制作、出餐、餐具清洗。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',180,8,24,'待审核',''),(35,'2026-04-05 02:00:00','黔味酸汤鱼','贵州省贵阳市南明区中华南路33号','upload/qiye_qiyetupian18.jpg','吴学军','13823888898','酸汤鱼厨师','贵阳','餐饮',3,7200,'初中及以上','擅长贵州酸汤菜品','8小时','<p>负责酸汤锅底、鱼鲜处理、菜品制作。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,17,47,'待审核',''),(36,'2026-04-05 02:00:00','黔味酸汤鱼','贵州省贵阳市南明区中华南路33号','upload/qiye_qiyetupian18.jpg','吴学军','13823888898','服务员','贵阳','餐饮',0,4000,'不限','吃苦耐劳，服从安排','8小时','<p>负责点餐、上菜、桌面清洁、门店卫生。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',190,9,25,'待审核',''),(37,'2026-04-05 02:00:00','晋商面馆','山西省太原市迎泽区柳巷99号','upload/qiye_qiyetupian19.jpg','乔国栋','13823888899','刀削面师傅','太原','餐饮',2,5700,'初中及以上','会刀削面等山西面食','8小时','<p>负责刀削面、卤汁制作、出餐把控。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',270,12,34,'待审核',''),(38,'2026-04-05 02:00:00','晋商面馆','山西省太原市迎泽区柳巷99号','upload/qiye_qiyetupian19.jpg','乔国栋','13823888899','面馆服务员','太原','餐饮',0,4100,'不限','工作积极主动','8小时','<p>负责点餐、端面、收碗、打扫卫生。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',180,8,24,'待审核',''),(39,'2026-04-05 02:00:00','秦味肉夹馍','陕西省西安市碑林区钟楼广场22号','upload/qiye_qiyetupian20.jpg','白永辉','13823888900','肉夹馍师傅','西安','餐饮',2,5500,'初中及以上','会做肉夹馍、凉皮','8小时','<p>负责肉夹馍烤制、凉皮制作、调料调配。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',250,11,32,'待审核',''),(40,'2026-04-05 02:00:00','秦味肉夹馍','陕西省西安市碑林区钟楼广场22号','upload/qiye_qiyetupian20.jpg','白永辉','13823888900','小吃店员','西安','餐饮',0,4000,'不限','能适应快节奏工作','8小时','<p>负责点餐、打包、店面清洁、食材整理。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',170,7,23,'待审核',''),(41,'2026-04-05 02:00:00','陇上人家','甘肃省兰州市城关区张掖路55号','upload/qiye_qiyetupian21.jpg','马建军','13823888901','牛肉面师傅','兰州','餐饮',3,6700,'初中及以上','专业兰州拉面技术','8小时','<p>负责拉面、汤底熬制、萝卜切配。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',330,15,42,'待审核',''),(42,'2026-04-05 02:00:00','陇上人家','甘肃省兰州市城关区张掖路55号','upload/qiye_qiyetupian21.jpg','马建军','13823888901','服务员','兰州','餐饮',1,4400,'不限','有餐饮服务经验优先','8小时','<p>负责点餐、上餐、桌面清理、客户服务。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(43,'2026-04-05 02:00:00','宁味斋','宁夏银川市兴庆区解放东街77号','upload/qiye_qiyetupian22.jpg','王建国','13823888902','宁夏菜厨师','银川','餐饮',3,7000,'初中及以上','擅长手抓羊肉等菜品','8小时','<p>负责宁夏特色菜、羊肉类菜品制作。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,16,43,'待审核',''),(44,'2026-04-05 02:00:00','宁味斋','宁夏银川市兴庆区解放东街77号','upload/qiye_qiyetupian22.jpg','王建国','13823888902','切配工','银川','餐饮',1,4200,'不限','会简单食材处理','8小时','<p>负责食材切配、冰柜整理、后厨卫生。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(45,'2026-04-05 02:00:00','青海湖餐厅','青海省西宁市城中区西大街44号','upload/qiye_qiyetupian23.jpg','张秀英','13823888903','青海菜厨师','西宁','餐饮',2,6300,'初中及以上','擅长牦牛肉、藏式菜品','8小时','<p>负责青海特色菜品、小吃制作。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',290,13,37,'待审核',''),(46,'2026-04-05 02:00:00','青海湖餐厅','青海省西宁市城中区西大街44号','upload/qiye_qiyetupian23.jpg','张秀英','13823888903','餐厅服务员','西宁','餐饮',0,4100,'不限','有责任心，服从管理','8小时','<p>负责点餐、上菜、餐具回收、卫生打扫。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',180,8,24,'待审核',''),(47,'2026-04-05 02:00:00','藏家宴','西藏拉萨市城关区北京东路88号','upload/qiye_qiyetupian24.jpg','次仁多吉','13823888904','藏餐厨师','拉萨','餐饮',3,7500,'初中及以上','熟悉藏餐制作流程','8小时','<p>负责酥油茶、糌粑、藏式菜品制作。</p>','2027-04-05 10:00:00',13,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',380,18,49,'待审核',''),(48,'2026-04-05 02:00:00','藏家宴','西藏拉萨市城关区北京东路88号','upload/qiye_qiyetupian24.jpg','次仁多吉','13823888904','服务员','拉萨','餐饮',1,4600,'不限','了解藏餐文化优先','8小时','<p>负责客户接待、点餐、上菜、服务讲解。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',230,10,29,'待审核',''),(49,'2026-04-05 02:00:00','蒙骨王火锅','内蒙古呼和浩特市回民区中山西路66号','upload/qiye_qiyetupian25.jpg','巴特尔','13823888905','蒙餐火锅厨师','呼和浩特','餐饮',3,7300,'初中及以上','擅长蒙式火锅、手把肉','8小时','<p>负责蒙式火锅锅底、肉品处理、菜品制作。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,17,47,'待审核',''),(50,'2026-04-05 02:00:00','蒙骨王火锅','内蒙古呼和浩特市回民区中山西路66号','upload/qiye_qiyetupian25.jpg','巴特尔','13823888905','传菜员','呼和浩特','餐饮',0,4000,'不限','体力好，能吃苦','8小时','<p>负责菜品传递、餐具回收、后厨协助。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',190,9,25,'待审核',''),(51,'2026-04-05 02:00:00','鲁味鲜','山东省济南市历下区泉城路77号','upload/qiye_qiyetupian26.jpg','孔祥瑞','13823888906','鲁菜厨师','济南','餐饮',4,8600,'高中及以上','擅长鲁菜、九转大肠','8小时','<p>负责鲁菜制作、宴席菜品、口味把控。</p>','2027-04-05 10:00:00',15,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',430,21,57,'待审核',''),(52,'2026-04-05 02:00:00','鲁味鲜','山东省济南市历下区泉城路77号','upload/qiye_qiyetupian26.jpg','孔祥瑞','13823888906','服务员','济南','餐饮',1,4700,'高中及以上','形象良好，沟通能力强','8小时','<p>负责高端宴席服务、点餐、客户维护。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',250,12,32,'待审核',''),(53,'2026-04-05 02:00:00','赣南人家','江西省南昌市东湖区八一大道99号','upload/qiye_qiyetupian27.jpg','刘志远','13823888907','赣菜厨师','南昌','餐饮',3,7000,'初中及以上','擅长赣菜、瓦罐汤','8小时','<p>负责赣菜炒制、瓦罐汤煨制、菜品出品。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,15,42,'待审核',''),(54,'2026-04-05 02:00:00','赣南人家','江西省南昌市东湖区八一大道99号','upload/qiye_qiyetupian27.jpg','刘志远','13823888907','汤品助理','南昌','餐饮',1,4200,'不限','协助瓦罐汤制作','8小时','<p>负责食材准备、汤品看管、区域卫生。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(55,'2026-04-05 02:00:00','辽沈大饭店','辽宁省沈阳市沈河区青年大街123号','upload/qiye_qiyetupian28.jpg','赵永强','13823888908','辽菜厨师','沈阳','餐饮',3,7400,'初中及以上','擅长辽菜、东北菜','8小时','<p>负责辽菜制作、后厨管理、菜品质量把控。</p>','2027-04-05 10:00:00',14,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',390,19,51,'待审核',''),(56,'2026-04-05 02:00:00','辽沈大饭店','辽宁省沈阳市沈河区青年大街123号','upload/qiye_qiyetupian28.jpg','赵永强','13823888908','前厅服务员','沈阳','餐饮',1,4500,'不限','有酒店服务经验优先','8小时','<p>负责包厢服务、点餐、上菜、客户接待。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',230,10,29,'待审核',''),(57,'2026-04-05 02:00:00','吉菜坊','吉林省长春市朝阳区人民大街66号','upload/qiye_qiyetupian29.jpg','李长伟','13823888909','吉菜厨师','长春','餐饮',3,7100,'初中及以上','擅长吉菜、人参鸡等','8小时','<p>负责吉菜制作、特色菜品研发、口味把控。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,16,43,'待审核',''),(58,'2026-04-05 02:00:00','吉菜坊','吉林省长春市朝阳区人民大街66号','upload/qiye_qiyetupian29.jpg','李长伟','13823888909','餐厅服务员','长春','餐饮',1,4400,'不限','服务意识强','8小时','<p>负责点餐、上菜、客户接待、桌面整理。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(59,'2026-04-05 02:00:00','龙江鱼馆','黑龙江省大庆市萨尔图区建设路99号','upload/qiye_qiyetupian30.jpg','陈大江','13823888910','鱼鲜厨师','大庆','餐饮',2,6900,'初中及以上','擅长铁锅炖鱼、江鱼烹制','8小时','<p>负责江鱼处理、特色炖鱼、菜品制作。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,49,'待审核',''),(60,'2026-04-05 02:00:00','龙江鱼馆','黑龙江省大庆市萨尔图区建设路99号','upload/qiye_qiyetupian30.jpg','陈大江','13823888910','杀鱼工','大庆','餐饮',1,4100,'不限','能处理活鱼','8小时','<p>负责鱼鲜宰杀、清洗、食材预处理。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',180,8,24,'待审核',''),(61,'2026-04-05 02:00:00','草原奶茶馆','内蒙古呼伦贝尔市海拉尔区中央路55号','upload/qiye_qiyetupian31.jpg','斯琴塔娜','13823888911','奶茶师','呼伦贝尔','餐饮',2,5300,'初中及以上','会制作蒙古奶茶、奶制品','8小时','<p>负责奶茶熬制、奶食制作、特色饮品出品。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',280,13,37,'待审核',''),(62,'2026-04-05 02:00:00','草原奶茶馆','内蒙古呼伦贝尔市海拉尔区中央路55号','upload/qiye_qiyetupian31.jpg','斯琴塔娜','13823888911','店员','呼伦贝尔','餐饮',0,4000,'不限','热情开朗','8小时','<p>负责点单、出餐、店面清洁、客户服务。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',170,7,23,'待审核',''),(63,'2026-04-05 02:00:00','金陵小吃铺','江苏省南京市秦淮区夫子庙路33号','upload/qiye_qiyetupian32.jpg','王金陵','13823888912','小吃师傅','南京','餐饮',2,5600,'初中及以上','会做鸭血粉丝汤、金陵汤包','8小时','<p>负责南京特色小吃制作、出餐把控。</p>','2027-04-05 10:00:00',11,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',310,14,39,'待审核',''),(64,'2026-04-05 02:00:00','金陵小吃铺','江苏省南京市秦淮区夫子庙路33号','upload/qiye_qiyetupian32.jpg','王金陵','13823888912','小吃店员','南京','餐饮',1,4200,'不限','能适应快节奏','8小时','<p>负责点餐、打包、卫生清洁、食材整理。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(65,'2026-04-05 02:00:00','钱塘茶餐厅','浙江省杭州市上城区西湖大道77号','upload/qiye_qiyetupian33.jpg','钱晓峰','13823888913','茶点师傅','杭州','餐饮',2,6200,'高中及以上','有杭式茶点制作经验','8小时','<p>负责茶点、糕点、杭式小吃制作。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',330,15,42,'待审核',''),(66,'2026-04-05 02:00:00','钱塘茶餐厅','浙江省杭州市上城区西湖大道77号','upload/qiye_qiyetupian33.jpg','钱晓峰','13823888913','服务员','杭州','餐饮',1,4500,'不限','形象良好','8小时','<p>负责茶餐厅服务、点餐、上菜、桌面维护。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',230,10,29,'待审核',''),(67,'2026-04-05 02:00:00','徽州小吃坊','安徽省黄山市屯溪区老街88号','upload/qiye_qiyetupian34.jpg','黄山民','13823888914','徽州小吃师傅','黄山','餐饮',2,5800,'初中及以上','会做黄山烧饼、徽州糕点','8小时','<p>负责徽州特色小吃、糕点制作。</p>','2027-04-05 10:00:00',11,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',320,15,41,'待审核',''),(68,'2026-04-05 02:00:00','徽州小吃坊','安徽省黄山市屯溪区老街88号','upload/qiye_qiyetupian34.jpg','黄山民','13823888914','营业员','黄山','餐饮',0,4100,'不限','善于沟通','8小时','<p>负责产品售卖、打包、店面卫生、客户接待。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',180,8,24,'待审核',''),(69,'2026-04-05 02:00:00','闽味小吃城','福建省福州市台江区八一七路66号','upload/qiye_qiyetupian35.jpg','林闽江','13823888915','闽味小吃师傅','福州','餐饮',3,6700,'初中及以上','擅长鱼丸、肉燕、闽式小吃','8小时','<p>负责福州特色小吃制作、汤底熬制、出餐。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'待审核',''),(70,'2026-04-05 02:00:00','闽味小吃城','福建省福州市台江区八一七路66号','upload/qiye_qiyetupian35.jpg','林闽江','13823888915','小吃店员','福州','餐饮',1,4300,'不限','工作认真','8小时','<p>负责点餐、出餐、店面清洁、餐具回收。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',210,9,27,'待审核',''),(71,'2026-04-05 02:00:00','赣味烧菜馆','江西省赣州市章贡区文清路55号','upload/qiye_qiyetupian36.jpg','张赣南','13823888916','赣味烧菜厨师','赣州','餐饮',3,6900,'初中及以上','擅长赣南烧菜、小炒','8小时','<p>负责赣南特色菜品炒制、口味把控。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,16,44,'待审核',''),(72,'2026-04-05 02:00:00','赣味烧菜馆','江西省赣州市章贡区文清路55号','upload/qiye_qiyetupian36.jpg','张赣南','13823888916','服务员','赣州','餐饮',1,4400,'不限','吃苦耐劳','8小时','<p>负责点餐、上菜、卫生清洁、客户服务。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(73,'2026-04-05 02:00:00','楚味轩','湖北省荆州市沙市区北京路77号','upload/qiye_qiyetupian37.jpg','刘楚江','13823888917','楚菜厨师','荆州','餐饮',3,7000,'初中及以上','擅长荆楚特色菜、鱼糕制作','8小时','<p>负责楚菜制作、鱼糕加工、宴席菜品。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',360,17,46,'待审核',''),(74,'2026-04-05 02:00:00','楚味轩','湖北省荆州市沙市区北京路77号','upload/qiye_qiyetupian37.jpg','刘楚江','13823888917','后厨助理','荆州','餐饮',1,4200,'不限','能配合厨师工作','8小时','<p>负责食材处理、后厨卫生、餐具清洗。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(75,'2026-04-05 02:00:00','湘赣土菜馆','湖南省株洲市天元区泰山路44号','upload/qiye_qiyetupian38.jpg','陈湘赣','13823888918','土菜厨师','株洲','餐饮',3,6800,'初中及以上','擅长湘赣农家土菜','8小时','<p>负责农家土菜炒制、腊味加工、口味把控。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',350,16,45,'待审核',''),(76,'2026-04-05 02:00:00','湘赣土菜馆','湖南省株洲市天元区泰山路44号','upload/qiye_qiyetupian38.jpg','陈湘赣','13823888918','服务员','株洲','餐饮',1,4300,'不限','服务主动','8小时','<p>负责点餐、上菜、桌面清洁、客户接待。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',210,9,27,'待审核',''),(77,'2026-04-05 02:00:00','岭南茶点居','广东省佛山市禅城区祖庙路99号','upload/qiye_qiyetupian39.jpg','黄岭南','13823888919','茶点师傅','佛山','餐饮',2,6600,'高中及以上','有广式茶点制作经验','8小时','<p>负责广式早茶点心、蒸点、炸点制作。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',360,17,46,'待审核',''),(78,'2026-04-05 02:00:00','岭南茶点居','广东省佛山市禅城区祖庙路99号','upload/qiye_qiyetupian39.jpg','黄岭南','13823888919','茶点服务员','佛山','餐饮',1,4600,'高中及以上','形象良好','8小时','<p>负责茶点服务、点餐、上菜、客户维护。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',250,12,32,'待审核',''),(79,'2026-04-05 02:00:00','邕城味道','广西南宁市西乡塘区大学东路66号','upload/qiye_qiyetupian40.jpg','韦邕城','13823888920','邕菜厨师','南宁','餐饮',2,6500,'初中及以上','擅长南宁本土菜品','8小时','<p>负责邕城特色菜、小吃制作、口味把控。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,16,43,'待审核',''),(80,'2026-04-05 02:00:00','邕城味道','广西南宁市西乡塘区大学东路66号','upload/qiye_qiyetupian40.jpg','韦邕城','13823888920','服务员','南宁','餐饮',1,4400,'不限','责任心强','8小时','<p>负责点餐、上菜、店面清洁、客户服务。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(81,'2026-04-05 02:00:00','琼州海鲜坊','海南省三亚市天涯区三亚湾路88号','upload/qiye_qiyetupian41.jpg','李琼海','13823888921','海鲜厨师','三亚','餐饮',4,8700,'高中及以上','擅长琼式海鲜烹饪','8小时','<p>负责海鲜加工、琼式菜品、宴席制作。</p>','2027-04-05 10:00:00',16,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',440,21,58,'待审核',''),(82,'2026-04-05 02:00:00','琼州海鲜坊','海南省三亚市天涯区三亚湾路88号','upload/qiye_qiyetupian41.jpg','李琼海','13823888921','海鲜处理工','三亚','餐饮',1,4300,'不限','能处理各类海鲜','8小时','<p>负责海鲜宰杀、清洗、食材分类、冰柜管理。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(83,'2026-04-05 02:00:00','山城小面馆','重庆市渝中区解放碑路33号','upload/qiye_qiyetupian42.jpg','张重庆','13823888922','小面师傅','重庆','餐饮',3,6400,'初中及以上','专业重庆小面制作','8小时','<p>负责小面煮制、调料调配、汤底熬制。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'待审核',''),(84,'2026-04-05 02:00:00','山城小面馆','重庆市渝中区解放碑路33号','upload/qiye_qiyetupian42.jpg','张重庆','13823888922','面馆服务员','重庆','餐饮',1,4200,'不限','手脚麻利','8小时','<p>负责端面、收碗、店面清洁、点餐服务。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',210,9,27,'待审核',''),(85,'2026-04-05 02:00:00','蓉城小吃馆','四川省成都市青羊区宽窄巷子路22号','upload/qiye_qiyetupian43.jpg','刘蓉城','13823888923','小吃师傅','成都','餐饮',2,5900,'初中及以上','会做担担面、钟水饺等','8小时','<p>负责成都特色小吃制作、出餐把控。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,16,44,'待审核',''),(86,'2026-04-05 02:00:00','蓉城小吃馆','四川省成都市青羊区宽窄巷子路22号','upload/qiye_qiyetupian43.jpg','刘蓉城','13823888923','小吃店员','成都','餐饮',1,4300,'不限','能适应客流高峰','8小时','<p>负责点餐、打包、卫生清洁、食材准备。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(87,'2026-04-05 02:00:00','夜郎食府','贵州省遵义市红花岗区中山路55号','upload/qiye_qiyetupian44.jpg','王夜郎','13823888924','黔菜厨师','遵义','餐饮',3,7100,'初中及以上','擅长遵义特色黔菜','8小时','<p>负责黔菜炒制、酸汤制作、菜品研发。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'待审核',''),(88,'2026-04-05 02:00:00','夜郎食府','贵州省遵义市红花岗区中山路55号','upload/qiye_qiyetupian44.jpg','王夜郎','13823888924','服务员','遵义','餐饮',1,4400,'不限','服务热情','8小时','<p>负责点餐、上菜、桌面维护、客户接待。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(89,'2026-04-05 02:00:00','七彩云南饭庄','云南省大理市古城区大理路77号','upload/qiye_qiyetupian45.jpg','杨大理','13823888925','滇菜厨师','大理','餐饮',3,7300,'初中及以上','擅长大理特色滇菜、野生菌烹饪','8小时','<p>负责滇菜制作、野生菌加工、宴席菜品。</p>','2027-04-05 10:00:00',14,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',390,19,51,'待审核',''),(90,'2026-04-05 02:00:00','七彩云南饭庄','云南省大理市古城区大理路77号','upload/qiye_qiyetupian45.jpg','杨大理','13823888925','服务员','大理','餐饮',1,4500,'不限','了解民族文化优先','8小时','<p>负责客户接待、点餐、上菜、民族特色服务。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',240,11,31,'待审核',''),(91,'2026-04-05 02:00:00','藏乡风味馆','青海省玉树市结古镇胜利路44号','upload/qiye_qiyetupian46.jpg','扎西顿珠','13823888926','藏餐厨师','玉树','餐饮',2,6800,'初中及以上','熟悉藏乡风味菜品','8小时','<p>负责藏餐、奶茶、糌粑、特色菜品制作。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',350,16,45,'待审核',''),(92,'2026-04-05 02:00:00','藏乡风味馆','青海省玉树市结古镇胜利路44号','upload/qiye_qiyetupian46.jpg','扎西顿珠','13823888926','服务员','玉树','餐饮',0,4200,'不限','能适应高原环境','8小时','<p>负责点餐、出餐、店面清洁、客户服务。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',180,8,24,'待审核',''),(93,'2026-04-05 02:00:00','西夏食府','宁夏银川市西夏区怀远路66号','upload/qiye_qiyetupian47.jpg','李西夏','13823888927','西夏菜厨师','银川','餐饮',3,7200,'初中及以上','擅长西夏特色菜、羊肉菜品','8小时','<p>负责西夏风味菜、手抓羊肉、烤羊制作。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'待审核',''),(94,'2026-04-05 02:00:00','西夏食府','宁夏银川市西夏区怀远路66号','upload/qiye_qiyetupian47.jpg','李西夏','13823888927','切配工','银川','餐饮',1,4300,'不限','会处理羊肉食材','8小时','<p>负责羊肉切配、食材预处理、后厨卫生。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',210,9,27,'待审核',''),(95,'2026-04-05 02:00:00','金城牛肉面','甘肃省白银市白银区人民路88号','upload/qiye_qiyetupian48.jpg','马白银','13823888928','牛肉面师傅','白银','餐饮',3,6600,'初中及以上','专业牛肉面、拉面技术','8小时','<p>负责拉面、汤底熬制、萝卜切配、调料调配。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,16,43,'待审核',''),(96,'2026-04-05 02:00:00','金城牛肉面','甘肃省白银市白银区人民路88号','upload/qiye_qiyetupian48.jpg','马白银','13823888928','面馆服务员','白银','餐饮',1,4200,'不限','工作积极','8小时','<p>负责端面、收碗、点餐、店面清洁。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(97,'2026-04-05 02:00:00','三秦食府','陕西省宝鸡市渭滨区经二路55号','upload/qiye_qiyetupian49.jpg','王宝鸡','13823888929','陕菜厨师','宝鸡','餐饮',3,7000,'初中及以上','擅长宝鸡特色陕菜','8小时','<p>负责陕菜制作、臊子面、凉皮加工。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',360,17,46,'待审核',''),(98,'2026-04-05 02:00:00','三秦食府','陕西省宝鸡市渭滨区经二路55号','upload/qiye_qiyetupian49.jpg','王宝鸡','13823888929','小吃制作员','宝鸡','餐饮',1,4300,'不限','会制作凉皮、臊子面优先','8小时','<p>负责小吃制作、出餐、店面卫生。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(99,'2026-04-05 02:00:00','晋阳面馆','山西省大同市平城区魏都大道77号','upload/qiye_qiyetupian50.jpg','赵大同','13823888930','面食师傅','大同','餐饮',2,5800,'初中及以上','擅长山西各类面食','8小时','<p>负责刀削面、剔尖、各类山西面食制作。</p>','2027-04-05 10:00:00',11,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',320,15,41,'待审核',''),(100,'2026-04-05 02:00:00','晋阳面馆','山西省大同市平城区魏都大道77号','upload/qiye_qiyetupian50.jpg','赵大同','13823888930','服务员','大同','餐饮',1,4200,'不限','吃苦耐劳','8小时','<p>负责点餐、端面、收碗、店面清洁。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(101,'2026-04-05 02:00:00','燕赵食府','河北省石家庄市长安区中山路99号','upload/qiye_qiyetupian51.jpg','刘石家庄','13823888931','冀菜厨师','石家庄','餐饮',3,7100,'初中及以上','擅长河北冀菜、驴肉火烧制作','8小时','<p>负责冀菜制作、驴肉火烧加工、菜品把控。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'待审核',''),(102,'2026-04-05 02:00:00','燕赵食府','河北省石家庄市长安区中山路99号','upload/qiye_qiyetupian51.jpg','刘石家庄','13823888931','小吃店员','石家庄','餐饮',1,4300,'不限','服务意识强','8小时','<p>负责点餐、打包、店面清洁、客户接待。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(103,'2026-04-05 02:00:00','齐鲁小吃城','山东省青岛市市南区香港中路66号','upload/qiye_qiyetupian52.jpg','王青岛','13823888932','鲁味小吃师傅','青岛','餐饮',3,6800,'初中及以上','擅长青岛特色小吃、海鲜小吃','8小时','<p>负责齐鲁特色小吃、海鲜小吃制作。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',350,16,45,'待审核',''),(104,'2026-04-05 02:00:00','齐鲁小吃城','山东省青岛市市南区香港中路66号','upload/qiye_qiyetupian52.jpg','王青岛','13823888932','服务员','青岛','餐饮',1,4500,'不限','形象良好','8小时','<p>负责点餐、上菜、桌面维护、客户服务。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',250,12,32,'待审核',''),(105,'2026-04-05 02:00:00','津门小吃铺','天津市南开区古文化街44号','upload/qiye_qiyetupian53.jpg','张天津','13823888933','津味小吃师傅','天津','餐饮',2,5900,'初中及以上','会做天津麻花、煎饼果子','8小时','<p>负责天津特色小吃、面点制作。</p>','2027-04-05 10:00:00',11,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',320,15,41,'待审核',''),(106,'2026-04-05 02:00:00','津门小吃铺','天津市南开区古文化街44号','upload/qiye_qiyetupian53.jpg','张天津','13823888933','营业员','天津','餐饮',1,4200,'不限','善于沟通','8小时','<p>负责小吃售卖、打包、店面卫生、客户接待。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(107,'2026-04-05 02:00:00','魔都美食坊','上海市浦东新区陆家嘴路123号','upload/qiye_qiyetupian54.jpg','李上海','13823888934','本帮菜厨师','上海','餐饮',3,7600,'高中及以上','擅长上海本帮菜、浓油赤酱菜品','8小时','<p>负责本帮菜炒制、甜品制作、宴席菜品。</p>','2027-04-05 10:00:00',15,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',420,20,55,'待审核',''),(108,'2026-04-05 02:00:00','魔都美食坊','上海市浦东新区陆家嘴路123号','upload/qiye_qiyetupian54.jpg','李上海','13823888934','前厅服务员','上海','餐饮',1,4800,'高中及以上','形象气质佳','8小时','<p>负责高端餐厅服务、点餐、上菜、客户维护。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',280,13,37,'待审核',''),(109,'2026-04-05 02:00:00','京城烤鸭店','北京市西城区前门大街88号','upload/qiye_qiyetupian55.jpg','王北京','13823888935','烤鸭师傅','北京','餐饮',3,7900,'初中及以上','专业北京烤鸭烤制、片鸭技术','8小时','<p>负责烤鸭烤制、片鸭、酱料调配、鸭架处理。</p>','2027-04-05 10:00:00',16,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',450,22,60,'待审核',''),(110,'2026-04-05 02:00:00','京城烤鸭店','北京市西城区前门大街88号','upload/qiye_qiyetupian55.jpg','王北京','13823888935','服务员','北京','餐饮',2,4700,'高中及以上','有高端餐厅服务经验','8小时','<p>负责烤鸭讲解、点餐、上菜、客户接待。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',290,14,38,'待审核',''),(111,'2026-04-05 02:00:00','苏杭茶宴楼','江苏省苏州市姑苏区平江路33号','upload/qiye_qiyetupian56.jpg','陈苏州','13823888936','茶宴厨师','苏州','餐饮',2,7200,'高中及以上','擅长苏杭茶宴、精致菜品','8小时','<p>负责茶宴菜品、苏杭小吃、精致点心制作。</p>','2027-04-05 10:00:00',14,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',400,19,51,'待审核',''),(112,'2026-04-05 02:00:00','苏杭茶宴楼','江苏省苏州市姑苏区平江路33号','upload/qiye_qiyetupian56.jpg','陈苏州','13823888936','茶艺服务员','苏州','餐饮',1,4900,'高中及以上','懂茶艺优先','8小时','<p>负责茶艺服务、点餐、茶点上菜、客户讲解。</p>','2027-04-05 10:00:00',11,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',310,14,39,'待审核',''),(113,'2026-04-05 02:00:00','瓯越海鲜楼','浙江省温州市鹿城区江滨路77号','upload/qiye_qiyetupian57.jpg','林温州','13823888937','海鲜厨师','温州','餐饮',4,8900,'高中及以上','擅长瓯越菜、海鲜烹饪','8小时','<p>负责温州海鲜、瓯菜制作、宴席菜品研发。</p>','2027-04-05 10:00:00',16,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',460,22,61,'待审核',''),(114,'2026-04-05 02:00:00','瓯越海鲜楼','浙江省温州市鹿城区江滨路77号','upload/qiye_qiyetupian57.jpg','林温州','13823888937','海鲜杀洗工','温州','餐饮',1,4400,'不限','能处理各类海鲜','8小时','<p>负责海鲜宰杀、清洗、食材分类、冰柜管理。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',210,9,27,'待审核',''),(115,'2026-04-05 02:00:00','庐州菜馆','安徽省芜湖市镜湖区中山路66号','upload/qiye_qiyetupian58.jpg','张芜湖','13823888938','徽菜厨师','芜湖','餐饮',3,7300,'初中及以上','擅长芜湖徽菜、长江鲜鱼烹制','8小时','<p>负责徽菜制作、鲜鱼加工、口味把控。</p>','2027-04-05 10:00:00',14,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',400,19,51,'待审核',''),(116,'2026-04-05 02:00:00','庐州菜馆','安徽省芜湖市镜湖区中山路66号','upload/qiye_qiyetupian58.jpg','张芜湖','13823888938','服务员','芜湖','餐饮',1,4500,'不限','服务热情','8小时','<p>负责点餐、上菜、桌面清洁、客户接待。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',250,12,32,'待审核',''),(117,'2026-04-05 02:00:00','鹭岛小吃馆','福建省厦门市湖里区SM城市广场路55号','upload/qiye_qiyetupian59.jpg','陈厦门','13823888939','闽南小吃师傅','厦门','餐饮',2,6100,'初中及以上','会做沙茶面、土笋冻等闽南小吃','8小时','<p>负责闽南特色小吃、沙茶面制作。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',340,16,44,'待审核',''),(118,'2026-04-05 02:00:00','鹭岛小吃馆','福建省厦门市湖里区SM城市广场路55号','upload/qiye_qiyetupian59.jpg','陈厦门','13823888939','小吃店员','厦门','餐饮',1,4400,'不限','能适应客流高峰','8小时','<p>负责点餐、打包、店面清洁、食材准备。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',230,10,29,'待审核',''),(119,'2026-04-05 02:00:00','浔味菜馆','江西省九江市浔阳区浔阳路88号','upload/qiye_qiyetupian60.jpg','李九江','13823888940','赣味厨师','九江','餐饮',3,6900,'初中及以上','擅长九江浔味菜、鱼鲜烹制','8小时','<p>负责浔味特色菜、长江鱼鲜、菜品炒制。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'待审核',''),(120,'2026-04-05 02:00:00','浔味菜馆','江西省九江市浔阳区浔阳路88号','upload/qiye_qiyetupian60.jpg','李九江','13823888940','服务员','九江','餐饮',1,4400,'不限','吃苦耐劳','8小时','<p>负责点餐、上菜、卫生清洁、客户服务。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(121,'2026-04-05 02:00:00','宜品家常菜','湖北省宜昌市西陵区夷陵路77号','upload/qiye_qiyetupian61.jpg','王宜昌','13823888941','家常菜厨师','宜昌','餐饮',3,6800,'初中及以上','擅长宜昌家常菜、清江鱼烹制','8小时','<p>负责家常菜炒制、清江鱼加工、口味把控。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',350,16,45,'待审核',''),(122,'2026-04-05 02:00:00','宜品家常菜','湖北省宜昌市西陵区夷陵路77号','upload/qiye_qiyetupian61.jpg','王宜昌','13823888941','后厨助理','宜昌','餐饮',1,4200,'不限','能配合厨师工作','8小时','<p>负责食材处理、后厨卫生、餐具清洗。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',200,9,26,'待审核',''),(123,'2026-04-05 02:00:00','潭州菜馆','湖南省湘潭市岳塘区建设中路66号','upload/qiye_qiyetupian62.jpg','刘湘潭','13823888942','湘菜厨师','湘潭','餐饮',3,7000,'初中及以上','擅长湘潭湘菜、腊味菜品','8小时','<p>负责湘菜炒制、腊味加工、口味把控。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',360,17,46,'待审核',''),(124,'2026-04-05 02:00:00','潭州菜馆','湖南省湘潭市岳塘区建设中路66号','upload/qiye_qiyetupian62.jpg','刘湘潭','13823888942','服务员','湘潭','餐饮',1,4400,'不限','服务主动','8小时','<p>负责点餐、上菜、桌面清洁、客户接待。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(125,'2026-04-05 02:00:00','鹏城海鲜酒楼','广东省深圳市南山区科技园路99号','upload/qiye_qiyetupian63.jpg','陈深圳','13823888943','粤菜厨师','深圳','餐饮',4,9200,'高中及以上','擅长高端粤菜、海鲜烹饪','8小时','<p>负责粤菜、海鲜、燕鲍翅、高端宴席制作。</p>','2027-04-05 10:00:00',17,9,'2027-04-05 10:00:00','2027-04-05 10:00:00',480,23,63,'待审核',''),(126,'2026-04-05 02:00:00','鹏城海鲜酒楼','广东省深圳市南山区科技园路99号','upload/qiye_qiyetupian63.jpg','陈深圳','13823888943','高端服务员','深圳','餐饮',2,5200,'大专及以上','形象气质佳、有高端服务经验','8小时','<p>负责高端宴席服务、点餐、客户维护、包厢服务。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',350,16,45,'待审核',''),(127,'2026-04-05 02:00:00','柳味螺蛳粉馆','广西柳州市城中区五星街44号','upload/qiye_qiyetupian64.jpg','韦柳州','13823888944','螺蛳粉师傅','柳州','餐饮',3,6300,'初中及以上','专业柳州螺蛳粉制作','8小时','<p>负责螺蛳粉熬汤、烫粉、配料调配、出餐。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'待审核',''),(128,'2026-04-05 02:00:00','柳味螺蛳粉馆','广西柳州市城中区五星街44号','upload/qiye_qiyetupian64.jpg','韦柳州','13823888944','店员','柳州','餐饮',1,4200,'不限','手脚麻利','8小时','<p>负责点餐、打包、店面清洁、餐具回收。</p>','2027-04-05 10:00:00',7,3,'2027-04-05 10:00:00','2027-04-05 10:00:00',210,9,27,'待审核',''),(129,'2026-04-05 02:00:00','椰岛风情餐厅','海南省海口市龙华区解放东路77号','upload/qiye_qiyetupian65.jpg','李海口','13823888945','海南菜厨师','海口','餐饮',3,7400,'初中及以上','擅长海南菜、文昌鸡、海鲜制作','8小时','<p>负责海南特色菜、文昌鸡、海鲜加工。</p>','2027-04-05 10:00:00',14,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',400,19,51,'待审核',''),(130,'2026-04-05 02:00:00','椰岛风情餐厅','海南省海口市龙华区解放东路77号','upload/qiye_qiyetupian65.jpg','李海口','13823888945','服务员','海口','餐饮',1,4500,'不限','热情开朗','8小时','<p>负责点餐、上菜、店面清洁、客户服务。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',250,12,32,'待审核',''),(131,'2026-04-05 02:00:00','巴渝火锅城','重庆市江北区观音桥步行街33号','upload/qiye_qiyetupian66.jpg','张重庆','13823888946','火锅厨师','重庆','餐饮',3,7200,'初中及以上','专业重庆火锅、锅底炒制','8小时','<p>负责火锅锅底炒制、调料调配、后厨管理。</p>','2027-04-05 10:00:00',15,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',430,21,57,'待审核',''),(132,'2026-04-05 02:00:00','巴渝火锅城','重庆市江北区观音桥步行街33号','upload/qiye_qiyetupian66.jpg','张重庆','13823888946','传菜员','重庆','餐饮',2,4300,'不限','体力好、能吃苦','8小时','<p>负责菜品传递、餐具回收、后厨协助。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',230,10,29,'待审核',''),(133,'2026-04-05 02:00:00','绵州菜馆','四川省绵阳市涪城区临园路55号','upload/qiye_qiyetupian67.jpg','刘绵阳','13823888947','川菜厨师','绵阳','餐饮',3,6900,'初中及以上','擅长绵阳川菜、江湖菜','8小时','<p>负责川菜炒制、江湖菜、口味把控。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'待审核',''),(134,'2026-04-05 02:00:00','绵州菜馆','四川省绵阳市涪城区临园路55号','upload/qiye_qiyetupian67.jpg','刘绵阳','13823888947','服务员','绵阳','餐饮',1,4400,'不限','服务热情','8小时','<p>负责点餐、上菜、桌面维护、客户接待。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(135,'2026-04-05 02:00:00','凉都食府','贵州省六盘水市钟山区钟山大道88号','upload/qiye_qiyetupian68.jpg','王六盘水','13823888948','黔菜厨师','六盘水','餐饮',3,7000,'初中及以上','擅长凉都特色黔菜、烙锅制作','8小时','<p>负责黔菜、烙锅、特色菜品制作、研发。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',360,17,46,'待审核',''),(136,'2026-04-05 02:00:00','凉都食府','贵州省六盘水市钟山区钟山大道88号','upload/qiye_qiyetupian68.jpg','王六盘水','13823888948','服务员','六盘水','餐饮',1,4400,'不限','能适应晚班','8小时','<p>负责点餐、上菜、店面清洁、客户服务。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'待审核',''),(137,'2026-04-05 02:00:00','香格⾥拉风味馆','云南省迪庆州香格里拉市建塘路77号','upload/qiye_qiyetupian69.jpg','杨香格里拉','13823888949','藏滇菜厨师','香格里拉','餐饮',3,7600,'初中及以上','擅长藏滇融合菜、高原食材烹饪','8小时','<p>负责藏餐、滇菜、高原特色菜品制作。</p>','2027-04-05 10:00:00',14,7,'2027-04-05 10:00:00','2027-04-05 10:00:00',410,20,53,'待审核',''),(138,'2026-04-05 02:00:00','香格⾥拉风味馆','云南省迪庆州香格里拉市建塘路77号','upload/qiye_qiyetupian69.jpg','杨香格里拉','13823888949','服务员','香格里拉','餐饮',1,4600,'不限','能适应高原环境','8小时','<p>负责客户接待、点餐、上菜、民族特色服务。</p>','2027-04-05 10:00:00',9,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',260,12,33,'待审核',''),(139,'2026-04-05 02:00:00','撒拉风味馆','青海省海东市循化县积石镇66号','upload/qiye_qiyetupian70.jpg','马撒拉','13823888950','撒拉菜厨师','海东','餐饮',2,6700,'初中及以上','擅长撒拉族特色菜、面食','8小时','<p>负责撒拉族特色菜、面食、高原菜品制作。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',350,16,45,'待审核',''),(140,'2026-04-05 02:00:00','撒拉风味馆','青海省海东市循化县积石镇66号','upload/qiye_qiyetupian70.jpg','马撒拉','13823888950','服务员','海东','餐饮',0,4200,'不限','工作认真','8小时','<p>负责点餐、出餐、店面清洁、客户服务。</p>','2027-04-05 10:00:00',6,2,'2027-04-05 10:00:00','2027-04-05 10:00:00',180,8,24,'待审核',''),(141,'2026-04-05 02:00:00','回乡居','宁夏吴忠市利通区朝阳路55号','upload/qiye_qiyetupian71.jpg','李吴忠','13823888951','回乡菜厨师','吴忠','餐饮',3,7100,'初中及以上','擅长回乡特色菜、羊肉菜品','8小时','<p>负责回乡风味菜、手抓羊肉、特色菜品制作。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'是','通过'),(143,'2026-04-05 02:00:00','伏羲菜馆','甘肃省天水市秦州区民主路88号','upload/qiye_qiyetupian72.jpg','马天水','13823888952','陇菜厨师','天水','餐饮',3,6800,'初中及以上','擅长天水陇菜、面食','8小时','<p>负责陇菜、天水特色菜、面食制作。</p>','2027-04-05 10:00:00',12,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',350,16,45,'是','通过'),(146,'2026-04-05 02:00:00','古雍州食府','陕西省咸阳市秦都区人民路77号','upload/qiye_qiyetupian73.jpg','王咸阳','13823888953','小吃制作员','咸阳','餐饮',1,4300,'不限','会制作特色小吃优先','8小时','<p>负责小吃制作、出餐、店面卫生。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'是','通过'),(147,'2026-04-05 02:00:00','云冈食府','山西省大同市云冈区云冈路99号','upload/qiye_qiyetupian74.jpg','赵云冈','13823888954','晋菜厨师','大同','餐饮',3,6900,'初中及以上','擅长云冈晋菜、大同特色菜','8小时','<p>负责晋菜、大同特色菜、面食制作。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'是','通过'),(150,'2026-04-05 02:00:00','邯郸食府','河北省邯郸市丛台区中华大街66号','upload/qiye_qiyetupian75.jpg','刘邯郸','13823888955','小吃店员','邯郸','餐饮',1,4300,'不限','服务意识强','8小时','<p>负责点餐、打包、店面清洁、客户接待。</p>','2027-04-05 10:00:00',8,4,'2027-04-05 10:00:00','2027-04-05 10:00:00',220,10,28,'是','通过'),(151,'2026-04-05 02:00:00','岛城海鲜坊','山东省烟台市芝罘区南大街88号','upload/qiye_qiyetupian76.jpg','王烟台','13823888956','海鲜厨师','烟台','餐饮',4,8800,'高中及以上','擅长胶东海鲜、鲁菜烹饪','8小时','<p>负责胶东海鲜、鲁菜、宴席菜品制作。</p>','2027-04-05 10:00:00',16,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',450,22,60,'是','通过'),(153,'2026-04-05 02:00:00','潍县菜馆','山东省潍坊市奎文区东风东街55号','upload/qiye_qiyetupian77.jpg','王潍坊','13823888957','鲁菜厨师','潍坊','餐饮',3,7100,'初中及以上','擅长潍县鲁菜、特色萝卜菜品','8小时','<p>负责鲁菜、潍县特色菜、萝卜菜品制作。</p>','2027-04-05 10:00:00',13,6,'2027-04-05 10:00:00','2027-04-05 10:00:00',370,18,47,'是','通过'),(155,'2026-04-05 02:00:00','运河食府','江苏省扬州市广陵区文昌路77号','upload/qiye_qiyetupian78.jpg','陈扬州','13823888958','淮扬菜厨师','扬州','餐饮',3,7800,'高中及以上','正宗淮扬菜、扬州菜制作经验','8小时','<p>负责淮扬菜、扬州特色菜、精致菜品制作。</p>','2027-04-05 10:00:00',15,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',440,21,58,'是','通过'),(158,'2026-04-05 02:00:00','太湖船菜馆','江苏省无锡市滨湖区太湖大道99号','upload/qiye_qiyetupian79.jpg','王无锡','13823888959','服务员','无锡','餐饮',1,4700,'高中及以上','形象气质佳','8小时','<p>负责高端服务、点餐、上菜、客户维护。</p>','2027-04-05 10:00:00',10,5,'2027-04-05 10:00:00','2027-04-05 10:00:00',290,14,38,'是','通过'),(159,'2026-04-05 02:00:00','孔府菜馆','山东省济宁市曲阜市静轩东路66号','upload/qiye_qiyetupian80.jpg','孔曲阜','13823888960','孔府菜厨师','济宁','餐饮',3,7700,'高中及以上','擅长孔府菜、儒家文化菜、鲁菜','8小时','<p>负责孔府菜、高端鲁菜、文化宴席制作。</p>','2027-04-05 10:00:00',16,8,'2027-04-05 10:00:00','2027-04-05 10:00:00',461,22,61,'是','通过');
/*!40000 ALTER TABLE `jiuyexinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luyongxinxi`
--

DROP TABLE IF EXISTS `luyongxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `luyongxinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `luyongbianhao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '录用编号',
  `qiyemingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `qiyetupian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '企业图片',
  `gangweileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '录用岗位',
  `luyongshijian` datetime DEFAULT NULL COMMENT '录用时间',
  `qiuzhizhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职账号',
  `qiuzhixingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职姓名',
  `luyongdizhi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tongzhineirong` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `luyongbianhao` (`luyongbianhao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='录用信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luyongxinxi`
--

LOCK TABLES `luyongxinxi` WRITE;
/*!40000 ALTER TABLE `luyongxinxi` DISABLE KEYS */;
INSERT INTO `luyongxinxi` VALUES (13,'2026-04-02 13:43:29','20260402326','粤点王茶餐厅','upload/qiye_qiyetupian4.jpg','传菜员','2026-04-02 21:43:10','liumei','刘梅','2028','已被录用');
/*!40000 ALTER TABLE `luyongxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '留言人id',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '留言内容',
  `cpicture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '留言图片',
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  `rpicture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '回复图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='留言反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'2025-01-06 04:20:59',1,'用户名1','upload/messages_avatarurl1.jpg','留言内容1','upload/messages_cpicture1.jpg','回复内容1','upload/messages_rpicture1.jpg'),(2,'2025-01-06 04:20:59',2,'用户名2','upload/messages_avatarurl2.jpg','留言内容2','upload/messages_cpicture2.jpg','回复内容2','upload/messages_rpicture2.jpg'),(3,'2025-01-06 04:20:59',3,'用户名3','upload/messages_avatarurl3.jpg','留言内容3','upload/messages_cpicture3.jpg','回复内容3','upload/messages_rpicture3.jpg'),(4,'2025-01-06 04:20:59',4,'用户名4','upload/messages_avatarurl4.jpg','留言内容4','upload/messages_cpicture4.jpg','回复内容4','upload/messages_rpicture4.jpg'),(5,'2025-01-06 04:20:59',5,'用户名5','upload/messages_avatarurl5.jpg','留言内容5','upload/messages_cpicture5.jpg','回复内容5','upload/messages_rpicture5.jpg'),(6,'2025-01-06 04:20:59',6,'用户名6','upload/messages_avatarurl6.jpg','留言内容6','upload/messages_cpicture6.jpg','回复内容6','upload/messages_rpicture6.jpg'),(7,'2025-01-06 04:20:59',7,'用户名7','upload/messages_avatarurl7.jpg','留言内容7','upload/messages_cpicture7.jpg','回复内容7','upload/messages_rpicture7.jpg'),(8,'2025-01-06 04:20:59',8,'用户名8','upload/messages_avatarurl8.jpg','留言内容8','upload/messages_cpicture8.jpg','回复内容8','upload/messages_rpicture8.jpg'),(9,'2025-01-06 04:23:09',11,'zhangwei','upload/qiuzhizhe_touxiang1.jpg','<p>1111</p>',NULL,'<p>21212</p>',NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mianshixinxi`
--

DROP TABLE IF EXISTS `mianshixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mianshixinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qiyemingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `qiyetupian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '企业图片',
  `fuzeren` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `qiyedizhi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业地址',
  `gangweileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位类型',
  `mianshijieguo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '面试结果',
  `mianshishijian` datetime DEFAULT NULL COMMENT '面试时间',
  `qiuzhizhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职账号',
  `qiuzhixingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职姓名',
  `shifoucanchu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '未确认' COMMENT '是否参加',
  `mianshixingshi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '线下面试' COMMENT '面试形式',
  `mianshididian` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '面试地点/链接',
  `mianshitongzhi` text COLLATE utf8mb4_unicode_ci COMMENT '面试通知',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='面试信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mianshixinxi`
--

LOCK TABLES `mianshixinxi` WRITE;
/*!40000 ALTER TABLE `mianshixinxi` DISABLE KEYS */;
INSERT INTO `mianshixinxi` VALUES (2,'2027-04-05 16:00:00','悦享咖啡有限公司','upload/mianshixinxi_qiyetupian2.jpg,upload/mianshixinxi_qiyetupian3.jpg,upload/mianshixinxi_qiyetupian4.jpg','林晓雨','河南省郑州市金水区林业路123号','服务员','已录用','2025-01-06 12:20:59','wangfang','王芳','是','线下面试',NULL,NULL),(3,'2027-04-05 16:00:00','蜀味香川菜馆','upload/mianshixinxi_qiyetupian3.jpg,upload/mianshixinxi_qiyetupian4.jpg,upload/mianshixinxi_qiyetupian5.jpg','刘大川','上海市黄浦区南京东路123号','切配师','已录用','2025-01-06 12:20:59','liqiang','李强','是','线下面试',NULL,NULL),(5,'2027-04-05 16:00:00','江南味道私房菜','upload/mianshixinxi_qiyetupian5.jpg,upload/mianshixinxi_qiyetupian6.jpg,upload/mianshixinxi_qiyetupian7.jpg','周雅琴','广州市天河区天河路300号','传菜员','已录用','2025-01-06 12:20:59','wangming','王明','是','线下面试',NULL,NULL),(6,'2027-04-05 16:00:00','烧烤部落餐饮有限公司','upload/mianshixinxi_qiyetupian6.jpg,upload/mianshixinxi_qiyetupian7.jpg,upload/mianshixinxi_qiyetupian8.jpg','赵大勇','江苏省苏州市太湖区58号','凉菜师傅','已录用','2025-01-06 12:20:59','limin','李敏','是','线下面试',NULL,NULL),(7,'2027-04-05 16:00:00','粥满堂养生粥铺','upload/mianshixinxi_qiyetupian7.jpg,upload/mianshixinxi_qiyetupian8.jpg,upload/mianshixinxi_qiyetupian1.jpg','孙文静','浙江省杭州市西湖区龙井路78号','洗碗工','已录用','2025-01-06 12:20:59','zhangyang','张洋','是','线下面试',NULL,NULL),(8,'2027-04-05 16:00:00','披萨工坊西餐厅','upload/mianshixinxi_qiyetupian8.jpg,upload/mianshixinxi_qiyetupian1.jpg,upload/mianshixinxi_qiyetupian2.jpg','吴凯文','湖北省武汉市武昌区中南路22号','店长','已录用','2025-01-06 12:20:59','wangjing','王静','是','线下面试',NULL,NULL),(16,'2027-04-05 16:00:00','粤点王茶餐厅','upload/qiye_qiyetupian4.jpg','黄志明','四川省成都市锦江区春熙路56号','传菜员','已录用','2026-04-03 00:00:00','liumei','刘梅','是','现场面试','','123'),(17,'2026-04-09 12:49:13','蜀味香川菜馆','upload/qiye_qiyetupian3.jpg','刘大川','上海市黄浦区南京东路123号','传菜员',NULL,'2026-04-12 00:00:00','xuyan','徐燕','未确认','现场面试','302','5.30到302面试');
/*!40000 ALTER TABLE `mianshixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `typename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人',
  `headportrait` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `clicknum` int DEFAULT '0' COMMENT '点击次数',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `thumbsupnum` int DEFAULT '0' COMMENT '赞',
  `crazilynum` int DEFAULT '0' COMMENT '踩',
  `storeupnum` int DEFAULT '0' COMMENT '收藏数',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='新闻资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'2025-01-06 04:20:59','趁着年轻，输得起，看得开，去经历','我在大学一年级那一年，毫无悬念地把自己吃成了一个胖子。不是那种巨大的胖子，而是介于正规的肥胖和臃肿之间的尴尬体型，比标准体型重了15斤。于是，我的整个大学生活变成了电影《蝴蝶效应》系列，那只蝴蝶重达15斤','分类名称1','发布人1','upload/news_headportrait1.jpg',2,'2026-04-05 17:11:10',1,1,1,'upload/news_picture1.jpg','<p>我在大学一年级那一年，毫无悬念地把自己吃成了一个胖子。不是那种巨大的胖子，而是介于正规的肥胖和臃肿之间的尴尬体型，比标准体型重了15斤。于是，我的整个大学生活变成了电影《蝴蝶效应》系列，那只蝴蝶重达15斤。</p><p>  首先，我皈依了减肥。我可以整整一天滴水不进，然后第二天中午，一个小时之内连续去三个食堂吃午饭，每次都是两荤一素、一两米饭加一瓶大可乐，像是一个人孢子分裂出了三个暴食症患者。其次，因为要么饿得百爪挠心，要么撑得寝食难安，我变成了一个昼夜颠倒的人，再加上觉得自己邋遢难看，不愿见人，便逃掉了很多课。其三，逃课的空虚让我花了大量时间网购，击败了全国90%以上的电商消费者，和快递员结下了深厚的友谊。我买的大多数是衣服，衣服又穿不进，羞愤难当，继续皈依减肥。总之，那是我非常不快乐的几年。因为难以接受自己，所以蜷缩着，拒绝他人。</p><p>    我很久之后才知道，人用来自憎的大脑边缘系统，在童年时就已经形成。可是，用来开导自己、原谅自己、使自己变得强大的智慧，却往往在我们本该成熟的年纪依然不具备。每一世代的年轻人都是脆弱的、敏感的、容易受他人影响的。而对于正年轻的一代来说，这个挑战异乎寻常的艰难。</p><p> 电影《楚门的世界》中提出了一个假设以及相应的解答:当一个人活在所有人的窥探之下，他应该怎么办?答案是:他逃走，获得自由。然而，如果所有人活在所有人的窥探之下，那又该如何逃避?这不是假设，而是正在悄然发生的现实。我们无时无刻不在朋友圈、微博、贴吧、个人主页上展现自己的生活，同时，也在同样的平台上窥探他人的生活。我们无时无刻不在评估他人，同时，也在接受他人的评估。“个性张扬”只是狐假虎威的外衣，为的是掩饰自卑与自恋此起彼伏、相爱相杀的脆弱。我们羡慕嫉妒他人，也努力把自己的生活修饰得让他人羡慕嫉妒。我们对他人的意见过于敏感，无法忍受不被“点赞”的人生。</p><p>  社交网络的核心在于“社交”，社交的动力，是出于人们无法忍受孤独;人们之所以无法忍受孤独，是因为人们无法拷问自己。可是，总有一天，我们要站在镜子前，发现我们并不是自己创造出来的那个有趣、可爱、有吸引力、有能力的人。那么，你还喜欢镜子里的自己吗?或者，镜子里的你还喜欢自己吗?这个世界是否称赞你、羡慕你、爱你，在某种程度上是个不断膨胀的谎言。关键的问题在于，你是否对自己足够诚实，并且接受诚实之后的不完美。</p><p>   失去的痛苦、被拒绝的痛苦、被伤害的痛苦、分别的痛苦，它们如此显眼地横在前行的路上，让人想逃遁到那个充满着“赞”的虚幻世界里。然而，我们是人，走在一条从摇篮到坟墓的路上，年轻在途中，衰老在途中。必须和真实的世界发生联系，而不是兀自为尚未发生的事情恐惧;必须和真实的人发生各种关系，而不是如一座座只能遥远眺望的孤岛。</p><p>那些杀不死我们的，它们有时并不会让我们更加强大，而只是成为一段诗意或自嘲的记忆。趁着年轻，输得起，看得开，去经历。那些杀不死我们的，它们在混沌而无序的未来里，并不能成为我们手中的武器，却为我们的存活，增加了反抗脆弱与敏感的韧性。</p>'),(2,'2025-01-06 04:20:59','大学就该抓住青春，用汗水实现梦想','大学之青春，人生之春，人生之王，人生之华也，宝贵的时光我们理当去珍惜。然而，当我们在青春布满藤墓的围墙上缓慢的攀行时;依旧游离在青春摇摆不定的尾巴上时;奋力想抓却抓不住，用力一扯，却又是散落一地的音符时;我们是否该回头思考了。零零碎碎的记忆，偶尔会闪过寂寞的长空，飘然在无际的苍穹，仅仅留下几颗闪烁的残星让我们自己深思，青春易逝，好比东逝的水—去不复还','分类名称2','发布人2','upload/news_headportrait2.jpg',3,'2026-04-05 17:12:34',2,2,2,'upload/news_picture2.jpg','<p>  大学之青春，人生之春，人生之王，人生之华也，宝贵的时光我们理当去珍惜。然而，当我们在青春布满藤墓的围墙上缓慢的攀行时;依旧游离在青春摇摆不定的尾巴上时;奋力想抓却抓不住，用力一扯，却又是散落一地的音符时;我们是否该回头思考了。零零碎碎的记忆，偶尔会闪过寂寞的长空，飘然在无际的苍穹，仅仅留下几颗闪烁的残星让我们自己深思，青春易逝，好比东逝的水—去不复还。</p><p>  青春是属于我们的，是人生最最美好的时光。我们应该好好把握住现在象牙塔的点点滴滴。大学对于我们来说很重要，这里充满了好奇、机遇和挑战。当我懵懵懂懂的走过了两年才突然发现原来大学是这样的，每个人有不同的选择，有不同的理想，也有不同的人生。但是无论怎样都是一个博学的过程，学做人，学知识，学生活..…...春是疯狂的，是充满激情的，是奋斗的，最重要的是我们要坚定我们的梦想，为了梦想付出一切，为了梦想坚持到底，这才是真正的青春。青春的梦想就是黑夜里的灯塔在我们迷茫时给予我们方向，就是力量的源泉在我们身陷逆境时给予我们最大的动力，就是爱的港湾在我们屡次失败时给予我们受伤的心灵以安慰。因此无论何时何地，都不能忘却心里坚守的那份沉甸甸的梦想。</p><p>   青春的梦想很简单，可能是梦想成为学习的佼佼者让GPA无限趋于4.0，可能是梦想成为学生工作的杰出者当上主席为自己的从政事业奠定基础，也可能是梦想成为运动场上的超级明星拥有大量的球迷粉丝，也可能是梦想成为职场达人，面试无压力，就业有保障...….或许你觉得这些都算不上梦想，其实梦想并不分大小和轻重，不能说只有中国梦才算是梦想，梦想就是这样每个人有不同的定位，但都是值得去追逐的，去为之奋斗的。()拥有了梦想，就有了坚定的信念，海风再大海浪再大，也无法扼杀我们追逐胜利的信念。信念给我们坚持的勇气，勇气赐我们昂扬的斗志，斗志带我们摆脱厄运;拥有了梦想，就能化压力为动力，梦想会时刻在鞭策我们，鼓励我们，让我们审视自己，发现不足，奋力补救，让自己保持不懈的前进动力;拥有了梦想，我们就不会在迷茫的路上更加迷茫，我们就能在青春之歌复杂的五线谱中听到动人的旋律。</p><p>   我们是大学生，是祖国的未来，是民族复兴的脊梁，面对如此重任，怎么能不胸怀大志，坚定梦想，在青春的道路上奋斗。“恰同学少年，风华正茂，书生意气，挥斥方道。”青春是黄金时段，我们要以梦想为方向，扬帆起航，努力拼搏，给我们即将失去的青春以最好的结局。人因梦想而伟大，让我们一起奏响青春的梦想之歌，为各自的梦想努力进发吧!</p>'),(3,'2025-01-06 04:20:59','留退路就没有出路','公元前一世纪，凯撒大帝率领他的军队抵达了英格兰，他决心要赢得这场战争，不管遇到什么情况都不会退却。为了让士兵们明白自己必胜的决心和信心，也为了断绝士兵们逃跑退缩的念头，凯撒命令士兵将运载他们的所有船只都烧毁。这使得军队的士气受到了莫大的鼓舞。后来他们获胜了','分类名称3','发布人3','upload/news_headportrait3.jpg',3,'2025-01-06 12:20:59',3,3,3,'upload/news_picture3.jpg','<p>  公元前一世纪，凯撒大帝率领他的军队抵达了英格兰，他决心要赢得这场战争，不管遇到什么情况都不会退却。为了让士兵们明白自己必胜的决心和信心，也为了断绝士兵们逃跑退缩的念头，凯撒命令士兵将运载他们的所有船只都烧毁。这使得军队的士气受到了莫大的鼓舞。后来他们获胜了。</p><p>  很多人在处理重要问题的时候，总是喜欢把这些问题暂且搁置在一边，等以后再做。他们没有决定的勇气和魄力，总是在着手做事的时候想给自己留一条后路，以免没有出路。对于他们来说，退路就是出路。但是，事实证明，这样是不会有任何成就的。</p><p>背水一战、破釜沉舟的军队往往能获得胜利。同样，一个做事不留退路、一心向前的人，不管遇到什么困难和障碍，他都不会后退，因为他没有路可以退。而那些人在为自己准备退路的同时就是在后退，他们立志不坚，把精力和时间投入到退缩的准备上，这种人绝不会获得成功。</p><p>  一个人能否成功，关键在于他意志力的强弱。意志坚强的人不管遇到什么困难和障碍，都会百折不挠，想方设法地克服;意志薄弱的人一遇到麻烦，甚至在挫折还没有到来之前，他们就开始庸人自扰，彷徨失措，把精力都放在如何规避问题上，放在为自己铺设后路上。当困难一个接一个来时，他们就一步接一步后退，最后他们终将无路可退。</p><p>现实生活中，到处都充斥着这样的青年，他们富有上进心，希望有一番成就和作为，但是他们意志薄弱，没有必胜的决心，不敢破釜沉舟;他们始终左摇右摆，没有坚定的信念，一遇到挫折和困难，马上就缩回了进取的手和脚。这样的人，这样的心态，最后遭受失败也不足为奇。</p><p>   不给自己留后路，让自己没有回旋的余地，方能竭尽全力，锐意进取，就算遇到千万困难，也不会退缩，因为回头也没有路了，不如不顾一切地前进，还能找到一线希望。有了这样一种“拼命”和“豁出去”了的信念，才能彻彻底底地消除心中的恐惧、犹豫、胆怯。当一个人不给自己任何退路的时候，他就什么都不怕了，勇气、信心、热忱等从心底油然而生，到最后自然能“置之死地而后生”。</p><p>    面对严峻的问题和重要环节，周全而细致地考虑问题的各个方面也是应该的，但是过多地权衡，前怕狼后怕虎，一会儿这样一会儿那样，最终却还是原样，可以肯定地说，你不会有任何进展，甚至还会变得—塌糊涂。</p><p>出路和退路不是同义词，而是反义词，留退路就没有出路，因此，你应该只找出路，不留退路。大学生励志青春文章:培养积极的思维模式。</p>'),(4,'2025-01-06 04:20:59','在大学给自己定个目标','最近和几名大一的学生聊天，几名同学认为身边的人普遍都很迷茫，不知道该干什么，业余时间要么是对着电脑、要么是抱着手机刷微博。我问道:“为什么不找点事情做做，制定一个计划，哪怕是锻炼身体也好?4年也可以把身体锻炼得结实些。”当然，我也清楚，我的这些建议对他们来说，未必能有多大用。许多学生因为意志不坚定，没有老师的监督、逼迫，根本就无法做到','分类名称4','发布人4','upload/news_headportrait4.jpg',5,'2026-03-29 19:59:02',4,4,4,'upload/news_picture4.jpg','<p>  最近和几名大一的学生聊天，几名同学认为身边的人普遍都很迷茫，不知道该干什么，业余时间要么是对着电脑、要么是抱着手机刷微博。我问道:“为什么不找点事情做做，制定一个计划，哪怕是锻炼身体也好?4年也可以把身体锻炼得结实些。”当然，我也清楚，我的这些建议对他们来说，未必能有多大用。许多学生因为意志不坚定，没有老师的监督、逼迫，根本就无法做到。</p><p>   这让我想到前段时间蹿红网络的“悔过励志帖”——《同学，我大四了》，作者回首自己的大学4年，他感叹投入精力“充其量不过40%”︰每天上网时间少则4个小时，多则10个小时;考试永远是画画重点，在高呼“60分万岁”中与奖学金无缘。作者借自己求职受挫，写帖子以警醒后来人，不要等毕业时再后悔，就业难不仅仅是大学、社会的问题，也是自身的问题。</p><p>  也许，这样的大学生不是一个两个，而是一个群体。然而，我总是怀疑这样的励志帖，甚至教师在课堂上苦口婆心地劝说，能对现实中的大学和大学生起到多大的影响和作用，很多时候恐怕只有“三分钟热度”的效应。毕竟，现实的窘境不是一天积累起来的，从小学到高中，学生们的学习都是被动地接受应试，隐藏着功利性的目的，也许从没有为主动学习感到过快乐，而在高中时代，有的教师甚至打出这样的励志宣言:等你考上大学，你就可以想干什么干什么了..…..乎，高中时代的目标是很清晰的，就是为了考上大学，而在一些高中生的眼里，大学甚至就好比是天堂，进了大学的门就可以放轻松了。</p><p> 此前，有很多声音都认为大学越来越像培训机构，功利性学习正在整个大学蔓延，考证热、过早地职业化都是大学功利性学习最好的表现形式。在这种批判的声音中，“培训机构”总有被贬低的意味，难与大学之学术思想殿堂的高雅相媲美。但是，在这种批判的背后，还有一个现实问题被遮蔽，那就是很多大学生对自己的学习、对大学生活没有任何目标。</p><p>暨南大学舆情研究中心曾就“当代广州大学生生活与思想现状”作过详细的问卷调查，其中，接受调查的广州高校在读本科生共有191份有效样本，就“读大学的原因”、“大学第一印象”、“专业选择首要因素”等问题制作问卷调查并进行分析。结果显示，在未来规划方面，73.3%的同学表示只有粗略的想法，并无非常明确的目标。</p><p>  如果说功利化的学习毕竟还有一个前进的目标，至少能体现出一种为了目标而奋斗的精神和奔头，而没有任何目标，漫无目的地混日子则更可怕，它体现的是一种虚无、意义的缺失。说实话，没有引导学生树立明确的奋斗目标、进而指引学生为之努力的大学，学生很难找到努力的方向，也找不到努力的意义，这还不如“培训机构”来得实在、来得有效用，至少，培训机构的目标很清晰，它能够给学生们一个实实在在看得见的效果，而没有任何目标、浑浑噩噩的大学生活，也许只会给很多学生带来悔过。</p><p>无论如何，混日子的大学生活是不可取的。一方面，高校应该在新生入学的时候，作好目标和方向的引导，甚至贯穿大学4年的学习过程;另一方面，还在迷途的大学生，应尽早为自己找个前进的方向，作好自我规划，对自己的未来和前途负责。</p>'),(5,'2025-01-06 04:20:59','做个真正的学生','最坚强的人，是以宽容的态度面对自己缺点的人，而懦弱的人，则不敢面对自己的缺点，最终自暴自弃，葬送自己。只要有进取心，我们都能从失败的领域中，发现到达成功的途径;只要有自信心，我们身上的每一个缺陷，也都可以成为与众不同的优点','分类名称5','发布人5','upload/news_headportrait5.jpg',5,'2025-01-06 12:20:59',5,5,5,'upload/news_picture5.jpg','<p>  最坚强的人，是以宽容的态度面对自己缺点的人，而懦弱的人，则不敢面对自己的缺点，最终自暴自弃，葬送自己。只要有进取心，我们都能从失败的领域中，发现到达成功的途径;只要有自信心，我们身上的每一个缺陷，也都可以成为与众不同的优点。</p><p>曾经有人特地赶赴日本，向三宅一生服装设计大师请教如何设计出独具一格的服装款式。三宅一生大师提出两个很有意思的观点:一是，设计的衣服，其实都是没有全部完成的，其余的创作空间，则是留给穿衣服的人去完成的;二是，选择布料时，会请厂商提供纺织、印染失败的布料，从这些“残次”的作品中寻找泉涌般的创作灵感，设计出最具独创性的作品。</p><p>这样一来，顾客才能穿出自己的风格，并使得同一件衣服，在不同的人身上，能有不同的效果。而且，以这样的概念设计出来的衣服，也不容易失败。正是因为这两个观点，三宅一生所设计的服装总是独一无二地能够引领世界潮流。</p><p>  在艺术家的眼中，任何事物都是创作的最好材料，不管是枯木还是残破的布料，对他们而言，都是最具生命力的事物，在他们手中都能画腐朽为神奇。</p><p>朽木也能精雕，更何况我们自己。那些看起来弯曲、盘旋、似乎毫无用处的木料，往往最终能成为艺术品的原材料，因为这种不同，才特别珍贵。花点心思，身上的缺点也能变成独特的优点，就像艺术家们一般，顺着曲折的木头，创造出与众不同、完美无缺的惊世杰作。</p><p>励志文章3:一生学习，成就一生无知的人并不是没有学问的人，而是不明了自己的人。当一个有学问的人信赖书本、知识和权威，借着它们而了解自己，那么他便是愚蠢的。了解是由自我认识而来，而自我认识乃是一个人明白他自己的整个心理过程。因此，教育的真正意义是自我了解，因为整个生活是汇聚于我们每个人的身心的最高“机密”。</p><p>   目前我们所谓的教育，只是由书本聚集见闻、知识，这是任何懂得阅读的人都办得到的。这种教育提供了一条巧妙的逃避自我之途，如同其他所有的逃避方式一样，它无可避免地制造出有增无减的苦难。冲突和混乱是由于我们和他人、事物、概念之间差错的关系而产生，除非我们了解此项关系而改变它，否则，知识的学习和堆砌，各种技能的获取，都只会将我们导向更深的混乱和毁灭。</p><p> 我们将子女送入学校，学习一些技能，并希望借此来带动整个家庭的长久繁荣，至少在家长们年老的时候有养老保险，有稳定的照顾。我们对孩子最急切的渴望，就是将他塑造成一个能在一个领域中出类拔萃之人，希望给予他一个安全的经济地位。物质的获得有时候并不难，然而，技术的训练能使我们了解自己吗?</p><p>虽然，懂得念书写字、学习土木工程或其他某种职业，是必需的，然而技术能给予我们了解生活的能力吗?技术，无疑是次要的;如果技术是我们惟一奋力以求的东西，那么我们就摒弃了生活中最主要的东西了。</p><p>    生活，是痛苦、喜悦、美、丑、爱等多种感受的综合，一旦我们将它整体地加以了解，那么这项了解在各方面都会创出它应有的技术。不过，相反的说法就不是真的了∶技术永远无法产生创造性的了解。</p><p>如果过分强调技术，我们便毁灭了人。磨练技能和效率，然而对生活却不了解，对思想、欲望的行踪不能领悟，只会使我们变得日益残暴无情，以致于触发战争，危害了我们肉体上的安全。由于我们的教育过重于单单培养技术，已经制造出许多科学家、数学家、造桥工程师、征服太空的人，但这些人了解生活的整体过程吗?一个专家能把生活本身完整地体验感受表达出来吗?或者他真的体验到生活了吗?有时候，当他不是专家时，反而更能直指生活的本质。一颗能够给予人辉煌一生的企图心，首先应当是一颗敏感的善良的热情的心，让我们对周围的一切保持孩童一样旺盛的好奇心。我们应当渴望了解新奇的事物，渴望探索未知的领域。只有在这种理念的支配下，我们才能不断地、孜孜以求地、乐此不疲地提升自己的认知和理解能力，改善自我，从而更接近成功的巅峰。</p>'),(6,'2025-01-06 04:20:59','远大的目标是成功的磁石','上天对每个老实人都是公平的，每个人每一天都是二十四个小时，每个人的所有时间都是一生;同时上天对每个老实人又是不公平的，给每一个人的时间不都是二十四个小时，给每一个人的所有时间不都是一生。这之间的区别就在于有无远大目标','分类名称6','发布人6','upload/news_headportrait6.jpg',6,'2025-01-06 12:20:59',6,6,6,'upload/news_picture6.jpg','<p>  上天对每个老实人都是公平的，每个人每一天都是二十四个小时，每个人的所有时间都是一生;同时上天对每个老实人又是不公平的，给每一个人的时间不都是二十四个小时，给每一个人的所有时间不都是一生。这之间的区别就在于有无远大目标。</p><p>    有大目标的人，生活永远是积极的，他们会朝着自己的目标不断前进;没有大目标的老实人浑浑噩噩，不思进取，最后被生活淘汰。</p><p> 从前有个叫阿巴格的人生活在内蒙古草原上。有一次，年少的阿巴格和爸爸在草原上迷了路，阿巴格又累又怕，到最后快走不动了。爸爸就从兜里掏出五枚硬币，把一枚硬币埋在草地里，把其余四枚放在阿巴格的手上，说:“人生有五枚金币，童年、少年、青年、中年、老年各有一枚，你现在才用了一枚，就是埋在草地里的那一枚，你不能把五枚都扔在草原里，你要一点点地用，每一次都用出不同来，这样才不枉人生一世。今天我们一定要走出草原，你将来也一定要走出草原。世界很大，人活着，就要多走些地方，多看看，不要让你的金币没有用就扔掉。”在父亲的鼓励下，阿巴格走出了草原。长大后，阿巴格离开了家乡，成了一名十分优秀的船长。</p><p>  目标是与一个人的愿望相联系的，是对未来的一种设想，它往往和目前的行动不直接联系。但目标又不能脱离现实的生活，现实生活中的某些现象如果符合了个人的需要，与个人的世界观一致，这些现实的因素就会以个人目标的形式表现出来。目标总是对现实生活的重新加工，舍弃其中某些成分，又对某些因素给予强调的过程，但它必须以对客观规律的认识为基础，符合客观规律。</p><p> 能实现自己目标的老实人，对他个人而言，他是一个成功者，也是个幸福者。目标是成功的必要条件，虽然仅仅拥有目标，你不一定能取得成功;但是如果没有目标，成功对你而言就无从谈起。</p><p>远大的美好目标能吸引人努力为实现它而奋斗不止。</p>'),(7,'2025-01-06 04:20:59','做一个最好的自己','自信是成功的前提，你拥有自信，就拥有成功的一半机会。相信自己是最棒的就一定会成就一定的事业。拥有自信的人之所以会心想事成、走向成功，是因为他们都有着巨大无比的潜能等着去开发;消极失败的心态之所以会使人怯弱无能、走向失败，是因为它使人放弃潜能的开发，让潜能在那里沉睡、白白浪费','分类名称7','发布人7','upload/news_headportrait7.jpg',7,'2025-01-06 12:20:59',7,7,7,'upload/news_picture7.jpg','<p>自信是成功的前提，你拥有自信，就拥有成功的一半机会。相信自己是最棒的就一定会成就一定的事业。拥有自信的人之所以会心想事成、走向成功，是因为他们都有着巨大无比的潜能等着去开发;消极失败的心态之所以会使人怯弱无能、走向失败，是因为它使人放弃潜能的开发，让潜能在那里沉睡、白白浪费。</p><p>我们大家都知道的人大脑拥有140亿个脑细胞，但我们思维意识只利用了脑细胞的很少部分，如能将更多的脑细胞从睡眠中激活出来，人的思维意识将更加强大。如果我们都能充满自信，就能创造人间奇迹，亦能创造一个最好的自己。</p><p> 一个人相信自己是什么，就会是什么。一个人心里怎样想，就会成为怎样的人。这从心里学上讲是有一定的道理的。我们每一个人心里都有一幅心里蓝图，或是一幅自画像，有人称它为运作结果。如果你想象的是做最好的你，那么你就会在你内心的荧光屏上看到一个踌躇满志、不断进取、勇于开拓创新的自我。同时还会经常收到我做的很好，我以后还会做的更好之类的信息，这样你注定会成为一个最好的你。美国哲学家爱默生说:“人的一生正如他一天中所想的那样，你怎么想，怎么期待，就有怎样的人生。”美国有名的钢铁大王安德鲁·卡耐基就是一个充分发挥自己创造机会的楷模。他12岁时由英格兰移居美国，先是在一家纺织厂做工人，当时他的目标是“做全厂最出色的工人。”因为他经常这样想，以这样做，最终他实现了他的目标。后来命运有安排他当邮递员，他想的是怎样成为“全美最杰出的邮递员。”结果他的这一目标也实现了。他的一生总是根据自己所处的环境和地位塑造最佳的自己，他的座右铭就是“相信自己是最棒的。“</p><p>做一个最好的自己，不一定非要当什么“家”，也不一定非要出什么“名”，更不要与别人比高低、比大小。就像人的手指，有大有小，有长有短，他们各有所长，各有所短，你能说拇指比食指好吗?决定最好的你，既不是你拥有的物质财富的多少，也不是你身份的贵贱，关键是看你是否拥有实现自己理想的强烈愿望的程度，看你身上的潜力能否充分发挥。人们熟知的一些英雄模范，就是在平凡的工作岗位上充分发挥人的创新能力，做好自己身边的每一件小事，创造了做好的自己。</p><p>“塑造一个最好的自己”，这个目标人人都可以实现。你只意识到自己是大自然的一分子，坚信自己拥有“无限的能力”与“无限的可能”，这种坚定的信心能帮助你创造和谐的心理、生理韵律，建立起自己理想的自我形象，体现自己人格行为应该具有的魅力。</p>'),(8,'2025-01-06 04:20:59','有了梦想就不会感到疲惫','一段时间以前，一位在港的大陆学生，因为学业的压力、前途的渺茫等诸多原因，选择了自杀。在讨论和反思的潮流中，有一位毕业生在校内网匿名发表了自己的故事。他说，自己当年在学校也曾经面临绝境，一文不名。他选择了做“乞丐学生”，坚持着念完了课程。回忆的一些情节让我印象深刻，比如，平时偷偷住电梯间，蓬头垢面如乞丐;实在很饿，学校举办餐会的时候默默进场埋头大吃','分类名称8','发布人8','upload/news_headportrait8.jpg',10,'2026-04-08 20:07:53',8,8,8,'upload/news_picture8.jpg','<p>  一段时间以前，一位在港的大陆学生，因为学业的压力、前途的渺茫等诸多原因，选择了自杀。在讨论和反思的潮流中，有一位毕业生在校内网匿名发表了自己的故事。他说，自己当年在学校也曾经面临绝境，一文不名。他选择了做“乞丐学生”，坚持着念完了课程。回忆的一些情节让我印象深刻，比如，平时偷偷住电梯间，蓬头垢面如乞丐;实在很饿，学校举办餐会的时候默默进场埋头大吃。</p><p>“峣峣者易折，皎皎者易污。”能够从内地高校到香港读书的学子，都是一些很优秀的年轻人。不知道曾经高居象牙塔的书生，怎样狠下心，咬牙面对那一个天渊般的落差，以及旁人的目光和议论。</p><p>  说到这里，很像一个《读者》式的励志故事。但是这种励志故事从来就不缺乏感动人的力量，因为虽然光明的尾巴不是人人都能够拥有，但是人人都有梦想，面对实现过程中的困难，其奋斗或者说挣扎，却常常和平凡如你我的人们相遇。</p><p>    《当幸福来敲门/The Pursuit of Happyness》就是这样偶然被看到，又感动了我的电影。黑人克里斯是一名普普通通的医疗器械推销员，妻子忍受不了经济上的压力离开了他，留下5岁的儿子克里斯托夫和他相依为命。克里斯银行账户里只剩下21块钱，因为没钱付房租，他和儿子被撵出了公寓。费尽周折，克里斯赢得了在一家着名股票投资公司实习的机会，但是实习期间没有薪水，而且最终只有一人可以成功进入公司。</p><p>    学妹曾经告诉我一个故事，让我每次想到都觉得莫名恐怖。她说，她硕士毕业去广东求职，一个中学要招几个老师，结果南来北往的硕士博士挤了快有一个礼堂。可想而知，竞争有多么残酷。看来，中外求职者都面临着同样的挑战。但是克里斯和许多“80后”的大学毕业生不同，他更加坚韧:为了节省时间，上班时候不喝水，以避免上厕所。以疯狂的速度给客户打电话，打完一个，直接按挂机键就拨下一个电话。白天，克里斯忍受着一次又一次被拒绝的失望，带着微笑在公司和客户之间穿梭。回家，则要带着儿子穿过污秽的街道，忍受房东的咆哮。</p><p>    终于，交不起房租的父子俩流落街头。克里斯和儿子在午夜地铁里相对无言，儿子不能理解为什么不能回家住，爸爸却开始玩游戏:“我们通过时光机，到达古代了!”儿子立刻兴奋地配合起来，环顾左右。父子俩在“恐龙”的追杀下，逃到了一个“山洞”里，“山洞”是什么呢，其实是一间男厕所。克里斯搂着熟睡的儿子，坐靠在厕所的墙面。午夜的灯光很惨白，这个消瘦的、营养不良的父亲，默默地流下了泪水。</p><p>    父子俩依旧为了幸福到来而努力。他们开始住收容所，面对有限的床位，这个奔跑起来像猎豹一样的人，有时候得把草原上的爆发力运用到打架上面来。儿子在简陋的收容所床上睡着了，父亲还在埋头修理推销的医疗器械，或者翻那本厚厚的笔试全书。</p><p>   钱包磨损得厉害，而且，太瘪了，每张钱都很熟悉。老板要借5块钱，犹豫再三，摩挚着纸币，最终还是把钱送了出去。卖血。鲜血在塑料袋里面渗开，那是一个男人所能奉献的最后。拿着卖血的钱，克里斯仍然去买电子元件。一点点的希望，都要去坚持。</p><p>对于父母，最心酸的事儿是什么呢?就是子女的一点可怜的愿望得不到满足。克里斯托夫的惟一的玩偶“美国英雄”，在一次挤车的过程中掉到了地上。5岁的男孩悲伤欲绝，克里斯坚硬的表情下，读出的是面对困难的凶狠和惨痛。但是，无论多么深切的无望，都没有摧毁父子间的亲情与他们的信念，他们相信幸福总会落到自己的身上。“你是个好爸爸”，克里斯托夫跟着爸爸四处流浪，可是孩子的心灵，衡量的砝码和天使是—样的。</p><p>  克里斯最终成为了投资公司的员工，看似冷漠的白人老板们，此时显出他们的些微温情。他忍住了泪水，颤抖着拿起自己的物品，走入了茫茫人海。在熙熙攘攘的人群中间，克里斯举起手，为自己鼓掌，那无声的，一下下重重的掌声，是在为自己喝彩。其实，克里斯托夫的“美国英雄”并没有失落。</p><p>  这是一个非常典型的“美国梦”:一个人通过自己的努力，可以实现自己的梦想，幸福，会来敲门。很多人往往会关注对于梦想的树立，而往往忽略过程的艰辛。特别是，当面对一个看似无望的现实的时候，有多少人会坚持，多少人会放弃呢?生活总是在不断地修正，并且提醒我们，顺应大潮的人总是较有可能抵达成功的彼岸。可是，确实是有些人，愿意逆流而上。我相信，这是导演对于逆行者的一点鼓励。</p><p>那个香港的匿名毕业生后来博士毕业，找到了一份不错的工作，有了漂亮的妻子和可爱的孩子。这个强人在帖子里说，有什么坚持不下来的呢?只要有梦想</p>');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newstype`
--

DROP TABLE IF EXISTS `newstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newstype` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `typename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='新闻资讯分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newstype`
--

LOCK TABLES `newstype` WRITE;
/*!40000 ALTER TABLE `newstype` DISABLE KEYS */;
INSERT INTO `newstype` VALUES (1,'2025-01-06 04:20:59','分类名称1'),(2,'2025-01-06 04:20:59','分类名称2'),(3,'2025-01-06 04:20:59','分类名称3'),(4,'2025-01-06 04:20:59','分类名称4'),(5,'2025-01-06 04:20:59','分类名称5'),(6,'2025-01-06 04:20:59','分类名称6'),(7,'2025-01-06 04:20:59','分类名称7'),(8,'2025-01-06 04:20:59','分类名称8');
/*!40000 ALTER TABLE `newstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiuzhizhe`
--

DROP TABLE IF EXISTS `qiuzhizhe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qiuzhizhe` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qiuzhizhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '求职账号',
  `mima` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `qiuzhixingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '求职姓名',
  `xingbie` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `touxiang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `qiuzhizhanghao` (`qiuzhizhanghao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='求职者';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiuzhizhe`
--

LOCK TABLES `qiuzhizhe` WRITE;
/*!40000 ALTER TABLE `qiuzhizhe` DISABLE KEYS */;
INSERT INTO `qiuzhizhe` VALUES (11,'2025-01-06 04:20:59','zhangwei','123456','张伟','男','13823888881','upload/qiuzhizhe_touxiang1.jpg'),(12,'2025-01-06 04:20:59','wangfang','123456','王芳','女','13823888882','upload/qiuzhizhe_touxiang2.jpg'),(13,'2025-01-06 04:20:59','liqiang','123456','李强','男','13823888883','upload/qiuzhizhe_touxiang3.jpg'),(14,'2025-01-06 04:20:59','liumei','123456','刘梅','女','13823888884','upload/qiuzhizhe_touxiang4.jpg'),(15,'2025-01-06 04:20:59','wangming','123456','王明','男','13823888885','upload/qiuzhizhe_touxiang5.jpg'),(16,'2025-01-06 04:20:59','limin','123456','李敏','女','13823888886','upload/qiuzhizhe_touxiang6.jpg'),(17,'2025-01-06 04:20:59','zhangyang','123456','张洋','男','13823888887','upload/qiuzhizhe_touxiang7.jpg'),(18,'2025-01-06 04:20:59','wangjing','123456','王静','女','13823888888','upload/qiuzhizhe_touxiang8.jpg'),(19,'2025-01-06 04:20:59','chenlong','123456','陈龙','男','13823888889','upload/qiuzhizhe_touxiang9.jpg'),(20,'2025-01-06 04:20:59','yangna','123456','杨娜','女','13823888890','upload/qiuzhizhe_touxiang10.jpg'),(21,'2025-01-06 04:20:59','zhaojun','123456','赵军','男','13823888891','upload/qiuzhizhe_touxiang11.jpg'),(22,'2025-01-06 04:20:59','zhoulan','123456','周兰','女','13823888892','upload/qiuzhizhe_touxiang12.jpg'),(23,'2025-01-06 04:20:59','wujie','123456','吴杰','男','13823888893','upload/qiuzhizhe_touxiang13.jpg'),(24,'2025-01-06 04:20:59','zhengjuan','123456','郑娟','女','13823888894','upload/qiuzhizhe_touxiang14.jpg'),(25,'2025-01-06 04:20:59','wangtao','123456','王涛','男','13823888895','upload/qiuzhizhe_touxiang15.jpg'),(26,'2025-01-06 04:20:59','sunli','123456','孙丽','女','13823888896','upload/qiuzhizhe_touxiang16.jpg'),(27,'2025-01-06 04:20:59','maying','123456','马英','男','13823888897','upload/qiuzhizhe_touxiang17.jpg'),(28,'2025-01-06 04:20:59','zhujie','123456','朱洁','女','13823888898','upload/qiuzhizhe_touxiang18.jpg'),(29,'2025-01-06 04:20:59','linfeng','123456','林峰','男','13823888899','upload/qiuzhizhe_touxiang19.jpg'),(30,'2025-01-06 04:20:59','hejing','123456','何静','女','13823888900','upload/qiuzhizhe_touxiang20.jpg'),(31,'2025-01-06 04:20:59','songtao','123456','宋涛','男','13823888901','upload/qiuzhizhe_touxiang21.jpg'),(32,'2025-01-06 04:20:59','xuyan','123456','徐燕','女','13823888902','upload/qiuzhizhe_touxiang22.jpg'),(33,'2025-01-06 04:20:59','dingwei','123456','丁伟','男','13823888903','upload/qiuzhizhe_touxiang23.jpg'),(34,'2025-01-06 04:20:59','suyue','123456','苏悦','女','13823888904','upload/qiuzhizhe_touxiang24.jpg'),(35,'2025-01-06 04:20:59','lujun','123456','陆军','男','13823888905','upload/qiuzhizhe_touxiang25.jpg'),(36,'2025-01-06 04:20:59','fanbing','123456','范冰','女','13823888906','upload/qiuzhizhe_touxiang26.jpg'),(37,'2025-01-06 04:20:59','yonghua','123456','雍华','男','13823888907','upload/qiuzhizhe_touxiang27.jpg'),(38,'2025-01-06 04:20:59','caiqin','123456','蔡琴','女','13823888908','upload/qiuzhizhe_touxiang28.jpg'),(39,'2025-01-06 04:20:59','panlei','123456','潘磊','男','13823888909','upload/qiuzhizhe_touxiang29.jpg'),(40,'2025-01-06 04:20:59','yuanyuan','123456','袁圆','女','13823888910','upload/qiuzhizhe_touxiang30.jpg'),(41,'2025-01-06 04:20:59','jiangwei','123456','姜伟','男','13823888911','upload/qiuzhizhe_touxiang31.jpg'),(42,'2025-01-06 04:20:59','tangli','123456','唐丽','女','13823888912','upload/qiuzhizhe_touxiang32.jpg'),(43,'2025-01-06 04:20:59','shenbin','123456','沈斌','男','13823888913','upload/qiuzhizhe_touxiang33.jpg'),(44,'2025-01-06 04:20:59','luying','123456','卢英','女','13823888914','upload/qiuzhizhe_touxiang34.jpg'),(45,'2025-01-06 04:20:59','qiangwei','123456','乔伟','男','13823888915','upload/qiuzhizhe_touxiang35.jpg'),(46,'2025-01-06 04:20:59','shiyan','123456','石燕','女','13823888916','upload/qiuzhizhe_touxiang36.jpg'),(47,'2025-01-06 04:20:59','duanjun','123456','段军','男','13823888917','upload/qiuzhizhe_touxiang37.jpg'),(48,'2025-01-06 04:20:59','weimin','123456','魏敏','女','13823888918','upload/qiuzhizhe_touxiang38.jpg'),(49,'2025-01-06 04:20:59','fenglei','123456','冯磊','男','13823888919','upload/qiuzhizhe_touxiang39.jpg'),(50,'2025-01-06 04:20:59','hanmei','123456','韩梅','女','13823888920','upload/qiuzhizhe_touxiang40.jpg'),(51,'2025-01-06 04:20:59','caoyang','123456','曹阳','男','13823888921','upload/qiuzhizhe_touxiang41.jpg'),(52,'2025-01-06 04:20:59','mengjie','123456','孟洁','女','13823888922','upload/qiuzhizhe_touxiang42.jpg'),(53,'2025-01-06 04:20:59','qinwei','123456','秦伟','男','13823888923','upload/qiuzhizhe_touxiang43.jpg'),(54,'2025-01-06 04:20:59','guling','123456','顾玲','女','13823888924','upload/qiuzhizhe_touxiang44.jpg'),(55,'2025-01-06 04:20:59','xiaofeng','123456','肖峰','男','13823888925','upload/qiuzhizhe_touxiang45.jpg'),(56,'2025-01-06 04:20:59','shihua','123456','史华','女','13823888926','upload/qiuzhizhe_touxiang46.jpg'),(57,'2025-01-06 04:20:59','jieli','123456','揭力','男','13823888927','upload/qiuzhizhe_touxiang47.jpg'),(58,'2025-01-06 04:20:59','pengfei','123456','彭飞','女','13823888928','upload/qiuzhizhe_touxiang48.jpg'),(59,'2025-01-06 04:20:59','lukai','123456','陆凯','男','13823888929','upload/qiuzhizhe_touxiang49.jpg'),(60,'2025-01-06 04:20:59','hongna','123456','洪娜','女','13823888930','upload/qiuzhizhe_touxiang50.jpg'),(61,'2025-01-06 04:20:59','guanwei','123456','关伟','男','13823888931','upload/qiuzhizhe_touxiang51.jpg'),(62,'2025-01-06 04:20:59','fangli','123456','方丽','女','13823888932','upload/qiuzhizhe_touxiang52.jpg'),(63,'2025-01-06 04:20:59','cuiyong','123456','崔勇','男','13823888933','upload/qiuzhizhe_touxiang53.jpg'),(64,'2025-01-06 04:20:59','chengjie','123456','程洁','女','13823888934','upload/qiuzhizhe_touxiang54.jpg'),(65,'2025-01-06 04:20:59','daijun','123456','戴军','男','13823888935','upload/qiuzhizhe_touxiang55.jpg'),(66,'2025-01-06 04:20:59','weihua','123456','魏华','女','13823888936','upload/qiuzhizhe_touxiang56.jpg'),(67,'2025-01-06 04:20:59','leitao','123456','雷涛','男','13823888937','upload/qiuzhizhe_touxiang57.jpg'),(68,'2025-01-06 04:20:59','jiejie','123456','解洁','女','13823888938','upload/qiuzhizhe_touxiang58.jpg'),(69,'2025-01-06 04:20:59','yanglei','123456','杨磊','男','13823888939','upload/qiuzhizhe_touxiang59.jpg'),(70,'2025-01-06 04:20:59','majing','123456','马静','女','13823888940','upload/qiuzhizhe_touxiang60.jpg'),(71,'2025-01-06 04:20:59','huangwei','123456','黄伟','男','13823888941','upload/qiuzhizhe_touxiang61.jpg'),(72,'2025-01-06 04:20:59','xulin','123456','许琳','女','13823888942','upload/qiuzhizhe_touxiang62.jpg'),(73,'2025-01-06 04:20:59','guobin','123456','郭斌','男','13823888943','upload/qiuzhizhe_touxiang63.jpg'),(74,'2025-01-06 04:20:59','liuxia','123456','刘霞','女','13823888944','upload/qiuzhizhe_touxiang64.jpg'),(75,'2025-01-06 04:20:59','baiwei','123456','白伟','男','13823888945','upload/qiuzhizhe_touxiang65.jpg'),(76,'2025-01-06 04:20:59','wangli','123456','汪丽','女','13823888946','upload/qiuzhizhe_touxiang66.jpg'),(77,'2025-01-06 04:20:59','liangjun','123456','梁军','男','13823888947','upload/qiuzhizhe_touxiang67.jpg'),(78,'2025-01-06 04:20:59','fangjie','123456','方杰','女','13823888948','upload/qiuzhizhe_touxiang68.jpg'),(79,'2025-01-06 04:20:59','gaofeng','123456','高峰','男','13823888949','upload/qiuzhizhe_touxiang69.jpg'),(80,'2025-01-06 04:20:59','zhangli','123456','张力','女','13823888950','upload/qiuzhizhe_touxiang70.jpg'),(81,'2025-01-06 04:20:59','liujun','123456','刘军','男','13823888951','upload/qiuzhizhe_touxiang71.jpg'),(82,'2025-01-06 04:20:59','chenjie','123456','陈洁','女','13823888952','upload/qiuzhizhe_touxiang72.jpg'),(83,'2025-01-06 04:20:59','zhaolei','123456','赵磊','男','13823888953','upload/qiuzhizhe_touxiang73.jpg'),(84,'2025-01-06 04:20:59','zhoumin','123456','周敏','女','13823888954','upload/qiuzhizhe_touxiang74.jpg'),(85,'2025-01-06 04:20:59','wujun','123456','吴军','男','13823888955','upload/qiuzhizhe_touxiang75.jpg'),(86,'2025-01-06 04:20:59','zhengjie','123456','郑洁','女','13823888956','upload/qiuzhizhe_touxiang76.jpg'),(87,'2025-01-06 04:20:59','wangqiang','123456','王强','男','13823888957','upload/qiuzhizhe_touxiang77.jpg'),(88,'2025-01-06 04:20:59','lili','123456','李丽','女','13823888958','upload/qiuzhizhe_touxiang78.jpg'),(89,'2025-01-06 04:20:59','zhangjie','123456','张杰','男','13823888959','upload/qiuzhizhe_touxiang79.jpg'),(90,'2025-01-06 04:20:59','wangfei','123456','王菲','女','13823888960','upload/qiuzhizhe_touxiang80.jpg');
/*!40000 ALTER TABLE `qiuzhizhe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiye`
--

DROP TABLE IF EXISTS `qiye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qiye` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qiyemingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业名称',
  `mima` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `fuzeren` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '负责人',
  `lianxidianhua` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `qiyedizhi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业地址',
  `zhuyingfanwei` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主营范围',
  `qiyezizhi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业资质',
  `qiyetupian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业图片',
  `sfsh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '审核回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `qiyemingcheng` (`qiyemingcheng`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='企业';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiye`
--

LOCK TABLES `qiye` WRITE;
/*!40000 ALTER TABLE `qiye` DISABLE KEYS */;
INSERT INTO `qiye` VALUES (1,'2025-01-06 04:20:59','味香居餐饮管理有限公司','123456','陈建国','13823888881','北京市朝阳区建国路88号','中餐、火锅、餐饮连锁加盟','','upload/qiye_qiyetupian1.jpg','是',''),(2,'2025-01-06 04:20:59','悦享咖啡有限公司','123456','林晓雨','13823888882','河南省郑州市金水区林业路123号','咖啡饮品、轻食、甜品','','upload/qiye_qiyetupian2.jpg','是',''),(3,'2025-01-06 04:20:59','蜀味香川菜馆','123456','刘大川','13823888883','上海市黄浦区南京东路123号','川菜、特色小吃','','upload/qiye_qiyetupian3.jpg','是',''),(4,'2025-01-06 04:20:59','粤点王茶餐厅','123456','黄志明','13823888884','四川省成都市锦江区春熙路56号','粤菜、早茶、点心','','upload/qiye_qiyetupian4.jpg','是',''),(5,'2025-01-06 04:20:59','江南味道私房菜','123456','周雅琴','13823888885','广州市天河区天河路300号','江浙菜、私房菜、宴会承办','','upload/qiye_qiyetupian5.jpg','是',''),(6,'2025-01-06 04:20:59','烧烤部落餐饮有限公司','123456','赵大勇','13823888886','江苏省苏州市太湖区58号','烧烤、夜宵、啤酒屋','','upload/qiye_qiyetupian6.jpg','是',''),(7,'2025-01-06 04:20:59','粥满堂养生粥铺','123456','孙文静','13823888887','浙江省杭州市西湖区龙井路78号','养生粥、面点、简餐','','upload/qiye_qiyetupian7.jpg','是',''),(8,'2025-01-06 04:20:59','披萨工坊西餐厅','123456','吴凯文','13823888888','湖北省武汉市武昌区中南路22号','披萨、意面、牛排','','upload/qiye_qiyetupian8.jpg','是',''),(9,'2025-01-06 04:20:59','老北京涮肉坊','123456','张宝华','13823888889','北京市东城区王府井大街99号','老北京火锅、铜锅涮肉','','upload/qiye_qiyetupian9.jpg','是',''),(10,'2025-01-06 04:20:59','湘西人家','123456','李翠花','13823888890','湖南省长沙市天心区五一大道77号','湘菜、土家菜','','upload/qiye_qiyetupian10.jpg','是',''),(11,'2025-01-06 04:20:59','东北大锅炖','123456','王铁柱','13823888891','黑龙江省哈尔滨市南岗区中央大街88号','东北菜、铁锅炖','','upload/qiye_qiyetupian11.jpg','是',''),(12,'2025-01-06 04:20:59','西域风情餐厅','123456','李志强','13823888892','新疆乌鲁木齐市天山区解放南路66号','新疆菜、烤全羊、大盘鸡','','upload/qiye_qiyetupian12.jpg','是',''),(13,'2025-01-06 04:20:59','云味过桥米线','123456','杨丽华','13823888893','云南省昆明市五华区南屏街45号','云南过桥米线、汽锅鸡','','upload/qiye_qiyetupian13.jpg','是',''),(14,'2025-01-06 04:20:59','闽南人家海鲜酒楼','123456','陈永强','13823888894','福建省厦门市思明区中山路123号','闽菜、海鲜','','upload/qiye_qiyetupian14.jpg','是',''),(15,'2025-01-06 04:20:59','徽菜馆','123456','胡文景','13823888895','安徽省合肥市庐阳区长江中路77号','徽菜、臭鳜鱼','','upload/qiye_qiyetupian15.jpg','是',''),(16,'2025-01-06 04:20:59','津门味道','123456','刘津生','13823888896','天津市和平区滨江道88号','天津菜、狗不理包子','','upload/qiye_qiyetupian16.jpg','是',''),(17,'2025-01-06 04:20:59','桂北风情','123456','韦国华','13823888897','广西南宁市青秀区民族大道66号','广西菜、螺蛳粉','','upload/qiye_qiyetupian17.jpg','是',''),(18,'2025-01-06 04:20:59','黔味酸汤鱼','123456','吴学军','13823888898','贵州省贵阳市南明区中华南路33号','贵州菜、酸汤鱼','','upload/qiye_qiyetupian18.jpg','是',''),(19,'2025-01-06 04:20:59','晋商面馆','123456','乔国栋','13823888899','山西省太原市迎泽区柳巷99号','山西面食、刀削面','','upload/qiye_qiyetupian19.jpg','是',''),(20,'2025-01-06 04:20:59','秦味肉夹馍','123456','白永辉','13823888900','陕西省西安市碑林区钟楼广场22号','陕西小吃、肉夹馍、凉皮','','upload/qiye_qiyetupian20.jpg','是',''),(21,'2025-01-06 04:20:59','陇上人家','123456','马建军','13823888901','甘肃省兰州市城关区张掖路55号','甘肃菜、牛肉面','','upload/qiye_qiyetupian21.jpg','是',''),(22,'2025-01-06 04:20:59','宁味斋','123456','王建国','13823888902','宁夏银川市兴庆区解放东街77号','宁夏菜、手抓羊肉','','upload/qiye_qiyetupian22.jpg','是',''),(23,'2025-01-06 04:20:59','青海湖餐厅','123456','张秀英','13823888903','青海省西宁市城中区西大街44号','青海菜、牦牛肉','','upload/qiye_qiyetupian23.jpg','是',''),(24,'2025-01-06 04:20:59','藏家宴','123456','次仁多吉','13823888904','西藏拉萨市城关区北京东路88号','藏餐、酥油茶、糌粑','','upload/qiye_qiyetupian24.jpg','是',''),(25,'2025-01-06 04:20:59','蒙骨王火锅','123456','巴特尔','13823888905','内蒙古呼和浩特市回民区中山西路66号','蒙餐、火锅','','upload/qiye_qiyetupian25.jpg','是',''),(26,'2025-01-06 04:20:59','鲁味鲜','123456','孔祥瑞','13823888906','山东省济南市历下区泉城路77号','鲁菜、九转大肠','','upload/qiye_qiyetupian26.jpg','是',''),(27,'2025-01-06 04:20:59','赣南人家','123456','刘志远','13823888907','江西省南昌市东湖区八一大道99号','赣菜、瓦罐汤','','upload/qiye_qiyetupian27.jpg','是',''),(28,'2025-01-06 04:20:59','辽沈大饭店','123456','赵永强','13823888908','辽宁省沈阳市沈河区青年大街123号','辽菜、东北菜','','upload/qiye_qiyetupian28.jpg','是',''),(29,'2025-01-06 04:20:59','吉菜坊','123456','李长伟','13823888909','吉林省长春市朝阳区人民大街66号','吉菜、人参鸡','','upload/qiye_qiyetupian29.jpg','是',''),(30,'2025-01-06 04:20:59','龙江饺子王','123456','王洪军','13823888910','黑龙江省哈尔滨市道里区中央大街99号','东北水饺','','upload/qiye_qiyetupian30.jpg','是',''),(31,'2025-01-06 04:20:59','淮扬府','123456','朱明华','13823888911','江苏省扬州市广陵区文昌中路88号','淮扬菜、狮子头','','upload/qiye_qiyetupian31.jpg','是',''),(32,'2025-01-06 04:20:59','温州海鲜楼','123456','陈志远','13823888912','浙江省温州市鹿城区人民路66号','浙菜、海鲜','','upload/qiye_qiyetupian32.jpg','是',''),(33,'2025-01-06 04:20:59','徽州人家','123456','胡文彬','13823888913','安徽省黄山市屯溪区老街99号','徽菜、毛豆腐','','upload/qiye_qiyetupian33.jpg','是',''),(34,'2025-01-06 04:20:59','八闽食府','123456','林志文','13823888914','福建省福州市鼓楼区东街口77号','闽菜、佛跳墙','','upload/qiye_qiyetupian34.jpg','是',''),(35,'2025-01-06 04:20:59','客家土楼餐厅','123456','李光耀','13823888915','福建省龙岩市永定区湖坑镇66号','客家菜','','upload/qiye_qiyetupian35.jpg','是',''),(36,'2025-01-06 04:20:59','潮汕牛肉火锅','123456','李永强','13823888916','广东省汕头市金平区金砂路88号','潮汕牛肉火锅','','upload/qiye_qiyetupian36.jpg','是',''),(37,'2025-01-06 04:20:59','顺德佬','123456','黄志强','13823888917','广东省佛山市顺德区大良街道99号','粤菜、顺德美食','','upload/qiye_qiyetupian37.jpg','是',''),(38,'2025-01-06 04:20:59','桂林米粉店','123456','刘三妹','13823888918','广西桂林市秀峰区中山中路33号','桂林米粉','','upload/qiye_qiyetupian38.jpg','是',''),(39,'2025-01-06 04:20:59','海南椰子鸡','123456','宋建平','13823888919','海南省海口市龙华区滨海大道66号','海南菜、椰子鸡','','upload/qiye_qiyetupian39.jpg','是',''),(40,'2025-01-06 04:20:59','三峡鱼庄','123456','屈建国','13823888920','湖北省宜昌市西陵区沿江大道88号','湖北菜、鱼火锅','','upload/qiye_qiyetupian40.jpg','是',''),(41,'2025-01-06 04:20:59','楚味堂','123456','向卫东','13823888921','湖北省武汉市洪山区珞喻路77号','楚菜、武昌鱼','','upload/qiye_qiyetupian41.jpg','是',''),(42,'2025-01-06 04:20:59','岳麓湘菜馆','123456','毛建新','13823888922','湖南省长沙市岳麓区麓山南路99号','湘菜、剁椒鱼头','','upload/qiye_qiyetupian42.jpg','是',''),(43,'2025-01-06 04:20:59','洞庭湖鲜','123456','范志伟','13823888923','湖南省岳阳市岳阳楼区洞庭北路66号','湘菜、湖鲜','','upload/qiye_qiyetupian43.jpg','是',''),(44,'2025-01-06 04:20:59','汴京烤鸭店','123456','包志强','13823888924','河南省开封市龙亭区中山路88号','豫菜、烤鸭','','upload/qiye_qiyetupian44.jpg','是',''),(45,'2025-01-06 04:20:59','洛阳水席园','123456','武建军','13823888925','河南省洛阳市老城区中州中路77号','洛阳水席','','upload/qiye_qiyetupian45.jpg','是',''),(46,'2025-01-06 04:20:59','滕王阁餐厅','123456','王文明','13823888926','江西省南昌市东湖区仿古街58号','赣菜','','upload/qiye_qiyetupian46.jpg','是',''),(47,'2025-01-06 04:20:59','庐山石鸡馆','123456','李俊杰','13823888927','江西省九江市庐山市牯岭镇99号','赣菜、石鸡','','upload/qiye_qiyetupian47.jpg','是',''),(48,'2025-01-06 04:20:59','蜀南竹海餐厅','123456','苏建国','13823888928','四川省宜宾市长宁县竹海镇66号','川菜、全竹宴','','upload/qiye_qiyetupian48.jpg','是',''),(49,'2025-01-06 04:20:59','乐山钵钵鸡','123456','郭志强','13823888929','四川省乐山市市中区张公桥88号','乐山小吃、钵钵鸡','','upload/qiye_qiyetupian49.jpg','是',''),(50,'2025-01-06 04:20:59','遵义羊肉粉','123456','张建军','13823888930','贵州省遵义市红花岗区中华路77号','贵州小吃、羊肉粉','','upload/qiye_qiyetupian50.jpg','是',''),(51,'2025-01-06 04:20:59','大理段氏餐厅','123456','段志平','13823888931','云南省大理市大理古城人民路66号','云南菜、白族风味','','upload/qiye_qiyetupian51.jpg','是',''),(52,'2025-01-06 04:20:59','丽江腊排骨','123456','木建华','13823888932','云南省丽江市古城区七一街88号','纳西族美食、腊排骨','','upload/qiye_qiyetupian52.jpg','是',''),(53,'2025-01-06 04:20:59','长安大排档','123456','李永军','13823888933','陕西省西安市雁塔区大唐不夜城99号','陕西小吃','','upload/qiye_qiyetupian53.jpg','是',''),(54,'2025-01-06 04:20:59','延安味道','123456','刘志强','13823888934','陕西省延安市宝塔区杨家岭66号','陕北菜、洋芋擦擦','','upload/qiye_qiyetupian54.jpg','是',''),(55,'2025-01-06 04:20:59','兰州牛肉面','123456','马文华','13823888935','甘肃省兰州市七里河区西津西路77号','兰州牛肉面','','upload/qiye_qiyetupian55.jpg','是',''),(56,'2025-01-06 04:20:59','敦煌壁画餐厅','123456','张宏伟','13823888936','甘肃省酒泉市敦煌市鸣山路88号','敦煌菜','','upload/qiye_qiyetupian56.jpg','是',''),(57,'2025-01-06 04:20:59','西宁酸奶坊','123456','宗学军','13823888937','青海省西宁市城中区莫家街99号','青海小吃、酸奶','','upload/qiye_qiyetupian57.jpg','是',''),(58,'2025-01-06 04:20:59','格尔木烤肉','123456','格根塔拉','13823888938','青海省海西州格尔木市昆仑路66号','烤肉、青海菜','','upload/qiye_qiyetupian58.jpg','是',''),(59,'2025-01-06 04:20:59','银川手抓羊肉','123456','李文华','13823888939','宁夏银川市西夏区怀远路77号','宁夏小吃、手抓羊肉','','upload/qiye_qiyetupian59.jpg','是',''),(60,'2025-01-06 04:20:59','中卫蒿子面','123456','马永强','13823888940','宁夏中卫市沙坡头区鼓楼西街88号','宁夏特色面食','','upload/qiye_qiyetupian60.jpg','是',''),(61,'2025-01-06 04:20:59','乌鲁木齐大巴扎餐厅','123456','阿迪力','13823888941','新疆乌鲁木齐市天山区解放南路99号','新疆菜、烤包子','','upload/qiye_qiyetupian61.jpg','是',''),(62,'2025-01-06 04:20:59','喀什噶尔餐厅','123456','麦麦提','13823888942','新疆喀什地区喀什市艾提尕尔广场66号','维吾尔族美食','','upload/qiye_qiyetupian62.jpg','是',''),(63,'2025-01-06 04:20:59','台北士林夜市餐厅','123456','林志文','13823888943','台湾省台北市士林区基河路77号','台湾小吃','','upload/qiye_qiyetupian63.jpg','是',''),(64,'2025-01-06 04:20:59','高雄海之味','123456','陈志伟','13823888944','台湾省高雄市前镇区成功二路88号','台湾海鲜','','upload/qiye_qiyetupian64.jpg','是',''),(65,'2025-01-06 04:20:59','香港茶餐厅','123456','张伟强','13823888945','香港特别行政区旺角西洋菜南街99号','港式茶餐厅','','upload/qiye_qiyetupian65.jpg','是',''),(66,'2025-01-06 04:20:59','澳门葡国餐厅','123456','何志强','13823888946','澳门特别行政区大三巴街66号','葡国菜','','upload/qiye_qiyetupian66.jpg','是',''),(67,'2025-01-06 04:20:59','青岛啤酒吧','123456','张瑞华','13823888947','山东省青岛市市南区登州路77号','鲁菜、啤酒','','upload/qiye_qiyetupian67.jpg','是',''),(68,'2025-01-06 04:20:59','烟台海鲜舫','123456','张志远','13823888948','山东省烟台市芝罘区北马路88号','鲁菜、海鲜','','upload/qiye_qiyetupian68.jpg','是',''),(69,'2025-01-06 04:20:59','大连海味馆','123456','王海波','13823888949','辽宁省大连市中山区中山路99号','辽菜、海鲜','','upload/qiye_qiyetupian69.jpg','是',''),(70,'2025-01-06 04:20:59','长春一汽食堂','123456','雷建明','13823888950','吉林省长春市绿园区东风大街66号','吉菜','','upload/qiye_qiyetupian70.jpg','是',''),(71,'2025-01-06 04:20:59','哈尔滨红肠餐厅','123456','李志刚','13823888951','黑龙江省哈尔滨市道外区靖宇街77号','东北菜、红肠','','upload/qiye_qiyetupian71.jpg','是',''),(72,'2025-01-06 04:20:59','三亚海景餐厅','123456','陆建国','13823888952','海南省三亚市天涯区三亚湾路88号','海南菜、海鲜','','upload/qiye_qiyetupian72.jpg','是',''),(73,'2025-01-06 04:20:59','北海银滩餐厅','123456','何永强','13823888953','广西北海市银海区银滩中路99号','广西菜、海鲜','','upload/qiye_qiyetupian73.jpg','是',''),(74,'2025-01-06 04:20:59','珠海横琴蚝餐厅','123456','苏志强','13823888954','广东省珠海市香洲区横琴新区66号','粤菜、生蚝','','upload/qiye_qiyetupian74.jpg','是',''),(75,'2025-01-06 04:20:59','厦门鼓浪屿餐厅','123456','郑建平','13823888955','福建省厦门市思明区鼓浪屿龙头路77号','闽南小吃','','upload/qiye_qiyetupian75.jpg','是',''),(76,'2025-01-06 04:20:59','宁波汤圆店','123456','蒋志强','13823888956','浙江省宁波市海曙区开明街88号','宁波汤圆','','upload/qiye_qiyetupian76.jpg','是',''),(77,'2025-01-06 04:20:59','无锡酱排骨馆','123456','荣建明','13823888957','江苏省无锡市梁溪区中山路99号','无锡菜、酱排骨','','upload/qiye_qiyetupian77.jpg','是',''),(78,'2025-01-06 04:20:59','常州麻糕店','123456','瞿志强','13823888958','江苏省常州市天宁区延陵西路66号','常州小吃、麻糕','','upload/qiye_qiyetupian78.jpg','是',''),(79,'2025-01-06 04:20:59','镇江锅盖面馆','123456','白淑芬','13823888959','江苏省镇江市京口区大西路77号','镇江锅盖面','','upload/qiye_qiyetupian79.jpg','是',''),(80,'2025-01-06 04:20:59','扬州炒饭店','123456','郑丽华','13823888960','江苏省扬州市邗江区四望亭路88号','扬州炒饭','','upload/qiye_qiyetupian80.jpg','是','');
/*!40000 ALTER TABLE `qiye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiyepingjia`
--

DROP TABLE IF EXISTS `qiyepingjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qiyepingjia` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pingjiabianhao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评价编号',
  `qiuzhizhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职账号',
  `qiuzhixingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职姓名',
  `gangweileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职岗位',
  `gerenjingli` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人经历',
  `pingjianeirong` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评价内容',
  `pingjiashijian` datetime DEFAULT NULL COMMENT '评价时间',
  `qiyemingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `qiyetupian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '企业图片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pingjiabianhao` (`pingjiabianhao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='企业评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiyepingjia`
--

LOCK TABLES `qiyepingjia` WRITE;
/*!40000 ALTER TABLE `qiyepingjia` DISABLE KEYS */;
INSERT INTO `qiyepingjia` VALUES (1,'2025-01-06 04:20:59','1111111111','zhangwei','张伟','求职岗位1','个人经历1','评价内容1','2025-01-06 12:20:59','味香居餐饮管理有限公司','upload/qiyepingjia_qiyetupian1.jpg,upload/qiyepingjia_qiyetupian2.jpg,upload/qiyepingjia_qiyetupian3.jpg'),(2,'2025-01-06 04:20:59','2222222222','wangfang','王芳','求职岗位2','个人经历2','评价内容2','2025-01-06 12:20:59','悦享咖啡有限公司','upload/qiyepingjia_qiyetupian2.jpg,upload/qiyepingjia_qiyetupian3.jpg,upload/qiyepingjia_qiyetupian4.jpg'),(3,'2025-01-06 04:20:59','3333333333','liqiang','李强','求职岗位3','个人经历3','评价内容3','2025-01-06 12:20:59','蜀味香川菜馆','upload/qiyepingjia_qiyetupian3.jpg,upload/qiyepingjia_qiyetupian4.jpg,upload/qiyepingjia_qiyetupian5.jpg'),(4,'2025-01-06 04:20:59','4444444444','liumei','刘梅','求职岗位4','个人经历4','评价内容4','2025-01-06 12:20:59','粤点王茶餐厅','upload/qiyepingjia_qiyetupian4.jpg,upload/qiyepingjia_qiyetupian5.jpg,upload/qiyepingjia_qiyetupian6.jpg'),(5,'2025-01-06 04:20:59','5555555555','wangming','王明','求职岗位5','个人经历5','评价内容5','2025-01-06 12:20:59','江南味道私房菜','upload/qiyepingjia_qiyetupian5.jpg,upload/qiyepingjia_qiyetupian6.jpg,upload/qiyepingjia_qiyetupian7.jpg'),(6,'2025-01-06 04:20:59','6666666666','limin','李敏','求职岗位6','个人经历6','评价内容6','2025-01-06 12:20:59','烧烤部落餐饮有限公司','upload/qiyepingjia_qiyetupian6.jpg,upload/qiyepingjia_qiyetupian7.jpg,upload/qiyepingjia_qiyetupian8.jpg'),(7,'2025-01-06 04:20:59','7777777777','zhangyang','张洋','求职岗位7','个人经历7','评价内容7','2025-01-06 12:20:59','粥满堂养生粥铺','upload/qiyepingjia_qiyetupian7.jpg,upload/qiyepingjia_qiyetupian8.jpg,upload/qiyepingjia_qiyetupian1.jpg'),(8,'2025-01-06 04:20:59','8888888888','wangjing','王静','求职岗位8','个人经历8','评价内容8','2025-01-06 12:20:59','披萨工坊西餐厅','upload/qiyepingjia_qiyetupian8.jpg,upload/qiyepingjia_qiyetupian1.jpg,upload/qiyepingjia_qiyetupian2.jpg');
/*!40000 ALTER TABLE `qiyepingjia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensitivewords`
--

DROP TABLE IF EXISTS `sensitivewords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensitivewords` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '垃圾' COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='敏感词';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensitivewords`
--

LOCK TABLES `sensitivewords` WRITE;
/*!40000 ALTER TABLE `sensitivewords` DISABLE KEYS */;
INSERT INTO `sensitivewords` VALUES (1,'2025-01-06 04:20:59','垃圾');
/*!40000 ALTER TABLE `sensitivewords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storeup` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `refid` bigint DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '类型',
  `inteltype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
INSERT INTO `storeup` VALUES (2,'2026-03-29 13:26:03',11,1,'jiuyexinxi','味香居餐饮管理有限公司','upload/jiuyexinxi_qiyetupian1.jpg','1',NULL,NULL);
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemintro`
--

DROP TABLE IF EXISTS `systemintro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemintro` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `picture1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片1',
  `picture2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片2',
  `picture3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='系统简介';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemintro`
--

LOCK TABLES `systemintro` WRITE;
/*!40000 ALTER TABLE `systemintro` DISABLE KEYS */;
INSERT INTO `systemintro` VALUES (1,'2025-01-06 04:20:59','系统简介','SYSTEM INTRODUCTION','在平静的海平面上，每个人都可以成为领航员。但如果只有阳光而没有阴影，只有欢乐而没有痛苦，那就不是完整的人生。就拿最幸福的人来说吧——他的幸福是一团纠结的纱线。痛苦和幸福轮番而至，让我们悲喜交集，甚至死亡都让人生更加可爱。人在生命的严肃时刻，在悲伤与丧亲的阴影下，才最接近真实的自我。在生活和事业的各个方面，才智的功能远不如性格，头脑的功能远不如心性，天分远不如自制力、毅力与教养。我始终认为内心开始过严肃生活的人，他外在的生活会开始变得更为俭朴。在一个奢侈浪费的年代，但愿我能让世人了解：人类真正的需求是多么的稀少。不重蹈覆辙才是真正的醒悟。比别人优秀并无任何高贵之处，真正的高贵在于超越从前的自我。','upload/systemintro_picture1.jpg','upload/systemintro_picture2.jpg','upload/systemintro_picture3.jpg');
/*!40000 ALTER TABLE `systemintro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','a90jp1ssze8o9utwnuvk2y43ka1z2fzh','2025-01-06 04:22:55','2026-04-11 11:21:41'),(2,11,'zhangwei','qiuzhizhe','求职者','8i02wwvx14ox9z533fgcd2srru649tu2','2025-01-06 04:23:05','2026-04-06 14:22:38'),(3,21,'味香居餐饮管理有限公司','qiye','企业','leyqr7umc0pkwqlfhwgazqt44tq92xzz','2025-12-06 08:29:15','2026-04-02 04:33:42'),(4,14,'liumei','qiuzhizhe','求职者','148qtr4ibhlqvcodqu60x4ls8kfwywtb','2026-04-01 11:32:52','2026-04-10 10:37:18'),(5,24,'粤点王茶餐厅','qiye','企业','low925yv3jg1bapbebvutrknz2am1lxt','2026-04-02 04:02:27','2026-04-02 14:41:59'),(6,4,'粤点王茶餐厅','qiye','企业','u2naqmtaf00hs67ig949tria1blei1b1','2026-04-05 08:34:18','2026-04-05 12:28:47'),(7,1,'味香居餐饮管理有限公司','qiye','企业','znofuywf2725s7vpy3hdn8l4x6fuk6xo','2026-04-08 09:39:13','2026-04-08 12:50:19'),(8,3,'蜀味香川菜馆','qiye','企业','mtadzugx4lnwheekqjauvt3ryym2zlkg','2026-04-09 12:10:22','2026-04-14 03:58:02'),(9,16,'limin','qiuzhizhe','求职者','ffnhgg798f3esls4n09r8nk078jsd1zb','2026-04-09 12:15:31','2026-04-09 13:15:32'),(10,87,'wangqiang','qiuzhizhe','求职者','z7iy5allr1bkupdtaf8wxxsgrt9t9xen','2026-04-09 12:16:06','2026-04-14 03:57:00'),(11,13,'liqiang','qiuzhizhe','求职者','8sp1jdu5ol2lp06divuh6glfb0zic2vc','2026-04-09 12:20:21','2026-04-09 16:30:57'),(12,32,'xuyan','qiuzhizhe','求职者','ly843symakqhy5dlglbm8d8uqjeda7ht','2026-04-09 12:39:55','2026-04-09 13:39:55');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toudixinxi`
--

DROP TABLE IF EXISTS `toudixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toudixinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qiyemingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `qiyetupian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '企业图片',
  `fuzeren` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `qiyedizhi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业地址',
  `diqu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区',
  `gangweileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位类型',
  `qiuzhizhuangtai` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职状态',
  `toudishijian` datetime DEFAULT NULL COMMENT '投递时间',
  `qiuzhizhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职账号',
  `qiuzhixingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '求职姓名',
  `lianxidianhua` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `gerenjingli` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '个人经历',
  `gerenjianli` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '个人简历',
  `sfsh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '审核回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='应聘信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toudixinxi`
--

LOCK TABLES `toudixinxi` WRITE;
/*!40000 ALTER TABLE `toudixinxi` DISABLE KEYS */;
INSERT INTO `toudixinxi` VALUES (2,'2025-01-06 04:20:59','悦享咖啡有限公司','upload/toudixinxi_qiyetupian2.jpg,upload/toudixinxi_qiyetupian3.jpg,upload/toudixinxi_qiyetupian4.jpg','林晓雨','河南省郑州市金水区林业路123号','河南','服务员','已邀请','2025-01-06 12:20:59','wangfang','王芳','13823888882','个人经历2','','是',''),(3,'2025-01-06 04:20:59','蜀味香川菜馆','upload/toudixinxi_qiyetupian3.jpg,upload/toudixinxi_qiyetupian4.jpg,upload/toudixinxi_qiyetupian5.jpg','刘大川','上海市黄浦区南京东路123号','上海','切配师','已邀请','2025-01-06 12:20:59','liqiang','李强','13823888883','个人经历3','','是',''),(5,'2025-01-06 04:20:59','江南味道私房菜','upload/toudixinxi_qiyetupian5.jpg,upload/toudixinxi_qiyetupian6.jpg,upload/toudixinxi_qiyetupian7.jpg','周雅琴','广州市天河区天河路300号','广州','传菜员','已邀请','2025-01-06 12:20:59','wangming','王明','13823888885','个人经历5','','是',''),(6,'2025-01-06 04:20:59','烧烤部落餐饮有限公司','upload/toudixinxi_qiyetupian6.jpg,upload/toudixinxi_qiyetupian7.jpg,upload/toudixinxi_qiyetupian8.jpg','赵大勇','江苏省苏州市太湖区58号','江苏','凉菜师傅','已邀请','2025-01-06 12:20:59','limin','李敏','13823888886','个人经历6','','是',''),(7,'2025-01-06 04:20:59','粥满堂养生粥铺','upload/toudixinxi_qiyetupian7.jpg,upload/toudixinxi_qiyetupian8.jpg,upload/toudixinxi_qiyetupian1.jpg','孙文静','浙江省杭州市西湖区龙井路78号','浙江','洗碗工','已邀请','2025-01-06 12:20:59','zhangyang','张洋','13823888887','个人经历7','','是',''),(8,'2025-01-06 04:20:59','披萨工坊西餐厅','upload/toudixinxi_qiyetupian8.jpg,upload/toudixinxi_qiyetupian1.jpg,upload/toudixinxi_qiyetupian2.jpg','吴凯文','湖北省武汉市武昌区中南路22号','湖北','店长','已邀请','2025-01-06 12:20:59','wangjing','王静','13823888888','个人经历8','','是',''),(21,'2026-04-02 13:41:49','粤点王茶餐厅','upload/qiye_qiyetupian4.jpg','黄志明','四川省成都市锦江区春熙路56号','上海','传菜员','已邀请','2026-04-02 21:41:31','liumei','刘梅','13823888884','111','upload/1775137295740.doc','是','通过'),(22,'2026-04-09 12:47:45','蜀味香川菜馆','upload/qiye_qiyetupian3.jpg','刘大川','上海市黄浦区南京东路123号','宜昌','传菜员','已邀请','2026-04-09 20:47:19','xuyan','徐燕','13823888902','无','upload/1775738860148.doc','是','通过'),(23,'2026-04-09 13:11:14','南京盐水鸭店','upload/qiye_qiyetupian80.jpg','徐文斌','江苏省南京市秦淮区夫子庙贡院街99号','南京','店员','待通知','2026-04-09 21:11:02','liqiang','李强','13823888883','我','upload/1775740268324.doc','待审核',NULL);
/*!40000 ALTER TABLE `toudixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','upload/image1.jpg','管理员','2025-01-06 04:20:59');
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

-- Dump completed on 2026-04-14 11:18:17
