-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 22 mai 2021 à 18:59
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laravel`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'sint', 'excepturi-iste-eos-nemo-ipsam', '2021-05-21 10:14:37', '2021-05-21 10:14:37'),
(2, 'ad', 'sunt-quo-fugit-atque-error-deserunt-quam', '2021-05-21 10:14:37', '2021-05-21 10:14:37'),
(3, 'odio', 'hic-veniam-harum-in', '2021-05-21 10:14:37', '2021-05-21 10:14:37'),
(4, 'consequatur', 'perferendis-et-ducimus-quia-labore-asperiores-dolorum-in-voluptatem', '2021-05-21 10:14:37', '2021-05-21 10:14:37');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2021_05_20_231245_create_products_table', 1),
(4, '2021_05_20_231306_create_categories_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_id_foreign` (`user_id`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `image`, `price`, `user_id`, `category_id`, `created_at`, `updated_at`) VALUES
(32, 'lorem ipsum', 'lorem-ipsum', 'lorem ipsum hi', '1621684700.png', '25.00', 1, 2, '2021-05-21 11:04:59', '2021-05-22 14:15:32'),
(33, 'Doloremque minus commodi accusamus soluta aliquid in.', 'voluptas-excepturi-corporis-suscipit-quia-labore-cupiditate', 'Error consequatur repellendus cumque nam.', '1621689061.jpg', '4.00', 1, 4, '2021-05-21 11:04:59', '2021-05-21 11:04:59'),
(30, 'Rem placeat placeat quis dolor voluptate.', 'et-ducimus-officiis-odit-facilis-sunt-rem', 'Expedita error id ducimus.', '1621684700.png', '78.00', 1, 1, '2021-05-21 11:04:59', '2021-05-21 11:04:59'),
(31, 'Officiis sit dignissimos assumenda perspiciatis accusantium.', 'iusto-officiis-voluptatem-natus-sunt-aut-odit-vel', 'At et sit eum nam sunt.', '1621689061.jpg', '52.00', 1, 2, '2021-05-21 11:04:59', '2021-05-21 11:04:59'),
(29, 'Quo eius eius velit assumenda molestiae.', 'odio-repellat-deserunt-vel-sed-cumque-ratione-deleniti', 'Voluptatem voluptatibus dolor eos dolor laborum.', '1621684700.png', '47.00', 1, 1, '2021-05-21 11:04:59', '2021-05-21 11:04:59'),
(28, 'Fugiat non reprehenderit facere quo.', 'doloribus-qui-iusto-harum-autem-beatae-autem-perferendis-distinctio', 'Sapiente ut qui alias quasi minima.', '1621689061.jpg', '41.00', 1, 3, '2021-05-21 11:04:59', '2021-05-21 11:04:59'),
(27, 'Earum ut iusto ut delectus.', 'dolorem-et-eligendi-ratione-doloribus-et-repudiandae', 'Eum earum officia cupiditate facere asperiores.', '1621684700.png', '9.00', 1, 2, '2021-05-21 11:04:59', '2021-05-21 11:04:59'),
(25, 'Et minima accusantium incidunt perspiciatis.', 'maxime-sed-labore-tempore-ex-dolorum-et-vel', 'Voluptas quo provident atque possimus.', '1621689061.jpg', '90.00', 1, 3, '2021-05-21 11:04:59', '2021-05-21 11:04:59'),
(26, 'Dolorem et velit architecto distinctio in.', 'velit-impedit-quo-consequuntur', 'Sed odio unde vitae suscipit quis molestiae accusamus.', '1621684700.png', '22.00', 1, 1, '2021-05-21 11:04:59', '2021-05-21 11:04:59'),
(34, 'Ut quo eveniet qui non molestiae ipsum fugit.', 'consequatur-aperiam-asperiores-laborum-nobis', 'Et voluptatem perspiciatis suscipit omnis facere porro.', '1621689061.jpg', '48.00', 1, 4, '2021-05-21 11:04:59', '2021-05-21 11:04:59');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'yassine', 'yassine@gmail.com', NULL, '$2y$10$BITWyTUQUshLuvr3AbMN..WP16jUkX5Mc7M2K/7keLPgb3LzR7g/W', NULL, '2021-05-21 08:57:45', '2021-05-21 08:57:45'),
(2, 'yassine', 'yassinezir1990@gmail.com', NULL, '$2y$10$OUVLJPS/LhjcjunDQSoNpOtHF9c4T6ScsKKN.UwEOTkoQRF9cgWEW', NULL, '2021-05-22 09:00:07', '2021-05-22 09:00:07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
