-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Host: 127.12.123.2:3306
-- Generation Time: Jan 05, 2016 at 12:16 AM
-- Server version: 5.5.45
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tweet_a_complaint`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`adminS1S5VEn`@`127.12.123.2` PROCEDURE `getComplaints`(IN uname varchar(30))
BEGIN
  Select * from complaint 
  where Dept_ID=(
     	select Dept_ID from department 
     	where Dept_Name=(
              select User_Type from user_profile where User_Name = uname));
END$$

CREATE DEFINER=`adminS1S5VEn`@`127.12.123.2` PROCEDURE `UpdateComplaint`(
IN Username VARCHAR( 30 ),
    IN Comments varchar(30)
    
)
BEGIN
UPDATE complaint SET Resolution_Status =  'Resolved', Comments= Comments WHERE User_Name = Username;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE IF NOT EXISTS `complaint` (
  `Complaint_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(140) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Location` varchar(1000) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Resolution_Status` varchar(15) COLLATE utf8_general_mysql500_ci NOT NULL,
  `HashTag` varchar(10) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Dept_ID` varchar(10) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Tweet_ID` varchar(100) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `User_Name` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL,
  `comments` varchar(256) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`Complaint_ID`),
  KEY `User_Name` (`User_Name`),
  KEY `Dept_ID` (`Dept_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`Complaint_ID`, `Description`, `Location`, `Resolution_Status`, `HashTag`, `Dept_ID`, `Tweet_ID`, `User_Name`, `comments`) VALUES
(1, 'Noisy Neighbour', 'UT North', 'Resolved', '#Police', 'D01', 'T103', 'graham', 'The complaint has been resolved'),
(2, 'Short Circuit', 'Ashford', 'Resolved', '#Fire', 'D02', 'T101', 'abhinay', 'sorry, our team is involved in other incidents'),
(3, 'Health Issue', 'UT North', 'Resolved', '#Health', 'D03', 'T105', 'graham', 'The complaint has been resolved'),
(4, 'Robbery', 'Ashford', 'Resolved', '#Police', 'D01', 'T102', 'abhinay', 'sorry, our team is involved in other incidents'),
(6, 'Fire Emergency', 'Downtown', 'Resolved', '#Fire', 'D02', 'T104', 'srivani', 'resolved by our team'),
(11, 'fire at utnorth-dummy', 'UT North', 'Resolved', '#Fire', 'D02', NULL, 'abhinay', 'sorry, our team is involved in other incidents'),
(12, 'no response from utd fire', 'UT North', 'Resolved', '#Fire', 'D02', NULL, 'abhinay', 'sorry, our team is involved in other incidents'),
(15, 'police no action', 'UT Drive', 'Resolved', '#Police', 'D01', NULL, 'abhinay', 'sorry, our team is involved in other incidents'),
(16, 'no beds in hospital', 'Ashford', 'Open', '#Health', 'D03', NULL, 'srivani', ''),
(17, 'fire at atkins, fired up blockheads #DBSystems', 'UNCC', 'Open', '#Fire', 'D02', NULL, 'vaishnavi', ''),
(18, 'Take care blockheads, find some sleep', 'UNCC', 'Open', '#Health', 'D03', NULL, 'vaishnavi', ''),
(19, 'ambulance not on time', 'Ashford', 'Open', '#Health', 'D03', '672226363961667000', 'srivani', ''),
(20, 'its not safe out here, provide security', 'UT Drive', 'Open', '#Police', 'D01', NULL, 'vaishnavi', ''),
(21, 'they came late', 'UNCC', 'Resolved', '#Fire', 'D02', NULL, 'abhinay', 'sorry, our team is involved in other incidents'),
(22, 'stray dog needs to find a home #health', 'UNCC', 'Open', '#Health', 'D03', NULL, 'plthomps', ''),
(23, 'someone is driving too fast #police', 'Ashford', 'Resolved', '#Police', 'D01', NULL, 'plthomps', 'arrested'),
(24, 'Late ', 'UNCC', 'Resolved', '#Fire', 'D02', NULL, 'abhinay', 'sorry, our team is involved in other incidents'),
(25, '#fire', 'UNCC', 'Open', '#Fire', 'D02', NULL, 'aditya', ''),
(26, 'emergency ', 'UT Drive', 'Open', '#Health', 'D03', NULL, 'harsha', ''),
(27, 'abhinay is eating too much in bday parties ', 'UNCC', 'Open', '#Health', 'D03', NULL, 'abc', ''),
(28, 'Exams Ache, damn with exams', 'UNCC', 'Open', '#Health', 'D03', NULL, 'vaishnavi', '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `Dept_ID` varchar(10) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Dept_Name` varchar(10) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Location` varchar(10) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  PRIMARY KEY (`Dept_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dept_ID`, `Dept_Name`, `Location`) VALUES
('D01', 'Police', 'Ashford'),
('D02', 'Fire', ' UT North'),
('D03', 'Health', 'Downtown');

-- --------------------------------------------------------

--
-- Table structure for table `fire_department`
--

CREATE TABLE IF NOT EXISTS `fire_department` (
  `Dept_ID` varchar(10) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Emergency_Fire_Dial` varchar(10) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  KEY `Dept_ID` (`Dept_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `fire_department`
--

INSERT INTO `fire_department` (`Dept_ID`, `Emergency_Fire_Dial`) VALUES
('D02', '901');

-- --------------------------------------------------------

--
-- Table structure for table `health_department`
--

CREATE TABLE IF NOT EXISTS `health_department` (
  `Dept_ID` varchar(10) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Emergency_Health_Dial` varchar(10) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  KEY `Dept_ID` (`Dept_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `health_department`
--

INSERT INTO `health_department` (`Dept_ID`, `Emergency_Health_Dial`) VALUES
('D03', '912');

-- --------------------------------------------------------

--
-- Table structure for table `police_department`
--

CREATE TABLE IF NOT EXISTS `police_department` (
  `Dept_ID` varchar(10) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Emergency_Police_Dial` varchar(10) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  KEY `Dept_ID` (`Dept_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `police_department`
--

INSERT INTO `police_department` (`Dept_ID`, `Emergency_Police_Dial`) VALUES
('D01', '911');

-- --------------------------------------------------------

--
-- Table structure for table `twitter_data`
--

CREATE TABLE IF NOT EXISTS `twitter_data` (
  `Tweet_ID` varchar(100) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Tweet` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Impression` int(11) DEFAULT NULL,
  `Re-tweets` int(20) NOT NULL,
  `Likes` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `twitter_data`
--

INSERT INTO `twitter_data` (`Tweet_ID`, `Tweet`, `Impression`, `Re-tweets`, `Likes`) VALUES
('Tweet id', 'Tweet text', 0, 0, 0),
('672226363961667000', 'ambulance not on time', 1, 0, 0),
('672222481923600000', '"Take care blockheads', 0, 12, 0),
('672222221411196000', '"fire at atkins', 0, 10, 0),
('672222170974699000', 'no beds in hospital #Health', 10, 0, 1),
('672221801410371000', 'police no action #Police', 10, 0, 0),
('672181938791256000', '#', 13, 0, 0),
('672159827871834000', 'no response from utd fire #Fire', 20, 0, 0),
('672159358889926000', 'fire at utnorth-dummy #Fire', 20, 0, 0),
('671451428112715000', 'no action taken', 28, 0, 1),
('669192501903929000', 'fire accident but no response when i call', 8, 0, 1),
('669170287360000000', 'robbery in 9523 b', 9, 0, 1),
('669167498638573000', 'Test Tweet complaint new 1', 12, 0, 0),
('669167158463758000', 'Test Tweet complaint new', 12, 0, 0),
('669160323400802000', 'Test Tweet complaint', 8, 0, 0);

--
-- Triggers `twitter_data`
--
DROP TRIGGER IF EXISTS `update_tweet_id`;
DELIMITER //
CREATE TRIGGER `update_tweet_id` AFTER INSERT ON `twitter_data`
 FOR EACH ROW begin
       DECLARE id_exists Boolean;
       -- Check Complaint table
       SELECT 1
       INTO @id_exists
       FROM complaint
       WHERE trim(complaint.description)= trim(NEW.tweet);

       IF @id_exists = 1
       THEN
           UPDATE complaint
           SET tweet_id = NEW.tweet_id
           WHERE complaint.description = NEW.tweet;
        END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `userprofiles_tbl`
--

CREATE TABLE IF NOT EXISTS `userprofiles_tbl` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT,
  `vcUser_fullname` varchar(256) NOT NULL,
  `vcUser_email` varchar(256) NOT NULL,
  `vcUser_address` varchar(256) NOT NULL,
  `vcUser_city` varchar(256) NOT NULL,
  `vcUser_username` varchar(256) NOT NULL,
  `vcUser_password` varchar(256) NOT NULL,
  `vcUser_type` varchar(256) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `indexUsername` (`vcUser_username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `userprofiles_tbl`
--

INSERT INTO `userprofiles_tbl` (`user_id`, `vcUser_fullname`, `vcUser_email`, `vcUser_address`, `vcUser_city`, `vcUser_username`, `vcUser_password`, `vcUser_type`) VALUES
(1, 'abhi', 'abhi@gmail.com', 'univ', 'charlotte', 'abhi', 'MTIzNA==', 'user'),
(3, 'test', 'test@test.com', 'test', 'test', 'test', 'dGVzdA==', 'user'),
(4, 'sandeep', 'sandeep@nall.com', '9523', 'charlotte', 'sandeep', 'cXdlcnR5', 'user'),
(5, 'harish', 'harish@harish.com', 'ashford', 'charlotte', 'harish', 'aGFyaXNo', 'user'),
(6, 'fire', 'fire@fire.com', 'UT Drive', 'charlotte', 'fire', 'MTIzNA==', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `User_Name` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL,
  `FullName` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Address` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL,
  `User_Type` varchar(10) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Password` varchar(15) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Email` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL,
  `City` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`User_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`User_Name`, `FullName`, `Address`, `User_Type`, `Password`, `Email`, `City`) VALUES
('abc', 'abc', 'charlotte', 'User', 'abc', 'abc@gmail.com', 'nc'),
('abhinay', 'Balusu', '9309, Apt G', 'User', 'Hello123', 'abhinay@balusu.com', 'charlotte'),
('achyut', 'Achyut', '931', 'user', 'achyut123', 'arampalli@uncc.edu', 'Charlotte'),
('aditya', 'Aditya', '419 Barton Creek Dr', 'User', 'aditya', 'ajumde@uncc.edu', 'Charlotte'),
('ginnyt129', 'Virginia Thompson', '2300 W Innes Street', 'User', 'catupromise1', 'ginnyt129@gmail.com', 'Salisbury, NC  28144'),
('graham', 'Tuscano', '11011, Apt H, Graduate Lane', 'User', 'Abc777', 'graham@tuscano.com', 'charlotte'),
('harsha', 'harsha bommareddy', '9547 apartment G', 'User', 'harsha', 'harshabommareddy94@gmail.com', 'CHARLOTTE'),
('mano', 'Vikas', '74638', 'Health', 'Health@123', 'mano@vikas.com', 'charlotte'),
('plthomps', 'Pamela Thompson', 'main street', 'User', 'indians', 'plthomps@uncc.edu', 'salisbury, nc'),
('shrujan', 'Kotturi', 'A234', 'Police', 'Police@123', 'shrujan@kotturi.com', 'charlotte'),
('skotturi', 'Shrujan Kotturi', '9312 Kittansett Drive Apt G', 'user', 'shrujan123', 'skotturi@uncc.edu', 'Charlotte'),
('sriharish', 'Ranganathan', 'B7982', 'Fire', 'Fire@123', 'harish@r.com', 'charlotte'),
('srivani', 'Surname', '12542', 'User', 'Srivani_567', 'srivani@j.com', 'charlotte'),
('vaishnavi', 'vaishnavi', '9', 'User', 'vaishnavi', 'vaishnavi@uncc.edu', 'ch');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`);

--
-- Constraints for table `fire_department`
--
ALTER TABLE `fire_department`
  ADD CONSTRAINT `fire_department_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`);

--
-- Constraints for table `health_department`
--
ALTER TABLE `health_department`
  ADD CONSTRAINT `health_department_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`);

--
-- Constraints for table `police_department`
--
ALTER TABLE `police_department`
  ADD CONSTRAINT `police_department_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
