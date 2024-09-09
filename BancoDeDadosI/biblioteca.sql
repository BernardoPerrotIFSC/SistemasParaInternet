-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.36-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela biblioteca.autor
CREATE TABLE IF NOT EXISTS `autor` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela biblioteca.autor: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` (`cod`, `nome`, `pais`) VALUES
	(1, 'Maurício Samy Silva', 'Brasil'),
	(2, 'Carlos Alberto Heuser', 'Brasil'),
	(3, 'Paul Deitel', 'EUA'),
	(4, 'Harvey Deitel', 'EUA'),
	(5, 'Andy Budd', 'EUA'),
	(6, 'Ramez Elmasri', 'EUA'),
	(7, 'Shamkant Navathe', 'EUA'),
	(8, 'David Barnes', 'EUA'),
	(9, 'Michael Kolling', 'EUA'),
	(10, 'Anil Hemrajani', NULL),
	(11, 'Cay S. Horstmann', NULL),
	(12, 'Gary Cornell', NULL),
	(13, 'Stuart Russel', 'EUA'),
	(14, 'Peter Norving', 'EUA'),
	(15, 'Symon Haykin', 'EUA'),
	(16, 'LYNN BEIGHLEY', NULL);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;

-- Copiando estrutura para tabela biblioteca.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela biblioteca.categoria: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`cod`, `nome`) VALUES
	(1, 'programação'),
	(2, 'banco de dados'),
	(3, 'web'),
	(4, 'inteligência artificial');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela biblioteca.editora
CREATE TABLE IF NOT EXISTS `editora` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela biblioteca.editora: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` (`cod`, `nome`) VALUES
	(1, 'Pearson'),
	(2, 'Elsevier'),
	(3, 'Novatec'),
	(4, 'Alta Books'),
	(5, 'Bookman'),
	(6, 'Deitel');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;

-- Copiando estrutura para tabela biblioteca.livro
CREATE TABLE IF NOT EXISTS `livro` (
  `cod` int(10) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `edicao` int(2) NOT NULL DEFAULT '0',
  `capa` varchar(200) DEFAULT NULL,
  `idioma` char(2) DEFAULT '0',
  `exemplares` int(10) DEFAULT '0',
  `paginas` int(10) DEFAULT '0',
  `codCategoria` int(10) DEFAULT NULL,
  `codEditora` int(10) DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `editora` (`codEditora`),
  KEY `FK_livro_categoria` (`codCategoria`),
  CONSTRAINT `FK_livro_categoria` FOREIGN KEY (`codCategoria`) REFERENCES `categoria` (`cod`) ON UPDATE CASCADE,
  CONSTRAINT `editora` FOREIGN KEY (`codEditora`) REFERENCES `editora` (`cod`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela biblioteca.livro: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` (`cod`, `titulo`, `edicao`, `capa`, `idioma`, `exemplares`, `paginas`, `codCategoria`, `codEditora`) VALUES
	(4, 'Java Como Programar', 8, NULL, 'pt', 10, 1110, 1, 1),
	(7, 'Programação Orientada a Objetos com Java', 4, NULL, 'pt', 2, 368, 1, 1),
	(8, 'Core java', 8, NULL, 'pt', 7, 806, 1, 1),
	(9, 'Java com Spring, Hibernate e Eclipse', 1, NULL, 'pt', 3, 290, 1, 1),
	(10, 'Sistema de banco de Dados', 6, NULL, 'pt', 1, 904, 2, 1),
	(11, 'Inteligencia Artificial', 2, NULL, 'pt', 1, 1021, 4, 2),
	(12, 'Projeto de Banco de Dados', 6, NULL, 'pt', 1, 281, 2, 5),
	(13, 'Criando Páginas Web com CSS', 1, NULL, 'pt', 3, 260, 3, 1),
	(14, 'Neural Networks', 2, NULL, 'en', 5, 898, 4, 5),
	(15, 'Use a cabeça - SQL', 1, NULL, 'pt', 2, 454, 2, 4),
	(17, 'HTML5 - A linguagem de marcação que revolucionou a web', 1, NULL, 'pt', 1, 336, 3, 3),
	(18, 'Ajax com jQuery: Requisições AJAX com a simplicidade de jQuery', 1, NULL, 'pt', 15, 328, 3, 3),
	(19, 'jQuery UI', 1, NULL, 'pt', 1, 736, 3, 3),
	(20, 'Android How to Program', 3, NULL, 'en', 1, 856, 1, 6);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;

-- Copiando estrutura para tabela biblioteca.livroautor
CREATE TABLE IF NOT EXISTS `livroautor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codLivro` int(10) NOT NULL,
  `codAutor` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `livro` (`codLivro`),
  KEY `autor` (`codAutor`),
  CONSTRAINT `autor` FOREIGN KEY (`codAutor`) REFERENCES `autor` (`cod`),
  CONSTRAINT `livro` FOREIGN KEY (`codLivro`) REFERENCES `livro` (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela biblioteca.livroautor: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `livroautor` DISABLE KEYS */;
INSERT INTO `livroautor` (`id`, `codLivro`, `codAutor`) VALUES
	(1, 8, 11),
	(2, 8, 12),
	(3, 13, 5),
	(4, 17, 1),
	(5, 11, 13),
	(6, 11, 14),
	(7, 9, 10),
	(8, 4, 3),
	(9, 4, 4),
	(10, 14, 15),
	(11, 7, 8),
	(12, 7, 9),
	(13, 10, 6),
	(14, 10, 7),
	(15, 15, 16),
	(16, 18, 1),
	(17, 19, 1),
	(18, 20, 4),
	(19, 20, 3);
/*!40000 ALTER TABLE `livroautor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
