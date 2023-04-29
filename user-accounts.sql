-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 29 avr. 2023 à 03:17
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `user-accounts`
--

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`) VALUES
(1, 'Edit', 'ok'),
(2, 'read', 'reader'),
(3, 'update', 'updater');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`) VALUES
(118, 2, 2),
(119, 7, 2),
(120, 1, 1),
(121, 1, 2),
(122, 1, 3),
(123, 3, 1),
(124, 3, 2),
(125, 3, 3),
(129, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `views`, `image`, `body`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, '5 Habits that can improve your life', '5-habits-that-can-improve-your-life', 0, 'banner.jpg', 'Read every day', 1, '2018-02-03 05:58:02', '2018-02-01 17:14:31'),
(2, 1, 'Second post on LifeBlog', 'second-post-on-lifeblog', 0, 'banner.jpg', 'This is the body of the second post on this site', 1, '2019-09-25 12:37:55', '2018-02-01 11:04:36'),
(3, 1, 'godaz', 'godaz', 0, 'Chrysanthemum.jpg', '&lt;p&gt;Click save and that&amp;#39;s it. The tables are now related. But to establish a relationship between posts and topics, we need to populate the&amp;nbsp;topics&amp;nbsp;table with topics and eventually the&amp;nbsp;post_topic&amp;nbsp;table which is the actual relationship info.&lt;/p&gt;\r\n\r\n&lt;p&gt;Now let&amp;#39;s insert a few entries into the two tables:&lt;/p&gt;\r\n\r\n&lt;p&gt;topics:&lt;/p&gt;\r\n\r\n&lt;pre&gt;\r\n&lt;code&gt;INSERT INTO `topics` (`id`, `name`, `slug`) VALUES\r\n(1, &amp;#39;Inspiration&amp;#39;, &amp;#39;inspiration&amp;#39;),\r\n(2, &amp;#39;Motivation&amp;#39;, &amp;#39;motivation&amp;#39;),\r\n(3, &amp;#39;Diary&amp;#39;, &amp;#39;diary&amp;#39;)&lt;/code&gt;&lt;/pre&gt;\r\n\r\n&lt;p&gt;post_topic:&lt;/p&gt;\r\n\r\n&lt;pre&gt;\r\n&lt;code&gt;INSERT INTO `post_topic` (`id`, `post_id`, `topic_id`) VALUES\r\n(1, 1, 1),\r\n(2, 2, 2)&lt;/code&gt;&lt;/pre&gt;\r\n\r\n&lt;p&gt;The relationship defined on the&amp;nbsp;post_topic&amp;nbsp;table says that the topic with id&amp;nbsp;1&amp;nbsp;on the&amp;nbsp;topics&amp;nbsp;table belongs to the post with id&amp;nbsp;1&amp;nbsp;on the&amp;nbsp;posts&amp;nbsp;table. The same holds true for the topic with id&amp;nbsp;2&amp;nbsp;and post with id&amp;nbsp;2.&lt;/p&gt;\r\n\r\n&lt;p&gt;On each post listing on the&amp;nbsp;index.php&amp;nbsp;page, we are going to display the topic under which the post is created.&amp;nbsp;&lt;/p&gt;\r\n', 1, '2019-09-25 12:46:36', '2019-09-25 12:46:36');

-- --------------------------------------------------------

--
-- Structure de la table `post_topic`
--

CREATE TABLE `post_topic` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `post_topic`
--

INSERT INTO `post_topic` (`id`, `post_id`, `topic_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(0, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'Has authority of users and roles and permissions.'),
(2, 'Author', 'Has full authority of own posts'),
(3, 'Editor', 'Has full authority over all posts'),
(4, 'developer', 'for the developer'),
(5, 'BELLO Amed', 'qqqqqqqqqq'),
(7, 'anonyme', 'ooiuyuhy'),
(8, 'allanonyme', 'ttgff');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `role_id`, `user_name`, `user_email`, `user_password`, `profile_picture`, `created_at`, `updated_at`) VALUES
(1, 1, 'olleb', 'olleb1@gmail.com', '$2y$10$GZScE6RdTh0bumO7cw7ncuiz3REbivqMwqe8YvN4JtncTY2YYfDte', NULL, '2023-04-29 01:11:00', '0000-00-00 00:00:00'),
(2, 1, 'olleb1', 'admin@gmail.com', '$2y$10$7rOOMowBrA8JTj1QkashqOUKgN5.S4mdCGD87QnDVdwoHPGqNseu.', NULL, '2023-04-29 01:11:19', '0000-00-00 00:00:00'),
(3, 1, 'olleb11', 'user1@gmail.com', '$2y$10$csf096I89435hZLhzL28JuRENEigx/o53Zmk57Heh9sdbi6N0v7Ii', NULL, '2023-04-29 01:11:41', '0000-00-00 00:00:00'),
(4, 2, 'ollab123', 'user2@gmail.com', '$2y$10$usw/3q.ukL5xcIDgb9DNXehFggabir9kAqJBw1QSeZ5ZtGIBXHaNW', '', '2023-04-29 01:13:56', '0000-00-00 00:00:00'),
(5, 2, 'op', 'user3@gmail.com', '$2y$10$VzURMxqbVUufyP2nCzjrOO7SMX2Tjaj7wnte4svL8RWurhOh5iPpy', NULL, '2023-04-29 01:14:01', '0000-00-00 00:00:00'),
(8, 4, 'az', 'user4@gmail.com', '$2y$10$sazexlxkdHwN5zzs1ymPZOcWXEYs60OU1kMKJrO10/Eaj/t93IDvS', NULL, '2023-04-29 01:13:29', '0000-00-00 00:00:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`user_name`),
  ADD UNIQUE KEY `email` (`user_email`),
  ADD KEY `user_ibfk_1` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
