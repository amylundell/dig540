-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 16, 2015 at 06:43 PM
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
-- Table structure for table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `dates` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Name` (`name`(255),`dates`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `name`, `dates`) VALUES
(1, 'Doyle, Sir Arthur Conan', '1859-1930'),
(2, 'Burgess, Thornton W.', '1874-1965'),
(3, 'Austen, Jane', '1775-1817');

-- --------------------------------------------------------

--
-- Table structure for table `author_work`
--

CREATE TABLE IF NOT EXISTS `author_work` (
  `author_id` int(8) NOT NULL,
  `work_id` int(8) NOT NULL,
  KEY `Author_ID` (`author_id`,`work_id`),
  KEY `Work_ID` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `author_work`
--

INSERT INTO `author_work` (`author_id`, `work_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE IF NOT EXISTS `chapter` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `running_time` time NOT NULL,
  `recording_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Title` (`title`(255),`recording_id`),
  KEY `Recording_ID` (`recording_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`id`, `title`, `running_time`, `recording_id`) VALUES
(1, 'Part One', '00:31:44', 1),
(2, 'Part Two', '00:34:20', 1),
(3, '01-Chatterer the Red Squirrel Runs for His Life', '00:05:16', 2),
(4, '02-Chatterer''s Last Chance', '00:04:37', 2),
(5, 'Chapter One', '00:06:31', 3),
(6, 'Chapter Two', '00:04:38', 3);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `name`) VALUES
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
-- Table structure for table `person_recording`
--

CREATE TABLE IF NOT EXISTS `person_recording` (
  `person_id` int(8) NOT NULL,
  `role` enum('Reader','Book Coordinator','Meta Coordinator','Proof Listener') COLLATE utf8_unicode_ci NOT NULL,
  `character_read` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `recording_id` int(8) NOT NULL,
  KEY `Person_ID` (`person_id`,`role`,`character_read`(255),`recording_id`),
  KEY `Recording_ID` (`recording_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person_recording`
--

INSERT INTO `person_recording` (`person_id`, `role`, `character_read`, `recording_id`) VALUES
(1, 'Reader', 'Narrator', 1),
(1, 'Book Coordinator', '', 1),
(1, 'Meta Coordinator', '', 1),
(2, 'Proof Listener', '', 1),
(3, 'Reader', 'Narrator (chapters 1, 10, 11, 16, 17, 23)', 2),
(4, 'Reader', 'Narrator (chapters 2, 3, 12, 13, 14, 15)', 2),
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
-- Table structure for table `recording`
--

CREATE TABLE IF NOT EXISTS `recording` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(2) NOT NULL,
  `language` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `narration_type` enum('Solo','Collaborative','Dramatic') COLLATE utf8_unicode_ci NOT NULL,
  `running_time` time NOT NULL,
  `zip_file_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `catalog_date` date NOT NULL,
  `website_link` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Title` (`title`(255),`version`,`language`,`narration_type`,`catalog_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `recording`
--

INSERT INTO `recording` (`id`, `title`, `version`, `language`, `narration_type`, `running_time`, `zip_file_size`, `catalog_date`, `website_link`) VALUES
(1, 'The Adventure of the Speckled Band', 1, 'English', 'Solo', '01:06:04', '31MB', '2013-11-08', 'https://librivox.org/the-adventure-of-the-speckled-band-by-sir-arthur-conan-doyle/'),
(2, 'The Adventures of Chatterer the Red Squirrel', 1, 'English', 'Collaborative', '02:04:05', '59.6MB', '2013-08-09', 'https://librivox.org/the-adventures-of-chatterer-the-red-squirel-by-thornton-w-burgess/'),
(3, 'Pride and Prejudice', 6, 'English', 'Dramatic', '11:57:51', '342.1MB', '2011-07-24', 'https://librivox.org/pride-and-prejudice-by-jane-austen-3/');

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `original_publish_date` int(4) NOT NULL,
  `website_link` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Original_Publish_Date` (`original_publish_date`),
  KEY `Title` (`title`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`id`, `title`, `summary`, `original_publish_date`, `website_link`) VALUES
(1, 'The Adventure of the Speckled Band', 'Sherlock Holmes and Watson are awoken early by a distraught woman desperately seeking their aid. Something is terribly wrong and she fears for her life. Upon hearing her story, Sherlock agrees and springs into action to track down and deal with the sinister Speckled Band who have killed once already. Listen to another exciting adventure of the super sleuth as he uses his powers of observation and deduction to solve this perplexing case. Will he be in time to save the lady''s life? Will his powers fail him this time? Listen and find out. (summary by Phil Chenevert )', 1892, 'http://www.gutenberg.org/ebooks/1661'),
(2, 'The Adventures of Chatterer the Red Squirrel', 'Chatterer the Red Squirrel finds himself in trouble again and is forced to abandon his old home. As the search for a new home begins, Chatterer''s curiosity gets the better of him and a moment of carelessness causes him to stumble into a far different home than he ever imagined. This book is Thornton W. Burgess at his best as he captures the personalities and behaviors of the animals in the Green Forest delightfully well and tells a story of mischievousness and unexpected friendship. (Summary by Jill Engle)', 1915, 'http://www.gutenberg.org/ebooks/37952'),
(3, 'Pride and Prejudice', 'Pride and Prejudice is a novel by Jane Austen, first published in 1813. The story follows the main character Elizabeth Bennet as she deals with issues of manners, upbringing, morality, education and marriage in the society of the landed gentry of early 19th-century England. Elizabeth is the second of five daughters of a country gentleman, living near the fictional town of Meryton in Hertfordshire, near London.\r\n\r\nIn this reading, Librivox volunteers lend their voices to dramatize Jane Austen''s classic and well-loved novel. (Summary by Wikipedia and wildemoose)\r\n', 1813, 'http://www.gutenberg.org/ebooks/1342');

-- --------------------------------------------------------

--
-- Table structure for table `work_recording`
--

CREATE TABLE IF NOT EXISTS `work_recording` (
  `work_id` int(8) NOT NULL,
  `recording_id` int(8) NOT NULL,
  KEY `Work_ID` (`work_id`,`recording_id`),
  KEY `Recording_ID` (`recording_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `work_recording`
--

INSERT INTO `work_recording` (`work_id`, `recording_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author_work`
--
ALTER TABLE `author_work`
  ADD CONSTRAINT `author_work_ibfk_4` FOREIGN KEY (`work_id`) REFERENCES `work` (`ID`),
  ADD CONSTRAINT `author_work_ibfk_1` FOREIGN KEY (`Author_ID`) REFERENCES `author` (`ID`),
  ADD CONSTRAINT `author_work_ibfk_2` FOREIGN KEY (`Work_ID`) REFERENCES `work` (`ID`),
  ADD CONSTRAINT `author_work_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `author` (`ID`);

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_2` FOREIGN KEY (`recording_id`) REFERENCES `recording` (`id`),
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`Recording_ID`) REFERENCES `recording` (`ID`);

--
-- Constraints for table `person_recording`
--
ALTER TABLE `person_recording`
  ADD CONSTRAINT `person_recording_ibfk_3` FOREIGN KEY (`person_id`) REFERENCES `person` (`ID`),
  ADD CONSTRAINT `person_recording_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`ID`),
  ADD CONSTRAINT `person_recording_ibfk_2` FOREIGN KEY (`Recording_ID`) REFERENCES `recording` (`ID`),
  ADD CONSTRAINT `person_recording_ibfk_4` FOREIGN KEY (`recording_id`) REFERENCES `recording` (`id`);

--
-- Constraints for table `work_recording`
--
ALTER TABLE `work_recording`
  ADD CONSTRAINT `work_recording_ibfk_3` FOREIGN KEY (`work_id`) REFERENCES `work` (`ID`),
  ADD CONSTRAINT `work_recording_ibfk_1` FOREIGN KEY (`Work_ID`) REFERENCES `work` (`ID`),
  ADD CONSTRAINT `work_recording_ibfk_2` FOREIGN KEY (`Recording_ID`) REFERENCES `recording` (`ID`),
  ADD CONSTRAINT `work_recording_ibfk_4` FOREIGN KEY (`recording_id`) REFERENCES `recording` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
