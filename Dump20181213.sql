CREATE DATABASE  IF NOT EXISTS `cassianprojdm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cassianprojdm`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: cassianprojdm
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `CategoryId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(20) NOT NULL,
  `FoodType` varchar(10) NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Meat Sand-witches','Non-Veg'),(2,'Veg Sand-witches','Veg'),(3,'Meat Dinner PLates','Non-Veg'),(4,'Veg Dinner PLates','Veg'),(5,'Side Orders','Veg'),(6,'Beverages','Veg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `combo` (
  `ComboId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ComboName` varchar(45) NOT NULL,
  `ComboPrice` float NOT NULL,
  PRIMARY KEY (`ComboId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo`
--

LOCK TABLES `combo` WRITE;
/*!40000 ALTER TABLE `combo` DISABLE KEYS */;
INSERT INTO `combo` VALUES (1,'Veg Sand-witch Combo',11.99),(2,'Non-veg Combo',11.99);
/*!40000 ALTER TABLE `combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo_has_menuitems`
--

DROP TABLE IF EXISTS `combo_has_menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `combo_has_menuitems` (
  `Combo_ComboId` int(10) unsigned NOT NULL,
  `MenuItems_MenuItemsId` int(10) unsigned NOT NULL,
  `NumberOfCombos` varchar(45) NOT NULL,
  PRIMARY KEY (`Combo_ComboId`,`MenuItems_MenuItemsId`),
  KEY `fk_Combo_has_MenuItems_MenuItems1_idx` (`MenuItems_MenuItemsId`),
  KEY `fk_Combo_has_MenuItems_Combo1_idx` (`Combo_ComboId`),
  CONSTRAINT `fk_Combo_has_MenuItems_Combo1` FOREIGN KEY (`Combo_ComboId`) REFERENCES `combo` (`comboid`),
  CONSTRAINT `fk_Combo_has_MenuItems_MenuItems1` FOREIGN KEY (`MenuItems_MenuItemsId`) REFERENCES `menuitems` (`menuitemsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo_has_menuitems`
--

LOCK TABLES `combo_has_menuitems` WRITE;
/*!40000 ALTER TABLE `combo_has_menuitems` DISABLE KEYS */;
INSERT INTO `combo_has_menuitems` VALUES (1,3,'1'),(1,9,'1'),(1,11,'1'),(2,1,'1'),(2,9,'1'),(2,11,'1');
/*!40000 ALTER TABLE `combo_has_menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `Person_PersonId` int(10) unsigned NOT NULL,
  `ModeOfPayment` varchar(45) NOT NULL,
  PRIMARY KEY (`Person_PersonId`),
  KEY `fk_Customer_Person1_idx` (`Person_PersonId`),
  CONSTRAINT `fk_Customer_Person1` FOREIGN KEY (`Person_PersonId`) REFERENCES `person` (`personid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (4,'Cash'),(5,'Card'),(6,'Cash');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorders`
--

DROP TABLE IF EXISTS `customerorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customerorders` (
  `CustomerOrdersId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Time` datetime NOT NULL,
  `Customer_Person_PersonId` int(10) unsigned DEFAULT NULL,
  `Worker_Person_PersonId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`CustomerOrdersId`),
  KEY `fk_CustomerOrders_Customer1_idx` (`Customer_Person_PersonId`),
  KEY `fk_CustomerOrders_Worker1_idx` (`Worker_Person_PersonId`),
  CONSTRAINT `fk_CustomerOrders_Customer1` FOREIGN KEY (`Customer_Person_PersonId`) REFERENCES `customer` (`person_personid`),
  CONSTRAINT `fk_CustomerOrders_Worker1` FOREIGN KEY (`Worker_Person_PersonId`) REFERENCES `worker` (`person_personid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorders`
--

LOCK TABLES `customerorders` WRITE;
/*!40000 ALTER TABLE `customerorders` DISABLE KEYS */;
INSERT INTO `customerorders` VALUES (1,'2018-12-13 11:48:42',4,2),(2,'2018-12-13 11:48:42',4,2),(3,'2018-12-13 11:48:42',4,2),(4,'2018-12-13 11:48:42',4,2),(5,'2018-12-13 11:48:42',4,2);
/*!40000 ALTER TABLE `customerorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorders_has_combo`
--

DROP TABLE IF EXISTS `customerorders_has_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customerorders_has_combo` (
  `CustomerOrders_CustomerOrdersId` int(10) unsigned NOT NULL,
  `Combo_ComboId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CustomerOrders_CustomerOrdersId`,`Combo_ComboId`),
  KEY `fk_CustomerOrders_has_Combo_Combo1_idx` (`Combo_ComboId`),
  KEY `fk_CustomerOrders_has_Combo_CustomerOrders1_idx` (`CustomerOrders_CustomerOrdersId`),
  CONSTRAINT `fk_CustomerOrders_has_Combo_Combo1` FOREIGN KEY (`Combo_ComboId`) REFERENCES `combo` (`comboid`),
  CONSTRAINT `fk_CustomerOrders_has_Combo_CustomerOrders1` FOREIGN KEY (`CustomerOrders_CustomerOrdersId`) REFERENCES `customerorders` (`customerordersid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorders_has_combo`
--

LOCK TABLES `customerorders_has_combo` WRITE;
/*!40000 ALTER TABLE `customerorders_has_combo` DISABLE KEYS */;
INSERT INTO `customerorders_has_combo` VALUES (2,1),(3,1),(4,2);
/*!40000 ALTER TABLE `customerorders_has_combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inventory` (
  `InventoryId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IngredientName` varchar(20) NOT NULL,
  `Availability` int(11) NOT NULL,
  PRIMARY KEY (`InventoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Potatoes',100),(2,'Lettuce',500),(3,'Tomato',200),(4,'Mayonese',40),(5,'Chicken Meat',300),(6,'Beef Meat',50),(7,'Lamb Meat',50),(8,'Humus',150),(9,'Veggies',90),(10,'Beans',70),(11,'Fries',100),(12,'Coke',30),(13,'Orange Juice',30);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menuitems` (
  `MenuItemsId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(45) NOT NULL,
  `Details` varchar(200) NOT NULL,
  `Rate` float NOT NULL,
  `Category_CategoryId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`MenuItemsId`),
  KEY `fk_MenuItems_Category1_idx` (`Category_CategoryId`),
  CONSTRAINT `fk_MenuItems_Category1` FOREIGN KEY (`Category_CategoryId`) REFERENCES `category` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'Lamb Sand-wich','Sand-wich made with Lamb meat and special ingredients',7.99,1),(2,'Beef Sand-wich','Sand-wich made with beef meat and special ingredients',8.99,1),(3,'Fresh Veggies Sand-wich','Sand-wich made with Fresh Veggies and special ingredients',7.99,2),(4,'Fresh Veggies Sand-wich with Beans','Sand-wich made with Kidney Beans, Veggies and special ingredients',8.99,2),(5,'Lamb Dinner Plate','Meal made with lamb meat and special ingredients',7.99,3),(6,'Beef Dinner Plate','Meal made with beef meat and special ingredients',8.99,3),(7,'Veg Plate','Meal made with Fresh Veggies and special ingredients',7.99,4),(8,'Special Veg Plate','Meal made with Kidney Beans, Veggies and special ingredients',8.99,4),(9,'Fries','Salted French Fries',4.99,5),(10,'Baklawa','Dessert specialty made with love',5.99,5),(11,'Coke','Chilled Beverages',2.99,6),(12,'Orange Juice','Fresh Orange Juice',2.99,6);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems_has_customerorders`
--

DROP TABLE IF EXISTS `menuitems_has_customerorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menuitems_has_customerorders` (
  `MenuItems_MenuItemsId` int(10) unsigned NOT NULL,
  `CustomerOrders_CustomerOrdersId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`MenuItems_MenuItemsId`,`CustomerOrders_CustomerOrdersId`),
  KEY `fk_MenuItems_has_CustomerOrders_CustomerOrders1_idx` (`CustomerOrders_CustomerOrdersId`),
  KEY `fk_MenuItems_has_CustomerOrders_MenuItems1_idx` (`MenuItems_MenuItemsId`),
  CONSTRAINT `fk_MenuItems_has_CustomerOrders_CustomerOrders1` FOREIGN KEY (`CustomerOrders_CustomerOrdersId`) REFERENCES `customerorders` (`customerordersid`),
  CONSTRAINT `fk_MenuItems_has_CustomerOrders_MenuItems1` FOREIGN KEY (`MenuItems_MenuItemsId`) REFERENCES `menuitems` (`menuitemsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems_has_customerorders`
--

LOCK TABLES `menuitems_has_customerorders` WRITE;
/*!40000 ALTER TABLE `menuitems_has_customerorders` DISABLE KEYS */;
INSERT INTO `menuitems_has_customerorders` VALUES (3,2),(4,3);
/*!40000 ALTER TABLE `menuitems_has_customerorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems_has_inventory`
--

DROP TABLE IF EXISTS `menuitems_has_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menuitems_has_inventory` (
  `MenuItems_MenuItemsId` int(10) unsigned NOT NULL,
  `Inventory_InventoryId` int(10) unsigned NOT NULL,
  `Requirement` int(11) NOT NULL,
  PRIMARY KEY (`MenuItems_MenuItemsId`,`Inventory_InventoryId`),
  KEY `fk_MenuItems_has_Inventory_Inventory1_idx` (`Inventory_InventoryId`),
  KEY `fk_MenuItems_has_Inventory_MenuItems_idx` (`MenuItems_MenuItemsId`),
  CONSTRAINT `fk_MenuItems_has_Inventory_Inventory1` FOREIGN KEY (`Inventory_InventoryId`) REFERENCES `inventory` (`inventoryid`),
  CONSTRAINT `fk_MenuItems_has_Inventory_MenuItems` FOREIGN KEY (`MenuItems_MenuItemsId`) REFERENCES `menuitems` (`menuitemsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems_has_inventory`
--

LOCK TABLES `menuitems_has_inventory` WRITE;
/*!40000 ALTER TABLE `menuitems_has_inventory` DISABLE KEYS */;
INSERT INTO `menuitems_has_inventory` VALUES (1,1,1),(1,2,2),(1,3,1),(1,4,1),(1,7,2),(1,8,2),(2,1,1),(2,2,2),(2,3,1),(2,4,1),(2,6,2),(2,8,2),(3,1,1),(3,2,2),(3,3,1),(3,4,1),(3,8,2),(3,9,2),(4,1,1),(4,2,2),(4,3,1),(4,4,1),(4,8,2),(4,10,2),(9,11,1),(11,12,1),(12,13,1);
/*!40000 ALTER TABLE `menuitems_has_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payroll` (
  `HoursWorked` float NOT NULL,
  `Employee_Person_PersonId` int(10) unsigned NOT NULL,
  `Year` varchar(4) NOT NULL,
  `Month` varchar(2) NOT NULL,
  PRIMARY KEY (`Employee_Person_PersonId`,`Year`,`Month`),
  CONSTRAINT `fk_Payroll_Employee1` FOREIGN KEY (`Employee_Person_PersonId`) REFERENCES `worker` (`person_personid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (42,1,'2018','10'),(40,1,'2018','8'),(35,1,'2018','9'),(75,2,'2018','10'),(80,2,'2018','8'),(90,2,'2018','9'),(100,3,'2018','10'),(750,3,'2018','8'),(60,3,'2018','9');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person` (
  `PersonId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL,
  `AddressLIne1` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Zipcode` int(11) NOT NULL,
  PRIMARY KEY (`PersonId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Shawn','Gonsalves','4044256314','26A Saint Alphonsus','Boston','Mas',2120),(2,'Sam','Lopez','3948203948','12 Heath street','Boston','Mas',2310),(3,'Terry','Maz','3927492037','13 Symphony street','Boston','Mas',9462),(4,'Mendis','Mac','4044256314','26A acs cas','Boston','Mas',2120),(5,'Sam','How','3948203948','12 cas street','Boston','Mas',2310),(6,'Lin','Pou','3927492037','13 vv street','Boston','Mas',9462);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `salarymanagers`
--

DROP TABLE IF EXISTS `salarymanagers`;
/*!50001 DROP VIEW IF EXISTS `salarymanagers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `salarymanagers` AS SELECT 
 1 AS `EmployeeId`,
 1 AS `Designation`,
 1 AS `Year`,
 1 AS `Month`,
 1 AS `HoursWorked`,
 1 AS `TotalSalary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewcustomers`
--

DROP TABLE IF EXISTS `viewcustomers`;
/*!50001 DROP VIEW IF EXISTS `viewcustomers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `viewcustomers` AS SELECT 
 1 AS `PersonId`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `ModeOfPayment`,
 1 AS `PhoneNumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `worker` (
  `DateOfJoining` date NOT NULL,
  `Designation` varchar(45) NOT NULL,
  `Person_PersonId` int(10) unsigned NOT NULL,
  `UserId` varchar(20) NOT NULL,
  `Password` varchar(150) NOT NULL,
  PRIMARY KEY (`Person_PersonId`),
  KEY `fk_Employee_Person1_idx` (`Person_PersonId`),
  CONSTRAINT `fk_Employee_Person1` FOREIGN KEY (`Person_PersonId`) REFERENCES `person` (`personid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES ('2014-09-19','Manager',1,'cas_gonsalves','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225'),('2014-10-21','CheckoutPerson',2,'shaw_lopez','61631d4833967e530ad096c7e02b28d2159dbd332615d07a44875609e2916975'),('2015-05-25','Cleaning Person',3,'maz_terry','1c05bc1150a5ec729bbd49b291a7322a68a8e0a2afac0d467c778449e6c18827');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `addingCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addingCategory`(IN CategoryName varchar(20),IN FoodType varchar(10))
BEGIN
	INSERT INTO Category(Category.CategoryName,Category.FoodType) VALUES(CategoryName,FoodType);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addingCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addingCustomer`(IN FirstName varchar(45), IN LastName varchar(45), IN PhoneNumber varchar(10),
 IN AddressLIne1 varchar(45), IN City varchar(45), IN State varchar(45), IN Zipcode int, IN ModeOfPayment varchar(45))
BEGIN
		START TRANSACTION;
			INSERT INTO Person(Person.FirstName,Person.LastName,Person.PhoneNumber,Person.AddressLIne1,Person.City,Person.State,Person.Zipcode) values(FirstName,LastName,PhoneNumber,AddressLIne1,City,State,Zipcode);
			SELECT @personID := LAST_INSERT_ID();
			INSERT INTO Customer(Customer.Person_PersonId, Customer.ModeOfPayment) values(@personID,ModeOfPayment);
		COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addingIngredients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addingIngredients`(IN IngredientName varchar(20),IN Availability int)
BEGIN
	INSERT INTO Inventory(Inventory.IngredientName,Inventory.Availability) VALUES(IngredientName,Availability);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addingMenuItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addingMenuItems`(IN ItemName varchar(45),IN  Details varchar(200),IN Rate float,IN Category_CategoryId int)
BEGIN
	INSERT INTO MenuItems(MenuItems.ItemName,MenuItems.Details,MenuItems.Rate,MenuItems.Category_CategoryId) VALUES(ItemName,Details,Rate,Category_CategoryId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addingWorker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addingWorker`(IN FirstName varchar(45), IN LastName varchar(45), IN PhoneNumber varchar(10), IN AddressLIne1 varchar(45), IN City varchar(45), IN State varchar(45), IN Zipcode int, IN DateOfJoining Date, IN Designation varchar(45),
IN UserId varchar(45),IN Password varchar(45))
BEGIN
		START TRANSACTION;
			INSERT INTO Person(Person.FirstName,Person.LastName,Person.PhoneNumber,Person.AddressLIne1,Person.City,Person.State,Person.Zipcode) values(FirstName,LastName,PhoneNumber,AddressLIne1,City,State,Zipcode);
			SELECT @personID := LAST_INSERT_ID();
			INSERT INTO Worker(Worker.Person_PersonId,Worker.DateOfJoining,Worker.Designation,Worker.UserId,Worker.Password) values(@personID,DateOfJoining,Designation,UserId,SHA2(Password,256));
		COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `combinationMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `combinationMapping`(IN Combo_ComboId integer,IN  MenuItems_MenuItemsId integer,IN NumberOfCombos integer)
BEGIN
	INSERT INTO Combo_has_MenuItems(Combo_has_MenuItems.Combo_ComboId,Combo_has_MenuItems.MenuItems_MenuItemsId,Combo_has_MenuItems.NumberOfCombos) VALUES(Combo_ComboId,MenuItems_MenuItemsId,NumberOfCombos);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comboOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comboOrder`(IN CustomerOrders_CustomerOrdersId integer,IN  Combo_ComboId integer)
BEGIN
	INSERT INTO CustomerOrders_has_Combo(CustomerOrders_has_Combo.CustomerOrders_CustomerOrdersId,CustomerOrders_has_Combo.Combo_ComboId) VALUES(CustomerOrders_CustomerOrdersId,Combo_ComboId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customerOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customerOrder`(IN Customer_Person_PersonId int, IN CheckoutPerson int)
BEGIN
	START TRANSACTION;
	INSERT INTO CustomerOrders(CustomerOrders.TIME,CustomerOrders.Customer_Person_PersonId,CustomerOrders.Worker_Person_PersonId)
	SELECT NOW(),Customer_Person_PersonId,Worker.Person_PersonId FROM Worker WHERE Worker.Person_PersonId=2;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `custOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `custOrders`(IN MenuItems_MenuItemsId integer,IN  CustomerOrders_CustomerOrdersId integer)
BEGIN
	INSERT INTO MenuItems_has_CustomerOrders(MenuItems_has_CustomerOrders.MenuItems_MenuItemsId,MenuItems_has_CustomerOrders.CustomerOrders_CustomerOrdersId) VALUES(MenuItems_MenuItemsId,CustomerOrders_CustomerOrdersId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingredientRequirementMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingredientRequirementMap`(IN MenuItems_MenuItemsId integer,IN  Inventory_InventoryId integer,IN Requirement integer)
BEGIN
	INSERT INTO MenuItems_has_Inventory(MenuItems_has_Inventory.MenuItems_MenuItemsId,MenuItems_has_Inventory.Inventory_InventoryId,MenuItems_has_Inventory.Requirement) VALUES(MenuItems_MenuItemsId,Inventory_InventoryId,Requirement);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `makingCombinations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `makingCombinations`(IN name varchar(30),IN  price float)
BEGIN
	INSERT INTO Combo(Combo.ComboName,Combo.ComboPrice) VALUES(name,price);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `payrollEntry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `payrollEntry`(IN HoursWorked FLOAT,IN  Employee_Person_PersonId int,IN  Year varchar(4),IN  Month varchar(4))
BEGIN
	INSERT INTO Payroll(Payroll.HoursWorked,Payroll.Employee_Person_PersonId,Payroll.Year,Payroll.Month) VALUES(HoursWorked,Employee_Person_PersonId,Year,Month);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `salarymanagers`
--

/*!50001 DROP VIEW IF EXISTS `salarymanagers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salarymanagers` AS (select `worker`.`Person_PersonId` AS `EmployeeId`,`worker`.`Designation` AS `Designation`,`payroll`.`Year` AS `Year`,`payroll`.`Month` AS `Month`,`payroll`.`HoursWorked` AS `HoursWorked`,(`payroll`.`HoursWorked` * 100) AS `TotalSalary` from ((`worker` join `payroll` on((`worker`.`Person_PersonId` = `payroll`.`Employee_Person_PersonId`))) join `person` on((`worker`.`Person_PersonId` = `person`.`PersonId`))) where (`worker`.`Designation` = 'Manager')) union all (select `worker`.`Person_PersonId` AS `EmployeeId`,`worker`.`Designation` AS `Designation`,`payroll`.`Year` AS `Year`,`payroll`.`Month` AS `Month`,`payroll`.`HoursWorked` AS `HoursWorked`,(`payroll`.`HoursWorked` * 100) AS `TotalSalary` from ((`worker` join `payroll` on((`worker`.`Person_PersonId` = `payroll`.`Employee_Person_PersonId`))) join `person` on((`worker`.`Person_PersonId` = `person`.`PersonId`))) where (`worker`.`Designation` = 'CheckoutPerson')) union all (select `worker`.`Person_PersonId` AS `EmployeeId`,`worker`.`Designation` AS `Designation`,`payroll`.`Year` AS `Year`,`payroll`.`Month` AS `Month`,`payroll`.`HoursWorked` AS `HoursWorked`,(`payroll`.`HoursWorked` * 100) AS `TotalSalary` from ((`worker` join `payroll` on((`worker`.`Person_PersonId` = `payroll`.`Employee_Person_PersonId`))) join `person` on((`worker`.`Person_PersonId` = `person`.`PersonId`))) where (`worker`.`Designation` = 'Cleaning Person')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewcustomers`
--

/*!50001 DROP VIEW IF EXISTS `viewcustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewcustomers` AS select `person`.`PersonId` AS `PersonId`,`person`.`FirstName` AS `FirstName`,`person`.`LastName` AS `LastName`,`customer`.`ModeOfPayment` AS `ModeOfPayment`,`person`.`PhoneNumber` AS `PhoneNumber` from (`person` join `customer` on((`person`.`PersonId` = `customer`.`Person_PersonId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 11:55:46
