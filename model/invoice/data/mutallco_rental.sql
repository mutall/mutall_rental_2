-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2019 at 04:13 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mutallco_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `agreement`
--

CREATE TABLE IF NOT EXISTS `agreement` (
  `agreement` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `start_date` date NOT NULL,
  `duration` int(5) DEFAULT NULL,
  `review` int(5) DEFAULT NULL,
  `terminated` date DEFAULT NULL,
  `valid` int(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agreement`
--

INSERT INTO `agreement` (`agreement`, `room`, `client`, `amount`, `start_date`, `duration`, `review`, `terminated`, `valid`, `comment`) VALUES
(1, 24, 1, 9500, '2014-04-01', 5, 3, NULL, 1, NULL),
(2, 5, 2, 5000, '2017-10-01', 5, 3, NULL, 1, NULL),
(3, 6, 2, 47880, '2012-04-01', 5, 3, NULL, 1, NULL),
(4, 31, 2, 0, '2013-10-01', 5, 3, NULL, 1, NULL),
(5, 32, 2, 0, '2013-10-01', 5, 3, NULL, 1, NULL),
(6, 33, 2, 5000, '2013-10-01', 5, 3, NULL, 1, NULL),
(7, 34, 2, 5000, '2013-10-01', 5, 3, NULL, 1, NULL),
(8, 36, 2, 5000, '2013-10-01', 5, 3, NULL, 1, NULL),
(9, 37, 2, 5000, '2013-10-01', 5, 3, NULL, 1, NULL),
(10, 39, 9, 11250, '2010-12-01', 5, 3, NULL, 1, NULL),
(11, 4, 3, 140000, '2015-01-01', 5, 3, NULL, 1, NULL),
(12, 2, 3, 0, '2015-01-01', 5, 3, NULL, 1, NULL),
(13, 23, 4, 12000, '2015-04-01', 5, 3, NULL, 1, NULL),
(14, 25, 6, 20000, '2015-04-01', 5, 3, NULL, 1, NULL),
(15, 3, 10, NULL, '2010-12-01', 5, 3, NULL, 0, NULL),
(16, 22, 11, 22000, '2015-06-01', 5, 3, '2018-11-01', 1, NULL),
(17, 28, 17, 20000, '2013-06-01', 5, 3, NULL, 1, NULL),
(18, 27, 14, 20000, '2014-05-01', 5, 3, NULL, 1, NULL),
(19, 21, 15, 20000, '2015-02-01', 5, 3, NULL, 1, NULL),
(20, 10, 18, 45000, '2013-04-01', 5, 3, NULL, 1, NULL),
(21, 20, 26, 20000, '2018-06-01', 5, 3, NULL, 1, NULL),
(22, 40, 19, 145800, '2017-12-01', 5, 3, NULL, 1, NULL),
(23, 9, 25, 20000, '2018-02-01', 5, 3, NULL, 1, NULL),
(24, 19, 7, 18000, '2017-07-01', 5, 3, NULL, 1, NULL),
(25, 8, 28, 20000, '2018-03-01', 5, 3, NULL, 1, NULL),
(26, 1, 27, 20000, '2018-09-01', 5, 3, NULL, 1, NULL),
(27, 16, 22, 20000, '2017-06-01', 5, 3, NULL, 1, NULL),
(28, 17, 20, 20000, '2017-01-01', 5, 3, NULL, 1, NULL),
(29, 14, 23, 16000, '2017-07-01', 5, 3, NULL, 1, NULL),
(30, 12, 21, 15000, '2017-02-01', 5, 3, NULL, 1, NULL),
(31, 11, 24, 14000, '2016-08-01', 5, 3, '2018-11-01', 1, NULL),
(32, 22, 29, 20000, '2018-12-01', 5, 3, NULL, 1, NULL),
(33, 7, 30, 20000, '2018-08-01', 5, 3, NULL, 1, NULL),
(34, 47, 3, 15000, '2017-01-01', 5, 3, NULL, 1, NULL),
(35, 48, 3, 0, '2018-01-01', 5, 3, NULL, 1, NULL),
(36, 49, 9, NULL, '2018-01-01', 5, 3, NULL, 1, NULL),
(37, 46, 2, NULL, '2013-10-01', 5, 3, NULL, 1, NULL),
(38, 44, 3, NULL, '2015-01-01', 5, 3, NULL, 1, NULL),
(39, 51, 2, 0, '2013-10-01', 5, 3, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `balance_initial`
--

CREATE TABLE IF NOT EXISTS `balance_initial` (
  `balance_initial` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `invoice` int(11) DEFAULT NULL,
  `date_g` date DEFAULT NULL,
  `amount_g` double DEFAULT NULL,
  `amount_v` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_v` date DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance_initial`
--

INSERT INTO `balance_initial` (`balance_initial`, `client`, `invoice`, `date_g`, `amount_g`, `amount_v`, `amount`, `date_v`, `comment`, `date`) VALUES
(1, 2, NULL, '2018-07-01', 42582, 32872, 32872, '2019-01-01', NULL, '2019-02-01'),
(2, 18, NULL, '2018-07-01', 3200, 12984, 12984, '2019-01-01', NULL, '2019-02-01'),
(3, 14, NULL, '2018-07-01', 65250, 116100, 116100, '2019-01-01', NULL, '2019-02-01'),
(4, 11, NULL, '2018-07-01', 350100, NULL, NULL, NULL, NULL, '2019-02-01'),
(5, 3, NULL, '2019-01-13', 498750, 201000, 201000, '2019-01-01', NULL, '2019-02-01'),
(6, 6, NULL, '2019-01-13', 130500, 158400, 223650, '2019-01-01', NULL, '2019-02-01'),
(7, 27, NULL, '2019-01-13', 67800, 27000, 0, '2019-01-01', NULL, '2019-02-01'),
(8, 1, NULL, '2019-01-13', 28500, 35950, 7450, '2019-01-01', NULL, '2019-02-01'),
(9, 15, NULL, '2019-01-13', 21750, 95820, 74070, '2019-01-01', NULL, '2019-02-01'),
(10, 20, NULL, '2019-01-13', 259550, 244600, 156350, '2019-01-01', NULL, '2019-02-01'),
(11, 21, NULL, '2019-01-13', 58300, 57550, 57550, '2019-01-01', NULL, '2019-02-01'),
(12, 23, NULL, '2019-01-13', 105500, 179450, 179450, '2019-01-01', NULL, '2019-02-01'),
(13, 7, NULL, '2019-01-13', 98500, 98250, 98000, '2019-01-01', NULL, '2019-02-01'),
(14, 28, NULL, '2019-01-13', 155950, 52250, 62800, '2019-01-01', NULL, '2019-02-01'),
(15, 9, NULL, '2019-01-13', 81780, 73744, 87442, '2019-01-01', NULL, '2019-02-01'),
(16, 17, NULL, NULL, NULL, 16500, 16500, '2019-01-01', NULL, '2019-02-01'),
(17, 4, NULL, NULL, NULL, -7500, 33750, '2019-01-01', NULL, '2019-02-01'),
(18, 22, NULL, NULL, NULL, 7600, 7600, '2019-01-01', NULL, '2019-02-01'),
(19, 19, NULL, NULL, NULL, 223620, 218700, '2019-01-01', NULL, '2019-02-01'),
(20, 25, NULL, NULL, NULL, 5750, 0, '2019-01-01', NULL, '2019-02-01'),
(21, 26, NULL, NULL, NULL, 0, 0, '2019-01-01', NULL, '2019-02-01'),
(22, 30, NULL, NULL, NULL, 117000, 117000, '2019-01-01', NULL, '2019-02-01'),
(23, 29, NULL, NULL, NULL, 200, 800, '2019-01-01', NULL, '2019-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE IF NOT EXISTS `business` (
  `business` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ceo` varchar(255) DEFAULT NULL,
  `consumption` double DEFAULT NULL,
  `market_rent_price` double DEFAULT NULL,
  `water_cost` double DEFAULT NULL,
  `is_current` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`business`, `name`, `ceo`, `consumption`, `market_rent_price`, `water_cost`, `is_current`) VALUES
(1, 'MUTALL INVESTIMENT CO. LTD', 'PETER MURAYA', 1, 50, 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `charge`
--

CREATE TABLE IF NOT EXISTS `charge` (
  `charge` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `client` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `quarterly` int(1) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client`, `name`, `title`, `quarterly`, `contact`, `phone`, `address`, `email`) VALUES
(1, 'afb', '4th generation Capital Kenya Limited', 1, 'ASHLEY', '0712384729', '4916-00100,Kiserian', NULL),
(2, 'chicjoint', 'Chic Joint bar', 1, 'KEN KIMANI', '0722722678', '57513-00200,Nairobi', NULL),
(3, 'deekos', 'Deekos', 1, 'MUREITHI WAMBUGU', '0721728360', NULL, NULL),
(4, 'geocad', 'Geocad investment Copany Liited', 1, 'HUBERT', '0722 215731', '696-00206, Kiserian', NULL),
(5, 'ipa', 'IPA Laboratories Limited(Kulisha Vyema)', 1, 'PETER KAMAU', NULL, '49582-00100,Nairobi', NULL),
(6, 'kaakua', 'Riees Kaakua', 1, 'PETER KAAKUA', '0722879127', NULL, NULL),
(7, 'kca', 'Kiseria College of Accountancy', 0, 'YUSUF', NULL, NULL, NULL),
(8, 'kashanga', 'Kashanga properties', 1, 'TITUS SAITOTI', '0721914565', NULL, NULL),
(9, 'kinyozi', 'A Proudly Kenyan Investment', 0, 'LILIAN MUNGAI', '0722350361', '108-00206,Kiserian', NULL),
(10, 'lovinah', 'Lovinah beauty shop', 1, NULL, NULL, NULL, NULL),
(11, 'masabi', 'Masabi Ranch', 0, 'DENNIS', NULL, NULL, NULL),
(12, 'misatis', 'Misatis Restaurant', 1, NULL, NULL, NULL, NULL),
(13, 'mwamba', 'Mwamba properties', 1, 'NOAH', '0724907442', NULL, NULL),
(14, 'oigilai', 'Oigilai properies', 1, 'ISAAC LEBOI', '0720888511', NULL, NULL),
(15, 'sidai', 'Sidai(J.Ondari &Advocates)', 0, 'ELIZABETH', '0720420073', NULL, NULL),
(16, 'fairdeal', 'Fair deal/Oreteti properties', 0, 'RICHARD KIRISIA', '0712390301', NULL, NULL),
(17, 'naikuni', 'Naikuni(Reto Works Ltd)', 1, 'DANIEL SINKIRA', '0722616983', '345-00206, Kiserian', NULL),
(18, 'ukristo', 'Ukristo and Ufanisi Sacco ltd', 1, 'BORNIFACE', '0722758079', '872-00605,Nairobi', NULL),
(19, 'coop', 'Co-operative Bank - Kiserian', 1, NULL, NULL, NULL, NULL),
(20, 'simaloy', 'Simaloy company Advocates', 0, NULL, NULL, NULL, NULL),
(21, 'kecobat', 'Kecobat', 1, NULL, NULL, NULL, NULL),
(22, 'plotec', 'Plotec Limited', 1, NULL, NULL, NULL, NULL),
(23, 'vane ', 'Vane Kwamboka & Co Advocate', 1, NULL, NULL, NULL, NULL),
(24, 'puan', 'Puuan Emaa Housing', 0, NULL, NULL, NULL, NULL),
(25, 'green', 'Green Pharm Investment', 1, NULL, NULL, NULL, NULL),
(26, 'archhub', 'Archhub Constructions', 1, NULL, NULL, NULL, NULL),
(27, 'orusa', 'Orusa Tours and Travel Ltd', 1, NULL, NULL, NULL, NULL),
(28, 'maa', 'Maa Steaks', 1, NULL, NULL, NULL, NULL),
(29, 'girlchild', 'Girl Child Network', 1, 'John, Finance manager', '0727138767', NULL, NULL),
(30, 'kerea', 'Chairman, Oloolaiser Water', 1, 'Kerea, Chairman Oloolaiser', '0722659586', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `closing_balance`
--

CREATE TABLE IF NOT EXISTS `closing_balance` (
  `closing_balance` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `posted` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--

CREATE TABLE IF NOT EXISTS `credit` (
  `credit` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `invoice` int(11) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `debit`
--

CREATE TABLE IF NOT EXISTS `debit` (
  `debit` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `invoice` int(11) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eaccount`
--

CREATE TABLE IF NOT EXISTS `eaccount` (
  `eaccount` int(11) NOT NULL,
  `num` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_invalid` int(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `ebill` (
  `ebill` int(11) NOT NULL,
  `msg` int(11) DEFAULT NULL,
  `eaccount` int(11) NOT NULL,
  `invoice` int(11) DEFAULT NULL,
  `due_date` date NOT NULL,
  `current_amount` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ebill`
--

INSERT INTO `ebill` (`ebill`, `msg`, `eaccount`, `invoice`, `due_date`, `current_amount`) VALUES
(1, 19, 31, NULL, '2019-01-18', 40),
(2, 21, 1, NULL, '2019-01-18', 6851),
(3, 23, 14, NULL, '2019-01-19', 17364),
(4, 25, 16, NULL, '2019-01-18', 3543),
(5, 29, 9, NULL, '2019-01-17', 2281),
(6, 31, 12, NULL, '2019-01-17', 426),
(7, 33, 8, NULL, '2019-01-17', -6065),
(8, 35, 10, NULL, '2019-01-17', 551),
(9, 37, 21, NULL, '2019-01-17', 590),
(10, 38, 20, NULL, '2019-01-17', 847),
(11, 1, 19, NULL, '2019-01-17', 832),
(12, 3, 7, NULL, '2019-01-18', 12315),
(13, 5, 23, NULL, '2019-01-18', 1466),
(14, 6, 29, NULL, '2019-01-17', 2250),
(15, 8, 26, NULL, '2019-01-17', 692),
(16, 9, 30, NULL, '2019-01-17', 4438),
(17, 11, 27, NULL, '2019-01-17', 1886),
(18, 13, 13, NULL, '2019-01-18', 64191),
(19, NULL, 3, NULL, '2019-01-24', 0.52),
(20, NULL, 28, NULL, '2019-01-24', 13131.07),
(21, NULL, 6, NULL, '2019-01-24', 569.75),
(22, NULL, 17, NULL, '2019-01-24', 390.11);

-- --------------------------------------------------------

--
-- Table structure for table `econnection`
--

CREATE TABLE IF NOT EXISTS `econnection` (
  `econnection` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `emeter` int(11) NOT NULL,
  `rate` int(10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date NOT NULL,
  `start_reading` int(10) DEFAULT NULL,
  `shared` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `econnection`
--

INSERT INTO `econnection` (`econnection`, `room`, `emeter`, `rate`, `start_date`, `end_date`, `start_reading`, `shared`) VALUES
(1, 40, 32, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(2, 3, 18, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(3, 4, 13, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(4, 6, 3, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(5, 31, 3, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(6, 32, 3, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(7, 33, 3, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(8, 34, 3, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(9, 35, 3, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(10, 36, 3, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(11, 39, 1, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(12, 41, 9, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(13, 8, 28, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(14, 10, 10, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(15, 12, 21, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(16, 11, 21, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(17, 13, 12, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(18, 14, 17, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(19, 15, 27, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(20, 16, 27, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(21, 17, 27, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(22, 18, 27, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(23, 7, 30, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(24, 19, 6, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(25, 20, 6, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(26, 21, 7, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(27, 22, 7, NULL, '2018-06-25', '2030-12-31', NULL, 0),
(28, 24, 7, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(29, 26, 7, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(30, 23, 7, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(31, 27, 20, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(32, 28, 8, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(33, 29, 19, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(34, 30, 19, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(35, 42, 31, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(36, 37, 3, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(37, 2, 13, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(38, 1, 20, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(39, 9, 16, NULL, '2018-06-25', '2030-12-31', NULL, 1),
(40, 25, 20, NULL, '2018-06-25', '2030-12-31', NULL, 0),
(41, 38, 1, NULL, '2018-06-25', '2030-12-31', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `electricity`
--

CREATE TABLE IF NOT EXISTS `electricity` (
  `electricity` int(11) NOT NULL,
  `eaccount` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `eaccount_no` varchar(30) DEFAULT NULL,
  `emeter_no` varchar(30) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payable_to_kplc` double DEFAULT NULL,
  `sharing` int(5) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `elink`
--

CREATE TABLE IF NOT EXISTS `elink` (
  `elink` int(11) NOT NULL,
  `emeter` int(11) NOT NULL,
  `eaccount` int(11) NOT NULL,
  `origin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elink`
--

INSERT INTO `elink` (`elink`, `emeter`, `eaccount`, `origin`) VALUES
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

CREATE TABLE IF NOT EXISTS `emeter` (
  `emeter` int(11) NOT NULL,
  `num` varchar(50) NOT NULL,
  `uid` int(5) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_invalid` int(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `ereading` (
  `ereading` int(11) NOT NULL,
  `emeter` int(11) NOT NULL,
  `invoice` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `value` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `period` int(11) NOT NULL,
  `is_valid` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=968 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `job` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dbname` varchar(255) DEFAULT NULL,
  `sql` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mobile`
--

CREATE TABLE IF NOT EXISTS `mobile` (
  `mobile` int(11) NOT NULL,
  `client` int(11) DEFAULT NULL,
  `num` varchar(30) NOT NULL,
  `contact` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobile`
--

INSERT INTO `mobile` (`mobile`, `client`, `num`, `contact`) VALUES
(1, 1, '0712384729', 'ASHLEY'),
(2, 2, '0722722678', 'KEN KIMANI'),
(3, 3, '0721728360', 'MUREITHI WAMBUGU'),
(4, 4, '0722 215731', 'HUBERT'),
(5, 6, '0722879127', 'PETER KAAKUA'),
(6, 8, '0721914565', 'TITUS SAITOTI'),
(7, 9, '0722350361', 'LILIAN MUNGAI'),
(8, 13, '0724907442', 'NOAH'),
(9, 14, '0720888511', 'ISAAC LEBOI'),
(10, 15, '0720420073', 'ELIZABETH'),
(11, 16, '0712390301', 'RICHARD KIRISIA'),
(12, 17, '0722616983', 'DANIEL SINKIRA'),
(13, 18, '0722758079', 'BORNIFACE'),
(14, 29, '0727138767', 'John, Finance manager'),
(15, 30, '0722659586', 'Kerea, Chairman Oloolaiser');

-- --------------------------------------------------------

--
-- Table structure for table `msg`
--

CREATE TABLE IF NOT EXISTS `msg` (
  `msg` int(11) NOT NULL,
  `id` varchar(32) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msg`
--

INSERT INTO `msg` (`msg`, `id`, `body`, `date`) VALUES
(1, '92ede73aa01957215a56938832878a4e', NULL, NULL),
(2, '649f58b77cd6156498146ff5b091aec6', NULL, NULL),
(3, '2164edcaaa8d56e9f34486397a7c56ae', NULL, NULL),
(4, '4ef9a756327eddf98bae6a063a2d65d7', NULL, NULL),
(5, '198af533e68c34969610c87591b7f628', NULL, NULL),
(6, '0dd91a479cd6209e01ef6c2c8205661c', NULL, NULL),
(7, '739a6e2156c199718715cce27fb5a774', NULL, NULL),
(8, '5899e3c2263f13d840b6b504f2d0abb1', NULL, NULL),
(9, '232796192023e534b4cf8d7d2715d8a1', NULL, NULL),
(10, '0a2aa1e07027395a1c651bbf2ae68ed1', NULL, NULL),
(11, '4666a283857fdf3e18ed15794b29d5cb', NULL, NULL),
(12, '3aa5abc07c5cc4650808a90a3c0c2886', NULL, NULL),
(13, 'd4cc05ed094264d5444d996d9945b4f1', NULL, NULL),
(14, '4d698a54d3a6ee1441c41ebfec27b1e0', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030643. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1633 Prev Read: 1625,Billed Units: 8', '2019-02-01'),
(15, '0ceca25dbac6419c453bb32829eea569', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:34030627. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1425 Prev Read: 1399,Billed Units: 2', '2019-02-01'),
(16, '8796c0f820212e5833ef6ec038c1011a', 'Dear PETER KARIUKI MURAYA, ACCOUNT NO:44573400. Curr bill dated 17-01-2019 is as follows:  Active Meter - Curr Read: 1277 (Est) Prev Read: 1277, Estimate', '2019-02-01'),
(17, 'd3cca5444c15648a80ef81986ac44097', 'Dear customer our disconnection moratorium expires on 23/11/2018 Please visit our Commercial Offices near you to present any billing concerns for resolution.', '2019-02-01'),
(18, 'dd168eab36af74221077c7028d855403', NULL, NULL),
(19, '4dc64ea30cf6e9012302ed8caec4f937', NULL, NULL),
(20, '0c49087a04da4be5a8c802e04dc36431', NULL, NULL),
(21, '11d13a2408844bc2755769484ff5ad80', NULL, NULL),
(22, '71285f645c666864dd63a6324222f3b1', NULL, NULL),
(23, 'db07c51aed1367a9ab99a181624806b3', NULL, NULL),
(24, '16a2422c73b5bb0648264d4d645f33bf', NULL, NULL),
(25, 'b8acb49ed7397009ecde47c21132f632', NULL, NULL),
(26, 'c3f2133225773a9a9bce0f6629436ffa', NULL, NULL),
(27, '8237d39a50abdf61c32c1fa4c78c27d2', NULL, NULL),
(28, 'c40fee02e992178cbf3e6bc8a2621adf', NULL, NULL),
(29, '5591c0b58ae9e7e15a812c89a115f108', NULL, NULL),
(30, '1f7b922714935077b304633feeeb3f36', NULL, NULL),
(31, 'ce7ab0df8bb9ec0ac360fa5582d95313', NULL, NULL),
(32, '33eca2cf34bb10647a12499c327633b7', NULL, NULL),
(33, '5ebc3a32ccfa282fe1ca15933b7fa256', NULL, NULL),
(34, '39bf37f991bd2597abcfd3140da6d015', NULL, NULL),
(35, 'cbb26b0e40ea537dd3ee10651213108c', NULL, NULL),
(36, '964bad6664185ba4dfe90826cf26836f', NULL, NULL),
(37, 'f743fc65b584cce7008b7ec4cd3fb38f', NULL, NULL),
(38, 'bd3d6887e9601d20d4658983b64cbd6d', NULL, NULL),
(39, '0e4ef8b5510092cb8d989decf2fb23d4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `note` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `info` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payment` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `invoice` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `period`
--

CREATE TABLE IF NOT EXISTS `period` (
  `period` int(11) NOT NULL,
  `year` int(5) NOT NULL,
  `month` int(5) NOT NULL,
  `cutoff` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE IF NOT EXISTS `picture` (
  `picture` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `elevation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE IF NOT EXISTS `rent` (
  `rent` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `agreement` int(11) NOT NULL,
  `room_no` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `agreement_end_date` date DEFAULT NULL,
  `factor` int(5) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=919 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `room` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `is_psuedo` int(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `wing` varchar(255) DEFAULT NULL,
  `width_ft` int(5) DEFAULT NULL,
  `width_inch` int(5) DEFAULT NULL,
  `breadth_ft` int(5) DEFAULT NULL,
  `breadth_inch` int(5) DEFAULT NULL,
  `area_sq_m` double DEFAULT NULL,
  `area_sq_ft` int(5) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room`, `uid`, `is_psuedo`, `title`, `floor`, `wing`, `width_ft`, `width_inch`, `breadth_ft`, `breadth_inch`, `area_sq_m`, `area_sq_ft`) VALUES
(1, '29', 0, 'Orusa Tours', '2', 'NW', 12, 6, 37, 0, NULL, NULL),
(2, '43', 0, 'Deekos Cafeteria', '0', 'NE', 8, 0, 86, 0, NULL, NULL),
(3, '3', 0, 'Lovinah', '0', 'SE', 8, 4, 19, 4, NULL, NULL),
(4, '5', 0, 'Deekos Bakery', '0', 'N', 37, 0, 85, 0, NULL, NULL),
(5, '6', 0, 'Chic Joint lounge/meeting room', '0', 'NW', 21, 0, 10, 0, NULL, NULL),
(6, '7', 0, 'Chic Joint-main bar', '0', 'SW', 37, 0, 34, 4, NULL, NULL),
(7, '9', 0, 'Meeting room', '1', 'NE', 12, 0, 40, 0, NULL, NULL),
(8, '10', 0, 'Maa steaks', '1', 'NE', 12, 6, 39, 0, NULL, NULL),
(9, '11', 0, 'Green firm investment', '1', 'NE', 14, 0, 38, 6, NULL, NULL),
(10, '12', 0, 'Ukristo na Ufanisi', '1', 'NW', 22, 7, 48, 8, NULL, NULL),
(11, '13', 0, 'Puan Emaa Housing', '1', 'NW', 9, 8, 18, 4, NULL, NULL),
(12, '14', 0, 'Kecobat', '1', 'NW', 13, 3, 12, 9, NULL, NULL),
(13, '15', 0, 'Fair deal Surveyors', '1', 'NW', 13, 3, 25, 0, NULL, NULL),
(14, '16', 0, 'Vane Kwamboka and Co. Advocates', '1', 'NW', 12, 0, 27, 5, NULL, NULL),
(15, '17', 0, 'Nyamais Store[small room]', '1', 'SW', 8, 0, 11, 0, NULL, NULL),
(16, '18', 0, 'Plotect', '1', 'SW', 13, 0, 35, 10, NULL, NULL),
(17, '19', 0, 'Simaloy', '1', 'SW', 13, 0, 35, 10, NULL, NULL),
(18, '20', 0, 'New room above chic joint/Store[big room]', '1', 'SW', 9, 2, 34, 0, NULL, NULL),
(19, '21', 0, 'Kiserian College of Accountancy', '2', 'SE', 24, 8, 36, 3, NULL, NULL),
(20, '22', 0, 'Archihub construction ltd', '2', 'SE', 12, 8, 36, 3, NULL, NULL),
(21, '23', 0, 'Sidai', '2', 'NE', 12, 9, 37, 0, NULL, NULL),
(22, '24', 0, 'Masabi ranch oltepesi', '2', 'NE', 12, 8, 37, 0, NULL, NULL),
(23, '27', 0, 'Geocad Enterprises Ltd', '2', 'NE', 16, 7, 12, 0, NULL, NULL),
(24, '25', 0, '4th Generation', '2', 'NE', 12, 0, 12, 4, NULL, NULL),
(25, '28', 0, 'Ries Kaakua and Co.Advocates', '2', 'NW', 13, 0, 37, 0, NULL, NULL),
(26, '26', 0, 'Transcounty investment company', '2', 'NE', 7, 9, 12, 4, NULL, NULL),
(27, '30', 0, 'Olgilai', '2', 'NW', 13, 0, 37, 0, NULL, NULL),
(28, '31', 0, 'Naikuni Ngaah and Miencha', '2', 'SW', 12, 10, 36, 4, NULL, NULL),
(29, '32', 0, 'Meeting room/kanisa', '2', 'SW', 12, 6, 36, 4, NULL, NULL),
(30, '33', 0, 'Small office', '2', 'SW', 7, 0, 12, 0, NULL, NULL),
(31, '34', 0, 'Chic Joint Tented area/terrace', 'x', 'S', 37, 0, 39, 0, NULL, NULL),
(32, '35', 0, 'Chic Joint-kitchen', 'x', 'S', 14, 7, 19, 0, NULL, NULL),
(33, '36', 0, 'Chic Joint-Ken''s office', 'x', 'S', 10, 0, 11, 6, NULL, NULL),
(34, '37', 0, 'Chic Joint-Store1', 'x', 'S', 10, 0, 11, 6, NULL, NULL),
(35, '38', 0, 'Chic Joint-Store2', 'x', 'S', 9, 4, 11, 6, NULL, NULL),
(36, '39', 0, 'Chic Joint-Pool bar-Door1', 'x', 'W', 18, 10, 11, 0, NULL, NULL),
(37, '40', 0, 'Chick Joint-Bar bar- Door2', 'x', 'W', 24, 0, 18, 0, NULL, NULL),
(38, '41', 0, 'GG''s welding room', 'x', 'W', 14, 8, 10, 0, NULL, NULL),
(39, '42', 0, 'Kinyozi/new', 'x', 'W', 16, 7, 13, 10, NULL, NULL),
(40, '1', 0, 'Coop. Bank', '1', 'SE', NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'wycliffe', 1, 'Former Wycliffes office', 'x', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'mutal_data', 0, 'Mutall Office & security power', '4', 'SE', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'mutall_tap', 1, 'Mutall Water Taps', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'deekos_toilets', 1, 'Deekos Toilets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'mutall_toilets', 1, 'Mutall Toilets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'chic_toilets', 1, 'Chic Joint Toilets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'deekos_stores', 0, 'Deekos Stores Extension', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'deekos_cafe_ext', 0, 'Deekos Cafeteria (Veranda) Extension', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, '42.1', 0, 'Extension of Kinyozi Area', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'deekos_toilet', 1, 'Deekos toilets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, '40.1', 0, 'Chick joint pool bar Extension', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `service` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `auto` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service`, `name`, `description`, `price`, `auto`) VALUES
(1, 'gabbage', 'Gabbage collection', 250, 1),
(2, 'security', 'Night time security', 1300, 1),
(3, 'IT', 'IT support', 2000, 0),
(4, 'power', 'Stand-by power generator', NULL, 0),
(5, 'general', 'Other general support', NULL, 0),
(6, 'water', 'Unmetered water', 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE IF NOT EXISTS `subscription` (
  `subscription` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`subscription`, `client`, `service`, `amount`) VALUES
(1, 2, 1, NULL),
(2, 3, 1, NULL),
(3, 19, 5, 1500),
(4, 2, 2, NULL),
(5, 3, 2, NULL),
(6, 19, 2, NULL),
(7, 2, 6, NULL),
(8, 3, 6, NULL),
(9, 28, 6, NULL),
(10, 9, 6, NULL),
(11, 18, 6, NULL),
(12, 19, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `water`
--

CREATE TABLE IF NOT EXISTS `water` (
  `water` int(11) NOT NULL,
  `wconnection` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `prev_date` date DEFAULT NULL,
  `prev_value` int(5) DEFAULT NULL,
  `curr_date` date DEFAULT NULL,
  `curr_value` int(5) DEFAULT NULL,
  `consumption` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wconnection`
--

CREATE TABLE IF NOT EXISTS `wconnection` (
  `wconnection` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `wmeter` int(11) NOT NULL,
  `rate` double DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date NOT NULL,
  `start_reading` int(10) DEFAULT NULL,
  `end_reading` int(10) DEFAULT NULL,
  `disconnected` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wconnection`
--

INSERT INTO `wconnection` (`wconnection`, `room`, `wmeter`, `rate`, `start_date`, `end_date`, `start_reading`, `end_reading`, `disconnected`) VALUES
(1, 8, 1, 200, '2018-06-25', '2019-01-31', NULL, 70, NULL),
(2, 3, 3, 200, '2018-06-25', '2030-12-31', NULL, NULL, NULL),
(3, 10, 4, 200, '2018-06-25', '2030-12-31', NULL, NULL, NULL),
(4, 4, 5, 200, '2018-06-25', '2030-12-31', NULL, NULL, NULL),
(5, 2, 6, 200, '2018-06-25', '2018-01-01', NULL, NULL, NULL),
(6, 40, 8, 200, '2018-06-25', '2030-12-31', NULL, NULL, NULL),
(7, 39, 9, 200, '2018-06-25', '2018-10-01', NULL, NULL, NULL),
(8, 43, 10, NULL, '2018-06-25', '2030-12-31', NULL, NULL, NULL),
(9, 46, 11, 120, '2018-06-25', '2018-09-30', NULL, NULL, NULL),
(10, 43, 12, NULL, '2018-06-25', '2019-01-31', NULL, 105, NULL),
(11, 44, 13, 200, '2018-06-25', '2019-01-31', NULL, 119, NULL),
(12, 32, 2, 200, '2018-06-25', '2019-01-31', NULL, 161, NULL),
(13, 45, 10, NULL, '2018-06-25', '2030-12-31', NULL, NULL, NULL),
(14, 40, 20, 200, '2018-06-25', '2030-12-31', NULL, NULL, NULL),
(15, 39, 23, 200, NULL, '2030-12-31', NULL, NULL, NULL),
(16, 46, 24, 120, NULL, '2030-12-31', NULL, NULL, NULL),
(17, 50, 13, 200, '2015-01-01', '2030-12-31', NULL, NULL, NULL),
(18, 8, 26, 200, '2019-01-31', '2030-12-31', 0, NULL, NULL),
(19, 32, 27, 200, '2019-01-31', '2030-12-31', 0, NULL, NULL),
(20, 43, 28, 200, '2019-01-31', '2030-12-31', 0, NULL, NULL),
(21, 44, 29, 200, '2019-01-31', '2030-12-31', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wmeter`
--

CREATE TABLE IF NOT EXISTS `wmeter` (
  `wmeter` int(11) NOT NULL,
  `serial_no` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `is_supply` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wmeter`
--

INSERT INTO `wmeter` (`wmeter`, `serial_no`, `name`, `comment`, `is_supply`) VALUES
(1, '2017-12-8852', 'Maa steaks/closed', 'closed', 0),
(2, '2017-12-7058                ', 'Chickjoint kitchen/closed', 'closed', 0),
(3, '15061026', 'Lovina', NULL, 0),
(4, '300746', 'Ukiristo', NULL, 0),
(5, '14081172', 'Deekos bakery', NULL, 0),
(6, '14089399', 'Deekos cafeteria', NULL, 0),
(7, '004973', 'Ololaiser', NULL, 1),
(8, 'ISO 4064', 'Co-ope Bank', NULL, 0),
(9, '201215300', 'Kinyozi', NULL, 0),
(10, '2017-12-8299', 'Mutall Tap', NULL, 0),
(11, '15065729', 'Chickjoint toilets', NULL, 0),
(12, '2012-12-8841', 'Mutall Tap/closed on 31/1/2019', 'closed', 0),
(13, '2012-12-9562', 'Deekos Toilets', 'closed', 0),
(14, 'Bh', 'Borehole ', NULL, 1),
(15, 'Ur', 'Underground reservoir', NULL, 1),
(16, '300713', NULL, NULL, 0),
(17, '2017.4.8285', NULL, NULL, 0),
(18, '11027722', NULL, NULL, 0),
(19, '2017.5.8126', NULL, NULL, 0),
(20, 'ISO 4064 BH', 'Co-ope Bank/borehole', NULL, 0),
(21, '18030896', 'Eureka waters', NULL, 1),
(22, '15080707', 'Underground reservoir', NULL, 0),
(23, '18031498', 'Kinyonzi new meter/01-10-2018', NULL, 0),
(24, '18030750', 'Chic joint toillets/30-09-2018', NULL, 0),
(25, '15020642', 'Chic joint kitchen/01-08-2018', NULL, 0),
(26, '18030760', 'maa steak/on 1.02.2019', 'replacement', 0),
(27, '18030792', 'chicjoint kitchen/on 01.02.2019', 'replacement', 0),
(28, '18031595', 'mutall tap/on 01.02.2019', 'replacement', 0),
(29, '18031083', 'deekos toilet/on 01.02.2019', 'replacement', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wreading`
--

CREATE TABLE IF NOT EXISTS `wreading` (
  `wreading` int(11) NOT NULL,
  `wmeter` int(11) NOT NULL,
  `invoice` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `value` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2954 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wreading`
--

INSERT INTO `wreading` (`wreading`, `wmeter`, `invoice`, `date`, `value`, `remark`) VALUES
(1, 7, NULL, '2018-12-31', 1284.491, NULL),
(2, 7, NULL, '2019-01-02', 1284.491, NULL),
(3, 7, NULL, '2019-01-04', 1284.642, NULL),
(4, 7, NULL, '2019-01-06', 1293.01, NULL),
(5, 7, NULL, '2019-01-07', 1293.961, NULL),
(6, 7, NULL, '2019-01-08', 1295.991, NULL),
(7, 7, NULL, '2019-01-10', 1300.761, NULL),
(8, 7, NULL, '2019-01-11', 1300.761, NULL),
(9, 7, NULL, '2019-01-13', 1300.761, NULL),
(10, 7, NULL, '2019-01-14', 1300.761, NULL),
(11, 5, NULL, '2018-12-31', 1951.417, NULL),
(12, 5, NULL, '2019-01-02', 1953.201, NULL),
(13, 5, NULL, '2019-01-04', 1955.011, NULL),
(14, 5, NULL, '2019-01-06', 1960.032, NULL),
(15, 5, NULL, '2019-01-07', 1961.031, NULL),
(16, 5, NULL, '2019-01-08', 1962.714, NULL),
(17, 5, NULL, '2019-01-10', 1966.164, NULL),
(18, 5, NULL, '2019-01-11', 1968.162, NULL),
(19, 5, NULL, '2019-01-13', 1972.166, NULL),
(20, 5, NULL, '2019-01-14', 1973.889, NULL),
(21, 25, NULL, '2018-12-31', 95.569, NULL),
(22, 25, NULL, '2019-01-02', 96.622, NULL),
(23, 25, NULL, '2019-01-04', 96.839, NULL),
(24, 25, NULL, '2019-01-06', 98.422, NULL),
(25, 25, NULL, '2019-01-07', 98.652, NULL),
(26, 25, NULL, '2019-01-08', 99.221, NULL),
(27, 25, NULL, '2019-01-10', 100, NULL),
(28, 25, NULL, '2019-01-11', 100.201, NULL),
(29, 25, NULL, '2019-01-13', 101.208, NULL),
(30, 25, NULL, '2019-01-14', 101.75, NULL),
(31, 3, NULL, '2018-12-31', 104.038, NULL),
(32, 3, NULL, '2019-01-02', 104.044, NULL),
(33, 3, NULL, '2019-01-04', 104.057, NULL),
(34, 3, NULL, '2019-01-06', 104.087, NULL),
(35, 3, NULL, '2019-01-07', 104.091, NULL),
(36, 3, NULL, '2019-01-08', 104.106, NULL),
(37, 3, NULL, '2019-01-10', 104.123, NULL),
(38, 3, NULL, '2019-01-11', 104.131, NULL),
(39, 3, NULL, '2019-01-13', 104.144, NULL),
(40, 3, NULL, '2019-01-14', 104.149, NULL),
(41, 22, NULL, '2018-12-31', 203.799, NULL),
(42, 22, NULL, '2019-01-02', 203.799, NULL),
(43, 22, NULL, '2019-01-04', 209.785, NULL),
(44, 22, NULL, '2019-01-06', 210.453, NULL),
(45, 22, NULL, '2019-01-07', 210.453, NULL),
(46, 22, NULL, '2019-01-08', 210.453, NULL),
(47, 22, NULL, '2019-01-10', 210.83, NULL),
(48, 22, NULL, '2019-01-11', 213.479, NULL),
(49, 22, NULL, '2019-01-13', 219.62, NULL),
(50, 22, NULL, '2019-01-14', 221.106, NULL),
(51, 24, NULL, '2018-12-31', 199.242, NULL),
(52, 24, NULL, '2019-01-02', 208.61, NULL),
(53, 24, NULL, '2019-01-04', 209.799, NULL),
(54, 24, NULL, '2019-01-06', 212.625, NULL),
(55, 24, NULL, '2019-01-07', 213.091, NULL),
(56, 24, NULL, '2019-01-08', 213.84, NULL),
(57, 24, NULL, '2019-01-10', 214.581, NULL),
(58, 24, NULL, '2019-01-11', 215.247, NULL),
(59, 24, NULL, '2019-01-13', 217.22, NULL),
(60, 24, NULL, '2019-01-14', 218.066, NULL),
(61, 21, NULL, '2018-12-31', 257.5, NULL),
(62, 21, NULL, '2019-01-02', 257.5, NULL),
(63, 21, NULL, '2019-01-04', 257.5, NULL),
(64, 21, NULL, '2019-01-06', 257.5, NULL),
(65, 21, NULL, '2019-01-07', 257.5, NULL),
(66, 21, NULL, '2019-01-08', 257.5, NULL),
(67, 21, NULL, '2019-01-10', 257.5, NULL),
(68, 21, NULL, '2019-01-11', 257.5, NULL),
(69, 21, NULL, '2019-01-13', 257.5, NULL),
(70, 21, NULL, '2019-01-14', 257.5, NULL),
(71, 23, NULL, '2018-12-31', 10.077, NULL),
(72, 23, NULL, '2019-01-02', 10.18, NULL),
(73, 23, NULL, '2019-01-04', 10.417, NULL),
(74, 23, NULL, '2019-01-06', 10.76, NULL),
(75, 23, NULL, '2019-01-07', 10.76, NULL),
(76, 23, NULL, '2019-01-08', 10.978, NULL),
(77, 23, NULL, '2019-01-10', 11.123, NULL),
(78, 23, NULL, '2019-01-11', 11.229, NULL),
(79, 23, NULL, '2019-01-13', 11.544, NULL),
(80, 23, NULL, '2019-01-14', 11.674, NULL),
(81, 12, NULL, '2018-12-31', 91, NULL),
(82, 12, NULL, '2019-01-02', 92, NULL),
(83, 12, NULL, '2019-01-04', 93, NULL),
(84, 12, NULL, '2019-01-06', 94, NULL),
(85, 12, NULL, '2019-01-07', 95, NULL),
(86, 12, NULL, '2019-01-08', 96, NULL),
(87, 12, NULL, '2019-01-10', 97, NULL),
(88, 12, NULL, '2019-01-11', 98, NULL),
(89, 12, NULL, '2019-01-13', 99, NULL),
(90, 12, NULL, '2019-01-14', 99, NULL),
(91, 13, NULL, '2018-12-31', 106, NULL),
(92, 13, NULL, '2019-01-02', 107, NULL),
(93, 13, NULL, '2019-01-04', 108, NULL),
(94, 13, NULL, '2019-01-06', 109, NULL),
(95, 13, NULL, '2019-01-07', 109, NULL),
(96, 13, NULL, '2019-01-08', 109, NULL),
(97, 13, NULL, '2019-01-10', 110, NULL),
(98, 13, NULL, '2019-01-11', 111, NULL),
(99, 13, NULL, '2019-01-13', 112, NULL),
(100, 13, NULL, '2019-01-14', 113, NULL),
(101, 2, NULL, '2018-12-31', 143, NULL),
(102, 2, NULL, '2019-01-02', 145, NULL),
(103, 2, NULL, '2019-01-04', 146, NULL),
(104, 2, NULL, '2019-01-06', 148, NULL),
(105, 2, NULL, '2019-01-07', 149, NULL),
(106, 2, NULL, '2019-01-08', 150, NULL),
(107, 2, NULL, '2019-01-10', 151, NULL),
(108, 2, NULL, '2019-01-11', 152, NULL),
(109, 2, NULL, '2019-01-13', 153, NULL),
(110, 2, NULL, '2019-01-14', 154, NULL),
(111, 10, NULL, '2018-12-31', 1019.331, NULL),
(112, 10, NULL, '2019-01-02', 1031.407, NULL),
(113, 10, NULL, '2019-01-04', 1036.97, NULL),
(114, 10, NULL, '2019-01-06', 1054.123, NULL),
(115, 10, NULL, '2019-01-07', 1059.209, NULL),
(116, 10, NULL, '2019-01-08', 1061.583, NULL),
(117, 10, NULL, '2019-01-10', 1076.111, NULL),
(118, 10, NULL, '2019-01-11', 1081.772, NULL),
(119, 10, NULL, '2019-01-13', 1094.48, NULL),
(120, 10, NULL, '2019-01-14', 1100.65, NULL),
(121, 1, NULL, '2018-12-31', 58, NULL),
(122, 1, NULL, '2019-01-02', 58, NULL),
(123, 1, NULL, '2019-01-04', 58, NULL),
(124, 1, NULL, '2019-01-06', 61, NULL),
(125, 1, NULL, '2019-01-07', 61, NULL),
(126, 1, NULL, '2019-01-08', 61, NULL),
(127, 1, NULL, '2019-01-10', 62, NULL),
(128, 1, NULL, '2019-01-11', 63, NULL),
(129, 1, NULL, '2019-01-14', 63, NULL),
(130, 4, NULL, '2018-12-31', 79.319, NULL),
(131, 4, NULL, '2019-01-02', 79.361, NULL),
(132, 4, NULL, '2019-01-04', 79.879, NULL),
(133, 4, NULL, '2019-01-06', 79.879, NULL),
(134, 4, NULL, '2019-01-07', 79.879, NULL),
(135, 4, NULL, '2019-01-08', 79.879, NULL),
(136, 4, NULL, '2019-01-10', 79.879, NULL),
(137, 4, NULL, '2019-01-11', 79.879, NULL),
(138, 4, NULL, '2019-01-13', 79.879, NULL),
(139, 4, NULL, '2019-01-14', 79.879, NULL),
(140, 8, NULL, '2018-12-31', 207.8, NULL),
(141, 8, NULL, '2019-01-02', 208.4, NULL),
(142, 8, NULL, '2019-01-04', 209.1, NULL),
(143, 8, NULL, '2019-01-06', 210.2, NULL),
(144, 8, NULL, '2019-01-07', 210.3, NULL),
(145, 8, NULL, '2019-01-08', 211.2, NULL),
(146, 8, NULL, '2019-01-10', 212, NULL),
(147, 8, NULL, '2019-01-11', 212.5, NULL),
(148, 8, NULL, '2019-01-13', 213.851, NULL),
(149, 8, NULL, '2019-01-14', 213.851, NULL),
(150, 20, NULL, '2018-12-31', 14, NULL),
(151, 20, NULL, '2019-01-02', 14, NULL),
(152, 20, NULL, '2019-01-04', 14, NULL),
(153, 20, NULL, '2019-01-06', 14, NULL),
(154, 20, NULL, '2019-01-07', 14, NULL),
(155, 20, NULL, '2019-01-08', 14, NULL),
(156, 20, NULL, '2019-01-10', 14, NULL),
(157, 20, NULL, '2019-01-11', 14, NULL),
(158, 20, NULL, '2019-01-13', 14, NULL),
(159, 20, NULL, '2019-01-14', 14, NULL),
(160, 7, NULL, '2019-01-15', 1301.404, NULL),
(161, 7, NULL, '2019-01-17', 1306.014, NULL),
(162, 7, NULL, '2019-01-20', 1313.469, NULL),
(163, 7, NULL, '2019-01-23', 1320.517, NULL),
(164, 7, NULL, '2019-01-29', 1334.305, NULL),
(165, 7, NULL, '2019-01-30', 1335.178, NULL),
(166, 5, NULL, '2019-01-15', 1975.466, NULL),
(167, 5, NULL, '2019-01-17', 1978.594, NULL),
(168, 5, NULL, '2019-01-20', 1983.251, NULL),
(169, 5, NULL, '2019-01-23', 1987.508, NULL),
(170, 5, NULL, '2019-01-29', 1990.677, NULL),
(171, 5, NULL, '2019-01-30', 1997.909, NULL),
(172, 25, NULL, '2019-01-15', 101.75, NULL),
(173, 25, NULL, '2019-01-17', 103, NULL),
(174, 25, NULL, '2019-01-20', 104, NULL),
(175, 25, NULL, '2019-01-23', 106, NULL),
(176, 25, NULL, '2019-01-29', 108, NULL),
(177, 25, NULL, '2019-01-30', 109, NULL),
(178, 3, NULL, '2019-01-15', 104.161, NULL),
(179, 3, NULL, '2019-01-17', 104.19, NULL),
(180, 3, NULL, '2019-01-20', 104.22, NULL),
(181, 3, NULL, '2019-01-23', 104.245, NULL),
(182, 3, NULL, '2019-01-29', 104.309, NULL),
(183, 3, NULL, '2019-01-30', 104.334, NULL),
(184, 22, NULL, '2019-01-15', 223.871, NULL),
(185, 22, NULL, '2019-01-17', 223.872, NULL),
(186, 22, NULL, '2019-01-20', 223.872, NULL),
(187, 22, NULL, '2019-01-23', 224.681, NULL),
(188, 22, NULL, '2019-01-29', 224.684, NULL),
(189, 22, NULL, '2019-01-30', 224.684, NULL),
(190, 24, NULL, '2019-01-15', 218.887, NULL),
(191, 24, NULL, '2019-01-17', 219.949, NULL),
(192, 24, NULL, '2019-01-20', 221.879, NULL),
(193, 24, NULL, '2019-01-23', 224.272, NULL),
(194, 24, NULL, '2019-01-29', 227.785, NULL),
(195, 24, NULL, '2019-01-30', 228.914, NULL),
(196, 21, NULL, '2019-01-15', 263.293, NULL),
(197, 21, NULL, '2019-01-17', 263.293, NULL),
(198, 21, NULL, '2019-01-20', 263.293, NULL),
(199, 21, NULL, '2019-01-23', 263.293, NULL),
(200, 21, NULL, '2019-01-29', 263.293, NULL),
(201, 21, NULL, '2019-01-30', 263.293, NULL),
(202, 23, NULL, '2019-01-15', 11.711, NULL),
(203, 23, NULL, '2019-01-17', 11.902, NULL),
(204, 23, NULL, '2019-01-20', 12.26, NULL),
(205, 23, NULL, '2019-01-23', 12.514, NULL),
(206, 23, NULL, '2019-01-29', 13.024, NULL),
(207, 23, NULL, '2019-01-30', 13.229, NULL),
(208, 12, NULL, '2019-01-15', 99, NULL),
(209, 12, NULL, '2019-01-17', 99, NULL),
(210, 12, NULL, '2019-01-20', 100, NULL),
(211, 12, NULL, '2019-01-23', 102, NULL),
(212, 12, NULL, '2019-01-29', 103, NULL),
(213, 12, NULL, '2019-01-30', 104, NULL),
(214, 13, NULL, '2019-01-15', 113, NULL),
(215, 13, NULL, '2019-01-17', 114, NULL),
(216, 13, NULL, '2019-01-20', 115, NULL),
(217, 13, NULL, '2019-01-23', 117, NULL),
(218, 13, NULL, '2019-01-29', 117, NULL),
(219, 13, NULL, '2019-01-30', 118, NULL),
(220, 2, NULL, '2019-01-15', 154, NULL),
(221, 2, NULL, '2019-01-17', 154, NULL),
(222, 2, NULL, '2019-01-23', 157, NULL),
(223, 2, NULL, '2019-01-29', 159, NULL),
(224, 2, NULL, '2019-01-30', 160, NULL),
(225, 10, NULL, '2019-01-15', 1102.344, NULL),
(226, 10, NULL, '2019-01-17', 1111.099, NULL),
(227, 10, NULL, '2019-01-20', 1115.545, NULL),
(228, 10, NULL, '2019-01-23', 1120.159, NULL),
(229, 10, NULL, '2019-01-29', 1126.108, NULL),
(230, 10, NULL, '2019-01-30', 1129.032, NULL),
(231, 1, NULL, '2019-01-15', 64, NULL),
(232, 1, NULL, '2019-01-17', 64, NULL),
(233, 1, NULL, '2019-01-20', 65, NULL),
(234, 1, NULL, '2019-01-23', 67, NULL),
(235, 1, NULL, '2019-01-29', 68, NULL),
(236, 1, NULL, '2019-01-30', 68, NULL),
(237, 4, NULL, '2019-01-15', 79.879, NULL),
(238, 4, NULL, '2019-01-17', 79.879, NULL),
(239, 4, NULL, '2019-01-20', 79.987, NULL),
(240, 4, NULL, '2019-01-23', 80.075, NULL),
(241, 4, NULL, '2019-01-29', 80.234, NULL),
(242, 4, NULL, '2019-01-30', 80.338, NULL),
(243, 8, NULL, '2019-01-15', 214, NULL),
(244, 8, NULL, '2019-01-17', 215.2, NULL),
(245, 8, NULL, '2019-01-20', 216.6, NULL),
(246, 8, NULL, '2019-01-23', 217.5, NULL),
(247, 8, NULL, '2019-01-29', 219.7, NULL),
(248, 8, NULL, '2019-01-30', 221.1, NULL),
(249, 20, NULL, '2019-01-15', 14, NULL),
(250, 20, NULL, '2019-01-17', 14, NULL),
(251, 20, NULL, '2019-01-20', 14, NULL),
(252, 20, NULL, '2019-01-23', 14, NULL),
(253, 20, NULL, '2019-01-29', 14, NULL),
(254, 20, NULL, '2019-01-30', 14, NULL),
(255, 7, NULL, '2019-01-31', 1338.057, NULL),
(256, 5, NULL, '2019-01-31', 2000.043, NULL),
(257, 25, NULL, '2019-01-31', 109, NULL),
(258, 3, NULL, '2019-01-31', 104.344, NULL),
(259, 22, NULL, '2019-01-31', 225.277, NULL),
(260, 24, NULL, '2019-01-31', 229.499, NULL),
(261, 21, NULL, '2019-01-31', 263.293, NULL),
(262, 23, NULL, '2019-01-31', 13.317, NULL),
(263, 12, NULL, '2019-01-31', 105, NULL),
(264, 13, NULL, '2019-01-31', 119, NULL),
(265, 2, NULL, '2019-01-31', 161, NULL),
(266, 10, NULL, '2019-01-31', 1130.292, NULL),
(267, 1, NULL, '2019-01-31', 70, NULL),
(268, 4, NULL, '2019-01-31', 80.382, NULL),
(269, 8, NULL, '2019-01-31', 221.5, NULL),
(270, 20, NULL, '2019-01-31', 14, NULL),
(271, 26, NULL, '2019-01-31', 0, NULL),
(272, 27, NULL, '2019-01-31', 0, NULL),
(273, 28, NULL, '2019-01-31', 0, NULL),
(274, 29, NULL, '2019-01-31', 0, NULL),
(275, 7, NULL, '2018-04-30', 882.248, NULL),
(276, 7, NULL, '2018-05-01', 885.584, NULL),
(277, 7, NULL, '2018-05-02', 889.501, NULL),
(278, 7, NULL, '2018-05-03', 892.446, NULL),
(279, 7, NULL, '2018-05-04', 895.255, NULL),
(280, 7, NULL, '2018-05-07', 902.026, NULL),
(281, 7, NULL, '2018-05-08', 904.8, NULL),
(282, 7, NULL, '2018-05-09', 907.469, NULL),
(283, 7, NULL, '2018-05-11', 912.085, NULL),
(284, 7, NULL, '2018-05-10', 909.424, NULL),
(285, 7, NULL, '2018-05-14', 920.451, NULL),
(286, 7, NULL, '2018-05-15', 922.114, NULL),
(287, 7, NULL, '2018-05-16', 924.221, NULL),
(288, 7, NULL, '2018-05-17', 927.69, NULL),
(289, 7, NULL, '2018-05-18', 930, NULL),
(290, 7, NULL, '2018-05-21', 938.99, NULL),
(291, 7, NULL, '2018-05-22', 941.974, NULL),
(292, 7, NULL, '2018-05-23', 944.4, NULL),
(293, 7, NULL, '2018-05-24', 944.431, NULL),
(294, 7, NULL, '2018-05-25', 944.431, NULL),
(295, 7, NULL, '2018-05-28', 944.431, NULL),
(296, 7, NULL, '2018-05-29', 944.431, NULL),
(297, 7, NULL, '2018-05-30', 944.431, NULL),
(298, 7, NULL, '2018-05-31', 944.431, NULL),
(299, 7, NULL, '2018-06-01', 944.431, NULL),
(300, 7, NULL, '2018-06-03', 944.431, NULL),
(301, 7, NULL, '2018-06-04', 944.431, NULL),
(302, 7, NULL, '2018-06-05', 944.431, NULL),
(303, 7, NULL, '2018-06-06', 944.431, NULL),
(304, 7, NULL, '2018-06-07', 947.5, NULL),
(305, 7, NULL, '2018-06-08', 947.5, NULL),
(306, 7, NULL, '2018-06-10', 955.106, NULL),
(307, 7, NULL, '2018-06-11', 958.371, NULL),
(308, 7, NULL, '2018-06-12', 959.762, NULL),
(309, 7, NULL, '2018-06-13', 959.861, NULL),
(310, 7, NULL, '2018-06-14', 959.861, NULL),
(311, 7, NULL, '2018-06-15', 959.861, NULL),
(312, 7, NULL, '2018-06-18', 959.861, NULL),
(313, 7, NULL, '2018-06-19', 959.861, NULL),
(314, 7, NULL, '2018-06-20', 960.649, NULL),
(315, 7, NULL, '2018-06-21', 964.001, NULL),
(316, 7, NULL, '2018-06-22', 967.991, NULL),
(317, 7, NULL, '2018-06-24', 970.521, NULL),
(318, 7, NULL, '2018-06-25', 970.522, NULL),
(319, 7, NULL, '2018-06-26', 970.522, NULL),
(320, 7, NULL, '2018-06-27', 970.587, NULL),
(321, 7, NULL, '2018-06-28', 972.44, NULL),
(322, 7, NULL, '2018-06-29', 974.922, NULL),
(323, 7, NULL, '2018-06-30', 979.401, NULL),
(324, 7, NULL, '2018-07-01', 982.541, NULL),
(325, 7, NULL, '2018-07-02', 983.254, NULL),
(326, 7, NULL, '2018-07-03', 984.801, NULL),
(327, 7, NULL, '2018-07-04', 986.264, NULL),
(328, 7, NULL, '2018-07-05', 987.801, NULL),
(329, 7, NULL, '2018-07-06', 991.351, NULL),
(330, 7, NULL, '2018-07-08', 995.781, NULL),
(331, 7, NULL, '2018-07-09', 999.54, NULL),
(332, 7, NULL, '2018-07-11', 1002.788, NULL),
(333, 7, NULL, '2018-07-10', 1002.788, NULL),
(334, 7, NULL, '2018-07-12', 1002.788, NULL),
(335, 7, NULL, '2018-07-13', 1002.841, NULL),
(336, 7, NULL, '2018-07-14', 1006.532, NULL),
(337, 7, NULL, '2018-07-15', 1008.161, NULL),
(338, 7, NULL, '2018-07-16', 1008.249, NULL),
(339, 7, NULL, '2018-07-17', 1008.249, NULL),
(340, 7, NULL, '2018-07-18', 1008.249, NULL),
(341, 7, NULL, '2018-07-19', 1008.249, NULL),
(342, 7, NULL, '2018-07-20', 1008.249, NULL),
(343, 7, NULL, '2018-07-23', 1017.881, NULL),
(344, 7, NULL, '2018-07-24', 1018.181, NULL),
(345, 7, NULL, '2018-07-25', 1018.181, NULL),
(346, 7, NULL, '2018-07-26', 1018.508, NULL),
(347, 7, NULL, '2018-07-29', 1024.068, NULL),
(348, 7, NULL, '2018-07-30', 1027.519, NULL),
(349, 7, NULL, '2018-07-31', 1030.642, NULL),
(350, 7, NULL, '2018-08-01', 1032.775, NULL),
(351, 7, NULL, '2018-08-02', 1035.395, NULL),
(352, 7, NULL, '2018-08-03', 1035.395, NULL),
(353, 7, NULL, '2018-08-05', 1035.395, NULL),
(354, 7, NULL, '2018-08-06', 1035.398, NULL),
(355, 7, NULL, '2018-08-07', 1035.458, NULL),
(356, 7, NULL, '2018-08-08', 1035.458, NULL),
(357, 7, NULL, '2018-08-09', 1038.249, NULL),
(358, 7, NULL, '2018-08-10', 1041.135, NULL),
(359, 7, NULL, '2018-08-12', 1044.487, NULL),
(360, 7, NULL, '2018-08-13', 1044.487, NULL),
(361, 7, NULL, '2018-08-14', 1044.487, NULL),
(362, 7, NULL, '2018-08-15', 1044.487, NULL),
(363, 7, NULL, '2018-08-16', 1044.487, NULL),
(364, 7, NULL, '2018-08-21', 1044.487, NULL),
(365, 7, NULL, '2018-08-17', 1044.487, NULL),
(366, 7, NULL, '2018-08-22', 1044.487, NULL),
(367, 7, NULL, '2018-08-23', 1044.487, NULL),
(368, 7, NULL, '2018-08-24', 1044.487, NULL),
(369, 7, NULL, '2018-08-26', 1045.277, NULL),
(370, 7, NULL, '2018-08-27', 1045.277, NULL),
(371, 7, NULL, '2018-08-28', 1045.277, NULL),
(372, 7, NULL, '2018-08-29', 1045.277, NULL),
(373, 7, NULL, '2018-08-30', 1045.922, NULL),
(374, 7, NULL, '2018-09-02', 1046.051, NULL),
(375, 7, NULL, '2018-09-01', 1045.965, NULL),
(376, 7, NULL, '2018-09-03', 1046.051, NULL),
(377, 7, NULL, '2018-09-04', 1046.051, NULL),
(378, 7, NULL, '2018-09-05', 1046.566, NULL),
(379, 7, NULL, '2018-09-06', 1048.196, NULL),
(380, 7, NULL, '2018-09-07', 1051.287, NULL),
(381, 7, NULL, '2018-09-09', 1056.771, NULL),
(382, 7, NULL, '2018-09-12', 1063.342, NULL),
(383, 7, NULL, '2018-09-13', 1063.463, NULL),
(384, 7, NULL, '2018-09-14', 1066.646, NULL),
(385, 7, NULL, '2018-09-16', 1072.555, NULL),
(386, 7, NULL, '2018-09-17', 1073.221, NULL),
(387, 7, NULL, '2018-09-18', 1076.555, NULL),
(388, 7, NULL, '2018-09-19', 1078.776, NULL),
(389, 7, NULL, '2018-09-20', 1079.867, NULL),
(390, 7, NULL, '2018-09-21', 1084.111, NULL),
(391, 7, NULL, '2018-09-24', 1089.044, NULL),
(392, 7, NULL, '2018-09-25', 1091.076, NULL),
(393, 7, NULL, '2018-09-26', 1092.681, NULL),
(394, 7, NULL, '2018-09-27', 1093.4, NULL),
(395, 7, NULL, '2018-09-28', 1093.4, NULL),
(396, 7, NULL, '2018-09-30', 1098.141, NULL),
(397, 7, NULL, '2018-10-01', 1098.681, NULL),
(398, 7, NULL, '2018-10-02', 1100.909, NULL),
(399, 7, NULL, '2018-10-03', 1102.306, NULL),
(400, 7, NULL, '2018-10-04', 1103.541, NULL),
(401, 7, NULL, '2018-10-05', 1105.728, NULL),
(402, 7, NULL, '2018-10-07', 1110.239, NULL),
(403, 7, NULL, '2018-10-08', 1112.215, NULL),
(404, 7, NULL, '2018-10-09', 1113.142, NULL),
(405, 7, NULL, '2018-10-10', 1113.704, NULL),
(406, 7, NULL, '2018-10-11', 1115.162, NULL),
(407, 7, NULL, '2018-10-12', 1117.001, NULL),
(408, 7, NULL, '2018-10-16', 1117.01, NULL),
(409, 7, NULL, '2018-10-17', 1125.255, NULL),
(410, 7, NULL, '2018-10-19', 1130.141, NULL),
(411, 7, NULL, '2018-10-21', 1134.858, NULL),
(412, 7, NULL, '2018-10-24', 1140.084, NULL),
(413, 7, NULL, '2018-10-28', 1140.084, NULL),
(414, 7, NULL, '2018-10-29', 1149.222, NULL),
(415, 7, NULL, '2018-10-31', 1153.613, NULL),
(416, 7, NULL, '2018-11-08', 1171.871, NULL),
(417, 7, NULL, '2018-11-09', 1174.535, NULL),
(418, 7, NULL, '2018-11-14', 1186.755, NULL),
(419, 7, NULL, '2018-11-23', 1209.553, NULL),
(420, 7, NULL, '2018-11-26', 1214.181, NULL),
(421, 7, NULL, '2018-11-28', 1218.581, NULL),
(422, 7, NULL, '2018-11-30', 1218.581, NULL),
(423, 7, NULL, '2018-12-02', 1230.13, NULL),
(424, 7, NULL, '2018-12-03', 1230.557, NULL),
(425, 7, NULL, '2018-12-04', 1233.542, NULL),
(426, 7, NULL, '2018-12-05', 1235.152, NULL),
(427, 7, NULL, '2018-12-06', 1238.831, NULL),
(428, 7, NULL, '2018-12-07', 1241.072, NULL),
(429, 7, NULL, '2018-12-10', 1247.955, NULL),
(430, 7, NULL, '2018-12-11', 1250.557, NULL),
(431, 7, NULL, '2018-12-13', 1254.002, NULL),
(432, 7, NULL, '2018-12-14', 1256.261, NULL),
(433, 7, NULL, '2018-12-17', 1262.156, NULL),
(434, 7, NULL, '2018-12-18', 1264.112, NULL),
(435, 7, NULL, '2018-12-19', 1266.665, NULL),
(436, 7, NULL, '2018-12-20', 1266.675, NULL),
(437, 7, NULL, '2018-12-21', 1269.612, NULL),
(438, 7, NULL, '2018-12-23', 1275.231, NULL),
(439, 7, NULL, '2018-12-24', 1276.156, NULL),
(440, 7, NULL, '2018-12-27', 1279.972, NULL),
(441, 7, NULL, '2018-12-30', 1284.37, NULL),
(442, 18, NULL, '2018-04-30', 28.227, NULL),
(443, 18, NULL, '2018-05-01', 28.227, NULL),
(444, 18, NULL, '2018-05-02', 28.227, NULL),
(445, 18, NULL, '2018-05-03', 28.227, NULL),
(446, 18, NULL, '2018-05-04', 28.227, NULL),
(447, 18, NULL, '2018-05-07', 28.227, NULL),
(448, 18, NULL, '2018-05-08', 28.227, NULL),
(449, 18, NULL, '2018-05-09', 28.227, NULL),
(450, 18, NULL, '2018-05-11', 28.277, NULL),
(451, 18, NULL, '2018-05-10', 28.227, NULL),
(452, 18, NULL, '2018-05-14', 28.227, NULL),
(453, 18, NULL, '2018-05-15', 28.227, NULL),
(454, 18, NULL, '2018-05-16', 28.227, NULL),
(455, 18, NULL, '2018-05-17', 28.227, NULL),
(456, 18, NULL, '2018-05-18', 28.227, NULL),
(457, 18, NULL, '2018-05-21', 28.227, NULL),
(458, 18, NULL, '2018-05-22', 28.227, NULL),
(459, 18, NULL, '2018-05-23', 28.227, NULL),
(460, 18, NULL, '2018-05-24', 28.227, NULL),
(461, 18, NULL, '2018-05-25', 28.227, NULL),
(462, 5, NULL, '2018-04-30', 1565.1897, NULL),
(463, 5, NULL, '2018-05-01', 1567.2537, NULL),
(464, 5, NULL, '2018-05-02', 1569.4757, NULL),
(465, 5, NULL, '2018-05-03', 1570.6879, NULL),
(466, 5, NULL, '2018-05-04', 1572.884, NULL),
(467, 5, NULL, '2018-05-07', 1578.886, NULL),
(468, 5, NULL, '2018-05-08', 1580.911, NULL),
(469, 5, NULL, '2018-05-09', 1583.074, NULL),
(470, 5, NULL, '2018-05-11', 1587.311, NULL),
(471, 5, NULL, '2018-05-10', 1585.257, NULL),
(472, 5, NULL, '2018-05-14', 1592.52, NULL),
(473, 5, NULL, '2018-05-15', 1594.013, NULL),
(474, 5, NULL, '2018-05-16', 1595.158, NULL),
(475, 5, NULL, '2018-05-17', 1595.983, NULL),
(476, 5, NULL, '2018-05-18', 1595.983, NULL),
(477, 5, NULL, '2018-05-21', 1595.983, NULL),
(478, 5, NULL, '2018-05-22', 1595.983, NULL),
(479, 5, NULL, '2018-05-23', 1595.983, NULL),
(480, 5, NULL, '2018-05-24', 1595.983, NULL),
(481, 5, NULL, '2018-05-25', 1595.983, NULL),
(482, 5, NULL, '2018-05-28', 1595.983, NULL),
(483, 5, NULL, '2018-05-29', 1597.32, NULL),
(484, 5, NULL, '2018-05-30', 1597.32, NULL),
(485, 5, NULL, '2018-05-31', 1600.803, NULL),
(486, 5, NULL, '2018-06-01', 1602.883, NULL),
(487, 5, NULL, '2018-06-03', 1606.281, NULL),
(488, 5, NULL, '2018-06-04', 1608.016, NULL),
(489, 5, NULL, '2018-06-05', 1609.906, NULL),
(490, 5, NULL, '2018-06-06', 1611.854, NULL),
(491, 5, NULL, '2018-06-07', 1613.84, NULL),
(492, 5, NULL, '2018-06-08', 1615.606, NULL),
(493, 5, NULL, '2018-06-10', 1617.445, NULL),
(494, 5, NULL, '2018-06-11', 1621.044, NULL),
(495, 5, NULL, '2018-06-12', 1622.841, NULL),
(496, 5, NULL, '2018-06-13', 1624.937, NULL),
(497, 5, NULL, '2018-06-14', 1627.09, NULL),
(498, 5, NULL, '2018-06-15', 1627.09, NULL),
(499, 5, NULL, '2018-06-18', 1633.454, NULL),
(500, 5, NULL, '2018-06-19', 1635.222, NULL),
(501, 5, NULL, '2018-06-20', 1636.649, NULL),
(502, 5, NULL, '2018-06-21', 1638.628, NULL),
(503, 5, NULL, '2018-06-22', 1640.808, NULL),
(504, 5, NULL, '2018-06-24', 1644.184, NULL),
(505, 5, NULL, '2018-06-25', 1645.915, NULL),
(506, 5, NULL, '2018-06-26', 1648.668, NULL),
(507, 5, NULL, '2018-06-27', 1650.798, NULL),
(508, 5, NULL, '2018-06-28', 1652.596, NULL),
(509, 5, NULL, '2018-06-29', 1654.28, NULL),
(510, 5, NULL, '2018-06-30', 1655.959, NULL),
(511, 5, NULL, '2018-07-01', 1657.756, NULL),
(512, 5, NULL, '2018-07-02', 1659.215, NULL),
(513, 5, NULL, '2018-07-03', 1661.268, NULL),
(514, 5, NULL, '2018-07-04', 1662.998, NULL),
(515, 5, NULL, '2018-07-05', 1664.564, NULL),
(516, 5, NULL, '2018-07-06', 1666.564, NULL),
(517, 5, NULL, '2018-07-08', 1670.258, NULL),
(518, 5, NULL, '2018-07-09', 1672.063, NULL),
(519, 5, NULL, '2018-07-11', 1675.4354, NULL),
(520, 5, NULL, '2018-07-10', 1674.158, NULL),
(521, 5, NULL, '2018-07-12', 1675.594, NULL),
(522, 5, NULL, '2018-07-13', 1677.508, NULL),
(523, 5, NULL, '2018-07-14', 1677.921, NULL),
(524, 5, NULL, '2018-07-15', 1679.431, NULL),
(525, 5, NULL, '2018-07-16', 1681.319, NULL),
(526, 5, NULL, '2018-07-17', 1683.498, NULL),
(527, 5, NULL, '2018-07-18', 1685.291, NULL),
(528, 5, NULL, '2018-07-19', 1687.241, NULL),
(529, 5, NULL, '2018-07-20', 1689.297, NULL),
(530, 5, NULL, '2018-07-23', 1696.682, NULL),
(531, 5, NULL, '2018-07-24', 1698.221, NULL),
(532, 5, NULL, '2018-07-25', 1700.405, NULL),
(533, 5, NULL, '2018-07-26', 1702.228, NULL),
(534, 5, NULL, '2018-07-29', 1707.541, NULL),
(535, 5, NULL, '2018-07-30', 1709.018, NULL),
(536, 5, NULL, '2018-07-31', 1710.767, NULL),
(537, 5, NULL, '2018-08-01', 1712.622, NULL),
(538, 5, NULL, '2018-08-02', 1714.905, NULL),
(539, 5, NULL, '2018-08-03', 1716.329, NULL),
(540, 5, NULL, '2018-08-05', 1719.911, NULL),
(541, 5, NULL, '2018-08-06', 1723.399, NULL),
(542, 5, NULL, '2018-08-07', 1725.018, NULL),
(543, 5, NULL, '2018-08-08', 1726.761, NULL),
(544, 5, NULL, '2018-08-09', 1728.249, NULL),
(545, 5, NULL, '2018-08-10', 1731.204, NULL),
(546, 5, NULL, '2018-08-12', 1734.849, NULL),
(547, 5, NULL, '2018-08-13', 1736.757, NULL),
(548, 5, NULL, '2018-08-14', 1738.214, NULL),
(549, 5, NULL, '2018-08-15', 1740.23, NULL),
(550, 5, NULL, '2018-08-16', 1742.178, NULL),
(551, 5, NULL, '2018-08-17', 1744.022, NULL),
(552, 5, NULL, '2018-08-21', 1744.762, NULL),
(553, 5, NULL, '2018-08-22', 1751.664, NULL),
(554, 5, NULL, '2018-08-23', 1753.91, NULL),
(555, 5, NULL, '2018-08-24', 1755.571, NULL),
(556, 5, NULL, '2018-08-26', 1759.402, NULL),
(557, 5, NULL, '2018-08-27', 1761.18, NULL),
(558, 5, NULL, '2018-08-28', 1761.267, NULL),
(559, 5, NULL, '2018-08-29', 1761.867, NULL),
(560, 5, NULL, '2018-08-30', 1766.798, NULL),
(561, 5, NULL, '2018-09-02', 1772.674, NULL),
(562, 5, NULL, '2018-09-01', 1768.985, NULL),
(563, 5, NULL, '2018-09-03', 1774.365, NULL),
(564, 5, NULL, '2018-09-04', 1776.451, NULL),
(565, 5, NULL, '2018-09-05', 1777.9, NULL),
(566, 5, NULL, '2018-09-06', 1779.824, NULL),
(567, 5, NULL, '2018-09-07', 1782.09, NULL),
(568, 5, NULL, '2018-09-09', 1785.584, NULL),
(569, 5, NULL, '2018-09-12', 1790.694, NULL),
(570, 5, NULL, '2018-09-13', 1792.629, NULL),
(571, 5, NULL, '2018-09-14', 1794.281, NULL),
(572, 5, NULL, '2018-09-16', 1797.325, NULL),
(573, 5, NULL, '2018-09-17', 1798.541, NULL),
(574, 5, NULL, '2018-09-18', 1800.074, NULL),
(575, 5, NULL, '2018-09-19', 1802.047, NULL),
(576, 5, NULL, '2018-09-20', 1803.582, NULL),
(577, 5, NULL, '2018-09-21', 1805.491, NULL),
(578, 5, NULL, '2018-09-23', 1808.49, NULL),
(579, 5, NULL, '2018-09-24', 1809.664, NULL),
(580, 5, NULL, '2018-09-25', 1811.479, NULL),
(581, 5, NULL, '2018-09-26', 1812.976, NULL),
(582, 5, NULL, '2018-09-27', 1814.607, NULL),
(583, 5, NULL, '2018-09-28', 1816.133, NULL),
(584, 5, NULL, '2018-09-30', 1819.088, NULL),
(585, 5, NULL, '2018-10-01', 1820.205, NULL),
(586, 5, NULL, '2018-10-02', 1821.697, NULL),
(587, 5, NULL, '2018-10-03', 1823.439, NULL),
(588, 5, NULL, '2018-10-04', 1824.681, NULL),
(589, 5, NULL, '2018-10-05', 1826.062, NULL),
(590, 5, NULL, '2018-10-07', 1828.835, NULL),
(591, 5, NULL, '2018-10-08', 1830.002, NULL),
(592, 5, NULL, '2018-10-09', 1831.743, NULL),
(593, 5, NULL, '2018-10-10', 1833.202, NULL),
(594, 5, NULL, '2018-10-11', 1834.817, NULL),
(595, 5, NULL, '2018-10-12', 1836.317, NULL),
(596, 5, NULL, '2018-10-15', 1840.612, NULL),
(597, 5, NULL, '2018-10-16', 1841.619, NULL),
(598, 5, NULL, '2018-10-17', 1843.14, NULL),
(599, 5, NULL, '2018-10-19', 1846.251, NULL),
(600, 5, NULL, '2018-10-21', 1848.723, NULL),
(601, 5, NULL, '2018-10-24', 1852.469, NULL),
(602, 5, NULL, '2018-10-28', 1858.792, NULL),
(603, 5, NULL, '2018-10-29', 1859.856, NULL),
(604, 5, NULL, '2018-10-31', 1863.255, NULL),
(605, 5, NULL, '2018-11-09', 1877.578, NULL),
(606, 5, NULL, '2018-11-14', 1884.367, NULL),
(607, 5, NULL, '2018-11-23', 1897.223, NULL),
(608, 5, NULL, '2018-11-26', 1900.583, NULL),
(609, 5, NULL, '2018-11-28', 1903.583, NULL),
(610, 5, NULL, '2018-11-30', 1906.646, NULL),
(611, 5, NULL, '2018-12-02', 1910.655, NULL),
(612, 5, NULL, '2018-12-03', 1911.455, NULL),
(613, 5, NULL, '2018-12-04', 1913.217, NULL),
(614, 5, NULL, '2018-12-05', 1914.658, NULL),
(615, 5, NULL, '2018-12-06', 1916.41, NULL),
(616, 5, NULL, '2018-12-07', 1917.903, NULL),
(617, 5, NULL, '2018-12-10', 1922.262, NULL),
(618, 5, NULL, '2018-12-11', 1923.692, NULL),
(619, 5, NULL, '2018-12-13', 1926.472, NULL),
(620, 5, NULL, '2018-12-14', 1928.191, NULL),
(621, 5, NULL, '2018-12-17', 1932.355, NULL),
(622, 5, NULL, '2018-12-18', 1933.946, NULL),
(623, 5, NULL, '2018-12-19', 1935.586, NULL),
(624, 5, NULL, '2018-12-20', 1935.586, NULL),
(625, 5, NULL, '2018-12-21', 1938.851, NULL),
(626, 5, NULL, '2018-12-23', 1941.906, NULL),
(627, 5, NULL, '2018-12-24', 1943.062, NULL),
(628, 5, NULL, '2018-12-27', 1945.447, NULL),
(629, 5, NULL, '2018-12-30', 1950.394, NULL),
(630, 6, NULL, '2018-04-30', 563.1497, NULL),
(631, 6, NULL, '2018-05-01', 563.1496, NULL),
(632, 6, NULL, '2018-05-02', 563.1496, NULL),
(633, 6, NULL, '2018-05-03', 563.1496, NULL),
(634, 6, NULL, '2018-05-04', 563.1496, NULL),
(635, 6, NULL, '2018-05-07', 563.1496, NULL),
(636, 6, NULL, '2018-05-08', 563.1419, NULL),
(637, 6, NULL, '2018-05-09', 563.149, NULL),
(638, 6, NULL, '2018-05-11', 563.149, NULL),
(639, 6, NULL, '2018-05-10', 563.145, NULL),
(640, 6, NULL, '2018-05-14', 563.149, NULL),
(641, 6, NULL, '2018-05-15', 563.149, NULL),
(642, 6, NULL, '2018-05-16', 563.149, NULL),
(643, 6, NULL, '2018-05-17', 563.149, NULL),
(644, 6, NULL, '2018-05-18', 563.149, NULL),
(645, 6, NULL, '2018-05-21', 563.15, NULL),
(646, 6, NULL, '2018-05-22', 563.15, NULL),
(647, 6, NULL, '2018-05-23', 563.149, NULL),
(648, 6, NULL, '2018-05-24', 563.149, NULL),
(649, 6, NULL, '2018-05-25', 563.149, NULL),
(650, 6, NULL, '2018-05-28', 563.149, NULL),
(651, 6, NULL, '2018-05-29', 563.149, NULL),
(652, 6, NULL, '2018-05-30', 563.496, NULL),
(653, 6, NULL, '2018-05-31', 563.496, NULL),
(654, 6, NULL, '2018-06-01', 563.496, NULL),
(655, 6, NULL, '2018-06-03', 563.496, NULL),
(656, 6, NULL, '2018-06-04', 563.496, NULL),
(657, 6, NULL, '2018-06-05', 563.496, NULL),
(658, 6, NULL, '2018-06-06', 563.496, NULL),
(659, 6, NULL, '2018-06-07', 563.496, NULL),
(660, 6, NULL, '2018-06-08', 563.496, NULL),
(661, 6, NULL, '2018-06-10', 563.496, NULL),
(662, 6, NULL, '2018-06-11', 563.496, NULL),
(663, 6, NULL, '2018-06-12', 563.496, NULL),
(664, 6, NULL, '2018-06-13', 563.496, NULL),
(665, 6, NULL, '2018-06-14', 100, NULL),
(666, 6, NULL, '2018-06-15', 100, NULL),
(667, 6, NULL, '2018-06-18', 100, NULL),
(668, 6, NULL, '2018-06-19', 100, NULL),
(669, 6, NULL, '2018-06-20', 100, NULL),
(670, 6, NULL, '2018-06-21', 100, NULL),
(671, 6, NULL, '2018-06-22', 243, NULL),
(672, 6, NULL, '2018-06-24', 100, NULL),
(673, 6, NULL, '2018-06-25', 100, NULL),
(674, 6, NULL, '2018-06-26', 100, NULL),
(675, 6, NULL, '2018-06-27', 100, NULL),
(676, 6, NULL, '2018-06-28', 100, NULL),
(677, 6, NULL, '2018-06-29', 0, NULL),
(678, 6, NULL, '2018-06-30', 0, NULL),
(679, 6, NULL, '2018-07-03', 243, NULL),
(680, 25, NULL, '2018-08-31', 0, NULL),
(681, 25, NULL, '2018-08-01', 10.104, NULL),
(682, 25, NULL, '2018-09-01', 25.987, NULL),
(683, 25, NULL, '2018-09-10', 30.921, NULL),
(684, 25, NULL, '2018-09-17', 36.373, NULL),
(685, 25, NULL, '2018-09-24', 39.269, NULL),
(686, 25, NULL, '2018-09-30', 43.242, NULL),
(687, 25, NULL, '2018-10-01', 43.719, NULL),
(688, 25, NULL, '2018-10-07', 47.975, NULL),
(689, 25, NULL, '2018-10-05', 45.553, NULL),
(690, 25, NULL, '2018-10-08', 48.605, NULL),
(691, 25, NULL, '2018-10-09', 48.998, NULL),
(692, 25, NULL, '2018-10-10', 49.679, NULL),
(693, 25, NULL, '2018-10-11', 50.462, NULL),
(694, 25, NULL, '2018-10-12', 50.964, NULL),
(695, 25, NULL, '2018-10-15', 53.097, NULL),
(696, 25, NULL, '2018-10-16', 53.565, NULL),
(697, 25, NULL, '2018-10-17', 54.597, NULL),
(698, 25, NULL, '2018-10-19', 55.896, NULL),
(699, 25, NULL, '2018-10-21', 57.596, NULL),
(700, 25, NULL, '2018-10-24', 58.9, NULL),
(701, 25, NULL, '2018-10-28', 61.169, NULL),
(702, 25, NULL, '2018-10-29', 62.168, NULL),
(703, 25, NULL, '2018-10-31', 62.559, NULL),
(704, 25, NULL, '2018-11-01', 63.799, NULL),
(705, 25, NULL, '2018-11-08', 67.136, NULL),
(706, 25, NULL, '2018-11-09', 67.436, NULL),
(707, 25, NULL, '2018-11-14', 70.069, NULL),
(708, 25, NULL, '2018-11-23', 75.231, NULL),
(709, 25, NULL, '2018-11-26', 76.475, NULL),
(710, 25, NULL, '2018-11-28', 77.136, NULL),
(711, 25, NULL, '2018-11-30', 78.176, NULL),
(712, 25, NULL, '2018-12-02', 79.497, NULL),
(713, 25, NULL, '2018-12-03', 79.759, NULL),
(714, 25, NULL, '2018-12-04', 80.173, NULL),
(715, 25, NULL, '2018-12-05', 80.459, NULL),
(716, 25, NULL, '2018-12-06', 80.883, NULL),
(717, 25, NULL, '2018-12-07', 81.251, NULL),
(718, 25, NULL, '2018-12-10', 83.411, NULL),
(719, 25, NULL, '2018-12-11', 83.803, NULL),
(720, 25, NULL, '2018-12-13', 85.449, NULL),
(721, 25, NULL, '2018-12-14', 85.897, NULL),
(722, 25, NULL, '2018-12-17', 87.524, NULL),
(723, 25, NULL, '2018-12-18', 87.524, NULL),
(724, 25, NULL, '2018-12-19', 88.353, NULL),
(725, 25, NULL, '2018-12-20', 88.355, NULL),
(726, 25, NULL, '2018-12-21', 89.615, NULL),
(727, 25, NULL, '2018-12-23', 91.517, NULL),
(728, 25, NULL, '2018-12-24', 91.814, NULL),
(729, 25, NULL, '2018-12-27', 93.276, NULL),
(730, 25, NULL, '2018-12-30', 95.134, NULL),
(731, 3, NULL, '2018-04-30', 88.3312, NULL),
(732, 3, NULL, '2018-05-01', 88.4459, NULL),
(733, 3, NULL, '2018-05-02', 88.4594, NULL),
(734, 3, NULL, '2018-05-03', 88.4636, NULL),
(735, 3, NULL, '2018-05-04', 88.4798, NULL),
(736, 3, NULL, '2018-05-07', 88.5022, NULL),
(737, 3, NULL, '2018-05-08', 88.517, NULL),
(738, 3, NULL, '2018-05-09', 88.655, NULL),
(739, 3, NULL, '2018-05-11', 99.012, NULL),
(740, 3, NULL, '2018-05-10', 88.655, NULL),
(741, 3, NULL, '2018-05-14', 99.56, NULL),
(742, 3, NULL, '2018-05-15', 90.136, NULL),
(743, 3, NULL, '2018-05-16', 90.368, NULL),
(744, 3, NULL, '2018-05-17', 90.881, NULL),
(745, 3, NULL, '2018-05-18', 91.117, NULL),
(746, 3, NULL, '2018-05-21', 91.645, NULL),
(747, 3, NULL, '2018-05-22', 91.935, NULL),
(748, 3, NULL, '2018-05-23', 92.144, NULL),
(749, 3, NULL, '2018-05-24', 92.411, NULL),
(750, 3, NULL, '2018-05-25', 92.734, NULL),
(751, 3, NULL, '2018-05-28', 93.426, NULL),
(752, 3, NULL, '2018-05-29', 93.849, NULL),
(753, 3, NULL, '2018-05-30', 93.983, NULL),
(754, 3, NULL, '2018-05-31', 94.438, NULL),
(755, 3, NULL, '2018-06-01', 94.628, NULL),
(756, 3, NULL, '2018-06-03', 94.752, NULL),
(757, 3, NULL, '2018-06-04', 94.936, NULL),
(758, 3, NULL, '2018-06-05', 95.198, NULL),
(759, 3, NULL, '2018-06-06', 95.446, NULL),
(760, 3, NULL, '2018-06-07', 95.672, NULL),
(761, 3, NULL, '2018-06-08', 95.97, NULL),
(762, 3, NULL, '2018-06-10', 96.485, NULL),
(763, 3, NULL, '2018-06-11', 96.585, NULL),
(764, 3, NULL, '2018-06-12', 96.931, NULL),
(765, 3, NULL, '2018-06-13', 97.223, NULL),
(766, 3, NULL, '2018-06-14', 97.645, NULL),
(767, 3, NULL, '2018-06-15', 97.945, NULL),
(768, 3, NULL, '2018-06-18', 98.501, NULL),
(769, 3, NULL, '2018-06-19', 98.885, NULL),
(770, 3, NULL, '2018-06-20', 99.157, NULL),
(771, 3, NULL, '2018-06-21', 99.437, NULL),
(772, 3, NULL, '2018-06-22', 99.823, NULL),
(773, 3, NULL, '2018-06-24', 100.078, NULL),
(774, 3, NULL, '2018-06-25', 100.272, NULL),
(775, 3, NULL, '2018-06-26', 100.528, NULL),
(776, 3, NULL, '2018-06-27', 100.62, NULL),
(777, 3, NULL, '2018-06-28', 101, NULL),
(778, 3, NULL, '2018-06-29', 101.392, NULL),
(779, 3, NULL, '2018-06-30', 101.853, NULL),
(780, 3, NULL, '2018-07-01', 102.062, NULL),
(781, 3, NULL, '2018-07-02', 102.064, NULL),
(782, 3, NULL, '2018-07-03', 102.064, NULL),
(783, 3, NULL, '2018-07-04', 102.42, NULL),
(784, 3, NULL, '2018-07-05', 102.511, NULL),
(785, 3, NULL, '2018-07-06', 102.534, NULL),
(786, 3, NULL, '2018-07-08', 102.537, NULL),
(787, 3, NULL, '2018-07-09', 102.543, NULL),
(788, 3, NULL, '2018-07-11', 102.5613, NULL),
(789, 3, NULL, '2018-07-10', 102.553, NULL),
(790, 3, NULL, '2018-07-12', 102.5613, NULL),
(791, 3, NULL, '2018-07-13', 102.5613, NULL),
(792, 3, NULL, '2018-07-14', 102.571, NULL),
(793, 3, NULL, '2018-07-15', 102.593, NULL),
(794, 3, NULL, '2018-07-16', 102.596, NULL),
(795, 3, NULL, '2018-07-17', 102.602, NULL),
(796, 3, NULL, '2018-07-18', 102.614, NULL),
(797, 3, NULL, '2018-07-19', 102.624, NULL),
(798, 3, NULL, '2018-07-20', 102.633, NULL),
(799, 3, NULL, '2018-07-23', 102.656, NULL),
(800, 3, NULL, '2018-07-24', 102.669, NULL),
(801, 3, NULL, '2018-07-25', 102.679, NULL),
(802, 3, NULL, '2018-07-29', 102.721, NULL),
(803, 3, NULL, '2018-07-30', 102.721, NULL),
(804, 3, NULL, '2018-07-31', 102.735, NULL),
(805, 3, NULL, '2018-08-01', 102.758, NULL),
(806, 3, NULL, '2018-08-02', 102.769, NULL),
(807, 3, NULL, '2018-08-03', 102.777, NULL),
(808, 3, NULL, '2018-08-05', 102.788, NULL),
(809, 3, NULL, '2018-08-06', 102.799, NULL),
(810, 3, NULL, '2018-08-07', 102.807, NULL),
(811, 3, NULL, '2018-08-08', 102.817, NULL),
(812, 3, NULL, '2018-08-09', 102.827, NULL),
(813, 3, NULL, '2018-08-10', 102.843, NULL),
(814, 3, NULL, '2018-08-12', 102.849, NULL),
(815, 3, NULL, '2018-08-13', 102.858, NULL),
(816, 3, NULL, '2018-08-14', 102.874, NULL),
(817, 3, NULL, '2018-08-15', 102.88, NULL),
(818, 3, NULL, '2018-08-16', 102.923, NULL),
(819, 3, NULL, '2018-08-21', 102.945, NULL),
(820, 3, NULL, '2018-08-22', 102.954, NULL),
(821, 3, NULL, '2018-08-23', 102.965, NULL),
(822, 3, NULL, '2018-08-24', 102.971, NULL),
(823, 3, NULL, '2018-08-26', 102.987, NULL),
(824, 3, NULL, '2018-08-27', 102.995, NULL),
(825, 3, NULL, '2018-08-28', 102.996, NULL),
(826, 3, NULL, '2018-08-29', 102.996, NULL),
(827, 3, NULL, '2018-08-30', 103.015, NULL),
(828, 3, NULL, '2018-08-31', 103.032, NULL),
(829, 3, NULL, '2018-09-02', 103.043, NULL),
(830, 3, NULL, '2018-09-01', 103.041, NULL),
(831, 3, NULL, '2018-09-03', 103.053, NULL),
(832, 3, NULL, '2018-09-04', 103.062, NULL),
(833, 3, NULL, '2018-09-05', 103.076, NULL),
(834, 3, NULL, '2018-09-06', 103.083, NULL),
(835, 3, NULL, '2018-09-07', 103.085, NULL),
(836, 3, NULL, '2018-09-09', 103.123, NULL),
(837, 3, NULL, '2018-09-12', 103.151, NULL),
(838, 3, NULL, '2018-09-10', 103.131, NULL),
(839, 3, NULL, '2018-09-11', 103.141, NULL),
(840, 3, NULL, '2018-09-13', 103.152, NULL),
(841, 3, NULL, '2018-09-14', 103.153, NULL),
(842, 3, NULL, '2018-09-16', 103.157, NULL),
(843, 3, NULL, '2018-09-17', 103.159, NULL),
(844, 3, NULL, '2018-09-18', 103.17, NULL),
(845, 3, NULL, '2018-09-19', 103.174, NULL),
(846, 3, NULL, '2018-09-20', 103.182, NULL),
(847, 3, NULL, '2018-09-21', 103.202, NULL),
(848, 3, NULL, '2018-09-23', 103.204, NULL),
(849, 3, NULL, '2018-09-24', 103.204, NULL),
(850, 3, NULL, '2018-09-25', 103.211, NULL),
(851, 3, NULL, '2018-09-26', 103.213, NULL),
(852, 3, NULL, '2018-09-27', 103.227, NULL),
(853, 3, NULL, '2018-09-28', 103.241, NULL),
(854, 3, NULL, '2018-09-30', 103.254, NULL),
(855, 3, NULL, '2018-10-01', 103.254, NULL),
(856, 3, NULL, '2018-10-02', 103.269, NULL),
(857, 3, NULL, '2018-10-03', 103.279, NULL),
(858, 3, NULL, '2018-10-04', 103.289, NULL),
(859, 3, NULL, '2018-10-05', 103.301, NULL),
(860, 3, NULL, '2018-10-07', 103.315, NULL),
(861, 3, NULL, '2018-10-08', 103.315, NULL),
(862, 3, NULL, '2018-10-09', 103.326, NULL),
(863, 3, NULL, '2018-10-10', 103.342, NULL),
(864, 3, NULL, '2018-10-11', 103.347, NULL),
(865, 3, NULL, '2018-10-12', 103.36, NULL),
(866, 3, NULL, '2018-10-15', 103.384, NULL),
(867, 3, NULL, '2018-10-16', 103.393, NULL),
(868, 3, NULL, '2018-10-17', 103.398, NULL),
(869, 3, NULL, '2018-10-19', 103.437, NULL),
(870, 3, NULL, '2018-10-21', 103.448, NULL),
(871, 3, NULL, '2018-10-24', 103.459, NULL),
(872, 3, NULL, '2018-10-28', 103.512, NULL),
(873, 3, NULL, '2018-10-29', 103.512, NULL),
(874, 3, NULL, '2018-10-31', 103.539, NULL),
(875, 3, NULL, '2018-11-08', 103.628, NULL),
(876, 3, NULL, '2018-11-09', 103.643, NULL),
(877, 3, NULL, '2018-11-14', 103.668, NULL),
(878, 3, NULL, '2018-11-23', 103.749, NULL),
(879, 3, NULL, '2018-11-26', 103.758, NULL),
(880, 3, NULL, '2018-11-28', 103.787, NULL),
(881, 3, NULL, '2018-11-30', 103.787, NULL),
(882, 3, NULL, '2018-12-02', 103.818, NULL),
(883, 3, NULL, '2018-12-03', 103.823, NULL),
(884, 3, NULL, '2018-12-04', 103.831, NULL),
(885, 3, NULL, '2018-12-05', 103.836, NULL),
(886, 3, NULL, '2018-12-06', 103.869, NULL),
(887, 3, NULL, '2018-12-07', 103.878, NULL),
(888, 3, NULL, '2018-12-10', 103.883, NULL),
(889, 3, NULL, '2018-12-11', 103.908, NULL),
(890, 3, NULL, '2018-12-13', 103.916, NULL),
(891, 3, NULL, '2018-12-14', 103.933, NULL),
(892, 3, NULL, '2018-12-17', 103.946, NULL),
(893, 3, NULL, '2018-12-18', 103.953, NULL),
(894, 3, NULL, '2018-12-19', 103.982, NULL),
(895, 3, NULL, '2018-12-20', 103.982, NULL),
(896, 3, NULL, '2018-12-21', 104.008, NULL),
(897, 3, NULL, '2018-12-23', 104.011, NULL),
(898, 3, NULL, '2018-12-24', 104.011, NULL),
(899, 3, NULL, '2018-12-27', 104.017, NULL),
(900, 3, NULL, '2018-12-30', 104.032, NULL),
(901, 11, NULL, '2018-04-30', 398.34, NULL),
(902, 11, NULL, '2018-05-01', 398.398, NULL),
(903, 11, NULL, '2018-05-02', 402.24, NULL),
(904, 11, NULL, '2018-05-03', 410.752, NULL),
(905, 11, NULL, '2018-05-07', 416.578, NULL),
(906, 11, NULL, '2018-05-08', 416.68, NULL),
(907, 11, NULL, '2018-05-09', 416.8, NULL),
(908, 11, NULL, '2018-05-11', 416.84, NULL),
(909, 11, NULL, '2018-05-10', 417.45, NULL),
(910, 11, NULL, '2018-05-14', 417.65, NULL),
(911, 11, NULL, '2018-05-15', 418.45, NULL),
(912, 11, NULL, '2018-05-16', 418.785, NULL),
(913, 11, NULL, '2018-05-17', 419.342, NULL),
(914, 11, NULL, '2018-05-18', 420.35, NULL),
(915, 11, NULL, '2018-05-21', 420.503, NULL),
(916, 11, NULL, '2018-05-22', 422.502, NULL),
(917, 11, NULL, '2018-05-23', 425.152, NULL),
(918, 11, NULL, '2018-05-24', 431.761, NULL),
(919, 11, NULL, '2018-05-25', 432.84, NULL),
(920, 11, NULL, '2018-05-28', 0, NULL),
(921, 11, NULL, '2018-05-29', 3, NULL),
(922, 11, NULL, '2018-05-30', 5, NULL),
(923, 11, NULL, '2018-05-31', 5, NULL),
(924, 11, NULL, '2018-06-01', 9, NULL),
(925, 11, NULL, '2018-06-03', 26, NULL),
(926, 11, NULL, '2018-06-04', 26, NULL),
(927, 11, NULL, '2018-06-05', 29, NULL),
(928, 11, NULL, '2018-06-06', 32, NULL),
(929, 11, NULL, '2018-06-07', 32, NULL),
(930, 11, NULL, '2018-06-08', 34, NULL),
(931, 11, NULL, '2018-06-10', 37, NULL),
(932, 11, NULL, '2018-06-11', 37, NULL),
(933, 11, NULL, '2018-06-12', 39, NULL),
(934, 11, NULL, '2018-06-13', 41, NULL),
(935, 11, NULL, '2018-06-14', 43, NULL),
(936, 11, NULL, '2018-06-15', 45, NULL),
(937, 11, NULL, '2018-06-18', 57, NULL),
(938, 11, NULL, '2018-06-19', 61, NULL),
(939, 11, NULL, '2018-06-20', 64, NULL),
(940, 11, NULL, '2018-06-21', 68, NULL),
(941, 11, NULL, '2018-06-22', 71, NULL),
(942, 11, NULL, '2018-06-24', 79, NULL),
(943, 11, NULL, '2018-06-25', 83, NULL),
(944, 11, NULL, '2018-06-26', 86, NULL),
(945, 11, NULL, '2018-06-27', 90, NULL),
(946, 11, NULL, '2018-06-28', 94, NULL),
(947, 11, NULL, '2018-06-29', 97, NULL),
(948, 11, NULL, '2018-06-30', 101, NULL),
(949, 11, NULL, '2018-07-01', 106, NULL),
(950, 11, NULL, '2018-07-02', 111, NULL),
(951, 11, NULL, '2018-07-03', 113, NULL),
(952, 11, NULL, '2018-07-04', 117, NULL),
(953, 11, NULL, '2018-07-05', 119, NULL),
(954, 11, NULL, '2018-07-06', 124, NULL),
(955, 11, NULL, '2018-07-08', 131, NULL),
(956, 11, NULL, '2018-07-09', 135, NULL),
(957, 11, NULL, '2018-07-11', 140, NULL),
(958, 11, NULL, '2018-07-10', 138, NULL),
(959, 11, NULL, '2018-07-12', 143, NULL),
(960, 11, NULL, '2018-07-13', 144, NULL),
(961, 11, NULL, '2018-07-14', 148, NULL),
(962, 11, NULL, '2018-07-15', 151, NULL),
(963, 11, NULL, '2018-07-16', 156, NULL),
(964, 11, NULL, '2018-07-17', 158, NULL),
(965, 11, NULL, '2018-07-18', 161, NULL),
(966, 11, NULL, '2018-07-19', 163, NULL),
(967, 11, NULL, '2018-07-20', 166, NULL),
(968, 11, NULL, '2018-07-23', 170, NULL),
(969, 11, NULL, '2018-07-24', 178, NULL),
(970, 11, NULL, '2018-07-25', 181, NULL),
(971, 11, NULL, '2018-07-26', 183, NULL),
(972, 11, NULL, '2018-07-29', 194, NULL),
(973, 11, NULL, '2018-07-30', 197, NULL),
(974, 11, NULL, '2018-07-31', 201, NULL),
(975, 11, NULL, '2018-08-01', 204, NULL),
(976, 11, NULL, '2018-08-02', 207, NULL),
(977, 11, NULL, '2018-08-03', 209, NULL),
(978, 11, NULL, '2018-08-05', 216, NULL),
(979, 11, NULL, '2018-08-06', 216, NULL),
(980, 11, NULL, '2018-08-07', 221, NULL),
(981, 11, NULL, '2018-08-08', 224, NULL),
(982, 11, NULL, '2018-08-09', 226, NULL),
(983, 11, NULL, '2018-08-10', 227, NULL),
(984, 11, NULL, '2018-08-12', 234, NULL),
(985, 11, NULL, '2018-08-13', 237, NULL),
(986, 11, NULL, '2018-08-14', 237, NULL),
(987, 11, NULL, '2018-08-15', 241, NULL),
(988, 11, NULL, '2018-08-16', 243, NULL),
(989, 11, NULL, '2018-08-17', 245, NULL),
(990, 11, NULL, '2018-08-21', 265, NULL),
(991, 11, NULL, '2018-08-22', 267, NULL),
(992, 11, NULL, '2018-08-23', 269, NULL),
(993, 11, NULL, '2018-08-24', 271, NULL),
(994, 11, NULL, '2018-08-26', 272, NULL),
(995, 11, NULL, '2018-08-27', 274, NULL),
(996, 11, NULL, '2018-08-28', 275, NULL),
(997, 11, NULL, '2018-08-29', 276, NULL),
(998, 11, NULL, '2018-08-30', 278, NULL),
(999, 11, NULL, '2018-08-31', 281, NULL),
(1000, 11, NULL, '2018-09-02', 282, NULL),
(1001, 11, NULL, '2018-09-01', 281, NULL),
(1002, 11, NULL, '2018-09-03', 284, NULL),
(1003, 11, NULL, '2018-09-04', 287, NULL),
(1004, 11, NULL, '2018-09-05', 288, NULL),
(1005, 11, NULL, '2018-09-06', 289, NULL),
(1006, 11, NULL, '2018-09-07', 291, NULL),
(1007, 11, NULL, '2018-09-09', 295, NULL),
(1008, 11, NULL, '2018-09-10', 297, NULL),
(1009, 11, NULL, '2018-09-12', 301, NULL),
(1010, 11, NULL, '2018-09-13', 303, NULL),
(1011, 11, NULL, '2018-09-14', 305, NULL),
(1012, 11, NULL, '2018-09-16', 307, NULL),
(1013, 11, NULL, '2018-09-17', 309, NULL),
(1014, 11, NULL, '2018-09-18', 311, NULL),
(1015, 11, NULL, '2018-09-19', 313, NULL),
(1016, 11, NULL, '2018-09-20', 315, NULL),
(1017, 11, NULL, '2018-09-21', 317, NULL),
(1018, 11, NULL, '2018-09-23', 319, NULL),
(1019, 11, NULL, '2018-09-24', 321, NULL),
(1020, 11, NULL, '2018-09-25', 323, NULL),
(1021, 11, NULL, '2018-09-26', 325, NULL),
(1022, 11, NULL, '2018-09-27', 327, NULL),
(1023, 11, NULL, '2018-09-28', 327.655, NULL),
(1024, 11, NULL, '2018-09-30', 334.178, NULL),
(1025, 11, NULL, '2018-10-01', 344.042, NULL),
(1026, 11, NULL, '2018-10-02', 355.263, NULL),
(1027, 22, NULL, '2018-07-05', 37.791, NULL),
(1028, 22, NULL, '2018-07-06', 37.791, NULL),
(1029, 22, NULL, '2018-07-08', 37.791, NULL),
(1030, 22, NULL, '2018-07-09', 37.791, NULL),
(1031, 22, NULL, '2018-07-11', 37.7915, NULL),
(1032, 22, NULL, '2018-07-10', 37.791, NULL),
(1033, 22, NULL, '2018-07-12', 37.7915, NULL),
(1034, 22, NULL, '2018-07-14', 39.562, NULL),
(1035, 22, NULL, '2018-07-15', 39.956, NULL),
(1036, 22, NULL, '2018-07-16', 41.005, NULL),
(1037, 22, NULL, '2018-07-17', 45.867, NULL),
(1038, 22, NULL, '2018-07-18', 48.097, NULL),
(1039, 22, NULL, '2018-07-19', 52.061, NULL),
(1040, 22, NULL, '2018-07-20', 55.518, NULL),
(1041, 22, NULL, '2018-07-23', 55.717, NULL),
(1042, 22, NULL, '2018-07-24', 58.701, NULL),
(1043, 22, NULL, '2018-07-25', 62.152, NULL),
(1044, 22, NULL, '2018-07-26', 64.682, NULL),
(1045, 22, NULL, '2018-07-27', 64.682, NULL),
(1046, 22, NULL, '2018-07-29', 66.203, NULL),
(1047, 22, NULL, '2018-07-30', 66.203, NULL),
(1048, 22, NULL, '2018-08-02', 66.203, NULL),
(1049, 22, NULL, '2018-07-31', 66.203, NULL),
(1050, 22, NULL, '2018-08-01', 66.203, NULL),
(1051, 22, NULL, '2018-08-03', 66.351, NULL),
(1052, 22, NULL, '2018-08-06', 71.685, NULL),
(1053, 22, NULL, '2018-08-05', 71.685, NULL),
(1054, 22, NULL, '2018-08-07', 80.292, NULL),
(1055, 22, NULL, '2018-08-08', 83.834, NULL),
(1056, 22, NULL, '2018-08-09', 83.834, NULL),
(1057, 22, NULL, '2018-08-10', 84.587, NULL),
(1058, 22, NULL, '2018-08-12', 87.342, NULL),
(1059, 22, NULL, '2018-08-13', 87.342, NULL),
(1060, 22, NULL, '2018-08-14', 92.611, NULL),
(1061, 22, NULL, '2018-08-15', 95.172, NULL),
(1062, 22, NULL, '2018-08-16', 99.658, NULL),
(1063, 22, NULL, '2018-08-17', 99.658, NULL),
(1064, 22, NULL, '2018-08-21', 106.555, NULL),
(1065, 22, NULL, '2018-08-22', 112.348, NULL),
(1066, 22, NULL, '2018-08-23', 115.558, NULL),
(1067, 22, NULL, '2018-08-24', 118.355, NULL),
(1068, 22, NULL, '2018-08-26', 123.531, NULL),
(1069, 22, NULL, '2018-08-27', 123.845, NULL),
(1070, 22, NULL, '2018-08-28', 123.956, NULL),
(1071, 22, NULL, '2018-08-29', 124.798, NULL),
(1072, 22, NULL, '2018-08-30', 130.795, NULL),
(1073, 22, NULL, '2018-08-31', 135.813, NULL),
(1074, 22, NULL, '2018-09-02', 138.252, NULL),
(1075, 22, NULL, '2018-09-01', 136.986, NULL),
(1076, 22, NULL, '2018-09-03', 143.074, NULL),
(1077, 22, NULL, '2018-09-04', 145.911, NULL),
(1078, 22, NULL, '2018-09-05', 147.785, NULL),
(1079, 22, NULL, '2018-09-06', 148.794, NULL),
(1080, 22, NULL, '2018-09-07', 148.794, NULL),
(1081, 22, NULL, '2018-09-09', 148.794, NULL),
(1082, 22, NULL, '2018-09-10', 150.163, NULL),
(1083, 22, NULL, '2018-09-12', 150.564, NULL),
(1084, 22, NULL, '2018-09-13', 154.062, NULL),
(1085, 22, NULL, '2018-09-19', 157.114, NULL),
(1086, 22, NULL, '2018-09-14', 154.062, NULL),
(1087, 22, NULL, '2018-09-16', 154.175, NULL),
(1088, 22, NULL, '2018-09-17', 154.175, NULL),
(1089, 22, NULL, '2018-09-18', 154.295, NULL),
(1090, 22, NULL, '2018-09-20', 157.114, NULL),
(1091, 22, NULL, '2018-09-25', 158.195, NULL),
(1092, 22, NULL, '2018-09-27', 159.459, NULL),
(1093, 22, NULL, '2018-09-28', 163.355, NULL),
(1094, 22, NULL, '2018-09-30', 165.601, NULL),
(1095, 22, NULL, '2018-10-01', 165.601, NULL),
(1096, 22, NULL, '2018-10-02', 165.601, NULL),
(1097, 22, NULL, '2018-10-03', 166.659, NULL),
(1098, 22, NULL, '2018-10-04', 168.479, NULL),
(1099, 22, NULL, '2018-10-05', 168.479, NULL),
(1100, 22, NULL, '2018-10-07', 169.831, NULL),
(1101, 22, NULL, '2018-10-08', 169.831, NULL),
(1102, 22, NULL, '2018-10-09', 171.412, NULL),
(1103, 22, NULL, '2018-10-10', 173.358, NULL),
(1104, 22, NULL, '2018-10-11', 174.914, NULL),
(1105, 22, NULL, '2018-10-12', 175.839, NULL),
(1106, 22, NULL, '2018-10-15', 177.575, NULL),
(1107, 22, NULL, '2018-10-16', 178.46, NULL),
(1108, 22, NULL, '2018-10-17', 179.336, NULL),
(1109, 22, NULL, '2018-10-19', 179.836, NULL),
(1110, 22, NULL, '2018-10-21', 179.836, NULL),
(1111, 22, NULL, '2018-10-24', 180.994, NULL),
(1112, 22, NULL, '2018-10-28', 183.872, NULL),
(1113, 22, NULL, '2018-10-29', 183.873, NULL),
(1114, 22, NULL, '2018-10-31', 184.952, NULL),
(1115, 22, NULL, '2018-11-01', 184.952, NULL),
(1116, 22, NULL, '2018-11-08', 189.343, NULL),
(1117, 22, NULL, '2018-11-09', 190.265, NULL),
(1118, 22, NULL, '2018-11-14', 190.494, NULL),
(1119, 22, NULL, '2018-11-23', 190.497, NULL),
(1120, 22, NULL, '2018-11-26', 190.498, NULL),
(1121, 22, NULL, '2018-11-28', 191.594, NULL),
(1122, 22, NULL, '2018-11-30', 191.594, NULL),
(1123, 22, NULL, '2018-12-02', 191.984, NULL),
(1124, 22, NULL, '2018-12-03', 191.984, NULL),
(1125, 22, NULL, '2018-12-04', 191.984, NULL),
(1126, 22, NULL, '2018-12-05', 191.987, NULL),
(1127, 22, NULL, '2018-12-06', 191.987, NULL),
(1128, 22, NULL, '2018-12-07', 191.987, NULL),
(1129, 22, NULL, '2018-12-10', 191.988, NULL),
(1130, 22, NULL, '2018-12-11', 191.988, NULL),
(1131, 22, NULL, '2018-12-13', 193.449, NULL),
(1132, 22, NULL, '2018-12-14', 194.12, NULL),
(1133, 22, NULL, '2018-12-17', 195.592, NULL),
(1134, 22, NULL, '2018-12-18', 195.594, NULL),
(1135, 22, NULL, '2018-12-19', 196.102, NULL),
(1136, 22, NULL, '2018-12-20', 196.102, NULL),
(1137, 22, NULL, '2018-12-21', 199.582, NULL),
(1138, 22, NULL, '2018-12-23', 199.584, NULL),
(1139, 22, NULL, '2018-12-24', 199.672, NULL),
(1140, 22, NULL, '2018-12-27', 199.977, NULL),
(1141, 22, NULL, '2018-12-30', 203.799, NULL),
(1142, 24, NULL, '2018-09-30', 0, NULL),
(1143, 24, NULL, '2018-10-01', 9.864, NULL),
(1144, 24, NULL, '2018-10-02', 11.221, NULL),
(1145, 24, NULL, '2018-10-03', 12.178, NULL),
(1146, 24, NULL, '2018-10-04', 13.858, NULL),
(1147, 24, NULL, '2018-10-05', 16.099, NULL),
(1148, 24, NULL, '2018-10-07', 19.781, NULL),
(1149, 24, NULL, '2018-10-08', 21.761, NULL),
(1150, 24, NULL, '2018-10-09', 24.422, NULL),
(1151, 24, NULL, '2018-10-10', 26.79, NULL),
(1152, 24, NULL, '2018-10-11', 28.521, NULL),
(1153, 24, NULL, '2018-10-12', 30.585, NULL),
(1154, 24, NULL, '2018-10-15', 40.705, NULL),
(1155, 24, NULL, '2018-10-16', 40.705, NULL),
(1156, 24, NULL, '2018-10-17', 44.744, NULL),
(1157, 24, NULL, '2018-10-19', 48.397, NULL),
(1158, 24, NULL, '2018-10-21', 53.938, NULL),
(1159, 24, NULL, '2018-10-24', 60.217, NULL),
(1160, 24, NULL, '2018-10-28', 72.262, NULL),
(1161, 24, NULL, '2018-10-29', 75.453, NULL),
(1162, 24, NULL, '2018-10-31', 81.408, NULL),
(1163, 24, NULL, '2018-11-01', 87.875, NULL),
(1164, 24, NULL, '2018-11-08', 105.791, NULL),
(1165, 24, NULL, '2018-11-09', 109.235, NULL),
(1166, 24, NULL, '2018-11-14', 125.986, NULL),
(1167, 24, NULL, '2018-11-23', 147.054, NULL),
(1168, 24, NULL, '2018-11-26', 150.522, NULL),
(1169, 24, NULL, '2018-11-28', 152.03, NULL);
INSERT INTO `wreading` (`wreading`, `wmeter`, `invoice`, `date`, `value`, `remark`) VALUES
(1170, 24, NULL, '2018-11-30', 153.435, NULL),
(1171, 24, NULL, '2018-12-02', 155.835, NULL),
(1172, 24, NULL, '2018-12-03', 156.465, NULL),
(1173, 24, NULL, '2018-12-04', 157.549, NULL),
(1174, 24, NULL, '2018-12-05', 158.121, NULL),
(1175, 24, NULL, '2018-12-06', 158.782, NULL),
(1176, 24, NULL, '2018-12-07', 159.56, NULL),
(1177, 24, NULL, '2018-12-10', 171.103, NULL),
(1178, 24, NULL, '2018-12-11', 171.951, NULL),
(1179, 24, NULL, '2018-12-13', 174.805, NULL),
(1180, 24, NULL, '2018-12-14', 176.986, NULL),
(1181, 24, NULL, '2018-12-17', 183.056, NULL),
(1182, 24, NULL, '2018-12-18', 183.056, NULL),
(1183, 24, NULL, '2018-12-19', 184.888, NULL),
(1184, 24, NULL, '2018-12-20', 184.89, NULL),
(1185, 24, NULL, '2018-12-21', 186.286, NULL),
(1186, 24, NULL, '2018-12-23', 191.258, NULL),
(1187, 24, NULL, '2018-12-24', 192.522, NULL),
(1188, 24, NULL, '2018-12-27', 195.767, NULL),
(1189, 24, NULL, '2018-12-30', 198.518, NULL),
(1190, 21, NULL, '2018-07-11', 0, NULL),
(1191, 21, NULL, '2018-07-14', 18.261, NULL),
(1192, 21, NULL, '2018-07-13', 9.856, NULL),
(1193, 21, NULL, '2018-07-12', 2.193, NULL),
(1194, 21, NULL, '2018-07-15', 26.599, NULL),
(1195, 21, NULL, '2018-07-16', 35.376, NULL),
(1196, 21, NULL, '2018-07-17', 44.84, NULL),
(1197, 21, NULL, '2018-07-18', 54.435, NULL),
(1198, 21, NULL, '2018-07-19', 63.931, NULL),
(1199, 21, NULL, '2018-07-20', 73.219, NULL),
(1200, 21, NULL, '2018-07-23', 101.541, NULL),
(1201, 21, NULL, '2018-07-24', 111.433, NULL),
(1202, 21, NULL, '2018-07-25', 120.806, NULL),
(1203, 21, NULL, '2018-07-26', 121.911, NULL),
(1204, 21, NULL, '2018-07-27', 121.911, NULL),
(1205, 21, NULL, '2018-07-29', 121.911, NULL),
(1206, 21, NULL, '2018-07-30', 121.911, NULL),
(1207, 21, NULL, '2018-07-31', 121.911, NULL),
(1208, 21, NULL, '2018-08-01', 121.911, NULL),
(1209, 21, NULL, '2018-08-02', 121.911, NULL),
(1210, 21, NULL, '2018-08-03', 122.431, NULL),
(1211, 21, NULL, '2018-08-05', 138.527, NULL),
(1212, 21, NULL, '2018-08-06', 138.527, NULL),
(1213, 21, NULL, '2018-08-07', 138.527, NULL),
(1214, 21, NULL, '2018-08-08', 138.527, NULL),
(1215, 21, NULL, '2018-08-09', 138.527, NULL),
(1216, 21, NULL, '2018-08-10', 138.527, NULL),
(1217, 21, NULL, '2018-08-12', 138.527, NULL),
(1218, 21, NULL, '2018-08-13', 138.527, NULL),
(1219, 21, NULL, '2018-08-14', 138.527, NULL),
(1220, 21, NULL, '2018-08-15', 138.527, NULL),
(1221, 21, NULL, '2018-08-16', 149.089, NULL),
(1222, 21, NULL, '2018-08-17', 149.089, NULL),
(1223, 21, NULL, '2018-08-21', 149.089, NULL),
(1224, 21, NULL, '2018-08-22', 149.089, NULL),
(1225, 21, NULL, '2018-08-23', 149.089, NULL),
(1226, 21, NULL, '2018-08-24', 149.089, NULL),
(1227, 21, NULL, '2018-08-26', 149.089, NULL),
(1228, 21, NULL, '2018-08-27', 149.089, NULL),
(1229, 21, NULL, '2018-08-28', 149.089, NULL),
(1230, 21, NULL, '2018-08-29', 149.089, NULL),
(1231, 21, NULL, '2018-08-30', 149.089, NULL),
(1232, 21, NULL, '2018-08-31', 149.089, NULL),
(1233, 21, NULL, '2018-09-02', 149.089, NULL),
(1234, 21, NULL, '2018-09-01', 149.089, NULL),
(1235, 21, NULL, '2018-09-03', 149.089, NULL),
(1236, 21, NULL, '2018-09-04', 149.089, NULL),
(1237, 21, NULL, '2018-09-05', 149.089, NULL),
(1238, 21, NULL, '2018-09-06', 149.277, NULL),
(1239, 21, NULL, '2018-09-07', 149.794, NULL),
(1240, 21, NULL, '2018-09-09', 151.824, NULL),
(1241, 21, NULL, '2018-09-10', 151.824, NULL),
(1242, 21, NULL, '2018-09-12', 156.337, NULL),
(1243, 21, NULL, '2018-09-13', 156.337, NULL),
(1244, 21, NULL, '2018-09-14', 165.142, NULL),
(1245, 21, NULL, '2018-09-16', 173.909, NULL),
(1246, 21, NULL, '2018-09-17', 178.188, NULL),
(1247, 21, NULL, '2018-09-18', 182.615, NULL),
(1248, 21, NULL, '2018-09-19', 190.644, NULL),
(1249, 21, NULL, '2018-09-20', 198.058, NULL),
(1250, 21, NULL, '2018-09-21', 207.048, NULL),
(1251, 21, NULL, '2018-09-23', 221.469, NULL),
(1252, 21, NULL, '2018-09-24', 221.469, NULL),
(1253, 21, NULL, '2018-09-25', 221.469, NULL),
(1254, 21, NULL, '2018-09-26', 221.469, NULL),
(1255, 21, NULL, '2018-09-27', 221.469, NULL),
(1256, 21, NULL, '2018-09-28', 221.469, NULL),
(1257, 21, NULL, '2018-09-30', 221.469, NULL),
(1258, 21, NULL, '2018-10-01', 222.472, NULL),
(1259, 21, NULL, '2018-10-02', 222.472, NULL),
(1260, 21, NULL, '2018-10-03', 227.109, NULL),
(1261, 21, NULL, '2018-10-04', 228.06, NULL),
(1262, 21, NULL, '2018-10-05', 231.448, NULL),
(1263, 21, NULL, '2018-10-07', 231.448, NULL),
(1264, 21, NULL, '2018-10-08', 231.448, NULL),
(1265, 21, NULL, '2018-10-09', 240.384, NULL),
(1266, 21, NULL, '2018-10-10', 240.384, NULL),
(1267, 21, NULL, '2018-10-11', 240.384, NULL),
(1268, 21, NULL, '2018-10-12', 240.384, NULL),
(1269, 21, NULL, '2018-10-15', 240.384, NULL),
(1270, 21, NULL, '2018-10-16', 240.384, NULL),
(1271, 21, NULL, '2018-10-17', 240.384, NULL),
(1272, 21, NULL, '2018-10-19', 240.384, NULL),
(1273, 21, NULL, '2018-10-21', 240.384, NULL),
(1274, 21, NULL, '2018-10-24', 240.384, NULL),
(1275, 21, NULL, '2018-10-28', 240.384, NULL),
(1276, 21, NULL, '2018-10-29', 240.384, NULL),
(1277, 21, NULL, '2018-10-31', 240.384, NULL),
(1278, 21, NULL, '2018-11-08', 240.384, NULL),
(1279, 21, NULL, '2018-11-01', 240.384, NULL),
(1280, 21, NULL, '2018-11-09', 257.5, NULL),
(1281, 21, NULL, '2018-11-14', 257.5, NULL),
(1282, 21, NULL, '2018-11-23', 257.5, NULL),
(1283, 21, NULL, '2018-11-26', 257.5, NULL),
(1284, 21, NULL, '2018-11-28', 257.5, NULL),
(1285, 21, NULL, '2018-11-30', 257.5, NULL),
(1286, 21, NULL, '2018-12-02', 257.5, NULL),
(1287, 21, NULL, '2018-12-03', 257.5, NULL),
(1288, 21, NULL, '2018-12-04', 257.5, NULL),
(1289, 21, NULL, '2018-12-05', 257.5, NULL),
(1290, 21, NULL, '2018-12-06', 257.5, NULL),
(1291, 21, NULL, '2018-12-07', 257.5, NULL),
(1292, 21, NULL, '2018-12-10', 257.5, NULL),
(1293, 21, NULL, '2018-12-11', 257.5, NULL),
(1294, 21, NULL, '2018-12-13', 257.5, NULL),
(1295, 21, NULL, '2018-12-14', 257.5, NULL),
(1296, 21, NULL, '2018-12-17', 257.5, NULL),
(1297, 21, NULL, '2018-12-18', 257.5, NULL),
(1298, 21, NULL, '2018-12-19', 257.5, NULL),
(1299, 21, NULL, '2018-12-20', 257.5, NULL),
(1300, 21, NULL, '2018-12-21', 257.5, NULL),
(1301, 21, NULL, '2018-12-23', 257.5, NULL),
(1302, 21, NULL, '2018-12-24', 257.5, NULL),
(1303, 21, NULL, '2018-12-27', 257.5, NULL),
(1304, 21, NULL, '2018-12-30', 257.5, NULL),
(1305, 23, NULL, '2018-10-01', 0, NULL),
(1306, 23, NULL, '2018-10-02', 0.062, NULL),
(1307, 23, NULL, '2018-10-03', 0.198, NULL),
(1308, 23, NULL, '2018-10-04', 0.316, NULL),
(1309, 23, NULL, '2018-10-05', 0.463, NULL),
(1310, 23, NULL, '2018-10-07', 0.666, NULL),
(1311, 23, NULL, '2018-10-08', 0.71, NULL),
(1312, 23, NULL, '2018-10-09', 0.834, NULL),
(1313, 23, NULL, '2018-10-10', 0.897, NULL),
(1314, 23, NULL, '2018-10-11', 1.016, NULL),
(1315, 23, NULL, '2018-10-12', 1.207, NULL),
(1316, 23, NULL, '2018-10-15', 1.512, NULL),
(1317, 23, NULL, '2018-10-16', 1.572, NULL),
(1318, 23, NULL, '2018-10-17', 1.648, NULL),
(1319, 23, NULL, '2018-10-19', 1.899, NULL),
(1320, 23, NULL, '2018-10-21', 2.183, NULL),
(1321, 23, NULL, '2018-10-24', 2.593, NULL),
(1322, 23, NULL, '2018-10-28', 3.181, NULL),
(1323, 23, NULL, '2018-10-29', 3.309, NULL),
(1324, 23, NULL, '2018-10-31', 3.539, NULL),
(1325, 23, NULL, '2018-11-01', 3.94, NULL),
(1326, 23, NULL, '2018-11-08', 4.425, NULL),
(1327, 23, NULL, '2018-11-09', 4.536, NULL),
(1328, 23, NULL, '2018-11-14', 5.014, NULL),
(1329, 23, NULL, '2018-11-23', 6.07, NULL),
(1330, 23, NULL, '2018-11-26', 6.369, NULL),
(1331, 23, NULL, '2018-11-28', 6.548, NULL),
(1332, 23, NULL, '2018-11-30', 6.78, NULL),
(1333, 23, NULL, '2018-12-02', 7.008, NULL),
(1334, 23, NULL, '2018-12-03', 7.078, NULL),
(1335, 23, NULL, '2018-12-04', 7.203, NULL),
(1336, 23, NULL, '2018-12-05', 7.287, NULL),
(1337, 23, NULL, '2018-12-06', 7.446, NULL),
(1338, 23, NULL, '2018-12-07', 7.588, NULL),
(1339, 23, NULL, '2018-12-10', 7.79, NULL),
(1340, 23, NULL, '2018-12-11', 7.876, NULL),
(1341, 23, NULL, '2018-12-13', 8.047, NULL),
(1342, 23, NULL, '2018-12-14', 8.139, NULL),
(1343, 23, NULL, '2018-12-17', 8.392, NULL),
(1344, 23, NULL, '2018-12-18', 8.549, NULL),
(1345, 23, NULL, '2018-12-19', 8.826, NULL),
(1346, 23, NULL, '2018-12-20', 8.828, NULL),
(1347, 23, NULL, '2018-12-21', 8.857, NULL),
(1348, 23, NULL, '2018-12-23', 9.319, NULL),
(1349, 23, NULL, '2018-12-24', 9.401, NULL),
(1350, 23, NULL, '2018-12-27', 9.609, NULL),
(1351, 23, NULL, '2018-12-30', 9.921, NULL),
(1352, 12, NULL, '2018-05-28', 0, NULL),
(1353, 12, NULL, '2018-05-29', 0, NULL),
(1354, 12, NULL, '2018-05-30', 0, NULL),
(1355, 12, NULL, '2018-05-31', 0, NULL),
(1356, 12, NULL, '2018-06-01', 1, NULL),
(1357, 12, NULL, '2018-06-03', 1, NULL),
(1358, 12, NULL, '2018-06-04', 1, NULL),
(1359, 12, NULL, '2018-06-05', 1, NULL),
(1360, 12, NULL, '2018-06-06', 1, NULL),
(1361, 12, NULL, '2018-06-07', 2, NULL),
(1362, 12, NULL, '2018-06-08', 2, NULL),
(1363, 12, NULL, '2018-06-10', 2, NULL),
(1364, 12, NULL, '2018-06-11', 2, NULL),
(1365, 12, NULL, '2018-06-12', 4, NULL),
(1366, 12, NULL, '2018-06-13', 4, NULL),
(1367, 12, NULL, '2018-06-14', 4, NULL),
(1368, 12, NULL, '2018-06-15', 4, NULL),
(1369, 12, NULL, '2018-06-18', 4, NULL),
(1370, 12, NULL, '2018-06-19', 4, NULL),
(1371, 12, NULL, '2018-06-20', 4, NULL),
(1372, 12, NULL, '2018-06-21', 4, NULL),
(1373, 12, NULL, '2018-06-22', 5, NULL),
(1374, 12, NULL, '2018-06-24', 5, NULL),
(1375, 12, NULL, '2018-06-25', 5, NULL),
(1376, 12, NULL, '2018-06-26', 5, NULL),
(1377, 12, NULL, '2018-06-27', 5, NULL),
(1378, 12, NULL, '2018-06-28', 6, NULL),
(1379, 12, NULL, '2018-06-29', 6, NULL),
(1380, 12, NULL, '2018-06-30', 6, NULL),
(1381, 12, NULL, '2018-07-01', 6, NULL),
(1382, 12, NULL, '2018-07-02', 7, NULL),
(1383, 12, NULL, '2018-07-03', 7, NULL),
(1384, 12, NULL, '2018-07-04', 7, NULL),
(1385, 12, NULL, '2018-07-05', 8, NULL),
(1386, 12, NULL, '2018-07-06', 8, NULL),
(1387, 12, NULL, '2018-07-08', 9, NULL),
(1388, 12, NULL, '2018-07-09', 9, NULL),
(1389, 12, NULL, '2018-07-11', 11, NULL),
(1390, 12, NULL, '2018-07-10', 10, NULL),
(1391, 12, NULL, '2018-07-12', 12, NULL),
(1392, 12, NULL, '2018-07-13', 12, NULL),
(1393, 12, NULL, '2018-07-14', 12, NULL),
(1394, 12, NULL, '2018-07-15', 12, NULL),
(1395, 12, NULL, '2018-07-16', 13, NULL),
(1396, 12, NULL, '2018-07-17', 14, NULL),
(1397, 12, NULL, '2018-07-18', 14, NULL),
(1398, 12, NULL, '2018-07-19', 14, NULL),
(1399, 12, NULL, '2018-07-20', 15, NULL),
(1400, 12, NULL, '2018-07-23', 16, NULL),
(1401, 12, NULL, '2018-07-24', 17, NULL),
(1402, 12, NULL, '2018-07-25', 17, NULL),
(1403, 12, NULL, '2018-07-26', 18, NULL),
(1404, 12, NULL, '2018-07-27', 18, NULL),
(1405, 12, NULL, '2018-07-29', 19, NULL),
(1406, 12, NULL, '2018-07-30', 19, NULL),
(1407, 12, NULL, '2018-07-31', 20, NULL),
(1408, 12, NULL, '2018-08-01', 20, NULL),
(1409, 12, NULL, '2018-08-02', 21, NULL),
(1410, 12, NULL, '2018-08-03', 22, NULL),
(1411, 12, NULL, '2018-08-05', 22, NULL),
(1412, 12, NULL, '2018-08-06', 23, NULL),
(1413, 12, NULL, '2018-08-07', 23, NULL),
(1414, 12, NULL, '2018-08-08', 24, NULL),
(1415, 12, NULL, '2018-08-09', 24, NULL),
(1416, 12, NULL, '2018-08-10', 25, NULL),
(1417, 12, NULL, '2018-08-12', 26, NULL),
(1418, 12, NULL, '2018-08-13', 26, NULL),
(1419, 12, NULL, '2018-08-14', 27, NULL),
(1420, 12, NULL, '2018-08-15', 27, NULL),
(1421, 12, NULL, '2018-08-16', 28, NULL),
(1422, 12, NULL, '2018-08-17', 29, NULL),
(1423, 12, NULL, '2018-08-21', 32, NULL),
(1424, 12, NULL, '2018-08-22', 32, NULL),
(1425, 12, NULL, '2018-08-23', 32, NULL),
(1426, 12, NULL, '2018-08-24', 34, NULL),
(1427, 12, NULL, '2018-08-26', 34, NULL),
(1428, 12, NULL, '2018-08-27', 34, NULL),
(1429, 12, NULL, '2018-08-28', 35, NULL),
(1430, 12, NULL, '2018-08-29', 35, NULL),
(1431, 12, NULL, '2018-08-30', 35, NULL),
(1432, 12, NULL, '2018-08-31', 36, NULL),
(1433, 12, NULL, '2018-09-02', 37, NULL),
(1434, 12, NULL, '2018-09-01', 36, NULL),
(1435, 12, NULL, '2018-09-03', 37, NULL),
(1436, 12, NULL, '2018-09-04', 38, NULL),
(1437, 12, NULL, '2018-09-05', 39, NULL),
(1438, 12, NULL, '2018-09-06', 39, NULL),
(1439, 12, NULL, '2018-09-07', 40, NULL),
(1440, 12, NULL, '2018-09-09', 41, NULL),
(1441, 12, NULL, '2018-09-10', 41, NULL),
(1442, 12, NULL, '2018-09-12', 43, NULL),
(1443, 12, NULL, '2018-09-13', 43, NULL),
(1444, 12, NULL, '2018-09-14', 44, NULL),
(1445, 12, NULL, '2018-09-16', 44, NULL),
(1446, 12, NULL, '2018-09-17', 45, NULL),
(1447, 12, NULL, '2018-09-18', 45, NULL),
(1448, 12, NULL, '2018-09-19', 46, NULL),
(1449, 12, NULL, '2018-09-20', 46, NULL),
(1450, 12, NULL, '2018-09-21', 47, NULL),
(1451, 12, NULL, '2018-09-23', 47, NULL),
(1452, 12, NULL, '2018-09-24', 48, NULL),
(1453, 12, NULL, '2018-09-25', 48, NULL),
(1454, 12, NULL, '2018-09-26', 49, NULL),
(1455, 12, NULL, '2018-09-27', 50, NULL),
(1456, 12, NULL, '2018-09-28', 50, NULL),
(1457, 12, NULL, '2018-09-30', 51, NULL),
(1458, 12, NULL, '2018-10-01', 51, NULL),
(1459, 12, NULL, '2018-10-02', 52, NULL),
(1460, 12, NULL, '2018-10-04', 53, NULL),
(1461, 12, NULL, '2018-10-03', 52, NULL),
(1462, 12, NULL, '2018-10-05', 54, NULL),
(1463, 12, NULL, '2018-10-07', 55, NULL),
(1464, 12, NULL, '2018-10-08', 55, NULL),
(1465, 12, NULL, '2018-10-09', 55, NULL),
(1466, 12, NULL, '2018-10-10', 55, NULL),
(1467, 12, NULL, '2018-10-11', 56, NULL),
(1468, 12, NULL, '2018-10-12', 56, NULL),
(1469, 12, NULL, '2018-10-16', 57, NULL),
(1470, 12, NULL, '2018-10-17', 57, NULL),
(1471, 12, NULL, '2018-10-19', 58, NULL),
(1472, 12, NULL, '2018-10-21', 59, NULL),
(1473, 12, NULL, '2018-10-24', 60, NULL),
(1474, 12, NULL, '2018-10-28', 61, NULL),
(1475, 12, NULL, '2018-10-29', 61, NULL),
(1476, 12, NULL, '2018-10-31', 63, NULL),
(1477, 12, NULL, '2018-11-08', 68, NULL),
(1478, 12, NULL, '2018-11-09', 68, NULL),
(1479, 12, NULL, '2018-11-14', 70, NULL),
(1480, 12, NULL, '2018-11-23', 75, NULL),
(1481, 12, NULL, '2018-11-26', 76, NULL),
(1482, 12, NULL, '2018-11-28', 78, NULL),
(1483, 12, NULL, '2018-11-30', 78, NULL),
(1484, 12, NULL, '2018-12-02', 79, NULL),
(1485, 12, NULL, '2018-12-03', 80, NULL),
(1486, 12, NULL, '2018-12-04', 81, NULL),
(1487, 12, NULL, '2018-12-05', 81, NULL),
(1488, 12, NULL, '2018-12-06', 81, NULL),
(1489, 12, NULL, '2018-12-07', 81, NULL),
(1490, 12, NULL, '2018-12-10', 81, NULL),
(1491, 12, NULL, '2018-12-11', 81, NULL),
(1492, 12, NULL, '2018-12-13', 82, NULL),
(1493, 12, NULL, '2018-12-14', 83, NULL),
(1494, 12, NULL, '2018-12-17', 84, NULL),
(1495, 12, NULL, '2018-12-18', 85, NULL),
(1496, 12, NULL, '2018-12-19', 85, NULL),
(1497, 12, NULL, '2018-12-20', 86, NULL),
(1498, 12, NULL, '2018-12-21', 87, NULL),
(1499, 12, NULL, '2018-12-23', 88, NULL),
(1500, 12, NULL, '2018-12-24', 88, NULL),
(1501, 12, NULL, '2018-12-27', 89, NULL),
(1502, 12, NULL, '2018-12-30', 90, NULL),
(1503, 13, NULL, '2018-05-28', 0, NULL),
(1504, 13, NULL, '2018-05-29', 0, NULL),
(1505, 13, NULL, '2018-05-30', 0, NULL),
(1506, 13, NULL, '2018-05-31', 0, NULL),
(1507, 13, NULL, '2018-06-01', 0, NULL),
(1508, 13, NULL, '2018-06-03', 0, NULL),
(1509, 13, NULL, '2018-06-04', 0, NULL),
(1510, 13, NULL, '2018-06-05', 0, NULL),
(1511, 13, NULL, '2018-06-06', 2, NULL),
(1512, 13, NULL, '2018-06-07', 2, NULL),
(1513, 13, NULL, '2018-06-08', 3, NULL),
(1514, 13, NULL, '2018-06-10', 4, NULL),
(1515, 13, NULL, '2018-06-11', 5, NULL),
(1516, 13, NULL, '2018-06-12', 6, NULL),
(1517, 13, NULL, '2018-06-13', 7, NULL),
(1518, 13, NULL, '2018-06-14', 8, NULL),
(1519, 13, NULL, '2018-06-15', 8, NULL),
(1520, 13, NULL, '2018-06-18', 12, NULL),
(1521, 13, NULL, '2018-06-19', 13, NULL),
(1522, 13, NULL, '2018-06-20', 14, NULL),
(1523, 13, NULL, '2018-06-21', 15, NULL),
(1524, 13, NULL, '2018-06-22', 15, NULL),
(1525, 13, NULL, '2018-06-24', 21, NULL),
(1526, 13, NULL, '2018-06-25', 21, NULL),
(1527, 13, NULL, '2018-06-26', 24, NULL),
(1528, 13, NULL, '2018-06-27', 24, NULL),
(1529, 13, NULL, '2018-06-28', 25, NULL),
(1530, 13, NULL, '2018-06-29', 26, NULL),
(1531, 13, NULL, '2018-06-30', 26, NULL),
(1532, 13, NULL, '2018-07-01', 26, NULL),
(1533, 13, NULL, '2018-07-02', 26, NULL),
(1534, 13, NULL, '2018-07-03', 28, NULL),
(1535, 13, NULL, '2018-07-05', 28, NULL),
(1536, 13, NULL, '2018-07-06', 28, NULL),
(1537, 13, NULL, '2018-07-08', 32, NULL),
(1538, 13, NULL, '2018-07-09', 33, NULL),
(1539, 13, NULL, '2018-07-11', 36, NULL),
(1540, 13, NULL, '2018-07-10', 34, NULL),
(1541, 13, NULL, '2018-07-12', 37, NULL),
(1542, 13, NULL, '2018-07-13', 38, NULL),
(1543, 13, NULL, '2018-07-14', 41, NULL),
(1544, 13, NULL, '2018-07-15', 41, NULL),
(1545, 13, NULL, '2018-07-16', 41, NULL),
(1546, 13, NULL, '2018-07-17', 43, NULL),
(1547, 13, NULL, '2018-07-18', 44, NULL),
(1548, 13, NULL, '2018-07-19', 44, NULL),
(1549, 13, NULL, '2018-07-20', 45, NULL),
(1550, 13, NULL, '2018-07-23', 45, NULL),
(1551, 13, NULL, '2018-07-24', 46, NULL),
(1552, 13, NULL, '2018-07-25', 46, NULL),
(1553, 13, NULL, '2018-07-26', 46, NULL),
(1554, 13, NULL, '2018-07-27', 46, NULL),
(1555, 13, NULL, '2018-07-29', 48, NULL),
(1556, 13, NULL, '2018-07-30', 49, NULL),
(1557, 13, NULL, '2018-07-31', 49, NULL),
(1558, 13, NULL, '2018-08-01', 49, NULL),
(1559, 13, NULL, '2018-08-02', 49, NULL),
(1560, 13, NULL, '2018-08-03', 49, NULL),
(1561, 13, NULL, '2018-08-05', 51, NULL),
(1562, 13, NULL, '2018-08-06', 52, NULL),
(1563, 13, NULL, '2018-08-07', 53, NULL),
(1564, 13, NULL, '2018-08-08', 55, NULL),
(1565, 13, NULL, '2018-08-09', 55, NULL),
(1566, 13, NULL, '2018-08-10', 57, NULL),
(1567, 13, NULL, '2018-08-12', 57, NULL),
(1568, 13, NULL, '2018-08-13', 58, NULL),
(1569, 13, NULL, '2018-08-14', 58, NULL),
(1570, 13, NULL, '2018-08-15', 58, NULL),
(1571, 13, NULL, '2018-08-16', 58, NULL),
(1572, 13, NULL, '2018-08-17', 58, NULL),
(1573, 13, NULL, '2018-08-21', 59, NULL),
(1574, 13, NULL, '2018-08-22', 59, NULL),
(1575, 13, NULL, '2018-08-23', 60, NULL),
(1576, 13, NULL, '2018-08-24', 60, NULL),
(1577, 13, NULL, '2018-08-26', 60, NULL),
(1578, 13, NULL, '2018-08-27', 61, NULL),
(1579, 13, NULL, '2018-08-28', 61, NULL),
(1580, 13, NULL, '2018-08-29', 61, NULL),
(1581, 13, NULL, '2018-08-31', 61, NULL),
(1582, 13, NULL, '2018-09-02', 67, NULL),
(1583, 13, NULL, '2018-09-01', 64, NULL),
(1584, 13, NULL, '2018-09-03', 68, NULL),
(1585, 13, NULL, '2018-09-04', 68, NULL),
(1586, 13, NULL, '2018-09-05', 68, NULL),
(1587, 13, NULL, '2018-09-06', 68, NULL),
(1588, 13, NULL, '2018-09-07', 69, NULL),
(1589, 13, NULL, '2018-09-09', 69, NULL),
(1590, 13, NULL, '2018-09-10', 69, NULL),
(1591, 13, NULL, '2018-09-12', 69, NULL),
(1592, 13, NULL, '2018-09-13', 69, NULL),
(1593, 13, NULL, '2018-09-14', 69, NULL),
(1594, 13, NULL, '2018-09-16', 69, NULL),
(1595, 13, NULL, '2018-09-17', 69, NULL),
(1596, 13, NULL, '2018-09-18', 69, NULL),
(1597, 13, NULL, '2018-09-19', 69, NULL),
(1598, 13, NULL, '2018-09-20', 69, NULL),
(1599, 13, NULL, '2018-09-21', 69, NULL),
(1600, 13, NULL, '2018-09-23', 69, NULL),
(1601, 13, NULL, '2018-09-24', 70, NULL),
(1602, 13, NULL, '2018-09-25', 70, NULL),
(1603, 13, NULL, '2018-09-26', 70, NULL),
(1604, 13, NULL, '2018-09-27', 70, NULL),
(1605, 13, NULL, '2018-09-28', 70, NULL),
(1606, 13, NULL, '2018-09-30', 71, NULL),
(1607, 13, NULL, '2018-10-01', 71, NULL),
(1608, 13, NULL, '2018-10-02', 71, NULL),
(1609, 13, NULL, '2018-10-03', 72, NULL),
(1610, 13, NULL, '2018-10-04', 72, NULL),
(1611, 13, NULL, '2018-10-05', 72, NULL),
(1612, 13, NULL, '2018-10-07', 73, NULL),
(1613, 13, NULL, '2018-10-08', 73, NULL),
(1614, 13, NULL, '2018-10-09', 74, NULL),
(1615, 13, NULL, '2018-10-10', 74, NULL),
(1616, 13, NULL, '2018-10-11', 74, NULL),
(1617, 13, NULL, '2018-10-12', 74, NULL),
(1618, 13, NULL, '2018-10-15', 74, NULL),
(1619, 13, NULL, '2018-10-16', 75, NULL),
(1620, 13, NULL, '2018-10-17', 76, NULL),
(1621, 13, NULL, '2018-10-19', 76, NULL),
(1622, 13, NULL, '2018-10-21', 77, NULL),
(1623, 13, NULL, '2018-10-24', 77, NULL),
(1624, 13, NULL, '2018-10-29', 79, NULL),
(1625, 13, NULL, '2018-10-31', 80, NULL),
(1626, 13, NULL, '2018-11-08', 83, NULL),
(1627, 13, NULL, '2018-11-09', 83, NULL),
(1628, 13, NULL, '2018-11-14', 84, NULL),
(1629, 13, NULL, '2018-11-23', 88, NULL),
(1630, 13, NULL, '2018-11-26', 89, NULL),
(1631, 13, NULL, '2018-11-28', 90, NULL),
(1632, 13, NULL, '2018-11-30', 92, NULL),
(1633, 13, NULL, '2018-12-02', 93, NULL),
(1634, 13, NULL, '2018-12-03', 94, NULL),
(1635, 13, NULL, '2018-12-04', 95, NULL),
(1636, 13, NULL, '2018-12-05', 95, NULL),
(1637, 13, NULL, '2018-12-06', 95, NULL),
(1638, 13, NULL, '2018-12-07', 95, NULL),
(1639, 13, NULL, '2018-12-10', 95, NULL),
(1640, 13, NULL, '2018-12-11', 95, NULL),
(1641, 13, NULL, '2018-12-13', 96, NULL),
(1642, 13, NULL, '2018-12-14', 98, NULL),
(1643, 13, NULL, '2018-12-17', 99, NULL),
(1644, 13, NULL, '2018-12-18', 101, NULL),
(1645, 13, NULL, '2018-12-19', 101, NULL),
(1646, 13, NULL, '2018-12-20', 101, NULL),
(1647, 13, NULL, '2018-12-21', 102, NULL),
(1648, 13, NULL, '2018-12-23', 103, NULL),
(1649, 13, NULL, '2018-12-24', 103, NULL),
(1650, 13, NULL, '2018-12-27', 104, NULL),
(1651, 13, NULL, '2018-12-30', 105, NULL),
(1652, 9, NULL, '2018-04-30', 152, NULL),
(1653, 9, NULL, '2018-05-01', 24.303, NULL),
(1654, 9, NULL, '2018-05-02', 24.4, NULL),
(1655, 9, NULL, '2018-05-03', 24.468, NULL),
(1656, 9, NULL, '2018-05-04', 24.579, NULL),
(1657, 9, NULL, '2018-05-07', 24.924, NULL),
(1658, 9, NULL, '2018-05-08', 24.97, NULL),
(1659, 9, NULL, '2018-05-09', 25.055, NULL),
(1660, 9, NULL, '2018-05-11', 25.429, NULL),
(1661, 9, NULL, '2018-05-10', 25.29, NULL),
(1662, 9, NULL, '2018-05-14', 25.429, NULL),
(1663, 9, NULL, '2018-05-15', 25.823, NULL),
(1664, 9, NULL, '2018-05-16', 25.91, NULL),
(1665, 9, NULL, '2018-05-17', 26.034, NULL),
(1666, 9, NULL, '2018-05-18', 26.116, NULL),
(1667, 9, NULL, '2018-05-21', 26.544, NULL),
(1668, 9, NULL, '2018-05-22', 26.544, NULL),
(1669, 9, NULL, '2018-05-23', 26.88, NULL),
(1670, 9, NULL, '2018-05-24', 26.809, NULL),
(1671, 9, NULL, '2018-05-25', 27.051, NULL),
(1672, 9, NULL, '2018-05-28', 27.634, NULL),
(1673, 9, NULL, '2018-05-29', 27.788, NULL),
(1674, 9, NULL, '2018-05-30', 27.882, NULL),
(1675, 9, NULL, '2018-05-31', 27.882, NULL),
(1676, 9, NULL, '2018-06-01', 28.138, NULL),
(1677, 9, NULL, '2018-06-03', 28.313, NULL),
(1678, 9, NULL, '2018-06-04', 28.436, NULL),
(1679, 9, NULL, '2018-06-05', 28.52, NULL),
(1680, 9, NULL, '2018-06-06', 28.587, NULL),
(1681, 9, NULL, '2018-06-07', 28.728, NULL),
(1682, 9, NULL, '2018-06-08', 28.758, NULL),
(1683, 9, NULL, '2018-06-10', 28.758, NULL),
(1684, 9, NULL, '2018-06-11', 29.038, NULL),
(1685, 9, NULL, '2018-06-12', 29.081, NULL),
(1686, 9, NULL, '2018-06-13', 29.179, NULL),
(1687, 9, NULL, '2018-06-14', 29.288, NULL),
(1688, 9, NULL, '2018-06-15', 29.426, NULL),
(1689, 9, NULL, '2018-06-18', 29.764, NULL),
(1690, 9, NULL, '2018-06-19', 29.861, NULL),
(1691, 9, NULL, '2018-06-20', 29.958, NULL),
(1692, 9, NULL, '2018-06-21', 30.14, NULL),
(1693, 9, NULL, '2018-06-22', 30.208, NULL),
(1694, 9, NULL, '2018-06-24', 30.208, NULL),
(1695, 9, NULL, '2018-06-25', 30.484, NULL),
(1696, 9, NULL, '2018-06-26', 30.562, NULL),
(1697, 9, NULL, '2018-06-27', 30.672, NULL),
(1698, 9, NULL, '2018-06-28', 30.849, NULL),
(1699, 9, NULL, '2018-06-29', 30.886, NULL),
(1700, 9, NULL, '2018-06-30', 30.976, NULL),
(1701, 9, NULL, '2018-07-01', 31.093, NULL),
(1702, 9, NULL, '2018-07-02', 31.189, NULL),
(1703, 9, NULL, '2018-07-03', 31.216, NULL),
(1704, 9, NULL, '2018-07-04', 31.397, NULL),
(1705, 9, NULL, '2018-07-05', 31.451, NULL),
(1706, 9, NULL, '2018-07-06', 31.621, NULL),
(1707, 9, NULL, '2018-07-08', 31.799, NULL),
(1708, 9, NULL, '2018-07-09', 31.901, NULL),
(1709, 9, NULL, '2018-07-11', 32.0546, NULL),
(1710, 9, NULL, '2018-07-10', 31.973, NULL),
(1711, 9, NULL, '2018-07-12', 32.182, NULL),
(1712, 9, NULL, '2018-07-13', 32.329, NULL),
(1713, 9, NULL, '2018-07-14', 32.431, NULL),
(1714, 9, NULL, '2018-07-15', 32.535, NULL),
(1715, 9, NULL, '2018-07-16', 32.629, NULL),
(1716, 9, NULL, '2018-07-17', 32.721, NULL),
(1717, 9, NULL, '2018-07-18', 32.802, NULL),
(1718, 9, NULL, '2018-07-19', 32.988, NULL),
(1719, 9, NULL, '2018-07-20', 33.034, NULL),
(1720, 9, NULL, '2018-07-23', 33.308, NULL),
(1721, 9, NULL, '2018-07-24', 33.368, NULL),
(1722, 9, NULL, '2018-07-25', 33.438, NULL),
(1723, 9, NULL, '2018-07-26', 33.509, NULL),
(1724, 9, NULL, '2018-07-29', 33.823, NULL),
(1725, 9, NULL, '2018-07-30', 33.969, NULL),
(1726, 9, NULL, '2018-07-31', 34.077, NULL),
(1727, 9, NULL, '2018-08-01', 34.156, NULL),
(1728, 9, NULL, '2018-08-02', 34.294, NULL),
(1729, 9, NULL, '2018-08-03', 34.397, NULL),
(1730, 9, NULL, '2018-08-05', 34.645, NULL),
(1731, 9, NULL, '2018-08-07', 35.031, NULL),
(1732, 9, NULL, '2018-08-08', 35.16, NULL),
(1733, 9, NULL, '2018-08-09', 35.223, NULL),
(1734, 9, NULL, '2018-08-10', 35.446, NULL),
(1735, 9, NULL, '2018-08-12', 35.686, NULL),
(1736, 9, NULL, '2018-08-13', 35.777, NULL),
(1737, 9, NULL, '2018-08-14', 35.876, NULL),
(1738, 9, NULL, '2018-08-15', 35.991, NULL),
(1739, 9, NULL, '2018-08-16', 36.168, NULL),
(1740, 9, NULL, '2018-08-17', 36.247, NULL),
(1741, 9, NULL, '2018-08-21', 36.721, NULL),
(1742, 9, NULL, '2018-08-22', 36.851, NULL),
(1743, 9, NULL, '2018-08-23', 36.915, NULL),
(1744, 9, NULL, '2018-08-24', 37.084, NULL),
(1745, 9, NULL, '2018-08-26', 37.247, NULL),
(1746, 9, NULL, '2018-08-27', 37.432, NULL),
(1747, 9, NULL, '2018-08-28', 37.532, NULL),
(1748, 9, NULL, '2018-08-29', 37.556, NULL),
(1749, 9, NULL, '2018-08-30', 37.575, NULL),
(1750, 9, NULL, '2018-09-02', 37.866, NULL),
(1751, 9, NULL, '2018-09-01', 37.676, NULL),
(1752, 9, NULL, '2018-09-03', 37.974, NULL),
(1753, 9, NULL, '2018-09-04', 38.081, NULL),
(1754, 9, NULL, '2018-09-05', 38.173, NULL),
(1755, 9, NULL, '2018-09-06', 38.308, NULL),
(1756, 9, NULL, '2018-09-07', 38.582, NULL),
(1757, 9, NULL, '2018-09-09', 38.861, NULL),
(1758, 9, NULL, '2018-09-10', 38.93, NULL),
(1759, 9, NULL, '2018-09-12', 39.089, NULL),
(1760, 9, NULL, '2018-09-13', 39.162, NULL),
(1761, 9, NULL, '2018-09-14', 39.267, NULL),
(1762, 9, NULL, '2018-09-16', 39.459, NULL),
(1763, 9, NULL, '2018-09-17', 39.497, NULL),
(1764, 9, NULL, '2018-09-18', 39.555, NULL),
(1765, 9, NULL, '2018-09-19', 39.614, NULL),
(1766, 9, NULL, '2018-09-20', 39.7, NULL),
(1767, 9, NULL, '2018-09-21', 39.816, NULL),
(1768, 9, NULL, '2018-09-23', 40.038, NULL),
(1769, 9, NULL, '2018-09-24', 40.162, NULL),
(1770, 9, NULL, '2018-09-25', 40.43, NULL),
(1771, 9, NULL, '2018-09-26', 44.827, NULL),
(1772, 9, NULL, '2018-09-27', 44.939, NULL),
(1773, 9, NULL, '2018-09-28', 45.095, NULL),
(1774, 9, NULL, '2018-09-30', 45.387, NULL),
(1775, 9, NULL, '2018-10-01', 45.387, NULL),
(1776, 9, NULL, '2018-10-02', 45.449, NULL),
(1777, 9, NULL, '2018-10-03', 45.647, NULL),
(1778, 9, NULL, '2018-10-04', 45.963, NULL),
(1779, 9, NULL, '2018-10-05', 46.11, NULL),
(1780, 2, NULL, '2018-05-28', 110, NULL),
(1781, 2, NULL, '2018-05-29', 112, NULL),
(1782, 2, NULL, '2018-05-30', 114, NULL),
(1783, 2, NULL, '2018-05-31', 118, NULL),
(1784, 2, NULL, '2018-06-01', 122, NULL),
(1785, 2, NULL, '2018-06-03', 122, NULL),
(1786, 2, NULL, '2018-06-04', 123, NULL),
(1787, 2, NULL, '2018-06-05', 123, NULL),
(1788, 2, NULL, '2018-06-06', 123, NULL),
(1789, 2, NULL, '2018-06-07', 125, NULL),
(1790, 2, NULL, '2018-06-08', 10, NULL),
(1791, 2, NULL, '2018-06-10', 12, NULL),
(1792, 2, NULL, '2018-06-11', 13, NULL),
(1793, 2, NULL, '2018-06-12', 15, NULL),
(1794, 2, NULL, '2018-06-13', 15, NULL),
(1795, 2, NULL, '2018-06-14', 15, NULL),
(1796, 2, NULL, '2018-06-15', 15, NULL),
(1797, 2, NULL, '2018-06-18', 18, NULL),
(1798, 2, NULL, '2018-06-19', 19, NULL),
(1799, 2, NULL, '2018-06-20', 19, NULL),
(1800, 2, NULL, '2018-06-21', 20, NULL),
(1801, 2, NULL, '2018-06-22', 21, NULL),
(1802, 2, NULL, '2018-06-24', 23, NULL),
(1803, 2, NULL, '2018-06-25', 24, NULL),
(1804, 2, NULL, '2018-06-26', 25, NULL),
(1805, 2, NULL, '2018-06-27', 25, NULL),
(1806, 2, NULL, '2018-06-28', 26, NULL),
(1807, 2, NULL, '2018-06-29', 27, NULL),
(1808, 2, NULL, '2018-06-30', 27, NULL),
(1809, 2, NULL, '2018-07-01', 29, NULL),
(1810, 2, NULL, '2018-07-02', 29, NULL),
(1811, 2, NULL, '2018-07-03', 31, NULL),
(1812, 2, NULL, '2018-07-04', 31, NULL),
(1813, 2, NULL, '2018-07-05', 32, NULL),
(1814, 2, NULL, '2018-07-06', 33, NULL),
(1815, 2, NULL, '2018-07-08', 35, NULL),
(1816, 2, NULL, '2018-07-09', 36, NULL),
(1817, 2, NULL, '2018-07-11', 37, NULL),
(1818, 2, NULL, '2018-07-10', 36, NULL),
(1819, 2, NULL, '2018-07-12', 37, NULL),
(1820, 2, NULL, '2018-07-13', 37, NULL),
(1821, 2, NULL, '2018-07-14', 38, NULL),
(1822, 2, NULL, '2018-07-15', 38, NULL),
(1823, 2, NULL, '2018-07-16', 39, NULL),
(1824, 2, NULL, '2018-07-17', 41, NULL),
(1825, 2, NULL, '2018-07-18', 41, NULL),
(1826, 2, NULL, '2018-07-19', 42, NULL),
(1827, 2, NULL, '2018-07-20', 43, NULL),
(1828, 2, NULL, '2018-07-23', 45, NULL),
(1829, 2, NULL, '2018-07-24', 46, NULL),
(1830, 2, NULL, '2018-07-25', 47, NULL),
(1831, 2, NULL, '2018-07-29', 50, NULL),
(1832, 2, NULL, '2018-07-30', 51, NULL),
(1833, 2, NULL, '2018-07-31', 51, NULL),
(1834, 2, NULL, '2018-08-01', 52, NULL),
(1835, 2, NULL, '2018-08-02', 53, NULL),
(1836, 2, NULL, '2018-08-03', 53, NULL),
(1837, 2, NULL, '2018-08-05', 54, NULL),
(1838, 2, NULL, '2018-08-06', 55, NULL),
(1839, 2, NULL, '2018-08-07', 56, NULL),
(1840, 2, NULL, '2018-08-08', 56, NULL),
(1841, 2, NULL, '2018-08-09', 57, NULL),
(1842, 2, NULL, '2018-08-10', 57, NULL),
(1843, 2, NULL, '2018-08-12', 58, NULL),
(1844, 2, NULL, '2018-08-13', 59, NULL),
(1845, 2, NULL, '2018-08-14', 60, NULL),
(1846, 2, NULL, '2018-08-15', 60, NULL),
(1847, 2, NULL, '2018-08-16', 61, NULL),
(1848, 2, NULL, '2018-08-17', 61, NULL),
(1849, 2, NULL, '2018-08-21', 64, NULL),
(1850, 2, NULL, '2018-08-22', 64, NULL),
(1851, 2, NULL, '2018-08-23', 64, NULL),
(1852, 2, NULL, '2018-08-24', 65, NULL),
(1853, 2, NULL, '2018-08-26', 66, NULL),
(1854, 2, NULL, '2018-08-27', 67, NULL),
(1855, 2, NULL, '2018-08-28', 67, NULL),
(1856, 2, NULL, '2018-08-29', 67, NULL),
(1857, 2, NULL, '2018-09-02', 70, NULL),
(1858, 2, NULL, '2018-09-01', 69, NULL),
(1859, 2, NULL, '2018-09-03', 70, NULL),
(1860, 2, NULL, '2018-09-04', 71, NULL),
(1861, 2, NULL, '2018-09-05', 71, NULL),
(1862, 2, NULL, '2018-09-06', 71, NULL),
(1863, 2, NULL, '2018-09-07', 72, NULL),
(1864, 2, NULL, '2018-09-09', 73, NULL),
(1865, 2, NULL, '2018-09-10', 73, NULL),
(1866, 2, NULL, '2018-09-12', 75, NULL),
(1867, 2, NULL, '2018-09-13', 76, NULL),
(1868, 2, NULL, '2018-09-14', 77, NULL),
(1869, 2, NULL, '2018-09-16', 78, NULL),
(1870, 2, NULL, '2018-09-17', 79, NULL),
(1871, 2, NULL, '2018-09-18', 79, NULL),
(1872, 2, NULL, '2018-09-19', 80, NULL),
(1873, 2, NULL, '2018-09-20', 80, NULL),
(1874, 2, NULL, '2018-09-21', 81, NULL),
(1875, 2, NULL, '2018-09-23', 82, NULL),
(1876, 2, NULL, '2018-09-24', 83, NULL),
(1877, 2, NULL, '2018-09-25', 83, NULL),
(1878, 2, NULL, '2018-09-26', 84, NULL),
(1879, 2, NULL, '2018-09-27', 84, NULL),
(1880, 2, NULL, '2018-09-28', 84, NULL),
(1881, 2, NULL, '2018-09-30', 87, NULL),
(1882, 2, NULL, '2018-10-01', 87, NULL),
(1883, 2, NULL, '2018-10-02', 87, NULL),
(1884, 2, NULL, '2018-10-03', 88, NULL),
(1885, 2, NULL, '2018-10-04', 88, NULL),
(1886, 2, NULL, '2018-10-05', 89, NULL),
(1887, 2, NULL, '2018-10-10', 94, NULL),
(1888, 2, NULL, '2018-10-11', 94, NULL),
(1889, 2, NULL, '2018-10-12', 95, NULL),
(1890, 2, NULL, '2018-10-15', 97, NULL),
(1891, 2, NULL, '2018-10-16', 97, NULL),
(1892, 2, NULL, '2018-10-17', 98, NULL),
(1893, 2, NULL, '2018-10-19', 99, NULL),
(1894, 2, NULL, '2018-10-21', 101, NULL),
(1895, 2, NULL, '2018-10-24', 103, NULL),
(1896, 2, NULL, '2018-10-28', 105, NULL),
(1897, 2, NULL, '2018-10-29', 105, NULL),
(1898, 2, NULL, '2018-10-31', 105, NULL),
(1899, 2, NULL, '2018-11-08', 112, NULL),
(1900, 2, NULL, '2018-11-09', 112, NULL),
(1901, 2, NULL, '2018-11-14', 114, NULL),
(1902, 2, NULL, '2018-11-23', 121, NULL),
(1903, 2, NULL, '2018-11-26', 122, NULL),
(1904, 2, NULL, '2018-11-28', 123, NULL),
(1905, 2, NULL, '2018-11-30', 123, NULL),
(1906, 2, NULL, '2018-12-02', 123, NULL),
(1907, 2, NULL, '2018-12-03', 124, NULL),
(1908, 2, NULL, '2018-12-04', 125, NULL),
(1909, 2, NULL, '2018-12-05', 126, NULL),
(1910, 2, NULL, '2018-12-06', 126, NULL),
(1911, 2, NULL, '2018-12-07', 126, NULL),
(1912, 2, NULL, '2018-12-10', 128, NULL),
(1913, 2, NULL, '2018-12-11', 129, NULL),
(1914, 2, NULL, '2018-12-13', 130, NULL),
(1915, 2, NULL, '2018-12-14', 131, NULL),
(1916, 2, NULL, '2018-12-17', 133, NULL),
(1917, 2, NULL, '2018-12-18', 134, NULL),
(1918, 2, NULL, '2018-12-19', 135, NULL),
(1919, 2, NULL, '2018-12-20', 135, NULL),
(1920, 2, NULL, '2018-12-21', 137, NULL),
(1921, 2, NULL, '2018-12-23', 138, NULL),
(1922, 2, NULL, '2018-12-24', 139, NULL),
(1923, 2, NULL, '2018-12-27', 140, NULL),
(1924, 2, NULL, '2018-12-30', 142, NULL),
(1925, 10, NULL, '2018-05-29', 437.666, NULL),
(1926, 10, NULL, '2018-05-30', 438.59, NULL),
(1927, 10, NULL, '2018-05-31', 438.59, NULL),
(1928, 10, NULL, '2018-06-01', 440.83, NULL),
(1929, 10, NULL, '2018-06-03', 443.463, NULL),
(1930, 10, NULL, '2018-06-04', 446.691, NULL),
(1931, 10, NULL, '2018-06-05', 448.669, NULL),
(1932, 10, NULL, '2018-06-06', 450.1, NULL),
(1933, 10, NULL, '2018-06-07', 451.144, NULL),
(1934, 10, NULL, '2018-06-08', 452.392, NULL),
(1935, 10, NULL, '2018-06-10', 454.56, NULL),
(1936, 10, NULL, '2018-06-11', 459.912, NULL),
(1937, 10, NULL, '2018-06-12', 461.073, NULL),
(1938, 10, NULL, '2018-06-13', 462.345, NULL),
(1939, 10, NULL, '2018-06-14', 463.443, NULL),
(1940, 10, NULL, '2018-06-15', 464.306, NULL),
(1941, 10, NULL, '2018-06-18', 465.759, NULL),
(1942, 10, NULL, '2018-06-19', 467.145, NULL),
(1943, 10, NULL, '2018-06-20', 468.388, NULL),
(1944, 10, NULL, '2018-06-21', 469.406, NULL),
(1945, 10, NULL, '2018-06-22', 470.876, NULL),
(1946, 10, NULL, '2018-06-24', 478.401, NULL),
(1947, 10, NULL, '2018-06-25', 479.502, NULL),
(1948, 10, NULL, '2018-06-26', 483.15, NULL),
(1949, 10, NULL, '2018-06-27', 484, NULL),
(1950, 10, NULL, '2018-06-28', 485.776, NULL),
(1951, 10, NULL, '2018-06-29', 486.54, NULL),
(1952, 10, NULL, '2018-06-30', 486.915, NULL),
(1953, 10, NULL, '2018-07-01', 488.412, NULL),
(1954, 10, NULL, '2018-07-02', 488.433, NULL),
(1955, 10, NULL, '2018-07-03', 488.727, NULL),
(1956, 10, NULL, '2018-07-04', 489.116, NULL),
(1957, 10, NULL, '2018-07-05', 489.781, NULL),
(1958, 10, NULL, '2018-07-06', 491.318, NULL),
(1959, 10, NULL, '2018-07-08', 495.192, NULL),
(1960, 10, NULL, '2018-07-09', 495.963, NULL),
(1961, 10, NULL, '2018-07-10', 496.938, NULL),
(1962, 10, NULL, '2018-07-12', 498.778, NULL),
(1963, 10, NULL, '2018-07-13', 500.344, NULL),
(1964, 10, NULL, '2018-07-14', 501.896, NULL),
(1965, 10, NULL, '2018-07-15', 502.461, NULL),
(1966, 10, NULL, '2018-07-16', 502.781, NULL),
(1967, 10, NULL, '2018-07-17', 503.596, NULL),
(1968, 10, NULL, '2018-07-18', 504.616, NULL),
(1969, 10, NULL, '2018-07-19', 505.667, NULL),
(1970, 10, NULL, '2018-07-20', 506.896, NULL),
(1971, 10, NULL, '2018-07-23', 509.123, NULL),
(1972, 10, NULL, '2018-07-24', 509.637, NULL),
(1973, 10, NULL, '2018-07-25', 516.441, NULL),
(1974, 10, NULL, '2018-07-26', 517.197, NULL),
(1975, 10, NULL, '2018-07-29', 523.486, NULL),
(1976, 10, NULL, '2018-07-30', 523.554, NULL),
(1977, 10, NULL, '2018-07-31', 524.503, NULL),
(1978, 10, NULL, '2018-08-01', 525.439, NULL),
(1979, 10, NULL, '2018-08-02', 526.473, NULL),
(1980, 10, NULL, '2018-08-05', 530.202, NULL),
(1981, 10, NULL, '2018-08-06', 530.481, NULL),
(1982, 10, NULL, '2018-08-07', 531.344, NULL),
(1983, 10, NULL, '2018-08-08', 532.523, NULL),
(1984, 10, NULL, '2018-08-09', 533.499, NULL),
(1985, 10, NULL, '2018-08-10', 535.272, NULL),
(1986, 10, NULL, '2018-08-12', 537.649, NULL),
(1987, 10, NULL, '2018-08-13', 538.585, NULL),
(1988, 10, NULL, '2018-08-14', 539.776, NULL),
(1989, 10, NULL, '2018-08-15', 540.421, NULL),
(1990, 10, NULL, '2018-08-16', 541.355, NULL),
(1991, 10, NULL, '2018-08-17', 542.905, NULL),
(1992, 10, NULL, '2018-08-21', 547.245, NULL),
(1993, 10, NULL, '2018-08-22', 547.245, NULL),
(1994, 10, NULL, '2018-08-23', 549.075, NULL),
(1995, 10, NULL, '2018-08-24', 551.171, NULL),
(1996, 10, NULL, '2018-08-26', 555.679, NULL),
(1997, 10, NULL, '2018-08-27', 555.679, NULL),
(1998, 10, NULL, '2018-08-28', 555.879, NULL),
(1999, 10, NULL, '2018-08-29', 555.979, NULL),
(2000, 10, NULL, '2018-08-30', 558.231, NULL),
(2001, 10, NULL, '2018-08-31', 560.693, NULL),
(2002, 10, NULL, '2018-09-02', 569.412, NULL),
(2003, 10, NULL, '2018-09-01', 566.342, NULL),
(2004, 10, NULL, '2018-09-03', 569.553, NULL),
(2005, 10, NULL, '2018-09-04', 571.462, NULL),
(2006, 10, NULL, '2018-09-05', 572.882, NULL),
(2007, 10, NULL, '2018-09-06', 575.224, NULL),
(2008, 10, NULL, '2018-09-07', 579.163, NULL),
(2009, 10, NULL, '2018-09-09', 596.684, NULL),
(2010, 10, NULL, '2018-09-10', 598.468, NULL),
(2011, 10, NULL, '2018-09-12', 602.033, NULL),
(2012, 10, NULL, '2018-09-13', 615.733, NULL),
(2013, 10, NULL, '2018-09-14', 619.771, NULL),
(2014, 10, NULL, '2018-09-16', 621.914, NULL),
(2015, 10, NULL, '2018-09-17', 630.036, NULL),
(2016, 10, NULL, '2018-09-18', 633.379, NULL),
(2017, 10, NULL, '2018-09-19', 638.785, NULL),
(2018, 10, NULL, '2018-09-20', 643.311, NULL),
(2019, 10, NULL, '2018-09-21', 646.901, NULL),
(2020, 10, NULL, '2018-09-23', 663.141, NULL),
(2021, 10, NULL, '2018-09-24', 663.143, NULL),
(2022, 10, NULL, '2018-09-25', 668.224, NULL),
(2023, 10, NULL, '2018-09-26', 668.224, NULL),
(2024, 10, NULL, '2018-09-27', 675.157, NULL),
(2025, 10, NULL, '2018-09-28', 677.377, NULL),
(2026, 10, NULL, '2018-09-30', 687.155, NULL),
(2027, 10, NULL, '2018-10-02', 697.193, NULL),
(2028, 10, NULL, '2018-10-03', 702.771, NULL),
(2029, 10, NULL, '2018-10-04', 710.589, NULL),
(2030, 10, NULL, '2018-10-05', 716.36, NULL),
(2031, 10, NULL, '2018-10-07', 725.717, NULL),
(2032, 10, NULL, '2018-10-08', 729.66, NULL),
(2033, 10, NULL, '2018-10-09', 736.101, NULL),
(2034, 10, NULL, '2018-10-10', 743.136, NULL),
(2035, 10, NULL, '2018-10-11', 744.168, NULL),
(2036, 10, NULL, '2018-10-12', 748.446, NULL),
(2037, 10, NULL, '2018-10-15', 751.709, NULL),
(2038, 10, NULL, '2018-10-16', 763.814, NULL),
(2039, 10, NULL, '2018-10-17', 765.309, NULL),
(2040, 10, NULL, '2018-10-19', 769.272, NULL),
(2041, 10, NULL, '2018-10-21', 775.111, NULL),
(2042, 10, NULL, '2018-10-24', 782.079, NULL),
(2043, 10, NULL, '2018-10-28', 788.532, NULL),
(2044, 10, NULL, '2018-10-29', 788.726, NULL),
(2045, 10, NULL, '2018-10-31', 791, NULL),
(2046, 10, NULL, '2018-11-08', 801.446, NULL),
(2047, 10, NULL, '2018-11-09', 806.865, NULL),
(2048, 10, NULL, '2018-11-23', 944.836, NULL),
(2049, 10, NULL, '2018-11-26', 944.836, NULL),
(2050, 10, NULL, '2018-11-28', 944.836, NULL),
(2051, 10, NULL, '2018-11-30', 944.836, NULL),
(2052, 10, NULL, '2018-12-02', 944.836, NULL),
(2053, 10, NULL, '2018-12-03', 944.836, NULL),
(2054, 10, NULL, '2018-12-04', 944.836, NULL),
(2055, 10, NULL, '2018-12-05', 944.836, NULL),
(2056, 10, NULL, '2018-12-06', 944.836, NULL),
(2057, 10, NULL, '2018-12-07', 944.836, NULL),
(2058, 10, NULL, '2018-12-10', 944.836, NULL),
(2059, 10, NULL, '2018-12-11', 944.836, NULL),
(2060, 10, NULL, '2018-12-13', 952.324, NULL),
(2061, 10, NULL, '2018-12-14', 955.872, NULL),
(2062, 10, NULL, '2018-12-17', 964.875, NULL),
(2063, 10, NULL, '2018-12-18', 968.227, NULL),
(2064, 10, NULL, '2018-12-19', 972.739, NULL),
(2065, 10, NULL, '2018-12-20', 972.759, NULL),
(2066, 10, NULL, '2018-12-21', 982.807, NULL),
(2067, 10, NULL, '2018-12-23', 989.218, NULL),
(2068, 10, NULL, '2018-12-24', 995.079, NULL),
(2069, 10, NULL, '2018-12-27', 1009.338, NULL),
(2070, 10, NULL, '2018-12-30', 1018.657, NULL),
(2071, 1, NULL, '2018-05-28', 0, NULL),
(2072, 1, NULL, '2018-05-29', 0, NULL),
(2073, 1, NULL, '2018-05-30', 2, NULL),
(2074, 1, NULL, '2018-05-31', 2, NULL),
(2075, 1, NULL, '2018-06-01', 2, NULL),
(2076, 1, NULL, '2018-06-03', 2, NULL),
(2077, 1, NULL, '2018-06-04', 2, NULL),
(2078, 1, NULL, '2018-06-05', 2, NULL),
(2079, 1, NULL, '2018-06-06', 2, NULL),
(2080, 1, NULL, '2018-06-07', 2, NULL),
(2081, 1, NULL, '2018-06-08', 2, NULL),
(2082, 1, NULL, '2018-06-10', 2, NULL),
(2083, 1, NULL, '2018-06-11', 2, NULL),
(2084, 1, NULL, '2018-06-12', 2, NULL),
(2085, 1, NULL, '2018-06-13', 2, NULL),
(2086, 1, NULL, '2018-06-14', 2, NULL),
(2087, 1, NULL, '2018-06-15', 2, NULL),
(2088, 1, NULL, '2018-06-18', 2, NULL),
(2089, 1, NULL, '2018-06-19', 2, NULL),
(2090, 1, NULL, '2018-06-20', 2, NULL),
(2091, 1, NULL, '2018-06-21', 2, NULL),
(2092, 1, NULL, '2018-06-22', 2, NULL),
(2093, 1, NULL, '2018-06-24', 2, NULL),
(2094, 1, NULL, '2018-06-25', 2, NULL),
(2095, 1, NULL, '2018-06-26', 4, NULL),
(2096, 1, NULL, '2018-06-27', 4, NULL),
(2097, 1, NULL, '2018-06-28', 4, NULL),
(2098, 1, NULL, '2018-06-29', 4, NULL),
(2099, 1, NULL, '2018-06-30', 5, NULL),
(2100, 1, NULL, '2018-08-24', 16, NULL),
(2101, 1, NULL, '2018-07-01', 5, NULL),
(2102, 1, NULL, '2018-07-02', 5, NULL),
(2103, 1, NULL, '2018-07-03', 5, NULL),
(2104, 1, NULL, '2018-07-04', 5, NULL),
(2105, 1, NULL, '2018-07-05', 5, NULL),
(2106, 1, NULL, '2018-07-06', 6, NULL),
(2107, 1, NULL, '2018-07-08', 6, NULL),
(2108, 1, NULL, '2018-07-09', 6, NULL),
(2109, 1, NULL, '2018-07-11', 7, NULL),
(2110, 1, NULL, '2018-07-10', 6, NULL),
(2111, 1, NULL, '2018-07-12', 7, NULL),
(2112, 1, NULL, '2018-07-13', 7, NULL),
(2113, 1, NULL, '2018-07-14', 8, NULL),
(2114, 1, NULL, '2018-07-15', 8, NULL),
(2115, 1, NULL, '2018-07-16', 9, NULL),
(2116, 1, NULL, '2018-07-17', 10, NULL),
(2117, 1, NULL, '2018-07-18', 10, NULL),
(2118, 1, NULL, '2018-07-19', 10, NULL),
(2119, 1, NULL, '2018-07-20', 10, NULL),
(2120, 1, NULL, '2018-07-23', 10, NULL),
(2121, 1, NULL, '2018-07-24', 10, NULL),
(2122, 1, NULL, '2018-07-25', 10, NULL),
(2123, 1, NULL, '2018-07-29', 10, NULL),
(2124, 1, NULL, '2018-07-30', 11, NULL),
(2125, 1, NULL, '2018-07-31', 11, NULL),
(2126, 1, NULL, '2018-08-01', 11, NULL),
(2127, 1, NULL, '2018-08-02', 11, NULL),
(2128, 1, NULL, '2018-08-03', 11, NULL),
(2129, 1, NULL, '2018-08-05', 12, NULL),
(2130, 1, NULL, '2018-08-06', 12, NULL),
(2131, 1, NULL, '2018-08-07', 12, NULL),
(2132, 1, NULL, '2018-08-08', 13, NULL),
(2133, 1, NULL, '2018-08-09', 13, NULL),
(2134, 1, NULL, '2018-08-10', 13, NULL),
(2135, 1, NULL, '2018-08-12', 13, NULL),
(2136, 1, NULL, '2018-08-13', 14, NULL),
(2137, 1, NULL, '2018-08-14', 14, NULL),
(2138, 1, NULL, '2018-08-15', 14, NULL),
(2139, 1, NULL, '2018-08-16', 14, NULL),
(2140, 1, NULL, '2018-08-17', 14, NULL),
(2141, 1, NULL, '2018-08-21', 15, NULL),
(2142, 1, NULL, '2018-08-22', 15, NULL),
(2143, 1, NULL, '2018-08-23', 15, NULL),
(2144, 1, NULL, '2018-08-26', 16, NULL),
(2145, 1, NULL, '2018-08-27', 16, NULL),
(2146, 1, NULL, '2018-08-28', 16, NULL),
(2147, 1, NULL, '2018-08-29', 16, NULL),
(2148, 1, NULL, '2018-08-31', 17, NULL),
(2149, 1, NULL, '2018-08-30', 17, NULL),
(2150, 1, NULL, '2018-09-02', 17, NULL),
(2151, 1, NULL, '2018-09-01', 17, NULL),
(2152, 1, NULL, '2018-09-03', 17, NULL),
(2153, 1, NULL, '2018-09-04', 18, NULL),
(2154, 1, NULL, '2018-09-05', 18, NULL),
(2155, 1, NULL, '2018-09-06', 18, NULL),
(2156, 1, NULL, '2018-09-07', 18, NULL),
(2157, 1, NULL, '2018-09-09', 19, NULL),
(2158, 1, NULL, '2018-09-10', 19, NULL),
(2159, 1, NULL, '2018-09-12', 20, NULL),
(2160, 1, NULL, '2018-09-13', 20, NULL),
(2161, 1, NULL, '2018-09-14', 20, NULL),
(2162, 1, NULL, '2018-09-16', 21, NULL),
(2163, 1, NULL, '2018-09-17', 21, NULL),
(2164, 1, NULL, '2018-09-18', 21, NULL),
(2165, 1, NULL, '2018-09-19', 21, NULL),
(2166, 1, NULL, '2018-09-20', 22, NULL),
(2167, 1, NULL, '2018-09-23', 22, NULL),
(2168, 1, NULL, '2018-09-21', 22, NULL),
(2169, 1, NULL, '2018-09-24', 23, NULL),
(2170, 1, NULL, '2018-09-25', 23, NULL),
(2171, 1, NULL, '2018-09-26', 23, NULL),
(2172, 1, NULL, '2018-09-27', 24, NULL),
(2173, 1, NULL, '2018-09-28', 24, NULL),
(2174, 1, NULL, '2018-09-30', 24, NULL),
(2175, 1, NULL, '2018-10-01', 25, NULL),
(2176, 1, NULL, '2018-10-02', 25, NULL),
(2177, 1, NULL, '2018-10-03', 25, NULL),
(2178, 1, NULL, '2018-10-04', 26, NULL),
(2179, 1, NULL, '2018-10-05', 26, NULL),
(2180, 1, NULL, '2018-10-07', 27, NULL),
(2181, 1, NULL, '2018-10-08', 28, NULL),
(2182, 1, NULL, '2018-10-09', 28, NULL),
(2183, 1, NULL, '2018-10-10', 28, NULL),
(2184, 1, NULL, '2018-10-11', 28, NULL),
(2185, 1, NULL, '2018-10-12', 28, NULL),
(2186, 1, NULL, '2018-10-16', 28, NULL),
(2187, 1, NULL, '2018-10-15', 28, NULL),
(2188, 1, NULL, '2018-10-17', 29, NULL),
(2189, 1, NULL, '2018-10-19', 29, NULL),
(2190, 1, NULL, '2018-10-21', 30, NULL),
(2191, 1, NULL, '2018-10-24', 31, NULL),
(2192, 1, NULL, '2018-10-28', 32, NULL),
(2193, 1, NULL, '2018-10-29', 32, NULL),
(2194, 1, NULL, '2018-10-31', 34, NULL),
(2195, 1, NULL, '2018-11-08', 38, NULL),
(2196, 1, NULL, '2018-11-09', 39, NULL),
(2197, 1, NULL, '2018-11-14', 41, NULL),
(2198, 1, NULL, '2018-11-23', 45, NULL),
(2199, 1, NULL, '2018-11-26', 46, NULL),
(2200, 1, NULL, '2018-11-28', 47, NULL),
(2201, 1, NULL, '2018-11-30', 48, NULL),
(2202, 1, NULL, '2018-12-02', 49, NULL),
(2203, 1, NULL, '2018-12-03', 50, NULL),
(2204, 1, NULL, '2018-12-04', 50, NULL),
(2205, 1, NULL, '2018-12-05', 51, NULL),
(2206, 1, NULL, '2018-12-06', 51, NULL),
(2207, 1, NULL, '2018-12-07', 51, NULL),
(2208, 1, NULL, '2018-12-10', 52, NULL),
(2209, 1, NULL, '2018-12-11', 53, NULL),
(2210, 1, NULL, '2018-12-13', 55, NULL),
(2211, 1, NULL, '2018-12-14', 55, NULL),
(2212, 1, NULL, '2018-12-17', 55, NULL),
(2213, 1, NULL, '2018-12-18', 56, NULL),
(2214, 1, NULL, '2018-12-19', 56, NULL),
(2215, 1, NULL, '2018-12-20', 56, NULL),
(2216, 1, NULL, '2018-12-21', 57, NULL),
(2217, 1, NULL, '2018-12-23', 57, NULL),
(2218, 1, NULL, '2018-12-24', 57, NULL),
(2219, 1, NULL, '2018-12-27', 57, NULL),
(2220, 1, NULL, '2018-12-30', 58, NULL),
(2221, 17, NULL, '2018-04-30', 85, NULL),
(2222, 17, NULL, '2018-05-01', 87, NULL),
(2223, 17, NULL, '2018-05-02', 88, NULL),
(2224, 17, NULL, '2018-05-03', 89, NULL),
(2225, 17, NULL, '2018-05-04', 90, NULL),
(2226, 17, NULL, '2018-05-07', 93, NULL),
(2227, 17, NULL, '2018-05-08', 94, NULL),
(2228, 17, NULL, '2018-05-09', 95, NULL),
(2229, 17, NULL, '2018-05-11', 95, NULL),
(2230, 17, NULL, '2018-05-10', 99.45, NULL),
(2231, 17, NULL, '2018-05-14', 100, NULL),
(2232, 17, NULL, '2018-05-15', 101, NULL),
(2233, 17, NULL, '2018-05-16', 101, NULL),
(2234, 17, NULL, '2018-05-17', 102, NULL),
(2235, 17, NULL, '2018-05-18', 103, NULL),
(2236, 17, NULL, '2018-05-21', 106, NULL),
(2237, 17, NULL, '2018-05-22', 107, NULL),
(2238, 17, NULL, '2018-05-23', 108, NULL),
(2239, 17, NULL, '2018-05-24', 108, NULL),
(2240, 17, NULL, '2018-05-25', 109, NULL),
(2241, 19, NULL, '2018-04-30', 79.85, NULL),
(2242, 19, NULL, '2018-05-01', 80, NULL),
(2243, 19, NULL, '2018-05-02', 83, NULL),
(2244, 19, NULL, '2018-05-03', 85, NULL),
(2245, 19, NULL, '2018-05-04', 86, NULL),
(2246, 19, NULL, '2018-05-07', 88, NULL),
(2247, 19, NULL, '2018-05-08', 89, NULL),
(2248, 19, NULL, '2018-05-09', 89, NULL),
(2249, 19, NULL, '2018-05-11', 90, NULL),
(2250, 19, NULL, '2018-05-10', 92, NULL),
(2251, 19, NULL, '2018-05-14', 92, NULL),
(2252, 19, NULL, '2018-05-15', 90.23, NULL),
(2253, 19, NULL, '2018-05-16', 95.34, NULL),
(2254, 19, NULL, '2018-05-17', 95.85, NULL),
(2255, 19, NULL, '2018-05-18', 95.88, NULL),
(2256, 19, NULL, '2018-05-21', 94, NULL),
(2257, 19, NULL, '2018-05-22', 95, NULL),
(2258, 19, NULL, '2018-05-23', 98, NULL),
(2259, 19, NULL, '2018-05-24', 98, NULL),
(2260, 19, NULL, '2018-05-25', 98, NULL),
(2261, 16, NULL, '2018-04-30', 568.458, NULL),
(2262, 16, NULL, '2018-05-01', 569.4584, NULL),
(2263, 16, NULL, '2018-05-02', 568.4584, NULL),
(2264, 16, NULL, '2018-05-03', 568.4584, NULL),
(2265, 16, NULL, '2018-05-04', 568.4584, NULL),
(2266, 16, NULL, '2018-05-07', 568.4584, NULL),
(2267, 16, NULL, '2018-05-08', 568.458, NULL),
(2268, 16, NULL, '2018-05-09', 568.458, NULL),
(2269, 16, NULL, '2018-05-11', 568.458, NULL),
(2270, 16, NULL, '2018-05-10', 568.458, NULL),
(2271, 16, NULL, '2018-05-14', 568.458, NULL),
(2272, 16, NULL, '2018-05-15', 568.458, NULL),
(2273, 16, NULL, '2018-05-16', 568.458, NULL),
(2274, 16, NULL, '2018-05-17', 568.458, NULL),
(2275, 16, NULL, '2018-05-18', 568.458, NULL),
(2276, 16, NULL, '2018-05-21', 568.458, NULL),
(2277, 16, NULL, '2018-05-22', 568.458, NULL),
(2278, 16, NULL, '2018-05-23', 568.458, NULL),
(2279, 16, NULL, '2018-05-24', 568.458, NULL),
(2280, 16, NULL, '2018-05-25', 568.458, NULL),
(2281, 4, NULL, '2018-04-30', 71.3396, NULL),
(2282, 4, NULL, '2018-05-01', 71.3569, NULL),
(2283, 4, NULL, '2018-05-02', 71.358, NULL),
(2284, 4, NULL, '2018-05-03', 71.3816, NULL),
(2285, 4, NULL, '2018-05-04', 71.398, NULL),
(2286, 4, NULL, '2018-05-07', 71.473, NULL),
(2287, 4, NULL, '2018-05-08', 71.485, NULL),
(2288, 4, NULL, '2018-05-09', 71.554, NULL),
(2289, 4, NULL, '2018-05-11', 71.634, NULL),
(2290, 4, NULL, '2018-05-10', 71.59, NULL),
(2291, 4, NULL, '2018-05-14', 71.688, NULL),
(2292, 4, NULL, '2018-05-15', 71.717, NULL),
(2293, 4, NULL, '2018-05-16', 71.729, NULL),
(2294, 4, NULL, '2018-05-17', 71.809, NULL),
(2295, 4, NULL, '2018-05-18', 71.878, NULL),
(2296, 4, NULL, '2018-05-21', 71.932, NULL),
(2297, 4, NULL, '2018-05-22', 71.987, NULL),
(2298, 4, NULL, '2018-05-23', 72.018, NULL),
(2299, 4, NULL, '2018-05-24', 72.073, NULL),
(2300, 4, NULL, '2018-05-25', 72.095, NULL),
(2301, 4, NULL, '2018-05-28', 72.268, NULL),
(2302, 4, NULL, '2018-05-29', 72.317, NULL),
(2303, 4, NULL, '2018-05-30', 72.354, NULL),
(2304, 4, NULL, '2018-05-31', 72.416, NULL),
(2305, 4, NULL, '2018-06-01', 72.537, NULL),
(2306, 4, NULL, '2018-06-03', 72.544, NULL),
(2307, 4, NULL, '2018-06-04', 72.544, NULL),
(2308, 4, NULL, '2018-06-05', 72.55, NULL),
(2309, 4, NULL, '2018-06-06', 72.554, NULL),
(2310, 4, NULL, '2018-06-07', 72.569, NULL),
(2311, 4, NULL, '2018-06-08', 72.592, NULL),
(2312, 4, NULL, '2018-06-10', 72.686, NULL),
(2313, 4, NULL, '2018-06-11', 72.69, NULL),
(2314, 4, NULL, '2018-06-12', 72.751, NULL),
(2315, 4, NULL, '2018-06-13', 72.786, NULL),
(2316, 4, NULL, '2018-06-14', 72.831, NULL),
(2317, 4, NULL, '2018-06-15', 72.858, NULL),
(2318, 4, NULL, '2018-06-18', 72.891, NULL),
(2319, 4, NULL, '2018-06-19', 72.938, NULL),
(2320, 4, NULL, '2018-06-20', 72.99, NULL),
(2321, 4, NULL, '2018-06-21', 73.031, NULL),
(2322, 4, NULL, '2018-06-22', 73.064, NULL),
(2323, 4, NULL, '2018-06-24', 73.064, NULL),
(2324, 4, NULL, '2018-06-25', 73.123, NULL),
(2325, 4, NULL, '2018-06-26', 73.132, NULL),
(2326, 4, NULL, '2018-06-27', 73.148, NULL),
(2327, 4, NULL, '2018-06-28', 73.226, NULL),
(2328, 4, NULL, '2018-06-29', 73.229, NULL),
(2329, 4, NULL, '2018-06-30', 73.243, NULL),
(2330, 4, NULL, '2018-07-01', 73.244, NULL),
(2331, 4, NULL, '2018-07-02', 73.244, NULL),
(2332, 4, NULL, '2018-07-03', 73.264, NULL),
(2333, 4, NULL, '2018-07-04', 73.316, NULL),
(2334, 4, NULL, '2018-07-05', 73.353, NULL),
(2335, 4, NULL, '2018-07-06', 73.407, NULL),
(2336, 4, NULL, '2018-07-08', 73.443, NULL),
(2337, 4, NULL, '2018-07-09', 73.453, NULL),
(2338, 4, NULL, '2018-07-11', 73.5351, NULL),
(2339, 4, NULL, '2018-07-10', 73.492, NULL),
(2340, 4, NULL, '2018-07-12', 73.5351, NULL),
(2341, 4, NULL, '2018-07-13', 73.68, NULL),
(2342, 4, NULL, '2018-07-14', 73.712, NULL),
(2343, 4, NULL, '2018-07-15', 73.717, NULL),
(2344, 4, NULL, '2018-07-16', 73.717, NULL),
(2345, 4, NULL, '2018-07-17', 73.789, NULL),
(2346, 4, NULL, '2018-07-18', 73.823, NULL),
(2347, 4, NULL, '2018-07-19', 73.877, NULL),
(2348, 4, NULL, '2018-07-20', 73.922, NULL),
(2349, 4, NULL, '2018-07-23', 73.978, NULL),
(2350, 4, NULL, '2018-07-24', 74.022, NULL),
(2351, 4, NULL, '2018-07-25', 74.093, NULL),
(2352, 4, NULL, '2018-07-26', 74.137, NULL),
(2353, 4, NULL, '2018-07-29', 74.257, NULL),
(2354, 4, NULL, '2018-07-30', 74.257, NULL),
(2355, 4, NULL, '2018-07-31', 74.313, NULL),
(2356, 4, NULL, '2018-08-01', 74.347, NULL),
(2357, 4, NULL, '2018-08-02', 74.388, NULL),
(2358, 4, NULL, '2018-08-03', 74.401, NULL),
(2359, 4, NULL, '2018-08-05', 74.484, NULL),
(2360, 4, NULL, '2018-08-06', 74.487, NULL),
(2361, 4, NULL, '2018-08-07', 74.533, NULL),
(2362, 4, NULL, '2018-08-08', 74.566, NULL),
(2363, 4, NULL, '2018-08-09', 74.634, NULL),
(2364, 4, NULL, '2018-08-10', 74.714, NULL),
(2365, 4, NULL, '2018-08-12', 74.784, NULL),
(2366, 4, NULL, '2018-08-13', 74.804, NULL),
(2367, 4, NULL, '2018-08-14', 74.837, NULL),
(2368, 4, NULL, '2018-08-15', 74.873, NULL),
(2369, 4, NULL, '2018-08-16', 74.951, NULL);
INSERT INTO `wreading` (`wreading`, `wmeter`, `invoice`, `date`, `value`, `remark`) VALUES
(2370, 4, NULL, '2018-08-17', 74.951, NULL),
(2371, 4, NULL, '2018-08-21', 75.076, NULL),
(2372, 4, NULL, '2018-08-22', 75.076, NULL),
(2373, 4, NULL, '2018-08-23', 75.094, NULL),
(2374, 4, NULL, '2018-08-24', 75.142, NULL),
(2375, 4, NULL, '2018-08-26', 75.198, NULL),
(2376, 4, NULL, '2018-08-27', 75.224, NULL),
(2377, 4, NULL, '2018-08-28', 75.224, NULL),
(2378, 4, NULL, '2018-08-29', 75.224, NULL),
(2379, 4, NULL, '2018-08-30', 75.322, NULL),
(2380, 4, NULL, '2018-09-02', 75.444, NULL),
(2381, 4, NULL, '2018-09-01', 75.398, NULL),
(2382, 4, NULL, '2018-09-03', 75.448, NULL),
(2383, 4, NULL, '2018-09-04', 75.498, NULL),
(2384, 4, NULL, '2018-09-05', 75.553, NULL),
(2385, 4, NULL, '2018-09-06', 75.605, NULL),
(2386, 4, NULL, '2018-09-07', 75.65, NULL),
(2387, 4, NULL, '2018-09-09', 75.738, NULL),
(2388, 4, NULL, '2018-09-10', 75.741, NULL),
(2389, 4, NULL, '2018-09-12', 75.804, NULL),
(2390, 4, NULL, '2018-09-13', 75.841, NULL),
(2391, 4, NULL, '2018-09-14', 75.877, NULL),
(2392, 4, NULL, '2018-09-16', 75.929, NULL),
(2393, 4, NULL, '2018-09-17', 75.929, NULL),
(2394, 4, NULL, '2018-09-18', 75.961, NULL),
(2395, 4, NULL, '2018-09-19', 76.007, NULL),
(2396, 4, NULL, '2018-09-20', 76.047, NULL),
(2397, 4, NULL, '2018-09-21', 76.083, NULL),
(2398, 4, NULL, '2018-09-23', 76.126, NULL),
(2399, 4, NULL, '2018-09-24', 76.126, NULL),
(2400, 4, NULL, '2018-09-25', 76.166, NULL),
(2401, 4, NULL, '2018-09-26', 76.197, NULL),
(2402, 4, NULL, '2018-09-27', 76.244, NULL),
(2403, 4, NULL, '2018-09-28', 76.275, NULL),
(2404, 4, NULL, '2018-09-30', 76.411, NULL),
(2405, 4, NULL, '2018-10-01', 76.413, NULL),
(2406, 4, NULL, '2018-10-02', 76.48, NULL),
(2407, 4, NULL, '2018-10-03', 76.526, NULL),
(2408, 4, NULL, '2018-10-04', 76.56, NULL),
(2409, 4, NULL, '2018-10-05', 76.614, NULL),
(2410, 4, NULL, '2018-10-07', 76.722, NULL),
(2411, 4, NULL, '2018-10-08', 76.727, NULL),
(2412, 4, NULL, '2018-10-09', 76.752, NULL),
(2413, 4, NULL, '2018-10-10', 76.845, NULL),
(2414, 4, NULL, '2018-10-11', 76.845, NULL),
(2415, 4, NULL, '2018-10-12', 76.902, NULL),
(2416, 4, NULL, '2018-10-15', 76.978, NULL),
(2417, 4, NULL, '2018-10-16', 77, NULL),
(2418, 4, NULL, '2018-10-17', 77.045, NULL),
(2419, 4, NULL, '2018-10-19', 77.127, NULL),
(2420, 4, NULL, '2018-10-21', 77.149, NULL),
(2421, 4, NULL, '2018-10-24', 77.265, NULL),
(2422, 4, NULL, '2018-10-28', 77.403, NULL),
(2423, 4, NULL, '2018-10-29', 77.407, NULL),
(2424, 4, NULL, '2018-10-31', 77.502, NULL),
(2425, 4, NULL, '2018-11-08', 77.849, NULL),
(2426, 4, NULL, '2018-11-09', 77.919, NULL),
(2427, 4, NULL, '2018-11-14', 78.899, NULL),
(2428, 4, NULL, '2018-11-23', 78.899, NULL),
(2429, 4, NULL, '2018-11-26', 78.899, NULL),
(2430, 4, NULL, '2018-11-28', 78.899, NULL),
(2431, 4, NULL, '2018-11-30', 78.899, NULL),
(2432, 4, NULL, '2018-12-02', 78.899, NULL),
(2433, 4, NULL, '2018-12-03', 78.899, NULL),
(2434, 4, NULL, '2018-12-04', 78.899, NULL),
(2435, 4, NULL, '2018-12-05', 78.899, NULL),
(2436, 4, NULL, '2018-12-06', 78.899, NULL),
(2437, 4, NULL, '2018-12-07', 78.899, NULL),
(2438, 4, NULL, '2018-12-10', 78.899, NULL),
(2439, 4, NULL, '2018-12-11', 78.899, NULL),
(2440, 4, NULL, '2018-12-13', 78.899, NULL),
(2441, 4, NULL, '2018-12-14', 78.899, NULL),
(2442, 4, NULL, '2018-12-17', 78.954, NULL),
(2443, 4, NULL, '2018-12-18', 78.968, NULL),
(2444, 4, NULL, '2018-12-19', 79.035, NULL),
(2445, 4, NULL, '2018-12-20', 79.035, NULL),
(2446, 4, NULL, '2018-12-21', 79.137, NULL),
(2447, 4, NULL, '2018-12-23', 79.182, NULL),
(2448, 4, NULL, '2018-12-24', 79.182, NULL),
(2449, 4, NULL, '2018-12-27', 79.2, NULL),
(2450, 4, NULL, '2018-12-30', 79.317, NULL),
(2451, 14, NULL, '2018-06-28', 9.424, NULL),
(2452, 14, NULL, '2018-06-29', 10.595, NULL),
(2453, 14, NULL, '2018-06-30', 22.062, NULL),
(2454, 14, NULL, '2018-07-01', 33.224, NULL),
(2455, 14, NULL, '2018-07-02', 40.178, NULL),
(2456, 14, NULL, '2018-07-03', 42.561, NULL),
(2457, 14, NULL, '2018-07-04', 49.704, NULL),
(2458, 14, NULL, '2018-07-05', 54.778, NULL),
(2459, 14, NULL, '2018-07-06', 64.661, NULL),
(2460, 14, NULL, '2018-07-08', 82.567, NULL),
(2461, 14, NULL, '2018-07-09', 88.471, NULL),
(2462, 14, NULL, '2018-07-11', 96.943, NULL),
(2463, 14, NULL, '2018-07-10', 92.015, NULL),
(2464, 14, NULL, '2018-07-12', 105.68, NULL),
(2465, 14, NULL, '2018-07-14', 122.9, NULL),
(2466, 14, NULL, '2018-07-15', 129.432, NULL),
(2467, 14, NULL, '2018-07-16', 135.264, NULL),
(2468, 14, NULL, '2018-07-17', 143.558, NULL),
(2469, 14, NULL, '2018-07-18', 147.401, NULL),
(2470, 14, NULL, '2018-07-19', 155.561, NULL),
(2471, 14, NULL, '2018-07-20', 160.93, NULL),
(2472, 14, NULL, '2018-07-23', 176.838, NULL),
(2473, 14, NULL, '2018-07-24', 181.155, NULL),
(2474, 14, NULL, '2018-07-25', 192.965, NULL),
(2475, 14, NULL, '2018-07-26', 193.995, NULL),
(2476, 14, NULL, '2018-07-27', 199.645, NULL),
(2477, 14, NULL, '2018-07-29', 217.308, NULL),
(2478, 14, NULL, '2018-07-30', 221.955, NULL),
(2479, 14, NULL, '2018-07-31', 227.551, NULL),
(2480, 14, NULL, '2018-08-01', 233.372, NULL),
(2481, 14, NULL, '2018-08-02', 238.547, NULL),
(2482, 14, NULL, '2018-08-03', 244.906, NULL),
(2483, 14, NULL, '2018-08-06', 256.953, NULL),
(2484, 14, NULL, '2018-08-05', 256.953, NULL),
(2485, 14, NULL, '2018-08-07', 268.365, NULL),
(2486, 14, NULL, '2018-08-08', 275.955, NULL),
(2487, 14, NULL, '2018-08-09', 275.955, NULL),
(2488, 14, NULL, '2018-08-10', 287.891, NULL),
(2489, 14, NULL, '2018-08-12', 297.088, NULL),
(2490, 14, NULL, '2018-08-13', 301.086, NULL),
(2491, 14, NULL, '2018-08-14', 308.293, NULL),
(2492, 14, NULL, '2018-08-15', 311.604, NULL),
(2493, 14, NULL, '2018-08-16', 322.838, NULL),
(2494, 14, NULL, '2018-08-17', 322.838, NULL),
(2495, 14, NULL, '2018-08-21', 342.558, NULL),
(2496, 14, NULL, '2018-08-22', 345.651, NULL),
(2497, 14, NULL, '2018-08-23', 353.158, NULL),
(2498, 14, NULL, '2018-08-24', 359.845, NULL),
(2499, 14, NULL, '2018-08-26', 366.255, NULL),
(2500, 14, NULL, '2018-08-27', 369.704, NULL),
(2501, 14, NULL, '2018-08-28', 379.704, NULL),
(2502, 14, NULL, '2018-08-29', 382.704, NULL),
(2503, 14, NULL, '2018-08-30', 385.925, NULL),
(2504, 14, NULL, '2018-08-31', 389.695, NULL),
(2505, 14, NULL, '2018-09-02', 413.55, NULL),
(2506, 14, NULL, '2018-09-01', 389.989, NULL),
(2507, 14, NULL, '2018-09-03', 416.458, NULL),
(2508, 14, NULL, '2018-09-04', 423.203, NULL),
(2509, 14, NULL, '2018-09-05', 427.239, NULL),
(2510, 14, NULL, '2018-09-06', 431.625, NULL),
(2511, 14, NULL, '2018-09-07', 440.869, NULL),
(2512, 14, NULL, '2018-09-09', 467.293, NULL),
(2513, 14, NULL, '2018-09-10', 467.298, NULL),
(2514, 14, NULL, '2018-09-12', 486.935, NULL),
(2515, 14, NULL, '2018-09-13', 504.842, NULL),
(2516, 14, NULL, '2018-09-14', 511.155, NULL),
(2517, 14, NULL, '2018-09-16', 535.874, NULL),
(2518, 14, NULL, '2018-09-17', 536.555, NULL),
(2519, 14, NULL, '2018-09-18', 546.995, NULL),
(2520, 14, NULL, '2018-09-19', 559.317, NULL),
(2521, 14, NULL, '2018-09-20', 567.555, NULL),
(2522, 14, NULL, '2018-09-21', 576.716, NULL),
(2523, 14, NULL, '2018-09-23', 598.298, NULL),
(2524, 14, NULL, '2018-09-24', 602.315, NULL),
(2525, 14, NULL, '2018-09-25', 611.634, NULL),
(2526, 14, NULL, '2018-09-26', 621.355, NULL),
(2527, 14, NULL, '2018-09-27', 626.899, NULL),
(2528, 14, NULL, '2018-09-28', 634.236, NULL),
(2529, 14, NULL, '2018-09-30', 652.605, NULL),
(2530, 14, NULL, '2018-10-01', 658.692, NULL),
(2531, 14, NULL, '2018-10-02', 668.589, NULL),
(2532, 14, NULL, '2018-10-03', 676.424, NULL),
(2533, 14, NULL, '2018-10-04', 687.499, NULL),
(2534, 14, NULL, '2018-10-05', 696.831, NULL),
(2535, 14, NULL, '2018-10-07', 711.385, NULL),
(2536, 14, NULL, '2018-10-08', 716.755, NULL),
(2537, 14, NULL, '2018-10-09', 729.887, NULL),
(2538, 14, NULL, '2018-10-10', 737.224, NULL),
(2539, 14, NULL, '2018-10-19', 796.023, NULL),
(2540, 14, NULL, '2018-10-21', 812.566, NULL),
(2541, 14, NULL, '2018-10-24', 829.558, NULL),
(2542, 14, NULL, '2018-10-28', 854.709, NULL),
(2543, 14, NULL, '2018-10-29', 859.021, NULL),
(2544, 14, NULL, '2018-10-31', 871.408, NULL),
(2545, 14, NULL, '2018-11-01', 883.111, NULL),
(2546, 8, NULL, '2018-04-30', 63.9, NULL),
(2547, 8, NULL, '2018-05-01', 63.9, NULL),
(2548, 8, NULL, '2018-05-02', 63.8, NULL),
(2549, 8, NULL, '2018-05-03', 63.8, NULL),
(2550, 8, NULL, '2018-05-04', 64.9, NULL),
(2551, 8, NULL, '2018-05-07', 65.9, NULL),
(2552, 8, NULL, '2018-05-08', 65.9, NULL),
(2553, 8, NULL, '2018-05-09', 65.9, NULL),
(2554, 8, NULL, '2018-05-11', 66.6, NULL),
(2555, 8, NULL, '2018-05-10', 66.8, NULL),
(2556, 8, NULL, '2018-05-14', 67.4, NULL),
(2557, 8, NULL, '2018-05-15', 67.6, NULL),
(2558, 8, NULL, '2018-05-16', 68.2, NULL),
(2559, 8, NULL, '2018-05-17', 66.7, NULL),
(2560, 8, NULL, '2018-05-18', 69.2, NULL),
(2561, 8, NULL, '2018-05-21', 69.8, NULL),
(2562, 8, NULL, '2018-05-22', 70.5, NULL),
(2563, 8, NULL, '2018-05-23', 70.8, NULL),
(2564, 8, NULL, '2018-05-24', 71.2, NULL),
(2565, 8, NULL, '2018-05-25', 71.2, NULL),
(2566, 8, NULL, '2018-05-28', 72.4, NULL),
(2567, 8, NULL, '2018-05-29', 72.4, NULL),
(2568, 8, NULL, '2018-05-30', 73.2, NULL),
(2569, 8, NULL, '2018-05-31', 73.2, NULL),
(2570, 8, NULL, '2018-06-01', 76.6, NULL),
(2571, 8, NULL, '2018-06-03', 79.6, NULL),
(2572, 8, NULL, '2018-06-04', 79.6, NULL),
(2573, 8, NULL, '2018-06-05', 80.2, NULL),
(2574, 8, NULL, '2018-06-06', 80.4, NULL),
(2575, 8, NULL, '2018-06-07', 80.4, NULL),
(2576, 8, NULL, '2018-06-08', 81.2, NULL),
(2577, 8, NULL, '2018-06-10', 83.7, NULL),
(2578, 8, NULL, '2018-06-11', 86.6, NULL),
(2579, 8, NULL, '2018-06-12', 90, NULL),
(2580, 8, NULL, '2018-06-13', 93, NULL),
(2581, 8, NULL, '2018-06-14', 93.4, NULL),
(2582, 8, NULL, '2018-06-15', 93, NULL),
(2583, 8, NULL, '2018-06-18', 105.1, NULL),
(2584, 8, NULL, '2018-06-19', 95.1, NULL),
(2585, 8, NULL, '2018-06-20', 97.7, NULL),
(2586, 8, NULL, '2018-06-21', 100.2, NULL),
(2587, 8, NULL, '2018-06-22', 102.6, NULL),
(2588, 8, NULL, '2018-06-24', 10, NULL),
(2589, 8, NULL, '2018-06-25', 10, NULL),
(2590, 8, NULL, '2018-06-26', 10, NULL),
(2591, 8, NULL, '2018-06-27', 11, NULL),
(2592, 8, NULL, '2018-06-28', 11, NULL),
(2593, 8, NULL, '2018-06-29', 11, NULL),
(2594, 8, NULL, '2018-06-30', 120.8, NULL),
(2595, 8, NULL, '2018-07-01', 122.4, NULL),
(2596, 8, NULL, '2018-07-02', 123, NULL),
(2597, 8, NULL, '2018-07-03', 125.7, NULL),
(2598, 8, NULL, '2018-07-04', 127.4, NULL),
(2599, 8, NULL, '2018-07-05', 127.4, NULL),
(2600, 8, NULL, '2018-07-06', 128.4, NULL),
(2601, 8, NULL, '2018-07-08', 128.9, NULL),
(2602, 8, NULL, '2018-07-09', 129.1, NULL),
(2603, 8, NULL, '2018-07-11', 129.9, NULL),
(2604, 8, NULL, '2018-07-10', 129.5, NULL),
(2605, 8, NULL, '2018-07-12', 130.4, NULL),
(2606, 8, NULL, '2018-07-13', 130.8, NULL),
(2607, 8, NULL, '2018-07-14', 132.4, NULL),
(2608, 8, NULL, '2018-07-15', 133.1, NULL),
(2609, 8, NULL, '2018-07-16', 135.4, NULL),
(2610, 8, NULL, '2018-07-17', 137.8, NULL),
(2611, 8, NULL, '2018-07-18', 138.7, NULL),
(2612, 8, NULL, '2018-07-19', 139.1, NULL),
(2613, 8, NULL, '2018-07-20', 139.4, NULL),
(2614, 8, NULL, '2018-07-23', 140.5, NULL),
(2615, 8, NULL, '2018-07-24', 140.8, NULL),
(2616, 8, NULL, '2018-07-25', 141.2, NULL),
(2617, 8, NULL, '2018-07-26', 141.6, NULL),
(2618, 8, NULL, '2018-07-29', 142.4, NULL),
(2619, 8, NULL, '2018-07-30', 142.6, NULL),
(2620, 8, NULL, '2018-07-31', 143.1, NULL),
(2621, 8, NULL, '2018-08-01', 143.5, NULL),
(2622, 8, NULL, '2018-08-02', 143.9, NULL),
(2623, 8, NULL, '2018-08-03', 144.5, NULL),
(2624, 8, NULL, '2018-08-05', 144.8, NULL),
(2625, 8, NULL, '2018-08-06', 145.1, NULL),
(2626, 8, NULL, '2018-08-07', 145.5, NULL),
(2627, 8, NULL, '2018-08-08', 145.6, NULL),
(2628, 8, NULL, '2018-08-09', 146.2, NULL),
(2629, 8, NULL, '2018-08-10', 146.7, NULL),
(2630, 8, NULL, '2018-08-12', 147.4, NULL),
(2631, 8, NULL, '2018-08-13', 147.5, NULL),
(2632, 8, NULL, '2018-08-14', 148.4, NULL),
(2633, 8, NULL, '2018-08-15', 148.8, NULL),
(2634, 8, NULL, '2018-08-16', 149.8, NULL),
(2635, 8, NULL, '2018-08-17', 150.2, NULL),
(2636, 8, NULL, '2018-08-21', 151.2, NULL),
(2637, 8, NULL, '2018-08-22', 151.4, NULL),
(2638, 8, NULL, '2018-08-23', 151.8, NULL),
(2639, 8, NULL, '2018-08-24', 152.3, NULL),
(2640, 8, NULL, '2018-08-26', 152.8, NULL),
(2641, 8, NULL, '2018-08-27', 153.2, NULL),
(2642, 8, NULL, '2018-08-28', 153.4, NULL),
(2643, 8, NULL, '2018-08-29', 153.8, NULL),
(2644, 8, NULL, '2018-08-30', 154.1, NULL),
(2645, 8, NULL, '2018-09-02', 155.1, NULL),
(2646, 8, NULL, '2018-09-01', 154.9, NULL),
(2647, 8, NULL, '2018-09-03', 155.3, NULL),
(2648, 8, NULL, '2018-09-04', 155.8, NULL),
(2649, 8, NULL, '2018-09-05', 156.3, NULL),
(2650, 8, NULL, '2018-09-06', 156.8, NULL),
(2651, 8, NULL, '2018-09-07', 157.2, NULL),
(2652, 8, NULL, '2018-09-09', 157.6, NULL),
(2653, 8, NULL, '2018-09-10', 157.8, NULL),
(2654, 8, NULL, '2018-09-12', 160.8, NULL),
(2655, 8, NULL, '2018-09-13', 161.1, NULL),
(2656, 8, NULL, '2018-09-14', 161.2, NULL),
(2657, 8, NULL, '2018-09-16', 162.6, NULL),
(2658, 8, NULL, '2018-09-17', 163.5, NULL),
(2659, 8, NULL, '2018-09-18', 164.2, NULL),
(2660, 8, NULL, '2018-09-19', 164.3, NULL),
(2661, 8, NULL, '2018-09-20', 164.8, NULL),
(2662, 8, NULL, '2018-09-21', 165.4, NULL),
(2663, 8, NULL, '2018-09-23', 165.9, NULL),
(2664, 8, NULL, '2018-09-24', 166.1, NULL),
(2665, 8, NULL, '2018-09-25', 166.6, NULL),
(2666, 8, NULL, '2018-09-26', 167, NULL),
(2667, 8, NULL, '2018-09-27', 168.1, NULL),
(2668, 8, NULL, '2018-09-28', 168.6, NULL),
(2669, 8, NULL, '2018-09-30', 169.1, NULL),
(2670, 8, NULL, '2018-10-01', 169.3, NULL),
(2671, 8, NULL, '2018-10-02', 169.9, NULL),
(2672, 8, NULL, '2018-10-03', 170.3, NULL),
(2673, 8, NULL, '2018-10-04', 170.8, NULL),
(2674, 8, NULL, '2018-10-05', 171.2, NULL),
(2675, 8, NULL, '2018-10-07', 171.8, NULL),
(2676, 8, NULL, '2018-10-08', 172.1, NULL),
(2677, 8, NULL, '2018-10-10', 172.8, NULL),
(2678, 8, NULL, '2018-10-11', 172.9, NULL),
(2679, 8, NULL, '2018-10-12', 173.2, NULL),
(2680, 8, NULL, '2018-10-16', 174.4, NULL),
(2681, 8, NULL, '2018-10-15', 174.1, NULL),
(2682, 8, NULL, '2018-10-17', 174.5, NULL),
(2683, 8, NULL, '2018-10-19', 175.5, NULL),
(2684, 8, NULL, '2018-10-21', 176.1, NULL),
(2685, 8, NULL, '2018-10-24', 177.4, NULL),
(2686, 8, NULL, '2018-10-28', 179.7, NULL),
(2687, 8, NULL, '2018-10-29', 179.9, NULL),
(2688, 8, NULL, '2018-10-31', 181.1, NULL),
(2689, 8, NULL, '2018-11-08', 184.3, NULL),
(2690, 8, NULL, '2018-11-09', 184.9, NULL),
(2691, 8, NULL, '2018-11-14', 186.9, NULL),
(2692, 8, NULL, '2018-11-23', 192.1, NULL),
(2693, 8, NULL, '2018-11-26', 192.8, NULL),
(2694, 8, NULL, '2018-11-28', 194.4, NULL),
(2695, 8, NULL, '2018-11-30', 195.5, NULL),
(2696, 8, NULL, '2018-12-02', 196.5, NULL),
(2697, 8, NULL, '2018-12-03', 196.7, NULL),
(2698, 8, NULL, '2018-12-04', 197.3, NULL),
(2699, 8, NULL, '2018-12-05', 197.5, NULL),
(2700, 8, NULL, '2018-12-06', 198.3, NULL),
(2701, 8, NULL, '2018-12-07', 198.8, NULL),
(2702, 8, NULL, '2018-12-10', 199.7, NULL),
(2703, 8, NULL, '2018-12-11', 200.3, NULL),
(2704, 8, NULL, '2018-12-13', 200.7, NULL),
(2705, 8, NULL, '2018-12-14', 201.3, NULL),
(2706, 8, NULL, '2018-12-17', 202.2, NULL),
(2707, 8, NULL, '2018-12-18', 202.2, NULL),
(2708, 8, NULL, '2018-12-19', 203.5, NULL),
(2709, 8, NULL, '2018-12-20', 203.7, NULL),
(2710, 8, NULL, '2018-12-21', 204.6, NULL),
(2711, 8, NULL, '2018-12-23', 205.2, NULL),
(2712, 8, NULL, '2018-12-24', 205.7, NULL),
(2713, 8, NULL, '2018-12-27', 206.2, NULL),
(2714, 8, NULL, '2018-12-30', 207.6, NULL),
(2715, 20, NULL, '2018-06-30', 11, NULL),
(2716, 20, NULL, '2018-06-22', 0, NULL),
(2717, 20, NULL, '2018-07-02', 11, NULL),
(2718, 20, NULL, '2018-07-05', 11, NULL),
(2719, 20, NULL, '2018-07-03', 11, NULL),
(2720, 20, NULL, '2018-07-04', 11, NULL),
(2721, 20, NULL, '2018-07-06', 11, NULL),
(2722, 20, NULL, '2018-07-08', 11, NULL),
(2723, 20, NULL, '2018-07-09', 11, NULL),
(2724, 20, NULL, '2018-07-11', 11, NULL),
(2725, 20, NULL, '2018-07-12', 11, NULL),
(2726, 20, NULL, '2018-07-15', 11, NULL),
(2727, 20, NULL, '2018-07-16', 11, NULL),
(2728, 20, NULL, '2018-07-17', 11, NULL),
(2729, 20, NULL, '2018-07-18', 11, NULL),
(2730, 20, NULL, '2018-07-19', 11, NULL),
(2731, 20, NULL, '2018-07-20', 11, NULL),
(2732, 20, NULL, '2018-07-23', 11, NULL),
(2733, 20, NULL, '2018-07-24', 11, NULL),
(2734, 20, NULL, '2018-07-25', 11, NULL),
(2735, 20, NULL, '2018-07-26', 11, NULL),
(2736, 20, NULL, '2018-07-27', 11, NULL),
(2737, 20, NULL, '2018-07-29', 12, NULL),
(2738, 20, NULL, '2018-07-30', 12, NULL),
(2739, 20, NULL, '2018-08-02', 12, NULL),
(2740, 20, NULL, '2018-07-31', 12, NULL),
(2741, 20, NULL, '2018-08-01', 12, NULL),
(2742, 20, NULL, '2018-08-03', 12, NULL),
(2743, 20, NULL, '2018-08-06', 12, NULL),
(2744, 20, NULL, '2018-08-05', 12, NULL),
(2745, 20, NULL, '2018-08-07', 12, NULL),
(2746, 20, NULL, '2018-08-08', 12, NULL),
(2747, 20, NULL, '2018-08-09', 12, NULL),
(2748, 20, NULL, '2018-08-10', 12, NULL),
(2749, 20, NULL, '2018-08-12', 12, NULL),
(2750, 20, NULL, '2018-08-13', 12, NULL),
(2751, 20, NULL, '2018-08-14', 12, NULL),
(2752, 20, NULL, '2018-08-15', 12, NULL),
(2753, 20, NULL, '2018-08-16', 12, NULL),
(2754, 20, NULL, '2018-08-17', 12, NULL),
(2755, 20, NULL, '2018-08-21', 12, NULL),
(2756, 20, NULL, '2018-08-22', 12, NULL),
(2757, 20, NULL, '2018-08-23', 12, NULL),
(2758, 20, NULL, '2018-08-24', 12, NULL),
(2759, 20, NULL, '2018-08-26', 12, NULL),
(2760, 20, NULL, '2018-08-27', 12, NULL),
(2761, 20, NULL, '2018-08-28', 12, NULL),
(2762, 20, NULL, '2018-08-29', 12, NULL),
(2763, 20, NULL, '2018-08-30', 12, NULL),
(2764, 20, NULL, '2018-08-31', 12, NULL),
(2765, 20, NULL, '2018-09-02', 12, NULL),
(2766, 20, NULL, '2018-09-01', 12, NULL),
(2767, 20, NULL, '2018-09-03', 12, NULL),
(2768, 20, NULL, '2018-09-04', 12, NULL),
(2769, 20, NULL, '2018-09-05', 12, NULL),
(2770, 20, NULL, '2018-09-06', 12, NULL),
(2771, 20, NULL, '2018-09-07', 12, NULL),
(2772, 20, NULL, '2018-09-09', 12, NULL),
(2773, 20, NULL, '2018-09-10', 12, NULL),
(2774, 20, NULL, '2018-09-12', 12, NULL),
(2775, 20, NULL, '2018-09-13', 12, NULL),
(2776, 20, NULL, '2018-09-14', 12, NULL),
(2777, 20, NULL, '2018-09-16', 12, NULL),
(2778, 20, NULL, '2018-09-17', 13, NULL),
(2779, 20, NULL, '2018-09-18', 13, NULL),
(2780, 20, NULL, '2018-09-19', 13, NULL),
(2781, 20, NULL, '2018-09-20', 13, NULL),
(2782, 20, NULL, '2018-09-21', 13, NULL),
(2783, 20, NULL, '2018-09-23', 13, NULL),
(2784, 20, NULL, '2018-09-24', 13, NULL),
(2785, 20, NULL, '2018-09-25', 13, NULL),
(2786, 20, NULL, '2018-09-26', 13, NULL),
(2787, 20, NULL, '2018-09-27', 13, NULL),
(2788, 20, NULL, '2018-09-28', 13, NULL),
(2789, 20, NULL, '2018-09-30', 13, NULL),
(2790, 20, NULL, '2018-10-01', 13, NULL),
(2791, 20, NULL, '2018-10-02', 13, NULL),
(2792, 20, NULL, '2018-10-03', 13, NULL),
(2793, 20, NULL, '2018-10-04', 13, NULL),
(2794, 20, NULL, '2018-10-05', 13, NULL),
(2795, 20, NULL, '2018-10-07', 13, NULL),
(2796, 20, NULL, '2018-10-08', 14, NULL),
(2797, 20, NULL, '2018-10-09', 14, NULL),
(2798, 20, NULL, '2018-10-10', 14, NULL),
(2799, 20, NULL, '2018-10-11', 14, NULL),
(2800, 20, NULL, '2018-10-12', 14, NULL),
(2801, 20, NULL, '2018-10-15', 14, NULL),
(2802, 20, NULL, '2018-10-16', 14, NULL),
(2803, 20, NULL, '2018-10-17', 14, NULL),
(2804, 20, NULL, '2018-10-19', 14, NULL),
(2805, 20, NULL, '2018-10-21', 14, NULL),
(2806, 20, NULL, '2018-10-24', 14, NULL),
(2807, 20, NULL, '2018-10-28', 14, NULL),
(2808, 20, NULL, '2018-10-29', 14, NULL),
(2809, 20, NULL, '2018-10-31', 14, NULL),
(2810, 20, NULL, '2018-11-01', 14, NULL),
(2811, 20, NULL, '2018-11-08', 14, NULL),
(2812, 20, NULL, '2018-11-09', 14, NULL),
(2813, 20, NULL, '2018-11-14', 14, NULL),
(2814, 20, NULL, '2018-11-23', 14, NULL),
(2815, 20, NULL, '2018-11-26', 14, NULL),
(2816, 20, NULL, '2018-11-28', 14, NULL),
(2817, 20, NULL, '2018-11-30', 14, NULL),
(2818, 20, NULL, '2018-12-02', 14, NULL),
(2819, 20, NULL, '2018-12-03', 14, NULL),
(2820, 20, NULL, '2018-12-04', 14, NULL),
(2821, 20, NULL, '2018-12-05', 14, NULL),
(2822, 20, NULL, '2018-12-06', 14, NULL),
(2823, 20, NULL, '2018-12-07', 14, NULL),
(2824, 20, NULL, '2018-12-10', 14, NULL),
(2825, 20, NULL, '2018-12-11', 14, NULL),
(2826, 20, NULL, '2018-12-13', 14, NULL),
(2827, 20, NULL, '2018-12-14', 14, NULL),
(2828, 20, NULL, '2018-12-17', 14, NULL),
(2829, 20, NULL, '2018-12-18', 14, NULL),
(2830, 20, NULL, '2018-12-21', 14, NULL),
(2831, 20, NULL, '2018-12-20', 14, NULL),
(2832, 20, NULL, '2018-12-23', 14, NULL),
(2833, 20, NULL, '2018-12-24', 14, NULL),
(2834, 20, NULL, '2018-12-27', 14, NULL),
(2835, 20, NULL, '2018-12-30', 14, NULL),
(2836, 15, NULL, '2018-09-21', 149.285, NULL),
(2837, 15, NULL, '2018-09-22', 149.285, NULL),
(2838, 15, NULL, '2018-09-24', 151.32, NULL),
(2839, 15, NULL, '2018-09-25', 158.195, NULL),
(2840, 15, NULL, '2018-09-26', 158.763, NULL),
(2841, 15, NULL, '2018-09-27', 159.459, NULL),
(2842, 15, NULL, '2018-09-28', 163.355, NULL),
(2843, 15, NULL, '2018-09-30', 165.601, NULL),
(2844, 15, NULL, '2018-10-01', 165.601, NULL),
(2845, 15, NULL, '2018-10-02', 166.601, NULL),
(2846, 15, NULL, '2018-10-03', 166.659, NULL),
(2847, 15, NULL, '2018-10-04', 168.479, NULL),
(2848, 15, NULL, '2018-10-05', 168.479, NULL),
(2849, 7, NULL, '2019-02-01', 1340.964, NULL),
(2850, 7, NULL, '2019-02-03', 1345.412, NULL),
(2851, 7, NULL, '2019-02-04', 1345.511, NULL),
(2852, 7, NULL, '2019-02-07', 1345.511, NULL),
(2853, 7, NULL, '2019-02-08', 1345.511, NULL),
(2854, 7, NULL, '2019-02-11', 1345.511, NULL),
(2855, 7, NULL, '2019-02-12', 1345.511, NULL),
(2856, 5, NULL, '2019-02-01', 2001.734, NULL),
(2857, 5, NULL, '2019-02-03', 2005.236, NULL),
(2858, 5, NULL, '2019-02-04', 2006.576, NULL),
(2859, 5, NULL, '2019-02-07', 2009.808, NULL),
(2860, 5, NULL, '2019-02-08', 2013.191, NULL),
(2861, 5, NULL, '2019-02-11', 2016.155, NULL),
(2862, 5, NULL, '2019-02-12', 2018.948, NULL),
(2863, 25, NULL, '2019-02-01', 110, NULL),
(2864, 25, NULL, '2019-02-03', 112, NULL),
(2865, 25, NULL, '2019-02-04', 112, NULL),
(2866, 3, NULL, '2019-02-01', 104.356, NULL),
(2867, 3, NULL, '2019-02-03', 104.37, NULL),
(2868, 3, NULL, '2019-02-04', 104.375, NULL),
(2869, 3, NULL, '2019-02-07', 104.404, NULL),
(2870, 3, NULL, '2019-02-08', 104.43, NULL),
(2871, 3, NULL, '2019-02-11', 104.446, NULL),
(2872, 3, NULL, '2019-02-12', 104.446, NULL),
(2873, 11, NULL, '2018-05-04', NULL, NULL),
(2874, 22, NULL, '2019-02-01', 225.277, NULL),
(2875, 22, NULL, '2019-02-03', 227.906, NULL),
(2876, 22, NULL, '2019-02-04', 229.484, NULL),
(2877, 22, NULL, '2019-02-07', 232.809, NULL),
(2878, 22, NULL, '2019-02-08', 238.461, NULL),
(2879, 22, NULL, '2019-02-11', 243.373, NULL),
(2880, 22, NULL, '2019-02-12', 247.416, NULL),
(2881, 24, NULL, '2019-02-01', 230.081, NULL),
(2882, 24, NULL, '2019-02-03', 232.502, NULL),
(2883, 24, NULL, '2019-02-04', 233.271, NULL),
(2884, 24, NULL, '2019-02-07', 234.463, NULL),
(2885, 24, NULL, '2019-02-08', 235.813, NULL),
(2886, 24, NULL, '2019-02-11', 237.973, NULL),
(2887, 24, NULL, '2019-02-12', 239.188, NULL),
(2888, 26, NULL, '2019-02-04', 0.963, NULL),
(2889, 26, NULL, '2019-02-01', 0.891, NULL),
(2890, 26, NULL, '2019-02-07', 1.819, NULL),
(2891, 26, NULL, '2019-02-08', 2.511, NULL),
(2892, 26, NULL, '2019-02-11', 3.208, NULL),
(2893, 26, NULL, '2019-02-12', 3.892, NULL),
(2894, 27, NULL, '2019-02-01', 2.167, NULL),
(2895, 27, NULL, '2019-02-04', 2.512, NULL),
(2896, 27, NULL, '2019-02-07', 3.151, NULL),
(2897, 27, NULL, '2019-02-08', 4.137, NULL),
(2898, 27, NULL, '2019-02-11', 5.415, NULL),
(2899, 27, NULL, '2019-02-12', 6.458, NULL),
(2900, 21, NULL, '2019-02-01', 263.293, NULL),
(2901, 21, NULL, '2019-02-03', 263.293, NULL),
(2902, 21, NULL, '2019-02-04', 263.293, NULL),
(2903, 21, NULL, '2019-02-07', 278.254, NULL),
(2904, 21, NULL, '2019-02-08', 292.909, NULL),
(2905, 21, NULL, '2019-02-11', 292.909, NULL),
(2906, 21, NULL, '2019-02-12', 292.91, NULL),
(2907, 29, NULL, '2019-02-01', 0.843, NULL),
(2908, 29, NULL, '2019-02-04', 1.108, NULL),
(2909, 29, NULL, '2019-02-07', 1.951, NULL),
(2910, 29, NULL, '2019-02-08', 2.437, NULL),
(2911, 29, NULL, '2019-02-11', 2.951, NULL),
(2912, 29, NULL, '2019-02-12', 3.448, NULL),
(2913, 23, NULL, '2019-02-01', 13.491, NULL),
(2914, 23, NULL, '2019-02-03', 13.938, NULL),
(2915, 23, NULL, '2019-02-04', 14.024, NULL),
(2916, 23, NULL, '2019-02-07', 14.301, NULL),
(2917, 23, NULL, '2019-02-08', 14.519, NULL),
(2918, 23, NULL, '2019-02-11', 14.917, NULL),
(2919, 23, NULL, '2019-02-12', 15.152, NULL),
(2920, 28, NULL, '2019-02-01', 0.87, NULL),
(2921, 28, NULL, '2019-02-04', 1.281, NULL),
(2922, 28, NULL, '2019-02-07', 2.273, NULL),
(2923, 28, NULL, '2019-02-08', 3.137, NULL),
(2924, 28, NULL, '2019-02-11', 3.555, NULL),
(2925, 28, NULL, '2019-02-12', 4.364, NULL),
(2926, 10, NULL, '2019-02-01', 1131.754, NULL),
(2927, 10, NULL, '2019-02-03', 1133.917, NULL),
(2928, 10, NULL, '2019-02-04', 1134.5, NULL),
(2929, 10, NULL, '2019-02-07', 1137.062, NULL),
(2930, 10, NULL, '2019-02-08', 1139.715, NULL),
(2931, 10, NULL, '2019-02-11', 1141.718, NULL),
(2932, 10, NULL, '2019-02-12', 1143.355, NULL),
(2933, 4, NULL, '2019-02-01', 80.427, NULL),
(2934, 4, NULL, '2019-02-03', 80.486, NULL),
(2935, 4, NULL, '2019-02-04', 80.486, NULL),
(2936, 4, NULL, '2019-02-07', 80.58, NULL),
(2937, 4, NULL, '2019-02-08', 80.664, NULL),
(2938, 4, NULL, '2019-02-12', 80.729, NULL),
(2939, 4, NULL, '2019-02-11', 80.729, NULL),
(2940, 8, NULL, '2019-02-01', 222.1, NULL),
(2941, 8, NULL, '2019-02-03', 222.6, NULL),
(2942, 8, NULL, '2019-02-04', 223, NULL),
(2943, 8, NULL, '2019-02-07', 224.4, NULL),
(2944, 8, NULL, '2019-02-08', 225.7, NULL),
(2945, 8, NULL, '2019-02-11', 226, NULL),
(2946, 8, NULL, '2019-02-12', 227.5, NULL),
(2947, 20, NULL, '2019-02-01', 14, NULL),
(2948, 20, NULL, '2019-02-03', 14, NULL),
(2949, 20, NULL, '2019-02-04', 14, NULL),
(2950, 20, NULL, '2019-02-07', 14, NULL),
(2951, 20, NULL, '2019-02-08', 14, NULL),
(2952, 20, NULL, '2019-02-11', 14, NULL),
(2953, 20, NULL, '2019-02-12', 14, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agreement`
--
ALTER TABLE `agreement`
  ADD PRIMARY KEY (`agreement`), ADD UNIQUE KEY `identification1` (`client`,`room`,`start_date`), ADD KEY `room` (`room`);

--
-- Indexes for table `balance_initial`
--
ALTER TABLE `balance_initial`
  ADD PRIMARY KEY (`balance_initial`), ADD UNIQUE KEY `identification2` (`client`,`date`), ADD KEY `invoice` (`invoice`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`business`), ADD UNIQUE KEY `identification13` (`name`), ADD UNIQUE KEY `identification23` (`ceo`);

--
-- Indexes for table `charge`
--
ALTER TABLE `charge`
  ADD PRIMARY KEY (`charge`), ADD UNIQUE KEY `id4` (`invoice`,`service`), ADD KEY `service` (`service`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client`), ADD UNIQUE KEY `id5` (`name`);

--
-- Indexes for table `closing_balance`
--
ALTER TABLE `closing_balance`
  ADD PRIMARY KEY (`closing_balance`), ADD UNIQUE KEY `id6` (`invoice`);

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`credit`), ADD UNIQUE KEY `id7` (`client`,`reason`,`date`), ADD KEY `invoice` (`invoice`);

--
-- Indexes for table `debit`
--
ALTER TABLE `debit`
  ADD PRIMARY KEY (`debit`), ADD UNIQUE KEY `id8` (`client`,`reason`,`date`), ADD KEY `invoice` (`invoice`);

--
-- Indexes for table `eaccount`
--
ALTER TABLE `eaccount`
  ADD PRIMARY KEY (`eaccount`), ADD UNIQUE KEY `id9` (`num`);

--
-- Indexes for table `ebill`
--
ALTER TABLE `ebill`
  ADD PRIMARY KEY (`ebill`), ADD UNIQUE KEY `identification10` (`eaccount`,`due_date`), ADD KEY `msg` (`msg`), ADD KEY `invoice` (`invoice`);

--
-- Indexes for table `econnection`
--
ALTER TABLE `econnection`
  ADD PRIMARY KEY (`econnection`), ADD UNIQUE KEY `id11` (`room`,`emeter`,`end_date`), ADD KEY `emeter` (`emeter`);

--
-- Indexes for table `electricity`
--
ALTER TABLE `electricity`
  ADD PRIMARY KEY (`electricity`), ADD UNIQUE KEY `id12` (`eaccount`,`invoice`), ADD KEY `invoice` (`invoice`);

--
-- Indexes for table `elink`
--
ALTER TABLE `elink`
  ADD PRIMARY KEY (`elink`), ADD UNIQUE KEY `id13` (`emeter`,`eaccount`), ADD KEY `eaccount` (`eaccount`);

--
-- Indexes for table `emeter`
--
ALTER TABLE `emeter`
  ADD PRIMARY KEY (`emeter`), ADD UNIQUE KEY `id14` (`num`);

--
-- Indexes for table `ereading`
--
ALTER TABLE `ereading`
  ADD PRIMARY KEY (`ereading`), ADD UNIQUE KEY `identification15` (`emeter`,`date`), ADD KEY `invoice` (`invoice`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice`), ADD UNIQUE KEY `id16` (`client`,`period`,`is_valid`), ADD KEY `period` (`period`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job`), ADD UNIQUE KEY `id17` (`name`);

--
-- Indexes for table `mobile`
--
ALTER TABLE `mobile`
  ADD PRIMARY KEY (`mobile`), ADD UNIQUE KEY `id18` (`num`), ADD KEY `client` (`client`);

--
-- Indexes for table `msg`
--
ALTER TABLE `msg`
  ADD PRIMARY KEY (`msg`), ADD UNIQUE KEY `id19` (`id`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`note`), ADD UNIQUE KEY `id20` (`invoice`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment`), ADD UNIQUE KEY `id21` (`client`,`date`), ADD KEY `invoice` (`invoice`);

--
-- Indexes for table `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`period`), ADD UNIQUE KEY `identification22` (`year`,`month`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`picture`), ADD UNIQUE KEY `identification23` (`room`,`name`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent`), ADD UNIQUE KEY `id24` (`invoice`,`agreement`), ADD KEY `agreement` (`agreement`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room`), ADD UNIQUE KEY `identification25` (`uid`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service`), ADD UNIQUE KEY `id26` (`name`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`subscription`), ADD UNIQUE KEY `id27` (`client`,`service`), ADD KEY `service` (`service`);

--
-- Indexes for table `water`
--
ALTER TABLE `water`
  ADD PRIMARY KEY (`water`), ADD UNIQUE KEY `id28` (`wconnection`,`invoice`), ADD KEY `invoice` (`invoice`);

--
-- Indexes for table `wconnection`
--
ALTER TABLE `wconnection`
  ADD PRIMARY KEY (`wconnection`), ADD UNIQUE KEY `id29` (`room`,`wmeter`,`end_date`), ADD KEY `wmeter` (`wmeter`);

--
-- Indexes for table `wmeter`
--
ALTER TABLE `wmeter`
  ADD PRIMARY KEY (`wmeter`), ADD UNIQUE KEY `id30` (`serial_no`);

--
-- Indexes for table `wreading`
--
ALTER TABLE `wreading`
  ADD PRIMARY KEY (`wreading`), ADD UNIQUE KEY `identification31` (`date`,`wmeter`), ADD KEY `wmeter` (`wmeter`), ADD KEY `invoice` (`invoice`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agreement`
--
ALTER TABLE `agreement`
  MODIFY `agreement` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `balance_initial`
--
ALTER TABLE `balance_initial`
  MODIFY `balance_initial` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `business` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `charge`
--
ALTER TABLE `charge`
  MODIFY `charge` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=473;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `closing_balance`
--
ALTER TABLE `closing_balance`
  MODIFY `closing_balance` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=472;
--
-- AUTO_INCREMENT for table `credit`
--
ALTER TABLE `credit`
  MODIFY `credit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `debit`
--
ALTER TABLE `debit`
  MODIFY `debit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eaccount`
--
ALTER TABLE `eaccount`
  MODIFY `eaccount` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `ebill`
--
ALTER TABLE `ebill`
  MODIFY `ebill` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `econnection`
--
ALTER TABLE `econnection`
  MODIFY `econnection` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `electricity`
--
ALTER TABLE `electricity`
  MODIFY `electricity` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=464;
--
-- AUTO_INCREMENT for table `elink`
--
ALTER TABLE `elink`
  MODIFY `elink` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `emeter`
--
ALTER TABLE `emeter`
  MODIFY `emeter` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `ereading`
--
ALTER TABLE `ereading`
  MODIFY `ereading` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=968;
--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mobile`
--
ALTER TABLE `mobile`
  MODIFY `mobile` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `msg`
--
ALTER TABLE `msg`
  MODIFY `msg` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
  MODIFY `note` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `period`
--
ALTER TABLE `period`
  MODIFY `period` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `picture` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `rent` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=919;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `subscription` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `water`
--
ALTER TABLE `water`
  MODIFY `water` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT for table `wconnection`
--
ALTER TABLE `wconnection`
  MODIFY `wconnection` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `wmeter`
--
ALTER TABLE `wmeter`
  MODIFY `wmeter` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `wreading`
--
ALTER TABLE `wreading`
  MODIFY `wreading` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2954;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `agreement`
--
ALTER TABLE `agreement`
ADD CONSTRAINT `agreement_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`room`),
ADD CONSTRAINT `agreement_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`client`);

--
-- Constraints for table `balance_initial`
--
ALTER TABLE `balance_initial`
ADD CONSTRAINT `balance_initial_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client`),
ADD CONSTRAINT `balance_initial_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `charge`
--
ALTER TABLE `charge`
ADD CONSTRAINT `charge_ibfk_1` FOREIGN KEY (`service`) REFERENCES `service` (`service`),
ADD CONSTRAINT `charge_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `closing_balance`
--
ALTER TABLE `closing_balance`
ADD CONSTRAINT `closing_balance_ibfk_1` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `credit`
--
ALTER TABLE `credit`
ADD CONSTRAINT `credit_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client`),
ADD CONSTRAINT `credit_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `debit`
--
ALTER TABLE `debit`
ADD CONSTRAINT `debit_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client`),
ADD CONSTRAINT `debit_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `ebill`
--
ALTER TABLE `ebill`
ADD CONSTRAINT `ebill_ibfk_1` FOREIGN KEY (`msg`) REFERENCES `msg` (`msg`),
ADD CONSTRAINT `ebill_ibfk_2` FOREIGN KEY (`eaccount`) REFERENCES `eaccount` (`eaccount`),
ADD CONSTRAINT `ebill_ibfk_3` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `econnection`
--
ALTER TABLE `econnection`
ADD CONSTRAINT `econnection_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`room`),
ADD CONSTRAINT `econnection_ibfk_2` FOREIGN KEY (`emeter`) REFERENCES `emeter` (`emeter`);

--
-- Constraints for table `electricity`
--
ALTER TABLE `electricity`
ADD CONSTRAINT `electricity_ibfk_1` FOREIGN KEY (`eaccount`) REFERENCES `eaccount` (`eaccount`),
ADD CONSTRAINT `electricity_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `elink`
--
ALTER TABLE `elink`
ADD CONSTRAINT `elink_ibfk_1` FOREIGN KEY (`emeter`) REFERENCES `emeter` (`emeter`),
ADD CONSTRAINT `elink_ibfk_2` FOREIGN KEY (`eaccount`) REFERENCES `eaccount` (`eaccount`);

--
-- Constraints for table `ereading`
--
ALTER TABLE `ereading`
ADD CONSTRAINT `ereading_ibfk_1` FOREIGN KEY (`emeter`) REFERENCES `emeter` (`emeter`),
ADD CONSTRAINT `ereading_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client`),
ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`period`) REFERENCES `period` (`period`);

--
-- Constraints for table `mobile`
--
ALTER TABLE `mobile`
ADD CONSTRAINT `mobile_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client`);

--
-- Constraints for table `note`
--
ALTER TABLE `note`
ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client`),
ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `picture`
--
ALTER TABLE `picture`
ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`room`);

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`),
ADD CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`agreement`) REFERENCES `agreement` (`agreement`);

--
-- Constraints for table `subscription`
--
ALTER TABLE `subscription`
ADD CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client`),
ADD CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`service`) REFERENCES `service` (`service`);

--
-- Constraints for table `water`
--
ALTER TABLE `water`
ADD CONSTRAINT `water_ibfk_1` FOREIGN KEY (`wconnection`) REFERENCES `wconnection` (`wconnection`),
ADD CONSTRAINT `water_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

--
-- Constraints for table `wconnection`
--
ALTER TABLE `wconnection`
ADD CONSTRAINT `wconnection_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`room`),
ADD CONSTRAINT `wconnection_ibfk_2` FOREIGN KEY (`wmeter`) REFERENCES `wmeter` (`wmeter`);

--
-- Constraints for table `wreading`
--
ALTER TABLE `wreading`
ADD CONSTRAINT `wreading_ibfk_1` FOREIGN KEY (`wmeter`) REFERENCES `wmeter` (`wmeter`),
ADD CONSTRAINT `wreading_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
