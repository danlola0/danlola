-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 29 Mars 2023 à 13:02
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `deliberation`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPromo`(IN `idDepar` INT, IN `nom` VARCHAR(150))
    NO SQL
insert into promotion (id_depart, nom) values (idDepar, nom)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `fonction` varchar(255) NOT NULL,
  `postnom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`id`, `nom`, `gmail`, `fonction`, `postnom`, `password`) VALUES
(1, 'yongo', 'daniellolayongo@gmail.com', 'Secretaire', 'lola', 'dylis12345'),
(3, 'Ngbowa', 'eze@gmail.com', 'DGA', 'Sumbela', '12345');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE IF NOT EXISTS `cours` (
  `id_cour` int(11) NOT NULL AUTO_INCREMENT,
  `id_promo` int(11) DEFAULT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `ponderation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cour`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `cours`
--

INSERT INTO `cours` (`id_cour`, `id_promo`, `nom`, `ponderation`) VALUES
(1, 2, 'Genie Logiciel', 4),
(2, 1, 'IA Approfondie', 6),
(3, 2, 'Math', 3),
(4, 2, 'Anglais', 2);

-- --------------------------------------------------------

--
-- Structure de la table `cours_resultat`
--

CREATE TABLE IF NOT EXISTS `cours_resultat` (
  `id_cr` int(11) NOT NULL AUTO_INCREMENT,
  `id_cour` int(11) DEFAULT NULL,
  `cote` int(11) DEFAULT NULL,
  `id_result` int(11) NOT NULL,
  PRIMARY KEY (`id_cr`),
  KEY `id_cour` (`id_cour`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `cours_resultat`
--

INSERT INTO `cours_resultat` (`id_cr`, `id_cour`, `cote`, `id_result`) VALUES
(4, 1, 8, 3),
(5, 3, 9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE IF NOT EXISTS `departement` (
  `id_depart` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_depart`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`id_depart`, `nom`) VALUES
(1, 'Informatique'),
(2, 'Geologie');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etud` int(11) NOT NULL AUTO_INCREMENT,
  `id_promo` int(11) DEFAULT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `postnom` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `date_naissance` datetime DEFAULT CURRENT_TIMESTAMP,
  `matricule` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_etud`),
  KEY `id_promo` (`id_promo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etud`, `id_promo`, `nom`, `postnom`, `prenom`, `date_naissance`, `matricule`) VALUES
(1, 2, 'Ngbowa', 'Sumbela', 'Ezechiel', '2023-03-09 00:00:00', 12345),
(2, 2, 'Yongo', 'Lola', 'Dan', '2023-03-07 00:00:00', 54321),
(3, 1, 'Mosengo', 'Lili', 'Daniella', '2023-03-07 00:00:00', 2432);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `login`
--

INSERT INTO `login` (`id`, `nom`, `gmail`, `password`) VALUES
(1, 'yongo', 'daniellola@gmail.com', 'dylis12'),
(2, 'mpoto', 'da@gmail.com', 'xx'),
(3, 'hangi', 'hangisheria@gmail.com', 'elie112'),
(4, 'hangi', 'hangisheria@gmail.com', 'elie112'),
(5, 'eze', 'eze@gmail.com', 'bbbbb');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `message` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id`, `nom`, `gmail`, `message`) VALUES
(1, 'daniel lola', 'daniellola@gmail.com', 'j''ai beaucoup apprecier le site ,j''aimerais savoir plus sur vous '),
(2, 'christopher landu', 'jojo@gmail.com', 'je suis flatter'),
(3, 'christopher landu', 'jojo@gmail.com', 'je suis flatter'),
(4, 'hangi', 'hangi@gmail.com', 'merci pour ce magnifique site'),
(5, 'hangi', 'hangi@gmail.com', 'merci pour ce magnifique site'),
(6, 'hangi', 'hangi@gmail.com', 'merci pour ce magnifique site'),
(7, 'hangi', 'hangi@gmail.com', 'merci pour ce magnifique site'),
(8, 'hangi', 'hangi@gmail.com', 'merci pour ce magnifique site');

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE IF NOT EXISTS `promotion` (
  `id_promo` int(11) NOT NULL AUTO_INCREMENT,
  `id_depart` int(11) DEFAULT NULL,
  `nom` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_promo`),
  KEY `id_depart` (`id_depart`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `promotion`
--

INSERT INTO `promotion` (`id_promo`, `id_depart`, `nom`) VALUES
(1, 1, 'L1'),
(2, 1, 'L2'),
(3, 1, 'G3'),
(4, 2, 'L1');

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

CREATE TABLE IF NOT EXISTS `resultat` (
  `id_result` int(11) NOT NULL AUTO_INCREMENT,
  `id_etud` int(11) DEFAULT NULL,
  `date_resultat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_result`),
  KEY `id_etud` (`id_etud`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `resultat`
--

INSERT INTO `resultat` (`id_result`, `id_etud`, `date_resultat`) VALUES
(6, 1, '2023-03-19 15:55:22'),
(7, 1, '2023-03-19 15:55:22');

-- --------------------------------------------------------

--
-- Structure de la table `t_cour`
--

CREATE TABLE IF NOT EXISTS `t_cour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `ponderation` int(11) NOT NULL,
  `idPromo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPromo` (`idPromo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `t_cour`
--

INSERT INTO `t_cour` (`id`, `nom`, `ponderation`, `idPromo`) VALUES
(1, 'Stat', 4, 2),
(2, 'Anglais', 3, 2),
(3, 'Systeme d''exploitation', 6, 2),
(6, 'BD', 6, 1),
(7, 'Projet d''automatisation', 4, 1),
(8, 'AI', 4, 1),
(9, 'ROA', 4, 1),
(10, 'TGO', 4, 1),
(11, 'CSI', 4, 1),
(12, 'GFI', 4, 1),
(13, 'Compilation', 4, 1),
(14, 'staff', 4, 1),
(15, 'Macro', 4, 1),
(16, 'econometrie', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_deliberation`
--

CREATE TABLE IF NOT EXISTS `t_deliberation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEtudiant` int(11) NOT NULL,
  `idCour` int(11) NOT NULL,
  `cote` int(11) NOT NULL,
  `date_deliberation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idEtudiant` (`idEtudiant`),
  KEY `idCour` (`idCour`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Contenu de la table `t_deliberation`
--

INSERT INTO `t_deliberation` (`id`, `idEtudiant`, `idCour`, `cote`, `date_deliberation`) VALUES
(11, 1, 1, 8, '2023-03-19 16:53:15'),
(12, 1, 2, 9, '2023-03-19 16:53:15'),
(13, 1, 3, 12, '2023-03-19 16:53:15'),
(14, 2, 1, 5, '2023-03-19 16:54:20'),
(15, 2, 2, 5, '2023-03-19 16:54:20'),
(16, 2, 3, 3, '2023-03-19 16:54:20'),
(17, 5, 6, 12, '2023-03-25 10:45:40'),
(18, 5, 7, 14, '2023-03-25 10:45:40'),
(19, 5, 8, 11, '2023-03-25 10:45:40'),
(20, 5, 9, 15, '2023-03-25 10:45:40'),
(21, 5, 10, 10, '2023-03-25 10:45:40'),
(22, 5, 11, 10, '2023-03-25 10:45:40'),
(23, 5, 12, 15, '2023-03-25 10:45:40'),
(24, 5, 13, 8, '2023-03-25 10:45:40'),
(25, 5, 14, 10, '2023-03-25 10:45:40'),
(26, 5, 15, 12, '2023-03-25 10:45:40'),
(27, 5, 16, 11, '2023-03-25 10:45:40'),
(28, 7, 6, 12, '2023-03-29 10:58:02'),
(29, 7, 7, 11, '2023-03-29 10:58:02'),
(30, 7, 8, 12, '2023-03-29 10:58:03'),
(31, 7, 9, 12, '2023-03-29 10:58:03'),
(32, 7, 10, 14, '2023-03-29 10:58:03'),
(33, 7, 11, 8, '2023-03-29 10:58:03'),
(34, 7, 12, 15, '2023-03-29 10:58:03'),
(35, 7, 13, 10, '2023-03-29 10:58:03'),
(36, 7, 14, 10, '2023-03-29 10:58:03'),
(37, 7, 15, 10, '2023-03-29 10:58:03'),
(38, 7, 16, 11, '2023-03-29 10:58:03');

-- --------------------------------------------------------

--
-- Structure de la table `t_departement`
--

CREATE TABLE IF NOT EXISTS `t_departement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_departement`
--

INSERT INTO `t_departement` (`id`, `nom`) VALUES
(1, 'Informtique'),
(2, 'Mathematique');

-- --------------------------------------------------------

--
-- Structure de la table `t_etudiant`
--

CREATE TABLE IF NOT EXISTS `t_etudiant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `postnom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `idPromo` int(11) NOT NULL,
  `date_naissance` date NOT NULL,
  `matricule` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPromo` (`idPromo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `t_etudiant`
--

INSERT INTO `t_etudiant` (`id`, `nom`, `postnom`, `prenom`, `idPromo`, `date_naissance`, `matricule`) VALUES
(1, 'Yongo', 'Lola', 'Dan', 2, '2023-03-09', '12345'),
(2, 'Ngbowa', 'Sumbela', 'Ezechiel', 2, '2023-03-29', '23454'),
(3, 'Mutoto', 'Manu', 'Roger', 1, '2023-03-07', '222'),
(4, 'Mulongo', 'Mgg', 'Yves', 1, '2023-03-07', '3333'),
(5, 'Kiala', 'Butala', 'Ruth', 1, '2023-03-07', '4444'),
(6, 'Mulongo', 'Mgg', 'Yves', 1, '2023-03-01', '1232123'),
(7, 'Hangi', 'sheria', 'elie', 1, '2020-05-13', 'A3286ZT');

-- --------------------------------------------------------

--
-- Structure de la table `t_promotion`
--

CREATE TABLE IF NOT EXISTS `t_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `idDepartement` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idDepartement` (`idDepartement`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `t_promotion`
--

INSERT INTO `t_promotion` (`id`, `nom`, `idDepartement`) VALUES
(1, 'L1', 1),
(2, 'L2', 1),
(3, 'G3', 2),
(4, 'G2', 2),
(5, 'G1', 2);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_cours`
--
CREATE TABLE IF NOT EXISTS `v_cours` (
`id_cour` int(11)
,`nom` varchar(25)
,`ponderation` int(11)
,`id_promo` int(11)
,`nom_promotion` varchar(25)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_delibe`
--
CREATE TABLE IF NOT EXISTS `v_delibe` (
`idDeliberation` int(11)
,`idCours` int(11)
,`ponderation` int(11)
,`idPromo` int(11)
,`nom_promotion` varchar(255)
,`idDepartement` int(11)
,`nom_departement` varchar(255)
,`idEtudiant` int(11)
,`nom_etudiant` varchar(255)
,`postnom_etudiant` varchar(255)
,`prenom_etudiant` varchar(255)
,`date_naissance` date
,`matricule` varchar(255)
,`date_deliberation` datetime
,`cote` int(11)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_deliberation`
--
CREATE TABLE IF NOT EXISTS `v_deliberation` (
`id_result` int(11)
,`id_cour` int(11)
,`ponderation` int(11)
,`id_promo` int(11)
,`nom_promotion` varchar(25)
,`id_depart` int(11)
,`nom_departement` varchar(25)
,`id_etud` int(11)
,`nom_etudiant` varchar(25)
,`postnom_etudiant` varchar(25)
,`prenom_etudiant` varchar(25)
,`date_naissance` datetime
,`matricule` int(11)
,`date_resultat` datetime
,`cote` int(11)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_pdf`
--
CREATE TABLE IF NOT EXISTS `v_pdf` (
`t_etudiant_id` int(11)
,`t_cour_id` int(11)
,`t_deliberation_id` int(11)
,`t_etudiant_nom` varchar(255)
,`t_cour_nom` varchar(255)
,`t_cour_ponderation` int(11)
,`t_deliberation_cote` int(11)
);
-- --------------------------------------------------------

--
-- Structure de la vue `v_cours`
--
DROP TABLE IF EXISTS `v_cours`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cours` AS (select `cours`.`id_cour` AS `id_cour`,`cours`.`nom` AS `nom`,`cours`.`ponderation` AS `ponderation`,`cours`.`id_promo` AS `id_promo`,`promotion`.`nom` AS `nom_promotion` from (`cours` join `promotion`) where (`cours`.`id_promo` = `promotion`.`id_promo`));

-- --------------------------------------------------------

--
-- Structure de la vue `v_delibe`
--
DROP TABLE IF EXISTS `v_delibe`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_delibe` AS (select `r`.`id` AS `idDeliberation`,`c`.`id` AS `idCours`,`c`.`ponderation` AS `ponderation`,`p`.`id` AS `idPromo`,`p`.`nom` AS `nom_promotion`,`d`.`id` AS `idDepartement`,`d`.`nom` AS `nom_departement`,`e`.`id` AS `idEtudiant`,`e`.`nom` AS `nom_etudiant`,`e`.`postnom` AS `postnom_etudiant`,`e`.`prenom` AS `prenom_etudiant`,`e`.`date_naissance` AS `date_naissance`,`e`.`matricule` AS `matricule`,`r`.`date_deliberation` AS `date_deliberation`,`r`.`cote` AS `cote` from ((((`t_cour` `c` join `t_promotion` `p`) join `t_etudiant` `e`) join `t_departement` `d`) join `t_deliberation` `r`) where ((`r`.`idCour` = `c`.`id`) and (`e`.`idPromo` = `p`.`id`) and (`r`.`idEtudiant` = `e`.`id`) and (`c`.`idPromo` = `p`.`id`) and (`p`.`idDepartement` = `d`.`id`)));

-- --------------------------------------------------------

--
-- Structure de la vue `v_deliberation`
--
DROP TABLE IF EXISTS `v_deliberation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_deliberation` AS (select `r`.`id_result` AS `id_result`,`c`.`id_cour` AS `id_cour`,`c`.`ponderation` AS `ponderation`,`p`.`id_promo` AS `id_promo`,`p`.`nom` AS `nom_promotion`,`d`.`id_depart` AS `id_depart`,`d`.`nom` AS `nom_departement`,`e`.`id_etud` AS `id_etud`,`e`.`nom` AS `nom_etudiant`,`e`.`postnom` AS `postnom_etudiant`,`e`.`prenom` AS `prenom_etudiant`,`e`.`date_naissance` AS `date_naissance`,`e`.`matricule` AS `matricule`,`r`.`date_resultat` AS `date_resultat`,`cr`.`cote` AS `cote` from (((((`cours` `c` join `promotion` `p`) join `etudiant` `e`) join `departement` `d`) join `cours_resultat` `cr`) join `resultat` `r`) where ((`cr`.`id_result` = `r`.`id_result`) and (`cr`.`id_cour` = `c`.`id_cour`) and (`e`.`id_promo` = `p`.`id_promo`) and (`r`.`id_etud` = `e`.`id_etud`) and (`c`.`id_promo` = `p`.`id_promo`)));

-- --------------------------------------------------------

--
-- Structure de la vue `v_pdf`
--
DROP TABLE IF EXISTS `v_pdf`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pdf` AS (select `e`.`id` AS `t_etudiant_id`,`c`.`id` AS `t_cour_id`,`d`.`id` AS `t_deliberation_id`,`e`.`nom` AS `t_etudiant_nom`,`c`.`nom` AS `t_cour_nom`,`c`.`ponderation` AS `t_cour_ponderation`,`d`.`cote` AS `t_deliberation_cote` from ((`t_cour` `c` join `t_etudiant` `e`) join `t_deliberation` `d`) where ((`d`.`idEtudiant` = `e`.`id`) and (`d`.`idCour` = `c`.`id`)));

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `cours_resultat`
--
ALTER TABLE `cours_resultat`
  ADD CONSTRAINT `cours_resultat_ibfk_1` FOREIGN KEY (`id_cour`) REFERENCES `cours` (`id_cour`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`id_promo`) REFERENCES `promotion` (`id_promo`);

--
-- Contraintes pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`id_depart`) REFERENCES `departement` (`id_depart`);

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `resultat_ibfk_1` FOREIGN KEY (`id_etud`) REFERENCES `etudiant` (`id_etud`);

--
-- Contraintes pour la table `t_cour`
--
ALTER TABLE `t_cour`
  ADD CONSTRAINT `t_cour_ibfk_1` FOREIGN KEY (`idPromo`) REFERENCES `t_promotion` (`id`);

--
-- Contraintes pour la table `t_deliberation`
--
ALTER TABLE `t_deliberation`
  ADD CONSTRAINT `t_deliberation_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `t_etudiant` (`id`),
  ADD CONSTRAINT `t_deliberation_ibfk_2` FOREIGN KEY (`idCour`) REFERENCES `t_cour` (`id`);

--
-- Contraintes pour la table `t_etudiant`
--
ALTER TABLE `t_etudiant`
  ADD CONSTRAINT `t_etudiant_ibfk_1` FOREIGN KEY (`idPromo`) REFERENCES `t_promotion` (`id`);

--
-- Contraintes pour la table `t_promotion`
--
ALTER TABLE `t_promotion`
  ADD CONSTRAINT `t_promotion_ibfk_1` FOREIGN KEY (`idDepartement`) REFERENCES `t_departement` (`id`);
--
-- Base de données :  `ecoledb`
--

-- --------------------------------------------------------

--
-- Structure de la table `attestation`
--

CREATE TABLE IF NOT EXISTS `attestation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `date_impression` date DEFAULT NULL,
  `num_attestation` varchar(50) DEFAULT NULL,
  `singature` varchar(50) DEFAULT NULL,
  `id_stagiaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_stagiaire` (`id_stagiaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `dossier_inscription`
--

CREATE TABLE IF NOT EXISTS `dossier_inscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attestation_scolarite` int(11) DEFAULT NULL,
  `attestation_bac` int(11) DEFAULT NULL,
  `cin` int(11) NOT NULL,
  `extrait_acte_naissance` int(11) DEFAULT NULL,
  `enveloppe` int(11) DEFAULT NULL,
  `photo` int(11) DEFAULT NULL,
  `reglement` int(11) DEFAULT NULL,
  `id_filiere` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_filiere` (`id_filiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE IF NOT EXISTS `filiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `niveau_diplome` varchar(2) DEFAULT NULL,
  `duree_formation` int(11) DEFAULT NULL,
  `stage1` varchar(255) DEFAULT NULL,
  `stage2` varchar(255) DEFAULT NULL,
  `niveau_admission` varchar(50) DEFAULT NULL,
  `frais_inscription` double DEFAULT NULL,
  `frais_mansuel` double DEFAULT NULL,
  `frais_examen` double DEFAULT NULL,
  `frais_diplome` double DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `num_autorisation` varchar(255) DEFAULT NULL,
  `date_qualification` date DEFAULT NULL,
  `num_qualification` varchar(255) DEFAULT NULL,
  `date_accreditation` date DEFAULT NULL,
  `num_accreditation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `filiere`
--

INSERT INTO `filiere` (`id`, `nom`, `niveau_diplome`, `duree_formation`, `stage1`, `stage2`, `niveau_admission`, `frais_inscription`, `frais_mansuel`, `frais_examen`, `frais_diplome`, `date_creation`, `num_autorisation`, `date_qualification`, `num_qualification`, `date_accreditation`, `num_accreditation`) VALUES
(1, 'TSGE', 'ts', 2, 'du 01 au 31 mai', 'du 01 au 31 mars', 'bac', 500, 500, 500, 500, '2014-12-15', '01/2014', '2017-10-11', 'Q1/2017', '2017-10-11', 'AC1/2017'),
(2, 'TSDI', 'ts', 2, 'du 01 au 31 mai', 'du 01 au 31 mars', 'bac', 500, 500, 500, 500, '2014-12-15', '01/2014', '2017-10-11', 'Q1/2017', '2017-10-11', 'AC1/2017'),
(3, 'TGI', 't', 2, 'du 01 au 31 mai', 'du 01 au 31 mars', 'niveau_bac', 500, 500, 500, 500, '2014-12-15', '01/2014', '2017-10-11', 'Q1/2017', '2017-10-11', 'AC1/2017');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
  `id_matiere` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `nombre_heure_total` int(11) DEFAULT NULL,
  `nombre_heure_tp` int(11) DEFAULT NULL,
  `nombre_heure_th` int(11) DEFAULT NULL,
  `coef` int(11) NOT NULL,
  PRIMARY KEY (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

CREATE TABLE IF NOT EXISTS `programme` (
  `id_prog` int(11) NOT NULL AUTO_INCREMENT,
  `id_filiere` int(11) DEFAULT NULL,
  `annee_scolaire` varchar(50) DEFAULT NULL,
  `id_matiere` int(11) DEFAULT NULL,
  `classe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_prog`),
  KEY `id_filiere` (`id_filiere`),
  KEY `id_matiere` (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `scolarite`
--

CREATE TABLE IF NOT EXISTS `scolarite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee_scolaire` varchar(50) DEFAULT NULL,
  `id_stagiaire` int(11) DEFAULT NULL,
  `id_filiere` int(11) DEFAULT NULL,
  `classe` varchar(50) DEFAULT NULL,
  `resultat` varchar(50) DEFAULT NULL,
  `date_resultat` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_stagiaire` (`id_stagiaire`),
  KEY `id_filiere` (`id_filiere`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `scolarite`
--

INSERT INTO `scolarite` (`id`, `annee_scolaire`, `id_stagiaire`, `id_filiere`, `classe`, `resultat`, `date_resultat`) VALUES
(1, '2018/2019', 1, 1, '1ere annee', 'admis', '2018-06-30'),
(2, '2018/2019', 2, 2, '1ere annee', 'admis', '2018-06-30'),
(3, '2018/2019', 3, 3, '1ere annee', 'admis', '2018-06-30'),
(4, '2018/2019', 4, 2, '1ere annee', 'admis', '2017-06-30'),
(5, '2018/2019', 5, 2, '1ere annee', 'Abondonne', '2018-03-30'),
(6, '2019/2020', 1, 1, '2eme annee', 'en cours', NULL),
(7, '2019/2020', 2, 2, '2eme annee', 'en cours', NULL),
(8, '2019/2020', 3, 3, '2eme annee', 'Laureat', '2018-06-30'),
(9, '2019/2020', 4, 2, '2eme annee', 'Laureat', '2018-06-30'),
(10, '2022/2023', 6, 2, '2eme Annee', 'inscrit', '2023-02-21');

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire`
--

CREATE TABLE IF NOT EXISTS `stagiaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civilite` varchar(1) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(200) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `cin` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `niveau_scolaire` varchar(50) DEFAULT NULL,
  `dernier_diplome` varchar(50) DEFAULT NULL,
  `dernier_etablissement` varchar(50) DEFAULT NULL,
  `num_inscription` varchar(50) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `code_national` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `stagiaire`
--

INSERT INTO `stagiaire` (`id`, `civilite`, `nom`, `prenom`, `date_naissance`, `lieu_naissance`, `adresse`, `ville`, `cin`, `tel`, `niveau_scolaire`, `dernier_diplome`, `dernier_etablissement`, `num_inscription`, `date_inscription`, `code_national`, `photo`) VALUES
(1, 'f', 'Damiri', 'Hind', '1997-11-21', 'Marrakech', '154 Imlil', 'Marrakech', 'y12345', '06 66 22 23 44', 'bac', 'bac', 'lyce rhali elfarouki', '133-15', '2017-10-05', 'z00053201', NULL),
(2, 'f', 'Kaftani', 'Souad', '1998-02-25', 'Marrakech', '120 Massira', 'Marrakech', 'y53284', '06 44 22 23 22', 'bac', 'bac', 'lyce rhali elfarouki', '134-15', '2017-10-05', 'z00053201', NULL),
(3, 'f', 'wisal', 'dounia', '1992-11-20', 'Marrakech', '122 Daoudiyte', 'Marrakech', 'y14789', '06 25 22 70 14', 'niveau bac', NULL, 'lyce rhali elfarouki', '135-15', '2017-10-05', 'z00053201', NULL),
(4, 'f', 'meradi', 'samir', '1992-11-20', 'Marrakech', '122 Mhamid', 'Marrakech', 'y14789', '06 25 22 70 14', 'bac', NULL, 'lyce rhali elfarouki', '135-15', '2017-10-05', 'z00053201', NULL),
(5, 'm', 'Ennaciri', 'rachid', '1992-11-20', 'Marrakech', '122 Issil', 'Marrakech', 'y14789', '06 25 22 70 14', 'bac', NULL, 'lyce rhali elfarouki', '135-15', '2017-10-05', 'z00053201', NULL),
(6, 'f', 'yongo', 'daniel', '2023-02-23', 'kinshasa', 'lemba super,Q/kimpwanza ,Av/Paka , N 08', 'kinshasa', 'vv', '+243823263196', '2', '2017', 'salisa', '0258', '2023-02-21', '155', 'IMG_20220708_102902_165.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(4) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `login`, `pwd`, `role`, `email`) VALUES
(12, 'admin', '123', 'Directeur', 'admin@gmail.com'),
(13, 'swc1', '123', 'Secrétaire', 'sec1@gmail.com'),
(14, 'sec2', '123', 'Secrétaire', 'user2@gmail.com'),
(17, 'sec3', '123', 'Secrétaire', 'test10@gmail.com');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `attestation`
--
ALTER TABLE `attestation`
  ADD CONSTRAINT `attestation_ibfk_1` FOREIGN KEY (`id_stagiaire`) REFERENCES `stagiaire` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dossier_inscription`
--
ALTER TABLE `dossier_inscription`
  ADD CONSTRAINT `dossier_inscription_ibfk_1` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `programme`
--
ALTER TABLE `programme`
  ADD CONSTRAINT `programme_ibfk_1` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `programme_ibfk_2` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE;

--
-- Contraintes pour la table `scolarite`
--
ALTER TABLE `scolarite`
  ADD CONSTRAINT `scolarite_ibfk_1` FOREIGN KEY (`id_stagiaire`) REFERENCES `stagiaire` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `scolarite_ibfk_2` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id`) ON DELETE CASCADE;
--
-- Base de données :  `exo`
--

-- --------------------------------------------------------

--
-- Structure de la table `liste`
--

CREATE TABLE IF NOT EXISTS `liste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) DEFAULT NULL,
  `postnom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `radio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `liste`
--

INSERT INTO `liste` (`id`, `nom`, `postnom`, `prenom`, `radio`) VALUES
(1, 'yongo', 'lola', 'daniel', 'on'),
(2, 'ffh', 'jdfjk', 'kjkfd', 'on'),
(3, 'gg', 'pko', 'jj', 'masculin'),
(4, 'mpoto', 'ewahuly', 'dylis', 'on'),
(5, 'mpoto', 'ewahuly', 'dylis', 'masculin'),
(6, 'ooo', 'fhugh', 'bnb', 'on');

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `login`
--

INSERT INTO `login` (`id`, `nom`, `password`) VALUES
(1, 'Yongo', 'Lola'),
(2, 'bamba', 'bonbon'),
(3, 'eze', 'Zb)HhkV3v0&*rRm2kh'),
(4, 'Mulongo', 'Yves'),
(5, 'eze', 'Zb)HhkV3v0&*rRm2kh'),
(6, 'manuana', 'gobina'),
(7, 'manuana', 'gobina'),
(8, 'manuana', 'gobina'),
(9, 'manuana', 'gobina'),
(10, 'flora', 'likangu'),
(11, 'danlola', 'xx'),
(12, 'danlola', 'xx'),
(13, 'fl', '*$aH9iFQOqEGPHuqA7'),
(14, 'fl', '*$aH9iFQOqEGPHuqA7'),
(15, 'fl', '*$aH9iFQOqEGPHuqA7'),
(16, 'fl', '*$aH9iFQOqEGPHuqA7'),
(17, 'zola', 'vnvn'),
(18, 'zola', 'vnvn'),
(19, 'mongo', 'tutu'),
(20, 'mongo', 'tutu');
--
-- Base de données :  `frais_scolaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usernmane` varchar(20) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Base de données :  `gestion_stag`
--

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE IF NOT EXISTS `filiere` (
  `idFiliere` int(4) NOT NULL AUTO_INCREMENT,
  `nomFiliere` varchar(50) DEFAULT NULL,
  `niveau` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idFiliere`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `filiere`
--

INSERT INTO `filiere` (`idFiliere`, `nomFiliere`, `niveau`) VALUES
(1, 'TSDI', 'TS'),
(2, 'TSGE', 'TS'),
(3, 'TGI', 'T'),
(4, 'TSRI', 'TS'),
(5, 'TCE', 'T');

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire`
--

CREATE TABLE IF NOT EXISTS `stagiaire` (
  `idStagiaire` int(4) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `civilite` varchar(1) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `idFiliere` int(4) DEFAULT NULL,
  PRIMARY KEY (`idStagiaire`),
  KEY `idFiliere` (`idFiliere`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `stagiaire`
--

INSERT INTO `stagiaire` (`idStagiaire`, `nom`, `prenom`, `civilite`, `photo`, `idFiliere`) VALUES
(1, 'SAADAOUI', 'MOHAMMED', 'M', 'Chrysantheme.jpg', 1),
(2, 'CHAABI', 'OMAR', 'M', 'Desert.jpg', 2),
(3, 'SALIM', 'RACHIDA', 'F', 'Hortensias.jpg', 3),
(4, 'FAOUZI', 'NABILA', 'F', 'Meduses.jpg', 1),
(5, 'ETTAOUSSI', 'KAMAL', 'M', 'Penguins.jpg', 2),
(6, 'EZZAKI', 'ABDELKARIM', 'M', 'Tulipes.jpg', 3),
(7, 'SAADAOUI', 'MOHAMMED', 'M', 'Chrysantheme.jpg', 1),
(8, 'CHAABI', 'OMAR', 'M', 'Desert.jpg', 2),
(9, 'SALIM', 'RACHIDA', 'F', 'Hortensias.jpg', 3),
(10, 'FAOUZI', 'NABILA', 'F', 'Meduses.jpg', 1),
(11, 'ETTAOUSSI', 'KAMAL', 'M', 'Penguins.jpg', 2),
(12, 'EZZAKI', 'ABDELKARIM', 'M', 'Tulipes.jpg', 3),
(13, 'SAADAOUI', 'MOHAMMED', 'M', 'Chrysantheme.jpg', 1),
(14, 'CHAABI', 'OMAR', 'M', 'Desert.jpg', 2),
(15, 'SALIM', 'RACHIDA', 'F', 'Hortensias.jpg', 3),
(16, 'FAOUZI', 'NABILA', 'F', 'Meduses.jpg', 1),
(17, 'ETTAOUSSI', 'KAMAL', 'M', 'Penguins.jpg', 2),
(18, 'EZZAKI', 'ABDELKARIM', 'M', 'Tulipes.jpg', 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `iduser` int(4) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `etat` int(1) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`iduser`, `login`, `email`, `role`, `etat`, `pwd`) VALUES
(1, 'admin', 'admin@gmail.com', 'ADMIN', 1, '202cb962ac59075b964b07152d234b70'),
(2, 'user1', 'user1@gmail.com', 'VISITEUR', 0, '202cb962ac59075b964b07152d234b70'),
(3, 'user2', 'user2@gmail.com', 'VISITEUR', 1, '202cb962ac59075b964b07152d234b70');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD CONSTRAINT `stagiaire_ibfk_1` FOREIGN KEY (`idFiliere`) REFERENCES `filiere` (`idFiliere`);
--
-- Base de données :  `pharmacie`
--

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `adresse` varchar(25) NOT NULL,
  `telephone` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom`, `adresse`, `telephone`) VALUES
(1, 'yongo lola', 'lemba super', 82326396),
(2, 'hangi', 'hdfhjdhjg', 2555858);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'danielyongolola@gmail.com', 'lola123'),
(2, 'jasonisamene@gmail.com', 'libolonayo');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `prix` int(25) NOT NULL,
  `qte` int(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `medicament`
--

INSERT INTO `medicament` (`id`, `description`, `prix`, `qte`) VALUES
(1, 'ibucap', 800, 900),
(2, 'quinine', 2500, 600);

-- --------------------------------------------------------

--
-- Structure de la table `v_vente`
--

CREATE TABLE IF NOT EXISTS `v_vente` (
  `id_vente` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(25) NOT NULL,
  `nom_fournisseur` varchar(30) NOT NULL,
  `desc_medic` varchar(25) NOT NULL,
  `prix` int(20) NOT NULL,
  `qte` int(15) NOT NULL,
  PRIMARY KEY (`id_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Base de données :  `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `gmail` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `login`
--

INSERT INTO `login` (`id`, `nom`, `gmail`, `password`) VALUES
(6, 'yongo', 'daniellola@gmail.com', 'bb'),
(7, 'zola', 'da', 'Zb)HhkV3v0&*rRm2kh'),
(8, 'zorro', 'da', 'Zb)HhkV3v0&*rRm2kh'),
(9, '', '', ''),
(10, 'flora', 'ewahuly@gmail.com', 'xx');
--
-- Base de données :  `test`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
