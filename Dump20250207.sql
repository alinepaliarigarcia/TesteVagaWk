CREATE DATABASE  IF NOT EXISTS `testewk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testewk`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: testewk
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codigo` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Aline','Mirassol','SP'),(2,'Márcio','Mirassol','SP'),(3,'José','Cuiabá','MT'),(4,'Antonio','Belo Horizonte','MG'),(5,'Ronaldo','Rio de Janeiro','RJ'),(6,'Mariana','São Paulo','SP'),(7,'Aparecida','Fortaleza','CE'),(8,'Mateus','Manaus','AM'),(9,'Tiago','José Bonifácio','SP'),(10,'Junior','Catanduva','SP'),(11,'Beatriz','Bady Bassit','SP'),(12,'Ana Luiza','Tanabi','SP'),(13,'Clara','São José do Rio Preto','SP'),(14,'Bruno','São José do Rio Preto','SP'),(15,'Fabiano','São José do Rio Preto','SP'),(16,'Carolina','São José do Rio Preto','SP'),(17,'Daniela','São José do Rio Preto','SP'),(18,'Gustavo','São José do Rio Preto','SP'),(19,'Pablo','São José do Rio Preto','SP'),(20,'Juliana','São José do Rio Preto','SP'),(21,'Guilherme','São José do Rio Preto','SP');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoitens`
--

DROP TABLE IF EXISTS `pedidoitens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoitens` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `pedido` int NOT NULL,
  `produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `valorunit` decimal(10,2) NOT NULL,
  `valortotalitem` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fkpedidocodigo_idx` (`pedido`),
  KEY `fkprodutocodigo_idx` (`produto`),
  CONSTRAINT `fkpedidocodigo` FOREIGN KEY (`pedido`) REFERENCES `pedidos` (`codigo`),
  CONSTRAINT `fkprodutocodigo` FOREIGN KEY (`produto`) REFERENCES `produtos` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoitens`
--

LOCK TABLES `pedidoitens` WRITE;
/*!40000 ALTER TABLE `pedidoitens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidoitens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `dataemissao` date NOT NULL,
  `cliente` int DEFAULT NULL,
  `valortotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `codigo` int NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `precovenda` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Caneta',2.00),(2,'Apontador',3.00),(3,'Lapis',2.50),(4,'Regua',5.50),(5,'Lapis de cor',5.00),(6,'Tesoura',4.00),(7,'Barracha',4.50),(8,'Compasso',7.00),(9,'Transferidor',8.00),(10,'Marca texto',6.00),(11,'Caderno',2.00),(12,'Cola',1.00),(13,'Estojo',9.00),(14,'Caneta preta',0.70),(15,'Caneta rosa',2.00),(16,'Caneta azul',4.00),(17,'Caneta vermelha',2.00),(18,'Lapiseira',2.00),(19,'Pasta',12.00),(20,'Almaço',10.00);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testewk'
--

--
-- Dumping routines for database 'testewk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-07 12:19:41
