-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2020 at 01:26 AM
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
-- Database: `dbpolices`
--

-- --------------------------------------------------------

--
-- Table structure for table `bien_assure`
--

CREATE TABLE `bien_assure` (
  `idbien_assure` int(11) NOT NULL,
  `DBpolices_idDBpolices` int(11) NOT NULL,
  `client_idclient` int(11) NOT NULL,
  `risque_idrisque` int(11) NOT NULL,
  `nom_de_bien` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bien_assure`
--

INSERT INTO `bien_assure` (`idbien_assure`, `DBpolices_idDBpolices`, `client_idclient`, `risque_idrisque`, `nom_de_bien`) VALUES
(1, 1, 1, 1, 'camion'),
(2, 2, 2, 2, 'voiture'),
(3, 3, 3, 3, 'maison'),
(4, 4, 4, 3, 'voiture'),
(5, 5, 5, 2, 'maison'),
(6, 6, 6, 1, 'voiture'),
(7, 7, 7, 1, 'camion'),
(8, 8, 8, 3, 'voiture');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `idclient` int(11) NOT NULL,
  `nom_client` varchar(45) DEFAULT NULL,
  `prenom_client` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`idclient`, `nom_client`, `prenom_client`) VALUES
(1, 'ayoub', 'errkhis'),
(2, 'otman', 'darouich'),
(3, 'said', 'elghadyry'),
(4, 'latifa', 'mrani'),
(5, 'youness', 'fakiri'),
(6, 'saadia', 'dechraouia'),
(7, 'habib', 'janfour'),
(8, 'abdeltif', 'halimi');

-- --------------------------------------------------------

--
-- Table structure for table `operateur`
--

CREATE TABLE `operateur` (
  `idoperateur` int(11) NOT NULL,
  `nom_operateur` varchar(45) DEFAULT NULL,
  `type_operateur` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operateur`
--

INSERT INTO `operateur` (`idoperateur`, `nom_operateur`, `type_operateur`) VALUES
(1, 'hamid', 'agent'),
(2, 'jalal', 'employe'),
(3, 'yasser', 'agent'),
(4, 'morad', 'employe');

-- --------------------------------------------------------

--
-- Table structure for table `polices`
--

CREATE TABLE `polices` (
  `idpolices` int(11) NOT NULL,
  `etat` varchar(45) DEFAULT NULL,
  `note` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `polices`
--

INSERT INTO `polices` (`idpolices`, `etat`, `note`) VALUES
(1, 'encours', 1),
(2, 'cloture', 1),
(3, 'encours', 1),
(4, 'encours', 2),
(5, 'cloture', 2),
(6, 'cloture', 2),
(7, 'encours', 3),
(8, 'encours', 3);

-- --------------------------------------------------------

--
-- Table structure for table `risque`
--

CREATE TABLE `risque` (
  `idrisque` int(11) NOT NULL,
  `type_risque` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `risque`
--

INSERT INTO `risque` (`idrisque`, `type_risque`) VALUES
(1, 'A'),
(2, 'H'),
(3, 'R');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `idtransaction` int(11) NOT NULL,
  `date_ecriture` date DEFAULT NULL,
  `operateur_idoperateur` int(11) NOT NULL,
  `bien_assure_idbien_assure` int(11) NOT NULL,
  `montant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`idtransaction`, `date_ecriture`, `operateur_idoperateur`, `bien_assure_idbien_assure`, `montant`) VALUES
(1, '2020-01-01', 1, 1, 2000),
(2, '2020-01-01', 2, 2, 1300),
(3, '2020-02-01', 3, 3, 4355),
(4, '2020-02-01', 4, 4, 4535),
(5, '2020-03-01', 1, 5, 7567),
(6, '2020-03-01', 2, 6, 5657),
(7, '2020-04-01', 3, 7, 1234),
(8, '2020-04-01', 4, 8, 8677),
(9, '2020-05-01', 1, 1, 8765),
(10, '2020-05-01', 2, 2, 1234),
(11, '2020-06-01', 3, 3, 3552),
(12, '2020-06-01', 4, 4, 8765),
(13, '2020-07-01', 4, 5, 1876),
(14, '2020-07-01', 3, 6, 5435),
(15, '2020-08-01', 2, 7, 8545),
(16, '2020-08-01', 1, 8, 3243),
(17, '2020-09-01', 1, 8, 8956),
(18, '2020-09-01', 2, 7, 5436),
(19, '2020-10-01', 3, 6, 9857),
(20, '2020-11-01', 4, 5, 3343);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bien_assure`
--
ALTER TABLE `bien_assure`
  ADD PRIMARY KEY (`idbien_assure`,`DBpolices_idDBpolices`,`client_idclient`,`risque_idrisque`),
  ADD KEY `fk_bien_assure_DBpolices1_idx` (`DBpolices_idDBpolices`),
  ADD KEY `fk_bien_assure_client1_idx` (`client_idclient`),
  ADD KEY `fk_bien_assure_risque1_idx` (`risque_idrisque`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idclient`);

--
-- Indexes for table `operateur`
--
ALTER TABLE `operateur`
  ADD PRIMARY KEY (`idoperateur`);

--
-- Indexes for table `polices`
--
ALTER TABLE `polices`
  ADD PRIMARY KEY (`idpolices`);

--
-- Indexes for table `risque`
--
ALTER TABLE `risque`
  ADD PRIMARY KEY (`idrisque`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`idtransaction`,`bien_assure_idbien_assure`,`operateur_idoperateur`),
  ADD KEY `fk_transaction_operateur_idx` (`operateur_idoperateur`),
  ADD KEY `fk_transaction_bien_assure1_idx` (`bien_assure_idbien_assure`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bien_assure`
--
ALTER TABLE `bien_assure`
  ADD CONSTRAINT `fk_bien_assure_DBpolices1` FOREIGN KEY (`DBpolices_idDBpolices`) REFERENCES `polices` (`idpolices`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_bien_assure_client1` FOREIGN KEY (`client_idclient`) REFERENCES `client` (`idclient`),
  ADD CONSTRAINT `fk_bien_assure_risque1` FOREIGN KEY (`risque_idrisque`) REFERENCES `risque` (`idrisque`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_transaction_bien_assure1` FOREIGN KEY (`bien_assure_idbien_assure`) REFERENCES `bien_assure` (`idbien_assure`),
  ADD CONSTRAINT `fk_transaction_operateur` FOREIGN KEY (`operateur_idoperateur`) REFERENCES `operateur` (`idoperateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
