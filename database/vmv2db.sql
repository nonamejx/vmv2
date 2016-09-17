-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2016 at 09:07 AM
-- Server version: 5.7.15-0ubuntu0.16.04.1
-- PHP Version: 5.6.25-2+deb.sury.org~xenial+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vmv2db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDisease` (IN `p_disease_id` INT(11))  BEGIN
	DELETE FROM `disease` WHERE `disease_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteNews` (IN `p_news_id` INT(11))  BEGIN
	DELETE FROM `news` WHERE `news_id`=p_news_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUser` (IN `p_user_id` INT(11))  BEGIN
	DELETE FROM `user` WHERE `user_id`=p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVaccinationRecord` (IN `p_user_id` INT(11), IN `p_vaccine_id` INT(11), IN `p_dose` INT(11))  BEGIN
	DELETE FROM `vaccination_record` WHERE `user_id`=p_user_id and`vaccine_id`=p_vaccine_id and `dose`=p_dose;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVaccine` (IN `p_vaccine_id` INT(11))  BEGIN
	DELETE FROM `vaccine` WHERE `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVaccineDisease` (IN `p_vaccine_id` INT(11), IN `p_disease_id` INT(11))  BEGIN
	DELETE FROM `vaccine_disease` WHERE `vaccine_id`=p_vaccine_id and `disease_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDisease` ()  BEGIN
SELECT * FROM disease;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllNews` ()  BEGIN
	SELECT * FROM news;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUser` ()  BEGIN
SELECT * FROM user;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllVaccinationRecord` ()  BEGIN
SELECT * FROM vaccination_record;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllVaccine` ()  BEGIN
	SELECT * FROM vaccine;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllVaccineDisease` ()  BEGIN
SELECT * FROM vaccine_disease;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDiseaseById` (IN `p_disease_id` INT)  BEGIN
SELECT * FROM disease WHERE `user_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getNewsById` (IN `p_new_id` INT(11))  BEGIN
SELECT * FROM news WHERE `news_id`=p_new_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserById` (IN `p_user_id` INT)  BEGIN
SELECT * FROM user WHERE `user_id`=p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getVaccinationRecordByUser` (IN `p_user_id` INT)  BEGIN
SELECT * FROM vaccination_record WHERE `user_id`=p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getVaccinationRecordByVaccine` (IN `p_vaccine_id` INT)  BEGIN
SELECT * FROM vaccination_record WHERE `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getVaccineById` (IN `p_vaccine_id` INT(11))  BEGIN
SELECT * FROM vaccine WHERE `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getVaccineDiseaseById` (IN `p_vaccine_id` INT, IN `p_disease_id` INT)  BEGIN
SELECT * FROM vaccine_disease WHERE `vaccine_id`=p_vaccine_id and `disease_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDisease` (IN `disease_name` VARCHAR(255), IN `description` TEXT)  BEGIN
INSERT INTO disease(`disease_name`, `description`) values (disease_name, description);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertNew` (IN `title` TEXT, IN `content` TEXT, IN `image` TEXT, IN `created_date` DATETIME)  BEGIN
INSERT INTO news(`title`, `content`, `image`, `created_date`) values (title, content, image, created_date);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser` (IN `full_name` VARCHAR(255), IN `gender` VARCHAR(255), IN `birthday` DATE, IN `phone_number` VARCHAR(20), IN `address` VARCHAR(255), IN `username` VARCHAR(255), IN `password` VARCHAR(255), IN `role` INT, IN `avatar` TEXT)  BEGIN
INSERT INTO user(`full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar`) VALUES(full_name, gender, birthday, phone_number, address, username, password, role, avatar);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVaccinationRecord` (IN `user_id` INT(11), IN `vaccine_id` INT(11), IN `dose` INT(11), IN `injection_date` DATE, IN `next_dose_date` DATE)  BEGIN
INSERT INTO vaccination_record(`user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date`) VALUES(user_id, vaccine_id, dose, injection_date, next_dose_date);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVaccine` (IN `vaccine_name` VARCHAR(255), IN `manufacturer` VARCHAR(255), IN `price` DOUBLE, IN `number_of_doses` INT(11), IN `side_effects` TEXT, IN `indication` TEXT, IN `contraindication` TEXT, IN `dosage_and_usage` TEXT, IN `image` TEXT)  BEGIN
INSERT INTO vaccine(`vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image`) VALUES(vaccine_name, manufacturer, price, number_of_doses, side_effects, indication, contraindication, dosage_and_usage, image);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVaccineDisease` (IN `vaccine_id` INT(11), IN `disease_id` INT(11), IN `note` TEXT)  BEGIN
INSERT INTO vaccine_disease(`vaccine_id`, `disease_id`, `note`) VALUES(vaccine_id, disease_id, note);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDisease` (IN `disease_name` VARCHAR(255), IN `description` TEXT, IN `p_disease_id` INT(11))  BEGIN
UPDATE `disease` SET `disease_name`=disease_name,`description`=description WHERE `disease_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateNews` (IN `title` TEXT, IN `content` TEXT, IN `image` TEXT, IN `created_date` DATETIME, IN `p_news_id` INT(11))  BEGIN
UPDATE `news` SET `title`=title,`content`=content,`image`=image,`created_date`=created_date WHERE `news_id`=p_news_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser` (IN `p_user_id` INT(11), IN `full_name` VARCHAR(255), IN `gender` VARCHAR(255), IN `birthday` DATE, IN `phone_number` VARCHAR(20), IN `address` VARCHAR(255), IN `username` VARCHAR(255), IN `password` VARCHAR(255), IN `role` INT, IN `avatar` TEXT)  BEGIN
UPDATE `user` SET `full_name`=full_name,`gender`=gender,`birthday`=birthday,`phone_number`=phone_number,`address`=address,`username`=username,`password`=password,`role`=role,`avatar`=avatar WHERE `user_id`=p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVaccinationRecord` (IN `injection_date` DATE, IN `next_dose_date` DATE, IN `p_user_id` INT(11), IN `p_vaccine_id` INT(11), IN `p_dose` INT(11))  BEGIN
UPDATE `vaccination_record` SET `injection_date`=injection_date,`next_dose_date`=next_dose_date where `user_id`=p_user_id and`vaccine_id`=p_vaccine_id and `dose`=p_dose;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVaccine` (IN `vaccine_name` VARCHAR(255), IN `manufacturer` VARCHAR(255), IN `price` DOUBLE, IN `number_of_doses` INT(11), IN `side_effects` TEXT, IN `indication` TEXT, IN `contraindication` TEXT, IN `dosage_and_usage` TEXT, IN `image` TEXT, IN `p_vaccine_id` INT(11))  BEGIN
UPDATE `vaccine` SET `vaccine_name`=vaccine_name,`manufacturer`=manufacturer,`price`=price,`number_of_doses`=number_of_doses,`side_effects`=side_effects,`indication`=indication,`contraindication`=contraindication,`dosage_and_usage`=dosage_and_usage,`image`=image where `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVaccineDisease` (IN `note` TEXT, IN `p_vaccine_id` INT(11), IN `p_disease_id` INT(11))  BEGIN
UPDATE `vaccine_disease` SET `note`=note where `vaccine_id`=p_vaccine_id and `disease_id` = p_disease_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `disease_id` int(11) NOT NULL,
  `disease_name` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Disease''s information table';

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`disease_id`, `disease_name`, `description`) VALUES
(1, 'benh1', 'abc'),
(2, 'benh2', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text,
  `image` text,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `avatar` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User''s information table';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar`) VALUES
(1, 'kiet', 1, '1994-09-21', '01234', 'aaa', 'bbbbbbb', '123456', 1, 'asdfasdfasdf'),
(2, 'hai', 1, '1994-05-12', '02313', 'asdf', 'asdf', '1234223', 1, 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_record`
--

CREATE TABLE `vaccination_record` (
  `user_id` int(11) NOT NULL,
  `vaccine_id` int(11) NOT NULL,
  `dose` int(11) NOT NULL,
  `injection_date` date NOT NULL,
  `next_dose_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vacinnaction-record''s information';

--
-- Dumping data for table `vaccination_record`
--

INSERT INTO `vaccination_record` (`user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date`) VALUES
(1, 1, 1, '2015-09-21', '2015-10-09');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `vaccine_id` int(11) NOT NULL,
  `vaccine_name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `number_of_doses` int(11) NOT NULL,
  `side_effects` text,
  `indication` text,
  `contraindication` text,
  `dosage_and_usage` text,
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vaccine''s information table';

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`vaccine_id`, `vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image`) VALUES
(1, 'vc1', 'aaaa', 12, 1, 'asdf', 'asdf', 'asdf', 'asdf', 'asdf'),
(2, 'vc2', 'bbbbb', 2, 2, 'dsf', 'sdfg', 'sdfg', 'sdfg', 'sdfg'),
(3, 'asdf', 'asdf', 2, 2, 'asdf', 'asdf', 'asdf', 'asdf', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_disease`
--

CREATE TABLE `vaccine_disease` (
  `vaccine_id` int(11) NOT NULL,
  `disease_id` int(11) NOT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vaccine_disease`
--

INSERT INTO `vaccine_disease` (`vaccine_id`, `disease_id`, `note`) VALUES
(1, 2, 'aaa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`disease_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vaccination_record`
--
ALTER TABLE `vaccination_record`
  ADD PRIMARY KEY (`user_id`,`vaccine_id`,`dose`),
  ADD KEY `fk_vaccination_record_1_idx` (`vaccine_id`);

--
-- Indexes for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`vaccine_id`);

--
-- Indexes for table `vaccine_disease`
--
ALTER TABLE `vaccine_disease`
  ADD PRIMARY KEY (`vaccine_id`,`disease_id`),
  ADD KEY `fk_vaccine_disease_disease_idx` (`disease_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `disease_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vaccine`
--
ALTER TABLE `vaccine`
  MODIFY `vaccine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `vaccination_record`
--
ALTER TABLE `vaccination_record`
  ADD CONSTRAINT `fk_vaccination_record_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`vaccine_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vaccination_record_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vaccine_disease`
--
ALTER TABLE `vaccine_disease`
  ADD CONSTRAINT `fk_vaccine_disease_disease` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vaccine_disease_vaccine` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`vaccine_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
