-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 19 nov. 2020 à 19:21
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Appli_CFP-GETECH_Flutter_API_Samane`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `motPasse` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `nom`, `prenom`, `adresse`, `telephone`, `email`, `motPasse`) VALUES
(1, 'SECK', 'Ngor', 'Tattaguine', '123456789', 'seck@gmail.com', 'passer');

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

CREATE TABLE `candidat` (
  `id` int(11) NOT NULL,
  `id_formation` int(11) DEFAULT NULL,
  `id_profil` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`id`, `id_formation`, `id_profil`, `nom`, `prenom`, `adresse`, `telephone`, `email`, `sexe`) VALUES
(1, 8, 2, 'GADIAGA', 'Mafatime', 'Yeumbeul', '123456789', 'maf@gmail.com', 'masculin'),
(2, NULL, NULL, 'SAGNA', 'Judith', 'Ouakam', '123456789', 'Judith@gmail.com', 'Feminin'),
(3, NULL, NULL, 'SAGNA', 'Judith', 'Ouakam', '123456789', 'Judith@gmail.com', 'Feminin'),
(4, NULL, NULL, 'SAGNA', 'Judith', 'Ouakam', '123456789', 'Judith@gmail.com', 'Feminin'),
(5, NULL, NULL, 'SAGNA', 'Judith', 'Ouakam', '123456789', 'Judith@gmail.com', 'Feminin'),
(6, NULL, NULL, 'SAGNA', 'Judith', 'Ouakam', '123456789', 'Judith@gmail.com', 'Feminin');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id` int(11) NOT NULL,
  `id_responsable` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id`, `id_responsable`, `id_admin`, `nom`) VALUES
(1, 1, 1, 'Metier du Numerique'),
(2, 3, 1, 'Metier de l\'Industrie'),
(3, 2, 1, 'Metier de la Gestion'),
(4, 4, 1, 'Metier du Tertiaire');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id` int(11) NOT NULL,
  `id_departement` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `id_departement`, `nom`, `date`, `duree`) VALUES
(7, 1, 'Design', '2020-12-05', 2),
(8, 1, 'Developpement Web', '2020-12-05', 8),
(9, 1, 'Maintenance Informatique', '2020-12-05', 5),
(10, 1, 'Reseau Informatique', '2020-12-05', 5),
(11, 1, 'Marketing Digital', '2020-12-05', 3),
(12, 1, 'Communication Digitale', '2020-12-05', 4);

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `profil`
--

INSERT INTO `profil` (`id`, `nom`) VALUES
(1, 'Eleve'),
(2, 'Etudiant'),
(3, 'Entrepreneur'),
(4, 'A la recherche opportunites');

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

CREATE TABLE `programme` (
  `id` int(11) NOT NULL,
  `id_formation` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duree` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `programme`
--

INSERT INTO `programme` (`id`, `id_formation`, `nom`, `duree`) VALUES
(1, 7, 'Analyse de Besoin Et Conception visuelle', '2'),
(2, 7, 'Realisation de Graphismes', '2'),
(3, 7, 'Realisation des Maquettes', '3'),
(4, 8, 'Analyse des besoins du client', '3'),
(5, 8, 'Conception des sites grâce aux CMS', '2'),
(6, 8, 'Gestion de projet web', '3'),
(7, 9, 'Diagnostiquer dysfonctionnement materiel', '3'),
(8, 9, 'Configurations de postes de travail', '1'),
(9, 9, 'Installation de systemes exploitations', '1'),
(10, 10, 'Déploiement des ressources informatiques', '4'),
(11, 10, 'Cablage Reseau', '5'),
(12, 10, 'Installation et configuration de points acces', '3'),
(13, 11, 'Conception de strategies marketing de entreprise', '4'),
(14, 11, 'Optimisation de ciblage', '3'),
(15, 11, 'Definition de strategies de marketing digital', '4'),
(16, 12, 'Techniques de communication', '3'),
(17, 12, 'Utilisation outils de travail collaboratif', '2'),
(18, 12, 'Maitrise des outils de web analyse', '2');

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

CREATE TABLE `responsable` (
  `id` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `motPasse` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `responsable`
--

INSERT INTO `responsable` (`id`, `id_admin`, `nom`, `prenom`, `adresse`, `telephone`, `email`, `motPasse`) VALUES
(1, 1, 'DIOP', 'Mor', 'Taiba Ndiaye', '123456789', 'mor@gmail.com', 'passer'),
(2, 1, 'MBOW', 'Cheikh', 'Parcelles', '123456789', 'cheikh@gmail.com', 'passer'),
(3, 1, 'DIEYE', 'Moustapha', 'Keur Mor Ndiaye', '123456789', 'tapha@gmail.com', 'passer'),
(4, 1, 'DIENE', 'Moussa', 'Keur Massar', '123456789', 'moussa@gmail.com', 'passer');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6AB5B471C0759D98` (`id_formation`),
  ADD KEY `IDX_6AB5B471C0E1077A` (`id_profil`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C1765B634A40C0F0` (`id_responsable`),
  ADD KEY `IDX_C1765B63668B4C46` (`id_admin`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_404021BFD9649694` (`id_departement`);

--
-- Index pour la table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `programme`
--
ALTER TABLE `programme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3DDCB9FFC0759D98` (`id_formation`);

--
-- Index pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_52520D07668B4C46` (`id_admin`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `candidat`
--
ALTER TABLE `candidat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `programme`
--
ALTER TABLE `programme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `responsable`
--
ALTER TABLE `responsable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD CONSTRAINT `FK_6AB5B471C0759D98` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `FK_6AB5B471C0E1077A` FOREIGN KEY (`id_profil`) REFERENCES `profil` (`id`);

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `FK_C1765B634A40C0F0` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id`),
  ADD CONSTRAINT `FK_C1765B63668B4C46` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_404021BFD9649694` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id`);

--
-- Contraintes pour la table `programme`
--
ALTER TABLE `programme`
  ADD CONSTRAINT `FK_3DDCB9FFC0759D98` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`);

--
-- Contraintes pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `FK_52520D07668B4C46` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
