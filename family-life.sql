-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Mar 17 Avril 2012 à 21:22
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `family-life`
--

-- --------------------------------------------------------

--
-- Structure de la table `budgets`
--

CREATE TABLE IF NOT EXISTS `budgets` (
  `id_budget` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_budget`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `mobile_phone` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `registered_contact` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_contact`),
  KEY `registered_contact` (`registered_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `days`
--

CREATE TABLE IF NOT EXISTS `days` (
  `id_day` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(8) NOT NULL,
  `week_day` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_day`),
  KEY `week_day` (`week_day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id_events` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `price` float NOT NULL,
  `title` varchar(60) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_events`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `events_families`
--

CREATE TABLE IF NOT EXISTS `events_families` (
  `id_event_families` int(11) NOT NULL AUTO_INCREMENT,
  `event_event_selected` int(11) NOT NULL,
  `family_event` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_event_families`),
  KEY `family_event` (`family_event`),
  KEY `event_event_selected` (`event_event_selected`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `families`
--

CREATE TABLE IF NOT EXISTS `families` (
  `id_family` int(11) NOT NULL AUTO_INCREMENT,
  `list_family` int(11) NOT NULL,
  `budget_family` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_family`),
  KEY `list_family` (`list_family`),
  KEY `budget_family` (`budget_family`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `families_contacts`
--

CREATE TABLE IF NOT EXISTS `families_contacts` (
  `id_family_contact` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `mobile_phone` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `family_family_contact` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_family_contact`),
  KEY `family_family_contact` (`family_family_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `histo_products`
--

CREATE TABLE IF NOT EXISTS `histo_products` (
  `id_histo` int(11) NOT NULL AUTO_INCREMENT,
  `nb_iteration` int(11) NOT NULL,
  `product_histo` int(11) NOT NULL,
  `family_histo` int(11) DEFAULT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_histo`),
  KEY `product_histo` (`product_histo`,`family_histo`),
  KEY `family_histo` (`family_histo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `matters`
--

CREATE TABLE IF NOT EXISTS `matters` (
  `id_matter` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `teacher` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_matter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `meals`
--

CREATE TABLE IF NOT EXISTS `meals` (
  `id_meal` int(11) NOT NULL AUTO_INCREMENT,
  `time` enum('Matin','Midi','Soir') NOT NULL,
  `starter` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `dessert` int(11) DEFAULT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_meal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `families_menu` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `families_menu` (`families_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `menus_meals`
--

CREATE TABLE IF NOT EXISTS `menus_meals` (
  `id_menu` int(11) NOT NULL,
  `id_meal` int(11) NOT NULL,
  KEY `id_menu` (`id_menu`,`id_meal`),
  KEY `id_meal` (`id_meal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `id_note` int(11) NOT NULL AUTO_INCREMENT,
  `coeff` int(11) NOT NULL DEFAULT '1',
  `note` int(11) NOT NULL,
  `matter_note` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_note`),
  KEY `matter_note` (`matter_note`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notices`
--

CREATE TABLE IF NOT EXISTS `notices` (
  `id_notice` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(60) NOT NULL,
  `title` varchar(60) NOT NULL,
  `date_post` datetime NOT NULL,
  `message` varchar(60) NOT NULL,
  `registered_notice` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_notice`),
  KEY `registered_notice` (`registered_notice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

CREATE TABLE IF NOT EXISTS `recettes` (
  `id_recette` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `recettes_products`
--

CREATE TABLE IF NOT EXISTS `recettes_products` (
  `id_recette` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  KEY `id_recette` (`id_recette`,`id_product`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `registereds`
--

CREATE TABLE IF NOT EXISTS `registereds` (
  `id_registered` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(20) NOT NULL,
  `avatar` blob,
  `name` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `birth_date` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_connection` datetime NOT NULL,
  `grant` int(11) NOT NULL DEFAULT '0',
  `family_registered` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_registered`),
  UNIQUE KEY `pseudo` (`pseudo`),
  KEY `id_family` (`family_registered`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure de la table `results`
--

CREATE TABLE IF NOT EXISTS `results` (
  `id_result` int(11) NOT NULL AUTO_INCREMENT,
  `registered_result` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_result`),
  UNIQUE KEY `registered_result` (`registered_result`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `schedules`
--

CREATE TABLE IF NOT EXISTS `schedules` (
  `id_schedule` int(11) NOT NULL AUTO_INCREMENT,
  `registered_schedule` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_schedule`),
  UNIQUE KEY `registered_schedule` (`registered_schedule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `shopping_lists`
--

CREATE TABLE IF NOT EXISTS `shopping_lists` (
  `id_list` int(11) NOT NULL AUTO_INCREMENT,
  `list_accept` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_list` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_list`),
  KEY `product_list` (`product_list`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `shopping_list_favorys`
--

CREATE TABLE IF NOT EXISTS `shopping_list_favorys` (
  `id_favory` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `product_favory` int(11) NOT NULL,
  `family_favory` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_favory`),
  KEY `family_favory` (`family_favory`),
  KEY `product_favory` (`product_favory`),
  KEY `family_favory_2` (`family_favory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `title` varchar(60) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `day_task` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_task`),
  KEY `day_task` (`day_task`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tasks_recurrents`
--

CREATE TABLE IF NOT EXISTS `tasks_recurrents` (
  `id_task_recurrent` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `title` varchar(60) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `schedules_task_recurrent` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_task_recurrent`),
  KEY `schedules_task_recurrent` (`schedules_task_recurrent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `terms`
--

CREATE TABLE IF NOT EXISTS `terms` (
  `id_term` int(11) NOT NULL AUTO_INCREMENT,
  `year` year(4) NOT NULL,
  `num` tinyint(4) NOT NULL,
  `class` varchar(20) NOT NULL,
  `result_term` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_term`),
  KEY `result_term` (`result_term`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `terms_matters`
--

CREATE TABLE IF NOT EXISTS `terms_matters` (
  `term_id` int(11) NOT NULL,
  `matter_id` int(11) NOT NULL,
  KEY `term_id` (`term_id`),
  KEY `term_id_2` (`term_id`),
  KEY `matter_id` (`matter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `todo_lists`
--

CREATE TABLE IF NOT EXISTS `todo_lists` (
  `id_todo` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `create_date` datetime NOT NULL,
  `realize_date` datetime NOT NULL,
  `length` time NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `importance` int(11) NOT NULL DEFAULT '0',
  `registered_todo` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_todo`),
  KEY `register_todo` (`registered_todo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id_transaction` int(11) NOT NULL AUTO_INCREMENT,
  `title` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `montant` int(11) NOT NULL,
  `frequence` int(11) NOT NULL,
  `budget_transaction` int(11) NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_transaction`),
  KEY `budget_transaction` (`budget_transaction`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `weeks`
--

CREATE TABLE IF NOT EXISTS `weeks` (
  `id_weeks` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_week` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `rmq` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`id_weeks`),
  UNIQUE KEY `schedule_week` (`schedule_week`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`registered_contact`) REFERENCES `registereds` (`id_registered`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `days`
--
ALTER TABLE `days`
  ADD CONSTRAINT `days_ibfk_1` FOREIGN KEY (`week_day`) REFERENCES `weeks` (`id_weeks`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `events_families`
--
ALTER TABLE `events_families`
  ADD CONSTRAINT `events_families_ibfk_1` FOREIGN KEY (`event_event_selected`) REFERENCES `events` (`id_events`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `events_families_ibfk_2` FOREIGN KEY (`family_event`) REFERENCES `families` (`id_family`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `families`
--
ALTER TABLE `families`
  ADD CONSTRAINT `families_ibfk_1` FOREIGN KEY (`budget_family`) REFERENCES `budgets` (`id_budget`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `families_ibfk_2` FOREIGN KEY (`list_family`) REFERENCES `shopping_lists` (`id_list`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `families_contacts`
--
ALTER TABLE `families_contacts`
  ADD CONSTRAINT `families_contacts_ibfk_1` FOREIGN KEY (`family_family_contact`) REFERENCES `families` (`id_family`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `histo_products`
--
ALTER TABLE `histo_products`
  ADD CONSTRAINT `histo_products_ibfk_1` FOREIGN KEY (`family_histo`) REFERENCES `families` (`id_family`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `histo_products_ibfk_2` FOREIGN KEY (`product_histo`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`families_menu`) REFERENCES `families` (`id_family`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menus_meals`
--
ALTER TABLE `menus_meals`
  ADD CONSTRAINT `menus_meals_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menus` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menus_meals_ibfk_2` FOREIGN KEY (`id_meal`) REFERENCES `meals` (`id_meal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`matter_note`) REFERENCES `matters` (`id_matter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`registered_notice`) REFERENCES `registereds` (`id_registered`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `recettes_products`
--
ALTER TABLE `recettes_products`
  ADD CONSTRAINT `recettes_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recettes_products_ibfk_2` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`registered_result`) REFERENCES `registereds` (`id_registered`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`registered_schedule`) REFERENCES `registereds` (`id_registered`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `shopping_lists`
--
ALTER TABLE `shopping_lists`
  ADD CONSTRAINT `shopping_lists_ibfk_1` FOREIGN KEY (`product_list`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `shopping_list_favorys`
--
ALTER TABLE `shopping_list_favorys`
  ADD CONSTRAINT `shopping_list_favorys_ibfk_1` FOREIGN KEY (`product_favory`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shopping_list_favorys_ibfk_2` FOREIGN KEY (`family_favory`) REFERENCES `families` (`id_family`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`day_task`) REFERENCES `days` (`id_day`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tasks_recurrents`
--
ALTER TABLE `tasks_recurrents`
  ADD CONSTRAINT `tasks_recurrents_ibfk_1` FOREIGN KEY (`schedules_task_recurrent`) REFERENCES `schedules` (`id_schedule`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `terms`
--
ALTER TABLE `terms`
  ADD CONSTRAINT `terms_ibfk_1` FOREIGN KEY (`result_term`) REFERENCES `results` (`id_result`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `terms_matters`
--
ALTER TABLE `terms_matters`
  ADD CONSTRAINT `terms_matters_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id_term`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `terms_matters_ibfk_2` FOREIGN KEY (`matter_id`) REFERENCES `matters` (`id_matter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `todo_lists`
--
ALTER TABLE `todo_lists`
  ADD CONSTRAINT `todo_lists_ibfk_1` FOREIGN KEY (`registered_todo`) REFERENCES `registereds` (`id_registered`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`budget_transaction`) REFERENCES `budgets` (`id_budget`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `weeks`
--
ALTER TABLE `weeks`
  ADD CONSTRAINT `weeks_ibfk_1` FOREIGN KEY (`schedule_week`) REFERENCES `schedules` (`id_schedule`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
