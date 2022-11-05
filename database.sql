-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para cadastro
CREATE DATABASE IF NOT EXISTS `cadastro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cadastro`;

-- Copiando estrutura para tabela cadastro.acesso
CREATE TABLE IF NOT EXISTS `acesso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entrada` datetime DEFAULT NULL,
  `saida` datetime DEFAULT NULL,
  `id_visitante` int DEFAULT NULL,
  `id_morador` int DEFAULT NULL,
  `id_func` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_acesso_visitantes` (`id_visitante`),
  KEY `FK_acesso_moradores` (`id_morador`),
  KEY `FK_acesso_funcionario` (`id_func`),
  CONSTRAINT `FK_acesso_funcionario` FOREIGN KEY (`id_func`) REFERENCES `funcionario` (`id_func`),
  CONSTRAINT `FK_acesso_moradores` FOREIGN KEY (`id_morador`) REFERENCES `moradores` (`id`),
  CONSTRAINT `FK_acesso_visitantes` FOREIGN KEY (`id_visitante`) REFERENCES `visitantes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cadastro.acesso: ~8 rows (aproximadamente)
INSERT INTO `acesso` (`id`, `entrada`, `saida`, `id_visitante`, `id_morador`, `id_func`) VALUES
	(1, '2022-08-15 12:50:31', '2022-08-15 15:30:11', 3, 1, 4),
	(2, '2022-08-16 10:50:31', '2022-08-16 11:30:15', 1, 1, 5),
	(3, '2022-08-17 08:00:31', '2022-08-17 09:25:15', 2, 3, 8),
	(4, '2022-08-18 06:50:31', '2022-08-18 07:25:15', 4, 5, 6),
	(5, '2022-08-19 06:15:31', '2022-08-19 07:25:15', 5, 8, 6),
	(6, '2022-08-20 06:15:31', '2022-08-20 07:25:15', 2, 8, 1),
	(7, '2022-08-21 06:15:31', '2022-08-21 07:25:15', 2, 7, 3),
	(8, '2022-08-22 06:15:31', '2022-08-22 07:25:15', 2, 7, 5);

-- Copiando estrutura para tabela cadastro.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `id_func` int NOT NULL AUTO_INCREMENT,
  `nome_func` varchar(30) NOT NULL,
  `cpf_func` varchar(15) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_func`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cadastro.funcionario: ~8 rows (aproximadamente)
INSERT INTO `funcionario` (`id_func`, `nome_func`, `cpf_func`, `telefone`, `endereco`, `cargo`) VALUES
	(1, 'Gabriel', '883258130206', '11949630653', 'rua angustura casa', 'porteiro'),
	(2, 'Batista', '353258130206', '11529630653', 'travessa Mauriti casa 202', 'porteiro'),
	(3, 'Jefferson', '893258130206', '11569630653', 'travessa caripunas 203', 'Pedreiro'),
	(4, 'Maria', '893258130202', '11569630649', 'travessa joaniza 509', 'Faxineira'),
	(5, 'Conceição', '893234130202', '11569635689', 'travessa Gaspar 101', 'Faxineira'),
	(6, 'Marcos', '893432130202', '21569635689', 'rua Alves lima 110', 'Jardineiro'),
	(7, 'Telma', '893432154321', '12569635689', 'rua Pedro Alvares Cabral 110', 'Jardineira'),
	(8, 'Hiolanda', '113432154321', '15569635689', 'rua Pedro vaz 10', 'porteira');

-- Copiando estrutura para tabela cadastro.moradores
CREATE TABLE IF NOT EXISTS `moradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `rua` varchar(200) NOT NULL,
  `edificio` varchar(100) NOT NULL,
  `andar` int NOT NULL,
  `apartamento` int NOT NULL,
  `cpf` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cadastro.moradores: ~8 rows (aproximadamente)
INSERT INTO `moradores` (`id`, `nome`, `rua`, `edificio`, `andar`, `apartamento`, `cpf`) VALUES
	(1, 'Maria', 'São Miguel', 'jatoba', 3, 301, '83858130206'),
	(2, 'João', 'Estevão de magalhães', 'cedro', 3, 302, '83858130205'),
	(3, 'Pedro', 'São João', 'Angelim', 3, 303, '38858130205'),
	(4, 'Paulo', 'São Pedro', 'Angelim', 3, 304, '98858130205'),
	(5, 'André', 'São Pedro', 'Angelim', 4, 401, '18858130205'),
	(6, 'Ketlen', 'São Pedro', 'Angelim', 4, 402, '28858130205'),
	(7, 'Kelly', 'São Pedro', 'Angelim', 4, 403, '38858130205'),
	(8, 'Francisco', 'São Pedro', 'Angelim', 4, 404, '48858130205');

-- Copiando estrutura para tabela cadastro.visitantes
CREATE TABLE IF NOT EXISTS `visitantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `autorizado` tinyint(1) DEFAULT '0',
  `ocupação` varchar(50) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cadastro.visitantes: ~8 rows (aproximadamente)
INSERT INTO `visitantes` (`id`, `nome`, `cpf`, `autorizado`, `ocupação`, `telefone`) VALUES
	(1, 'Ana', '83858130204', 0, 'porteira', '1123569875'),
	(2, 'Pedro', '83858137895', 1, 'visita', '1123569465'),
	(3, 'Carlos', '63558137895', 1, 'visita', '1123569789'),
	(4, 'Bia', '12358137895', 0, 'visita', '2123569789'),
	(5, 'Debora', '45658137895', 1, 'visita', '3123569789'),
	(6, 'Paulo', '25896137895', 0, 'visita', '4923569789'),
	(7, 'Plinio', '41236137895', 1, 'eletricista', '3698569789'),
	(8, 'Fabiola', '85436137895', 0, 'jardineira', '213669789');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
