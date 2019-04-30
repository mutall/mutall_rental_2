-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 12, 2019 at 03:15 PM
-- Server version: 10.2.22-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mutallco_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjustment`
--

CREATE TABLE `adjustment` (
  `adjustment` int(10) NOT NULL,
  `posted_item` int(10) DEFAULT NULL,
  `client` int(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adjustment`
--

INSERT INTO `adjustment` (`adjustment`, `posted_item`, `client`, `description`, `date`, `debit`, `credit`) VALUES
(1, NULL, 2, 'rent', '2018-08-14', 1234, NULL),
(2, NULL, 5, 'security', '2018-08-14', NULL, 2345),
(3, NULL, 26, 'upoiu', '2018-08-22', 3456, NULL),
(4, NULL, 2, 'Late recoring of water payment', '2018-08-01', 200, NULL),
(5, NULL, 1, 'jud', '2018-08-22', 3456, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agreement`
--

CREATE TABLE `agreement` (
  `agreement` int(10) NOT NULL,
  `room` int(10) DEFAULT NULL,
  `client` int(10) DEFAULT NULL,
  `rent` double DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `duration` int(5) DEFAULT NULL,
  `review` int(5) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `terminated` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agreement`
--

INSERT INTO `agreement` (`agreement`, `room`, `client`, `rent`, `rate`, `start_date`, `duration`, `review`, `end_date`, `terminated`) VALUES
(1, 24, 1, 9500, NULL, NULL, 5, NULL, NULL, 0),
(2, 5, 2, 3000, NULL, NULL, 5, NULL, NULL, 0),
(3, 6, 2, 47880, NULL, NULL, 5, NULL, NULL, 0),
(4, 31, 2, 0, NULL, NULL, 5, NULL, NULL, 0),
(5, 32, 2, 0, NULL, NULL, 5, NULL, NULL, 0),
(6, 33, 2, 5000, NULL, NULL, 5, NULL, NULL, 0),
(7, 34, 2, 5000, NULL, NULL, 5, NULL, NULL, 0),
(8, 35, 2, 5000, NULL, NULL, 5, NULL, NULL, 0),
(9, 36, 2, 5000, NULL, NULL, 5, NULL, NULL, 0),
(10, 37, 2, 5000, NULL, NULL, 5, NULL, NULL, 0),
(11, 38, 2, 5000, NULL, NULL, 5, NULL, NULL, 0),
(12, 39, 2, 11250, NULL, NULL, 5, NULL, NULL, 0),
(13, 4, 3, 140000, NULL, NULL, 5, NULL, NULL, 0),
(14, 2, 3, 0, NULL, NULL, 5, NULL, NULL, 0),
(15, 26, 4, 12000, NULL, NULL, 5, NULL, NULL, 0),
(16, 23, 4, 0, NULL, NULL, 5, NULL, NULL, 0),
(17, 25, 6, 20000, NULL, '2015-04-01', 5, NULL, NULL, 0),
(18, 17, 8, 20000, NULL, NULL, 5, NULL, NULL, 0),
(19, 3, 10, 0, NULL, NULL, 5, NULL, NULL, 0),
(20, 22, 11, 22000, NULL, NULL, 5, NULL, NULL, 0),
(21, 19, 13, 20000, NULL, NULL, 5, NULL, NULL, 0),
(22, 28, 18, 20000, NULL, NULL, 5, NULL, NULL, 0),
(23, 27, 14, 20000, NULL, '2017-05-01', 5, NULL, NULL, 0),
(24, 13, 16, 22000, NULL, NULL, 5, NULL, NULL, 0),
(25, 21, 15, 20000, NULL, '2015-05-01', 5, NULL, NULL, 0),
(26, 10, 19, 45000, NULL, NULL, 5, NULL, NULL, 0),
(27, 8, 30, NULL, NULL, NULL, 5, NULL, NULL, 0),
(28, 40, 20, NULL, NULL, '2017-12-01', 5, NULL, NULL, 0),
(29, 20, 29, NULL, NULL, '2018-06-01', 5, NULL, NULL, 0),
(33, 8, 32, NULL, NULL, '2018-06-01', NULL, NULL, NULL, 0),
(34, 17, 22, NULL, NULL, '2017-01-01', 5, NULL, NULL, 0),
(35, 16, 25, NULL, NULL, '2017-05-01', 5, NULL, NULL, 0),
(36, 48, 26, NULL, NULL, '2018-03-01', 5, NULL, NULL, 0),
(37, 9, 28, NULL, NULL, '2018-02-01', 5, NULL, NULL, 0),
(38, 39, 9, NULL, NULL, NULL, 5, NULL, NULL, 0),
(39, 19, 7, NULL, NULL, '2017-05-01', 5, NULL, NULL, 0),
(40, 47, 31, NULL, NULL, '2018-02-01', 5, NULL, NULL, 0),
(42, 16, 24, NULL, NULL, '2017-05-01', 5, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `balance_initial`
--

CREATE TABLE `balance_initial` (
  `balance_initial` int(10) NOT NULL,
  `posted_item` int(10) DEFAULT NULL,
  `client` int(10) NOT NULL,
  `date` date NOT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance_initial`
--

INSERT INTO `balance_initial` (`balance_initial`, `posted_item`, `client`, `date`, `debit`, `credit`) VALUES
(3, NULL, 2, '2018-06-18', 42582, NULL),
(4, NULL, 19, '2018-06-18', 3200, NULL),
(5, NULL, 6, '2018-06-18', 65250, NULL),
(6, NULL, 14, '2018-06-18', 65250, NULL),
(9, NULL, 11, '2018-06-18', 350100, NULL),
(11, NULL, 22, '2018-06-18', 216500, NULL),
(14, NULL, 25, '2018-06-18', 105000, NULL),
(15, NULL, 7, '2018-06-18', 59250, NULL),
(16, NULL, 26, '2018-06-18', 58650, NULL),
(20, NULL, 9, '2018-06-18', 2463, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `business` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ceo` varchar(255) DEFAULT NULL,
  `consumption` double DEFAULT NULL,
  `rent` double DEFAULT NULL,
  `water_cost` double DEFAULT NULL,
  `is_current` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`business`, `name`, `ceo`, `consumption`, `rent`, `water_cost`, `is_current`) VALUES
(1, 'MUTALL INVESTIMENT CO. LTD', 'PETER MURAYA', 1, 50, 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client` int(10) NOT NULL,
  `uid` int(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `starting_month` int(5) DEFAULT NULL,
  `valid` int(1) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `service` double DEFAULT NULL,
  `security` double DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client`, `uid`, `name`, `title`, `starting_month`, `valid`, `contact`, `phone`, `address`, `service`, `security`, `email`, `source`) VALUES
(1, 1, '4th', '4th generation Capital Kenya Limited', 8, 1, 'ASHLEY', 'O712 384 729', '4916-00100,Kiserian', 250, 1300, NULL, NULL),
(2, 2, 'chicjoint', 'Chic Joint bar', 8, 1, 'KEN KIMANI', 'O722 722 678', '57513-00200,Nairobi', 1500, 3500, NULL, NULL),
(3, 3, 'deekos', 'Deekos bakery', 8, 1, 'MUREITHI WAMBUGU', 'O721 728 360', NULL, 0, 0, NULL, NULL),
(4, 4, 'geocad', 'Geocad investment Copany Liited', 8, 1, 'HUBERT', 'O722 215 731', '696-00206, Kiserian', 0, 0, NULL, NULL),
(5, 5, 'ipa', 'IPA Laboratories Limited(Kulisha Vyema)', 8, 1, 'PETER KAMAU', 'O723 377 074', '49582-00100,Nairobi', 250, 1300, NULL, NULL),
(6, 6, 'kaakua', 'Riees Kaakua', 8, 1, 'PETER KAAKUA', 'O722 879 127', NULL, 250, 1300, NULL, NULL),
(7, 7, 'kajiado', 'Kajiado college', 5, 1, 'YUSUF', NULL, NULL, 250, 1300, NULL, NULL),
(8, 8, 'kashanga', 'Kashanga properties', 8, 0, 'TITUS SAITOTI', 'O721 914 565', NULL, 250, 1300, NULL, NULL),
(9, 9, 'kinyozi', 'A Proudly Kenyan Investment', 8, 1, 'LILIAN MUNGAI', 'O722 350 361', '108-00206,Kiserian', 250, 1300, NULL, NULL),
(10, 10, 'lovinah', 'Lovinah beauty shop', NULL, 0, NULL, NULL, NULL, 250, 1300, NULL, NULL),
(11, 11, 'masabi', 'Masabi Ranch', 8, 1, 'DENNIS', 'O715 139 579', NULL, 250, 1300, NULL, NULL),
(12, 12, 'misatis', 'Misatis Restaurant', NULL, 0, NULL, NULL, NULL, 250, 1300, NULL, NULL),
(13, 13, 'mwamba', 'Mwamba properties', 8, 0, 'NOAH', '0724 907 442 ', NULL, 250, 1300, NULL, NULL),
(14, 14, 'oigilai', 'Oigilai Contructors', 8, 1, 'ISAAC LEBOI', 'O720 888 511', NULL, 250, 1300, NULL, NULL),
(15, 15, 'sidai', 'Sidai(J.Ondari &Advocates)', 8, 1, 'ELIZABETH', 'O720 420 073', NULL, 250, 1300, NULL, NULL),
(16, 16, 'oreteti', 'Oreteti properties', 8, 0, 'RICHARD KIRISIA', 'O712 390 301', NULL, 250, 1300, NULL, NULL),
(17, 17, 'rekk', 'Rekk enterprises (K) Ltd', 8, 0, 'ELLAH KANGETHE', NULL, '224-00205,Kiserian', 250, 1900, NULL, NULL),
(18, 18, 'naikuni', 'Naikuni(Reto Works Ltd)', 2, 1, 'DANIEL SINKIRA', '0722 616 983', '345-00206, Kiserian', 250, 1300, NULL, NULL),
(19, 19, 'ukristo', 'Ukristo and Ufanisi Sacco ltd', 8, 1, 'BORNIFACE', 'O722 758 079', '872-00605,Nairobi', 250, 1300, NULL, NULL),
(20, 20, 'co-op', 'Co-operative Bank Of Kenya', 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 27, 'simaloy', 'Simaloy company Advocates', 1, 1, NULL, NULL, NULL, 250, NULL, NULL, NULL),
(23, 21, 'kecobat', 'Kecobat', 2, 1, NULL, NULL, NULL, 250, NULL, NULL, NULL),
(24, 23, 'plotec', 'Plotec Limited', 6, 1, NULL, NULL, NULL, 250, 1300, NULL, NULL),
(25, 24, 'vane ', 'Vane Kwamboka & Co Advocate', 7, 1, NULL, NULL, NULL, 250, 1300, NULL, NULL),
(26, 22, 'chomba', 'Chomba', 3, 1, NULL, NULL, NULL, 250, 1300, NULL, NULL),
(27, 30, 'puan', 'Puuan', NULL, 0, NULL, NULL, NULL, NULL, 1300, NULL, NULL),
(28, 25, 'green firm', 'Green Phirm Investment', 2, 1, NULL, NULL, NULL, 250, 1300, NULL, NULL),
(29, 26, 'archhub', 'Archhub Constructions', 6, 1, NULL, NULL, NULL, 250, 1300, NULL, NULL),
(30, 28, 'maa stake', 'Maa Stakes', 4, 1, NULL, NULL, NULL, 250, 1300, NULL, NULL),
(31, 29, 'Orusa', 'Orusa Tours and Travel LTD', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 31, 'Maa', 'Maa Stakes', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eaccount`
--

CREATE TABLE `eaccount` (
  `eaccount` int(10) NOT NULL,
  `num` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_invalid` int(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eaccount`
--

INSERT INTO `eaccount` (`eaccount`, `num`, `name`, `is_invalid`, `comment`, `source`) VALUES
(1, '29304136', 'kinyozi', 0, NULL, 'old,grace,wycliff'),
(2, '29304128', 'kulisha vyema,Co.op. Bank', 0, NULL, 'old,grace,wycliff'),
(3, '29304185', 'chic joint', 0, NULL, 'old,wycliff'),
(4, '34030692', 'rekk', 0, NULL, 'old,grace'),
(5, '44573251', 'Misatis,Not Assigned', 0, NULL, 'old,grace,wycliff'),
(6, '38743197', 'mwamba properties,Kajiado School,Archihub construction ltd', 0, NULL, 'old,grace,wycliff'),
(7, '40490773', 'sidai/masati ranch oltepesi/geocad_ enterprises/4g_capital,Masabi ranch oltepesi,4th Generation,Transcounty investment company,Geocad Enterprises ltd,Ries Kaakua & Co.Advocates,Vacant room', 0, NULL, 'old,grace,wycliff'),
(8, '38743227', 'naikuni ngaah and miencha,Naikuni Ngaah & Miencha', 0, NULL, 'old,wycliff'),
(9, '34030668', 'car wash,Welding room', 0, NULL, 'old,grace,wycliff'),
(10, '38743254', 'ukristo,Ukiristo', 0, NULL, 'old,wycliff'),
(11, '40490732', 'Puan Sacco,Not Assigned', 0, NULL, 'old,wycliff'),
(12, '38743155', 'oreteti  properties', 0, NULL, 'old,grace'),
(13, '48119382', 'deekos 3-phase', 0, NULL, 'old,wycliff'),
(14, '29304144', 'common services/securitys,Mutall Office & security power', 0, NULL, 'old,grace,wycliff'),
(15, '29304169', 'deekos 1-phase', 0, NULL, 'old,wycliff'),
(16, '34030593', 'afb,Green firm investment', 0, NULL, 'old,wycliff'),
(17, '34030627', 'Vane Kwamboka/Kajido school,Vane Kwamboka & Co. Advocates', 0, NULL, 'old,grace,wycliff'),
(18, '34030643', 'lovinah beauty/land surveyors', 0, NULL, 'old,grace,wycliff'),
(19, '40490765', 'hall/meeting room,Store[small room]', 0, NULL, 'old,grace,wycliff'),
(20, '40490757', 'Kaakua + New olgilai0ooiii', 0, NULL, 'old,grace,wycliff'),
(21, '40490724', 'Kecobat/Old olgilai,Puan Emaa Housing', 0, NULL, 'old,wycliff'),
(22, '44573319', 'Dead meter 61690012 replaced with this new one,Not Assigned', 0, NULL, 'old,wycliff'),
(23, '44573277', 'not assigned', 0, NULL, 'old,grace,wycliff'),
(24, '44573368', 'not assigned', 0, NULL, 'old,wycliff'),
(25, '44573236', 'not assigned', 0, NULL, 'old,grace,wycliff'),
(26, '44573327', 'not assigned', 0, NULL, 'old,wycliff'),
(27, '44573376', 'New kashanga,Store[small room],Plotect,Simaloy', 0, NULL, 'old,grace,wycliff'),
(28, '44573400', 'not assigned,Maa steaks', 0, NULL, 'old,grace,wycliff'),
(29, '44573293', 'not assigned', 0, NULL, 'old,grace,wycliff'),
(30, '44573343', 'meeting room/Facing road next to Misatis,Store[big room]', 0, NULL, 'old,grace,wycliff'),
(31, '103840201', 'Coop. Bank', 0, NULL, 'website');

-- --------------------------------------------------------

--
-- Table structure for table `ebill`
--

CREATE TABLE `ebill` (
  `ebill` int(10) NOT NULL,
  `msg` int(10) DEFAULT NULL,
  `eaccount` int(10) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `current_amount` double DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `current_reading` double DEFAULT NULL,
  `prev_reading` double DEFAULT NULL,
  `is_consumed` int(11) DEFAULT NULL,
  `taxes` double DEFAULT NULL,
  `fuel` double DEFAULT NULL,
  `levies` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `consumption` double DEFAULT NULL,
  `prev_amount` double DEFAULT NULL,
  `total` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `econnection`
--

CREATE TABLE `econnection` (
  `econnection` int(10) NOT NULL,
  `room` int(10) DEFAULT NULL,
  `emeter` int(10) DEFAULT NULL,
  `rate` int(10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_reading` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `econnection`
--

INSERT INTO `econnection` (`econnection`, `room`, `emeter`, `rate`, `start_date`, `end_date`, `start_reading`) VALUES
(1, 40, 32, NULL, '2018-06-25', '2030-01-01', NULL),
(2, 3, 18, NULL, '2018-06-25', '2030-01-01', NULL),
(3, 4, 13, NULL, '2018-06-25', '2030-01-01', NULL),
(4, 5, 3, NULL, '2018-06-25', '2030-01-01', NULL),
(5, 6, 3, NULL, '2018-06-25', '2030-01-01', NULL),
(6, 31, 3, NULL, '2018-06-25', '2030-01-01', NULL),
(7, 32, 3, NULL, '2018-06-25', '2030-01-01', NULL),
(8, 33, 3, NULL, '2018-06-25', '2030-01-01', NULL),
(9, 34, 3, NULL, '2018-06-25', '2030-01-01', NULL),
(10, 35, 3, NULL, '2018-06-25', '2030-01-01', NULL),
(11, 36, 3, NULL, '2018-06-25', '2030-01-01', NULL),
(12, 39, 1, NULL, '2018-06-25', '2030-01-01', NULL),
(13, 41, 9, NULL, '2018-06-25', '2030-01-01', NULL),
(14, 8, 28, NULL, '2018-06-25', '2030-01-01', NULL),
(15, 10, 10, NULL, '2018-06-25', '2030-01-01', NULL),
(16, 12, 21, NULL, '2018-06-25', '2030-01-01', NULL),
(17, 11, 21, NULL, '2018-06-25', '2030-01-01', NULL),
(18, 13, 12, NULL, '2018-06-25', '2030-01-01', NULL),
(19, 14, 17, NULL, '2018-06-25', '2030-01-01', NULL),
(20, 15, 27, NULL, '2018-06-25', '2030-01-01', NULL),
(21, 16, 27, NULL, '2018-06-25', '2030-01-01', NULL),
(22, 17, 27, NULL, '2018-06-25', '2030-01-01', NULL),
(23, 18, 27, NULL, '2018-06-25', '2030-01-01', NULL),
(24, 7, 30, NULL, '2018-06-25', '2030-01-01', NULL),
(25, 19, 6, NULL, '2018-06-25', '2030-01-01', NULL),
(26, 20, 6, NULL, '2018-06-25', '2030-01-01', NULL),
(27, 21, 7, NULL, '2018-06-25', '2030-01-01', NULL),
(28, 22, 7, NULL, '2018-06-25', '2030-01-01', NULL),
(29, 24, 7, NULL, '2018-06-25', '2030-01-01', NULL),
(30, 26, 7, NULL, '2018-06-25', '2030-01-01', NULL),
(31, 23, 7, NULL, '2018-06-25', '2030-01-01', NULL),
(32, 25, 7, NULL, '2018-06-25', '2030-01-01', NULL),
(33, 1, 7, NULL, '2018-06-25', '2030-01-01', NULL),
(34, 27, 20, NULL, '2018-06-25', '2030-01-01', NULL),
(35, 28, 8, NULL, '2018-06-25', '2030-01-01', NULL),
(36, 29, 19, NULL, '2018-06-25', '2030-01-01', NULL),
(37, 30, 19, NULL, '2018-06-25', '2030-01-01', NULL),
(38, 42, 31, NULL, '2018-06-25', '2030-01-01', NULL),
(39, 5, 13, NULL, '2018-06-25', '2030-01-01', NULL),
(40, 37, 3, NULL, '2018-06-25', '2030-01-01', NULL),
(41, 2, 13, NULL, '2018-06-25', '2030-01-01', NULL),
(42, 1, 20, NULL, '2018-06-25', '2030-01-01', NULL),
(43, 9, 16, NULL, '2018-06-25', '2030-01-01', NULL),
(44, 25, 20, NULL, '2018-06-25', '2030-01-01', NULL),
(45, 38, 1, NULL, '2018-06-25', '2030-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `elink`
--

CREATE TABLE `elink` (
  `elink` int(10) NOT NULL,
  `emeter` int(10) DEFAULT NULL,
  `eaccount` int(10) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elink`
--

INSERT INTO `elink` (`elink`, `emeter`, `eaccount`, `source`) VALUES
(1, 1, 1, 'old,grace,wycliff'),
(2, 2, 2, 'old,grace'),
(3, 3, 3, 'old,wycliff'),
(4, 4, 4, 'old,grace'),
(5, 5, 5, 'old,grace,wycliff'),
(6, 6, 6, 'old,grace,wycliff'),
(7, 7, 7, 'old,grace,wycliff'),
(8, 8, 8, 'old,wycliff'),
(9, 9, 9, 'old,grace,wycliff'),
(10, 10, 10, 'old,wycliff'),
(11, 11, 11, 'old,wycliff'),
(12, 13, 13, 'old,wycliff'),
(13, 15, 15, 'old,wycliff'),
(14, 17, 17, 'old,grace,wycliff'),
(15, 18, 18, 'old,grace,wycliff'),
(16, 19, 19, 'old,grace,wycliff'),
(17, 20, 20, 'old,grace,wycliff'),
(18, 21, 21, 'old,wycliff'),
(19, 22, 22, 'old,wycliff'),
(20, 23, 23, 'old,grace,wycliff'),
(21, 24, 24, 'old,wycliff'),
(22, 25, 25, 'old,grace,wycliff'),
(23, 26, 26, 'old,wycliff'),
(24, 27, 27, 'old,grace,wycliff'),
(25, 28, 28, 'old,grace,wycliff'),
(26, 29, 29, 'old,grace,wycliff'),
(27, 30, 30, 'old,grace,wycliff'),
(28, 31, 14, 'grace,wycliff'),
(29, 32, 31, NULL),
(30, 12, 12, NULL),
(31, 16, 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emeter`
--

CREATE TABLE `emeter` (
  `emeter` int(10) NOT NULL,
  `num` varchar(50) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_invalid` int(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emeter`
--

INSERT INTO `emeter` (`emeter`, `num`, `uid`, `name`, `is_invalid`, `comment`, `source`) VALUES
(1, '60330355', 26, 'kinyozi', 0, NULL, 'old,grace,wycliff'),
(2, '60426891', 27, 'Not Assigned', 0, NULL, 'old,grace'),
(3, '60315078', 3, 'chic joint', 0, NULL, 'old,wycliff'),
(4, '60925308', 4, 'rekk', 0, NULL, 'old,grace,wycliff'),
(5, '61715053', 13, 'Not Assigned', 0, NULL, 'old,grace,wycliff'),
(6, '61503300', 25, 'Kajiado School,Archihub construction ltd', 0, NULL, 'old,grace,wycliff'),
(7, '61525000', 19, 'sidai/Masabi ranch/4th Generation/Transcounty/Geocad Enterprises ltd', 0, NULL, 'old,grace,wycliff'),
(8, '61503299', 24, 'naikuni ngaah and miencha', 0, NULL, 'old,wycliff'),
(9, '60898270', 8, 'car wash,Welding room', 0, NULL, 'old,grace,wycliff'),
(10, '61423338', 23, 'Ukiristo', 0, NULL, 'old,wycliff'),
(11, '61431461', 16, 'Not Assigned', 0, NULL, 'old,wycliff'),
(12, '61503291', 22, 'Fair deal Surveyors', 0, NULL, 'old,grace,wycliff'),
(13, '61579934', 30, 'deekos 3-phase', 0, NULL, 'old,wycliff'),
(14, '60315103', 1, 'common services/securitys', 1, 'Not found in KPLC search. It may have been removed', 'old,grace'),
(15, '60330353', 2, 'Not Assigned', 0, NULL, 'old,wycliff'),
(16, '60926311', 5, 'afb,Green firm investment', 0, NULL, 'old,wycliff'),
(17, '60925314', 6, 'Vane Kwamboka and Co. Advocates', 0, NULL, 'old,grace,wycliff'),
(18, '60925315', 7, 'lovinah beauty/land surveyors', 0, NULL, 'old,grace,wycliff'),
(19, '61431462', 18, 'hall/meeting room', 0, NULL, 'old,grace,wycliff'),
(20, '61431466', 17, 'Kaakua/New olgilai', 0, NULL, 'old,grace,wycliff'),
(21, '61431467', 20, 'Kecobat/Puan Emaa Housing', 0, NULL, 'old,wycliff'),
(22, '61979090', 21, 'Not Assigned', 0, NULL, 'old,wycliff'),
(23, '61690833', 28, 'not assigned', 0, NULL, 'old,grace,wycliff'),
(24, '61690979', 11, 'not assigned', 0, NULL, 'old,wycliff'),
(25, '61692365', 14, 'not assigned', 0, NULL, 'old,grace,wycliff'),
(26, '61693232', 10, 'not assigned', 0, NULL, 'old,wycliff'),
(27, '61699428', 9, 'Plotect,Simaloy', 0, NULL, 'old,grace,wycliff'),
(28, '61712928', 15, 'Maa steaks', 0, NULL, 'old,grace,wycliff'),
(29, '61727258', 12, 'not assigned', 0, NULL, 'old,grace,wycliff'),
(30, '61728536', 29, 'meeting room/Facing road next to Misatis', 0, NULL, 'old,grace,wycliff'),
(31, '62145624', NULL, 'Mutall Office & security power', 0, NULL, 'grace,wycliff'),
(32, '62221603', 31, 'Coop. Bank', 0, NULL, 'wycliff');

-- --------------------------------------------------------

--
-- Table structure for table `ereading`
--

CREATE TABLE `ereading` (
  `ereading` int(10) NOT NULL,
  `emeter` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `value` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE `field` (
  `field` int(10) NOT NULL,
  `source` int(10) DEFAULT NULL,
  `report` int(10) DEFAULT NULL,
  `is_visible` int(1) NOT NULL,
  `sequence` int(5) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `field`
--

INSERT INTO `field` (`field`, `source`, `report`, `is_visible`, `sequence`, `prefix`) VALUES
(1, 5, 7, 1, 1, NULL),
(2, 5, 8, 1, 1, NULL),
(3, 6, 7, 1, 2, NULL),
(4, 6, 8, 1, 2, NULL),
(5, 7, 4, 1, 3, NULL),
(6, 7, 7, 1, 3, NULL),
(7, 7, 8, 1, 3, NULL),
(8, 8, 4, 0, 4, NULL),
(9, 8, 7, 0, 4, NULL),
(10, 8, 8, 0, 4, NULL),
(11, 9, 4, 1, 5, NULL),
(12, 9, 7, 1, 5, NULL),
(13, 9, 8, 1, 5, NULL),
(14, 10, 4, 0, 6, NULL),
(15, 10, 7, 0, 6, NULL),
(16, 10, 8, 0, 6, NULL),
(17, 11, 4, 1, 7, NULL),
(18, 11, 7, 1, 7, NULL),
(19, 11, 8, 1, 7, NULL),
(20, 12, 4, 1, 8, NULL),
(21, 12, 7, 1, 8, NULL),
(22, 12, 8, 1, 8, NULL),
(23, 1, 4, 1, 10, NULL),
(24, 1, 7, 1, 9, NULL),
(25, 1, 8, 1, 9, NULL),
(26, 2, 4, 1, 2, NULL),
(27, 2, 7, 1, 10, NULL),
(28, 2, 8, 1, 10, NULL),
(29, 13, 7, 1, 11, NULL),
(30, 13, 8, 1, 11, NULL),
(31, 3, 4, 1, 11, NULL),
(32, 3, 7, 1, 12, NULL),
(33, 3, 8, 1, 12, NULL),
(34, 4, 4, 1, 12, NULL),
(35, 4, 7, 1, 13, NULL),
(36, 4, 8, 1, 13, NULL),
(37, 14, 7, 1, 14, NULL),
(38, 14, 8, 1, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice` int(10) NOT NULL,
  `client` int(10) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dbname` varchar(255) DEFAULT NULL,
  `sql` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`job`, `name`, `dbname`, `sql`) VALUES
(1, 'temp', 'mutallco_rental', '\n            select\n                eaccount.eaccount,\n                eaccount.num as eaccount_num,\n                emeter.num as emeter_num,\n                emeter.uid as emeter_uid,\n                emeter.name as emeter_name\n            from(\n                eaccount inner join \n                elink on elink.eaccount=eaccount.eaccount) inner join\n                emeter on elink.emeter=emeter.emeter\n        ');

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `month` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month`, `name`, `no`) VALUES
(1, 'april', 4),
(2, 'june', 6),
(3, 'january', 1),
(4, 'february', 2),
(5, 'march', 3),
(6, 'may', 5),
(7, 'july', 7),
(8, 'august', 8),
(9, 'september', 9),
(10, 'october', 10),
(11, 'november', 11),
(12, 'december', 12);

-- --------------------------------------------------------

--
-- Table structure for table `msg`
--

CREATE TABLE `msg` (
  `msg` int(10) NOT NULL,
  `id` varchar(32) NOT NULL,
  `body` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msg`
--

INSERT INTO `msg` (`msg`, `id`, `body`, `date`) VALUES
(453, 'db07c51aed1367a9ab99a181624806b3', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:29304144. Curr bill dated 19-01-2019 is as follows:  Active Meter - Curr Read: 3472 Prev Read: 2474,Billed Units: 998KWh,   Fixed charge: 0, Cons.units amount:14142.24 Fuel Cost and Levies: 3373.74,Taxes: 2307.79, Adjustments: -2459.77. Monthly bill is KShs: 17364. Prev Bal is KShs .12. Total Outstanding is KShs: 17364.12. Due date 28-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(454, '198af533e68c34969610c87591b7f628', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573277. Curr bill dated 18-01-2019 is as follows:  Active Meter - Curr Read: 669 Prev Read: 669,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 1466.05. Total Outstanding is KShs: 1466.05. Due date 25-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(455, '11d13a2408844bc2755769484ff5ad80', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:29304136. Curr bill dated 18-01-2019 is as follows:  Active Meter - Curr Read: 14255 Prev Read: 14025,Billed Units: 230KWh,   Fixed charge: 0, Cons.units amount:4197.5 Fuel Cost and Levies: 839.04,Taxes: 684.86, Adjustments: -563.4. Monthly bill is KShs: 5158. Prev Bal is KShs 1693.93. Total Outstanding is KShs: 6851.93. Due date 25-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(456, '4dc64ea30cf6e9012302ed8caec4f937', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:103840201. Curr bill dated 18-01-2019 is as follows:  Active Meter - Curr Read: 14587 Prev Read: 14587,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 40.05. Total Outstanding is KShs: 40.05. Due date 25-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(457, '2164edcaaa8d56e9f34486397a7c56ae', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:40490773. Curr bill dated 18-01-2019 is as follows:  Active Meter - Curr Read: 5652 Prev Read: 5422,Billed Units: 230KWh,   Fixed charge: 0, Cons.units amount:4197.5 Fuel Cost and Levies: 839.04,Taxes: 684.86, Adjustments: -563.4. Monthly bill is KShs: 5158. Prev Bal is KShs 7157.17. Total Outstanding is KShs: 12315.17. Due date 25-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(458, 'b8acb49ed7397009ecde47c21132f632', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030593. Curr bill dated 18-01-2019 is as follows:  Active Meter - Curr Read: 7853 Prev Read: 7623,Billed Units: 230KWh,   Fixed charge: 0, Cons.units amount:2863.5 Fuel Cost and Levies: 772.34,Taxes: 471.42, Adjustments: -563.26. Monthly bill is KShs: 3544. Prev Bal is KShs -.16. Total Outstanding is KShs: 3543.84. Due date 25-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(459, 'd4cc05ed094264d5444d996d9945b4f1', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:48119382. Curr bill dated 18-01-2019 is as follows:  Active Meter - Curr Read: 323419 Prev Read: 313785,Billed Units: 9634KWh,   Fixed charge: 0, Cons.units amount:173893.7 Fuel Cost and Levies: 35048.49,Taxes: 28378.53, Adjustments: -23603.72. Monthly bill is KShs: 213717. Prev Bal is KShs -149525.72. Total Outstanding is KShs: 64191.28. Due date 25-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(460, '5899e3c2263f13d840b6b504f2d0abb1', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573327. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1 (Est) Prev Read: 1, Estimated Units: 0 KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 692.04. Total Outstanding is KShs: 692.04. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(461, 'ce7ab0df8bb9ec0ac360fa5582d95313', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:38743155. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1005 Prev Read: 996,Billed Units: 9KWh,   Fixed charge: 0, Cons.units amount:112.18 Fuel Cost and Levies: 29.64,Taxes: 18.35, Adjustments: -22.17. Monthly bill is KShs: 138. Prev Bal is KShs 288.31. Total Outstanding is KShs: 426.31. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(462, 'bd3d6887e9601d20d4658983b64cbd6d', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:40490757. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1984 Prev Read: 1955,Billed Units: 29KWh,   Fixed charge: 0, Cons.units amount:361.05 Fuel Cost and Levies: 97.38,Taxes: 59.44, Adjustments: -70.87. Monthly bill is KShs: 447. Prev Bal is KShs 400.27. Total Outstanding is KShs: 847.27. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(463, '0dd91a479cd6209e01ef6c2c8205661c', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573293. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 139 Prev Read: 139,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 2250.75. Total Outstanding is KShs: 2250.75. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(464, '5591c0b58ae9e7e15a812c89a115f108', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030668. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 7412 Prev Read: 7412,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 2281.16. Total Outstanding is KShs: 2281.16. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(465, '4666a283857fdf3e18ed15794b29d5cb', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573376. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1428 (Est) Prev Read: 1362, Estimated Units: 66 KWh,   Fixed charge: 0, Cons.units amount:822.73 Fuel Cost and Levies: 217.22,Taxes: 134.56, Adjustments: -162.51. Monthly bill is KShs: 1012. Prev Bal is KShs 874.94. Total Outstanding is KShs: 1886.94. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(466, '5ebc3a32ccfa282fe1ca15933b7fa256', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:38743227. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 2289 Prev Read: 2269,Billed Units: 20KWh,   Fixed charge: 0, Cons.units amount:249.3 Fuel Cost and Levies: 65.91,Taxes: 40.79, Adjustments: -49. Monthly bill is KShs: 307. Prev Bal is KShs -6372.66. Total Outstanding is KShs: -6065.66. Due date 24-01-2019. Currently no bill to pay. Thank You.', '2019-02-01'),
(467, 'f743fc65b584cce7008b7ec4cd3fb38f', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:40490724. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 805 Prev Read: 802,Billed Units: 3KWh,   Fixed charge: 0, Cons.units amount:37.35 Fuel Cost and Levies: 10.07,Taxes: 6.15, Adjustments: -7.57. Monthly bill is KShs: 46. Prev Bal is KShs 544.71. Total Outstanding is KShs: 590.71. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(468, 'cbb26b0e40ea537dd3ee10651213108c', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:38743254. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 18895 Prev Read: 18841,Billed Units: 54KWh,   Fixed charge: 0, Cons.units amount:762.55 Fuel Cost and Levies: 182.51,Taxes: 124.46, Adjustments: -133.52. Monthly bill is KShs: 936. Prev Bal is KShs -384.34. Total Outstanding is KShs: 551.66. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(469, '92ede73aa01957215a56938832878a4e', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:40490765. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 156 Prev Read: 156,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 832.91. Total Outstanding is KShs: 832.91. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(471, '4d698a54d3a6ee1441c41ebfec27b1e0', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030643. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1633 Prev Read: 1625,Billed Units: 8', '2019-02-01'),
(472, 'b4b2ef08a6a127bd744eb92857a10b67', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573236. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 602 Prev Read: 602,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 5036.43. Total', '2019-02-01'),
(473, '232796192023e534b4cf8d7d2715d8a1', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573343. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 287 (Est) Prev Read: 269, Estimated Units: 18 KWh,   Fixed charge: 0, Cons.units amount:324.9 Fuel Cost and Levies: 65.49,Taxes: 53.02, Adjustments: -44.41. Monthly bill is KShs: 399. Prev Bal is KShs 4039.96. Total Outstanding is KShs: 4438.96. Due date 24-01-2019. Kindly pay before due date. Thank You.', '2019-02-01'),
(474, '0ceca25dbac6419c453bb32829eea569', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030627. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1425 Prev Read: 1399,Billed Units: 2', '2019-02-01'),
(475, '8796c0f820212e5833ef6ec038c1011a', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573400. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1277 (Est) Prev Read: 1277, Estimate', '2019-02-01'),
(476, 'd3cca5444c15648a80ef81986ac44097', 'Dear customer our disconnection moratorium expires on 23/11/2018 Please visit our Commercial Offices near you to present any billing concerns for resolution.', '2019-02-01'),
(477, '60584334e2202144107c53e7735a0149', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573400. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 882 Prev Read: 665,Billed Units: 217KWh,   Fixed charge: 0, Cons.units amount:3146.5 Fuel Cost and Levies: 689.62,Taxes: 504.24, Adjustments: -542.36. Monthly bill is KShs: 3798. Prev Bal i', '2019-02-01'),
(478, 'c40fee02e992178cbf3e6bc8a2621adf', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030668. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 7320 Prev Read: 7295,Billed Units: 25KWh,   Fixed charge: 0, Cons.units amount:457.5 Fuel Cost and Levies: 84.2,Taxes: 73.29, Adjustments: -62.99. Monthly bill is KShs: 552. Prev Bal is KShs 335.16. Total Outstanding is KShs: 887.16. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(479, '0e4ef8b5510092cb8d989decf2fb23d4', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:40490765. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 131 Prev Read: 125,Billed Units: 6KWh,   Fixed charge: 0, Cons.units amount:87 Fuel Cost and Levies: 19.07,Taxes: 13.94, Adjustments: -15.01. Monthly bill is KShs: 105. Prev Bal is KShs 1337.91. Total Outstanding is KShs: 1442.91. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(480, 'd38264601be9aa0f34584e93e37dcd30', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573343. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 267 Prev Read: 267,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 4008.96. Total', '2019-02-01'),
(481, 'c3f2133225773a9a9bce0f6629436ffa', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030627. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 1348 Prev Read: 1320,Billed Units: 28KWh,   Fixed charge: 0, Cons.units amount:512.4 Fuel Cost and Levies: 94.3,Taxes: 82.09, Adjustments: -69.79. Monthly bill is KShs: 619. Prev Bal is KShs -.89. Total Outstanding is KShs: 618.11. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(482, '0c49087a04da4be5a8c802e04dc36431', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:29304136. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 13760 Prev Read: 13600,Billed Units: 160KWh,   Fixed charge: 0, Cons.units amount:2928 Fuel Cost and Levies: 538.88,Taxes: 469.07, Adjustments: -399.95. Monthly bill is KShs: 3536. Prev Bal is KShs 531.93. Total Outstanding is KShs: 4067.93. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(483, '4ef9a756327eddf98bae6a063a2d65d7', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573236. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 559 Prev Read: 559,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 4384.43. Total Outstanding is KShs: 4384.43. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(484, '89c9da3d73a07a22e830a4bc78103545', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:40490757. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 1889 Prev Read: 1853,Billed Units: 36KWh,   Fixed charge: 0, Cons.units amount:658.8 Fuel Cost and Levies: 121.25,Taxes: 105.54, Adjustments: -89.59. Monthly bill is KShs: 796. Prev Bal is ', '2019-02-01'),
(485, '39bf37f991bd2597abcfd3140da6d015', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:38743254. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 18405 Prev Read: 17772,Billed Units: 633KWh,   Fixed charge: 0, Cons.units amount:11583.9 Fuel Cost and Levies: 2131.95,Taxes: 1855.77, Adjustments: -1582.62. Monthly bill is KShs: 13989. Prev Bal is KShs -58.34. Total Outstanding is KShs: 13930.66. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(486, '16a2422c73b5bb0648264d4d645f33bf', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030593. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 7387 Prev Read: 7247,Billed Units: 140KWh,   Fixed charge: 0, Cons.units amount:2562 Fuel Cost and Levies: 471.52,Taxes: 410.44, Adjustments: -349.96. Monthly bill is KShs: 3094. Prev Bal is KShs -999.16. Total Outstanding is KShs: 2094.84. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(487, '3aa5abc07c5cc4650808a90a3c0c2886', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:48119382. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 306737 Prev Read: 301826,Billed Units: 4911KWh,   Fixed charge: 0, Cons.units amount:88889.1 Fuel Cost and Levies: 16491.14,Taxes: 14240.49, Adjustments: -12277.73. Monthly bill is KShs: 107343. Prev Bal is KShs -11412.72. Total Outstanding is KShs: 95930.28. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(488, '33eca2cf34bb10647a12499c327633b7', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:38743227. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 2194 Prev Read: 2160,Billed Units: 34KWh,   Fixed charge: 0, Cons.units amount:622.2 Fuel Cost and Levies: 114.51,Taxes: 99.68, Adjustments: -85.39. Monthly bill is KShs: 751. Prev Bal is KShs 73.34. Total Outstanding is KShs: 824.34. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(489, '47aebb5d91bca1ad906c2ab98f20c4d7', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573277. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 664 Prev Read: 664,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 1390.05. Total', '2019-02-01'),
(490, '71285f645c666864dd63a6324222f3b1', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:29304144. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 2205 Prev Read: 1917,Billed Units: 288KWh,   Fixed charge: 0, Cons.units amount:5270.4 Fuel Cost and Levies: 969.98,Taxes: 844.33, Adjustments: -719.71. Monthly bill is KShs: 6365. Prev Bal is KShs -159.88. Total Outstanding is KShs: 6205.12. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(491, '739a6e2156c199718715cce27fb5a774', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573327. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 1 (Est) Prev Read: 1, Estimated Units: 0 KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 692.04. Total Outstanding is KShs: 692.04. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(492, '649f58b77cd6156498146ff5b091aec6', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:40490773. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 5232 Prev Read: 5097,Billed Units: 135KWh,   Fixed charge: 0, Cons.units amount:2470.5 Fuel Cost and Levies: 454.68,Taxes: 395.78, Adjustments: -337.96. Monthly bill is KShs: 2983. Prev Bal is KShs 20106.17. Total Outstanding is KShs: 23089.17. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(493, '8237d39a50abdf61c32c1fa4c78c27d2', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030643. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 1546 Prev Read: 1531,Billed Units: 15KWh,   Fixed charge: 0, Cons.units amount:274.5 Fuel Cost and Levies: 50.52,Taxes: 43.98, Adjustments: -37. Monthly bill is KShs: 332. Prev Bal is KShs -31.11. Total Outstanding is KShs: 300.89. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(494, '964bad6664185ba4dfe90826cf26836f', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:40490724. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 766 Prev Read: 747,Billed Units: 19KWh,   Fixed charge: 0, Cons.units amount:347.7 Fuel Cost and Levies: 63.99,Taxes: 55.7, Adjustments: -47.39. Monthly bill is KShs: 420. Prev Bal is KShs -.29. Total Outstanding is KShs: 419.71. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(495, '1f7b922714935077b304633feeeb3f36', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:38743155. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 984 Prev Read: 978,Billed Units: 6KWh,   Fixed charge: 0, Cons.units amount:109.8 Fuel Cost and Levies: 20.21,Taxes: 17.59, Adjustments: -14.6. Monthly bill is KShs: 133. Prev Bal is KShs -26.69. Total Outstanding is KShs: 106.31. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(496, '0a2aa1e07027395a1c651bbf2ae68ed1', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573376. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 1233 Prev Read: 1167,Billed Units: 66KWh,   Fixed charge: 0, Cons.units amount:1207.8 Fuel Cost and Levies: 222.29,Taxes: 193.49, Adjustments: -164.58. Monthly bill is KShs: 1459. Prev Bal is KShs 550.94. Total Outstanding is KShs: 2009.94. Due date 22-10-2018. Kindly pay before due date. Thank You.', '2019-02-01'),
(497, '8757e832a65c8bc268ff24cfbb3549e7', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573293. Curr bill dated 14-10-2018 is as follows:  Active Meter - Curr Read: 138 Prev Read: 138,Billed Units: 0KWh,   Fixed charge: 0, Cons.units amount:0 Fuel Cost and Levies: 0,Taxes: 0, Adjustments:   0.00. Monthly bill is KShs: 0. Prev Bal is KShs 2235.75. Total', '2019-02-01'),
(498, 'dd168eab36af74221077c7028d855403', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:103840201. Curr bill dated 05-10-2018 is as follows:  Active Meter - Curr Read: 300 (Est) Prev Read: 200, Estimated Units: 100 KWh,   Fixed charge: 0, Cons.units amount:1810 Fuel Cost and Levies: 342.21,Taxes: 290.99, Adjustments: -250.2. Monthly bill is KShs: 2193. Prev Bal is KShs -2971.95. Total Outstanding is KShs: -778.95. Due date 12-10-2018. Currently no bill to pay. Thank You.', '2019-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE `note` (
  `note` int(10) NOT NULL,
  `invoice` int(10) DEFAULT NULL,
  `info` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment` int(10) NOT NULL,
  `posted_item` int(10) DEFAULT NULL,
  `client` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment`, `posted_item`, `client`, `date`, `description`, `amount`, `type`, `ref`) VALUES
(5, NULL, NULL, '2018-08-25', NULL, NULL, 'bank_slip', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `period`
--

CREATE TABLE `period` (
  `period` int(10) NOT NULL,
  `year` int(5) DEFAULT NULL,
  `month` int(10) DEFAULT NULL,
  `is_current` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `period`
--

INSERT INTO `period` (`period`, `year`, `month`, `is_current`) VALUES
(1, 2016, 1, 0),
(2, 2016, 2, 0),
(3, 2016, 7, 0),
(4, 2016, 8, 0),
(5, 2016, 9, 0),
(6, 2016, 10, 0),
(7, 2016, 11, 0),
(8, 2016, 12, 0),
(9, 2017, 3, 0),
(10, 2017, 4, 0),
(11, 2017, 5, 0),
(12, 2017, 1, 0),
(13, 2017, 6, 0),
(14, 2017, 2, 0),
(15, 2017, 7, 0),
(16, 2017, 8, 0),
(17, 2017, 9, 0),
(18, 2017, 10, 0),
(19, 2017, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `picture` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `elevation` varchar(50) DEFAULT NULL,
  `room` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posted_item`
--

CREATE TABLE `posted_item` (
  `posted_item` int(10) NOT NULL,
  `invoice` int(10) DEFAULT NULL,
  `source` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posted_item`
--

INSERT INTO `posted_item` (`posted_item`, `invoice`, `source`, `name`, `date`, `description`, `debit`, `credit`) VALUES
(1, NULL, NULL, 'Rent for room 08', NULL, 'for feb,march & april @49455Ksh/month', 148365, NULL),
(2, NULL, NULL, 'Service charge', NULL, 'For feb,march & april  @250ksh/month', 750, NULL),
(3, NULL, NULL, 'security', NULL, 'for feb,march & april @1900kshs/month', 5700, NULL),
(4, NULL, NULL, 'water', NULL, 'for feb,march & april@200kshs./month', 600, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `rate` int(10) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `rent` int(10) NOT NULL,
  `posted_item` int(10) DEFAULT NULL,
  `client` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room` int(10) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `is_psuedo` int(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `wing` varchar(255) DEFAULT NULL,
  `width_ft` int(5) DEFAULT NULL,
  `width_inch` int(5) DEFAULT NULL,
  `breadth_ft` int(5) DEFAULT NULL,
  `breadth_inch` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room`, `uid`, `is_psuedo`, `title`, `floor`, `wing`, `width_ft`, `width_inch`, `breadth_ft`, `breadth_inch`) VALUES
(1, '29', 0, 'Empty office opposite kanisa', '2', 'NW', 12, 6, 37, 0),
(2, '43', 0, 'Deekos Cafeteria', '0', 'NE', 8, 0, 86, 0),
(3, '3', 0, 'Lovinah', '0', 'SE', 8, 4, 19, 4),
(4, '5', 0, 'Deekos Bakery', '0', 'N', 37, 0, 85, 0),
(5, '6', 0, 'Chic Joint lounge/meeting room', '0', 'NW', 21, 0, 10, 0),
(6, '7', 0, 'Chic Joint-main bar', '0', 'SW', 37, 0, 34, 4),
(7, '9', 0, 'Meeting room', '1', 'NE', 12, 0, 40, 0),
(8, '10', 0, 'Maa steaks', '1', 'NE', 12, 6, 39, 0),
(9, '11', 0, 'Green firm investment', '1', 'NE', 14, 0, 38, 6),
(10, '12', 0, 'Ukristo na Ufanisi', '1', 'NW', 22, 7, 48, 8),
(11, '13', 0, 'Puan Emaa Housing', '1', 'NW', 9, 8, 18, 4),
(12, '14', 0, 'Kecobat', '1', 'NW', 13, 3, 12, 9),
(13, '15', 0, 'Fair deal Surveyors', '1', 'NW', 13, 3, 25, 0),
(14, '16', 0, 'Vane Kwamboka and Co. Advocates', '1', 'NW', 12, 0, 27, 5),
(15, '17', 0, 'Nyamais Store[small room]', '1', 'SW', 8, 0, 11, 0),
(16, '18', 0, 'Plotect', '1', 'SW', 13, 0, 35, 10),
(17, '19', 0, 'Simaloy', '1', 'SW', 13, 0, 35, 10),
(18, '20', 0, 'New room above chic joint/Store[big room]', '1', 'SW', 9, 2, 34, 0),
(19, '21', 0, 'Kajiado School', '2', 'SE', 24, 8, 36, 3),
(20, '22', 0, 'Archihub construction ltd', '2', 'SE', 12, 8, 36, 3),
(21, '23', 0, 'Sidai', '2', 'NE', 12, 9, 37, 0),
(22, '24', 0, 'Masabi ranch oltepesi', '2', 'NE', 12, 8, 37, 0),
(23, '27', 0, 'Geocad Enterprises Ltd', '2', 'NE', 16, 7, 12, 0),
(24, '25', 0, '4th Generation', '2', 'NE', 12, 0, 12, 4),
(25, '28', 0, 'Ries Kaakua and Co.Advocates', '2', 'NW', 13, 0, 37, 0),
(26, '26', 0, 'Transcounty investment company', '2', 'NE', 7, 9, 12, 4),
(27, '30', 0, 'Olgilai Contractors', '2', 'NW', 13, 0, 37, 0),
(28, '31', 0, 'Naikuni Ngaah and Miencha', '2', 'SW', 12, 10, 36, 4),
(29, '32', 0, 'Meeting room/kanisa', '2', 'SW', 12, 6, 36, 4),
(30, '33', 0, 'Small office', '2', 'SW', 7, 0, 12, 0),
(31, '34', 0, 'Chic Joint Tented area/terrace', 'x', 'S', 37, 0, 39, 0),
(32, '35', 0, 'Chic Joint-kitchen', 'x', 'S', 14, 7, 19, 0),
(33, '36', 0, 'Chic Joint-Ken\'s office', 'x', 'S', 10, 0, 11, 6),
(34, '37', 0, 'Chic Joint-Store1', 'x', 'S', 10, 0, 11, 6),
(35, '38', 0, 'Chic Joint-Store2', 'x', 'S', 9, 4, 11, 6),
(36, '39', 0, 'Chic Joint-Store2', 'x', 'W', 18, 10, 11, 0),
(37, '40', 0, 'Chick Joint Pool Area ext', 'x', 'W', 24, 0, 18, 0),
(38, '41', 0, 'Wycliff\'s office', 'x', 'W', 14, 8, 10, 0),
(39, '42', 0, 'Kinyozi/new', 'x', 'W', 16, 7, 13, 10),
(40, 'coop', 0, 'Coop. Bank', '1', 'SE', NULL, NULL, NULL, NULL),
(41, 'gg', 1, 'Welding room/Guchunga', 'x', NULL, NULL, NULL, NULL, NULL),
(42, 'm-data', 0, 'Mutall Office & security power', '4', 'SE', NULL, NULL, NULL, NULL),
(43, 'M-Tap', 1, 'Mutall Water Taps', NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'D-toilets', 1, 'Deekos Toilets', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'M-Toilets', 1, 'Mutall Toilets', NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'Cj-Toilets', 1, 'Chic Joint Toilets', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'orusa', 0, 'Orusa Tours and Travel LTD', '2', 'SE', NULL, NULL, NULL, NULL),
(48, 'chomba', 0, 'Chomba', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service` int(10) NOT NULL,
  `posted_item` int(10) DEFAULT NULL,
  `clients` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `debit` int(10) DEFAULT NULL,
  `credit` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `source` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`source`, `name`, `title`) VALUES
(1, 'charge', 'charge'),
(2, 'balance', 'bal'),
(3, 'payment', 'payment'),
(4, 'adjustments', 'adj'),
(5, 'client_code', 'c_code??'),
(6, 'client_fullname', 'c_name??'),
(7, 'prev_reading', 'read1'),
(8, 'prev_date', 'date1'),
(9, 'curr_reading', 'read2'),
(10, 'curr_date', 'date2'),
(11, 'water consumption(m3)', 'units'),
(12, 'rate of charge(ksh)', 'rate'),
(13, 'date of balance', 'bal_date??'),
(14, 'closing balance', 'closing??');

-- --------------------------------------------------------

--
-- Table structure for table `wconnection`
--

CREATE TABLE `wconnection` (
  `wconnection` int(10) NOT NULL,
  `room` int(10) DEFAULT NULL,
  `wmeter` int(10) DEFAULT NULL,
  `rate` int(10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_reading` int(10) DEFAULT NULL,
  `end_reading` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wconnection`
--

INSERT INTO `wconnection` (`wconnection`, `room`, `wmeter`, `rate`, `start_date`, `end_date`, `start_reading`, `end_reading`) VALUES
(1, 8, 1, NULL, '2018-06-25', '2019-01-31', NULL, NULL),
(2, 32, 2, NULL, '2018-06-25', '2019-01-31', NULL, NULL),
(3, 3, 3, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(4, 10, 4, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(5, 4, 5, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(6, 2, 6, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(7, 40, 8, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(8, 39, 9, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(9, 43, 12, NULL, '2018-06-25', '2019-01-31', NULL, NULL),
(10, 46, 11, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(11, 45, 10, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(12, 44, 13, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(13, 40, 38, NULL, '2018-06-25', '2030-01-01', NULL, NULL),
(17, 8, 44, NULL, '2019-01-31', '2030-01-01', 0, NULL),
(19, 32, 46, NULL, '2019-01-31', '2030-01-01', NULL, NULL),
(20, 43, 47, NULL, '2019-01-31', '2030-01-01', NULL, NULL),
(21, 44, 48, NULL, '2019-01-31', '2030-01-01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wmeter`
--

CREATE TABLE `wmeter` (
  `wmeter` int(10) NOT NULL,
  `num` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `is_supply` int(1) NOT NULL,
  `is_toilet` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wmeter`
--

INSERT INTO `wmeter` (`wmeter`, `num`, `name`, `id`, `comment`, `is_supply`, `is_toilet`) VALUES
(1, '2017-12-8852', 'Maa steaks', '52', NULL, 0, 0),
(2, '2017-12-7058                ', 'Chickjoint kitchen', '58', NULL, 0, 0),
(3, '15061026', 'Lovina', '26', NULL, 0, 0),
(4, '300746', 'Ukiristo', '46', NULL, 0, 0),
(5, '14081172', 'Deekos bakery', '72', NULL, 0, 0),
(6, '14089399', 'Deekos cafeteria', '399', NULL, 0, 0),
(7, '004973', 'Ololaiser', '73', NULL, 1, 0),
(8, 'ISO 4064', 'Co-ope Bank', '64', NULL, 0, 0),
(9, '201215300', 'Kinyozi', '00', NULL, 0, 0),
(10, '2017-12-8299', 'Mutall Toilets', '299', NULL, 0, 1),
(11, '15065729', 'Chickjoint toilets', '29', NULL, 0, 1),
(12, '2012-12-8841', 'Mutall Tap', '41', NULL, 0, 1),
(13, '2012-12-9562', 'Deekos Toilets', '62', NULL, 0, 1),
(14, 'Bh', 'Borehole ', 'Bh', NULL, 1, 1),
(15, 'Ur', 'Underground reservoir', 'Ur', NULL, 1, 0),
(32, '300713', NULL, '13', NULL, 0, 0),
(33, '2017.4.8285', NULL, '85', NULL, 0, 0),
(35, '11027722', NULL, '22', NULL, 0, 0),
(36, '2017.5.8126', NULL, '126', NULL, 0, 0),
(38, 'ISO 4064 BH', 'Co-ope Bank/borehole', 'ISO', NULL, 0, 0),
(39, '18030896', 'Eureka waters', 'ureka', NULL, 1, 0),
(40, '15080707', 'Underground reservoir', NULL, NULL, 0, 0),
(41, '18031498', 'Kinyonzi new meter/01-10-2018', '98', NULL, 0, 1),
(42, '18030750', 'Chic joint toillets/30-09-2018', '50', NULL, 0, 1),
(43, '15020642', 'Chic joint kitchen/01-08-2018', '42', NULL, 0, 0),
(44, '18030760', 'Maa_Staek', '60', 'Maa_steak water new meter', 0, 0),
(46, '18030792', 'chicjoint_kitchen', '92', 'New meter for chicjoint', 0, 0),
(47, '18031595', 'Mutall_Tap', '95', 'New Meter for the tap.', 0, 0),
(48, '18031083', 'Deekos_toilets', '25', 'Deekos new meter. Established on 31/01/2019', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wreading`
--

CREATE TABLE `wreading` (
  `wreading` int(10) NOT NULL,
  `date` date DEFAULT NULL,
  `wmeter` int(10) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_consumed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wreading`
--

INSERT INTO `wreading` (`wreading`, `date`, `wmeter`, `value`, `remark`, `is_consumed`) VALUES
(1, '2018-04-30', 32, 568.458, NULL, -1),
(2, '2018-04-30', 33, 85, NULL, -1),
(3, '2018-04-30', 3, 88.3312, NULL, -1),
(4, '2018-04-30', 4, 71.3396, NULL, -1),
(5, '2018-04-30', 5, 1565.1897, NULL, -1),
(6, '2018-04-30', 6, 563.1497, NULL, -1),
(7, '2018-04-30', 7, 882.248, NULL, -1),
(8, '2018-04-30', 8, 63.9, NULL, -1),
(9, '2018-04-30', 9, 152, NULL, -1),
(10, '2018-04-30', 11, 398.34, NULL, -1),
(11, '2018-04-30', 35, 28.227, NULL, -1),
(12, '2018-04-30', 36, 79.85, NULL, -1),
(13, '2018-05-01', 32, 569.4584, NULL, -1),
(14, '2018-05-01', 33, 87, NULL, -1),
(15, '2018-05-01', 3, 88.4459, NULL, -1),
(16, '2018-05-01', 4, 71.3569, NULL, -1),
(17, '2018-05-01', 5, 1567.2537, NULL, -1),
(18, '2018-05-01', 6, 563.1496, NULL, -1),
(19, '2018-05-01', 7, 885.584, NULL, -1),
(20, '2018-05-01', 8, 63.9, NULL, -1),
(21, '2018-05-01', 9, 24.303, NULL, -1),
(22, '2018-05-01', 11, 398.398, NULL, -1),
(23, '2018-05-01', 35, 28.227, NULL, -1),
(24, '2018-05-01', 36, 80, NULL, -1),
(25, '2018-05-02', 32, 568.4584, NULL, -1),
(26, '2018-05-02', 33, 88, NULL, -1),
(27, '2018-05-02', 3, 88.4594, NULL, -1),
(28, '2018-05-02', 4, 71.358, NULL, -1),
(29, '2018-05-02', 5, 1569.4757, NULL, -1),
(30, '2018-05-02', 6, 563.1496, NULL, -1),
(31, '2018-05-02', 7, 889.501, NULL, -1),
(32, '2018-05-02', 8, 63.8, NULL, -1),
(33, '2018-05-02', 9, 24.4, NULL, -1),
(34, '2018-05-02', 11, 402.24, NULL, -1),
(35, '2018-05-02', 35, 28.227, NULL, -1),
(36, '2018-05-02', 36, 83, NULL, -1),
(37, '2018-05-03', 32, 568.4584, NULL, -1),
(38, '2018-05-03', 33, 89, NULL, -1),
(39, '2018-05-03', 3, 88.4636, NULL, -1),
(40, '2018-05-03', 4, 71.3816, NULL, -1),
(41, '2018-05-03', 5, 1570.6879, NULL, -1),
(42, '2018-05-03', 6, 563.1496, NULL, -1),
(43, '2018-05-03', 7, 892.446, NULL, -1),
(44, '2018-05-03', 8, 63.8, NULL, -1),
(45, '2018-05-03', 9, 24.468, NULL, -1),
(46, '2018-05-03', 11, 410.752, NULL, -1),
(47, '2018-05-03', 35, 28.227, NULL, -1),
(48, '2018-05-03', 36, 85, NULL, -1),
(49, '2018-05-04', 32, 568.4584, NULL, -1),
(50, '2018-05-04', 33, 90, NULL, -1),
(51, '2018-05-04', 3, 88.4798, NULL, -1),
(52, '2018-05-04', 4, 71.398, NULL, -1),
(53, '2018-05-04', 5, 1572.884, NULL, -1),
(54, '2018-05-04', 6, 563.1496, NULL, -1),
(55, '2018-05-04', 7, 895.255, NULL, -1),
(56, '2018-05-04', 8, 64.9, NULL, -1),
(57, '2018-05-04', 9, 24.579, NULL, -1),
(58, '2018-05-04', 11, NULL, NULL, -1),
(59, '2018-05-04', 35, 28.227, NULL, -1),
(60, '2018-05-04', 36, 86, NULL, -1),
(61, '2018-05-07', 32, 568.4584, NULL, -1),
(62, '2018-05-07', 33, 93, NULL, -1),
(63, '2018-05-07', 3, 88.5022, NULL, -1),
(64, '2018-05-07', 4, 71.473, NULL, -1),
(65, '2018-05-07', 5, 1578.886, NULL, -1),
(66, '2018-05-07', 6, 563.1496, NULL, -1),
(67, '2018-05-07', 7, 902.026, NULL, -1),
(68, '2018-05-07', 8, 65.9, NULL, -1),
(69, '2018-05-07', 9, 24.924, NULL, -1),
(70, '2018-05-07', 11, 416.578, NULL, -1),
(71, '2018-05-07', 35, 28.227, NULL, -1),
(72, '2018-05-07', 36, 88, NULL, -1),
(73, '2018-05-08', 32, 568.458, NULL, -1),
(74, '2018-05-08', 33, 94, NULL, -1),
(75, '2018-05-08', 3, 88.517, NULL, -1),
(76, '2018-05-08', 4, 71.485, NULL, -1),
(77, '2018-05-08', 5, 1580.911, NULL, -1),
(78, '2018-05-08', 6, 563.1419, NULL, -1),
(79, '2018-05-08', 7, 904.8, NULL, -1),
(80, '2018-05-08', 8, 65.9, NULL, -1),
(81, '2018-05-08', 9, 24.97, NULL, -1),
(82, '2018-05-08', 11, 416.68, NULL, -1),
(83, '2018-05-08', 35, 28.227, NULL, -1),
(84, '2018-05-08', 36, 89, NULL, -1),
(85, '2018-05-09', 32, 568.458, NULL, -1),
(86, '2018-05-09', 33, 95, NULL, -1),
(87, '2018-05-09', 3, 88.655, NULL, -1),
(88, '2018-05-09', 4, 71.554, NULL, -1),
(89, '2018-05-09', 5, 1583.074, NULL, -1),
(90, '2018-05-09', 6, 563.149, NULL, -1),
(91, '2018-05-09', 7, 907.469, NULL, -1),
(92, '2018-05-09', 8, 65.9, NULL, -1),
(93, '2018-05-09', 9, 25.055, NULL, -1),
(94, '2018-05-09', 11, 416.8, NULL, -1),
(95, '2018-05-09', 35, 28.227, NULL, -1),
(96, '2018-05-09', 36, 89, NULL, -1),
(97, '2018-05-11', 32, 568.458, NULL, -1),
(98, '2018-05-11', 33, 95, NULL, -1),
(99, '2018-05-11', 3, 99.012, NULL, -1),
(100, '2018-05-11', 4, 71.634, NULL, -1),
(101, '2018-05-11', 5, 1587.311, NULL, -1),
(102, '2018-05-11', 6, 563.149, NULL, -1),
(103, '2018-05-11', 7, 912.085, NULL, -1),
(104, '2018-05-11', 8, 66.6, NULL, -1),
(105, '2018-05-11', 9, 25.429, NULL, -1),
(106, '2018-05-11', 11, 416.84, NULL, -1),
(107, '2018-05-11', 35, 28.277, NULL, -1),
(108, '2018-05-11', 36, 90, NULL, -1),
(109, '2018-05-10', 32, 568.458, NULL, -1),
(110, '2018-05-10', 33, 99.45, NULL, -1),
(111, '2018-05-10', 3, 88.655, NULL, -1),
(112, '2018-05-10', 4, 71.59, NULL, -1),
(113, '2018-05-10', 5, 1585.257, NULL, -1),
(114, '2018-05-10', 6, 563.145, NULL, -1),
(115, '2018-05-10', 7, 909.424, NULL, -1),
(116, '2018-05-10', 8, 66.8, NULL, -1),
(117, '2018-05-10', 9, 25.29, NULL, -1),
(118, '2018-05-10', 11, 417.45, NULL, -1),
(119, '2018-05-10', 35, 28.227, NULL, -1),
(120, '2018-05-10', 36, 92, NULL, -1),
(121, '2018-05-14', 32, 568.458, NULL, -1),
(122, '2018-05-14', 33, 100, NULL, -1),
(123, '2018-05-14', 3, 99.56, NULL, -1),
(124, '2018-05-14', 4, 71.688, NULL, -1),
(125, '2018-05-14', 5, 1592.52, NULL, -1),
(126, '2018-05-14', 6, 563.149, NULL, -1),
(127, '2018-05-14', 7, 920.451, NULL, -1),
(128, '2018-05-14', 8, 67.4, NULL, -1),
(129, '2018-05-14', 9, 25.429, NULL, -1),
(130, '2018-05-14', 11, 417.65, NULL, -1),
(131, '2018-05-14', 35, 28.227, NULL, -1),
(132, '2018-05-14', 36, 92, NULL, -1),
(133, '2018-05-15', 32, 568.458, NULL, -1),
(134, '2018-05-15', 33, 101, NULL, -1),
(135, '2018-05-15', 3, 90.136, NULL, -1),
(136, '2018-05-15', 4, 71.717, NULL, -1),
(137, '2018-05-15', 5, 1594.013, NULL, -1),
(138, '2018-05-15', 6, 563.149, NULL, -1),
(139, '2018-05-15', 7, 922.114, NULL, -1),
(140, '2018-05-15', 8, 67.6, NULL, -1),
(141, '2018-05-15', 9, 25.823, NULL, -1),
(142, '2018-05-15', 11, 418.45, NULL, -1),
(143, '2018-05-15', 35, 28.227, NULL, -1),
(144, '2018-05-15', 36, 90.23, NULL, -1),
(145, '2018-05-16', 32, 568.458, NULL, -1),
(146, '2018-05-16', 33, 101, NULL, -1),
(147, '2018-05-16', 3, 90.368, NULL, -1),
(148, '2018-05-16', 4, 71.729, NULL, -1),
(149, '2018-05-16', 5, 1595.158, NULL, -1),
(150, '2018-05-16', 6, 563.149, NULL, -1),
(151, '2018-05-16', 7, 924.221, NULL, -1),
(152, '2018-05-16', 8, 68.2, NULL, -1),
(153, '2018-05-16', 9, 25.91, NULL, -1),
(154, '2018-05-16', 11, 418.785, NULL, -1),
(155, '2018-05-16', 35, 28.227, NULL, -1),
(156, '2018-05-16', 36, 95.34, NULL, -1),
(157, '2018-05-17', 32, 568.458, NULL, -1),
(158, '2018-05-17', 33, 102, NULL, -1),
(159, '2018-05-17', 3, 90.881, NULL, -1),
(160, '2018-05-17', 4, 71.809, NULL, -1),
(161, '2018-05-17', 5, 1595.983, NULL, -1),
(162, '2018-05-17', 6, 563.149, NULL, -1),
(163, '2018-05-17', 7, 927.69, NULL, -1),
(164, '2018-05-17', 8, 66.7, NULL, -1),
(165, '2018-05-17', 9, 26.034, NULL, -1),
(166, '2018-05-17', 11, 419.342, NULL, -1),
(167, '2018-05-17', 35, 28.227, NULL, -1),
(168, '2018-05-17', 36, 95.85, NULL, -1),
(169, '2018-05-18', 32, 568.458, NULL, -1),
(170, '2018-05-18', 33, 103, NULL, -1),
(171, '2018-05-18', 3, 91.117, NULL, -1),
(172, '2018-05-18', 4, 71.878, NULL, -1),
(173, '2018-05-18', 5, 1595.983, NULL, -1),
(174, '2018-05-18', 6, 563.149, NULL, -1),
(175, '2018-05-18', 7, 930, NULL, -1),
(176, '2018-05-18', 8, 69.2, NULL, -1),
(177, '2018-05-18', 9, 26.116, NULL, -1),
(178, '2018-05-18', 11, 420.35, NULL, -1),
(179, '2018-05-18', 35, 28.227, NULL, -1),
(180, '2018-05-18', 36, 95.88, NULL, -1),
(181, '2018-05-21', 32, 568.458, NULL, -1),
(182, '2018-05-21', 33, 106, NULL, -1),
(183, '2018-05-21', 3, 91.645, NULL, -1),
(184, '2018-05-21', 4, 71.932, NULL, -1),
(185, '2018-05-21', 5, 1595.983, NULL, -1),
(186, '2018-05-21', 6, 563.15, NULL, -1),
(187, '2018-05-21', 7, 938.99, NULL, -1),
(188, '2018-05-21', 8, 69.8, NULL, -1),
(189, '2018-05-21', 9, 26.544, NULL, -1),
(190, '2018-05-21', 11, 420.503, NULL, -1),
(191, '2018-05-21', 35, 28.227, NULL, -1),
(192, '2018-05-21', 36, 94, NULL, -1),
(193, '2018-05-22', 32, 568.458, NULL, -1),
(194, '2018-05-22', 33, 107, NULL, -1),
(195, '2018-05-22', 3, 91.935, NULL, -1),
(196, '2018-05-22', 4, 71.987, NULL, -1),
(197, '2018-05-22', 5, 1595.983, NULL, -1),
(198, '2018-05-22', 6, 563.15, NULL, -1),
(199, '2018-05-22', 7, 941.974, NULL, -1),
(200, '2018-05-22', 8, 70.5, NULL, -1),
(201, '2018-05-22', 9, 26.544, NULL, -1),
(202, '2018-05-22', 11, 422.502, NULL, -1),
(203, '2018-05-22', 35, 28.227, NULL, -1),
(204, '2018-05-22', 36, 95, NULL, -1),
(205, '2018-05-23', 32, 568.458, NULL, -1),
(206, '2018-05-23', 33, 108, NULL, -1),
(207, '2018-05-23', 3, 92.144, NULL, -1),
(208, '2018-05-23', 4, 72.018, NULL, -1),
(209, '2018-05-23', 5, 1595.983, NULL, -1),
(210, '2018-05-23', 6, 563.149, NULL, -1),
(211, '2018-05-23', 7, 944.4, NULL, -1),
(212, '2018-05-23', 8, 70.8, NULL, -1),
(213, '2018-05-23', 9, 26.88, NULL, -1),
(214, '2018-05-23', 11, 425.152, NULL, -1),
(215, '2018-05-23', 35, 28.227, NULL, -1),
(216, '2018-05-23', 36, 98, NULL, -1),
(217, '2018-05-24', 32, 568.458, NULL, -1),
(218, '2018-05-24', 33, 108, NULL, -1),
(219, '2018-05-24', 3, 92.411, NULL, -1),
(220, '2018-05-24', 4, 72.073, NULL, -1),
(221, '2018-05-24', 5, 1595.983, NULL, -1),
(222, '2018-05-24', 6, 563.149, NULL, -1),
(223, '2018-05-24', 7, 944.431, NULL, -1),
(224, '2018-05-24', 8, 71.2, NULL, -1),
(225, '2018-05-24', 9, 26.809, NULL, -1),
(226, '2018-05-24', 11, 431.761, NULL, -1),
(227, '2018-05-24', 35, 28.227, NULL, -1),
(228, '2018-05-24', 36, 98, NULL, -1),
(229, '2018-05-25', 32, 568.458, NULL, -1),
(230, '2018-05-25', 33, 109, NULL, -1),
(231, '2018-05-25', 3, 92.734, NULL, -1),
(232, '2018-05-25', 4, 72.095, NULL, -1),
(233, '2018-05-25', 5, 1595.983, NULL, -1),
(234, '2018-05-25', 6, 563.149, NULL, -1),
(235, '2018-05-25', 7, 944.431, NULL, -1),
(236, '2018-05-25', 8, 71.2, NULL, -1),
(237, '2018-05-25', 9, 27.051, NULL, -1),
(238, '2018-05-25', 11, 432.84, NULL, -1),
(239, '2018-05-25', 35, 28.227, NULL, -1),
(240, '2018-05-25', 36, 98, NULL, -1),
(241, '2018-05-28', 1, 0, NULL, -1),
(242, '2018-05-28', 2, 110, NULL, -1),
(243, '2018-05-28', 3, 93.426, NULL, -1),
(244, '2018-05-28', 4, 72.268, NULL, -1),
(245, '2018-05-28', 5, 1595.983, NULL, -1),
(246, '2018-05-28', 6, 563.149, NULL, -1),
(247, '2018-05-28', 7, 944.431, NULL, -1),
(248, '2018-05-28', 8, 72.4, NULL, -1),
(249, '2018-05-28', 9, 27.634, NULL, -1),
(250, '2018-05-28', 11, 0, NULL, -1),
(251, '2018-05-28', 12, 0, NULL, -1),
(252, '2018-05-28', 13, 0, NULL, -1),
(253, '2018-05-29', 1, 0, NULL, -1),
(254, '2018-05-29', 2, 112, NULL, -1),
(255, '2018-05-29', 3, 93.849, NULL, -1),
(256, '2018-05-29', 4, 72.317, NULL, -1),
(257, '2018-05-29', 5, 1597.32, NULL, -1),
(258, '2018-05-29', 6, 563.149, NULL, -1),
(259, '2018-05-29', 7, 944.431, NULL, -1),
(260, '2018-05-29', 8, 72.4, NULL, -1),
(261, '2018-05-29', 9, 27.788, NULL, -1),
(262, '2018-05-29', 10, 437.666, NULL, -1),
(263, '2018-05-29', 11, 3, NULL, -1),
(264, '2018-05-29', 12, 0, NULL, -1),
(265, '2018-05-29', 13, 0, NULL, -1),
(266, '2018-05-30', 1, 2, NULL, -1),
(267, '2018-05-30', 2, 114, NULL, -1),
(268, '2018-05-30', 3, 93.983, NULL, -1),
(269, '2018-05-30', 4, 72.354, NULL, -1),
(270, '2018-05-30', 5, 1597.32, NULL, -1),
(271, '2018-05-30', 6, 563.496, NULL, -1),
(272, '2018-05-30', 7, 944.431, NULL, -1),
(273, '2018-05-30', 8, 73.2, NULL, -1),
(274, '2018-05-30', 9, 27.882, NULL, -1),
(275, '2018-05-30', 10, 438.59, NULL, -1),
(276, '2018-05-30', 11, 5, NULL, -1),
(277, '2018-05-30', 12, 0, NULL, -1),
(278, '2018-05-30', 13, 0, NULL, -1),
(279, '2018-05-31', 1, 2, NULL, -1),
(280, '2018-05-31', 2, 118, NULL, -1),
(281, '2018-05-31', 3, 94.438, NULL, -1),
(282, '2018-05-31', 4, 72.416, NULL, -1),
(283, '2018-05-31', 5, 1600.803, NULL, -1),
(284, '2018-05-31', 6, 563.496, NULL, -1),
(285, '2018-05-31', 7, 944.431, NULL, -1),
(286, '2018-05-31', 8, 73.2, NULL, -1),
(287, '2018-05-31', 9, 27.882, NULL, -1),
(288, '2018-05-31', 10, 438.59, NULL, -1),
(289, '2018-05-31', 11, 5, NULL, -1),
(290, '2018-05-31', 12, 0, NULL, -1),
(291, '2018-05-31', 13, 0, NULL, -1),
(292, '2018-06-01', 1, 2, NULL, -1),
(293, '2018-06-01', 2, 122, NULL, -1),
(294, '2018-06-01', 3, 94.628, NULL, -1),
(295, '2018-06-01', 4, 72.537, NULL, -1),
(296, '2018-06-01', 5, 1602.883, NULL, -1),
(297, '2018-06-01', 6, 563.496, NULL, -1),
(298, '2018-06-01', 7, 944.431, NULL, -1),
(299, '2018-06-01', 8, 76.6, NULL, -1),
(300, '2018-06-01', 9, 28.138, NULL, -1),
(301, '2018-06-01', 10, 440.83, NULL, -1),
(302, '2018-06-01', 11, 9, NULL, -1),
(303, '2018-06-01', 12, 1, NULL, -1),
(304, '2018-06-01', 13, 0, NULL, -1),
(305, '2018-06-03', 1, 2, NULL, -1),
(306, '2018-06-03', 2, 122, NULL, -1),
(307, '2018-06-03', 3, 94.752, NULL, -1),
(308, '2018-06-03', 4, 72.544, NULL, -1),
(309, '2018-06-03', 5, 1606.281, NULL, -1),
(310, '2018-06-03', 6, 563.496, NULL, -1),
(311, '2018-06-03', 7, 944.431, NULL, -1),
(312, '2018-06-03', 8, 79.6, NULL, -1),
(313, '2018-06-03', 9, 28.313, NULL, -1),
(314, '2018-06-03', 10, 443.463, NULL, -1),
(315, '2018-06-03', 11, 26, NULL, -1),
(316, '2018-06-03', 12, 1, NULL, -1),
(317, '2018-06-03', 13, 0, NULL, -1),
(318, '2018-06-04', 1, 2, NULL, -1),
(319, '2018-06-04', 2, 123, NULL, -1),
(320, '2018-06-04', 3, 94.936, NULL, -1),
(321, '2018-06-04', 4, 72.544, NULL, -1),
(322, '2018-06-04', 5, 1608.016, NULL, -1),
(323, '2018-06-04', 6, 563.496, NULL, -1),
(324, '2018-06-04', 7, 944.431, NULL, -1),
(325, '2018-06-04', 8, 79.6, NULL, -1),
(326, '2018-06-04', 9, 28.436, NULL, -1),
(327, '2018-06-04', 10, 446.691, NULL, -1),
(328, '2018-06-04', 11, 26, NULL, -1),
(329, '2018-06-04', 12, 1, NULL, -1),
(330, '2018-06-04', 13, 0, NULL, -1),
(331, '2018-06-05', 1, 2, NULL, -1),
(332, '2018-06-05', 2, 123, NULL, -1),
(333, '2018-06-05', 3, 95.198, NULL, -1),
(334, '2018-06-05', 4, 72.55, NULL, -1),
(335, '2018-06-05', 5, 1609.906, NULL, -1),
(336, '2018-06-05', 6, 563.496, NULL, -1),
(337, '2018-06-05', 7, 944.431, NULL, -1),
(338, '2018-06-05', 8, 80.2, NULL, -1),
(339, '2018-06-05', 9, 28.52, NULL, -1),
(340, '2018-06-05', 10, 448.669, NULL, -1),
(341, '2018-06-05', 11, 29, NULL, -1),
(342, '2018-06-05', 12, 1, NULL, -1),
(343, '2018-06-05', 13, 0, NULL, -1),
(344, '2018-06-06', 1, 2, NULL, -1),
(345, '2018-06-06', 2, 123, NULL, -1),
(346, '2018-06-06', 3, 95.446, NULL, -1),
(347, '2018-06-06', 4, 72.554, NULL, -1),
(348, '2018-06-06', 5, 1611.854, NULL, -1),
(349, '2018-06-06', 6, 563.496, NULL, -1),
(350, '2018-06-06', 7, 944.431, NULL, -1),
(351, '2018-06-06', 8, 80.4, NULL, -1),
(352, '2018-06-06', 9, 28.587, NULL, -1),
(353, '2018-06-06', 10, 450.1, NULL, -1),
(354, '2018-06-06', 11, 32, NULL, -1),
(355, '2018-06-06', 12, 1, NULL, -1),
(356, '2018-06-06', 13, 2, NULL, -1),
(357, '2018-06-07', 1, 2, NULL, -1),
(358, '2018-06-07', 2, 125, NULL, -1),
(359, '2018-06-07', 3, 95.672, NULL, -1),
(360, '2018-06-07', 4, 72.569, NULL, -1),
(361, '2018-06-07', 5, 1613.84, NULL, -1),
(362, '2018-06-07', 6, 563.496, NULL, -1),
(363, '2018-06-07', 7, 947.5, NULL, -1),
(364, '2018-06-07', 8, 80.4, NULL, -1),
(365, '2018-06-07', 9, 28.728, NULL, -1),
(366, '2018-06-07', 10, 451.144, NULL, -1),
(367, '2018-06-07', 11, 32, NULL, -1),
(368, '2018-06-07', 12, 2, NULL, -1),
(369, '2018-06-07', 13, 2, NULL, -1),
(370, '2018-06-08', 1, 2, NULL, -1),
(371, '2018-06-08', 2, 10, NULL, -1),
(372, '2018-06-08', 3, 95.97, NULL, -1),
(373, '2018-06-08', 4, 72.592, NULL, -1),
(374, '2018-06-08', 5, 1615.606, NULL, -1),
(375, '2018-06-08', 6, 563.496, NULL, -1),
(376, '2018-06-08', 7, 947.5, NULL, -1),
(377, '2018-06-08', 8, 81.2, NULL, -1),
(378, '2018-06-08', 9, 28.758, NULL, -1),
(379, '2018-06-08', 10, 452.392, NULL, -1),
(380, '2018-06-08', 11, 34, NULL, -1),
(381, '2018-06-08', 12, 2, NULL, -1),
(382, '2018-06-08', 13, 3, NULL, -1),
(383, '2018-06-10', 1, 2, NULL, -1),
(384, '2018-06-10', 2, 12, NULL, -1),
(385, '2018-06-10', 3, 96.485, NULL, -1),
(386, '2018-06-10', 4, 72.686, NULL, -1),
(387, '2018-06-10', 5, 1617.445, NULL, -1),
(388, '2018-06-10', 6, 563.496, NULL, -1),
(389, '2018-06-10', 7, 955.106, NULL, -1),
(390, '2018-06-10', 8, 83.7, NULL, -1),
(391, '2018-06-10', 9, 28.758, NULL, -1),
(392, '2018-06-10', 10, 454.56, NULL, -1),
(393, '2018-06-10', 11, 37, NULL, -1),
(394, '2018-06-10', 12, 2, NULL, -1),
(395, '2018-06-10', 13, 4, NULL, -1),
(396, '2018-06-11', 1, 2, NULL, -1),
(397, '2018-06-11', 2, 13, NULL, -1),
(398, '2018-06-11', 3, 96.585, NULL, -1),
(399, '2018-06-11', 4, 72.69, NULL, -1),
(400, '2018-06-11', 5, 1621.044, NULL, -1),
(401, '2018-06-11', 6, 563.496, NULL, -1),
(402, '2018-06-11', 7, 958.371, NULL, -1),
(403, '2018-06-11', 8, 86.6, NULL, -1),
(404, '2018-06-11', 9, 29.038, NULL, -1),
(405, '2018-06-11', 10, 459.912, NULL, -1),
(406, '2018-06-11', 11, 37, NULL, -1),
(407, '2018-06-11', 12, 2, NULL, -1),
(408, '2018-06-11', 13, 5, NULL, -1),
(409, '2018-06-12', 1, 2, NULL, -1),
(410, '2018-06-12', 2, 15, NULL, -1),
(411, '2018-06-12', 3, 96.931, NULL, -1),
(412, '2018-06-12', 4, 72.751, NULL, -1),
(413, '2018-06-12', 5, 1622.841, NULL, -1),
(414, '2018-06-12', 6, 563.496, NULL, -1),
(415, '2018-06-12', 7, 959.762, NULL, -1),
(416, '2018-06-12', 8, 90, NULL, -1),
(417, '2018-06-12', 9, 29.081, NULL, -1),
(418, '2018-06-12', 10, 461.073, NULL, -1),
(419, '2018-06-12', 11, 39, NULL, -1),
(420, '2018-06-12', 12, 4, NULL, -1),
(421, '2018-06-12', 13, 6, NULL, -1),
(422, '2018-06-13', 1, 2, NULL, -1),
(423, '2018-06-13', 2, 15, NULL, -1),
(424, '2018-06-13', 3, 97.223, NULL, -1),
(425, '2018-06-13', 4, 72.786, NULL, -1),
(426, '2018-06-13', 5, 1624.937, NULL, -1),
(427, '2018-06-13', 6, 563.496, NULL, -1),
(428, '2018-06-13', 7, 959.861, NULL, -1),
(429, '2018-06-13', 8, 93, NULL, -1),
(430, '2018-06-13', 9, 29.179, NULL, -1),
(431, '2018-06-13', 10, 462.345, NULL, -1),
(432, '2018-06-13', 11, 41, NULL, -1),
(433, '2018-06-13', 12, 4, NULL, -1),
(434, '2018-06-13', 13, 7, NULL, -1),
(435, '2018-06-14', 1, 2, NULL, -1),
(436, '2018-06-14', 2, 15, NULL, -1),
(437, '2018-06-14', 3, 97.645, NULL, -1),
(438, '2018-06-14', 4, 72.831, NULL, -1),
(439, '2018-06-14', 5, 1627.09, NULL, -1),
(440, '2018-06-14', 6, 100, NULL, -1),
(441, '2018-06-14', 7, 959.861, NULL, -1),
(442, '2018-06-14', 8, 93.4, NULL, -1),
(443, '2018-06-14', 9, 29.288, NULL, -1),
(444, '2018-06-14', 10, 463.443, NULL, -1),
(445, '2018-06-14', 11, 43, NULL, -1),
(446, '2018-06-14', 12, 4, NULL, -1),
(447, '2018-06-14', 13, 8, NULL, -1),
(448, '2018-06-15', 1, 2, NULL, -1),
(449, '2018-06-15', 2, 15, NULL, -1),
(450, '2018-06-15', 3, 97.945, NULL, -1),
(451, '2018-06-15', 4, 72.858, NULL, -1),
(452, '2018-06-15', 5, 1627.09, NULL, -1),
(453, '2018-06-15', 6, 100, NULL, -1),
(454, '2018-06-15', 7, 959.861, NULL, -1),
(455, '2018-06-15', 8, 93, NULL, -1),
(456, '2018-06-15', 9, 29.426, NULL, -1),
(457, '2018-06-15', 10, 464.306, NULL, -1),
(458, '2018-06-15', 11, 45, NULL, -1),
(459, '2018-06-15', 12, 4, NULL, -1),
(460, '2018-06-15', 13, 8, NULL, -1),
(461, '2018-06-18', 1, 2, NULL, -1),
(462, '2018-06-18', 2, 18, NULL, -1),
(463, '2018-06-18', 3, 98.501, NULL, -1),
(464, '2018-06-18', 4, 72.891, NULL, -1),
(465, '2018-06-18', 5, 1633.454, NULL, -1),
(466, '2018-06-18', 6, 100, NULL, -1),
(467, '2018-06-18', 7, 959.861, NULL, -1),
(468, '2018-06-18', 8, 105.1, NULL, -1),
(469, '2018-06-18', 9, 29.764, NULL, -1),
(470, '2018-06-18', 10, 465.759, NULL, -1),
(471, '2018-06-18', 11, 57, NULL, -1),
(472, '2018-06-18', 12, 4, NULL, -1),
(473, '2018-06-18', 13, 12, NULL, -1),
(474, '2018-06-19', 1, 2, NULL, -1),
(475, '2018-06-19', 2, 19, NULL, -1),
(476, '2018-06-19', 3, 98.885, NULL, -1),
(477, '2018-06-19', 4, 72.938, NULL, -1),
(478, '2018-06-19', 5, 1635.222, NULL, -1),
(479, '2018-06-19', 6, 100, NULL, -1),
(480, '2018-06-19', 7, 959.861, NULL, -1),
(481, '2018-06-19', 8, 95.1, NULL, -1),
(482, '2018-06-19', 9, 29.861, NULL, -1),
(483, '2018-06-19', 10, 467.145, NULL, -1),
(484, '2018-06-19', 11, 61, NULL, -1),
(485, '2018-06-19', 12, 4, NULL, -1),
(486, '2018-06-19', 13, 13, NULL, -1),
(487, '2018-06-20', 1, 2, NULL, -1),
(488, '2018-06-20', 2, 19, NULL, -1),
(489, '2018-06-20', 3, 99.157, NULL, -1),
(490, '2018-06-20', 4, 72.99, NULL, -1),
(491, '2018-06-20', 5, 1636.649, NULL, -1),
(492, '2018-06-20', 6, 100, NULL, -1),
(493, '2018-06-20', 7, 960.649, NULL, -1),
(494, '2018-06-20', 8, 97.7, NULL, -1),
(495, '2018-06-20', 9, 29.958, NULL, -1),
(496, '2018-06-20', 10, 468.388, NULL, -1),
(497, '2018-06-20', 11, 64, NULL, -1),
(498, '2018-06-20', 12, 4, NULL, -1),
(499, '2018-06-20', 13, 14, NULL, -1),
(500, '2018-06-21', 1, 2, NULL, -1),
(501, '2018-06-21', 2, 20, NULL, -1),
(502, '2018-06-21', 3, 99.437, NULL, -1),
(503, '2018-06-21', 4, 73.031, NULL, -1),
(504, '2018-06-21', 5, 1638.628, NULL, -1),
(505, '2018-06-21', 6, 100, NULL, -1),
(506, '2018-06-21', 7, 964.001, NULL, -1),
(507, '2018-06-21', 8, 100.2, NULL, -1),
(508, '2018-06-21', 9, 30.14, NULL, -1),
(509, '2018-06-21', 10, 469.406, NULL, -1),
(510, '2018-06-21', 11, 68, NULL, -1),
(511, '2018-06-21', 12, 4, NULL, -1),
(512, '2018-06-21', 13, 15, NULL, -1),
(513, '2018-06-22', 1, 2, NULL, -1),
(514, '2018-06-22', 2, 21, NULL, -1),
(515, '2018-06-22', 3, 99.823, NULL, -1),
(516, '2018-06-22', 4, 73.064, NULL, -1),
(517, '2018-06-22', 5, 1640.808, NULL, -1),
(518, '2018-06-22', 6, 243, NULL, -1),
(519, '2018-06-22', 7, 967.991, NULL, -1),
(520, '2018-06-22', 8, 102.6, NULL, -1),
(521, '2018-06-22', 9, 30.208, NULL, 0),
(522, '2018-06-22', 10, 470.876, NULL, 0),
(523, '2018-06-22', 11, 71, NULL, 0),
(524, '2018-06-22', 12, 5, NULL, 0),
(525, '2018-06-22', 13, 15, NULL, 0),
(526, '2018-06-24', 1, 2, NULL, 0),
(527, '2018-06-24', 2, 23, NULL, 0),
(528, '2018-06-24', 3, 100.078, NULL, 0),
(529, '2018-06-24', 4, 73.064, NULL, 0),
(530, '2018-06-24', 5, 1644.184, NULL, 0),
(531, '2018-06-24', 6, 100, NULL, 0),
(532, '2018-06-24', 7, 970.521, NULL, 0),
(533, '2018-06-24', 8, 10, NULL, 0),
(534, '2018-06-24', 9, 30.208, NULL, 0),
(535, '2018-06-24', 10, 478.401, NULL, 0),
(536, '2018-06-24', 11, 79, NULL, 0),
(537, '2018-06-24', 12, 5, NULL, 0),
(538, '2018-06-24', 13, 21, NULL, 0),
(539, '2018-06-25', 1, 2, NULL, 0),
(540, '2018-06-25', 2, 24, NULL, 0),
(541, '2018-06-25', 3, 100.272, NULL, 0),
(542, '2018-06-25', 4, 73.123, NULL, 0),
(543, '2018-06-25', 5, 1645.915, NULL, 0),
(544, '2018-06-25', 6, 100, NULL, 0),
(545, '2018-06-25', 7, 970.522, NULL, 0),
(546, '2018-06-25', 8, 10, NULL, 0),
(547, '2018-06-25', 9, 30.484, NULL, 0),
(548, '2018-06-25', 10, 479.502, NULL, 0),
(549, '2018-06-25', 11, 83, NULL, 0),
(550, '2018-06-25', 12, 5, NULL, 0),
(551, '2018-06-25', 13, 21, NULL, 0),
(552, '2018-06-26', 1, 4, NULL, 0),
(553, '2018-06-26', 2, 25, NULL, 0),
(554, '2018-06-26', 3, 100.528, NULL, 0),
(555, '2018-06-26', 4, 73.132, NULL, 0),
(556, '2018-06-26', 5, 1648.668, NULL, 0),
(557, '2018-06-26', 6, 100, NULL, 0),
(558, '2018-06-26', 7, 970.522, NULL, 0),
(559, '2018-06-26', 8, 10, NULL, 0),
(560, '2018-06-26', 9, 30.562, NULL, 0),
(561, '2018-06-26', 10, 483.15, NULL, 0),
(562, '2018-06-26', 11, 86, NULL, 0),
(563, '2018-06-26', 12, 5, NULL, 0),
(564, '2018-06-26', 13, 24, NULL, 0),
(565, '2018-06-27', 1, 4, NULL, 0),
(566, '2018-06-27', 2, 25, NULL, 0),
(567, '2018-06-27', 3, 100.62, NULL, 0),
(568, '2018-06-27', 4, 73.148, NULL, 0),
(569, '2018-06-27', 5, 1650.798, NULL, 0),
(570, '2018-06-27', 6, 100, NULL, 0),
(571, '2018-06-27', 7, 970.587, NULL, 0),
(572, '2018-06-27', 8, 11, NULL, 0),
(573, '2018-06-27', 9, 30.672, NULL, 0),
(574, '2018-06-27', 10, 484, NULL, 0),
(575, '2018-06-27', 11, 90, NULL, 0),
(576, '2018-06-27', 12, 5, NULL, 0),
(577, '2018-06-27', 13, 24, NULL, 0),
(578, '2018-06-28', 1, 4, NULL, 0),
(579, '2018-06-28', 2, 26, NULL, 0),
(580, '2018-06-28', 3, 101, NULL, 0),
(581, '2018-06-28', 4, 73.226, NULL, 0),
(582, '2018-06-28', 5, 1652.596, NULL, 0),
(583, '2018-06-28', 6, 100, NULL, 0),
(584, '2018-06-28', 7, 972.44, NULL, 0),
(585, '2018-06-28', 8, 11, NULL, 0),
(586, '2018-06-28', 9, 30.849, NULL, 0),
(587, '2018-06-28', 10, 485.776, NULL, 0),
(588, '2018-06-28', 11, 94, NULL, 0),
(589, '2018-06-28', 12, 6, NULL, 0),
(590, '2018-06-28', 13, 25, NULL, 0),
(591, '2018-06-28', 14, 9.424, NULL, 0),
(592, '2018-06-29', 1, 4, NULL, 0),
(593, '2018-06-29', 2, 27, NULL, 0),
(594, '2018-06-29', 3, 101.392, NULL, 0),
(595, '2018-06-29', 4, 73.229, NULL, 0),
(596, '2018-06-29', 5, 1654.28, NULL, 0),
(597, '2018-06-29', 6, 0, NULL, 0),
(598, '2018-06-29', 7, 974.922, NULL, 0),
(599, '2018-06-29', 8, 11, NULL, 0),
(600, '2018-06-29', 9, 30.886, NULL, 0),
(601, '2018-06-29', 10, 486.54, NULL, 0),
(602, '2018-06-29', 11, 97, NULL, 0),
(603, '2018-06-29', 12, 6, NULL, 0),
(604, '2018-06-29', 13, 26, NULL, 0),
(605, '2018-06-29', 14, 10.595, NULL, 0),
(606, '2018-06-30', 1, 5, NULL, -1),
(607, '2018-06-30', 2, 27, NULL, -1),
(608, '2018-06-30', 3, 101.853, NULL, -1),
(609, '2018-06-30', 4, 73.243, NULL, -1),
(610, '2018-06-30', 5, 1655.959, NULL, -1),
(611, '2018-06-30', 6, 0, NULL, 0),
(612, '2018-06-30', 7, 979.401, NULL, -1),
(613, '2018-06-30', 8, 120.8, NULL, -1),
(614, '2018-06-30', 9, 30.976, NULL, -1),
(615, '2018-06-30', 10, 486.915, NULL, -1),
(616, '2018-06-30', 11, 101, NULL, -1),
(617, '2018-06-30', 12, 6, NULL, -1),
(618, '2018-06-30', 13, 26, NULL, -1),
(619, '2018-06-30', 14, 22.062, NULL, -1),
(620, '2018-08-24', 1, 16, NULL, 0),
(621, '2018-07-01', 7, 982.541, NULL, 0),
(622, '2018-07-02', 7, 983.254, NULL, 0),
(623, '2018-07-03', 7, 984.801, NULL, 0),
(624, '2018-07-04', 7, 986.264, NULL, 0),
(625, '2018-07-05', 7, 987.801, NULL, 0),
(626, '2018-07-06', 7, 991.351, NULL, 0),
(627, '2018-07-08', 7, 995.781, NULL, 0),
(628, '2018-07-09', 7, 999.54, NULL, 0),
(629, '2018-07-11', 7, 1002.788, NULL, 0),
(630, '2018-07-10', 7, 1002.788, NULL, 0),
(631, '2018-07-12', 7, 1002.788, NULL, 0),
(632, '2018-07-13', 7, 1002.841, NULL, 0),
(633, '2018-07-14', 7, 1006.532, NULL, 0),
(634, '2018-07-15', 7, 1008.161, NULL, 0),
(635, '2018-07-16', 7, 1008.249, NULL, 0),
(636, '2018-07-17', 7, 1008.249, NULL, 0),
(637, '2018-07-18', 7, 1008.249, NULL, 0),
(638, '2018-07-19', 7, 1008.249, NULL, 0),
(639, '2018-07-20', 7, 1008.249, NULL, 0),
(640, '2018-07-23', 7, 1017.881, NULL, 0),
(641, '2018-07-24', 7, 1018.181, NULL, 0),
(642, '2018-07-25', 7, 1018.181, NULL, 0),
(643, '2018-07-26', 7, 1018.508, NULL, 0),
(644, '2018-07-29', 7, 1024.068, NULL, 0),
(645, '2018-07-30', 7, 1027.519, NULL, 0),
(646, '2018-07-31', 7, 1030.642, NULL, 0),
(647, '2018-08-01', 7, 1032.775, NULL, 0),
(648, '2018-08-02', 7, 1035.395, NULL, 0),
(649, '2018-08-03', 7, 1035.395, NULL, 0),
(650, '2018-08-05', 7, 1035.395, NULL, 0),
(651, '2018-08-06', 7, 1035.398, NULL, 0),
(652, '2018-08-07', 7, 1035.458, NULL, 0),
(653, '2018-08-08', 7, 1035.458, NULL, 0),
(654, '2018-08-09', 7, 1038.249, NULL, 0),
(655, '2018-08-10', 7, 1041.135, NULL, 0),
(656, '2018-08-12', 7, 1044.487, NULL, 0),
(657, '2018-08-13', 7, 1044.487, NULL, 0),
(658, '2018-08-14', 7, 1044.487, NULL, 0),
(659, '2018-08-15', 7, 1044.487, NULL, 0),
(660, '2018-08-16', 7, 1044.487, NULL, 0),
(661, '2018-08-21', 7, 1044.487, NULL, 0),
(662, '2018-08-17', 7, 1044.487, NULL, 0),
(663, '2018-08-22', 7, 1044.487, NULL, 0),
(664, '2018-08-23', 7, 1044.487, NULL, 0),
(665, '2018-08-24', 7, 1044.487, NULL, 0),
(666, '2018-08-26', 7, 1045.277, NULL, 0),
(667, '2018-08-27', 7, 1045.277, NULL, 0),
(668, '2018-08-28', 7, 1045.277, NULL, 0),
(669, '2018-08-29', 7, 1045.277, NULL, 0),
(670, '2018-08-30', 7, 1045.922, NULL, 0),
(671, '2018-09-02', 7, 1046.051, NULL, 0),
(672, '2018-09-01', 7, 1045.965, NULL, 0),
(673, '2018-09-03', 7, 1046.051, NULL, 0),
(674, '2018-09-04', 7, 1046.051, NULL, 0),
(675, '2018-09-05', 7, 1046.566, NULL, 0),
(676, '2018-09-06', 7, 1048.196, NULL, 0),
(677, '2018-09-07', 7, 1051.287, NULL, 0),
(678, '2018-09-09', 7, 1056.771, NULL, 0),
(679, '2018-09-12', 7, 1063.342, NULL, 0),
(680, '2018-09-13', 7, 1063.463, NULL, 0),
(681, '2018-09-14', 7, 1066.646, NULL, 0),
(682, '2018-09-16', 7, 1072.555, NULL, 0),
(683, '2018-09-17', 7, 1073.221, NULL, 0),
(684, '2018-09-18', 7, 1076.555, NULL, 0),
(685, '2018-09-19', 7, 1078.776, NULL, 0),
(686, '2018-09-20', 7, 1079.867, NULL, 0),
(687, '2018-07-01', 5, 1657.756, NULL, 0),
(688, '2018-07-02', 5, 1659.215, NULL, 0),
(689, '2018-07-03', 5, 1661.268, NULL, 0),
(690, '2018-07-04', 5, 1662.998, NULL, 0),
(691, '2018-07-05', 5, 1664.564, NULL, 0),
(692, '2018-07-06', 5, 1666.564, NULL, 0),
(693, '2018-07-08', 5, 1670.258, NULL, 0),
(694, '2018-07-09', 5, 1672.063, NULL, 0),
(695, '2018-07-11', 5, 1675.4354, NULL, 0),
(696, '2018-07-10', 5, 1674.158, NULL, 0),
(697, '2018-07-12', 5, 1675.594, NULL, 0),
(698, '2018-07-13', 5, 1677.508, NULL, 0),
(699, '2018-07-14', 5, 1677.921, NULL, 0),
(700, '2018-07-15', 5, 1679.431, NULL, 0),
(701, '2018-07-16', 5, 1681.319, NULL, 0),
(702, '2018-07-17', 5, 1683.498, NULL, 0),
(703, '2018-07-18', 5, 1685.291, NULL, 0),
(704, '2018-07-19', 5, 1687.241, NULL, 0),
(705, '2018-07-20', 5, 1689.297, NULL, 0),
(706, '2018-07-23', 5, 1696.682, NULL, 0),
(707, '2018-07-24', 5, 1698.221, NULL, 0),
(708, '2018-07-25', 5, 1700.405, NULL, 0),
(709, '2018-07-26', 5, 1702.228, NULL, 0),
(710, '2018-07-29', 5, 1707.541, NULL, 0),
(711, '2018-07-30', 5, 1709.018, NULL, 0),
(712, '2018-07-31', 5, 1710.767, NULL, 0),
(713, '2018-08-01', 5, 1712.622, NULL, 0),
(714, '2018-08-02', 5, 1714.905, NULL, 0),
(715, '2018-08-03', 5, 1716.329, NULL, 0),
(716, '2018-08-05', 5, 1719.911, NULL, 0),
(717, '2018-08-06', 5, 1723.399, NULL, 0),
(718, '2018-08-07', 5, 1725.018, NULL, 0),
(719, '2018-08-08', 5, 1726.761, NULL, 0),
(720, '2018-08-09', 5, 1728.249, NULL, 0),
(721, '2018-08-10', 5, 1731.204, NULL, 0),
(722, '2018-08-12', 5, 1734.849, NULL, 0),
(723, '2018-08-13', 5, 1736.757, NULL, 0),
(724, '2018-08-14', 5, 1738.214, NULL, 0),
(725, '2018-08-15', 5, 1740.23, NULL, 0),
(726, '2018-08-16', 5, 1742.178, NULL, 0),
(727, '2018-08-17', 5, 1744.022, NULL, 0),
(728, '2018-08-21', 5, 1744.762, NULL, 0),
(729, '2018-08-22', 5, 1751.664, NULL, 0),
(730, '2018-08-23', 5, 1753.91, NULL, 0),
(731, '2018-08-24', 5, 1755.571, NULL, 0),
(732, '2018-08-26', 5, 1759.402, NULL, 0),
(733, '2018-08-27', 5, 1761.18, NULL, 0),
(734, '2018-08-28', 5, 1761.267, NULL, 0),
(735, '2018-08-29', 5, 1761.867, NULL, 0),
(736, '2018-08-30', 5, 1766.798, NULL, 0),
(737, '2018-09-02', 5, 1772.674, NULL, 0),
(738, '2018-09-01', 5, 1768.985, NULL, 0),
(739, '2018-09-03', 5, 1774.365, NULL, 0),
(740, '2018-09-04', 5, 1776.451, NULL, 0),
(741, '2018-09-05', 5, 1777.9, NULL, 0),
(742, '2018-09-06', 5, 1779.824, NULL, 0),
(743, '2018-09-07', 5, 1782.09, NULL, 0),
(744, '2018-09-09', 5, 1785.584, NULL, 0),
(745, '2018-09-12', 5, 1790.694, NULL, 0),
(746, '2018-09-13', 5, 1792.629, NULL, 0),
(747, '2018-09-14', 5, 1794.281, NULL, 0),
(748, '2018-09-16', 5, 1797.325, NULL, 0),
(749, '2018-09-17', 5, 1798.541, NULL, 0),
(750, '2018-09-18', 5, 1800.074, NULL, 0),
(751, '2018-09-19', 5, 1802.047, NULL, 0),
(752, '2018-09-20', 5, 1803.582, NULL, 0),
(753, '2018-07-03', 6, 243, NULL, 0),
(754, '2018-07-01', 3, 102.062, NULL, 0),
(755, '2018-07-02', 3, 102.064, NULL, 0),
(756, '2018-07-03', 3, 102.064, NULL, 0),
(757, '2018-07-04', 3, 102.42, NULL, 0),
(758, '2018-07-05', 3, 102.511, NULL, 0),
(759, '2018-07-06', 3, 102.534, NULL, 0),
(760, '2018-07-08', 3, 102.537, NULL, 0),
(761, '2018-07-09', 3, 102.543, NULL, 0),
(762, '2018-07-11', 3, 102.5613, NULL, 0),
(763, '2018-07-10', 3, 102.553, NULL, 0),
(764, '2018-07-12', 3, 102.5613, NULL, 0),
(765, '2018-07-13', 3, 102.5613, NULL, 0),
(766, '2018-07-14', 3, 102.571, NULL, 0),
(767, '2018-07-15', 3, 102.593, NULL, 0),
(768, '2018-07-16', 3, 102.596, NULL, 0),
(769, '2018-07-17', 3, 102.602, NULL, 0),
(770, '2018-07-18', 3, 102.614, NULL, 0),
(771, '2018-07-19', 3, 102.624, NULL, 0),
(772, '2018-07-20', 3, 102.633, NULL, 0),
(773, '2018-07-23', 3, 102.656, NULL, 0),
(774, '2018-07-24', 3, 102.669, NULL, 0),
(775, '2018-07-25', 3, 102.679, NULL, 0),
(776, '2018-07-29', 3, 102.721, NULL, 0),
(777, '2018-07-30', 3, 102.721, NULL, 0),
(778, '2018-07-31', 3, 102.735, NULL, 0),
(779, '2018-08-01', 3, 102.758, NULL, 0),
(780, '2018-08-02', 3, 102.769, NULL, 0),
(781, '2018-08-03', 3, 102.777, NULL, 0),
(782, '2018-08-05', 3, 102.788, NULL, 0),
(783, '2018-08-06', 3, 102.799, NULL, 0),
(784, '2018-08-07', 3, 102.807, NULL, 0),
(785, '2018-08-08', 3, 102.817, NULL, 0),
(786, '2018-08-09', 3, 102.827, NULL, 0),
(787, '2018-08-10', 3, 102.843, NULL, 0),
(788, '2018-08-12', 3, 102.849, NULL, 0),
(789, '2018-08-13', 3, 102.858, NULL, 0),
(790, '2018-08-14', 3, 102.874, NULL, 0),
(791, '2018-08-15', 3, 102.88, NULL, 0),
(792, '2018-08-16', 3, 102.923, NULL, 0),
(793, '2018-08-21', 3, 102.945, NULL, 0),
(794, '2018-08-22', 3, 102.954, NULL, 0),
(795, '2018-08-23', 3, 102.965, NULL, 0),
(796, '2018-08-24', 3, 102.971, NULL, 0),
(797, '2018-08-26', 3, 102.987, NULL, 0),
(798, '2018-08-27', 3, 102.995, NULL, 0),
(799, '2018-08-28', 3, 102.996, NULL, 0),
(800, '2018-08-29', 3, 102.996, NULL, 0),
(801, '2018-08-30', 3, 103.015, NULL, 0),
(802, '2018-08-31', 3, 103.032, NULL, 0),
(803, '2018-09-02', 3, 103.043, NULL, 0),
(804, '2018-09-01', 3, 103.041, NULL, 0),
(805, '2018-09-03', 3, 103.053, NULL, 0),
(806, '2018-09-04', 3, 103.062, NULL, 0),
(807, '2018-09-05', 3, 103.076, NULL, 0),
(808, '2018-09-06', 3, 103.083, NULL, 0),
(809, '2018-09-07', 3, 103.085, NULL, 0),
(810, '2018-09-09', 3, 103.123, NULL, 0),
(811, '2018-09-12', 3, 103.151, NULL, 0),
(812, '2018-09-10', 3, 103.131, NULL, 0),
(813, '2018-09-11', 3, 103.141, NULL, 0),
(814, '2018-09-13', 3, 103.152, NULL, 0),
(815, '2018-09-14', 3, 103.153, NULL, 0),
(816, '2018-09-16', 3, 103.157, NULL, 0),
(817, '2018-09-17', 3, 103.159, NULL, 0),
(818, '2018-09-18', 3, 103.17, NULL, 0),
(819, '2018-09-19', 3, 103.174, NULL, 0),
(820, '2018-09-20', 3, 103.182, NULL, 0),
(821, '2018-07-01', 11, 106, NULL, 0),
(822, '2018-07-02', 11, 111, NULL, 0),
(823, '2018-07-03', 11, 113, NULL, 0),
(824, '2018-07-04', 11, 117, NULL, 0),
(825, '2018-07-05', 11, 119, NULL, 0),
(826, '2018-07-06', 11, 124, NULL, 0),
(827, '2018-07-08', 11, 131, NULL, 0),
(828, '2018-07-09', 11, 135, NULL, 0),
(829, '2018-07-11', 11, 140, NULL, 0),
(830, '2018-07-10', 11, 138, NULL, 0),
(831, '2018-07-12', 11, 143, NULL, 0),
(832, '2018-07-13', 11, 144, NULL, 0),
(833, '2018-07-14', 11, 148, NULL, 0),
(834, '2018-07-15', 11, 151, NULL, 0),
(835, '2018-07-16', 11, 156, NULL, 0),
(836, '2018-07-17', 11, 158, NULL, 0),
(837, '2018-07-18', 11, 161, NULL, 0),
(838, '2018-07-19', 11, 163, NULL, 0),
(839, '2018-07-20', 11, 166, NULL, 0),
(840, '2018-07-23', 11, 170, NULL, 0),
(841, '2018-07-24', 11, 178, NULL, 0),
(842, '2018-07-25', 11, 181, NULL, 0),
(843, '2018-07-26', 11, 183, NULL, 0),
(844, '2018-07-29', 11, 194, NULL, 0),
(845, '2018-07-30', 11, 197, NULL, 0),
(846, '2018-07-31', 11, 201, NULL, 0),
(847, '2018-08-01', 11, 204, NULL, 0),
(848, '2018-08-02', 11, 207, NULL, 0),
(849, '2018-08-03', 11, 209, NULL, 0),
(850, '2018-08-05', 11, 216, NULL, 0),
(851, '2018-08-06', 11, 216, NULL, 0),
(852, '2018-08-07', 11, 221, NULL, 0),
(853, '2018-08-08', 11, 224, NULL, 0),
(854, '2018-08-09', 11, 226, NULL, 0),
(855, '2018-08-10', 11, 227, NULL, 0),
(856, '2018-08-12', 11, 234, NULL, 0),
(857, '2018-08-13', 11, 237, NULL, 0),
(858, '2018-08-14', 11, 237, NULL, 0),
(859, '2018-08-15', 11, 241, NULL, 0),
(860, '2018-08-16', 11, 243, NULL, 0),
(861, '2018-08-17', 11, 245, NULL, 0),
(862, '2018-08-21', 11, 265, NULL, 0),
(863, '2018-08-22', 11, 267, NULL, 0),
(864, '2018-08-23', 11, 269, NULL, 0),
(865, '2018-08-24', 11, 271, NULL, 0),
(866, '2018-08-26', 11, 272, NULL, 0),
(867, '2018-08-27', 11, 274, NULL, 0),
(868, '2018-08-28', 11, 275, NULL, 0),
(869, '2018-08-29', 11, 276, NULL, 0),
(870, '2018-08-30', 11, 278, NULL, 0),
(871, '2018-08-31', 11, 281, NULL, 0),
(872, '2018-09-02', 11, 282, NULL, 0),
(873, '2018-09-01', 11, 281, NULL, 0),
(874, '2018-09-03', 11, 284, NULL, 0),
(875, '2018-09-04', 11, 287, NULL, 0),
(876, '2018-09-05', 11, 288, NULL, 0),
(877, '2018-09-06', 11, 289, NULL, 0),
(878, '2018-09-07', 11, 291, NULL, 0),
(879, '2018-09-09', 11, 295, NULL, 0),
(880, '2018-09-10', 11, 297, NULL, 0),
(881, '2018-09-12', 11, 301, NULL, 0),
(882, '2018-09-13', 11, 303, NULL, 0),
(883, '2018-09-14', 11, 305, NULL, 0),
(884, '2018-09-16', 11, 307, NULL, 0),
(885, '2018-09-17', 11, 309, NULL, 0),
(886, '2018-09-18', 11, 311, NULL, 0),
(887, '2018-09-19', 11, 313, NULL, 0),
(888, '2018-09-20', 11, 315, NULL, 0),
(889, '2018-07-05', 40, 37.791, NULL, 0),
(890, '2018-07-06', 40, 37.791, NULL, 0),
(891, '2018-07-08', 40, 37.791, NULL, 0),
(892, '2018-07-09', 40, 37.791, NULL, 0),
(893, '2018-07-11', 40, 37.7915, NULL, 0),
(894, '2018-07-10', 40, 37.791, NULL, 0),
(895, '2018-07-12', 40, 37.7915, NULL, 0),
(896, '2018-07-14', 40, 39.562, NULL, 0),
(897, '2018-07-15', 40, 39.956, NULL, 0),
(898, '2018-07-16', 40, 41.005, NULL, 0),
(899, '2018-07-17', 40, 45.867, NULL, 0),
(900, '2018-07-18', 40, 48.097, NULL, 0),
(901, '2018-07-19', 40, 52.061, NULL, 0),
(902, '2018-07-20', 40, 55.518, NULL, 0),
(903, '2018-07-23', 40, 55.717, NULL, 0),
(904, '2018-07-24', 40, 58.701, NULL, 0),
(905, '2018-07-25', 40, 62.152, NULL, 0),
(906, '2018-07-26', 40, 64.682, NULL, 0),
(907, '2018-07-27', 40, 64.682, NULL, 0),
(908, '2018-07-29', 40, 66.203, NULL, 0),
(909, '2018-07-30', 40, 66.203, NULL, 0),
(910, '2018-08-02', 40, 66.203, NULL, 0),
(911, '2018-07-31', 40, 66.203, NULL, 0),
(912, '2018-08-01', 40, 66.203, NULL, 0),
(913, '2018-08-03', 40, 66.351, NULL, 0),
(914, '2018-08-06', 40, 71.685, NULL, 0),
(915, '2018-08-05', 40, 71.685, NULL, 0),
(916, '2018-08-07', 40, 80.292, NULL, 0),
(917, '2018-08-08', 40, 83.834, NULL, 0),
(918, '2018-08-09', 40, 83.834, NULL, 0),
(919, '2018-08-10', 40, 84.587, NULL, 0),
(920, '2018-08-12', 40, 87.342, NULL, 0),
(921, '2018-08-13', 40, 87.342, NULL, 0),
(922, '2018-08-14', 40, 92.611, NULL, 0),
(923, '2018-08-15', 40, 95.172, NULL, 0),
(924, '2018-08-16', 40, 99.658, NULL, 0),
(925, '2018-08-17', 40, 99.658, NULL, 0),
(926, '2018-08-21', 40, 106.555, NULL, 0),
(927, '2018-08-22', 40, 112.348, NULL, 0),
(928, '2018-08-23', 40, 115.558, NULL, 0),
(929, '2018-08-24', 40, 118.355, NULL, 0),
(930, '2018-08-26', 40, 123.531, NULL, 0),
(931, '2018-08-27', 40, 123.845, NULL, 0),
(932, '2018-08-28', 40, 123.956, NULL, 0),
(933, '2018-08-29', 40, 124.798, NULL, 0),
(934, '2018-08-30', 40, 130.795, NULL, 0),
(935, '2018-08-31', 40, 135.813, NULL, 0),
(936, '2018-09-02', 40, 138.252, NULL, 0),
(937, '2018-09-01', 40, 136.986, NULL, 0),
(938, '2018-09-03', 40, 143.074, NULL, 0),
(939, '2018-09-04', 40, 145.911, NULL, 0),
(940, '2018-09-05', 40, 147.785, NULL, 0),
(941, '2018-09-06', 40, 148.794, NULL, 0),
(942, '2018-09-07', 40, 148.794, NULL, 0),
(943, '2018-09-09', 40, 148.794, NULL, 0),
(944, '2018-09-10', 40, 150.163, NULL, 0),
(945, '2018-09-12', 40, 150.564, NULL, 0),
(946, '2018-09-13', 40, 154.062, NULL, 0),
(947, '2018-09-19', 40, 157.114, NULL, 0),
(948, '2018-09-14', 40, 154.062, NULL, 0),
(949, '2018-09-16', 40, 154.175, NULL, 0),
(950, '2018-09-17', 40, 154.175, NULL, 0),
(951, '2018-09-18', 40, 154.295, NULL, 0),
(952, '2018-09-20', 40, 157.114, NULL, 0),
(953, '2018-07-11', 39, 0, NULL, 0),
(954, '2018-07-14', 39, 18.261, NULL, 0),
(955, '2018-07-13', 39, 9.856, NULL, 0),
(956, '2018-07-12', 39, 2.193, NULL, 0),
(957, '2018-07-15', 39, 26.599, NULL, 0),
(958, '2018-07-16', 39, 35.376, NULL, 0),
(959, '2018-07-17', 39, 44.84, NULL, 0),
(960, '2018-07-18', 39, 54.435, NULL, 0),
(961, '2018-07-19', 39, 63.931, NULL, 0),
(962, '2018-07-20', 39, 73.219, NULL, 0),
(963, '2018-07-23', 39, 101.541, NULL, 0),
(964, '2018-07-24', 39, 111.433, NULL, 0),
(965, '2018-07-25', 39, 120.806, NULL, 0),
(966, '2018-07-26', 39, 121.911, NULL, 0),
(967, '2018-07-27', 39, 121.911, NULL, 0),
(968, '2018-07-29', 39, 121.911, NULL, 0),
(969, '2018-07-30', 39, 121.911, NULL, 0),
(970, '2018-07-31', 39, 121.911, NULL, 0),
(971, '2018-08-01', 39, 121.911, NULL, 0),
(972, '2018-08-02', 39, 121.911, NULL, 0),
(973, '2018-08-03', 39, 122.431, NULL, 0),
(974, '2018-08-05', 39, 138.527, NULL, 0),
(975, '2018-08-06', 39, 138.527, NULL, 0),
(976, '2018-08-07', 39, 138.527, NULL, 0),
(977, '2018-08-08', 39, 138.527, NULL, 0),
(978, '2018-08-09', 39, 138.527, NULL, 0),
(979, '2018-08-10', 39, 138.527, NULL, 0),
(980, '2018-08-12', 39, 138.527, NULL, 0),
(981, '2018-08-13', 39, 138.527, NULL, 0),
(982, '2018-08-14', 39, 138.527, NULL, 0),
(983, '2018-08-15', 39, 138.527, NULL, 0),
(984, '2018-08-16', 39, 149.089, NULL, 0),
(985, '2018-08-17', 39, 149.089, NULL, 0),
(986, '2018-08-21', 39, 149.089, NULL, 0),
(987, '2018-08-22', 39, 149.089, NULL, 0),
(988, '2018-08-23', 39, 149.089, NULL, 0),
(989, '2018-08-24', 39, 149.089, NULL, 0),
(990, '2018-08-26', 39, 149.089, NULL, 0),
(991, '2018-08-27', 39, 149.089, NULL, 0),
(992, '2018-08-28', 39, 149.089, NULL, 0),
(993, '2018-08-29', 39, 149.089, NULL, 0),
(994, '2018-08-30', 39, 149.089, NULL, 0),
(995, '2018-08-31', 39, 149.089, NULL, 0),
(996, '2018-09-02', 39, 149.089, NULL, 0),
(997, '2018-09-01', 39, 149.089, NULL, 0),
(998, '2018-09-03', 39, 149.089, NULL, 0),
(999, '2018-09-04', 39, 149.089, NULL, 0),
(1000, '2018-09-05', 39, 149.089, NULL, 0),
(1001, '2018-09-06', 39, 149.277, NULL, 0),
(1002, '2018-09-07', 39, 149.794, NULL, 0),
(1003, '2018-09-09', 39, 151.824, NULL, 0),
(1004, '2018-09-10', 39, 151.824, NULL, 0),
(1005, '2018-09-12', 39, 156.337, NULL, 0),
(1006, '2018-09-13', 39, 156.337, NULL, 0),
(1007, '2018-09-14', 39, 165.142, NULL, 0),
(1008, '2018-09-16', 39, 173.909, NULL, 0),
(1009, '2018-09-17', 39, 178.188, NULL, 0),
(1010, '2018-09-18', 39, 182.615, NULL, 0),
(1011, '2018-09-19', 39, 190.644, NULL, 0),
(1012, '2018-09-20', 39, 198.058, NULL, 0),
(1013, '2018-07-01', 12, 6, NULL, 0),
(1014, '2018-07-02', 12, 7, NULL, 0),
(1015, '2018-07-03', 12, 7, NULL, 0),
(1016, '2018-07-04', 12, 7, NULL, 0),
(1017, '2018-07-05', 12, 8, NULL, 0),
(1018, '2018-07-06', 12, 8, NULL, 0),
(1019, '2018-07-08', 12, 9, NULL, 0),
(1020, '2018-07-09', 12, 9, NULL, 0),
(1021, '2018-07-11', 12, 11, NULL, 0),
(1022, '2018-07-10', 12, 10, NULL, 0),
(1023, '2018-07-12', 12, 12, NULL, 0),
(1024, '2018-07-13', 12, 12, NULL, 0),
(1025, '2018-07-14', 12, 12, NULL, 0),
(1026, '2018-07-15', 12, 12, NULL, 0),
(1027, '2018-07-16', 12, 13, NULL, 0),
(1028, '2018-07-17', 12, 14, NULL, 0),
(1029, '2018-07-18', 12, 14, NULL, 0),
(1030, '2018-07-19', 12, 14, NULL, 0),
(1031, '2018-07-20', 12, 15, NULL, 0),
(1032, '2018-07-23', 12, 16, NULL, 0),
(1033, '2018-07-24', 12, 17, NULL, 0),
(1034, '2018-07-25', 12, 17, NULL, 0),
(1035, '2018-07-26', 12, 18, NULL, 0),
(1036, '2018-07-27', 12, 18, NULL, 0),
(1037, '2018-07-29', 12, 19, NULL, 0),
(1038, '2018-07-30', 12, 19, NULL, 0),
(1039, '2018-07-31', 12, 20, NULL, 0),
(1040, '2018-08-01', 12, 20, NULL, 0),
(1041, '2018-08-02', 12, 21, NULL, 0),
(1042, '2018-08-03', 12, 22, NULL, 0),
(1043, '2018-08-05', 12, 22, NULL, 0),
(1044, '2018-08-06', 12, 23, NULL, 0),
(1045, '2018-08-07', 12, 23, NULL, 0),
(1046, '2018-08-08', 12, 24, NULL, 0),
(1047, '2018-08-09', 12, 24, NULL, 0),
(1048, '2018-08-10', 12, 25, NULL, 0),
(1049, '2018-08-12', 12, 26, NULL, 0),
(1050, '2018-08-13', 12, 26, NULL, 0),
(1051, '2018-08-14', 12, 27, NULL, 0),
(1052, '2018-08-15', 12, 27, NULL, 0),
(1053, '2018-08-16', 12, 28, NULL, 0),
(1054, '2018-08-17', 12, 29, NULL, 0),
(1055, '2018-08-21', 12, 32, NULL, 0),
(1056, '2018-08-22', 12, 32, NULL, 0),
(1057, '2018-08-23', 12, 32, NULL, 0),
(1058, '2018-08-24', 12, 34, NULL, 0),
(1059, '2018-08-26', 12, 34, NULL, 0),
(1060, '2018-08-27', 12, 34, NULL, 0),
(1061, '2018-08-28', 12, 35, NULL, 0),
(1062, '2018-08-29', 12, 35, NULL, 0),
(1063, '2018-08-30', 12, 35, NULL, 0),
(1064, '2018-08-31', 12, 36, NULL, 0),
(1065, '2018-09-02', 12, 37, NULL, 0),
(1066, '2018-09-01', 12, 36, NULL, 0),
(1067, '2018-09-03', 12, 37, NULL, 0),
(1068, '2018-09-04', 12, 38, NULL, 0),
(1069, '2018-09-05', 12, 39, NULL, 0),
(1070, '2018-09-06', 12, 39, NULL, 0),
(1071, '2018-09-07', 12, 40, NULL, 0),
(1072, '2018-09-09', 12, 41, NULL, 0),
(1073, '2018-09-10', 12, 41, NULL, 0),
(1074, '2018-09-12', 12, 43, NULL, 0),
(1075, '2018-09-13', 12, 43, NULL, 0),
(1076, '2018-09-14', 12, 44, NULL, 0),
(1077, '2018-09-16', 12, 44, NULL, 0),
(1078, '2018-09-17', 12, 45, NULL, 0),
(1079, '2018-09-18', 12, 45, NULL, 0),
(1080, '2018-09-19', 12, 46, NULL, 0),
(1081, '2018-09-20', 12, 46, NULL, 0),
(1082, '2018-07-01', 13, 26, NULL, 0),
(1083, '2018-07-02', 13, 26, NULL, 0),
(1084, '2018-07-03', 13, 28, NULL, 0),
(1085, '2018-07-05', 13, 28, NULL, 0),
(1086, '2018-07-06', 13, 28, NULL, 0),
(1087, '2018-07-08', 13, 32, NULL, 0),
(1088, '2018-07-09', 13, 33, NULL, 0),
(1089, '2018-07-11', 13, 36, NULL, 0),
(1090, '2018-07-10', 13, 34, NULL, 0),
(1091, '2018-07-12', 13, 37, NULL, 0),
(1092, '2018-07-13', 13, 38, NULL, 0),
(1093, '2018-07-14', 13, 41, NULL, 0),
(1094, '2018-07-15', 13, 41, NULL, 0),
(1095, '2018-07-16', 13, 41, NULL, 0),
(1096, '2018-07-17', 13, 43, NULL, 0),
(1097, '2018-07-18', 13, 44, NULL, 0),
(1098, '2018-07-19', 13, 44, NULL, 0),
(1099, '2018-07-20', 13, 45, NULL, 0),
(1100, '2018-07-23', 13, 45, NULL, 0),
(1101, '2018-07-24', 13, 46, NULL, 0),
(1102, '2018-07-25', 13, 46, NULL, 0),
(1103, '2018-07-26', 13, 46, NULL, 0),
(1104, '2018-07-27', 13, 46, NULL, 0),
(1105, '2018-07-29', 13, 48, NULL, 0),
(1106, '2018-07-30', 13, 49, NULL, 0),
(1107, '2018-07-31', 13, 49, NULL, 0),
(1108, '2018-08-01', 13, 49, NULL, 0),
(1109, '2018-08-02', 13, 49, NULL, 0),
(1110, '2018-08-03', 13, 49, NULL, 0),
(1111, '2018-08-05', 13, 51, NULL, 0),
(1112, '2018-08-06', 13, 52, NULL, 0),
(1113, '2018-08-07', 13, 53, NULL, 0),
(1114, '2018-08-08', 13, 55, NULL, 0),
(1115, '2018-08-09', 13, 55, NULL, 0),
(1116, '2018-08-10', 13, 57, NULL, 0),
(1117, '2018-08-12', 13, 57, NULL, 0),
(1118, '2018-08-13', 13, 58, NULL, 0),
(1119, '2018-08-14', 13, 58, NULL, 0),
(1120, '2018-08-15', 13, 58, NULL, 0),
(1121, '2018-08-16', 13, 58, NULL, 0),
(1122, '2018-08-17', 13, 58, NULL, 0),
(1123, '2018-08-21', 13, 59, NULL, 0),
(1124, '2018-08-22', 13, 59, NULL, 0),
(1125, '2018-08-23', 13, 60, NULL, 0),
(1126, '2018-08-24', 13, 60, NULL, 0),
(1127, '2018-08-26', 13, 60, NULL, 0),
(1128, '2018-08-27', 13, 61, NULL, 0),
(1129, '2018-08-28', 13, 61, NULL, 0),
(1130, '2018-08-29', 13, 61, NULL, 0),
(1131, '2018-08-31', 13, 61, NULL, 0),
(1132, '2018-09-02', 13, 67, NULL, 0),
(1133, '2018-09-01', 13, 64, NULL, 0),
(1134, '2018-09-03', 13, 68, NULL, 0),
(1135, '2018-09-04', 13, 68, NULL, 0),
(1136, '2018-09-05', 13, 68, NULL, 0),
(1137, '2018-09-06', 13, 68, NULL, 0),
(1138, '2018-09-07', 13, 69, NULL, 0),
(1139, '2018-09-09', 13, 69, NULL, 0),
(1140, '2018-09-10', 13, 69, NULL, 0),
(1141, '2018-09-12', 13, 69, NULL, 0),
(1142, '2018-09-13', 13, 69, NULL, 0),
(1143, '2018-09-14', 13, 69, NULL, 0),
(1144, '2018-09-16', 13, 69, NULL, 0),
(1145, '2018-09-17', 13, 69, NULL, 0),
(1146, '2018-09-18', 13, 69, NULL, 0),
(1147, '2018-09-19', 13, 69, NULL, 0),
(1148, '2018-09-20', 13, 69, NULL, 0),
(1149, '2018-07-01', 9, 31.093, NULL, 0),
(1150, '2018-07-02', 9, 31.189, NULL, 0),
(1151, '2018-07-03', 9, 31.216, NULL, 0),
(1152, '2018-07-04', 9, 31.397, NULL, 0),
(1153, '2018-07-05', 9, 31.451, NULL, 0),
(1154, '2018-07-06', 9, 31.621, NULL, 0),
(1155, '2018-07-08', 9, 31.799, NULL, 0),
(1156, '2018-07-09', 9, 31.901, NULL, 0),
(1157, '2018-07-11', 9, 32.0546, NULL, 0),
(1158, '2018-07-10', 9, 31.973, NULL, 0),
(1159, '2018-07-12', 9, 32.182, NULL, 0),
(1160, '2018-07-13', 9, 32.329, NULL, 0),
(1161, '2018-07-14', 9, 32.431, NULL, 0),
(1162, '2018-07-15', 9, 32.535, NULL, 0),
(1163, '2018-07-16', 9, 32.629, NULL, 0),
(1164, '2018-07-17', 9, 32.721, NULL, 0),
(1165, '2018-07-18', 9, 32.802, NULL, 0),
(1166, '2018-07-19', 9, 32.988, NULL, 0),
(1167, '2018-07-20', 9, 33.034, NULL, 0),
(1168, '2018-07-23', 9, 33.308, NULL, 0),
(1169, '2018-07-24', 9, 33.368, NULL, 0),
(1170, '2018-07-25', 9, 33.438, NULL, 0),
(1171, '2018-07-26', 9, 33.509, NULL, 0),
(1172, '2018-07-29', 9, 33.823, NULL, 0),
(1173, '2018-07-30', 9, 33.969, NULL, 0),
(1174, '2018-07-31', 9, 34.077, NULL, 0),
(1175, '2018-08-01', 9, 34.156, NULL, 0),
(1176, '2018-08-02', 9, 34.294, NULL, 0),
(1177, '2018-08-03', 9, 34.397, NULL, 0),
(1178, '2018-08-05', 9, 34.645, NULL, 0),
(1179, '2018-08-07', 9, 35.031, NULL, 0),
(1180, '2018-08-08', 9, 35.16, NULL, 0),
(1181, '2018-08-09', 9, 35.223, NULL, 0),
(1182, '2018-08-10', 9, 35.446, NULL, 0),
(1183, '2018-08-12', 9, 35.686, NULL, 0),
(1184, '2018-08-13', 9, 35.777, NULL, 0),
(1185, '2018-08-14', 9, 35.876, NULL, 0),
(1186, '2018-08-15', 9, 35.991, NULL, 0),
(1187, '2018-08-16', 9, 36.168, NULL, 0),
(1188, '2018-08-17', 9, 36.247, NULL, 0),
(1189, '2018-08-21', 9, 36.721, NULL, 0),
(1190, '2018-08-22', 9, 36.851, NULL, 0),
(1191, '2018-08-23', 9, 36.915, NULL, 0),
(1192, '2018-08-24', 9, 37.084, NULL, 0),
(1193, '2018-08-26', 9, 37.247, NULL, 0),
(1194, '2018-08-27', 9, 37.432, NULL, 0),
(1195, '2018-08-28', 9, 37.532, NULL, 0),
(1196, '2018-08-29', 9, 37.556, NULL, 0),
(1197, '2018-08-30', 9, 37.575, NULL, 0),
(1198, '2018-09-02', 9, 37.866, NULL, 0),
(1199, '2018-09-01', 9, 37.676, NULL, 0),
(1200, '2018-09-03', 9, 37.974, NULL, 0),
(1201, '2018-09-04', 9, 38.081, NULL, 0),
(1202, '2018-09-05', 9, 38.173, NULL, 0),
(1203, '2018-09-06', 9, 38.308, NULL, 0),
(1204, '2018-09-07', 9, 38.582, NULL, 0),
(1205, '2018-09-09', 9, 38.861, NULL, 0),
(1206, '2018-09-10', 9, 38.93, NULL, 0),
(1207, '2018-09-12', 9, 39.089, NULL, 0),
(1208, '2018-09-13', 9, 39.162, NULL, 0),
(1209, '2018-09-14', 9, 39.267, NULL, 0),
(1210, '2018-09-16', 9, 39.459, NULL, 0),
(1211, '2018-09-17', 9, 39.497, NULL, 0),
(1212, '2018-09-18', 9, 39.555, NULL, 0),
(1213, '2018-09-19', 9, 39.614, NULL, 0),
(1214, '2018-09-20', 9, 39.7, NULL, 0),
(1215, '2018-07-01', 2, 29, NULL, 0),
(1216, '2018-07-02', 2, 29, NULL, 0),
(1217, '2018-07-03', 2, 31, NULL, 0),
(1218, '2018-07-04', 2, 31, NULL, 0),
(1219, '2018-07-05', 2, 32, NULL, 0),
(1220, '2018-07-06', 2, 33, NULL, 0),
(1221, '2018-07-08', 2, 35, NULL, 0),
(1222, '2018-07-09', 2, 36, NULL, 0),
(1223, '2018-07-11', 2, 37, NULL, 0),
(1224, '2018-07-10', 2, 36, NULL, 0),
(1225, '2018-07-12', 2, 37, NULL, 0),
(1226, '2018-07-13', 2, 37, NULL, 0),
(1227, '2018-07-14', 2, 38, NULL, 0),
(1228, '2018-07-15', 2, 38, NULL, 0),
(1229, '2018-07-16', 2, 39, NULL, 0),
(1230, '2018-07-17', 2, 41, NULL, 0),
(1231, '2018-07-18', 2, 41, NULL, 0),
(1232, '2018-07-19', 2, 42, NULL, 0),
(1233, '2018-07-20', 2, 43, NULL, 0),
(1234, '2018-07-23', 2, 45, NULL, 0),
(1235, '2018-07-24', 2, 46, NULL, 0),
(1236, '2018-07-25', 2, 47, NULL, 0),
(1237, '2018-07-29', 2, 50, NULL, 0),
(1238, '2018-07-30', 2, 51, NULL, 0),
(1239, '2018-07-31', 2, 51, NULL, 0),
(1240, '2018-08-01', 2, 52, NULL, 0),
(1241, '2018-08-02', 2, 53, NULL, 0),
(1242, '2018-08-03', 2, 53, NULL, 0),
(1243, '2018-08-05', 2, 54, NULL, 0),
(1244, '2018-08-06', 2, 55, NULL, 0),
(1245, '2018-08-07', 2, 56, NULL, 0),
(1246, '2018-08-08', 2, 56, NULL, 0),
(1247, '2018-08-09', 2, 57, NULL, 0),
(1248, '2018-08-10', 2, 57, NULL, 0),
(1249, '2018-08-12', 2, 58, NULL, 0),
(1250, '2018-08-13', 2, 59, NULL, 0),
(1251, '2018-08-14', 2, 60, NULL, 0),
(1252, '2018-08-15', 2, 60, NULL, 0),
(1253, '2018-08-16', 2, 61, NULL, 0),
(1254, '2018-08-17', 2, 61, NULL, 0),
(1255, '2018-08-21', 2, 64, NULL, 0),
(1256, '2018-08-22', 2, 64, NULL, 0),
(1257, '2018-08-23', 2, 64, NULL, 0),
(1258, '2018-08-24', 2, 65, NULL, 0),
(1259, '2018-08-26', 2, 66, NULL, 0),
(1260, '2018-08-27', 2, 67, NULL, 0),
(1261, '2018-08-28', 2, 67, NULL, 0),
(1262, '2018-08-29', 2, 67, NULL, 0),
(1263, '2018-09-02', 2, 70, NULL, 0),
(1264, '2018-09-01', 2, 69, NULL, 0),
(1265, '2018-09-03', 2, 70, NULL, 0),
(1266, '2018-09-04', 2, 71, NULL, 0),
(1267, '2018-09-05', 2, 71, NULL, 0),
(1268, '2018-09-06', 2, 71, NULL, 0),
(1269, '2018-09-07', 2, 72, NULL, 0),
(1270, '2018-09-09', 2, 73, NULL, 0),
(1271, '2018-09-10', 2, 73, NULL, 0),
(1272, '2018-09-12', 2, 75, NULL, 0),
(1273, '2018-09-13', 2, 76, NULL, 0),
(1274, '2018-09-14', 2, 77, NULL, 0),
(1275, '2018-09-16', 2, 78, NULL, 0),
(1276, '2018-09-17', 2, 79, NULL, 0),
(1277, '2018-09-18', 2, 79, NULL, 0),
(1278, '2018-09-19', 2, 80, NULL, 0),
(1279, '2018-09-20', 2, 80, NULL, 0),
(1280, '2018-07-01', 10, 488.412, NULL, 0),
(1281, '2018-07-02', 10, 488.433, NULL, 0),
(1282, '2018-07-03', 10, 488.727, NULL, 0);
INSERT INTO `wreading` (`wreading`, `date`, `wmeter`, `value`, `remark`, `is_consumed`) VALUES
(1283, '2018-07-04', 10, 489.116, NULL, 0),
(1284, '2018-07-05', 10, 489.781, NULL, 0),
(1285, '2018-07-06', 10, 491.318, NULL, 0),
(1286, '2018-07-08', 10, 495.192, NULL, 0),
(1287, '2018-07-09', 10, 495.963, NULL, 0),
(1288, '2018-07-10', 10, 496.938, NULL, 0),
(1289, '2018-07-12', 10, 498.778, NULL, 0),
(1290, '2018-07-13', 10, 500.344, NULL, 0),
(1291, '2018-07-14', 10, 501.896, NULL, 0),
(1292, '2018-07-15', 10, 502.461, NULL, 0),
(1293, '2018-07-16', 10, 502.781, NULL, 0),
(1294, '2018-07-17', 10, 503.596, NULL, 0),
(1295, '2018-07-18', 10, 504.616, NULL, 0),
(1296, '2018-07-19', 10, 505.667, NULL, 0),
(1297, '2018-07-20', 10, 506.896, NULL, 0),
(1298, '2018-07-23', 10, 509.123, NULL, 0),
(1299, '2018-07-24', 10, 509.637, NULL, 0),
(1300, '2018-07-25', 10, 516.441, NULL, 0),
(1301, '2018-07-26', 10, 517.197, NULL, 0),
(1302, '2018-07-29', 10, 523.486, NULL, 0),
(1303, '2018-07-30', 10, 523.554, NULL, 0),
(1304, '2018-07-31', 10, 524.503, NULL, 0),
(1305, '2018-08-01', 10, 525.439, NULL, 0),
(1306, '2018-08-02', 10, 526.473, NULL, 0),
(1307, '2018-08-05', 10, 530.202, NULL, 0),
(1308, '2018-08-06', 10, 530.481, NULL, 0),
(1309, '2018-08-07', 10, 531.344, NULL, 0),
(1310, '2018-08-08', 10, 532.523, NULL, 0),
(1311, '2018-08-09', 10, 533.499, NULL, 0),
(1312, '2018-08-10', 10, 535.272, NULL, 0),
(1313, '2018-08-12', 10, 537.649, NULL, 0),
(1314, '2018-08-13', 10, 538.585, NULL, 0),
(1315, '2018-08-14', 10, 539.776, NULL, 0),
(1316, '2018-08-15', 10, 540.421, NULL, 0),
(1317, '2018-08-16', 10, 541.355, NULL, 0),
(1318, '2018-08-17', 10, 542.905, NULL, 0),
(1319, '2018-08-21', 10, 547.245, NULL, 0),
(1320, '2018-08-22', 10, 547.245, NULL, 0),
(1321, '2018-08-23', 10, 549.075, NULL, 0),
(1322, '2018-08-24', 10, 551.171, NULL, 0),
(1323, '2018-08-26', 10, 555.679, NULL, 0),
(1324, '2018-08-27', 10, 555.679, NULL, 0),
(1325, '2018-08-28', 10, 555.879, NULL, 0),
(1326, '2018-08-29', 10, 555.979, NULL, 0),
(1327, '2018-08-30', 10, 558.231, NULL, 0),
(1328, '2018-08-31', 10, 560.693, NULL, 0),
(1329, '2018-09-02', 10, 569.412, NULL, 0),
(1330, '2018-09-01', 10, 566.342, NULL, 0),
(1331, '2018-09-03', 10, 569.553, NULL, 0),
(1332, '2018-09-04', 10, 571.462, NULL, 0),
(1333, '2018-09-05', 10, 572.882, NULL, 0),
(1334, '2018-09-06', 10, 575.224, NULL, 0),
(1335, '2018-09-07', 10, 579.163, NULL, 0),
(1336, '2018-09-09', 10, 596.684, NULL, 0),
(1337, '2018-09-10', 10, 598.468, NULL, 0),
(1338, '2018-09-12', 10, 602.033, NULL, 0),
(1339, '2018-09-13', 10, 615.733, NULL, 0),
(1340, '2018-09-14', 10, 619.771, NULL, 0),
(1341, '2018-09-16', 10, 621.914, NULL, 0),
(1342, '2018-09-17', 10, 630.036, NULL, 0),
(1343, '2018-09-18', 10, 633.379, NULL, 0),
(1344, '2018-09-19', 10, 638.785, NULL, 0),
(1345, '2018-09-20', 10, 643.311, NULL, 0),
(1346, '2018-07-01', 1, 5, NULL, 0),
(1347, '2018-07-02', 1, 5, NULL, 0),
(1348, '2018-07-03', 1, 5, NULL, 0),
(1349, '2018-07-04', 1, 5, NULL, 0),
(1350, '2018-07-05', 1, 5, NULL, 0),
(1351, '2018-07-06', 1, 6, NULL, 0),
(1352, '2018-07-08', 1, 6, NULL, 0),
(1353, '2018-07-09', 1, 6, NULL, 0),
(1354, '2018-07-11', 1, 7, NULL, 0),
(1355, '2018-07-10', 1, 6, NULL, 0),
(1356, '2018-07-12', 1, 7, NULL, 0),
(1357, '2018-07-13', 1, 7, NULL, 0),
(1358, '2018-07-14', 1, 8, NULL, 0),
(1359, '2018-07-15', 1, 8, NULL, 0),
(1360, '2018-07-16', 1, 9, NULL, 0),
(1361, '2018-07-17', 1, 10, NULL, 0),
(1362, '2018-07-18', 1, 10, NULL, 0),
(1363, '2018-07-19', 1, 10, NULL, 0),
(1364, '2018-07-20', 1, 10, NULL, 0),
(1365, '2018-07-23', 1, 10, NULL, 0),
(1366, '2018-07-24', 1, 10, NULL, 0),
(1367, '2018-07-25', 1, 10, NULL, 0),
(1368, '2018-07-29', 1, 10, NULL, 0),
(1369, '2018-07-30', 1, 11, NULL, 0),
(1370, '2018-07-31', 1, 11, NULL, 0),
(1371, '2018-08-01', 1, 11, NULL, 0),
(1372, '2018-08-02', 1, 11, NULL, 0),
(1373, '2018-08-03', 1, 11, NULL, 0),
(1374, '2018-08-05', 1, 12, NULL, 0),
(1375, '2018-08-06', 1, 12, NULL, 0),
(1376, '2018-08-07', 1, 12, NULL, 0),
(1377, '2018-08-08', 1, 13, NULL, 0),
(1378, '2018-08-09', 1, 13, NULL, 0),
(1379, '2018-08-10', 1, 13, NULL, 0),
(1380, '2018-08-12', 1, 13, NULL, 0),
(1381, '2018-08-13', 1, 14, NULL, 0),
(1382, '2018-08-14', 1, 14, NULL, 0),
(1383, '2018-08-15', 1, 14, NULL, 0),
(1384, '2018-08-16', 1, 14, NULL, 0),
(1385, '2018-08-17', 1, 14, NULL, 0),
(1386, '2018-08-21', 1, 15, NULL, 0),
(1387, '2018-08-22', 1, 15, NULL, 0),
(1388, '2018-08-23', 1, 15, NULL, 0),
(1389, '2018-08-26', 1, 16, NULL, 0),
(1390, '2018-08-27', 1, 16, NULL, 0),
(1391, '2018-08-28', 1, 16, NULL, 0),
(1392, '2018-08-29', 1, 16, NULL, 0),
(1393, '2018-08-31', 1, 17, NULL, 0),
(1394, '2018-08-30', 1, 17, NULL, 0),
(1395, '2018-09-02', 1, 17, NULL, 0),
(1396, '2018-09-01', 1, 17, NULL, 0),
(1397, '2018-09-03', 1, 17, NULL, 0),
(1398, '2018-09-04', 1, 18, NULL, 0),
(1399, '2018-09-05', 1, 18, NULL, 0),
(1400, '2018-09-06', 1, 18, NULL, 0),
(1401, '2018-09-07', 1, 18, NULL, 0),
(1402, '2018-09-09', 1, 19, NULL, 0),
(1403, '2018-09-10', 1, 19, NULL, 0),
(1404, '2018-09-12', 1, 20, NULL, 0),
(1405, '2018-09-13', 1, 20, NULL, 0),
(1406, '2018-09-14', 1, 20, NULL, 0),
(1407, '2018-09-16', 1, 21, NULL, 0),
(1408, '2018-09-17', 1, 21, NULL, 0),
(1409, '2018-09-18', 1, 21, NULL, 0),
(1410, '2018-09-19', 1, 21, NULL, 0),
(1411, '2018-09-20', 1, 22, NULL, 0),
(1412, '2018-07-01', 4, 73.244, NULL, 0),
(1413, '2018-07-02', 4, 73.244, NULL, 0),
(1414, '2018-07-03', 4, 73.264, NULL, 0),
(1415, '2018-07-04', 4, 73.316, NULL, 0),
(1416, '2018-07-05', 4, 73.353, NULL, 0),
(1417, '2018-07-06', 4, 73.407, NULL, 0),
(1418, '2018-07-08', 4, 73.443, NULL, 0),
(1419, '2018-07-09', 4, 73.453, NULL, 0),
(1420, '2018-07-11', 4, 73.5351, NULL, 0),
(1421, '2018-07-10', 4, 73.492, NULL, 0),
(1422, '2018-07-12', 4, 73.5351, NULL, 0),
(1423, '2018-07-13', 4, 73.68, NULL, 0),
(1424, '2018-07-14', 4, 73.712, NULL, 0),
(1425, '2018-07-15', 4, 73.717, NULL, 0),
(1426, '2018-07-16', 4, 73.717, NULL, 0),
(1427, '2018-07-17', 4, 73.789, NULL, 0),
(1428, '2018-07-18', 4, 73.823, NULL, 0),
(1429, '2018-07-19', 4, 73.877, NULL, 0),
(1430, '2018-07-20', 4, 73.922, NULL, 0),
(1431, '2018-07-23', 4, 73.978, NULL, 0),
(1432, '2018-07-24', 4, 74.022, NULL, 0),
(1433, '2018-07-25', 4, 74.093, NULL, 0),
(1434, '2018-07-26', 4, 74.137, NULL, 0),
(1435, '2018-07-29', 4, 74.257, NULL, 0),
(1436, '2018-07-30', 4, 74.257, NULL, 0),
(1437, '2018-07-31', 4, 74.313, NULL, 0),
(1438, '2018-08-01', 4, 74.347, NULL, 0),
(1439, '2018-08-02', 4, 74.388, NULL, 0),
(1440, '2018-08-03', 4, 74.401, NULL, 0),
(1441, '2018-08-05', 4, 74.484, NULL, 0),
(1442, '2018-08-06', 4, 74.487, NULL, 0),
(1443, '2018-08-07', 4, 74.533, NULL, 0),
(1444, '2018-08-08', 4, 74.566, NULL, 0),
(1445, '2018-08-09', 4, 74.634, NULL, 0),
(1446, '2018-08-10', 4, 74.714, NULL, 0),
(1447, '2018-08-12', 4, 74.784, NULL, 0),
(1448, '2018-08-13', 4, 74.804, NULL, 0),
(1449, '2018-08-14', 4, 74.837, NULL, 0),
(1450, '2018-08-15', 4, 74.873, NULL, 0),
(1451, '2018-08-16', 4, 74.951, NULL, 0),
(1452, '2018-08-17', 4, 74.951, NULL, 0),
(1453, '2018-08-21', 4, 75.076, NULL, 0),
(1454, '2018-08-22', 4, 75.076, NULL, 0),
(1455, '2018-08-23', 4, 75.094, NULL, 0),
(1456, '2018-08-24', 4, 75.142, NULL, 0),
(1457, '2018-08-26', 4, 75.198, NULL, 0),
(1458, '2018-08-27', 4, 75.224, NULL, 0),
(1459, '2018-08-28', 4, 75.224, NULL, 0),
(1460, '2018-08-29', 4, 75.224, NULL, 0),
(1461, '2018-08-30', 4, 75.322, NULL, 0),
(1462, '2018-09-02', 4, 75.444, NULL, 0),
(1463, '2018-09-01', 4, 75.398, NULL, 0),
(1464, '2018-09-03', 4, 75.448, NULL, 0),
(1465, '2018-09-04', 4, 75.498, NULL, 0),
(1466, '2018-09-05', 4, 75.553, NULL, 0),
(1467, '2018-09-06', 4, 75.605, NULL, 0),
(1468, '2018-09-07', 4, 75.65, NULL, 0),
(1469, '2018-09-09', 4, 75.738, NULL, 0),
(1470, '2018-09-10', 4, 75.741, NULL, 0),
(1471, '2018-09-12', 4, 75.804, NULL, 0),
(1472, '2018-09-13', 4, 75.841, NULL, 0),
(1473, '2018-09-14', 4, 75.877, NULL, 0),
(1474, '2018-09-16', 4, 75.929, NULL, 0),
(1475, '2018-09-17', 4, 75.929, NULL, 0),
(1476, '2018-09-18', 4, 75.961, NULL, 0),
(1477, '2018-09-19', 4, 76.007, NULL, 0),
(1478, '2018-09-20', 4, 76.047, NULL, 0),
(1479, '2018-07-01', 14, 33.224, NULL, 0),
(1480, '2018-07-02', 14, 40.178, NULL, 0),
(1481, '2018-07-03', 14, 42.561, NULL, 0),
(1482, '2018-07-04', 14, 49.704, NULL, 0),
(1483, '2018-07-05', 14, 54.778, NULL, 0),
(1484, '2018-07-06', 14, 64.661, NULL, 0),
(1485, '2018-07-08', 14, 82.567, NULL, 0),
(1486, '2018-07-09', 14, 88.471, NULL, 0),
(1487, '2018-07-11', 14, 96.943, NULL, 0),
(1488, '2018-07-10', 14, 92.015, NULL, 0),
(1489, '2018-07-12', 14, 105.68, NULL, 0),
(1490, '2018-07-14', 14, 122.9, NULL, 0),
(1491, '2018-07-15', 14, 129.432, NULL, 0),
(1492, '2018-07-16', 14, 135.264, NULL, 0),
(1493, '2018-07-17', 14, 143.558, NULL, 0),
(1494, '2018-07-18', 14, 147.401, NULL, 0),
(1495, '2018-07-19', 14, 155.561, NULL, 0),
(1496, '2018-07-20', 14, 160.93, NULL, 0),
(1497, '2018-07-23', 14, 176.838, NULL, 0),
(1498, '2018-07-24', 14, 181.155, NULL, 0),
(1499, '2018-07-25', 14, 192.965, NULL, 0),
(1500, '2018-07-26', 14, 193.995, NULL, 0),
(1501, '2018-07-27', 14, 199.645, NULL, 0),
(1502, '2018-07-29', 14, 217.308, NULL, 0),
(1503, '2018-07-30', 14, 221.955, NULL, 0),
(1504, '2018-07-31', 14, 227.551, NULL, 0),
(1505, '2018-08-01', 14, 233.372, NULL, 0),
(1506, '2018-08-02', 14, 238.547, NULL, 0),
(1507, '2018-08-03', 14, 244.906, NULL, 0),
(1508, '2018-08-06', 14, 256.953, NULL, 0),
(1509, '2018-08-05', 14, 256.953, NULL, 0),
(1510, '2018-08-07', 14, 268.365, NULL, 0),
(1511, '2018-08-08', 14, 275.955, NULL, 0),
(1512, '2018-08-09', 14, 275.955, NULL, 0),
(1513, '2018-08-10', 14, 287.891, NULL, 0),
(1514, '2018-08-12', 14, 297.088, NULL, 0),
(1515, '2018-08-13', 14, 301.086, NULL, 0),
(1516, '2018-08-14', 14, 308.293, NULL, 0),
(1517, '2018-08-15', 14, 311.604, NULL, 0),
(1518, '2018-08-16', 14, 322.838, NULL, 0),
(1519, '2018-08-17', 14, 322.838, NULL, 0),
(1520, '2018-08-21', 14, 342.558, NULL, 0),
(1521, '2018-08-22', 14, 345.651, NULL, 0),
(1522, '2018-08-23', 14, 353.158, NULL, 0),
(1523, '2018-08-24', 14, 359.845, NULL, 0),
(1524, '2018-08-26', 14, 366.255, NULL, 0),
(1525, '2018-08-27', 14, 369.704, NULL, 0),
(1526, '2018-08-28', 14, 379.704, NULL, 0),
(1527, '2018-08-29', 14, 382.704, NULL, 0),
(1528, '2018-08-30', 14, 385.925, NULL, 0),
(1529, '2018-08-31', 14, 389.695, NULL, 0),
(1530, '2018-09-02', 14, 413.55, NULL, 0),
(1531, '2018-09-01', 14, 389.989, NULL, 0),
(1532, '2018-09-03', 14, 416.458, NULL, 0),
(1533, '2018-09-04', 14, 423.203, NULL, 0),
(1534, '2018-09-05', 14, 427.239, NULL, 0),
(1535, '2018-09-06', 14, 431.625, NULL, 0),
(1536, '2018-09-07', 14, 440.869, NULL, 0),
(1537, '2018-09-09', 14, 467.293, NULL, 0),
(1538, '2018-09-10', 14, 467.298, NULL, 0),
(1539, '2018-09-12', 14, 486.935, NULL, 0),
(1540, '2018-09-13', 14, 504.842, NULL, 0),
(1541, '2018-09-14', 14, 511.155, NULL, 0),
(1542, '2018-09-16', 14, 535.874, NULL, 0),
(1543, '2018-09-17', 14, 536.555, NULL, 0),
(1544, '2018-09-18', 14, 546.995, NULL, 0),
(1545, '2018-09-19', 14, 559.317, NULL, 0),
(1546, '2018-09-20', 14, 567.555, NULL, 0),
(1547, '2018-07-01', 8, 122.4, NULL, 0),
(1548, '2018-07-02', 8, 123, NULL, 0),
(1549, '2018-07-03', 8, 125.7, NULL, 0),
(1550, '2018-07-04', 8, 127.4, NULL, 0),
(1551, '2018-07-05', 8, 127.4, NULL, 0),
(1552, '2018-07-06', 8, 128.4, NULL, 0),
(1553, '2018-07-08', 8, 128.9, NULL, 0),
(1554, '2018-07-09', 8, 129.1, NULL, 0),
(1555, '2018-07-11', 8, 129.9, NULL, 0),
(1556, '2018-07-10', 8, 129.5, NULL, 0),
(1557, '2018-07-12', 8, 130.4, NULL, 0),
(1558, '2018-07-13', 8, 130.8, NULL, 0),
(1559, '2018-07-14', 8, 132.4, NULL, 0),
(1560, '2018-07-15', 8, 133.1, NULL, 0),
(1561, '2018-07-16', 8, 135.4, NULL, 0),
(1562, '2018-07-17', 8, 137.8, NULL, 0),
(1563, '2018-07-18', 8, 138.7, NULL, 0),
(1564, '2018-07-19', 8, 139.1, NULL, 0),
(1565, '2018-07-20', 8, 139.4, NULL, 0),
(1566, '2018-07-23', 8, 140.5, NULL, 0),
(1567, '2018-07-24', 8, 140.8, NULL, 0),
(1568, '2018-07-25', 8, 141.2, NULL, 0),
(1569, '2018-07-26', 8, 141.6, NULL, 0),
(1570, '2018-07-29', 8, 142.4, NULL, 0),
(1571, '2018-07-30', 8, 142.6, NULL, 0),
(1572, '2018-07-31', 8, 143.1, NULL, 0),
(1573, '2018-08-01', 8, 143.5, NULL, 0),
(1574, '2018-08-02', 8, 143.9, NULL, 0),
(1575, '2018-08-03', 8, 144.5, NULL, 0),
(1576, '2018-08-05', 8, 144.8, NULL, 0),
(1577, '2018-08-06', 8, 145.1, NULL, 0),
(1578, '2018-08-07', 8, 145.5, NULL, 0),
(1579, '2018-08-08', 8, 145.6, NULL, 0),
(1580, '2018-08-09', 8, 146.2, NULL, 0),
(1581, '2018-08-10', 8, 146.7, NULL, 0),
(1582, '2018-08-12', 8, 147.4, NULL, 0),
(1583, '2018-08-13', 8, 147.5, NULL, 0),
(1584, '2018-08-14', 8, 148.4, NULL, 0),
(1585, '2018-08-15', 8, 148.8, NULL, 0),
(1586, '2018-08-16', 8, 149.8, NULL, 0),
(1587, '2018-08-17', 8, 150.2, NULL, 0),
(1588, '2018-08-21', 8, 151.2, NULL, 0),
(1589, '2018-08-22', 8, 151.4, NULL, 0),
(1590, '2018-08-23', 8, 151.8, NULL, 0),
(1591, '2018-08-24', 8, 152.3, NULL, 0),
(1592, '2018-08-26', 8, 152.8, NULL, 0),
(1593, '2018-08-27', 8, 153.2, NULL, 0),
(1594, '2018-08-28', 8, 153.4, NULL, 0),
(1595, '2018-08-29', 8, 153.8, NULL, 0),
(1596, '2018-08-30', 8, 154.1, NULL, 0),
(1597, '2018-09-02', 8, 155.1, NULL, 0),
(1598, '2018-09-01', 8, 154.9, NULL, 0),
(1599, '2018-09-03', 8, 155.3, NULL, 0),
(1600, '2018-09-04', 8, 155.8, NULL, 0),
(1601, '2018-09-05', 8, 156.3, NULL, 0),
(1602, '2018-09-06', 8, 156.8, NULL, 0),
(1603, '2018-09-07', 8, 157.2, NULL, 0),
(1604, '2018-09-09', 8, 157.6, NULL, 0),
(1605, '2018-09-10', 8, 157.8, NULL, 0),
(1606, '2018-09-12', 8, 160.8, NULL, 0),
(1607, '2018-09-13', 8, 161.1, NULL, 0),
(1608, '2018-09-14', 8, 161.2, NULL, 0),
(1609, '2018-09-16', 8, 162.6, NULL, 0),
(1610, '2018-09-17', 8, 163.5, NULL, 0),
(1611, '2018-09-18', 8, 164.2, NULL, 0),
(1612, '2018-09-19', 8, 164.3, NULL, 0),
(1613, '2018-09-20', 8, 164.8, NULL, 0),
(1614, '2018-06-30', 38, 11, NULL, -1),
(1615, '2018-06-22', 38, 0, NULL, -1),
(1616, '2018-07-02', 38, 11, NULL, 0),
(1617, '2018-07-05', 38, 11, NULL, 0),
(1618, '2018-07-03', 38, 11, NULL, 0),
(1619, '2018-07-04', 38, 11, NULL, 0),
(1620, '2018-07-06', 38, 11, NULL, 0),
(1621, '2018-07-08', 38, 11, NULL, 0),
(1622, '2018-07-09', 38, 11, NULL, 0),
(1623, '2018-07-11', 38, 11, NULL, 0),
(1624, '2018-07-12', 38, 11, NULL, 0),
(1625, '2018-07-15', 38, 11, NULL, 0),
(1626, '2018-07-16', 38, 11, NULL, 0),
(1627, '2018-07-17', 38, 11, NULL, 0),
(1628, '2018-07-18', 38, 11, NULL, 0),
(1629, '2018-07-19', 38, 11, NULL, 0),
(1630, '2018-07-20', 38, 11, NULL, 0),
(1631, '2018-07-23', 38, 11, NULL, 0),
(1632, '2018-07-24', 38, 11, NULL, 0),
(1633, '2018-07-25', 38, 11, NULL, 0),
(1634, '2018-07-26', 38, 11, NULL, 0),
(1635, '2018-07-27', 38, 11, NULL, 0),
(1636, '2018-07-29', 38, 12, NULL, 0),
(1637, '2018-07-30', 38, 12, NULL, 0),
(1638, '2018-08-02', 38, 12, NULL, 0),
(1639, '2018-07-31', 38, 12, NULL, 0),
(1640, '2018-08-01', 38, 12, NULL, 0),
(1641, '2018-08-03', 38, 12, NULL, 0),
(1642, '2018-08-06', 38, 12, NULL, 0),
(1643, '2018-08-05', 38, 12, NULL, 0),
(1644, '2018-08-07', 38, 12, NULL, 0),
(1645, '2018-08-08', 38, 12, NULL, 0),
(1646, '2018-08-09', 38, 12, NULL, 0),
(1647, '2018-08-10', 38, 12, NULL, 0),
(1648, '2018-08-12', 38, 12, NULL, 0),
(1649, '2018-08-13', 38, 12, NULL, 0),
(1650, '2018-08-14', 38, 12, NULL, 0),
(1651, '2018-08-15', 38, 12, NULL, 0),
(1652, '2018-08-16', 38, 12, NULL, 0),
(1653, '2018-08-17', 38, 12, NULL, 0),
(1654, '2018-08-21', 38, 12, NULL, 0),
(1655, '2018-08-22', 38, 12, NULL, 0),
(1656, '2018-08-23', 38, 12, NULL, 0),
(1657, '2018-08-24', 38, 12, NULL, 0),
(1658, '2018-08-26', 38, 12, NULL, 0),
(1659, '2018-08-27', 38, 12, NULL, 0),
(1660, '2018-08-28', 38, 12, NULL, 0),
(1661, '2018-08-29', 38, 12, NULL, 0),
(1662, '2018-08-30', 38, 12, NULL, 0),
(1663, '2018-08-31', 38, 12, NULL, 0),
(1664, '2018-09-02', 38, 12, NULL, 0),
(1665, '2018-09-01', 38, 12, NULL, 0),
(1666, '2018-09-03', 38, 12, NULL, 0),
(1667, '2018-09-04', 38, 12, NULL, 0),
(1668, '2018-09-05', 38, 12, NULL, 0),
(1669, '2018-09-06', 38, 12, NULL, 0),
(1670, '2018-09-07', 38, 12, NULL, 0),
(1671, '2018-09-09', 38, 12, NULL, 0),
(1672, '2018-09-10', 38, 12, NULL, 0),
(1673, '2018-09-12', 38, 12, NULL, 0),
(1674, '2018-09-13', 38, 12, NULL, 0),
(1675, '2018-09-14', 38, 12, NULL, 0),
(1676, '2018-09-16', 38, 12, NULL, 0),
(1677, '2018-09-17', 38, 13, NULL, 0),
(1678, '2018-09-18', 38, 13, NULL, 0),
(1679, '2018-09-19', 38, 13, NULL, 0),
(1680, '2018-09-20', 38, 13, NULL, 0),
(1681, '2018-09-21', 39, 207.048, NULL, NULL),
(1682, '2018-09-21', 38, 13, NULL, NULL),
(1683, '2018-09-21', 15, 149.285, NULL, NULL),
(1684, '2018-09-21', 14, 576.716, NULL, NULL),
(1685, '2018-09-21', 7, 1084.111, NULL, NULL),
(1686, '2018-09-23', 1, 22, NULL, NULL),
(1687, '2018-09-21', 1, 22, NULL, NULL),
(1688, '2018-09-21', 2, 81, NULL, NULL),
(1689, '2018-09-21', 3, 103.202, NULL, NULL),
(1690, '2018-09-21', 4, 76.083, NULL, NULL),
(1691, '2018-09-21', 5, 1805.491, NULL, NULL),
(1692, '2018-09-21', 8, 165.4, NULL, NULL),
(1694, '2018-09-21', 9, 39.816, NULL, NULL),
(1695, '2018-09-21', 10, 646.901, NULL, NULL),
(1696, '2018-09-21', 11, 317, NULL, NULL),
(1697, '2018-09-21', 12, 47, NULL, NULL),
(1698, '2018-09-21', 13, 69, NULL, NULL),
(1699, '2018-09-23', 39, 221.469, NULL, NULL),
(1700, '2018-09-23', 38, 13, NULL, NULL),
(1701, '2018-09-22', 15, 149.285, NULL, NULL),
(1702, '2018-09-23', 14, 598.298, NULL, NULL),
(1704, '2018-09-23', 2, 82, NULL, NULL),
(1705, '2018-09-23', 3, 103.204, NULL, NULL),
(1706, '2018-09-23', 4, 76.126, NULL, NULL),
(1707, '2018-09-23', 5, 1808.49, NULL, NULL),
(1708, '2018-09-23', 8, 165.9, NULL, NULL),
(1709, '2018-09-23', 9, 40.038, NULL, NULL),
(1710, '2018-09-23', 10, 663.141, NULL, NULL),
(1712, '2018-09-23', 11, 319, NULL, NULL),
(1713, '2018-09-23', 12, 47, NULL, NULL),
(1714, '2018-09-23', 13, 69, NULL, NULL),
(1715, '2018-09-24', 39, 221.469, NULL, NULL),
(1716, '2018-09-24', 38, 13, NULL, NULL),
(1717, '2018-09-24', 7, 1089.044, NULL, NULL),
(1718, '2018-09-24', 15, 151.32, NULL, NULL),
(1719, '2018-09-24', 14, 602.315, NULL, NULL),
(1720, '2018-09-24', 13, 70, NULL, NULL),
(1721, '2018-09-24', 12, 48, NULL, NULL),
(1722, '2018-09-24', 11, 321, NULL, NULL),
(1723, '2018-09-24', 1, 23, NULL, NULL),
(1724, '2018-09-24', 2, 83, NULL, NULL),
(1725, '2018-09-24', 3, 103.204, NULL, NULL),
(1726, '2018-09-24', 4, 76.126, NULL, NULL),
(1727, '2018-09-24', 5, 1809.664, NULL, NULL),
(1728, '2018-09-24', 8, 166.1, NULL, NULL),
(1729, '2018-09-24', 9, 40.162, NULL, NULL),
(1730, '2018-09-24', 10, 663.143, NULL, NULL),
(1732, '2018-09-25', 39, 221.469, NULL, NULL),
(1733, '2018-09-25', 38, 13, NULL, NULL),
(1734, '2018-09-25', 15, 158.195, NULL, NULL),
(1735, '2018-09-25', 14, 611.634, NULL, NULL),
(1736, '2018-09-25', 7, 1091.076, NULL, NULL),
(1737, '2018-09-25', 1, 23, NULL, NULL),
(1738, '2018-09-25', 2, 83, NULL, NULL),
(1739, '2018-09-25', 3, 103.211, NULL, NULL),
(1740, '2018-09-25', 4, 76.166, NULL, NULL),
(1741, '2018-09-25', 5, 1811.479, NULL, NULL),
(1742, '2018-09-25', 8, 166.6, NULL, NULL),
(1743, '2018-09-25', 9, 40.43, NULL, NULL),
(1744, '2018-09-25', 10, 668.224, NULL, NULL),
(1745, '2018-09-25', 11, 323, NULL, NULL),
(1746, '2018-09-25', 12, 48, NULL, NULL),
(1747, '2018-09-25', 13, 70, NULL, NULL),
(1748, '2018-09-26', 39, 221.469, NULL, NULL),
(1749, '2018-09-26', 38, 13, NULL, NULL),
(1750, '2018-09-26', 1, 23, NULL, NULL),
(1751, '2018-09-26', 2, 84, NULL, NULL),
(1752, '2018-09-26', 3, 103.213, NULL, NULL),
(1753, '2018-09-26', 4, 76.197, NULL, NULL),
(1754, '2018-09-26', 5, 1812.976, NULL, NULL),
(1755, '2018-09-26', 7, 1092.681, NULL, NULL),
(1756, '2018-09-26', 8, 167, NULL, NULL),
(1757, '2018-09-26', 9, 44.827, NULL, NULL),
(1758, '2018-09-26', 10, 668.224, NULL, NULL),
(1759, '2018-09-26', 11, 325, NULL, NULL),
(1760, '2018-09-26', 12, 49, NULL, NULL),
(1761, '2018-09-26', 13, 70, NULL, NULL),
(1762, '2018-09-26', 14, 621.355, NULL, NULL),
(1763, '2018-09-26', 15, 158.763, NULL, NULL),
(1765, '2018-09-27', 39, 221.469, NULL, NULL),
(1766, '2018-09-27', 38, 13, NULL, NULL),
(1767, '2018-09-27', 15, 159.459, NULL, NULL),
(1768, '2018-09-27', 14, 626.899, NULL, NULL),
(1769, '2018-09-27', 1, 24, NULL, NULL),
(1770, '2018-09-27', 2, 84, NULL, NULL),
(1771, '2018-09-27', 3, 103.227, NULL, NULL),
(1772, '2018-09-27', 4, 76.244, NULL, NULL),
(1773, '2018-09-27', 5, 1814.607, NULL, NULL),
(1774, '2018-09-27', 7, 1093.4, NULL, NULL),
(1775, '2018-09-27', 8, 168.1, NULL, NULL),
(1776, '2018-09-27', 9, 44.939, NULL, NULL),
(1777, '2018-09-27', 10, 675.157, NULL, NULL),
(1778, '2018-09-27', 11, 327, NULL, NULL),
(1779, '2018-09-27', 12, 50, NULL, NULL),
(1780, '2018-09-27', 13, 70, NULL, NULL),
(1782, '2018-09-28', 39, 221.469, NULL, NULL),
(1783, '2018-09-28', 38, 13, NULL, NULL),
(1784, '2018-09-28', 15, 163.355, NULL, NULL),
(1785, '2018-09-28', 14, 634.236, NULL, NULL),
(1786, '2018-09-28', 1, 24, NULL, NULL),
(1787, '2018-09-28', 2, 84, NULL, NULL),
(1788, '2018-09-28', 3, 103.241, NULL, NULL),
(1789, '2018-09-28', 4, 76.275, NULL, NULL),
(1790, '2018-09-28', 5, 1816.133, NULL, NULL),
(1791, '2018-09-28', 7, 1093.4, NULL, NULL),
(1792, '2018-09-28', 8, 168.6, NULL, NULL),
(1793, '2018-09-28', 9, 45.095, NULL, NULL),
(1794, '2018-09-28', 10, 677.377, NULL, NULL),
(1795, '2018-09-28', 11, 327.655, NULL, NULL),
(1796, '2018-09-28', 12, 50, NULL, NULL),
(1797, '2018-09-28', 13, 70, NULL, NULL),
(1799, '2018-09-30', 39, 221.469, NULL, NULL),
(1800, '2018-09-30', 38, 13, NULL, NULL),
(1801, '2018-09-30', 15, 165.601, NULL, NULL),
(1802, '2018-09-30', 14, 652.605, NULL, NULL),
(1803, '2018-09-30', 1, 24, NULL, NULL),
(1804, '2018-09-30', 2, 87, NULL, NULL),
(1805, '2018-09-30', 3, 103.254, NULL, NULL),
(1806, '2018-09-30', 4, 76.411, NULL, NULL),
(1807, '2018-09-30', 5, 1819.088, NULL, NULL),
(1808, '2018-09-30', 7, 1098.141, NULL, NULL),
(1809, '2018-09-30', 8, 169.1, NULL, NULL),
(1810, '2018-09-30', 9, 45.387, NULL, NULL),
(1811, '2018-09-30', 10, 687.155, NULL, NULL),
(1812, '2018-09-30', 11, 334.178, NULL, NULL),
(1813, '2018-09-30', 12, 51, NULL, NULL),
(1814, '2018-09-30', 13, 71, NULL, NULL),
(1816, '2018-10-01', 39, 222.472, NULL, NULL),
(1817, '2018-10-01', 38, 13, NULL, NULL),
(1818, '2018-10-01', 15, 165.601, NULL, NULL),
(1819, '2018-10-01', 14, 658.692, NULL, NULL),
(1820, '2018-10-01', 13, 71, NULL, NULL),
(1821, '2018-10-01', 12, 51, NULL, NULL),
(1822, '2018-10-01', 11, 344.042, NULL, NULL),
(1823, '2018-10-01', 9, 45.387, NULL, NULL),
(1824, '2018-10-01', 8, 169.3, NULL, NULL),
(1825, '2018-10-01', 7, 1098.681, NULL, NULL),
(1826, '2018-10-01', 5, 1820.205, NULL, NULL),
(1827, '2018-10-01', 4, 76.413, NULL, NULL),
(1828, '2018-10-01', 3, 103.254, NULL, NULL),
(1829, '2018-10-01', 2, 87, NULL, NULL),
(1830, '2018-10-01', 1, 25, NULL, NULL),
(1831, '2018-10-02', 39, 222.472, NULL, NULL),
(1832, '2018-10-02', 38, 13, NULL, NULL),
(1833, '2018-10-02', 15, 166.601, NULL, NULL),
(1834, '2018-10-02', 14, 668.589, NULL, NULL),
(1835, '2018-10-02', 13, 71, NULL, NULL),
(1836, '2018-10-02', 12, 52, NULL, NULL),
(1837, '2018-10-02', 11, 355.263, NULL, NULL),
(1838, '2018-10-02', 10, 697.193, NULL, NULL),
(1839, '2018-10-02', 9, 45.449, NULL, NULL),
(1840, '2018-10-02', 8, 169.9, NULL, NULL),
(1841, '2018-10-02', 7, 1100.909, NULL, NULL),
(1842, '2018-10-02', 5, 1821.697, NULL, NULL),
(1843, '2018-10-02', 4, 76.48, NULL, NULL),
(1844, '2018-10-02', 3, 103.269, NULL, NULL),
(1845, '2018-10-02', 2, 87, NULL, NULL),
(1846, '2018-10-02', 1, 25, NULL, NULL),
(1847, '2018-10-03', 39, 227.109, NULL, NULL),
(1848, '2018-10-03', 38, 13, NULL, NULL),
(1849, '2018-10-03', 15, 166.659, NULL, NULL),
(1850, '2018-10-03', 14, 676.424, NULL, NULL),
(1851, '2018-10-03', 13, 72, NULL, NULL),
(1852, '2018-10-03', 1, 25, NULL, NULL),
(1853, '2018-10-03', 2, 88, NULL, NULL),
(1854, '2018-10-03', 3, 103.279, NULL, NULL),
(1855, '2018-10-03', 4, 76.526, NULL, NULL),
(1856, '2018-10-03', 5, 1823.439, NULL, NULL),
(1857, '2018-10-03', 7, 1102.306, NULL, NULL),
(1858, '2018-10-03', 8, 170.3, NULL, NULL),
(1860, '2018-10-03', 9, 45.647, NULL, NULL),
(1861, '2018-10-03', 10, 702.771, NULL, NULL),
(1862, '2018-10-04', 12, 53, NULL, NULL),
(1863, '2018-10-03', 12, 52, NULL, NULL),
(1865, '2018-10-04', 39, 228.06, NULL, NULL),
(1866, '2018-10-04', 38, 13, NULL, NULL),
(1867, '2018-10-04', 15, 168.479, NULL, NULL),
(1868, '2018-10-04', 14, 687.499, NULL, NULL),
(1869, '2018-10-04', 13, 72, NULL, NULL),
(1870, '2018-10-04', 1, 26, NULL, NULL),
(1871, '2018-10-04', 2, 88, NULL, NULL),
(1872, '2018-10-04', 3, 103.289, NULL, NULL),
(1873, '2018-10-04', 4, 76.56, NULL, NULL),
(1874, '2018-10-04', 5, 1824.681, NULL, NULL),
(1875, '2018-10-04', 7, 1103.541, NULL, NULL),
(1876, '2018-10-04', 8, 170.8, NULL, NULL),
(1877, '2018-10-04', 9, 45.963, NULL, NULL),
(1878, '2018-10-04', 10, 710.589, NULL, NULL),
(1880, '2018-10-05', 39, 231.448, NULL, NULL),
(1881, '2018-10-05', 38, 13, NULL, NULL),
(1882, '2018-10-05', 15, 168.479, NULL, NULL),
(1883, '2018-10-05', 14, 696.831, NULL, NULL),
(1884, '2018-10-05', 13, 72, NULL, NULL),
(1885, '2018-10-05', 1, 26, NULL, NULL),
(1886, '2018-10-05', 2, 89, NULL, NULL),
(1887, '2018-10-05', 3, 103.301, NULL, NULL),
(1888, '2018-10-05', 4, 76.614, NULL, NULL),
(1890, '2018-10-05', 5, 1826.062, NULL, NULL),
(1891, '2018-10-05', 7, 1105.728, NULL, NULL),
(1892, '2018-10-05', 8, 171.2, NULL, NULL),
(1893, '2018-10-05', 9, 46.11, NULL, NULL),
(1894, '2018-10-05', 10, 716.36, NULL, NULL),
(1895, '2018-10-05', 12, 54, NULL, NULL),
(1897, '2018-08-31', 43, 0, NULL, NULL),
(1898, '2018-08-01', 43, 10.104, NULL, NULL),
(1901, '2018-09-01', 43, 25.987, NULL, NULL),
(1902, '2018-09-10', 43, 30.921, NULL, NULL),
(1903, '2018-09-17', 43, 36.373, NULL, NULL),
(1904, '2018-09-24', 43, 39.269, NULL, NULL),
(1905, '2018-09-30', 43, 43.242, NULL, NULL),
(1906, '2018-10-01', 43, 43.719, NULL, NULL),
(1907, '2018-10-07', 43, 47.975, NULL, NULL),
(1908, '2018-10-05', 43, 45.553, NULL, NULL),
(1909, '2018-10-08', 43, 48.605, NULL, NULL),
(1910, '2018-10-09', 43, 48.998, NULL, NULL),
(1911, '2018-10-10', 43, 49.679, NULL, NULL),
(1912, '2018-09-30', 42, 0, NULL, NULL),
(1913, '2018-10-01', 42, 9.864, NULL, NULL),
(1914, '2018-10-02', 42, 11.221, NULL, NULL),
(1915, '2018-10-03', 42, 12.178, NULL, NULL),
(1916, '2018-10-04', 42, 13.858, NULL, NULL),
(1917, '2018-10-05', 42, 16.099, NULL, NULL),
(1918, '2018-10-07', 42, 19.781, NULL, NULL),
(1919, '2018-10-08', 42, 21.761, NULL, NULL),
(1920, '2018-10-09', 42, 24.422, NULL, NULL),
(1921, '2018-10-10', 42, 26.79, NULL, NULL),
(1922, '2018-10-01', 41, 0, NULL, NULL),
(1923, '2018-10-02', 41, 0.062, NULL, NULL),
(1924, '2018-10-03', 41, 0.198, NULL, NULL),
(1925, '2018-10-04', 41, 0.316, NULL, NULL),
(1926, '2018-10-05', 41, 0.463, NULL, NULL),
(1927, '2018-10-07', 41, 0.666, NULL, NULL),
(1928, '2018-10-08', 41, 0.71, NULL, NULL),
(1929, '2018-10-09', 41, 0.834, NULL, NULL),
(1930, '2018-10-10', 41, 0.897, NULL, NULL),
(1931, '2018-09-25', 40, 158.195, NULL, NULL),
(1932, '2018-09-27', 40, 159.459, NULL, NULL),
(1933, '2018-09-28', 40, 163.355, NULL, NULL),
(1935, '2018-09-30', 40, 165.601, NULL, NULL),
(1936, '2018-10-01', 40, 165.601, NULL, NULL),
(1937, '2018-10-02', 40, 165.601, NULL, NULL),
(1938, '2018-10-03', 40, 166.659, NULL, NULL),
(1939, '2018-10-04', 40, 168.479, NULL, NULL),
(1940, '2018-10-05', 40, 168.479, NULL, NULL),
(1941, '2018-10-07', 40, 169.831, NULL, NULL),
(1942, '2018-10-08', 40, 169.831, NULL, NULL),
(1943, '2018-10-09', 40, 171.412, NULL, NULL),
(1944, '2018-10-10', 40, 173.358, NULL, NULL),
(1945, '2018-10-07', 39, 231.448, NULL, NULL),
(1946, '2018-10-08', 39, 231.448, NULL, NULL),
(1947, '2018-10-09', 39, 240.384, NULL, NULL),
(1948, '2018-10-10', 39, 240.384, NULL, NULL),
(1949, '2018-10-07', 38, 13, NULL, NULL),
(1950, '2018-10-08', 38, 14, NULL, NULL),
(1952, '2018-10-09', 38, 14, NULL, NULL),
(1954, '2018-10-10', 38, 14, NULL, NULL),
(1956, '2018-10-07', 1, 27, NULL, NULL),
(1957, '2018-10-08', 1, 28, NULL, NULL),
(1958, '2018-10-09', 1, 28, NULL, NULL),
(1959, '2018-10-10', 1, 28, NULL, NULL),
(1960, '2018-10-10', 2, 94, NULL, NULL),
(1961, '2018-10-07', 3, 103.315, NULL, NULL),
(1962, '2018-10-08', 3, 103.315, NULL, NULL),
(1963, '2018-10-09', 3, 103.326, NULL, NULL),
(1964, '2018-10-10', 3, 103.342, NULL, NULL),
(1965, '2018-10-07', 4, 76.722, NULL, NULL),
(1966, '2018-10-08', 4, 76.727, NULL, NULL),
(1967, '2018-10-09', 4, 76.752, NULL, NULL),
(1968, '2018-10-10', 4, 76.845, NULL, NULL),
(1969, '2018-10-07', 5, 1828.835, NULL, NULL),
(1970, '2018-10-08', 5, 1830.002, NULL, NULL),
(1971, '2018-10-09', 5, 1831.743, NULL, NULL),
(1972, '2018-10-10', 5, 1833.202, NULL, NULL),
(1973, '2018-10-07', 7, 1110.239, NULL, NULL),
(1974, '2018-10-08', 7, 1112.215, NULL, NULL),
(1975, '2018-10-09', 7, 1113.142, NULL, NULL),
(1976, '2018-10-10', 7, 1113.704, NULL, NULL),
(1977, '2018-10-07', 8, 171.8, NULL, NULL),
(1978, '2018-10-08', 8, 172.1, NULL, NULL),
(1979, '2018-10-10', 8, 172.8, NULL, NULL),
(1981, '2018-10-07', 10, 725.717, NULL, NULL),
(1982, '2018-10-08', 10, 729.66, NULL, NULL),
(1983, '2018-10-09', 10, 736.101, NULL, NULL),
(1984, '2018-10-10', 10, 743.136, NULL, NULL),
(1985, '2018-10-07', 12, 55, NULL, NULL),
(1986, '2018-10-08', 12, 55, NULL, NULL),
(1987, '2018-10-09', 12, 55, NULL, NULL),
(1988, '2018-10-10', 12, 55, NULL, NULL),
(1989, '2018-10-07', 13, 73, NULL, NULL),
(1990, '2018-10-08', 13, 73, NULL, NULL),
(1991, '2018-10-09', 13, 74, NULL, NULL),
(1992, '2018-10-10', 13, 74, NULL, NULL),
(1993, '2018-10-07', 14, 711.385, NULL, NULL),
(1994, '2018-10-08', 14, 716.755, NULL, NULL),
(1995, '2018-10-09', 14, 729.887, NULL, NULL),
(1996, '2018-10-10', 14, 737.224, NULL, NULL),
(1997, '2018-10-11', 43, 50.462, NULL, NULL),
(1998, '2018-10-11', 42, 28.521, NULL, NULL),
(1999, '2018-10-11', 41, 1.016, NULL, NULL),
(2000, '2018-10-11', 40, 174.914, NULL, NULL),
(2001, '2018-10-11', 39, 240.384, NULL, NULL),
(2002, '2018-10-11', 38, 14, NULL, NULL),
(2003, '2018-10-11', 13, 74, NULL, NULL),
(2004, '2018-10-11', 12, 56, NULL, NULL),
(2005, '2018-10-11', 10, 744.168, NULL, NULL),
(2006, '2018-10-11', 8, 172.9, NULL, NULL),
(2007, '2018-10-11', 7, 1115.162, NULL, NULL),
(2008, '2018-10-11', 5, 1834.817, NULL, NULL),
(2009, '2018-10-11', 4, 76.845, NULL, NULL),
(2010, '2018-10-11', 3, 103.347, NULL, NULL),
(2011, '2018-10-11', 2, 94, NULL, NULL),
(2012, '2018-10-11', 1, 28, NULL, NULL),
(2013, '2018-10-12', 43, 50.964, NULL, NULL),
(2014, '2018-10-12', 42, 30.585, NULL, NULL),
(2015, '2018-10-12', 41, 1.207, NULL, NULL),
(2016, '2018-10-12', 40, 175.839, NULL, NULL),
(2017, '2018-10-12', 39, 240.384, NULL, NULL),
(2018, '2018-10-12', 38, 14, NULL, NULL),
(2019, '2018-10-12', 13, 74, NULL, NULL),
(2020, '2018-10-12', 12, 56, NULL, NULL),
(2021, '2018-10-12', 10, 748.446, NULL, NULL),
(2022, '2018-10-12', 8, 173.2, NULL, NULL),
(2023, '2018-10-12', 7, 1117.001, NULL, NULL),
(2024, '2018-10-12', 5, 1836.317, NULL, NULL),
(2025, '2018-10-12', 4, 76.902, NULL, NULL),
(2027, '2018-10-12', 3, 103.36, NULL, NULL),
(2028, '2018-10-12', 2, 95, NULL, NULL),
(2029, '2018-10-12', 1, 28, NULL, NULL),
(2030, '2018-10-15', 43, 53.097, NULL, NULL),
(2031, '2018-10-15', 42, 40.705, NULL, NULL),
(2032, '2018-10-15', 41, 1.512, NULL, NULL),
(2033, '2018-10-15', 40, 177.575, NULL, NULL),
(2034, '2018-10-15', 39, 240.384, NULL, NULL),
(2035, '2018-10-15', 38, 14, NULL, NULL),
(2036, '2018-10-15', 13, 74, NULL, NULL),
(2037, '2018-10-16', 8, 174.4, NULL, NULL),
(2038, '2018-10-15', 10, 751.709, NULL, NULL),
(2039, '2018-10-15', 8, 174.1, NULL, NULL),
(2040, '2018-10-16', 1, 28, NULL, NULL),
(2041, '2018-10-15', 5, 1840.612, NULL, NULL),
(2042, '2018-10-15', 4, 76.978, NULL, NULL),
(2043, '2018-10-15', 3, 103.384, NULL, NULL),
(2044, '2018-10-15', 2, 97, NULL, NULL),
(2045, '2018-10-15', 1, 28, NULL, NULL),
(2046, '2018-10-16', 43, 53.565, NULL, NULL),
(2047, '2018-10-16', 13, 75, NULL, NULL),
(2048, '2018-10-16', 42, 40.705, NULL, NULL),
(2049, '2018-10-16', 41, 1.572, NULL, NULL),
(2050, '2018-10-16', 40, 178.46, NULL, NULL),
(2051, '2018-10-16', 39, 240.384, NULL, NULL),
(2052, '2018-10-16', 38, 14, NULL, NULL),
(2053, '2018-10-16', 12, 57, NULL, NULL),
(2054, '2018-10-16', 10, 763.814, NULL, NULL),
(2056, '2018-10-16', 7, 1117.01, NULL, NULL),
(2057, '2018-10-16', 5, 1841.619, NULL, NULL),
(2058, '2018-10-16', 4, 77, NULL, NULL),
(2059, '2018-10-16', 3, 103.393, NULL, NULL),
(2061, '2018-10-16', 2, 97, NULL, NULL),
(2063, '2018-10-17', 43, 54.597, NULL, NULL),
(2064, '2018-10-17', 42, 44.744, NULL, NULL),
(2065, '2018-10-17', 41, 1.648, NULL, NULL),
(2066, '2018-10-17', 40, 179.336, NULL, NULL),
(2067, '2018-10-17', 39, 240.384, NULL, NULL),
(2068, '2018-10-17', 38, 14, NULL, NULL),
(2069, '2018-10-17', 13, 76, NULL, NULL),
(2070, '2018-10-17', 12, 57, NULL, NULL),
(2071, '2018-10-17', 10, 765.309, NULL, NULL),
(2072, '2018-10-17', 8, 174.5, NULL, NULL),
(2073, '2018-10-17', 7, 1125.255, NULL, NULL),
(2074, '2018-10-17', 5, 1843.14, NULL, NULL),
(2075, '2018-10-17', 4, 77.045, NULL, NULL),
(2076, '2018-10-17', 3, 103.398, NULL, NULL),
(2077, '2018-10-17', 2, 98, NULL, NULL),
(2081, '2018-10-17', 1, 29, NULL, NULL),
(2082, '2018-10-19', 43, 55.896, NULL, NULL),
(2083, '2018-10-19', 42, 48.397, NULL, NULL),
(2084, '2018-10-19', 41, 1.899, NULL, NULL),
(2085, '2018-10-19', 40, 179.836, NULL, NULL),
(2086, '2018-10-19', 39, 240.384, NULL, NULL),
(2087, '2018-10-19', 38, 14, NULL, NULL),
(2088, '2018-10-19', 14, 796.023, NULL, NULL),
(2089, '2018-10-19', 13, 76, NULL, NULL),
(2091, '2018-10-19', 12, 58, NULL, NULL),
(2092, '2018-10-19', 10, 769.272, NULL, NULL),
(2093, '2018-10-19', 8, 175.5, NULL, NULL),
(2094, '2018-10-19', 7, 1130.141, NULL, NULL),
(2095, '2018-10-19', 5, 1846.251, NULL, NULL),
(2096, '2018-10-19', 4, 77.127, NULL, NULL),
(2097, '2018-10-19', 3, 103.437, NULL, NULL),
(2098, '2018-10-19', 2, 99, NULL, NULL),
(2099, '2018-10-19', 1, 29, NULL, NULL),
(2100, '2018-10-21', 43, 57.596, NULL, NULL),
(2101, '2018-10-21', 42, 53.938, NULL, NULL),
(2102, '2018-10-21', 41, 2.183, NULL, NULL),
(2103, '2018-10-21', 40, 179.836, NULL, NULL),
(2105, '2018-10-21', 39, 240.384, NULL, NULL),
(2106, '2018-10-21', 38, 14, NULL, NULL),
(2107, '2018-10-21', 14, 812.566, NULL, NULL),
(2108, '2018-10-21', 13, 77, NULL, NULL),
(2109, '2018-10-21', 12, 59, NULL, NULL),
(2110, '2018-10-21', 10, 775.111, NULL, NULL),
(2111, '2018-10-21', 8, 176.1, NULL, NULL),
(2112, '2018-10-21', 7, 1134.858, NULL, NULL),
(2113, '2018-10-21', 5, 1848.723, NULL, NULL),
(2114, '2018-10-21', 4, 77.149, NULL, NULL),
(2115, '2018-10-21', 3, 103.448, NULL, NULL),
(2116, '2018-10-21', 2, 101, NULL, NULL),
(2118, '2018-10-21', 1, 30, NULL, NULL),
(2119, '2018-10-24', 43, 58.9, NULL, NULL),
(2120, '2018-10-24', 42, 60.217, NULL, NULL),
(2121, '2018-10-24', 41, 2.593, NULL, NULL),
(2122, '2018-10-24', 40, 180.994, NULL, NULL),
(2123, '2018-10-24', 39, 240.384, NULL, NULL),
(2125, '2018-10-24', 38, 14, NULL, NULL),
(2126, '2018-10-24', 14, 829.558, NULL, NULL),
(2127, '2018-10-24', 13, 77, NULL, NULL),
(2128, '2018-10-24', 12, 60, NULL, NULL),
(2129, '2018-10-24', 10, 782.079, NULL, NULL),
(2130, '2018-10-24', 8, 177.4, NULL, NULL),
(2131, '2018-10-24', 7, 1140.084, NULL, NULL),
(2132, '2018-10-24', 5, 1852.469, NULL, NULL),
(2133, '2018-10-24', 4, 77.265, NULL, NULL),
(2134, '2018-10-24', 3, 103.459, NULL, NULL),
(2136, '2018-10-24', 2, 103, NULL, NULL),
(2137, '2018-10-24', 1, 31, NULL, NULL),
(2138, '2018-10-28', 43, 61.169, NULL, NULL),
(2139, '2018-10-28', 42, 72.262, NULL, NULL),
(2140, '2018-10-28', 41, 3.181, NULL, NULL),
(2141, '2018-10-28', 40, 183.872, NULL, NULL),
(2143, '2018-10-28', 39, 240.384, NULL, NULL),
(2144, '2018-10-28', 38, 14, NULL, NULL),
(2145, '2018-10-28', 14, 854.709, NULL, NULL),
(2146, '2018-10-28', 12, 61, NULL, NULL),
(2147, '2018-10-28', 10, 788.532, NULL, NULL),
(2148, '2018-10-28', 8, 179.7, NULL, NULL),
(2149, '2018-10-28', 7, 1140.084, NULL, NULL),
(2151, '2018-10-28', 5, 1858.792, NULL, NULL),
(2152, '2018-10-28', 4, 77.403, NULL, NULL),
(2153, '2018-10-28', 3, 103.512, NULL, NULL),
(2154, '2018-10-28', 2, 105, NULL, NULL),
(2155, '2018-10-28', 1, 32, NULL, NULL),
(2156, '2018-10-29', 43, 62.168, NULL, NULL),
(2157, '2018-10-29', 42, 75.453, NULL, NULL),
(2158, '2018-10-29', 41, 3.309, NULL, NULL),
(2159, '2018-10-29', 40, 183.873, NULL, NULL),
(2160, '2018-10-29', 39, 240.384, NULL, NULL),
(2161, '2018-10-29', 38, 14, NULL, NULL),
(2162, '2018-10-29', 14, 859.021, NULL, NULL),
(2163, '2018-10-29', 13, 79, NULL, NULL),
(2164, '2018-10-29', 12, 61, NULL, NULL),
(2165, '2018-10-29', 10, 788.726, NULL, NULL),
(2166, '2018-10-29', 8, 179.9, NULL, NULL),
(2167, '2018-10-29', 7, 1149.222, NULL, NULL),
(2168, '2018-10-29', 5, 1859.856, NULL, NULL),
(2169, '2018-10-29', 4, 77.407, NULL, NULL),
(2170, '2018-10-29', 3, 103.512, NULL, NULL),
(2171, '2018-10-29', 2, 105, NULL, NULL),
(2172, '2018-10-29', 1, 32, NULL, NULL),
(2173, '2018-10-31', 43, 62.559, NULL, NULL),
(2174, '2018-10-31', 42, 81.408, NULL, NULL),
(2175, '2018-10-31', 41, 3.539, NULL, NULL),
(2176, '2018-10-31', 40, 184.952, NULL, NULL),
(2177, '2018-10-31', 39, 240.384, NULL, NULL),
(2178, '2018-10-31', 38, 14, NULL, NULL),
(2179, '2018-10-31', 14, 871.408, NULL, NULL),
(2181, '2018-10-31', 13, 80, NULL, NULL),
(2182, '2018-10-31', 12, 63, NULL, NULL),
(2183, '2018-10-31', 10, 791, NULL, NULL),
(2184, '2018-10-31', 8, 181.1, NULL, NULL),
(2185, '2018-10-31', 7, 1153.613, NULL, NULL),
(2186, '2018-10-31', 5, 1863.255, NULL, NULL),
(2188, '2018-10-31', 4, 77.502, NULL, NULL),
(2189, '2018-10-31', 3, 103.539, NULL, NULL),
(2190, '2018-10-31', 2, 105, NULL, NULL),
(2191, '2018-10-31', 1, 34, NULL, NULL),
(2192, '2018-11-01', 43, 63.799, NULL, NULL),
(2193, '2018-11-01', 42, 87.875, NULL, NULL),
(2194, '2018-11-01', 41, 3.94, NULL, NULL),
(2195, '2018-11-01', 40, 184.952, NULL, NULL),
(2196, '2018-11-08', 39, 240.384, NULL, NULL),
(2197, '2018-11-01', 39, 240.384, NULL, NULL),
(2198, '2018-11-01', 38, 14, NULL, NULL),
(2199, '2018-11-01', 14, 883.111, NULL, NULL),
(2200, '2018-11-08', 43, 67.136, NULL, NULL),
(2201, '2018-11-08', 42, 105.791, NULL, NULL),
(2202, '2018-11-08', 41, 4.425, NULL, NULL),
(2203, '2018-11-08', 40, 189.343, NULL, NULL),
(2205, '2018-11-08', 38, 14, NULL, NULL),
(2206, '2018-11-08', 13, 83, NULL, NULL),
(2207, '2018-11-08', 12, 68, NULL, NULL),
(2209, '2018-11-08', 10, 801.446, NULL, NULL),
(2210, '2018-11-08', 8, 184.3, NULL, NULL),
(2211, '2018-11-08', 7, 1171.871, NULL, NULL),
(2212, '2018-11-08', 4, 77.849, NULL, NULL),
(2213, '2018-11-08', 3, 103.628, NULL, NULL),
(2214, '2018-11-08', 2, 112, NULL, NULL),
(2215, '2018-11-08', 1, 38, NULL, NULL),
(2216, '2018-11-09', 43, 67.436, NULL, NULL),
(2217, '2018-11-09', 42, 109.235, NULL, NULL),
(2218, '2018-11-09', 41, 4.536, NULL, NULL),
(2219, '2018-11-09', 40, 190.265, NULL, NULL),
(2220, '2018-11-09', 39, 257.5, NULL, NULL),
(2221, '2018-11-09', 38, 14, NULL, NULL),
(2222, '2018-11-09', 13, 83, NULL, NULL),
(2223, '2018-11-09', 12, 68, NULL, NULL),
(2231, '2018-11-09', 10, 806.865, NULL, NULL),
(2232, '2018-11-09', 8, 184.9, NULL, NULL),
(2233, '2018-11-09', 7, 1174.535, NULL, NULL),
(2234, '2018-11-09', 5, 1877.578, NULL, NULL),
(2235, '2018-11-09', 4, 77.919, NULL, NULL),
(2236, '2018-11-09', 3, 103.643, NULL, NULL),
(2237, '2018-11-09', 2, 112, NULL, NULL),
(2238, '2018-11-09', 1, 39, NULL, NULL),
(2239, '2018-11-14', 43, 70.069, NULL, NULL),
(2240, '2018-11-14', 42, 125.986, NULL, NULL),
(2241, '2018-11-14', 41, 5.014, NULL, NULL),
(2242, '2018-11-14', 40, 190.494, NULL, NULL),
(2243, '2018-11-14', 39, 257.5, NULL, NULL),
(2244, '2018-11-14', 38, 14, NULL, NULL),
(2245, '2018-11-14', 13, 84, NULL, NULL),
(2246, '2018-11-14', 12, 70, NULL, NULL),
(2247, '2018-11-14', 8, 186.9, NULL, NULL),
(2248, '2018-11-14', 7, 1186.755, NULL, NULL),
(2250, '2018-11-14', 5, 1884.367, NULL, NULL),
(2251, '2018-11-14', 4, 78.899, NULL, NULL),
(2252, '2018-11-14', 3, 103.668, NULL, NULL),
(2253, '2018-11-14', 2, 114, NULL, NULL),
(2254, '2018-11-14', 1, 41, NULL, NULL),
(2255, '2018-11-23', 43, 75.231, NULL, NULL),
(2256, '2018-11-23', 42, 147.054, NULL, NULL),
(2257, '2018-11-23', 41, 6.07, NULL, NULL),
(2258, '2018-11-23', 40, 190.497, NULL, NULL),
(2259, '2018-11-23', 39, 257.5, NULL, NULL),
(2260, '2018-11-23', 38, 14, NULL, NULL),
(2261, '2018-11-23', 13, 88, NULL, NULL),
(2262, '2018-11-23', 12, 75, NULL, NULL),
(2263, '2018-11-23', 10, 944.836, NULL, NULL),
(2265, '2018-11-23', 8, 192.1, NULL, NULL),
(2266, '2018-11-23', 7, 1209.553, NULL, NULL),
(2267, '2018-11-23', 5, 1897.223, NULL, NULL),
(2268, '2018-11-23', 4, 78.899, NULL, NULL),
(2269, '2018-11-23', 3, 103.749, NULL, NULL),
(2270, '2018-11-23', 2, 121, NULL, NULL),
(2271, '2018-11-23', 1, 45, NULL, NULL),
(2272, '2018-11-26', 43, 76.475, NULL, NULL),
(2273, '2018-11-26', 42, 150.522, NULL, NULL),
(2274, '2018-11-26', 41, 6.369, NULL, NULL),
(2275, '2018-11-26', 40, 190.498, NULL, NULL),
(2276, '2018-11-26', 39, 257.5, NULL, NULL),
(2277, '2018-11-26', 38, 14, NULL, NULL),
(2278, '2018-11-26', 13, 89, NULL, NULL),
(2279, '2018-11-26', 12, 76, NULL, NULL),
(2280, '2018-11-26', 10, 944.836, NULL, NULL),
(2281, '2018-11-26', 8, 192.8, NULL, NULL),
(2282, '2018-11-26', 7, 1214.181, NULL, NULL),
(2283, '2018-11-26', 5, 1900.583, NULL, NULL),
(2284, '2018-11-26', 4, 78.899, NULL, NULL),
(2285, '2018-11-26', 3, 103.758, NULL, NULL),
(2286, '2018-11-26', 2, 122, NULL, NULL),
(2287, '2018-11-26', 1, 46, NULL, NULL),
(2288, '2018-11-28', 43, 77.136, NULL, NULL),
(2289, '2018-11-28', 42, 152.03, NULL, NULL),
(2290, '2018-11-28', 41, 6.548, NULL, NULL),
(2291, '2018-11-28', 40, 191.594, NULL, NULL),
(2292, '2018-11-28', 39, 257.5, NULL, NULL),
(2293, '2018-11-28', 38, 14, NULL, NULL),
(2294, '2018-11-28', 13, 90, NULL, NULL),
(2295, '2018-11-28', 12, 78, NULL, NULL),
(2296, '2018-11-28', 10, 944.836, NULL, NULL),
(2297, '2018-11-28', 8, 194.4, NULL, NULL),
(2298, '2018-11-28', 7, 1218.581, NULL, NULL),
(2300, '2018-11-28', 5, 1903.583, NULL, NULL),
(2301, '2018-11-28', 4, 78.899, NULL, NULL),
(2304, '2018-11-28', 3, 103.787, NULL, NULL),
(2305, '2018-11-28', 2, 123, NULL, NULL),
(2306, '2018-11-28', 1, 47, NULL, NULL),
(2307, '2018-11-30', 43, 78.176, NULL, NULL),
(2308, '2018-11-30', 42, 153.435, NULL, NULL),
(2309, '2018-11-30', 41, 6.78, NULL, NULL),
(2310, '2018-11-30', 40, 191.594, NULL, NULL),
(2312, '2018-11-30', 39, 257.5, NULL, NULL),
(2313, '2018-11-30', 38, 14, NULL, NULL),
(2314, '2018-11-30', 13, 92, NULL, NULL),
(2315, '2018-11-30', 12, 78, NULL, NULL),
(2316, '2018-11-30', 10, 944.836, NULL, NULL),
(2317, '2018-11-30', 8, 195.5, NULL, NULL),
(2318, '2018-11-30', 7, 1218.581, NULL, NULL),
(2319, '2018-11-30', 5, 1906.646, NULL, NULL),
(2320, '2018-11-30', 4, 78.899, NULL, NULL),
(2321, '2018-11-30', 3, 103.787, NULL, NULL),
(2322, '2018-11-30', 2, 123, NULL, NULL),
(2323, '2018-11-30', 1, 48, NULL, NULL),
(2324, '2018-12-02', 43, 79.497, NULL, NULL),
(2325, '2018-12-02', 42, 155.835, NULL, NULL),
(2326, '2018-12-02', 41, 7.008, NULL, NULL),
(2327, '2018-12-02', 40, 191.984, NULL, NULL),
(2328, '2018-12-02', 39, 257.5, NULL, NULL),
(2330, '2018-12-02', 38, 14, NULL, NULL),
(2331, '2018-12-02', 13, 93, NULL, NULL),
(2332, '2018-12-02', 12, 79, NULL, NULL),
(2333, '2018-12-02', 10, 944.836, NULL, NULL),
(2334, '2018-12-02', 8, 196.5, NULL, NULL),
(2335, '2018-12-02', 7, 1230.13, NULL, NULL),
(2336, '2018-12-02', 5, 1910.655, NULL, NULL),
(2337, '2018-12-02', 4, 78.899, NULL, NULL),
(2338, '2018-12-02', 3, 103.818, NULL, NULL),
(2339, '2018-12-02', 2, 123, NULL, NULL),
(2340, '2018-12-02', 1, 49, NULL, NULL),
(2341, '2018-12-03', 43, 79.759, NULL, NULL),
(2342, '2018-12-03', 42, 156.465, NULL, NULL),
(2343, '2018-12-03', 41, 7.078, NULL, NULL),
(2344, '2018-12-03', 40, 191.984, NULL, NULL),
(2345, '2018-12-03', 39, 257.5, NULL, NULL),
(2346, '2018-12-03', 38, 14, NULL, NULL),
(2347, '2018-12-03', 13, 94, NULL, NULL),
(2348, '2018-12-03', 12, 80, NULL, NULL),
(2349, '2018-12-03', 10, 944.836, NULL, NULL),
(2350, '2018-12-03', 8, 196.7, NULL, NULL),
(2351, '2018-12-03', 7, 1230.557, NULL, NULL),
(2352, '2018-12-03', 5, 1911.455, NULL, NULL),
(2353, '2018-12-03', 4, 78.899, NULL, NULL),
(2354, '2018-12-03', 3, 103.823, NULL, NULL),
(2355, '2018-12-03', 2, 124, NULL, NULL),
(2356, '2018-12-03', 1, 50, NULL, NULL),
(2357, '2018-12-04', 43, 80.173, NULL, NULL),
(2358, '2018-12-04', 42, 157.549, NULL, NULL),
(2359, '2018-12-04', 41, 7.203, NULL, NULL),
(2360, '2018-12-04', 40, 191.984, NULL, NULL),
(2361, '2018-12-04', 39, 257.5, NULL, NULL),
(2362, '2018-12-04', 38, 14, NULL, NULL),
(2363, '2018-12-04', 13, 95, NULL, NULL),
(2364, '2018-12-04', 12, 81, NULL, NULL),
(2365, '2018-12-04', 10, 944.836, NULL, NULL),
(2366, '2018-12-04', 8, 197.3, NULL, NULL),
(2367, '2018-12-04', 7, 1233.542, NULL, NULL),
(2368, '2018-12-04', 5, 1913.217, NULL, NULL),
(2369, '2018-12-04', 4, 78.899, NULL, NULL),
(2370, '2018-12-04', 3, 103.831, NULL, NULL),
(2371, '2018-12-04', 2, 125, NULL, NULL),
(2372, '2018-12-04', 1, 50, NULL, NULL),
(2373, '2018-12-05', 43, 80.459, NULL, NULL),
(2374, '2018-12-05', 42, 158.121, NULL, NULL),
(2375, '2018-12-05', 41, 7.287, NULL, NULL),
(2376, '2018-12-05', 40, 191.987, NULL, NULL),
(2377, '2018-12-05', 39, 257.5, NULL, NULL),
(2378, '2018-12-05', 38, 14, NULL, NULL),
(2379, '2018-12-05', 13, 95, NULL, NULL),
(2380, '2018-12-05', 12, 81, NULL, NULL),
(2381, '2018-12-05', 10, 944.836, NULL, NULL),
(2382, '2018-12-05', 8, 197.5, NULL, NULL),
(2383, '2018-12-05', 7, 1235.152, NULL, NULL),
(2384, '2018-12-05', 5, 1914.658, NULL, NULL),
(2385, '2018-12-05', 4, 78.899, NULL, NULL),
(2386, '2018-12-05', 3, 103.836, NULL, NULL),
(2387, '2018-12-05', 2, 126, NULL, NULL),
(2388, '2018-12-05', 1, 51, NULL, NULL),
(2389, '2018-12-06', 43, 80.883, NULL, NULL),
(2390, '2018-12-06', 42, 158.782, NULL, NULL),
(2391, '2018-12-06', 41, 7.446, NULL, NULL),
(2392, '2018-12-06', 40, 191.987, NULL, NULL),
(2393, '2018-12-06', 39, 257.5, NULL, NULL),
(2394, '2018-12-06', 38, 14, NULL, NULL),
(2395, '2018-12-06', 8, 198.3, NULL, NULL),
(2396, '2018-12-06', 13, 95, NULL, NULL),
(2397, '2018-12-06', 12, 81, NULL, NULL),
(2398, '2018-12-06', 10, 944.836, NULL, NULL),
(2399, '2018-12-06', 7, 1238.831, NULL, NULL),
(2400, '2018-12-06', 5, 1916.41, NULL, NULL),
(2401, '2018-12-06', 4, 78.899, NULL, NULL),
(2402, '2018-12-06', 3, 103.869, NULL, NULL),
(2403, '2018-12-06', 2, 126, NULL, NULL),
(2404, '2018-12-06', 1, 51, NULL, NULL),
(2405, '2018-12-07', 43, 81.251, NULL, NULL),
(2406, '2018-12-07', 42, 159.56, NULL, NULL),
(2407, '2018-12-07', 41, 7.588, NULL, NULL),
(2408, '2018-12-07', 40, 191.987, NULL, NULL),
(2409, '2018-12-07', 39, 257.5, NULL, NULL),
(2410, '2018-12-07', 38, 14, NULL, NULL),
(2411, '2018-12-07', 13, 95, NULL, NULL),
(2412, '2018-12-07', 12, 81, NULL, NULL),
(2413, '2018-12-07', 10, 944.836, NULL, NULL),
(2414, '2018-12-07', 8, 198.8, NULL, NULL),
(2415, '2018-12-07', 7, 1241.072, NULL, NULL),
(2416, '2018-12-07', 5, 1917.903, NULL, NULL),
(2417, '2018-12-07', 4, 78.899, NULL, NULL),
(2418, '2018-12-07', 3, 103.878, NULL, NULL),
(2419, '2018-12-07', 2, 126, NULL, NULL),
(2420, '2018-12-07', 1, 51, NULL, NULL),
(2421, '2018-12-10', 43, 83.411, NULL, NULL),
(2422, '2018-12-10', 42, 171.103, NULL, NULL),
(2423, '2018-12-10', 41, 7.79, NULL, NULL),
(2424, '2018-12-10', 40, 191.988, NULL, NULL),
(2425, '2018-12-10', 39, 257.5, NULL, NULL),
(2426, '2018-12-10', 38, 14, NULL, NULL),
(2427, '2018-12-10', 13, 95, NULL, NULL),
(2431, '2018-12-10', 12, 81, NULL, NULL),
(2432, '2018-12-10', 10, 944.836, NULL, NULL),
(2433, '2018-12-10', 8, 199.7, NULL, NULL),
(2434, '2018-12-10', 7, 1247.955, NULL, NULL),
(2435, '2018-12-10', 5, 1922.262, NULL, NULL),
(2436, '2018-12-10', 4, 78.899, NULL, NULL),
(2437, '2018-12-10', 3, 103.883, NULL, NULL),
(2438, '2018-12-10', 2, 128, NULL, NULL),
(2439, '2018-12-10', 1, 52, NULL, NULL),
(2440, '2018-12-11', 43, 83.803, NULL, NULL),
(2441, '2018-12-11', 42, 171.951, NULL, NULL),
(2442, '2018-12-11', 41, 7.876, NULL, NULL),
(2443, '2018-12-11', 40, 191.988, NULL, NULL),
(2444, '2018-12-11', 39, 257.5, NULL, NULL),
(2445, '2018-12-11', 38, 14, NULL, NULL),
(2446, '2018-12-11', 13, 95, NULL, NULL),
(2447, '2018-12-11', 12, 81, NULL, NULL),
(2448, '2018-12-11', 10, 944.836, NULL, NULL),
(2449, '2018-12-11', 8, 200.3, NULL, NULL),
(2450, '2018-12-11', 7, 1250.557, NULL, NULL),
(2451, '2018-12-11', 5, 1923.692, NULL, NULL),
(2452, '2018-12-11', 4, 78.899, NULL, NULL),
(2453, '2018-12-11', 3, 103.908, NULL, NULL),
(2454, '2018-12-11', 2, 129, NULL, NULL),
(2455, '2018-12-11', 1, 53, NULL, NULL),
(2456, '2018-12-13', 43, 85.449, NULL, NULL),
(2459, '2018-12-13', 42, 174.805, NULL, NULL),
(2460, '2018-12-13', 41, 8.047, NULL, NULL),
(2461, '2018-12-13', 40, 193.449, NULL, NULL),
(2462, '2018-12-13', 39, 257.5, NULL, NULL),
(2463, '2018-12-13', 38, 14, NULL, NULL),
(2464, '2018-12-13', 13, 96, NULL, NULL),
(2465, '2018-12-13', 12, 82, NULL, NULL),
(2466, '2018-12-13', 10, 952.324, NULL, NULL),
(2467, '2018-12-13', 8, 200.7, NULL, NULL),
(2468, '2018-12-13', 7, 1254.002, NULL, NULL),
(2469, '2018-12-13', 5, 1926.472, NULL, NULL),
(2470, '2018-12-13', 4, 78.899, NULL, NULL),
(2471, '2018-12-13', 3, 103.916, NULL, NULL),
(2472, '2018-12-13', 2, 130, NULL, NULL),
(2473, '2018-12-13', 1, 55, NULL, NULL),
(2474, '2018-12-14', 43, 85.897, NULL, NULL),
(2475, '2018-12-14', 42, 176.986, NULL, NULL),
(2476, '2018-12-14', 41, 8.139, NULL, NULL),
(2477, '2018-12-14', 40, 194.12, NULL, NULL),
(2478, '2018-12-14', 39, 257.5, NULL, NULL),
(2479, '2018-12-14', 38, 14, NULL, NULL),
(2480, '2018-12-14', 13, 98, NULL, NULL),
(2481, '2018-12-14', 12, 83, NULL, NULL),
(2482, '2018-12-14', 10, 955.872, NULL, NULL),
(2484, '2018-12-14', 8, 201.3, NULL, NULL),
(2487, '2018-12-14', 7, 1256.261, NULL, NULL),
(2488, '2018-12-14', 5, 1928.191, NULL, NULL),
(2489, '2018-12-14', 4, 78.899, NULL, NULL),
(2490, '2018-12-14', 3, 103.933, NULL, NULL),
(2491, '2018-12-14', 2, 131, NULL, NULL),
(2492, '2018-12-14', 1, 55, NULL, NULL),
(2493, '2018-12-17', 43, 87.524, NULL, NULL),
(2494, '2018-12-17', 42, 183.056, NULL, NULL),
(2495, '2018-12-17', 41, 8.392, NULL, NULL),
(2496, '2018-12-17', 40, 195.592, NULL, NULL),
(2497, '2018-12-17', 39, 257.5, NULL, NULL),
(2498, '2018-12-17', 38, 14, NULL, NULL),
(2499, '2018-12-17', 13, 99, NULL, NULL),
(2500, '2018-12-17', 12, 84, NULL, NULL),
(2501, '2018-12-17', 10, 964.875, NULL, NULL),
(2502, '2018-12-17', 8, 202.2, NULL, NULL),
(2503, '2018-12-17', 7, 1262.156, NULL, NULL),
(2504, '2018-12-17', 5, 1932.355, NULL, NULL),
(2505, '2018-12-17', 4, 78.954, NULL, NULL),
(2506, '2018-12-17', 3, 103.946, NULL, NULL),
(2507, '2018-12-17', 2, 133, NULL, NULL),
(2508, '2018-12-17', 1, 55, NULL, NULL),
(2509, '2018-12-18', 43, 87.524, NULL, NULL),
(2510, '2018-12-18', 42, 183.056, NULL, NULL),
(2511, '2018-12-18', 41, 8.549, NULL, NULL),
(2512, '2018-12-18', 40, 195.594, NULL, NULL),
(2513, '2018-12-18', 39, 257.5, NULL, NULL),
(2514, '2018-12-18', 38, 14, NULL, NULL),
(2515, '2018-12-18', 13, 101, NULL, NULL),
(2516, '2018-12-18', 12, 85, NULL, NULL),
(2517, '2018-12-18', 10, 968.227, NULL, NULL),
(2518, '2018-12-18', 8, 202.2, NULL, NULL),
(2519, '2018-12-18', 7, 1264.112, NULL, NULL),
(2520, '2018-12-18', 5, 1933.946, NULL, NULL),
(2521, '2018-12-18', 4, 78.968, NULL, NULL),
(2522, '2018-12-18', 3, 103.953, NULL, NULL),
(2523, '2018-12-18', 2, 134, NULL, NULL),
(2524, '2018-12-18', 1, 56, NULL, NULL),
(2525, '2018-12-19', 43, 88.353, NULL, NULL),
(2526, '2018-12-19', 42, 184.888, NULL, NULL),
(2528, '2018-12-19', 41, 8.826, NULL, NULL),
(2529, '2018-12-19', 40, 196.102, NULL, NULL),
(2530, '2018-12-19', 39, 257.5, NULL, NULL),
(2531, '2018-12-21', 38, 14, NULL, NULL),
(2532, '2018-12-19', 13, 101, NULL, NULL),
(2534, '2018-12-19', 12, 85, NULL, NULL),
(2535, '2018-12-19', 10, 972.739, NULL, NULL),
(2536, '2018-12-19', 8, 203.5, NULL, NULL),
(2537, '2018-12-19', 7, 1266.665, NULL, NULL),
(2539, '2018-12-19', 5, 1935.586, NULL, NULL),
(2540, '2018-12-19', 4, 79.035, NULL, NULL),
(2541, '2018-12-19', 3, 103.982, NULL, NULL),
(2542, '2018-12-19', 2, 135, NULL, NULL),
(2543, '2018-12-19', 1, 56, NULL, NULL),
(2544, '2018-12-20', 43, 88.355, NULL, NULL),
(2545, '2018-12-20', 42, 184.89, NULL, NULL);
INSERT INTO `wreading` (`wreading`, `date`, `wmeter`, `value`, `remark`, `is_consumed`) VALUES
(2546, '2018-12-20', 41, 8.828, NULL, NULL),
(2547, '2018-12-20', 40, 196.102, NULL, NULL),
(2548, '2018-12-20', 39, 257.5, NULL, NULL),
(2549, '2018-12-20', 38, 14, NULL, NULL),
(2550, '2018-12-20', 13, 101, NULL, NULL),
(2551, '2018-12-20', 12, 86, NULL, NULL),
(2554, '2018-12-20', 10, 972.759, NULL, NULL),
(2555, '2018-12-20', 8, 203.7, NULL, NULL),
(2556, '2018-12-20', 7, 1266.675, NULL, NULL),
(2558, '2018-12-20', 5, 1935.586, NULL, NULL),
(2559, '2018-12-20', 4, 79.035, NULL, NULL),
(2560, '2018-12-20', 3, 103.982, NULL, NULL),
(2561, '2018-12-20', 2, 135, NULL, NULL),
(2562, '2018-12-20', 1, 56, NULL, NULL),
(2563, '2018-12-21', 43, 89.615, NULL, NULL),
(2564, '2018-12-21', 42, 186.286, NULL, NULL),
(2565, '2018-12-21', 41, 8.857, NULL, NULL),
(2566, '2018-12-21', 40, 199.582, NULL, NULL),
(2567, '2018-12-21', 39, 257.5, NULL, NULL),
(2569, '2018-12-21', 13, 102, NULL, NULL),
(2570, '2018-12-21', 12, 87, NULL, NULL),
(2571, '2018-12-21', 10, 982.807, NULL, NULL),
(2572, '2018-12-21', 8, 204.6, NULL, NULL),
(2573, '2018-12-21', 7, 1269.612, NULL, NULL),
(2574, '2018-12-21', 5, 1938.851, NULL, NULL),
(2575, '2018-12-21', 4, 79.137, NULL, NULL),
(2576, '2018-12-21', 3, 104.008, NULL, NULL),
(2577, '2018-12-21', 2, 137, NULL, NULL),
(2578, '2018-12-21', 1, 57, NULL, NULL),
(2580, '2018-12-23', 43, 91.517, NULL, NULL),
(2581, '2018-12-23', 42, 191.258, NULL, NULL),
(2582, '2018-12-23', 41, 9.319, NULL, NULL),
(2583, '2018-12-23', 40, 199.584, NULL, NULL),
(2584, '2018-12-23', 39, 257.5, NULL, NULL),
(2585, '2018-12-23', 38, 14, NULL, NULL),
(2586, '2018-12-23', 13, 103, NULL, NULL),
(2587, '2018-12-23', 12, 88, NULL, NULL),
(2588, '2018-12-23', 10, 989.218, NULL, NULL),
(2589, '2018-12-23', 8, 205.2, NULL, NULL),
(2590, '2018-12-23', 7, 1275.231, NULL, NULL),
(2591, '2018-12-23', 5, 1941.906, NULL, NULL),
(2592, '2018-12-23', 4, 79.182, NULL, NULL),
(2593, '2018-12-23', 3, 104.011, NULL, NULL),
(2594, '2018-12-23', 2, 138, NULL, NULL),
(2595, '2018-12-23', 1, 57, NULL, NULL),
(2596, '2018-12-24', 43, 91.814, NULL, NULL),
(2597, '2018-12-24', 42, 192.522, NULL, NULL),
(2598, '2018-12-24', 41, 9.401, NULL, NULL),
(2599, '2018-12-24', 40, 199.672, NULL, NULL),
(2600, '2018-12-24', 39, 257.5, NULL, NULL),
(2601, '2018-12-24', 38, 14, NULL, NULL),
(2602, '2018-12-24', 12, 88, NULL, NULL),
(2603, '2018-12-24', 13, 103, NULL, NULL),
(2604, '2018-12-24', 10, 995.079, NULL, NULL),
(2605, '2018-12-24', 8, 205.7, NULL, NULL),
(2606, '2018-12-24', 7, 1276.156, NULL, NULL),
(2607, '2018-12-24', 5, 1943.062, NULL, NULL),
(2608, '2018-12-24', 4, 79.182, NULL, NULL),
(2609, '2018-12-24', 3, 104.011, NULL, NULL),
(2610, '2018-12-24', 2, 139, NULL, NULL),
(2611, '2018-12-24', 1, 57, NULL, NULL),
(2612, '2018-12-27', 43, 93.276, NULL, NULL),
(2613, '2018-12-27', 42, 195.767, NULL, NULL),
(2614, '2018-12-27', 41, 9.609, NULL, NULL),
(2615, '2018-12-27', 40, 199.977, NULL, NULL),
(2616, '2018-12-27', 39, 257.5, NULL, NULL),
(2617, '2018-12-27', 38, 14, NULL, NULL),
(2618, '2018-12-27', 13, 104, NULL, NULL),
(2619, '2018-12-27', 12, 89, NULL, NULL),
(2620, '2018-12-27', 10, 1009.338, NULL, NULL),
(2621, '2018-12-27', 8, 206.2, NULL, NULL),
(2622, '2018-12-27', 7, 1279.972, NULL, NULL),
(2623, '2018-12-27', 5, 1945.447, NULL, NULL),
(2624, '2018-12-27', 4, 79.2, NULL, NULL),
(2625, '2018-12-27', 3, 104.017, NULL, NULL),
(2626, '2018-12-27', 2, 140, NULL, NULL),
(2627, '2018-12-27', 1, 57, NULL, NULL),
(2628, '2018-12-30', 43, 95.134, NULL, NULL),
(2629, '2018-12-30', 42, 198.518, NULL, NULL),
(2630, '2018-12-30', 41, 9.921, NULL, NULL),
(2631, '2018-12-30', 40, 203.799, NULL, NULL),
(2632, '2018-12-30', 39, 257.5, NULL, NULL),
(2633, '2018-12-30', 38, 14, NULL, NULL),
(2634, '2018-12-30', 13, 105, NULL, NULL),
(2635, '2018-12-30', 12, 90, NULL, NULL),
(2636, '2018-12-30', 10, 1018.657, NULL, NULL),
(2637, '2018-12-30', 8, 207.6, NULL, NULL),
(2638, '2018-12-30', 7, 1284.37, NULL, NULL),
(2639, '2018-12-30', 5, 1950.394, NULL, NULL),
(2640, '2018-12-30', 4, 79.317, NULL, NULL),
(2641, '2018-12-30', 3, 104.032, NULL, NULL),
(2642, '2018-12-30', 2, 142, NULL, NULL),
(2643, '2018-12-30', 1, 58, NULL, NULL),
(2644, '2018-12-31', 43, 95.569, NULL, NULL),
(2645, '2018-12-31', 42, 199.242, NULL, NULL),
(2646, '2018-12-31', 41, 10.077, NULL, NULL),
(2647, '2018-12-31', 40, 203.799, NULL, NULL),
(2648, '2018-12-31', 39, 257.5, NULL, NULL),
(2649, '2018-12-31', 38, 14, NULL, NULL),
(2650, '2018-12-31', 13, 106, NULL, NULL),
(2651, '2018-12-31', 12, 91, NULL, NULL),
(2652, '2018-12-31', 10, 1019.331, NULL, NULL),
(2653, '2018-12-31', 8, 207.8, NULL, NULL),
(2654, '2018-12-31', 7, 1284.491, NULL, NULL),
(2655, '2018-12-31', 5, 1951.417, NULL, NULL),
(2656, '2018-12-31', 4, 79.319, NULL, NULL),
(2657, '2018-12-31', 3, 104.038, NULL, NULL),
(2658, '2018-12-31', 2, 143, NULL, NULL),
(2659, '2018-12-31', 1, 58, NULL, NULL),
(2660, '2019-01-02', 43, 96.622, NULL, NULL),
(2661, '2019-01-02', 42, 208.61, NULL, NULL),
(2662, '2019-01-02', 41, 10.18, NULL, NULL),
(2663, '2019-01-02', 40, 203.799, NULL, NULL),
(2664, '2019-01-02', 39, 257.5, NULL, NULL),
(2665, '2019-01-02', 38, 14, NULL, NULL),
(2666, '2019-01-02', 13, 107, NULL, NULL),
(2667, '2019-01-02', 12, 92, NULL, NULL),
(2668, '2019-01-02', 10, 1031.407, NULL, NULL),
(2669, '2019-01-02', 8, 208.4, NULL, NULL),
(2670, '2019-01-02', 7, 1284.491, NULL, NULL),
(2671, '2019-01-02', 5, 1953.201, NULL, NULL),
(2672, '2019-01-02', 4, 79.361, NULL, NULL),
(2673, '2019-01-02', 3, 104.044, NULL, NULL),
(2674, '2019-01-02', 2, 145, NULL, NULL),
(2675, '2019-01-02', 1, 58, NULL, NULL),
(2676, '2019-01-04', 43, 96.839, NULL, NULL),
(2677, '2019-01-04', 42, 209.799, NULL, NULL),
(2678, '2019-01-04', 41, 10.417, NULL, NULL),
(2679, '2019-01-04', 40, 209.785, NULL, NULL),
(2680, '2019-01-04', 39, 257.5, NULL, NULL),
(2681, '2019-01-04', 38, 14, NULL, NULL),
(2682, '2019-01-04', 13, 108, NULL, NULL),
(2683, '2019-01-04', 12, 93, NULL, NULL),
(2684, '2019-01-04', 10, 1036.97, NULL, NULL),
(2685, '2019-01-04', 8, 209.1, NULL, NULL),
(2686, '2019-01-04', 7, 1284.642, NULL, NULL),
(2687, '2019-01-04', 5, 1955.011, NULL, NULL),
(2688, '2019-01-04', 4, 79.879, NULL, NULL),
(2689, '2019-01-04', 3, 104.057, NULL, NULL),
(2690, '2019-01-04', 2, 146, NULL, NULL),
(2691, '2019-01-04', 1, 58, NULL, NULL),
(2692, '2019-01-06', 43, 98.422, NULL, NULL),
(2693, '2019-01-06', 42, 212.625, NULL, NULL),
(2694, '2019-01-06', 41, 10.76, NULL, NULL),
(2695, '2019-01-06', 40, 210.453, NULL, NULL),
(2696, '2019-01-06', 39, 257.5, NULL, NULL),
(2697, '2019-01-06', 38, 14, NULL, NULL),
(2698, '2019-01-06', 13, 109, NULL, NULL),
(2699, '2019-01-06', 12, 94, NULL, NULL),
(2700, '2019-01-06', 10, 1054.123, NULL, NULL),
(2701, '2019-01-06', 8, 210.2, NULL, NULL),
(2702, '2019-01-06', 7, 1293.01, NULL, NULL),
(2703, '2019-01-06', 5, 1960.032, NULL, NULL),
(2704, '2019-01-06', 4, 79.879, NULL, NULL),
(2705, '2019-01-06', 3, 104.087, NULL, NULL),
(2706, '2019-01-06', 2, 148, NULL, NULL),
(2707, '2019-01-06', 1, 61, NULL, NULL),
(2708, '2019-01-07', 43, 98.652, NULL, NULL),
(2709, '2019-01-07', 42, 213.091, NULL, NULL),
(2710, '2019-01-07', 41, 10.76, NULL, NULL),
(2711, '2019-01-07', 40, 210.453, NULL, NULL),
(2712, '2019-01-07', 39, 257.5, NULL, NULL),
(2713, '2019-01-07', 38, 14, NULL, NULL),
(2714, '2019-01-07', 13, 109, NULL, NULL),
(2715, '2019-01-07', 12, 95, NULL, NULL),
(2716, '2019-01-07', 10, 1059.209, NULL, NULL),
(2717, '2019-01-07', 8, 210.3, NULL, NULL),
(2718, '2019-01-07', 7, 1293.961, NULL, NULL),
(2719, '2019-01-07', 5, 1961.031, NULL, NULL),
(2720, '2019-01-07', 4, 79.879, NULL, NULL),
(2721, '2019-01-07', 3, 104.091, NULL, NULL),
(2722, '2019-01-07', 2, 149, NULL, NULL),
(2723, '2019-01-07', 1, 61, NULL, NULL),
(2724, '2019-01-08', 43, 99.221, NULL, NULL),
(2725, '2019-01-08', 42, 213.84, NULL, NULL),
(2726, '2019-01-08', 41, 10.978, NULL, NULL),
(2727, '2019-01-08', 40, 210.453, NULL, NULL),
(2728, '2019-01-08', 39, 257.5, NULL, NULL),
(2729, '2019-01-08', 38, 14, NULL, NULL),
(2730, '2019-01-08', 13, 109, NULL, NULL),
(2731, '2019-01-08', 12, 96, NULL, NULL),
(2732, '2019-01-08', 10, 1061.583, NULL, NULL),
(2733, '2019-01-08', 8, 211.2, NULL, NULL),
(2734, '2019-01-08', 7, 1295.991, NULL, NULL),
(2735, '2019-01-08', 5, 1962.714, NULL, NULL),
(2736, '2019-01-08', 4, 79.879, NULL, NULL),
(2737, '2019-01-08', 3, 104.106, NULL, NULL),
(2738, '2019-01-08', 2, 150, NULL, NULL),
(2739, '2019-01-08', 1, 61, NULL, NULL),
(2740, '2019-01-10', 43, 100, NULL, NULL),
(2741, '2019-01-10', 42, 214.581, NULL, NULL),
(2742, '2019-01-10', 41, 11.123, NULL, NULL),
(2743, '2019-01-10', 40, 210.83, NULL, NULL),
(2744, '2019-01-10', 39, 257.5, NULL, NULL),
(2745, '2019-01-10', 38, 14, NULL, NULL),
(2746, '2019-01-10', 13, 110, NULL, NULL),
(2747, '2019-01-10', 12, 97, NULL, NULL),
(2748, '2019-01-10', 10, 1076.111, NULL, NULL),
(2750, '2019-01-10', 8, 212, NULL, NULL),
(2751, '2019-01-10', 7, 1300.761, NULL, NULL),
(2752, '2019-01-10', 5, 1966.164, NULL, NULL),
(2753, '2019-01-10', 4, 79.879, NULL, NULL),
(2754, '2019-01-10', 3, 104.123, NULL, NULL),
(2755, '2019-01-10', 2, 151, NULL, NULL),
(2756, '2019-01-10', 1, 62, NULL, NULL),
(2757, '2019-01-11', 43, 100.201, NULL, NULL),
(2758, '2019-01-11', 42, 215.247, NULL, NULL),
(2759, '2019-01-11', 41, 11.229, NULL, NULL),
(2760, '2019-01-11', 40, 213.479, NULL, NULL),
(2761, '2019-01-11', 39, 257.5, NULL, NULL),
(2762, '2019-01-11', 38, 14, NULL, NULL),
(2763, '2019-01-11', 13, 111, NULL, NULL),
(2764, '2019-01-11', 12, 98, NULL, NULL),
(2765, '2019-01-11', 10, 1081.772, NULL, NULL),
(2766, '2019-01-11', 8, 212.5, NULL, NULL),
(2767, '2019-01-11', 7, 1300.761, NULL, NULL),
(2768, '2019-01-11', 5, 1968.162, NULL, NULL),
(2769, '2019-01-11', 4, 79.879, NULL, NULL),
(2770, '2019-01-11', 3, 104.131, NULL, NULL),
(2771, '2019-01-11', 2, 152, NULL, NULL),
(2772, '2019-01-11', 1, 63, NULL, NULL),
(2773, '2019-01-13', 43, 101.208, NULL, NULL),
(2774, '2019-01-13', 42, 217.22, NULL, NULL),
(2775, '2019-01-13', 41, 11.544, NULL, NULL),
(2776, '2019-01-13', 40, 219.62, NULL, NULL),
(2777, '2019-01-13', 39, 257.5, NULL, NULL),
(2778, '2019-01-13', 38, 14, NULL, NULL),
(2779, '2019-01-13', 13, 112, NULL, NULL),
(2780, '2019-01-13', 12, 99, NULL, NULL),
(2781, '2019-01-13', 10, 1094.48, NULL, NULL),
(2782, '2019-01-13', 8, 213.851, NULL, NULL),
(2783, '2019-01-13', 7, 1300.761, NULL, NULL),
(2784, '2019-01-13', 5, 1972.166, NULL, NULL),
(2785, '2019-01-13', 4, 79.879, NULL, NULL),
(2786, '2019-01-13', 3, 104.144, NULL, NULL),
(2787, '2019-01-13', 2, 153, NULL, NULL),
(2788, '2019-01-14', 43, 101.75, NULL, NULL),
(2789, '2019-01-14', 42, 218.066, NULL, NULL),
(2790, '2019-01-14', 41, 11.674, NULL, NULL),
(2791, '2019-01-14', 40, 221.106, NULL, NULL),
(2792, '2019-01-14', 39, 257.5, NULL, NULL),
(2793, '2019-01-14', 38, 14, NULL, NULL),
(2794, '2019-01-14', 13, 113, NULL, NULL),
(2795, '2019-01-14', 12, 99, NULL, NULL),
(2796, '2019-01-14', 10, 1100.65, NULL, NULL),
(2797, '2019-01-14', 8, 213.851, NULL, NULL),
(2798, '2019-01-14', 7, 1300.761, NULL, NULL),
(2799, '2019-01-14', 5, 1973.889, NULL, NULL),
(2800, '2019-01-14', 4, 79.879, NULL, NULL),
(2801, '2019-01-14', 3, 104.149, NULL, NULL),
(2802, '2019-01-14', 2, 154, NULL, NULL),
(2803, '2019-01-14', 1, 63, NULL, NULL),
(2804, '2019-01-15', 43, 101.75, NULL, NULL),
(2805, '2019-01-15', 42, 218.887, NULL, NULL),
(2806, '2019-01-15', 41, 11.711, NULL, NULL),
(2807, '2019-01-15', 40, 223.871, NULL, NULL),
(2808, '2019-01-15', 39, 263.293, NULL, NULL),
(2809, '2019-01-15', 38, 14, NULL, NULL),
(2810, '2019-01-15', 13, 113, NULL, NULL),
(2811, '2019-01-15', 12, 99, NULL, NULL),
(2812, '2019-01-15', 10, 1102.344, NULL, NULL),
(2813, '2019-01-15', 8, 214, NULL, NULL),
(2814, '2019-01-15', 7, 1301.404, NULL, NULL),
(2815, '2019-01-15', 5, 1975.466, NULL, NULL),
(2816, '2019-01-15', 4, 79.879, NULL, NULL),
(2817, '2019-01-15', 3, 104.161, NULL, NULL),
(2818, '2019-01-15', 2, 154, NULL, NULL),
(2819, '2019-01-15', 1, 64, NULL, NULL),
(2820, '2019-01-17', 43, 103, NULL, NULL),
(2821, '2019-01-17', 42, 219.949, NULL, NULL),
(2822, '2019-01-17', 41, 11.902, NULL, NULL),
(2823, '2019-01-17', 40, 223.872, NULL, NULL),
(2824, '2019-01-17', 39, 263.293, NULL, NULL),
(2825, '2019-01-17', 38, 14, NULL, NULL),
(2826, '2019-01-17', 13, 114, NULL, NULL),
(2827, '2019-01-17', 12, 99, NULL, NULL),
(2828, '2019-01-17', 10, 1111.099, NULL, NULL),
(2829, '2019-01-17', 8, 215.2, NULL, NULL),
(2830, '2019-01-17', 7, 1306.014, NULL, NULL),
(2831, '2019-01-17', 5, 1978.594, NULL, NULL),
(2832, '2019-01-17', 4, 79.879, NULL, NULL),
(2833, '2019-01-17', 3, 104.19, NULL, NULL),
(2834, '2019-01-17', 2, 154, NULL, NULL),
(2835, '2019-01-17', 1, 64, NULL, NULL),
(2836, '2019-01-20', 43, 104, NULL, NULL),
(2837, '2019-01-20', 42, 221.879, NULL, NULL),
(2838, '2019-01-20', 41, 12.26, NULL, NULL),
(2839, '2019-01-20', 40, 223.872, NULL, NULL),
(2840, '2019-01-20', 39, 263.293, NULL, NULL),
(2841, '2019-01-20', 38, 14, NULL, NULL),
(2842, '2019-01-20', 13, 115, NULL, NULL),
(2843, '2019-01-20', 12, 100, NULL, NULL),
(2844, '2019-01-20', 10, 1115.545, NULL, NULL),
(2845, '2019-01-20', 8, 216.6, NULL, NULL),
(2846, '2019-01-20', 7, 1313.469, NULL, NULL),
(2847, '2019-01-20', 5, 1983.251, NULL, NULL),
(2848, '2019-01-20', 4, 79.987, NULL, NULL),
(2849, '2019-01-20', 3, 104.22, NULL, NULL),
(2850, '2019-01-20', 1, 65, NULL, NULL),
(2851, '2019-01-23', 43, 106, NULL, NULL),
(2852, '2019-01-23', 42, 224.272, NULL, NULL),
(2853, '2019-01-23', 41, 12.514, NULL, NULL),
(2854, '2019-01-23', 40, 224.681, NULL, NULL),
(2855, '2019-01-23', 39, 263.293, NULL, NULL),
(2856, '2019-01-23', 38, 14, NULL, NULL),
(2858, '2019-01-23', 13, 117, NULL, NULL),
(2859, '2019-01-23', 12, 102, NULL, NULL),
(2860, '2019-01-23', 10, 1120.159, NULL, NULL),
(2861, '2019-01-23', 8, 217.5, NULL, NULL),
(2862, '2019-01-23', 7, 1320.517, NULL, NULL),
(2863, '2019-01-23', 5, 1987.508, NULL, NULL),
(2864, '2019-01-23', 4, 80.075, NULL, NULL),
(2865, '2019-01-23', 3, 104.245, NULL, NULL),
(2866, '2019-01-23', 2, 157, NULL, NULL),
(2867, '2019-01-23', 1, 67, NULL, NULL),
(2868, '2019-01-29', 43, 108, NULL, NULL),
(2869, '2019-01-29', 42, 227.785, NULL, NULL),
(2870, '2019-01-29', 41, 13.024, NULL, NULL),
(2871, '2019-01-29', 40, 224.684, NULL, NULL),
(2872, '2019-01-29', 39, 263.293, NULL, NULL),
(2873, '2019-01-29', 38, 14, NULL, NULL),
(2874, '2019-01-29', 13, 117, NULL, NULL),
(2875, '2019-01-29', 12, 103, NULL, NULL),
(2876, '2019-01-29', 10, 1126.108, NULL, NULL),
(2877, '2019-01-29', 8, 219.7, NULL, NULL),
(2878, '2019-01-29', 7, 1334.305, NULL, NULL),
(2879, '2019-01-29', 5, 1990.677, NULL, NULL),
(2880, '2019-01-29', 4, 80.234, NULL, NULL),
(2881, '2019-01-29', 3, 104.309, NULL, NULL),
(2882, '2019-01-29', 2, 159, NULL, NULL),
(2883, '2019-01-29', 1, 68, NULL, NULL),
(2884, '2019-01-30', 43, 109, NULL, NULL),
(2885, '2019-01-30', 42, 228.914, NULL, NULL),
(2886, '2019-01-30', 41, 13.229, NULL, NULL),
(2887, '2019-01-30', 40, 224.684, NULL, NULL),
(2891, '2019-01-30', 39, 263.293, NULL, NULL),
(2892, '2019-01-30', 38, 14, NULL, NULL),
(2893, '2019-01-30', 13, 118, NULL, NULL),
(2894, '2019-01-30', 12, 104, NULL, NULL),
(2895, '2019-01-30', 10, 1129.032, NULL, NULL),
(2896, '2019-01-30', 8, 221.1, NULL, NULL),
(2897, '2019-01-30', 7, 1335.178, NULL, NULL),
(2898, '2019-01-30', 5, 1997.909, NULL, NULL),
(2899, '2019-01-30', 4, 80.338, NULL, NULL),
(2900, '2019-01-30', 3, 104.334, NULL, NULL),
(2901, '2019-01-30', 2, 160, NULL, NULL),
(2902, '2019-01-30', 1, 68, NULL, NULL),
(2903, '2019-01-31', 43, 109, NULL, NULL),
(2904, '2019-01-31', 42, 229.499, NULL, NULL),
(2905, '2019-01-31', 41, 13.317, NULL, NULL),
(2906, '2019-01-31', 40, 225.277, NULL, NULL),
(2907, '2019-01-31', 39, 263.293, NULL, NULL),
(2908, '2019-01-31', 38, 14, NULL, NULL),
(2911, '2019-01-31', 13, 119, NULL, NULL),
(2912, '2019-01-31', 12, 105, NULL, NULL),
(2913, '2019-01-31', 10, 1130.292, NULL, NULL),
(2914, '2019-01-31', 8, 221.5, NULL, NULL),
(2915, '2019-01-31', 7, 1338.057, NULL, NULL),
(2917, '2019-01-31', 5, 2000.043, NULL, NULL),
(2919, '2019-01-31', 4, 80.382, NULL, NULL),
(2920, '2019-01-31', 3, 104.344, NULL, NULL),
(2921, '2019-01-31', 2, 161, NULL, NULL),
(2922, '2019-01-31', 1, 70, NULL, NULL),
(2924, '2019-02-01', 43, 110, NULL, NULL),
(2925, '2019-02-01', 42, 230.081, NULL, NULL),
(2926, '2019-02-01', 41, 13.491, NULL, NULL),
(2927, '2019-02-01', 40, 225.277, NULL, NULL),
(2928, '2019-02-01', 39, 263.293, NULL, NULL),
(2929, '2019-02-01', 38, 14, NULL, NULL),
(2930, '2019-02-01', 10, 1131.754, NULL, NULL),
(2931, '2019-02-01', 8, 222.1, NULL, NULL),
(2932, '2019-02-01', 7, 1340.964, NULL, NULL),
(2933, '2019-02-01', 5, 2001.734, NULL, NULL),
(2934, '2019-02-01', 4, 80.427, NULL, NULL),
(2935, '2019-02-01', 3, 104.356, NULL, NULL),
(2936, '2019-02-03', 43, 112, NULL, NULL),
(2937, '2019-02-03', 42, 232.502, NULL, NULL),
(2938, '2019-02-03', 41, 13.938, NULL, NULL),
(2939, '2019-02-03', 40, 227.906, NULL, NULL),
(2941, '2019-02-03', 39, 263.293, NULL, NULL),
(2942, '2019-02-03', 38, 14, NULL, NULL),
(2943, '2019-02-03', 10, 1133.917, NULL, NULL),
(2944, '2019-02-03', 8, 222.6, NULL, NULL),
(2945, '2019-02-03', 7, 1345.412, NULL, NULL),
(2946, '2019-02-03', 5, 2005.236, NULL, NULL),
(2947, '2019-02-03', 4, 80.486, NULL, NULL),
(2948, '2019-02-03', 3, 104.37, NULL, NULL),
(2949, '2019-02-04', 43, 112, NULL, NULL),
(2950, '2019-02-04', 42, 233.271, NULL, NULL),
(2951, '2019-02-04', 41, 14.024, NULL, NULL),
(2952, '2019-02-04', 40, 229.484, NULL, NULL),
(2953, '2019-02-04', 39, 263.293, NULL, NULL),
(2954, '2019-02-04', 38, 14, NULL, NULL),
(2956, '2019-02-04', 10, 1134.5, NULL, NULL),
(2958, '2019-02-04', 8, 223, NULL, NULL),
(2959, '2019-02-04', 7, 1345.511, NULL, NULL),
(2960, '2019-02-04', 5, 2006.576, NULL, NULL),
(2961, '2019-02-04', 4, 80.486, NULL, NULL),
(2962, '2019-02-04', 3, 104.375, NULL, NULL),
(2963, '2019-01-31', 44, 0, NULL, NULL),
(2964, '2019-02-04', 44, 0.963, NULL, NULL),
(2965, '2019-01-31', 46, 0, NULL, NULL),
(2966, '2019-01-31', 47, 0, NULL, NULL),
(2967, '2019-01-31', 48, 0, NULL, NULL),
(2968, '2019-02-01', 44, 0.891, NULL, NULL),
(2970, '2019-02-01', 46, 2.167, NULL, NULL),
(2971, '2019-02-01', 47, 0.87, NULL, NULL),
(2972, '2019-02-01', 48, 0.843, NULL, NULL),
(2976, '2019-02-04', 46, 2.512, NULL, NULL),
(2977, '2019-02-04', 47, 1.281, NULL, NULL),
(2978, '2019-02-04', 48, 1.108, NULL, NULL),
(2979, '2019-02-07', 48, 1.951, NULL, NULL),
(2980, '2019-02-07', 47, 2.273, NULL, NULL),
(2981, '2019-02-07', 46, 3.151, NULL, NULL),
(2982, '2019-02-07', 44, 1.819, NULL, NULL),
(2983, '2019-02-07', 42, 234.463, NULL, NULL),
(2984, '2019-02-07', 41, 14.301, NULL, NULL),
(2985, '2019-02-07', 40, 232.809, NULL, NULL),
(2986, '2019-02-07', 39, 278.254, NULL, NULL),
(2987, '2019-02-07', 38, 14, NULL, NULL),
(2988, '2019-02-07', 10, 1137.062, NULL, NULL),
(2989, '2019-02-07', 8, 224.4, NULL, NULL),
(2990, '2019-02-07', 7, 1345.511, NULL, NULL),
(2991, '2019-02-07', 5, 2009.808, NULL, NULL),
(2992, '2019-02-07', 4, 80.58, NULL, NULL),
(2993, '2019-02-07', 3, 104.404, NULL, NULL),
(2994, '2019-02-08', 48, 2.437, NULL, NULL),
(2995, '2019-02-08', 47, 3.137, NULL, NULL),
(2996, '2019-02-08', 46, 4.137, NULL, NULL),
(2997, '2019-02-08', 44, 2.511, NULL, NULL),
(2998, '2019-02-08', 42, 235.813, NULL, NULL),
(2999, '2019-02-08', 41, 14.519, NULL, NULL),
(3000, '2019-02-08', 40, 238.461, NULL, NULL),
(3001, '2019-02-08', 39, 292.909, NULL, NULL),
(3002, '2019-02-08', 38, 14, NULL, NULL),
(3003, '2019-02-08', 10, 1139.715, NULL, NULL),
(3005, '2019-02-08', 8, 225.7, NULL, NULL),
(3006, '2019-02-08', 7, 1345.511, NULL, NULL),
(3007, '2019-02-08', 5, 2013.191, NULL, NULL),
(3008, '2019-02-08', 4, 80.664, NULL, NULL),
(3009, '2019-02-08', 3, 104.43, NULL, NULL),
(3010, '2019-02-11', 48, 2.951, NULL, NULL),
(3011, '2019-02-11', 47, 3.555, NULL, NULL),
(3012, '2019-02-11', 46, 5.415, NULL, NULL),
(3013, '2019-02-11', 44, 3.208, NULL, NULL),
(3014, '2019-02-11', 42, 237.973, NULL, NULL),
(3015, '2019-02-11', 41, 14.917, NULL, NULL),
(3016, '2019-02-11', 40, 243.373, NULL, NULL),
(3017, '2019-02-11', 39, 292.909, NULL, NULL),
(3018, '2019-02-11', 38, 14, NULL, NULL),
(3019, '2019-02-11', 10, 1141.718, NULL, NULL),
(3020, '2019-02-11', 8, 226, NULL, NULL),
(3021, '2019-02-11', 7, 1345.511, NULL, NULL),
(3022, '2019-02-11', 5, 2016.155, NULL, NULL),
(3023, '2019-02-12', 4, 80.729, NULL, NULL),
(3024, '2019-02-11', 4, 80.729, NULL, NULL),
(3026, '2019-02-11', 3, 104.446, NULL, NULL),
(3027, '2019-02-12', 48, 3.448, NULL, NULL),
(3028, '2019-02-12', 47, 4.364, NULL, NULL),
(3029, '2019-02-12', 46, 6.458, NULL, NULL),
(3030, '2019-02-12', 44, 3.892, NULL, NULL),
(3031, '2019-02-12', 42, 239.188, NULL, NULL),
(3032, '2019-02-12', 41, 15.152, NULL, NULL),
(3033, '2019-02-12', 40, 247.416, NULL, NULL),
(3034, '2019-02-12', 39, 292.91, NULL, NULL),
(3035, '2019-02-12', 38, 14, NULL, NULL),
(3036, '2019-02-12', 10, 1143.355, NULL, NULL),
(3037, '2019-02-12', 8, 227.5, NULL, NULL),
(3038, '2019-02-12', 7, 1345.511, NULL, NULL),
(3039, '2019-02-12', 5, 2018.948, NULL, NULL),
(3042, '2019-02-12', 3, 104.446, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjustment`
--
ALTER TABLE `adjustment`
  ADD PRIMARY KEY (`adjustment`),
  ADD UNIQUE KEY `id` (`client`,`description`,`date`),
  ADD KEY `posted_item` (`posted_item`);

--
-- Indexes for table `agreement`
--
ALTER TABLE `agreement`
  ADD PRIMARY KEY (`agreement`),
  ADD UNIQUE KEY `identification` (`client`,`room`),
  ADD KEY `room` (`room`);

--
-- Indexes for table `balance_initial`
--
ALTER TABLE `balance_initial`
  ADD PRIMARY KEY (`balance_initial`),
  ADD UNIQUE KEY `identification` (`client`,`date`),
  ADD KEY `posted_item` (`posted_item`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`business`),
  ADD UNIQUE KEY `identification1` (`name`),
  ADD UNIQUE KEY `identification2` (`ceo`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client`),
  ADD UNIQUE KEY `identification1` (`name`),
  ADD UNIQUE KEY `identification2` (`uid`);

--
-- Indexes for table `eaccount`
--
ALTER TABLE `eaccount`
  ADD PRIMARY KEY (`eaccount`),
  ADD UNIQUE KEY `id` (`num`);

--
-- Indexes for table `ebill`
--
ALTER TABLE `ebill`
  ADD PRIMARY KEY (`ebill`),
  ADD UNIQUE KEY `identification` (`eaccount`,`due_date`),
  ADD KEY `msg` (`msg`);

--
-- Indexes for table `econnection`
--
ALTER TABLE `econnection`
  ADD PRIMARY KEY (`econnection`),
  ADD UNIQUE KEY `id` (`room`,`emeter`,`end_date`),
  ADD KEY `emeter` (`emeter`),
  ADD KEY `rate` (`rate`);

--
-- Indexes for table `elink`
--
ALTER TABLE `elink`
  ADD PRIMARY KEY (`elink`),
  ADD UNIQUE KEY `id` (`emeter`,`eaccount`),
  ADD KEY `eaccount` (`eaccount`);

--
-- Indexes for table `emeter`
--
ALTER TABLE `emeter`
  ADD PRIMARY KEY (`emeter`),
  ADD UNIQUE KEY `id` (`num`);

--
-- Indexes for table `ereading`
--
ALTER TABLE `ereading`
  ADD PRIMARY KEY (`ereading`),
  ADD UNIQUE KEY `identification` (`emeter`,`date`);

--
-- Indexes for table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`field`),
  ADD UNIQUE KEY `id` (`source`,`report`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice`),
  ADD UNIQUE KEY `id` (`client`,`period`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job`),
  ADD UNIQUE KEY `id` (`name`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`month`),
  ADD UNIQUE KEY `identification1` (`name`),
  ADD UNIQUE KEY `identification2` (`no`);

--
-- Indexes for table `msg`
--
ALTER TABLE `msg`
  ADD PRIMARY KEY (`msg`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`note`),
  ADD UNIQUE KEY `id` (`invoice`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment`),
  ADD UNIQUE KEY `id` (`ref`),
  ADD KEY `posted_item` (`posted_item`),
  ADD KEY `client` (`client`);

--
-- Indexes for table `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`period`),
  ADD UNIQUE KEY `identification` (`year`,`month`),
  ADD KEY `month` (`month`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`picture`),
  ADD UNIQUE KEY `identification` (`room`,`name`);

--
-- Indexes for table `posted_item`
--
ALTER TABLE `posted_item`
  ADD PRIMARY KEY (`posted_item`),
  ADD UNIQUE KEY `id` (`name`,`description`),
  ADD KEY `invoice` (`invoice`),
  ADD KEY `source` (`source`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`rate`),
  ADD UNIQUE KEY `id` (`value`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent`),
  ADD UNIQUE KEY `id` (`client`,`date`,`description`),
  ADD KEY `posted_item` (`posted_item`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room`),
  ADD UNIQUE KEY `identification` (`uid`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service`),
  ADD UNIQUE KEY `id` (`name`,`date`),
  ADD KEY `posted_item` (`posted_item`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`source`),
  ADD UNIQUE KEY `id` (`title`);

--
-- Indexes for table `wconnection`
--
ALTER TABLE `wconnection`
  ADD PRIMARY KEY (`wconnection`),
  ADD UNIQUE KEY `id` (`room`,`wmeter`,`end_date`),
  ADD KEY `wmeter` (`wmeter`),
  ADD KEY `rate` (`rate`);

--
-- Indexes for table `wmeter`
--
ALTER TABLE `wmeter`
  ADD PRIMARY KEY (`wmeter`),
  ADD UNIQUE KEY `id` (`num`),
  ADD UNIQUE KEY `id2` (`id`);

--
-- Indexes for table `wreading`
--
ALTER TABLE `wreading`
  ADD PRIMARY KEY (`wreading`),
  ADD UNIQUE KEY `identification` (`date`,`wmeter`),
  ADD KEY `wmeter` (`wmeter`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjustment`
--
ALTER TABLE `adjustment`
  MODIFY `adjustment` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `agreement`
--
ALTER TABLE `agreement`
  MODIFY `agreement` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `balance_initial`
--
ALTER TABLE `balance_initial`
  MODIFY `balance_initial` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `business` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `eaccount`
--
ALTER TABLE `eaccount`
  MODIFY `eaccount` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `ebill`
--
ALTER TABLE `ebill`
  MODIFY `ebill` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `econnection`
--
ALTER TABLE `econnection`
  MODIFY `econnection` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `elink`
--
ALTER TABLE `elink`
  MODIFY `elink` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `emeter`
--
ALTER TABLE `emeter`
  MODIFY `emeter` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `ereading`
--
ALTER TABLE `ereading`
  MODIFY `ereading` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field`
--
ALTER TABLE `field`
  MODIFY `field` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `month` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `msg`
--
ALTER TABLE `msg`
  MODIFY `msg` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=499;

--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
  MODIFY `note` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `period`
--
ALTER TABLE `period`
  MODIFY `period` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `picture` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posted_item`
--
ALTER TABLE `posted_item`
  MODIFY `posted_item` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rate`
--
ALTER TABLE `rate`
  MODIFY `rate` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `rent` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `source` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wconnection`
--
ALTER TABLE `wconnection`
  MODIFY `wconnection` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `wmeter`
--
ALTER TABLE `wmeter`
  MODIFY `wmeter` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `wreading`
--
ALTER TABLE `wreading`
  MODIFY `wreading` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3043;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjustment`
--
ALTER TABLE `adjustment`
  ADD CONSTRAINT `adjustment_ibfk_1` FOREIGN KEY (`posted_item`) REFERENCES `posted_item` (`posted_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adjustment_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `agreement`
--
ALTER TABLE `agreement`
  ADD CONSTRAINT `agreement_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`room`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agreement_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `balance_initial`
--
ALTER TABLE `balance_initial`
  ADD CONSTRAINT `balance_initial_2_posted_item` FOREIGN KEY (`posted_item`) REFERENCES `posted_item` (`posted_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `balance_initila_2_client` FOREIGN KEY (`client`) REFERENCES `client` (`client`);

--
-- Constraints for table `ebill`
--
ALTER TABLE `ebill`
  ADD CONSTRAINT `ebill_ibfk_1` FOREIGN KEY (`msg`) REFERENCES `msg` (`msg`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ebill_ibfk_2` FOREIGN KEY (`eaccount`) REFERENCES `eaccount` (`eaccount`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `econnection`
--
ALTER TABLE `econnection`
  ADD CONSTRAINT `econnection_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`room`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `econnection_ibfk_2` FOREIGN KEY (`emeter`) REFERENCES `emeter` (`emeter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `econnection_ibfk_3` FOREIGN KEY (`rate`) REFERENCES `rate` (`rate`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `elink`
--
ALTER TABLE `elink`
  ADD CONSTRAINT `elink_ibfk_1` FOREIGN KEY (`emeter`) REFERENCES `emeter` (`emeter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `elink_ibfk_2` FOREIGN KEY (`eaccount`) REFERENCES `eaccount` (`eaccount`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ereading`
--
ALTER TABLE `ereading`
  ADD CONSTRAINT `ereading_ibfk_1` FOREIGN KEY (`emeter`) REFERENCES `emeter` (`emeter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `field`
--
ALTER TABLE `field`
  ADD CONSTRAINT `field_ibfk_1` FOREIGN KEY (`source`) REFERENCES `source` (`source`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`posted_item`) REFERENCES `posted_item` (`posted_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `period`
--
ALTER TABLE `period`
  ADD CONSTRAINT `period_ibfk_1` FOREIGN KEY (`month`) REFERENCES `month` (`month`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`room`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posted_item`
--
ALTER TABLE `posted_item`
  ADD CONSTRAINT `posted_item_ibfk_1` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posted_item_ibfk_2` FOREIGN KEY (`source`) REFERENCES `source` (`source`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`posted_item`) REFERENCES `posted_item` (`posted_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`posted_item`) REFERENCES `posted_item` (`posted_item`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wconnection`
--
ALTER TABLE `wconnection`
  ADD CONSTRAINT `wconnection_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`room`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wconnection_ibfk_2` FOREIGN KEY (`wmeter`) REFERENCES `wmeter` (`wmeter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wconnection_ibfk_3` FOREIGN KEY (`rate`) REFERENCES `rate` (`rate`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wreading`
--
ALTER TABLE `wreading`
  ADD CONSTRAINT `wreading_ibfk_1` FOREIGN KEY (`wmeter`) REFERENCES `wmeter` (`wmeter`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
