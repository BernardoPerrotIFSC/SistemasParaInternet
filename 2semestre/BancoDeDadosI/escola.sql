-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.36-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela curso.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `cod` int(11) NOT NULL,
  `nome` char(200) NOT NULL,
  `sexo` char(1) NOT NULL,
  `nascimento` date DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela curso.aluno: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT IGNORE INTO `aluno` (`cod`, `nome`, `sexo`, `nascimento`) VALUES
	(1, 'Paulo Cavalcanti Barros', 'm', '1994-06-15'),
	(2, 'Felipe Martins Azevedo', 'm', '1967-10-25'),
	(3, 'Ágatha Rodrigues Fernandes', 'f', '1999-06-23'),
	(4, 'Matheus Rocha Azevedo', 'm', '2003-10-21'),
	(5, 'Luiza Almeida Rodrigues', 'f', '1991-07-22'),
	(6, 'Carla Oliveira Pereira', 'f', '2000-02-02'),
	(7, 'Breno Fernandes Alves', 'm', '2002-08-10'),
	(8, 'Breno Fernandes Alves', 'm', '1986-11-30'),
	(9, 'Renan Oliveira Souza', 'm', '1998-07-02'),
	(10, 'Mariana Gomes Santos', 'f', '1996-03-07'),
	(11, 'Brenda Sousa Dias', 'f', '1992-06-23');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;

-- Copiando estrutura para tabela curso.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `cod` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela curso.curso: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT IGNORE INTO `curso` (`cod`, `nome`) VALUES
	(1, 'Desenvolvimento de Sistemas');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;

-- Copiando estrutura para tabela curso.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `cod` int(11) NOT NULL,
  `nome` char(50) NOT NULL,
  `cod_professor` int(11) NOT NULL,
  `carga_horaria` int(3) NOT NULL,
  `cod_curso` int(11) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `FK_disciplina_professor` (`cod_professor`),
  KEY `FK_disciplina_curso` (`cod_curso`),
  CONSTRAINT `FK_disciplina_curso` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod`) ON UPDATE CASCADE,
  CONSTRAINT `FK_disciplina_professor` FOREIGN KEY (`cod_professor`) REFERENCES `professor` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela curso.disciplina: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT IGNORE INTO `disciplina` (`cod`, `nome`, `cod_professor`, `carga_horaria`, `cod_curso`) VALUES
	(1, 'Algoritmos', 3, 80, 1),
	(2, 'Programação Web', 1, 60, 1),
	(3, 'Engenharia de Software', 2, 40, 1),
	(4, 'Redes', 4, 60, 1),
	(5, 'Banco de Dados', 1, 80, 1);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;

-- Copiando estrutura para tabela curso.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `cod` int(11) NOT NULL,
  `cod_disciplina` int(11) NOT NULL,
  `cod_aluno` int(11) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `FK_matricula_disciplina` (`cod_disciplina`),
  KEY `FK_matricula_aluno` (`cod_aluno`),
  CONSTRAINT `FK_matricula_aluno` FOREIGN KEY (`cod_aluno`) REFERENCES `aluno` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_matricula_disciplina` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela curso.matricula: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT IGNORE INTO `matricula` (`cod`, `cod_disciplina`, `cod_aluno`) VALUES
	(2, 1, 1),
	(3, 1, 10),
	(4, 1, 9),
	(5, 1, 2),
	(6, 1, 7),
	(7, 1, 8),
	(8, 1, 6),
	(9, 2, 1),
	(10, 2, 3),
	(11, 2, 4),
	(12, 2, 6),
	(13, 3, 1),
	(14, 3, 2),
	(15, 3, 11),
	(16, 3, 10),
	(17, 4, 3),
	(18, 4, 4),
	(19, 4, 5),
	(20, 4, 6),
	(21, 4, 7),
	(22, 4, 8),
	(23, 5, 2),
	(24, 5, 9),
	(25, 5, 11);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;

-- Copiando estrutura para tabela curso.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `cod` int(11) NOT NULL,
  `nome` char(200) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela curso.professor: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT IGNORE INTO `professor` (`cod`, `nome`) VALUES
	(1, 'Nicolash Almeida Araujo'),
	(2, 'Vitor Melo Carvalho'),
	(3, 'Carolina Ribeiro Pereira'),
	(4, 'Matheus Azevedo Correia');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
