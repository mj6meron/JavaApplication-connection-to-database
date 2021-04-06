-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: nba
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `arenas`
--

DROP TABLE IF EXISTS `arenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arenas` (
  `name` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arenas`
--

LOCK TABLES `arenas` WRITE;
/*!40000 ALTER TABLE `arenas` DISABLE KEYS */;
INSERT INTO `arenas` VALUES ('Barclays Center','Brooklyn, New York',19000),('Chase Center','San Francisco, California',22000),('Scotiabank Arena','Toronto, Ontario',19800),('STAPLES Center','Los Angeles, California',20000),('Toyota Center','Houston, Texas',18000),('United Center','Chicago, Illinois',23500);
/*!40000 ALTER TABLE `arenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` int NOT NULL COMMENT 'Social security number of last 4 digits(-XXXX-)',
  `name` varchar(155) NOT NULL,
  `birth_year` int NOT NULL,
  `coaching_since` int DEFAULT NULL COMMENT 'In years, in NBA.',
  `team_name` varchar(30) NOT NULL,
  PRIMARY KEY (`coach_id`),
  KEY `fk_coach_teams1_idx` (`team_name`),
  CONSTRAINT `fk_coach_teams1` FOREIGN KEY (`team_name`) REFERENCES `teams` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (101,'Nick Nurse',1967,1989,'Toronto Raptors'),(102,'Frank Vogel',1973,2001,'Los Angeles Lakers'),(103,'Billy Donovan',1965,1989,'Chicago Bulls'),(104,'Steve Kerr',1965,2014,'Golden State Warriors'),(105,'Stephen Silas',1973,2000,'Houston Rockets'),(106,'Steve Nash',1974,2020,'Brooklyn Nets');
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `m`
--

DROP TABLE IF EXISTS `m`;
/*!50001 DROP VIEW IF EXISTS `m`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `m` AS SELECT 
 1 AS `player_number`,
 1 AS `name`,
 1 AS `team_name`,
 1 AS `division`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_number` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `height` double NOT NULL COMMENT 'Height in feet',
  `birth_year` int NOT NULL,
  `salary` int DEFAULT NULL,
  `team_name` varchar(30) NOT NULL,
  PRIMARY KEY (`player_number`,`name`),
  KEY `fk_players_teams1_idx` (`team_name`),
  CONSTRAINT `fk_players_teams1` FOREIGN KEY (`team_name`) REFERENCES `teams` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'John Wall',6.3,1990,41254920,'Houston Rockets'),(5,'Victor Oladipo',6.4,1992,21000000,'Houston Rockets'),(7,'Kyle Lowry',6,1986,30000000,'Toronto Raptors'),(8,'Zach LaVine',6.5,1995,19500000,'Chicago Bulls'),(10,'Eric Gordon',6.3,1988,16869276,'Houston Rockets'),(11,'Klay Thompson',6.6,1990,35361360,'Golden State Warriors'),(11,'Kyrie Irving',6.1,1992,33329100,'Brooklyn Nets'),(13,'James Harden',1,1989,40824000,'Brooklyn Nets'),(17,'Dennis Schröder',6.3,1993,15500000,'Los Angeles Lakers'),(21,'Thaddeus Young',6.8,1988,13545000,'Chicago Bulls'),(22,'Andrew Wiggins',6.7,1995,29542010,'Golden State Warriors'),(22,'Otto Porter',6.8,1993,28489239,'Chicago Bulls'),(23,'Anthony Davis',6.1,1993,32742000,'Los Angeles Lakers'),(23,'Fred VanVleet',6.1,1994,21000000,'Toronto Raptors'),(23,'LeBron James',6.9,1984,39219565,'Los Angeles Lakers'),(30,'Stephen Curry',6.3,1988,43006362,'Golden State Warriors'),(35,'Kevin Durant',6.1,1988,39058950,'Brooklyn Nets'),(43,'Pascal Siakam',6.9,1994,29000000,'Toronto Raptors');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_name` varchar(30) NOT NULL,
  `division` varchar(30) NOT NULL,
  `championships` int DEFAULT NULL,
  `team_color` varchar(30) DEFAULT NULL,
  `arena_name` varchar(30) NOT NULL,
  PRIMARY KEY (`team_name`),
  KEY `fk_teams_arena1_idx` (`arena_name`),
  CONSTRAINT `fk_teams_arena1` FOREIGN KEY (`arena_name`) REFERENCES `arenas` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('Brooklyn Nets','Atlantic',0,'Black','Barclays Center'),('Chicago Bulls','Central',6,'Red','United Center'),('Golden State Warriors','Pacific',6,'Royal Blue','Chase Center'),('Houston Rockets','South West',2,'Red','Toyota Center'),('Los Angeles Lakers','Pacific',17,'Gold','STAPLES Center'),('Toronto Raptors','Atlantic',1,'Red','Scotiabank Arena');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `m`
--

/*!50001 DROP VIEW IF EXISTS `m`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `m` AS select `players`.`player_number` AS `player_number`,`players`.`name` AS `name`,`teams`.`team_name` AS `team_name`,`teams`.`division` AS `division` from (`teams` join `players` on((`players`.`team_name` = `teams`.`team_name`))) order by `teams`.`division`,`teams`.`team_name`,`players`.`name` */;
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

-- Dump completed on 2021-03-07  3:29:47
