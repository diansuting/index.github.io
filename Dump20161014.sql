-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: dd
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `保养消耗表`
--

DROP TABLE IF EXISTS `保养消耗表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养消耗表` (
  `保养消耗编号` varchar(45) NOT NULL,
  `保养记录id` int(11) DEFAULT NULL,
  `材料` varchar(45) DEFAULT NULL,
  `数量` int(11) DEFAULT NULL,
  PRIMARY KEY (`保养消耗编号`),
  KEY `材料_idx` (`材料`),
  KEY `FK1_idx` (`保养记录id`),
  CONSTRAINT `FK1` FOREIGN KEY (`保养记录id`) REFERENCES `保养记录表` (`保养记录id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `材料` FOREIGN KEY (`材料`) REFERENCES `材料表` (`材料`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养消耗表`
--

LOCK TABLES `保养消耗表` WRITE;
/*!40000 ALTER TABLE `保养消耗表` DISABLE KEYS */;
INSERT INTO `保养消耗表` VALUES ('com1',1,'A材料',20),('com2',2,'A材料',25),('com3',3,'B材料',15);
/*!40000 ALTER TABLE `保养消耗表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `保养记录表`
--

DROP TABLE IF EXISTS `保养记录表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养记录表` (
  `保养记录id` int(11) NOT NULL,
  `设备编号` varchar(45) DEFAULT NULL,
  `项目编号` varchar(45) DEFAULT NULL,
  `保养人` varchar(45) DEFAULT NULL,
  `完成情况` varchar(45) DEFAULT NULL,
  `时间` date DEFAULT NULL,
  PRIMARY KEY (`保养记录id`),
  KEY `设备_idx` (`设备编号`),
  KEY `项目_idx` (`项目编号`),
  CONSTRAINT `设备编号` FOREIGN KEY (`设备编号`) REFERENCES `设备表` (`设备编号`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `项目编号` FOREIGN KEY (`项目编号`) REFERENCES `项目表` (`项目编号`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养记录表`
--

LOCK TABLES `保养记录表` WRITE;
/*!40000 ALTER TABLE `保养记录表` DISABLE KEYS */;
INSERT INTO `保养记录表` VALUES (1,'S11','X1','张三','已完成','2014-10-10'),(2,'S11','X1','李四','已完成','2015-10-10'),(3,'S21','X2','李四','已完成','2016-09-05');
/*!40000 ALTER TABLE `保养记录表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `材料表`
--

DROP TABLE IF EXISTS `材料表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `材料表` (
  `材料编号` varchar(45) NOT NULL,
  `材料` varchar(45) NOT NULL,
  `数量` varchar(45) NOT NULL,
  PRIMARY KEY (`材料编号`),
  UNIQUE KEY `材料_UNIQUE` (`材料`),
  UNIQUE KEY `数量_UNIQUE` (`数量`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `材料表`
--

LOCK TABLES `材料表` WRITE;
/*!40000 ALTER TABLE `材料表` DISABLE KEYS */;
INSERT INTO `材料表` VALUES ('C1','A材料','200'),('C2','B材料','100');
/*!40000 ALTER TABLE `材料表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `设备类型表`
--

DROP TABLE IF EXISTS `设备类型表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `设备类型表` (
  `设备类型编号` varchar(45) NOT NULL,
  `设备类型` varchar(45) NOT NULL,
  `项目` varchar(45) DEFAULT NULL,
  `检修周期` int(11) DEFAULT NULL,
  PRIMARY KEY (`设备类型编号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `设备类型表`
--

LOCK TABLES `设备类型表` WRITE;
/*!40000 ALTER TABLE `设备类型表` DISABLE KEYS */;
INSERT INTO `设备类型表` VALUES ('S1','PLC ','PLC项目',365),('S2','CST','CST项目',30);
/*!40000 ALTER TABLE `设备类型表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `设备表`
--

DROP TABLE IF EXISTS `设备表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `设备表` (
  `设备编号` varchar(45) NOT NULL,
  `设备类型编号` varchar(45) DEFAULT NULL,
  `设备` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`设备编号`),
  KEY `设备类型编号_idx` (`设备类型编号`),
  CONSTRAINT `设备类型编号` FOREIGN KEY (`设备类型编号`) REFERENCES `设备类型表` (`设备类型编号`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `设备表`
--

LOCK TABLES `设备表` WRITE;
/*!40000 ALTER TABLE `设备表` DISABLE KEYS */;
INSERT INTO `设备表` VALUES ('S11','S1','PLC项目'),('S21','S2','CST项目');
/*!40000 ALTER TABLE `设备表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `项目表`
--

DROP TABLE IF EXISTS `项目表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `项目表` (
  `项目编号` varchar(45) NOT NULL,
  `项目` varchar(45) NOT NULL,
  PRIMARY KEY (`项目编号`),
  UNIQUE KEY `项目_UNIQUE` (`项目`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `项目表`
--

LOCK TABLES `项目表` WRITE;
/*!40000 ALTER TABLE `项目表` DISABLE KEYS */;
INSERT INTO `项目表` VALUES ('X2','CST项目'),('X1','PLC项目');
/*!40000 ALTER TABLE `项目表` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-14 18:17:41
