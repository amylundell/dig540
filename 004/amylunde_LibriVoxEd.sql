-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 06, 2015 at 09:17 PM
-- Server version: 5.5.45-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `amylunde_LibriVoxEd`
--

-- --------------------------------------------------------

--
-- Table structure for table `Author`
--

CREATE TABLE IF NOT EXISTS `Author` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Dates` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Name` (`Name`(255),`Dates`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Author`
--

INSERT INTO `Author` (`ID`, `Name`, `Dates`) VALUES
(1, 'Doyle, Sir Arthur Conan', '1859-1930'),
(2, 'Burgess, Thornton W.', '1874-1965'),
(3, 'Austen, Jane', '1775-1817');

-- --------------------------------------------------------

--
-- Table structure for table `Author_Work`
--

CREATE TABLE IF NOT EXISTS `Author_Work` (
  `Author_ID` int(8) NOT NULL,
  `Work_ID` int(8) NOT NULL,
  KEY `Author_ID` (`Author_ID`,`Work_ID`),
  KEY `Work_ID` (`Work_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Author_Work`
--

INSERT INTO `Author_Work` (`Author_ID`, `Work_ID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Chapter`
--

CREATE TABLE IF NOT EXISTS `Chapter` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Running_Time` time NOT NULL,
  `Recording_ID` int(8) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Title` (`Title`(255),`Recording_ID`),
  KEY `Recording_ID` (`Recording_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Chapter`
--

INSERT INTO `Chapter` (`ID`, `Title`, `Running_Time`, `Recording_ID`) VALUES
(1, 'Part One', '00:31:44', 1),
(2, 'Part Two', '00:34:20', 1),
(3, '01-Chatterer the Red Squirrel Runs for His Life', '00:05:16', 2),
(4, '02-Chatterer''s Last Chance', '00:04:37', 2),
(5, 'Chapter One', '00:06:31', 3),
(6, 'Chapter Two', '00:04:38', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Person`
--

CREATE TABLE IF NOT EXISTS `Person` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `Person`
--

INSERT INTO `Person` (`ID`, `Name`) VALUES
(10, 'Andy Minter'),
(7, 'Arielle Lipshaw'),
(9, 'Beth Thomas'),
(8, 'Betty M.'),
(2, 'DaveC'),
(6, 'Debra Lynn'),
(11, 'Elizabeth Klett'),
(4, 'Jill Engle'),
(12, 'John Fricker'),
(3, 'maryagneskatherine'),
(5, 'Paula Santa'),
(13, 'Peter Bishop'),
(1, 'Phil Chenevert');

-- --------------------------------------------------------

--
-- Table structure for table `Person_Recording`
--

CREATE TABLE IF NOT EXISTS `Person_Recording` (
  `Person_ID` int(8) NOT NULL,
  `Role` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Character` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Recording_ID` int(8) NOT NULL,
  KEY `Person_ID` (`Person_ID`,`Role`(255),`Character`(255),`Recording_ID`),
  KEY `Recording_ID` (`Recording_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Person_Recording`
--

INSERT INTO `Person_Recording` (`Person_ID`, `Role`, `Character`, `Recording_ID`) VALUES
(1, 'Reader', 'Narrator', 1),
(1, 'Book Coordinator', '', 1),
(1, 'Meta Coordinator', '', 1),
(2, 'Proof Listener', '', 1),
(3, 'Reader', 'Narrator (chapters 1, 10, 11, 16, 17, & 23)', 2),
(4, 'Reader', 'Narrator (chapters 2, 3, & 12-15)', 2),
(4, 'Book Coordinator', '', 2),
(1, 'Meta Coordinator', '', 2),
(5, 'Proof Listener', '', 2),
(6, 'Reader', 'Narrator', 3),
(7, 'Reader', 'Elizabeth Bennet', 3),
(7, 'Book Coordinator', '', 3),
(7, 'Meta Coordinator', '', 3),
(8, 'Proof Listener', '', 3),
(9, 'Reader', 'Mrs. Bennet', 3),
(9, 'Reader', 'Young Mr. Lucas', 3),
(10, 'Reader', 'Mr. Bennet', 3),
(11, 'Reader', 'Jane Bennet', 3),
(12, 'Reader', 'Mr. Bingley', 3),
(13, 'Reader', 'Mr. Darcy', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Recording`
--

CREATE TABLE IF NOT EXISTS `Recording` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(2) NOT NULL,
  `Language` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Narration_Type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `Running_Time` time NOT NULL,
  `Zip_File_Size` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Catalog_Date` date NOT NULL,
  `Website_Link` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Title` (`Title`(255),`Version`,`Language`,`Narration_Type`,`Catalog_Date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Recording`
--

INSERT INTO `Recording` (`ID`, `Title`, `Version`, `Language`, `Narration_Type`, `Running_Time`, `Zip_File_Size`, `Catalog_Date`, `Website_Link`) VALUES
(1, 'The Adventure of the Speckled Band', 1, 'English', 'Solo', '01:06:04', '31MB', '2013-11-08', 'https://librivox.org/the-adventure-of-the-speckled-band-by-sir-arthur-conan-doyle/'),
(2, 'The Adventures of Chatterer the Red Squirrel', 1, 'English', 'Collaborative', '02:04:05', '59.6MB', '2013-08-09', 'https://librivox.org/the-adventures-of-chatterer-the-red-squirel-by-thornton-w-burgess/'),
(3, 'Pride and Prejudice', 6, 'English', 'Dramatic', '11:57:51', '342.1MB', '2011-07-24', 'https://librivox.org/pride-and-prejudice-by-jane-austen-3/');

-- --------------------------------------------------------

--
-- Table structure for table `Work`
--

CREATE TABLE IF NOT EXISTS `Work` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Original_Publish_Date` int(4) NOT NULL,
  `Website_Link` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Original_Publish_Date` (`Original_Publish_Date`),
  KEY `Title` (`Title`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Work`
--

INSERT INTO `Work` (`ID`, `Title`, `Summary`, `Original_Publish_Date`, `Website_Link`) VALUES
(1, 'The Adventure of the Speckled Band', 'Sherlock Holmes and Watson are awoken early by a distraught woman desperately seeking their aid. Something is terribly wrong and she fears for her life. Upon hearing her story, Sherlock agrees and springs into action to track down and deal with the sinister Speckled Band who have killed once already. Listen to another exciting adventure of the super sleuth as he uses his powers of observation and deduction to solve this perplexing case. Will he be in time to save the lady''s life? Will his powers fail him this time? Listen and find out. (summary by Phil Chenevert )', 1892, 'http://www.gutenberg.org/ebooks/1661'),
(2, 'The Adventures of Chatterer the Red Squirrel', 'Chatterer the Red Squirrel finds himself in trouble again and is forced to abandon his old home. As the search for a new home begins, Chatterer''s curiosity gets the better of him and a moment of carelessness causes him to stumble into a far different home than he ever imagined. This book is Thornton W. Burgess at his best as he captures the personalities and behaviors of the animals in the Green Forest delightfully well and tells a story of mischievousness and unexpected friendship. (Summary by Jill Engle)', 1915, 'http://www.gutenberg.org/ebooks/37952'),
(3, 'Pride and Prejudice', 'Pride and Prejudice is a novel by Jane Austen, first published in 1813. The story follows the main character Elizabeth Bennet as she deals with issues of manners, upbringing, morality, education and marriage in the society of the landed gentry of early 19th-century England. Elizabeth is the second of five daughters of a country gentleman, living near the fictional town of Meryton in Hertfordshire, near London.\r\n\r\nIn this reading, Librivox volunteers lend their voices to dramatize Jane Austen''s classic and well-loved novel. (Summary by Wikipedia and wildemoose)\r\n', 1813, 'http://www.gutenberg.org/ebooks/1342');

-- --------------------------------------------------------

--
-- Table structure for table `Work_Recording`
--

CREATE TABLE IF NOT EXISTS `Work_Recording` (
  `Work_ID` int(8) NOT NULL,
  `Recording_ID` int(8) NOT NULL,
  KEY `Work_ID` (`Work_ID`,`Recording_ID`),
  KEY `Recording_ID` (`Recording_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Work_Recording`
--

INSERT INTO `Work_Recording` (`Work_ID`, `Recording_ID`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Author_Work`
--
ALTER TABLE `Author_Work`
  ADD CONSTRAINT `Author_Work_ibfk_2` FOREIGN KEY (`Work_ID`) REFERENCES `Work` (`ID`),
  ADD CONSTRAINT `Author_Work_ibfk_1` FOREIGN KEY (`Author_ID`) REFERENCES `Author` (`ID`);

--
-- Constraints for table `Chapter`
--
ALTER TABLE `Chapter`
  ADD CONSTRAINT `Chapter_ibfk_1` FOREIGN KEY (`Recording_ID`) REFERENCES `Recording` (`ID`);

--
-- Constraints for table `Person_Recording`
--
ALTER TABLE `Person_Recording`
  ADD CONSTRAINT `Person_Recording_ibfk_2` FOREIGN KEY (`Recording_ID`) REFERENCES `Recording` (`ID`),
  ADD CONSTRAINT `Person_Recording_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `Person` (`ID`);

--
-- Constraints for table `Work_Recording`
--
ALTER TABLE `Work_Recording`
  ADD CONSTRAINT `Work_Recording_ibfk_2` FOREIGN KEY (`Recording_ID`) REFERENCES `Recording` (`ID`),
  ADD CONSTRAINT `Work_Recording_ibfk_1` FOREIGN KEY (`Work_ID`) REFERENCES `Work` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
