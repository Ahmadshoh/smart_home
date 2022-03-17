-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Mrz 2022 um 11:31
-- Server-Version: 10.4.18-MariaDB
-- PHP-Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `smarthome`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wetterwerte`
--

CREATE TABLE `wetterwerte` (
  `id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `temperatur` double NOT NULL,
  `humidity` double NOT NULL,
  `druck` double NOT NULL,
  `sender_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `wetterwerte`
--

INSERT INTO `wetterwerte` (`id`, `datetime`, `temperatur`, `humidity`, `druck`, `sender_ip`) VALUES
(2, '2022-03-17 11:20:59', 21, 78, 1013, '192.1.23.43'),
(3, '2022-03-17 11:21:02', 21, 78, 1013, '192.1.23.43'),
(4, '2022-03-17 11:21:05', 21, 78, 1013, '192.1.23.43'),
(5, '2022-03-17 11:21:08', 21, 78, 1013, '192.1.23.43'),
(6, '2022-03-17 11:21:11', 21, 78, 1013, '192.1.23.43'),
(7, '2022-03-17 11:22:21', 21, 78, 1013, '192.1.23.43');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `wetterwerte`
--
ALTER TABLE `wetterwerte`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `wetterwerte`
--
ALTER TABLE `wetterwerte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
