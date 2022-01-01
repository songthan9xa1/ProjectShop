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
-- Tabellenstruktur für Tabelle `order_address`
--

CREATE TABLE `order_address` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `recipient` text NOT NULL,
  `city` text NOT NULL,
  `street` text NOT NULL,
  `streetNumber` varchar(50) NOT NULL,
  `zipCode` varchar(50) NOT NULL,
  `type` enum('delivery','invoice','both') NOT NULL DEFAULT 'both'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order_address`
--

INSERT INTO `order_address` (`id`, `order_id`, `recipient`, `city`, `street`, `streetNumber`, `zipCode`, `type`) VALUES
(21, 98, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467', 'both'),
(22, 99, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467', 'both'),
(23, 100, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467', 'both'),
(24, 101, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467', 'both');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `order_address`
--
ALTER TABLE `order_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ORDER_ADDRESS` (`order_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `order_address`
--
ALTER TABLE `order_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `order_address`
--
ALTER TABLE `order_address`
  ADD CONSTRAINT `FK_ORDER_ADDRESS` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
