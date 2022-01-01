-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Erstellungszeit: 15. Nov 2021 um 15:18
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `shop`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_products`
--

CREATE TABLE `order_products` (
  `id` int(10) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `amount` int(10) NOT NULL,
  `price` double NOT NULL,
  `taxInPercent` double NOT NULL,
  `orderId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order_products`
--

INSERT INTO `order_products` (`id`, `titel`, `amount`, `price`, `taxInPercent`, `orderId`) VALUES
(33, 'Test product 1', 1, 4.04, 19, 99),
(34, 'Test product 2', 1, 4.85, 19, 99),
(35, 'Test product 3', 1, 8.09, 19, 99),
(36, 'Test product 4', 1, 8.55, 19, 99),
(37, 'Test product 1', 1, 4.04, 19, 100),
(38, 'Test product 2', 1, 4.85, 19, 101),
(39, 'Test product 3', 1, 8.09, 19, 101);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orders_to_oder_products` (`orderId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `FK_orders_to_oder_products` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
