-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 23. 09:29
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `pc`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `parts`
--

CREATE DATABASE IF NOT EXISTS `pc`;
USE `pc`;

CREATE TABLE `parts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `parts`
--

INSERT INTO `parts` (`id`, `name`) VALUES
(1, 'Intel Core i5-12400F'),
(2, 'NVIDIA GeForce RTX 3050'),
(3, '16 GB DDR5 5200 MHz'),
(4, '500GB NVMe M.2 SSD'),
(5, '650W Gold'),
(6, 'B760 Motherboard');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pcs`
--

CREATE TABLE `pcs` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `pcs`
--

INSERT INTO `pcs` (`id`) VALUES
(1),
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pc_part_relations`
--

CREATE TABLE `pc_part_relations` (
  `pc_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `pc_part_relations`
--

INSERT INTO `pc_part_relations` (`pc_id`, `part_id`, `amount`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pc_soft_relations`
--

CREATE TABLE `pc_soft_relations` (
  `pc_id` int(11) DEFAULT NULL,
  `soft_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `pc_soft_relations`
--

INSERT INTO `pc_soft_relations` (`pc_id`, `soft_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pc_user_relations`
--

CREATE TABLE `pc_user_relations` (
  `pc_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `pc_user_relations`
--

INSERT INTO `pc_user_relations` (`pc_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `softwares`
--

CREATE TABLE `softwares` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `softwares`
--

INSERT INTO `softwares` (`id`, `name`) VALUES
(1, 'Premiere Pro'),
(2, 'Office 2019'),
(3, 'Photoshop 2020'),
(4, 'Oracle Database 23'),
(5, 'Visual Studio 22 Professional');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`) VALUES
(1, 'András'),
(2, 'Márk'),
(3, 'Ferenc'),
(4, 'Ádám'),
(5, 'Roland');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `pcs`
--
ALTER TABLE `pcs`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `pc_part_relations`
--
ALTER TABLE `pc_part_relations`
  ADD KEY `pc_id` (`pc_id`),
  ADD KEY `part_id` (`part_id`);

--
-- A tábla indexei `pc_soft_relations`
--
ALTER TABLE `pc_soft_relations`
  ADD KEY `pc_id` (`pc_id`),
  ADD KEY `soft_id` (`soft_id`);

--
-- A tábla indexei `pc_user_relations`
--
ALTER TABLE `pc_user_relations`
  ADD KEY `pc_id` (`pc_id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `softwares`
--
ALTER TABLE `softwares`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `pcs`
--
ALTER TABLE `pcs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `softwares`
--
ALTER TABLE `softwares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `pc_part_relations`
--
ALTER TABLE `pc_part_relations`
  ADD CONSTRAINT `pc_part_relations_ibfk_1` FOREIGN KEY (`pc_id`) REFERENCES `pcs` (`id`),
  ADD CONSTRAINT `pc_part_relations_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`);

--
-- Megkötések a táblához `pc_soft_relations`
--
ALTER TABLE `pc_soft_relations`
  ADD CONSTRAINT `pc_soft_relations_ibfk_1` FOREIGN KEY (`pc_id`) REFERENCES `pcs` (`id`),
  ADD CONSTRAINT `pc_soft_relations_ibfk_2` FOREIGN KEY (`soft_id`) REFERENCES `softwares` (`id`);

--
-- Megkötések a táblához `pc_user_relations`
--
ALTER TABLE `pc_user_relations`
  ADD CONSTRAINT `pc_user_relations_ibfk_1` FOREIGN KEY (`pc_id`) REFERENCES `pcs` (`id`),
  ADD CONSTRAINT `pc_user_relations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
