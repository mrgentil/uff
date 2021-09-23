-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 23 sep. 2021 à 19:19
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `uff`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-08-05 05:04:29', '2021-08-05 05:04:29');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commenter_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commenter_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `child_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_complet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(64, 10, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(65, 10, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(66, 10, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 3),
(67, 10, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(68, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(69, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(70, 10, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 7),
(71, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(72, 11, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(73, 11, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 3),
(74, 11, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(75, 11, 'excerpt', 'text_area', 'Excerpt', 0, 1, 1, 1, 1, 1, '{}', 5),
(76, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(77, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(78, 11, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:services,slug\"}}', 8),
(79, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(80, 13, 'name_complet', 'text', 'Name Complet', 1, 1, 1, 1, 1, 1, '{}', 2),
(81, 13, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(82, 13, 'phone', 'text', 'Phone', 1, 1, 1, 1, 1, 1, '{}', 4),
(83, 13, 'contenu', 'text', 'Contenu', 1, 1, 1, 1, 1, 1, '{}', 5),
(84, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(85, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(10, 'projects', 'projects', 'Project', 'Projects', NULL, 'App\\Models\\Project', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-08-06 11:10:48', '2021-08-06 11:10:48'),
(11, 'services', 'services', 'Service', 'Services', NULL, 'App\\Models\\Service', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-06 11:38:24', '2021-08-06 11:45:37'),
(13, 'contacts', 'contacts', 'Contact', 'Contacts', NULL, 'App\\Models\\Contact', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-09-23 14:39:31', '2021-09-23 14:39:31');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-08-05 05:04:29', '2021-08-05 05:04:29');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-08-05 05:04:29', '2021-08-05 05:04:29', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-08-05 05:04:29', '2021-08-05 05:04:29', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-08-05 05:04:30', '2021-08-05 05:04:30', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-08-05 05:04:30', '2021-08-05 05:04:30', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-08-05 05:04:30', '2021-08-05 05:04:30', 'voyager.hooks', NULL),
(16, 1, 'Projects', '', '_self', NULL, NULL, NULL, 15, '2021-08-06 11:10:48', '2021-08-06 11:10:48', 'voyager.projects.index', NULL),
(17, 1, 'Services', '', '_self', NULL, NULL, NULL, 16, '2021-08-06 11:38:24', '2021-08-06 11:38:24', 'voyager.services.index', NULL),
(18, 1, 'Contacts', '', '_self', NULL, NULL, NULL, 17, '2021-09-23 14:39:31', '2021-09-23 14:39:31', 'voyager.contacts.index', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2018_06_30_113500_create_comments_table', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2021_08_05_113835_create_table_commentaires', 2),
(30, '2021_09_23_160844_create_contacts_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-08-05 05:04:30', '2021-08-05 05:04:30');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(2, 'browse_bread', NULL, '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(3, 'browse_database', NULL, '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(4, 'browse_media', NULL, '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(5, 'browse_compass', NULL, '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(6, 'browse_menus', 'menus', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(7, 'read_menus', 'menus', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(8, 'edit_menus', 'menus', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(9, 'add_menus', 'menus', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(10, 'delete_menus', 'menus', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(11, 'browse_roles', 'roles', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(12, 'read_roles', 'roles', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(13, 'edit_roles', 'roles', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(14, 'add_roles', 'roles', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(15, 'delete_roles', 'roles', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(16, 'browse_users', 'users', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(17, 'read_users', 'users', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(18, 'edit_users', 'users', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(19, 'add_users', 'users', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(20, 'delete_users', 'users', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(21, 'browse_settings', 'settings', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(22, 'read_settings', 'settings', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(23, 'edit_settings', 'settings', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(24, 'add_settings', 'settings', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(25, 'delete_settings', 'settings', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(26, 'browse_categories', 'categories', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(27, 'read_categories', 'categories', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(28, 'edit_categories', 'categories', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(29, 'add_categories', 'categories', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(30, 'delete_categories', 'categories', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(31, 'browse_posts', 'posts', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(32, 'read_posts', 'posts', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(33, 'edit_posts', 'posts', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(34, 'add_posts', 'posts', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(35, 'delete_posts', 'posts', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(36, 'browse_pages', 'pages', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(37, 'read_pages', 'pages', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(38, 'edit_pages', 'pages', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(39, 'add_pages', 'pages', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(40, 'delete_pages', 'pages', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(41, 'browse_hooks', NULL, '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(47, 'browse_projects', 'projects', '2021-08-06 11:10:48', '2021-08-06 11:10:48'),
(48, 'read_projects', 'projects', '2021-08-06 11:10:48', '2021-08-06 11:10:48'),
(49, 'edit_projects', 'projects', '2021-08-06 11:10:48', '2021-08-06 11:10:48'),
(50, 'add_projects', 'projects', '2021-08-06 11:10:48', '2021-08-06 11:10:48'),
(51, 'delete_projects', 'projects', '2021-08-06 11:10:48', '2021-08-06 11:10:48'),
(52, 'browse_services', 'services', '2021-08-06 11:38:24', '2021-08-06 11:38:24'),
(53, 'read_services', 'services', '2021-08-06 11:38:24', '2021-08-06 11:38:24'),
(54, 'edit_services', 'services', '2021-08-06 11:38:24', '2021-08-06 11:38:24'),
(55, 'add_services', 'services', '2021-08-06 11:38:24', '2021-08-06 11:38:24'),
(56, 'delete_services', 'services', '2021-08-06 11:38:24', '2021-08-06 11:38:24'),
(57, 'browse_contacts', 'contacts', '2021-09-23 14:39:31', '2021-09-23 14:39:31'),
(58, 'read_contacts', 'contacts', '2021-09-23 14:39:31', '2021-09-23 14:39:31'),
(59, 'edit_contacts', 'contacts', '2021-09-23 14:39:31', '2021-09-23 14:39:31'),
(60, 'add_contacts', 'contacts', '2021-09-23 14:39:31', '2021-09-23 14:39:31'),
(61, 'delete_contacts', 'contacts', '2021-09-23 14:39:31', '2021-09-23 14:39:31');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Assemblée Générale pour les résolutions de la bonne marche', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts\\August2021\\TtvJ04OuPwSMKSnV1qvG.jpg', 'assemblee-generale-pour-les-resolutions-de-la-bonne-marche', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-05 05:04:30', '2021-08-06 10:45:45'),
(2, 1, 1, 'Descente d\'implantation', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>', 'posts\\August2021\\RhJgAOwi8M4UjroqXCQF.jpg', 'descente-d-implantation', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-05 05:04:30', '2021-08-06 10:44:46'),
(3, 1, 1, 'Descente sur le terrain avec quelques fermiers', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts\\August2021\\cYwBbNWGguJHGAvKoSis.jpg', 'descente-sur-le-terrain-avec-quelques-fermiers', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-05 05:04:30', '2021-08-06 10:44:06'),
(4, 1, 1, 'Assemblée Générale pour  les assises', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts\\August2021\\rdBykgDQfJDQomne3VmO.jpg', 'assemblee-generale-pour-les-assises', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-05 05:04:30', '2021-08-06 10:43:01'),
(5, 1, 1, 'Transport des plantules vers le Site UFF/Kinsiama', NULL, NULL, '<p style=\"box-sizing: border-box; margin: 0px; color: #6e7673; font-family: Inter, sans-serif; font-size: 16px;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some injected or words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>\r\n<p style=\"box-sizing: border-box; margin: 30px 0px 0px; color: #6e7673; font-family: Inter, sans-serif; font-size: 16px;\">Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.</p>\r\n<p style=\"box-sizing: border-box; margin: 30px 0px 0px; color: #6e7673; font-family: Inter, sans-serif; font-size: 16px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.</p>', 'posts\\August2021\\Vhaf9PHnJdpFxzo3Z2ai.jpg', 'transport-des-plantules-vers-le-site-uff-kinsiama', NULL, NULL, 'PUBLISHED', 0, '2021-08-05 10:20:27', '2021-08-05 10:20:27'),
(6, 1, 1, 'Assemblée Générale', NULL, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some injected or words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.\r\n\r\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.', '<p style=\"box-sizing: border-box; margin: 0px; color: #6e7673; font-family: Inter, sans-serif; font-size: 16px;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some injected or words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>\r\n<p style=\"box-sizing: border-box; margin: 30px 0px 0px; color: #6e7673; font-family: Inter, sans-serif; font-size: 16px;\">Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.</p>\r\n<p style=\"box-sizing: border-box; margin: 30px 0px 0px; color: #6e7673; font-family: Inter, sans-serif; font-size: 16px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.</p>', 'posts\\August2021\\A6nNzGD4Kf64tOPt3GNO.jpg', 'assemblee-generale', NULL, NULL, 'PUBLISHED', 0, '2021-08-06 10:29:02', '2021-08-06 10:37:48'),
(7, 1, 1, 'Assemblée Générale du 11 au 14 Aout 2021', NULL, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some injected or words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.', '<p><span style=\"color: #76838f; font-family: \'Open Sans\', sans-serif;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some injected or words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.</span></p>', 'posts\\August2021\\N85ykGolkdvwE1j2gh9B.jpeg', 'assemblee-generale-du-11-au-14-aout-2021', NULL, NULL, 'PUBLISHED', 0, '2021-08-14 13:17:20', '2021-08-14 13:17:20'),
(8, 1, 1, 'Assemblée Générale du 11 au 14 Aout 2021 pour les assises', NULL, NULL, '<p><span style=\"color: #76838f; font-family: \'Open Sans\', sans-serif;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some injected or words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.</span></p>', 'posts\\August2021\\2RUVI1oLWjRp259juHHx.jpeg', 'assemblee-generale-du-11-au-14-aout-2021-pour-les-assises', NULL, NULL, 'PUBLISHED', 0, '2021-08-14 13:18:28', '2021-08-14 13:19:58');
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(9, 1, 1, 'Travail Technique avec les Ingénieurs pour la mise en place de la  Campagne Agricole 2021 - 2022', NULL, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some injected or words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.', '<p class=\"MsoListParagraph\" style=\"mso-add-space: auto; text-indent: -18.0pt; line-height: 112%; mso-list: l0 level1 lfo1; margin: 0cm 19.2pt .25pt 39.3pt;\"><!-- [if !supportLists]--><span lang=\"FR-CA\" style=\"font-size: 14.0pt; line-height: 112%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\"><span style=\"mso-list: Ignore;\">1.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span lang=\"FR-CA\" style=\"font-size: 14.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">Objectifs assign&eacute;s pour cette campagne </span></p>\r\n<p class=\"MsoNormal\" style=\"text-indent: -.5pt; line-height: 112%; margin: 0cm 19.2pt .25pt 21.8pt;\"><span lang=\"FR-CA\" style=\"font-size: 14.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">&nbsp;</span></p>\r\n<div align=\"center\">\r\n<table class=\"MsoTableGrid\" style=\"width: 445.75pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" width=\"594\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\r\n<td style=\"width: 45.75pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"61\">\r\n<p class=\"MsoNormal\" style=\"text-align: center; line-height: 112%; tab-stops: 15.1pt; margin: 0cm 19.2pt .25pt 0cm;\" align=\"center\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">N&deg;</span></strong></p>\r\n</td>\r\n<td style=\"width: 400.0pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"533\">\r\n<p class=\"MsoNormal\" style=\"text-align: center; line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\" align=\"center\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">Libell&eacute;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 1;\">\r\n<td style=\"width: 45.75pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"61\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">1.</span></strong></p>\r\n</td>\r\n<td style=\"width: 400.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"533\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">Mettre en terre 70.000 pieds (d&rsquo;Acacias, Eucalyptus, Palmiers&hellip;.)</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 2;\">\r\n<td style=\"width: 45.75pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"61\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">2.</span></strong></p>\r\n</td>\r\n<td style=\"width: 400.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"533\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">Installer un champ de 10 hectares pour la multiplication des boutures seines </span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 3;\">\r\n<td style=\"width: 45.75pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"61\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">3.</span></strong></p>\r\n</td>\r\n<td style=\"width: 400.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"533\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">Installer un champ de 1 hectare pour la multiplication de rejets d&rsquo;ananas et de bananes plantains </span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 4;\">\r\n<td style=\"width: 45.75pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"61\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">4.</span></strong></p>\r\n</td>\r\n<td style=\"width: 400.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"533\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">Construire une maison &agrave; chaque ferme et le petit &eacute;levage <span style=\"mso-spacerun: yes;\">&nbsp;&nbsp;</span></span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 5;\">\r\n<td style=\"width: 45.75pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"61\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">5.</span></strong></p>\r\n</td>\r\n<td style=\"width: 400.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"533\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">Chaque fermier doit &ecirc;tre op&eacute;rationnel selon les sp&eacute;culations </span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 6;\">\r\n<td style=\"width: 45.75pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"61\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">6.</span></strong></p>\r\n</td>\r\n<td style=\"width: 400.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"533\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">Mise en place d&rsquo;&eacute;quipe des ing&eacute;nieurs agronomes permanentes sur le terrain pour le suivi et accompagnement des fermiers </span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 7; mso-yfti-lastrow: yes;\">\r\n<td style=\"width: 45.75pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"61\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">7.</span></strong></p>\r\n</td>\r\n<td style=\"width: 400.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"533\">\r\n<p class=\"MsoNormal\" style=\"line-height: 112%; margin: 0cm 19.2pt .25pt 0cm;\"><span lang=\"FR-CA\" style=\"font-size: 13.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">Uniformit&eacute; des<span style=\"mso-spacerun: yes;\">&nbsp; </span>pancartes </span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p class=\"MsoNormal\" style=\"text-indent: -.5pt; line-height: 112%; margin: 0cm 19.2pt .25pt 21.8pt;\"><span lang=\"FR-CA\" style=\"font-size: 14.0pt; line-height: 112%; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: Arial; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR-CA;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraph\" style=\"margin-left: 39.3pt; mso-add-space: auto; text-indent: -18.0pt; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin;\"><span style=\"mso-list: Ignore;\">2.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></strong><!--[endif]--><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Co&ucirc;t des activit&eacute;s </span></strong></p>\r\n<p class=\"MsoNormal\" style=\"tab-stops: 131.5pt;\"><span lang=\"FR\"><span style=\"mso-tab-count: 1;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>\r\n<div align=\"center\">\r\n<table class=\"MsoTableGrid\" style=\"width: 439.2pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" width=\"586\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 29.4pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 29.4pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">N&deg;</span></strong></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 29.4pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong><span lang=\"FR-CA\" style=\"font-size: 13.0pt; mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-ansi-language: FR-CA; mso-fareast-language: FR;\">Libell&eacute;</span></strong></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 29.4pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">nbre d\'hect</span></strong></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 29.4pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Prix unit en USD</span></strong></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 29.4pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Prix total USD</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 29.4pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Observation</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 1; height: 19.55pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.55pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1.</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.55pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Dessouchement</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.55pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.55pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">65</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.55pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">65</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.55pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 2; height: 15.0pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">2.</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">D&eacute;bardage</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">25</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">25</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 3; height: 15.0pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">3.</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Labour</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">75</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">75</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 4; height: 15.0pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">4.</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Hersage</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">75</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">75</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 5; height: 15.0pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">5.</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Billonnage</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">70</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">70</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 15.0pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 6; height: 12.3pt;\">\r\n<td style=\"width: 301.8pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.3pt;\" colspan=\"4\" valign=\"top\" width=\"402\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">sous total 1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.3pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">310</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.3pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 7; height: 28.8pt;\">\r\n<td style=\"width: 355.75pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.8pt;\" colspan=\"5\" valign=\"top\" width=\"474\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Semis ou plantation</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.8pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 8; height: 28.8pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.8pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.8pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Libell&eacute;e</span></strong></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.8pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">quantit&eacute;/ hectare</span></strong></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.8pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">prix unit.</span></strong></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.8pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">prix total </span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 28.8pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 9; height: 13.2pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.2pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.2pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Acacias Eucalyptus</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.2pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">850</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.2pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">0,3</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.2pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">255</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.2pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Ecart&nbsp;: 3 X 4m</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 10; height: 14.4pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Agrumes</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">300</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">300</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Ecart&nbsp;: 6 X 6m</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 11; height: 14.4pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Ananas</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">10000</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">0,2</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">2000</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.4pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Ecart&nbsp;: 1 X 1m</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 12; height: 12.7pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.7pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.7pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">bananes plantains</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.7pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">240</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.7pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.7pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">240</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.7pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Ecart&nbsp;: 7 X 7m</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 13; height: 12.9pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.9pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.9pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">bouture manioc (ml) </span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.9pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">2500</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.9pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">0,05</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.9pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">125</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 12.9pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Ecart&nbsp;: 1 X 1m</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 14; height: 13.1pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.1pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.1pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">main d\'&oelig;uvre</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.1pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">5</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.1pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">10</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.1pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">50</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.1pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 15; height: 20.35pt;\">\r\n<td style=\"width: 355.75pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.35pt;\" colspan=\"5\" valign=\"top\" width=\"474\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Construction d&rsquo;une maison &agrave; brique &agrave; dobe</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 20.35pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 16; height: 13.55pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.55pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.55pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\"><span style=\"mso-spacerun: yes;\">&nbsp;</span>Maison 1 chambre + salon</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.55pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.55pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1000</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.55pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1000</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.55pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Dim&nbsp;: 6 X 7m</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 17; height: 14.45pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.45pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.45pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Maison 2 chambre + salon</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.45pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.45pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1500</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.45pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1500</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.45pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">Dim&nbsp;: 6 X 8m</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 18; height: 13.7pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.7pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.7pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">frais administratif</span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.7pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.7pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">10</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.7pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">10</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.7pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 19; mso-yfti-lastrow: yes; height: 13.4pt;\">\r\n<td style=\"width: 40.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.4pt;\" valign=\"top\" width=\"54\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></p>\r\n</td>\r\n<td style=\"width: 147.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.4pt;\" valign=\"top\" width=\"197\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">suivi technicien </span></p>\r\n</td>\r\n<td style=\"width: 59.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.4pt;\" valign=\"top\" width=\"79\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">1</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.4pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">20</span></p>\r\n</td>\r\n<td style=\"width: 53.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.4pt;\" valign=\"top\" width=\"72\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">20</span></strong></p>\r\n</td>\r\n<td style=\"width: 83.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 13.4pt;\" valign=\"top\" width=\"111\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: right; line-height: normal;\" align=\"right\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\" style=\"mso-ascii-font-family: Calibri; mso-fareast-font-family: \'Times New Roman\'; mso-hansi-font-family: Calibri; mso-bidi-font-family: \'Times New Roman\'; color: black; mso-fareast-language: FR;\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p class=\"MsoNormal\" style=\"tab-stops: 131.5pt;\"><span lang=\"FR\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Chronogramme des activit&eacute;s et propositions de descentes sur me terrain.</span></strong></p>\r\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\r\n<td style=\"width: 453.1pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" colspan=\"5\" valign=\"top\" width=\"604\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Chronogramme des activit&eacute;s</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 1;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Date</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Activit&eacute;s pr&eacute;vues</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">T&acirc;ches</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&eacute;quipe</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Observation</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 2;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Samedi&nbsp;: 28/08</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">R&eacute;union pr&eacute;paratoire</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Planification du programme</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Staff technique</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 3;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Mercredi&nbsp;: 01/09</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Remise de planning</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Elaboration de programme global</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Staff technique</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 4;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Samedi&nbsp;: 04/09</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Publication du programme</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Mise en place d&eacute;finitive des agents</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\"><span style=\"mso-spacerun: yes;\">&nbsp;</span>UFF</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 5;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Lundi 06 et mardi 07/09 </span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Actualisation du programme</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Mise en jour du programme</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">UFF</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 6;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Jeudi&nbsp;: 09/09 versement de fonds</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">R&eacute;ception de fonds pour les travaux</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Pr&eacute;paration de descente</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Staff technique</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 7;\">\r\n<td style=\"width: 453.1pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" colspan=\"5\" valign=\"top\" width=\"604\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; text-align: center; line-height: normal;\" align=\"center\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Chronogramme de descentes sur le terrain.</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 8;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Mercredi&nbsp;: 15/09</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Descente sur terrain</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">R&eacute;partition des travaux</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Staff technique</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 9;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Jeudi&nbsp;: 16/09</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">D&eacute;but dessouchement et d&eacute;bardage</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Affectation de la main d&rsquo;&oelig;uvre locale</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Staff technique</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 10;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Lundi&nbsp;: 20/09</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Descente sur terrain </span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Lancement d&eacute;but labour</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Staff Gestion</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 11;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Mardi&nbsp;: 22/09</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Suivi de travaux</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Surveillance de la main d&rsquo;&oelig;uvre locale</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 12;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Jeudi 23/09</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">D&eacute;but labour et suivi de travaux</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Affectation machine</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Staff gestion et technique</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 13;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Vendredi 15/10</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">D&eacute;but herse, billon et suivi</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Affectation machine</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Staff technique</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"mso-yfti-irow: 14; mso-yfti-lastrow: yes;\">\r\n<td style=\"width: 90.6pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Mardi 19/10</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">D&eacute;but plantation et suivi</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Affectation main d&rsquo;&oelig;uvre locale</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">Staff technique</span></strong></p>\r\n</td>\r\n<td style=\"width: 90.65pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"121\">\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"MsoNormal\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"FR\">&nbsp;</span></strong></p>\r\n<p class=\"MsoNormal\"><span lang=\"FR\">&nbsp;</span></p>', 'posts\\August2021\\5NCaX1Ahu6HlYBjHKVAH.jpeg', 'travail-technique-avec-les-ingenieurs-pour-la-mise-en-place-de-la-campagne-agricole-2021-2022', NULL, NULL, 'PUBLISHED', 0, '2021-08-28 09:56:39', '2021-08-28 11:21:40');
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(10, 1, 1, 'Assemblée Générale du 18 Septembre 2021', NULL, 'cette activité s\'est \r\ntenue dans la grande salle de la Paroisse DON BOSCO de MASINA Petro congo \r\n- les objectifs étaient qu\'après les Activités du programmes pilotes ( Routes, constructions, agriculture et reboisement) de la campagne 2020 - 2021, UFF devrait relancer celles de la campagne 2021 - 2022. Il sied ce qui suit:\r\n* la participation de 102 Fermiers dans la salle. Signalons que cette assemblée generale etait organisée en deux phases à la suite de confinement de corona, nombreux avaient déjà participé à la concertation interne organisée à la commune de la Gombe sur l\'avenue 24 novembre par la coordination UFF.', '<p>&nbsp;cette activit&eacute; s\'est&nbsp;</p>\r\n<p>tenue dans la grande salle de la Paroisse DON BOSCO de MASINA Petro congo&nbsp;</p>\r\n<p>- les objectifs &eacute;taient qu\'apr&egrave;s les Activit&eacute;s du programmes pilotes ( Routes, constructions, agriculture et reboisement) de la campagne 2020 - 2021, UFF devrait relancer celles de la campagne 2021 - 2022. Il sied ce qui suit:</p>\r\n<p>* la participation de 102 Fermiers dans la salle. Signalons que cette assembl&eacute;e generale etait organis&eacute;e en deux phases &agrave; la suite de confinement de corona, nombreux avaient d&eacute;j&agrave; particip&eacute; &agrave; la concertation interne organis&eacute;e &agrave; la commune de la Gombe sur l\'avenue 24 novembre par la coordination UFF.&nbsp;</p>\r\n<p>- plusieurs r&eacute;solutions&nbsp; ont &eacute;t&eacute; adopt&eacute;es par les fermiers pour la bonne marche des activit&eacute;s 2021 - 2022, notamment :&nbsp;</p>\r\n<p>* insertion de tous les Fermiers dans le groupe watshap des fermiers actifs UFF,</p>\r\n<p>*la cotisation mensuelle de 5$ par fermier,</p>\r\n<p>*la cotisation de 10$ par fermier pour la carte de membre,</p>\r\n<p>*la cotisation de 120$ par fermier pour acquisition des documents avec des r&eacute;f&eacute;rences de documents et arr&ecirc;t&eacute; UFF et d&eacute;marches aux affaires financi&egrave;res,</p>\r\n<p>* Cel&agrave; &agrave; la p&eacute;riode du 21/09/2021 au 10/10/2021, ( num&eacute;ro de compte bancaire TMB 00017-11000-50633100001-38 ),*&nbsp; temps pr&eacute;paratoire pour que les fermiers s\'acquittent de leurs obligations par la pr&eacute;sentation de leurs preuves des paiements des frais &agrave; la banque.</p>\r\n<p>-que UFF prenne des dispositions de trouver la disponibilit&eacute; de tracteur pouvant faciliter la mecanisation des activit&eacute;s des fermiers sur terrain et faire en sorte que chaque fermier ait la maitrise d\'acceder facilement et librement dans sa ferme et conna&icirc;tre parfaitement les pourtours de sa concession afin d\'&eacute;viter les chevochements avec les voisins ,</p>\r\n<p>-apr&egrave;s debat et d&eacute;lib&eacute;ration, les activit&eacute;s retenues 2021 - 2022 font parties du programme int&eacute;gr&eacute; qui doivent &ecirc;tres ex&eacute;cut&eacute;es en autonomie des prises en charges par chaque fermier dans sa ferme notamment :</p>\r\n<p>- Route,</p>\r\n<p>- construction d,une maison dans la concession,&nbsp;</p>\r\n<p>-reboisement la coordination UFF a d&eacute;j&agrave; mis en place une p&eacute;pini&egrave;re de 45.000 plantules avec une projection de 70.000 plantules,</p>\r\n<p>- rejets d\'ananas et banane plantain aussi dans la p&eacute;pini&egrave;re,</p>\r\n<p>-Manioc et autres au choix pour le moment toutefois UFF va&nbsp; installer un champ pour la multiplication des boutures saines &agrave; mettre &agrave; la disposition des fermiers apres. En entendant chaque fermier fera en sorte qu\'il ait vie dans sa ferme.&nbsp;</p>\r\n<p>- En conclusions , les fermiers ont &eacute;t&eacute; sensibilis&eacute;s &agrave; leur satifaction de jouir librement leurs concessions et s\'y atteler sur la mise en oeuvre des activit&eacute;s puis les suivre rigoureusement pour ne pas conna&icirc;tre faille.&nbsp; La coordination technique UFF assurera son r&ocirc;le d\'orienter les fermiers&nbsp; et se manisfetera par la pr&eacute;sence de ses Techniciens qui seront permenants sur le terrain et qui seront consult&eacute;s chaque fois par les fermiers pour trouver solutions &agrave; leurs besoins. Des ce mardi 21/09 la coordination UFF est pr&ecirc;te &agrave; recevoir les fermiers pour les formalites. Point focal Gaspard</p>', 'posts\\September2021\\fhnT3i6cgDl3aCW53qG6.jpeg', 'assemblee-generale-du-18-septembre-2021', NULL, NULL, 'PUBLISHED', 0, '2021-09-23 17:15:00', '2021-09-23 17:16:10'),
(11, 1, 1, 'Installation des panneaux solaires dans la villes de Kinsama', NULL, 'amedi  18/09/2021, cette activité s\'est \r\n\r\ntenue dans la grande salle de la Paroisse DON BOSCO de MASINA Petro congo \r\n\r\n- les objectifs étaient qu\'après les Activités du programmes pilotes ( Routes, constructions, agriculture et reboisement) de la campagne 2020 - 2021, UFF devrait relancer celles de la campagne 2021 - 2022. Il sied ce qui suit:\r\n\r\n* la participation de 102 Fermiers dans la salle. Signalons que cette assemblée generale etait organisée en deux phases à la suite de confinement de corona, nombreux avaient déjà participé à la concertation interne organisée à la commune de la Gombe sur l\'avenue 24 novembre par la coordination UFF.', '<p>- Samedi&nbsp; 18/09/2021, cette activit&eacute; s\'est&nbsp;</p>\r\n<p>tenue dans la grande salle de la Paroisse DON BOSCO de MASINA Petro congo&nbsp;</p>\r\n<p>- les objectifs &eacute;taient qu\'apr&egrave;s les Activit&eacute;s du programmes pilotes ( Routes, constructions, agriculture et reboisement) de la campagne 2020 - 2021, UFF devrait relancer celles de la campagne 2021 - 2022. Il sied ce qui suit:</p>\r\n<p>* la participation de 102 Fermiers dans la salle. Signalons que cette assembl&eacute;e generale etait organis&eacute;e en deux phases &agrave; la suite de confinement de corona, nombreux avaient d&eacute;j&agrave; particip&eacute; &agrave; la concertation interne organis&eacute;e &agrave; la commune de la Gombe sur l\'avenue 24 novembre par la coordination UFF.&nbsp;</p>\r\n<p>- plusieurs r&eacute;solutions&nbsp; ont &eacute;t&eacute; adopt&eacute;es par les fermiers pour la bonne marche des activit&eacute;s 2021 - 2022, notamment :&nbsp;</p>\r\n<p>* insertion de tous les Fermiers dans le groupe watshap des fermiers actifs UFF,</p>\r\n<p>*la cotisation mensuelle de 5$ par fermier,</p>\r\n<p>*la cotisation de 10$ par fermier pour la carte de membre,</p>\r\n<p>*la cotisation de 120$ par fermier pour acquisition des documents avec des r&eacute;f&eacute;rences de documents et arr&ecirc;t&eacute; UFF et d&eacute;marches aux affaires financi&egrave;res,</p>\r\n<p>* Cel&agrave; &agrave; la p&eacute;riode du 21/09/2021 au 10/10/2021, ( num&eacute;ro de compte bancaire TMB 00017-11000-50633100001-38 ),*&nbsp; temps pr&eacute;paratoire pour que les fermiers s\'acquittent de leurs obligations par la pr&eacute;sentation de leurs preuves des paiements des frais &agrave; la banque.</p>\r\n<p>-que UFF prenne des dispositions de trouver la disponibilit&eacute; de tracteur pouvant faciliter la mecanisation des activit&eacute;s des fermiers sur terrain et faire en sorte que chaque fermier ait la maitrise d\'acceder facilement et librement dans sa ferme et conna&icirc;tre parfaitement les pourtours de sa concession afin d\'&eacute;viter les chevochements avec les voisins ,</p>\r\n<p>-apr&egrave;s debat et d&eacute;lib&eacute;ration, les activit&eacute;s retenues 2021 - 2022 font parties du programme int&eacute;gr&eacute; qui doivent &ecirc;tres ex&eacute;cut&eacute;es en autonomie des prises en charges par chaque fermier dans sa ferme notamment :</p>\r\n<p>- Route,</p>\r\n<p>- construction d,une maison dans la concession,&nbsp;</p>\r\n<p>-reboisement la coordination UFF a d&eacute;j&agrave; mis en place une p&eacute;pini&egrave;re de 45.000 plantules avec une projection de 70.000 plantules,</p>\r\n<p>- rejets d\'ananas et banane plantain aussi dans la p&eacute;pini&egrave;re,</p>\r\n<p>-Manioc et autres au choix pour le moment toutefois UFF va&nbsp; installer un champ pour la multiplication des boutures saines &agrave; mettre &agrave; la disposition des fermiers apres. En entendant chaque fermier fera en sorte qu\'il ait vie dans sa ferme.&nbsp;</p>\r\n<p>- En conclusions , les fermiers ont &eacute;t&eacute; sensibilis&eacute;s &agrave; leur satifaction de jouir librement leurs concessions et s\'y atteler sur la mise en oeuvre des activit&eacute;s puis les suivre rigoureusement pour ne pas conna&icirc;tre faille.&nbsp; La coordination technique UFF assurera son r&ocirc;le d\'orienter les fermiers&nbsp; et se manisfetera par la pr&eacute;sence de ses Techniciens qui seront permenants sur le terrain et qui seront consult&eacute;s chaque fois par les fermiers pour trouver solutions &agrave; leurs besoins. Des ce mardi 21/09 la coordination UFF est pr&ecirc;te &agrave; recevoir les fermiers pour les formalites. Point focal Gaspard</p>', 'posts\\September2021\\gcSBoaldRI3tnim4qSds.jpeg', 'installation-des-panneaux-solaires-dans-la-villes-de-kinsama', NULL, NULL, 'PUBLISHED', 0, '2021-09-23 17:18:00', '2021-09-23 17:18:00');

-- --------------------------------------------------------

--
-- Structure de la table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `projects`
--

INSERT INTO `projects` (`id`, `title`, `image`, `description`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'Multiplication des boutures', 'projects\\August2021\\pcEsvCbHafMoFcngPn41.jpg', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries. Lorem Ipsum is simply dummy text of the new design printng and type setting Ipsum Take a look at our round up of the best shows coming soon to your telly box has been the is industrys. When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing.', '2021-08-04 18:03:45', '2021-08-04 18:03:45', 'multiplication-des-boutures'),
(2, 'Production de Plantule', 'projects\\August2021\\mSihpgkEi4AhNtRQ1V33.jpg', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries. Lorem Ipsum is simply dummy text of the new design printng and type setting Ipsum Take a look at our round up of the best shows coming soon to your telly box has been the is industrys. When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing.', '2021-08-04 18:04:23', '2021-08-04 18:04:23', 'production-de-plantule'),
(4, 'Aménagement de la route vers le site Kinsiama', 'projects\\August2021\\FES9eJLHG94vw7Zbxe7m.jpg', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries. Lorem Ipsum is simply dummy text of the new design printng and type setting Ipsum Take a look at our round up of the best shows coming soon to your telly box has been the is industrys. When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing.', '2021-08-04 18:06:33', '2021-08-04 18:06:33', 'amenagement-de-la-route-vers-le-site-kinsiama');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-08-05 05:04:29', '2021-08-05 05:04:29'),
(2, 'user', 'Normal User', '2021-08-05 05:04:29', '2021-08-05 05:04:29');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `title`, `image`, `description`, `excerpt`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'Production Animale', 'services\\August2021\\q3N3xQN4ng18f76Rv7wE.jpg', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2021-08-04 19:27:44', '2021-08-04 19:27:44', 'production-animale'),
(2, 'Production Végétale', 'services\\August2021\\RXeIUr47rU8GRLxEGxSp.jpg', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2021-08-04 19:28:59', '2021-08-04 19:28:59', 'production-vegetale'),
(3, 'Mécanisation Agricole', 'services\\August2021\\cLfr6dguAvTcgWlOGK8K.jpg', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2021-08-04 19:29:43', '2021-08-04 19:29:43', 'mecanisation-agricole'),
(4, 'Réboisement & Carbonisation', 'services\\August2021\\s7ycCAf1dlx6Ru33CqLh.jpg', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2021-08-04 19:30:14', '2021-08-04 19:30:14', 'reboisement-and-carbonisation'),
(6, 'Formation & Sensibilisation', 'services\\August2021\\U8LxONmfqkXU1wm4wjkM.JPG', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2021-08-05 03:43:51', '2021-08-05 03:43:51', 'formation-and-sensibilisation'),
(7, 'Multiplication de : (Sémence , Rejet , Bouture , Plantule)', 'services\\August2021\\yAQOW6WonNT4bmHNEx5F.jpg', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some injected or words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.\r\n\r\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some injected or words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.\r\n\r\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.', '2021-08-06 11:46:24', '2021-08-06 11:46:24', 'multiplication-de-semence-rejet-bouture-plantule');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-08-05 05:04:30', '2021-08-05 05:04:30'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-08-05 05:04:30', '2021-08-05 05:04:30');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administration Uff', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$U4T3Oe2umd6lft5eZncuq.EgzW8bXvqb.Uz0r.FDwSioYDA0qBEui', 'QN8rOrpzgWUVF6L6Daz5lFTwbrAQyX9DGziWLSnTxkwwom72G03EeC9wNBOe', '{\"locale\":\"fr\"}', '2021-08-05 05:04:30', '2021-08-06 10:40:11');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_commenter_id_commenter_type_index` (`commenter_id`,`commenter_type`),
  ADD KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  ADD KEY `comments_child_id_foreign` (`child_id`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Index pour la table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Index pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT pour la table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
