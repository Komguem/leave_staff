-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 26 Janvier 2024 à 19:22
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `leave_staff`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2020-11-03 05:55:30');

-- --------------------------------------------------------

--
-- Structure de la table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `CreationDate`) VALUES
(2, 'Information Technologies', 'ICT', '2017-11-01 07:19:37'),
(3, 'Library', 'LIb', '2021-05-21 08:27:45');

-- --------------------------------------------------------

--
-- Structure de la table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `emp_id` int(11) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Av_leave` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(30) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tblemployees`
--

INSERT INTO `tblemployees` (`emp_id`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `Av_leave`, `Phonenumber`, `Status`, `RegDate`, `role`, `location`) VALUES
(2, 'Edem', 'Mcwilliams', 'james@gmail.com', 'b4cc344d25a2efe540adbf2678e2304c', 'Male', '3 February, 1990', 'ICT', 'N NEPO', '30', '8587944255', 1, '2017-11-10 13:40:02', 'Admin', 'photo2.jpg'),
(4, 'Nathaniel', 'Nkrumah', 'nat@gmail.com', 'b4cc344d25a2efe540adbf2678e2304c', 'Male', '3 February, 1990', 'ICT', 'N NEPO', '30', '587944255', 1, '2017-11-10 13:40:02', 'Admin', 'NO-IMAGE-AVAILABLE.jpg'),
(9, 'ETAME', 'duroy', 'duroy@gmail.com', '8c08dc529eccf4277a402cb8f7da0c96', 'male', '05 April 2023', 'ICT', 'kotto', '28', '692601063', 1, '2023-04-08 00:59:22', 'Admin', 'NO-IMAGE-AVAILABLE.jpg'),
(10, 'MBANJOCK', 'Didier', 'didier@gmail.com', '573619cd2fba7cee3d9b3d6548e2ecc7', 'male', '04 April 2023', 'LIb', 'logpom', '18', '690599293', 1, '2023-04-08 01:03:41', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(11, 'peter', 'steve', 'peter@gmail.com', '7c7b671e3799c8d94a509daebf2e9620', 'male', '11 April 2023', 'ICT', 'yde', '28', '690587412', 1, '2023-04-08 01:11:55', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(12, 'WANDJI', 'DASSAULT', 'dassautlt@gmail.com', 'fdab9e704c90707f0016c9ef79273ace', 'male', '06 April 2023', 'LIb', 'ime', '30', '690599293', 1, '2023-04-08 12:55:53', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(13, 'silva', 'bernado', 'bernado@gmail.com', '018a9567ea15470312c40d3e5d6bbcd4', 'male', '10 May 2023', 'LIb', 'paris', '12', '692601063', 1, '2023-05-18 19:46:31', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(14, 'takam', 'ralph', 'fleur@gmail.com', 'f4f068e71e0d87bf0ad51e6214ab84e9', 'male', '02 May 2023', 'ICT', 'kotto', '19', '695645545', 1, '2023-05-24 09:17:59', 'Staff', 'tÃ©lÃ©charger (1).jpg');

-- --------------------------------------------------------

--
-- Structure de la table `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` date NOT NULL,
  `AdminRemark` mediumtext,
  `registra_remarks` mediumtext,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `admin_status` int(11) NOT NULL DEFAULT '0',
  `IsRead` int(1) DEFAULT NULL,
  `empid` int(11) DEFAULT NULL,
  `num_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `registra_remarks`, `AdminRemarkDate`, `Status`, `admin_status`, `IsRead`, `empid`, `num_days`) VALUES
(13, 'Casual Leave', '2021-05-02', '2021-05-12', 'I want to take a leave.', '2021-05-20', 'Ok', 'ok', '2021-05-24 20:26:19 ', 1, 1, 1, 7, 3),
(14, 'Medical Leave', '08-05-2021', '11-05-2021', 'Noted', '0000-00-00', 'okay', 'okay', '2023-04-08 18:31:05 ', 1, 1, 1, 6, 4),
(16, 'Casual Leave', '02-05-2021', '05-05-2021', 'Nice Leave', '2021-05-20', 'Ok', 'Noted', '2021-05-24 20:42:18 ', 1, 1, 1, 7, 4),
(17, 'Casual Leave', '11-05-2021', '15-05-2021', 'Just', '2021-05-21', 'Leave Approved', 'Noted', '2021-05-24 19:56:45 ', 1, 1, 1, 7, 5),
(18, 'congÃ© maternitÃ© ', '04-04-2023', '07-04-2023', 'test', '2023-04-08', NULL, NULL, NULL, 0, 0, 1, 10, 4),
(19, 'Other', '13-04-2023', '22-04-2023', 'malade', '2023-04-08', 'okay', 'okay', '2024-01-27 0:28:52 ', 1, 1, 1, 10, 10),
(20, 'Other', '03-05-2023', '20-05-2023', 'malade', '2023-05-18', 'ok', 'okay', '2024-01-27 0:33:50 ', 1, 1, 1, 13, 18),
(21, 'Medical Leave', '10-05-2023', '20-05-2023', 'je suis malade', '2023-05-24', 'okay', 'okay', '2023-05-24 14:58:45 ', 1, 1, 1, 14, 11),
(22, 'Medical Leave', '01-05-2023', '20-05-2023', ' xvc bnng', '2023-05-27', NULL, NULL, NULL, 0, 0, 0, 14, 20),
(23, 'Medical Leave', '04-01-2024', '09-01-2024', 'je suis malade', '2024-01-26', NULL, NULL, NULL, 0, 0, 0, 10, 6);

-- --------------------------------------------------------

--
-- Structure de la table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `date_from` varchar(200) NOT NULL,
  `date_to` varchar(200) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tblleavetype`
--

INSERT INTO `tblleavetype` (`id`, `LeaveType`, `Description`, `date_from`, `date_to`, `CreationDate`) VALUES
(5, 'Casual Leave', 'Casual Leave', '2021-05-23', '2021-06-20', '2021-05-19 14:32:03'),
(6, 'Medical Leave', 'Medical Leave', '2021-05-05', '2021-05-28', '2021-05-19 15:29:05'),
(8, 'Other', 'Leave all staff', '31-05-2021', '04-06-2021', '2021-05-20 17:17:43'),
(9, 'conge maternite', 'pour les femmes attendant un nouveau nÃ©e', '1970-01-01', '1970-01-01', '2023-04-08 01:01:50');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Index pour la table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Index pour la table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
