-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Гру 13 2020 р., 14:37
-- Версія сервера: 10.4.14-MariaDB
-- Версія PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `futinfo`
--

-- --------------------------------------------------------

--
-- Структура таблиці `awards`
--

CREATE TABLE `awards` (
  `Nameavards` varchar(200) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `awards`
--

INSERT INTO `awards` (`Nameavards`, `data`) VALUES
('Золотий м\'яч', '2015-12-25'),
('Кубок ліги європи', '2012-05-30'),
('Кубок УЄФА', '2017-06-22'),
('футболіст року', '2020-12-26'),
('Футболіст сезону', '2019-08-24');

-- --------------------------------------------------------

--
-- Структура таблиці `coach`
--

CREATE TABLE `coach` (
  `IDcoach` int(11) NOT NULL,
  `Namecoach` varchar(200) NOT NULL,
  `Data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `coach`
--

INSERT INTO `coach` (`IDcoach`, `Namecoach`, `Data`) VALUES
(20, 'Кондратюк Степан Сергійович', '1970-05-10'),
(21, 'Михайленко Роман Андрійович', '1968-12-28'),
(22, 'Степанюк Вадим Романович', '1975-05-30'),
(23, 'Шишко Сергій Іванович', '1970-05-10');

-- --------------------------------------------------------

--
-- Структура таблиці `futclub`
--

CREATE TABLE `futclub` (
  `IDfutclub` int(11) NOT NULL,
  `Clubname` varchar(200) NOT NULL,
  `Country` varchar(200) NOT NULL,
  `IDcoach` int(11) NOT NULL,
  `Nameavards` varchar(200) NOT NULL,
  `IDleague` int(11) NOT NULL,
  `kilk_player` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `futclub`
--

INSERT INTO `futclub` (`IDfutclub`, `Clubname`, `Country`, `IDcoach`, `Nameavards`, `IDleague`, `kilk_player`) VALUES
(40, 'Реал Мадрид', 'Іспанія', 20, 'Кубок УЄФА', 34, 2),
(41, 'ФК \"Ювентус\"', 'Італія', 21, 'Кубок ліги європи', 33, 3),
(42, 'Динамо Київив', 'Україна', 22, 'Кубок ліги європи', 31, 3),
(43, 'ФК \"Барселона\"', 'Іспанія', 23, 'Кубок ліги європи', 32, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `league`
--

CREATE TABLE `league` (
  `IDleague` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `league`
--

INSERT INTO `league` (`IDleague`, `Name`) VALUES
(31, 'Аматорський чемпіонат'),
(32, 'Друга ліга'),
(33, 'Перша ліга'),
(34, 'Прем\'єр-ліга');

-- --------------------------------------------------------

--
-- Структура таблиці `players`
--

CREATE TABLE `players` (
  `PlayersID` int(11) NOT NULL,
  `PlayerName` varchar(200) NOT NULL,
  `Number` int(11) NOT NULL,
  `IDfutclub` int(11) NOT NULL,
  `Nameavards` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `players`
--

INSERT INTO `players` (`PlayersID`, `PlayerName`, `Number`, `IDfutclub`, `Nameavards`) VALUES
(1, 'Романенко Степан Іванович', 45, 42, 'Футболіст сезону'),
(2, 'Поліщук Степан Іванович', 88, 43, 'Золотий м\'яч'),
(3, 'Каменюк Іван Михайлович', 70, 41, 'футболіст року'),
(4, 'Колос Михайло Васильович', 4, 40, 'Футболіст сезону'),
(5, 'Бабій Роман Ігорович', 7, 40, 'Футболіст сезону'),
(6, 'Дубінський Володимир Володимирович', 12, 41, 'Золотий м\'яч'),
(7, 'Поліщук Сергій віталійович', 50, 42, 'Футболіст сезону'),
(8, 'Каменюк Дмитро Володимирович', 64, 41, 'футболіст року'),
(9, 'Шуляк Іван Олександрович', 20, 42, 'Золотий м\'яч'),
(10, 'Конон Микола Миколайович', 43, 43, 'футболіст року');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`Nameavards`);

--
-- Індекси таблиці `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`IDcoach`);

--
-- Індекси таблиці `futclub`
--
ALTER TABLE `futclub`
  ADD PRIMARY KEY (`IDfutclub`),
  ADD KEY `IDfutclub` (`IDfutclub`),
  ADD KEY `IDcoach` (`IDcoach`),
  ADD KEY `Nameavards` (`Nameavards`),
  ADD KEY `IDleague` (`IDleague`);

--
-- Індекси таблиці `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`IDleague`);

--
-- Індекси таблиці `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`PlayersID`),
  ADD KEY `IDfutclub` (`IDfutclub`),
  ADD KEY `PlayersID` (`PlayersID`),
  ADD KEY `Nameavards` (`Nameavards`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `coach`
--
ALTER TABLE `coach`
  MODIFY `IDcoach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблиці `futclub`
--
ALTER TABLE `futclub`
  MODIFY `IDfutclub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT для таблиці `league`
--
ALTER TABLE `league`
  MODIFY `IDleague` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблиці `players`
--
ALTER TABLE `players`
  MODIFY `PlayersID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `futclub`
--
ALTER TABLE `futclub`
  ADD CONSTRAINT `futclub_ibfk_1` FOREIGN KEY (`IDcoach`) REFERENCES `coach` (`IDcoach`),
  ADD CONSTRAINT `futclub_ibfk_2` FOREIGN KEY (`Nameavards`) REFERENCES `awards` (`Nameavards`),
  ADD CONSTRAINT `futclub_ibfk_3` FOREIGN KEY (`IDleague`) REFERENCES `league` (`IDleague`);

--
-- Обмеження зовнішнього ключа таблиці `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`IDfutclub`) REFERENCES `futclub` (`IDfutclub`),
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`Nameavards`) REFERENCES `awards` (`Nameavards`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
