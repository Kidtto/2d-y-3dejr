-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-08-2023 a las 16:29:10
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `yates`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accessories`
--

CREATE TABLE `accessories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `information` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `accessories`
--

INSERT INTO `accessories` (`id`, `name`, `information`, `price`, `stock`, `photo`) VALUES
(1, 'Porta vasos', 'es un porta vasos xD', 23, 3, 'public/images/a1.jpg'),
(2, 'gorro de capitan', 'es un gorro xD', 45, 5, 'public/images/a2.jpg'),
(3, 'brujula', 'brujula maritima', 89, 3, 'public/images/a3.jpg'),
(4, 'tuvo', 'es solo un tuvo xD', 24, 9, 'public/images/a4.jpg'),
(5, 'embudo', 'embudo de botes', 43, 9, 'public/images/a5.jpg'),
(6, 'antichoques', 'para cuando seas pendejo xD', 120, 15, 'public/images/a6.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Lürssen'),
(2, 'Amels'),
(3, 'Feadship'),
(4, 'Oceanco'),
(5, 'Nobiskrug'),
(6, 'Benetti');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mechanics`
--

CREATE TABLE `mechanics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_specialty` int(11) NOT NULL,
  `id_sedes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payment_method`
--

INSERT INTO `payment_method` (`id`, `method`) VALUES
(1, 'cash'),
(2, 'card');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotes`
--

CREATE TABLE `quotes` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `hour` time NOT NULL,
  `id_mechanics` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_services` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE `rols` (
  `id` int(11) NOT NULL,
  `rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rols`
--

INSERT INTO `rols` (`id`, `rol`) VALUES
(1, 'standard'),
(2, 'Administraitor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_accessories`
--

CREATE TABLE `sales_accessories` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_payment_method` int(11) NOT NULL,
  `id_accessories` int(11) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id` int(11) NOT NULL,
  `sede` varchar(255) NOT NULL,
  `direction` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id`, `sede`, `direction`) VALUES
(1, 'main', 'cll 170 kra 13 A 45 norte'),
(2, 'secondary', 'calle 45 cra 10 75 - 11b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `service`) VALUES
(1, 'revision'),
(2, 'paint');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialty`
--

CREATE TABLE `specialty` (
  `id` int(11) NOT NULL,
  `specialty` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `specialty`
--

INSERT INTO `specialty` (`id`, `specialty`) VALUES
(1, 'general'),
(2, 'paint'),
(3, 'electronics');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_documents`
--

CREATE TABLE `type_documents` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `type_documents`
--

INSERT INTO `type_documents` (`id`, `type`) VALUES
(1, 'T.I'),
(2, 'C.C'),
(3, 'C.E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `document` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_type_documents` int(11) NOT NULL,
  `id_rols` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `document`, `email`, `password`, `id_type_documents`, `id_rols`) VALUES
(1, 'admin', 123, 'admin@gmail.com', 'admin123', 2, 2),
(38, '', 0, 'admin@gmail.com', 'admin123', 1, 1),
(39, 'Certificaciones', 123, 'asdasd@example.com', 'asdasd123', 1, 1),
(40, 'Certificaciones', 123, 'asdasd@example.com', 'asdasd123', 1, 1),
(41, 'Certificaciones', 123, 'asdasd@example.com', 'asdasd123', 1, 1),
(42, 'milton', 123, 'milton@gmail.com', 'aswd', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `yachts`
--

CREATE TABLE `yachts` (
  `id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `information` varchar(255) NOT NULL,
  `serie` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_brands` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `yachts`
--

INSERT INTO `yachts` (`id`, `model`, `price`, `information`, `serie`, `photo`, `id_users`, `id_brands`) VALUES
(1, 'modelo1', 12000, 'informacion', 1, 'public/images/p1.jpg', 1, 1),
(2, 'modelo2', 12000, 'asd', 12, 'public/images/p2.jpg', 1, 2),
(3, 'modelo3', 12000, 'informacion', 123, 'public/images/p3.jpg', 1, 1),
(4, 'modelo4', 12000, 'información', 1234, 'public/images/p4.jpg', 1, 3),
(5, 'modelo5', 12000, 'información', 11234, 'public/images/p5.jpg', 1, 5),
(6, 'modelo6', 12000, 'informacion', 123456, 'public/images/p6.jpg', 1, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_specialty` (`id_specialty`,`id_sedes`) USING BTREE;

--
-- Indices de la tabla `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`,`id_services`),
  ADD KEY `quotes_ibfk_1` (`id_services`),
  ADD KEY `quotes_ibfk_3` (`id_mechanics`);

--
-- Indices de la tabla `rols`
--
ALTER TABLE `rols`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales_accessories`
--
ALTER TABLE `sales_accessories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_payment_method` (`id_payment_method`,`id_accessories`,`id_users`),
  ADD KEY `sales_accessories_ibfk_2` (`id_accessories`),
  ADD KEY `sales_accessories_ibfk_3` (`id_users`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `specialty`
--
ALTER TABLE `specialty`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `type_documents`
--
ALTER TABLE `type_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_documents` (`id_type_documents`,`id_rols`),
  ADD KEY `id_rols` (`id_rols`);

--
-- Indices de la tabla `yachts`
--
ALTER TABLE `yachts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`,`id_brands`),
  ADD KEY `yachts_ibfk_2` (`id_brands`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mechanics`
--
ALTER TABLE `mechanics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales_accessories`
--
ALTER TABLE `sales_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `specialty`
--
ALTER TABLE `specialty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `type_documents`
--
ALTER TABLE `type_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `yachts`
--
ALTER TABLE `yachts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mechanics`
--
ALTER TABLE `mechanics`
  ADD CONSTRAINT `mechanics_ibfk_1` FOREIGN KEY (`id_specialty`) REFERENCES `specialty` (`id`);

--
-- Filtros para la tabla `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_ibfk_1` FOREIGN KEY (`id_services`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `quotes_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quotes_ibfk_3` FOREIGN KEY (`id_mechanics`) REFERENCES `mechanics` (`id`);

--
-- Filtros para la tabla `sales_accessories`
--
ALTER TABLE `sales_accessories`
  ADD CONSTRAINT `sales_accessories_ibfk_1` FOREIGN KEY (`id_payment_method`) REFERENCES `payment_method` (`id`),
  ADD CONSTRAINT `sales_accessories_ibfk_2` FOREIGN KEY (`id_accessories`) REFERENCES `accessories` (`id`),
  ADD CONSTRAINT `sales_accessories_ibfk_3` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_rols`) REFERENCES `rols` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_type_documents`) REFERENCES `type_documents` (`id`);

--
-- Filtros para la tabla `yachts`
--
ALTER TABLE `yachts`
  ADD CONSTRAINT `yachts_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `yachts_ibfk_2` FOREIGN KEY (`id_brands`) REFERENCES `brands` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
