-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 07. Nov 2021 um 23:22
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
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `describtion` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`id`, `titel`, `describtion`, `price`, `image`) VALUES
(7, 'Nike Air Max 97', 'Herrenschuh', 197.99, 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/1632439a-15ca-4213-842e-4e8b062a6c86/air-max-97-herrenschuh-CV3dl7.png'),
(1, 'Airforce', 'Damenschuh', 89.9, 'https://static.nike.com/a/images/t_prod_ss/w_640,c_limit,f_auto/b1f0f0de-35a3-4078-9dc4-27ea8e69385a/air-force-1-next-nature-brown-kelp-dc8744-301-%E2%80%93-erscheinungsdatum.jpg'),
(2, 'Airforce', 'Damenschuh', 89.9, 'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/016fe58c-cff9-42da-8545-1606cf326c10/custom-nike-air-force-1-low-cozi-custom-shoe.png'),
(3, 'Airforce', 'Damenschuh', 89.9, 'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/d9c61530-88e8-46c2-a3aa-fef1d49de7f7/air-force-1-experimental-herrenschuh-6VmxCl.png'),
(4, 'Nike Pegasus Trail 3', 'Damenschuh', 94.9, 'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/c3916202-2131-461b-8dd2-f6daebdea302/pegasus-trail-3-trail-laufschuh-fur-3BMMJx.png'),
(5, 'Air VaporMax 2021', 'Damenschuh', 140, 'https://www.snipes.com/dw/image/v2/BDCB_PRD/on/demandware.static/-/Sites-snse-master-eu/default/dwd8d5eaad/1929674_P.jpg?sw=780&sh=780&sm=fit&sfrm=png'),
(6, 'Air VaporMax 2021 FK', 'Damenschuh', 140, 'https://www.snipes.com/dw/image/v2/BDCB_PRD/on/demandware.static/-/Sites-snse-master-eu/default/dw8b970589/1929690_P.jpg?sw=780&sh=780&sm=fit&sfrm=png');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
