-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 10 nov. 2021 à 12:25
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tpAvion`
--

-- --------------------------------------------------------

--
-- Structure de la table `affectevol`
--

CREATE TABLE `affectevol` (
  `Pasnum` int(11) NOT NULL,
  `Volnum` int(11) NOT NULL,
  `DateVol` date NOT NULL,
  `NumPlace` int(11) NOT NULL,
  `Prix` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `affectevol`
--

INSERT INTO `affectevol` (`Pasnum`, `Volnum`, `DateVol`, `NumPlace`, `Prix`) VALUES
(1, 103, '2008-11-05', 12, 135),
(3, 103, '2008-11-05', 23, 135),
(5, 100, '2008-11-01', 55, 180),
(6, 100, '2008-11-01', 54, 180),
(7, 100, '2008-11-01', 66, 180);

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `Avnum` int(11) NOT NULL,
  `Marque` varchar(50) NOT NULL,
  `TypeAvion` varchar(50) NOT NULL,
  `Capacite` int(11) NOT NULL,
  `Localisation` varchar(50) NOT NULL,
  `DateMiseEnService` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`Avnum`, `Marque`, `TypeAvion`, `Capacite`, `Localisation`, `DateMiseEnService`) VALUES
(100, 'Airbus', 'A320', 381, 'Nice', '1987-03-20'),
(101, 'Boeing', 'B707', 250, 'Paris', '1984-02-27'),
(102, 'Airbus', 'A320', 522, 'Toulouse', '1988-01-24'),
(103, 'Caravelle', 'Caravelle', 240, 'Toulouse', '1964-01-01'),
(104, 'Boeing', 'B747', 400, 'Paris', '1988-01-01'),
(105, 'Airbus', 'A320', 423, 'Grenoble', '1998-05-01'),
(106, 'ATR', 'ATR42', 50, 'Paris', '1990-01-01'),
(107, 'Boeing', 'B727', 300, 'Lyon', '1988-01-01'),
(108, 'Boeing', 'B727', 300, 'Nantes', '1988-01-01'),
(109, 'Airbus', 'A340', 350, 'Bastia', '1995-01-01'),
(120, 'Caravelle', 'Caravelle', 240, 'Grenoble', '1960-01-01'),
(150, 'Airbus', 'A340', 345, 'Brive', '2000-01-01'),
(151, 'Boeing', 'B707', 250, 'Bastia', '1986-02-02'),
(155, 'Airbus', 'A340', 600, 'Toulouse', '1998-06-03'),
(160, 'Airbus', 'A340', 600, 'Paris', '1988-02-06');

-- --------------------------------------------------------

--
-- Structure de la table `passager`
--

CREATE TABLE `passager` (
  `Pasnum` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Ville` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `passager`
--

INSERT INTO `passager` (`Pasnum`, `Nom`, `Prenom`, `Ville`) VALUES
(1, 'MAUSSE', 'Fabien', 'Toulouse'),
(2, 'MERLHIOT', 'Pascal', 'Paris'),
(3, 'JEAN', 'Patrick', 'Nice'),
(4, 'PEREIRA', 'Joao', 'Limoges'),
(5, 'FREEMAN', 'Cathy', 'Paris'),
(6, 'MINETTE', 'Sophie', 'Grenoble'),
(7, 'MALHERBE', 'Fred', 'Lyon'),
(8, 'FERDINAND', 'Gilles', 'Fort De France'),
(9, 'BOST', 'Vincent', 'Brive');

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

CREATE TABLE `pilote` (
  `Pilnum` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `CodePostal` char(5) NOT NULL,
  `Ville` varchar(50) NOT NULL,
  `DateNaissance` date NOT NULL,
  `DateDebutActivite` date NOT NULL,
  `DateFinActivite` date DEFAULT NULL,
  `SalaireBrut` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`Pilnum`, `Nom`, `CodePostal`, `Ville`, `DateNaissance`, `DateDebutActivite`, `DateFinActivite`, `SalaireBrut`) VALUES
(1, 'Serge', '37000', 'Tours', '1955-01-13', '1980-01-01', NULL, 1829.4),
(2, 'Jean', '75010', 'Paris', '1955-11-07', '1978-02-01', NULL, 8766),
(3, 'Roger', '38000', 'Grenoble', '1960-03-01', '1990-04-01', NULL, 2439.14),
(4, 'Robert', '44000', 'Nantes', '1968-03-03', '1993-06-01', NULL, 5686.45),
(5, 'Michel', '75010', 'Paris', '1956-11-08', '2000-01-01', NULL, 2744),
(7, 'Bertrand', '69001', 'Lyon', '1962-01-01', '1988-01-01', NULL, 6791.67),
(8, 'Herv√©', '20000', 'Bastia', '1960-01-01', '1987-01-01', NULL, 3811.11),
(9, 'Luc', '75018', 'Paris', '1956-11-07', '1985-01-01', NULL, 7581.4),
(19, 'Driss', '75006', 'Paris', '1956-05-16', '1990-12-01', NULL, 7502.9),
(20, 'Sylvain', '31000', 'Toulouse', '1975-11-08', '2000-01-01', NULL, 4709.39),
(21, 'Lucien', '31000', 'Toulouse', '1965-07-30', '1995-10-03', NULL, 5540.43);

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE `vol` (
  `Volnum` int(11) NOT NULL,
  `NumAvion` int(11) DEFAULT NULL,
  `NumPilote` int(11) DEFAULT NULL,
  `VilleDepart` varchar(50) NOT NULL,
  `VilleArrivee` varchar(50) NOT NULL,
  `HeureDepart` decimal(5,2) NOT NULL,
  `HeureArrivee` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`Volnum`, `NumAvion`, `NumPilote`, `VilleDepart`, `VilleArrivee`, `HeureDepart`, `HeureArrivee`) VALUES
(100, 100, 1, 'Nice', 'Paris', '7.20', '9.50'),
(101, 100, 2, 'Paris', 'Toulouse', '11.20', '12.00'),
(102, 101, 1, 'Paris', 'Nice', '12.35', '14.45'),
(103, 105, 3, 'Grenoble', 'Toulouse', '9.00', '11.00'),
(104, 105, 3, 'Toulouse', 'Grenoble', '17.00', '19.00'),
(105, 107, 7, 'Lyon', 'Paris', '6.00', '7.00'),
(106, 109, 8, 'Bastia', 'Paris', '10.00', '13.00'),
(107, 106, 9, 'Paris', 'Brive', '7.00', '8.00'),
(108, 106, 9, 'Brive', 'Paris', '19.00', '20.00'),
(109, 107, 7, 'Paris', 'Lyon', '18.00', '19.00'),
(110, 102, 2, 'Toulouse', 'Paris', '15.00', '16.00'),
(111, 108, 5, 'Nice', 'Paris', '14.00', '16.00'),
(112, 109, 2, 'Bastia', 'Paris', '10.00', '13.00'),
(113, 105, 2, 'Toulouse', 'Grenoble', '17.00', '19.00'),
(114, 150, 2, 'Paris', 'Marseille', '10.00', '12.00'),
(115, 155, 2, 'Paris', 'Lille', '11.00', '12.00'),
(116, 101, 4, 'Nice', 'Nantes', '17.00', '19.00'),
(714, 104, 1, 'Moulinsart', 'Sydney', '1.00', '23.00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affectevol`
--
ALTER TABLE `affectevol`
  ADD PRIMARY KEY (`Pasnum`,`Volnum`,`DateVol`),
  ADD KEY `Volnum_Volnum` (`Volnum`);

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`Avnum`);

--
-- Index pour la table `passager`
--
ALTER TABLE `passager`
  ADD PRIMARY KEY (`Pasnum`);

--
-- Index pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD PRIMARY KEY (`Pilnum`);

--
-- Index pour la table `vol`
--
ALTER TABLE `vol`
  ADD PRIMARY KEY (`Volnum`),
  ADD KEY `NumAvion_Avnum` (`NumAvion`),
  ADD KEY `NumPilote_Pilnum` (`NumPilote`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avion`
--
ALTER TABLE `avion`
  MODIFY `Avnum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT pour la table `passager`
--
ALTER TABLE `passager`
  MODIFY `Pasnum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `pilote`
--
ALTER TABLE `pilote`
  MODIFY `Pilnum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `vol`
--
ALTER TABLE `vol`
  MODIFY `Volnum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=715;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affectevol`
--
ALTER TABLE `affectevol`
  ADD CONSTRAINT `Pasnum_Pasnum` FOREIGN KEY (`Pasnum`) REFERENCES `passager` (`Pasnum`),
  ADD CONSTRAINT `Volnum_Volnum` FOREIGN KEY (`Volnum`) REFERENCES `vol` (`Volnum`);

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `NumAvion_Avnum` FOREIGN KEY (`NumAvion`) REFERENCES `avion` (`Avnum`),
  ADD CONSTRAINT `NumPilote_Pilnum` FOREIGN KEY (`NumPilote`) REFERENCES `pilote` (`Pilnum`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
