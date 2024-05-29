-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ffib
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `arbitra`
--

DROP TABLE IF EXISTS `arbitra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitra` (
  `id_arbitre` tinyint NOT NULL,
  `id_partit` smallint NOT NULL,
  PRIMARY KEY (`id_arbitre`,`id_partit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitra`
--

LOCK TABLES `arbitra` WRITE;
/*!40000 ALTER TABLE `arbitra` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbitra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbitre`
--

DROP TABLE IF EXISTS `arbitre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitre` (
  `id_arbitre` tinyint NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `tipus` enum('principal','asistente') DEFAULT NULL,
  PRIMARY KEY (`id_arbitre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitre`
--

LOCK TABLES `arbitre` WRITE;
/*!40000 ALTER TABLE `arbitre` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbitre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp`
--

DROP TABLE IF EXISTS `camp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp` (
  `id_camp` smallint NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `localitzacio` varchar(255) DEFAULT NULL,
  `tipus` enum('Cesped Artificial','Tierra','Goma') DEFAULT NULL,
  `clase` enum('Futbol 7','Futbol 11','Futbol Sala') DEFAULT NULL,
  `codi_postal` varchar(20) NOT NULL,
  `vallado` enum('Si','No') DEFAULT NULL,
  `antidopaje` enum('Si','No') DEFAULT NULL,
  `despatx` enum('Si','No') DEFAULT NULL,
  `internet` enum('Si','No') DEFAULT NULL,
  `carrer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_camp`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp`
--

LOCK TABLES `camp` WRITE;
/*!40000 ALTER TABLE `camp` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificaacio`
--

DROP TABLE IF EXISTS `classificaacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificaacio` (
  `id_classificacio` smallint NOT NULL AUTO_INCREMENT,
  `pts` tinyint unsigned DEFAULT NULL,
  `pj` tinyint unsigned DEFAULT NULL,
  `pg` tinyint unsigned DEFAULT NULL,
  `pe` tinyint unsigned DEFAULT NULL,
  `pp` tinyint unsigned DEFAULT NULL,
  `gf` tinyint unsigned DEFAULT NULL,
  `gc` tinyint unsigned DEFAULT NULL,
  `pen` tinyint unsigned DEFAULT NULL,
  `ps` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_classificacio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificaacio`
--

LOCK TABLES `classificaacio` WRITE;
/*!40000 ALTER TABLE `classificaacio` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificaacio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `id_club` smallint NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `ubicacio` varchar(255) DEFAULT NULL,
  `codigo` smallint unsigned NOT NULL,
  `pagina` varchar(64) DEFAULT NULL,
  `carrer` varchar(255) DEFAULT NULL,
  `codi_postal` varchar(20) NOT NULL,
  `equipacio` varchar(50) NOT NULL,
  PRIMARY KEY (`id_club`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convocat`
--

DROP TABLE IF EXISTS `convocat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convocat` (
  `id_partit` smallint NOT NULL,
  `id_jugador` smallint NOT NULL,
  `titular` enum('Si','No') DEFAULT NULL,
  PRIMARY KEY (`id_partit`,`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convocat`
--

LOCK TABLES `convocat` WRITE;
/*!40000 ALTER TABLE `convocat` DISABLE KEYS */;
/*!40000 ALTER TABLE `convocat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equip`
--

DROP TABLE IF EXISTS `equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equip` (
  `id_equip` smallint NOT NULL AUTO_INCREMENT,
  `nom_entrenador` varchar(100) DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `id_subcategoria` tinyint DEFAULT NULL,
  `id_camp` smallint DEFAULT NULL,
  `id_club` smallint DEFAULT NULL,
  `id_classificacio` smallint DEFAULT NULL,
  PRIMARY KEY (`id_equip`),
  UNIQUE KEY `nom` (`nom`),
  KEY `id_subcategoria` (`id_subcategoria`),
  KEY `id_camp` (`id_camp`),
  KEY `id_club` (`id_club`),
  KEY `id_classificacio` (`id_classificacio`),
  CONSTRAINT `equip_ibfk_1` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategoria` (`id_subcategoria`),
  CONSTRAINT `equip_ibfk_2` FOREIGN KEY (`id_camp`) REFERENCES `camp` (`id_camp`),
  CONSTRAINT `equip_ibfk_3` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  CONSTRAINT `equip_ibfk_4` FOREIGN KEY (`id_classificacio`) REFERENCES `classificaacio` (`id_classificacio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equip`
--

LOCK TABLES `equip` WRITE;
/*!40000 ALTER TABLE `equip` DISABLE KEYS */;
/*!40000 ALTER TABLE `equip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esdeveniment`
--

DROP TABLE IF EXISTS `esdeveniment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esdeveniment` (
  `id_esdeveniment` smallint NOT NULL AUTO_INCREMENT,
  `tipus` enum('G','Tg','Td','Tv','C') DEFAULT NULL,
  `minut` tinyint unsigned NOT NULL,
  `id_partit` smallint DEFAULT NULL,
  `id_jugador` smallint DEFAULT NULL,
  PRIMARY KEY (`id_esdeveniment`),
  KEY `id_partit` (`id_partit`),
  KEY `id_jugador` (`id_jugador`),
  CONSTRAINT `esdeveniment_ibfk_1` FOREIGN KEY (`id_partit`) REFERENCES `partit` (`id_partit`),
  CONSTRAINT `esdeveniment_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esdeveniment`
--

LOCK TABLES `esdeveniment` WRITE;
/*!40000 ALTER TABLE `esdeveniment` DISABLE KEYS */;
/*!40000 ALTER TABLE `esdeveniment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `id_jugador` smallint NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `edat` tinyint DEFAULT NULL,
  `dorsal` tinyint NOT NULL,
  `id_equip` smallint DEFAULT NULL,
  `id_partit` smallint DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `id_equip` (`id_equip`),
  KEY `id_partit` (`id_partit`),
  CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`id_equip`) REFERENCES `equip` (`id_equip`),
  CONSTRAINT `jugador_ibfk_2` FOREIGN KEY (`id_partit`) REFERENCES `partit` (`id_partit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partit`
--

DROP TABLE IF EXISTS `partit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partit` (
  `id_partit` smallint NOT NULL AUTO_INCREMENT,
  `resultat` enum('G','E','P') DEFAULT NULL,
  `transcurso` enum('En proces','Acabat','Sense començar') DEFAULT NULL,
  `fecha` date NOT NULL,
  `id_equip` smallint DEFAULT NULL,
  `id_camp` smallint DEFAULT NULL,
  `visitant` smallint DEFAULT NULL,
  PRIMARY KEY (`id_partit`),
  KEY `id_equip` (`id_equip`),
  KEY `id_camp` (`id_camp`),
  KEY `visitant` (`visitant`),
  CONSTRAINT `partit_ibfk_1` FOREIGN KEY (`id_equip`) REFERENCES `equip` (`id_equip`),
  CONSTRAINT `partit_ibfk_2` FOREIGN KEY (`id_camp`) REFERENCES `camp` (`id_camp`),
  CONSTRAINT `partit_ibfk_3` FOREIGN KEY (`visitant`) REFERENCES `equip` (`id_equip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partit`
--

LOCK TABLES `partit` WRITE;
/*!40000 ALTER TABLE `partit` DISABLE KEYS */;
/*!40000 ALTER TABLE `partit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategoria` (
  `id_subcategoria` tinyint NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `id_categoria` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_subcategoria`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `subcategoria_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoria`
--

LOCK TABLES `subcategoria` WRITE;
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-29 17:29:42
