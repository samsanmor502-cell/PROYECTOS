-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2025 a las 00:35:00
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agencia_de_autos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autos`
--

CREATE TABLE `autos` (
  `id_numserie` varchar(50) NOT NULL,
  `id_modelo` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `id_tipo_auto` int(11) NOT NULL,
  `fecha_adquirido` date DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `tipo_manejo` varchar(50) DEFAULT NULL,
  `estado` enum('Disponible','Vendido') DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autos`
--

INSERT INTO `autos` (`id_numserie`, `id_modelo`, `anio`, `color`, `id_tipo_auto`, `fecha_adquirido`, `costo`, `id_proveedor`, `tipo_manejo`, `estado`) VALUES
('AA23T9PR5J', 31, 2023, 'Rojo', 7, '2023-03-09', 410000.00, 11, 'Manual', 'Disponible'),
('AB33C5XN2J', 57, 2025, 'Plata', 1, '2025-03-29', 575000.00, 17, 'Automático', 'Disponible'),
('AB52R1HF4E', 83, 2024, 'Azul', 13, '2024-12-01', 495000.00, 3, 'Automático', 'Disponible'),
('AB94M2WN1U', 109, 2023, 'Negro', 10, '2023-08-12', 490000.00, 9, 'Automático', 'Disponible'),
('AF78R5LJ6U', 12, 2025, 'Azul', 1, '2025-06-30', 495000.00, 12, 'Automático', 'Vendido'),
('BB56K4XM2D', 32, 2024, 'Blanco', 7, '2024-10-23', 460000.00, 12, 'Automático', 'Disponible'),
('BC33Q9JF8E', 110, 2024, 'Blanco', 2, '2024-06-25', 550000.00, 10, 'Manual', 'Disponible'),
('BC44V9FR6G', 58, 2023, 'Blanco', 7, '2023-09-23', 330000.00, 18, 'Manual', 'Disponible'),
('BC93M6QK9R', 84, 2025, 'Blanco', 3, '2025-02-28', 560000.00, 4, 'Automático', 'Disponible'),
('BR29M6DA8X', 4, 2023, 'Gris', 1, '2023-06-12', 410000.00, 4, 'Automático', 'Vendido'),
('CC71H1LQ8P', 33, 2025, 'Gris', 2, '2025-08-15', 620000.00, 13, 'Automático', 'Disponible'),
('CD12N9XP1M', 85, 2023, 'Rojo', 7, '2023-05-09', 510000.00, 5, 'Manual', 'Disponible'),
('CD22L8QM1K', 59, 2024, 'Azul', 2, '2024-05-04', 380000.00, 19, 'Automático', 'Disponible'),
('CD45H6ZR4S', 111, 2025, 'Azul', 2, '2025-03-30', 620000.00, 11, 'Automático', 'Disponible'),
('CQ23B7WX0L', 13, 2023, 'Negro', 3, '2023-12-01', 340000.00, 13, 'Manual', 'Vendido'),
('DD48W6NZ0S', 34, 2023, 'Plata', 1, '2023-07-01', 375000.00, 14, 'Automático', 'Vendido'),
('DE27N3PL0M', 112, 2023, 'Gris', 3, '2023-12-17', 640000.00, 12, 'Automático', 'Disponible'),
('DE68B4JG7T', 86, 2024, 'Negro', 2, '2024-09-13', 580000.00, 6, 'Automático', 'Disponible'),
('DE77T3PH4V', 60, 2025, 'Negro', 2, '2025-02-19', 460000.00, 20, 'Automático', 'Disponible'),
('DH56F9ZT4V', 14, 2024, 'Rojo', 2, '2024-04-26', 370000.00, 14, 'Automático', 'Vendido'),
('DK44S9YE0R', 6, 2025, 'Blanco', 4, '2025-05-09', 530000.00, 6, 'Manual', 'Disponible'),
('EE59M7JC4Y', 35, 2024, 'Azul', 1, '2024-12-09', 420000.00, 15, 'Manual', 'Disponible'),
('EF56W4JK0Z', 61, 2023, 'Gris', 1, '2023-06-30', 410000.00, 1, 'Automático', 'Disponible'),
('EF68B8VH5A', 113, 2024, 'Negro', 2, '2024-08-09', 720000.00, 13, 'Manual', 'Disponible'),
('EF80V8LK2N', 87, 2025, 'Plata', 1, '2025-04-07', 640000.00, 7, 'Automático', 'Disponible'),
('FF93Q9HR6B', 36, 2025, 'Negro', 2, '2025-03-18', 490000.00, 16, 'Automático', 'Disponible'),
('FG15H1QM5A', 88, 2023, 'Azul', 1, '2023-10-29', 430000.00, 8, 'Automático', 'Disponible'),
('FG38H7RD9Y', 62, 2024, 'Blanco', 3, '2024-10-16', 480000.00, 2, 'Manual', 'Disponible'),
('FG79Q1XT2V', 114, 2025, 'Rojo', 13, '2025-01-25', 780000.00, 14, 'Automático', 'Disponible'),
('GB89N1MQ7E', 15, 2025, 'Plata', 2, '2025-07-18', 450000.00, 15, 'Automático', 'Vendido'),
('GG20P3KD1X', 37, 2023, 'Rojo', 2, '2023-05-25', 440000.00, 17, 'Automático', 'Disponible'),
('GH15T5LR7C', 115, 2023, 'Blanco', 7, '2023-06-06', 830000.00, 15, 'Automático', 'Disponible'),
('GH46R7PJ8V', 89, 2024, 'Gris', 2, '2024-06-21', 480000.00, 9, 'Manual', 'Disponible'),
('GH71B2XF5A', 63, 2025, 'Rojo', 2, '2025-07-09', 530000.00, 3, 'Automático', 'Disponible'),
('HH84R5VN9U', 38, 2024, 'Blanco', 2, '2024-08-21', 510000.00, 18, 'Manual', 'Disponible'),
('HI29B2WN3R', 90, 2025, 'Negro', 2, '2025-05-26', 550000.00, 10, 'Automático', 'Disponible'),
('HI54M2KJ9P', 116, 2024, 'Plata', 7, '2024-09-12', 910000.00, 16, 'Manual', 'Disponible'),
('HI60Q1LV8M', 64, 2023, 'Azul', 1, '2023-08-27', 385000.00, 4, 'Automático', 'Disponible'),
('II67C1TF7E', 39, 2025, 'Gris', 2, '2025-06-14', 560000.00, 19, 'Automático', 'Disponible'),
('IJ37N6QF1M', 117, 2025, 'Azul', 2, '2025-05-20', 980000.00, 17, 'Automático', 'Disponible'),
('IJ85K4ZN2P', 65, 2024, 'Negro', 13, '2024-04-29', 460000.00, 5, 'Manual', 'Disponible'),
('IJ93T6QF0Y', 91, 2023, 'Rojo', 1, '2023-11-19', 460000.00, 11, 'Manual', 'Disponible'),
('JJ33M9WX2N', 40, 2023, 'Azul', 4, '2023-02-17', 395000.00, 20, 'Manual', 'Disponible'),
('JK19T8HF6S', 66, 2025, 'Gris', 2, '2025-05-17', 520000.00, 6, 'Automático', 'Disponible'),
('JK60Z9HP8S', 118, 2023, 'Rojo', 7, '2023-07-04', 350000.00, 18, 'Automático', 'Disponible'),
('JK77L5PX2C', 92, 2024, 'Blanco', 2, '2024-08-02', 520000.00, 12, 'Automático', 'Disponible'),
('KK77L8PR5A', 41, 2024, 'Negro', 2, '2024-11-30', 480000.00, 1, 'Automático', 'Disponible'),
('KL25B3JD2U', 119, 2024, 'Negro', 2, '2024-11-05', 400000.00, 19, 'Manual', 'Disponible'),
('KL32V9JC1N', 67, 2023, 'Rojo', 3, '2023-09-14', 375000.00, 7, 'Manual', 'Disponible'),
('KL81M3VG7U', 93, 2025, 'Azul', 2, '2025-03-15', 590000.00, 13, 'Automático', 'Disponible'),
('KR70W6HC9S', 16, 2023, 'Blanco', 1, '2023-02-22', 290000.00, 16, 'Manual', 'Vendido'),
('LE83Z4NV1A', 17, 2024, 'Negro', 4, '2024-09-11', 325000.00, 17, 'Automático', 'Vendido'),
('LL25Y3QC8D', 42, 2025, 'Rojo', 2, '2025-07-28', 520000.00, 2, 'Automático', 'Disponible'),
('LM20Z9FD1J', 94, 2023, 'Gris', 1, '2023-12-08', 410000.00, 14, 'Automático', 'Disponible'),
('LM54B2QX7U', 68, 2024, 'Blanco', 2, '2024-12-20', 430000.00, 8, 'Automático', 'Disponible'),
('LM83Z9BD2C', 2, 2023, 'Blanco', 1, '2023-08-10', 420000.00, 2, 'Automático', 'Vendido'),
('LM87C1VN7E', 120, 2025, 'Gris', 1, '2025-03-08', 460000.00, 20, 'Automático', 'Disponible'),
('ME05C1RL8P', 10, 2023, 'Gris', 1, '2023-05-19', 375000.00, 10, 'Manual', 'Vendido'),
('MH47Y8QF5J', 18, 2025, 'Azul', 2, '2025-03-04', 410000.00, 18, 'Manual', 'Vendido'),
('MM66K2JD0V', 43, 2023, 'Blanco', 2, '2023-09-10', 360000.00, 3, 'Manual', 'Disponible'),
('MN44F5QP9Y', 121, 2023, 'Blanco', 2, '2023-09-22', 890000.00, 1, 'Manual', 'Disponible'),
('MN64R8KJ4P', 95, 2024, 'Negro', 2, '2024-09-01', 470000.00, 15, 'Manual', 'Disponible'),
('MN73Z6PR0E', 69, 2025, 'Negro', 2, '2025-03-22', 480000.00, 9, 'Automático', 'Disponible'),
('NJ82V4TX3H', 9, 2025, 'Rojo', 2, '2025-04-21', 560000.00, 9, 'Manual', 'Vendido'),
('NN52Z5LG9T', 44, 2024, 'Gris', 2, '2024-06-07', 400000.00, 4, 'Automático', 'Disponible'),
('NO29Y5LK3V', 70, 2023, 'Plata', 3, '2023-07-05', 510000.00, 10, 'Manual', 'Disponible'),
('NO43V1XT6M', 96, 2025, 'Blanco', 2, '2025-06-20', 520000.00, 16, 'Automático', 'Disponible'),
('NO71T8RK3B', 122, 2024, 'Azul', 2, '2024-12-13', 960000.00, 2, 'Automático', 'Disponible'),
('NS52C3PX7R', 19, 2023, 'Rojo', 3, '2023-11-20', 520000.00, 19, 'Automático', 'Vendido'),
('OO41R9FX4W', 45, 2025, 'Plata', 1, '2025-01-13', 470000.00, 5, 'Automático', 'Disponible'),
('OP19Q3PH9E', 97, 2023, 'Plata', 7, '2023-07-27', 380000.00, 17, 'Automático', 'Disponible'),
('OP58C1HJ9R', 71, 2024, 'Azul', 18, '2024-09-19', 590000.00, 11, 'Automático', 'Disponible'),
('OP96H4LX6P', 123, 2025, 'Negro', 2, '2025-06-02', 1020000.00, 3, 'Automático', 'Disponible'),
('PL64Y2KH3Z', 11, 2024, 'Blanco', 2, '2024-10-09', 445000.00, 11, 'Automático', 'Vendido'),
('PP38N3VH7C', 46, 2023, 'Rojo', 3, '2023-08-05', 530000.00, 6, 'Automático', 'Disponible'),
('PQ59Z8LN5S', 98, 2024, 'Azul', 2, '2024-05-16', 440000.00, 18, 'Manual', 'Disponible'),
('PQ67M8VG4L', 72, 2025, 'Negro', 2, '2025-01-28', 640000.00, 12, 'Automático', 'Disponible'),
('PW91V9JB2G', 20, 2024, 'Plata', 2, '2024-06-13', 640000.00, 20, 'Automático', 'Vendido'),
('QF56P2VN7J', 3, 2025, 'Negro', 2, '2025-02-07', 480000.00, 3, 'Manual', 'Vendido'),
('QQ49M5WB1S', 47, 2024, 'Negro', 1, '2024-04-18', 610000.00, 7, 'Manual', 'Disponible'),
('QR80T6JF2V', 99, 2025, 'Rojo', 1, '2025-03-10', 520000.00, 19, 'Automático', 'Disponible'),
('QR93N9FT7C', 73, 2023, 'Blanco', 7, '2023-11-02', 320000.00, 13, 'Automático', 'Disponible'),
('QT28X4MD0Y', 21, 2025, 'Gris', 2, '2025-01-29', 720000.00, 1, 'Manual', 'Vendido'),
('RR82C8HJ3L', 48, 2025, 'Blanco', 2, '2025-03-26', 680000.00, 8, 'Automático', 'Disponible'),
('RS28Z1QJ5P', 74, 2024, 'Gris', 7, '2024-05-25', 370000.00, 14, 'Manual', 'Disponible'),
('RS35B2KM7U', 100, 2023, 'Negro', 2, '2023-06-29', 460000.00, 20, 'Automático', 'Disponible'),
('RV19X7MG6J', 8, 2024, 'Negro', 1, '2024-07-14', 395000.00, 8, 'Automático', 'Vendido'),
('RX73Z2LK6E', 22, 2023, 'Negro', 7, '2023-05-15', 490000.00, 2, 'Automático', 'Disponible'),
('SS10V1QD5E', 49, 2023, 'Azul', 1, '2023-10-08', 620000.00, 9, 'Automático', 'Disponible'),
('ST21M4VL9N', 101, 2024, 'Gris', 1, '2024-11-22', 520000.00, 1, 'Manual', 'Disponible'),
('ST74L5WN8B', 75, 2025, 'Rojo', 7, '2025-03-12', 430000.00, 15, 'Automático', 'Disponible'),
('SY60T8PN5B', 23, 2024, 'Blanco', 2, '2024-09-03', 560000.00, 3, 'Automático', 'Disponible'),
('TJ49R6QH1K', 24, 2025, 'Azul', 2, '2025-04-12', 605000.00, 4, 'Manual', 'Disponible'),
('TT95K7NR9Y', 50, 2024, 'Rojo', 2, '2024-09-21', 705000.00, 10, 'Manual', 'Disponible'),
('TU65M4VK1E', 76, 2023, 'Azul', 7, '2023-06-18', 460000.00, 16, 'Automático', 'Disponible'),
('TU75H5QP1C', 102, 2025, 'Azul', 2, '2025-05-05', 590000.00, 2, 'Automático', 'Disponible'),
('UF63B2QP9T', 7, 2023, 'Plata', 13, '2023-09-03', 360000.00, 7, 'Automático', 'Vendido'),
('UK85C7WD9X', 25, 2023, 'Gris', 7, '2023-10-09', 380000.00, 5, 'Automático', 'Disponible'),
('UU64H6PX2A', 51, 2025, 'Negro', 5, '2025-05-30', 760000.00, 11, 'Automático', 'Disponible'),
('UV38N7JK6M', 103, 2023, 'Rojo', 1, '2023-09-09', 470000.00, 3, 'Manual', 'Disponible'),
('UV92C9QH6A', 77, 2024, 'Negro', 7, '2024-08-10', 520000.00, 17, 'Manual', 'Disponible'),
('VL21B9YF3M', 26, 2024, 'Negro', 2, '2024-08-19', 420000.00, 6, 'Manual', 'Disponible'),
('VV20B4LG8M', 52, 2023, 'Gris', 1, '2023-12-12', 540000.00, 12, 'Manual', 'Disponible'),
('VW19C3XD4P', 104, 2024, 'Blanco', 1, '2024-07-17', 540000.00, 4, 'Automático', 'Disponible'),
('VW33B3XF9M', 78, 2025, 'Plata', 7, '2025-04-24', 580000.00, 18, 'Automático', 'Disponible'),
('WM54X1ZR8H', 27, 2025, 'Rojo', 4, '2025-06-22', 470000.00, 7, 'Automático', 'Disponible'),
('WW34N5RC1Q', 53, 2024, 'Blanco', 1, '2024-07-11', 610000.00, 13, 'Automático', 'Disponible'),
('WX19H5JD2N', 79, 2023, 'Blanco', 7, '2023-09-02', 420000.00, 19, 'Automático', 'Disponible'),
('WX42Z6QJ8A', 105, 2025, 'Negro', 1, '2025-02-03', 610000.00, 5, 'Automático', 'Disponible'),
('XA92T7QK1P', 1, 2024, 'Rojo', 1, '2024-03-15', 385000.00, 1, 'Automático', 'Vendido'),
('XN37V5KQ0C', 28, 2023, 'Blanco', 3, '2023-04-14', 350000.00, 8, 'Manual', 'Disponible'),
('XX47Y2JT7U', 54, 2025, 'Azul', 2, '2025-04-05', 690000.00, 14, 'Automático', 'Disponible'),
('XY31B8HR2L', 106, 2023, 'Azul', 7, '2023-11-27', 430000.00, 6, 'Automático', 'Disponible'),
('XY41Z7PG5U', 80, 2024, 'Rojo', 7, '2024-10-08', 490000.00, 20, 'Manual', 'Disponible'),
('YP86M2JD4N', 29, 2024, 'Azul', 4, '2024-07-05', 410000.00, 9, 'Automático', 'Disponible'),
('YY29F3QV0B', 55, 2023, 'Negro', 1, '2023-02-25', 455000.00, 15, 'Manual', 'Disponible'),
('YZ56T9PD9R', 107, 2024, 'Gris', 7, '2024-10-14', 480000.00, 7, 'Manual', 'Disponible'),
('YZ85C2LK0S', 81, 2025, 'Negro', 7, '2025-06-15', 550000.00, 1, 'Automático', 'Disponible'),
('ZA18L7XF5M', 108, 2025, 'Rojo', 1, '2025-04-16', 560000.00, 8, 'Automático', 'Disponible'),
('ZA77T3WN8L', 82, 2023, 'Gris', 13, '2023-07-11', 440000.00, 2, 'Manual', 'Disponible'),
('ZQ94F8LG7R', 30, 2025, 'Negro', 7, '2025-05-27', 500000.00, 10, 'Automático', 'Disponible'),
('ZT75H1CW4E', 5, 2024, 'Azul', 1, '2024-11-28', 520000.00, 5, 'Automático', 'Vendido'),
('ZZ11D7HM9P', 56, 2024, 'Rojo', 2, '2024-06-20', 495000.00, 16, 'Automático', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `id_datos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `id_datos`) VALUES
(1, 'James Smith', 47),
(2, 'Mary Johnson', 48),
(3, 'Robert Williams', 49),
(4, 'Patricia Brown', 50),
(5, 'John Jones', 51),
(6, 'Linda Miller', 52),
(7, 'Michael Davis', 53),
(8, 'Barbara Garcia', 54),
(9, 'William Rodriguez', 55),
(10, 'Elizabeth Martinez', 56),
(11, 'David Hernandez', 57),
(12, 'Jennifer Lopez', 58),
(13, 'Joseph Gonzalez', 59),
(14, 'Susan Wilson', 60),
(15, 'Thomas Anderson', 61),
(16, 'Karen Taylor', 62),
(17, 'Charles Moore', 63),
(18, 'Nancy Jackson', 64),
(19, 'Daniel Martin', 65),
(20, 'Lisa Thomas', 66),
(22, 'Lucas', 69);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosgenerales`
--

CREATE TABLE `datosgenerales` (
  `id_datos` int(11) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datosgenerales`
--

INSERT INTO `datosgenerales` (`id_datos`, `telefono`, `correo`, `fecha_nac`) VALUES
(1, '5534217890', 'maria.lopez@gmail.com', '1989-05-14'),
(2, '5546789023', 'juan.perez@hotmail.com', '1992-11-22'),
(3, '5578901234', 'carlos.mendez@yahoo.com', '1985-03-09'),
(4, '5587654321', 'ana.sanchez@gmail.com', '1990-07-30'),
(5, '5523456789', 'roberto.garcia@outlook.com', '1988-01-17'),
(6, '5598765432', 'laura.torres@gmail.com', '1995-12-05'),
(7, '5543210987', 'jose.martinez@hotmail.com', '1987-04-25'),
(8, '5534567890', 'karla.ramirez@yahoo.com', '1993-09-10'),
(9, '5567890123', 'fernando.gomez@gmail.com', '1986-02-28'),
(10, '5526789012', 'sofia.diaz@outlook.com', '1994-10-15'),
(11, '5589012345', 'ricardo.hernandez@gmail.com', '1991-08-08'),
(12, '5576543210', 'elena.castillo@hotmail.com', '1989-03-21'),
(13, '5523459876', 'andres.lopez@yahoo.com', '1996-06-11'),
(14, '5532198765', 'paola.santos@gmail.com', '1990-12-19'),
(15, '5556789345', 'miguel.rojas@outlook.com', '1984-09-04'),
(16, '5578904567', 'adriana.cano@gmail.com', '1992-05-23'),
(17, '5590123456', 'jorge.silva@hotmail.com', '1987-11-07'),
(18, '5545678901', 'daniela.vargas@yahoo.com', '1995-02-18'),
(19, '5587345612', 'alejandro.pineda@gmail.com', '1988-07-29'),
(20, '5565432198', 'patricia.morales@outlook.com', '1991-04-03'),
(21, '5573216549', 'raul.fuentes@gmail.com', '1985-06-27'),
(22, '5521987654', 'monica.rivera@hotmail.com', '1993-08-12'),
(23, '5589654321', 'gustavo.ortega@yahoo.com', '1986-10-06'),
(24, '5547890321', 'mariana.salazar@gmail.com', '1990-01-25'),
(25, '5598342765', 'eduardo.campos@outlook.com', '1988-03-30'),
(26, '5567123498', 'lucia.garza@gmail.com', '1994-09-14'),
(27, '5534987610', 'oscar.moreno@hotmail.com', '1989-07-19'),
(28, '5576549871', 'brenda.aguilar@yahoo.com', '1992-02-09'),
(29, '5581203948', 'hector.flores@gmail.com', '1987-11-25'),
(30, '5529876310', 'veronica.arias@outlook.com', '1996-05-02'),
(31, '5592837465', 'david.reyes@gmail.com', '1985-08-17'),
(32, '5538471920', 'natalia.cruz@hotmail.com', '1991-03-08'),
(33, '5569032145', 'arturo.luna@yahoo.com', '1990-09-21'),
(34, '5546287930', 'valeria.castro@gmail.com', '1993-12-14'),
(35, '5571039842', 'manuel.perez@outlook.com', '1988-06-05'),
(36, '5597483021', 'clara.gonzalez@gmail.com', '1992-10-29'),
(37, '5526748390', 'sergio.navarro@hotmail.com', '1986-04-16'),
(38, '5539827465', 'liliana.herrera@yahoo.com', '1994-01-09'),
(39, '5583479120', 'ramon.mendoza@gmail.com', '1987-07-02'),
(40, '5548712309', 'irenesalas@outlook.com', '1995-11-18'),
(41, '3939382323', 'pedro.guzman@gmail.com', '1999-01-01'),
(42, '8272772323', 'samuel.fernandez@gmail.com', '2004-01-08'),
(43, '2929837282', 'jefferson.gutierritos@gmail.com', '2000-12-01'),
(44, '3838229343', 'alvin.yakitori@gmail.com', '1998-04-22'),
(45, '3827276462', 'autin.richard.post@malone.com', '1995-07-04'),
(46, '2726352222', 'montero.lamar.hill@nasx.com', '1999-04-09'),
(47, '2125551234', 'james.smith@example.com', '1990-04-12'),
(48, '2135552345', 'mary.johnson@example.com', '1988-09-23'),
(49, '2145553456', 'robert.williams@example.com', '1992-11-05'),
(50, '2155554567', 'patricia.brown@example.com', '1985-06-17'),
(51, '2165555678', 'john.jones@example.com', '1991-02-28'),
(52, '2175556789', 'linda.miller@example.com', '1993-08-14'),
(53, '2185557890', 'michael.davis@example.com', '1989-12-03'),
(54, '2195558901', 'barbara.garcia@example.com', '1994-07-21'),
(55, '2205559012', 'william.rodriguez@example.com', '1996-03-09'),
(56, '2215550123', 'elizabeth.martinez@example.com', '1987-10-30'),
(57, '2225551235', 'david.hernandez@example.com', '1990-05-18'),
(58, '2235552346', 'jennifer.lopez@example.com', '1986-01-27'),
(59, '2245553457', 'joseph.gonzalez@example.com', '1992-09-12'),
(60, '2255554568', 'susan.wilson@example.com', '1995-04-05'),
(61, '2265555679', 'thomas.anderson@example.com', '1988-07-22'),
(62, '2275556780', 'karen.taylor@example.com', '1991-11-15'),
(63, '2285557891', 'charles.moore@example.com', '1993-02-02'),
(64, '2295558902', 'nancy.jackson@example.com', '1989-08-19'),
(65, '2305559013', 'daniel.martin@example.com', '1994-12-25'),
(66, '2315550124', 'lisa.thomas@example.com', '1990-06-07'),
(69, '1928228711', 'lucaschido@gmail.com', '2004-06-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nombre_departamento`) VALUES
(5, 'Administración/Contabilidad'),
(7, 'Atención al cliente'),
(11, 'Dirección general/Gerencia'),
(8, 'Financiamiento y crédito'),
(9, 'Gestoría/Tramites Vehiculares'),
(6, 'Marketing'),
(4, 'Recursos humanos'),
(3, 'Refacciones'),
(2, 'Servicio/Taller'),
(10, 'Tecnología de la información'),
(1, 'Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `id_tipo_empleado` int(11) NOT NULL,
  `fecha_contrato` date NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_datos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `id_tipo_empleado`, `fecha_contrato`, `id_departamento`, `id_datos`) VALUES
(1, 'María López', 1, '2021-03-15', 1, 1),
(2, 'Juan Pérez', 2, '2022-07-09', 1, 2),
(3, 'Carlos Méndez', 3, '2023-11-02', 1, 3),
(4, 'Ana Sánchez', 4, '2021-06-20', 1, 4),
(5, 'Roberto García', 5, '2024-01-27', 1, 5),
(6, 'Laura Torres', 6, '2022-10-11', 2, 6),
(7, 'José Martínez', 7, '2023-05-18', 2, 7),
(8, 'Karla Ramírez', 8, '2021-09-30', 2, 8),
(9, 'Fernando Gómez', 9, '2022-12-22', 2, 9),
(10, 'Sofía Díaz', 10, '2024-03-07', 2, 10),
(11, 'Ricardo Hernández', 11, '2021-08-19', 3, 11),
(12, 'Elena Castillo', 12, '2022-02-25', 3, 12),
(13, 'Andrés López', 13, '2023-04-14', 3, 13),
(14, 'Paola Santos', 14, '2021-11-29', 3, 14),
(15, 'Miguel Rojas', 15, '2024-06-10', 4, 15),
(16, 'Adriana Cano', 16, '2023-07-25', 4, 16),
(17, 'Jorge Silva', 17, '2022-09-01', 4, 17),
(18, 'Daniela Vargas', 18, '2024-05-03', 4, 18),
(19, 'Alejandro Pineda', 19, '2021-12-17', 5, 19),
(20, 'Patricia Morales', 20, '2023-08-09', 5, 20),
(21, 'Raúl Fuentes', 21, '2022-11-15', 5, 21),
(22, 'Mónica Rivera', 22, '2021-04-06', 5, 22),
(23, 'Gustavo Ortega', 23, '2024-02-20', 5, 23),
(24, 'Mariana Salazar', 24, '2022-07-14', 6, 24),
(25, 'Eduardo Campos', 25, '2023-01-31', 6, 25),
(26, 'Lucía Garza', 26, '2021-10-22', 6, 26),
(27, 'Óscar Moreno', 27, '2024-04-13', 6, 27),
(28, 'Brenda Aguilar', 28, '2023-09-28', 6, 28),
(29, 'Héctor Flores', 29, '2021-05-08', 7, 29),
(30, 'Verónica Arias', 30, '2022-03-17', 7, 30),
(31, 'David Reyes', 31, '2024-07-05', 7, 31),
(32, 'Natalia Cruz', 32, '2021-08-26', 7, 32),
(33, 'Arturo Luna', 33, '2023-12-01', 8, 33),
(34, 'Valeria Castro', 34, '2022-06-19', 8, 34),
(35, 'Manuel Pérez', 35, '2024-01-12', 8, 35),
(36, 'Clara González', 36, '2021-11-04', 8, 36),
(37, 'Sergio Navarro', 37, '2023-03-27', 9, 37),
(38, 'Liliana Herrera', 38, '2022-09-09', 9, 38),
(39, 'Ramón Mendoza', 39, '2024-05-29', 9, 39),
(40, 'Ramón Mendoza', 40, '2022-09-08', 10, 40),
(41, 'Pedro Guzman', 41, '2021-12-01', 10, 41),
(42, 'Samuel Fernandez', 42, '2022-08-21', 10, 42),
(43, 'Jefferson Gutierritos', 43, '2023-03-30', 10, 43),
(44, 'Alvin Yakitori', 44, '2019-03-09', 11, 44),
(45, 'Austin Richard Post', 45, '2019-08-22', 11, 45),
(46, 'Montero Lamar Hill', 46, '2019-06-12', 11, 46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(100) NOT NULL,
  `pais_origen` varchar(100) DEFAULT NULL,
  `sitio_web` varchar(200) DEFAULT NULL,
  `anio_fundado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`, `pais_origen`, `sitio_web`, `anio_fundado`) VALUES
(1, 'Toyota', 'Japón', 'https://www.toyota-global.com', 1937),
(2, 'Nissan', 'Japón', 'https://www.nissan-global.com', 1933),
(3, 'Honda', 'Japón', 'https://www.honda.com', 1948),
(4, 'Mazda', 'Japón', 'https://www.mazda.com', 1920),
(5, 'Subaru', 'Japón', 'https://www.subaru-global.com', 1953),
(6, 'Mitsubishi', 'Japón', 'https://www.mitsubishi-motors.com', 1917),
(7, 'Suzuki', 'Japón', 'https://www.globalsuzuki.com', 1909),
(8, 'Lexus', 'Japón', 'https://www.lexus.com', 1989),
(9, 'Ford', 'Estados Unidos', 'https://www.ford.com', 1903),
(10, 'Chevrolet', 'Estados Unidos', 'https://www.chevrolet.com', 1911),
(11, 'Dodge', 'Estados Unidos', 'https://www.dodge.com', 1900),
(12, 'Tesla', 'Estados Unidos', 'https://www.tesla.com', 2003),
(13, 'Jeep', 'Estados Unidos', 'https://www.jeep.com', 1941),
(14, 'GMC', 'Estados Unidos', 'https://www.gmc.com', 1911),
(15, 'Cadillac', 'Estados Unidos', 'https://www.cadillac.com', 1902),
(16, 'Volkswagen', 'Alemania', 'https://www.volkswagen.com', 1937),
(17, 'BMW', 'Alemania', 'https://www.bmw.com', 1916),
(18, 'Mercedes-Benz', 'Alemania', 'https://www.mercedes-benz.com', 1926),
(19, 'Audi', 'Alemania', 'https://www.audi.com', 1909),
(20, 'Porsche', 'Alemania', 'https://www.porsche.com', 1931),
(21, 'Opel', 'Alemania', 'https://www.opel.com', 1862),
(22, 'Renault', 'Francia', 'https://www.renault.com', 1899),
(23, 'Peugeot', 'Francia', 'https://www.peugeot.com', 1810),
(24, 'Citroën', 'Francia', 'https://www.citroen.com', 1919),
(25, 'Bugatti', 'Francia', 'https://www.bugatti.com', 1909),
(26, 'Ferrari', 'Italia', 'https://www.ferrari.com', 1939),
(27, 'Lamborghini', 'Italia', 'https://www.lamborghini.com', 1963),
(28, 'Fiat', 'Italia', 'https://www.fiat.com', 1899),
(29, 'Maserati', 'Italia', 'https://www.maserati.com', 1914),
(30, 'Alfa Romeo', 'Italia', 'https://www.alfaromeo.com', 1910),
(31, 'Hyundai', 'Corea del Sur', 'https://www.hyundai.com', 1967),
(32, 'Kia', 'Corea del Sur', 'https://www.kia.com', 1944),
(33, 'Genesis', 'Corea del Sur', 'https://www.genesis.com', 2015),
(34, 'Volvo', 'Suecia', 'https://www.volvocars.com', 1927),
(35, 'Saab', 'Suecia', 'https://www.saabcars.com', 1945),
(36, 'Jaguar', 'Reino Unido', 'https://www.jaguar.com', 1935),
(37, 'Land Rover', 'Reino Unido', 'https://www.landrover.com', 1948),
(38, 'Mini', 'Reino Unido', 'https://www.mini.com', 1959),
(39, 'Aston Martin', 'Reino Unido', 'https://www.astonmartin.com', 1913),
(40, 'Bentley', 'Reino Unido', 'https://www.bentleymotors.com', 1919),
(41, 'Rolls-Royce', 'Reino Unido', 'https://www.rolls-roycemotorcars.com', 1906);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo`
--

CREATE TABLE `metodo` (
  `id_pago` int(11) NOT NULL,
  `tipo_pago` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo`
--

INSERT INTO `metodo` (`id_pago`, `tipo_pago`) VALUES
(7, 'Arrendamiento financiero'),
(8, 'Arrendamiento puro'),
(3, 'Cheque certificado'),
(6, 'Crédito automotriz'),
(19, 'Crédito con agencia'),
(13, 'Crédito con aval'),
(16, 'Depósito en cuenta'),
(1, 'Efectivo'),
(11, 'Financiamiento interno'),
(10, 'Pago con intercambio de vehículo'),
(20, 'Pago con tarjeta corporativa'),
(15, 'Pago diferido'),
(14, 'Pago en línea'),
(9, 'Pago mixto'),
(12, 'Pago por medio de institución bancaria'),
(18, 'Plan de pagos a meses sin intereses'),
(4, 'Tarjeta de crédito'),
(5, 'Tarjeta de débito'),
(2, 'Transferencia bancaria'),
(17, 'Transferencia interbancaria SPEI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL,
  `nombre_modelo` varchar(100) NOT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id_modelo`, `nombre_modelo`, `id_marca`) VALUES
(1, 'Corolla', 1),
(2, 'Camry', 1),
(3, 'RAV4', 1),
(4, 'Altima', 2),
(5, 'Versa', 2),
(6, 'Frontier', 2),
(7, 'Civic', 3),
(8, 'Accord', 3),
(9, 'CR-V', 3),
(10, 'Mazda3', 4),
(11, 'CX-5', 4),
(12, 'Mazda6', 4),
(13, 'Impreza', 5),
(14, 'Forester', 5),
(15, 'Outback', 5),
(16, 'Mirage', 6),
(17, 'L200', 6),
(18, 'Outlander', 6),
(19, 'Swift', 7),
(20, 'Vitara', 7),
(21, 'S-Cross', 7),
(22, 'IS 300', 8),
(23, 'RX 350', 8),
(24, 'NX 300', 8),
(25, 'Mustang', 9),
(26, 'Explorer', 9),
(27, 'Ranger', 9),
(28, 'Spark', 10),
(29, 'Silverado', 10),
(30, 'Camaro', 10),
(31, 'Charger', 11),
(32, 'Challenger', 11),
(33, 'Durango', 11),
(34, 'Model S', 12),
(35, 'Model 3', 12),
(36, 'Model X', 12),
(37, 'Wrangler', 13),
(38, 'Cherokee', 13),
(39, 'Compass', 13),
(40, 'Sierra', 14),
(41, 'Terrain', 14),
(42, 'Yukon', 14),
(43, 'Escalade', 15),
(44, 'XT5', 15),
(45, 'CT5', 15),
(46, 'Golf', 16),
(47, 'Jetta', 16),
(48, 'Tiguan', 16),
(49, 'Serie 3', 17),
(50, 'X5', 17),
(51, 'i4', 17),
(52, 'Clase C', 18),
(53, 'Clase E', 18),
(54, 'GLA', 18),
(55, 'A3', 19),
(56, 'Q5', 19),
(57, 'A4', 19),
(58, '911', 20),
(59, 'Cayenne', 20),
(60, 'Macan', 20),
(61, 'Corsa', 21),
(62, 'Astra', 21),
(63, 'Grandland', 21),
(64, 'Clio', 22),
(65, 'Megane', 22),
(66, 'Koleos', 22),
(67, '208', 23),
(68, '3008', 23),
(69, '2008', 23),
(70, 'C3', 24),
(71, 'C4', 24),
(72, 'C5 Aircross', 24),
(73, 'Chiron', 25),
(74, 'Veyron', 25),
(75, 'Divo', 25),
(76, '488 GTB', 26),
(77, 'Roma', 26),
(78, 'Portofino', 26),
(79, 'Huracán', 27),
(80, 'Aventador', 27),
(81, 'Urus', 27),
(82, '500', 28),
(83, 'Panda', 28),
(84, 'Tipo', 28),
(85, 'Ghibli', 29),
(86, 'Levante', 29),
(87, 'Quattroporte', 29),
(88, 'Giulia', 30),
(89, 'Stelvio', 30),
(90, 'Tonale', 30),
(91, 'Elantra', 31),
(92, 'Tucson', 31),
(93, 'Santa Fe', 31),
(94, 'Rio', 32),
(95, 'Sportage', 32),
(96, 'Sorento', 32),
(97, 'G70', 33),
(98, 'GV80', 33),
(99, 'G90', 33),
(100, 'XC60', 34),
(101, 'S60', 34),
(102, 'XC90', 34),
(103, '9-3', 35),
(104, '900 Turbo', 35),
(105, '9-5', 35),
(106, 'F-Type', 36),
(107, 'XE', 36),
(108, 'XF', 36),
(109, 'Defender', 37),
(110, 'Discovery', 37),
(111, 'Range Rover', 37),
(112, 'Cooper', 38),
(113, 'Countryman', 38),
(114, 'Clubman', 38),
(115, 'DB11', 39),
(116, 'Vantage', 39),
(117, 'DBX', 39),
(118, 'Continental GT', 40),
(119, 'Bentayga', 40),
(120, 'Flying Spur', 40),
(121, 'Phantom', 41),
(122, 'Ghost', 41),
(123, 'Cullinan', 41),
(124, 'Chetos', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_empresa` varchar(150) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre_empresa`, `direccion`, `telefono`, `correo`) VALUES
(1, 'Autopartes del Norte', 'Av. Universidad 123, Monterrey, NL', '8183456721', 'contacto@autopartesnorte.com'),
(2, 'Lubricantes MX', 'Calle Reforma 890, Ciudad de México', '5556789034', 'ventas@lubricantesmx.com'),
(3, 'Refacciones García', 'Blvd. Independencia 456, Torreón, Coahuila', '8714567890', 'info@refgarcia.com'),
(4, 'Motores del Bajío', 'Carretera Celaya-Salvatierra Km 4, Celaya, Gto.', '4612345678', 'ventas@motoresbajio.com'),
(5, 'Distribuidora Autotek', 'Av. López Mateos 230, Guadalajara, Jal.', '3334567891', 'soporte@autotekdistrib.com'),
(6, 'Pinturas y Acabados Vega', 'Calle Juárez 55, León, Gto.', '4772348901', 'ventas@pinturasvega.com'),
(7, 'Llantas Continental Plus', 'Blvd. Díaz Ordaz 900, Monterrey, NL', '8123459090', 'contacto@llantasplus.com'),
(8, 'Servicios Mecánicos del Centro', 'Av. Hidalgo 178, Querétaro, Qro.', '4426782345', 'info@smcentro.com'),
(9, 'Sistemas Automotrices Rivera', 'Calle Madero 67, Puebla, Pue.', '2223456789', 'soporte@riverasystems.com'),
(10, 'Baterías El Sol', 'Calle 5 de Mayo 450, Mérida, Yuc.', '9991234567', 'ventas@bateriaselsol.com'),
(11, 'Aceites Premium Lub', 'Av. Lázaro Cárdenas 700, Morelia, Mich.', '4437891234', 'contacto@premiumlub.com'),
(12, 'Refacciones López', 'Calle Hidalgo 320, Toluca, Edo. Méx.', '7224560987', 'ventas@reflopez.com'),
(13, 'Autotech Solutions', 'Av. Insurgentes Sur 1580, CDMX', '5551239876', 'info@autotechsolutions.com'),
(14, 'Frenos y Clutch Ramírez', 'Calle Zaragoza 48, Chihuahua, Chih.', '6145672345', 'contacto@frenosyclutchramirez.com'),
(15, 'Componentes del Pacífico', 'Blvd. Kino 250, Hermosillo, Son.', '6623459870', 'ventas@compacifico.com'),
(16, 'ElectroAuto del Sur', 'Av. Central 430, Tuxtla Gutiérrez, Chis.', '9612348765', 'info@electroautosur.com'),
(17, 'Distribuciones Gálvez', 'Calle Morelos 380, San Luis Potosí, SLP', '4445671122', 'ventas@distribgalvez.com'),
(18, 'Importadora AutoLux', 'Av. Tecnológico 990, Cancún, Q. Roo', '9984567821', 'contacto@autoluximports.com'),
(19, 'Cristales y Accesorios Bravo', 'Calle Hidalgo 312, Tijuana, BC', '6642347890', 'ventas@cristalesbravo.com'),
(20, 'Partes Express', 'Av. Revolución 800, Monterrey, NL', '8187654321', 'soporte@partesexpress.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE `seguro` (
  `id_seguro` int(11) NOT NULL,
  `compania` varchar(100) NOT NULL,
  `tipo_seguro` varchar(100) DEFAULT NULL,
  `costo_seguro` decimal(10,2) DEFAULT NULL,
  `Descripcion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguro`
--

INSERT INTO `seguro` (`id_seguro`, `compania`, `tipo_seguro`, `costo_seguro`, `Descripcion`) VALUES
(1, 'AXA Seguros', 'Cobertura Amplia', 9500.00, 'Incluye daños a terceros, robo total, daños materiales, gastos médicos y asistencia vial.'),
(2, 'GNP Seguros', 'Cobertura Limitada', 7200.00, 'Protege contra robo total y responsabilidad civil, con opción de asistencia legal.'),
(3, 'Qualitas', 'Cobertura Amplia Plus', 10800.00, 'Cubre daños a terceros, robo, pérdida total y asistencia 24/7 con auto sustituto.'),
(4, 'Mapfre', 'Cobertura Básica', 5200.00, 'Incluye responsabilidad civil y defensa legal básica.'),
(5, 'HDI Seguros', 'Cobertura Amplia', 9800.00, 'Daños materiales, robo, responsabilidad civil, asistencia y gastos médicos.'),
(6, 'Seguros Banorte', 'Cobertura Total', 11200.00, 'Incluye todo riesgo, auto sustituto y protección contra desastres naturales.'),
(7, 'Zurich', 'Cobertura Limitada', 7500.00, 'Cubre robo total y responsabilidad civil, con opción de extensión internacional.'),
(8, 'ABA Seguros', 'Cobertura Amplia', 9400.00, 'Protección total del vehículo, daños, robo y servicio de grúa.'),
(9, 'Chubb', 'Cobertura Premium', 12500.00, 'Cubre daños materiales, robo, pérdida total, responsabilidad civil y asistencia VIP.'),
(10, 'Inbursa Seguros', 'Cobertura Básica', 5800.00, 'Responsabilidad civil y asesoría legal en caso de accidente.'),
(11, 'Allianz', 'Cobertura Amplia', 9900.00, 'Incluye daños, robo, responsabilidad civil y cobertura de cristales.'),
(12, 'Seguros Atlas', 'Cobertura Plus', 10400.00, 'Protege contra robo total, colisión, fenómenos naturales y vandalismo.'),
(13, 'Afirme Seguros', 'Cobertura Limitada', 7100.00, 'Responsabilidad civil y robo total con cobertura nacional.'),
(14, 'Sura', 'Cobertura Amplia', 9700.00, 'Cubre daños a terceros, robo, asistencia vial y defensa legal.'),
(15, 'BBVA Seguros', 'Cobertura Total', 11000.00, 'Cobertura integral con deducible bajo y pago directo a talleres afiliados.'),
(16, 'AXA Seguros', 'Cobertura Básica', 5400.00, 'Responsabilidad civil y servicio de grúa limitado.'),
(17, 'GNP Seguros', 'Cobertura Premium', 12300.00, 'Protección total, asistencia internacional y beneficios por buen conductor.'),
(18, 'Qualitas', 'Cobertura Limitada', 7600.00, 'Responsabilidad civil, robo total y asistencia vial básica.'),
(19, 'Mapfre', 'Cobertura Amplia', 9600.00, 'Daños materiales, robo, responsabilidad civil y gastos médicos.'),
(20, 'HDI Seguros', 'Cobertura Total Plus', 11800.00, 'Cobertura completa, fenómenos naturales y protección de accesorios especiales.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoauto`
--

CREATE TABLE `tipoauto` (
  `id_tipo_auto` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoauto`
--

INSERT INTO `tipoauto` (`id_tipo_auto`, `categoria`) VALUES
(1, 'Sedán'),
(2, 'SUV'),
(3, 'Hatchback'),
(4, 'Pickup'),
(5, 'Coupé'),
(6, 'Convertible'),
(7, 'Deportivo'),
(8, 'Minivan'),
(9, 'Camioneta'),
(10, 'Todo terreno'),
(11, 'Eléctrico'),
(12, 'Híbrido'),
(13, 'Compacto'),
(14, 'Lujo'),
(15, 'Familiar'),
(16, 'Utilitario'),
(17, 'Van de carga'),
(18, 'CrossOver'),
(19, 'Off-Road'),
(20, 'Microcar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoempleado`
--

CREATE TABLE `tipoempleado` (
  `id_tipo_empleado` int(11) NOT NULL,
  `puesto` varchar(100) NOT NULL,
  `salario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoempleado`
--

INSERT INTO `tipoempleado` (`id_tipo_empleado`, `puesto`, `salario`) VALUES
(1, 'Asesor de ventas', 15000.00),
(2, 'Gerente de ventas', 30000.00),
(3, 'Recepcionista de ventas', 12000.00),
(4, 'Coordinador de ventas', 18000.00),
(5, 'Vendedor de autos seminuevos', 14000.00),
(6, 'Jefe de taller', 25000.00),
(7, 'Mecánico automotriz', 16000.00),
(8, 'Técnico en diagnóstico', 18000.00),
(9, 'Ayudante de mecánico', 10000.00),
(10, 'Asesor de servicio', 15000.00),
(11, 'Encargado de refacciones', 18000.00),
(12, 'Almacenista', 12000.00),
(13, 'Auxiliar de inventario', 11000.00),
(14, 'Vendedor de refacciones', 13000.00),
(15, 'Gerente de recursos humanos', 28000.00),
(16, 'Reclutador', 16000.00),
(17, 'Auxiliar de recursos humanos', 12000.00),
(18, 'Capacitador interno', 15000.00),
(19, 'Gerente administrativo', 30000.00),
(20, 'Contador general', 22000.00),
(21, 'Auxiliar contable', 14000.00),
(22, 'Cajero', 12000.00),
(23, 'Analista financiero', 20000.00),
(24, 'Gerente de marketing', 28000.00),
(25, 'Diseñador gráfico', 15000.00),
(26, 'Community manager', 14000.00),
(27, 'Analista de mercado', 18000.00),
(28, 'Coordinador de publicidad', 17000.00),
(29, 'Coordinador de postventa', 20000.00),
(30, 'Ejecutivo de atención al cliente', 14000.00),
(31, 'Encargado de garantías', 16000.00),
(32, 'Asistente de servicio', 12000.00),
(33, 'Ejecutivo de crédito', 18000.00),
(34, 'Analista financiero automotriz', 20000.00),
(35, 'Gerente de crédito y cobranza', 25000.00),
(36, 'Asesor de financiamiento', 17000.00),
(37, 'Gestor vehicular', 13000.00),
(38, 'Encargado de trámites', 15000.00),
(39, 'Auxiliar administrativo', 11000.00),
(40, 'Administrador de sistemas', 20000.00),
(41, 'Soporte técnico', 14000.00),
(42, 'Programador', 18000.00),
(43, 'Analista de datos', 20000.00),
(44, 'Director general', 45000.00),
(45, 'Subgerente', 30000.00),
(46, 'Asistente ejecutivo', 18000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventaautos`
--

CREATE TABLE `ventaautos` (
  `id_venta` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_numserie` varchar(50) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_seguro` int(11) DEFAULT NULL,
  `descuento` decimal(5,2) DEFAULT NULL,
  `precio_final` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventaautos`
--

INSERT INTO `ventaautos` (`id_venta`, `fecha_venta`, `id_empleado`, `id_cliente`, `id_numserie`, `id_pago`, `id_seguro`, `descuento`, `precio_final`) VALUES
(21, '2023-01-25', 1, 1, 'XA92T7QK1P', 1, 1, 0.00, 875000.00),
(22, '2023-02-10', 5, 2, 'LM83Z9BD2C', 2, 2, 3.00, 679000.00),
(23, '2023-03-18', 1, 3, 'QF56P2VN7J', 3, 3, 1.00, 791100.00),
(24, '2023-04-07', 5, 4, 'BR29M6DA8X', 4, 4, 2.00, 512400.00),
(25, '2023-05-29', 1, 5, 'ZT75H1CW4E', 5, 5, 0.00, 465000.00),
(26, '2023-06-14', 5, 6, 'UF63B2QP9T', 6, 6, 4.00, 421600.00),
(27, '2023-07-22', 1, 7, 'RV19X7MG6J', 7, 7, 0.00, 890000.00),
(28, '2023-08-10', 5, 8, 'NJ82V4TX3H', 8, 8, 5.00, 759000.00),
(29, '2023-09-03', 1, 9, 'ME05C1RL8P', 9, 9, 0.00, 623000.00),
(30, '2023-10-27', 5, 10, 'PL64Y2KH3Z', 10, 10, 2.00, 439200.00),
(31, '2024-01-11', 1, 11, 'AF78R5LJ6U', 11, 11, 3.00, 871000.00),
(32, '2024-02-09', 5, 12, 'CQ23B7WX0L', 12, 12, 0.00, 599000.00),
(33, '2024-03-20', 1, 13, 'DH56F9ZT4V', 13, 13, 2.00, 684400.00),
(34, '2024-04-18', 5, 14, 'GB89N1MQ7E', 14, 14, 0.00, 722000.00),
(35, '2024-06-01', 1, 15, 'KR70W6HC9S', 15, 15, 5.00, 475000.00),
(36, '2024-07-14', 5, 16, 'LE83Z4NV1A', 16, 16, 0.00, 648000.00),
(37, '2024-08-25', 1, 17, 'MH47Y8QF5J', 17, 17, 3.00, 804000.00),
(38, '2025-02-12', 5, 18, 'NS52C3PX7R', 18, 18, 0.00, 915000.00),
(39, '2025-05-06', 1, 19, 'PW91V9JB2G', 19, 19, 1.00, 533700.00),
(40, '2025-09-17', 5, 20, 'QT28X4MD0Y', 20, 20, 0.00, 776000.00),
(43, '2025-11-26', 44, 18, 'DD48W6NZ0S', 11, 6, 999.99, 361200.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`id_numserie`),
  ADD KEY `id_tipo_auto` (`id_tipo_auto`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `idx_autos_modelo` (`id_modelo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_datos` (`id_datos`);

--
-- Indices de la tabla `datosgenerales`
--
ALTER TABLE `datosgenerales`
  ADD PRIMARY KEY (`id_datos`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`),
  ADD UNIQUE KEY `nombre_departamento` (`nombre_departamento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_tipo_empleado` (`id_tipo_empleado`),
  ADD KEY `id_datos` (`id_datos`),
  ADD KEY `idx_empleados_departamento` (`id_departamento`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `metodo`
--
ALTER TABLE `metodo`
  ADD PRIMARY KEY (`id_pago`),
  ADD UNIQUE KEY `tipo_pago` (`tipo_pago`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_modelo`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- Indices de la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id_seguro`);

--
-- Indices de la tabla `tipoauto`
--
ALTER TABLE `tipoauto`
  ADD PRIMARY KEY (`id_tipo_auto`);

--
-- Indices de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
  ADD PRIMARY KEY (`id_tipo_empleado`);

--
-- Indices de la tabla `ventaautos`
--
ALTER TABLE `ventaautos`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_numserie` (`id_numserie`),
  ADD KEY `id_pago` (`id_pago`),
  ADD KEY `id_seguro` (`id_seguro`),
  ADD KEY `idx_ventas_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `datosgenerales`
--
ALTER TABLE `datosgenerales`
  MODIFY `id_datos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `metodo`
--
ALTER TABLE `metodo`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `seguro`
--
ALTER TABLE `seguro`
  MODIFY `id_seguro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipoauto`
--
ALTER TABLE `tipoauto`
  MODIFY `id_tipo_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
  MODIFY `id_tipo_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `ventaautos`
--
ALTER TABLE `ventaautos`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autos`
--
ALTER TABLE `autos`
  ADD CONSTRAINT `autos_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `autos_ibfk_2` FOREIGN KEY (`id_tipo_auto`) REFERENCES `tipoauto` (`id_tipo_auto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `autos_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_datos`) REFERENCES `datosgenerales` (`id_datos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_tipo_empleado`) REFERENCES `tipoempleado` (`id_tipo_empleado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`id_datos`) REFERENCES `datosgenerales` (`id_datos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventaautos`
--
ALTER TABLE `ventaautos`
  ADD CONSTRAINT `ventaautos_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventaautos_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventaautos_ibfk_3` FOREIGN KEY (`id_numserie`) REFERENCES `autos` (`id_numserie`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventaautos_ibfk_4` FOREIGN KEY (`id_pago`) REFERENCES `metodo` (`id_pago`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventaautos_ibfk_5` FOREIGN KEY (`id_seguro`) REFERENCES `seguro` (`id_seguro`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
