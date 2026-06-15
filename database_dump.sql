-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: product_BI
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerNumber` int NOT NULL AUTO_INCREMENT,
  `customerName` varchar(20) DEFAULT NULL,
  `contactLastN` varchar(10) DEFAULT NULL,
  `contactFirstN` varchar(10) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `addressLine1` varchar(50) DEFAULT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `postalCode` int DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `fk_salesRepEmployeeNum` int DEFAULT NULL,
  `creditLimit` int DEFAULT NULL,
  PRIMARY KEY (`customerNumber`),
  KEY `fk_salesRepEmployeeNum` (`fk_salesRepEmployeeNum`),
  CONSTRAINT `fk_salesRepEmployeeNum` FOREIGN KEY (`fk_salesRepEmployeeNum`) REFERENCES `employees` (`employeeNum`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (101,'Scent Palace','Al Mansoor','Fatima','+971-4-111-10','Gold Souk Sh12',NULL,'Dubai',NULL,12345,'UAE',2,50000),(102,'Luxury Aromas','Al Zaabi','Rashid','+971-2-111-10','Yas Mall Unit 5',NULL,'Abu Dhabi',NULL,12346,'UAE',3,45000),(103,'Desert Rose','Hamdan','Aisha','+971-6-111-10','City Ctr Sharjah',NULL,'Sharjah',NULL,12347,'UAE',2,30000),(104,'Royal Oud','Al Falasi','Sultan','+971-4-111-10','Dubai Mall L2',NULL,'Dubai',NULL,12348,'UAE',3,60000),(105,'Pearl Perfumery','Saeed','Mariam','+971-7-111-10','RAK Mall Sh8',NULL,'Ras Al Kha',NULL,12349,'UAE',2,25000),(106,'Maison Parfum','Dupuis','Isabelle','+33-1-222-200','15 Rue Rivoli',NULL,'Paris',NULL,75001,'France',5,55000),(107,'Le Nez Curieux','Bertrand','Pascal','+33-4-222-200','22 Rue de Paix',NULL,'Lyon',NULL,69001,'France',6,40000),(108,'Frag Atelier','Girard','Camille','+33-5-222-200','8 Allee Tourny',NULL,'Bordeaux',NULL,33000,'France',5,35000),(109,'Azur Scents','Blanc','Pierre','+33-4-222-200','5 Promenade',NULL,'Nice',NULL,6000,'France',6,48000),(110,'Parfums du Midi','Rousseau','Elise','+33-4-222-200','10 Canebiere',NULL,'Marseille',NULL,13001,'France',5,32000),(111,'Fifth Ave Frag','Smith','Jennifer','+1-212-333-30','520 Madison Ave',NULL,'New York','NY',10022,'USA',8,70000),(112,'Beverly Scents','Garcia','Carlos','+1-310-333-30','9876 Wilshire',NULL,'Los Angele','CA',90210,'USA',9,65000),(113,'Windy City Aroma','Brown','Ashley','+1-312-333-30','233 S Wacker',NULL,'Chicago','IL',60606,'USA',8,50000),(114,'Lone Star Scents','Martinez','Roberto','+1-713-333-30','1600 Smith St',NULL,'Houston','TX',77002,'USA',9,42000),(115,'Golden Gate Frag','Lee','Jessica','+1-415-333-30','1 Market St',NULL,'San Franci','CA',94105,'USA',8,58000),(116,'Miami Scent Studio','Davis','Michael','+1-305-333-30','100 Biscayne',NULL,'Miami','FL',33132,'USA',9,47000),(117,'Emerald Scents','Wilson','Sarah','+1-206-333-30','1000 Pike St',NULL,'Seattle','WA',98101,'USA',8,38000),(118,'Orchard Parfums','Tan','Mei Ling','+65-6444-4001','391 Orchard Rd',NULL,'Singapore',NULL,238872,'Singapore',11,45000),(119,'Marina Bay Scents','Wong','Kai Xuan','+65-6444-4002','10 Bayfront Ave',NULL,'Singapore',NULL,18956,'Singapore',12,52000),(120,'Raffles Fragrance','Ng','Shu Fen','+65-6444-4003','1 Beach Rd',NULL,'Singapore',NULL,189673,'Singapore',11,39000),(121,'Sentosa Scent Bar','Goh','Jun Wei','+65-6444-4004','8 Sentosa Gtwy',NULL,'Singapore',NULL,98269,'Singapore',12,35000),(122,'Frag Kingdom','Lim','Boon Huat','+60-3-444-400','Pavilion KL U3',NULL,'Kuala Lump',NULL,50450,'Malaysia',11,41000),(123,'Mayfair Scents','Hartley','Oliver','+44-20-555-50','45 Berkeley Sq',NULL,'London',NULL,11000,'UK',14,62000),(124,'Edinburgh Aromas','MacLeod','Fiona','+44-131-555-5','12 Royal Mile',NULL,'Edinburgh',NULL,22000,'UK',15,38000),(125,'Manchester Scents','Walsh','Brendan','+44-161-555-5','50 Deansgate',NULL,'Manchester',NULL,33000,'UK',14,44000),(126,'Bristol Parfum','Evans','Cerys','+44-117-555-5','1 Clifton Down',NULL,'Bristol',NULL,44000,'UK',15,33000),(127,'Harrods Fragrance','Stewart','Charlotte','+44-20-555-50','87 Brompton Rd',NULL,'London',NULL,55000,'UK',14,75000),(128,'Ginza Parfum','Yamada','Sakura','+81-3-666-600','5-7 Ginza',NULL,'Tokyo',NULL,1040061,'Japan',17,55000),(129,'Kyoto Scent','Suzuki','Haruto','+81-75-666-60','100 Kawaramachi',NULL,'Kyoto',NULL,6000001,'Japan',18,42000),(130,'Osaka Frag Lab','Watanabe','Aoi','+81-6-666-600','2 Namba Parks',NULL,'Osaka',NULL,5420076,'Japan',17,48000),(131,'Shibuya Scent Co','Ito','Ren','+81-3-666-600','2-24-12 Shibuya',NULL,'Tokyo',NULL,1500002,'Japan',18,37000),(132,'Sapporo Aromas','Tanaka','Hana','+81-11-666-60','1 Odori Park',NULL,'Sapporo',NULL,642,'Japan',17,31000),(133,'Sydney Scent House','Cooper','Zoe','+61-2-777-700','1 Pitt St',NULL,'Sydney','NSW',2000,'Australia',20,48000),(134,'Melbourne Parfums','Mitchell','Jack','+61-3-777-700','200 Collins St',NULL,'Melbourne','VIC',3000,'Australia',21,44000),(135,'Brisbane Botanics','Roberts','Emma','+61-7-777-700','100 Queen St',NULL,'Brisbane','QLD',4000,'Australia',20,36000),(136,'Perth Perfume Co','Turner','William','+61-8-777-700','50 Hay St',NULL,'Perth','WA',6000,'Australia',21,32000),(137,'Adelaide Scents','White','Isabella','+61-8-777-700','80 Rundle Mall',NULL,'Adelaide','SA',5000,'Australia',20,28000),(138,'Zurich Parfumerie','Muller','Hans','+41-44-888-80','Bahnhofstr 10',NULL,'Zurich',NULL,8001,'Switzerlan',5,53000),(139,'Toronto Scents','Tremblay','Marie','+1-416-888-80','100 King St W',NULL,'Toronto','ON',44000,'Canada',8,45000),(140,'Seoul Aroma Studio','Kim','Ji Yeon','+82-2-888-800','Gangnam-daero 1',NULL,'Seoul',NULL,6236,'South Kore',12,49000),(141,'Mumbai Fragrance','Sharma','Priyanka','+91-22-888-80','Nariman Point 5',NULL,'Mumbai',NULL,400021,'India',12,38000),(142,'Amsterdam Scents','de Vries','Lars','+31-20-888-80','Herengracht 100',NULL,'Amsterdam',NULL,1017,'Netherland',6,43000),(143,'Berlin Parfums','Schmidt','Anna','+49-30-888-80','Kurfurstendamm',NULL,'Berlin',NULL,10707,'Germany',6,47000),(144,'Madrid Aromas','Garcia','Lucia','+34-91-888-80','Gran Via 28',NULL,'Madrid',NULL,28013,'Spain',5,41000),(145,'Milan Scent','Rossi','Marco','+39-02-888-80','Corso BA 5',NULL,'Milan',NULL,20124,'Italy',6,50000),(146,'Cairo Perfume','El-Sayed','Yasmin','+20-2-888-800','Khan Khalili 3',NULL,'Cairo',NULL,11511,'Egypt',2,29000),(147,'Riyadh Scents','Al-Otaibi','Fahad','+966-11-888-8','Olaya St Twr 2',NULL,'Riyadh',NULL,12211,'Saudi Arab',3,55000),(148,'Bangkok Aromas','Charoenwon','Napat','+66-2-888-801','Siam Paragon L3',NULL,'Bangkok',NULL,10330,'Thailand',11,34000),(149,'Cape Town Scents','van der Be','Pieter','+27-21-888-80','VA Waterfront 8',NULL,'Cape Town',NULL,8001,'South Afri',20,30000),(150,'Sao Paulo Parfums','Silva','Beatriz','+55-11-888-80','Av Paulista 900',NULL,'Sao Paulo',NULL,1310,'Brazil',9,36000);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employeeNum` int NOT NULL AUTO_INCREMENT,
  `lastName` varchar(20) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `fk_officeCode` int DEFAULT NULL,
  `reportsTo` varchar(10) DEFAULT NULL,
  `jobTitle` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`employeeNum`),
  KEY `fk_officeCode` (`fk_officeCode`),
  CONSTRAINT `fk_officeCode` FOREIGN KEY (`fk_officeCode`) REFERENCES `offices` (`officeCode`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Al Rashid','Khalid','x101','k.alrashid@me.com',1,NULL,'Office Manager'),(2,'Hassan','Nadia','x102','n.hassan@me.com',1,'1','Sales Rep'),(3,'Malik','Omar','x103','o.malik@me.com',1,'1','Sales Rep'),(4,'Dupont','Claire','x201','c.dupont@me.com',2,NULL,'Office Manager'),(5,'Moreau','Julien','x202','j.moreau@me.com',2,'4','Sales Rep'),(6,'Laurent','Sophie','x203','s.laurent@me.com',2,'4','Sales Rep'),(7,'Johnson','Marcus','x301','m.johnson@me.com',3,NULL,'Office Manager'),(8,'Williams','Priya','x302','p.williams@me.com',3,'7','Sales Rep'),(9,'Chen','Derek','x303','d.chen@me.com',3,'7','Sales Rep'),(10,'Tan','Wei Lin','x401','w.tan@me.com',4,NULL,'Office Manager'),(11,'Lim','Hui Fen','x402','h.lim@me.com',4,'10','Sales Rep'),(12,'Kumar','Arjun','x403','a.kumar@me.com',4,'10','Sales Rep'),(13,'Thompson','Emily','x501','e.thompson@me.com',5,NULL,'Office Manager'),(14,'Davies','Rhys','x502','r.davies@me.com',5,'13','Sales Rep'),(15,'Patel','Ananya','x503','a.patel@me.com',5,'13','Sales Rep'),(16,'Yamamoto','Kenji','x601','k.yamamoto@me.com',6,NULL,'Office Manager'),(17,'Nakamura','Yuki','x602','y.nakamura@me.com',6,'16','Sales Rep'),(18,'Sato','Hiro','x603','h.sato@me.com',6,'16','Sales Rep'),(19,'Wilson','Brooke','x701','b.wilson@me.com',7,NULL,'Office Manager'),(20,'OBrien','Liam','x702','l.obrien@me.com',7,'19','Sales Rep'),(21,'Nguyen','Thi Mai','x703','t.nguyen@me.com',7,'19','Sales Rep');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offices` (
  `officeCode` int NOT NULL AUTO_INCREMENT,
  `city` varchar(10) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `addressLine1` varchar(50) DEFAULT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `territory` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`officeCode`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (1,'Dubai','+971-4-123-45','ME Tower Shk Zayed','Unit 401',NULL,'UAE','Middle Eas'),(2,'Paris','+33-1-4567-89','12 Rue du Faubourg','Suite 200',NULL,'France','Europe'),(3,'New York','+1-212-555-01','350 Fifth Avenue','Floor 22','NY','USA','North Amer'),(4,'Singapore','+65-6123-4567','1 Raffles Place','Level 18',NULL,'Singapore','Asia Pacif'),(5,'London','+44-20-7123-4','10 Mayfair Street','Suite 5',NULL,'UK','Europe'),(6,'Tokyo','+81-3-1234-56','Shibuya Scramble Sq','28F',NULL,'Japan','Asia Pacif'),(7,'Sydney','+61-2-9123-45','1 Martin Place','Level 12','NSW','Australia','Asia Pacif');
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `orderNumber` int NOT NULL AUTO_INCREMENT,
  `fk_productCode` int DEFAULT NULL,
  `quantityOrdered` int DEFAULT NULL,
  `priceEach` int DEFAULT NULL,
  `orderLineNumber` int DEFAULT NULL,
  PRIMARY KEY (`orderNumber`),
  KEY `productCode` (`fk_productCode`),
  CONSTRAINT `productCode` FOREIGN KEY (`fk_productCode`) REFERENCES `products` (`productCode`)
) ENGINE=InnoDB AUTO_INCREMENT=1151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1001,4,5,120,1),(1002,7,10,65,1),(1003,5,6,105,1),(1004,4,4,120,1),(1005,12,2,250,1),(1006,10,1,210,1),(1007,9,6,69,1),(1008,11,2,220,1),(1009,8,9,59,1),(1010,12,2,250,1),(1011,4,5,120,1),(1012,10,1,210,1),(1013,4,6,120,1),(1014,7,8,65,1),(1015,6,4,115,1),(1016,5,5,105,1),(1017,9,6,69,1),(1018,4,4,120,1),(1019,11,1,220,1),(1020,6,2,115,1),(1021,10,2,210,1),(1022,6,6,115,1),(1023,5,4,105,1),(1024,7,10,65,1),(1025,12,2,250,1),(1026,8,8,59,1),(1027,11,1,220,1),(1028,6,3,115,1),(1029,5,5,105,1),(1030,10,1,210,1),(1031,4,4,120,1),(1032,12,1,250,1),(1033,4,5,120,1),(1034,6,6,115,1),(1035,5,4,105,1),(1036,7,8,65,1),(1037,11,2,220,1),(1038,4,5,120,1),(1039,10,1,210,1),(1040,6,3,115,1),(1041,6,5,115,1),(1042,5,4,105,1),(1043,7,10,65,1),(1044,12,1,250,1),(1045,12,1,250,1),(1046,4,5,120,1),(1047,11,1,220,1),(1048,4,6,120,1),(1049,10,2,210,1),(1050,5,5,105,1),(1051,4,8,120,1),(1052,7,12,65,1),(1053,8,10,59,1),(1054,12,2,250,1),(1055,10,3,210,1),(1056,9,8,69,1),(1057,12,2,250,1),(1058,5,7,105,1),(1059,11,2,220,1),(1060,4,6,120,1),(1061,6,4,115,1),(1062,11,1,220,1),(1063,4,7,120,1),(1064,6,8,115,1),(1065,5,6,105,1),(1066,7,12,65,1),(1067,12,1,250,1),(1068,6,3,115,1),(1069,11,1,220,1),(1070,6,7,115,1),(1071,10,2,210,1),(1072,5,8,105,1),(1073,11,2,220,1),(1074,4,6,120,1),(1075,12,2,250,1),(1076,6,8,115,1),(1077,8,10,59,1),(1078,7,12,65,1),(1079,11,1,220,1),(1080,5,7,105,1),(1081,12,2,250,1),(1082,6,4,115,1),(1083,11,1,220,1),(1084,4,8,120,1),(1085,12,1,250,1),(1086,10,3,210,1),(1087,5,6,105,1),(1088,4,5,120,1),(1089,6,7,115,1),(1090,7,10,65,1),(1091,4,5,120,1),(1092,11,2,220,1),(1093,6,3,115,1),(1094,12,1,250,1),(1095,5,8,105,1),(1096,11,1,220,1),(1097,4,6,120,1),(1098,12,2,250,1),(1099,6,8,115,1),(1100,8,10,59,1),(1101,4,10,120,1),(1102,12,2,250,1),(1103,7,15,65,1),(1104,11,3,220,1),(1105,8,12,59,1),(1106,12,2,250,1),(1107,10,3,210,1),(1108,5,8,105,1),(1109,11,2,220,1),(1110,6,4,115,1),(1111,4,7,120,1),(1112,4,8,120,1),(1113,6,9,115,1),(1114,5,7,105,1),(1115,7,12,65,1),(1116,12,2,250,1),(1117,9,8,69,1),(1118,11,1,220,1),(1119,11,2,220,1),(1120,4,9,120,1),(1121,12,3,250,1),(1122,5,8,105,1),(1123,8,12,59,1),(1124,4,6,120,1),(1125,12,2,250,1),(1126,7,12,65,1),(1127,10,2,210,1),(1128,6,4,115,1),(1129,11,2,220,1),(1130,5,9,105,1),(1131,12,2,250,1),(1132,4,10,120,1),(1133,11,2,220,1),(1134,6,8,115,1),(1135,12,1,250,1),(1136,10,3,210,1),(1137,9,6,69,1),(1138,4,5,120,1),(1139,7,12,65,1),(1140,4,8,120,1),(1141,5,7,105,1),(1142,6,4,115,1),(1143,11,2,220,1),(1144,12,2,250,1),(1145,6,8,115,1),(1146,11,2,220,1),(1147,4,9,120,1),(1148,12,2,250,1),(1149,5,8,105,1),(1150,10,3,210,1);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderNumber` int NOT NULL AUTO_INCREMENT,
  `orderDate` date DEFAULT NULL,
  `requiredDate` date DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  `fk_customerNumber` int DEFAULT NULL,
  PRIMARY KEY (`orderNumber`),
  KEY `fk_customerNumber` (`fk_customerNumber`),
  CONSTRAINT `fk_customerNumber` FOREIGN KEY (`fk_customerNumber`) REFERENCES `customers` (`customerNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=1151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1001,'2022-01-15','2022-01-29','2022-01-20','Shipped',NULL,101),(1002,'2022-01-22','2022-02-05','2022-01-28','Shipped',NULL,106),(1003,'2022-02-03','2022-02-17','2022-02-09','Shipped',NULL,111),(1004,'2022-02-18','2022-03-04','2022-02-24','Shipped',NULL,118),(1005,'2022-03-05','2022-03-19','2022-03-11','Shipped',NULL,123),(1006,'2022-03-20','2022-04-03','2022-03-26','Shipped',NULL,128),(1007,'2022-04-04','2022-04-18','2022-04-10','Shipped',NULL,133),(1008,'2022-04-19','2022-05-03','2022-04-25','Shipped',NULL,104),(1009,'2022-05-07','2022-05-21','2022-05-13','Shipped',NULL,109),(1010,'2022-05-22','2022-06-05','2022-05-28','Shipped',NULL,114),(1011,'2022-06-06','2022-06-20','2022-06-12','Shipped',NULL,119),(1012,'2022-06-21','2022-07-05','2022-06-27','Shipped',NULL,124),(1013,'2022-07-05','2022-07-19','2022-07-11','Shipped',NULL,129),(1014,'2022-07-20','2022-08-03','2022-07-26','Shipped',NULL,134),(1015,'2022-08-03','2022-08-17','2022-08-09','Shipped',NULL,102),(1016,'2022-08-18','2022-09-01','2022-08-24','Shipped',NULL,107),(1017,'2022-09-01','2022-09-15','2022-09-07','Shipped',NULL,112),(1018,'2022-09-16','2022-09-30','2022-09-22','Shipped',NULL,120),(1019,'2022-10-01','2022-10-15','2022-10-07','Shipped',NULL,125),(1020,'2022-10-16','2022-10-30','2022-10-22','Shipped',NULL,130),(1021,'2022-11-01','2022-11-15','2022-11-07','Shipped',NULL,135),(1022,'2022-11-16','2022-11-30','2022-11-22','Shipped',NULL,105),(1023,'2022-12-01','2022-12-15','2022-12-07','Shipped',NULL,110),(1024,'2022-12-16','2022-12-30','2022-12-22','Shipped',NULL,115),(1025,'2022-01-28','2022-02-11','2022-02-03','Shipped',NULL,138),(1026,'2022-02-14','2022-02-28','2022-02-20','Shipped',NULL,139),(1027,'2022-03-10','2022-03-24','2022-03-16','Shipped',NULL,140),(1028,'2022-04-01','2022-04-15','2022-04-07','Shipped',NULL,141),(1029,'2022-05-15','2022-05-29','2022-05-21','Shipped',NULL,142),(1030,'2022-06-10','2022-06-24','2022-06-16','Shipped',NULL,143),(1031,'2022-07-08','2022-07-22','2022-07-14','Shipped',NULL,144),(1032,'2022-08-05','2022-08-19','2022-08-11','Shipped',NULL,145),(1033,'2022-09-12','2022-09-26','2022-09-18','Shipped',NULL,146),(1034,'2022-10-08','2022-10-22','2022-10-14','Shipped',NULL,147),(1035,'2022-11-03','2022-11-17','2022-11-09','Shipped',NULL,148),(1036,'2022-12-05','2022-12-19','2022-12-11','Shipped',NULL,149),(1037,'2022-01-10','2022-01-24','2022-01-16','Shipped',NULL,127),(1038,'2022-03-28','2022-04-11','2022-04-03','Shipped',NULL,116),(1039,'2022-05-30','2022-06-13','2022-06-05','Shipped',NULL,121),(1040,'2022-07-25','2022-08-08','2022-07-31','Shipped',NULL,131),(1041,'2022-09-20','2022-10-04','2022-09-26','Shipped',NULL,136),(1042,'2022-11-10','2022-11-24','2022-11-16','Shipped',NULL,150),(1043,'2022-02-25','2022-03-11','2022-03-03','Shipped',NULL,103),(1044,'2022-04-22','2022-05-06','2022-04-28','Shipped',NULL,108),(1045,'2022-06-18','2022-07-02','2022-06-24','Shipped',NULL,113),(1046,'2022-08-14','2022-08-28','2022-08-20','Shipped',NULL,122),(1047,'2022-10-10','2022-10-24','2022-10-16','Shipped',NULL,126),(1048,'2022-12-08','2022-12-22','2022-12-14','Shipped',NULL,132),(1049,'2022-11-28','2022-12-12','2022-12-04','Shipped',NULL,137),(1050,'2022-09-05','2022-09-19','2022-09-11','Shipped',NULL,117),(1051,'2023-01-10','2023-01-24','2023-01-16','Shipped',NULL,101),(1052,'2023-01-25','2023-02-08','2023-01-31','Shipped',NULL,111),(1053,'2023-02-08','2023-02-22','2023-02-14','Shipped',NULL,106),(1054,'2023-02-20','2023-03-06','2023-02-26','Shipped',NULL,123),(1055,'2023-03-07','2023-03-21','2023-03-13','Shipped',NULL,128),(1056,'2023-03-22','2023-04-05','2023-03-28','Shipped',NULL,118),(1057,'2023-04-05','2023-04-19','2023-04-11','Shipped',NULL,104),(1058,'2023-04-20','2023-05-04','2023-04-26','Shipped',NULL,133),(1059,'2023-05-08','2023-05-22','2023-05-14','Shipped',NULL,114),(1060,'2023-05-23','2023-06-06','2023-05-29','Shipped',NULL,119),(1061,'2023-06-07','2023-06-21','2023-06-13','Shipped',NULL,109),(1062,'2023-06-22','2023-07-06','2023-06-28','Shipped',NULL,124),(1063,'2023-07-06','2023-07-20','2023-07-12','Shipped',NULL,134),(1064,'2023-07-21','2023-08-04','2023-07-27','Shipped',NULL,129),(1065,'2023-08-04','2023-08-18','2023-08-10','Shipped',NULL,102),(1066,'2023-08-19','2023-09-02','2023-08-25','Shipped',NULL,140),(1067,'2023-09-02','2023-09-16','2023-09-08','Shipped',NULL,112),(1068,'2023-09-17','2023-10-01','2023-09-23','Shipped',NULL,120),(1069,'2023-10-02','2023-10-16','2023-10-08','Shipped',NULL,125),(1070,'2023-10-17','2023-10-31','2023-10-23','Shipped',NULL,130),(1071,'2023-11-01','2023-11-15','2023-11-07','Shipped',NULL,135),(1072,'2023-11-16','2023-11-30','2023-11-22','Shipped',NULL,105),(1073,'2023-12-01','2023-12-15','2023-12-07','Shipped',NULL,127),(1074,'2023-12-16','2023-12-30','2023-12-22','Shipped',NULL,115),(1075,'2023-01-28','2023-02-11','2023-02-03','Shipped',NULL,138),(1076,'2023-02-14','2023-02-28','2023-02-20','Shipped',NULL,147),(1077,'2023-03-15','2023-03-29','2023-03-21','Shipped',NULL,141),(1078,'2023-04-12','2023-04-26','2023-04-18','Shipped',NULL,144),(1079,'2023-05-18','2023-06-01','2023-05-24','Shipped',NULL,143),(1080,'2023-06-14','2023-06-28','2023-06-20','Shipped',NULL,142),(1081,'2023-07-10','2023-07-24','2023-07-16','Shipped',NULL,145),(1082,'2023-08-07','2023-08-21','2023-08-13','Shipped',NULL,146),(1083,'2023-09-04','2023-09-18','2023-09-10','Shipped',NULL,148),(1084,'2023-10-01','2023-10-15','2023-10-07','Shipped',NULL,149),(1085,'2023-11-05','2023-11-19','2023-11-11','Shipped',NULL,150),(1086,'2023-12-03','2023-12-17','2023-12-09','Shipped',NULL,139),(1087,'2023-01-15','2023-01-29','2023-01-21','Shipped',NULL,116),(1088,'2023-03-01','2023-03-15','2023-03-07','Shipped',NULL,121),(1089,'2023-05-05','2023-05-19','2023-05-11','Shipped',NULL,131),(1090,'2023-07-03','2023-07-17','2023-07-09','Shipped',NULL,136),(1091,'2023-09-10','2023-09-24','2023-09-16','Shipped',NULL,110),(1092,'2023-11-08','2023-11-22','2023-11-14','Shipped',NULL,113),(1093,'2023-02-22','2023-03-08','2023-02-28','Shipped',NULL,103),(1094,'2023-04-18','2023-05-02','2023-04-24','Shipped',NULL,108),(1095,'2023-06-20','2023-07-04','2023-06-26','Shipped',NULL,122),(1096,'2023-08-22','2023-09-05','2023-08-28','Shipped',NULL,126),(1097,'2023-10-19','2023-11-02','2023-10-25','Shipped',NULL,132),(1098,'2023-12-18','2023-12-31','2023-12-24','Shipped',NULL,137),(1099,'2023-07-28','2023-08-11','2023-08-03','Shipped',NULL,107),(1100,'2023-10-25','2023-11-08','2023-10-31','Shipped',NULL,117),(1101,'2024-01-08','2024-01-22','2024-01-14','Shipped',NULL,101),(1102,'2024-01-23','2024-02-06','2024-01-29','Shipped',NULL,104),(1103,'2024-02-06','2024-02-20','2024-02-12','Shipped',NULL,111),(1104,'2024-02-21','2024-03-06','2024-02-27','Shipped',NULL,127),(1105,'2024-03-06','2024-03-20','2024-03-12','Shipped',NULL,106),(1106,'2024-03-21','2024-04-04','2024-03-27','Shipped',NULL,123),(1107,'2024-04-04','2024-04-18','2024-04-10','Shipped',NULL,118),(1108,'2024-04-19','2024-05-03','2024-04-25','Shipped',NULL,133),(1109,'2024-05-07','2024-05-21','2024-05-13','Shipped',NULL,128),(1110,'2024-05-22','2024-06-05','2024-05-28','Shipped',NULL,114),(1111,'2024-06-05','2024-06-19','2024-06-11','Shipped',NULL,119),(1112,'2024-06-20','2024-07-04','2024-06-26','Shipped',NULL,109),(1113,'2024-07-04','2024-07-18','2024-07-10','Shipped',NULL,134),(1114,'2024-07-19','2024-08-02','2024-07-25','Shipped',NULL,129),(1115,'2024-08-02','2024-08-16','2024-08-08','Shipped',NULL,102),(1116,'2024-08-17','2024-08-31','2024-08-23','Shipped',NULL,140),(1117,'2024-09-01','2024-09-15','2024-09-07','Shipped',NULL,112),(1118,'2024-09-16','2024-09-30','2024-09-22','Shipped',NULL,120),(1119,'2024-10-01','2024-10-15','2024-10-07','Shipped',NULL,125),(1120,'2024-10-16','2024-10-30','2024-10-22','Shipped',NULL,130),(1121,'2024-11-01','2024-11-15','2024-11-07','Shipped',NULL,147),(1122,'2024-11-16','2024-11-30','2024-11-22','Shipped',NULL,105),(1123,'2024-12-01','2024-12-15','2024-12-07','Shipped',NULL,135),(1124,'2024-12-16','2024-12-30',NULL,'In Process',NULL,115),(1125,'2024-01-30','2024-02-13','2024-02-05','Shipped',NULL,138),(1126,'2024-02-15','2024-02-29','2024-02-21','Shipped',NULL,139),(1127,'2024-03-14','2024-03-28','2024-03-20','Shipped',NULL,141),(1128,'2024-04-11','2024-04-25','2024-04-17','Shipped',NULL,144),(1129,'2024-05-16','2024-05-30','2024-05-22','Shipped',NULL,143),(1130,'2024-06-13','2024-06-27','2024-06-19','Shipped',NULL,142),(1131,'2024-07-09','2024-07-23','2024-07-15','Shipped',NULL,145),(1132,'2024-08-06','2024-08-20','2024-08-12','Shipped',NULL,146),(1133,'2024-09-03','2024-09-17','2024-09-09','Shipped',NULL,148),(1134,'2024-10-01','2024-10-15','2024-10-07','Shipped',NULL,149),(1135,'2024-11-05','2024-11-19','2024-11-11','Shipped',NULL,150),(1136,'2024-12-03','2024-12-17',NULL,'In Process',NULL,110),(1137,'2024-01-14','2024-01-28','2024-01-20','Shipped',NULL,116),(1138,'2024-03-01','2024-03-15','2024-03-07','Shipped',NULL,121),(1139,'2024-05-04','2024-05-18','2024-05-10','Shipped',NULL,131),(1140,'2024-07-02','2024-07-16','2024-07-08','Shipped',NULL,136),(1141,'2024-09-09','2024-09-23','2024-09-15','Shipped',NULL,113),(1142,'2024-11-07','2024-11-21','2024-11-13','Shipped',NULL,122),(1143,'2024-02-20','2024-03-05','2024-02-26','Shipped',NULL,103),(1144,'2024-04-17','2024-05-01','2024-04-23','Shipped',NULL,108),(1145,'2024-06-19','2024-07-03','2024-06-25','Shipped',NULL,126),(1146,'2024-08-21','2024-09-04','2024-08-27','Shipped',NULL,132),(1147,'2024-10-18','2024-11-01','2024-10-24','Shipped',NULL,137),(1148,'2024-12-10','2024-12-24',NULL,'In Process',NULL,107),(1149,'2024-07-25','2024-08-08','2024-07-31','Shipped',NULL,117),(1150,'2024-10-24','2024-11-07','2024-10-30','Shipped',NULL,124);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `checkNumber` int NOT NULL AUTO_INCREMENT,
  `fk_customerNum` int DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`checkNumber`),
  KEY `fk_customerNum` (`fk_customerNum`),
  CONSTRAINT `fk_customerNum` FOREIGN KEY (`fk_customerNum`) REFERENCES `customers` (`customerNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,101,'2022-01-20',1560),(2,101,'2023-01-16',2160),(3,101,'2024-01-14',2745),(4,102,'2022-08-24',1580),(5,102,'2023-08-10',1695),(6,102,'2024-08-08',1845),(7,103,'2022-03-03',1330),(8,103,'2023-02-28',1160),(9,103,'2024-02-26',1214),(10,104,'2022-04-25',1480),(11,104,'2023-04-11',1695),(12,104,'2024-01-29',2465),(13,105,'2022-11-22',1480),(14,105,'2023-11-22',2165),(15,105,'2024-11-22',1845),(16,106,'2022-01-28',1487),(17,106,'2023-02-14',1222),(18,106,'2024-03-12',1838),(19,107,'2022-08-24',1052),(20,107,'2023-07-28',2035),(21,107,'2024-12-10',1500),(22,108,'2022-04-28',1374),(23,108,'2023-04-24',1284),(24,108,'2024-04-23',1544),(25,109,'2022-06-24',1265),(26,109,'2023-09-08',1313),(27,109,'2024-06-11',1486),(28,110,'2022-12-07',1004),(29,110,'2023-09-10',1305),(30,110,'2024-12-03',1200),(31,111,'2022-02-09',1461),(32,111,'2023-01-31',1867),(33,111,'2024-02-12',2017),(34,112,'2022-09-07',1034),(35,112,'2023-09-08',1339),(36,112,'2024-09-07',1454),(37,113,'2022-06-05',1209),(38,113,'2023-11-08',1287),(39,113,'2024-09-09',1299),(40,114,'2022-05-28',1382),(41,114,'2023-05-14',1462),(42,114,'2024-05-13',1617),(43,115,'2022-12-22',1244),(44,115,'2023-12-22',1476),(45,115,'2024-12-16',1300),(46,116,'2022-04-03',1022),(47,116,'2023-01-21',1214),(48,116,'2024-01-20',1034),(49,117,'2022-09-11',1115),(50,117,'2023-10-31',1225),(51,117,'2024-07-31',1444),(52,118,'2022-02-09',1036),(53,118,'2023-09-23',1494),(54,118,'2024-04-25',1799),(55,119,'2022-06-07',1112),(56,119,'2023-05-29',1325),(57,119,'2024-06-11',1460),(58,120,'2022-09-22',1225),(59,120,'2023-09-23',1594),(60,120,'2024-09-22',1584),(61,121,'2022-06-05',1092),(62,121,'2023-05-11',1220),(63,121,'2024-07-15',1320),(64,122,'2022-08-20',1059),(65,122,'2023-08-28',1449),(66,122,'2024-11-07',1539),(67,123,'2022-03-26',1544),(68,123,'2023-03-28',1679),(69,123,'2024-03-27',1754),(70,124,'2022-06-27',1034),(71,124,'2023-06-28',1225),(72,124,'2024-10-30',1379),(73,125,'2022-10-22',1350),(74,125,'2023-10-08',1420),(75,125,'2024-10-07',1580),(76,126,'2022-10-16',1004),(77,126,'2023-08-28',1264),(78,126,'2024-06-25',1479),(79,127,'2022-01-16',1624),(80,127,'2023-12-01',1765),(81,127,'2024-02-27',2165),(82,128,'2022-03-26',1844),(83,128,'2023-03-28',1994),(84,128,'2024-05-13',2144),(85,129,'2022-07-26',1285),(86,129,'2023-07-12',1485),(87,129,'2024-07-10',1560),(88,130,'2022-10-22',1150),(89,130,'2023-10-23',1325),(90,130,'2024-10-22',1395),(91,131,'2022-06-05',1184),(92,131,'2023-05-11',1339),(93,131,'2024-05-10',1449),(94,132,'2022-12-14',1195),(95,132,'2023-10-25',1395),(96,132,'2024-08-27',1380),(97,133,'2022-04-10',1254),(98,133,'2023-04-11',1439),(99,133,'2024-04-25',1544),(100,134,'2022-07-31',1254),(101,134,'2023-07-12',1529),(102,134,'2024-07-10',1599),(103,135,'2022-11-07',1184),(104,135,'2023-11-07',1289),(105,135,'2024-11-07',1449),(106,136,'2022-09-26',1184),(107,136,'2023-09-16',1259),(108,136,'2024-07-08',1339),(109,137,'2022-12-04',1194),(110,137,'2023-12-24',1294),(111,137,'2024-10-24',1399),(112,138,'2022-02-03',1564),(113,138,'2023-02-03',1729),(114,138,'2024-02-05',1789),(115,139,'2022-02-20',1140),(116,139,'2023-12-09',1270),(117,139,'2024-01-29',1440),(118,140,'2022-03-16',1195),(119,140,'2023-08-25',1385),(120,140,'2024-08-23',1480),(121,141,'2022-04-07',1085),(122,141,'2023-03-21',1210),(123,141,'2024-03-20',1330),(124,142,'2022-05-21',1175),(125,142,'2023-06-20',1350),(126,142,'2024-06-19',1485),(127,143,'2022-06-16',1139),(128,143,'2023-05-24',1359),(129,143,'2024-05-22',1489),(130,144,'2022-07-14',1099),(131,144,'2023-04-18',1259),(132,144,'2024-04-17',1389),(133,145,'2022-08-11',1194),(134,145,'2023-07-16',1394),(135,145,'2024-07-15',1494),(136,146,'2022-09-18',1060),(137,146,'2023-09-10',1185),(138,146,'2024-09-09',1275),(139,147,'2022-10-14',1564),(140,147,'2023-10-07',1715),(141,147,'2024-11-07',1890),(142,148,'2022-11-09',1059),(143,148,'2023-09-10',1175),(144,148,'2024-09-09',1295),(145,149,'2022-12-11',1004),(146,149,'2023-10-07',1115),(147,149,'2024-10-07',1235),(148,150,'2022-11-16',1089),(149,150,'2023-11-14',1199),(150,150,'2024-11-11',1324);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productlines`
--

DROP TABLE IF EXISTS `productlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productlines` (
  `productline` varchar(20) NOT NULL,
  `textDesc` varchar(20) DEFAULT NULL,
  `htmlDesc` varchar(20) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`productline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productlines`
--

LOCK TABLES `productlines` WRITE;
/*!40000 ALTER TABLE `productlines` DISABLE KEYS */;
INSERT INTO `productlines` VALUES ('Body Mist','Light mist',NULL,NULL),('Cologne','Masc. scents',NULL,NULL),('Eau de Parfum','Rich EDP',NULL,NULL),('Eau de Toilette','Light EDT',NULL,NULL),('Parfum','Luxury parfum',NULL,NULL);
/*!40000 ALTER TABLE `productlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productCode` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) DEFAULT NULL,
  `fk_productline` varchar(20) DEFAULT NULL,
  `productScale` varchar(10) DEFAULT NULL,
  `productVendor` varchar(20) DEFAULT NULL,
  `productDesc` varchar(20) DEFAULT NULL,
  `quantityInStock` int DEFAULT NULL,
  `buyPrice` int DEFAULT NULL,
  `MSRP` int DEFAULT NULL,
  PRIMARY KEY (`productCode`),
  KEY `productline` (`fk_productline`),
  CONSTRAINT `productline` FOREIGN KEY (`fk_productline`) REFERENCES `productlines` (`productline`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (4,'Midnight Oud','Eau de Parfum','100ml','ME Fragrances','Woody oud',120,45,120),(5,'Rose Velvet','Eau de Parfum','100ml','ME Fragrances','Floral rose',95,38,105),(6,'Amber Noir','Eau de Parfum','100ml','ME Fragrances','Amber spice',110,42,115),(7,'Ocean Breeze','Eau de Toilette','100ml','ME Fragrances','Aquatic scent',200,22,65),(8,'White Musk','Eau de Toilette','75ml','ME Fragrances','Clean musk',160,20,59),(9,'Cedar & Sage','Eau de Toilette','100ml','ME Fragrances','Woody herbal',140,24,69),(10,'Black Diamond','Parfum','50ml','ME Fragrances','Dark blend',40,80,210),(11,'Gold Elixir','Parfum','50ml','ME Fragrances','Golden amber',35,85,220),(12,'Oud Royal','Parfum','50ml','ME Fragrances','Royal oud',25,95,250),(13,'Cherry Blossom','Body Mist','250ml','ME Fragrances','Floral mist',300,8,28),(14,'Vanilla Dream','Body Mist','250ml','ME Fragrances','Vanilla mist',320,8,27),(15,'Lemon Sorbet','Body Mist','250ml','ME Fragrances','Citrus mist',290,7,24),(16,'Aqua Blue','Cologne','100ml','ME Fragrances','Aquatic fougere',150,25,72),(17,'Dark Vetiver','Cologne','100ml','ME Fragrances','Earthy vetiver',110,30,85),(18,'Sport Rush','Cologne','100ml','ME Fragrances','Sport scent',170,22,65);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-15 20:19:20
