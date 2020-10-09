-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2020 at 01:27 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dwpolice`
--

-- --------------------------------------------------------

--
-- Table structure for table `dbienassure`
--

CREATE TABLE `dbienassure` (
  `idbienAssure` int(11) NOT NULL,
  `nomBienAssure` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbienassure`
--

INSERT INTO `dbienassure` (`idbienAssure`, `nomBienAssure`) VALUES
(1, 'camion'),
(2, 'voiture'),
(3, 'maison'),
(4, 'voiture'),
(5, 'maison'),
(6, 'voiture'),
(7, 'camion'),
(8, 'voiture');

-- --------------------------------------------------------

--
-- Table structure for table `dclient`
--

CREATE TABLE `dclient` (
  `idclient` int(11) NOT NULL,
  `prenom` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dclient`
--

INSERT INTO `dclient` (`idclient`, `prenom`) VALUES
(1, 'errkhis'),
(2, 'darouich'),
(3, 'elghadyry'),
(4, 'mrani'),
(5, 'fakiri'),
(6, 'dechraouia'),
(7, 'janfour'),
(8, 'halimi');

-- --------------------------------------------------------

--
-- Table structure for table `ddate`
--

CREATE TABLE `ddate` (
  `iddate` int(11) NOT NULL,
  `mois` int(11) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ddate`
--

INSERT INTO `ddate` (`iddate`, `mois`, `annee`) VALUES
(20201, 1, 2020),
(20202, 2, 2020),
(20203, 3, 2020),
(20204, 4, 2020),
(20205, 5, 2020),
(20206, 6, 2020),
(20207, 7, 2020),
(20208, 8, 2020),
(20209, 9, 2020),
(202010, 10, 2020),
(202011, 11, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `dfact`
--

CREATE TABLE `dfact` (
  `idtransactions` int(11) NOT NULL,
  `risques_idrisques` int(11) NOT NULL,
  `iddate` int(11) NOT NULL,
  `table1_idnote` int(11) NOT NULL,
  `monant` double DEFAULT NULL,
  `client_idclient` int(11) NOT NULL,
  `nbrMontant` int(11) DEFAULT NULL,
  `bienAssure_idbienAssure` int(11) NOT NULL,
  `operateur_idoperateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dfact`
--

INSERT INTO `dfact` (`idtransactions`, `risques_idrisques`, `iddate`, `table1_idnote`, `monant`, `client_idclient`, `nbrMontant`, `bienAssure_idbienAssure`, `operateur_idoperateur`) VALUES
(41, 1, 20201, 1, 2000, 1, 1, 1, 1),
(42, 1, 20205, 1, 8765, 1, 1, 1, 1),
(43, 1, 20203, 2, 5657, 6, 1, 6, 2),
(44, 1, 20207, 2, 5435, 6, 1, 6, 3),
(45, 1, 202010, 2, 9857, 6, 1, 6, 3),
(46, 1, 20204, 3, 1234, 7, 1, 7, 3),
(47, 1, 20208, 3, 8545, 7, 1, 7, 2),
(48, 1, 20209, 3, 5436, 7, 1, 7, 2),
(49, 2, 20201, 1, 1300, 2, 1, 2, 2),
(50, 2, 20205, 1, 1234, 2, 1, 2, 2),
(51, 2, 20203, 2, 7567, 5, 1, 5, 1),
(52, 2, 20207, 2, 1876, 5, 1, 5, 4),
(53, 2, 202011, 2, 3343, 5, 1, 5, 4),
(54, 3, 20202, 1, 4355, 3, 1, 3, 3),
(55, 3, 20206, 1, 3552, 3, 1, 3, 3),
(56, 3, 20202, 2, 4535, 4, 1, 4, 4),
(57, 3, 20206, 2, 8765, 4, 1, 4, 4),
(58, 3, 20204, 3, 8677, 8, 1, 8, 4),
(59, 3, 20208, 3, 3243, 8, 1, 8, 1),
(60, 3, 20209, 3, 8956, 8, 1, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doperateur`
--

CREATE TABLE `doperateur` (
  `idoperateur` int(11) NOT NULL,
  `typeOperateur` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doperateur`
--

INSERT INTO `doperateur` (`idoperateur`, `typeOperateur`) VALUES
(1, 'agent'),
(2, 'employe'),
(3, 'agent'),
(4, 'employe');

-- --------------------------------------------------------

--
-- Table structure for table `dpolice`
--

CREATE TABLE `dpolice` (
  `idnote` int(11) NOT NULL,
  `note` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dpolice`
--

INSERT INTO `dpolice` (`idnote`, `note`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 3),
(7, 1),
(8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `drisque`
--

CREATE TABLE `drisque` (
  `idrisques` int(11) NOT NULL,
  `type_risque` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drisque`
--

INSERT INTO `drisque` (`idrisques`, `type_risque`) VALUES
(1, 'A'),
(2, 'H'),
(3, 'R');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dbienassure`
--
ALTER TABLE `dbienassure`
  ADD PRIMARY KEY (`idbienAssure`);

--
-- Indexes for table `dclient`
--
ALTER TABLE `dclient`
  ADD PRIMARY KEY (`idclient`);

--
-- Indexes for table `ddate`
--
ALTER TABLE `ddate`
  ADD PRIMARY KEY (`iddate`);

--
-- Indexes for table `dfact`
--
ALTER TABLE `dfact`
  ADD PRIMARY KEY (`idtransactions`,`risques_idrisques`,`iddate`,`table1_idnote`,`client_idclient`,`bienAssure_idbienAssure`,`operateur_idoperateur`),
  ADD KEY `fk_transactions-fact_risques1_idx` (`risques_idrisques`),
  ADD KEY `fk_transactions-fact_annee||mois1_idx` (`iddate`),
  ADD KEY `fk_transactions-fact_table11_idx` (`table1_idnote`),
  ADD KEY `fk_fact_client1_idx` (`client_idclient`),
  ADD KEY `fk_fact_bienAssure1_idx` (`bienAssure_idbienAssure`),
  ADD KEY `fk_fact_operateur1_idx` (`operateur_idoperateur`);

--
-- Indexes for table `doperateur`
--
ALTER TABLE `doperateur`
  ADD PRIMARY KEY (`idoperateur`);

--
-- Indexes for table `dpolice`
--
ALTER TABLE `dpolice`
  ADD PRIMARY KEY (`idnote`);

--
-- Indexes for table `drisque`
--
ALTER TABLE `drisque`
  ADD PRIMARY KEY (`idrisques`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ddate`
--
ALTER TABLE `ddate`
  MODIFY `iddate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202012;

--
-- AUTO_INCREMENT for table `dfact`
--
ALTER TABLE `dfact`
  MODIFY `idtransactions` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dfact`
--
ALTER TABLE `dfact`
  ADD CONSTRAINT `fk_fact_bienAssure1` FOREIGN KEY (`bienAssure_idbienAssure`) REFERENCES `dbienassure` (`idbienAssure`),
  ADD CONSTRAINT `fk_fact_client1` FOREIGN KEY (`client_idclient`) REFERENCES `dclient` (`idclient`),
  ADD CONSTRAINT `fk_fact_operateur1` FOREIGN KEY (`operateur_idoperateur`) REFERENCES `doperateur` (`idoperateur`),
  ADD CONSTRAINT `fk_transactions-fact_annee||mois1` FOREIGN KEY (`iddate`) REFERENCES `ddate` (`iddate`),
  ADD CONSTRAINT `fk_transactions-fact_risques1` FOREIGN KEY (`risques_idrisques`) REFERENCES `drisque` (`idrisques`),
  ADD CONSTRAINT `fk_transactions-fact_table11` FOREIGN KEY (`table1_idnote`) REFERENCES `dpolice` (`idnote`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
