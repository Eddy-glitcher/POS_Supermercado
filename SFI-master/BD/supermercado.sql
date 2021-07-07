-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2021 a las 05:55:44
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `supermercado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Cli_Id` int(10) UNSIGNED NOT NULL,
  `Cli_Nombre` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `Cli_Apellido` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `Cli_FechaNaci` date NOT NULL,
  `Cli_Identificacion` int(10) UNSIGNED NOT NULL,
  `Cli_Sexo` varchar(10) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Cli_Id`, `Cli_Nombre`, `Cli_Apellido`, `Cli_FechaNaci`, `Cli_Identificacion`, `Cli_Sexo`) VALUES
(1, 'Ricardo Artuto', 'Torres', '2021-07-13', 121213787, 'Masculino'),
(2, 'Paula Marcela ', 'Castrillon', '2021-07-04', 1024553222, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Prod_Id` int(10) UNSIGNED NOT NULL,
  `Prod_Nombre` varchar(120) COLLATE utf32_spanish2_ci NOT NULL,
  `Prod_Marca` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `Prod_Precio` int(10) UNSIGNED NOT NULL,
  `Prod_Stock` int(11) NOT NULL,
  `Prod_ProvedorId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Prod_Id`, `Prod_Nombre`, `Prod_Marca`, `Prod_Precio`, `Prod_Stock`, `Prod_ProvedorId`) VALUES
(1, 'Gaseosa ', 'cocaCola', 143239, 34, 2),
(2, 'yogurth', 'Alpina', 3800, 450, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Prov_Id` int(10) UNSIGNED NOT NULL,
  `Prov_Nombre` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `Prov_Telefono` mediumint(9) NOT NULL,
  `Prov_Email` varchar(80) COLLATE utf32_spanish2_ci NOT NULL,
  `Prov_Procedencia` varchar(50) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`Prov_Id`, `Prov_Nombre`, `Prov_Telefono`, `Prov_Email`, `Prov_Procedencia`) VALUES
(1, 'Comercializadoras SaS', 2312435, 'providersSasa@hotmail.com', 'mexico'),
(2, 'CEcommersCol', 3242323, 'commerceCol@hotmail.com', 'colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Usu_Id` int(50) UNSIGNED NOT NULL,
  `Usu_Nombre` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `Usu_Email` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `Usu_Contraseña` varchar(50) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Usu_Id`, `Usu_Nombre`, `Usu_Email`, `Usu_Contraseña`) VALUES
(1, 'cristian ', 'cristian@hotmail.com', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ven_cli`
--

CREATE TABLE `ven_cli` (
  `VenCli_CliFk` int(10) UNSIGNED NOT NULL,
  `VenCli_ProdFk` int(10) UNSIGNED NOT NULL,
  `VenCli_Fecha` date NOT NULL,
  `VenCli_Hora` time NOT NULL,
  `VenCli_Cantidad` int(10) UNSIGNED NOT NULL,
  `VenCli_Subtotal` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `ven_cli`
--

INSERT INTO `ven_cli` (`VenCli_CliFk`, `VenCli_ProdFk`, `VenCli_Fecha`, `VenCli_Hora`, `VenCli_Cantidad`, `VenCli_Subtotal`) VALUES
(1, 1, '2021-07-12', '06:24:26', 2, 6000),
(1, 1, '2021-07-12', '06:24:26', 2, 6000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Cli_Id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Prod_Id`),
  ADD KEY `Prod_ProvedorId` (`Prod_ProvedorId`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Prov_Id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Usu_Id`),
  ADD UNIQUE KEY `Usu_Email` (`Usu_Email`);

--
-- Indices de la tabla `ven_cli`
--
ALTER TABLE `ven_cli`
  ADD KEY `VenCli_CliFk` (`VenCli_CliFk`),
  ADD KEY `VenCli_ProdFk` (`VenCli_ProdFk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Cli_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Prod_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Prov_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Usu_Id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Prod_ProvedorId`) REFERENCES `proveedores` (`Prov_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ven_cli`
--
ALTER TABLE `ven_cli`
  ADD CONSTRAINT `ven_cli_ibfk_1` FOREIGN KEY (`VenCli_CliFk`) REFERENCES `clientes` (`Cli_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ven_cli_ibfk_2` FOREIGN KEY (`VenCli_ProdFk`) REFERENCES `productos` (`Prod_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
