-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 22, 2021 at 06:48 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobileshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
CREATE TABLE IF NOT EXISTS `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`id`, `name`, `image`, `description`, `price`) VALUES
(1, 'Samsung Galaxy S21', 'img/s21.jpg', 'Galaxy S21 nudi sve: 64 MP, najbrži čip i celodnevnu bateriju velikog kapaciteta. Uređaj ne dolazi sa punjačem.', 100.999),
(2, 'Apple iPhone 12', 'img/i11.jpg', 'iPhone 12, 6.1\" Super Retina XDR ekran od ivice do ivice, noćni režim na svakoj kameri, Ceramic Shield, novi A14 Bionic čip, najbrži čip do sada. ', 107.999);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`, `firstname`, `lastname`, `address`) VALUES
(1, 'admin', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'admin', 'admin', 'admin', '/'),
(2, 'mika', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'user', 'Mika', 'Mikic', 'Nemanjina 23'),
(3, 'pera', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'user', 'Pera', 'Peric', 'Kneza Lazara, 23'),
(4, 'stefan', 'eb0877843acc39f8ef6f7269937dee931c372d23', 'user', 'Stefan', 'Stefanovic', 'Nemanjina 77'),
(5, 'milos', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'user', 'Milos', 'Milosevic', 'Nemanjina 33');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
