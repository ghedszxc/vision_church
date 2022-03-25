-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2022 at 03:29 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vision`
--

-- --------------------------------------------------------

--
-- Table structure for table `attends`
--

CREATE TABLE `attends` (
  `id` int(10) UNSIGNED NOT NULL,
  `disciple_id` int(10) UNSIGNED DEFAULT NULL,
  `event_id` int(10) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disciples`
--

CREATE TABLE `disciples` (
  `id` int(10) UNSIGNED NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `network` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) NOT NULL DEFAULT 0,
  `inviter_id` int(11) NOT NULL DEFAULT 0,
  `cell_leader_id` int(11) NOT NULL DEFAULT 0,
  `primary_leader_id` int(11) NOT NULL DEFAULT 0,
  `is_archive` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disciples`
--

INSERT INTO `disciples` (`id`, `last_name`, `first_name`, `middle_name`, `suffix`, `status`, `network`, `address`, `birthday`, `age`, `inviter_id`, `cell_leader_id`, `primary_leader_id`, `is_archive`, `created_at`, `updated_at`) VALUES
(1, 'Mamucad', 'John Mico', NULL, NULL, 5, 0, '17 St, Michael Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:09:16', '2022-03-24 05:09:16'),
(2, 'Rosario', 'Tristan James', NULL, NULL, 5, 0, '595 Blas Roque Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:09:50', '2022-03-24 05:09:50'),
(3, 'Jaramillos', 'Danica', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:10:07', '2022-03-24 05:10:07'),
(4, 'Laye', 'Tiffanie Aya', NULL, NULL, 5, 2, 'Bldg.6 Unit 201 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:10:27', '2022-03-24 05:10:51'),
(5, 'Lopo', 'Abigail', NULL, NULL, 5, 2, 'Blk 7 Comp 3 Sitio Kabatuhan Gtdl Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:10:43', '2022-03-24 05:10:43'),
(6, 'Macarat', 'Mikaela Joy', NULL, NULL, 5, 0, 'Sta. Lucia Novaliches Visayas St Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:11:21', '2022-03-24 05:11:21'),
(7, 'Malonzo', 'Charlie', NULL, NULL, 5, 0, 'Amva Housing Bldg 17 Unit 114 Lamesa St. Ugong Val City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:11:35', '2022-03-24 05:11:35'),
(9, 'Pado-Ong', 'Maria Cristina', NULL, NULL, 5, 2, 'Rd 7. Tulay Kawayan Dulo Estrella Compd. Brgy 164. Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:13:02', '2022-03-24 05:13:07'),
(11, 'De Leon', 'Lhance Nicole', NULL, NULL, 5, 0, '21 St. Martin Vill. Ramos St. Talipapa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:15:35', '2022-03-24 05:15:35'),
(13, 'Pado-Ong', 'Veronica', NULL, NULL, 5, 2, 'Shella Comp. Rd.7', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:16:06', '2022-03-24 05:16:06'),
(17, 'Lorenzo', 'Sheen Neo', NULL, NULL, 5, 0, '27 Rivera St. Baesa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:17:08', '2022-03-24 05:17:08'),
(24, 'Mataganas', 'Janella', NULL, NULL, 5, 0, 'Rd.5 Brgy 164 Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:18:46', '2022-03-24 05:18:46'),
(26, 'Olea', 'Kenneth', NULL, NULL, 5, 0, '6212 Kkk Feliciano St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:22:15', '2022-03-24 05:22:15'),
(27, 'Orapa', 'James Ivan', NULL, NULL, 5, 0, 'Silvina Vill. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:22:26', '2022-03-24 05:22:26'),
(28, 'Peregrino', 'Prince Newton', NULL, NULL, 5, 0, 'Lot 9 Blk 5 Champaca 1 Brgy. Fortune Marikina City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:23:16', '2022-03-24 05:23:16'),
(29, 'Mujar', 'Jhuana', NULL, NULL, 5, 2, 'Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:23:31', '2022-03-24 05:23:31'),
(30, 'Jimenez', 'Justine', NULL, NULL, 5, 0, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:23:44', '2022-03-24 05:23:44'),
(31, 'Obane', 'Edelyn', NULL, NULL, 5, 2, '1035 M.Bernardino St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:23:55', '2022-03-24 05:23:55'),
(32, 'Savari', 'Andrea Nicole', NULL, NULL, 5, 2, '#25 Cuadra Compd. Dona St Mindanao Ave. Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:24:59', '2022-03-24 05:24:59'),
(33, 'Gacuma', 'Angelica', NULL, NULL, 5, 2, 'Bldg 13 Unit 305 Disiplina Village Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:25:32', '2022-03-24 05:25:32'),
(34, 'Gamboa', 'Leomuel', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:25:42', '2022-03-24 05:25:42'),
(35, 'Gochangco', 'Eman', NULL, NULL, 5, 0, '595 Blas Roque Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:25:52', '2022-03-24 05:25:52'),
(36, 'Julian', 'Mary Jane', NULL, NULL, 5, 2, 'Bldg.6 Unit 208 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:26:12', '2022-03-24 05:26:12'),
(37, 'Ramos', 'Mae Justhine', NULL, NULL, 5, 2, '12-H Narra St. Bagbag Nova Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:26:24', '2022-03-24 05:26:24'),
(38, 'Robles', 'Rica', NULL, NULL, 5, 2, 'Interville Subd. Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:26:35', '2022-03-24 05:26:35'),
(39, 'Sanchez', 'Tiffany Marie', NULL, NULL, 5, 2, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:26:49', '2022-03-24 05:26:49'),
(40, 'Sunico', 'Joanna Yvonne', NULL, NULL, 5, 2, 'Rosa St. Gloria 5 Dulo Talipapa Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:26:59', '2022-03-24 05:26:59'),
(41, 'Cruz', 'Daniel', NULL, NULL, 5, 0, 'Bldg.30 A Unit 14 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:32:52', '2022-03-24 05:32:52'),
(42, 'Pagarigan', 'Erica Joyce', NULL, NULL, 5, 2, '26 Morning Glory St. Dnv3 Talipapa Nova. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:33:03', '2022-03-24 05:33:03'),
(43, 'Cabarlo', 'Mark Ian', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:33:12', '2022-03-24 05:33:12'),
(44, 'Col', 'Julian', NULL, NULL, 5, 0, 'Bldg.30 A Unit 12 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:33:21', '2022-03-24 05:33:21'),
(45, 'Cueto', 'Glen', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:33:55', '2022-03-24 05:33:55'),
(46, 'Delfin', 'Abigail', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:34:10', '2022-03-24 05:34:10'),
(47, 'De Castro', 'Frances Jana', NULL, NULL, 5, 2, '36 Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:34:21', '2022-03-24 05:34:21'),
(48, 'Del Rosario', 'Kurt', NULL, NULL, 5, 0, 'Drc Compound Brgy.Talipapa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:34:30', '2022-03-24 05:34:30'),
(49, 'Haohao', 'Renzmar', NULL, NULL, 5, 0, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:34:42', '2022-03-24 05:34:42'),
(50, 'Villasanta', 'Leian', NULL, NULL, 5, 2, 'Brgy. Deparo Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:34:53', '2022-03-24 05:34:53'),
(51, 'Salazar', 'Andrew', NULL, NULL, 5, 0, '6015 Gen.T. De Leon Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:35:01', '2022-03-24 05:35:01'),
(52, 'Perseveranda', 'Ivy', NULL, NULL, 5, 2, '#03 Beethoven St. Greenville Subd. Sauyo Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:35:10', '2022-03-24 05:35:18'),
(53, 'Pimentel', 'Christ Ann', NULL, NULL, 5, 2, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:35:30', '2022-03-24 05:35:30'),
(54, 'Baloja', 'Mark Stephen', NULL, NULL, 5, 0, '#179 Austria Compound Upper Banlat Tandang Sora Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:35:38', '2022-03-24 05:35:38'),
(55, 'Alvarado', 'Mark Joseph', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:35:48', '2022-03-24 05:35:48'),
(56, 'Blanca', 'Kenneth', NULL, NULL, 5, 0, 'Francisco Compd. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:35:58', '2022-03-24 05:35:58'),
(57, 'Borela', 'Jonel', NULL, NULL, 5, 0, '595 Blas Roque Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:36:10', '2022-03-24 05:36:10'),
(58, 'Gacuma', 'Angel', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:36:22', '2022-03-24 05:36:22'),
(59, 'Aborque', 'Lei Ann', NULL, NULL, 5, 2, 'Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:36:34', '2022-03-24 05:36:34'),
(60, 'Lerma', 'Beatrice Monica', NULL, NULL, 5, 2, '#4 Road 10 Proj.8 Bahay Toro Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:37:00', '2022-03-24 05:37:00'),
(61, 'Tobias', 'Julita', NULL, NULL, 5, 3, '36 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:37:15', '2022-03-24 05:37:15'),
(62, 'Perez', 'Cassandra', NULL, NULL, 5, 2, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:37:26', '2022-03-24 05:37:26'),
(63, 'Escueta', 'Juvelie', NULL, NULL, 5, 2, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:37:36', '2022-03-24 05:37:36'),
(64, 'Francisco', 'Francine', NULL, NULL, 5, 2, 'Rd.11 Gsis Hills Subd. Brgy.164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:37:48', '2022-03-24 05:37:48'),
(65, 'Alix', 'Reynaldo', NULL, NULL, 5, 1, '161 Road 1 Bagong Pag-Asa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:38:00', '2022-03-24 05:38:00'),
(66, 'Malonzo', 'Clarisse', NULL, NULL, 5, 2, 'Amva Housing Bldg 17 Unit 114 Lamesa St. Ugong Val City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:38:13', '2022-03-24 05:38:13'),
(67, 'Malonzo', 'Francis Nicole', NULL, NULL, 5, 2, 'Amva Housing Bldg 17 Unit 114 Lamesa St. Ugong Val City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:38:23', '2022-03-24 05:38:23'),
(68, 'Santos', 'Christine Joy', NULL, NULL, 5, 2, '#1 Cuadra St. Brgy. 164 Talipapa Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:38:35', '2022-03-24 05:38:35'),
(69, 'Esplana', 'Sarah', NULL, NULL, 5, 2, '55 Victoria St. Sauyo Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:38:45', '2022-03-24 05:38:45'),
(70, 'Magallon', 'Baby Jean', NULL, NULL, 5, 2, 'Amva Housing Lamesa St. Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:39:10', '2022-03-24 05:39:10'),
(71, 'Luna', 'Michelle Rose', NULL, NULL, 5, 2, 'Climaco Compound Heritage Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:39:25', '2022-03-24 05:39:25'),
(72, 'Solamo', 'Ashley', NULL, NULL, 5, 2, '418 Delmundo Highway Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:39:37', '2022-03-24 05:39:37'),
(73, 'Tampoc', 'Bernadeth', NULL, NULL, 5, 2, '1035 M.Bernardino St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:39:48', '2022-03-24 05:39:48'),
(74, 'Tampoc', 'Noemi', NULL, NULL, 5, 2, '1035 M.Bernardino St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:40:01', '2022-03-24 05:40:01'),
(75, 'Aquinde', 'Trixie Mae', NULL, NULL, 5, 2, '415 Drc Compound Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:40:19', '2022-03-24 05:40:19'),
(76, 'Garcia', 'Russel James', NULL, NULL, 5, 0, 'Bldg. 11 U 308 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:40:34', '2022-03-24 05:40:34'),
(77, 'Pojaras', 'Mecaila Nichole', NULL, NULL, 5, 2, 'Bldg. 30 A Unit 11 Disiplina Village', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:48:18', '2022-03-24 05:48:18'),
(78, 'Rosendo', 'Chris Lawrence', NULL, NULL, 5, 0, 'Drc Compound Brgy.Talipapa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:48:27', '2022-03-24 05:48:27'),
(79, 'Moreno', 'Michael Jace', NULL, NULL, 5, 0, 'Rd.11 Gsis Hills Subd. Brgy.164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:48:40', '2022-03-24 05:48:40'),
(80, 'Ogayon', 'Reynalyn', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:48:51', '2022-03-24 05:48:51'),
(81, 'Siboco', 'Mary Joy', NULL, NULL, 5, 2, '2222 Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:49:01', '2022-03-24 05:49:01'),
(82, 'Villanueva', 'Jacklyn', NULL, NULL, 5, 2, '688 Libis Baesa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:49:14', '2022-03-24 05:49:14'),
(83, 'Deciar', 'Zairah Marie', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:49:24', '2022-03-24 05:49:24'),
(84, 'Balicao', 'Maricar', NULL, NULL, 5, 2, 'Drc Compound Brgy.Talipapa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:49:35', '2022-03-24 05:49:35'),
(85, 'Casiple', 'Arvhin Jerome', NULL, NULL, 5, 0, 'Drc Compound Brgy.Talipapa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:49:49', '2022-03-24 05:49:49'),
(86, 'Cerbito', 'Zenith', NULL, NULL, 5, 2, 'Rd. 11 Gsis Hills Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:49:59', '2022-03-24 05:49:59'),
(87, 'Delupio', 'John Cazer', NULL, NULL, 5, 0, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:50:08', '2022-03-24 05:50:08'),
(88, 'Abing', 'Jamill', NULL, NULL, 5, 2, 'Rd.9 Gsis Hills Subd. Talipapa  Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:50:16', '2022-03-24 05:50:16'),
(89, 'Bangate', 'Angel', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:50:25', '2022-03-24 05:50:25'),
(90, 'Flores', 'Ivarine', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:50:35', '2022-03-24 05:50:35'),
(91, 'Talinio', 'Mary Joyce', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:50:46', '2022-03-24 05:50:46'),
(92, 'Almosara', 'Rangel', NULL, NULL, 5, 0, '1035 M. Bernardino St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:50:55', '2022-03-24 05:50:55'),
(93, 'Altiche', 'Jerald', NULL, NULL, 5, 0, 'Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:51:06', '2022-03-24 05:51:06'),
(94, 'Balcos', 'Marla', NULL, NULL, 5, 2, 'Rd 11. Gisis Hills Subd. Brgy. 164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:51:16', '2022-03-24 05:51:16'),
(95, 'Pojaras', 'Sophia', NULL, NULL, 5, 2, 'Bldg. 30 A Unit 11 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:51:31', '2022-03-24 05:51:31'),
(96, 'Regalado', 'Jereimae', NULL, NULL, 5, 2, 'Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:51:41', '2022-03-24 05:51:41'),
(97, 'Alvarez', 'Cecille', NULL, NULL, 5, 3, 'Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:51:52', '2022-03-24 05:51:52'),
(98, 'Dizon', 'Lydia', NULL, NULL, 5, 3, 'Bayanihan St. Litex Rd. Brgy. Commonwealth Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:52:08', '2022-03-24 05:52:08'),
(99, 'Flores', 'Jonnel', NULL, NULL, 5, 0, 'Bldg 12 Unit 108 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:52:21', '2022-03-24 05:52:21'),
(100, 'Arcilla', 'Reinier', NULL, NULL, 5, 0, '415 Drc Compound Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:52:29', '2022-03-24 05:52:29'),
(101, 'San Miguel', 'James Shakur', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:52:40', '2022-03-24 05:52:40'),
(102, 'Vigo', 'Michelle', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:52:49', '2022-03-24 05:52:49'),
(103, 'Manalo', 'Dina', NULL, NULL, 5, 3, 'Camp Grezzar Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:52:59', '2022-03-24 05:52:59'),
(104, 'Amor', 'Janina Eleane', NULL, NULL, 5, 2, 'Drc Compound Brgy.Talipapa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:53:10', '2022-03-24 05:53:10'),
(105, 'Yabut', 'Andrea', NULL, NULL, 5, 2, '2284 Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:53:22', '2022-03-24 05:53:22'),
(106, 'Ulatan', 'Ferbie', NULL, NULL, 5, 2, 'Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:53:32', '2022-03-24 05:53:32'),
(107, 'Santiago', 'John Rayleigh', NULL, NULL, 5, 2, '432 Del Nacia Dr. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:53:42', '2022-03-24 05:53:42'),
(108, 'Maceda', 'Marvin', NULL, NULL, 5, 0, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:53:53', '2022-03-24 05:53:53'),
(109, 'Marco', 'Amelia', NULL, NULL, 5, 3, '26 Morning Glory St. Dnv3 Talipapa Nova. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:54:02', '2022-03-24 05:54:02'),
(110, 'Llanita', 'Lorence', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:54:29', '2022-03-24 05:54:29'),
(111, 'Martin', 'Jasmin', NULL, NULL, 5, 2, '23b Coronel Compd.Brgy. Sauyo Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:54:42', '2022-03-24 05:54:42'),
(112, 'Malingin', 'Katherine', NULL, NULL, 5, 2, 'Sta. Monica Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:54:54', '2022-03-24 05:54:54'),
(113, 'Mercado', 'Ezekiel Aell', NULL, NULL, 5, 2, 'Bldg. 32 Unit 10 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:55:11', '2022-03-24 05:55:11'),
(114, 'Odal', 'Jomari', NULL, NULL, 5, 0, '#36 C. Francisco St. San Agustin Village Talipapa Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:55:20', '2022-03-24 05:55:20'),
(115, 'Flores', 'Emi', NULL, NULL, 5, 3, 'Dormitory Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:55:31', '2022-03-24 05:55:31'),
(116, 'Brazil', 'Ana Lorraine', NULL, NULL, 5, 2, 'Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:55:41', '2022-03-24 05:55:41'),
(117, 'Nacion', 'Ma. Gina', NULL, NULL, 5, 2, 'Maysan Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:55:50', '2022-03-24 05:55:50'),
(118, 'Callo', 'Bea Tricia', NULL, NULL, 5, 2, 'Unit 306 Bldg. 4 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:56:00', '2022-03-24 05:56:00'),
(119, 'Tomagos', 'Candy', NULL, NULL, 5, 3, 'Biglang-Awa Subd. Rmd Apartment Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:56:11', '2022-03-24 05:56:11'),
(120, 'Dalangin', 'Avril Cazandra', NULL, NULL, 5, 2, 'Bldg. 10 Unit 104 Disiplina Village Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:56:21', '2022-03-24 05:56:21'),
(121, 'Rivera', 'Rubie Jane', NULL, NULL, 5, 2, 'Bonbon Ville Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:56:33', '2022-03-24 05:56:33'),
(122, 'Sulayao', 'Christopher', NULL, NULL, 5, 0, '1011 Bonbon St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:56:44', '2022-03-24 05:56:44'),
(123, 'Vale', 'Chloie Nicole', NULL, NULL, 5, 2, 'Bldg 4 Unit 309 Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:56:55', '2022-03-24 05:56:55'),
(124, 'Rioflorido', 'Bea', NULL, NULL, 5, 2, '29 Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:57:05', '2022-03-24 05:57:05'),
(125, 'Gacuma', 'Julie Ann', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:57:20', '2022-03-24 05:57:20'),
(126, 'Zarie', 'Milante', NULL, NULL, 5, 2, 'C De Leon St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:57:29', '2022-03-24 05:57:29'),
(127, 'Remoto', 'Emily', NULL, NULL, 5, 3, 'Heritage Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:57:38', '2022-03-24 05:57:38'),
(128, 'Maceda', 'Ivy', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:57:51', '2022-03-24 05:57:51'),
(129, 'Collantes', 'Mebelle', NULL, NULL, 5, 2, 'Blk9 Lot 32 Urbano Deca Homes Marilo Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:58:05', '2022-03-24 05:58:05'),
(130, 'Galit', 'Jonna Mae', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:58:15', '2022-03-24 05:58:15'),
(131, 'Remoto', 'Joshua', NULL, NULL, 5, 0, 'Heritage Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:58:26', '2022-03-24 05:58:26'),
(132, 'Francisco', 'Angelo', NULL, NULL, 5, 0, '415 Drc Compound Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:58:34', '2022-03-24 05:58:34'),
(133, 'Cabral', 'Angel', NULL, NULL, 5, 2, 'Blk 3 Lt4 Lamesa Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:58:46', '2022-03-24 05:58:46'),
(134, 'Martin', 'Paula', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:58:55', '2022-03-24 05:58:55'),
(135, 'Butardo', 'Juan Carlos Miguel', NULL, NULL, 5, 0, '34 Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:59:04', '2022-03-24 05:59:04'),
(136, 'Siplon', 'Manolet', NULL, NULL, 5, 1, 'Amva Vill. Lamesa St. Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:59:13', '2022-03-24 05:59:13'),
(137, 'Siray', 'Lorenzo', NULL, NULL, 5, 0, 'Oro Compound Kingspoint Bagbag Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:59:21', '2022-03-24 05:59:21'),
(138, 'Vinenzuela', 'Princess', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 05:59:30', '2022-03-24 05:59:30'),
(139, 'Gonzaga', 'Roger', NULL, NULL, 5, 0, 'San Lorenzo, Taytay Rizal', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:03:51', '2022-03-24 06:03:51'),
(140, 'Barnuevo', 'Maureen', NULL, NULL, 5, 2, 'Bldg 32 Unit 10 Disiplina Village Ugong Valenzuela City Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:04:04', '2022-03-24 06:04:04'),
(141, 'Callo', 'Danica', NULL, NULL, 5, 2, 'Unit 18 Bautistan Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:05:28', '2022-03-24 06:05:28'),
(142, 'Salazar', 'Ryka Joy', NULL, NULL, 5, 2, 'Bonbon Ville Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:05:37', '2022-03-24 06:05:37'),
(143, 'Nacua', 'Stefany Kc', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:05:46', '2022-03-24 06:05:46'),
(144, 'Bacutana', 'Erica', NULL, NULL, 5, 2, '1035 M. Bernardino St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:05:58', '2022-03-24 06:05:58'),
(145, 'Dichoza', 'Shaira Nicole', NULL, NULL, 5, 2, 'Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:06:09', '2022-03-24 06:06:09'),
(146, 'Alix', 'Rosario', NULL, NULL, 5, 3, '161 Road 1 Bagong Pag-Asa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:06:19', '2022-03-24 06:06:19'),
(147, 'Fe', 'Regine', NULL, NULL, 5, 2, 'Jordan Drive Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:06:30', '2022-03-24 06:06:30'),
(148, 'Icawat', 'Francine', NULL, NULL, 5, 2, 'Rd. 11 Gsis Hills Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:06:39', '2022-03-24 06:06:39'),
(149, 'Quijano', 'Jeraldine', NULL, NULL, 5, 2, '#4 Rd. 11 Gsis Hills Subd. Brgy. 164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:06:48', '2022-03-24 06:06:48'),
(150, 'Baluran', 'Mitch Ann', NULL, NULL, 5, 2, '132 Rd 7 Gsis Hills Subd. Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:06:57', '2022-03-24 06:06:57'),
(151, 'Pua', 'Ryanah', NULL, NULL, 5, 2, 'Interville Subd. Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:07:10', '2022-03-24 06:07:10'),
(152, 'Castor', 'Nomeriano', NULL, NULL, 5, 1, 'Bldg 30 Unit 10 Disiplina Village Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:07:20', '2022-03-24 06:07:20'),
(153, 'Pamaos', 'Jovie', NULL, NULL, 5, 2, 'Baluyot 1 Sauyo, Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:07:32', '2022-03-24 06:07:32'),
(154, 'Galamiton', 'Kaila', NULL, NULL, 5, 2, '#9 St. Vincent St. Sto. Nino Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:07:41', '2022-03-24 06:07:41'),
(155, 'Reyes', 'Zenaida', NULL, NULL, 5, 3, 'Bldg. 11 Unit 207 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:07:51', '2022-03-24 06:07:51'),
(156, 'Liansing', 'Michael', NULL, NULL, 5, 1, '#6 Rt 2 Brgy. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:08:01', '2022-03-24 06:08:01'),
(157, 'Raciles', 'Aicelle', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:08:13', '2022-03-24 06:08:13'),
(158, 'Aniceto', 'Doralyn', NULL, NULL, 5, 2, 'Amva Housing Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:08:22', '2022-03-24 06:08:22'),
(159, 'Col', 'Joana Paula', NULL, NULL, 5, 3, 'Bldg.30 A Unit 12 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:08:32', '2022-03-24 06:08:32'),
(160, 'Manlapig', 'Steven', NULL, NULL, 5, 0, 'Amva Housing Lamesa St. Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:08:42', '2022-03-24 06:08:42'),
(161, 'Biglang-Awa', 'Ma. Dolores', NULL, NULL, 5, 3, 'Del Nacia Dr. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:08:51', '2022-03-24 06:08:51'),
(162, 'Malaap', 'Lander', NULL, NULL, 5, 0, 'Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:08:59', '2022-03-24 06:08:59'),
(163, 'Aquilato', 'Daniela', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:09:11', '2022-03-24 06:09:11'),
(164, 'Rebucas', 'Julius', NULL, NULL, 5, 0, '1035 M. Bernardino St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:09:19', '2022-03-24 06:09:19'),
(165, 'Garcia', 'Samantha Joed', NULL, NULL, 5, 2, '1035 M.Bernardino St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:09:30', '2022-03-24 06:09:30'),
(166, 'Docilbar', 'Catherine', NULL, NULL, 5, 2, '160 B Banlat Rd Tandang Sora Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:09:38', '2022-03-24 06:09:38'),
(167, 'Miranda', 'Hannah', NULL, NULL, 5, 2, '67 Kaingin Rd. Brgy. Apolonio Samson Balintawak Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:09:50', '2022-03-24 06:09:50'),
(168, 'Cerna', 'Patricia', NULL, NULL, 5, 2, 'Rd. 11 Gsis Hills Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:10:05', '2022-03-24 06:10:05'),
(169, 'Dizon', 'Wilfredo', NULL, NULL, 5, 1, 'Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:10:19', '2022-03-24 06:10:19'),
(170, 'Esco', 'Lara', NULL, NULL, 5, 2, 'Bldg 34 Unit 2 Disiplina Village Igong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:10:47', '2022-03-24 06:10:47'),
(171, 'De Olazo', 'Tiza', NULL, NULL, 5, 2, 'Area D Diamond St. Interville 1 Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:10:56', '2022-03-24 06:10:56'),
(172, 'Regalado', 'Joan', NULL, NULL, 5, 2, 'Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:11:05', '2022-03-24 06:11:05'),
(173, 'Saberon', 'Jick', NULL, NULL, 5, 2, 'Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:11:15', '2022-03-24 06:11:15'),
(174, 'Paclibare', 'Shanice May Ann', NULL, NULL, 5, 2, 'Unit 108 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:11:23', '2022-03-24 06:11:23'),
(175, 'Dawis', 'Faith Allaine', NULL, NULL, 5, 2, 'Amva Ville Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:11:42', '2022-03-24 06:11:42'),
(176, 'Miranda', 'Hadiah', NULL, NULL, 5, 2, '67 Kaingin Rd. Brgy. Apolonio Samson Balintawak Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:11:50', '2022-03-24 06:11:50'),
(177, 'Virgo', 'Teresita', NULL, NULL, 5, 3, 'Amva Ville Lamesa St Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:12:11', '2022-03-24 06:12:11'),
(178, 'Butardo', 'Joey', NULL, NULL, 5, 1, '34 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:12:23', '2022-03-24 06:12:23'),
(179, 'Sevilla', 'Lutche', NULL, NULL, 5, 2, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:12:31', '2022-03-24 06:12:31'),
(180, 'Palomares', 'Ydran', NULL, NULL, 5, 0, '43 Alcantara St. Banlat Tandang Sora Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:12:41', '2022-03-24 06:12:41'),
(181, 'Dela Cruz', 'Life', NULL, NULL, 5, 2, '1035 M. Bernardino Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:12:49', '2022-03-24 06:12:49'),
(182, 'Manuel', 'Lolita', NULL, NULL, 5, 3, 'Urban Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:12:58', '2022-03-24 06:12:58'),
(183, 'Col', 'Nicolas', NULL, NULL, 5, 0, 'Bldg.30 A Unit 12 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:13:12', '2022-03-24 06:13:12'),
(184, 'Caraan', 'Marichelle', NULL, NULL, 5, 3, 'B7 140 Isaac St. Ph.1 North Olympus Subd. Camarin, Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:13:21', '2022-03-24 06:13:21'),
(185, 'Samante', 'Jojie', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:13:36', '2022-03-24 06:13:36'),
(186, 'Leones', 'Wendel', NULL, NULL, 5, 0, 'Horizon Ville Bagumbong Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:13:46', '2022-03-24 06:13:46'),
(187, 'Amor', 'Janna Eimereen', NULL, NULL, 5, 0, '415 Drc Compound Brgy. Talipapa Nova. Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:14:02', '2022-03-24 06:14:02'),
(188, 'Angeles', 'Princess', NULL, NULL, 5, 2, '#12 Rd.11 Gsis Hills Subd. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:14:19', '2022-03-24 06:14:19'),
(189, 'Azuela', 'Queenie Marie', NULL, NULL, 5, 2, '505 Quirino Hi-Way Talipapa Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:14:28', '2022-03-24 06:14:28'),
(190, 'Baladhay', 'Edzel', NULL, NULL, 5, 0, 'Drc Compound Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:14:37', '2022-03-24 06:14:37'),
(191, 'Balonzo', 'John Michael', NULL, NULL, 5, 0, '12 Pipit St. Villilia Vill Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:14:45', '2022-03-24 06:14:45'),
(192, 'Barbosa', 'Reymond', NULL, NULL, 5, 0, 'Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:14:52', '2022-03-24 06:14:52'),
(193, 'Barbon', 'Charis', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:15:02', '2022-03-24 06:15:02'),
(194, 'Belen', 'Charls Lester', NULL, NULL, 5, 0, 'Interville 1 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:15:09', '2022-03-24 06:15:09'),
(195, 'De Claro', 'Kim Bryan', NULL, NULL, 5, 0, 'Unit 20 La Mesa Dam Compound, Brgy. Greater Lagro, Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:15:16', '2022-03-24 06:15:16'),
(196, 'Go', 'Jane', NULL, NULL, 5, 3, '36 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:15:26', '2022-03-24 06:15:26'),
(197, 'Alag', 'Hargie', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:15:35', '2022-03-24 06:15:35'),
(198, 'Mijares', 'Alexandra', NULL, NULL, 5, 2, 'Rd. 11 Gsis Hills Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:15:43', '2022-03-24 06:15:43'),
(199, 'Castillo', 'Charis Mae', NULL, NULL, 5, 2, '23 B. Coronel Comp. Bagbag Novaliches Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:15:52', '2022-03-24 06:15:52'),
(200, 'Delos Santos', 'Rolyn', NULL, NULL, 5, 0, '#2 Narra St. Ibayo 2 Bagbag Nova. Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:15:59', '2022-03-24 06:15:59'),
(201, 'Lagrata', 'Evan Marco', NULL, NULL, 5, 0, 'Bagbaguin Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:16:06', '2022-03-24 06:16:06'),
(202, 'Taco', 'Ralph', NULL, NULL, 5, 1, 'Rumhai 2 Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:16:22', '2022-03-24 06:16:22'),
(203, 'Abapo', 'Jearl Marie', NULL, NULL, 5, 2, '22f Marigold St. Dominic Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:16:34', '2022-03-24 06:16:34'),
(204, 'Teel', 'Jimver', NULL, NULL, 5, 1, 'Bldg 32 Unit 10 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:16:43', '2022-03-24 06:16:43'),
(205, 'Eleuterio', 'Ramil', NULL, NULL, 5, 0, '415 Drc Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:16:51', '2022-03-24 06:16:51'),
(206, 'Fernandez', 'Princess', NULL, NULL, 5, 2, '2391 Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:17:00', '2022-03-24 06:17:00'),
(207, 'Bahandi', 'Richzell Ann', NULL, NULL, 5, 2, '2337 Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:17:09', '2022-03-24 06:17:09'),
(208, 'Latagan', 'Lucelle', NULL, NULL, 5, 2, 'Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:17:18', '2022-03-24 06:17:18'),
(209, 'Narciso', 'Charlie', NULL, NULL, 5, 0, 'Amva Ville La Mesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:17:28', '2022-03-24 06:17:28'),
(210, 'Ortega', 'Harlene', NULL, NULL, 5, 2, 'Bldg 49 Unit 12 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:17:37', '2022-03-24 06:17:37'),
(211, 'Palito', 'John Ryan', NULL, NULL, 5, 0, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:17:46', '2022-03-24 06:17:46'),
(212, 'Peralta', 'Lady Janelle', NULL, NULL, 5, 2, '9 Bisugo St. Cadaing Village Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:17:56', '2022-03-24 06:17:56'),
(213, 'Tan', 'Erica Louis', NULL, NULL, 5, 2, 'Blk 9b Lot 21 Teresa Rd. St. Dela Costa 2 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:18:08', '2022-03-24 06:18:08'),
(214, 'Villanueva', 'Melanie', NULL, NULL, 5, 3, 'Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:18:52', '2022-03-24 06:18:52'),
(215, 'Villanueva', 'Mykha', NULL, NULL, 5, 2, 'B14 L31 Ph. 2 Lareda St. Bagumbong Caloocan Tierra Nova', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:19:00', '2022-03-24 06:19:00'),
(216, 'Belga', 'Emyren', NULL, NULL, 5, 2, 'Novaliches Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:19:11', '2022-03-24 06:19:11'),
(217, 'De Dios', 'Aprilene', NULL, NULL, 5, 3, '36 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:19:21', '2022-03-24 06:19:21'),
(218, 'Allauigan', 'Anjelyn', NULL, NULL, 5, 2, 'Villa Sabina Talipapa Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:19:29', '2022-03-24 06:19:29'),
(219, 'San Pascual', 'Ryan James', NULL, NULL, 5, 0, 'Gulod Camalig Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:19:42', '2022-03-24 06:19:42'),
(221, 'Abapo', 'Ethan', NULL, NULL, 5, 0, 'Blk9 Lot 32 Urbano Deca Homes Marilo Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:20:24', '2022-03-24 06:20:24'),
(222, 'Odal', 'Emily', NULL, NULL, 5, 3, '36 Francisco St. San Agustin Vill. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:20:35', '2022-03-24 06:20:35'),
(223, 'Odal', 'Benger', NULL, NULL, 5, 1, 'Talipapa Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:20:46', '2022-03-24 06:20:46'),
(224, 'Lanting', 'Christian', NULL, NULL, 5, 0, 'Deparo Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:20:53', '2022-03-24 06:20:53'),
(225, 'Atiga', 'Rheagin', NULL, NULL, 5, 2, 'Interville Diamond St. Talipapa Cal. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:21:01', '2022-03-24 06:21:01'),
(226, 'Tampoc', 'Realyn', NULL, NULL, 5, 2, '1035 M.Bernardino St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:21:09', '2022-03-24 06:21:09'),
(227, 'Lucena', 'Erlinda', NULL, NULL, 5, 2, 'Urban Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:21:19', '2022-03-24 06:21:19'),
(228, 'Ching', 'Darren', NULL, NULL, 5, 0, '505 Carreon Compound Quirino Hi-Way Brgy. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:21:26', '2022-03-24 06:21:26'),
(229, 'Gaudia', 'Jessica Shane', NULL, NULL, 5, 2, '#8 Rd 3 Gsis Hills Subd. Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:21:35', '2022-03-24 06:21:35'),
(230, 'Dizon', 'Iluminada', NULL, NULL, 5, 3, 'Blk 9 Lot 32 Urban Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:21:47', '2022-03-24 06:21:47'),
(231, 'Bayani', 'Rubriel', NULL, NULL, 5, 0, '36 Urbano St. Bagbag Nova Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:21:54', '2022-03-24 06:21:54'),
(232, 'San Juan', 'Dan Edcel', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:22:01', '2022-03-24 06:22:01'),
(233, 'Dantes', 'Howard Anthony', NULL, NULL, 5, 0, 'Ugong Lamesa St. Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:22:12', '2022-03-24 06:22:12'),
(234, 'Dantes', 'Jhester', NULL, NULL, 5, 0, 'Lamesa St. Ugong, Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:22:19', '2022-03-24 06:22:19'),
(235, 'Oligario', 'Efren', NULL, NULL, 5, 1, 'Banaue St. Brgy Sto. Domingo Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:22:35', '2022-03-24 06:22:35'),
(236, 'Cepillo', 'Roger', NULL, NULL, 5, 1, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:22:44', '2022-03-24 06:22:44'),
(237, 'Singson', 'Kengen', NULL, NULL, 5, 0, '#7 Milagrosa St. Villa Sabina Subd., Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:22:52', '2022-03-24 06:22:52'),
(238, 'Sayao', 'Jairus Neil', NULL, NULL, 5, 0, '#7 Milagrosa St. Villa Sabina Talipapa Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:22:59', '2022-03-24 06:22:59'),
(239, 'Trinidad', 'Catherine Grace', NULL, NULL, 5, 3, 'Cuadra Uno Libis Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:23:08', '2022-03-24 06:23:08'),
(240, 'Cembrano', 'Jamaica', NULL, NULL, 5, 2, 'Bagbag, Semenario Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:23:17', '2022-03-24 06:23:17'),
(241, 'Saludares', 'John Kenneth', NULL, NULL, 5, 0, 'Del Rey Ville Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:23:27', '2022-03-24 06:23:27'),
(242, 'Gorgonio', 'Anjelou', NULL, NULL, 5, 1, '36 Rd 5 Gsis Hills Subd. Talipapa Brgy 164 Cal. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:23:37', '2022-03-24 06:23:37'),
(243, 'Herrera', 'Kathrina', NULL, NULL, 5, 2, '2733 Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:23:48', '2022-03-24 06:23:48'),
(244, 'Malonzo', 'Shaina', NULL, NULL, 5, 2, 'Amva Housing Bldg 17 Unit 114 Lamesa St. Ugong Val City', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:23:59', '2022-03-24 06:23:59'),
(245, 'Bastatas', 'Loren', NULL, NULL, 5, 2, 'Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:24:09', '2022-03-24 06:24:09'),
(246, 'Espino', 'Alex', NULL, NULL, 5, 2, 'Latrinidad Vill. Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 06:24:18', '2022-03-24 06:24:18'),
(247, 'Escototo', 'Gieselle', NULL, NULL, 5, 2, 'Npc Area B. Tal. Cal. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:37:33', '2022-03-24 17:37:33'),
(248, 'Almosara', 'Arjay', NULL, NULL, 5, 0, '1035 Bernardino St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:37:41', '2022-03-24 17:37:41'),
(249, 'Bacutana', 'Rose', NULL, NULL, 5, 2, '1035 M.Bernardino, Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:37:51', '2022-03-24 17:37:51'),
(250, 'Almosara', 'Ashley', NULL, NULL, 5, 2, '1035 M. Bernardino St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:38:01', '2022-03-24 17:38:01'),
(251, 'Fabros', 'John Quillin', NULL, NULL, 5, 0, '1011 Bonbon St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:38:09', '2022-03-24 17:38:09'),
(252, 'Fabros', 'Jhayhan', NULL, NULL, 5, 0, '1011 Bonbon Ville Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:38:18', '2022-03-24 17:38:18'),
(253, 'Simballa', 'Jhamaica', NULL, NULL, 5, 2, '1011 Bonbon St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:38:28', '2022-03-24 17:38:28'),
(254, 'Fabros', 'Kaylanie', NULL, NULL, 5, 2, '1001 Bonbon St. Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:38:44', '2022-03-24 17:38:44'),
(255, 'Recamora', 'Ashley', NULL, NULL, 5, 2, '1011 Bonbon St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:38:54', '2022-03-24 17:38:54'),
(256, 'Bacutana', 'Claudine', NULL, NULL, 5, 2, '1035 M. Bernardino St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:39:03', '2022-03-24 17:39:03'),
(257, 'Rocero', 'Sophia', NULL, NULL, 5, 2, '1011 Bonbon St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:39:16', '2022-03-24 17:39:16'),
(258, 'Bulos', 'Camille', NULL, NULL, 5, 2, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:39:25', '2022-03-24 17:39:25'),
(259, 'Brizuela', 'Althea', NULL, NULL, 5, 2, 'Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:39:34', '2022-03-24 17:39:34'),
(260, 'Maglalang', 'Mark Lester', NULL, NULL, 5, 0, '09 Tikling Villilia Village Talipapa Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:39:45', '2022-03-24 17:39:45'),
(261, 'Sumatra', 'Cyrelle', NULL, NULL, 5, 2, 'Bldg. 8 Unit 108 Disiplina Village Ugong Valenzuela Cty', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:39:55', '2022-03-24 17:39:55'),
(262, 'Mangubat', 'Aya Mae', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:40:03', '2022-03-24 17:40:03'),
(263, 'Metin', 'Raeven', NULL, NULL, 5, 0, 'Urbano St. Bagbag Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:40:10', '2022-03-24 17:40:10'),
(264, 'Ciabu', 'Emyrose', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:40:24', '2022-03-24 17:40:24'),
(265, 'Coronel', 'Luis', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:40:33', '2022-03-24 17:40:33'),
(266, 'Ortiz', 'Ma. Clarisse', NULL, NULL, 5, 2, 'Amva Housing Ville Bldg 24 Unit 303 Sitio Lamesa, Ugong, Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:40:43', '2022-03-24 17:40:43'),
(267, 'De Leon', 'Diana', NULL, NULL, 5, 2, 'Amva Ville Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:40:52', '2022-03-24 17:40:52'),
(268, 'Rueda', 'Kisses', NULL, NULL, 5, 2, 'Biglang-Awa Subd. Rmd Apartment Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:41:03', '2022-03-24 17:41:03'),
(269, 'Gonzaga', 'Jetsy Marie', NULL, NULL, 5, 2, '#24 Allan Bean St. Dona Faustina 2 Brgy. Culiat T.Sora Ave. Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:41:18', '2022-03-24 17:41:18'),
(270, 'Gonzaga', 'Francia', NULL, NULL, 5, 3, '#24 Allan Bean St. Dona Faustina Village Phase 2 Culiat Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:41:45', '2022-03-24 17:41:45'),
(271, 'Lucero', 'Geralyn', NULL, NULL, 5, 2, '1047 Que Grande St. Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:41:54', '2022-03-24 17:41:54'),
(272, 'Amaro', 'Ines', NULL, NULL, 5, 3, 'Rd.15 Gsis Hills Subd. Talipapa 164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:42:03', '2022-03-24 17:42:03'),
(273, 'Inson', 'Mary Joyce', NULL, NULL, 5, 3, 'Interville Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:42:14', '2022-03-24 17:42:14'),
(274, 'Zapador', 'Joanna Marie', NULL, NULL, 5, 2, '472 Quirino Highway Talipapa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:42:23', '2022-03-24 17:42:23'),
(275, 'Biz', 'Jelena Mae', NULL, NULL, 5, 2, '#25 San Antonio De Padua Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:42:39', '2022-03-24 17:42:39'),
(276, 'Galit', 'Jonald', NULL, NULL, 5, 0, 'Bldg. 11 Unit 305 Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:42:47', '2022-03-24 17:42:47'),
(277, 'Rillon', 'Althea Keith', NULL, NULL, 5, 2, 'Amva Housing Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:42:57', '2022-03-24 17:42:57'),
(278, 'Macalino', 'Lea', NULL, NULL, 5, 2, 'Bldg. 2 Unit 113 Amva Housing Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:43:06', '2022-03-24 17:43:06'),
(279, 'Anocop', 'Maryjane', NULL, NULL, 5, 2, 'Bldg 8 Unit 207 Disiplina Vill. Brgy. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:43:16', '2022-03-24 17:43:16'),
(280, 'Bumatay', 'Zyrille', NULL, NULL, 5, 2, 'Bldg. 12 Unit 209 Amva Resident Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:43:25', '2022-03-24 17:43:25'),
(281, 'Capistrano', 'Salvacion', NULL, NULL, 5, 3, '#6 Maligaya St. Ext. Nitang Gulod Nova. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:43:38', '2022-03-24 17:43:38'),
(282, 'Lao-Ang', 'Rosie', NULL, NULL, 5, 3, 'Banaue St. Brgy Sto. Domingo Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:43:49', '2022-03-24 17:43:49'),
(283, 'Lao-Ang', 'Arcelie', NULL, NULL, 5, 3, 'Banaue St. Brgy Sto. Domingo Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:43:59', '2022-03-24 17:43:59'),
(284, 'Espino', 'Toni', NULL, NULL, 5, 2, 'La Trinidad Village Blk 6 Lot 4 Talipapa Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:44:09', '2022-03-24 17:44:09'),
(285, 'Angolluan', 'Heart', NULL, NULL, 5, 2, 'San Bartolome Novaliches', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:44:19', '2022-03-24 17:44:19'),
(286, 'Ilagan', 'Althea Ken', NULL, NULL, 5, 2, '#167 Desuyo Compound Rd.7 Gsis Village Brgy. 164 Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:44:30', '2022-03-24 17:44:30'),
(287, 'Dizon', 'Fortunato', NULL, NULL, 5, 1, 'Blk 9 Lot 32 Urban Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:44:41', '2022-03-24 17:44:41'),
(288, 'Guarin', 'Cyra', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:44:51', '2022-03-24 17:44:51'),
(289, 'Nocidal', 'Annamarie', NULL, NULL, 5, 2, 'N/A', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:45:03', '2022-03-24 17:45:03'),
(290, 'Samaniego', 'Dimple', NULL, NULL, 5, 2, 'Road 3.Gsis Hills Subdivision Cal. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:45:13', '2022-03-24 17:45:13'),
(291, 'Ailes', 'Daisylyn', NULL, NULL, 5, 2, '99 Camp Grezzar St. Bagbag Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:45:23', '2022-03-24 17:45:23'),
(292, 'Angeles', 'Jovert', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:45:33', '2022-03-24 17:45:33'),
(293, 'Bacares', 'Andrea', NULL, NULL, 5, 2, 'Displina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:45:42', '2022-03-24 17:45:42'),
(294, 'Calawod', 'Christian', NULL, NULL, 5, 0, 'Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:45:50', '2022-03-24 17:45:50'),
(295, 'Clemente', 'Ceprilyn', NULL, NULL, 5, 2, 'Bldg 13 Unit 104 Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:46:00', '2022-03-24 17:46:00'),
(296, 'Mahinay', 'Angelo', NULL, NULL, 5, 0, 'Alcantara St. Banlat Tandang Sora Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:46:08', '2022-03-24 17:46:08'),
(297, 'Angeles', 'Ashley Nicole', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:46:18', '2022-03-24 17:46:18'),
(298, 'Mercado', 'Ailyn', NULL, NULL, 5, 3, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:46:28', '2022-03-24 17:46:28'),
(299, 'Olaivar', 'Stephanie', NULL, NULL, 5, 2, 'Margareth Homes San Vicente Sta. Maria Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:46:47', '2022-03-24 17:46:47'),
(300, 'Rollo', 'Hazel Grace', NULL, NULL, 5, 2, '1035 M.Bernardino St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:46:59', '2022-03-24 17:46:59'),
(301, 'Dela Cruz', 'John Carl', NULL, NULL, 5, 0, '1035 Bonbon St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:47:09', '2022-03-24 17:47:09'),
(302, 'Moreno', 'Rachel', NULL, NULL, 5, 2, '1035 M.Bernardino, Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:47:24', '2022-03-24 17:47:24'),
(303, 'Granada', 'Shekyra', NULL, NULL, 5, 2, '30-A Richland 5 Bagbag Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:47:34', '2022-03-24 17:47:34'),
(304, 'Sofocado', 'Honey Grace', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:47:45', '2022-03-24 17:47:45'),
(305, 'Cabubas', 'Clarence', NULL, NULL, 5, 0, '40 Alcantara St. Banlat Rd. Tandang Sora Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:47:54', '2022-03-24 17:47:54'),
(306, 'Cordeta', 'Rex', NULL, NULL, 5, 1, 'Urbano St. Bagbag Novaliches', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:48:05', '2022-03-24 17:48:05'),
(307, 'Cosme', 'Ashley Jeanelle', NULL, NULL, 5, 2, 'Rd. 11 Gsis Hills Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:48:15', '2022-03-24 17:48:15'),
(308, 'Llantos', 'Mikee', NULL, NULL, 5, 2, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:48:25', '2022-03-24 17:48:25'),
(309, 'Samson', 'Chustel', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:48:34', '2022-03-24 17:48:34'),
(310, 'Ferrer', 'Clariss', NULL, NULL, 5, 2, '041 Ibayo 2 Brgy. Bagbag Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:48:43', '2022-03-24 17:48:43'),
(311, 'Galang', 'Prince Karl', NULL, NULL, 5, 0, 'Blk 8 Lot 25 St. Abangan Sur Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:48:52', '2022-03-24 17:48:52'),
(312, 'Galang', 'Lad Melchizedek', NULL, NULL, 5, 0, 'Blk 8 Lot 25 St. Abangan Sur Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:49:01', '2022-03-24 17:49:01'),
(313, 'Abrera', 'Jemalyn', NULL, NULL, 5, 3, 'Drc Compound Brgy.Talipapa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:49:10', '2022-03-24 17:49:10'),
(314, 'Abordo', 'Edelyn', NULL, NULL, 5, 2, 'Disiplina Village Brgy Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:49:20', '2022-03-24 17:49:20'),
(315, 'Ramos', 'Michael', NULL, NULL, 5, 0, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:49:29', '2022-03-24 17:49:29'),
(316, 'Zamora', 'Carissa', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:49:42', '2022-03-24 17:49:42'),
(317, 'Capistrano', 'Khensvie Jade', NULL, NULL, 5, 2, '#6 Maligaya Extension Nitang St. Brgy. Gulod Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:49:54', '2022-03-24 17:49:54'),
(318, 'Aquino', 'Vanessa', NULL, NULL, 5, 2, 'Blk.6 Lt.7 Greenhouse Ville Hoa Sitio Holo Brgy. 171 Bag. Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:50:04', '2022-03-24 17:50:04'),
(319, 'Teel', 'Shiela', NULL, NULL, 5, 3, 'Bldg 32 Unit 10 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:50:14', '2022-03-24 17:50:14'),
(320, 'De Guzman', 'Aleeza Ghaile', NULL, NULL, 5, 2, '5170 Pvr Gsis Hills Subd. Tulay Na Bato Sampaguita St. Ugong Val.', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:50:24', '2022-03-24 17:50:24'),
(321, 'Rodrigo', 'Stephanie', NULL, NULL, 5, 2, '#2 Rd. 8 Cor. Rd.14 Gsis Hills Subd. Tal.Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:50:36', '2022-03-24 17:50:36'),
(322, 'Sotto', 'Mae', NULL, NULL, 5, 2, 'Bagbaguin Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:50:50', '2022-03-24 17:50:50'),
(323, 'Docilbar', 'Rona', NULL, NULL, 5, 2, '100b Banlat Rd. Tandang Sora Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:51:01', '2022-03-24 17:51:01'),
(324, 'Remoto', 'Emmanuelle', NULL, NULL, 5, 0, 'B9 Lt32 Urban Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:51:09', '2022-03-24 17:51:09'),
(325, 'Delos Santos', 'Xerxes', NULL, NULL, 5, 2, '#221 Pactieco Bagbaguin Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:51:19', '2022-03-24 17:51:19'),
(326, 'Pojaras', 'Marlon', NULL, NULL, 5, 0, 'Bldg. 30 A Unit 11 Disiplina Village', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:51:27', '2022-03-24 17:51:27'),
(327, 'Lumangtad', 'Janine', NULL, NULL, 5, 2, 'Talipapa, Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:51:36', '2022-03-24 17:51:36'),
(328, 'Faustino', 'Joel', NULL, NULL, 5, 1, '107 West Riverside St. Sfdm Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:52:24', '2022-03-24 17:52:24'),
(329, 'Tamares', 'Josephine', NULL, NULL, 5, 2, 'Bldg.11 Unit 212 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:52:34', '2022-03-24 17:52:34'),
(330, 'Malaap', 'Roxane', NULL, NULL, 5, 2, '#25 Rd. 6 Gsis Hills Subd. Brgy 164 Cal. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:52:44', '2022-03-24 17:52:44'),
(331, 'Cordeta', 'Sheena', NULL, NULL, 5, 3, '#36 Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:52:54', '2022-03-24 17:52:54'),
(332, 'Azusano', 'Clarence', NULL, NULL, 5, 0, 'Ibayo Ii Brgy. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:53:02', '2022-03-24 17:53:02'),
(333, 'Cid', 'Ana Liza', NULL, NULL, 5, 3, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:53:13', '2022-03-24 17:53:13'),
(334, 'Cruz', 'John Paul', NULL, NULL, 5, 0, '44 Alcantara St. Banlat Tandang Sora Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:53:23', '2022-03-24 17:53:23'),
(335, 'Devera', 'Marc Alexander', NULL, NULL, 5, 0, '12 B Rivera St. Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:53:33', '2022-03-24 17:53:33'),
(336, 'Francisco', 'Tristan Kenneth', NULL, NULL, 5, 0, 'Dela Costa Ii Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:53:42', '2022-03-24 17:53:42'),
(337, 'Arpon', 'Kyla Jenica', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:53:55', '2022-03-24 17:53:55'),
(338, 'Frias', 'Dianne', NULL, NULL, 5, 2, '#5269 Brgy. Ugong Sitio Sulok St. Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:54:11', '2022-03-24 17:54:11');
INSERT INTO `disciples` (`id`, `last_name`, `first_name`, `middle_name`, `suffix`, `status`, `network`, `address`, `birthday`, `age`, `inviter_id`, `cell_leader_id`, `primary_leader_id`, `is_archive`, `created_at`, `updated_at`) VALUES
(339, 'Gallardo', 'Racquel', NULL, NULL, 5, 2, 'Bldg 11 Unit 207 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:54:21', '2022-03-24 17:54:21'),
(340, 'Reyes', 'Zandra Mae', NULL, NULL, 5, 2, 'Bldg. 11 Unit 207 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:54:31', '2022-03-24 17:54:31'),
(341, 'Dizon', 'Elena', NULL, NULL, 5, 2, 'Blk 9 Lot 32 Urban Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:54:40', '2022-03-24 17:54:40'),
(342, 'Dionson', 'Darryl Marc', NULL, NULL, 5, 0, '155 Pingkian 2 Brgy. Pasong Tamo Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:54:49', '2022-03-24 17:54:49'),
(343, 'Gervacio', 'Criselda', NULL, NULL, 5, 2, 'Bldg3 Unit 103 Amva Ville Lamesa St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:55:00', '2022-03-24 17:55:00'),
(344, 'Argana', 'Mark Angelo', NULL, NULL, 5, 0, '1470 C Gana Compound Balintawak Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:55:09', '2022-03-24 17:55:09'),
(345, 'Novesio', 'Aira', NULL, NULL, 5, 2, 'Bldg.11 Unit 306 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:55:19', '2022-03-24 17:55:19'),
(346, 'Castor', 'Mishel', NULL, NULL, 5, 2, 'Bldg 30 Unit 10 Disiplina Village Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:55:29', '2022-03-24 17:55:29'),
(347, 'Redondo', 'Alfred', NULL, NULL, 5, 0, 'Pnp Housing Brgy. Batia Bocaue Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:56:32', '2022-03-24 17:56:32'),
(348, 'Labaco', 'Paul Vincent', NULL, NULL, 5, 0, '20 Apollo St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:56:43', '2022-03-24 17:56:43'),
(349, 'Ramos', 'Mark John', NULL, NULL, 5, 0, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:56:51', '2022-03-24 17:56:51'),
(350, 'Paringit', 'Henry', NULL, NULL, 5, 0, 'Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:56:59', '2022-03-24 17:56:59'),
(351, 'Doniza', 'Karla', NULL, NULL, 5, 2, '985 B2b Marian St. Marian Subd. Brgy. Sauyo T.Sora Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:57:08', '2022-03-24 17:57:08'),
(352, 'Angeles', 'Ivan', NULL, NULL, 5, 0, 'Biglang-Awa St. Libis 164 Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:57:16', '2022-03-24 17:57:16'),
(353, 'Dela Cruz', 'Rica', NULL, NULL, 5, 2, '1035 Bernardino St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:57:27', '2022-03-24 17:57:27'),
(354, 'Pepito', 'Danica', NULL, NULL, 5, 2, 'Bldg 30-A Unit 13 Disiplina Village Ugong Valanzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:57:35', '2022-03-24 17:57:35'),
(355, 'Almosara', 'Rose Ann', NULL, NULL, 5, 2, '1035 M. Bernardino St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:57:47', '2022-03-24 17:57:47'),
(356, 'Dela Cruz', 'Melody', NULL, NULL, 5, 2, 'Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:57:59', '2022-03-24 17:57:59'),
(357, 'Dela Cruz', 'Mikaela', NULL, NULL, 5, 2, '1035 Bernardino St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:58:13', '2022-03-24 17:58:13'),
(358, 'Gelbolingo', 'Mary Grace', NULL, NULL, 5, 2, '1035 M.Bernardino St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:58:22', '2022-03-24 17:58:22'),
(359, 'Almosara', 'Anjela', NULL, NULL, 5, 2, 'M. Bernardino St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:58:48', '2022-03-24 17:58:48'),
(360, 'Dela Cruz', 'Mary Joy', NULL, NULL, 5, 2, '1035 Bernardino St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:58:59', '2022-03-24 17:58:59'),
(361, 'Fernandez', 'Rose Ann Ghaile', NULL, NULL, 5, 2, '157 Jp. Ramoy St. Talipapa Caloocan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:59:10', '2022-03-24 17:59:10'),
(362, 'Mendiola', 'Hananiah', NULL, NULL, 5, 3, 'Blk 6 Lot 33 Birch St. Abangan Sur Urban Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:59:25', '2022-03-24 17:59:25'),
(363, 'Mendiola', 'Gerard', NULL, NULL, 5, 1, '#3 Vinegar St. Llenard Subd. Karuhatan Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:59:36', '2022-03-24 17:59:36'),
(364, 'Canales', 'Sheryl', NULL, NULL, 5, 2, '6150 Sitio Kabatuhan Gen.T. De Leon Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 17:59:50', '2022-03-24 17:59:50'),
(365, 'Alix', 'Ps. Rosemarie', NULL, NULL, 5, 3, 'Blk 6 Lot 33 Birch St. Abangan Sur Urban Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:00:01', '2022-03-24 18:00:01'),
(366, 'Valenzuela', 'Jessica', NULL, NULL, 5, 2, '#1 Oliva St. Biglangawa Subd. Tal. Nov. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:00:20', '2022-03-24 18:00:20'),
(367, 'Alix', 'Ps. Raymond', NULL, NULL, 5, 1, 'Blk 6 Lot 33 Birch St. Abangan Sur Urban Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:00:31', '2022-03-24 18:00:31'),
(368, 'Butardo', 'Mary Ann', NULL, NULL, 5, 3, '34 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:00:56', '2022-03-24 18:00:56'),
(369, 'Javier', 'Cristine Joy', NULL, NULL, 5, 3, 'Bldg 2e Unit 4 Disiplina Village Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:01:17', '2022-03-24 18:01:17'),
(370, 'Javier', 'Jeric', NULL, NULL, 5, 1, '2151 Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:01:27', '2022-03-24 18:01:27'),
(371, 'Plameran', 'Ehjay', NULL, NULL, 5, 0, '22 Virgo St. Solvile Subd. Nova Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:01:35', '2022-03-24 18:01:35'),
(372, 'Hagos', 'Christine', NULL, NULL, 5, 2, '2729 Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:01:44', '2022-03-24 18:01:44'),
(373, 'Bahandi', 'Ashley Mae', NULL, NULL, 5, 2, 'Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:01:54', '2022-03-24 18:01:54'),
(374, 'Bruan', 'Carl James', NULL, NULL, 5, 0, '32 Urbano St. Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:02:08', '2022-03-24 18:02:08'),
(375, 'Tobias', 'Eunice', NULL, NULL, 5, 2, '36 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:02:17', '2022-03-24 18:02:17'),
(376, 'Tobias', 'Nicole', NULL, NULL, 5, 2, '36 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:02:27', '2022-03-24 18:02:27'),
(377, 'Labaco', 'Justine Michael', NULL, NULL, 5, 0, '20 Apollo St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:02:40', '2022-03-24 18:02:40'),
(378, 'Benavente', 'Jhon Rex', NULL, NULL, 5, 0, '472 Quirino Hi-Way Talipapa Nova. Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:02:50', '2022-03-24 18:02:50'),
(379, 'Labaco', 'Mikah Leslie', NULL, NULL, 5, 2, '20 Apollo St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:02:59', '2022-03-24 18:02:59'),
(380, 'Labaco', 'Elsie', NULL, NULL, 5, 3, '20 Apollo St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:03:09', '2022-03-24 18:03:09'),
(381, 'Tobias', 'Kenn Jerome', NULL, NULL, 5, 0, '36 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:03:17', '2022-03-24 18:03:17'),
(382, 'Novesio', 'Raldine', NULL, NULL, 5, 0, 'Bldg.11 Unit 306 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:03:25', '2022-03-24 18:03:25'),
(383, 'Juan', 'Angelou', NULL, NULL, 5, 2, 'Bldg. 1 Unit 312 Disiplina Village Lingunan Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:03:34', '2022-03-24 18:03:34'),
(384, 'Pasagui', 'Maria Mae', NULL, NULL, 5, 2, 'Beoewedhli Comp. Baesaq.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:03:44', '2022-03-24 18:03:44'),
(385, 'Nacua', 'Missy Patricia Nicole Gray', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:03:53', '2022-03-24 18:03:53'),
(386, 'Labaco', 'Vicente Jr.', NULL, NULL, 5, 1, '20 Apollo St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:04:02', '2022-03-24 18:04:02'),
(387, 'Abril', 'Carmela', NULL, NULL, 5, 2, 'Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:04:38', '2022-03-24 18:04:38'),
(388, 'Miranda', 'Ethel Rose', NULL, NULL, 5, 3, '67 Kaingin Rd. Brgy. Apolonio Samson Balintawak Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:04:48', '2022-03-24 18:04:48'),
(389, 'Llantos', 'Christopher John', NULL, NULL, 5, 0, 'Tulay Kawayan Npc Area A Road 7 Gsis Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:04:59', '2022-03-24 18:04:59'),
(390, 'Olaivar', 'Sandra', NULL, NULL, 5, 2, 'Margareth Homes San Vicente Sta. Maria Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:05:10', '2022-03-24 18:05:10'),
(391, 'Llantos', 'Nida', NULL, NULL, 5, 3, 'Npc Area A. Talipapa Brgy. 164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:05:24', '2022-03-24 18:05:24'),
(392, 'Galang', 'Ronie', NULL, NULL, 5, 1, 'Kalapati St. Vilillia Village Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:05:39', '2022-03-24 18:05:39'),
(393, 'Galang', 'Christine Joy', NULL, NULL, 5, 3, 'Kalapati St. Vilillia Village Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:05:52', '2022-03-24 18:05:52'),
(394, 'Apiag', 'Joshua Angelo', NULL, NULL, 5, 0, '6050 Del Mundo St. Ugong Val.City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:06:02', '2022-03-24 18:06:02'),
(395, 'Olaivar', 'Merle', NULL, NULL, 5, 3, 'Margareth Homes San Vicente Sta. Maria Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:06:11', '2022-03-24 18:06:11'),
(396, 'Olaivar', 'Vicente Jr.', NULL, NULL, 5, 1, 'Margareth Homes San Vicente Sta. Maria Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:06:21', '2022-03-24 18:06:21'),
(397, 'Esco', 'Lyka', NULL, NULL, 5, 2, 'Bldg 34 Unit 2 Disiplina Village Igong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:06:33', '2022-03-24 18:06:33'),
(398, 'Diaz', 'Sophia Mae', NULL, NULL, 5, 2, 'Lamesa St.  Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:06:42', '2022-03-24 18:06:42'),
(399, 'Pagarigan', 'Marie Christine', NULL, NULL, 5, 3, '26 Morning Glory St. Dnv3 Talipapa Nova. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:06:52', '2022-03-24 18:06:52'),
(400, 'Pagarigan', 'Jerico', NULL, NULL, 5, 1, '26 Morning Glory St. Dnv3 Talipapa Nova. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:07:01', '2022-03-24 18:07:01'),
(401, 'Pagarigan', 'Carlo Jherome', NULL, NULL, 5, 0, '26 Morning Glory St. Dnv3 Talipapa Nova. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:07:10', '2022-03-24 18:07:10'),
(402, 'Valenzuela', 'Jheniela Mae', NULL, NULL, 5, 2, '# 1 Oliva St. Biglangawa Subd. Tal. Nov. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:07:20', '2022-03-24 18:07:20'),
(403, 'Mizuela', 'April Mae', NULL, NULL, 5, 2, '4393 Npc St. Que Balag Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:07:30', '2022-03-24 18:07:30'),
(404, 'Odal', 'Benneth Earl', NULL, NULL, 5, 0, '36 Francisco St. San Agustin Vill. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:07:38', '2022-03-24 18:07:38'),
(405, 'Abapo', 'Joan', NULL, NULL, 5, 3, 'Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:07:47', '2022-03-24 18:07:47'),
(406, 'Pasagui', 'Christine Mae', NULL, NULL, 5, 2, 'Beoewedhli Comp. Baesaq.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:08:01', '2022-03-24 18:08:01'),
(407, 'Saminiano', 'Mary Grace', NULL, NULL, 5, 2, 'Blk 7 Lot 10 Diamond St. Talipapa Cal. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:08:10', '2022-03-24 18:08:10'),
(408, 'Lacaba', 'Mirasol', NULL, NULL, 5, 2, 'Amva Ville La Mesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:08:20', '2022-03-24 18:08:20'),
(409, 'Narciso', 'Clarisse', NULL, NULL, 5, 2, 'Amva Ville La Mesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:08:31', '2022-03-24 18:08:31'),
(410, 'Aujero', 'Gon Riesse', NULL, NULL, 5, 0, '#17 Rd. 6 Cor.13 Gsis Hills Subd Talipapa 164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:08:39', '2022-03-24 18:08:39'),
(411, 'Butardo', 'Jean Claire', NULL, NULL, 5, 2, '34 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:08:49', '2022-03-24 18:08:49'),
(412, 'Gabas', 'Arnie', NULL, NULL, 5, 2, '#23 Dela Cruz St. Del Mundo Subd. Brgy. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:08:57', '2022-03-24 18:08:57'),
(413, 'Brojas', 'Jenny Ann', NULL, NULL, 5, 3, '# 1 Oliva St. Biglangawa Subd. Tal. Nov. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:09:08', '2022-03-24 18:09:08'),
(414, 'Brojas', 'Richig', NULL, NULL, 5, 1, '#1 Oliva St. Villa Florencia Subd. Brgy. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:09:18', '2022-03-24 18:09:18'),
(415, 'Remoto', 'Jovielyn', NULL, NULL, 5, 2, 'Bungahan St. Bagbaguin Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:09:28', '2022-03-24 18:09:28'),
(416, 'Yancha', 'Nery Rose', NULL, NULL, 5, 2, 'Bagbaguin,Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:09:37', '2022-03-24 18:09:37'),
(417, 'Tayong', 'Ruby', NULL, NULL, 5, 2, 'Hulo Bagbaguin Meycauayan Bulacan Perfecto Rivera Compound', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:09:47', '2022-03-24 18:09:47'),
(418, 'Borres', 'Jeliana', NULL, NULL, 5, 2, 'Bagbagin Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:09:55', '2022-03-24 18:09:55'),
(419, 'Curading', 'Joyce', NULL, NULL, 5, 2, '002 Samonte Rd. Nagkaisang Nayon Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:10:06', '2022-03-24 18:10:06'),
(420, 'Remoto', 'Jocel', NULL, NULL, 5, 1, 'Bungahan St. Bagbaguin Meycauayan Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:10:15', '2022-03-24 18:10:15'),
(421, 'Nakpil', 'Angelica', NULL, NULL, 5, 2, 'Marilao Bulacan Heritage Homes Lama Degato Blk 35 Lot 16', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:10:25', '2022-03-24 18:10:25'),
(422, 'Abalos', 'Charmie', NULL, NULL, 5, 2, 'Amva Housing Lamesa St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:10:37', '2022-03-24 18:10:37'),
(423, 'Abalos', 'Charlie', NULL, NULL, 5, 0, 'Amva Housing Lamesa St. Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:10:45', '2022-03-24 18:10:45'),
(424, 'Caliguid', 'Shane Steve', NULL, NULL, 5, 0, 'Bldg 6 Unit 304 Amva Housing Lamesa St. Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:10:54', '2022-03-24 18:10:54'),
(425, 'Gallardo', 'Richard', NULL, NULL, 5, 0, 'Bldg 11 Unit 207 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:11:02', '2022-03-24 18:11:02'),
(426, 'Arroyo', 'Axcel Lloyd', NULL, NULL, 5, 0, 'Unit 312 Bldg. Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:11:10', '2022-03-24 18:11:10'),
(427, 'Guttierez', 'Paul David', NULL, NULL, 5, 0, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:11:20', '2022-03-24 18:11:20'),
(428, 'Villa', 'Mary Grace', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:11:29', '2022-03-24 18:11:29'),
(429, 'Guiruela', 'Camille', NULL, NULL, 5, 2, 'Blg. 209 Disciplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:12:08', '2022-03-24 18:12:08'),
(430, 'Villa', 'Mary Claire', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:12:16', '2022-03-24 18:12:16'),
(431, 'Novesio', 'Aica', NULL, NULL, 5, 2, 'Bldg.11 Unit 306 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:12:30', '2022-03-24 18:12:30'),
(432, 'Lucero', 'Jhon Christoper', NULL, NULL, 5, 0, 'Lot 8 Block 6 A. Trinidad Village St. John St. Talipapa Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:12:42', '2022-03-24 18:12:42'),
(433, 'Lopez', 'Rein Justine', NULL, NULL, 5, 0, 'Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:12:52', '2022-03-24 18:12:52'),
(434, 'Bravo', 'Clarise', NULL, NULL, 5, 2, 'T.H. Dela Cruz', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:13:02', '2022-03-24 18:13:02'),
(435, 'Mahipos', 'Zemyrah Ann', NULL, NULL, 5, 2, '4091 Que Grande Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:13:17', '2022-03-24 18:13:17'),
(436, 'Bondoc', 'Camille', NULL, NULL, 5, 2, '26 2nd St. Sitio Evergreen Brgy Pasong Tamo Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:13:28', '2022-03-24 18:13:28'),
(437, 'Llantos', 'Kristine Claire', NULL, NULL, 5, 2, 'Tulay Kawayan Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:13:55', '2022-03-24 18:13:55'),
(438, 'Castor', 'Gloria', NULL, NULL, 5, 3, 'Bldg 30 Unit 10 Disiplina Village Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:14:05', '2022-03-24 18:14:05'),
(439, 'Ocampo', 'Joshua Matthew', NULL, NULL, 5, 0, 'Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:14:13', '2022-03-24 18:14:13'),
(440, 'Serrano', 'Jinky', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:14:23', '2022-03-24 18:14:23'),
(441, 'Ching', 'Esmeralda', NULL, NULL, 5, 3, '505 Carreon Compound Quirino Hi-Way Brgy. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:14:33', '2022-03-24 18:14:33'),
(442, 'Bravo', 'Clarine', NULL, NULL, 5, 2, 'T.H. Dela Cruz', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:14:42', '2022-03-24 18:14:42'),
(443, 'Guillermo', 'Christian Jay', NULL, NULL, 5, 0, 'Road 1 Gsis Lot 23 Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:14:50', '2022-03-24 18:14:50'),
(444, 'Terrado', 'Trina', NULL, NULL, 5, 2, 'C5 Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:14:59', '2022-03-24 18:14:59'),
(445, 'Lojica', 'Owen Wilson', NULL, NULL, 5, 0, '12 Rh Dela Cruz Talipapa Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:15:07', '2022-03-24 18:15:07'),
(446, 'Austria', 'Ma. Cecilia', NULL, NULL, 5, 2, 'Del Mundo St. Talipapa Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:15:17', '2022-03-24 18:15:17'),
(447, 'Bruan', 'Arlyn', NULL, NULL, 5, 3, '32 Urbano St. Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:15:32', '2022-03-24 18:15:32'),
(448, 'Tamares', 'Jayanne', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:15:42', '2022-03-24 18:15:42'),
(449, 'Labaco', 'Von Paulo', NULL, NULL, 5, 0, 'Apollo St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:15:52', '2022-03-24 18:15:52'),
(450, 'Tamares', 'Jonel Jr.', NULL, NULL, 5, 0, 'Bldg. 11 Unit 212 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:16:09', '2022-03-24 18:16:09'),
(451, 'Vicente', 'Roger', NULL, NULL, 5, 1, 'Deca Homes Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:16:18', '2022-03-24 18:16:18'),
(452, 'Vicente', 'Cassandra', NULL, NULL, 5, 2, 'B8 Lot 17 Spruce St. Urban Deca Homes  Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:16:36', '2022-03-24 18:16:36'),
(453, 'Besahan', 'Jovelyn', NULL, NULL, 5, 3, '10 B Howmart Rd. Brgy Apolonio Samson Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:16:46', '2022-03-24 18:16:46'),
(454, 'Manuel', 'Joilyn', NULL, NULL, 5, 3, 'Mc Arthur Hiway Binang First Bucaue Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:16:55', '2022-03-24 18:16:55'),
(455, 'Lampasa', 'Jhazmine', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:17:08', '2022-03-24 18:17:08'),
(456, 'Curammeng', 'Julius Exekiel', NULL, NULL, 5, 0, 'Lamesa St. Amva Housing Bldg.23 Unit 213 Ugong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:17:19', '2022-03-24 18:17:19'),
(457, 'Hilario', 'Squall Leonhart', NULL, NULL, 5, 0, '#7 Milagrosa St. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:17:26', '2022-03-24 18:17:26'),
(458, 'Apad', 'Ashley', NULL, NULL, 5, 2, '12 Th Dela Cruz St. Villilia Vill. Talipapa Novaliches Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:17:35', '2022-03-24 18:17:35'),
(459, 'Baldemor', 'Cassandra', NULL, NULL, 5, 2, '12 Th Dela Cruz Villilia Village Talipapa. Q.C.', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:17:44', '2022-03-24 18:17:44'),
(460, 'Ancheta', 'Romelyn', NULL, NULL, 5, 2, 'Bldg 7 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:17:53', '2022-03-24 18:17:53'),
(461, 'Pelayo', 'Mariafe', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:18:05', '2022-03-24 18:18:05'),
(462, 'Fuentes', 'Ashley', NULL, NULL, 5, 2, 'Bldg 3 Unit 204 Disiplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:18:14', '2022-03-24 18:18:14'),
(463, 'Lugue', 'Jasper', NULL, NULL, 5, 0, '#701-A Rivera Compd. Silver St. Rockville Subd. San Bartolome, Nova. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:18:22', '2022-03-24 18:18:22'),
(464, 'Lugue', 'Reynaldo', NULL, NULL, 5, 1, '#701-A Rivera Compd. Silver St. Rockville Subd. San Bartolome, Nova. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:18:32', '2022-03-24 18:18:32'),
(465, 'Lugue', 'Susan', NULL, NULL, 5, 3, '#701-A Rivera Compd. Silver St. Rockville Subd. San Bartolome, Nova. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:18:41', '2022-03-24 18:18:41'),
(466, 'Lumangtad', 'Honeylyn', NULL, NULL, 5, 2, '177 Area B Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:18:50', '2022-03-24 18:18:50'),
(467, 'Borlagdan', 'Enrique', NULL, NULL, 5, 0, 'Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:18:58', '2022-03-24 18:18:58'),
(468, 'Abrera', 'Jelian Ashley', NULL, NULL, 5, 2, '415 Drc Com Talipapa Nov. Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:19:08', '2022-03-24 18:19:08'),
(469, 'Lumangtad', 'Acelle', NULL, NULL, 5, 0, '117 Npc Area B Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:19:16', '2022-03-24 18:19:16'),
(470, 'Bondoc', 'Jennylyn', NULL, NULL, 5, 2, '26 2nd St. Sitio Evergreen Brgy Pasong Tamo Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:19:29', '2022-03-24 18:19:29'),
(471, 'Badlong', 'Dhenniz', NULL, NULL, 5, 2, 'Gloria 5 Dulo Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:19:38', '2022-03-24 18:19:38'),
(472, 'Torres', 'Carmela', NULL, NULL, 5, 2, 'Sauyo Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:20:01', '2022-03-24 18:20:01'),
(473, 'Badlong', 'Alexis', NULL, NULL, 5, 2, 'Gloria 5 Dulo Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:20:15', '2022-03-24 18:20:15'),
(474, 'Buscagan', 'Angel', NULL, NULL, 5, 2, 'Bldg 8 Unit 102 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:20:25', '2022-03-24 18:20:25'),
(475, 'Tugnao', 'Marinel', NULL, NULL, 5, 2, 'Gloria 5 Dulo Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:20:34', '2022-03-24 18:20:34'),
(476, 'Sumatra', 'Claudine', NULL, NULL, 5, 2, 'Bldg 8 Unit 108 Disiplina Vill. Brgy. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:20:44', '2022-03-24 18:20:44'),
(477, 'Delos Santos', 'Jessil', NULL, NULL, 5, 2, 'Estrella Comp. 164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:20:53', '2022-03-24 18:20:53'),
(478, 'Anocop', 'Cristina', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:21:04', '2022-03-24 18:21:04'),
(479, 'Inot', 'Angieli Grace', NULL, NULL, 5, 3, '161 Road 1 Bagong Pag-Asa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:21:16', '2022-03-24 18:21:16'),
(480, 'Aballa', 'Alexsa Mariel', NULL, NULL, 5, 2, 'Rumhai Lamesa St. Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:21:27', '2022-03-24 18:21:27'),
(481, 'Inot', 'Joselito', NULL, NULL, 5, 1, '161 Road 1 Bagong Pag-Asa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:21:38', '2022-03-24 18:21:38'),
(482, 'Bande', 'Vanessa', NULL, NULL, 5, 2, '#35 Unit 10 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:21:47', '2022-03-24 18:21:47'),
(483, 'Consolacion', 'Jheaniel', NULL, NULL, 5, 2, '2730 Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:21:56', '2022-03-24 18:21:56'),
(484, 'Garcia', 'Antoniete Rose', NULL, NULL, 5, 2, 'Bldg 22 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:22:05', '2022-03-24 18:22:05'),
(485, 'Fabiosa', 'Maricel', NULL, NULL, 5, 2, 'Bldg.13 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:22:37', '2022-03-24 18:22:37'),
(486, 'Esco', 'Lailanie', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:22:47', '2022-03-24 18:22:47'),
(487, 'Dialino', 'Jesha Nicole', NULL, NULL, 5, 2, 'Bldg. 24 Unit 15 Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:22:55', '2022-03-24 18:22:55'),
(488, 'Esco', 'Lalaine', NULL, NULL, 5, 2, 'Bldg 34 Unit 2 Disiplina Village Igong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:23:06', '2022-03-24 18:23:06'),
(489, 'Manaog', 'Kimberly', NULL, NULL, 5, 2, 'Amva Housing Lamesa St. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:23:15', '2022-03-24 18:23:15'),
(490, 'Dantes', 'Robin James', NULL, NULL, 5, 0, '#7 Milagrosa St. Villa Sabina Subd. Talipapa Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:23:24', '2022-03-24 18:23:24'),
(491, 'Labaco', 'Lea Mie', NULL, NULL, 5, 2, 'Apollo St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:23:33', '2022-03-24 18:23:33'),
(492, 'Gacilos', 'Erica', NULL, NULL, 5, 2, 'Sangandaan P. Rivera St.', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:23:42', '2022-03-24 18:23:42'),
(493, 'Galang', 'Romy', NULL, NULL, 5, 1, 'Blk 8 Lot 25 St. Abangan Sur Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:23:50', '2022-03-24 18:23:50'),
(494, 'Manuel', 'Liza', NULL, NULL, 5, 3, 'Blk 8 Lot 25 St. Abangan Sur Marilao Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:24:00', '2022-03-24 18:24:00'),
(495, 'Manuel', 'Ronaldo', NULL, NULL, 5, 1, 'Mc Arthur Hiway Binang First Bucaue Bulacan', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:24:08', '2022-03-24 18:24:08'),
(496, 'Montecalvo', 'Jemalyn', NULL, NULL, 5, 2, 'Estrella Comp. 164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:24:19', '2022-03-24 18:24:19'),
(497, 'Maras', 'Ronilyn', NULL, NULL, 5, 2, 'Shella Comp. Rd.7', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:24:28', '2022-03-24 18:24:28'),
(498, 'Camato', 'Christine Joy', NULL, NULL, 5, 2, 'Estrella Comp. 164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:24:40', '2022-03-24 18:24:40'),
(499, 'Montecalvo', 'Jamaica', NULL, NULL, 5, 2, 'Estrella Comp. 164 Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:24:51', '2022-03-24 18:24:51'),
(500, 'Taying', 'Laika', NULL, NULL, 5, 2, 'Estrella Compound Tulay Kawayan Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:25:03', '2022-03-24 18:25:03'),
(501, 'Valera', 'Ron Andrei', NULL, NULL, 5, 0, '14h Bisugo St. Cadaing Village Talipapa Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:25:12', '2022-03-24 18:25:12'),
(502, 'Francisco', 'Bryan', NULL, NULL, 5, 0, '135 Sitio Gulod Brgy. Sauyo Novaliches Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:25:21', '2022-03-24 18:25:21'),
(503, 'Manalang', 'Cielo', NULL, NULL, 5, 2, '4213 Dahlia St. Barrios Homes, Ugong, Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:25:32', '2022-03-24 18:25:32'),
(504, 'Francisco', 'Louieje', NULL, NULL, 5, 0, '415 Drc Compound Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:25:41', '2022-03-24 18:25:41'),
(505, 'Esco', 'Laarni', NULL, NULL, 5, 2, 'Bldg 34 Unit 2 Disiplina Village Igong Val. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:26:01', '2022-03-24 18:26:01'),
(506, 'Abrera', 'Louie', NULL, NULL, 5, 1, 'Drc Compound Brgy.Talipapa Qc.', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:26:12', '2022-03-24 18:26:12'),
(507, 'Gorgonio', 'Aileen', NULL, NULL, 5, 3, '36 Rd 5 Gsis Hills Subd. Talipapa Brgy 164 Cal. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:26:23', '2022-03-24 18:26:23'),
(508, 'Gallenero', 'Christine', NULL, NULL, 5, 2, 'Blk 7 Lot 10 Diamond St. Interville Subd. Brgy. Talipapa Cal. City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:26:32', '2022-03-24 18:26:32'),
(509, 'Go', 'Jade Daisyree', NULL, NULL, 5, 2, '36 Urbano St. Bagbag Novaliches Q.C', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:26:41', '2022-03-24 18:26:41'),
(510, 'Pascua', 'Glenda', NULL, NULL, 5, 2, 'Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:26:52', '2022-03-24 18:26:52'),
(511, 'Ramos', 'Patricia', NULL, NULL, 5, 2, '5264 Sampaguita St. Brgy. Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:27:03', '2022-03-24 18:27:03'),
(512, 'Aram', 'Glaiza Mae', NULL, NULL, 5, 2, 'Gloria 5 Dulo Talipapa Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:27:16', '2022-03-24 18:27:16'),
(513, 'De Leon', 'Jhenica', NULL, NULL, 5, 2, 'Disiplina Village Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:27:26', '2022-03-24 18:27:26'),
(514, 'Collado', 'Jennylyn', NULL, NULL, 5, 2, 'Bldg. 1 Unit 106 Disciplina Village Ugong Valenzuela', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:27:35', '2022-03-24 18:27:35'),
(515, 'Ching', 'Christine', NULL, NULL, 5, 2, '505 Carreon Compound Quirino Hi-Way Brgy. Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:27:44', '2022-03-24 18:27:44'),
(516, 'Guttan', 'Krizzy', NULL, NULL, 5, 2, '#29 Urbano St. Bagbag Novaliches Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:27:53', '2022-03-24 18:27:53'),
(517, 'Mijares', 'Charmie Joy', NULL, NULL, 5, 2, 'Rd. 11 Gsis Hills Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:28:04', '2022-03-24 18:28:04'),
(518, 'Miranda', 'Rea', NULL, NULL, 5, 2, '1252 Sta.Monica Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:28:15', '2022-03-24 18:28:15'),
(519, 'Mizuela', 'Precious', NULL, NULL, 5, 2, '4393 Npc St. Que Balag Ugong Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:28:26', '2022-03-24 18:28:26'),
(520, 'Otero', 'Angel', NULL, NULL, 5, 2, '36 Urbano Bagbag Novaliches Quezon City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:28:35', '2022-03-24 18:28:35'),
(521, 'Pacios', 'Elaine Joy', NULL, NULL, 5, 2, '719 Ma. Cristina St. Sampaloc Manila', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:28:43', '2022-03-24 18:28:43'),
(522, 'Torres', 'Glin', NULL, NULL, 5, 0, 'Npc Area A Talipapa Caloocan City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:28:53', '2022-03-24 18:28:53'),
(523, 'Barona', 'Avegail', NULL, NULL, 5, 2, 'Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:29:03', '2022-03-24 18:29:03'),
(524, 'Ecita', 'Hyralyn', NULL, NULL, 5, 2, '#94 M. Francisco St. Lingunan Valenzuela City', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:29:17', '2022-03-24 18:29:17'),
(525, 'Esclanda', 'Leonard', NULL, NULL, 5, 0, '415 Drc Compound Talipapa Qc', NULL, 0, 0, 0, 0, 0, '2022-03-24 18:29:25', '2022-03-24 18:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int(10) UNSIGNED DEFAULT NULL,
  `start` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timed` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(5, '2022_03_15_113732_create_disciples_table', 1),
(6, '2022_03_15_113803_create_events_table', 1),
(7, '2022_03_15_113827_create_attends_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Buster Huels MD', 'gusikowski.ernestine', 'superadmin', 'j3LDdGapAC', '2022-03-24 05:09:10', '2022-03-24 05:09:10'),
(2, 'Zena Balistreri', 'okoepp', 'superadmin', 's1hF3B5bp4', '2022-03-24 05:09:10', '2022-03-24 05:09:10'),
(3, 'Justen Smith', 'frederick60', 'superadmin', 'ImgSlDRaQ8', '2022-03-24 05:09:10', '2022-03-24 05:09:10'),
(4, 'Clare Stokes', 'arnaldo55', 'superadmin', 'tFPOTHYsoW', '2022-03-24 05:09:10', '2022-03-24 05:09:10'),
(5, 'Shanon Stamm', 'shanie.stanton', 'superadmin', '1nvt8RPBqr', '2022-03-24 05:09:10', '2022-03-24 05:09:10'),
(6, 'Immanuel Berge', 'jamaal.howe', 'superadmin', 'mPWb1huspo', '2022-03-24 05:09:10', '2022-03-24 05:09:10'),
(7, 'Willard Luettgen', 'clementina.klein', 'superadmin', 'Ei2SzFvc01', '2022-03-24 05:09:10', '2022-03-24 05:09:10'),
(8, 'Aditya Beer', 'ephraim49', 'superadmin', 'fHQLqxfSeL', '2022-03-24 05:09:10', '2022-03-24 05:09:10'),
(9, 'Jovany Bradtke', 'herman.maxine', 'superadmin', 'MGWZAyn6PY', '2022-03-24 05:09:10', '2022-03-24 05:09:10'),
(10, 'Lacey Stiedemann', 'tia.denesik', 'superadmin', 'qhiUHfok0n', '2022-03-24 05:09:10', '2022-03-24 05:09:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attends`
--
ALTER TABLE `attends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attends_disciple_id_foreign` (`disciple_id`),
  ADD KEY `attends_event_id_foreign` (`event_id`);

--
-- Indexes for table `disciples`
--
ALTER TABLE `disciples`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_creator_id_foreign` (`creator_id`);

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
  ADD KEY `password_resets_username_index` (`username`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attends`
--
ALTER TABLE `attends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disciples`
--
ALTER TABLE `disciples`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=526;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attends`
--
ALTER TABLE `attends`
  ADD CONSTRAINT `attends_disciple_id_foreign` FOREIGN KEY (`disciple_id`) REFERENCES `disciples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attends_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
