-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2021 at 06:45 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_vue_spa`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Dane Stanton', 'prof-dane-stanton', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(2, 'Henri Stracke I', 'henri-stracke-i', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(3, 'Dr. Rickie Rosenbaum Sr.', 'dr-rickie-rosenbaum-sr', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(4, 'Marta Cronin', 'marta-cronin', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(5, 'Ahmad Von', 'ahmad-von', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(6, 'Dolores Hudson Jr.', 'dolores-hudson-jr', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(7, 'Lucious Monahan', 'lucious-monahan', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(8, 'Darion Huel', 'darion-huel', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(9, 'Yvonne Ebert', 'yvonne-ebert', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(10, 'Mr. Raymond Veum V', 'mr-raymond-veum-v', '2021-10-15 12:51:17', '2021-10-15 12:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_10_115718_create_categories_table', 1),
(6, '2021_10_11_014027_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `name`, `slug`, `price`, `category_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Ms. Allie Aufderhar IV', 'ms-allie-aufderhar-iv', 481, 9, 'Cum deserunt libero.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(2, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Vernon Schmitt', 'vernon-schmitt', 289, 9, 'Itaque ex deleniti.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(3, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Dr. David Mayert DDS', 'dr-david-mayert-dds', 325, 5, 'Veritatis dicta.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(4, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Reese Ritchie', 'reese-ritchie', 269, 10, 'Eos est eum numquam.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(5, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Estella Greenfelder', 'estella-greenfelder', 434, 7, 'Consectetur et ipsa.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(6, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Rowland Kuhic', 'rowland-kuhic', 342, 2, 'Ullam perspiciatis.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(7, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Cristopher Mayer', 'cristopher-mayer', 410, 5, 'Ut ipsum eos.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(8, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Dorothy Langworth', 'dorothy-langworth', 319, 8, 'Magni et omnis.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(9, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'George Ankunding', 'george-ankunding', 182, 2, 'Et autem sed.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(10, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Arvid Breitenberg', 'arvid-breitenberg', 365, 10, 'Itaque quaerat ut.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(11, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Erich Hagenes', 'erich-hagenes', 318, 5, 'Consequuntur.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(12, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Pietro Zboncak', 'pietro-zboncak', 323, 7, 'Harum ipsa illo.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(13, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Manley Brekke', 'manley-brekke', 140, 9, 'Harum ut tempore.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(14, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Clarabelle Eichmann', 'clarabelle-eichmann', 156, 8, 'Velit reprehenderit.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(15, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Noel Senger Jr.', 'noel-senger-jr', 245, 3, 'Sed explicabo.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(16, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Lonie Veum', 'lonie-veum', 467, 3, 'Et et deserunt.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(17, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Dr. Anissa Grant', 'dr-anissa-grant', 427, 2, 'Repellat ea et.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(18, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Kristopher Flatley', 'kristopher-flatley', 484, 3, 'Porro praesentium.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(19, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Kevon Emard', 'kevon-emard', 234, 7, 'A id aut delectus.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(20, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Mr. Xander Hackett Sr.', 'mr-xander-hackett-sr', 202, 9, 'Ex veniam porro.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(21, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Brielle Hansen', 'brielle-hansen', 111, 1, 'Aut sit iure et.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(22, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Nannie Hettinger', 'nannie-hettinger', 426, 10, 'Et molestiae a.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(23, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Ariane Bailey', 'ariane-bailey', 414, 1, 'Assumenda.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(24, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Rosalind Keeling', 'rosalind-keeling', 185, 10, 'Tempora est.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(25, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Dr. Darion Koss', 'dr-darion-koss', 433, 7, 'Eveniet accusantium.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(26, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Dr. Shanelle Torphy IV', 'dr-shanelle-torphy-iv', 230, 9, 'Debitis velit.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(27, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Bernadette Borer Jr.', 'bernadette-borer-jr', 385, 2, 'Neque nam qui optio.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(28, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Damian Stracke II', 'damian-stracke-ii', 138, 1, 'Delectus ipsum.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(29, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Cheyanne Mertz', 'cheyanne-mertz', 407, 3, 'Sint unde maxime id.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(30, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Allie Bailey', 'allie-bailey', 398, 4, 'Cupiditate amet.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(31, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Miss Katrine Stoltenberg', 'miss-katrine-stoltenberg', 151, 5, 'Officia rerum nihil.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(32, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Nick Fahey', 'nick-fahey', 101, 2, 'Repellendus.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(33, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Norma Hoppe Sr.', 'norma-hoppe-sr', 437, 3, 'Et recusandae.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(34, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Amelia Volkman', 'amelia-volkman', 285, 7, 'Quae repellendus.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(35, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Mr. Maxine Reichel II', 'mr-maxine-reichel-ii', 480, 10, 'Sint perspiciatis.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(36, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Hillary Mayert', 'hillary-mayert', 288, 8, 'Rerum voluptas est.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(37, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Jeanette Gottlieb', 'jeanette-gottlieb', 109, 8, 'Quae eaque enim.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(38, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Gunnar Sporer', 'gunnar-sporer', 411, 2, 'Eos est voluptas.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(39, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Rod Fisher', 'rod-fisher', 193, 10, 'Soluta distinctio.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(40, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Hershel Langworth', 'hershel-langworth', 414, 9, 'Reprehenderit quia.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(41, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Prof. Felicity Hartmann', 'prof-felicity-hartmann', 364, 10, 'Assumenda odit.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(42, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Tevin Hammes V', 'tevin-hammes-v', 322, 2, 'Odio reiciendis.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(43, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Kaelyn Tremblay', 'kaelyn-tremblay', 484, 5, 'Quia dicta ad sed.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(44, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Vida Batz', 'vida-batz', 159, 9, 'Eaque sed deleniti.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(45, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Mrs. Letha Kiehn III', 'mrs-letha-kiehn-iii', 424, 3, 'Delectus expedita.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(46, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Betty Schimmel', 'betty-schimmel', 260, 8, 'Itaque nobis.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(47, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Ezra Hintz', 'ezra-hintz', 315, 9, 'Officiis et et.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(48, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Cathrine Kulas', 'cathrine-kulas', 241, 8, 'Sunt atque deleniti.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(49, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Lukas Strosin DDS', 'lukas-strosin-dds', 174, 10, 'In animi quis.', '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(50, 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Dr. Dudley Becker', 'dr-dudley-becker', 377, 1, 'Ut aut nesciunt.', '2021-10-15 12:51:17', '2021-10-15 12:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Md Nazmul Hasan', 'nazmul.ns7989@gmail.com', NULL, '$2y$10$MUtpeuJVBpChP2/BcN7CrOes5L3dGj2T5DNvQRj3sioTmMNLmPweu', NULL, '2021-10-15 12:51:17', '2021-10-15 12:51:17'),
(2, 'Raziib Hasan', 'razib@gmail.com', NULL, '$2y$10$a9G7DQldNZuGYyxD12vd.eQuE.2I3XHVCqoB7ylHndY1zgcmtKmlS', NULL, '2021-10-16 07:43:04', '2021-10-16 07:43:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
