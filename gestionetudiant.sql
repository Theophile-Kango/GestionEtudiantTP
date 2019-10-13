-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 14 Août 2018 à 10:20
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gestionetudiant`
--
CREATE DATABASE IF NOT EXISTS `gestionetudiant` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestionetudiant`;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE IF NOT EXISTS `cours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomcours` varchar(45) NOT NULL,
  `ponderation` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `cours`
--

INSERT INTO `cours` (`id`, `nomcours`, `ponderation`) VALUES
(1, 'Java', 3),
(2, 'Intro Web', 3),
(3, 'RDM', 7),
(4, 'Analyse des Circuits', 6),
(5, 'ECM', 5);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `matricule` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `postnom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  PRIMARY KEY (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`matricule`, `nom`, `postnom`, `prenom`) VALUES
(1000, 'Abijan ', 'Musavuli', 'AbiDJA'),
(1200, 'Kajaba', 'Angelani', 'Mireille'),
(12639, 'Fazili', 'Kango', 'Theophile');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etudiant_fk` int(11) NOT NULL,
  `cours_fk` int(11) NOT NULL,
  `note` double NOT NULL,
  `ponderation` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notes_etudiant` (`etudiant_fk`),
  KEY `fk_notes_cours1` (`cours_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_notes_cours1` FOREIGN KEY (`cours_fk`) REFERENCES `cours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_notes_etudiant` FOREIGN KEY (`etudiant_fk`) REFERENCES `etudiant` (`matricule`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
