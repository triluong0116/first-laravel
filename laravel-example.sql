-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for laravel_demo
CREATE DATABASE IF NOT EXISTS `laravel_demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `laravel_demo`;

-- Dumping structure for table laravel_demo.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_demo.categories: ~2 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Japanese foods', 'This is Japanese food', NULL, NULL),
	(2, 'Vietnamese foods', 'This is Vietnamese foods', NULL, NULL),
	(3, 'Chinese foods', 'This is Chinese foods', NULL, NULL);

-- Dumping structure for table laravel_demo.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_demo.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table laravel_demo.foods
CREATE TABLE IF NOT EXISTS `foods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foods_category_id_foreign` (`category_id`),
  CONSTRAINT `foods_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_demo.foods: ~2 rows (approximately)
DELETE FROM `foods`;
INSERT INTO `foods` (`id`, `name`, `count`, `description`, `created_at`, `updated_at`, `category_id`, `image_path`) VALUES
	(1, 'Sushi', 5, 'This is sushi', '2022-12-02 01:56:45', '2022-12-02 01:56:45', 1, 'image1669971405-Sushi.jpg');

-- Dumping structure for table laravel_demo.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_demo.menus: ~3 rows (approximately)
DELETE FROM `menus`;
INSERT INTO `menus` (`id`, `name`, `parent_id`, `description`, `content`, `active`, `created_at`, `updated_at`) VALUES
	(1, 'Nước hoa nam', 0, 'Nước hoa nam', '<p>Nước hoa nam</p>', 1, '2022-11-29 02:54:26', '2022-11-29 02:54:26'),
	(5, 'Nước hoa nữ', 0, 'Nước hoa nữ', '<p>Nước hoa nữ</p>', 1, '2022-11-29 03:08:08', '2022-11-29 03:08:08'),
	(6, 'Nước hoa nam giá rẻ', 1, 'Nước hoa nam giá rẻ', '<p>Nước hoa nam gi&aacute; rẻ</p>', 1, '2022-11-29 03:16:53', '2022-11-29 03:16:53');

-- Dumping structure for table laravel_demo.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_demo.migrations: ~6 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(4, '2022_11_08_023950_create_menus_table', 2),
	(15, '2014_10_12_000000_create_users_table', 3),
	(16, '2014_10_12_100000_create_password_resets_table', 3),
	(17, '2019_08_19_000000_create_failed_jobs_table', 3),
	(18, '2022_11_22_021616_create_food_table', 4),
	(19, '2022_11_22_090714_add_image_to_foods', 5),
	(20, '2022_11_29_073056_create_menus_table', 6);

-- Dumping structure for table laravel_demo.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_demo.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table laravel_demo.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_demo.users: ~1 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin Account', 'admin@gmail.com', NULL, '$2y$10$AXEVHGK1Oy5CaGLgkDSj4u88DoVz2uGwx614THh9QCkt6e5hJYeMu', 'zjkKEhR3vWtIKiaN9mkwQO9eqCxBkxHojifoeWElDyVDC0nHOtRm5QNEbP89', '2022-11-29 02:51:56', '2022-11-29 02:51:56'),
	(3, 'admin2', 'admin2@gmail.com', NULL, '$2y$10$yJEReJjHB0JKiLavE7/bbejkmKMkGuDIFZFnY4rfdZw1QK2RXuso6', 'izLvFwBRSiZOuhwhJ3uYQKwnkVNm6VtSIOyXnk7qV4xjWB5TLGyLxVkHtS3v', '2022-12-02 01:54:13', '2022-12-02 01:54:13');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
