-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para biblioteca
CREATE DATABASE IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `biblioteca`;

-- Volcando estructura para tabla biblioteca.libro
CREATE TABLE IF NOT EXISTS `libro` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `cantidad` tinyint(2) DEFAULT NULL,
  `editorial` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla Libro';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla biblioteca.libro_prestamo
CREATE TABLE IF NOT EXISTS `libro_prestamo` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `prestado_a` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha_devolucion` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__usuario` (`usuario_id`),
  KEY `FK__libro` (`libro_id`),
  CONSTRAINT `FK__libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`),
  CONSTRAINT `FK__usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Prestamo de libros';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla biblioteca.permiso
CREATE TABLE IF NOT EXISTS `permiso` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla Permisos';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla biblioteca.permiso_rol
CREATE TABLE IF NOT EXISTS `permiso_rol` (
  `id` int(11) NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `permiso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__rol` (`rol_id`),
  KEY `FK__permiso` (`permiso_id`),
  CONSTRAINT `FK__permiso` FOREIGN KEY (`permiso_id`) REFERENCES `permiso` (`id`),
  CONSTRAINT `FK__rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla biblioteca.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL,
  `nombre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla Roles';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla biblioteca.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla Usuarios';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla biblioteca.usuario_rol
CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `id` int(11) NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__rol_usuario` (`rol_id`),
  KEY `FK__usuario_rol` (`usuario_id`),
  CONSTRAINT `FK__rol_usuario` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `FK__usuario_rol` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
