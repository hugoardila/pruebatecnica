-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2022 a las 23:47:33
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebasinergia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`) VALUES
(1, 'huila'),
(2, 'tolima'),
(3, 'Cauca'),
(4, 'Valle'),
(5, 'Nariño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`) VALUES
(1, 'Masculino'),
(2, 'femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` int(11) NOT NULL,
  `dpto_id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `dpto_id`, `nombre`) VALUES
(1, 1, 'pitalito'),
(2, 1, 'neiva'),
(3, 3, 'popayan'),
(4, 3, 'quilichao'),
(5, 5, 'pasto'),
(6, 5, 'tuquerres'),
(7, 2, 'ibague'),
(8, 2, 'honda'),
(9, 4, 'Cali'),
(10, 4, 'Buga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  `numero_documento` varchar(30) NOT NULL,
  `nombre1` varchar(30) NOT NULL,
  `nombre2` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `genero_id` int(11) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `municipio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id`, `tipo_documento_id`, `numero_documento`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `genero_id`, `departamento_id`, `municipio_id`) VALUES
(1, 1, '1083903212', 'HUGO', 'ALBERTO', 'ARDILA', 'MOLINA', 1, 1, 1),
(2, 2, '107454154', 'MARIA', 'PILAR', 'MORENO', 'MONCAYO', 2, 3, 9),
(3, 1, '5482425878', 'CARLOS', 'ANDRES', 'VERA', 'CARRILLO', 2, 1, 2),
(4, 2, '548181841', 'FERNANDA', 'MARIA', 'MOYA', 'MAZO', 2, 5, 5),
(5, 1, '51561557', 'MANUEL', 'TEODORO', 'MOLANO', 'MELLO', 1, 3, 10),
(6, 1, '58189152', 'KARLA', 'FERNANDA', 'BURBANO', 'MENESES', 2, 5, 6),
(7, 2, '9981884', 'ANDRES', 'FELIPE', 'MORENO', 'DUQUE', 1, 2, 8),
(8, 1, '452421', 'FERNANDO', 'ANTONIO', 'LOTERO', 'PRADA', 1, 4, 10),
(9, 2, '518188', 'ESTEBAN', 'FARID', 'MELO', 'MOLANO', 1, 1, 2),
(10, 1, '5181558', 'MICHAEL', 'FRANCISCO', 'MUÑOZ', 'ROJAS', 1, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documentos`
--

CREATE TABLE `tipos_documentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipos_documentos`
--

INSERT INTO `tipos_documentos` (`id`, `nombre`) VALUES
(1, 'CEDULA CIUDADANIA'),
(2, 'TARJETA IDENTIDAD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`usuario`, `password`) VALUES
('administrador', '1234567890');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dpto` (`dpto_id`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipodoc` (`tipo_documento_id`),
  ADD KEY `fk_dpto1` (`departamento_id`),
  ADD KEY `fk_mpio` (`municipio_id`),
  ADD KEY `fk_genero` (`genero_id`);

--
-- Indices de la tabla `tipos_documentos`
--
ALTER TABLE `tipos_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_dpto` FOREIGN KEY (`dpto_id`) REFERENCES `departamentos` (`id`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `fk_dpto1` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  ADD CONSTRAINT `fk_genero` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `fk_mpio` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`),
  ADD CONSTRAINT `fk_tipodoc` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipos_documentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
