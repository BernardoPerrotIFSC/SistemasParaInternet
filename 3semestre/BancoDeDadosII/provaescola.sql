-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.25-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela escolaprova.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `cod_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(50) NOT NULL,
  `cpf` char(11) NOT NULL DEFAULT '0',
  `sexo` char(1) NOT NULL,
  `data_nasc` date NOT NULL,
  `mae` char(50) NOT NULL DEFAULT '',
  `pai` char(50) DEFAULT '',
  `email` char(50) DEFAULT '',
  `cep` char(50) DEFAULT '',
  `endereco` char(50) DEFAULT '',
  `numero` char(50) DEFAULT '',
  `bairro` char(50) DEFAULT '',
  `cod_municipio` int(11) DEFAULT NULL,
  `telefone` char(50) DEFAULT '',
  PRIMARY KEY (`cod_aluno`),
  KEY `FK_aluno_municipio` (`cod_municipio`),
  CONSTRAINT `FK_aluno_municipio` FOREIGN KEY (`cod_municipio`) REFERENCES `municipio` (`cod_municipio`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela escolaprova.chamada
CREATE TABLE IF NOT EXISTS `chamada` (
  `cod_chamada` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `numero_aulas` smallint(6) NOT NULL DEFAULT 0,
  `falta` tinyint(4) NOT NULL DEFAULT 0,
  `cod_matricula` int(11) NOT NULL,
  PRIMARY KEY (`cod_chamada`),
  KEY `FK_chamada_matricula` (`cod_matricula`),
  CONSTRAINT `FK_chamada_matricula` FOREIGN KEY (`cod_matricula`) REFERENCES `matricula` (`cod_matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela escolaprova.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `cod_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(50) NOT NULL,
  PRIMARY KEY (`cod_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela escolaprova.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `cod_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(50) NOT NULL DEFAULT '',
  `carga_horaria` int(3) DEFAULT NULL,
  `fase` int(3) DEFAULT NULL,
  `cod_curso` int(11) NOT NULL,
  `cod_professor` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_disciplina`),
  KEY `FK_disciplina_curso` (`cod_curso`),
  KEY `FK_disciplina_professor` (`cod_professor`),
  CONSTRAINT `FK_disciplina_curso` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_disciplina_professor` FOREIGN KEY (`cod_professor`) REFERENCES `professor` (`cod_professor`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela escolaprova.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `cod_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`cod_estado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela escolaprova.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `cod_matricula` int(11) NOT NULL AUTO_INCREMENT,
  `cod_aluno` int(11) NOT NULL,
  `cod_disciplina` int(11) NOT NULL,
  `nota_final` int(2) DEFAULT NULL,
  `faltas_total` int(2) DEFAULT NULL,
  PRIMARY KEY (`cod_matricula`),
  KEY `FK_matricula_aluno` (`cod_aluno`),
  KEY `FK_matricula_disciplina` (`cod_disciplina`),
  CONSTRAINT `FK_matricula_aluno` FOREIGN KEY (`cod_aluno`) REFERENCES `aluno` (`cod_aluno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_matricula_disciplina` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=669 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela escolaprova.municipio
CREATE TABLE IF NOT EXISTS `municipio` (
  `cod_municipio` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(50) NOT NULL,
  `cod_estado` int(11) NOT NULL,
  PRIMARY KEY (`cod_municipio`) USING BTREE,
  KEY `FK_municipio_estado` (`cod_estado`) USING BTREE,
  CONSTRAINT `FK_municipio_estado` FOREIGN KEY (`cod_estado`) REFERENCES `estado` (`cod_estado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5572 DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela escolaprova.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `cod_professor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(50) NOT NULL DEFAULT '',
  `sexo` char(1) NOT NULL DEFAULT '',
  `cpf` char(11) NOT NULL DEFAULT '',
  `salario` float NOT NULL DEFAULT 0,
  `data_nasc` date NOT NULL,
  `email` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`cod_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
