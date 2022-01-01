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
-- Tabellenstruktur für Tabelle `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `recipient` text NOT NULL,
  `city` text NOT NULL,
  `street` text NOT NULL,
  `streetNumber` varchar(50) NOT NULL,
  `zipCode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `user_id`, `recipient`, `city`, `street`, `streetNumber`, `zipCode`) VALUES
(6, 1, 'test', 'test', 'test', 'test', 'test'),
(7, 3, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467'),
(8, 4, 'RicardoMilos', 'Konstanz', 'Schürmann- Horster- Weg', '8', '78467');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_delivery_addresses` (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD CONSTRAINT `FK_user_delivery_addresses` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
