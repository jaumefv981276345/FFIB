-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ffib
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `arbitre`
--

DROP TABLE IF EXISTS `arbitre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitre` (
  `id_arbitre` tinyint NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_arbitre`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `camp`
--

DROP TABLE IF EXISTS `camp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp` (
  `id_camp` smallint NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `tipus` enum('Herba sintètica','Gespa natural','Gespa artificial','Terra/Terreny','Sorra','Mixt (híbrid)','Grava') DEFAULT NULL,
  `clase` enum('Futbol 7','Futbol 11','Futbol Sala') DEFAULT NULL,
  `carrer` varchar(255) DEFAULT NULL,
  `serveis` set('Vallat','Sala antidopatge','Despatx Arbitral','Internet') DEFAULT NULL,
  `localitzacio` varchar(255) DEFAULT NULL,
  `codi_postal` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_camp`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` tinyint NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `classificacio`
--

DROP TABLE IF EXISTS `classificacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificacio` (
  `id_classificacio` smallint NOT NULL AUTO_INCREMENT,
  `id_equip` smallint DEFAULT NULL,
  `pts` tinyint unsigned DEFAULT NULL,
  `pj` tinyint unsigned DEFAULT NULL,
  `pg` tinyint unsigned DEFAULT NULL,
  `pe` tinyint unsigned DEFAULT NULL,
  `pp` tinyint unsigned DEFAULT NULL,
  `gf` tinyint unsigned DEFAULT NULL,
  `gc` tinyint unsigned DEFAULT NULL,
  `pen` tinyint unsigned DEFAULT NULL,
  `ps` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_classificacio`),
  KEY `id_equip` (`id_equip`),
  CONSTRAINT `classificacio_ibfk_1` FOREIGN KEY (`id_equip`) REFERENCES `equip` (`id_equip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `id_club` smallint NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `delegacio` enum('Mallorca','Menorca','Eivissa - Formentera') NOT NULL,
  `equipacio` varchar(50) NOT NULL,
  `municipi` varchar(100) DEFAULT NULL,
  `carrer` varchar(255) DEFAULT NULL,
  `escut` varchar(30) DEFAULT NULL,
  `codi_postal` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_club`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=8892 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `convocat`
--

DROP TABLE IF EXISTS `convocat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convocat` (
  `id_partit` smallint NOT NULL,
  `id_jugador` smallint NOT NULL,
  `titular` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_partit`,`id_jugador`),
  KEY `id_jugador` (`id_jugador`),
  CONSTRAINT `convocat_ibfk_1` FOREIGN KEY (`id_partit`) REFERENCES `partit` (`id_partit`),
  CONSTRAINT `convocat_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equip`
--

DROP TABLE IF EXISTS `equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equip` (
  `id_equip` smallint NOT NULL AUTO_INCREMENT,
  `id_club` smallint DEFAULT NULL,
  `id_camp` smallint DEFAULT NULL,
  `id_subcategoria` tinyint DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `nom_entrenador` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_equip`),
  KEY `id_subcategoria` (`id_subcategoria`),
  KEY `id_camp` (`id_camp`),
  KEY `id_club` (`id_club`),
  CONSTRAINT `equip_ibfk_1` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategoria` (`id_subcategoria`),
  CONSTRAINT `equip_ibfk_2` FOREIGN KEY (`id_camp`) REFERENCES `camp` (`id_camp`),
  CONSTRAINT `equip_ibfk_3` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`)
) ENGINE=InnoDB AUTO_INCREMENT=1488 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esdeveniment`
--

DROP TABLE IF EXISTS `esdeveniment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esdeveniment` (
  `id_esdeveniment` smallint NOT NULL AUTO_INCREMENT,
  `id_partit` smallint DEFAULT NULL,
  `id_jugador` smallint DEFAULT NULL,
  `tipus` enum('CV','G','P','PP','TG','TV') DEFAULT NULL,
  `minut` tinyint unsigned NOT NULL,
  `jugador_canvi` smallint DEFAULT NULL,
  PRIMARY KEY (`id_esdeveniment`),
  KEY `id_partit` (`id_partit`),
  KEY `id_jugador` (`id_jugador`),
  KEY `jugador_canvi` (`jugador_canvi`),
  CONSTRAINT `esdeveniment_ibfk_1` FOREIGN KEY (`id_partit`) REFERENCES `partit` (`id_partit`),
  CONSTRAINT `esdeveniment_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`),
  CONSTRAINT `esdeveniment_ibfk_3` FOREIGN KEY (`jugador_canvi`) REFERENCES `jugador` (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `id_jugador` smallint NOT NULL AUTO_INCREMENT,
  `id_equip` smallint DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `data_naixement` date NOT NULL,
  `dorsal` tinyint NOT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `id_equip` (`id_equip`),
  CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`id_equip`) REFERENCES `equip` (`id_equip`)
) ENGINE=InnoDB AUTO_INCREMENT=4516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partit`
--

DROP TABLE IF EXISTS `partit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partit` (
  `id_partit` smallint NOT NULL AUTO_INCREMENT,
  `estat` enum('F','J','C') DEFAULT NULL,
  `jornada` tinyint DEFAULT NULL,
  `local` smallint DEFAULT NULL,
  `visitant` smallint DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id_partit`),
  KEY `visitant` (`visitant`),
  KEY `local` (`local`),
  CONSTRAINT `partit_ibfk_3` FOREIGN KEY (`visitant`) REFERENCES `equip` (`id_equip`),
  CONSTRAINT `partit_ibfk_4` FOREIGN KEY (`local`) REFERENCES `equip` (`id_equip`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partit_arbitre`
--

DROP TABLE IF EXISTS `partit_arbitre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partit_arbitre` (
  `id_arbitre` tinyint NOT NULL,
  `id_partit` smallint NOT NULL,
  `principal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_arbitre`,`id_partit`),
  KEY `id_partit` (`id_partit`),
  CONSTRAINT `partit_arbitre_ibfk_1` FOREIGN KEY (`id_arbitre`) REFERENCES `arbitre` (`id_arbitre`),
  CONSTRAINT `partit_arbitre_ibfk_2` FOREIGN KEY (`id_partit`) REFERENCES `partit` (`id_partit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategoria` (
  `id_subcategoria` tinyint NOT NULL AUTO_INCREMENT,
  `id_categoria` tinyint DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_subcategoria`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `subcategoria_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'ffib'
--

--
-- Dumping routines for database 'ffib'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-08 13:38:05
