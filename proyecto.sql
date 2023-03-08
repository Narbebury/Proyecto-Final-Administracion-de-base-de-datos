-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.8.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table proyecto.alumno
CREATE TABLE IF NOT EXISTS `alumno` (
  `Matricula_Alumno` int(11) NOT NULL,
  `DNI1` bigint(20) NOT NULL,
  `COD_Carrera2` tinyint(4) NOT NULL,
  PRIMARY KEY (`Matricula_Alumno`),
  KEY `FK_DNI1` (`DNI1`),
  KEY `FK_COD_Carrera2` (`COD_Carrera2`),
  CONSTRAINT `FK_COD_Carrera2` FOREIGN KEY (`COD_Carrera2`) REFERENCES `carrera` (`COD_Carrera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DNI1` FOREIGN KEY (`DNI1`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.alumno: ~1 rows (approximately)
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` (`Matricula_Alumno`, `DNI1`, `COD_Carrera2`) VALUES
	(1, 40716939, 1),
	(2, 11111111, 2),
	(3, 22222222, 1);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;

-- Dumping structure for table proyecto.aula
CREATE TABLE IF NOT EXISTS `aula` (
  `COD_Aula` tinyint(4) NOT NULL,
  `Capacidad` tinyint(4) NOT NULL,
  PRIMARY KEY (`COD_Aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.aula: ~1 rows (approximately)
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` (`COD_Aula`, `Capacidad`) VALUES
	(1, 45),
	(2, 35);
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;

-- Dumping structure for table proyecto.calle
CREATE TABLE IF NOT EXISTS `calle` (
  `COD_Calle` int(11) NOT NULL,
  `Calle` varchar(60) NOT NULL,
  `Numero` smallint(6) NOT NULL,
  `COD_Ciudad1` int(11) NOT NULL,
  PRIMARY KEY (`COD_Calle`),
  KEY `FK_COD_Ciudad1` (`COD_Ciudad1`),
  CONSTRAINT `FK_COD_Ciudad1` FOREIGN KEY (`COD_Ciudad1`) REFERENCES `ciudad` (`COD_Ciudad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.calle: ~6 rows (approximately)
/*!40000 ALTER TABLE `calle` DISABLE KEYS */;
INSERT INTO `calle` (`COD_Calle`, `Calle`, `Numero`, `COD_Ciudad1`) VALUES
	(1, 'Bomberos Voluntarios', 101, 1),
	(2, 'Pellegrini', 115, 2),
	(3, 'Roseti', 250, 1),
	(4, 'Bomberos Voluntarios', 110, 1),
	(5, 'Laprida', 50, 3),
	(6, 'Alvear', 25, 3);
/*!40000 ALTER TABLE `calle` ENABLE KEYS */;

-- Dumping structure for table proyecto.carrera
CREATE TABLE IF NOT EXISTS `carrera` (
  `COD_Carrera` tinyint(4) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Duracion` float DEFAULT NULL,
  PRIMARY KEY (`COD_Carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.carrera: ~4 rows (approximately)
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` (`COD_Carrera`, `Nombre`, `Duracion`) VALUES
	(1, 'Tecnicatura en programacion', 2),
	(2, 'Seguridad e higiene', 2),
	(3, 'Licenciatura en Nutrición', 3),
	(4, 'Diplomatura en Diseño de Interiores', 2),
	(5, 'Diplomatura Universitaria en Producción Audiovisual', 2);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;

-- Dumping structure for table proyecto.ciudad
CREATE TABLE IF NOT EXISTS `ciudad` (
  `COD_Ciudad` int(11) NOT NULL,
  `Ciudad` varchar(60) NOT NULL,
  `COD_Provincia1` tinyint(4) NOT NULL,
  PRIMARY KEY (`COD_Ciudad`),
  KEY `FK_COD_Provincia1` (`COD_Provincia1`),
  CONSTRAINT `FK_COD_Provincia1` FOREIGN KEY (`COD_Provincia1`) REFERENCES `provincia` (`COD_Provincia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.ciudad: ~2 rows (approximately)
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` (`COD_Ciudad`, `Ciudad`, `COD_Provincia1`) VALUES
	(1, 'Chivilcoy', 1),
	(2, 'Buenos Aires', 1),
	(3, 'Chacabuco', 1);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;

-- Dumping structure for table proyecto.ejerce
CREATE TABLE IF NOT EXISTS `ejerce` (
  `COD_Profesor2` int(11) NOT NULL,
  `COD_Carrera3` tinyint(4) NOT NULL,
  KEY `FK_COD_Profesor2` (`COD_Profesor2`),
  KEY `FK_COD_Carrera3` (`COD_Carrera3`),
  CONSTRAINT `FK_COD_Carrera3` FOREIGN KEY (`COD_Carrera3`) REFERENCES `carrera` (`COD_Carrera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_COD_Profesor2` FOREIGN KEY (`COD_Profesor2`) REFERENCES `profesor` (`COD_Profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.ejerce: ~3 rows (approximately)
/*!40000 ALTER TABLE `ejerce` DISABLE KEYS */;
INSERT INTO `ejerce` (`COD_Profesor2`, `COD_Carrera3`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1);
/*!40000 ALTER TABLE `ejerce` ENABLE KEYS */;

-- Dumping structure for table proyecto.estudia
CREATE TABLE IF NOT EXISTS `estudia` (
  `COD_Profesor1` int(11) NOT NULL,
  `COD_Materia2` int(11) NOT NULL,
  `Matricula_Alumno3` int(11) NOT NULL,
  `COD_Aula1` tinyint(4) NOT NULL,
  KEY `FK_COD_Profesor1` (`COD_Profesor1`),
  KEY `FK_COD_Materia2` (`COD_Materia2`),
  KEY `FK_Matricula_Alumno3` (`Matricula_Alumno3`),
  KEY `FK_COD_Aula1` (`COD_Aula1`),
  CONSTRAINT `FK_COD_Aula1` FOREIGN KEY (`COD_Aula1`) REFERENCES `aula` (`COD_Aula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_COD_Materia2` FOREIGN KEY (`COD_Materia2`) REFERENCES `materia` (`COD_Materia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_COD_Profesor1` FOREIGN KEY (`COD_Profesor1`) REFERENCES `profesor` (`COD_Profesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Matricula_Alumno3` FOREIGN KEY (`Matricula_Alumno3`) REFERENCES `alumno` (`Matricula_Alumno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.estudia: ~7 rows (approximately)
/*!40000 ALTER TABLE `estudia` DISABLE KEYS */;
INSERT INTO `estudia` (`COD_Profesor1`, `COD_Materia2`, `Matricula_Alumno3`, `COD_Aula1`) VALUES
	(1, 1, 1, 1),
	(2, 2, 2, 2),
	(2, 6, 1, 1),
	(3, 5, 1, 1),
	(1, 1, 2, 1),
	(1, 1, 3, 1),
	(4, 4, 1, 1),
	(2, 6, 2, 1);
/*!40000 ALTER TABLE `estudia` ENABLE KEYS */;

-- Dumping structure for table proyecto.materia
CREATE TABLE IF NOT EXISTS `materia` (
  `COD_Materia` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `COD_Carrera1` tinyint(4) NOT NULL,
  PRIMARY KEY (`COD_Materia`),
  KEY `FK_COD_Carrera1` (`COD_Carrera1`),
  CONSTRAINT `FK_COD_Carrera1` FOREIGN KEY (`COD_Carrera1`) REFERENCES `carrera` (`COD_Carrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.materia: ~5 rows (approximately)
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` (`COD_Materia`, `Nombre`, `COD_Carrera1`) VALUES
	(1, 'Diseño y administracion de base de datos', 1),
	(2, 'Laboratorio ll', 1),
	(3, 'Seguridad', 2),
	(4, 'Metodología en sistemas', 1),
	(5, 'Legislación', 1),
	(6, 'Laboratorio IV', 1);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;

-- Dumping structure for table proyecto.nota
CREATE TABLE IF NOT EXISTS `nota` (
  `Nota` float DEFAULT NULL,
  `Faltas` tinyint(4) NOT NULL,
  `Matricula_Alumno2` int(11) NOT NULL,
  `COD_Materia1` int(11) NOT NULL,
  KEY `FK_Matricula_Alumno2` (`Matricula_Alumno2`),
  KEY `FK_COD_Materia1` (`COD_Materia1`),
  CONSTRAINT `FK_COD_Materia1` FOREIGN KEY (`COD_Materia1`) REFERENCES `materia` (`COD_Materia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Matricula_Alumno2` FOREIGN KEY (`Matricula_Alumno2`) REFERENCES `alumno` (`Matricula_Alumno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.nota: ~8 rows (approximately)
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` (`Nota`, `Faltas`, `Matricula_Alumno2`, `COD_Materia1`) VALUES
	(10, 0, 1, 1),
	(8, 1, 1, 1),
	(8, 0, 1, 2),
	(8, 0, 1, 2),
	(10, 3, 2, 6),
	(8, 0, 2, 6),
	(8, 0, 1, 4),
	(8, 0, 1, 4);
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;

-- Dumping structure for table proyecto.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `DNI` bigint(20) NOT NULL,
  `Telefono` bigint(20) NOT NULL,
  `COD_Provincia2` tinyint(4) NOT NULL,
  `COD__Calle1` int(11) NOT NULL,
  `COD_Ciudad2` int(11) NOT NULL,
  PRIMARY KEY (`DNI`),
  KEY `FK_COD_Provincia2` (`COD_Provincia2`),
  KEY `FK_COD_Calle1` (`COD__Calle1`),
  KEY `FK_COD_Ciudad2` (`COD_Ciudad2`),
  CONSTRAINT `FK_COD_Calle1` FOREIGN KEY (`COD__Calle1`) REFERENCES `calle` (`COD_Calle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COD_Ciudad2` FOREIGN KEY (`COD_Ciudad2`) REFERENCES `ciudad` (`COD_Ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_COD_Provincia2` FOREIGN KEY (`COD_Provincia2`) REFERENCES `provincia` (`COD_Provincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.persona: ~7 rows (approximately)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`Nombre`, `Apellido`, `Fecha_Nacimiento`, `DNI`, `Telefono`, `COD_Provincia2`, `COD__Calle1`, `COD_Ciudad2`) VALUES
	('Juan', 'Perez', '2000-01-01', 11111111, 2346666666, 1, 3, 1),
	('Edith', 'Tabella', '1967-11-05', 22222211, 2344333111, 1, 5, 3),
	('Marcelo', 'De Lillo', '1981-11-10', 22222221, 2346222221, 1, 4, 1),
	('Paco', 'Montoya', '1996-11-08', 22222222, 2346666333, 1, 3, 1),
	('Roxana', 'Tange', '1978-11-10', 33333332, 2222222212, 1, 6, 3),
	('Lucas', 'Mesas', '1980-10-31', 33333333, 2346555666, 1, 2, 2),
	('Agustin', 'Narbebury', '1997-08-13', 40716939, 2346511650, 1, 1, 1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Dumping structure for table proyecto.profesor
CREATE TABLE IF NOT EXISTS `profesor` (
  `COD_Profesor` int(11) NOT NULL,
  `Horario` varchar(10) DEFAULT NULL,
  `DNI2` bigint(20) NOT NULL,
  PRIMARY KEY (`COD_Profesor`),
  KEY `FK_DNI2` (`DNI2`),
  CONSTRAINT `FK_DNI2` FOREIGN KEY (`DNI2`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.profesor: ~3 rows (approximately)
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` (`COD_Profesor`, `Horario`, `DNI2`) VALUES
	(1, 'mixto', 33333333),
	(2, 'vespertino', 22222221),
	(3, 'mixto', 22222211),
	(4, 'vespertino', 33333332);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;

-- Dumping structure for table proyecto.provincia
CREATE TABLE IF NOT EXISTS `provincia` (
  `COD_Provincia` tinyint(4) NOT NULL,
  `Provincia` varchar(51) NOT NULL,
  PRIMARY KEY (`COD_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table proyecto.provincia: ~1 rows (approximately)
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` (`COD_Provincia`, `Provincia`) VALUES
	(1, 'Buenos Aires');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
