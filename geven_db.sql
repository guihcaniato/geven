-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: geven_db
-- ------------------------------------------------------
-- Server version	8.4.5-0ubuntu0.1

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
-- Table structure for table `tbCidade`
--

DROP TABLE IF EXISTS `tbCidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbCidade` (
  `idCidadeIBGE` int NOT NULL,
  `nameCidade` varchar(256) NOT NULL,
  `fkEstado` int NOT NULL,
  `flEstrangeiro` enum('S','N') NOT NULL,
  `dtUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCidadeIBGE`),
  KEY `fkEstado` (`fkEstado`),
  CONSTRAINT `tbCidade_ibfk_1` FOREIGN KEY (`fkEstado`) REFERENCES `tbEstado` (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbEnderecoUser`
--

DROP TABLE IF EXISTS `tbEnderecoUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbEnderecoUser` (
  `idEnd` int NOT NULL AUTO_INCREMENT,
  `logradouroEnd` varchar(256) NOT NULL,
  `numEnd` varchar(20) NOT NULL,
  `compEnd` varchar(256) DEFAULT NULL,
  `bairroEnd` varchar(256) NOT NULL,
  `cepEnd` varchar(9) NOT NULL,
  `fkCidadeIBGE` int NOT NULL,
  `fkUser` bigint DEFAULT NULL,
  `dtInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEnd`),
  KEY `fkCidadeIBGE` (`fkCidadeIBGE`),
  KEY `fk_tbEnderecoUser_1_idx` (`fkUser`),
  CONSTRAINT `fk_tbEnderecoUser_1` FOREIGN KEY (`fkUser`) REFERENCES `tbUser` (`idUser`),
  CONSTRAINT `tbEnderecoUser_ibfk_1` FOREIGN KEY (`fkCidadeIBGE`) REFERENCES `tbCidade` (`idCidadeIBGE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbEstado`
--

DROP TABLE IF EXISTS `tbEstado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbEstado` (
  `idEstado` int NOT NULL,
  `nameEstado` varchar(256) NOT NULL,
  `siglaEstado` char(2) NOT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbEstadoCivil`
--

DROP TABLE IF EXISTS `tbEstadoCivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbEstadoCivil` (
  `idEstadoCivil` int NOT NULL AUTO_INCREMENT,
  `EstadoCivil` varchar(20) NOT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbEvento`
--

DROP TABLE IF EXISTS `tbEvento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbEvento` (
  `idEvento` int NOT NULL AUTO_INCREMENT,
  `nameEvento` varchar(256) NOT NULL,
  `descEvento` text,
  `dthrInicioEvento` datetime NOT NULL,
  `dthrFimEvento` datetime NOT NULL,
  `fkLocal` int DEFAULT NULL,
  `fkTipoEvento` int DEFAULT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEvento`),
  KEY `fkLocal` (`fkLocal`),
  KEY `fkTipoEvento` (`fkTipoEvento`),
  CONSTRAINT `tbEvento_ibfk_1` FOREIGN KEY (`fkLocal`) REFERENCES `tbLocal` (`idLocal`),
  CONSTRAINT `tbEvento_ibfk_2` FOREIGN KEY (`fkTipoEvento`) REFERENCES `tbTipoEvento` (`idTipoEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbLocal`
--

DROP TABLE IF EXISTS `tbLocal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbLocal` (
  `idLocal` int NOT NULL AUTO_INCREMENT,
  `nameLocal` varchar(256) NOT NULL,
  `descLocal` text,
  `logradouroEndLocal` varchar(256) NOT NULL,
  `numEndLocal` varchar(20) NOT NULL,
  `compEndLocal` varchar(256) DEFAULT NULL,
  `bairroEndLocal` varchar(256) NOT NULL,
  `cepEndLocal` varchar(9) NOT NULL,
  `fkCidadeIBGELocal` int NOT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLocal`),
  KEY `fkCidadeIBGELocal` (`fkCidadeIBGELocal`),
  CONSTRAINT `tbLocal_ibfk_1` FOREIGN KEY (`fkCidadeIBGELocal`) REFERENCES `tbCidade` (`idCidadeIBGE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbNacionalidade`
--

DROP TABLE IF EXISTS `tbNacionalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbNacionalidade` (
  `idNacionalidade` int NOT NULL AUTO_INCREMENT,
  `nomePais` varchar(256) NOT NULL,
  `siglaPais` varchar(3) NOT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idNacionalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbOrganizadorResponsavel`
--

DROP TABLE IF EXISTS `tbOrganizadorResponsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbOrganizadorResponsavel` (
  `idResponsavel` int NOT NULL AUTO_INCREMENT,
  `flTipoPessoa` enum('PF','PJ') NOT NULL,
  `fkEvento` int DEFAULT NULL,
  `fkUser` bigint DEFAULT NULL,
  `fkPJ` bigint DEFAULT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idResponsavel`),
  KEY `fkEvento` (`fkEvento`),
  KEY `fkPJ` (`fkPJ`),
  KEY `fk_tbOrganizadorResponsavel_1_idx` (`fkUser`),
  CONSTRAINT `fk_tbOrganizadorResponsavel_1` FOREIGN KEY (`fkUser`) REFERENCES `tbUser` (`idUser`),
  CONSTRAINT `tbOrganizadorResponsavel_ibfk_1` FOREIGN KEY (`fkEvento`) REFERENCES `tbEvento` (`idEvento`),
  CONSTRAINT `tbOrganizadorResponsavel_ibfk_3` FOREIGN KEY (`fkPJ`) REFERENCES `tbPJ` (`cnpj`),
  CONSTRAINT `tbOrganizadorResponsavel_chk_1` CHECK ((((`flTipoPessoa` = _utf8mb4'PF') and (`fkUser` is not null) and (`fkPJ` is null)) or ((`flTipoPessoa` = _utf8mb4'PJ') and (`fkPJ` is not null) and (`fkUser` is null))))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbPJ`
--

DROP TABLE IF EXISTS `tbPJ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbPJ` (
  `cnpj` bigint NOT NULL,
  `rasoPJ` varchar(256) DEFAULT NULL,
  `nofaPJ` varchar(256) DEFAULT NULL,
  `telPJ` varchar(24) DEFAULT NULL,
  `celPJ` varchar(24) DEFAULT NULL,
  `emailPJ` varchar(256) DEFAULT NULL,
  `logradouroEndPJ` varchar(256) NOT NULL,
  `numEndPJ` varchar(20) NOT NULL,
  `compEndPJ` varchar(256) DEFAULT NULL,
  `bairroEndPJ` varchar(256) NOT NULL,
  `cepEndPJ` varchar(9) NOT NULL,
  `fkCidadeIBGEPJ` int NOT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cnpj`),
  KEY `fkCidadeIBGEPJ` (`fkCidadeIBGEPJ`),
  CONSTRAINT `tbPJ_ibfk_1` FOREIGN KEY (`fkCidadeIBGEPJ`) REFERENCES `tbCidade` (`idCidadeIBGE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbPerfilUsuario`
--

DROP TABLE IF EXISTS `tbPerfilUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbPerfilUsuario` (
  `idPerfilUsuario` int NOT NULL AUTO_INCREMENT,
  `PerfilUsuario` varchar(24) NOT NULL,
  `DescPerfilUsuario` varchar(256) DEFAULT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPerfilUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbTicketInvite`
--

DROP TABLE IF EXISTS `tbTicketInvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbTicketInvite` (
  `idTicket` int NOT NULL AUTO_INCREMENT,
  `codeTicket` varchar(12) NOT NULL,
  `fkEvento` int NOT NULL,
  `fkConvidado` bigint DEFAULT NULL,
  `fkAnfitriao` bigint NOT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idTicket`),
  UNIQUE KEY `codeTicket` (`codeTicket`),
  KEY `fk_tbTicketInvite_1_idx` (`fkConvidado`,`fkAnfitriao`),
  KEY `fk_tbTicketInvite_2_idx` (`fkAnfitriao`),
  KEY `tbTicketInvite_ibfk_1` (`fkEvento`),
  CONSTRAINT `fk_tbTicketInvite_1` FOREIGN KEY (`fkConvidado`) REFERENCES `tbUser` (`idUser`),
  CONSTRAINT `fk_tbTicketInvite_2` FOREIGN KEY (`fkAnfitriao`) REFERENCES `tbUser` (`idUser`),
  CONSTRAINT `tbTicketInvite_ibfk_1` FOREIGN KEY (`fkEvento`) REFERENCES `tbEvento` (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbTipoEvento`
--

DROP TABLE IF EXISTS `tbTipoEvento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbTipoEvento` (
  `idTipoEvento` int NOT NULL AUTO_INCREMENT,
  `TipoEvento` varchar(56) DEFAULT NULL,
  `dtInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idTipoEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbUser`
--

DROP TABLE IF EXISTS `tbUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbUser` (
  `idUser` bigint NOT NULL AUTO_INCREMENT,
  `nameUser` varchar(256) NOT NULL,
  `surnameUser` varchar(256) NOT NULL,
  `emailUser` varchar(256) NOT NULL,
  `passUser` varchar(256) DEFAULT NULL,
  `telUser` varchar(256) NOT NULL,
  `dtNascimentoUser` date NOT NULL,
  `genderUser` char(1) NOT NULL,
  `fkEstadoCivil` int NOT NULL,
  `fkNacionalidade` int NOT NULL,
  `fkNaturalidade` int NOT NULL,
  `cpfUser` bigint DEFAULT NULL,
  `dtInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `cpfUser_UNIQUE` (`cpfUser`),
  KEY `fkEstadoCivil` (`fkEstadoCivil`),
  KEY `fkNacionalidade` (`fkNacionalidade`),
  KEY `fkNaturalidade` (`fkNaturalidade`),
  CONSTRAINT `tbUser_ibfk_1` FOREIGN KEY (`fkEstadoCivil`) REFERENCES `tbEstadoCivil` (`idEstadoCivil`),
  CONSTRAINT `tbUser_ibfk_2` FOREIGN KEY (`fkNacionalidade`) REFERENCES `tbNacionalidade` (`idNacionalidade`),
  CONSTRAINT `tbUser_ibfk_3` FOREIGN KEY (`fkNaturalidade`) REFERENCES `tbCidade` (`idCidadeIBGE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbUserPerfil`
--

DROP TABLE IF EXISTS `tbUserPerfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbUserPerfil` (
  `idUserPerfil` int NOT NULL AUTO_INCREMENT,
  `fkUser` bigint NOT NULL,
  `fkPerfilUsuario` int NOT NULL,
  `dtInsert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUserPerfil`),
  KEY `fkUser` (`fkUser`),
  KEY `fkPerfilUsuario` (`fkPerfilUsuario`),
  CONSTRAINT `tbUserPerfil_ibfk_1` FOREIGN KEY (`fkUser`) REFERENCES `tbUser` (`idUser`),
  CONSTRAINT `tbUserPerfil_ibfk_2` FOREIGN KEY (`fkPerfilUsuario`) REFERENCES `tbPerfilUsuario` (`idPerfilUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-27 13:41:07
