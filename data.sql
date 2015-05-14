CREATE DATABASE  IF NOT EXISTS `Inventory_system` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Inventory_system`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: wmsteam2.cnkjhozr1cjt.us-west-1.rds.amazonaws.com    Database: Inventory_system
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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `departmentid` int(11) NOT NULL,
  `department` varchar(45) NOT NULL,
  PRIMARY KEY (`departmentid`),
  UNIQUE KEY `Department_UNIQUE` (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Electronics'),(2,'Groceries'),(5,'Kitchen'),(4,'Medical'),(3,'Sports');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeid` int(11) NOT NULL AUTO_INCREMENT,
  `employeename` varchar(45) NOT NULL,
  `storeid` int(11) DEFAULT NULL,
  `employeecode` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`employeeid`),
  UNIQUE KEY `employeecode_UNIQUE` (`employeecode`),
  KEY `FK_employee_store_idx` (`storeid`),
  CONSTRAINT `FK_employee_store` FOREIGN KEY (`storeid`) REFERENCES `store` (`storeid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Anil',1,'',NULL,NULL,NULL,NULL),(2,'Tejas Pai',2,'xyz001',NULL,NULL,NULL,NULL),(3,'Hardik Gandhi',2,'xyz003',NULL,NULL,NULL,NULL),(4,'Vipul Kanade',2,'xyz004',NULL,NULL,NULL,NULL),(5,'Pankaj Dighe',2,'xyz005',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeAttendance`
--

DROP TABLE IF EXISTS `employeeAttendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeAttendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) NOT NULL,
  `intime` datetime NOT NULL,
  `outtime` datetime DEFAULT NULL,
  `inStore` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id_idx` (`employeeid`),
  CONSTRAINT `FK_employeeAttendance_employee` FOREIGN KEY (`employeeid`) REFERENCES `employee` (`employeeid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeAttendance`
--

LOCK TABLES `employeeAttendance` WRITE;
/*!40000 ALTER TABLE `employeeAttendance` DISABLE KEYS */;
INSERT INTO `employeeAttendance` VALUES (1,2,'2015-05-12 06:46:03','2015-05-12 07:26:40',0),(2,3,'2015-05-12 07:02:08','2015-05-12 07:22:08',0),(3,4,'2015-05-12 07:06:41','2015-05-12 07:22:51',0),(4,4,'2015-05-12 07:35:17',NULL,1),(5,5,'2015-05-13 08:39:57',NULL,1);
/*!40000 ALTER TABLE `employeeAttendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeDepartment`
--

DROP TABLE IF EXISTS `employeeDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeDepartment` (
  `department` varchar(45) NOT NULL,
  `instore` tinyint(1) NOT NULL DEFAULT '0',
  `employeeid` int(11) NOT NULL,
  PRIMARY KEY (`employeeid`),
  UNIQUE KEY `department_UNIQUE` (`department`),
  UNIQUE KEY `employeeid_UNIQUE` (`employeeid`),
  CONSTRAINT `employeeid` FOREIGN KEY (`employeeid`) REFERENCES `employee` (`employeeid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeDepartment`
--

LOCK TABLES `employeeDepartment` WRITE;
/*!40000 ALTER TABLE `employeeDepartment` DISABLE KEYS */;
INSERT INTO `employeeDepartment` VALUES ('warehouse',1,1);
/*!40000 ALTER TABLE `employeeDepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(45) NOT NULL,
  `itemquantity` int(11) NOT NULL,
  `storeid` int(11) NOT NULL,
  `itemcode` varchar(45) DEFAULT NULL,
  `itemprice` float(5,2) NOT NULL,
  `itemsentiment` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `itemcode_UNIQUE` (`itemcode`),
  KEY `storeid_idx` (`storeid`),
  CONSTRAINT `FK_items_store` FOREIGN KEY (`storeid`) REFERENCES `store` (`storeid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (8,'Parle G Biscuits',5,2,'abc001',10.00,0),(11,'Nescafe',6,2,'abc002',10.00,0),(13,'Daal',115,2,'0101231250',15.00,0),(14,'Frooti',19,2,'0101231251',10.00,-1),(15,'Oreo',40,2,'0101231252',75.00,8),(16,'Milk',39,2,'0101231253',450.00,0),(17,'Mangoes',100,2,'0101231276',999.99,1),(18,'Cake',50,2,'0101231274',999.99,-1),(19,'Coke',48,2,'0101231272',3.70,-1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemsentiment`
--

DROP TABLE IF EXISTS `itemsentiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemsentiment` (
  `itemid` int(11) NOT NULL,
  `sentiment` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  CONSTRAINT `PK_itemsentiment_items` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsentiment`
--

LOCK TABLES `itemsentiment` WRITE;
/*!40000 ALTER TABLE `itemsentiment` DISABLE KEYS */;
INSERT INTO `itemsentiment` VALUES (8,0),(11,0),(13,0),(14,0);
/*!40000 ALTER TABLE `itemsentiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemsold`
--

DROP TABLE IF EXISTS `itemsold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemsold` (
  `sellid` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `selltime` datetime NOT NULL,
  PRIMARY KEY (`sellid`),
  KEY `itemsellid_idx` (`itemid`),
  CONSTRAINT `FK_itemsold_items` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsold`
--

LOCK TABLES `itemsold` WRITE;
/*!40000 ALTER TABLE `itemsold` DISABLE KEYS */;
INSERT INTO `itemsold` VALUES (2,11,3,'2015-05-12 02:00:00'),(3,8,7,'2015-05-13 02:01:22'),(4,11,4,'2015-05-12 04:17:40'),(5,11,4,'2015-05-12 04:18:49'),(6,11,4,'2015-05-12 07:00:42'),(7,14,1,'2015-05-13 08:34:15'),(8,13,1,'2015-05-13 08:34:15'),(9,8,4,'2015-05-11 02:01:22'),(10,11,4,'2015-05-13 18:48:54'),(11,16,1,'2015-05-13 23:07:55'),(12,13,1,'2015-05-14 01:02:22'),(13,13,1,'2015-05-14 01:05:43'),(14,13,1,'2015-05-14 01:09:00'),(15,13,1,'2015-05-14 01:10:53'),(16,19,1,'2015-05-14 01:44:04'),(17,19,1,'2015-05-14 01:56:41');
/*!40000 ALTER TABLE `itemsold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemstocktime`
--

DROP TABLE IF EXISTS `itemstocktime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemstocktime` (
  `itemid` int(11) NOT NULL,
  `outofstocktime` datetime NOT NULL,
  `backinstocktime` datetime DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  CONSTRAINT `FK_itemstocktime_items` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemstocktime`
--

LOCK TABLES `itemstocktime` WRITE;
/*!40000 ALTER TABLE `itemstocktime` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemstocktime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `storeid` int(11) NOT NULL AUTO_INCREMENT,
  `storename` varchar(45) NOT NULL,
  PRIMARY KEY (`storeid`),
  UNIQUE KEY `storename_UNIQUE` (`storename`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (2,'store 1'),(4,'store 2'),(1,'store1');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Inventory_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_addEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_addEmployee`(employee_name varchar(45), store_id int(11), employee_code varchar(45), employee_address varchar(45), employee_state varchar(45), employee_pincode int(11), employee_phone int(11))
BEGIN
if not exists(select * from employee where employee.employeecode = employee_code) then
Insert into employee(employeename, storeid, employeecode, address, state, pincode, phone) values(employee_name, store_id, employee_code, employee_address, employee_state, employee_pincode, employee_phone);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_addUpdateproduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_addUpdateproduct`(iname varchar(45), iquantity int(11), sid int(11), icode varchar(45), iprice float)
BEGIN
if exists(Select * from items where items.itemcode = icode)  then

UPDATE items SET items.itemquantity = items.itemquantity+iquantity where items.itemcode = icode;

Else 
Insert into items(itemname, itemquantity, storeid, itemcode, itemprice) Values (iname, iquantity, sid, icode, iprice);

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_employeeInTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_employeeInTime`(employee_code varchar(45))
BEGIN
select @empid := employee.employeeid from employee where employee.employeecode = employee_code;

if not exists(select * from employeeAttendance where inStore =1 And employeeid = @empid) then
	insert into employeeAttendance(employeeid, intime, instore) values(@empid, now(), 1);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_employeeOutTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_employeeOutTime`(employee_code varchar(45))
BEGIN
select @empid := employee.employeeid from employee where employee.employeecode = employee_code;

select @id := id from employeeAttendance where employeeid = @empid and inStore = 1;

if exists(select * from employeeAttendance where employeeid = @empid and inStore = 1)  then
update employeeAttendance SET outtime = now(), inStore = 0 where id = @id;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_getEmployees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_getEmployees`(store_id int(11))
BEGIN
select employee.employeename, employee.employeeid, employeeAttendance.inStore from employee inner join employeeAttendance on employee.employeeid = employeeAttendance.employeeid; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_getItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_getItems`(store_id int(11))
BEGIN
Select * from items where items.storeid = store_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_getSentimentAnalysis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_getSentimentAnalysis`(item_name varchar(45), item_sentiment int(11))
BEGIN
if exists(Select * from items where items.itemname = item_name)  then

UPDATE items SET items.itemsentiment = item_sentiment where items.itemname = item_name;

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_getStores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_getStores`()
BEGIN
select * from store;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_inStoreEmployees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_inStoreEmployees`(store_id int(11))
BEGIN
select employee.employeename, employee.employeeid from employee inner join employeeAttendance on employee.employeeid = employeeAttendance.employeeid where employeeAttendance.inStore = 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_itemsSoldLastWeek` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_itemsSoldLastWeek`(no_days int(11))
BEGIN
SELECT items.itemname, Sum(itemsold.count) as quantity, items.itemsentiment FROM items inner join itemsold on items.itemid = itemsold.itemid inner join itemsentiment on items.itemid = itemsentiment.itemid where itemsold.selltime > curdate()-no_days Group by items.itemname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_soldProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`team2`@`%` PROCEDURE `proc_soldProduct`(iquantity int(11), sid int(11), icode varchar(45))
BEGIN
select @itemid :=  items.itemid from items where items.itemcode = icode AND items.storeid = sid;

Insert Into itemsold(itemid, count, selltime) Values(@itemid, iquantity, now());
Update items SET items.itemquantity = items.itemquantity - iquantity where items.itemid = @itemid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-13 19:01:58
