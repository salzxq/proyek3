-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 01, 2024 at 03:32 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_hekuo`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mari Berqurban Melalui Website Kami', 'slide-berjalan-1', '/storage/photos/1/Hewan Qurban/baner.jpeg', 'Hewan Pilihan', 'active', '2023-12-31 20:37:07', '2024-01-01 23:14:16'),
(2, 'Mari Berqurban Melalui Website Kami', 'ayo-berqurban', '/storage/photos/1/Hewan Qurban/Sapi-Qurban.jpg', '<p>Hewan Pilihan</p>', 'active', '2024-01-01 22:55:16', '2024-01-01 23:14:27'),
(3, 'Mari Berqurban Melalui Website Kami', 'mari-berqurban-melalui-website-kami', '/storage/photos/1/Hewan Qurban/ilustrasi-kambing34.jpg', '<p>Hewan Pilihan</p>', 'active', '2024-01-01 23:22:19', '2024-01-01 23:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `penitipan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(88,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `penitipan_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL, 1, 10090909.00, 'new', 1, 10090909, '2023-12-30 10:36:37', '2023-12-30 10:36:37'),
(2, 2, NULL, NULL, 2, 10090909.00, 'new', 1, 10090909, '2023-12-30 10:51:10', '2024-01-02 21:10:23'),
(5, 1, NULL, NULL, 1, 1000000.00, 'new', 1, 1000000, '2024-01-01 08:36:09', '2024-01-01 08:36:09'),
(6, 1, NULL, NULL, 2, 1000000.00, 'new', 1, 1000000, '2024-01-01 18:01:13', '2024-01-02 21:10:23'),
(7, 1, NULL, NULL, 3, 1000000.00, 'new', 1, 1000000, '2024-01-02 21:32:40', '2024-01-02 21:32:40'),
(8, 1, NULL, NULL, 4, 1000000.00, 'new', 1, 1000000, '2024-01-04 02:09:28', '2024-01-04 02:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kambing', 'kambing', '<p>Kambing Jawa</p>', '/storage/photos/1/ilustrasi-kambing34.jpg', 1, NULL, NULL, 'active', '2023-12-30 09:42:59', '2024-01-07 21:26:26'),
(2, 'Sapi', 'sapi', '<p>Sapi Brahman berkualitas</p>', '/storage/photos/1/brahman-cross-364x238.png', 1, NULL, NULL, 'active', '2024-01-07 22:20:47', '2024-01-07 22:20:47');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `harga_penitipans`
--

CREATE TABLE `harga_penitipans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `waktu` enum('harian','bulanan','tahunan') NOT NULL,
  `price` double DEFAULT 0,
  `status` enum('active','inactive') NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `harga_penitipans`
--

INSERT INTO `harga_penitipans` (`id`, `waktu`, `price`, `status`, `updated_at`, `created_at`) VALUES
(1, 'harian', 1000, 'active', '2023-12-30 12:53:57', '2023-12-30 12:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'muhamad Rijal', 'admin@gmail.com', 'muhamadrijalidm@gmail.com', NULL, '08212394899', 'okehhh banget yakin website nya kdkdhkedhkscnkxc', '2024-01-04 05:32:00', '2024-01-04 05:31:14', '2024-01-04 05:32:00'),
(2, 'muhamad Rijal', 'admin', 'muhamadrijalidm@gmail.com', NULL, '08212394899', 'abdussalam orang losarang', '2024-01-07 23:40:18', '2024-01-07 23:39:01', '2024-01-07 23:40:18'),
(3, 'muhamad Rijal', 'admin', 'muhamadrijalidm@gmail.com', NULL, '08212394899', 'kualitas hewannya okeh', '2024-01-07 23:59:56', '2024-01-07 23:59:12', '2024-01-07 23:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_10_21_164432_create_jobs_table', 1),
(5, '2023_11_24_073132_create_post_categories_table', 1),
(6, '2023_11_24_112147_create_categories_table', 1),
(7, '2023_11_25_000000_create_failed_jobs_table', 1),
(8, '2023_11_25_023748_create_shippings_table', 1),
(9, '2023_11_25_054356_create_orders_table', 1),
(10, '2023_11_25_055550_create_penitipan_table', 1),
(11, '2023_11_25_063857_create_products_table', 1),
(12, '2023_11_25_073701_create_post_tags_table', 1),
(13, '2023_11_25_074930_create_product_reviews_table', 1),
(14, '2023_11_25_083638_create_posts_table', 1),
(15, '2023_11_25_151329_create_messages_table', 1),
(16, '2023_11_26_041623_create_notifications_table', 1),
(17, '2023_11_26_053240_create_coupons_table', 1),
(18, '2023_11_26_131727_create_post_comments_table', 1),
(19, '2023_11_27_102626_create_carts_table', 2),
(20, '2023_11_28_143757_create_wishlists_table', 3),
(21, '2023_12_11_025334_create_banners_table', 3),
(22, '2023_12_11_143408_create_settings_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('02e50805-83ee-4fce-b076-6fd3be3746d4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/17\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:16:57', '2024-01-02 02:16:57'),
('051d0a6c-a928-46ae-a2c3-51b0cb4ad0ad', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/kambing-mang-rijal\",\"fas\":\"fa-star\"}', NULL, '2024-01-02 21:20:19', '2024-01-02 21:20:19'),
('062fa12c-bb02-4199-88f3-04a21de99fc5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/30\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 04:23:51', '2024-01-02 04:23:51'),
('06b8ed48-1d35-4ed2-8fde-13c8a8c0b813', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/46\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:15:44', '2024-01-02 08:15:44'),
('0bdf8d0b-9f47-49c9-8cf6-5878f84c80d7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/47\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:16:26', '2024-01-02 08:16:26'),
('0e50b11a-b364-4800-8efe-04e0a737a59c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New penitipan created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/penitipan\\/11\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-07 22:06:51', '2024-01-07 22:06:51'),
('11d805c0-592d-475d-aae0-3ebc1827fe4f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/25\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 03:00:01', '2024-01-02 03:00:01'),
('144c2e87-1117-4a45-a5a8-c5e969c678bb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/67\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-07 23:52:24', '2024-01-07 23:52:24'),
('14593030-0952-4dfd-bb84-206ffb347607', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/18\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:36:07', '2024-01-02 02:36:07'),
('1ad08e52-445d-460c-9c88-2ac9dbf59947', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/34\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 04:28:13', '2024-01-02 04:28:13'),
('1e060438-5f15-493c-a423-80446020048b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/40\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 07:19:00', '2024-01-02 07:19:00'),
('1f31bd1e-9a42-4c17-b97d-92eb460b902e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/60\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 20:30:04', '2024-01-02 20:30:04'),
('1fee5dab-c030-4bd1-8c5f-beb4af2052df', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/44\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:10:43', '2024-01-02 08:10:43'),
('235515a4-2445-4c29-b10c-9600b96b6d7c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/39\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 07:18:28', '2024-01-02 07:18:28'),
('27c7ecfc-cf0e-4675-8829-3da5d3992029', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 01:35:24', '2024-01-02 01:35:24'),
('28bbfb84-0a6c-4706-b6ae-ab7ed6e36c22', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/24\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:59:05', '2024-01-02 02:59:05'),
('29adc3c7-cf86-4fe1-9084-59dd7042cf7a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-01 18:02:27', '2024-01-01 18:02:27'),
('2f8e01ff-1278-4179-876f-9f77e005ff4f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/35\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 07:10:16', '2024-01-02 07:10:16'),
('33af59e9-2897-4f83-b227-a0d5173349a3', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-01 19:27:50', '2024-01-01 19:27:50'),
('408fd97c-b18b-4d75-88ce-bd1ca785a644', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 01:43:57', '2024-01-02 01:43:57'),
('4094b430-0dfa-4e01-87b7-d7744013e1c6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 01:56:04', '2024-01-02 01:56:04'),
('4403a4ab-15d0-4907-b32c-2cf07ce74f35', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/37\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 07:15:26', '2024-01-02 07:15:26'),
('48fc445c-8650-4ddf-8dc7-a5c0a1d07bd5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/49\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:22:10', '2024-01-02 08:22:10'),
('4a1b9d52-6c93-460d-8eac-4418bcc13fe7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/61\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 21:05:45', '2024-01-02 21:05:45'),
('4a4f4810-03dd-494b-b8c1-b343d56ce9d1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/45\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:12:30', '2024-01-02 08:12:30'),
('4bf0221b-18e0-4358-a263-347e5ac8e2b0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/52\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 09:27:09', '2024-01-02 09:27:09'),
('4d23d40a-c4a1-41d7-b7b5-772f05bb9105', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New penitipan created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/penitipan\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 16:45:25', '2024-01-02 16:45:25'),
('4e612acb-bacc-4ecc-b52c-cd3ffa6e94f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/59\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 10:06:19', '2024-01-02 10:06:19'),
('50df0590-cbb9-4506-88e3-10d7f695e4f7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2023-12-30 11:00:31', '2023-12-30 11:00:31'),
('5218f172-8e52-42b6-befa-6528d949e9ec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/64\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 21:11:51', '2024-01-02 21:11:51'),
('530fba86-452d-4a62-9e37-d06c3f98dad1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New penitipan created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/penitipan\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 19:50:48', '2024-01-02 19:50:48'),
('57aee94f-1587-48d7-be80-181116b47e8c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/54\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 09:29:47', '2024-01-02 09:29:47'),
('59985e69-4dff-4178-9893-73995c7b1f10', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/57\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 09:35:08', '2024-01-02 09:35:08'),
('5b9d634c-6133-481d-918d-2924dc957402', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/36\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 07:12:47', '2024-01-02 07:12:47'),
('64f00353-d875-49ae-a280-9b988551c5a7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/28\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 03:22:55', '2024-01-02 03:22:55'),
('66417ad7-4495-4be4-abac-cc805a33a0bf', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/kambing-mang-rijal\",\"fas\":\"fa-star\"}', NULL, '2024-01-04 05:27:18', '2024-01-04 05:27:18'),
('67fe103a-9f86-461a-bd0d-36be97ae6d17', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 01:49:24', '2024-01-02 01:49:24'),
('6a379977-592b-420e-bebc-4327992c00f1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/50\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:34:59', '2024-01-02 08:34:59'),
('6bc7072f-0239-4532-ab7c-af919f703a66', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/56\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 09:34:16', '2024-01-02 09:34:16'),
('6cdce8bf-098c-4ee6-b752-589d439b306e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/42\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:08:34', '2024-01-02 08:08:34'),
('76fde908-7cdf-4863-b172-a076f5b722fa', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-01 19:28:49', '2024-01-01 19:28:49'),
('805740a1-b417-4f21-80d6-1949a8af6b31', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/62\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 21:08:44', '2024-01-02 21:08:44'),
('856d6ac3-c92e-4d57-9ed4-ff8ebbea0be8', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/55\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 09:30:00', '2024-01-02 09:30:00'),
('85a90861-102f-4f70-b5fa-b39c0b266245', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New penitipan created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/penitipan\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 09:19:09', '2024-01-02 09:19:09'),
('8c7747c1-9fc4-4354-a5f2-1dbf57fecb6f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/31\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 04:24:11', '2024-01-02 04:24:11'),
('9c6a98fd-8e1f-47bb-a740-a19c8608f00c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/66\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-07 21:59:18', '2024-01-07 21:59:18'),
('9e76efa9-e972-4b5e-b4f0-42c0bfd79899', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/23\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:58:23', '2024-01-02 02:58:23'),
('a8f85c7c-8447-41f8-909f-dcd19433c6e7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/20\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:44:41', '2024-01-02 02:44:41'),
('aa64bbea-6fc5-41f7-a3bd-2181d4cee05d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/21\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:50:49', '2024-01-02 02:50:49'),
('ad4961d3-d12b-4ebc-a2ca-dfb8fdf070f8', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/22\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:57:19', '2024-01-02 02:57:19'),
('ae88de84-1ed8-4904-b8bb-c4f3e609fde6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 01:51:30', '2024-01-02 01:51:30'),
('bbc8cbdf-57b3-4787-ba42-08ad55850183', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/58\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 10:06:01', '2024-01-02 10:06:01'),
('c07d2abb-8ee6-464e-9497-ddb037940988', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/26\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 03:01:20', '2024-01-02 03:01:20'),
('c32fed66-53ab-4b57-ac58-12362fd9c61e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 01:32:19', '2024-01-02 01:32:19'),
('c70ab57f-505e-439c-835f-0dea7c2de9e7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/15\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:00:31', '2024-01-02 02:00:31'),
('c77f2a81-4b95-4c55-b7f2-044e0cf9128b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-01 19:25:19', '2024-01-01 19:25:19'),
('c84859ce-e094-4747-a5d9-adfedf2f90d7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/53\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 09:29:13', '2024-01-02 09:29:13'),
('cbae4e19-a598-422c-8b5a-b7fc25e8f5cb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-01 18:09:08', '2024-01-01 18:09:08'),
('cbbbec01-00d8-473d-b06d-66515fa79154', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/41\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 07:22:02', '2024-01-02 07:22:02'),
('ccc06345-7c4b-42c1-a0a9-eea714352315', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/48\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:19:37', '2024-01-02 08:19:37'),
('cf41b4c3-b389-464b-9a43-572de91f3f86', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/43\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:09:11', '2024-01-02 08:09:11'),
('d2b9590e-a817-4cf9-b17b-8e57c3af3cb3', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 01:46:14', '2024-01-02 01:46:14'),
('d3d30b46-571f-45ef-af9a-5b49c387a9cb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/27\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 03:20:55', '2024-01-02 03:20:55'),
('d41f46ba-75ae-4c19-95e1-4380839feafc', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/51\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 08:45:26', '2024-01-02 08:45:26'),
('d532c73b-8166-4252-a9e2-ac5694474719', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New penitipan created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/penitipan\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2023-12-30 18:34:01', '2023-12-30 18:34:01'),
('e48bf562-af1f-4013-846f-dbfa874b5da1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/16\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:06:14', '2024-01-02 02:06:14'),
('e70955e2-9e12-4264-935b-3c9cdf292165', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/38\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 07:16:52', '2024-01-02 07:16:52'),
('e78cc549-fea8-4567-9a65-f1a49c9b57cc', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/32\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 04:25:29', '2024-01-02 04:25:29'),
('ec54c91c-a8b3-48ad-8aee-3d352105f314', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/65\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 21:34:01', '2024-01-02 21:34:01'),
('ed278e45-9705-4ea2-bb81-e8e993483e45', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/63\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 21:10:23', '2024-01-02 21:10:23'),
('ed555ed7-f672-46b0-8844-0e6c1dde15b9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 01:37:19', '2024-01-02 01:37:19'),
('ef173ccc-e48e-412d-9e2e-1d86089a49fe', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/19\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 02:44:25', '2024-01-02 02:44:25'),
('f03c649e-93f8-4262-a46d-933d168a2611', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/29\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 03:23:51', '2024-01-02 03:23:51'),
('ff89e98b-8901-49c2-a68c-821741dbf648', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/33\",\"fas\":\"fa-file-alt\"}', NULL, '2024-01-02 04:26:21', '2024-01-02 04:26:21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','bayar') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `snap_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `post_code`, `address1`, `snap_token`, `created_at`, `updated_at`) VALUES
(64, 'ORD-BAZ3JLJ8NB', 2, 11090909, 1, NULL, 11095909, 2, 'bayar', 'paid', 'new', 'sal', 'asdfhiu', 'sall@gmail.com', '08827167', '5541243', 'imyuimyu', 'cd37894b-229a-4e74-ab15-72e7d22248ac', '2024-01-02 21:11:51', '2024-01-02 21:11:51'),
(65, 'ORD-HAKT2PILPF', 3, 1000000, 1, NULL, 1005000, 1, 'bayar', 'paid', 'new', 'muhamad', 'rijal', 'muhamadrijalidm@gmail.com', '082123948533', '45252', 'ds. lingajati', 'bc5cbab9-2dc3-415c-afe4-d060b21ffa14', '2024-01-02 21:34:01', '2024-01-02 21:34:01'),
(66, 'ORD-LTYCBKI3XP', 3, 1000000, 1, NULL, 1005000, 1, 'bayar', 'paid', 'new', 'muhamad rijal', 'Rijal', 'muhamadrijalidm@gmail.com', '08212394899', '45252', 'ds. linggajati kec. Arahan kab. Indramayu provinsi jawa barat', 'c6ccef48-b44d-463e-acce-a5a94bfb738e', '2024-01-07 21:59:18', '2024-01-07 21:59:18'),
(67, 'ORD-F5FJAHMUKI', 3, 1000000, 1, NULL, 1005000, 1, 'bayar', 'paid', 'new', 'muhamad', 'Rijall', 'muhamadrijalidm@gmail.com', '08212394899', '45252', 'ds. linggajati kec. Arahan kab. Indramayu provinsi jawa barat', 'b5dc886f-2f47-41ee-af7b-526dd1ccc0e8', '2024-01-07 23:52:24', '2024-01-07 23:52:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penitipans`
--

CREATE TABLE `penitipans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `penitipan_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `board_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','bayar') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `nama_depan` varchar(191) NOT NULL,
  `nama_belakang` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `description` text NOT NULL,
  `angka` int(11) DEFAULT NULL,
  `snap_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penitipans`
--

INSERT INTO `penitipans` (`id`, `penitipan_number`, `user_id`, `sub_total`, `shipping_id`, `board_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `nama_depan`, `nama_belakang`, `email`, `phone`, `post_code`, `address1`, `description`, `angka`, `snap_token`, `created_at`, `updated_at`) VALUES
(11, 'BRD-LAPQVBQIIV', 3, 1000000, 1, NULL, NULL, 1005000, 1, 'bayar', 'paid', 'new', 'muhamad rijal', 'Rijal', 'muhamadrijalidm@gmail.com', '08212394899', '45252', 'ds. linggajati kec. Arahan kab. Indramayu provinsi jawa barat', 'hasjsbkasjxla', 3, 'fa7e3fcf-51c7-4757-8fc8-94e90f68c7e3', '2024-01-07 22:06:51', '2024-01-07 22:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(88,2) NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `created_at`, `updated_at`) VALUES
(1, 'kambing mang rijal', 'kambing-mang-rijal', '<p>sehat walafiat</p>', 'kambing yang sangat sehat dengan berat 10 ton', '/storage/photos/1/-_200715102605-142.jpg', 1, 'default', 'active', 1000000.00, NULL, 1, 1, NULL, '2023-12-30 09:50:23', '2024-01-07 21:27:40'),
(2, 'gdiuiw', 'gdiuiw', '<p>wrqwr</p>', '<p>qrwwqr</p>', '/storage/photos/1/-_200715102605-142.jpg', 0, 'default', 'active', 10090909.00, NULL, 1, 1, NULL, '2023-12-30 09:57:28', '2024-01-07 21:47:52'),
(3, 'Kambing', 'kambing', '<p>Kambing jawa</p>', '<p>kualitas oke</p>', '/storage/photos/1/ilustrasi-kambing34.jpg', 3, 'default', 'active', 2500000.00, NULL, 1, 1, NULL, '2024-01-07 21:50:26', '2024-01-07 21:50:26'),
(4, 'Sapi', 'sapi', '<p>Sapi Brahman&nbsp;</p>', '<p>dijamin kualitasnya</p>', '/storage/photos/1/brahman-cross-364x238.png', 2, 'default', 'active', 10000000.00, NULL, 1, 2, NULL, '2024-01-07 22:24:47', '2024-01-07 22:24:47'),
(5, 'Sapi', 'sapi-2401084555-626', '<p>sapi gemuk</p>', '<p>sapi dengan berat 2 Ton dijual oleh pemilik dengan nama Salam</p>', '/storage/photos/1/brahman-cross-364x238.png', 3, 'default', 'active', 20000000.00, NULL, 1, 2, NULL, '2024-01-07 23:45:55', '2024-01-07 23:45:55'),
(7, 'Kambing', 'kambing-2401082153-940', '<p>Kambing juara</p>', '<p>Kambing khas Indonesia dengan berat kurang lebih 50 Kg</p>', '/storage/photos/1/kambing jantan.jpg', 7, 'default', 'active', 5000000.00, NULL, 1, 1, NULL, '2024-01-08 00:21:53', '2024-01-08 00:21:53'),
(8, 'Sapi Peranakan Ongole', 'sapi-peranakan-ongole', '<p>Sapi berkualitas&nbsp;</p>', '<p>sapi jenis Ongle yang diimpor langsung dari peternakan luar negeri</p>', '/storage/photos/1/sapi-ongole-364x232.jpeg', 5, 'default', 'active', 30000000.00, NULL, 1, 2, NULL, '2024-01-08 00:25:57', '2024-01-08 00:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(2, 3, 1, 4, 'kambingnya gemuk', 'active', '2024-01-04 05:27:17', '2024-01-04 05:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text DEFAULT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, '[HEKUOOOO]', '[HEWAN KURBAN ONLINE]', '[EGEW3]', '[EGEWGEW]', '[IMYU]', '[089878662]', '[939@GMAIL.COM]', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, '5km-10km', 5000, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$6pjrGFvE.3b8BWHGKe4j..QpwI.bhbr2/Z6ObbQP9XiAKZM8b0yn.', NULL, 'admin', NULL, NULL, 'active', NULL, '2023-12-30 08:58:34', '2023-12-30 08:58:34'),
(2, 'salz', 'sal@gmail.com', NULL, '$2y$10$A3hzIlJ8/O14Q0mea27nJuRJsZN8U1Tig5u4vA3kZxjGV.2.rdZRy', NULL, 'user', NULL, NULL, 'active', NULL, '2023-12-30 10:45:39', '2023-12-30 10:45:39'),
(3, 'Rijal', 'muhamadrijalidm@gmail.com', NULL, '$2y$10$ROEtinRP4nvj77vEL3gEoOXWrr2m0ixhAbljfLdbIJtmG.1JnF/k.', NULL, 'user', NULL, NULL, 'active', NULL, '2024-01-02 21:31:17', '2024-01-02 21:31:17'),
(4, 'Gejol', 'rizalgejols17@gmail.com', NULL, '$2y$10$aUAzzu4ujcS2/djVl3L4suRfxaQfHA0jJde.REj1Hd.bBhyDYzPkO', NULL, 'user', NULL, NULL, 'active', NULL, '2024-01-04 01:10:07', '2024-01-04 01:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `vidio`
--

CREATE TABLE `vidio` (
  `id` int(11) NOT NULL,
  `link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vidios`
--

CREATE TABLE `vidios` (
  `id` int(11) NOT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`),
  ADD KEY `carts_penitipan_id_foreign` (`penitipan_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harga_penitipans`
--
ALTER TABLE `harga_penitipans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `penitipans`
--
ALTER TABLE `penitipans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penitipans_penitipan_number_unique` (`penitipan_number`),
  ADD UNIQUE KEY `shipping_id` (`shipping_id`),
  ADD UNIQUE KEY `board_id` (`board_id`),
  ADD KEY `penitipans_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vidio`
--
ALTER TABLE `vidio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vidios`
--
ALTER TABLE `vidios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `harga_penitipans`
--
ALTER TABLE `harga_penitipans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `penitipans`
--
ALTER TABLE `penitipans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vidio`
--
ALTER TABLE `vidio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vidios`
--
ALTER TABLE `vidios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_penitipan_id_foreign` FOREIGN KEY (`penitipan_id`) REFERENCES `penitipans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penitipans`
--
ALTER TABLE `penitipans`
  ADD CONSTRAINT `penitipans_board_id_foreign` FOREIGN KEY (`board_id`) REFERENCES `harga_penitipans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penitipans_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penitipans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
