-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2024 at 06:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mohe_finance_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `budget_approveds`
--

CREATE TABLE `budget_approveds` (
  `id` int(11) NOT NULL,
  `code_object_2` varchar(10) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_approveds`
--

INSERT INTO `budget_approveds` (`id`, `code_object_2`, `budget_plan_id`, `amount`, `remarks`, `user_id`, `is_finalized`, `created_at`, `updated_at`) VALUES
(1, '21', 1, 90000, 'jhjkhkh', 1, 0, '2024-07-13 23:49:37', '2024-11-03 00:12:25'),
(2, '22', 1, 80000, 'tycytcytc', 1, 0, '2024-07-13 23:49:37', '2024-11-03 00:12:25'),
(3, '23', 1, 700000, 'vcytg', 1, 0, '2024-07-13 23:49:38', '2024-11-03 00:12:25'),
(4, '24', 1, 78899, 'vghvg', 1, 0, '2024-07-13 23:49:38', '2024-11-03 00:12:25'),
(5, '25', 1, 7699900, 'hjvgvgexsdr', 1, 0, '2024-07-13 23:49:38', '2024-11-03 00:12:25'),
(6, '21', 6, NULL, NULL, 1, 0, '2024-09-16 05:06:53', '2024-09-16 05:06:53'),
(7, '22', 6, NULL, NULL, 1, 0, '2024-09-16 05:06:53', '2024-09-16 05:06:53'),
(8, '23', 6, NULL, NULL, 1, 0, '2024-09-16 05:06:53', '2024-09-16 05:06:53'),
(9, '24', 6, NULL, NULL, 1, 0, '2024-09-16 05:06:53', '2024-09-16 05:06:53'),
(10, '25', 6, NULL, NULL, 1, 1, '2024-09-16 05:06:53', '2024-09-16 05:06:53');

-- --------------------------------------------------------

--
-- Table structure for table `budget_approved_b10_transfers`
--

CREATE TABLE `budget_approved_b10_transfers` (
  `id` int(11) NOT NULL,
  `budget_approved_distributions_b10_id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `code_org_3` varchar(3) NOT NULL,
  `code_project_6` varchar(6) NOT NULL,
  `code_program_3` varchar(3) NOT NULL,
  `code_fund_4` varchar(4) NOT NULL,
  `code_loaction` varchar(2) NOT NULL,
  `code_object_2` varchar(2) NOT NULL,
  `dr` double DEFAULT 0 COMMENT 'transfered amount to b10 from external source',
  `cr` double DEFAULT 0 COMMENT 'transfered amount to external source from b10',
  `afmis_reg_no` varchar(55) DEFAULT NULL,
  `sending_no` varchar(55) DEFAULT NULL,
  `sending_date` date DEFAULT NULL,
  `needs_in_letters` text DEFAULT NULL,
  `prescription_gnrl_drctr` text DEFAULT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_approved_b10_transfers`
--

INSERT INTO `budget_approved_b10_transfers` (`id`, `budget_approved_distributions_b10_id`, `budget_plan_id`, `code_org_3`, `code_project_6`, `code_program_3`, `code_fund_4`, `code_loaction`, `code_object_2`, `dr`, `cr`, `afmis_reg_no`, `sending_no`, `sending_date`, `needs_in_letters`, `prescription_gnrl_drctr`, `is_finalized`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 32, 1, '129', '00000', '281', '2000', '1', '21', 0, 10, 'BV23232', '33323', '2024-08-04', 'needs in leeters', 'prescription ', 1, 1, '2024-08-04 05:34:24', '2024-11-03 01:41:22'),
(2, 32, 1, '129', '00000', '281', '2000', '1', '21', 0, 90, 'MN3323', '3322', '2024-08-14', 'needs in letters', 'prescrtion 2', 1, 1, '2024-08-04 05:36:58', '2024-11-03 01:41:22'),
(3, 32, 1, '129', '00000', '281', '2000', '2', '22', 0, 200, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-08-05 04:44:33', '2024-11-03 01:41:22'),
(4, 32, 1, '129', '00000', '281', '2000', '1', '21', 0, 100, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-08-05 04:47:44', '2024-11-03 01:41:22'),
(5, 32, 1, '129', '00000', '281', '2000', '1', '22', 0, 100, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-08-05 04:49:44', '2024-11-03 01:41:22'),
(6, 32, 1, '129', '00000', '281', '2000', '1', '21', 0, 100, 'VBVHU', '899898', '2024-01-01', 'kljlhgfutc', 'hjggy878', 1, 1, '2024-08-05 04:54:14', '2024-11-03 01:41:22'),
(7, 10, 1, '128', '00000', '281', '2000', '9', '23', 0, 900, 'MMO', '88', '2024-09-01', 'hkhhhhhhhhhhhhhhhhhhhhhh', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', 1, 1, '2024-08-11 05:00:50', '2024-11-03 01:41:22'),
(8, 34, 1, '128', '33333', '281', '2000', '3', '22', 9000, 0, '99nnkjnjk', '999', '2024-01-01', 'hhjhkj', 'hszzszz', 1, 1, '2024-08-11 05:15:00', '2024-11-03 01:41:22'),
(9, 35, 1, '128', '00000', '284', '2000', '6', '25', 2000, 0, 'BM40', '80', '2024-01-01', 'new', 'new', 1, 1, '2024-08-11 05:43:20', '2024-11-03 01:41:22'),
(10, 36, 1, '129', '11111', '284', '2000', '1', '21', 90000, 0, '88888', '8888888', '2024-01-01', '88888888', '8888888', 1, 1, '2024-08-11 05:51:40', '2024-11-03 01:41:22'),
(11, 32, 1, '129', '00000', '281', '2000', '2', '21', 900, 0, 'bbb55', '8989', '2024-08-16', 'kjhkjhkjbbk', 'hbkjhkhkjhjk', 1, 1, '2024-08-17 04:44:49', '2024-11-03 01:41:22'),
(12, 10, 1, '129', '00000', '282', '2000', '1', '21', 20000, 0, 'B4434', '434', '2024-08-24', 'dfgdgf', 'fgdgfdgf', 1, 1, '2024-08-24 10:33:39', '2024-11-03 01:41:22'),
(13, 30, 1, '129', '11111', '281', '1000', '1', '21', 0, 900, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-09-07 05:33:47', '2024-11-03 01:41:22'),
(14, 30, 1, '129', '11111', '281', '1000', '1', '21', 0, 900, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-09-07 05:33:56', '2024-11-03 01:41:22'),
(15, 39, 1, '129', '00000', '281', '1000', '1', '21', 0, 200, 'Bhjhjh', '7878', '2024-01-01', 'hkjhjk', 'hjkhkj', 1, 1, '2024-09-07 07:09:29', '2024-11-03 01:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `budget_approved_b20_transfers2`
--

CREATE TABLE `budget_approved_b20_transfers2` (
  `id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `frm_type` varchar(12) NOT NULL,
  `budget_approved_b20_row_id` int(11) NOT NULL,
  `code_org_4` int(11) NOT NULL,
  `code_project_6` varchar(11) NOT NULL,
  `code_program_3` int(11) NOT NULL,
  `code_fund_4` varchar(12) NOT NULL,
  `code_loaction` int(11) NOT NULL,
  `code_cate_1` int(11) NOT NULL,
  `code_object_2` int(11) NOT NULL,
  `from_month` varchar(10) NOT NULL,
  `to_month` varchar(10) NOT NULL,
  `dr` double NOT NULL,
  `cr` double NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `afmis_reg_no` varchar(55) DEFAULT NULL,
  `sending_no` varchar(55) DEFAULT NULL,
  `sending_date` date DEFAULT NULL,
  `needs_in_letters` text DEFAULT NULL,
  `prescription_gnrl_drctr` text DEFAULT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_approved_b20_transfers2`
--

INSERT INTO `budget_approved_b20_transfers2` (`id`, `budget_plan_id`, `frm_type`, `budget_approved_b20_row_id`, `code_org_4`, `code_project_6`, `code_program_3`, `code_fund_4`, `code_loaction`, `code_cate_1`, `code_object_2`, `from_month`, `to_month`, `dr`, `cr`, `user_id`, `afmis_reg_no`, `sending_no`, `sending_date`, `needs_in_letters`, `prescription_gnrl_drctr`, `is_finalized`, `created_at`, `updated_at`) VALUES
(3, 1, 'month', 15, 12800, '00000', 281, '2000', 2, 0, 21, 'm_1', 'm_1', 50, 0, 1, 'bbb55', '900', '2024-01-01', 'kkkk', 'kkkk', 0, '2024-08-17 05:22:52', '2024-11-03 01:48:44'),
(4, 1, 'month', 15, 12800, '00000', 282, '2000', 1, 0, 21, 'm_2', 'm_3', 100, 0, 1, '8989', '8989', '2024-01-01', 'jkhjk', 'jhkj', 0, '2024-09-07 07:36:28', '2024-11-03 01:48:44'),
(5, 1, 'month', 12, 12801, '00000', 281, '2000', 2, 0, 21, 'm_1', 'm_1', 50, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-09-15 07:03:32', '2024-11-03 01:48:44'),
(6, 1, 'month', 12, 12801, '00000', 281, '2000', 3, 0, 21, 'm_1', 'm_1', 2, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-09-15 07:05:10', '2024-11-03 01:48:44'),
(7, 1, 'month', 12, 12801, '00000', 281, '2000', 4, 0, 21, 'm_1', 'm_1', 5, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-09-15 07:07:27', '2024-11-03 01:48:44'),
(9, 1, 'primary', 12, 12801, '00000', 281, '2000', 2, 0, 21, 'm_1', 'm_1', 100, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-09-15 09:43:34', '2024-11-03 01:48:44'),
(10, 1, 'category', 12, 12801, '00000', 281, '2000', 1, 1, 21, 'm_1', 'm_1', 100, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-09-15 09:47:33', '2024-11-03 01:48:44'),
(11, 1, 'month', 12, 12801, '00000', 281, '2000', 1, 0, 21, 'm_1', 'm_2', 100, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-09-16 06:38:13', '2024-11-03 01:48:44');

-- --------------------------------------------------------

--
-- Table structure for table `budget_approved_distributions`
--

CREATE TABLE `budget_approved_distributions` (
  `id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `code_org_4` int(11) NOT NULL,
  `code_project_6` varchar(55) NOT NULL,
  `code_program_3` int(11) NOT NULL,
  `code_fund_4` int(11) NOT NULL,
  `code_loaction` int(11) NOT NULL,
  `code_cate_1` int(11) NOT NULL,
  `code_object_2` int(11) NOT NULL,
  `m_1` int(11) NOT NULL,
  `m_2` int(11) NOT NULL,
  `m_3` int(11) NOT NULL,
  `m_4` int(11) NOT NULL,
  `m_5` int(11) NOT NULL,
  `m_6` int(11) NOT NULL,
  `m_7` int(11) NOT NULL,
  `m_8` int(11) NOT NULL,
  `m_9` int(11) NOT NULL,
  `m_10` int(11) NOT NULL,
  `m_11` int(11) NOT NULL,
  `m_12` int(11) NOT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='B20_details';

--
-- Dumping data for table `budget_approved_distributions`
--

INSERT INTO `budget_approved_distributions` (`id`, `budget_plan_id`, `code_org_4`, `code_project_6`, `code_program_3`, `code_fund_4`, `code_loaction`, `code_cate_1`, `code_object_2`, `m_1`, `m_2`, `m_3`, `m_4`, `m_5`, `m_6`, `m_7`, `m_8`, `m_9`, `m_10`, `m_11`, `m_12`, `is_finalized`, `user_id`, `created_at`, `updated_at`) VALUES
(12, 1, 12801, '00000', 281, 2000, 1, 0, 21, 200, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-07-29 04:59:40', '2024-10-28 02:33:03'),
(15, 1, 12800, '00000', 282, 2000, 1, 0, 21, 100, 400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-07-29 06:16:59', '2024-10-28 02:33:03'),
(17, 1, 12801, '00000', 281, 2000, 3, 0, 21, 6999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-08-24 10:30:26', '2024-10-28 02:33:03'),
(18, 1, 12800, '00000', 281, 2000, 3, 0, 21, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-09-07 06:43:18', '2024-10-28 02:33:03'),
(19, 1, 12800, '280326', 281, 2000, 2, 1, 22, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-10-12 10:11:24', '2024-10-28 02:33:03'),
(20, 1, 12801, '280326', 281, 2000, 2, 1, 22, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-10-12 10:13:12', '2024-10-28 02:33:03');

-- --------------------------------------------------------

--
-- Table structure for table `budget_approved_distributions_b10`
--

CREATE TABLE `budget_approved_distributions_b10` (
  `id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `code_org_3` int(11) NOT NULL,
  `code_project_6` varchar(55) NOT NULL,
  `code_program_3` int(11) NOT NULL,
  `code_fund_4` int(11) NOT NULL,
  `code_loaction` int(11) NOT NULL,
  `code_object_2` int(11) NOT NULL,
  `amount` double DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='B20_details';

--
-- Dumping data for table `budget_approved_distributions_b10`
--

INSERT INTO `budget_approved_distributions_b10` (`id`, `budget_plan_id`, `code_org_3`, `code_project_6`, `code_program_3`, `code_fund_4`, `code_loaction`, `code_object_2`, `amount`, `user_id`, `is_finalized`, `created_at`, `updated_at`) VALUES
(3, 1, 128, '00000', 281, 2000, 1, 22, 100, 1, 0, '2024-07-16 07:02:34', '2024-10-29 11:27:12'),
(10, 1, 128, '00000', 281, 2000, 1, 21, 0, 1, 0, '2024-07-20 05:05:10', '2024-10-29 11:27:12'),
(11, 1, 128, '22222', 282, 2000, 3, 22, 50, 1, 0, '2024-07-20 10:39:47', '2024-10-29 11:27:12'),
(12, 1, 128, '00000', 281, 2000, 4, 21, 9000, 1, 0, '2024-07-22 04:22:56', '2024-10-29 11:27:12'),
(13, 1, 128, '11111', 281, 2000, 4, 21, 9000, 1, 0, '2024-07-22 04:24:47', '2024-10-29 11:27:12'),
(14, 1, 128, '00000', 281, 2000, 1, 23, 0, 1, 0, '2024-07-22 04:25:38', '2024-10-29 11:27:12'),
(15, 1, 128, '00000', 281, 2000, 1, 24, 1000, 1, 0, '2024-07-22 04:34:51', '2024-10-29 11:27:12'),
(16, 1, 128, '00000', 281, 2000, 1, 25, 1000, 1, 0, '2024-07-22 04:35:35', '2024-10-29 11:27:12'),
(19, 1, 128, '00000', 282, 2000, 1, 22, 0, 1, 0, '2024-07-22 06:07:04', '2024-10-29 11:27:12'),
(20, 1, 128, '22222', 282, 2000, 3, 24, 0, 1, 0, '2024-07-22 06:07:09', '2024-10-29 11:27:12'),
(21, 1, 128, '22222', 282, 2000, 3, 23, 900, 1, 0, '2024-07-22 06:07:12', '2024-10-29 11:27:12'),
(22, 1, 128, '22222', 282, 2000, 3, 25, 0, 1, 0, '2024-07-22 06:07:25', '2024-10-29 11:27:12'),
(23, 1, 128, '00000', 281, 2000, 4, 25, 800, 1, 0, '2024-07-22 06:07:43', '2024-10-29 11:27:12'),
(24, 1, 128, '00000', 281, 2000, 4, 22, 850, 1, 0, '2024-07-22 06:07:59', '2024-10-29 11:27:12'),
(25, 2, 128, '00000', 281, 2000, 1, 21, 1000, 1, 0, '2024-07-22 06:12:57', '2024-07-22 06:12:57'),
(26, 2, 128, '00000', 281, 2000, 1, 23, 90, 1, 0, '2024-07-22 06:14:55', '2024-07-22 01:45:02'),
(27, 2, 128, '00000', 281, 2000, 1, 25, 0, 1, 0, '2024-07-22 06:15:47', '2024-07-22 01:45:49'),
(28, 2, 128, '00000', 281, 2000, 1, 22, 200, 1, 0, '2024-07-22 06:16:08', '2024-07-22 06:16:08'),
(29, 2, 128, '00000', 281, 2000, 1, 24, 980, 1, 0, '2024-07-22 06:16:17', '2024-07-22 01:46:23'),
(30, 1, 128, '22222', 282, 2000, 3, 21, 10001, 1, 0, '2024-07-25 04:26:32', '2024-10-29 11:27:12'),
(31, 1, 128, '00000', 281, 2000, 8, 21, 2800, 1, 0, '2024-07-25 04:39:54', '2024-10-29 11:27:12'),
(32, 1, 128, '00000', 282, 2000, 1, 21, 500, 1, 0, '2024-07-25 04:47:41', '2024-10-29 11:27:12'),
(33, 1, 128, '00000', 282, 2000, 1, 25, 0, 1, 0, '2024-08-07 10:19:00', '2024-10-29 11:27:12'),
(34, 1, 128, '33333', 281, 2000, 3, 22, 0, 1, 0, '2024-08-11 05:15:00', '2024-10-29 11:27:12'),
(35, 1, 128, '00000', 284, 2000, 6, 25, 0, 1, 0, '2024-08-11 05:43:20', '2024-10-29 11:27:12'),
(36, 1, 128, '11111', 281, 2000, 3, 23, 90, 1, 0, '2024-08-11 05:51:40', '2024-10-29 11:27:12'),
(37, 1, 128, '00000', 282, 2000, 4, 21, 1500, 1, 0, '2024-08-17 04:37:25', '2024-10-29 11:27:12'),
(38, 1, 128, '00000', 281, 2000, 3, 21, 56999, 1, 0, '2024-08-24 10:22:50', '2024-10-29 11:27:12'),
(40, 1, 128, '00000', 282, 2000, 1, 23, 100, 1, 0, '2024-09-07 06:27:10', '2024-10-29 11:27:12'),
(41, 1, 128, '00000', 281, 1000, 1, 24, 0, 1, 0, '2024-09-29 06:07:35', '2024-10-29 11:27:12'),
(42, 1, 128, '000000', 281, 1000, 1, 21, 0, 1, 0, '2024-10-23 10:34:58', '2024-10-29 11:27:12'),
(43, 1, 129, '011111', 282, 1000, 1, 21, -100, 1, 0, '2024-10-23 10:41:56', '2024-10-29 11:27:12'),
(44, 1, 128, '000000', 281, 1000, 1, 22, 2000, 1, 0, '2024-10-24 05:41:38', '2024-10-29 11:27:12'),
(45, 1, 128, '022222', 281, 1000, 1, 22, 2000, 1, 0, '2024-10-24 05:42:15', '2024-10-29 11:27:12'),
(46, 1, 128, '033333', 282, 1000, 1, 22, 900, 1, 0, '2024-10-24 05:44:02', '2024-10-29 11:27:12'),
(47, 1, 128, '033333', 282, 1000, 1, 21, 0, 1, 0, '2024-10-24 05:44:17', '2024-10-29 11:27:12'),
(48, 1, 128, '033333', 282, 1000, 1, 23, 900, 1, 0, '2024-10-24 05:44:32', '2024-10-29 11:27:12'),
(49, 1, 128, '022503', 282, 1000, 2, 22, 8100, 1, 0, '2024-10-24 05:46:48', '2024-10-29 11:27:12'),
(50, 1, 128, '280326', 281, 1000, 1, 22, 1200, 1, 0, '2024-10-24 05:50:50', '2024-10-29 11:27:12'),
(51, 1, 128, '280326', 281, 1000, 1, 23, 900, 1, 0, '2024-10-24 05:51:11', '2024-10-29 11:27:12'),
(52, 1, 128, '00000', 281, 1000, 1, 22, 10, 1, 0, '2024-10-24 05:54:01', '2024-10-29 11:27:12'),
(53, 1, 128, '000000', 284, 1000, 3, 22, 100, 1, 0, '2024-10-24 05:54:26', '2024-10-29 11:27:12'),
(54, 1, 128, '000000', 283, 1000, 7, 23, 900, 1, 0, '2024-10-26 06:23:47', '2024-10-29 11:27:12'),
(55, 1, 129, '000000', 283, 1000, 7, 23, 80, 1, 0, '2024-10-26 06:26:04', '2024-10-29 11:27:12'),
(56, 1, 128, '011111', 282, 1000, 3, 22, 900, 1, 0, '2024-10-26 06:27:59', '2024-10-29 11:27:12'),
(57, 1, 128, '000000', 281, 1000, 1, 24, 0, 1, 0, '2024-10-27 04:56:19', '2024-10-29 11:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `budget_dev_approveds`
--

CREATE TABLE `budget_dev_approveds` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `project_name` text DEFAULT NULL,
  `year` varchar(55) DEFAULT NULL,
  `doner_id` int(11) DEFAULT NULL,
  `is_intentional` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'ikhtyaree or ghir ikhtyaree',
  `employees_count` int(11) DEFAULT 0,
  `budget_amount` double DEFAULT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_dev_approveds`
--

INSERT INTO `budget_dev_approveds` (`id`, `code`, `budget_plan_id`, `project_name`, `year`, `doner_id`, `is_intentional`, `employees_count`, `budget_amount`, `is_finalized`, `user_id`, `created_at`, `updated_at`) VALUES
(2, '89891', 1, '89892', '1403-7-16', 1, 1, 8989, 8989, 0, 1, '2024-10-11 02:06:25', '2024-10-30 06:31:40'),
(3, '89892', 1, '8989', '1403-7-10', 1, 1, 8989, 8989, 0, 1, '2024-10-11 02:07:06', '2024-10-30 06:31:40'),
(4, '2080222', 1, 'testing', '1403-7-24', 1, 1, 7878, 787878, 0, 1, '2024-10-11 02:08:43', '2024-10-30 06:31:40'),
(10, '280326', 1, 'معاشات اساتید و کارمندان مصروف تحصیل در داخل و خارج از کشور', '1403-7-20', 1, 1, 0, 450000000, 0, 1, '2024-10-11 02:20:21', '2024-10-30 06:31:40'),
(11, '280326', 1, 'د پروژی نوم', '1403-7-20', 1, 1, 89, 450000000, 0, 1, '2024-10-11 07:37:45', '2024-10-30 06:31:40'),
(12, '280326', 1, 'امتحانی پروژه', '1403-7-30', 1, 1, 0, 450000000, 0, 1, '2024-10-11 07:39:43', '2024-10-30 06:31:40'),
(13, '280326', 1, 'معاشات اساتید و کارمندان مصروف تحصیل در داخل و خارج از کشور', '1403-8-6', 1, 1, 0, 450000000, 0, 1, '2024-10-27 00:51:04', '2024-10-30 06:31:40');

-- --------------------------------------------------------

--
-- Table structure for table `budget_dev_b3`
--

CREATE TABLE `budget_dev_b3` (
  `id` int(11) NOT NULL,
  `code_org_3` varchar(4) NOT NULL,
  `code_project_6` varchar(7) NOT NULL,
  `code_program_3` varchar(4) NOT NULL,
  `code_fund_4` varchar(5) NOT NULL,
  `code_province_2` int(11) NOT NULL,
  `code_object_2` varchar(3) NOT NULL,
  `amount` double NOT NULL,
  `budget_dev_approveds_id` int(11) DEFAULT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_dev_b3`
--

INSERT INTO `budget_dev_b3` (`id`, `code_org_3`, `code_project_6`, `code_program_3`, `code_fund_4`, `code_province_2`, `code_object_2`, `amount`, `budget_dev_approveds_id`, `is_finalized`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '128', '111111', '281', '2000', 1, '21', 1000, 2, 0, 1, '2024-10-11 11:15:17', '2024-10-30 06:30:25'),
(4, '128', '8989', '281', '1000', 1, '21', 5000, 2, 0, 1, '2024-10-11 08:11:41', '2024-10-30 06:30:25'),
(5, '128', '8989', '281', '2000', 1, '21', 2000, 2, 0, 1, '2024-10-11 08:20:23', '2024-10-30 06:30:25'),
(7, '128', '280326', '281', '2000', 2, '22', 2000, 12, 0, 1, '2024-10-11 08:26:38', '2024-10-30 06:30:25'),
(11, '128', '2080222', '281', '1000', 1, '21', 9000, 4, 0, 1, '2024-10-11 08:29:44', '2024-10-30 06:30:25'),
(12, '128', '89891', '281', '1000', 1, '21', 800, 2, 0, 1, '2024-10-11 08:30:36', '2024-10-30 06:30:25'),
(13, '128', '280326', '281', '2000', 5, '23', 0, NULL, 0, 1, '2024-10-20 05:04:43', '2024-10-20 05:04:43'),
(14, '128', '280326', '281', '2000', 2, '23', 1000, 12, 0, 1, '2024-10-20 01:19:12', '2024-10-30 06:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `budget_dev_b3_transfers`
--

CREATE TABLE `budget_dev_b3_transfers` (
  `id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `budget_dev_b3_id` int(11) NOT NULL,
  `code_org_3` varchar(3) NOT NULL,
  `code_project_6` varchar(6) NOT NULL,
  `code_program_3` varchar(3) NOT NULL,
  `code_fund_4` varchar(4) NOT NULL,
  `code_loaction` varchar(2) NOT NULL,
  `code_object_2` varchar(2) NOT NULL,
  `dr` double DEFAULT 0 COMMENT 'transfered amount to b3 from external source',
  `cr` double DEFAULT 0 COMMENT 'transfered amount to external source from b3',
  `afmis_reg_no` varchar(55) DEFAULT NULL,
  `sending_no` varchar(55) DEFAULT NULL,
  `sending_date` date DEFAULT NULL,
  `needs_in_letters` text DEFAULT NULL,
  `prescription_gnrl_drctr` text DEFAULT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_dev_b3_transfers`
--

INSERT INTO `budget_dev_b3_transfers` (`id`, `budget_plan_id`, `budget_dev_b3_id`, `code_org_3`, `code_project_6`, `code_program_3`, `code_fund_4`, `code_loaction`, `code_object_2`, `dr`, `cr`, `afmis_reg_no`, `sending_no`, `sending_date`, `needs_in_letters`, `prescription_gnrl_drctr`, `is_finalized`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 13, '129', '280326', '281', '2000', '1', '22', 1900, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-10-20 05:04:43', '2024-10-30 06:30:11'),
(2, 1, 14, '129', '011111', '281', '1000', '1', '21', 0, 100, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-10-20 06:05:38', '2024-10-30 06:30:11'),
(3, 1, 14, '129', '011111', '281', '1000', '1', '21', 0, 100, 'B78787', '909090', '2020-09-09', 'testing from external transfers from developmemnt budget', 'testing from external transfers from developmemnt budget', 0, 1, '2024-10-20 06:05:43', '2024-10-30 06:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `budget_dev_b20`
--

CREATE TABLE `budget_dev_b20` (
  `id` int(11) NOT NULL,
  `budget_dev_b3_id` int(11) NOT NULL,
  `code_org_5` varchar(6) NOT NULL,
  `code_project_6` varchar(7) NOT NULL,
  `code_program_3` varchar(4) NOT NULL,
  `code_fund_4` varchar(5) NOT NULL,
  `code_province_2` varchar(3) NOT NULL,
  `code_cate_1` varchar(2) NOT NULL,
  `code_object_2` varchar(3) NOT NULL,
  `m_1` double DEFAULT 0,
  `m_2` double DEFAULT 0,
  `m_3` double DEFAULT 0,
  `m_4` double DEFAULT 0,
  `m_5` double DEFAULT 0,
  `m_6` double DEFAULT 0,
  `m_7` double DEFAULT 0,
  `m_8` double DEFAULT 0,
  `m_9` double DEFAULT 0,
  `m_10` double DEFAULT 0,
  `m_11` double DEFAULT 0,
  `m_12` double DEFAULT 0,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_dev_b20`
--

INSERT INTO `budget_dev_b20` (`id`, `budget_dev_b3_id`, `code_org_5`, `code_project_6`, `code_program_3`, `code_fund_4`, `code_province_2`, `code_cate_1`, `code_object_2`, `m_1`, `m_2`, `m_3`, `m_4`, `m_5`, `m_6`, `m_7`, `m_8`, `m_9`, `m_10`, `m_11`, `m_12`, `is_finalized`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 7, '12800', '280326', '281', '2000', '2', '0', '22', 20, 900, 800, 10, 50, 0, 0, 0, 0, 0, 20, 0, 0, 1, '2024-10-12 10:53:15', '2024-10-30 05:00:25'),
(2, 8, '12800', '280326', '281', '2000', '2', '0', '22', 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-10-13 04:34:53', '2024-10-13 04:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `budget_dev_cfs`
--

CREATE TABLE `budget_dev_cfs` (
  `id` int(11) NOT NULL,
  `budget_dev_cf_list_id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `afmis_reg_no` varchar(255) DEFAULT NULL,
  `code_org_5` varchar(6) NOT NULL,
  `code_project_6` varchar(7) NOT NULL,
  `code_program_5` varchar(6) NOT NULL,
  `code_fund_4` varchar(5) NOT NULL,
  `code_location_4` varchar(5) NOT NULL,
  `code_cate_1` varchar(2) NOT NULL,
  `code_object_2` varchar(3) NOT NULL,
  `m_1` double DEFAULT 0,
  `m_2` double DEFAULT 0,
  `m_3` double DEFAULT NULL,
  `m_4` double DEFAULT 0,
  `m_5` double DEFAULT 0,
  `m_6` double DEFAULT 0,
  `m_7` double DEFAULT 0,
  `m_8` double DEFAULT NULL,
  `m_9` double DEFAULT 0,
  `m_10` double DEFAULT 0,
  `m_11` double DEFAULT 0,
  `m_12` double DEFAULT 0,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_dev_cfs`
--

INSERT INTO `budget_dev_cfs` (`id`, `budget_dev_cf_list_id`, `budget_plan_id`, `afmis_reg_no`, `code_org_5`, `code_project_6`, `code_program_5`, `code_fund_4`, `code_location_4`, `code_cate_1`, `code_object_2`, `m_1`, `m_2`, `m_3`, `m_4`, `m_5`, `m_6`, `m_7`, `m_8`, `m_9`, `m_10`, `m_11`, `m_12`, `is_finalized`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'T544545', '12800', '280326', '28111', '2000', '0101', '2', '22', 800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-10-21 10:05:11', '2024-10-30 06:17:19'),
(3, 1, 1, 'T544545', '12800', '280326', '28111', '2000', '0102', '2', '22', 800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-10-21 10:05:48', '2024-10-30 06:17:19'),
(5, 1, 1, 'Tfsfsfsf', '12800', '280326', '28111', '2000', '0101', '2', '22', 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-10-23 04:54:45', '2024-10-30 06:17:19'),
(6, 1, 1, 'T68757', '12800', '280326', '28111', '2000', '0101', '2', '22', 900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-10-23 04:55:07', '2024-10-30 06:17:19'),
(7, 0, 1, '0987654', '12801', '000000', '28110', '2000', '0101', '2', '22', 876, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-10-23 09:50:56', '2024-10-30 06:17:19'),
(8, 1, 1, '98765', '12801', '011111', '28110', '2000', '0102', '0', '22', 9000000, NULL, NULL, NULL, NULL, NULL, NULL, 900, NULL, NULL, NULL, NULL, 0, 1, '2024-10-23 09:52:35', '2024-10-30 06:17:19'),
(9, 2, 1, '8765', '12802', '011111', '28110', '2000', '0102', '1', '22', 9008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-10-23 10:17:33', '2024-10-30 06:17:19'),
(10, 4, 1, '87', '12800', '000000', '28110', '1000', '0101', '1', '22', 8765, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2024-10-30 10:59:05', '2024-10-30 10:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `budget_dev_cf_lists`
--

CREATE TABLE `budget_dev_cf_lists` (
  `id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `sending_no` text DEFAULT NULL,
  `payment_location` text DEFAULT NULL,
  `location_name` text DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `afmis_no` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `prepared_by` text DEFAULT NULL,
  `approved_by` text DEFAULT NULL,
  `cf_name` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_dev_cf_lists`
--

INSERT INTO `budget_dev_cf_lists` (`id`, `budget_plan_id`, `date`, `sending_no`, `payment_location`, `location_name`, `currency`, `afmis_no`, `description`, `prepared_by`, `approved_by`, `cf_name`, `user_id`, `is_finalized`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-10-23', '8000', NULL, NULL, NULL, 'T98789', NULL, NULL, NULL, NULL, 1, 0, '2024-10-23 06:40:48', '2024-10-30 06:07:11'),
(2, 1, '1403-08-08', '9088', '98', '98908', '89', '908', '9898', '9', '98', 'testing', 1, 0, '2024-10-23 02:48:14', '2024-10-30 06:07:11'),
(3, 1, '1403-08-08', '9088', '98', '98908', '89', '908', '9898', '9', '98', 'testing', 1, 0, '2024-10-23 02:48:28', '2024-10-30 06:07:11'),
(4, 1, '1403-08-29', '9876', '98', '98908', '89', '908', 'sdffsdfsdf', '9', '98', '11111testing', 1, 0, '2024-10-30 06:27:22', '2024-10-30 06:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `budget_dev_promises`
--

CREATE TABLE `budget_dev_promises` (
  `id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `details` text DEFAULT NULL,
  `sadira_no` varchar(50) DEFAULT NULL,
  `maktoob_date` date DEFAULT current_timestamp(),
  `object_code_5` varchar(12) DEFAULT NULL,
  `promise_amount` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `is_done` tinyint(1) NOT NULL DEFAULT 0,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_dev_promises`
--

INSERT INTO `budget_dev_promises` (`id`, `budget_plan_id`, `department_id`, `details`, `sadira_no`, `maktoob_date`, `object_code_5`, `promise_amount`, `paid_amount`, `is_done`, `is_finalized`, `user_id`, `created_at`, `updated_at`) VALUES
(7, 1, 5, 'تعهد امتحانی', '9090', '1403-07-30', '22100', 120000, 20000, 5, 0, 1, '2024-10-21 05:44:39', '2024-10-30 05:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `budget_dev_transfers_b20`
--

CREATE TABLE `budget_dev_transfers_b20` (
  `id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `frm_type` varchar(12) NOT NULL,
  `budget_dev_b20_id` int(11) NOT NULL,
  `code_org_4` int(11) NOT NULL,
  `code_project_6` varchar(11) NOT NULL,
  `code_program_3` int(11) NOT NULL,
  `code_fund_4` varchar(12) NOT NULL,
  `code_loaction` int(11) NOT NULL,
  `code_cate_1` int(11) NOT NULL,
  `code_object_2` int(11) NOT NULL,
  `from_month` varchar(10) NOT NULL,
  `to_month` varchar(10) NOT NULL,
  `dr` double NOT NULL,
  `cr` double NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `afmis_reg_no` varchar(55) DEFAULT NULL,
  `sending_no` varchar(55) DEFAULT NULL,
  `sending_date` date DEFAULT NULL,
  `needs_in_letters` text DEFAULT NULL,
  `prescription_gnrl_drctr` text DEFAULT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_dev_transfers_b20`
--

INSERT INTO `budget_dev_transfers_b20` (`id`, `budget_plan_id`, `frm_type`, `budget_dev_b20_id`, `code_org_4`, `code_project_6`, `code_program_3`, `code_fund_4`, `code_loaction`, `code_cate_1`, `code_object_2`, `from_month`, `to_month`, `dr`, `cr`, `user_id`, `afmis_reg_no`, `sending_no`, `sending_date`, `needs_in_letters`, `prescription_gnrl_drctr`, `is_finalized`, `created_at`, `updated_at`) VALUES
(2, 0, 'primary', 1, 12800, '280326', 281, '2000', 1, 0, 22, 'm_3', 'm_3', 10, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-19 05:46:39', '2024-10-19 05:46:39'),
(3, 0, 'primary', 1, 12800, '280326', 281, '2000', 1, 0, 22, 'm_3', 'm_3', 10, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-19 05:51:37', '2024-10-19 05:51:37'),
(4, 0, 'primary', 1, 12800, '280326', 281, '2000', 1, 0, 22, 'm_3', 'm_3', 10, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-19 05:51:53', '2024-10-19 05:51:53'),
(5, 1, 'primary', 1, 12800, '280326', 281, '2000', 1, 0, 22, 'm_3', 'm_3', 10, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-19 05:53:02', '2024-10-30 05:42:27'),
(6, 1, 'primary', 1, 12800, '280326', 281, '2000', 1, 0, 22, 'm_3', 'm_3', 10, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-19 05:53:42', '2024-10-30 05:42:27'),
(7, 1, 'primary', 1, 12800, '280326', 281, '2000', 1, 0, 22, 'm_3', 'm_3', 10, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-19 05:54:47', '2024-10-30 05:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `budget_plans`
--

CREATE TABLE `budget_plans` (
  `id` int(11) NOT NULL,
  `year` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `b10_gnrl_bgt_mgr` text DEFAULT NULL,
  `b10_finance_drctr` text DEFAULT NULL,
  `b10_gnrl_drctr` text DEFAULT NULL,
  `b10_afmis_reg_no` text DEFAULT NULL,
  `b20_sending_no` text DEFAULT NULL,
  `b20_sending_date` date DEFAULT NULL,
  `b20_form_no` text DEFAULT NULL,
  `b20_beu_no` text DEFAULT NULL,
  `b20_afmis_no` text DEFAULT NULL,
  `b20_needs_in_letters` text DEFAULT NULL,
  `b20_prescription_gnrl_drctr` text DEFAULT NULL,
  `dev_b3_gnrl_bgt_mgr` text DEFAULT NULL,
  `dev_b3_finance_drctr` text DEFAULT NULL,
  `dev_b3_gnrl_drctr` text DEFAULT NULL,
  `dev_b3_afmis_reg_no` text DEFAULT NULL,
  `dev_b20_sending_no` text DEFAULT NULL,
  `dev_b20_sending_date` text DEFAULT NULL,
  `dev_b20_form_no` text DEFAULT NULL,
  `dev_b20_beu_no` text DEFAULT NULL,
  `dev_b20_afmis_no` text DEFAULT NULL,
  `dev_b20_prescription_gnrl_drctr` text DEFAULT NULL,
  `dev_b20_needs_in_letters` text DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_plans`
--

INSERT INTO `budget_plans` (`id`, `year`, `user_id`, `is_completed`, `b10_gnrl_bgt_mgr`, `b10_finance_drctr`, `b10_gnrl_drctr`, `b10_afmis_reg_no`, `b20_sending_no`, `b20_sending_date`, `b20_form_no`, `b20_beu_no`, `b20_afmis_no`, `b20_needs_in_letters`, `b20_prescription_gnrl_drctr`, `dev_b3_gnrl_bgt_mgr`, `dev_b3_finance_drctr`, `dev_b3_gnrl_drctr`, `dev_b3_afmis_reg_no`, `dev_b20_sending_no`, `dev_b20_sending_date`, `dev_b20_form_no`, `dev_b20_beu_no`, `dev_b20_afmis_no`, `dev_b20_prescription_gnrl_drctr`, `dev_b20_needs_in_letters`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, '2020-09-02', 1, 0, 'احمد جمشید صدیقی', 'عبدالباري خپلواک', 'مولوي حافظ محمد حامد حسیب', '5454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'احمد جمشید صدیقی', 'عبدالباري خپلواک', 'مولوي حافظ محمد حامد حسیب', NULL, '3333', '333', '33333', 'BEU#9090', '#30303030', 'fffffffffffffffffffffff', 'needs in letters', 0, '2024-07-09 05:13:12', '2024-10-30 06:18:35'),
(2, '2021-09-02', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-09 02:18:05', '2024-11-02 06:32:32'),
(3, '2022-09-02', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-09 02:18:33', '2024-09-05 00:25:15'),
(4, '2023-09-02', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-07-09 02:27:21', '2024-07-11 01:49:50'),
(5, '2024-09-02', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-09-05 00:42:34', '2024-09-05 00:48:12'),
(6, '2025-04-06', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-09-07 01:48:43', '2024-10-30 06:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `budget_plan_activities`
--

CREATE TABLE `budget_plan_activities` (
  `id` int(11) NOT NULL,
  `budget_sub_plan_id` int(11) NOT NULL,
  `object_code_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `achivements` text DEFAULT NULL,
  `efficiency` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `unit_price` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `measurement_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget_plan_activities_comments`
--

CREATE TABLE `budget_plan_activities_comments` (
  `id` int(11) NOT NULL,
  `activitie_id` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget_plan_promises`
--

CREATE TABLE `budget_plan_promises` (
  `id` int(11) NOT NULL,
  `budget_plan_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `details` text DEFAULT NULL,
  `sadira_no` varchar(50) DEFAULT NULL,
  `maktoob_date` date DEFAULT current_timestamp(),
  `object_code_5` varchar(12) DEFAULT NULL,
  `promise_amount` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `is_done` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_plan_promises`
--

INSERT INTO `budget_plan_promises` (`id`, `budget_plan_id`, `department_id`, `details`, `sadira_no`, `maktoob_date`, `object_code_5`, `promise_amount`, `paid_amount`, `is_done`, `user_id`, `is_finalized`, `created_at`, `updated_at`) VALUES
(3, 1, 5, 'klflsff', '44', '1403-07-01', '21100', 44, 44, 5, 1, 0, '2024-09-23 06:32:36', '2024-10-28 02:37:11'),
(5, 1, 5, 'jllkjkljlkjlkjlk', '90', '1403-07-24', '21100', 16, 8, 5, 1, 0, '2024-09-23 06:51:05', '2024-10-28 02:37:11'),
(6, 1, 7, 'hjkhkjhkjhkj', '98', '1403-07-15', '23000', 89, 89, 7, 1, 0, '2024-09-23 06:51:27', '2024-10-28 02:37:11');

-- --------------------------------------------------------

--
-- Table structure for table `budget_sub_plan`
--

CREATE TABLE `budget_sub_plan` (
  `id` int(11) NOT NULL,
  `budget_plan_id` int(11) DEFAULT NULL,
  `sub_org_code` int(11) DEFAULT NULL COMMENT 'organization - sub - id',
  `project_code_id` int(11) DEFAULT NULL COMMENT 'project 6',
  `program_code_id` int(11) DEFAULT NULL COMMENT 'program 3',
  `fund_sub_id` int(11) DEFAULT NULL COMMENT 'sub fund id (code funds table',
  `province_code_id` int(11) DEFAULT NULL COMMENT 'code locations table',
  `object_code_id` int(11) NOT NULL COMMENT 'Object Code 2',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `code_categories`
--

CREATE TABLE `code_categories` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `en_desc` text NOT NULL,
  `pa_desc` text NOT NULL,
  `da_desc` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `code_categories`
--

INSERT INTO `code_categories` (`id`, `code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 0, 'Not Applicable (Only for Deductions)', 'تطبیق وړ نده', 'غیر قابل تطبیق', 1, '2024-03-05 09:38:49', '2024-03-05 09:38:49'),
(2, 1, 'Contracts', 'قراردادونه', 'قراردادها', 1, '2024-03-06 09:38:49', '2024-03-06 09:38:49'),
(3, 2, 'Operations Cost', 'اجرایوی لګښت', 'مصارف اجرایوی', 1, '2024-03-07 09:38:49', '2024-03-07 09:38:49'),
(4, 3, ' \nUtilities', 'عام المنفعه', 'عام المنفعه', 1, '2024-03-08 09:38:49', '2024-03-08 09:38:49'),
(5, 4, 'Food', 'غذا', 'غدا', 1, '2024-03-09 09:38:49', '2024-03-09 09:38:49'),
(6, 5, 'Maintenance', 'ترمیمات حفظ و مراقبت', 'ترمیمات حفظ و مراقبت', 1, '2024-03-10 09:38:49', '2024-03-10 09:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `code_donors`
--

CREATE TABLE `code_donors` (
  `id` int(11) NOT NULL,
  `en_name` varchar(255) DEFAULT NULL,
  `pa_name` varchar(255) DEFAULT NULL,
  `da_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `code_donors`
--

INSERT INTO `code_donors` (`id`, `en_name`, `pa_name`, `da_name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Islamic Emarat of Afghanisatan', 'د افغانستان اسلامی امارت', 'امارت اسلامی افغانستان', 1, '2024-10-11 04:45:48', '2024-10-11 04:45:48');

-- --------------------------------------------------------

--
-- Table structure for table `code_funds`
--

CREATE TABLE `code_funds` (
  `id` int(11) NOT NULL,
  `fund_type_code` int(11) DEFAULT NULL,
  `fund_code` int(11) DEFAULT NULL,
  `sub_fund_code` int(11) DEFAULT NULL,
  `fund_componenet_code` int(11) DEFAULT NULL,
  `en_desc` text DEFAULT NULL,
  `pa_desc` text DEFAULT NULL,
  `da_desc` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `code_funds`
--

INSERT INTO `code_funds` (`id`, `fund_type_code`, `fund_code`, `sub_fund_code`, `fund_componenet_code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 'GENERAL FUND', 'وجه عمومی', 'وجه عمومی', 1, 0, '2024-03-05 09:38:49', '2024-03-05 09:38:49'),
(2, 1, 10, NULL, NULL, 'RECURRENT BUDGET', 'وجه دورانی ', 'وجه دورانی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 10, 1000, NULL, 'Recurrent Operating', 'وجه دورانی ', 'وجه دورانی ', 1, 0, '0000-00-00 00:00:00', '2024-07-03 01:49:41'),
(4, 1, 10, 1000, 10000, 'Operating Fund', 'بودجه عادی ', 'بودجه عادی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 10, 1000, 10010, 'ARTF', 'صندوق وجوه امانی برای بازسازی افغانستان ', 'صندوق وجوه امانی برای بازسازی افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 10, 1002, NULL, 'Lotfa', 'صندق وجوه امانی قانون و دستورالعمل در افغانستان LOTFA', 'صندق وجوه امانی قانون و دستورالعمل در افغانستان LOTFA', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 10, 1002, 10020, 'Lotfa', 'صندق وجوه امانی قانون و دستورالعمل در افغانستان LOTFA', 'صندق وجوه امانی قانون و دستورالعمل در افغانستان LOTFA', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 10, 1003, NULL, 'Other Donor', 'کمک کنندگان دیگر', 'کمک کنندگان دیگر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 10, 1003, 10030, 'Other Donor', 'کمک کنندگان دیگر', 'کمک کنندگان دیگر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 10, 1003, 10031, 'Sustaining Economic infrastructure in Helmand UK / Afghanistan ', 'حفظ زیرساخت های اقتصادی در ولایت هلمند UK افغانستان  ', 'حفظ زیرساخت های اقتصادی در ولایت هلمند UK افغانستان  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 10, 1004, NULL, 'CSTCA Mod Fund', 'بودجه CSTCA برای وزارت دفاع ملی', 'بودجه CSTCA برای وزارت دفاع ملی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, 10, 1004, 10040, 'CSTCA Mod Fund', 'بودجه CSTCA برای وزارت دفاع ملی', 'بودجه CSTCA برای وزارت دفاع ملی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1, 10, 1041, NULL, 'Payment of Prior Year contrcats MoD', 'پرداخت قرارداد های سال قبل وزارت دفاع ملی', 'پرداخت قرارداد های سال قبل وزارت دفاع ملی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 1, 10, 1041, 10041, 'Payment of Prior Year contrcats MoD', 'پرداخت قرارداد های سال قبل وزارت دفاع ملی', 'پرداخت قرارداد های سال قبل وزارت دفاع ملی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, 10, 1042, NULL, 'Afghan Air Force (AAF)\n', 'وجه 5030 محافظان CSTCA وزارت دفاع ملی ', 'وجه 5030 محافظان CSTCA وزارت دفاع ملی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1, 10, 1042, 10042, 'Afghan Air Force (AAF)\n', 'وجه 5030 محافظان CSTCA وزارت دفاع ملی ', 'وجه 5030 محافظان CSTCA وزارت دفاع ملی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1, 10, 1043, NULL, 'MoD Contract Carry Over', 'انتقال قرارداد وزارت دفاع ملی ', 'انتقال قرارداد وزارت دفاع ملی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1, 10, 1043, 10043, 'MoD Contract Carry Over', 'انتقال قرارداد وزارت دفاع ملی ', 'انتقال قرارداد وزارت دفاع ملی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 1, 10, 1044, NULL, 'MoD Emergency Fund Code', 'کود اضطراری برای وزارت دفاع ملی', 'کود اضطراری برای وزارت دفاع ملی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 1, 10, 1044, 10044, 'MoD Emergency Fund Code', 'کود اضطراری برای وزارت دفاع ملی', 'کود اضطراری برای وزارت دفاع ملی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 1, 10, 1045, NULL, 'Afghan Special Security Forces (ASSF)', 'قوای خاص امنیتی افغان', 'قوای خاص امنیتی افغان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 1, 10, 1045, 10045, 'Afghan Special Security Forces (ASSF)', 'قوای خاص امنیتی افغان', 'قوای خاص امنیتی افغان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 1, 10, 1046, NULL, 'Delegated Authority Budgetand Expenses', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 1, 10, 1046, 10046, 'Delegated Authority Budgetand Expenses', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 1, 10, 1047, NULL, 'FY 1399 CSTC- A Funding Guidance for Ministry of Defense', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 1, 10, 1047, 10047, ' \nSalaris and Incentives', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 1, 10, 1048, NULL, 'SFC-C sustainable fund code O&M contracts', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 1, 10, 1048, 1008, 'SFC-C sustainable fund code O&M contracts', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 1, 10, 1049, NULL, 'Gender Funde Code', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 1, 10, 1049, 10049, 'Gender Funde Code\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 1, 10, 1005, NULL, 'CSTCA Moi Fund', 'بودجه CSTCA برای وزارت امورداخله', 'بودجه CSTCA برای وزارت امورداخله', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 1, 10, 1005, 10050, 'CSTCA Moi Fund', 'بودجه CSTCA برای وزارت امورداخله', 'بودجه CSTCA برای وزارت امورداخله', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 1, 10, 1051, NULL, 'Prior Year contrcats fund MoI', 'بودجه قرارداد های  سال قبل وزارت امورداخله', 'بودجه قرارداد های  سال قبل وزارت امورداخله', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 1, 10, 1051, 10051, 'Prior Year contrcats fund MoI', 'بودجه قرارداد های  سال قبل وزارت امورداخله', 'بودجه قرارداد های  سال قبل وزارت امورداخله', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 1, 10, 1052, NULL, 'Delegation of Authority ', 'وجوه تفویض صلاحیت', 'وجوه تفویض صلاحیت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 1, 10, 1052, 10052, 'Delegation of Authority ', 'وجوه تفویض صلاحیت', 'وجوه تفویض صلاحیت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 1, 10, 1053, NULL, 'Pay old Bills', 'پرداخت بل های سابقه ', 'پرداخت بل های سابقه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 1, 10, 1053, 10053, 'Pay old bills', 'پرداخت بل های سابقه ', 'پرداخت بل های سابقه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 1, 10, 1054, NULL, 'CSTC-A Contingency Fund for MoI', 'وجه احتیاطی CSTCA برای وزارت امور داخله ', 'وجه احتیاطی CSTCA برای وزارت امور داخله ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 1, 10, 1054, 10054, 'CSTC-A Contingency Fund for MoI', 'وجه احتیاطی CSTCA برای وزارت امور داخله ', 'وجه احتیاطی CSTCA برای وزارت امور داخله ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 1, 10, 1055, NULL, 'General Command of Police Special Unit (GCPSU) & ALP\n', 'پرداخت فند به پولیس محلی و قطعات خاص', 'پرداخت فند به پولیس محلی و قطعات خاص', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 1, 10, 1055, 10055, 'General Command of Police Special Unit (GCPSU) & ALP\n', 'پرداخت فند به پولیس محلی و قطعات خاص', 'پرداخت فند به پولیس محلی و قطعات خاص', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 1, 10, 1006, NULL, '221060-NATO ANA Trust Fund', 'صندوق وجهی ناتو برای نیروی های امنیتی افغانستان 221060', 'صندوق وجهی ناتو برای نیروی های امنیتی افغانستان 221060', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 1, 10, 1007, NULL, 'European Commission (EC) OB Fund', 'کمک اتحادیه اروپا برای بودجه عادی', 'کمک اتحادیه اروپا برای بودجه عادی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 1, 10, 1007, 10070, 'European Commission (EC) OB Fund', 'کمک اتحادیه اروپا برای بودجه عادی', 'کمک اتحادیه اروپا برای بودجه عادی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 1, 10, 1008, NULL, '26447 ( SPAD French ) ', 'SPAD فرانسه 26447', 'SPAD فرانسه 26447', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 1, 10, 1008, 10080, '26447 ( SPAD French ) ', 'SPAD فرانسه 26447', 'SPAD فرانسه 26447', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 1, 10, 1051, NULL, 'Prior Year contrcats fund MoI', 'بودجه قرارداد های  سال قبل وزارت امورداخله', 'بودجه قرارداد های  سال قبل وزارت امورداخله', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 1, 10, 1052, NULL, 'ASLEPP Fund', 'بودجه ASLEPP', 'بودجه ASLEPP', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 1, 10, 1053, NULL, 'Pay old Bills', 'پرداخت بل های سابقه ', 'پرداخت بل های سابقه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 1, 10, 1054, NULL, 'CSTC-A Contingency Fund for MoI', 'وجه احتیاطی CSTCA برای وزارت امور داخله ', 'وجه احتیاطی CSTCA برای وزارت امور داخله ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 1, 10, 1055, NULL, 'General Command of Police Special Unit (GCPSU) & ALP\n', 'پرداخت های  قرارداد CSTCA- وزارت امور داخله - مدل خریداری ', 'پرداخت های  قرارداد CSTCA- وزارت امور داخله - مدل خریداری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 1, 10, 1060, NULL, 'Telecom Development Fund (TDF) - Operating Budget', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 1, 10, 1060, 10600, 'Telecom Development Fund (TDF) - Operating Budget', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 2, NULL, NULL, NULL, 'DISCRETIONARY DEVELOPMENT FUND', 'وجه انکشافی اختیاری', 'وجه انکشافی اختیاری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 2, 20, NULL, NULL, 'DISCRETIONERY FUND FOR DEVELOPMENT PROJECTS', 'وجه انکشافی اختیاری دونر ها  برای پروژه های انکشافی', 'وجه انکشافی اختیاری دونر ها  برای پروژه های انکشافی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 2, 20, 2000, 4544, 'Discretionery Fund For Development Projects', 'وجه  اختیاری برای پروژه های انکشافی', 'وجه  اختیاری برای پروژه های انکشافی', 1, 1, '0000-00-00 00:00:00', '2024-07-03 01:48:44'),
(58, 2, 20, 2000, 20000, 'Donors\' Discretionery Fund For Development Projects', 'وجه انکشافی اختیاری دونر ها  برای پروژه های انکشافی', 'وجه انکشافی اختیاری دونر ها  برای پروژه های انکشافی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 2, 20, 2001, NULL, 'Telecommunication Development Fund MoCIT', 'وجه انکشافی ارتباطات مخابراتی وزارت مخابرات و تکنالوژی معلوماتی', 'وجه انکشافی ارتباطات مخابراتی وزارت مخابرات و تکنالوژی معلوماتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 2, 20, 2001, 20010, 'Telecommunication Development Fund MoCIT', 'وجه انکشافی ارتباطات مخابراتی وزارت مخابرات و تکنالوژی معلوماتی', 'وجه انکشافی ارتباطات مخابراتی وزارت مخابرات و تکنالوژی معلوماتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 2, 20, 2002, NULL, 'A8449 EQRA DLI Fund 2018', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 2, 20, 2002, 20020, 'Equitable Access to Basic Eduction', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 2, 20, 2002, 20021, 'Improving Learing Conditions', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 2, 20, 2002, 20022, ' \nStrengthening Eduction Sector Planning Capacity and Transparency', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 2, 20, 2002, 20023, ' \nTechnical Assistance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 2, 21, NULL, NULL, 'Closed / Dormant Accounts\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 2, 21, 2101, NULL, 'Closed / Dormant Accounts\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 2, 21, 2101, 21010, 'Closed / Dormant Accounts', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 2, 25, NULL, NULL, 'Developemnt Budget Taminat & Witholdings', 'تامینات بودجه انکشافی', 'تامینات بودجه انکشافی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 2, 25, 2500, NULL, 'Developemnt Budget Taminat', 'تامینات بودجه انکشافی', 'تامینات بودجه انکشافی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 2, 25, 2500, 25000, 'Developemnt Budget Taminat', 'تامینات بودجه انکشافی', 'تامینات بودجه انکشافی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 2, 25, 2501, NULL, 'Development Budget Witholdings', 'تصفیه خسارات و دیگر موارد در بودجه انکشافی ', 'تصفیه خسارات و دیگر موارد در بودجه انکشافی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 2, 25, 2501, 25010, 'Development Budget Witholdings', 'تصفیه خسارات و دیگر موارد در بودجه انکشافی ', 'تصفیه خسارات و دیگر موارد در بودجه انکشافی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 3, NULL, NULL, NULL, 'DEVELOPMENT BUDGET GRANTS', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 3, 30, NULL, NULL, 'ARTF', 'صندوق وجوه امانی برای بازسازی افغانستان ', 'صندوق وجوه امانی برای بازسازی افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 3, 30, 3023, NULL, '93962-Second Education Quality Imporvement Project', '93962- پروژه دوم انکشاف کیفیت تعلیمات ثانوی ', '93962- پروژه دوم انکشاف کیفیت تعلیمات ثانوی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 3, 30, 3023, 30230, 'School Grants', 'اعانه برای مکاتب', 'اعانه برای مکاتب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 3, 30, 3023, 30231, 'Teacher And Principle Training And Education', ' تحصیل و آموزش معلمین و سرمعلمین', ' تحصیل و آموزش معلمین و سرمعلمین', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 3, 30, 3023, 30232, 'Project Management , Monitoring And Evaluation', 'مدیریت پروژه، نظارت و ارزیابی', 'مدیریت پروژه، نظارت و ارزیابی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 3, 30, 3023, 30233, 'Quality Enhancement', 'افزایش کیفیت', 'افزایش کیفیت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 3, 30, 3023, 30234, 'Rehabilition And Construction Of Schools', 'ساخت و بازسازی مکاتب', 'ساخت و بازسازی مکاتب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 3, 30, 3023, 30235, 'Mobilization, Training And Workshopes', 'تجهیز کردن،  ورکشاپها و آموزش', 'تجهیز کردن،  ورکشاپها و آموزش', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 3, 30, 3023, 30236, 'Teacher Training District Level To High School', 'آموزش معلمین الی مکاتب لیسه به سطح ولسوالی', 'آموزش معلمین الی مکاتب لیسه به سطح ولسوالی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 3, 30, 3023, 30237, 'Rehabilitation & Construction District Education Office', 'ساخت وبازسازی دفتاتر تعلمیی ساحوی', 'ساخت وبازسازی دفتاتر تعلمیی ساحوی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 3, 30, 3023, 30238, 'Monitoring And Evaluation Of District Teacher Training ', 'نظارت و ارزیابی از آموزش معلمین ساحوی', 'نظارت و ارزیابی از آموزش معلمین ساحوی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 3, 30, 3023, 30239, 'Equipment Principles In Gov Registered Schools, Adminitrative Leadership Tools', 'تجهیز مکاتب ثبت شده دولت ، ابزار رهبری اداری', 'تجهیز مکاتب ثبت شده دولت ، ابزار رهبری اداری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 3, 30, 3023, 30240, 'Supporting Tccs, Establishment & Impl Of Nation Wid Scholarship Prog For Girls', 'ایجاد و تطبیق برنامه های گسترده  بورس برای دختران و حمایت از Tccs', 'ایجاد و تطبیق برنامه های گسترده  بورس برای دختران و حمایت از Tccs', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 3, 30, 3023, 30241, 'Establishmet Of Monitoring & Evaluation Sys, District, Provincial & National Level ', 'تاسیس سیستم نظارت و ارزیابی به سطح ولسوالی، ولایت و به سطح ملی', 'تاسیس سیستم نظارت و ارزیابی به سطح ولسوالی، ولایت و به سطح ملی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 3, 30, 3023, 30242, 'Establishment Of Monitoring And Evaluation System District , Provincial And National Level', 'تاسیس سیستم نظارت و ارزیابی به سطح ولسوالی، ولایت و به سطح ملی', 'تاسیس سیستم نظارت و ارزیابی به سطح ولسوالی، ولایت و به سطح ملی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 3, 30, 3023, 30243, 'Supporting The Verification Of Info Colletced At The Community Level', 'حمایت از تائید اطلاعات جمع آوری شده به سطح جامعه', 'حمایت از تائید اطلاعات جمع آوری شده به سطح جامعه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 3, 30, 3025, NULL, 'Additional Financing Afghanistan Power System Dev', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 3, 30, 3025, 30250, 'Distribtion System Rehabilitation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 3, 30, 3025, 30251, 'Institutional Capacity building and project management support', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 3, 30, 3033, NULL, '95691 AF Multi Donr Trust Fund for Health Results Innovation ', '95691- صندوق وجهی چندین دونر برای تغیر در نتایج امور صحت افغانستان', '95691- صندوق وجهی چندین دونر برای تغیر در نتایج امور صحت افغانستان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 3, 30, 3033, 30330, 'Results based Financing', 'تامین مالی بر اساس نتیجه ', 'تامین مالی بر اساس نتیجه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 3, 30, 3039, NULL, ' \n98045-AF-Rural Enterprise Development project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 3, 30, 3039, 30390, 'Community Led Enterprise Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 3, 30, 3056, NULL, '12533 AF Justice Service  Delivery Project', '12533-تحویل پروژه خدمات عدلی', '12533-تحویل پروژه خدمات عدلی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 3, 30, 3056, 30561, 'Partnership for Justice', 'همکاری برای عدالت', 'همکاری برای عدالت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 3, 30, 3056, 30562, 'Legal Empowerment ', 'توانمند سازی حقوقی', 'توانمند سازی حقوقی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 3, 30, 3056, 30563, 'Organization and Capacity of Justice Institutions', 'ارتقای ظرفیت اداره و انستیتوت های عدلی ', 'ارتقای ظرفیت اداره و انستیتوت های عدلی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 3, 30, 3056, 30564, 'Implementation Capacity', 'تطبیق ارتقای ظرفیت ', 'تطبیق ارتقای ظرفیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 3, 30, 3057, NULL, 'TF017061-Kabul Urban Transport Effecency Improvement Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 3, 30, 3057, 30571, 'Rpoad Infrastructure\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 3, 30, 3057, 30572, 'Technical Assitance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 3, 30, 3057, 30573, 'Project management Support\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 3, 30, 3058, NULL, '12029 AF Irigation Restoration and Development Project', '12029 AF تجدید سیستم آب رسانی، بودجه انکشافی', '12029 AF تجدید سیستم آب رسانی، بودجه انکشافی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 3, 30, 3058, 30581, 'Rehabilitation of Irrigation systems', 'احیاء سیستم آب رسانی', 'احیاء سیستم آب رسانی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 3, 30, 3058, 30582, 'small dams development ', 'انکشاف بند های کوچک', 'انکشاف بند های کوچک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 3, 30, 3058, 30583, 'Establishement of Hydro Meteorological Facilities and Services', 'ایجاد سهولت های خدماتی  آب و هوا شناسی ', 'ایجاد سهولت های خدماتی  آب و هوا شناسی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 3, 30, 3058, 30584, 'Project Management and Capacity Building ', 'مدیریت پروژه و ارتقای ظرفیت', 'مدیریت پروژه و ارتقای ظرفیت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 3, 30, 3059, NULL, '11447 - Capacity Building for Results Facility Project (CBR)', '11447-پروژه ارتقای ظرفیت بر اساس نتیجه CBR ', '11447-پروژه ارتقای ظرفیت بر اساس نتیجه CBR ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 3, 30, 3059, 30591, 'Technical Assistance for Preparation and implementation of line Minstry Capacity Building programs', 'کمکهای تخنیکی برای آمادگی و تطبیق برنامه ارتقای ظرفیت در ادارات مربوطه', 'کمکهای تخنیکی برای آمادگی و تطبیق برنامه ارتقای ظرفیت در ادارات مربوطه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 3, 30, 3059, 30592, 'Building Human Resources', 'ارتقای منابع بشری', 'ارتقای منابع بشری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 3, 30, 3059, 30593, 'Civil Service Training', 'آموزش خدمات ملکی', 'آموزش خدمات ملکی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 3, 30, 3059, 30594, 'Project management, Monitoring and Evaluation', 'مدیریت پروژه، نظارت و ارزیابی', 'مدیریت پروژه، نظارت و ارزیابی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 3, 30, 3061, NULL, '99074 - On Farm Water Management Project', '99074-پروژه مدیریت آب کشت زار', '99074-پروژه مدیریت آب کشت زار', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 3, 30, 3061, 30610, 'On Farm Water Management ', 'مدیریت آب مزرعه', 'مدیریت آب مزرعه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 3, 30, 3061, 30611, 'Institutional Strengthening and Capacity building of Mail ', 'تقویت نهاد ها و ارتقای ظرفیت Mail', 'تقویت نهاد ها و ارتقای ظرفیت Mail', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 3, 30, 3061, 30612, 'Project Management Coordination Monitoring and Evaluation', 'مدیریت پروژه ، هماهنگی نظارت و ارزیابی', 'مدیریت پروژه ، هماهنگی نظارت و ارزیابی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 3, 30, 3061, 30613, 'support for Productivity Enhancement', 'support for Productivity Enhancement', 'support for Productivity Enhancement', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 3, 30, 3062, NULL, '10024 AF-Second Public Financail Management Reform Projet', '10024 AF- پروژه دوم اصلاح اداره امور مالی عامه ', '10024 AF- پروژه دوم اصلاح اداره امور مالی عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 3, 30, 3062, 30620, 'Procurement Reform', 'اصلاح تدارکات ', 'اصلاح تدارکات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 3, 30, 3062, 30621, 'Financial Management Reform', 'اصلاح مدیریت مالی ', 'اصلاح مدیریت مالی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 3, 30, 3062, 30622, 'Audit Reform and Performance', 'اصلاح تفتیش و اجراات ', 'اصلاح تفتیش و اجراات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 3, 30, 3062, 30623, 'Reform Management', 'اصلاح مدیریت ', 'اصلاح مدیریت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 3, 30, 3062, 30624, 'Revenue Mobilization ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 3, 30, 3063, NULL, 'TF017016- Kabul Municipal Development Program (KMDP) ARTF- WB Grant\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 3, 30, 3063, 30631, 'Infrastructure Upgrading Program\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 3, 30, 3063, 30632, 'Redesign Kabul Municipality Finance Management System', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 3, 30, 3063, 30633, 'Project Management, Work design and Supervision\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 3, 30, 3063, 30634, 'Contingent Emergency Resposnse\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 3, 30, 3063, 30635, 'Studies\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 3, 30, 3064, NULL, '13093- Afghanistan Rural Access Project', '13093- پروژه دسترسی به روستا های افغانستان', '13093- پروژه دسترسی به روستا های افغانستان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 3, 30, 3064, 30640, 'Improvement and Maintenance of Secondary Road', 'توسعه و حفظ ومراقبت  جاده های ثانوی', 'توسعه و حفظ ومراقبت  جاده های ثانوی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 3, 30, 3064, 30641, 'Improvement and Maintenance of Tertiary Road', 'توسعه و حفظ ومراقبت جاده های سومی', 'توسعه و حفظ ومراقبت جاده های سومی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 3, 30, 3064, 30642, 'Program Planning and Development Institutional Strengthening and Program Coordination Support', 'پلانگذاری برنامه، حمایت هماهنگی برنامه و تقویت  انکشاف نهاد ها  ', 'پلانگذاری برنامه، حمایت هماهنگی برنامه و تقویت  انکشاف نهاد ها  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 3, 30, 3065, NULL, '13820 National horticulture and livestock Project ( NHLP)', '13820- پروژه ملی مالداری و باغداری  NHLP', '13820- پروژه ملی مالداری و باغداری  NHLP', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 3, 30, 3065, 30650, 'Horticultural Production ', 'تولیدات باغداری ', 'تولیدات باغداری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 3, 30, 3065, 30651, 'Animal Production ', 'تولیدات حیوانی', 'تولیدات حیوانی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 3, 30, 3065, 30652, 'Project Implementation Management and Technical Assistance Support ', 'حمایت تخنیکی و تطبیق پروژه ', 'حمایت تخنیکی و تطبیق پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 3, 30, 3066, NULL, '13393 Afghanistan Second Skills Development Project ', '13393 پروژه دوم  انکشاف مهارتها ', '13393 پروژه دوم  انکشاف مهارتها ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 3, 30, 3066, 30660, 'Surveys of Technical and Vocational education and training Institutions', 'سروی تخنیکی و آموزش تعلیمات فنی و حرفوی ', 'سروی تخنیکی و آموزش تعلیمات فنی و حرفوی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 3, 30, 3066, 30661, 'Strengthen the Monitoring and Evaluation ( M& U ) Unite ASDP', 'تقویت واحد نظارت و ارزیابی NSDP ', 'تقویت واحد نظارت و ارزیابی NSDP ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 3, 30, 3066, 30662, 'Develop and Adopt a project implementation manual Guidelines Protocol Procurement Monitoring and Evaluation Reporting ', 'گزارشدهی', 'گزارشدهی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 3, 30, 3068, NULL, '15003 Afghanistan Agricultural inputs Project ( AAIP )', '  15003 (AAIP )  پروژه زراعت افغانستان ', '  15003 (AAIP )  پروژه زراعت افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 3, 30, 3068, 30680, 'Improved wheat seed production ', 'انکشاف تولید بذر گندم ', 'انکشاف تولید بذر گندم ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 3, 30, 3068, 30681, 'Plant quarantine Networks and quality control of Agro chemicals', 'کنترول مواد کمیایی زراعتی و قرنطین گیاها', 'کنترول مواد کمیایی زراعتی و قرنطین گیاها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 3, 30, 3068, 30682, 'Input Delivery systems', 'سیستم ارایه ورودی', 'سیستم ارایه ورودی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 3, 30, 3068, 30683, 'Project Management and Monitoring ', 'مدیریت و نظارت پروژه', 'مدیریت و نظارت پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 3, 30, 3072, NULL, '14845 Preparation of Afghanistan Resource Corridors Project', '14845 پروژه آماده سازی  راهرو ها', '14845 پروژه آماده سازی  راهرو ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 3, 30, 3072, 30720, 'Establish and Strengthen Infrastructure Development Cluster Secretariat', 'ایجاد، تقویت و توسعه زیربنا ها', 'ایجاد، تقویت و توسعه زیربنا ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 3, 30, 3072, 30721, 'Strengthening Resource Corridors Secretariat', 'تقویت منابع راهرو ها', 'تقویت منابع راهرو ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 3, 30, 3072, 30722, 'Goods Non Consulting Services Consultants Services Training and Workshop and Incremental Operating Costs Under Part C of the Acititvis-PPPP1', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 3, 30, 3073, NULL, '15577-Preparation of Education System Improvement Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 3, 30, 3073, 30730, ' \nPreparation Activities for the Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 3, 30, 3075, NULL, '15005 System Enhancement for Health Action in Transition Project ( SEGAT)', '15005 انکشاف  فعالیت های صحی در پروژه انتقالی SEGAT', '15005 انکشاف  فعالیت های صحی در پروژه انتقالی SEGAT', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 3, 30, 3075, 30750, 'Basic Pachage of Health Services and the Essential Package of Hospital Services', 'بسته های کمکهای اولیه خدمات صحی و بسته های ضروری برای شفاخانه ها  ', 'بسته های کمکهای اولیه خدمات صحی و بسته های ضروری برای شفاخانه ها  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 3, 30, 3075, 30751, 'MoPH Stewardship Capacity and System Development ', 'نظارت بر توانمندی و توسعه سیستم وزارت صحت عامه', 'نظارت بر توانمندی و توسعه سیستم وزارت صحت عامه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 3, 30, 3075, 30752, 'Project Management ', 'مدیریت پروژه', 'مدیریت پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 3, 30, 3077, NULL, '16354 Non Formal Approach to Traning Education and Job in Afghanistan ( NATEJA) ', 'نگرش بر آموزش های غیر رسمی و کار در افغانستان ', 'نگرش بر آموزش های غیر رسمی و کار در افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 3, 30, 3077, 30770, 'Improvement in the Quality of Nonformal Training and Lobar Market Outcomes of Trainess ( NTLMT)', 'توسعه  کیفیت آموزش های غیر رسمی و بازار کار برای کارآموزان', 'توسعه  کیفیت آموزش های غیر رسمی و بازار کار برای کارآموزان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 3, 30, 3077, 30771, 'Project Management Capacity Building and Monitoring Evaluation ', 'نظارت و ارزیابی و ارتقای ظرفیت مدیریت پروژه ', 'نظارت و ارزیابی و ارتقای ظرفیت مدیریت پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 3, 30, 3077, 30772, 'Piloting Entrepreurnship Amoung Unskilled and illiterate Young Afghans ', 'پروژه آزمایشی کارآفرینی برای جوانان بیسواد و بی مهارت', 'پروژه آزمایشی کارآفرینی برای جوانان بیسواد و بی مهارت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 3, 30, 3078, NULL, '17012 CASA-1000 Community Support Program (P149410)', 'پروژه حمایت جامعه CASA - ( ARTF-WB Grant No TF017012)', 'پروژه حمایت جامعه CASA - ( ARTF-WB Grant No TF017012)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 3, 30, 3078, 30780, 'Community Grants for Sub Project', 'کمک های اجتماعی  برای پروژه های فرعی ', 'کمک های اجتماعی  برای پروژه های فرعی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 3, 30, 3078, 30781, 'Community Mobilization', 'بسیج اجتماع ', 'بسیج اجتماع ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 3, 30, 3078, 30782, 'Project Implementation Support ', 'حمایت از تطبیق پروژه', 'حمایت از تطبیق پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 3, 30, 3078, 30783, 'Communications and Out reach ', 'ارتباطات و توسعه ', 'ارتباطات و توسعه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 3, 30, 3078, 30784, 'Goods Works, Consutants, Services and Training; and Block Grants under Part A of the Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 3, 30, 3078, 30785, 'Incremental Poperating Costs', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 3, 30, 3078, 30786, 'Unallocated', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 3, 30, 3079, NULL, 'Additional Financing for on Farm Water management Project (OFWMP)', 'تامین مالی اضافی بمنظور مدیریت پروژه اب و فارم', 'تامین مالی اضافی بمنظور مدیریت پروژه اب و فارم', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 3, 30, 3079, 30790, 'Support productivity enhancement ', 'پشتیبانی برای افزایش بهره وری', 'پشتیبانی برای افزایش بهره وری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 3, 30, 3080, NULL, 'TF0A1691- Naghlu Hydropower Rehabilitaiton Project (NHRP)\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 3, 30, 3080, 30800, 'Mechanical Electrical and Electromechanical work\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 3, 30, 3080, 30801, 'Dam Safety and Power Generation Improvement', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 3, 30, 3080, 30802, 'Environmental and Social sustainability Project Management support and future project preparation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 3, 30, 3081, NULL, '93513-ARTF Additional Financing for Power system Development Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 3, 30, 3081, 30810, 'Distrubution system rehabilitation ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 3, 30, 3081, 30811, 'rehabilitation of Transmission Switchyards', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 3, 30, 3081, 30812, 'Institutiional Capacity building and Project Management Support ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 3, 30, 3082, NULL, 'A2026 DABS Planning and Capacity Support Project ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 3, 30, 3082, 30820, 'DABS Staff Capacity Building ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 3, 30, 3082, 30821, 'Training Center Development ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 3, 30, 3083, NULL, 'A2839 Technical Assistance Facility Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 3, 30, 3083, 30830, 'Support the Continouse Performance of the Macro Fiscal Performance Directorate General', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 3, 30, 3083, 30831, 'Supporting the Continuos Improvement of Programs Imlementation and Coordination General Directorate', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 3, 30, 3084, NULL, 'A2907 Preparation of Digital Central Asia South Asia Project (Digital CASA)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 3, 30, 3084, 30840, 'Consultants Services Training and Workshops and Incremental operating Costs under The activites', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 3, 30, 3085, NULL, 'A1898 Preparation of Support to Afghan Land Authority Project ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 3, 30, 3085, 30850, 'Goods , Works , Non Consulting Services Training consultants, Services , Incremental Operating Cost Under the Activites', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 3, 30, 3086, NULL, 'Additional Financing for the Afghanistan Rural enterprise Development Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 3, 30, 3086, 30860, 'Community Led Enterprise Development ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 3, 30, 3086, 30861, 'Project Implementation Support ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 3, 30, 3086, 30862, 'Project Implement Support', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 3, 30, 3087, NULL, 'A3827 Citiziens Charter Afghanistan Project ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 3, 30, 3087, 30870, 'Goods , Works , Non Consulting Services Training consultants, Services ,training and incremental Operating costs incurred by MRRD Under Parts 2,3 and 4 the project ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 3, 30, 3087, 30871, 'Rural Area Services standard Grants', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 3, 30, 3087, 30872, 'Goods , Works , Non Consulting Services Training consultants, Services ,training and incremental Operating costs incurred by IDLG Under Parts 2,3 and 4 the project ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 3, 30, 3088, NULL, 'A3425 Preparation of Urban Development Support Program ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 3, 30, 3088, 30880, 'Goods Non Consulting Services Training consultants Services Incremental Operating ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 3, 30, 3089, NULL, 'A4809 Preparation of Afghansitan Extractive for Development ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 3, 30, 3089, 30890, 'Preservation of Archeolory at Mes Aynak Archeological Site ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 3, 30, 3089, 30891, 'Afghansitan Extractive industry Transarency inititive AEITI ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 3, 30, 3089, 30892, 'support for Extractive industries Development ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 3, 30, 3090, NULL, 'A5400-Womens empowerment National Priority Program ( WEE-NPP)PPG', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 3, 30, 3090, 30900, 'WEEP Project Preparation Grant ( PPG )', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 3, 30, 3091, NULL, 'A5630 Preparation Grant for Mazar-e Sharif Gas-to-Power Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 3, 30, 3091, 30910, 'Goods, Non-Consulting Services, Consultants\' Services, Incremental Operating Cost and Training under the Activities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 3, 30, 3092, NULL, 'TFOA6277 Fiscal Performance Improvement Support Project\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 3, 30, 3092, 30920, 'Budget as Tool For Development\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 3, 30, 3092, 30921, 'Revenue Mobilization \n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 3, 30, 3092, 30922, 'Treasury Management, Accountability and Transparencey', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 3, 30, 3092, 30923, 'Institutional Capacity Building and Performance Management\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 3, 30, 3093, NULL, 'USAID Contribution to the Afghanistan Reconstruction Trust Fund (ARTF)No TF05576: USAID Grant No: AID-306-1O-12-00001', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 3, 30, 3093, 30930, 'USAID Contribution to the Afghanistan Reconstruction Trust Fund (ARTF)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 3, 30, 3093, 30931, 'Fiscal Reforms\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 3, 30, 3093, 30932, 'Strategic Infrastructure PlanningImplementation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 3, 30, 3093, 30933, 'National Devlopment Strategy / NPP Design and Implementation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 3, 30, 3094, NULL, 'TF0A7113-AF-Afghanistan Sehatmandi Project Grant No TF0A7113-AF', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 3, 30, 3094, 30940, 'Improvng Service Delivery\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 3, 30, 3094, 30941, 'Strengthening the Health System and its performance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 3, 30, 3094, 30942, 'Strengthening Demand and Community Accountability for Key Health Services', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 3, 30, 3095, NULL, 'TF01A8009 Preparation of EQRA Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 3, 30, 3095, 30950, 'Goods, Non-consulting Services, Consulting Services, Training, and Incremental Operation Costs Under Activities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 3, 30, 3096, NULL, 'TF0A7087-Public Private Partnerships and Public Investment Advisory Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 3, 30, 3096, 30960, 'Strengthening Institutional and Technical Capacity', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 3, 30, 3096, 30961, 'Insfrastructure Project Preparation Facility', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 3, 30, 3096, 30962, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 3, 30, 3097, NULL, 'TF0A8312 Placing Labor Abroad, Connecting to Employment Domestically and addressing the Need of Youth', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 3, 30, 3097, 30970, 'Goods, Consulting Services, Non-consulting Services, Training and Workshops, and Incremental Operating Cost under the Activities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 3, 30, 3098, NULL, 'Women\'s Economic Empowerment Rural Devlopment Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 3, 30, 3098, 30980, 'Cost of the Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 3, 30, 3098, 30981, 'Seed Capital Grant\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 3, 30, 3099, NULL, 'TF0A9123 Tacking Afghanistan\'s Government HRM and Institutional Reforms Project ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 3, 30, 3099, 30990, 'Human Resources Capacity injection', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 3, 30, 3099, 30991, 'Personnel and payroll Mangment', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 3, 30, 3099, 30992, 'Support to Adminstrativ Reform', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 3, 30, 3099, 30993, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 3, 30, 3001, NULL, 'TF0A8449-Af  EQRA Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 3, 30, 3001, 30010, 'Equitable Access to Bsic Education', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 3, 30, 3001, 30011, 'Improving Learning Conditions', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 3, 30, 3001, 30012, 'Strenghening Education Sector Planning Capacity and Transparency', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 3, 30, 3001, 30013, 'Technical Assistance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 3, 30, 3003, NULL, 'Tf0A9092-AF Eshteghal Zaiee- Karmondena Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 3, 30, 3003, 30030, 'Regional and National Integration of Displaced People', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 3, 30, 3003, 30031, 'Short-term Employment opprtunities Reforms and Market Enabling infrastructure under IDLG', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 3, 30, 3003, 30032, 'Prioritized Urban investment in for (4) Provincial Cities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 3, 30, 3003, 30033, 'Market Enabling Infrastructure and Reform for Kabul Municipality', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 3, 30, 3003, 30034, 'Red Carpet and Project Coordination', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 3, 30, 3003, 30982, 'Catalytic Fund', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 3, 30, 3004, NULL, 'TF0A9089- Cities Investment Program', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 3, 30, 3004, 30040, 'Human Resources Capacity injection', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 3, 30, 3004, 30041, 'Personnel and payroll Mangment', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 3, 30, 3004, 30042, 'Support to Adminstrativ Reform', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 3, 30, 3004, 30043, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 3, 30, 3005, NULL, 'Afghanistan Extractive Sector Development Project (AESD)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 3, 30, 3005, 30050, 'Supporting Mining Transation ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 3, 30, 3005, 30051, 'Sustaining Gas Supply', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 3, 30, 3005, 30052, 'Strengthening Sector Governance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 3, 30, 3005, 30053, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 3, 30, 3006, NULL, ' \nTF0A9570-AF EQRA Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 3, 30, 3006, 30060, 'Equitable Access to Basic Education', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 3, 30, 3006, 30061, 'Improving Learning Conditions', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 3, 30, 3006, 30062, 'Strenghening Education Sector Planning Capacity and Transparency', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 3, 30, 3006, 30063, ' \nTechnical Assistance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 3, 30, 3007, NULL, 'Grant No TF0B2475 Preparartion of Afghanistan Agro-Water And Climate Resilince Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 3, 30, 3007, 30070, 'Conducting Detailed review Of Irrigation Scheme And Identifying Priority Irrigation Schemes For Investment Under The afghanistan Agro-Water And Climate Resilience Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 3, 30, 3007, 30071, 'Carrying out Of Surveys And Detailed Design Of Selected Irrigation Scheme', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 3, 30, 3007, 30072, 'Development Plans For Improving Crop Production And On-Farm Water Management Under Selected Schemes', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 3, 30, 3008, NULL, 'B5205-AF ESMAP Grant Agreement (Additional Financing for Covd -19 Emergency Response and Health Systems Preparedness Project)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 3, 30, 3008, 30080, 'Supporting Afghanistans Health Sector in the Purchase of Project Covid -19 Vaccine and Vaccine-Related Cold Chain Equipment', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 3, 32, NULL, NULL, 'WORLD BANK', 'بانک جهانی- دیگران', 'بانک جهانی- دیگران', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 3, 32, 3232, NULL, 'H665 & Q744-AF Advance for ICT Sector Development Project', 'H665 & Q744.AF- پیش پرداخت برای توسعه سکتور ICT افغانستان', 'H665 & Q744.AF- پیش پرداخت برای توسعه سکتور ICT افغانستان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 3, 32, 3232, 32320, 'Design of Afghanistan Backbone Connectivty Program', 'طراحی برنامه اتصال ستون فقرات افغانستان ', 'طراحی برنامه اتصال ستون فقرات افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 3, 32, 3232, 32321, 'Prep bidding Documents for the mobile shared services and infra platform', 'تهیه اسناد داوطلبی برای خدمات مبایل و نصب پایه ', 'تهیه اسناد داوطلبی برای خدمات مبایل و نصب پایه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 3, 32, 3232, 32322, 'Hiring Manager for innovation support program fund manager', 'استخدام مدیران برای حمایت از نوآوری مدیران بودجه ', 'استخدام مدیران برای حمایت از نوآوری مدیران بودجه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 3, 32, 3232, 32323, 'Design and Dev business plan for the establishment and operation of the ICT village', 'طرح و انکشاف پلان کاری برای ایجاد و عملکردICT در روستا  ', 'طرح و انکشاف پلان کاری برای ایجاد و عملکردICT در روستا  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 3, 32, 3232, 32324, 'Hiring Project management staff', 'استخدام کارمندان پروژه ', 'استخدام کارمندان پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 3, 32, 3252, NULL, 'H6810 AF Irrigation Restoration and Development Project', 'H6810 پروژه توسعه و احیاء مجدد آبیاری', 'H6810 پروژه توسعه و احیاء مجدد آبیاری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 3, 32, 3252, 32520, 'Rehablitation of irrigation Systems', 'احیاء سیستم آبیاری', 'احیاء سیستم آبیاری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 3, 32, 3252, 32521, 'Small Dams Development ', 'توسعه بند های کوچک', 'توسعه بند های کوچک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 3, 32, 3252, 32522, 'Establishment of Hydro Meteorological Facilities and Services ', 'ایجاد سهولت های خدماتی  آب و هوا شناسی ', 'ایجاد سهولت های خدماتی  آب و هوا شناسی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 3, 32, 3252, 32523, 'project management and Capacity Building ', 'مدیریت پروژه و ارتقای ظرفیت', 'مدیریت پروژه و ارتقای ظرفیت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 3, 32, 3254, NULL, 'H5310 AF afghanistanRural Enterprise Develoment Project', 'H5310 AF پروژه انکشاف سرمایه گذاری روستائی افغانستان ', 'H5310 AF پروژه انکشاف سرمایه گذاری روستائی افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 3, 32, 3254, 32540, 'Community led Enterprise Development', 'انجمن رهبری توسعه سرمایه گذاری  ', 'انجمن رهبری توسعه سرمایه گذاری  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 3, 32, 3254, 32541, 'Small and Medium Enterprise Development', 'انکشاف سرمایه گذاری بزرگ و کوچک', 'انکشاف سرمایه گذاری بزرگ و کوچک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 3, 32, 3254, 32542, 'Project Management Support ', 'حمایت مدیریت پروژه', 'حمایت مدیریت پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 3, 32, 3255, NULL, 'H7320 AF Finanacial Sector Rapid Response Project', 'H7320 AF  بخش مالی واکنش سریع پروژه  ', 'H7320 AF  بخش مالی واکنش سریع پروژه  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 3, 32, 3255, 32550, 'Audits of Commercial banks', 'تفتیش بانک ها ی تجارتی', 'تفتیش بانک ها ی تجارتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 3, 32, 3255, 32551, 'Modernization of Afghanistan national Payment System', 'نوسازی سیستم پرداختهای ملی افغانستان ', 'نوسازی سیستم پرداختهای ملی افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 3, 32, 3255, 32552, 'support to the Afghanistan institute of banking and Finanace', 'حمایت از انستیتوت بانکداری و مالی ', 'حمایت از انستیتوت بانکداری و مالی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 3, 32, 3255, 32553, 'Technical Assistance Training and Project implementation ', 'تطبیق پروژه و آموزش کمک های تخنیکی ', 'تطبیق پروژه و آموزش کمک های تخنیکی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `code_funds` (`id`, `fund_type_code`, `fund_code`, `sub_fund_code`, `fund_componenet_code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(295, 3, 32, 3257, NULL, 'H680-AF-Afghanistan New Market Development Project', 'H680-AF پروژه  توسعه مارکیت جدید افغانستان ', 'H680-AF پروژه  توسعه مارکیت جدید افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 3, 32, 3257, 32570, 'Facility for New Market Development', 'سهولت برای توسعه مارکیت جدید', 'سهولت برای توسعه مارکیت جدید', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 3, 32, 3257, 32571, 'Project Implementation Support and Technical Assistance to MoCI', 'حمایت تطبیق پروژه و  کمک های تخنیکی وزازت مخابرات', 'حمایت تطبیق پروژه و  کمک های تخنیکی وزازت مخابرات', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 3, 32, 3262, NULL, 'H792- Aghanistan Rural Access Project', 'H792 پروژه دسترسی به روستا های افغانستان', 'H792 پروژه دسترسی به روستا های افغانستان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 3, 32, 3262, 32620, 'Improvement and Maintenance of Secondary Road', 'حفظ و مراقت و توسعه جاده های دومی', 'حفظ و مراقت و توسعه جاده های دومی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 3, 32, 3262, 32621, 'Improvement and Maintenance of Tertiary Road', 'حفظ و مراقبت و توسعه جاده های سومی', 'حفظ و مراقبت و توسعه جاده های سومی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 3, 32, 3262, 32622, 'Program Planning and Development Institutional Strengthening and Program Coordination Support', 'پلانگذاری برنامه، حمایت هماهنگی برنامه و تقویت  انکشاف نهاد ها  ', 'پلانگذاری برنامه، حمایت هماهنگی برنامه و تقویت  انکشاف نهاد ها  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 3, 32, 3263, NULL, 'H834- Second Skills Development Project ', 'H834- پروژه دوم انکشاف مهارت ها', 'H834- پروژه دوم انکشاف مهارت ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 3, 32, 3263, 32630, 'Strengthening the TVET institutional System ', 'تقویت سیستم  آموزش های فنی و حرفوی ', 'تقویت سیستم  آموزش های فنی و حرفوی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 3, 32, 3263, 32631, 'Improving Performance of TVET schools and Institutes', 'انکشاف اجراات مکاتب و انستیتوت آموزش های فنی و حرفوی', 'انکشاف اجراات مکاتب و انستیتوت آموزش های فنی و حرفوی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 3, 32, 3263, 32632, 'Improving Teacher Competencies', 'تقویت توانائی های معلمین ', 'تقویت توانائی های معلمین ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 3, 32, 3263, 32633, 'Project Management Monitoring and evaluation and public awareness', 'مدیریت پروژه نظارت و ارزیابی و آگاهی عامه ', 'مدیریت پروژه نظارت و ارزیابی و آگاهی عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 3, 32, 3263, 32634, 'Improving Performance of TVET schools and Institutes', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 3, 32, 3263, 32635, 'Project management, Monitoring and Evaluation and Technical Assistance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 3, 32, 3263, 32636, 'TVET Sector Reform', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 3, 32, 3263, 32637, 'Project Implementatiom Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 3, 32, 3263, 32638, 'Financing Teacher salaries', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 3, 32, 3264, NULL, 'H829-AF System Enhancement for Health Action in Transition Project ', 'H829-AF انکشاف سیستم صحی در پروژه انتقالی ', 'H829-AF انکشاف سیستم صحی در پروژه انتقالی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 3, 32, 3264, 32641, 'Basic Package of Health Services and Essential Pachage of Hospital Services ', 'بسته های کمکهای اولیه خدمات صحی و بسته های ضروری برای شفاخانه ها  ', 'بسته های کمکهای اولیه خدمات صحی و بسته های ضروری برای شفاخانه ها  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 3, 32, 3264, 32642, 'MoPH stewardship Capacity and System Development ', 'نظارت بر ارتقای ظرفیت و توسعه سیستم وزارت صحت عامه ', 'نظارت بر ارتقای ظرفیت و توسعه سیستم وزارت صحت عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 3, 32, 3264, 32643, 'Progject Management ', 'مدیریت پروژه ', 'مدیریت پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 3, 32, 3264, 32644, 'Project Management Support Monitoring Reportin PMSMR and Incremental Operation Costs ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 3, 32, 3266, NULL, 'H848 Safety Nets and Pensions Support Project', 'اعانه نمبر H848 حمایت پروژه تقاعد و مصونیت ', 'اعانه نمبر H848 حمایت پروژه تقاعد و مصونیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 3, 32, 3266, 32660, 'Pension ', 'تقاعد ', 'تقاعد ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 3, 32, 3266, 32661, 'Safety Nets', 'مصونیت ', 'مصونیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 3, 32, 3266, 32662, 'Capicity Building and Project Management ', 'مدیریت پروژه و ارتقای ظرفیت ', 'مدیریت پروژه و ارتقای ظرفیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 3, 32, 3268, NULL, 'Q901 For central Asia South Aisia Transmission Project ( CASA-1000)', ' Q901   پروژه انتقالی آسیای مرکزی و آسیای جنوبی ( CASA-1000)', ' Q901   پروژه انتقالی آسیای مرکزی و آسیای جنوبی ( CASA-1000)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 3, 32, 3268, 32680, 'Project Preparation Advance ', 'پیش پرداخت آماده سازی پروژه', 'پیش پرداخت آماده سازی پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 3, 32, 3269, NULL, 'H894 Acces to Finance Project', 'پروژه دسترسی مالی ( GN.H894-F)', 'پروژه دسترسی مالی ( GN.H894-F)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 3, 32, 3269, 32690, 'Improving Acess to Financial Services for Micro and Small Enterprises ', 'توسعه دسترسی به خدمات مالی برای سرمایه گذاری کوچک', 'توسعه دسترسی به خدمات مالی برای سرمایه گذاری کوچک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 3, 32, 3269, 32691, 'Improving Acess to Financial services for Smal and Medium enterprises ', 'توسعه دسترسی به خدمات مالی برای سرمایه گذاری متوسط و کوچک', 'توسعه دسترسی به خدمات مالی برای سرمایه گذاری متوسط و کوچک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 3, 32, 3269, 32692, 'Credit Guarantee(MOF)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 3, 32, 3269, 32693, 'Technical Assistance (MOF)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 3, 32, 3270, NULL, 'Baghlan to Bamyan Road Rehabilitation Project (Q894-AF and D093 (THRCP)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 3, 32, 3270, 32700, 'Baghlan to Bamyan Road Rehabilitation Project (Q894-AF and D093 (THRCP)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 3, 32, 3270, 32701, 'Goods, Non-Consulting Services, Consultants\' Services, Training and Incremntal Operating Costs for the Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 3, 32, 3270, 32702, 'Work Under Part1 of the Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 3, 32, 3270, 32703, 'Refund of Preparation Avance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 3, 32, 3272, NULL, 'A0730 Higher Education Development Project ( HEDP )', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 3, 32, 3272, 32720, 'Higher Eduction Development Program ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 3, 32, 3272, 32721, 'Program Operation and Technical Support ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 3, 32, 3273, NULL, 'D076-AF Additional Financing for Second Customs Reform and Trade Facilition project ( CRTFP II)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 3, 32, 3273, 32730, 'Customs Infrastructure', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 3, 32, 3274, NULL, 'D2130 & D1390 -Citizens\' Charter Afghanistan Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 3, 32, 3274, 32740, 'Rural Area Service Standards Grants', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 3, 32, 3274, 32741, 'Operational Cost', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 3, 32, 3275, NULL, 'V0820 Modernizing Afghan State-Owned Banks', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 3, 32, 3275, 32750, 'Supporting Corporate Governance and Oversight of SOBs', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 3, 32, 3275, 32751, 'Supporting the Modernization of IT system and Business Process of SoBs', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 3, 32, 3275, 32752, 'Support for Project Coordination, Implementation and Monitoring ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 3, 32, 3276, NULL, 'D2080 Herat Electrification Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 3, 32, 3276, 32760, 'Electrification of Four Districts in Herat Province', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 3, 32, 3276, 32761, 'Grid Denisfication, Extension and Off-grid Pilots in Herat Province', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 3, 32, 3276, 32762, 'Technical Assistance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 3, 32, 3277, NULL, 'D1910-Urban Development Support Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 3, 32, 3277, 32770, 'Building an Urban Management Information System ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 3, 32, 3277, 32771, 'Institutional and Capacity Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 3, 32, 3277, 32772, 'Strenthening Urban Planning at National and Local Levels ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 3, 32, 3277, 32773, 'Feasibilty and Design Studies for Urabn Infrastructure', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 3, 32, 3277, 32774, 'Project Management and Administration', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 3, 32, 3278, NULL, 'D2070-AF Afghanistan Strategic Grain Reserve Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 3, 32, 3278, 32780, 'Institution Infrastructure and Capacity Building', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 3, 32, 3278, 32781, 'Physical Insrastructure', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 3, 32, 3278, 32782, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 3, 32, 3279, NULL, 'D2630-AF Fiscal Performance Improvement support Project\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 3, 32, 3279, 32790, 'Budget as Tool For Development\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 3, 32, 3279, 32791, 'Revenue Mobilization \n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 3, 32, 3279, 32792, 'Treasury Management, Accountability and Transparencey\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 3, 32, 3279, 32793, 'Institutional Capacity Building and Performance Management\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 3, 32, 3280, NULL, 'H927-AF Central Asia & South Asia Electricity Transmission and Trade Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 3, 32, 3280, 32800, 'Goods, Works, Non-Consulting services, and Consultants Services for parts A.1 and A.2 of the Project activities within the terriotry of the reciepent', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 3, 32, 3280, 32801, 'Goods, Non-Consulting Services, and Consultants\' Services Training and workshops and incremental operating costs for part B the project activities within the territory of the reciepent', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 3, 32, 3280, 32802, 'Refund of Project Preparation Advance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 3, 32, 3281, NULL, 'D2850-AF- Afghanistan Sehatmandi Project Grant No D2850-AF', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 3, 32, 3281, 32810, 'Improving Service Delivery', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 3, 32, 3281, 32811, 'Strengtheningthe Health System and Its Performance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 3, 32, 3281, 32812, 'Strengtheningthe Demand and Community Accountability for Key Health Services', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 3, 32, 3282, NULL, 'D2830-AF Mdernizing Afghan State Owned Banks Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 3, 32, 3282, 32820, 'Goods/cons/Non-Cons/Incre/OC Part 1', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 3, 32, 3282, 32821, 'Goods/cons/Non-Cons/Incre/OC Part 2', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 3, 32, 3282, 32822, 'Goods/cons/Non-Cons/Incre/OC Part 2c', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 3, 32, 3282, 32823, 'Refund of the Preparation Advance\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 3, 32, 3283, NULL, 'D2840-AF Public Private Patnerships and Public Investment Advisory Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 3, 32, 3283, 32830, 'Strengthening Institutional and Technical Capacity', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 3, 32, 3283, 32831, 'Infrastructure Project Preparation Facility', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 3, 32, 3283, 32832, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 3, 32, 3284, NULL, 'D381-AF Eductaion Quality Reform in Afghanistan (EQRA)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 3, 32, 3284, 32840, 'Equitable Access to Bsic Education', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 3, 32, 3284, 32841, 'Improving Learning Conditions', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 3, 32, 3284, 32842, 'Strengthning Education sector planning Capacity and Transparency', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 3, 32, 3284, 32843, 'Technical Assitance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 3, 32, 3285, NULL, 'D384-AF Women\'s Economic Empowerment Rural Development Project\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 3, 32, 3285, 32850, 'Community Mobilization and Institution Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 3, 32, 3285, 32851, 'Access to Finance\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 3, 32, 3285, 32852, 'Enterprices Development and Market Linkages\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 3, 32, 3285, 32853, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 3, 32, 3286, NULL, 'D2820-AF Digital Central Asia South Asia (CASA) Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 3, 32, 3286, 32860, 'Regional and Domestic Connectivity', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 3, 32, 3286, 32861, 'E-Government', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 3, 32, 3286, 32862, 'Enabling Environment Policy and Regulatory Framework', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 3, 32, 3286, 32863, 'Project Management and Institutional Strengthening', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 3, 32, 3287, NULL, 'D413-Af Tackling Afghanistans Governoment HRM and institutional Refrms Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 3, 32, 3287, 32870, 'Human Resources Capacity injection', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 3, 32, 3287, 32871, 'Personnel and payroll Mangment', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 3, 32, 3287, 32872, 'Support to Adminstrativ Reform', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 3, 32, 3287, 32873, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 3, 32, 3288, NULL, 'D416-Af Eshteghal Zaiee- Karmonda Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 3, 32, 3288, 32880, 'Regional and National Integration of Displaced People', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 3, 32, 3288, 32881, 'Short-term Employment opprtunities Reforms and Market Enabling infrastructure under IDLG', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 3, 32, 3288, 32882, 'Prioritized Urban investment in for (4) Provincial Cities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 3, 32, 3288, 32883, 'Market Enabling Infrastructure and Reform for Kabul Municipality', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 3, 32, 3288, 32884, 'Red Carpet and Project Coordination', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 3, 32, 3289, NULL, 'D414-AF Cities Investment Program', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 3, 32, 3289, 32890, 'Rehabilitation Municipal Infrastructure', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 3, 32, 3289, 32891, 'Strenghthen theMunicipal Finance Framework', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 3, 32, 3289, 32892, 'Improve the Municipal Management Framework', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 3, 32, 3289, 32893, 'Project Implementation Management and Technical Assistance Support ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 3, 32, 3290, NULL, 'opportunity for Maximizing Agribusiness Investment and Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 3, 32, 3290, 32900, 'Goods Consulting Sercices Non Consulting services Trainig Workshop Incremental Operating Costs under the Activities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 3, 32, 3291, NULL, 'D5210-AF Afghanistan Gas Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 3, 32, 3291, 32910, 'Sustaining Gas Sector Governance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 3, 32, 3291, 32911, 'Strengthening Gas Sector Governance\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 3, 32, 3291, 32912, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 3, 32, 3292, NULL, 'COVID 19 Emergency Response and Health System Preparedness Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 3, 32, 3292, 32920, 'Emergency COVID-19 Response', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 3, 32, 3292, 32921, 'Health Care Strengthening', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 3, 32, 3292, 32922, 'Mitigation of Social Impacts', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 3, 32, 3292, 32923, 'Contingent Emergency Response Component', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 3, 32, 3292, 32924, 'Implementation Management and Monitoring And Evaluation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 3, 32, 3293, NULL, ' \nGrant Number D723-AF Strengthening Afghanistan Financial Intermediation Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 3, 32, 3293, 32930, 'Strengthening Credit Guarantee Fund', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 3, 32, 3293, 32931, 'Small and Medium Enterprise Matching Grants Program', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 3, 32, 3293, 32932, 'Strengthening Deposit Insurance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 3, 32, 3293, 32933, 'Enhancing DABs Information Technology Infrastructure', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 3, 32, 3293, 32934, 'Strengthening DABs Regulatory and Supervisory Capacity', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 3, 32, 3293, 32935, ' \nProject Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 3, 32, 3293, 32936, 'Contingent Emergency Response Component', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 3, 33, NULL, NULL, 'Global Financing Facility ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 3, 33, 3301, 33010, 'TF0A7314 Afghanistan Sehatmandi Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 3, 33, 3301, 33011, 'Improving Service Delivery', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 3, 33, 3301, 33012, 'Strengthening the Health System and Its Performance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 3, 33, 3301, NULL, 'Strengthening Demand and Community Accountability for KeyHealth Services', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 3, 33, 3302, NULL, 'TFOA9123 D413-AF Tackling Afghanistans Government HRM and institutional Reforms Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 3, 33, 3302, 33020, 'Human Resources Capacity injection', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 3, 33, 3302, 33021, 'Personnel and payroll Mangment', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 3, 33, 3302, 33022, 'Support to Adminstrativ Reform', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 3, 33, 3302, 33023, 'Projct Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 3, 33, 3303, NULL, 'TF0A9092- AF&D416-AF Eshteghal Zaiee- Karmondena Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 3, 33, 3303, 33030, 'Regional and National integration of Displaced people', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 3, 33, 3303, 33031, 'Short -term Employment opportunities Reform and Market Enabling infrastructure under IDLG', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 3, 33, 3303, 33032, 'Prioritized Urban investment in four (4) Provincal Cities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 3, 33, 3303, 33033, 'Market Enabling Infrastructure and Reform for Kabul Municipality', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 3, 33, 3303, 33034, 'Red Carpet and Project Coordination', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 3, 33, 3304, NULL, 'TF0A9089&D414-AF Cities Investment Program', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 3, 33, 3304, 33040, 'Human Resorce Capacity Injection', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 3, 33, 3304, 33041, 'Personnel and payroll Mangment', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 3, 33, 3304, 33042, 'Support to Adminstrativ Reform', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 3, 33, 3304, 33043, 'project management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 3, 33, 3305, NULL, ' \nTF0A9598&D447-AF Afghanistan Land Admimistration System Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 3, 33, 3305, 33050, 'Land Policy and Insitiutional Strenghtening', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 3, 33, 3305, 33051, 'Developing Technological Capacity Information and System for land Afghanistan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 3, 33, 3305, 33052, 'Project Management Monitoring and Evaluation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 3, 33, 3306, NULL, 'TF0B0027&D4530-AF Payment Automation & integration of salaries in Afghanistan project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 3, 33, 3306, 33060, 'Biometric Identification system of civil servants & pensioners', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 3, 33, 3306, 33061, 'integration of the identification , verification , and payment systems', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 3, 33, 3306, 33062, 'Expansion of financial services and access point', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 3, 33, 3306, 33063, 'project management monitoring and evaluation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 3, 33, 3307, NULL, 'TF0B3543&D7110 COVID 19 Relief Efforts for Afghan Communities and Households (REACH) Project (August 27 .2020)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 3, 33, 3307, 33070, 'REACH Rural - Household Support in Rural and Peri Urban Area', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 3, 33, 3307, 33071, 'Reach Urban -Household Support in Provisional and capital cities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 3, 33, 3307, 33072, 'REACH Kabul-Household Support in Kabul', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 3, 33, 3307, 33073, 'Project Management Communities and Monitoring', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 3, 33, 3308, NULL, 'TFOB3535&D7120 Emergency Agriculture and Food Supply Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 3, 33, 3308, 33080, ' \nProductive Agriculture Water Systems', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 3, 33, 3308, 33081, 'Critical Food Supply Chain Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 3, 33, 3308, 33082, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 3, 33, 3308, 33083, 'Contingent Emergency Response', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 3, 33, 3309, NULL, 'Grant Number TF0B4254&D7470-AF Afghanstian Water Sanitation Hygiene Institutional Support Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 3, 33, 3309, 33090, 'COVID-19 Emergency Relief and Recovery', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 3, 33, 3309, 33091, ' \nSector Reform Institutional Strengthening and Capacity Building', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 3, 33, 3309, 33092, ' \nEnabling Inclusive Access to Safe Water', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 3, 33, 3309, 33093, 'Project Management and Monitoring', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 3, 33, 3309, 33094, ' \nContingent Emergency Response Component', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 3, 33, 3310, NULL, 'TFB5099&D5930 Covid-19 Emergency Response and Health System Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 3, 33, 3310, 33100, 'Emergency Covid -19 Response', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 3, 33, 3310, 33101, 'Health Care System Strengthening', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 3, 33, 3310, 33102, 'Mitigration of Social Impacts', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 3, 33, 3310, 33103, ' \nImplementation Management and Monitoring and Evaluation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 3, 33, 3310, 33104, ' \nContingent Emergency Response', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 3, 35, NULL, NULL, 'ASIAN DEVELOPMENT BANK', 'بانک انکشاف آسیایی', 'بانک انکشاف آسیایی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 3, 35, 3500, NULL, '9024-Road Employment Project For Settlement And Integration Of Returning Refugees And Displaced Persons- Kandahar Shinboldak Road Rehabilitation', ' 9024پروژه کاریابی بازسازی سرک سپین بولدک کندهار برای عودت مهاجرین و بیجاشدگان  ', ' 9024پروژه کاریابی بازسازی سرک سپین بولدک کندهار برای عودت مهاجرین و بیجاشدگان  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 3, 35, 3500, 35000, 'Road Employment Project For Settlement And Integration Of Returning Refugees And Displaced Persons- Kandahar Shinboldak Road Rehabilitation ( Ta-9024)', 'پروژه کاریابی بازسازی سرک سپین بولدک کندهار برای عودت مهاجرین و  بیجاشدگان       ( Ta-9024)', 'پروژه کاریابی بازسازی سرک سپین بولدک کندهار برای عودت مهاجرین و  بیجاشدگان       ( Ta-9024)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 3, 35, 3501, NULL, '0076-Road Employment Project For Settlement', '0076- پروژه  سرک برای کاریابی و استقرارمجدد', '0076- پروژه  سرک برای کاریابی و استقرارمجدد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 3, 35, 3501, 35010, 'Road Employment Project For Settlement 0076', '0076- پروژه  سرک برای کاریابی و استقرارمجدد', '0076- پروژه  سرک برای کاریابی و استقرارمجدد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 3, 35, 3502, NULL, '9038-Japan Fund For Poverty Reducti', '9038-بودجه جاپان برای محو فقر ', '9038-بودجه جاپان برای محو فقر ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 3, 35, 3502, 35020, 'Community Mobilization ', 'بسیج اجتماع ', 'بسیج اجتماع ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 3, 35, 3502, 35021, 'Infrastructure Development ', 'توسعه زیربنا', 'توسعه زیربنا', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 3, 35, 3502, 35022, 'Natural Resource Management ', 'مدیریت منابع طبعی ', 'مدیریت منابع طبعی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, 3, 35, 3502, 35023, 'Microcredit Development ', 'انکشاف قرضه های کوچک', 'انکشاف قرضه های کوچک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, 3, 35, 3503, NULL, '9097-JFPR Rehbilitation Of Bamian-Yakawlang Road', '9097- JFPR بازسازی سرک بامیان الی یکاولنگ', '9097- JFPR بازسازی سرک بامیان الی یکاولنگ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, 3, 35, 3503, 35030, ' Rehbilitation Of Bamian-Yakawlang Road', 'بازسازی سرک بامیان الی یکاولنگ', 'بازسازی سرک بامیان الی یکاولنگ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 3, 35, 3504, NULL, '9100-JFPR Rural Business Support Project', '9100-JFPR پروژه توسعه تجارت روستا', '9100-JFPR پروژه توسعه تجارت روستا', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 3, 35, 3504, 35040, 'Construction Of Potato Storage In Bamyan Province', 'ساخت ذخیره گاه کچالو در بامیان', 'ساخت ذخیره گاه کچالو در بامیان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 3, 35, 3505, NULL, '0167/0170-Water Resources Development Investment Program-MEW', '0167/0170- پروگرام سرمایه گذاری منابع آب MEW', '0167/0170- پروگرام سرمایه گذاری منابع آب MEW', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 3, 35, 3505, 35050, 'Northern Basin Development', 'توسعه حوضه شمال', 'توسعه حوضه شمال', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, 3, 35, 3505, 35051, 'Flood Management', 'مدیریت حواث طبعی سیلاب', 'مدیریت حواث طبعی سیلاب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 3, 35, 3505, 35052, 'Program Development', 'توسعه برنامه', 'توسعه برنامه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, 3, 35, 3505, 35053, 'Helmand Basin Water Resources Master Plan', 'ماستر پلان منابع آب حوضه هلمند', 'ماستر پلان منابع آب حوضه هلمند', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 3, 35, 3506, NULL, '0081- Road Network Development Project 1', '0081- پروژه شبکه توسعه سرک ', '0081- پروژه شبکه توسعه سرک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 3, 35, 3506, 35060, 'Road Network Development Project 1', ' پروژه شبکه توسعه سرک ', ' پروژه شبکه توسعه سرک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, 3, 35, 3506, 35061, 'Construction Of 143 Km Road Between Bala Murghab And Leman ', 'ساخت 143 کیلومتر سرک بین بالا مرغاب و لمن ', 'ساخت 143 کیلومتر سرک بین بالا مرغاب و لمن ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, 3, 35, 3506, 35062, 'Rehabilitation Of Works On Various Section ', 'بازسازی کارخانه در بخش های مختلف', 'بازسازی کارخانه در بخش های مختلف', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, 3, 35, 3506, 35063, 'Maintainance Works On Regional Road For 3 Years', 'نگهداری کارخانه در سرک های مناطق مربوطه به مدت 3 سال', 'نگهداری کارخانه در سرک های مناطق مربوطه به مدت 3 سال', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, 3, 35, 3506, 35064, 'Mpws Capacity Development ', 'ارتقاء ظرفیت Mpws ', 'ارتقاء ظرفیت Mpws ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 3, 35, 3507, NULL, '9030 Primary Health Care For Poor', '9030 خدمات اولیه صحی برای فقرا', '9030 خدمات اولیه صحی برای فقرا', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 3, 35, 3507, 35070, 'Primary Health Care For Poor', 'خدمات اولیه صحی برای فقرا', 'خدمات اولیه صحی برای فقرا', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, 3, 35, 3508, NULL, '0004 Power Transmission And Distribution', '0004 انتقال  و توزیع برق ', '0004 انتقال  و توزیع برق ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, 3, 35, 3508, 35080, 'Adb00004 Grid Substations ', 'Adb0000 شبکه سب اتیشن ', 'Adb0000 شبکه سب اتیشن ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, 3, 35, 3508, 35081, 'Adb0004 Distribution Systems', 'Adb0000 سیستم توزیع', 'Adb0000 سیستم توزیع', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, 3, 35, 3508, 35082, 'Adb0004 Connection Kits', 'Adb0000 جعبه های اتصال', 'Adb0000 جعبه های اتصال', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 3, 35, 3508, 35083, 'Power Transmation And Distribution Prpj (Grant)', 'اعانه - پروژه انتقال وتوزیع برق ', 'اعانه - پروژه انتقال وتوزیع برق ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 3, 35, 3509, NULL, '9039 -JFPR-Rural Recovery Through Community Based Irrigation Rehab Project', ' 9039- JFPR - پروژه بازسازی پوشش آبیاری روستاها ', ' 9039- JFPR - پروژه بازسازی پوشش آبیاری روستاها ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, 3, 35, 3509, 35090, '9039 -JFPR-Rural Recovery Through Community Based Irrigation Rehab Project', ' 9039- JFPR - پروژه بازسازی پوشش آبیاری روستاها ', ' 9039- JFPR - پروژه بازسازی پوشش آبیاری روستاها ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, 3, 35, 3510, NULL, '9060-JFPR-The Balkh River Basin Integrated Water Resources Manag Project', ' 9060- JFPR - پروژه منابع یکجا سازی دریای حوزه بلخ ', ' 9060- JFPR - پروژه منابع یکجا سازی دریای حوزه بلخ ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, 3, 35, 3510, 35100, 'Jfpr9060Afg-The Balkh River Basin Integrated Water Resources Manag Project', ' 9060- JFPR - پروژه منابع یکجا سازی دریای حوضه بلخ ', ' 9060- JFPR - پروژه منابع یکجا سازی دریای حوضه بلخ ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 3, 35, 3511, NULL, '0012-Qaisar- Bala Murghab Road Project', '0012- پروژه سرک بالامرغاب الی قیسار', '0012- پروژه سرک بالامرغاب الی قیسار', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 3, 35, 3511, 35110, 'Rehabilitation Of Primary Road Section', 'بازسازی سرک های بخش ابتدائی', 'بازسازی سرک های بخش ابتدائی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 3, 35, 3511, 35111, 'Provision Of Road Tolling Facility', 'تهیه سهولت ها برای عوارض سرک', 'تهیه سهولت ها برای عوارض سرک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 3, 35, 3511, 35112, 'Hiv/Aids And Anti Human Traffiching Prevention And Awareness Campaign', 'کمپاین HIV/Aids جلوگیری از قاچاق انسان و کمپاین آگاهی دهی', 'کمپاین HIV/Aids جلوگیری از قاچاق انسان و کمپاین آگاهی دهی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 3, 35, 3511, 35113, 'Construction Supervision And Monitoring', 'نظارت و ارزیابی ساخت و ساز', 'نظارت و ارزیابی ساخت و ساز', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, 3, 35, 3511, 35114, 'Incremental Project Management Support', 'ارتقاء حمایت از مدیریت پروژه', 'ارتقاء حمایت از مدیریت پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, 3, 35, 3513, NULL, '0054-North - South Corridor Project', '0054 -پروژه راه شمال - جنوب', '0054 -پروژه راه شمال - جنوب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 3, 35, 3513, 35130, 'Rehabilitation Of North-South National Highway', 'بازسازی شاهراه شمال - جنوب', 'بازسازی شاهراه شمال - جنوب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, 3, 35, 3513, 35131, 'Resettlement', 'اسکان مجدد', 'اسکان مجدد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, 3, 35, 3513, 35132, 'Hiv/Aids Prevention And Anti - Human Trafficking Awareness Campaing', 'جلوگیری از HIV/Aids و کمپاین آگاهی دهی از قاچاق اسنان', 'جلوگیری از HIV/Aids و کمپاین آگاهی دهی از قاچاق اسنان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, 3, 35, 3514, NULL, '9037-JFPR-Assistance For Emergency Infrastructure Rehabilitation And Reconstruction Project', '9037-JFPR کمک به بازسازی اضطراری پروژه های زیربنایی ', '9037-JFPR کمک به بازسازی اضطراری پروژه های زیربنایی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 3, 35, 3514, 35140, 'Assistance For Emergency Infrastructure Rehabilitation And Reconstruction Project ( Jfpr 9037-Afg)', '9037-JFPR کمک به بازسازی اضطراری پروژه های زیربنایی ', '9037-JFPR کمک به بازسازی اضطراری پروژه های زیربنایی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 3, 35, 3515, NULL, '0033-Western Basins Water Resources Mangement Project', '0033-طرح  مدیریت منابع آب حوضه غرب', '0033-طرح  مدیریت منابع آب حوضه غرب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 3, 35, 3515, 35150, 'Western Basins Water Resources Mangement Project', 'طرح  مدیریت منابع آب حوضه غربCIDAs ', 'طرح  مدیریت منابع آب حوضه غربCIDAs ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 3, 35, 3515, 35151, 'CIDA s Contribution to western Basins Water Resource Management project', 'کمک به پروژه مدیریت منابع آب حوضه غرب', 'کمک به پروژه مدیریت منابع آب حوضه غرب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, 3, 35, 3516, NULL, '0067-Private Sector And Financial Market Development Program', '0067- برنامه تسعه ماریکت مالی و سکتور خصوصی', '0067- برنامه تسعه ماریکت مالی و سکتور خصوصی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, 3, 35, 3516, 35160, 'Private Sector And Financial Market Development Program', 'انکشاف برنامه سکتور خصوصی و بازار مالی ', 'انکشاف برنامه سکتور خصوصی و بازار مالی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, 3, 35, 3517, NULL, '0135-Road Network Development Investment Program Project 1', '0135- پروگرام توسعه شبکه سرمایه گذاری جاده ها ', '0135- پروگرام توسعه شبکه سرمایه گذاری جاده ها ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 3, 35, 3517, 35170, 'Civil Works And Construction Supervision And Monitoring For The Andkhoy Qaisar Road Project', 'کار عمران و بازسازی و نظارت  به پروژه سرک سازی اندخوی قیسار  ', 'کار عمران و بازسازی و نظارت  به پروژه سرک سازی اندخوی قیسار  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 3, 35, 3517, 35171, 'Civil Work And Project Management And Monitoring For The Northsouth Corridor Project', 'مدیریت پروژه و کار عمران و نظارت از سرک شمال جنوب', 'مدیریت پروژه و کار عمران و نظارت از سرک شمال جنوب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 3, 35, 3518, NULL, '0126-Agriculture Market Infrastructure Project', '0126- پروژه زیربنا مارکیت زراعت ', '0126- پروژه زیربنا مارکیت زراعت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 3, 35, 3518, 35180, 'Improving Agriculture Marketing Infrastrure', 'توسعه زیربنا مارکیت زراعت', 'توسعه زیربنا مارکیت زراعت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 3, 35, 3518, 35181, 'Project Management And Capacity Support', 'مدیریت پروژه و انکشاف توانائی ها', 'مدیریت پروژه و انکشاف توانائی ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 3, 35, 3519, NULL, '0161-Hairatan To Mazar E Sharif Railway Project', '0161- پروژه خط آهن حیرتان الی مزارشریف', '0161- پروژه خط آهن حیرتان الی مزارشریف', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 3, 35, 3519, 35190, 'Railway Construction ', 'ساخت راه آهن ', 'ساخت راه آهن ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 3, 35, 3519, 35191, 'Railway Sector And Institution Development', 'توسعه سکتور خط آهن ', 'توسعه سکتور خط آهن ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 3, 35, 3520, NULL, '0167/0170Nangarhar Valley Development Authority Ma', '0167/0170-  پروژه توسعه قریه های ننگرهار  ', '0167/0170-  پروژه توسعه قریه های ننگرهار  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, 3, 35, 3520, 35200, '0167/0170Nangarhar Valley Development Authority Ma', ' پروژه توسعه قریه های ننگرهار  ', ' پروژه توسعه قریه های ننگرهار  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, 3, 35, 3521, NULL, '0134-AFG Engery Sector Development Program', '0134-AFG برنامه توسعه سکتور های انرژی', '0134-AFG برنامه توسعه سکتور های انرژی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, 3, 35, 3521, 35210, 'Sheberghan Gas Rehabilitation Project', 'پروژه بازسازی گاز شبرغان', 'پروژه بازسازی گاز شبرغان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 3, 35, 3521, 35211, 'Subsidiary Financing to Da Afghanistan Breshna Sherkat (DABS)', 'سبسایدی مالی برای برشنا شرکت', 'سبسایدی مالی برای برشنا شرکت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 3, 35, 3522, NULL, '0025-AFG Road Network Development Program 2', '0025- AFG- پروگرام دوم توسعه جاده ها', '0025- AFG- پروگرام دوم توسعه جاده ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 3, 35, 3522, 35220, 'Jabul Seraj Nijrab Road Project', 'پروژه سرک جبل سراج - نجراب ', 'پروژه سرک جبل سراج - نجراب ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, 3, 35, 3522, 35221, 'Bagrami Separi Road Project', 'پروژه سرک سپیری - بگرامی ', 'پروژه سرک سپیری - بگرامی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, 3, 35, 3523, NULL, '0230 Regional Power Transmission Interconnection Project', '0025-  پروژه اتصال برق ساحوی ', '0025-  پروژه اتصال برق ساحوی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, 3, 35, 3523, 35230, 'Transmission ', 'انتقال', 'انتقال', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, 3, 35, 3523, 35231, 'Substation', 'سب استیشن ', 'سب استیشن ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, 3, 35, 3524, NULL, '084-AFG Energy Sector Development Investment Program 2', '084-AFG  برنامه دوم  سرمایه گذاری انکشاف سکتور انرژی ', '084-AFG  برنامه دوم  سرمایه گذاری انکشاف سکتور انرژی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 3, 35, 3524, 35240, '084-AFG Energy Sector Development Investment Program 2', ' برنامه دوم  سرمایه گذاری انکشاف سکتور انرژی ', ' برنامه دوم  سرمایه گذاری انکشاف سکتور انرژی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 3, 35, 3525, NULL, '0052-Western Basins Water Resources Management Project', '0052- پروژه طرح منابع آب حوضه غرب', '0052- پروژه طرح منابع آب حوضه غرب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, 3, 35, 3525, 35250, 'CIDA s Contribution to western Basins Water Resource Management project', 'کمک به پروژه مدیریت منابع آب حوضه غربCIDA ', 'کمک به پروژه مدیریت منابع آب حوضه غربCIDA ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, 3, 35, 3526, NULL, '00261-Transport Network Development Investment Program  Tranche 1', '00261-  برنامه سرمایه گذاری  توسعه شبکه ترانسپورت', '00261-  برنامه سرمایه گذاری  توسعه شبکه ترانسپورت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, 3, 35, 3526, 35260, 'Reconstruction and Widening of the approximately 50 Km to Sapary Road', 'ساخت و توسعه 50 کیلومتر سرک سپری ', 'ساخت و توسعه 50 کیلومتر سرک سپری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, 3, 35, 3526, 35261, 'Rehabilitation of the approximately 51 Km Jabul Saraj to Nijrab Road', 'ساخت و توسعه 51 کیلومتر سرک  جبل سراج - نجراب', 'ساخت و توسعه 51 کیلومتر سرک  جبل سراج - نجراب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, 3, 35, 3526, 35262, 'Reconstruction of the Approximately 44 Km  Faizabad to baharak Road', 'ساخت و توسعه 44 کیلومتر سرک فیض اباد - بهارک ', 'ساخت و توسعه 44 کیلومتر سرک فیض اباد - بهارک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, 3, 35, 3526, 35263, 'Construction of a marshalling Yard for Railway line from Hairatan to Mazar E sharif ', 'ساخت احاطه حمل و نقل برای خط آهن حیرتان- مزارشریف  ', 'ساخت احاطه حمل و نقل برای خط آهن حیرتان- مزارشریف  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, 3, 35, 3526, 35264, 'MPW Management Capacity Development   PMO', 'وزارت فواید عامه - مدیریت ارتقا ظرفیت PMO  ', 'وزارت فواید عامه - مدیریت ارتقا ظرفیت PMO  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, 3, 35, 3527, NULL, '0262-  Transport Network Develoment Investment Program Tranche 1', '0262- برنامه سرمایه گذاری توسعه شبکه ترانسپورت بخش 1', '0262- برنامه سرمایه گذاری توسعه شبکه ترانسپورت بخش 1', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, 3, 35, 3527, 35270, 'Operation and mantenance Suprot for the Railway Hairatan to mazar e Sharif', 'بکارانداختن و نگهداری خط آهن مزار - حیرتان ', 'بکارانداختن و نگهداری خط آهن مزار - حیرتان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, 3, 35, 3527, 35271, 'Reconstruction and Widening of the Approximately 50 km bagramy to Sapary Road', 'ساختن و توسعه 50 کیلومتر سرک بگرامی الی سپری', 'ساختن و توسعه 50 کیلومتر سرک بگرامی الی سپری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, 3, 35, 3527, 35272, 'Construction of Security Upgrade', 'ارتقاء تامین امنیت ', 'ارتقاء تامین امنیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, 3, 35, 3528, NULL, '0244-Road Network Dev Investment Program Project 2', '0244- پروگرام دوم پروژه توسعه سرمایه گذاری شبکه سرک سازی بخش 2 ', '0244- پروگرام دوم پروژه توسعه سرمایه گذاری شبکه سرک سازی بخش 2 ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, 3, 35, 3528, 35280, 'Rehabilitation of The Qaisar-Bala Murghab Section (90 km) of Herat-Andkhoy Road', 'بازسازی سرک بالامرغاب - قیسار بطول 90 کیلومتر- هرات- اندخوی', 'بازسازی سرک بالامرغاب - قیسار بطول 90 کیلومتر- هرات- اندخوی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, 3, 35, 3528, 35281, 'Construction of the Bala Murghab-Laman Section (143km)', 'ساخت سرک بلامرغاب- لمن- 143 کیلومتر', 'ساخت سرک بلامرغاب- لمن- 143 کیلومتر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, 3, 35, 3529, NULL, '0280-Energy Sector Development Investment Program Tranche 3', '0280 برنامه سرمایه گذاری توسعه سکتور انرژی بخش 3', '0280 برنامه سرمایه گذاری توسعه سکتور انرژی بخش 3', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, 3, 35, 3529, 35290, 'Rehabilitation and upgrading of Hydropower Plant with 4.8 megawatt (MW) installedCapacity', 'احیاء و تجدید ماشین آلات  نیروگاه آبی با 4.8 میگاوات ظرفیت  ', 'احیاء و تجدید ماشین آلات  نیروگاه آبی با 4.8 میگاوات ظرفیت  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, 3, 35, 3529, 35291, 'Replacement of approximately 30 Kilometers of 3.3 Kilovolt distribution lines to 20 KV line', 'تعویض و نصب تقریبآ 30 کیلومتر کیبل 3.3 کیلو ولت به 20 کیلوولت', 'تعویض و نصب تقریبآ 30 کیلومتر کیبل 3.3 کیلو ولت به 20 کیلوولت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, 3, 35, 3529, 35292, 'Replacement and installion of end User meters', 'تعویض و نصب میتر های آخرین استفاده کننده', 'تعویض و نصب میتر های آخرین استفاده کننده', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, 3, 35, 3529, 35293, 'DABS Capacity Building for project implementation and operation and maintenance', 'ارتقای ظرفیت برای تطبیق پروژه و  عملکرد', 'ارتقای ظرفیت برای تطبیق پروژه و  عملکرد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, 3, 35, 3530, NULL, '0281- Energy Sector Development Investment Program Tranche 3', '0281- پروگرام  سرمایه گذرای توسعه سکتور انرژی بخش 3', '0281- پروگرام  سرمایه گذرای توسعه سکتور انرژی بخش 3', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 3, 35, 3530, 35301, '(81)Rehabilitation and upgrading of Hydropower Plant with 4.8 megawatt (MW) installedCapacity', 'احیاء و نصب ماشین آلات  نیروگاه آبی با 4.8 میگاوات ظرفیت  ', 'احیاء و نصب ماشین آلات  نیروگاه آبی با 4.8 میگاوات ظرفیت  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, 3, 35, 3530, 35302, '(81)Replacement of approximately 30 Kilometers of 3.3 Kilovolt distribution lines to 20 KV line', 'تعویض تقریباً 30 کیلومتر کیبل 3.3 کیلوولت به 20 کیلوولت   ', 'تعویض تقریباً 30 کیلومتر کیبل 3.3 کیلوولت به 20 کیلوولت   ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, 3, 35, 3530, 35303, '(81)Replacement and installion of end User meters', 'تعویض و نصب میتر های آخرین استفاده کننده', 'تعویض و نصب میتر های آخرین استفاده کننده', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, 3, 35, 3530, 35304, '(81)DABS Capacity Building for project implementation and operation and maintenance', 'ارتقای ظرفیت برای تطبیق پروژه و عملکرد', 'ارتقای ظرفیت برای تطبیق پروژه و عملکرد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, 3, 35, 3531, NULL, '0282- Energy Sector Development Investment Program Tranche 3', '0282- پروگرام  سرمایه گذاری توسعه سکتور انرژی بخش 3', '0282- پروگرام  سرمایه گذاری توسعه سکتور انرژی بخش 3', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, 3, 35, 3531, 35310, '(82)Rehabilitation and upgrading of Hydropower Plant with 4.8 megawatt (MW) installedCapacity', 'احیاء و نصب ماشین آلات  نیروگاه آبی با 4.8 میگاوات ظرفیت  ', 'احیاء و نصب ماشین آلات  نیروگاه آبی با 4.8 میگاوات ظرفیت  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `code_funds` (`id`, `fund_type_code`, `fund_code`, `sub_fund_code`, `fund_componenet_code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(586, 3, 35, 3531, 35311, '(82)Replacement of approximately 30 Kilometers of 3.3 Kilovolt distribution lines to 20 KV line', 'تعویض تقریباً 30 کیلومتر کیبل 3.3 کیلوولت به 20 کیلوولت   ', 'تعویض تقریباً 30 کیلومتر کیبل 3.3 کیلوولت به 20 کیلوولت   ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 3, 35, 3531, 35312, '(82)Replacement and installion of end User meters', 'تعویض و نصب میتر های آخرین استفاده کننده', 'تعویض و نصب میتر های آخرین استفاده کننده', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 3, 35, 3531, 35313, '(82)DABS Capacity Building for project implementation and operation and maintenance', 'ارتقای ظرفیت برای تطبیق پروژه و عملکرد', 'ارتقای ظرفیت برای تطبیق پروژه و عملکرد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 3, 35, 3532, NULL, 'Grant 0291-AFG Road Network Development Investment Program Project 2', 'اعانه 0291  برنامه پروژه  دوم  سرمایه گذاری توسعه شبکه جاده ها', 'اعانه 0291  برنامه پروژه  دوم  سرمایه گذاری توسعه شبکه جاده ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, 3, 35, 3532, 35320, 'Civil Works ', 'تاسیسات و امور ساختمان', 'تاسیسات و امور ساختمان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, 3, 35, 3533, NULL, 'JFPR 9128 Development of Mini Hydropower Plants in Badakhshan and Bamyan Province jSuproject of ESDIP Project01', 'پروژه 01 ESDIP ', 'پروژه 01 ESDIP ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, 3, 35, 3533, 35330, 'JFPR 9128 Development of Mini Hydropower Plants in Badakhshan and Bamyan Province jSuproject of ESDIP Project01', 'پروژه 01', 'پروژه 01', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, 3, 35, 3534, NULL, '9167 JFPR enhanced Agricultural Value Chains For Sustainable Livelihoods', '9167- JFPR-افزایش ارزش های  زراعتی برای معیشت پایدار  ', '9167- JFPR-افزایش ارزش های  زراعتی برای معیشت پایدار  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 3, 35, 3534, 35340, 'Enhanced Agricultural Value Chains for Sustainable Livelihoods', 'افزایش ارزش های  زراعت برای معیشت پایدار  ', 'افزایش ارزش های  زراعت برای معیشت پایدار  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, 3, 35, 3534, 35341, 'Operational Budget of Project', 'بودجه عملیاتی پروژه ', 'بودجه عملیاتی پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, 3, 35, 3535, NULL, '9165- JFPRcommunity Based Irrigation Rehabilitation and Development Project', '9165- JFPR  انکشاف و بازسازی  پروژه آبیاری ', '9165- JFPR  انکشاف و بازسازی  پروژه آبیاری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, 3, 35, 3535, 35350, 'Community Based Irrigation Rehabilitation and Development Project', ' انکشاف و بازسازی  پروژه آبیاری ', ' انکشاف و بازسازی  پروژه آبیاری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, 3, 35, 3535, 35351, 'Operational Budget of Project', 'بودجه عملیاتی پروژه ', 'بودجه عملیاتی پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, 3, 35, 3536, NULL, '0327-Transport Network Development Investment Program Tranche 02', '0327- بخش دوم- پروگرام توسعه سرمایه گذاری شبکه ترانسپورت', '0327- بخش دوم- پروگرام توسعه سرمایه گذاری شبکه ترانسپورت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, 3, 35, 3536, 35360, 'Reconstruction of Section 2 of the kabul Jalalabad Road ( 106 Km)', 'بخش دوم بازسازی سرک کابل- جلال آباد ( 106 کیلومتر)', 'بخش دوم بازسازی سرک کابل- جلال آباد ( 106 کیلومتر)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, 3, 35, 3536, 35361, 'Rehabilitation of Chah E Anjir to Gershk Road', 'بازسازی سرک چاه انجیر الی گرشک', 'بازسازی سرک چاه انجیر الی گرشک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, 3, 35, 3536, 35362, 'Reconstruction of Sharan Angoor Ada Road', 'بازسازی سرک شاران انگور ادا ', 'بازسازی سرک شاران انگور ادا ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, 3, 35, 3536, 35363, 'Management Capacity Development ', 'ارتقاء ظرفیت مدیریت', 'ارتقاء ظرفیت مدیریت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, 3, 35, 3536, 35364, 'Kandahar to Yakawlang Pre Feasibility Study', 'مطالعه قبلی امکانپذیری ساخت سرک یکاولنگ الی کندهار', 'مطالعه قبلی امکانپذیری ساخت سرک یکاولنگ الی کندهار', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, 3, 35, 3537, NULL, '0328 Transport Network Development Investment Program Tranche 02', '0328- بخش 02 -  برنامه توسعه سرمایه گذاری شبکه ترانسپورت', '0328- بخش 02 -  برنامه توسعه سرمایه گذاری شبکه ترانسپورت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, 3, 35, 3537, 35370, 'Reconstruction of Sapary to Jalalabad Road SubProject ', 'پروژه فرعی ساخت سرک جلال آباد الی سپری ', 'پروژه فرعی ساخت سرک جلال آباد الی سپری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, 3, 35, 3537, 35371, 'Rehabiliation of Chah E Anjir to Gershk Road Sub Project', 'پروژه فرعی ساخت سرک چاه انجیر الی گرشک ', 'پروژه فرعی ساخت سرک چاه انجیر الی گرشک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, 3, 35, 3539, NULL, '0411- North Flood Damaged Infrastucture Emergency Rehabilitation Project ', '0411-  پروژه اضطراری بازسازی زیرساخت های تخریب شده سیلاب های شمال', '0411-  پروژه اضطراری بازسازی زیرساخت های تخریب شده سیلاب های شمال', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, 3, 35, 3539, 35390, 'Rehabilitation of Flood Damaged infrastructure(MRRD)', 'بازسازی زیربنا های تخریب شده توسط سیلاب', 'بازسازی زیربنا های تخریب شده توسط سیلاب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, 3, 35, 3539, 35391, 'Project Implementation Support (MRRD)', 'حمایت تطبیق پروژه ', 'حمایت تطبیق پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, 3, 35, 3539, 35392, 'Rehabilition of Flood Damaged Infrastructure ( MEW )', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, 3, 35, 3539, 35393, 'Project Implementation Support ( MEW ) ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, 3, 35, 3540, NULL, '0412-North Flood Damaged Infrastructure Emergency Eehabilitation Project ', '0412- پروژه اضطراری بازسازی زیرساخت های تخریب شده سیلاب های شمال', '0412- پروژه اضطراری بازسازی زیرساخت های تخریب شده سیلاب های شمال', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, 3, 35, 3540, 35400, 'Rehabilitation of Flood Amaged infrastucture (MRRD)', 'بازسازی زیربنا های تخریب شده توسط سیلاب', 'بازسازی زیربنا های تخریب شده توسط سیلاب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, 3, 35, 3540, 35401, 'Project Implementation Support  ( MRRD)', 'حمایت تطبیق پروژه ', 'حمایت تطبیق پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, 3, 35, 3540, 35402, 'Rehabilitaton of Flood Damaged infrastructure ( MEW)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, 3, 35, 3540, 35403, 'Project Implementation Support ( MEW )', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, 3, 35, 3541, NULL, '0362 Water Resources Development Investment Program Project 2', '0362 پروژه دوم برنامه توسعه سرمایه گذاری منابع آب ', '0362 پروژه دوم برنامه توسعه سرمایه گذاری منابع آب ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, 3, 35, 3541, 35410, 'Rehabilitaton of Lower Kokcha Irrigation System ', 'بازسازی سیستم آبیاری کوکچه پائین ', 'بازسازی سیستم آبیاری کوکچه پائین ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, 3, 35, 3541, 35411, 'Institutional Capacity ', 'ظرفیت سازمانی', 'ظرفیت سازمانی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(621, 3, 35, 3541, 35412, 'Project Management And Capacity Support', 'حمایت ظرفیت سازی و مدیریت پروژه ', 'حمایت ظرفیت سازی و مدیریت پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, 3, 35, 3542, NULL, ' 0422-AFGTransport Net work development Investment program Tranche 4', 'برنامه توسعه سرمایه گذاری شبکه ترانسپورت- بخش 4', 'برنامه توسعه سرمایه گذاری شبکه ترانسپورت- بخش 4', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, 3, 35, 3542, 35420, 'Goods border Crossing Point equipment for CAREC Corridors 5 and 6', 'تجهیز مرکز عبور اموال از مرز برای CAREC راه 5 و 6', 'تجهیز مرکز عبور اموال از مرز برای CAREC راه 5 و 6', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, 3, 35, 3542, 35421, 'Consulting Services', 'خدمات مشورتی', 'خدمات مشورتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, 3, 35, 3542, 35422, 'Reconstruction of Baharak to Eskhashim Road ( 108 Km) ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, 3, 35, 3542, 35423, 'Opreating Cost', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, 3, 35, 3543, NULL, '0332 Energy Sector Development investment Program Trance 4', '0332- برنامه توسعه سرمایه گذاری سکتور برق بخش 4', '0332- برنامه توسعه سرمایه گذاری سکتور برق بخش 4', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, 3, 35, 3543, 35430, 'New 500 KV transimission Line from Turkenistan - Andkhoy and From Andkhoy - Sheberghan  new 220KV transmission line from Sheberghan - Mazar e Sharif ', 'انتقال کیبل جدید 500 کیلوولت از ترکمنستان - اندخوی و از اندخوی- شبرغان و انتقال کیبل جید 220 کیلوولت شبرغان- مزارشریف', 'انتقال کیبل جدید 500 کیلوولت از ترکمنستان - اندخوی و از اندخوی- شبرغان و انتقال کیبل جید 220 کیلوولت شبرغان- مزارشریف', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, 3, 35, 3543, 35431, 'A new 220 KV substation at each of Ankhoy and Sheberghan and Expansion 220 KV substation at Mazar E sharif ', 'سب استیشن جدید 220 KV  در اندخوی و شبرغان و توسعه سب استین 220 KV  در مزارشریف ', 'سب استیشن جدید 220 KV  در اندخوی و شبرغان و توسعه سب استین 220 KV  در مزارشریف ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, 3, 35, 3543, 35432, 'Extension to existing 220 KV substations at pul e Alam and Gardez', 'تمدید سب استیشن موجوده 220 KV در پل علم و گردیز', 'تمدید سب استیشن موجوده 220 KV در پل علم و گردیز', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, 3, 35, 3543, 35433, 'New Distribution 20 KV and low voltage distribution lines and power connections at pul-e Alam ', 'توزیع جدید 220 KV و توزیع کیبل ولتاژ پایین اتصال برق در پل علم  ', 'توزیع جدید 220 KV و توزیع کیبل ولتاژ پایین اتصال برق در پل علم  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, 3, 35, 3543, 35434, 'Project management and Implementation support for DABS', 'مدیریت پروژه و حمایت تطبیق آن برای برشنا شرکت ', 'مدیریت پروژه و حمایت تطبیق آن برای برشنا شرکت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, 3, 35, 3544, NULL, '0377-AFG Energy Sector Development Investment Program Project 5', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, 3, 35, 3544, 35440, 'The Construction and Commisioning of a 500 kilovolt substation at dashte Alwan ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, 3, 35, 3544, 35441, 'Project Management and Implementation Supprot DABS', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, 3, 35, 3545, NULL, 'Transport Network Development Investment Program - Tranche3', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, 3, 35, 3545, 35450, 'Reconstruction of Dar I Suf to Yakawlang Road 178 Km', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, 3, 35, 3545, 35451, 'Feasibility Study for the Kabul Ring Road', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, 3, 35, 3545, 35452, 'Opreating Cost', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, 3, 35, 3546, NULL, 'G0490Prepartoin of Centeral Asia Regional Economic cooperation Corridors 5 and 6 (Salang Corridor ) Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, 3, 35, 3546, 35460, 'Consultancy', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, 3, 35, 3546, 35461, 'Equipment', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 3, 35, 3547, NULL, 'G0491Prepartoin of Centeral Asia Regional Economic cooperation Corridors 5 and 6 (Salang Corridor ) Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, 3, 35, 3547, 35470, 'Consultancy', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, 3, 35, 3547, 35471, 'Equipment', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, 3, 35, 3548, NULL, 'G0508 Road Asset Managemnt Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, 3, 35, 3548, 35480, 'Road Maintenance ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, 3, 35, 3548, 35481, 'Capacity Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, 3, 35, 3549, NULL, 'G0507 (EF) Panj Amu River Basin Sector Project ( MAIL)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, 3, 35, 3549, 35490, 'Civil Works', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, 3, 35, 3549, 35491, 'Operation Costs', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, 3, 35, 3550, NULL, 'G0506(SF) Panj Amu River Basin Sector Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, 3, 35, 3550, 35500, 'Civil Works', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, 3, 35, 3550, 35501, 'Operation Costs', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, 3, 35, 3551, NULL, '0374AFG(SF) North South Power Transmission Enhancement Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, 3, 35, 3551, 35510, 'Construction of a 500 KV Transmission line From Dashte Alwan to Kabul', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, 3, 35, 3551, 35511, 'Construction of a 500\\200 KV substation in Arghandy Kabul', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, 3, 35, 3551, 35512, 'Project Managemnt and Implementation Support for DABS', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, 3, 35, 3552, NULL, '0375-AFG(EF) Norht South Power Transimission Enhancement Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, 3, 35, 3552, 35520, 'Construction of a 500 KV Transmission line From Dashte Alwan to Kabul', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 3, 35, 3552, 35521, 'Construction of a 500\\200 KV substation in Arghandy Kabul', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, 3, 35, 3552, 35522, 'Project Managemnt and Implementation Support for DABS', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, 3, 35, 3553, NULL, '0464-Energy Supply Improvement Investment Program-Project 1', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(664, 3, 35, 3553, 35530, '500 Kilovolt transmission line from Sheberghan-Dashte Alwan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, 3, 35, 3553, 35531, '220 Kilovolt Transmission line from Andkhoy-Sheberghan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, 3, 35, 3554, NULL, '0465-Energy Supply Improvement Investment Program-Project 1', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, 3, 35, 3554, 35540, '500 Kilovolt transmission line from Sheberghan-Dashte Alwan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, 3, 35, 3554, 35541, '220 Kilovolt Transmission line from Andkhoy-Sheberghan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, 3, 35, 3555, NULL, '0521-Energy Supply Improvement Investment Program - Project 2', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, 3, 35, 3555, 35550, '500 MW Direct Back to Back Voltage Source Convertor Station at Daste Alwan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, 3, 35, 3555, 35551, '180 km of 220 kv Transmission line from Doshi to Bamyan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, 3, 35, 3555, 35552, '220 kv / 20kv Substation at Bamyan with a distribution network of 3000 km including 20000 new connections', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, 3, 35, 3556, NULL, '0522-Energy Supply improvement Investment Program- Project2', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, 3, 35, 3556, 35560, '500 MW Direct Back to Back Voltage Source Convertor Station at Daste Alwan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, 3, 35, 3556, 35561, '180 km of 220 kv Transmission line from Doshi to Bamyan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, 3, 35, 3556, 35562, '220 kv / 20kv Substation at Bamyan with a distribution network of 3000 km including 20000 new connections', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, 3, 35, 3557, NULL, '0523-Energy Supply Improvement Investment Program-Project 2', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, 3, 35, 3557, 35570, '500 MW Direct Back to Back Voltage Source Convertor Station at Daste Alwan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, 3, 35, 3557, 35571, '180 km of 220 kv Transmission line from Doshi to Bamyan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, 3, 35, 3557, 35572, '220 kv / 20kv Substation at Bamyan with a distribution network of 3000 km including 20000 new connections', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, 3, 35, 3558, NULL, 'G05545-AFG Energy Supply Improvement Investment Program Project 03\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, 3, 35, 3558, 35580, 'Construction of 20 MV Solar Photo voltaic Power plant, Installation of 20 MVA Transformer\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, 3, 35, 3558, 35581, 'Capacity Development Support to MEW and DABS\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, 3, 35, 3559, NULL, 'G0556-AFG Energy Supply Improvement Investment Program-Project 04\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, 3, 35, 3559, 35590, 'Construction of 190 km of 220 kv transmission line between Arghundab, Jalalabad\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, 3, 35, 3559, 35591, 'Expansion of the distribution network capacity in Nangarhar by Addition of 200 MWA\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, 3, 35, 3560, NULL, 'G 0634/0635-Energy Supply Improvement Investment Program - Project 5', 'z', 'z', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, 3, 35, 3560, 35600, '95 Kilometers of 220 - KV Transmission Line between Jalalabad and Asadabad', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, 3, 35, 3560, 35601, '69 Kilometers line between Ghazni Provincial Capital and Paktika Provincial Capital Sharana\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, 3, 35, 3560, 35602, '2X16 megavolt ampheres (MVA) substation in Sharana with Construction of 2 bays in an exiting Ghazni Substation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, 3, 35, 3560, 35603, '2x40 MVA Substation in Asadabad', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, 3, 35, 3560, 35604, '', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, 3, 35, 3561, NULL, '0620(Sf) Horticuiture Value Chain Development Sector Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, 3, 35, 3561, 35610, 'Improvement of HorticuIture and facilities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 3, 35, 3561, 35611, 'Development of National Capacity Horticulture Export Expansion and Import Substitution', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 3, 35, 3562, NULL, '0555-AFG(SF) Qaisar- Dari Bum Road project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, 3, 35, 3562, 35620, 'Construction of an approximately 151 Km two-Lane road section form Qaisar to Dari Bum as part of the Recients national ring road including appropriate drainage structure and highway safety features', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, 3, 35, 3562, 35621, 'Construction and/or installation of roadside infrastructure facilities for approximately60 Local communities inclding rural access roads culverts small-scale irrigation schemes schoolsand clinics', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, 3, 35, 3562, 35622, 'Provision of support for project management and construction supervision', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, 3, 35, 3562, 35623, 'Provision of Support for PMO operation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, 3, 35, 3562, 35624, 'Provision of support for institutional development of MPW including (i) development of national tranporatation codes manulas and standard (ii) development of the capacity of MPW survey design and construction and (iii) establisment of the national', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, 3, 35, 3563, NULL, '0655- AFG(SF)- Arghandab Integrated Water Resources Development Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, 3, 35, 3563, 35630, 'Dahla Capacity Increased', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, 3, 35, 3563, 35631, 'Reliability of Irrigation Water Supply Increased', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, 3, 35, 3563, 35632, 'Agricultural Water Productivity Improved', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 3, 35, 3563, 35633, 'Capacity in Water Resource Management and Use Strengthened', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, 3, 35, 3564, NULL, '0655-Arghandab Integrated Water Resources Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, 3, 35, 3564, 35640, 'NWARA\nOutput 1a: Raise the Main Dam and six saddle dams-NWARA', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, 3, 35, 3564, 35641, ' Output 1b: Road Allignment -MRRD', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, 3, 35, 3564, 35642, 'Output 1c: Capacity in Dam Operation and flow management improved -NWARA', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, 3, 35, 3564, 35643, ' Output 2a: Modernizing of AIS - NWARA', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, 3, 35, 3564, 35644, 'Output 2b: Improvement of Community Irrigation Services- MRRD', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, 3, 35, 3564, 35645, ' Output 3a: Demonstration of Innovation Agriculture On-farm Practices and Investment Options', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, 3, 35, 3564, 35646, 'Output 4: Capacity in Water Resource Management and ue stregthened', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, 3, 35, 3564, 35647, 'improvement of Community irrigation Services - NWARA', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, 3, 35, 3564, 35648, 'Capacity in Water Resource Management and  Use strengthened', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, 3, 35, 3564, 35649, 'Project Management Operations - MAIL', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, 3, 35, 3565, NULL, '0700-AFG(SF)- Emergency Assistance For COVID-19 Pandemic Response', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, 3, 35, 3565, 35650, 'Construction and Rehabilitation of Hospital and Medical facilities', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, 3, 35, 3565, 35651, 'Provision of Medical Equipment and Supplies and', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, 3, 35, 3565, 35652, 'Capacity Development and Strengthening Resilience of Medical personnel to Respond to infectious disease outbreaks', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, 3, 35, 3565, 35653, ' \nProject Administration', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 3, 35, 3566, NULL, 'Grant No 0747 AFG(SF)panj-Amu River Basin Sector Project Additional Financing', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, 3, 35, 3566, 35660, 'Increased in Agricultural Productivity', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, 3, 35, 3566, 35661, ' \nImprovement of Watershed Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, 3, 35, 3567, NULL, 'Grant No 0742 AFG(SF) Energy Supply Improvement Program T6', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, 3, 35, 3567, 35670, 'Increase the Suppiy of imported and indigenous power in the territory of Reciprent', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, 3, 35, 3567, 35671, 'Construction of approximately 201 Kilometers of 500KV transmission Line in the territory of the Recipient', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, 3, 35, 3567, 35672, 'Expansion of alane bay including provision of Associated equipment', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 3, 35, 3567, 35673, 'Strengthening DABS capacity', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, 3, 35, 3568, NULL, 'Grant Number 0786-AF(SF)COVID-19 Vaccine Support Under the Asia Pacific Vaccine Access Facility', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, 3, 35, 3568, 35680, 'COVID -19 Vaccine Procured and Delivered to Designated Points', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, 3, 35, 3568, 35681, 'Vaccine Program Implemetation Capicty Strengthened', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, 3, 36, NULL, NULL, '', 'لوتفا، ملل متحد و دیگر نهاد های ملل متحد', 'لوتفا، ملل متحد و دیگر نهاد های ملل متحد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, 3, 36, 3568, NULL, 'UNDP Law And Order Trust Fund In Afghanistan (LOTFA)', 'صندق وجوه امانی قانون و دستورالعمل در افغانستان UNDP-LOTFA', 'صندق وجوه امانی قانون و دستورالعمل در افغانستان UNDP-LOTFA', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, 3, 36, 3600, 36000, 'UNDP Law And Order Trust Fund In Afghanistan (LOTFA)', 'صندق وجوه امانی قانون و دستورالعمل در افغانستان UNDP-LOTFA', 'صندق وجوه امانی قانون و دستورالعمل در افغانستان UNDP-LOTFA', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, 3, 36, 3600, NULL, 'Supprot MRRD Staff Salary Rural Infrastructureand Reintegration ( AFG/430447)', 'حمایت  معاش کارمندان انکشاف زیربنای روستا و ادغام مجدد وزارت احیا و انکشاف دهات AFG/430447', 'حمایت  معاش کارمندان انکشاف زیربنای روستا و ادغام مجدد وزارت احیا و انکشاف دهات AFG/430447', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, 3, 36, 3608, 36080, 'Ministry of Rural Rehibiltation and Development Support Staff Salary', 'توسعه حمایت از معاش کارمندان وزارت احیا و انکشاف دهات ', 'توسعه حمایت از معاش کارمندان وزارت احیا و انکشاف دهات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, 3, 36, 3608, 36081, 'Productive Rural Infrastructure', 'زیرساخت تولیدات روستایی', 'زیرساخت تولیدات روستایی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 3, 36, 3608, 36082, 'Energy for Rural Development in Afghanistan ( Micro _ Hydro Power Project )', 'انرژی برای توسعه روستا ها در افغانستان - پروژه برق آبی کوچک', 'انرژی برای توسعه روستا ها در افغانستان - پروژه برق آبی کوچک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, 3, 36, 3608, 36083, 'Reintegration', 'استقرار مجدد', 'استقرار مجدد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, 3, 36, 3608, NULL, 'Afghanistan Peace and Reintegration Trust Fund', ' وجوه امانی  صلح و ادغام مجدد افغانستان', ' وجوه امانی  صلح و ادغام مجدد افغانستان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, 3, 36, 3610, 36100, 'Salaries', 'معاشات', 'معاشات', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, 3, 36, 3610, 36101, 'Operation and maintenance', 'عملکرد و حفظ و مراقبت ', 'عملکرد و حفظ و مراقبت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, 3, 36, 3610, NULL, '(v.09) Literacy for Empowering Afghan Police', 'V.09- سوادآموزی برای تقویت پولیس افغانستان ', 'V.09- سوادآموزی برای تقویت پولیس افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 3, 36, 3612, 36121, 'Training Awareness Programs', 'برنامه آموزشی آگاهی دهی', 'برنامه آموزشی آگاهی دهی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, 3, 36, 3612, 36122, 'Monitoring', 'نظارت', 'نظارت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, 3, 36, 3612, 36123, 'Financial and progress reporting ', 'پیشرفت گزارشدهی مالی', 'پیشرفت گزارشدهی مالی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, 3, 36, 3612, 36124, 'Salaries', 'معاشات ', 'معاشات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, 3, 36, 3612, NULL, 'UNHCR Support to MORR 2013', 'حمایت UNHCR از وزارت عودت مهاجرین 2013 ', 'حمایت UNHCR از وزارت عودت مهاجرین 2013 ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, 3, 36, 3613, 36130, 'Salaries', 'معاشات ', 'معاشات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, 3, 36, 3613, 36131, 'Capacity Building ', 'ارتقاء ظرفیت', 'ارتقاء ظرفیت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 3, 36, 3613, 36132, 'Trainings Cost', 'مصارف آموزش', 'مصارف آموزش', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, 3, 36, 3613, 36133, 'Operational Cost', 'مصارف عملیاتی', 'مصارف عملیاتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, 3, 36, 3613, NULL, 'Restoration of Gabion Wall of JAM Minaraet in Heart ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, 3, 36, 3614, 36140, 'Restoration of Gabion Wall of JAM Minaraet in Heart ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, 3, 36, 3614, NULL, 'Protection of Culturl Property in Afghanistan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, 3, 36, 3615, 36150, 'Preparatory Measures', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, 3, 36, 3615, 36151, 'Emergency Measure', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, 3, 36, 3615, 36152, 'Recovery Measures', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, 3, 36, 3615, 36153, 'Advanced Training for military trainers and adviosrs', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, 3, 36, 3615, NULL, 'Technical Assistance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, 3, 36, 3616, 36160, 'Technical Assistance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 3, 36, 3616, NULL, 'Better Education System for Afghanistan Future', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, 3, 36, 3617, 36170, 'Capacity Building', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 3, 36, 3617, 36171, '\nDevelopement of Carriculum', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 3, 36, 3617, 36172, 'Literacy Program', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, 3, 36, 3619, NULL, '4500430913 Capacity Development For Education Program', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, 3, 36, 3619, 36190, ' \nConduct a rapid assessment of the TEVET MIS and reporting system', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, 3, 36, 3619, 36191, 'Traing statistical Staff at centeral , provencial and school level', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, 3, 36, 3619, 36192, 'support the development and production of the annual statistical report', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, 3, 36, 3619, 36193, ' \nPilot the national tools at selected intitutioins and asses schools for improvement purpose', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, 3, 36, 3619, 36194, 'NTA cost, Policy and planning', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, 3, 36, 3618, NULL, ' \nInvesting Energy Efficiency Strengthen Cold Value Chain Small &Medium Enterprise', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(775, 3, 36, 3618, 36180, 'Policy and Regulatory Framwork', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, 3, 36, 3618, 36181, 'Investment and Business Promotion', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, 3, 36, 3618, 36182, ' \nCapacity Building and Knowledge Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(778, 3, 37, NULL, NULL, 'UK & EUROPEAN COMMISSION', 'کمیسیون اروپا و انگلستان', 'کمیسیون اروپا و انگلستان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(779, 3, 37, 3618, NULL, 'UK DFID Helmand Agricultural Rural Development Program ( HARDP)', 'برنامه توسعه زراعت روستا های هلمند - انگلستان DFID (HARDP)', 'برنامه توسعه زراعت روستا های هلمند - انگلستان DFID (HARDP)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(780, 3, 37, 3722, 37220, 'UK DFID Helmand Agricultural Rural Development Program ( HARDP)', 'برنامه توسعه زراعت روستا های هلمند - انگلستان DFID (HARDP)', 'برنامه توسعه زراعت روستا های هلمند - انگلستان DFID (HARDP)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(781, 3, 37, 3722, NULL, 'UK Suprt APRP Window C', 'کمک انگلستان برای برنامه صلح و ادغام مجدد افغانستان  Window C ', 'کمک انگلستان برای برنامه صلح و ادغام مجدد افغانستان  Window C ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, 3, 37, 3724, 37240, 'Salaries ', 'معاشات', 'معاشات', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, 3, 37, 3724, 37241, 'Operation and Maintenance ', 'عملکرد و حفظ و مراقبت', 'عملکرد و حفظ و مراقبت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(784, 3, 37, 3724, NULL, 'UK support to the office of the state of minister for Disaster management and Humanitarian Affairs 203904-106', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(785, 3, 37, 3727, 37270, 'Salary and Support', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(786, 3, 37, 3727, 37271, 'Training and Capacity building ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(787, 3, 37, 3727, NULL, 'Addressing Migration and Forced Displacement Challenge in Asia and Middle East\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(788, 3, 37, 3730, 37300, 'Refugees Permanently', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(789, 3, 37, 3730, 37301, 'Providing Educational and Vocational Training\n', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(790, 3, 38, NULL, NULL, 'US & USAID', 'ایالات متحده امریکا و USAID', 'ایالات متحده امریکا و USAID', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(791, 3, 38, 3730, NULL, 'Donation Of Agricultural Commodities ', 'کمک تجهیزات زراعتی', 'کمک تجهیزات زراعتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, 3, 38, 3803, 38030, 'Donation Of Agricultural Commodities ', 'کمک تجهیزات زراعتی', 'کمک تجهیزات زراعتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, 3, 38, 3803, NULL, 'Support To Prog To Achieve Shaategic Development Objetives', 'حمایت از برنامه جهت دستیابی به توسعه اهداف استراتژیک ', 'حمایت از برنامه جهت دستیابی به توسعه اهداف استراتژیک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(794, 3, 38, 3804, 38040, 'Capacity Biulding ', 'ارتقاء ظرفیت ', 'ارتقاء ظرفیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(795, 3, 38, 3804, 38041, 'E Government Pilot Initiatives', 'طرح  آزمایشی الکترونیک سازی حکومتداری', 'طرح  آزمایشی الکترونیک سازی حکومتداری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(796, 3, 38, 3804, 38042, 'Government Online Web Presence ', 'موجودیت ویب سایت دولت', 'موجودیت ویب سایت دولت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(797, 3, 38, 3804, 38043, 'Training Awareness Programs', 'برنامه آموزشی آگاهی دهی', 'برنامه آموزشی آگاهی دهی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(798, 3, 38, 3804, NULL, 'The Civilian Technical Assistance Plan (CTAP)', 'پلان کمکهای تخنیکی غیرنظامی CTAP ', 'پلان کمکهای تخنیکی غیرنظامی CTAP ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(799, 3, 38, 3805, 38050, 'The Civilian Technical Assistance Plan (CTAP)', 'پلان کمکهای تخنیکی غیرنظامی CTAP ', 'پلان کمکهای تخنیکی غیرنظامی CTAP ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(800, 3, 38, 3805, NULL, 'A Better Educated And  Healthier Population', 'جمعیت  تحصیل کرده سالم و بهتر', 'جمعیت  تحصیل کرده سالم و بهتر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(801, 3, 38, 3806, 38060, 'A Better Educated And  Healthier Population', 'جمعیت  تحصیل کرده سالم و بهتر', 'جمعیت  تحصیل کرده سالم و بهتر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(802, 3, 38, 3806, NULL, 'Good Performance And Initiative - USAID', 'ابتکار و عملکرد خوب - USAID ', 'ابتکار و عملکرد خوب - USAID ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(803, 3, 38, 3807, 38070, 'Good Performance And Initiative - USAID', 'ابتکار و عملکرد خوب - USAID ', 'ابتکار و عملکرد خوب - USAID ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(804, 3, 38, 3807, NULL, 'MOPH Partnership Contracts For Health Services Program ( SOAG 306-07-00 Il#7 )', 'قرارداد همکاری وزارت صحت عامه برای برنامه خدمات صحی ( SOAG 306-07-00  ll#7)', 'قرارداد همکاری وزارت صحت عامه برای برنامه خدمات صحی ( SOAG 306-07-00  ll#7)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(805, 3, 38, 3808, 38080, 'MOPH Partnership Contracts For Health Services Program ( SOAG 306-07-00 Il#7 )', 'قرارداد همکاری وزارت صحت عامه برای برنامه خدمات صحی ( SOAG 306-07-00  ll#7)', 'قرارداد همکاری وزارت صحت عامه برای برنامه خدمات صحی ( SOAG 306-07-00  ll#7)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(806, 3, 38, 3808, NULL, 'IL 01 Salary Support for Specific Positions in the GoIRA', 'IL01 حمایت معاش برای موقف های خاص دوات جمهوری اسلامی  افغانستان  ', 'IL01 حمایت معاش برای موقف های خاص دوات جمهوری اسلامی  افغانستان  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, 3, 38, 3809, 38090, 'Salaries for positions in President Office', 'معاشات برای موقف های دفتر ریاست جمهوری', 'معاشات برای موقف های دفتر ریاست جمهوری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(808, 3, 38, 3809, 38091, 'Salalary for Position in High Office of Oversight ', 'معاشات برای موقف های اداره عالی نظارت', 'معاشات برای موقف های اداره عالی نظارت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, 3, 38, 3809, 38092, 'Salary for President Protection Services and Office of national Security council', 'معاشات برای موقف های خدمات حفاظت رئیس جمهور و دفتر شورای امنیت ملی', 'معاشات برای موقف های خدمات حفاظت رئیس جمهور و دفتر شورای امنیت ملی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(810, 3, 38, 3809, NULL, 'USAID Support to Regional Airport Rehabilitation Project', 'پروژه حمایت USAID از بازسازی فرودگاه منطقوی', 'پروژه حمایت USAID از بازسازی فرودگاه منطقوی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(811, 3, 38, 3810, 38100, 'Design and Construction works', 'طرح و کار ساختمانی', 'طرح و کار ساختمانی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(812, 3, 38, 3810, 38101, 'Audit Fees', 'مصارف تفتیش ', 'مصارف تفتیش ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(813, 3, 38, 3810, NULL, 'German Government Support to Civilian Technical Assistance Program', 'حمایت دولت آلمان از برنامه همکاری  تخنیکی ملکی ', 'حمایت دولت آلمان از برنامه همکاری  تخنیکی ملکی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(814, 3, 38, 3813, 38130, 'Salaries', 'معاشات ', 'معاشات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(815, 3, 38, 3813, 38131, 'Operational Cost', 'مصارفات عملیاتی', 'مصارفات عملیاتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(816, 3, 38, 3813, NULL, 'IL#16 Agricultural Development Fund', 'IL#16 بودجه انکشافی زراعت ', 'IL#16 بودجه انکشافی زراعت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(817, 3, 38, 3814, 38140, 'Lending Activities', 'فعالیت های قروضه دهی ', 'فعالیت های قروضه دهی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, 3, 38, 3814, 38141, 'Grant Program', 'برنامه اعانه ', 'برنامه اعانه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, 3, 38, 3814, 38142, 'Audit', 'تفتیش', 'تفتیش', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(820, 3, 38, 3814, NULL, '306-06-00-01 USAID Cash Transfer Program Assistance to IARCSC', '306-06-00-01 USAID برنامه  کمک انتقال نقدی به  IARCSC', '306-06-00-01 USAID برنامه  کمک انتقال نقدی به  IARCSC', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(821, 3, 38, 3815, 38150, 'Improve IARCSC Management and Governance ', 'بهبود مدیریت کمیسیون مستقل اصلاحات اداری ', 'بهبود مدیریت کمیسیون مستقل اصلاحات اداری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(822, 3, 38, 3815, 38151, 'Development of Effective Human Resource', 'توسعه موثر منابع بشری', 'توسعه موثر منابع بشری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(823, 3, 38, 3815, 38152, 'Ensure Accountabilty and Transparency', 'اطمینان از شفافیت و پاسخگوئی', 'اطمینان از شفافیت و پاسخگوئی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(824, 3, 38, 3815, NULL, 'INL on budget disbursements for good Performers Initiative 5-6-2012', 'INL- پرداخت بودجه برای ابتکار اجراات درست 5-6-2012', 'INL- پرداخت بودجه برای ابتکار اجراات درست 5-6-2012', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, 3, 38, 3816, 38160, 'Awards for Poppy free provinces', 'پاداش برای ولایات عاری از کوکنار', 'پاداش برای ولایات عاری از کوکنار', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, 3, 38, 3816, 38161, 'Awards for poppy reduced province', 'پاداش برای ولایات که کشت کوکنار کاهش یافته است  ', 'پاداش برای ولایات که کشت کوکنار کاهش یافته است  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(827, 3, 38, 3816, 38162, 'Awards for exemplary CN performance Provinces', 'پاداش اجراات در مبارزه علیه مواد مخدر برای ولایات نمونه ', 'پاداش اجراات در مبارزه علیه مواد مخدر برای ولایات نمونه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(828, 3, 38, 3816, NULL, '(DAD220162) NTMA/CSTC-A Support to MoD', 'کمک CSTC-A به وزارت دفاع ملی NTMA(DAD220162)', 'کمک CSTC-A به وزارت دفاع ملی NTMA(DAD220162)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(829, 3, 38, 3817, 38170, 'Fuel Vehicles', 'مواد محروقاتی برای وسایط ', 'مواد محروقاتی برای وسایط ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(830, 3, 38, 3817, 38171, 'Clothing', 'البسه ', 'البسه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(831, 3, 38, 3817, 38172, 'Construction of Buildings', 'ساختن تعمیرات', 'ساختن تعمیرات', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(832, 3, 38, 3817, 38173, 'Vehicles', 'وسایط', 'وسایط', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(833, 3, 38, 3817, 38174, 'Purchase of Construction Equipments', 'خریداری وسایل ساختمانی', 'خریداری وسایل ساختمانی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(834, 3, 38, 3817, 38175, 'Telecommunication Equipments', 'وسایل مخابراتی', 'وسایل مخابراتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(835, 3, 38, 3817, 38176, 'Automation Equipments', 'وسایل خودکار', 'وسایل خودکار', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(836, 3, 38, 3817, 38177, 'Medical Equipment', 'وسایل طبی', 'وسایل طبی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(837, 3, 38, 3817, 38178, 'Office Computing Manufatruing and brocasting equipments', 'ساخت دفتر محاسبات و تچهیزات پخش نشرات ', 'ساخت دفتر محاسبات و تچهیزات پخش نشرات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(838, 3, 38, 3817, 38179, 'Militry  and Energy genergation equipments', 'تجهیزات نظامی و تولید انرژی ', 'تجهیزات نظامی و تولید انرژی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(839, 3, 38, 3817, NULL, '.', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(840, 3, 38, 3818, 38181, 'Fuel Vehicles', 'مواد محروقاتی وسایط', 'مواد محروقاتی وسایط', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(841, 3, 38, 3818, 38182, 'Clothing', 'البسه ', 'البسه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(842, 3, 38, 3818, 38183, 'Vehicles Maintenance', 'ترمیم و نگهداری وسایط', 'ترمیم و نگهداری وسایط', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(843, 3, 38, 3818, 38184, 'Salary individual Consultants', 'معاشات انفرادی مشاورین', 'معاشات انفرادی مشاورین', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(844, 3, 38, 3818, NULL, 'IL -56 for installation for Turbine generator Unit 2 at Kajaki Dam Hydropower Plant', 'IL-56 نصب توربین جنراتور واحد دوم بند برق آبی  کجکی   ', 'IL-56 نصب توربین جنراتور واحد دوم بند برق آبی  کجکی   ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(845, 3, 38, 3819, 38190, 'Rehabilitation and replacement of Government Furnished Equipment', 'تعویض و بازسازی تجهیزات دولت', 'تعویض و بازسازی تجهیزات دولت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(846, 3, 38, 3819, 38191, 'Installation of the unit 2 inlet valve', 'نصب و راه اندازی دریچه ورودی واحد دوم ', 'نصب و راه اندازی دریچه ورودی واحد دوم ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(847, 3, 38, 3819, 38192, 'Civil works in the power house of turbine foundation ', 'بنا کار ساختمانی  توربین برق ', 'بنا کار ساختمانی  توربین برق ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(848, 3, 38, 3819, 38193, 'Assembling and installing the turbine and generator', 'بسته کاری و نصب توربین و جنراتور', 'بسته کاری و نصب توربین و جنراتور', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(849, 3, 38, 3819, 38194, 'installing and thesting control system for Unit 1,2 and 3', 'نصب و آزمایش سیستم کنترول برای واحد 1-2 و 3', 'نصب و آزمایش سیستم کنترول برای واحد 1-2 و 3', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(850, 3, 38, 3819, 38195, 'Testing and commissioning of unit 2', 'آزمایش و راه اندازی واحد 2', 'آزمایش و راه اندازی واحد 2', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(851, 3, 38, 3819, NULL, 'PTEC IL 22-7 Expansion Strenghthening and Integration of NEPS and SEPS Power Systems and Capacity Building of DABS', 'تعمیر شرکت برشنا', 'تعمیر شرکت برشنا', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(852, 3, 38, 3820, 38200, 'Capacity Building Commercializatoion (CBC) Part 1 Distribution System ', 'ارتقای ظرفیت تجاری سازی سیستم توزیع بخش 1  (CBC) ', 'ارتقای ظرفیت تجاری سازی سیستم توزیع بخش 1  (CBC) ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(853, 3, 38, 3820, 38201, 'Capacity building commercialization ( CBC ) part 2 Generation and Transmission ', 'ارتقای ظرفیت تجاری سازی سیستم تولید و انتقال بخش 2  (CBC) ', 'ارتقای ظرفیت تجاری سازی سیستم تولید و انتقال بخش 2  (CBC) ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(854, 3, 38, 3820, 38202, 'Da Afghanistan Brishna Sherkat ( DABS) Corporate Management Support ', 'مدیریت حمایت  شرکت برشنا ', 'مدیریت حمایت  شرکت برشنا ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(855, 3, 38, 3820, 38203, 'Management Contractor for Southern Electric Power System ( SEPS ) ', 'قراردادی مدیریت برای سیستم برق جنوبی SEPS', 'قراردادی مدیریت برای سیستم برق جنوبی SEPS', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(856, 3, 38, 3820, 38204, 'Construction Management Consultanat (CMS ) ', 'مشاور مدیریت بازسازی CMS', 'مشاور مدیریت بازسازی CMS', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(857, 3, 38, 3820, 38205, 'Transmission Line form Arghanidi to Ghazni ', 'لین انتقالی از ارغنداب به غزنی ', 'لین انتقالی از ارغنداب به غزنی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(858, 3, 38, 3820, 38206, 'North Electricy Power System ( NEPS ) Improvements ', 'توسعه سیستم برق شمال NEPS', 'توسعه سیستم برق شمال NEPS', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(859, 3, 38, 3820, 38207, 'Slang Tunel Sub Station ', 'سب استیشن تونل سالنگ', 'سب استیشن تونل سالنگ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(860, 3, 38, 3820, 38208, 'Hisare Shahi Industrial Park ( HSIP ) Transmission line and Sub Station ', 'انتقال لین و سب استیشن پارک صنعتی حسار شاهی HSIP', 'انتقال لین و سب استیشن پارک صنعتی حسار شاهی HSIP', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(861, 3, 38, 3820, NULL, 'Afghansitan Workforce jDevelopment Program ', 'برنامه انکشاف نیروی کار افغانستان ', 'برنامه انکشاف نیروی کار افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(862, 3, 38, 3821, 38210, 'Afghansitan Workforce jDevelopment Program ', 'برنامه انکشاف نیروی کار افغانستان ', 'برنامه انکشاف نیروی کار افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(863, 3, 38, 3821, NULL, 'CSTC-AFMIS Expension', 'گسترش سیستم افمس CSTC-A', 'گسترش سیستم افمس CSTC-A', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(864, 3, 38, 3822, 38220, 'CSTC-AFMIS Expension', 'گسترش سیستم افمس CSTC-A', 'گسترش سیستم افمس CSTC-A', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(865, 3, 38, 3822, NULL, 'E Government Resourcfe Center ( 306-05 ) ', 'مرکز منابع حکومتداری برقی(05-306)', 'مرکز منابع حکومتداری برقی(05-306)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(866, 3, 38, 3823, 38230, 'Establishment of EGRC', 'تاسیس EGRC', 'تاسیس EGRC', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(867, 3, 38, 3823, 38231, 'Technical Assistance on M&E ', 'کمک های تخنیکی نظارت و ارزیابی', 'کمک های تخنیکی نظارت و ارزیابی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(868, 3, 38, 3823, 38232, 'GIRoA Line Ministries Training', 'آموزش ادارات جمهوری اسلامی افغانستان ', 'آموزش ادارات جمهوری اسلامی افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(869, 3, 38, 3823, 38233, 'Consulting and Advisory Support to GIRoA Ministries', 'حمایت مشوره دهی به وزارت های جمهوری اسلامی افغانستان ', 'حمایت مشوره دهی به وزارت های جمهوری اسلامی افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(870, 3, 38, 3823, 38234, 'E-Audit', 'تفیش ', 'تفیش ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(871, 3, 38, 3823, NULL, 'Sheberghan Gas Development Project ', 'پروژه توسعه گاز شبرغان ', 'پروژه توسعه گاز شبرغان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `code_funds` (`id`, `fund_type_code`, `fund_code`, `sub_fund_code`, `fund_componenet_code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(872, 3, 38, 3824, 38240, 'Sheberghan Gas Field Development ', 'توسعه در زمینه گاز شبرغان ', 'توسعه در زمینه گاز شبرغان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(873, 3, 38, 3824, 38241, 'Constrction of a Gas Processing Plant ', 'ساخت کارخانه پروسیس گاز', 'ساخت کارخانه پروسیس گاز', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(874, 3, 38, 3824, NULL, '(IL43) Funding for the High Level Women symposium', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(875, 3, 38, 3825, 38250, 'Operation Costs', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(876, 3, 38, 3825, NULL, '(306-IL-16-45-01) Strategic Communication Support to the Palac', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(877, 3, 38, 3826, 38260, 'Strategic Communication ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(878, 3, 38, 3826, 38261, 'Operations', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(879, 3, 38, 3826, NULL, 'IL#36-03 Support to MoPH to Operationlize the Gardiz and Khairkot Hospital', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(880, 3, 38, 3827, 38270, 'Construction & Installation of Hazardous Medical Waste Incinerators', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(881, 3, 38, 3827, 38271, 'Purchase of Addistiona Furniture % Medical equipments at Gardez & Khairkot Hospital', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(882, 3, 38, 3827, 38272, 'Diesel fuel cost at Gardez Hospital', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(883, 3, 38, 3827, NULL, 'Mine Action Program For Afghanistan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(884, 3, 38, 3828, 38280, 'Salaris', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(885, 3, 40, NULL, NULL, 'MULTI DONOR GRANTS', 'کمکهای مالی چندین دونر', 'کمکهای مالی چندین دونر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(886, 3, 40, 3828, NULL, 'Capacity Building Of The Ministry Of Public Health In Drug Demand Reduction ', 'ارتقای ظرفیت وزارت صحت عامه در کاهش استفاده از  مواد مخدر', 'ارتقای ظرفیت وزارت صحت عامه در کاهش استفاده از  مواد مخدر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(887, 3, 40, 4000, NULL, 'COVID -19 Emergency Repsonse (SAARC)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(888, 3, 40, 4000, 40000, 'Procurement of PPE,Kits', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(889, 3, 40, 4000, 40001, ' \nHealth Staff Training', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(890, 3, 40, 4000, 40002, 'Health Promotion', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(891, 3, 40, 4001, NULL, 'Emploment Promotion (J4P- Maintenance Cash', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(892, 3, 40, 4001, 40010, 'To Support the Maitenance and Contribution Cash Grant Component of the Citizes Charter Afghanistan Project (CCAP)- as part of the Citizes Charter', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(893, 3, 40, 4002, 40020, 'Capacity Building Of The Ministry Of Public Health In Drug Demand Reduction ', 'ارتقای ظرفیت وزارت صحت عامه در کاهش تقاضای مواد مخدر', 'ارتقای ظرفیت وزارت صحت عامه در کاهش تقاضای مواد مخدر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(894, 3, 40, 4002, NULL, 'Kazakistan Grant Aid For Afghanistan', 'اعانه قزاقستان برای افغاستان ', 'اعانه قزاقستان برای افغاستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(895, 3, 40, 4004, 40040, 'Kazakistan Grant Aid For Afghanistan', 'اعانه قزاقستان برای افغاستان ', 'اعانه قزاقستان برای افغاستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(896, 3, 40, 4004, NULL, 'The Global Fund To Fight Aids, Tb And Malaria (Moh)', 'صندوق وجوه جهانی در مبارزه با ایدز، توبرکلوز و ملاریا- وزارت صحت', 'صندوق وجوه جهانی در مبارزه با ایدز، توبرکلوز و ملاریا- وزارت صحت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(897, 3, 40, 4005, 40050, 'The Global Fund To Fight Aids, Tb And Malaria (Moh)', 'صندوق وجوه  جهانی در مبارزه با ایدز، توبرکلوز و ملاریا- وزارت صحت', 'صندوق وجوه  جهانی در مبارزه با ایدز، توبرکلوز و ملاریا- وزارت صحت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(898, 3, 40, 4005, NULL, 'CAPF 3016.01 Y Horticulture cooperatives development project', 'CAPF 3016.01 پروژه توسعه تعاونی باغداری ', 'CAPF 3016.01 پروژه توسعه تعاونی باغداری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(899, 3, 40, 4009, 40090, 'COOPERATIVES DEVELOPMENT FUND', 'بودجه تعاونی انکشافی', 'بودجه تعاونی انکشافی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, 3, 40, 4009, 40091, 'PMU Opreration and activities', 'فعالیت و عملکرد واحد مدیریت پروژه ', 'فعالیت و عملکرد واحد مدیریت پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(901, 3, 40, 4009, 40092, 'Technical Assistance', 'کمک های تخنیکی', 'کمک های تخنیکی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(902, 3, 40, 4009, 40093, 'mid- term assessment and contingencies', 'ارزیابی وسط دوره و احتمالات  ', 'ارزیابی وسط دوره و احتمالات  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(903, 3, 40, 4009, NULL, 'Rehabilitaion Of The Maidan Shar-Bamyan Road (Remambar)', 'بازسازی سرک میدان شهر - بامیان  ', 'بازسازی سرک میدان شهر - بامیان  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(904, 3, 40, 4010, 40100, 'Rehabilitaion Of The Maidan Shar-Bamyan Road (LOT-1)', 'بازسازی سرک میدان شهر - بامیان  LOT-1 ', 'بازسازی سرک میدان شهر - بامیان  LOT-1 ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(905, 3, 40, 4010, 40101, 'Rehabilitation of the Maidan Shar-Bamyan Road LOT-2', 'بازسازی سرک میدان شهر - بامیان  LOT-2', 'بازسازی سرک میدان شهر - بامیان  LOT-2', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(906, 3, 40, 4010, NULL, 'Primary Education Program Support (Moe) - Denmark', 'برنامه حمایت تعلیمات ابتدائی- وزارت معارف - دنمارک', 'برنامه حمایت تعلیمات ابتدائی- وزارت معارف - دنمارک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(907, 3, 40, 4012, 40120, 'Primary Education Program Support (Moe)', 'برنامه حمایت تعلیمات ابتدائی- وزارت معارف ', 'برنامه حمایت تعلیمات ابتدائی- وزارت معارف ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(908, 3, 40, 4012, NULL, 'Kapisa Medical Complex', 'مجتمع طبی کاپیسا', 'مجتمع طبی کاپیسا', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(909, 3, 40, 4013, 40130, 'Kapisa Medical Complex', 'مجتمع طبی کاپیسا', 'مجتمع طبی کاپیسا', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(910, 3, 40, 4013, NULL, 'Enhancement Of Literacy In Afghanistan - Unesco Form 315B(I.08)', 'افرایش سوادآموزی در افغانستان - UNESCO From 315B 1.08', 'افرایش سوادآموزی در افغانستان - UNESCO From 315B 1.08', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(911, 3, 40, 4016, 40160, 'Enhancement Of Literacy In Afghanistan - Unesco Form 315B(I.08)', 'افرایش سوادآموزی در افغانستان - UNESCO From 315B 1.08', 'افرایش سوادآموزی در افغانستان - UNESCO From 315B 1.08', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(912, 3, 40, 4016, NULL, 'The Procurement Of Agriculture Inputs & Purchase Of Wheat Stock', 'تهیه و تدارک مواد زراعتی و خریداری گندم ', 'تهیه و تدارک مواد زراعتی و خریداری گندم ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(913, 3, 40, 4018, 40180, 'Procurement Of Agriculture Inputs', 'تهیه مواد زراعتی ', 'تهیه مواد زراعتی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(914, 3, 40, 4018, 40181, 'Purchase Of Wheat Stock', 'خریداری گندم ', 'خریداری گندم ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(915, 3, 40, 4018, NULL, 'NSP Danish Support ', 'حمایت برنامه همبستگی ملی Danish', 'حمایت برنامه همبستگی ملی Danish', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(916, 3, 40, 4019, 40190, 'NSP Danish Support ', 'حمایت برنامه همبستگی ملی Danish', 'حمایت برنامه همبستگی ملی Danish', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(917, 3, 40, 4019, NULL, 'GAVI And The Vaccine Fund ', 'بودجه واکسین و GAVI', 'بودجه واکسین و GAVI', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(918, 3, 40, 4025, 40250, 'Gavi And The Vaccine Fund ', 'بودجه واکسین و GAVI', 'بودجه واکسین و GAVI', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(919, 3, 40, 4025, NULL, '809-G08-MScaling Up Malaria Control Interventions And Strengthening Health Care System In Afghanistan ', '809-G08-M کنترول ملاریا و تقویت سیستم صحی در افغانستان ', '809-G08-M کنترول ملاریا و تقویت سیستم صحی در افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(920, 3, 40, 4029, 40290, 'Wages And Salaries ', 'مزد و معاشات', 'مزد و معاشات', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(921, 3, 40, 4029, 40291, 'Goods And Services ', 'اجناس و خدمات', 'اجناس و خدمات', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(922, 3, 40, 4029, 40292, 'Monitoring Evaluation Planning Administration And Over Heads ', 'نظارت و  ارزیابی پلانگذاری اداره و فراتر از آن ', 'نظارت و  ارزیابی پلانگذاری اداره و فراتر از آن ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(923, 3, 40, 4029, NULL, 'Afghanistan Rural Enterprises Development Program (Denmark)', 'برنامه توسعه سرمایه گذاری روستا های افغانستان ', 'برنامه توسعه سرمایه گذاری روستا های افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(924, 3, 40, 4030, 40300, 'Establishing Policy Unit', 'تاسیس واحد پالیسی', 'تاسیس واحد پالیسی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(925, 3, 40, 4030, 40301, 'Operational Budget For Aredp', 'بودجه عملیاتی برای Aredp', 'بودجه عملیاتی برای Aredp', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(926, 3, 40, 4030, 40302, 'Community Investment Loans', 'انجمن سرمایه گذاری قروض', 'انجمن سرمایه گذاری قروض', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(927, 3, 40, 4030, 40303, 'Small And Mmedium Enterprises (Sme)', 'شرکت های کوچک و متوسط', 'شرکت های کوچک و متوسط', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(928, 3, 40, 4030, NULL, 'Coordination Of Implementation Of ANDS', 'هماهنگی اجراات ANDS', 'هماهنگی اجراات ANDS', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(929, 3, 40, 4031, 40310, 'Coordination Of Implementation Of Ands', 'هماهنگی اجراات ANDS', 'هماهنگی اجراات ANDS', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(930, 3, 40, 4031, NULL, 'Italian Suppor To Afghan Mircorfinance And Enterprises Project', 'حمایت کشور ایتالیا از پروژه قرضه های کوچک  و شرکت ها ', 'حمایت کشور ایتالیا از پروژه قرضه های کوچک  و شرکت ها ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(931, 3, 40, 4032, 40320, 'Microfinance Credits', 'قرضه های کوچک ', 'قرضه های کوچک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(932, 3, 40, 4032, 40321, 'Smes Credits', 'قرضه های کوچک و متوسط', 'قرضه های کوچک و متوسط', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(933, 3, 40, 4032, 40322, 'Trainings', 'آموزش', 'آموزش', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(934, 3, 40, 4032, 40323, 'Operation Costs', 'مصارف عملیاتی', 'مصارف عملیاتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(935, 3, 40, 4032, NULL, '2ND Remambar', 'یادداشت 2', 'یادداشت 2', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(936, 3, 40, 4033, 40330, '2Nd Remambar', 'یادداشت 2', 'یادداشت 2', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(937, 3, 40, 4033, NULL, 'First Micro Finance Bank - Germany', 'اولین بانک قرضه های کوچک - جرمنی', 'اولین بانک قرضه های کوچک - جرمنی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(938, 3, 40, 4034, 40340, 'First Micro Finance Bank', 'اولین بانک قرضه های کوچک ', 'اولین بانک قرضه های کوچک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(939, 3, 40, 4034, NULL, 'Micro Finance - DB MOF', 'قرضه های کوچک- بانک افغانستان- وزارت مالیه  ', 'قرضه های کوچک- بانک افغانستان- وزارت مالیه  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(940, 3, 40, 4035, 40350, 'Micro Finance - DB MOF', 'قرضه های کوچک- بانک افغانستان- وزارت مالیه  ', 'قرضه های کوچک- بانک افغانستان- وزارت مالیه  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(941, 3, 40, 4035, NULL, 'Implementing The Economic And Technical Cooperation , Ministry Of Foreign Affairs', 'تطبیق و همکاری اقتصادی و تخنیکی- وزارت امور خارجه ', 'تطبیق و همکاری اقتصادی و تخنیکی- وزارت امور خارجه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(942, 3, 40, 4037, 40370, 'Implementing The Economic And Technical Cooperation , Ministry Of Foreign Affairs', 'تطبیق و همکاری اقتصادی و تخنیکی- وزارت امور خارجه ', 'تطبیق و همکاری اقتصادی و تخنیکی- وزارت امور خارجه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(943, 3, 40, 4037, NULL, '8033-DSF Rural Microfinance And Livestock Support Program', 'برنامه حمایت قرضه های کوچک روستائی و مواشی ', 'برنامه حمایت قرضه های کوچک روستائی و مواشی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(944, 3, 40, 4039, 40390, 'Rural Microfinance  ', 'قرضه های کوچک روسایی', 'قرضه های کوچک روسایی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(945, 3, 40, 4039, 40391, 'Livestock Support', 'حمایت مواشی (حیوانات)', 'حمایت مواشی (حیوانات)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(946, 3, 40, 4039, 40392, 'Program Management And Coordination', 'مدیرت برنامه و هماهنگی', 'مدیرت برنامه و هماهنگی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(947, 3, 40, 4039, NULL, 'Afghanistan Rural Enterprise Development Program ( 104 Afghanistan 12-3-6)', 'برنامه توسعه سرمایه گذاری روستا های افغانستان (   104Afghanistan 12-3-6)', 'برنامه توسعه سرمایه گذاری روستا های افغانستان (   104Afghanistan 12-3-6)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(948, 3, 40, 4040, 40400, 'Afghanistan Rural Enterprise Development Program ( 104 Afghanistan 12-3-6)', 'برنامه توسعه سرمایه گذاری روستا های افغانستان (   104Afghanistan 12-3-6)', 'برنامه توسعه سرمایه گذاری روستا های افغانستان (   104Afghanistan 12-3-6)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(949, 3, 40, 4040, NULL, 'Small Development Program - India', 'برنامه کوچک توسعوی - هند', 'برنامه کوچک توسعوی - هند', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(950, 3, 40, 4043, 40430, 'Small Development Program', 'برنامه کوچک توسعوی ', 'برنامه کوچک توسعوی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(951, 3, 40, 4043, NULL, 'Vocational Training Project In 9 Province Afg 0009349', 'پروژه آموزش های فنی و حرفوی در 9 ولایت افغانستان 0009349', 'پروژه آموزش های فنی و حرفوی در 9 ولایت افغانستان 0009349', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(952, 3, 40, 4045, 40450, 'Capacity Development Program ', 'برنامه ارتقای ظرفیت', 'برنامه ارتقای ظرفیت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(953, 3, 40, 4045, NULL, 'GAVI Health System Strengthening', 'تقویت سیستم صحت GAVI', 'تقویت سیستم صحت GAVI', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(954, 3, 40, 4055, 40550, 'GAVI Health System Strengthening', 'تقویت سیستم صحت GAVI', 'تقویت سیستم صحت GAVI', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(955, 3, 40, 4055, NULL, 'The Global Fund To Fight HIV (MoPH)', ' وجه جهانی در مبارزه علیه اچ آی وی - وزارت صحت عامه ', ' وجه جهانی در مبارزه علیه اچ آی وی - وزارت صحت عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(956, 3, 40, 4056, 40560, 'The Global Fund To Fight HIV (MoPH)', ' وجه جهانی در مبارزه علیه اچ آی وی - وزارت صحت عامه ', ' وجه جهانی در مبارزه علیه اچ آی وی - وزارت صحت عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(957, 3, 40, 4056, NULL, 'AFG 390264-Japan Support the construction of Administration building of the ministry of Agriculture , Irrigation and Livestock ( MAIL )', 'AFG 390264 کمک جاپان برای بازسازی تعمیر اداری وزارت زراعت ، آبیاری ومالداری MAIL', 'AFG 390264 کمک جاپان برای بازسازی تعمیر اداری وزارت زراعت ، آبیاری ومالداری MAIL', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(958, 3, 40, 4063, 40630, 'Construction ', 'بازسازی', 'بازسازی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(959, 3, 40, 4063, 40631, 'Goods And Services ', 'اجناس و خدمات', 'اجناس و خدمات', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(960, 3, 40, 4063, 40632, 'Miscelleneouse', 'متفرقه ', 'متفرقه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(961, 3, 40, 4063, NULL, 'Support to Diary and Fish Farming Cooperatives', 'حمایت از لبنیات و فارم ماهی شرکت های تعاونی', 'حمایت از لبنیات و فارم ماهی شرکت های تعاونی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(962, 3, 40, 4064, 40641, 'Strengthening Centres Capacities according to International Rules', 'تقویت ظرفیت های مرکزی مطابق به قوانین بین المللی', 'تقویت ظرفیت های مرکزی مطابق به قوانین بین المللی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(963, 3, 40, 4064, 40642, 'Building Local Expertise Specialised in Diary and Fish Farming Issues', 'ظرفیت سازی تخصصی در بخش  فارم ماهی و لبنیات ', 'ظرفیت سازی تخصصی در بخش  فارم ماهی و لبنیات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(964, 3, 40, 4064, 40643, 'Structuring Professionals Organisations acoording to their respective mandate and allowing Value Chains Autonomy', 'ساختار سازمان های حرفه ای بر اساس دستورالعمل مربوطه و اجازه به ارزشهای خودمختتاری اقتصادی', 'ساختار سازمان های حرفه ای بر اساس دستورالعمل مربوطه و اجازه به ارزشهای خودمختتاری اقتصادی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(965, 3, 40, 4064, NULL, 'Support Beekeeping  Value Chain Cooperatives', 'حمایت شرکتهای تعاونی زنبورداری ', 'حمایت شرکتهای تعاونی زنبورداری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(966, 3, 40, 4065, 40651, 'Training Communication and Information of Public and Private Actors in Beekeeping Activities', 'آموزش ارتباطات و اطلاع رسانی عمومی و خصوصی در فعالیت های زنبورداری', 'آموزش ارتباطات و اطلاع رسانی عمومی و خصوصی در فعالیت های زنبورداری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(967, 3, 40, 4065, 40652, 'Securing Access to Inputs through imports and local purchases', 'تامین امنیت دسترسی به  ورودی از طریق خریداریهای محلی و واردات ', 'تامین امنیت دسترسی به  ورودی از طریق خریداریهای محلی و واردات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(968, 3, 40, 4065, 40653, 'Valorisation of all hive\'s products and services to create local added value ', 'تعین ارزش تمام اندوخته های تولیدی و خدماتی برای ایجاد ارزش افزوده محلی ', 'تعین ارزش تمام اندوخته های تولیدی و خدماتی برای ایجاد ارزش افزوده محلی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(969, 3, 40, 4065, 40654, 'Structuring Professionals organisations  ', 'ساختار سازمان های حرفوی', 'ساختار سازمان های حرفوی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(970, 3, 40, 4065, NULL, 'Improvement of Health Services Delivery through Expansion of the Health System Strengthening Efforts ( AFG-012-G13-T}', 'بهبود عرضه خدمات صحی از طریق تلاش های تقویتی گسترش سیستم  صحت AFG-012-G13-T', 'بهبود عرضه خدمات صحی از طریق تلاش های تقویتی گسترش سیستم  صحت AFG-012-G13-T', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(971, 3, 40, 4066, 40661, 'Technical Assistance', 'خدمات تخنیکی', 'خدمات تخنیکی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(972, 3, 40, 4066, 40662, 'Operations', 'عملکرد', 'عملکرد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(973, 3, 40, 4066, 40663, 'Monitoring and Evaluation', 'نظارت و ارزیابی', 'نظارت و ارزیابی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(974, 3, 40, 4066, NULL, 'Government of Afghanistan Education Program Funded by Global Partnership for Eduction ', 'برنامه معارف دولت افغانستان تمویل شده توسط بودجه همکاری های جهانی  ', 'برنامه معارف دولت افغانستان تمویل شده توسط بودجه همکاری های جهانی  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(975, 3, 40, 4067, 40670, 'Strengthening community and Social mobilization and governance system at the local level', 'تقویت جامعه و نظام اجتماعی و سیستم حکومتداری در سطح محلی', 'تقویت جامعه و نظام اجتماعی و سیستم حکومتداری در سطح محلی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(976, 3, 40, 4067, 40671, 'Expanding and reinforcing multiple pathways to education ', 'گسترش و تقویت  مسیر های متعدد معارف', 'گسترش و تقویت  مسیر های متعدد معارف', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(977, 3, 40, 4067, 40672, 'Increasing the number of qualified female teachers in areas with high gender disparities', 'افزایش تعداد معلمان اناث واجد شرایط در مناطق که نابرابری های بیشتر جنسیتی  وجود دارد', 'افزایش تعداد معلمان اناث واجد شرایط در مناطق که نابرابری های بیشتر جنسیتی  وجود دارد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(978, 3, 40, 4067, 40673, 'Streamlining policy and administrative systems in the ministry of Educaiton ', 'ساده و موثر ساختن پالیسی و سیستم اداری در وزارت معارف', 'ساده و موثر ساختن پالیسی و سیستم اداری در وزارت معارف', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(979, 3, 40, 4067, NULL, 'Scaling up Malaria Control Intervention and Strengthening Health Care System in Afghanistan ( AFG 812-G14-M)', 'سنجش کنترول جلوگیری از ملاریا و تقویت سیستم صحی در افغانستان AFG 812-G14-M', 'سنجش کنترول جلوگیری از ملاریا و تقویت سیستم صحی در افغانستان AFG 812-G14-M', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(980, 3, 40, 4068, 40680, 'Expansion of Quality Laboratory and Effective Treatment', 'توسعه کیفیت لابراتوار و تداوی موثر', 'توسعه کیفیت لابراتوار و تداوی موثر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(981, 3, 40, 4068, 40681, 'Prevention of Malaria', 'جلوگیری از ملاریا', 'جلوگیری از ملاریا', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(982, 3, 40, 4068, 40682, 'Increase Community Awareness', 'افرایش آگاهی دهی جامعه ', 'افرایش آگاهی دهی جامعه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(983, 3, 40, 4068, 40683, 'Strengthening Capacity and Partnership', 'همکاری و تقویت ظرفیت ', 'همکاری و تقویت ظرفیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(984, 3, 40, 4068, 40684, 'Human Resources', 'منابع بشری', 'منابع بشری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(985, 3, 40, 4068, NULL, '(AFG-390654) Denmark Support to Land Resource Conservation and Manangement in the Four Eastern Province', ' AFG-390654   حمایت کشور دنمارک از مدیریت حفاظت از منابع زمین در 4 ولایت شرقی', ' AFG-390654   حمایت کشور دنمارک از مدیریت حفاظت از منابع زمین در 4 ولایت شرقی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(986, 3, 40, 4069, 40690, 'Assessment and Survey of NRM', 'ارزیابی و سروی NRM', 'ارزیابی و سروی NRM', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(987, 3, 40, 4069, 40691, 'Formulation of a Program to Address Resource Degradation', 'تدوین یک برنامه برای دریافتن منابع تخریب شده ', 'تدوین یک برنامه برای دریافتن منابع تخریب شده ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(988, 3, 40, 4069, 40692, 'Capacity Development of Provincial and District NRM Staff', 'ارتقای ظرفیت کارمندان NRM به سطح ولایت و ولسوالی ', 'ارتقای ظرفیت کارمندان NRM به سطح ولایت و ولسوالی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(989, 3, 40, 4069, NULL, '61-2010/SCAC District Delivery Prog French Support', '61-2010/SCAC برنامه حمایت کشور فرانسه به سطح ولسوالی ', '61-2010/SCAC برنامه حمایت کشور فرانسه به سطح ولسوالی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(990, 3, 40, 4070, 40700, 'Salaries and Hazard Pay', 'پرداخت معاشات و بخششی ', 'پرداخت معاشات و بخششی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(991, 3, 40, 4070, 40701, 'Operations and management', 'مدیریت و عملکرد', 'مدیریت و عملکرد', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(992, 3, 40, 4070, 40702, 'Development Projects', 'پروژه های انکشافی', 'پروژه های انکشافی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(993, 3, 40, 4070, 40703, 'Central Support Team', 'تیم حمایت مرکزی', 'تیم حمایت مرکزی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(994, 3, 40, 4070, NULL, 'AFG W /370562 Support to the national health care programs in the provinces of kabul and heart', 'AFG W /370562 حمایت از برنامه های ملی صحی در ولایات  کابل و هرات ', 'AFG W /370562 حمایت از برنامه های ملی صحی در ولایات  کابل و هرات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(995, 3, 40, 4071, 40711, 'Support to MoPH SM e PPHD', 'حمایت از PPHD و SMe وزرات صحت عامه ', 'حمایت از PPHD و SMe وزرات صحت عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(996, 3, 40, 4071, 40712, 'Estqlal Hospital ', 'شفاخانه استقلال', 'شفاخانه استقلال', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(997, 3, 40, 4071, 40713, 'CHC Near Esteqlal Hospital ', 'CHC نزدیک به شفاخانه اسقلال', 'CHC نزدیک به شفاخانه اسقلال', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(998, 3, 40, 4071, 40714, 'Running and Training Costs of PPHD of Heart', 'مصارف پیشبرد آموزشPPHD ولایت هرات ', 'مصارف پیشبرد آموزشPPHD ولایت هرات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(999, 3, 40, 4071, 40715, 'Strat up of the Heart Ambulance Service', 'آعاز کار خدمات امبولانس ولایت هرات ', 'آعاز کار خدمات امبولانس ولایت هرات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1000, 3, 40, 4071, 40716, 'Mother and Child Health MCH in Heart ', 'صحت طفل و مادر ولایت هرات MCH', 'صحت طفل و مادر ولایت هرات MCH', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1001, 3, 40, 4071, NULL, 'AFG/390659 Support to Agriculture and Rural Development in Western provinces  SARD project', 'AFG/ 390659 پروژه حمایت از زراعت و توسعه روستا ها در ولایات غربی SARD  ', 'AFG/ 390659 پروژه حمایت از زراعت و توسعه روستا ها در ولایات غربی SARD  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1002, 3, 40, 4072, 40721, 'Project Management Unit', 'واحد مدیریت پروژه', 'واحد مدیریت پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1003, 3, 40, 4072, 40722, 'Technical Activites', 'فعالیت های تخنیکی', 'فعالیت های تخنیکی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1004, 3, 40, 4072, NULL, 'Support Agriculture in Northern and Noth Eastern Provinces CAF 1011', 'حمایت از زراعت در ولایات شمالی و شمال شرقی CAF1011 ', 'حمایت از زراعت در ولایات شمالی و شمال شرقی CAF1011 ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1005, 3, 40, 4073, 40731, 'Support for the Implementation of Research and Development Activities', 'حمایت از راه اندازی تجسس و توسعه فعالیت ها ', 'حمایت از راه اندازی تجسس و توسعه فعالیت ها ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1006, 3, 40, 4073, 40732, 'Support for the Implementation of a production and distribution network for certified', 'حمایت از شبکه مجاز برای اجرای تولید و توزیع  ', 'حمایت از شبکه مجاز برای اجرای تولید و توزیع  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1007, 3, 40, 4073, 40733, 'Facilitation of the Development of Agriculture cooperatives and professional organization in the region covered by the program', 'تسهیل و توسعه تعاونی های زراعتی و سازمانهای مسلکی در محلات تحت پوشش برنامه ', 'تسهیل و توسعه تعاونی های زراعتی و سازمانهای مسلکی در محلات تحت پوشش برنامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1008, 3, 40, 4073, 40734, 'Establishment of a cotton monitoring unit and a regional rural economic Cell', 'تاسیس واحد نظارت  پنبه و شاخه اقتصادی منطقوی', 'تاسیس واحد نظارت  پنبه و شاخه اقتصادی منطقوی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1009, 3, 40, 4073, NULL, 'I DSF-8112 AF communit Livestock and Agriculture Project ( CLAP)', 'I DSF-8112 AF پروژه زراعت و مالداری CLAP', 'I DSF-8112 AF پروژه زراعت و مالداری CLAP', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1010, 3, 40, 4075, 40750, 'Community Development Including Productive Infrastructures and Institutional Streghthening ', 'توسعه اجتماعی شامل زیرساخت های تولیدی و تقویت سازمانها ', 'توسعه اجتماعی شامل زیرساخت های تولیدی و تقویت سازمانها ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1011, 3, 40, 4075, 40751, 'Livestock and Agriculture Development ', 'توسعه زراعت و مالداری', 'توسعه زراعت و مالداری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1012, 3, 40, 4075, 40752, 'Project Management Policy Support and Young Progessionals Program ', 'حمایت پالیسی مدیریت پروژه و برنامه پیشرفت جوانان ', 'حمایت پالیسی مدیریت پروژه و برنامه پیشرفت جوانان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1013, 3, 40, 4075, NULL, 'MoF- AECID FA 2013  spanish Contribution to MoPH in Badghis ', 'وزرات مالیه- AECID FA 2013 اعانه کشور آسپانیا به وزارت صحت عامه در لایت بادغیس', 'وزرات مالیه- AECID FA 2013 اعانه کشور آسپانیا به وزارت صحت عامه در لایت بادغیس', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1014, 3, 40, 4076, 40761, 'Capacity Building ', 'ارتقای ظرفیت ', 'ارتقای ظرفیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1015, 3, 40, 4076, 40762, 'Public Awareness', 'آگاهی دهی عامه ', 'آگاهی دهی عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1016, 3, 40, 4076, 40763, 'TB Program ', 'برنامه توبرکلوز', 'برنامه توبرکلوز', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1017, 3, 40, 4076, 40764, 'Nutrition Program ', 'برنامه تغذیه ', 'برنامه تغذیه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1018, 3, 40, 4076, NULL, 'Strengthening Maternal and Child Health Including Immunization ( MCH) Project', 'پروژه ایمن سازی و تقویت صحت طفل و مادر MCH', 'پروژه ایمن سازی و تقویت صحت طفل و مادر MCH', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1019, 3, 40, 4077, 40771, 'Equipments and consumables Cost', 'تجهیزات و مصارف مواد مصرفی', 'تجهیزات و مصارف مواد مصرفی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1020, 3, 40, 4077, 40772, 'Budgetd Maintenance and Consumables', 'نگهداری بودجه و مواد مصرفی', 'نگهداری بودجه و مواد مصرفی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1021, 3, 40, 4077, 40773, 'Civil and Inftrastructure ', 'زیرساخت ها و خدمات ', 'زیرساخت ها و خدمات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1022, 3, 40, 4077, 40774, 'Capacity Building ', 'ارتقای ظرفیت ', 'ارتقای ظرفیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1023, 3, 40, 4077, 40775, 'Training of Trainers', 'آموزش آموزگاران ', 'آموزش آموزگاران ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1024, 3, 40, 4077, NULL, 'South Asia Initiative to End Violance Against Children ( SAIEVAC )', 'طرح کوریای جنوبی برای پایان دادن به خشونت ها علیه اطفال SAIEVAC', 'طرح کوریای جنوبی برای پایان دادن به خشونت ها علیه اطفال SAIEVAC', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1025, 3, 40, 4079, 40790, 'Transportation ', 'ترانسپورت', 'ترانسپورت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1026, 3, 40, 4079, 40791, 'Office Utility Communication ', 'ابزار ارتباطات دفتری', 'ابزار ارتباطات دفتری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1027, 3, 40, 4079, 40792, 'Admin Finance Staff', 'کارمندان مالی و اداری', 'کارمندان مالی و اداری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1028, 3, 40, 4079, 40793, 'Stationery', 'قرطاسیه ', 'قرطاسیه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1029, 3, 40, 4079, 40794, 'Impro data and report Process', 'تقویت روند جمع آوری معلومات و گزارشدهی', 'تقویت روند جمع آوری معلومات و گزارشدهی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1030, 3, 40, 4079, 40795, 'Support anilysis and dissemination of Collected data', 'حمایت تحلیل و تجزیه و انتشار اطلاعات جمع آوری شده ', 'حمایت تحلیل و تجزیه و انتشار اطلاعات جمع آوری شده ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1031, 3, 40, 4079, 40796, 'Program Support cost SAIEVAC Technical Consultation and Child Protection Workshops', 'برنامه حمایت مصارف ورکشاپ مشاوره تخنیکی و حفاظت از اطفال SAIEVAC', 'برنامه حمایت مصارف ورکشاپ مشاوره تخنیکی و حفاظت از اطفال SAIEVAC', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1032, 3, 40, 4079, 40797, 'Child Care Standards Developing Referral System and Data Colletion ', 'سیستم توسعه معیار های مراقبت اطفال و جمع آوری اطلاعات ', 'سیستم توسعه معیار های مراقبت اطفال و جمع آوری اطلاعات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1033, 3, 40, 4079, NULL, 'Prevention and Control of H1N1 Influenza', 'جلوگیری و کنترول انفلونزاH1N1  ', 'جلوگیری و کنترول انفلونزاH1N1  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1034, 3, 40, 4080, 40800, 'Prevention and Control of H1N1 Influenza', 'جلوگیری و کنترول انفلونزاH1N2', 'جلوگیری و کنترول انفلونزاH1N2', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1035, 3, 40, 4080, NULL, 'Capacity Building for Natural Resources Medical Training and Rehabilitation of Sayed Jamaludin Teacher Training Center ', 'مرکز آموزشی معلمین ', 'مرکز آموزشی معلمین ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1036, 3, 40, 4081, 40810, 'Capacity Building for Natural Resources Medical Training and Rehabilitation of Sayed Jamaludin Teacher Training Center ', 'مرکز', 'مرکز', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1037, 3, 40, 4081, 40811, 'Medical Training ', 'آموزش های طبی', 'آموزش های طبی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1038, 3, 40, 4081, 40812, 'Rehabilitation of Sayed Jamaludin Teacher Traninng Center ', 'بازسازی دارالمعلیمن سید جمالدین  ', 'بازسازی دارالمعلیمن سید جمالدین  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1039, 3, 40, 4081, NULL, 'MoF AECID FA2013  Spanish Contribution to MoE in Badghis', 'وزارت مالیه- AECID FA2013 کمک و همکاری کشور هسپانیا به وزارت معارف در ولایت بادغیس', 'وزارت مالیه- AECID FA2013 کمک و همکاری کشور هسپانیا به وزارت معارف در ولایت بادغیس', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1040, 3, 40, 4082, 40820, 'Provission of Equipment and Support to the Teacher Traning Center of Badgis ', 'تهیه تجهیزات و حمایت مرکز دارالمعلمین ولایت بادغیس', 'تهیه تجهیزات و حمایت مرکز دارالمعلمین ولایت بادغیس', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1041, 3, 40, 4082, 40821, 'Purchase of School Equipment for Educative Facilities in Badghis ', 'خریداری تجهیزات مکتب برای تسهیلات تربیوی در بادغیس ', 'خریداری تجهیزات مکتب برای تسهیلات تربیوی در بادغیس ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1042, 3, 40, 4082, 40822, 'Traning Activities for the Teachers of Badghis ', 'فعالیت های آموزشی در بخش معارف در ولایت بادغیس', 'فعالیت های آموزشی در بخش معارف در ولایت بادغیس', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1043, 3, 40, 4082, 40823, 'Support Female Teachers in Eduction in Badghis ', 'حمایت معلمین اناث در بخش معارف در ولایت بادغیس', 'حمایت معلمین اناث در بخش معارف در ولایت بادغیس', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1044, 3, 40, 4082, NULL, 'Financing for National Rural Access Program ( MOF Itly FA 2012 )', 'تامین مالی برای برنامه ملی دسترسی به  روستاها وزارت مالیه- ایتالیا FA 2012', 'تامین مالی برای برنامه ملی دسترسی به  روستاها وزارت مالیه- ایتالیا FA 2012', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1045, 3, 40, 4083, 40831, 'Reconstruction and Rehabiltion of Road on Heart Province', 'بازسازی و احیای مجدد سرک ولایت هرات ', 'بازسازی و احیای مجدد سرک ولایت هرات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1046, 3, 40, 4083, 40832, 'Supporting Ministry of Public Works to Provision of Consultans', 'حمایت وزارت فواید عامه در استخدام مشاورین ', 'حمایت وزارت فواید عامه در استخدام مشاورین ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1047, 3, 40, 4083, 40833, 'Capacity Building for Ministry of Public Works', 'ارتقای ظرفیت در وزارت فواید عامه ', 'ارتقای ظرفیت در وزارت فواید عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1048, 3, 40, 4083, 40834, 'Traning for Ministry of Public Works', 'آموزش برای کارمندان وزارت فواید عامه ', 'آموزش برای کارمندان وزارت فواید عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1049, 3, 40, 4083, 40835, 'Operation Costs', 'مصارف عملیاتی', 'مصارف عملیاتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1050, 3, 40, 4083, NULL, 'Afghanistan National Rural Access Program ( MRRD ) ', 'برنامه ملی دسترسی به روستا های افغانستان MRRD', 'برنامه ملی دسترسی به روستا های افغانستان MRRD', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1051, 3, 40, 4084, 40840, 'Improvement and Maintenance of Tertiary Road ', 'توسعه و حفظ و مراقبت قسمت سوم سرک', 'توسعه و حفظ و مراقبت قسمت سوم سرک', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1052, 3, 40, 4084, 40841, 'Construction of Roads and Bridges ', 'بازسازی سرک ها و پل ها ', 'بازسازی سرک ها و پل ها ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1053, 3, 40, 4084, 40842, 'Program Planning and Development Institutional ', 'برنامه پلانگذاری و انکشاف نهاد ها', 'برنامه پلانگذاری و انکشاف نهاد ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1054, 3, 40, 4084, 40843, 'Strengthening and Program Coordination Support ', 'تقویت حمایت و هماهنگی برنامه ', 'تقویت حمایت و هماهنگی برنامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1055, 3, 40, 4084, NULL, 'Capacity Building in Trade insitituions of Central Asian Countries of CoMCEC ( No 2013-AFG TRADE0107)', 'ارتقای ظرفیت در نهاد های تجاری کشور های اسیای مرکزی (No 2013-AFG TRADE0107) CoMCEC', 'ارتقای ظرفیت در نهاد های تجاری کشور های اسیای مرکزی (No 2013-AFG TRADE0107) CoMCEC', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1056, 3, 40, 4085, 40850, 'Capacity Building in TRADe   ', 'ارتقای ظرفیت در تجارت', 'ارتقای ظرفیت در تجارت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1057, 3, 40, 4085, NULL, 'Denmark Agriculture Development Fund ', 'بودجه انکشافی زراعتی دنمارک ', 'بودجه انکشافی زراعتی دنمارک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1058, 3, 40, 4086, 40860, ' Denmark Agriculture Development Fund', 'بودجه انکشافی زراعتی دنمارک ', 'بودجه انکشافی زراعتی دنمارک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1059, 3, 40, 4086, NULL, 'Strengthening of Water Sanition and Hygiene ( WASSH ) Services in Selected areas of SAARC countries ', 'تقویت خدمات بهداشتی آب صحی در مناطق انتخاب شده کشور های SAARC (WASSH)', 'تقویت خدمات بهداشتی آب صحی در مناطق انتخاب شده کشور های SAARC (WASSH)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1060, 3, 40, 4087, 40870, 'Program Budget ', 'برنامه بودجوی ', 'برنامه بودجوی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1061, 3, 40, 4087, 40871, 'Common Activities ', 'فعالیت های عمومی', 'فعالیت های عمومی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1062, 3, 40, 4087, 40872, 'Program Support cost and Contingecy ', 'مصارف احتیاطی و حمایت برنامه', 'مصارف احتیاطی و حمایت برنامه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1063, 3, 40, 4087, NULL, 'Post Harvest Management and Value Addistion of Fruis in Production Catchments of SAARC Countries Proj', 'پروژه مدیریت محصولات و افزودن  بر ارزش تولیدات میوه SAARC', 'پروژه مدیریت محصولات و افزودن  بر ارزش تولیدات میوه SAARC', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1064, 3, 40, 4089, 40890, 'Baseline Survey, Infrastructure for Solar Panel', 'مواد مصرفی  برای تجهیز و بسته بندی سولر ', 'مواد مصرفی  برای تجهیز و بسته بندی سولر ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1065, 3, 40, 4089, 40891, 'Consumables for Packaging, Equipment (Solar Panel)', 'مواد مصرفی  برای تجهیز و بسته بندی سولر ', 'مواد مصرفی  برای تجهیز و بسته بندی سولر ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1066, 3, 40, 4089, 40892, 'Equipments (Pakaging House), Capacity Building', 'تجهیزات (بسته بندی در خانه)، ارتقای ظرفیت', 'تجهیزات (بسته بندی در خانه)، ارتقای ظرفیت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1067, 3, 40, 4089, 40893, 'Market Linkage Development, Cost of Local Travel (for Program Activities)', 'توسعه ارتباطات با بازار، مصارف سفر های محلی ( برای فعالیت های برنامه)', 'توسعه ارتباطات با بازار، مصارف سفر های محلی ( برای فعالیت های برنامه)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1068, 3, 40, 4089, 40894, 'Local Consultants, Program Support Cost', 'مصارف حمایت برنامه، مشاورین محلی', 'مصارف حمایت برنامه، مشاورین محلی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1069, 3, 40, 4089, NULL, '(217) Agreement Amending the Grant Agreement No 217 for the Financing of the rehabilitation spin Boldak road project ', 'پروژه', 'پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1070, 3, 40, 4090, 40901, 'Drip Irrigation System for Home Gardening ', 'سیستم آبیاری قطرئی برای باغبانی خانه ', 'سیستم آبیاری قطرئی برای باغبانی خانه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1071, 3, 40, 4090, 40902, 'Food Processing and Drying ', 'پروسس مواد غذائی و خشک کردن', 'پروسس مواد غذائی و خشک کردن', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1072, 3, 40, 4090, 40903, 'Small Animal Raising ', 'افزایش حیوانات کوچک ', 'افزایش حیوانات کوچک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1073, 3, 40, 4090, 40904, 'Capacity Buildign Training ', 'آموزش های ارتقای ظرفیت ', 'آموزش های ارتقای ظرفیت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1074, 3, 40, 4090, 40905, 'Extension Services and Supervision of the Second Component ', 'گسترش خدمات و نظارت بر بخش دوم ', 'گسترش خدمات و نظارت بر بخش دوم ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1075, 3, 40, 4090, NULL, 'Spanish Contribution to IDLG in Badghis ', 'کمک کشور اسپانیا به اداره مستقل ارگانهای محل در بادغیس', 'کمک کشور اسپانیا به اداره مستقل ارگانهای محل در بادغیس', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1076, 3, 40, 4091, 40910, 'Spanish Contribution to IDLG in Badghis ', 'کمک کشور اسپانیا به اداره مستقل ارگانهای محل در بادغیس', 'کمک کشور اسپانیا به اداره مستقل ارگانهای محل در بادغیس', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1077, 3, 40, 4091, NULL, 'Capacity Building for Natural resources medical traning and rehabilitation of Sayed JTC', 'ظرفیت سازی برای آموزش های طبی و بازسازی JTC', 'ظرفیت سازی برای آموزش های طبی و بازسازی JTC', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1078, 3, 40, 4092, 40920, 'Capacity Building for Natural resources medical traning and rehabilitation of Sayed JTC', 'ظرفیت سازی برای آموزش های طبی منابع طبیعی  و بازسازی JTC', 'ظرفیت سازی برای آموزش های طبی منابع طبیعی  و بازسازی JTC', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1079, 3, 40, 4092, NULL, 'MISFA KFW Proj', 'پروژه MISFA KFW', 'پروژه MISFA KFW', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1080, 3, 40, 4093, 40930, 'MISFA KFW Proj', 'پروژه MISFA KFW', 'پروژه MISFA KFW', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1081, 3, 40, 4093, NULL, 'Support to the Afghanistan National Drug Demand Reduction Policy ', 'پالیسی حمایت از کاهش استفاده از مواد مخدر در افغانستان', 'پالیسی حمایت از کاهش استفاده از مواد مخدر در افغانستان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1082, 3, 40, 4094, 40940, 'Awareness and Understanding about Drug Addiction Problem ', 'آگاهی دهی  در مورد مشکلات بودجود آمده از اعتیاد ', 'آگاهی دهی  در مورد مشکلات بودجود آمده از اعتیاد ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1083, 3, 40, 4094, 40941, 'Strengthening the Capicty of the DTCs', 'تقویت ظرفیت در DTCs', 'تقویت ظرفیت در DTCs', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1084, 3, 40, 4094, 40942, 'Developing and Maintatining and effecting reporting system to review the progress', 'توسعه  سیستم های گزارش دهی موثر برای بررسی پیشرفت', 'توسعه  سیستم های گزارش دهی موثر برای بررسی پیشرفت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1085, 3, 40, 4094, 40943, 'implementing transition plan to reduce inequity and improve efficiency ', 'اجرای طرح های انتقالی برای کاهش بیعدالتی و بهبود موثریت', 'اجرای طرح های انتقالی برای کاهش بیعدالتی و بهبود موثریت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1086, 3, 40, 4094, 40944, 'Development of policies stratagies guidelines for the supportive supervision ', 'رهنمود انکشاف پالیسی و استراتیژی برای حمایت نظارتی', 'رهنمود انکشاف پالیسی و استراتیژی برای حمایت نظارتی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1087, 3, 40, 4094, 40945, 'Developing the Capacity of Clinical staff', 'تقویه ظرفیت کارمندان کلینیک ', 'تقویه ظرفیت کارمندان کلینیک ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1088, 3, 40, 4094, NULL, 'NATEJA Project of the National Skills Development Program ', 'پروژه NATEJA برنامه ملی انکشاف مهارت ها   ', 'پروژه NATEJA برنامه ملی انکشاف مهارت ها   ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1089, 3, 40, 4095, 40950, 'Provision of Training ', 'ارایه آموزش', 'ارایه آموزش', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1090, 3, 40, 4095, 40951, 'Establishment of Employment Services Centers in Heart and Bamyan Provinces ', 'تاسیس مرکز خدمات کاریابی در ولایات هرات و بامیان ', 'تاسیس مرکز خدمات کاریابی در ولایات هرات و بامیان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1091, 3, 40, 4095, 40952, 'Provision of Vocational Training and Entreprenesuship Grant in Hirat Farah and Bamyan ', 'اعانه برای راه اندازی آموزش های فنی و حرفه ای و کارآفرینی  در هرات فراه  و بامیان', 'اعانه برای راه اندازی آموزش های فنی و حرفه ای و کارآفرینی  در هرات فراه  و بامیان', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1092, 3, 40, 4095, NULL, '(SFD/Proj/ZECS/011210/9 ) Scaling up of Zero Energy cold storage technology for the Horticultural Commodities in the high hills of SAARC Countries ', '\n(SFD/Proj/ZECS/011210/9 ) فن آوری انرژی صفر سردخانه  برای نگهداری محصولات باغبانی کشور های عضو SAARC\n', '\n(SFD/Proj/ZECS/011210/9 ) فن آوری انرژی صفر سردخانه  برای نگهداری محصولات باغبانی کشور های عضو SAARC\n', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1093, 3, 40, 4096, 40960, 'construction of zero Energy cold stores ', 'ساخت انرژی صفر سردخانه های نگهداری', 'ساخت انرژی صفر سردخانه های نگهداری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1094, 3, 40, 4096, 40961, 'Procurement of Sprayers silpoline and Crates ', 'تهیه جعبه بندی و سم پاشی (دواپاشی)', 'تهیه جعبه بندی و سم پاشی (دواپاشی)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1095, 3, 40, 4096, 40962, 'Procurement of Benifiial Microbes ', 'تهیه مکروب های مفید', 'تهیه مکروب های مفید', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1096, 3, 40, 4096, 40963, 'Printing and Publications shipment of Goods Travels', 'چاپ و نشر انتقال محصولات  ', 'چاپ و نشر انتقال محصولات  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1097, 3, 40, 4096, 40964, 'Trainings', 'آموزش ', 'آموزش ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1098, 3, 40, 4096, 40965, 'Monitoring and Evaluation', 'نظارت و ارزیابی', 'نظارت و ارزیابی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1099, 3, 40, 4096, NULL, 'Development Assistance of Republic of Kazakistan to MRRD', 'کمک های انکشافی جمهوری قزاقستان برای وزارت انکشاف دهات ', 'کمک های انکشافی جمهوری قزاقستان برای وزارت انکشاف دهات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1100, 3, 40, 4097, 40970, 'Development Assistance of Republic of Kazakistan to MRRD', 'کمک های انکشافی جمهوری قزاقستان برای وزارت انکشاف دهات ', 'کمک های انکشافی جمهوری قزاقستان برای وزارت انکشاف دهات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1101, 3, 40, 4097, NULL, '695- MOPH Stregthening health system in Afghanistna ', '695- MOPH تقویت سیستم صحت وزارت صحت عامه در افغانستان ', '695- MOPH تقویت سیستم صحت وزارت صحت عامه در افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1102, 3, 40, 4098, 40980, 'Health System Stregthening ', 'تقویت سیستم صحت ', 'تقویت سیستم صحت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1103, 3, 40, 4098, NULL, 'Scaling up innovative Approaches to Respond to TB Challengers in Afghanistan ', 'ابتکارعمل و پاسخوگویی در برابر چالشهای توبرکلوز در افغانستان ', 'ابتکارعمل و پاسخوگویی در برابر چالشهای توبرکلوز در افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1104, 3, 40, 4099, 40990, 'Approches Respond to TB', 'رسیدگی به مرض توبرکلوز', 'رسیدگی به مرض توبرکلوز', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1105, 3, 40, 4099, NULL, 'Grant No IDSF-8112-AF Community Livestock and Agriculture Project ( CLAP )', 'Grant No IDSF-8112-AF پروژه زراعت و مالداری افغانستان CLAP', 'Grant No IDSF-8112-AF پروژه زراعت و مالداری افغانستان CLAP', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1106, 3, 40, 4100, 41000, 'Community Development Including Productive Infrastructures and Institutional Streghthening ', 'توسعه اجتماعی از جمله زیرساخت های تولیدی و تقویت نهاد ها', 'توسعه اجتماعی از جمله زیرساخت های تولیدی و تقویت نهاد ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1107, 3, 40, 4100, 41001, 'Project Management Policy Support and Young Progessionals Program ', 'حمایت پالیسی مدیریت پروژه و برنامه ترقی جوانان ', 'حمایت پالیسی مدیریت پروژه و برنامه ترقی جوانان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1108, 3, 40, 4100, NULL, 'Non Formal Approach to Trainings Education and Jobs in Afghanistan ', 'آموزش های تعلیمی غیر رسمی و کاریابی در افغانستان ', 'آموزش های تعلیمی غیر رسمی و کاریابی در افغانستان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1109, 3, 40, 4120, 41200, 'Improving the quality of Non Formal Training', 'انکشاف کیفیت آموزشهای غیر رسمی', 'انکشاف کیفیت آموزشهای غیر رسمی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1110, 3, 40, 4120, 41201, 'Project Management and Capacity Building ', 'ارتقای ظرفیت و مدیریت پروژه ', 'ارتقای ظرفیت و مدیریت پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1111, 3, 40, 4120, 41202, 'Entreprenesurship among unskilled and illiterate young Afghans', 'کارآفرینی برای جوانان افغان بیسواد و بی مهارت ', 'کارآفرینی برای جوانان افغان بیسواد و بی مهارت ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1112, 3, 40, 4120, NULL, 'Grant No DSF-2000000395 AF Rural Microfinance and Livestock Supprot Program ( RMLSP)', 'Grant No DSF-2000000395  برنامه حمایت از قرضه های کوچک مالداری روستائی و افغانستان  ', 'Grant No DSF-2000000395  برنامه حمایت از قرضه های کوچک مالداری روستائی و افغانستان  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1113, 3, 40, 4121, 41210, 'Rural Microfinance  ', 'قرضه های کوچک روستائی', 'قرضه های کوچک روستائی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1114, 3, 40, 4121, 41211, 'Livestock Support Component ', 'حمایت بخش مالداری', 'حمایت بخش مالداری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1115, 3, 40, 4121, 41212, 'Program Management and Coordination ', 'مدیرت برنامه و هماهنگی', 'مدیرت برنامه و هماهنگی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `code_funds` (`id`, `fund_type_code`, `fund_code`, `sub_fund_code`, `fund_componenet_code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(1116, 3, 40, 4121, NULL, 'Grant No: DSF 2000000773 support to National Prity Prgram 2 ', 'Grant No: DSF 2000000773  حمایت برنامه دوم مساوات ملی ', 'Grant No: DSF 2000000773  حمایت برنامه دوم مساوات ملی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1117, 3, 40, 4122, 41220, 'Institutional Development ', 'توسعه نهاد ها', 'توسعه نهاد ها', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1118, 3, 40, 4122, 41221, 'Strategic Investment ', 'استراتیژی سرمایه گذاری ', 'استراتیژی سرمایه گذاری ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1119, 3, 40, 4122, 41222, 'Project Management ', 'مدیریت پروژه ', 'مدیریت پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1120, 3, 40, 4122, 41223, 'Development Projects Implementation - MRRD', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1121, 3, 40, 4122, 41224, 'Operational Coast and Training - MRRD', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1122, 3, 40, 4122, 41225, 'Spanish Agency for international Development Cooperation', 'Spanish Agency for international Development Cooperation', 'Spanish Agency for international Development Cooperation', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1123, 3, 40, 4123, 41230, 'Support to the Ministry of Public Health in Badghis', 'Support to the Ministry of Public Health in Badghis', 'Support to the Ministry of Public Health in Badghis', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1124, 3, 40, 4123, 41231, 'Support to the Ministry of Education in Badghis', 'Support to the Ministry of Education in Badghis', 'Support to the Ministry of Education in Badghis', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1125, 3, 40, 4123, 41232, 'Support to the Independent Directorate of Local Governance in Badghis', 'Support to the Independent Directorate of Local Governance in Badghis', 'Support to the Independent Directorate of Local Governance in Badghis', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1126, 3, 40, 4123, NULL, 'Program Reduce Maternal and Child Mortality Program the Province of Kabul and Herat', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1127, 3, 40, 4124, 41240, 'Strenghthen the Institute for Health Science', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1128, 3, 40, 4124, 41241, 'Rehablitation and Renovation of Neonatal Cardiothraoic Surgery Department at Indira Gandhi Hospital ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1129, 3, 40, 4124, 41242, 'Creat Maternity and neonatal wards in Secondary Hospitals', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1130, 3, 40, 4124, 41243, 'Replace Exixting or supply New Medical and Chirurgical Equipment for Neonatology ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1131, 3, 40, 4124, 41244, 'Re establish the Relemedicine systems', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1132, 3, 40, 4124, NULL, 'Kuwait Goodwill fund For the Promotion of Food Security In Islamic Countries ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1133, 3, 40, 4125, 41250, 'Food Security in Islamic Countries ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1134, 3, 40, 4125, NULL, 'SDF/Proj/ Bamboo Based Enterprise/ 01107202016/242017/426', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1135, 3, 40, 4126, 41260, 'Pre Implementation Activities ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1136, 3, 40, 4126, 41261, 'Common Activities ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1137, 3, 40, 4126, 41262, 'Establishment of Common Facilitation Center', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1138, 3, 40, 4126, 41263, 'Bamboo Production, Harvesting and Post-Harvest Processing ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1139, 3, 40, 4126, 41264, 'Design and Product Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1140, 3, 40, 4126, 41265, 'Marketing', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1141, 3, 40, 4126, NULL, 'BMZ ID: 201667682 (Employment Promotion (German-Maintenance Cash Grants)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1142, 3, 40, 4127, 41270, 'Training ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1143, 3, 40, 4127, 41271, 'Operating Cost', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1144, 3, 40, 4127, NULL, 'DFAT Arragment No 73836 Support to implementation of Dry land Farming Strategy', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1145, 3, 40, 4128, 41280, 'Establishing Approprite and sustainbale DLFS managemnt Mechanisms for the DLFS  within MAIL', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1146, 3, 40, 4128, 41281, 'Improving Govenemnt Capacity instituional Strctures and Partnership to Service the Need of Dry Land Farmers', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1147, 3, 40, 4128, NULL, 'Grant Agreement No. 2000002122 / Community Livestock and Agriculture Poject (CLAP) Additional Finance', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1148, 3, 40, 4129, 41290, 'Institutional Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1149, 3, 40, 4129, 41291, 'Livestock and Agricultural Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1150, 3, 40, 4129, 41292, 'Project Management', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1151, 3, 40, 4129, NULL, 'Development of Legal and Regulatory Framework for Islamic Takaful in Afghanistan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1152, 3, 40, 4130, 41300, 'Consultancy Serices ( Legal and Regulatory Framework+ Technical Traning) Consult Servecies', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1153, 3, 40, 4130, 41301, 'Translation', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1154, 3, 40, 4130, 41302, 'Contingency', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1155, 3, 40, 4130, NULL, 'WASH foran Inclusive and Sustainable Development of the Population of the provinces of of herat Farah Ghor and Bamyan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1156, 3, 40, 4132, 41320, 'To enhance the health Conditions and General Welfare', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1157, 3, 40, 4132, 41321, 'To reduce under 5 child mortality cases of severe diarrhea and disease related to unsafe water', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1158, 3, 40, 4132, 41322, 'Reducing gender discrimination', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1159, 3, 40, 4132, NULL, '(SDF/Proj/Toll-free/35/15/290513/) Approved Number', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1160, 3, 40, 4131, 41310, 'Strengthening Referral Mechanism', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1161, 3, 40, 4131, 41311, 'Network and Lobby with law Enforcement Agencies Inernational Donors', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1162, 3, 40, 4131, 41312, 'National Helpline Center', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1163, 3, 40, 4131, 41313, 'Stregthening the IT system', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1164, 3, 40, 4131, 41314, 'Prepare and Diseminate Regular Reports', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1165, 3, 40, 4131, 41315, 'Study Visits to SAARC Member States to learn Best Practices', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1166, 3, 40, 4131, NULL, 'Support to Agriculture and Rural Marketung of High Value Chains in Herat and Bamyan Afghanistan (SARM)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1167, 3, 40, 4133, 41330, ' \nTo enhance the capacity of MAIL', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1168, 3, 40, 4133, 41331, 'To increase the income of Small Agro producers households', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1169, 3, 40, 4133, 41332, 'To increase income of targeted small agro producers of high value chain', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1170, 3, 40, 4133, NULL, 'Land Clearance of Explosive Remnants of War', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1171, 3, 40, 4134, 41340, 'Hiring Staff Who Will be invoived in the Quality assurance and Quality control aspects of Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1172, 3, 40, 4134, 41341, 'Support and Action the Necessary Administrative Effort for the Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1173, 3, 40, 4134, NULL, ' \nEstablishment of 100 bedded National Hospital for Heart Diseases and four Comprehennsive Health Centers (CHC)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1174, 3, 40, 4135, 41350, 'Cardiology Center: 100 bedded National Hospital for Heart Diseases', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1175, 3, 40, 4135, 41351, 'Construction of Four Comprehensive Health Centers (CHC)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1176, 3, 40, 4135, NULL, 'Arghanadab Integrted Water Resources Development Project -IFAD', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1177, 3, 40, 4136, 41360, 'Components1: Equipments and Materials-MAIL', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1178, 3, 40, 4136, 41361, ' \nComponents 2:Works - MAIL', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1179, 3, 40, 4136, 41362, 'Component 2: Works - MRRD', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1180, 3, 40, 4136, 41363, 'Component 3 :Consultancies', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1181, 3, 40, 4136, NULL, 'Developing Sukul Market in the Islamic Republic of Afghanistan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1182, 3, 40, 4137, 41370, ' \nConsultancy Services', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1183, 3, 40, 4137, 41371, 'Capacity Building', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1184, 3, 40, 4137, 41372, 'Translation and Print', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1185, 3, 40, 4137, 41373, ' \nAudit Report', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1186, 3, 40, 4137, 41374, 'Contingency', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1187, 3, 40, 4138, NULL, ' \nGrant No.2000003486- Rural Poor Stimulus Facility(RPSF/CLAP)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1188, 3, 40, 4138, 41380, ' \nProvision of inputs and basic assets for production', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1189, 3, 40, 4138, 41381, 'Facilitated access to markets', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1190, 3, 40, 4138, NULL, 'Japanese Non Project Grant Aid-2002', 'کمکهای اعانه بدون پروژه جاپان 2002', 'کمکهای اعانه بدون پروژه جاپان 2002', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1191, 3, 40, 4139, NULL, ' \nSustainable land water managment for improved High Value Agriculture Production and Marketing in Herat and Bamyan Provinces(SLWM)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1192, 3, 40, 4139, 41390, ' \nTO enhance the socio-economic and envirnmental of rural communities within sustainalbe land and water management framework in the provinces of Herat and Bamiyan, Afghanistan .', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1193, 3, 40, 4139, 41391, ' \nTo improve agriculture production and marketing af high value chain products supported by sustainable land and water managment practices and by extension system promoting public-private partnerships in', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1194, 3, 40, 4881, 48810, 'Japanese Non Project Grant Aid-2002', 'کمکهای اعانه بدون پروژه جاپان 2002', 'کمکهای اعانه بدون پروژه جاپان 2002', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1195, 3, 40, 4881, NULL, 'Japanese Non Project Grant Aid 2004', 'کمکهای اعانه بدون پروژه جاپان 2004', 'کمکهای اعانه بدون پروژه جاپان 2004', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1196, 3, 40, 4882, 48820, 'Japanese Non Project Grant Aid 2004', 'کمکهای اعانه بدون پروژه جاپان 2004', 'کمکهای اعانه بدون پروژه جاپان 2004', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1197, 3, 40, 4882, NULL, 'Japan Non Project Grant Aid 2005', 'کمکهای اعانه بدون پروژه جاپان 2005', 'کمکهای اعانه بدون پروژه جاپان 2005', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1198, 3, 40, 4883, 48830, 'Japan Non Project Grant Aid 2005', 'کمکهای اعانه بدون پروژه جاپان 2005', 'کمکهای اعانه بدون پروژه جاپان 2005', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1199, 3, 40, 4883, NULL, 'JNPGA 2006', 'JNPGA 2006', 'JNPGA 2006', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1200, 3, 40, 4884, 48840, 'JNPGA 2006', 'JNPGA 2006', 'JNPGA 2006', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1201, 3, 40, 4884, NULL, 'JNPGA 2007', 'JNPGA 2007', 'JNPGA 2007', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1202, 3, 40, 4885, 48850, 'JNPGA 2007', 'JNPGA 2007', 'JNPGA 2007', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1203, 3, 40, 4885, NULL, 'JNPGA2008', 'JNPGA 2008', 'JNPGA 2008', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1204, 3, 40, 4886, 48860, 'JNPGA2008', 'JNPGA 2008', 'JNPGA 2008', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1205, 3, 40, 4886, NULL, 'JnPGA 2009', 'JNPGA 2009', 'JNPGA 2009', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1206, 3, 40, 4887, 48870, 'JnPGA 2009', 'JNPGA 2009', 'JNPGA 2009', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1207, 3, 40, 4887, NULL, 'JNPGA 2010', 'JNPGA 2010', 'JNPGA 2010', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1208, 3, 40, 4888, 48880, 'JNPGA 2010', 'JNPGA 2010', 'JNPGA 2010', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1209, 3, 40, 4888, NULL, 'JNPGA-2011', 'JNPGA 2011', 'JNPGA 2011', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1210, 3, 40, 4889, 48890, 'JNPGA-2011', 'JNPGA 2011', 'JNPGA 2011', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1211, 3, 40, 4889, NULL, 'NPGA 2012', 'JNPGA 2012', 'JNPGA 2012', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1212, 3, 40, 4890, 48900, 'Economic and Social Development ', 'انکشاف اقتصادی و اجتماعی', 'انکشاف اقتصادی و اجتماعی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1213, 3, 40, 4890, 48901, 'Purchase of products', 'خریداری تولیدات ', 'خریداری تولیدات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1214, 3, 40, 4890, NULL, 'Japan Non Project GRANT Aid ( JNPGA)  Main', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1215, 3, 40, 4891, 48910, 'Japan Non Project GRANT Aid ( JNPGA)  Main', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1216, 3, 40, 4891, NULL, 'Japan Non-Project Grant Agreement -2013', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1217, 3, 40, 4892, 48920, 'Japan Non-Project Grant Agreement -2013', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1218, 5, NULL, NULL, NULL, 'DEVELOPMENT BUDGET LOANS', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1219, 5, 51, NULL, NULL, 'WORLD BANK LOANS', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1220, 5, 52, NULL, NULL, 'ASIAN DEVELOPMENT BANK LOANS', 'قروض بانک انکشاف آسیایی', 'قروض بانک انکشاف آسیایی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1221, 5, 52, 4892, NULL, '2165 Power Transmission And Distribution', '2165- انتقال و توزیع برق ', '2165- انتقال و توزیع برق ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1222, 5, 52, 5206, 52060, 'Adb2165 Transimission Lines', 'خطوط انتقالی Adb2165', 'خطوط انتقالی Adb2165', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1223, 5, 52, 5206, 52061, 'Adb2165 Support Facilities', 'تسهیلات حمایتی Adb2165', 'تسهیلات حمایتی Adb2165', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1224, 5, 52, 5206, 52062, 'Adb2165 Resettlement And Monitoring', 'استقرار مجدد و نظارت Adb2165', 'استقرار مجدد و نظارت Adb2165', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1225, 5, 52, 5206, 52063, 'Adb2165 Consultancy Services', 'خدمات مشاورتی Adb2165', 'خدمات مشاورتی Adb2165', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1226, 5, 52, 5206, 52064, 'Adb2165 Unallocated', 'اختصاص نیافته Adb2165', 'اختصاص نیافته Adb2165', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1227, 5, 52, 5206, NULL, '2257 Afg North South Corridor Project', '2257 AFG- پروژه راه سازی شمال جنوب', '2257 AFG- پروژه راه سازی شمال جنوب', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1228, 5, 52, 5207, 52070, 'Rehabilitation Of North - South National Highwa', 'بازسازی شاهراه شمال- جنوب ', 'بازسازی شاهراه شمال- جنوب ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1229, 5, 52, 5207, 52071, 'Provision Of Cross Border Facilities', 'آماده سازی تسهیلات در عبور از سرحدات', 'آماده سازی تسهیلات در عبور از سرحدات', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1230, 5, 52, 5207, 52072, 'Project Management And Monitoring', 'مدیریت پروژه و نظارت', 'مدیریت پروژه و نظارت', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1231, 5, 52, 5207, NULL, '2215 Fiscal Management And Public Administration Reform Project', '2215- مدریت مالی و پروژه اصلاحات اداره عامه ', '2215- مدریت مالی و پروژه اصلاحات اداره عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1232, 5, 52, 5210, 52100, 'Adb 2215 Fiscal Management And Public Administration Reform Project', 'Adb 2215 مدریت مالی و پروژه اصلاحات اداره عامه ', 'Adb 2215 مدریت مالی و پروژه اصلاحات اداره عامه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1233, 5, 53, NULL, NULL, 'OTHER MULTILATERAL LOANS', 'قرضه های چند جانبه ', 'قرضه های چند جانبه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1234, 5, 53, 5210, NULL, '020 Doshi-Khumri Rd - Islamic Development Bank', '020  بانک انکشاف اسلامی - سرک دوشی - پلخمری', '020  بانک انکشاف اسلامی - سرک دوشی - پلخمری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1235, 5, 53, 5300, 53000, 'Islamic Dev Af020 Doshi-Khumri Rd', 'بانک توسعه اسلامی - سرک دوشی - پلخمری Af020 ', 'بانک توسعه اسلامی - سرک دوشی - پلخمری Af020 ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1236, 5, 53, 5300, 53001, 'Civil Works for Constructin of Doshi Pol e Khomri Road ( 509) Km', 'امور ساختمانی و تاسیساتی برای بازسازی سرک دوشی- پلخمری- 509 کیلومتر', 'امور ساختمانی و تاسیساتی برای بازسازی سرک دوشی- پلخمری- 509 کیلومتر', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1237, 5, 53, 5300, 53002, 'Project Consultana Coordination and Implementation Unit', 'مشاور واحد هماهنگی و تطبیق  پروژه  ', 'مشاور واحد هماهنگی و تطبیق  پروژه  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1238, 5, 53, 5300, 53003, 'Project Start up Workshop for IDB Component', 'ورکشاپ آغاز پروژه برای IDB ', 'ورکشاپ آغاز پروژه برای IDB ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1239, 5, 53, 5300, 53004, 'Project Financial Audit', 'تفتیش مالی پروژه ', 'تفتیش مالی پروژه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1240, 5, 53, 5300, NULL, '021 Andkhoy To Aquina Road Project - Islamic Development Bank', '021- پروژه  بانک توسعه اسلامی سرک اندخوی - آقینه ', '021- پروژه  بانک توسعه اسلامی سرک اندخوی - آقینه ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1241, 5, 53, 5301, 53010, 'Af201 Roads Bridges And Other Structures `', 'AF201 ساخت سرک و پل ', 'AF201 ساخت سرک و پل ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1242, 5, 53, 5301, 53012, 'Af201  Consultancy Services', 'AF201 خدمات مشورتی ', 'AF201 خدمات مشورتی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1243, 5, 53, 5301, 53013, 'Af201 Project Implementation Unit', 'AF201 واحد تطبیق پروژه', 'AF201 واحد تطبیق پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1244, 5, 53, 5301, 53014, 'Af201 Project Strat Up Workshop And Famillarisation Unit', 'AF201 ورکشاپ آغاز پروژه و واحد آشناسازی', 'AF201 ورکشاپ آغاز پروژه و واحد آشناسازی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1245, 5, 53, 5301, 53015, 'Af201 Project Financial Audit', 'AF201 تفیش مالی پروژه', 'AF201 تفیش مالی پروژه', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1246, 5, 53, 5301, 53016, 'Af201 Contingencies', 'AF201 احتیاطی (احتمالی)', 'AF201 احتیاطی (احتمالی)', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1247, 5, 53, 5301, NULL, '0403/01 Saudi Fund For Development Kabul Kandahar Herat Road', '0403/01- بودجه عربستا سعودی برای توسعه سرک کابل- کندهار- هرات ', '0403/01- بودجه عربستا سعودی برای توسعه سرک کابل- کندهار- هرات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1248, 5, 53, 5302, 53020, '0403/01 Saudi Fund For Development Kabul Kandahar Herat Road', '0403/01- بودجه عربستا سعودی برای توسعه سرک کابل- کندهار- هرات ', '0403/01- بودجه عربستا سعودی برای توسعه سرک کابل- کندهار- هرات ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1249, 5, 53, 5302, NULL, '026 (Lnrehabilitation And Upgrading Of Irrigation And Water Resource Management Project In Pashtun Zarqun District', '026 - پروژه بازسازی و توسعه مدیریت منابع آب و آبیاری در ولسوالی پشتون زرغون', '026 - پروژه بازسازی و توسعه مدیریت منابع آب و آبیاری در ولسوالی پشتون زرغون', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1250, 5, 53, 5303, 53031, 'Water Resources And Irrigation Development ', 'منابع آب و توسعه آبیاری', 'منابع آب و توسعه آبیاری', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1251, 5, 53, 5303, 53032, 'Project Consultant Coordination And Implementation Unit', 'مشاور واحد هماهنگی و تطبیق  پروژه  ', 'مشاور واحد هماهنگی و تطبیق  پروژه  ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1252, 5, 53, 5303, 53033, 'Project Strat Up Workshop For Idb Component ', 'ورکشاپ آغاز پروژه برای بخش Idb', 'ورکشاپ آغاز پروژه برای بخش Idb', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1253, 5, 53, 5303, 53034, 'Project Financial Audit For Idb Component', 'تفتیش مالی پروژه برای بخش Idb', 'تفتیش مالی پروژه برای بخش Idb', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1254, 5, 53, 5303, NULL, '024-Regional Power Transimiison Interconnection Project ', '024- پروژه اتصال انتقال برق ساحوی', '024- پروژه اتصال انتقال برق ساحوی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1255, 5, 53, 5304, 53041, '220 Kv Kunduz And Baghlan Substations', '220 کیلوولت-  سب استیشن کندوز و بغلان ', '220 کیلوولت-  سب استیشن کندوز و بغلان ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1256, 5, 53, 5304, NULL, 'AFG ( 390596 ) is DB Support to the Agricultural inpusts and purchase of Wheat Stock for Ministry of Agriculture Irrigation and Livestock ( MAIL )', 'زراعت، آبیاری و مالداری MAIL', 'زراعت، آبیاری و مالداری MAIL', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1257, 5, 53, 5305, 53051, 'Agricultural Inpusts ', 'ورودی های زراعتی ', 'ورودی های زراعتی ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1258, 5, 53, 5305, 53052, 'Purchase of Wheat Stock', 'خریداری ذخیره گندم ', 'خریداری ذخیره گندم ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1259, 5, 53, 5305, NULL, 'Loan No 2/483 Armalik Laman Road Project', 'قرضه پروژه سرک ارملک لمن نمبر 2/483 ', 'قرضه پروژه سرک ارملک لمن نمبر 2/483 ', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1260, 5, 53, 5306, 53060, 'Design and Construction works', 'کار های ساختمانی و طراحی', 'کار های ساختمانی و طراحی', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1261, 5, 53, 5306, NULL, 'Urgent Measures for upgarding to ICFAO Standards the heart Airport Project ( UMUSHAP )', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1262, 5, 53, 5307, 53070, 'Serverices Support to ACAA and MoCTCA ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1263, 5, 53, 5307, 53071, 'Work and sytem Development ( Construction ) ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1264, 5, 53, 5307, 53072, 'Procurement of Equipment Machinery goods and Vehicles ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1265, 5, 53, 5307, NULL, 'Rehabilitation of the East West Corridor From Herat to Chisht E Sharif ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1266, 5, 53, 5308, 53080, 'Rehabilitation of 155 Km Road from Herat to Chisht E sharif ', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1267, 5, 53, 5308, NULL, 'Kabul City Ring Road Project', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1268, 5, 53, 5309, 53090, 'Civil Works for Ring Road Construction', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1269, 5, 53, 5309, 53091, 'Civil Works for Social Infrasturcture Development', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1270, 5, 53, 5309, NULL, 'Construction of Schools Project in Afghanistan', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1271, 5, 53, 5310, 53100, 'Civil Works and Accesorries(First phase of the project)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1272, 5, 53, 5310, 53101, 'Furniture and Equipments (Second phase of project)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1273, 5, 53, 5310, 53102, 'Consultancy Services(Third phase of the project)', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1274, 5, 53, 5310, 53103, 'Unallocated', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1275, 8, NULL, NULL, NULL, 'Pension Fund', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1276, 8, 80, 5310, NULL, 'Pension Fund', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1277, 8, 80, NULL, NULL, 'Public Pension Fund', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1278, 8, 80, 8000, 80000, 'Public Pension Fund', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1283, 120000, NULL, NULL, NULL, 'testing', 'testing', 'testing', 1, 1, '2024-07-09 05:53:21', '2024-07-09 05:53:21'),
(1284, 120000, 9000000, NULL, NULL, 'testing 2', 'testing 2', 'testing 2', 1, 1, '2024-07-09 05:55:00', '2024-07-09 05:55:00'),
(1285, 1, 1000, NULL, NULL, 'Regular Budget', 'عادي بودیجه', 'بودجه عادی', 1, 1, '2024-09-07 00:11:59', '2024-09-07 00:13:26'),
(1286, 1, 1000, 1000, NULL, 'Regular Budget', 'عادي بودیجه', 'بودجه عادی', 1, 1, '2024-09-07 00:16:26', '2024-09-07 00:16:26'),
(1287, 1, 1000, 1000, 1000, 'Regular Budget', 'عادي بودیجه', 'بودجه عادی', 1, 1, '2024-09-07 00:17:22', '2024-09-07 00:17:22');

-- --------------------------------------------------------

--
-- Table structure for table `code_locations`
--

CREATE TABLE `code_locations` (
  `id` int(11) NOT NULL,
  `prov_code` int(11) NOT NULL,
  `dist_code` varchar(55) DEFAULT NULL,
  `en_desc` varchar(55) DEFAULT NULL,
  `pa_desc` varchar(55) DEFAULT NULL,
  `da_desc` varchar(55) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `code_locations`
--

INSERT INTO `code_locations` (`id`, `prov_code`, `dist_code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'KABUL', 'کابل', 'کابل', 1, 1, '2024-03-05 09:38:49', '2024-03-05 09:38:49'),
(2, 1, '0101', 'PROVINCIAL CAPITAL OF  KABUL (KABUL)', '(مرکز ولایت کابل ( کابل', '(مرکز ولایت کابل ( کابل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, '0102', 'PAGHMAN', 'پغمان', 'پغمان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, '0103', 'CHAHAR ASYAB', 'چهارآسیاب', 'چهارآسیاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, '0104', 'BAGRAMI', 'بگرامی', 'بگرامی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, '0105', 'DEHSABZ', 'ده سبز', 'ده سبز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, '0106', 'SHAKAR DARA', 'شکردره', 'شکردره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, '0107', 'MUSAHI', 'موسهی', 'موسهی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, '0108', 'MIR BACHA KOT', 'میر بچه کوت', 'میر بچه کوت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, '0109', 'KHAK-E-JABAR', 'خاک جبار', 'خاک جبار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, '0110', 'KALAKAN', 'کلکان', 'کلکان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, '0111', 'GULDARA', 'گلدره', 'گلدره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1, '0112', 'FARZA', 'فرزه', 'فرزه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 1, '0113', 'ESTALEF', 'استالف', 'استالف', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, '0114', 'QARA BAGH', 'قره باغ', 'قره باغ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1, '0115', 'SURUBI', 'سروبی', 'سروبی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 2, NULL, 'KAPISA', 'کاپیسا', 'کاپیسا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 2, '0201', 'PROVINCIAL CAPITAL OF KAPISA (MAHMUDI RAQI)', '( مرکز ولایت کاپیسا (محمود راقی', '( مرکز ولایت کاپیسا (محمود راقی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 2, '0202', 'HISSA-E- DUWUMI KOHISTAN', 'حصه دوم کوهستان', 'حصه دوم کوهستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 2, '0203', 'KOH BAND', 'کوه بند', 'کوه بند', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 2, '0204', 'HISSA-E-AWALI KOHISTAN', 'حصه اول کوهستان', 'حصه اول کوهستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 2, '0205', 'NIJRAB', 'نجراب', 'نجراب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 2, '0206', 'TAGAB', 'تگاب', 'تگاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 2, '0207', 'ALASAY', 'اله سای', 'اله سای', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 3, NULL, 'PARWAN', 'پروان', 'پروان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 3, '0301', 'PROVINCIAL CAPITAL OF PARWAN (CHARIKAR)', '( مرکز ولایت پروان ( چاریکار', '( مرکز ولایت پروان ( چاریکار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 3, '0302', 'BAGRAM', 'بگرام', 'بگرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 3, '0303', 'SHINWARI', 'شینواری', 'شینواری', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 3, '0304', 'SAYID KHAIL', 'سید خیل', 'سید خیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 3, '0305', 'JABULUSSARAJ', 'جبل السراج', 'جبل السراج', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 3, '0306', 'SALANG', 'سالنگ', 'سالنگ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 3, '0307', 'SYAHGIRDI GHORBAND', 'سیاه گرد غوربند', 'سیاه گرد غوربند', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 3, '0308', 'KOHI SAFI', 'کوه صافی', 'کوه صافی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 3, '0309', 'SURKHI PARSA', 'سرخ پارسا', 'سرخ پارسا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 3, '0310', 'SHAYKH ALI', 'شیخ علی', 'شیخ علی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 4, NULL, 'WARDAK', 'وردک', 'وردک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 4, '0401', 'PROVINCIAL CAPITAL OF WARDAK (MAYDAN SHAHR)', '( مرکز ولایت وردک ( میدان شهر', '( مرکز ولایت وردک ( میدان شهر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 4, '0402', 'NERKH', 'نرخ', 'نرخ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 4, '0403', 'JALREZ', 'جلریز', 'جلریز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 4, '0404', 'CHAKI WARDAK', 'چک وردک', 'چک وردک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 4, '0405', 'SAYYDABAD', 'سید آباد', 'سید آباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 4, '0406', 'DAYMIRDAD', 'دایمیرداد', 'دایمیرداد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 4, '0407', 'HISSA-E-AWALI BIHSUD', 'حصه اول بهسود', 'حصه اول بهسود', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 4, '0408', 'JAGHATU', 'جغتو', 'جغتو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 4, '0409', 'MARKAZ-E-BEHSUD', 'مرکز بهسود', 'مرکز بهسود', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 5, NULL, 'LOGAR', 'لوگر', 'لوگر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 5, '0501', 'PROVINCIAL CAPITAL OF  LOGAR ( PULI ALAM )', '(مرکز ولایت لوگر ( پل علم', '(مرکز ولایت لوگر ( پل علم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 5, '0502', 'BARAKI BARAK', 'برکی برک', 'برکی برک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 5, '0503', 'CHARKH', 'چرخ', 'چرخ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 5, '0504', 'KHUSHI', 'خوشی', 'خوشی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 5, '0505', 'MOHAMMAD AGHA', 'محمد آغه', 'محمد آغه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 5, '0506', 'KHAR WAR', 'خروار', 'خروار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 5, '0507', 'AZRA', 'ازره', 'ازره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 6, NULL, 'NANGARHAR', 'ننگرهار', 'ننگرهار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 6, '0601', 'PROVINCIAL CAPITAL OF  NANGARHAR ( JALALABAD )', '(مرکز ولایت ننگرهار ( جلال آباد', '(مرکز ولایت ننگرهار ( جلال آباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 6, '0602', 'BEHSUD', 'بهسود', 'بهسود', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 6, '0603', 'SURKH RUD', 'سرخرود', 'سرخرود', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 6, '0604', 'CHAPARHAR', 'چپرهار', 'چپرهار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 6, '0605', 'KAMA', 'کامه', 'کامه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 6, '0606', 'KUZKUNAR', 'کوزکنر', 'کوزکنر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 6, '0607', 'RODAT', 'رودات', 'رودات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 6, '0608', 'KHUGYANI', 'خوگیانی', 'خوگیانی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 6, '0609', 'BATI KOT', 'بتی کوت', 'بتی کوت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 6, '0610', 'DEH BALA', 'ده بالا', 'ده بالا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 6, '0611', 'PACHIR WAGAM', 'پچیرواگام', 'پچیرواگام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 6, '0612', 'DARAH-E-NOOR', 'دره نور', 'دره نور', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 6, '0613', 'KOT', 'کوت', 'کوت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 6, '0614', 'GOSHTA', 'گوشته', 'گوشته', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 6, '0615', 'ACHIN', 'اچین', 'اچین', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 6, '0616', 'SHINWAR', 'شینوار', 'شینوار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 6, '0617', 'MUHMAND DARA', 'مهمنددره', 'مهمنددره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 6, '0618', 'LALPOOR', 'لعل پور', 'لعل پور', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 6, '0619', 'SHER ZAD', 'شیرزاد', 'شیرزاد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 6, '0620', 'NAZYAN', 'نازیان', 'نازیان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 6, '0621', 'HESARAK', 'حصارک', 'حصارک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 6, '0622', 'DUR BABA', 'دربابا', 'دربابا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 7, NULL, 'LAGHMAN', 'لغمان', 'لغمان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 7, '0701', 'PROVINCIAL CAPITAL OF  LAGHMAN ( MEHTERLAM )', '( مرکز ولایت لغمان ( مهترلام', '( مرکز ولایت لغمان ( مهترلام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 7, '0702', 'QARGHAYEE', 'قرغیی', 'قرغیی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 7, '0703', 'ALISHING', 'علیشنگ', 'علیشنگ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 7, '0704', 'ALINGAR', 'علینگار', 'علینگار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 7, '0705', 'DAWLAT SHAH', 'دولت شاه', 'دولت شاه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 8, NULL, 'PANJSHER', 'پنجشیر', 'پنجشیر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 8, '0801', 'PROVINCIAL CAPITAL OF  PANJSHER ( BAZARAK )', '( مرکز ولایت پنجشیر ( بازارک', '( مرکز ولایت پنجشیر ( بازارک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 8, '0802', 'RUKHA', 'رخه', 'رخه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 8, '0803', 'DARAH', 'دره', 'دره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 8, '0804', 'HISSA-E-AWAL ( KHINJ )', 'حصه اول خنج', 'حصه اول خنج', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 8, '0805', 'UNABA', 'عنابه', 'عنابه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 8, '0806', 'SHUTUL', 'شتل', 'شتل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 8, '0807', 'PARYAN', 'پریان', 'پریان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 9, NULL, 'BAGHLAN', 'بغلان', 'بغلان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 9, '0901', 'PROVINCIAL CAPITAL OF  BAGHLAN ( PUL-I-KHUMRI )', '( مرکز ولایت بغلان ( پلخمری', '( مرکز ولایت بغلان ( پلخمری', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 9, '0902', 'DAHANA-E-GHURI', 'دهنه غوری', 'دهنه غوری', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 9, '0903', 'DUSHI', 'دوشی', 'دوشی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 9, '0904', 'NAHREEN', 'نهرین', 'نهرین', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 9, '0905', 'BAGHLAN-E-JADEED', 'بغلان جید', 'بغلان جید', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 9, '0906', 'KHINJAN', 'خنجان', 'خنجان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 9, '0907', 'ANDARAB', 'اندراب', 'اندراب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 9, '0908', 'DEH SALAH', 'ده صلاح', 'ده صلاح', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 9, '0909', 'BURKA', 'برکه', 'برکه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 9, '0910', 'JALGA', 'جلگه', 'جلگه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 9, '0911', 'TALA WA BARFAK', 'تاله و برفک', 'تاله و برفک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 9, '0912', 'PUL-E-HISAR', 'پل حصار', 'پل حصار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 9, '0913', 'KHOST WA FIRING', 'خوست و فرنگ', 'خوست و فرنگ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 9, '0914', 'GOZARGAH-E-NOOR', 'گذرگاه نور', 'گذرگاه نور', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 9, '0915', 'FIRING WA GHARU', 'فرنگ وغارو', 'فرنگ وغارو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 10, NULL, 'BAMYAN', 'بامیان', 'بامیان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 10, '1001', 'PROVINCIAL CAPITAL OF  BAMYAN ( BAMYAN )', '( مرکز ولایت بامیان ( بامیان', '( مرکز ولایت بامیان ( بامیان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 10, '1002', 'SHEBAR', 'شیبر', 'شیبر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 10, '1003', 'SAIGHAN', 'سیغان', 'سیغان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 10, '1004', 'KAHMARD', 'کهمزد', 'کهمزد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 10, '1005', 'YAKAWLANG', 'یکاولنگ', 'یکاولنگ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 10, '1006', 'PANJAB', 'پنجاب', 'پنجاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 10, '1007', 'WARAS', 'ورس', 'ورس', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 11, NULL, 'GHAZNI', 'غزنی', 'غزنی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 11, '1101', 'PROVINCIAL CAPITAL OF  GHAZNI ( GHAZNI )', '(مرکز ولایت غزنی ( غزنی', '(مرکز ولایت غزنی ( غزنی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 11, '1102', 'WALI MOHAMMAD SHAHID KHUGYANI', 'ولی محمد شهید خوگیانی', 'ولی محمد شهید خوگیانی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 11, '1103', 'KHWAJA OMARI', 'خواجه عمری', 'خواجه عمری', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 11, '1104', 'WAGHAZ', 'واغظ', 'واغظ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 11, '1105', 'DEH YAK', 'ده یک', 'ده یک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 11, '1106', 'JAGHATU', 'جغتو', 'جغتو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 11, '1107', 'ANDAR', 'اندر', 'اندر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 11, '1108', 'ZANAKHAN', 'زنخان', 'زنخان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 11, '1109', 'RASHIDAN', 'رشیدان', 'رشیدان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 11, '1110', 'NAWUR', 'ناور', 'ناور', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 11, '1111', 'QARA BAGH', 'قره باغ', 'قره باغ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 11, '1112', 'GIRO', 'گیرو', 'گیرو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 11, '1113', 'AB BAND', 'آب بند', 'آب بند', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 11, '1114', 'JAGHURI', 'جاغوری', 'جاغوری', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 11, '1115', 'MUQUR', 'مقر', 'مقر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 11, '1116', 'MALISTAN', 'مالستان', 'مالستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 11, '1117', 'GELAN', 'گیلان', 'گیلان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 11, '1118', 'AJRISTAN', 'اجرستان', 'اجرستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 11, '1119', 'NAWA', 'ناوه', 'ناوه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 12, NULL, 'PAKTIKA', 'پکتیکا', 'پکتیکا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 12, '1201', 'PROVINCIAL CAPITAL OF  PAKTIKA ( SHARAN )', '( مرکز ولایت پکتیکا ( شرن', '( مرکز ولایت پکتیکا ( شرن', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 12, '1202', 'MATA KHAN', 'متاخان', 'متاخان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 12, '1203', 'YOSUF KHEL', 'یوسف خیل', 'یوسف خیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 12, '1204', 'YAHYA KHEL', 'یحیی خیل', 'یحیی خیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 12, '1205', 'SAR RAWZA', 'سرروضه', 'سرروضه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 12, '1206', 'OMNA', 'اومنه', 'اومنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 12, '1207', 'ZARGHUN SHAHR', 'زرغون شهر', 'زرغون شهر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 12, '1208', 'GOMAL', 'گومل', 'گومل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 12, '1209', 'JANI KHEL', 'جانی خیل', 'جانی خیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 12, '1210', 'SURUBI', 'سروبی', 'سروبی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 12, '1211', 'URGOON', 'اورگون', 'اورگون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 12, '1212', 'ZIRUK', 'زیروک', 'زیروک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 12, '1213', 'NIKA', 'نیکه', 'نیکه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 12, '1214', 'BARMAL', 'برمل', 'برمل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 12, '1215', 'GIYAN', 'گیان', 'گیان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 12, '1216', 'DILA WA KHUSHAMAND', 'دیله و خوش امند', 'دیله و خوش امند', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 12, '1217', 'WAZAKHWAH', 'وازه خوا', 'وازه خوا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 12, '1218', 'WOR MAMAY', 'ورممی', 'ورممی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 12, '1219', 'TURWO', 'تروو', 'تروو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 13, NULL, 'PAKTYA', 'پکتیا', 'پکتیا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 13, '1301', 'PROVINCIAL CAPITAL OF  PAKTYA ( GARDEZ )', '(مرکز ولایت پکتیا ( گردیز', '(مرکز ولایت پکتیا ( گردیز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 13, '1302', 'AHMADABA', 'احمدآبا', 'احمدآبا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 13, '1303', 'ZURMAT', 'زرمت', 'زرمت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 13, '1304', 'SHWAK', 'شواک', 'شواک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 13, '1305', 'WUZA JADRAN', 'وزه حًدران', 'وزه حًدران', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 13, '1306', 'SAYYID KARAM', 'سیدکرم', 'سیدکرم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 13, '1307', 'JAJI', 'جاجی', 'جاجی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 13, '1308', 'LAJA AHMAD KHEL', 'لجه احمدخیل', 'لجه احمدخیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 13, '1309', 'JANI KHEL', 'جانی خیل', 'جانی خیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 13, '1310', 'SAMKANI', 'حمکنی', 'حمکنی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 13, '1311', 'DAND PATAN', 'دند پتان', 'دند پتان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 14, NULL, 'KHOST', 'خوست', 'خوست', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 14, '1401', 'PROVINCIAL CAPITAL OF  KHOST ( KHOST )', '(مرکز ولایت خوست ( خوست', '(مرکز ولایت خوست ( خوست', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 14, '1402', 'MANDUZAY (ESMAYEL KHEL)', '(مندوزی ( اسماعیل خیل', '(مندوزی ( اسماعیل خیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 14, '1403', 'GURBUZ', 'گربز', 'گربز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 14, '1404', 'TANAY', 'تنی', 'تنی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 14, '1405', 'MUSA KHEL', 'موسی خیل', 'موسی خیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 14, '1406', 'NADIRSHAH KOT', 'نادرشاه کوت', 'نادرشاه کوت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 14, '1407', 'SABARI (YAQUBI)', '(صبری ( یعقوبی', '(صبری ( یعقوبی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 14, '1408', 'ALI SHER', 'علی شیر', 'علی شیر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 14, '1409', 'BAAK', 'باک', 'باک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 14, '1410', 'QALANDAR', 'قلندر', 'قلندر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 14, '1411', 'SPERA', 'اسپره', 'اسپره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 14, '1412', 'SHAMUL', 'شمل', 'شمل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 14, '1413', 'JAJI MAIDAN', 'جاجی میدان', 'جاجی میدان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 15, NULL, 'KUNARHA', 'کنرها', 'کنرها', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 15, '1501', 'PROVINCIAL CAPITAL OF  KUNARHA ( ASAD ABAD )', 'اسعد آباد', 'اسعد آباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 15, '1502', 'MARA WARA', 'مره وره', 'مره وره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 15, '1503', 'WATAPOOR', 'واته پور', 'واته پور', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 15, '1504', 'NARANG WA BADIL', 'نرنگ و بادیل', 'نرنگ و بادیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 15, '1505', 'SAR KANI', 'سرکانی', 'سرکانی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 15, '1506', 'SHIGAL WA SHELTAN', 'شیگل و شیلتن', 'شیگل و شیلتن', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 15, '1507', 'DARA-E-PECH', 'دره پیچ', 'دره پیچ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 15, '1508', 'BAR KUNAR', 'برکنر', 'برکنر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 15, '1509', 'SAWKAI', 'سوکی', 'سوکی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 15, '1510', 'KHAS KUNAR', 'خاص کنر', 'خاص کنر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 15, '1511', 'GHAZI ABAD', 'غازی آباد', 'غازی آباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 15, '1512', 'DANGAM', 'دانگام', 'دانگام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 15, '1513', 'CHAPA DARA', 'چپه دره', 'چپه دره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 15, '1514', 'NOOR GAL', 'نورگل', 'نورگل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 15, '1515', 'NARI', 'نری', 'نری', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 16, NULL, 'NOORISTAN', 'نورستان', 'نورستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 16, '1601', 'PROVINCIAL CAPITAL OF  NOORISTAN ( PAROON )', '( مرکز ولایت نورستان ( پارون', '( مرکز ولایت نورستان ( پارون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 16, '1602', 'WAYGAL', 'وایگل', 'وایگل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 16, '1603', 'WAMA', 'واما', 'واما', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 16, '1604', 'NOOR GRAM', 'نورگرام', 'نورگرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 16, '1605', 'DUAB', 'دوآب', 'دوآب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 16, '1606', 'KAMDESH', 'کامدیش', 'کامدیش', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 16, '1607', 'MANDOL', 'مندول', 'مندول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 16, '1608', 'BARG-E-MATAL', 'برگ متال', 'برگ متال', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 17, NULL, 'BADAKHSHAN', 'بدخشان', 'بدخشان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 17, '1701', 'PROVINCIAL CAPITAL OF  BADAKHSHAN ( FAIZ ABAD )', '( مرکز ولایت بدخشان ( فیض آباد', '( مرکز ولایت بدخشان ( فیض آباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 17, '1702', 'ARGO', 'ارگو', 'ارگو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 17, '1703', 'ARGHANJ KHWAH', 'ارغنجخواه', 'ارغنجخواه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 17, '1704', 'YAFTAL-E-SUFLA', 'یفتل سفلی', 'یفتل سفلی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 17, '1705', 'KHASH', 'خاش', 'خاش', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 17, '1706', 'BAHARAK', 'بهارک', 'بهارک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 17, '1707', 'DARAYIM', 'درایم', 'درایم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 17, '1708', 'KOHISTAN', 'کوهستان', 'کوهستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 17, '1709', 'YAWAN', 'یاوان', 'یاوان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 17, '1710', 'JURM', 'جرم', 'جرم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 17, '1711', 'TASHKAN', 'تشکان', 'تشکان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 17, '1712', 'SHUHADA', 'شهدا', 'شهدا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 17, '1713', 'SHAHR-E-BUZURG', 'شهر بزرگ', 'شهر بزرگ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 17, '1714', 'RAGHISTAN', 'راغستان', 'راغستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 17, '1715', 'KISHM', 'کشم', 'کشم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 17, '1716', 'WARDOOJ', 'وردوج', 'وردوج', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 17, '1717', 'TAGAB', 'تگاب', 'تگاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 17, '1718', 'YAMGAN', 'یمگان', 'یمگان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 17, '1719', 'SHIGHNAN', 'شغنان', 'شغنان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 17, '1720', 'KHWAHAN', 'خواهان', 'خواهان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 17, '1721', 'KUFAB', 'کوف آب', 'کوف آب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 17, '1722', 'DARWAZ-E-PAYIN (MAMAY)', 'درواز پائین مایمی', 'درواز پائین مایمی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 17, '1723', 'ESHKASHIM', 'اشکاشم', 'اشکاشم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 17, '1724', 'SHIKI', 'شکی', 'شکی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 17, '1725', 'ZEBAK', 'زیباک', 'زیباک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 17, '1726', 'KIRAN WA MENJAN', 'کران و منجان', 'کران و منجان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 17, '1727', 'DARWAZ-E-BALA (NESAY)', 'درواز بالا نسی', 'درواز بالا نسی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 17, '1728', 'WAKHAN', 'واخان', 'واخان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 18, NULL, 'TAKHAR', 'تخار', 'تخار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 18, '1801', 'PROVINCIAL CAPITAL OF  TAKHAR ( TALUQAN )', '( مرکز ولایت تخار (  تالقان', '( مرکز ولایت تخار (  تالقان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 18, '1802', 'HAZAR SUMUCH', 'هزار سمچ', 'هزار سمچ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 18, '1803', 'BAHARAK', 'بهارک', 'بهارک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 18, '1804', 'BANGI', 'بنگی', 'بنگی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 18, '1805', 'CHAL', 'چال', 'چال', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 18, '1806', 'NAMAK AB', 'نمک آب', 'نمک آب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 18, '1807', 'KALAFGAN', 'کلفگان', 'کلفگان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 18, '1808', 'FARKHAR', 'فرخار', 'فرخار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 18, '1809', 'KHWAJA GHAR', 'خواجه غار', 'خواجه غار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 18, '1810', 'RUSTAQ', 'رستاق', 'رستاق', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 18, '1811', 'ESHKAMESH', 'اشکمش', 'اشکمش', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 18, '1812', 'DASHT-E-QALA', 'دشت قلعه', 'دشت قلعه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 18, '1813', 'WARSAJ', 'ورسج', 'ورسج', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 18, '1814', 'KHWAJA BAHAWUDDIN', 'خواجه بهاوالدین', 'خواجه بهاوالدین', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 18, '1815', 'DARQAD', 'درقد', 'درقد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 18, '1816', 'CHAHAB', 'چاه آب', 'چاه آب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 18, '1817', 'YANGI QALA', 'ینگی قلعه', 'ینگی قلعه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 19, NULL, 'KUNDUZ', 'کندز', 'کندز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 19, '1901', 'PROVINCIAL CAPITAL OF  KUNDUZ ( KUNDUZ )', '( مرکز ولایت کندز ( کندز', '( مرکز ولایت کندز ( کندز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 19, '1902', 'CHAR DARAH', 'چاردره', 'چاردره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 19, '1903', 'ALI ABAD', 'علی آباد', 'علی آباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 19, '1904', 'KHAN ABAD', 'خان آباد', 'خان آباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 19, '1905', 'HAZRATI IMAM SAHIB', 'حضرت امام صاحب', 'حضرت امام صاحب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 19, '1906', 'DASHTI-E-ARCHI', 'دشت ارچی', 'دشت ارچی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 19, '1907', 'QALA-E-ZAL', 'قلعه ذال', 'قلعه ذال', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 20, NULL, 'SAMANGAN', 'سمنگان', 'سمنگان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 20, '2001', 'PROVINCIAL CAPITAL OF  SAMANGAN ( AYBAK )', '( مرکز ولایت سمنگان ( ایبک', '( مرکز ولایت سمنگان ( ایبک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 20, '2002', 'HAZRAT-E-SULTAN', 'حضرت سلطان', 'حضرت سلطان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 20, '2003', 'KHURAM WA SARBAGH', 'خرم و سارباغ', 'خرم و سارباغ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 20, '2004', 'FEROZ NAKHCHEER', 'فیروزنخچیر', 'فیروزنخچیر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 20, '2005', 'ROI-DO-AB', 'روی دوآب', 'روی دوآب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 20, '2006', 'DARA-E-SOOF-E-PAYIN', 'دره صوف پائین', 'دره صوف پائین', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 20, '2007', 'DARA-E-SOOF-E-BALA', 'دره صوف  بالا', 'دره صوف  بالا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 21, NULL, 'BALKH', 'بلخ', 'بلخ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 21, '2101', 'PROVINCIAL CAPITAL OF  BALKH ( MAZAR-E-SHARIF )', '( مرکز ولایت بلخ ( مزار شریف', '( مرکز ولایت بلخ ( مزار شریف', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 21, '2102', 'NAHR-E-SHAHI', 'نهر شاهی', 'نهر شاهی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 21, '2103', 'DEHDADI', 'دهدادی', 'دهدادی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 21, '2104', 'CHAR KENT', 'چارکنت', 'چارکنت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 21, '2105', 'MARMUL', 'مارمل', 'مارمل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 21, '2106', 'BALKH', 'بلخ', 'بلخ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 21, '2107', 'SHOLGARA', 'شولگره', 'شولگره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 21, '2108', 'CHIMTAL', 'چمتال', 'چمتال', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 21, '2109', 'DAWLAT ABAD', 'دولت اباد', 'دولت اباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 21, '2110', 'KHULM', 'خلم', 'خلم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 21, '2111', 'CHAR BOLAK', 'چاربولک', 'چاربولک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 21, '2112', 'SHORTEPA', 'شورتیپه', 'شورتیپه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 21, '2113', 'KALDAR', 'کلدار', 'کلدار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 21, '2114', 'KISHINDEH', 'کشنده', 'کشنده', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 21, '2115', 'ZARI', 'زاری', 'زاری', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 22, NULL, 'SAR-E- PUL', 'سرپل', 'سرپل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 22, '2201', 'PROVINCIAL CAPITAL OF  SAR-E-PUL ( SAR-E-PUL )', '( مرکز ولایت سرپل ( سرپل', '( مرکز ولایت سرپل ( سرپل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 22, '2202', 'SAYYAD', 'صیاد', 'صیاد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 22, '2203', 'KOHISTANAT', 'کوهستانات', 'کوهستانات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 22, '2204', 'SOZMA QALA', 'سوزمه قلعه', 'سوزمه قلعه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 22, '2205', 'SANGCHARAK', 'سنگ چارک', 'سنگ چارک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 22, '2206', 'GOSFANDI', 'گوسفندی', 'گوسفندی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 22, '2207', 'BALKHAB', 'بلخاب', 'بلخاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 23, NULL, 'GHOR', 'غور', 'غور', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 23, '2301', 'PROVINCIAL CAPITAL OF  GHOR ( CHIGHCHERAN )', '( مرکز ولایت غور ( چغچران', '( مرکز ولایت غور ( چغچران', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 23, '2302', 'DULEENA', 'دولینه', 'دولینه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 23, '2303', 'DAWLATYAR', 'دولت یار', 'دولت یار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 23, '2304', 'CHAR SADA', 'چارصده', 'چارصده', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 23, '2305', 'PASABAND', 'پسابند', 'پسابند', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 23, '2306', 'SHAHRAK', 'شهرک', 'شهرک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 23, '2307', 'LAL WA SARJANGAL', 'لعل وسرجنگل', 'لعل وسرجنگل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 23, '2308', 'TAYWARA', 'تیوره', 'تیوره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 23, '2309', 'TULAK', 'تولک', 'تولک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 23, '2310', 'SAGHAR', 'ساغر', 'ساغر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 23, '2311', 'Marghab', 'مرغاب', 'مرغاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 24, NULL, 'DAYKUNDI', 'دایکندی', 'دایکندی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 24, '2401', 'PROVINCIAL CAPITAL OF  DAYKUNDI ( NILI )', '(مرکز ولایت دایکندی (نیلی', '(مرکز ولایت دایکندی (نیلی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 24, '2402', 'SHAHRISTAN', 'شهرستان', 'شهرستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 24, '2404', 'ISHTERLAI', 'اشترلی', 'اشترلی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 24, '2405', 'KHEDIR', 'خدیر', 'خدیر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 24, '2406', 'GETI', 'گیتی', 'گیتی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 24, '2407', 'MIRAMOR', 'میرامور', 'میرامور', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 24, '2408', 'SANG-E-TAKHT', 'سنگ تخت', 'سنگ تخت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 24, '2409', 'KEJRAN', 'کیجران', 'کیجران', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 25, NULL, 'UROZGAN', 'ارزگان', 'ارزگان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 25, '2501', 'PROVINCIAL CAPITAL OF  UROZGAN ( TIRINKOT )', '(مرکز ولایت ارزگان ( ترینکوت', '(مرکز ولایت ارزگان ( ترینکوت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 25, '2502', 'DEHRAOUD', 'دهراود', 'دهراود', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 25, '2503', 'CHORA', 'چوره', 'چوره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 25, '2504', 'SHAHID-E-HASSAS', 'شهید حساس', 'شهید حساس', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 25, '2505', 'KHAS UROZGAN', 'خاص ارزگان', 'خاص ارزگان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 25, '2506', 'GEZAB', 'گیزاب', 'گیزاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 25, '2507', 'CHENARTO', 'چنارتو', 'چنارتو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 26, NULL, 'ZABUL', 'زابل', 'زابل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 26, '2601', 'PROVINCIAL CAPITAL OF  ZABUL ( QALAT )', '( مرکز ولایت زابل (  قلات', '( مرکز ولایت زابل (  قلات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 26, '2602', 'TARANK WA JALDAK', 'ترنک وجلدک', 'ترنک وجلدک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 26, '2603', 'SHINKAI', 'شینکی', 'شینکی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 26, '2604', 'MIZAN', 'میزان', 'میزان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 26, '2605', 'ARGHANDAB', 'ارغنداب', 'ارغنداب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 26, '2606', 'SHAH JOI', 'شاه جوی', 'شاه جوی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 26, '2607', 'DAICHOPAN', 'دایچوپان', 'دایچوپان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 26, '2608', 'ATGHAR', 'اتغر', 'اتغر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 26, '2609', 'NAW BAHAR', 'نوبهار', 'نوبهار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 26, '2610', 'SHEMEL ZAYI', 'شملزایی', 'شملزایی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 26, '2611', 'KAKAR (KHAK-E-AFGHAN)', '(کاکری (خاک افغان', '(کاکری (خاک افغان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 27, NULL, 'KANDAHAR', 'کندهار', 'کندهار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 27, '2701', 'PROVINCIAL CAPITAL OF  KANDAHAR ( KANDAHAR )', '(مرکز ولایت کندهار (کندهار', '(مرکز ولایت کندهار (کندهار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 27, '2702', 'ARGHANDAB', 'ارغنداب', 'ارغنداب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 27, '2703', 'DAMAN', 'دامان', 'دامان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 27, '2704', 'PANJWAYEE', 'پنجوائی', 'پنجوائی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 27, '2705', 'ZHIRE', 'ژیر', 'ژیر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 27, '2706', 'SHAH WALI KOT', 'شاه ولی کوت', 'شاه ولی کوت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 27, '2707', 'KHAKREZ', 'خاکریز', 'خاکریز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 27, '2708', 'ARGHISTAN', 'ارغستان', 'ارغستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 27, '2709', 'GHORAK', 'غورک', 'غورک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 27, '2710', 'MAIWAND', 'میوند', 'میوند', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 27, '2711', 'SPIN BOLDAK', 'سپین بولدک', 'سپین بولدک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 27, '2712', 'NESH', 'نیش', 'نیش', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 27, '2713', 'MIYANISHIN', 'میانشین', 'میانشین', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 27, '2714', 'SHORABAK', 'شورابک', 'شورابک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 27, '2715', 'MARUF', 'معروف', 'معروف', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 27, '2716', 'REG (SHIGA)', 'ریگ شگه', 'ریگ شگه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 28, NULL, 'JAWZJAN', 'جوزجان', 'جوزجان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 28, '2801', 'PROVINCIAL CAPITAL OF  JAWZJAN [ SHEBERGHAN ]', '( مرکز ولایت جوزجان ( شبرغان', '( مرکز ولایت جوزجان ( شبرغان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 28, '2802', 'KHWAJA DUKOH', 'خواجه دوکوه', 'خواجه دوکوه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 28, '2803', 'KHANAQA', 'خانقاً', 'خانقاً', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 28, '2804', 'MINGAJIK', 'منگجیک', 'منگجیک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 28, '2805', 'QUSH TEPA', 'قوش تیپه', 'قوش تیپه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 28, '2806', 'KHAMYAB', 'خم آب', 'خم آب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 28, '2807', 'AQCHAH', 'آقچه', 'آقچه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 28, '2808', 'FAIZABAD', 'فیض آباد', 'فیض آباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 28, '2809', 'MARDYAN', 'مردیان', 'مردیان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 28, '2810', 'QARQIN', 'قرقین', 'قرقین', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 28, '2811', 'DARZAB', 'درز آب', 'درز آب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 29, NULL, 'FARYAB', 'فاریاب', 'فاریاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 29, '2901', 'PROVINCIAL CAPITAL OF  FARYAB ( MAIMANA )', '( مرکز ولایت فاریاب ( میمنه', '( مرکز ولایت فاریاب ( میمنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 29, '2902', 'PASHTUN KOT', 'پشتون کوت', 'پشتون کوت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 29, '2903', 'KHWAJA SABZ POSH-E-WALI', 'خواجه سبز پوش ولی', 'خواجه سبز پوش ولی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 29, '2904', 'ALMAR', 'المار', 'المار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 29, '2905', 'BIL CHIRAGH', 'بل چراغ', 'بل چراغ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 29, '2906', 'SHIRIN TAGAB', 'شرین تگاب', 'شرین تگاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 29, '2907', 'QAISAR', 'قیصار', 'قیصار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 29, '2908', 'GURZIWAN', 'گرزیون', 'گرزیون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 29, '2909', 'DAWLAT ABAD', 'دولت آباد', 'دولت آباد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 29, '2910', 'KOHISTAN', 'کوهستلن', 'کوهستلن', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 29, '2911', 'QARAM QUL', 'قرم قل', 'قرم قل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 29, '2912', 'QURGHAN', 'قر غان', 'قر غان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 29, '2913', 'ANDKHOY', 'اند خوی', 'اند خوی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 29, '2914', 'KHANI CHARBAGH', 'خان چار باغ', 'خان چار باغ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 29, '2915', 'Ghormach', 'غورماچ', 'غورماچ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 30, NULL, 'HELMAND', 'هلمند', 'هلمند', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 30, '3001', 'PROVINCIAL CAPITAL OF  HELMAND (LASHKARGAH)', '( مرکز ولایت هلمند ( لشکرگاه', '( مرکز ولایت هلمند ( لشکرگاه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 30, '3002', 'NAD ALI', 'نادعلی', 'نادعلی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 30, '3003', 'NAWA-E-BARIKZAYI', 'ناوه بارکزائی', 'ناوه بارکزائی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 30, '3004', 'NAHR-E-SARAJ', 'نهر سراج', 'نهر سراج', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 30, '3005', 'WASHER', 'وا شـــیــر', 'وا شـــیــر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 30, '3006', 'GARM SER', 'گرم سیر', 'گرم سیر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 30, '3007', 'NAWZAD', 'نوزاد', 'نوزاد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 30, '3008', 'SANGIN QALA', 'سنگین قلعه', 'سنگین قلعه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 30, '3009', 'MUSA QALA', 'موسی قلعه', 'موسی قلعه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 30, '3010', 'KAJAKI', 'کجکی', 'کجکی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 30, '3011', 'REG-E-KHAN NISHIN', 'ریک خـانـشین', 'ریک خـانـشین', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 30, '3012', 'BAGHRAN', 'باغران', 'باغران', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 30, '3013', 'DESHU', 'دیشو', 'دیشو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 30, '3014', 'Marja', 'مارجه', 'مارجه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 31, NULL, 'BADGHIS', 'بادغیس', 'بادغیس', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 31, '3101', 'PROVINCIAL CAPITAL OF  BADGHIS ( QALA-E-NOW )', '( مرکز ولایت بادغیس ( قلعه نو', '( مرکز ولایت بادغیس ( قلعه نو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 31, '3102', 'AB KAMARI', 'آبکمری', 'آبکمری', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 31, '3103', 'MUQUR', 'مقر', 'مقر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 31, '3104', 'QADIS', 'قادس', 'قادس', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 31, '3105', 'BALA MURGHAB', 'بالا مرغاب', 'بالا مرغاب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 31, '3106', 'JAWAND', 'جونـد', 'جونـد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 31, '3107', 'GHORMACH', 'غـورماچ', 'غـورماچ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 32, NULL, 'HERAT', 'هرات', 'هرات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 32, '3201', 'PROVINCIAL CAPITAL OF  HERAT (HERAT)', '( مرکز ولایت هرات ( هرات', '( مرکز ولایت هرات ( هرات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 32, '3202', 'ENJIL', 'انجیل', 'انجیل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 32, '3203', 'NIZAM-E-SHAHID (GUZARA)', '(نظام شهید (گذره', '(نظام شهید (گذره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 32, '3204', 'KARRUKH', 'کرخ', 'کرخ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 32, '3205', 'ZENDAJAN', 'زنده جان', 'زنده جان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 32, '3206', 'PASHTUN ZARGHUN', 'پشتون زرغون', 'پشتون زرغون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 32, '3207', 'KUSHK (RUBAT-E-SANGI)', '( کشک ( رباط سنگی', '( کشک ( رباط سنگی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 32, '3208', 'GULRAN', 'گلران', 'گلران', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 32, '3209', 'ADRASKAN', 'ادرسکن', 'ادرسکن', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 32, '3210', 'KUSHK-E-KUHNA', 'کشک کهنه', 'کشک کهنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 32, '3211', 'GHORYAN', 'غوریان', 'غوریان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 32, '3212', 'OBE', 'اوبه', 'اوبه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 32, '3213', 'KOHSAN', 'کهسان', 'کهسان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 32, '3214', 'SHINDAND', 'شیندند', 'شیندند', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 32, '3215', 'FERSI', 'فرسی', 'فرسی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 32, '3216', 'CHISHT-E-SHARIF', 'چشت شریف', 'چشت شریف', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 33, NULL, 'FARAH', 'فراه', 'فراه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 33, '3301', 'PROVINCIAL CAPITAL OF  FARAH (FARAH)', '( مرکز ولایت فراه ( فراه', '( مرکز ولایت فراه ( فراه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 33, '3302', 'PUSHTRUD', 'پشت رود', 'پشت رود', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 33, '3303', 'KHAK-E-SAFED', 'خاک سفید', 'خاک سفید', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 33, '3304', 'QALA-E-KAH', 'قلعه کاه', 'قلعه کاه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 33, '3305', 'SHIB KOH', 'شیب کوه', 'شیب کوه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 33, '3306', 'BALA BULUK', 'بالا بلوک', 'بالا بلوک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 33, '3307', 'ANAR DARA', 'انار دره', 'انار دره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 33, '3308', 'BAKWA', 'بکواه', 'بکواه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 33, '3309', 'LASH-E-JUWAYN', 'لاش جوین', 'لاش جوین', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 33, '3310', 'GULISTAN', 'گلستان', 'گلستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 33, '3311', 'PUR CHAMAN', 'پر جمن', 'پر جمن', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 34, NULL, 'NIMROZ', 'نیمروز', 'نیمروز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 34, '3401', 'PROVINCIAL CAPITAL OF  NIMROZ (ZARANJ)', '( مرکز ولایت نیمروز ( زرنج', '( مرکز ولایت نیمروز ( زرنج', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 34, '3402', 'KANG', 'کنگ', 'کنگ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 34, '3403', 'ASL-E-CHAKHANSUR', 'اصل چخانسور', 'اصل چخانسور', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 34, '3404', 'CHAR BURJAK', 'چهار برجک', 'چهار برجک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 34, '3405', 'KHASHROD', 'خاشرود', 'خاشرود', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 34, '3406', 'Dil Aram', 'دل آرام', 'دل آرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 90, NULL, 'Central Ministries', 'وزارت های مرکزی', 'وزارت های مرکزی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 90, '9000', 'Central Ministries', 'وزارت های مرکزی', 'وزارت های مرکزی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 95, NULL, 'Offshore Payments', 'تادیات خارجی ', 'تادیات خارجی ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 95, '9500', 'Offshore Payments', 'تادیات خارجی ', 'تادیات خارجی ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `code_objects`
--

CREATE TABLE `code_objects` (
  `id` int(11) NOT NULL,
  `category_code` int(11) DEFAULT NULL,
  `major_code` int(11) DEFAULT NULL,
  `minor_code` int(11) DEFAULT NULL,
  `object_code` int(11) DEFAULT NULL,
  `en_desc` text DEFAULT NULL,
  `pa_desc` text DEFAULT NULL,
  `da_desc` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `code_objects`
--

INSERT INTO `code_objects` (`id`, `category_code`, `major_code`, `minor_code`, `object_code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(1, 2, 21, NULL, NULL, 'Expenses wages and salaries ', 'مصارف مزد ها و معاشات', 'د معاشونو او معاشونو لګښت', 1, 1, '2024-03-05 09:38:49', '2024-07-03 04:56:25'),
(2, 2, 21, 211, NULL, 'Cash wages and salaries', 'مزد ها و معاشات نقدی', 'نغدي معاشونه او معاشونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 2, 21, 211, 21100, 'Civil servants (permanent)', 'کارمندان ملکی (دائمی )', 'ملکي مامورین (دایمي)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 21, 211, 21101, 'Civil servants (employees and workers)', 'کارمندان ملکی (اجيران و کارگران)', 'ملکي مامورین (کارمندان او کارکونکي)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 2, 21, 211, 21102, 'armed institutions', 'ادارات قوای مسلح', 'وسله وال بنسټونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 21, 211, 21103, 'Armed forces', 'افراد قوای مسلح', 'مسلح قواوې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 2, 21, 211, 21104, 'Members of the Wolesi Jirga and the Elders Jirga ', 'اعضاء ولسی جرگه و مشرانو جرگه ', 'د ولسي جرګې او مشرانو جرګې غړي ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 2, 21, 211, 21105, 'Employees abroad', 'کارمندان خارج از کشور', 'په بهر کې کارمندان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 2, 21, 211, 21106, 'doctors', 'داکتران', 'ډاکټران', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 2, 21, 211, 21107, 'teachers', 'معلمین ابتدایه', 'ښوونکي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 2, 21, 211, 21108, 'Middle school teachers', 'معلمین متوسطه', 'د منځني ښوونځي ښوونکي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 2, 21, 211, 21109, 'other teachers ', 'دیگر معلمین ', 'نور ښوونکي ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 2, 21, 211, 21110, 'Employees at random', 'کارمندان بالمقطع', 'په تصادفي توګه کارمندان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 2, 21, 211, 21111, 'Employees of the country equivalent to the salary', 'کارمندان ملکی معادل نظامی ( معاش )', 'د هیواد کارمندان د معاش سره برابر دي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 2, 21, 211, 21112, 'difference in rank ', 'تفاوت معاشات ( رتب ) ', 'په درجه کې توپیر ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 2, 21, 211, 21115, 'Privileges for Students ', 'امتیازات برای محصلین ', 'د زده کونکو لپاره امتیازات ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 2, 21, 211, 21116, 'Payments for reserve employees ', 'تادیات برای کارمندان ریزرف ', 'د ریزرو کارمندانو لپاره تادیات ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 2, 21, 211, 21117, 'University teachers', 'استادان پوهنتون', 'د پوهنتون استادان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 2, 21, 211, 21120, 'employees country equivalent', 'کارمندان ملکی معادل نظامی ( امتیازات )', 'د کارمند هیواد مساوي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 2, 21, 211, 21121, 'Professional and cadre privileges', 'امتيازات مسلکی و کادری', 'مسلکي او کدر امتیازات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 2, 21, 211, 21122, 'Temporary Additional Privileges (PRR)', 'امتيازات اضافی موقتی (PRR)', 'لنډمهاله اضافي امتیازات (PRR)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 2, 21, 211, 21123, 'Benefits', 'امتيازات ديگر - نقدی', 'ګټې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 2, 21, 211, 21124, 'overtime', 'اضافه کاری', 'پس له وخته', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 2, 21, 211, 21125, 'Imtiazāt rajkowi is serious and at risk', 'امتيازات منطقوی سنگين و پر خطر', 'امتیاز راجکووی جدي او په خطر کې دی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 2, 21, 211, 21126, 'forgiveness', 'بخشش', 'بخښنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 2, 21, 211, 21127, 'maculat', 'ماکولات', 'ماکولات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 2, 21, 211, 21128, 'تدیات که درفوسول فوک تصنیف نهدین', 'تادیات که درفصول فوق تصنیف نشده', 'تدیّات که درفوسول فوک تصنیف نه‌دین', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 2, 21, 211, 21130, 'Operational expenses are special and sophisticated', 'مصارف اوپراتیفی خاص و مستور', 'عملیاتي لګښتونه ځانګړي او پیچلي دي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 2, 21, 211, 21131, ' امتجاسمسلكي كادري بيونيفورم ', ' امتیازمسلکی کادری بایونیفورم ', ' امتجاسمسلكي كادري بيونيفورم ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 2, 21, 211, 21132, ' امتجاعات حتركرمندان uniform ', ' امتیازات خطرکارمندان یونیفورم ', ' امتجاعات حترکرمندان یونیفورم ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 2, 21, 211, 21133, ' Dismissal of employees with uniform ', ' بخشش کارمندان با یونیفورم ', ' د یونیفورم سره د کارمندانو ګوښه کول ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 2, 21, 211, 21134, ' privilege category service (uniform)', ' امتياز كتگوري خدمت (یونیفورم)', ' د امتیاز کټګورۍ خدمت (یونیفورم)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 2, 21, 211, 21135, ' Salary Afghan Local Police (Uniform)', ' معاش پولیس محلی افغان (یونیفورم)', ' د افغان محلي پولیسو معاش (یونیفورم)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 2, 21, 211, 21136, ' increase temporary salary (uniform)', ' تزئید موقت معاش (یونیفورم)', ' لنډمهاله معاش زیاتول (یونیفورم)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 2, 21, 211, 21137, 'Balance Pay (Uniform)', 'توازن معاش (یونیفورم)', 'بیلانس معاش (یونیفورم)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 2, 21, 211, 21138, 'بکشش بری local police', 'بخشش برای پوليس محلی', 'بکش بری سیمه ایز پولیس', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 2, 21, 211, 21139, 'اعاشه بريا local police', 'اعاشه برای پولیس محلی', 'عاشه بریالی محلی پولیس', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 2, 21, 211, 21140, 'حق الزحمه ', 'حق الزحمه ', 'حق الزحمه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 2, 21, 211, 21141, 'jobber', 'نوکریوالی', 'کارګر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 2, 21, 211, 21142, 'risk', 'حق الخطر', 'خطر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 2, 21, 212, NULL, 'Cash wages and salaries', 'مزد ها و معاشات نقدی', 'نغدي معاشونه او معاشونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 2, 21, 212, 21200, 'food for employees', 'غذا برای کارمندان', 'د کارمندانو لپاره خواړه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 2, 21, 212, 21201, 'Providing housing for employees', 'تهيه کردن مسکن برای کارمندان', 'د کارمندانو لپاره د کور چمتو کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 2, 21, 212, 21202, 'Transportation for employees', 'ترانسپورت برای کارمندان', 'د کارمندانو لپاره ترانسپورت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 2, 21, 212, 21203, 'Coupon food', 'کوپون غذا', 'د کوپن خواړه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 2, 21, 212, 21204, 'Paying cash', 'تادیه نقدی جهت مصارف ترانسپورتی', 'د نغدو پیسو ورکول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 2, 21, 212, 21205, ' Food for employees with uniform ', ' غذا برای کارمندان با یونیفورم ', ' د یونیفورم سره د کارمندانو لپاره خواړه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 2, 21, 213, NULL, 'Cash wages and salaries', 'مزد ها و معاشات نقدی', 'نغدي معاشونه او معاشونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 2, 21, 213, 21300, 'Advance wages and salaries', 'مزد ها و معاشات پيشکی', 'مخکینۍ معاشونه او معاشونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 2, 21, 213, 21301, 'تادیات پیشکی اپراطیفی خاص و مستور', 'تادیات پیشکی اوپراتیفی  خاص و مستور', 'تادیات پیشکی اپراطیفی خاص و مستور', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 2, 21, 214, NULL, ' منفعت هاي جمعه - نقدی', ' منفعت های اجتماعی - نقدی', ' منفعت های جمعه – نقدی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 2, 21, 214, 21400, 'Assistance to employees', 'تاديات کمکی به کارمندان', 'د کارمندانو سره مرسته', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 2, 21, 214, 21401, 'تاديه عنفكاك', 'تاديه انفکاک', 'تاديه عنفكاك', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 2, 21, 214, 21402, 'تادیه مرجیی و ولادی', 'تاديه مريضی و ولادی', 'تادیه مرجی و ولادی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 2, 21, 214, 21403, 'تاديه فاميل Employees بعلت وفات', 'تاديه فاميل کارمندان بعلت وفات', 'د تاديه فاميل کارمندان بعلت مړ شو', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 2, 21, 214, 21405, ' Paid auxiliary staff uniform ', ' تادیه کمکی کارمندان یونیفورم ', ' د مرستندویه کارمندانو یونیفورم ورکول ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 2, 21, 214, 21500, 'منفعت تعليقة تربيه فاميل كرماني ', 'منفعت تعلیم تربیه فامیل کارمند ', 'منفعت تعليقة تربيه فاميل كرماني ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 2, 21, 214, 21600, 'প্র্বা আজামিমিন্য়ি', 'پرداخت اعزامی ملی (یونیفورم)', 'প্রভা আজامني', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 2, 21, 214, 21610, ' Promotional benefits (uniform)', ' امتيازات تشويقي هوائي (یونیفورم)', ' پروموشنل ګټې (یونیفورم)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 2, 21, 214, 21620, ' special incentives (uniform)', ' امتیازات تشویقی عملیات های خاص (یونیفورم)', ' ځانګړي هڅونې (یونیفورم)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 2, 21, 214, 21630, ' (Uniform)', ' امتيازات تشويقي صحيه  (یونیفورم)', ' (یونیفورم)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 2, 21, 214, 21640, ' Distinctive Engineering and Materials (Uniform)', ' امتيازات تشويقي انجينيري و مواد منفلقه  (یونیفورم)', ' ځانګړي انجینري او توکي (یونیفورم)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 2, 21, 214, 21650, ' special duties and other privileges (uniform)', ' وظایف خاص و امتیازات دیگر (یونیفورم)', ' ځانګړې دندې او نور امتیازات (یونیفورم)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 2, 21, 214, 21651, 'Imtiaz استقبل جديد بكتاة أناث قواي و أميرة', 'امتیاز استخدام جدید طبقه اناث قوای و مسلح', 'امتیاز استقبل جديد بكتاة أناث قواي و أميرة', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 2, 21, 214, 21652, 'Imtiaz payment of expenses during education and training category female forces and armed forces', 'امتیاز پرداخت مصارف در جریان آموزش و پرورش طبقه اناث قوای و مسلح', 'د ښځینه ځواکونو او وسله والو ځواکونو د تعلیم او روزنې د کټګورۍ د لګښتونو امتیاز ورکول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 2, 21, 214, 21653, 'Imtiaz دوام خدمة كتاة اناظ قواي و امريكة', 'امتیاز دوام خدمت طبقه اناث قوای و مسلح', 'امتیاز خدمت دوام کتاة اناظ قواي و امريكة', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 2, 21, 214, 21654, ' Imtiaz مدرقة اطفال قواي Armed females', ' امتیاز مراقبت اطفال قوای مسلح اناث', ' امتیاز مدرقة اطفال قواي وسله وال ښځینه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 2, 21, 214, 21655, 'Imtiaz توشینی روزر تقهی اناث قوای Armed', 'امتیاز تجدید قرارداد طبقه اناث قوای مسلح', 'امتیاز توشینی روزر تقهی اناث قوای مسلح', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 2, 21, 214, 21656, 'امتیاز کوھای و سادریک کوای Armed Forces', 'امتیاز هماهنگی و همبستگی قوای مسلح', 'امتیاز کوایی او سادریک کوای وسله وال ځواکونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 2, 21, 214, 21657, 'Imtiaz ربيه تقهيم عناث قواي armed', 'امتیاز رهبری طبقه اناث قوای مسلح', 'امتياز ربيه تقهيم عناث قواي وسله وال', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 2, 21, 214, 21998, 'Disparity in salary', 'تفاوت اسعار معاشات', 'په معاش کې توپیر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 2, 21, 214, 21999, 'Back expenses ', 'برگشت مصارف معاشات ', 'بیرته لګښتونه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 2, 21, 214, NULL, 'Use of goods and services', 'استفاده اجناس و خدمات', 'د توکو او خدماتو کارول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 2, 22, NULL, NULL, 'travel', 'سفريه', 'سفر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 2, 22, 221, 22100, 'امتيا ز - internal ', 'امتيا ز - داخلی ', 'امتیا ز - داخلي ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 2, 22, 221, 22101, 'International privilege  ', 'امتياز  بین المللی  ', 'نړیوال امتیازات  ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 2, 22, 221, 22102, 'سفريه - interior ', 'سفریه - داخلی ', 'سفريه - داخله ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 2, 22, 221, 22103, 'سفریه - خریی ', 'سفریه - خارجی ', 'سفریه - خریی ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 2, 22, 221, 22104, 'سفريه Internal Staff Uniform ', 'سفريه داخلی کارمندان یونیفورم ', 'د سفري داخلي کارکوونکو یونیفورم ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 2, 22, 221, 22105, 'advance ', 'پیشکی های سفریه ', 'پرمختگ ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 4, 22, 222, NULL, 'food', 'غذا', 'خواړه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 4, 22, 222, 22201, 'Diet - without salary', 'غذا - بدون معاش', 'خواړه - پرته له معاش', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 4, 22, 222, 22202, 'Advance food without income', 'پیشکی های غذا بدون معاش', 'پرته له عاید څخه پرمختللي خواړه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 2, 22, 223, NULL, 'Contract Services', 'خدمات قراردادی', 'د قرارداد خدمتونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 2, 22, 223, 22300, 'Services Advertising ', 'خدمات اشتهاری تبلیغاتی اجتماعی ', 'د خدماتو اعلانونه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 2, 22, 223, 22301, 'of course ', 'طبع ', 'البته ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 2, 22, 223, 22302, 'investigation and calculation ', 'تفتیش و محاسبه ', 'تفتیش او محاسبه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 2, 22, 223, 22303, 'Engineering and Design ', 'انجنیری و دیزاین ', 'انجینري او ډیزاین ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 2, 22, 223, 22304, 'Security services ', 'خدمات امنیتی ', 'امنیتي خدمتونه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 2, 22, 223, 22305, 'rent and relocation ', 'کرایه و جابجا شدن ', 'کرایه او ځای په ځای کول ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 2, 22, 223, 22306, 'Seminars and educational courses ', 'سیمینار ها و کورس های آموزشی ', 'سیمینارونه او تعلیمي کورسونه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 2, 22, 223, 22307, 'बुड़ेट अव्युक्षी श्रक्तु हाय शुर्ष्टी', 'بودجه انکشافی  شرکت های مشورتی', 'بړستن اژدهی شرکت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 2, 22, 223, 22308, 'বাদ্জা অন্যাক্যিনি মান্শ্যান্যান', 'بودجه انکشافی مشاورين انفرادی', 'বদجا অন্যکینی مانشینان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 2, 22, 223, 22309, ' Disclosure services', ' انکشافی خدمات مؤسسات غيردولتی', ' د افشا کولو خدمتونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 2, 22, 223, 22310, 'Budget Development - Project Management', 'بودجه انکشافی - اداره پروژه', 'د بودیجې پراختیا - د پروژې مدیریت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 2, 22, 223, 22311, 'Budget Disclosure', 'بودجه انکشافی - فيس های اداری', 'د بودیجې افشا کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 2, 22, 223, 22312, 'Expenditures of general public funds and access to funds', 'مصارف عام المنفعه بودجه انکشافی و وجوه دسترسی والیان', 'د عامه فنډونو لګښتونه او فنډونو ته لاسرسی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 2, 22, 223, 22313, 'Expenditure food budget disclosure ', 'مصارف غذا بودجه انکشافی ', 'د خوراکي توکو د لګښت بودیجه افشا کول ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 2, 22, 223, 22314, 'Expenditure on repairs, maintenance and maintenance for the purpose of disclosure ', 'مصارف ترمیمات و حفظ و مراقبت بوجه انکشافی ', 'د افشا کولو په موخه د ترمیم، ساتنې او مراقبت لګښت ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 2, 22, 223, 22316, 'Management', 'معاشات مشاورین', 'مدیریت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 2, 22, 223, 22317, 'मेंशात प्रभाष्ट अक्तूष्ट मोन्जर्ट अन्थाने ', 'معاشات کارشناسان اختصاصی وزارت داخله ', 'په زړه پوری ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 5, 22, 224, NULL, 'Repairs and Maintenance', 'ترميمات و حفظ و مراقبت', 'ترمیم او ساتنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 5, 22, 224, 22400, 'vehicle', 'وسیله نقليه', 'موټر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 5, 22, 224, 22401, 'construction equipment', 'تجهيزات ساختمانی', 'ساختماني وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 5, 22, 224, 22402, 'transport equipment', 'تجهيزات ترانسپورتی', 'د ترانسپورت وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 5, 22, 224, 22403, 'telecommunication equipment', 'تجهيزات مخابراتی', 'مخابراتي وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 5, 22, 224, 22404, 'Equipment', 'تجهيزات اطلاعات جمعی', 'تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 5, 22, 224, 22405, 'Equipment generating energy', 'تجهيزات مولد انرژی', 'د انرژۍ تولیدولو وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 5, 22, 224, 22406, 'Mining Equipment', 'تجهيزات استخراج معادن', 'د کان کیندنې وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 5, 22, 224, 22407, 'Agricultural equipment', 'تجهيزات زراعتی', 'کرنیز وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 5, 22, 224, 22408, 'Equipment Office', 'تجهيزات دفتر', 'د تجهیزاتو دفتر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 5, 22, 224, 22409, 'Water distribution and drainage equipment', 'تجهيزات توزيع آب وکاناليزاسيون', 'د اوبو ویش او د اوبو ایستلو وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 5, 22, 224, 22410, 'military equipment', 'تجهيزات نظامی', 'پوځي تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 5, 22, 224, 22411, 'Medical and laboratory equipment', 'تجهيزات طبی و لابراتوری', 'طبي او لابراتوار تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 5, 22, 224, 22412, 'Sports and recreation equipment', 'تجهيزات ورزشی و تفريحی', 'د سپورت او تفریح ​​تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 5, 22, 224, 22413, 'استبدال تولدي صنايع واقتبيه ها', 'تجهيزات توليدی صنايع ورکشاپ ها', 'استبدال تولدي صنايع واقتبيه ها', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 5, 22, 224, 22414, 'Artifacts Antiques and Artifacts', 'تجهيزات اثار عتيقه و هنری', 'اثار لرغوني اثار او اثار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 5, 22, 224, 22415, ' houses', ' منازل', ' کورونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 5, 22, 224, 22416, 'construction', 'ساختمان ها', 'ساختمان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 5, 22, 224, 22417, 'other buildings', 'دیگر عمارات', 'نورې ودانۍ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 5, 22, 224, 22418, 'Advance repairs and maintenance', 'پیشکی های ترمیمات و حفظ و مراقبت', 'مخکینۍ ترمیم او ساتنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 5, 22, 224, 22421, 'Repair / maintenance and maintenance of fixed and permanent hair', 'ترمیم / حفظ و مراقبت بال های ثابت و دورانی', 'د ثابت او دایمي ویښتانو ترمیم / ساتنه او ساتنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 5, 22, 224, 22422, 'Computer hardware equipment', 'تجهیزات کمپیوتری سخت افزار', 'د کمپیوټر هارډویر تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 5, 22, 224, 22423, 'Computer software equipment', 'تجهیزات کمپیوتری نرم افزار', 'د کمپیوټر سافټویر تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 5, 22, 224, 22424, '#VALUE!', '', '#VALUE!', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 5, 22, 224, 22425, 'Budget sustainability facilities', 'بودجه پایداری تاسیسات', 'د بودیجې پایښت اسانتیاوې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 5, 22, 224, 22426, 'حفظ ومرقبت road', 'حفظ ومراقبت سرک ها', 'حفظ ومرقبت سړک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 5, 22, 224, 22427, 'Daily maintenance', 'حفظ ومراقبت بحش مراقبت روزانه', 'ورځنی ساتنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 0, 22, 225, NULL, 'عام المنفعه', 'عام المنفعه', 'عام المنفعه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 3, 22, 225, 22500, 'electricity', 'برق', 'بریښنا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 3, 22, 225, 22501, 'water', 'آب', 'اوبه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 3, 22, 225, 22502, 'communication ', 'مخابرات ', 'ارتباط ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 3, 22, 225, 22503, 'Services Municipality', 'خدمات شاروالی', 'د ښاروالۍ خدمات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 3, 22, 225, 22504, 'ماخری پیستی ', 'مخارج پستی ', 'ماخری پیستی ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 3, 22, 225, 22509, 'تادیات پیشکی عام المنعفه', 'تاديات پيشکی عام المنعفه', 'تادیات پیشکی عام المنعفه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 3, 22, 225, 22511, 'internet usage', 'مصارف انترنت', 'د انټرنیټ کارول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 0, 22, 226, NULL, 'روغنيات', 'روغنيات', 'روغنيات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 2, 22, 226, 22601, 'روگنیات - عراده Jat', 'روغنيات - عراده جات', 'روگنیات - اراده جات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 2, 22, 226, 22602, 'gas', 'گاز', 'ګاز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 2, 22, 226, 22603, 'روغنيات - تنظير', 'روغنيات - داخلی', 'روغنيات – تنظير', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 2, 22, 226, 22604, 'Air fuel material', 'مواد سوخت هوایی', 'د هوا د سونګ مواد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 2, 22, 227, NULL, 'Goods and accessories ', 'سامان و لوازم ', 'توکي او لوازم ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 2, 22, 227, 22700, 'Medical and laboratory', 'طبی و لابراتوری', 'طبي او لابراتوار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 2, 22, 227, 22701, 'office supplies and supplies', 'تجهيزات و تدارکات دفتری', 'د دفتر سامانونه او اکمالات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 2, 22, 227, 22702, 'kitchen and kitchen', 'منزل و آشپزخانه', 'پخلنځي او پخلنځي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 2, 22, 227, 22703, 'Books, educational and entertainment materials', 'کتب، مواد تعليمی و تفريحی', 'کتابونه، تعلیمي او تفریحي مواد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 2, 22, 227, 22705, 'البسه', 'البسه', 'البسه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 2, 22, 227, 22706, 'furniture', 'فرنيچر', 'فرنیچر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 2, 22, 227, 22707, 'Safe documents and documents', 'اسناد و اوراق بهادار', 'خوندي اسناد او اسناد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 2, 22, 227, 22708, 'Goods and accessories', 'سامان و لوازم زراعتی', 'توکي او لوازم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 2, 22, 227, 22709, 'Military equipment and supplies', 'تجهيزات و لوازم نظامی', 'پوځي تجهیزات او تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 2, 22, 227, 22711, 'collections ', 'تحایف ', 'ټولګه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 2, 22, 227, 22712, 'اسباب تعديق فراز های قوای هاوای افغانستان', 'اسباب آموزش پرواز های قوای هوائی افغانستان', 'اسباب تعدیق فراز های قوای هاوایی افغانستان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 2, 22, 227, 22713, 'Equipment for Afghanistan Air Force ', 'تجهیزات برای قوای هوائی افغانستان ', 'د افغانستان د هوايي ځواک لپاره تجهیزات ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 2, 22, 227, 22714, 'البسه باب non-wearable', 'البسه باب غیر پوشیدنی', 'البسه باب د نه اغوستو وړ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 2, 22, 227, 22715, 'Supply of medical drugs to security forces', 'فراهم نمودن ادویه جات طبی به نیروهای  امنیتی', 'امنیتي ځواکونو ته د طبي درملو ورکول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 2, 22, 228, NULL, 'Other expenses', 'سایر مصارف', 'نور لګښتونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 2, 22, 228, 22800, 'rent', 'کرايه', 'کرایه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 2, 22, 228, 22801, 'Fees, licenses and permits', 'فيس، لايسنس ها و جوازنامه ها', 'فیسونه، جوازونه او جوازونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 2, 22, 228, 22802, 'commission', 'کميشن ها', 'کمیسیون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 2, 22, 228, 22803, 'Tax, Customs and Excise', 'ماليه، محصول و تعرقه گمرکی', 'مالیه، ګمرک او محصول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 2, 22, 228, 22804, 'کمک به دادرات پیروستی کھیلی', 'کمک به ادارات خدمات اجتماعی', 'کمک به دادرات پیروستی لوبه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 2, 22, 228, 22805, 'Helping religious organizations', 'کمک به سازمان های مذهبی', 'د مذهبي سازمانونو سره مرسته کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 2, 22, 228, 22806, 'Paying the right of the organization وشميه ', 'پرداخت حق العضويت ها وسهميه ', 'د تنظيم وشميه حق ادا کول ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 2, 22, 228, 22807, 'insurance ', 'بيمه ', 'بیمه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 2, 22, 228, 22808, 'land rent', 'کرايه زمین', 'د ځمکې کرایه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 2, 22, 228, 22809, 'Code Misc ', 'کود متفرقه قرار داد های سال گذشته وزارت داخله و دفاع ', 'کوډ متفرقه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 2, 22, 228, 22810, 'Repayment Income ', 'باز  پرداخت عواید ', 'د بیرته تادیاتو عاید ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 0, 22, 229, NULL, 'Advance and return expenses', 'پیشکی ها و برگشت مصارف', 'پرمختگ او بیرته راستنیدنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 2, 22, 229, 22900, 'تادیات پیشکی وجه سردستی ', 'تادیات پیشکی وجه سردستی ', 'تادیات پیشکی وجه سردستی ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 2, 22, 229, 22901, 'Advances in goods and services ', 'تادیات پیشکی اجناس و خدمات ', 'په توکو او خدماتو کې پرمختګ ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 2, 22, 229, 22902, 'پیشکی های لیتر کردیت اجناس و تسورکی', 'پیشکی های لیتر آف کردیت اجناس و خدمات', 'پیشکی های لیتر کیریت اجناس او تسورکی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 2, 22, 229, 22909, 'Transfer Funds Budget Disclosure', 'انتقال وجوه بودجه انکشافی به ولایات', 'د بسپنو لیږد بودیجه افشا کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 2, 22, 229, 22998, 'Difference in prices, expenses and services', 'تفاوت اسعار مصارف و خدمات', 'په نرخونو، لګښتونو او خدماتو کې توپیر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 2, 22, 229, 22999, 'Return goods and services ', 'برگشت اجناس و مصارف خدمات ', 'توکي او خدمات بیرته راستانه کړئ ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 0, 22, 229, NULL, 'Interest and Repayment Loans', 'مفاد و بازپر داخت قروض', 'سود او بیرته تادیه پورونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 0, 23, NULL, NULL, 'interests', 'مفاد', 'ګټې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 0, 23, 230, 23000, 'Foreign Loans - Bank Jahani', 'قروض خارجی - بانک جهانی', 'بهرني پورونه - بانک جهاني', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 0, 23, 230, 23001, 'External Loans - ADB', 'قروض خارجی - ADB', 'بهرني پورونه - ADB', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 0, 23, 230, 23002, 'External loans - IMF', 'قروض خارجی - IMF', 'بهرني پورونه - IMF', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 0, 23, 230, 23003, 'ক্র্জা ক্র্যার - মেসিকানা', 'قروض خارجی - متفرقه', 'کرزا کرې - মেসিকাنا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 0, 23, 230, 23004, 'loans internal', 'قروض داخلی', 'داخلي پورونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 0, 23, 230, 23005, 'loans internal', 'قروض داخلی', 'داخلي پورونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 0, 23, 232, NULL, 'Refinance loans', 'بازپر داخت قروض', 'د پورونو بیا تمویل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 0, 23, 232, 23200, 'Repayment Loans - World Bank', 'بازپرداخت قروض - بانک جهانی', 'د پورونو بیرته تادیه - نړیوال بانک', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 0, 23, 232, 23201, 'Repayment Loans - ADB', 'بازپرداخت قروض - ADB', 'د پورونو بیرته تادیه - ADB', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 0, 23, 232, 23202, 'Repayment loans - IMF', 'بازپرداخت قروض - IMF', 'د پورونو بیرته تادیه - IMF', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 0, 23, 232, 23203, 'Repayment Loans', 'بازپرداخت قروض خارجی - متفرقه', 'د پورونو بیرته تادیه کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 0, 23, 232, 23204, 'Repayment loans internal', 'بازپرداخت قروض داخلی', 'داخلي پورونه بیرته تادیه کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 0, 23, 232, 23205, 'Repayment loans internal', 'بازپرداخت قروض داخلی', 'داخلي پورونه بیرته تادیه کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 0, 23, 232, 23206, ' Subsidies, contributions free of charge and collective benefits', ' سبسایدی ها، مساعدت های بلاعوض ومنفعت های اجتماعی', ' سبسایډي، وړیا مرستې او ډله ایزې ګټې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 0, 24, NULL, NULL, 'تصفحهای میسنکهه', 'انتقالهای متفرقه، مشخص ناشده', 'تصفحهای میسنکهه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 0, 24, 241, 24100, 'ساهمیه های سرمایوی به افغانی بیشتون بیشتری بها سپرده های افغان (ADPIC)', 'سهمیه های سرمایوی به موسسه بیمه حفاظتی سپرده های آفغان (ADPIC)', 'ساهمیه های سرمایوی به افغانی بیشتون بیشتی بها سپرده های افغان (ADPIC)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 0, 24, 241, 24101, '#VALUE!', '', '#VALUE!', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 0, 24, 242, NULL, 'Subsidy', 'سبسایدی ها', 'سبسایډي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 0, 24, 242, 24200, 'تصدی های دولتیتی', 'تصدی های دولتی', 'تصدی های دولتی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 0, 24, 242, 24201, 'financial (government) ', 'تصدی های مالی ( دولتی) ', 'مالي (حکومتي) ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 0, 24, 242, 24202, 'private enterprises', 'تصدی های خصوصی (غير دولتی)', 'خصوصي تصدۍ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 0, 24, 242, 24203, 'special ', 'تصدی های خصوصی ', 'ځانګړی ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 0, 24, 242, 24204, 'سایر سباسیدی ها', 'ساير سبسايدی ها', 'سایر سباسیدی ها', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 0, 24, 243, NULL, ' Subsidy, free assistance and community benefits', ' سبسایدی ها، مساعدت های بلاعوض ومنفعت های اجتماعی پیشکی', ' سبسایډي، وړیا مرستې او د ټولنې ګټې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 0, 24, 243, 24301, 'Loans - Local Government', 'قروض - حکومت محلی', 'پورونه - محلي حکومت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 0, 24, 243, 24302, 'Loans - Central Govt', 'قروض - حکومت مرکزی', 'پورونه - مرکزي حکومت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 0, 24, 243, 24303, 'Loans - Government loans', 'قروض - تصدی های دولتی', 'پورونه - دولتي پورونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 0, 24, 243, 24304, 'Loans - Domestic - Non-Sector Public', 'قروض - داخلی - غیرسکتور عامه', 'پورونه - کورني - غیر سکتوري عامه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 0, 24, 244, NULL, 'স্র্তিত্ত্য हा জার্র্যার্যার্যা ', 'مساعدت ها جاری- خارجی ', 'سټریټه هې جریره ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 0, 24, 244, 24401, 'international institutions', 'مؤسسات بين المللی', 'نړیوال بنسټونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 0, 24, 244, 24402, 'international institutions', 'مؤسسات بين المللی', 'نړیوال بنسټونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 0, 24, 244, 24403, 'Emergency situations and natural disasters', 'مساعدت های حالت اضطرار و حوادث طبیعی', 'بیړني حالتونه او طبیعي پیښې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 0, 24, 244, 24404, 'به ورته شهدا و معلولین ', 'مساعدت به ورثه شهدا و معلولین ', 'به ورته شهدا او معلولین ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 0, 24, 244, 24405, 'Help with the disabled', 'مساعدت به معلولین', 'له معلولینو سره مرسته وکړئ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 0, 24, 245, NULL, 'अस्वित्र हैजारी- साइर दादरात अमारी दोलत', 'مساعدت هاجاری- سایر ادارات عمومی دولت', 'اوسوتر هزاري- سائر دادرات امري دولت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 0, 24, 245, 24500, 'Municipality', 'شاروالی', 'ښاروالۍ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 0, 24, 245, 24501, ' Other assistance', ' سایر مساعدت ها دیگر', ' نورې مرستې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 0, 24, 246, NULL, 'अस्वित्र हैजारी- साइर दादरात अमारी दोलत', 'مساعدت هاجاری- سایر ادارات عمومی دولت', 'اوسوتر هزاري- سائر دادرات امري دولت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 0, 24, 246, 24600, 'Municipality', 'شاروالی', 'ښاروالۍ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 0, 24, 247, NULL, 'منفعت های تعریف کے کے کے - نقدی', 'منفعت های امنیت اجتماعی - نقدی', 'منفعت های تعریف د دې لپاره - نقدی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 0, 24, 247, 24700, 'Salary pension', 'پرداخت حقوق تقاعد -حیاتی ملکی مستمری غیر رتب', 'معاش تقاعد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 0, 24, 247, 24701, 'ربحد حقوق پینہ -جدید التظبیت vital country non-retirement', 'پرداخت حقوق تقاعد -جدید التثبیت حیاتی ملکی غیر رتب', 'ربحد حقوق پینہ -جدید التظبیت حیاتي هیواد غیر تقاعد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 0, 24, 247, 24702, 'பார்கு சுக்கு பாட்ட்டு -குத்தியு மாட்டியு மால் கேர் தர்ப்பு', 'پرداخت حقوق تقاعد -قطع علاقه حیاتی ملکی غیر رتب', 'பார்கு சுக்கு பாட்ட்டு -குத்தியு மாட்டியு மால் கேர் தர்ப்', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 0, 24, 247, 24703, 'Salary pension', 'پرداخت حقوق تقاعد -حیاتی ملکی مستمری رتب', 'معاش تقاعد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 0, 24, 247, 24704, 'ربحد حقوب تعريف -جديد التظبيت vital rank', 'پرداخت حقوق تقاعد -جدید التثبیت حیاتی ملکی رتب', 'ربحد حقوب تعریف -جدید التظبیت حیاتي رتبه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 0, 24, 247, 24705, 'குத்து முக்கு பாட்டு -குத்தியுக்கு மெட்டு மாலி', 'پرداخت حقوق تقاعد -قطع علاقه حیاتی ملکی رتب', 'کټګوری، کلی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 0, 24, 247, 24706, 'ربحد حقوب پینہ -ورته ملکی منزودی غیر رتب ', 'پرداخت حقوق تقاعد -ورثه ملکی مستمری غیر رتب ', 'ربحد حقوب پینہ -ورته ملکی منزودی غیر رتب ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 0, 24, 247, 24707, 'رقد حقوب تعريف -جديد التظبيت ورته ملكي غير رتب ', 'پرداخت حقوق تقاعد -جدید التثبیت ورثه ملکی غیر رتب ', 'رقد حقوب تعريف - جديد التظبيت ورته ملكي غير رتب ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 0, 24, 247, 24708, 'رقبة رقوم تعريف -قطع عبالة ورته ملكي غير رتب ', 'پرداخت حقوق تقاعد -قطع علاقه ورثه ملکی غیر رتب ', 'رقبة رقوم تعريف -قطع عبالة ورته ملكي غير رتب ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 0, 24, 247, 24709, 'ربده رقوم تعربة ', 'پرداخت حقوق تقاعد -ورثه ملکی مستمری رتب ', 'ربده رقوم تعربة ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 0, 24, 247, 24710, 'ربحد حقوب تعريف -جديد التظبيت ورته ملكي رتب ', 'پرداخت حقوق تقاعد -جدید التثبیت ورثه ملکی رتب ', 'ربحد حقوب تعريف - جديد التظبيت ورته ملكي رتب ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 0, 24, 247, 24711, 'رقبة حقوب تعريف -قطع عابلة ورته ملكي رتب', 'پرداخت حقوق تقاعد -قطع علاقه ورثه ملکی رتب', 'رقبة حقوب تعريف - قطع عابلة ورته ملكي رتب', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 0, 24, 247, 24712, 'پیں لہے پینہ - حیاتی نیزامی منزودی غیر رفورم', 'پرداخت حقوق تقاعد -حیاتی نظامی مستمری غیر ریفورم', 'پاڼی پینه - حیاتی نیزامی منزودی غیر رفرم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 0, 24, 247, 24713, 'رقد حقوب پينز -جديد التظبيت vital system non-reform', 'پرداخت حقوق تقاعد -جدید التثبیت حیاتی نظامی  غیر ریفورم', 'رقد حقوب پينز -جديد التظبيت حیاتي نظام عدم سمون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 0, 24, 247, 24714, 'Payment of pension rights - interest in vital military non-reform', 'پرداخت حقوق تقاعد -قطع علاقه حیاتی نظامی غیر ریفورم', 'د تقاعد د حقونو تادیه - په حیاتي نظامي غیر اصالحاتو کې دلچسپي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 0, 24, 247, 24715, 'பெருக்கு சுக்கு பெர்ப்பு - இட்டி நியம் நியுக்க்கு', 'پرداخت حقوق تقاعد -حیاتی نظامی مستمری ریفورم', 'பெருக்கு சுக்கு பெர்ப்பு - இட்டி நியம் நியுக்கு', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 0, 24, 247, 24716, 'Retirement pensions - جديد التظبيت vital system reform', 'پرداخت حقوق تقاعد -جدید التثبیت حیاتی نظامی ریفورم', 'د تقاعد تقاعد - د حیاتي سیسټم اصالحات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 0, 24, 247, 24717, 'Payment of pension rights - interest in vital military reform', 'پرداخت حقوق تقاعد -قطع علاقه حیاتی نظامی ریفورم', 'د تقاعد د حقونو تادیه - په حیاتي نظامي اصلاحاتو کې دلچسپي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 0, 24, 247, 24718, 'رقد حقوب پینزی -ورته نیزامی منزلی کیر رومر', 'پرداخت حقوق تقاعد -ورثه نظامی مستمری غیر ریفورم', 'رقد حقوب پنزی -ورته نیزامی منزلی کیر رومر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 0, 24, 247, 24719, 'Retirement Pensions', 'پرداخت حقوق تقاعد -جدید التثبیت ورثه نظامی غیر ریفورم', 'د تقاعد تقاعد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 0, 24, 247, 24720, 'رقبة حقوب تعريف - قطع عابلة ورته نيزامي غير رومر', 'پرداخت حقوق تقاعد -قطع علاقه ورثه نظامی  غیر ریفورم', 'رقبة حقوب تعريف - قطع عابلة ورته نيزامي غير رومر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 0, 24, 247, 24721, 'رقبة حقوب تعريف -ورته نیزامی منزلی رفورم', 'پرداخت حقوق تقاعد -ورثه نظامی مستمری ریفورم', 'رقبة حقوب تعریف -ورته نیزامی منزلی رفرم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 0, 24, 247, 24722, 'Retirement pensions ', 'پرداخت حقوق تقاعد -جدید التثبیت ورثه نظامی ریفورم ', 'د تقاعد تقاعد ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 0, 24, 247, 24723, 'رقبة حقوب تعريف - قطع عصلة ورته نيزامي رافورم', 'پرداخت حقوق تقاعد -قطع علاقه ورثه نظامی ریفورم', 'رقبة حقوب تعريف - قطع عصلة ورته نيزامي رافورم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 0, 24, 247, 24724, '#VALUE!', '', '#VALUE!', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 0, 24, 247, 24729, 'ساير منفعت ها نقدی', 'سایر منفعت ها نقدی', 'سایر منفعت ها نقدی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 0, 24, 247, 24730, 'حقوب تعريف به معلولين', 'حقوق تقاعد به معلولین', 'حقوب تعريف به معلولين', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 0, 24, 247, 24740, ' Pensions for martyrs', ' حقوق تقاعد برای خانواده گان شهداء', ' د شهیدانو لپاره تقاعد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 0, 24, 247, 24780, 'Transferring the rights of retirees to the account of the pension fund', 'انتقال حقوق متقاعدین به حساب خزینه تقاعد', 'د تقاعد فنډ حساب ته د متقاعدینو حقونه لیږدول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 0, 24, 248, NULL, 'منفعت هاي جمعه - نقدی', 'منفعت های اجتماعی - نقدی', 'منفعت های جمعه – نقدی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 0, 24, 248, 24800, 'منفعت های صیپلیکران', 'منفعت های شاگردان', 'منفعت های سایپلکران', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 0, 24, 248, 24801, 'سایر منفعت ها', 'ساير منفعت ها', 'سایر منفعت ها', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 0, 24, 248, 24802, 'Cash assistance to returnees ', 'کمک های نقدی به عودت کننده گان ', 'له راستنیدونکو سره نغدي مرسته ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 0, 24, 248, 24803, 'Cash assistance for internally displaced persons', 'کمک های نقدی برای بیجا شده گان داخلی', 'د داخلي بې ځایه شویو سره نغدي مرسته', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 0, 24, 248, 24888, 'Chapter 24', 'کود برای تعهدات باب 24', 'څپرکی 24', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 0, 24, 249, NULL, ' Subsidy, free assistance and community benefits', ' سبسایدی ها، مساعدت های بلاعوض ومنفعت های اجتماعی پیشکی', ' سبسایډي، وړیا مرستې او د ټولنې ګټې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 0, 24, 249, 24900, 'Advance subsidies are beneficial to the community', 'پیشکی های سبسایدی ها منفعت های اجتماعی', 'مخکینۍ سبسایډي د ټولنې لپاره ګټورې دي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 0, 24, 249, 24909, '#VALUE!', '', '#VALUE!', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 0, 24, 249, 24999, 'குக்குத்தி முப்புட்டை', 'بازگشتی منفعت های اجتماعی', 'مجموعه مجموعه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 0, 24, NULL, NULL, 'business owner ', 'کسب دارای ', 'د سوداګرۍ خاوند ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 0, 25, NULL, NULL, ' constructions and buildings', ' ساختمان ها و عمارات', ' ساختمانونه او ودانۍ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 0, 25, 251, 25100, 'business houses ', 'کسب منازل ', 'سوداګریز کورونه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 0, 25, 251, 25101, 'house renovations', 'ترميمات منازل', 'د کور ترمیم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 0, 25, 251, 25102, 'عمار منازل', 'اعمار منازل', 'عمار منازل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 0, 25, 251, 25103, 'Non-residential buildings', 'کسب ساختمان های غير مسکونی', 'غیر استوګنې ودانۍ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 0, 25, 251, 25104, 'Non-residential constructions', 'ترميمات  ساختمان های غير مسکونی', 'غیر استوګن ساختمانونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 0, 25, 251, 25105, 'Non-residential buildings', 'اعمار ساختمان های غير مسکونی', 'غیر استوګنې ودانۍ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 0, 25, 251, 25106, 'عمار سرك ها', 'اعمار سرک ها', 'عمار سرك ها', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 0, 25, 251, 25107, 'بهسازی سرک ها', 'بهسازی سرک ها', 'بهسازی سرک ها', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 0, 25, 251, 25108, 'عمار سيستم عبرساني', 'اعمار سيستم آبرسانی', 'عمار سیسټم عبرساني', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 0, 25, 251, 25109, 'بهسازی سیستم ابرسانی ', 'بهسازی  سيستم آبرسانی ', 'بهسازی سیستم ابرسانی ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 0, 25, 251, 25110, 'Other constructions', 'کسب ساختمان های ديگر', 'نور ساختمانونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 0, 25, 251, 25111, 'Improvement of other structures', 'بهسازی ساختمان های ديگر', 'د نورو جوړښتونو ښه والی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 0, 25, 251, 25112, 'Other constructions', 'اعمار ساختمان های ديگر', 'نور ساختمانونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 0, 25, 251, 25113, '#VALUE!', '', '#VALUE!', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 0, 25, 251, 25114, 'internet and computer', 'انترنت وکمپیوتر', 'انټرنیټ او کمپیوټر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 0, 25, 252, NULL, ' Machinery and equipment (costing more than 50,000 Afghani)', ' ماشین آلات و تجهیزات (بهای بیشتر از 50,000 افغانی)', ' ماشینري او تجهیزات (له 50,000 افغانیو څخه ډیر لګښت لري)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 0, 25, 252, 25200, 'accessories', 'عراده جات', 'لوازم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 0, 25, 252, 25201, 'construction equipment', 'تجهيزات ساختمانی', 'ساختماني وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 0, 25, 252, 25202, 'transport equipment', 'تجهيزات ترانسپورتی', 'د ترانسپورت وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 0, 25, 252, 25203, 'telecommunication equipment', 'تجهيزات مخابراتی', 'مخابراتي وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 0, 25, 252, 25204, 'Equipment', 'تجهيزات اطلاعات جمعی', 'تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 0, 25, 252, 25205, 'Equipment generating energy', 'تجهيزات مولد انرژی', 'د انرژۍ تولیدولو وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 0, 25, 252, 25206, 'Mining Equipment', 'تجهيزات استخراج معادن', 'د کان کیندنې وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 0, 25, 252, 25207, 'Agricultural equipment', 'تجهيزات زراعتی', 'کرنیز وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 0, 25, 252, 25208, 'office equipment', 'تجهيزات  دفتری', 'د دفتر وسايل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 0, 25, 252, 25209, 'Equipment for water and sewage treatment', 'تجهيزات تهيه آب و کاناليزاسيون', 'د اوبو او فاضله موادو د درملنې وسایل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 0, 25, 252, 25210, 'Medical and laboratory equipment', 'تجهيزات طبی و لابراتوری', 'طبي او لابراتوار تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 0, 25, 252, 25211, 'military equipment', 'تجهيزات نظامی', 'پوځي تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 0, 25, 252, 25212, 'Sports and entertainment equipment', 'تجهيزات سپورتی و تفريحی', 'د سپورت او تفریح ​​تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 0, 25, 252, 25213, 'Industrial equipment and workshops', 'تجهيزات صنعتی و ورکشاپ ها', 'صنعتي تجهیزات او ورکشاپونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 0, 25, 252, 25214, 'Internal security equipment', 'تجهیزات امنیت داخلی', 'داخلي امنیتي تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 0, 25, 252, 25215, 'Repair equipment for fixed and fixed hair ', 'تدارک تجهیزات برای بال های ثابت و گردان ', 'د ثابت او ثابت ویښتو لپاره د ترمیم تجهیزات ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 0, 25, 252, 25216, 'Purchase equipment for Afghanistan air force ', 'خریداری تجهیزات برای قوای هوائی افغانستان ', 'د افغانستان د هوايي ځواک لپاره د تجهیزاتو پیرود ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 0, 25, 252, 25217, 'Explosive Ordnance Aircraft Afghanistan Air Force ', 'مهمات و تجهیزات منفجره طیارات قوای هوائی افغانستان ', 'د افغانستان هوایی ځواک چاودیدونکی توکی ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 0, 25, 252, 25218, 'Computer hardware equipment', 'تجهیزات کمپیوتری سخت افزار', 'د کمپیوټر هارډویر تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 0, 25, 252, 25219, 'Computer software equipment', 'تجهیزات کمپیوتری نرم افزار', 'د کمپیوټر سافټویر تجهیزات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 0, 25, 252, 25220, 'Security control devices including built-in devices and all types of fortifications and barriers for search posts ', 'وسایل تحکمیات امنیتی به شمول وسایل نصب شدنی و تمام انواع استحکامات و موانع برای پوسته های تلاشی ', 'د امنیت کنټرول وسیلې په شمول جوړ شوي وسایل او د قلعې ټول ډولونه او د لټون پوسټونو لپاره خنډونه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 0, 25, 252, 25290, 'Equipment not listed above', 'تجهیزات که درفوق تصنیف نگردیده', 'تجهیزات چې پورته لیست شوي ندي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 0, 25, 257, NULL, 'اشیای بهادار', 'اشیای بهادار', 'اشیا بهادر', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 0, 25, 257, 25700, 'Artifacts and Artifacts', 'آثار عتيقه و هنری', 'اثار او اثار', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 0, 25, 257, 25701, 'Miscellaneous', 'آثار متفرقه', 'متفرقه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 0, 25, 258, NULL, 'zamin', 'زمین', 'زامن', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 0, 25, 258, 25800, 'purchase land', 'خريداری زمين', 'ځمکه اخیستل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 0, 25, 259, NULL, 'تادیات پیشکی سرمایوی/برگشت ها', 'تادیات پیشکی سرمایوی/برگشت ها', 'تادیات پیشکی سرمایوی/برگشت ها', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 0, 25, 259, 25900, 'Advance capital ', 'تادیات پیشکی سرمایه ', 'مخکینۍ سرمایه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 0, 25, 259, 25902, 'پیشکی های لیتر اف کردیت کسب کیست', 'پیشکی های لیتر اف کردیت کسب دارایی', 'پیشکی های لیتر اف کیریت کسب کیست', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 0, 25, 259, 25909, 'Transfer money বাদ্জা বেজ্যায়ি বাজ্র্জ্য', 'انتقال پول بودجه انکشافی به مرکز ولایات', 'د پیسو انتقال', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 0, 25, 259, 25998, 'Differences in capital expenditures ', 'تفاوت اسعار مصارف سرمایه ', 'د پانګې په لګښتونو کې توپیر ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 0, 25, 259, 25999, 'capital expenditure return ', 'برگشت مصارف سرمایه ', 'د پانګې لګښت بیرته راستنیدل ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 2, 21, NULL, NULL, 'Expenses wages and salaries ۱', 'مصارف مزد ها و معاشات', 'د معاشونو او معاشونو لګښت', 1, 1, '2024-07-03 04:55:31', '2024-07-03 04:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `code_organizations`
--

CREATE TABLE `code_organizations` (
  `id` int(11) NOT NULL,
  `ministry_code` int(11) DEFAULT NULL,
  `sub_org_code` int(11) DEFAULT NULL,
  `unit_code` int(11) DEFAULT NULL,
  `en_desc` text DEFAULT NULL,
  `pa_desc` text DEFAULT NULL,
  `da_desc` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `code_organizations`
--

INSERT INTO `code_organizations` (`id`, `ministry_code`, `sub_org_code`, `unit_code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(1, 128, NULL, NULL, 'Ministry of Higher Education1', 'وزارت تحصیلات عالی', 'د لوړو زده کړو وزارت', 1, 1, '2024-03-05 09:38:49', '2024-07-03 06:22:09'),
(2, 128, 12800, NULL, 'Ministry of Higher Education', 'وزارت تحصیلات عالی', 'د لوړو زده کړو وزارت', 1, 1, '0000-00-00 00:00:00', '2024-07-03 06:22:14'),
(3, 128, 12800, 128000, 'Ministry of Higher Education', 'وزارت تحصیلات عالی', 'د لوړو زده کړو وزارت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 128, 12801, NULL, 'Kabul University', 'پوهنتون کابل', 'کابل پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 128, 12801, 128010, 'Kabul University', 'پوهنتون کابل', 'کابل پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 128, 12802, NULL, 'Polytechnic University', 'پوهنتون پولی تخنیک ', 'پولی تخنیک پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 128, 12802, 128020, 'Polytechnic University', 'پوهنتون پولی تخنیک ', 'پولی تخنیک پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 128, 12803, NULL, 'Kabul Educational University', 'پوهنتون تعلیم و تربیه ', 'د کابل ښوونیز پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 128, 12803, 128030, 'Kabul Educational University', 'پوهنتون تعلیم و تربیه ', 'د کابل ښوونیز پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 128, 12804, NULL, 'Medical Institute', 'پوهنتون طب ', 'طبي انسټیټیوټ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 128, 12804, 128040, 'Medical Institute', 'پوهنتون طب ', 'طبي انسټیټیوټ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 128, 12804, 128041, 'Ali Abad Hospital', 'شفاخانه علی آباد', 'علي اباد روغتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 128, 12804, 128042, 'Maiwand Hospital', 'شفاخانه میوند', 'میوند روغتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 128, 12805, NULL, 'Afghan International University', 'پوهنتون بین المللی', 'افغان نړیوال پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 128, 12805, 128050, 'Afghan International University', 'پوهنتون بین المللی', 'افغان نړیوال پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 128, 12805, 128051, 'Abdullah Ibin Masoud Islamic University', 'جامعه حضرت عبدالله بن مسعود', 'عبدالله ابن مسعود اسلامی پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 128, 12806, NULL, 'Kandahar University', 'پوهنتون قند هار', 'د کندهار پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 128, 12806, 128060, 'Kandahar University', 'پوهنتون قند هار', 'د کندهار پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 128, 12806, 128061, 'National University Of Agriculture and Technology', 'پوهنتون ملی علوم زراعتی وتکنالوژی کندهار', 'د کرنې او ټیکنالوژۍ ملي پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 128, 12806, 128062, 'Ibrahim Nakhi Islamic Kandahar University', 'جامعه ابراهیم نخی ولایت کند هار', 'ابراهیم نخي اسلامي کندهار پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 128, 12807, NULL, 'Ghazni University', 'پوهنتون غزنی ', 'د غزني پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 128, 12807, 128070, 'Ghazni University', 'پوهنتون غزنی ', 'د غزني پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 128, 12807, 128071, 'Ghazni Technical University', 'پوهنتون تخنیکی غزنی', 'د غزني تخنیکي پوهنتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 128, 12808, NULL, 'Ali Abad Hospital', 'شفاحانه علی اباد', 'علي اباد روغتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 128, 12808, 128080, 'Ali Abad Hospital', 'شفاحانه علی اباد', 'علي اباد روغتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 128, 12809, NULL, 'Maiwand Hospital', 'شفاخانه میوند', 'میوند روغتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 128, 12809, 128090, 'Maiwand Hospital', 'شفاخانه میوند', 'میوند روغتون', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 129, NULL, NULL, NULL, NULL, NULL, 1, 1, '2024-08-04 05:33:39', '2024-08-04 05:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `code_programs`
--

CREATE TABLE `code_programs` (
  `id` int(11) NOT NULL,
  `program_code` int(11) DEFAULT NULL,
  `sub_program_code` int(11) DEFAULT NULL,
  `activity_code` int(11) DEFAULT NULL,
  `en_desc` text DEFAULT NULL,
  `pa_desc` text DEFAULT NULL,
  `da_desc` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `code_programs`
--

INSERT INTO `code_programs` (`id`, `program_code`, `sub_program_code`, `activity_code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(1, 281, NULL, NULL, 'Academic Programs', 'برنامه های علمی', 'اکادمیک پروګرامونه', 1, 1, '2024-03-05 09:38:49', '2024-03-05 09:38:49'),
(2, 281, 2811, NULL, 'Enhancing quality of academic affairs of Govt. & Private Institutions', 'بهبود وتقویت کیفیت امورعلمی،موسسات دولتی و خصوصی', 'د حکومت د اکاډمیکو چارو د کیفیت لوړول. او خصوصي بنسټونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 281, 2811, 28110, 'Credit system implementation and expansion.', 'تطبیق و گسترش سیستم کریدیت', 'د کریډیټ سیسټم پلي کول او پراخول.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 281, 2811, 28111, 'Academic curriculum development.', 'انکشاف نصاب تحصیلی', 'د تعلیمي نصاب پراختیا.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 281, 2811, 28112, 'Evaluation and differentiation of higher education institutions.', 'ارزیابی و تفکیک موسسات تحصیلات عالی', 'د لوړو زده کړو موسسو ارزونه او توپیر.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 281, 2811, 28113, 'Enhancing Quality accreditation and credibility.', 'ارتقای تضمین کیفیت و اعتبار دهی', 'د کیفیت اعتبار او اعتبار لوړول.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 281, 2811, 28114, 'Better position of private higher education.', 'بهبود وضعیت تحصیلات عالی خصوصی', 'د خصوصي لوړو زده کړو ښه موقف.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 281, 2811, 28115, 'establishing and expanding relations with national and internationals universities', 'تامین و توسعه روابط با پوهنتون های داخلی و خارجی', 'د ملي او نړیوالو پوهنتونونو سره د اړیکو رامینځته کول او پراخول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 281, 2812, NULL, 'Professional development of Academic and administrative staff', 'انکشاف و توسعه مسلکی اعضاء کادر علمی و کارکنان', 'د اکادمیک او اداري کارمندانو مسلکي وده', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 281, 2812, 28120, 'Establishing and improving professional development centers.', 'ایجاد و تقویت مراکز انکشاف مسلکی', 'د مسلکي پراختیا د مرکزونو جوړول او ښه کول.', 1, 1, '0000-00-00 00:00:00', '2024-07-06 01:19:35'),
(11, 281, 2812, 28121, 'Quality enhancing for Masters and Doctorate Programs.', 'بلند بردن کیفیت برنامه های ماستری و دکتورا', 'د ماسټرۍ او دوکتورا پروګرامونو لپاره د کیفیت لوړول.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 281, 2812, 28122, 'Improving and expansion of research.', 'بهبود و گسترش تحقیق', 'د څیړنې وده او پراختیا.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 282, NULL, NULL, 'Accessibility to higher education and student support program', 'برنامه دسترسی به تحصیلات عالی و حمایت از  محصلان', 'لوړو زده کړو ته لاسرسی او د زده کونکو ملاتړ پروګرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 282, 2821, NULL, 'Self-Sufficiency and securing of Kankor Exam System', 'خودکفائی و مصٌون ساختن سیستم امتحان کانکور', 'د کانکور ازموینې سیسټم په ځان بسیا کول او خوندي کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 282, 2821, 28210, 'improving entry system to higher education institutions.', 'تقویت سیستم شمولیت در موسسات تحصیلات عالی', 'لوړو زده کړو موسسو ته د ننوتلو سیسټم ښه کول.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 282, 2821, 28211, 'Improving Kankor exam procedure.', 'بهبود روند امتحان کانکور', 'د کانکور ازموينې طرزالعمل ښه کول.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 282, 2821, 28212, 'Technical self-sufficiency of Kankor system.', 'خود کفایی تخنیکی سیستم کانکور', 'د کانکور سیستم تخنیکي ځان بسیاینه.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 282, 2821, 28213, 'Expanding the implementation area of Kankor exam.', 'توسعه ساحه تطبیق امتحان کانکور', 'د کانکور ازموینې د تطبیق ساحه پراخه کول.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 282, 2821, 28214, 'Standardize the entry test( Kankor exam)', 'معیاری ساختن امتحان کانکور', 'د کانکور ازموینې معیاري کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 282, 2822, NULL, 'Student services rendering', 'ارائه خدمات محصلان', 'د زده کونکو خدمتونه وړاندې کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 282, 2822, 28220, 'Increasing access to public higher education', 'افزایش دسترسی به تحصیلات عالی دولتی', 'لوړو زده کړو ته د خلکو د لاسرسي زیاتوالی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 282, 2822, 28221, 'Providing psychological health services ', 'ارایه خدمات صحت روانی', 'د رواني روغتیا خدماتو چمتو کول ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 282, 2822, 28222, 'Enhancing student’s services ', 'افزایش خدمات محصلان', 'د زده کونکو خدماتو ته وده ورکول ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 282, 2822, 28223, 'Correction and improvement of evening shift programs', 'اصلاح و بهبود برنامه های شبانه', 'د ماښام د بدلون پروګرامونو سمون او ښه والی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 282, 2822, 28224, 'Increasing number of professional colleges ', 'افرایش تعداد کالج های آموزش مسلکی', 'د مسلکي کالجونو د شمیر زیاتوالی ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 282, 2822, 28225, 'Establishing specialized female universities and colleges', 'ایجاد کالج ها و پوهنتون های اختصاصی اناث', 'د ښځینه متخصصو پوهنتونونو او کالجونو جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 283, NULL, NULL, 'Good Governance Program', 'برنامه حکومتداری خوب', 'د ښې حکومتولۍ پروګرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 283, 2831, NULL, 'Developing of Admin system of higher education', 'اصلاح و انکشاف سیستم اداری نظام تحصیلات عالی', 'د لوړو زده کړو د اداري سیستم پراختیا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 283, 2831, 28310, 'Academic and financial autonomy of Higher education programs', 'استقلالیت اکادیمیک، مالی و اداری برنامه های تحصیلات عالی', 'د لوړو زده کړو د پروګرامونو اکادمیک او مالي خپلواکي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 283, 2831, 28311, 'Protecting Copyright, Writing & Patent right.', ' حراست از حق نشر، تالیف و اختراع', 'د کاپي حق ، لیکلو او پیټینټ حق خوندي کول.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 283, 2831, 28312, 'improving efficiency and transparency in ministry of higher education', ' بهبود موثریت و شفافیت در اداره تحصیلات عالی', 'د لوړو زده کړو په وزارت کې د موثریت او شفافیت لوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 283, 2831, 28313, 'Using information technology for Good governance', ' استفاده از تکنالوجی معلوماتی برای حکومتداری خوب', 'د ښې حکومتوالۍ لپاره د معلوماتي ټکنالوجۍ کارول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 284, NULL, NULL, 'Academic Infrastructures & Facilities Program', 'برنامه زیربنا ها و  تسهیلات آموزشی و عملی', 'د اکادمیک زیربنا او اسانتیاوو پروګرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 284, 2841, NULL, 'Evaluation, Creation and Developing general infrastructures', 'ارزیابی، ایجاد و بهبود عمومی زیربناها', 'د عمومي زیربناوو ارزونه، جوړول او پراختیا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 284, 2841, 28410, 'Improving infrastructures', 'بهبود عمومی زیربنا ها', 'د زیربناوو ښه کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 284, 2841, 28411, 'Developing and expanding information technology infrastructures', 'ایجاد و توسعه زیربناهای تکنالوجی معلوماتی', 'د معلوماتي ټکنالوجۍ د زیربناوو پراختیا او پراختیا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 284, 2841, 28412, 'Developing and improving hostels', 'ایجاد و بهبود لیلیه ها', 'د هاسټلونو وده او وده', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 284, 2841, 28413, 'Higher Eductaion System', 'انکشاف سیستم تحصیلات عالی', 'د لوړو زده کړو سیسټم', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 281, 2811, 32323, 'kjkljkljkl', 'kljlkjlkjlk', 'jkljlkjlk', 1, 0, '2024-07-06 01:06:51', '2024-07-06 01:07:07'),
(40, 281, 2812, 28120, 'Establishing and improving professional development centers', 'ایجاد و تقویت مراکز انکشاف مسلکی', 'د مسلکي پراختیا د مرکزونو جوړول او ښه کول.', 1, 1, '2024-07-06 01:14:20', '2024-07-06 01:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `code_projects`
--

CREATE TABLE `code_projects` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `en_desc` varchar(555) DEFAULT NULL,
  `pa_desc` varchar(255) DEFAULT NULL,
  `da_desc` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `code_projects`
--

INSERT INTO `code_projects` (`id`, `code`, `en_desc`, `pa_desc`, `da_desc`, `user_id`, `is_used`, `created_at`, `updated_at`) VALUES
(1, '000000', 'Project codefr Oprating Budget', 'کود پروزه براي بودجه عادي', 'د پروژې کوډفر عملیاتي بودیجه', 1, 1, '2024-03-05 09:38:49', '2024-07-06 06:42:07'),
(2, '011111', 'Operation and Maintenance (OP Budget)', 'پروژه بودجه عادی حفظ و مراقبت (بودجه دولت)', 'عملیات او ساتنه (OP بودیجه)', 1, 1, '0000-00-00 00:00:00', '2024-10-12 05:38:50'),
(3, '022222', 'Revised O&M-WB', 'پروژه بودجه عادی حفظ و مراقبت (بانک جهانی)', 'اصلاح شوی O&M-WB', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '033333', 'Operating Budget COVID-19', 'پروژه بودجه عادی مختص به کرونا ', 'عملیاتي بودیجه COVID-19', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '021100', 'Civilian employees (permanent)', 'کارمندان ملکی (دائمی )', 'ملکي کارکوونکي (دایمي)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '022500', 'Electricity\n                 ', 'برق', 'بریښنا\n                 ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '022501', 'Water\n                       ', 'آب', 'اوبه\n                       ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '022502', 'Telecommunication\n           ', 'مخابرات ', 'مخابراتو\n           ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '022503', 'Municipal services\n          ', 'خدمات شاروالی', 'د ښاروالۍ خدمتونه\n          ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '022504', 'Postage\n                     ', 'مخارج پستی ', 'پوسته\n                     ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '022509', 'Utilities Advances\n          ', 'تاديات پيشکی عام المنعفه', 'د اسانتیاوو پرمختګونه\n          ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '022510', 'Utilit Bud Rec Prov Transfers ', '#N/A', 'Utilit Bud Rec Prov لیږدونه ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '025998', 'Exchange Fluctuations of Captial Expenditure', 'تفاوت اسعار مصارف سرمایه ', 'د پانګې لګښتونو تبادله', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '130188', 'Program of Darul-Aman Administrative Complex', 'برنامه کمپلکس اداری دارالامان', 'د دارالامان اداري کمپلکس پروګرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '130212', 'Construction and repair of health facilities, clinics and hospitals', 'Constructioاعمار و ترمیمات تاسیسات صحی، کلینیک ها و شفاخانه هاn and repair of health facilities, clinics and hospitals', 'د روغتيايي مرکزونو، کلينيکونو او روغتونونو جوړول او ترميمول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '130215', 'Construction of Qosh Tepah Canal', 'پروژه کانال قوش تپه', 'د قوش تیپې کانال جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '1400006', 'Rehabilitation and Construction of Primary and Appeal courts in Provinces', 'اعمار و ترميم اساسي محاکم  ابتدائيه و مرافعه در ولايات', 'په ولایتونو کې د لومړنیو او استیناف محکمو بیا رغونه او جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '200122', 'Custom Moderanization Phase-II and Consturction of custom premises', 'عصری ساختن گمرکات (بخش دوم) و اعمار تاسیسات گمرکی و احداث ستیشنهای گمرکی داخلی', 'د ګمرکي عصري کولو مرحله-II او د ګمرکي ځایونو جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '200187', 'Expansion improvement and monitoring of planning system and national budget execution (SBPS)', 'انکشاف ، بهبود و مراقبت سیستم پلانگذاری و اجرای بودجه ملی (SBPS)', 'د پلان جوړونې سیسټم او د ملي بودیجې اجرا (SBPS) پراخول او څارنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '200291', ' \nAir Corridor for Balancing Trade of Afghanistan', 'دهلیز هوایی برای توازن تجارت', ' \nد افغانستان د سوداګرۍ د توازن لپاره هوايي دهلېز', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '200237', 'Making budget and aid work (MBAW)', 'بودجه سازی، پلانگذاری و انسجام کمک های خارجی در تمام ادارات دولتی  (MBAW)', 'د بودیجې جوړول او د مرستې کار (MBAW)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '200303', ' \nPrinting Passports and Securities', 'چاپ پاسپورت واوراق بهادار', ' \nد پاسپورټونو او محرماتو چاپ کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '220182', 'Construction of air force wings', 'اعمار مفرزه های هوائی', 'د هوايي ځواک د وزرونو جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '220183', 'Developing infrastructure and system for Finance Department in MoD', 'ایجاد زیربنا و سیستم سازی برای ریاست مالی وزارت دفاع', 'د دفاع وزارت د مالیې ریاست لپاره د زیربنا او سیسټم رامینځته کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '230118', 'Distribution of Passport and National ID card in abroad', 'پروژه تقویت توزیع پاسپورت و تذکره های اتباع افغانستان مقیم خارج', 'په بهر کې د پاسپورټ او ملي تذکرو ویش', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '240023', 'Development Projects Supervision and Engineering Unit', 'واحد انجنیری ونظارت از پروژه های ساختمانی', 'د پرمختیایي پروژو د څارنې او انجینرۍ څانګه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '250157', 'Industrial Parks', 'حمایت از پارکهای صنعتی', 'صنعتي پارکونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '260299', 'Support the computerize passports system and purchasing of equipment', 'تقویت سیستم توزیع پاسپورت های کمپیوتری وخریداری تجهیزات', 'د کمپیوټري پاسپورټ سیسټم او د تجهیزاتو پیرود ملاتړ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '260342', 'creation and improvement of financial systems in MoI', 'ایجاد و تقویت سیستم های مالی در وزارت امور داخله', 'په کورنیو چارو وزارت کې د مالي سیسټمونو رامینځته کول او ښه کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '270332', 'Construction and Equipment for Schools.', 'اعمار و تجهيز مکاتب تعليمات عمومی', 'د ښوونځیو ودانول او تجهیزات.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '280326', 'Salaries Of Professors And Employees Studying Abroad Approved', 'معاشات اساتید وکارمندان مصروف  تحصیل در خارج از کشور', 'د پروفیسورانو او کارمندانو معاشونه چې په بهر کې زده کړې کوي تصویب شوي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '290241', 'For tha activity of tha consortium to select tha applicants according to resolution 305', 'جهت فعالیت کانسرسیوم برای انتخاب مستحقین بر اساس فرمان 305', 'د دې کنسورشیم فعالیت لپاره د 305 پریکړه لیک سره سم د غوښتونکي غوره کولو لپاره', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '320112', 'Project Support Unit', 'واحد حمایوی برنامه ها PSU', 'د پروژې د ملاتړ واحد', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, '320125', 'Technical Study Phipline Gaz TAPI', 'مطالعات تخنیکی پایپ لاین گاز تاپی', 'تخنیکي مطالعه Phipline Gaz TAPI', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, '330001', 'Net Safety Reform', 'ریفورم مصؤنیت اجتماعی', 'د خالص خوندیتوب اصالحات', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, '340118', 'ARCA', 'زیرینا برای تصادیق الکترونیکی ARCA', 'ARCA', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, '340015', 'Technology Development Information Of Afghanistan (E-Governance)', 'توسعه تکنالوژی معلوماتی افغانستان حکومت داری الکترونی', 'د افغانستان د معلوماتي ټکنالوجۍ پراختیا (E-Governance)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, '340103', 'National Internet exchange Of Afghanistan (NIXA)', 'ایجاد مرکز تبادله انترنت', 'د افغانستان د انټرنیټي تبادلې ملي (NIXA)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, '350077', 'Promotion Fundamentals: Basic Ministry of Economy Plan Evaluation Analysis Economic Objectives Development Disclosures Transparency Accountability Institutions Non-governmental', 'تقویت بنیادی وظایف اساسی وزارت اقتصاد(پلان گزاری وارزیابی،تحلیل های اقتصادی ؛اهداف انکشاف پایدار وشفافیت وحسابدهی موسسات غیر دولتی', 'د ترویج اساسات: د اقتصاد وزارت بنسټیز پلان ارزونه تحلیل اقتصادي موخې پراختیا افشا کول د روڼتیا حساب ورکونې ادارې غیر دولتي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, '360289', 'Improve reforms and systems in ministry of information and culture', 'بهبود اصلاحات و سیستم سازی در وزارت اطلاعات وفرهنگ', 'د اطلاعاتو او کلتور په وزارت کې د اصلاحاتو او سیستمونو ښه کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, '360294', 'Improve reforms and systems in ministry of information and culture and RTA', 'مدرن سازی نشرات، تجهیزات و وسایل تخنیکی رادیو تلویزیون', 'د اطلاعاتو او کلتور په وزارت او RTA کې د اصلاحاتو او سیستمونو ښه کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, '370068', 'National Immunization Programme', 'برنامه ملی معافيت کتلوی', 'د واکسین ملي پروګرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, '370442', 'Establishment of &nbsp;Eye Care Mobile &nbsp;Clinics', 'ايجاد کمپ های سيار مراقبت چشم', 'د سترګو پاملرنې ګرځنده کلینیکونو جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, '370546', 'Disables Rehablitation', 'معلولیت و بازتوانائی', 'د بیا رغولو مخه نیسي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, '370646', 'Intensive Care Unit (ICU)', 'بخش مراقبت عاجل   I C U', 'د جدي پاملرنې واحد (ICU)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, '370727', 'Purchasing of Medical Equipments', '‍‍‍پروژه خریداری تجهیزات طبی', 'د طبي تجهیزاتو پیرود', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, '370762', 'Improvement of Health Services Delivery through expansion of the Health system strengthening efforts', 'توسعه اقدامات تقویت سیستم صحی ومداخلات آن دربهبودعرصه خدمات صحی', 'د روغتیایی سیسټم د پیاوړتیا هڅو له لارې د روغتیایی خدماتو وړاندې کولو کې ښه والی', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, '370769', 'Operationalization &nbsp;of IV fluids Factory', 'تجهیز وفعال سازی فابریکه محلولات زرقی', 'د IV مایعاتو فابریکه عملیاتي کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, '370839', 'National program of cancer diagnosis', 'برنامه ملی کنترول سرطان', 'د سرطان د تشخیص ملي پروګرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, '370867', 'Activate of Shaikh Zaeed Hospital', 'تجهیز وفعال سازی شفاخانه ملی فوق تخصصی', 'د شیخ زاید روغتون فعاله شوه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, '370881', 'Strenthening accredition national center of health care', 'تقویت اداره  ملی اعتباردهی مراقبت های صحی', 'د اعتبار ورکولو ملي مرکز د روغتیا پاملرنې پیاوړي کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, '370883', 'Strengthening Council of Nurses and midwifes of Afghanistan', 'تقویت شورای نرس ها وقابله های افغانستان', 'د افغانستان د نرسانو او قابله ګانو د پیاوړتیا شورا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, '370893', 'Health Services Provision &nbsp;to Nomads and Returnee', 'پروژه عرضه خدمات صحی برای کوچیها  و عودت کننده گان', 'د کوچیانو او راستنیدونکو لپاره د روغتیایی خدماتو چمتو کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, '370895', 'Hemodialysis, kidney and urinary system treatment project.', 'پروژه هیمودیالیز، امراض کلیه و سیستم اطراحی (Urinary system)', 'هیموډالیسز، د پښتورګو او ادرار سیسټم د درملنې پروژه.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, '370897', 'Health services delivery to Nomads in south zone', 'عرضه خدمات صحی برای کوچیهای زون جنوب', 'په سویل زون کې کوچیانو ته د روغتیايي خدمتونو وړاندې کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, '390323', 'Livestock Development and Animal health National Program', 'برنامه ملی انکشاف مالداری و صحت حیوانی', 'د څارویو پراختیا او د څارویو روغتیا ملي پروګرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, '390331', 'Construction, Development & Surveillance of Research, Extension & Productions\' farms', 'احیا توسعه ومراقبت فارمهای تحقیقاتی ترویجی وتولیدی', 'د څیړنې، پراختیا او تولید فارمونو جوړول، پراختیا او څارنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, '390357', 'Integrated plant Pest and animal Disease Management', 'مبارزه علیه افات و امراض نباتی', 'د نبات د آفتونو او حیواني ناروغیو مدغم مدیریت', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, '390604', 'Developing of Zafaran and cotton cultivation', 'توسعه کشت پخته و زعفران', 'د زعفران او پنبې کښت ته وده ورکول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, '390778', 'Wheat Transportation &nbsp;Project', 'پروژه انتقال گندم', 'د غنمو ترانسپورت &nbsp;پروژه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, '400004', 'Technical and Vocational Education Training', 'تعليمات ميخانيکی و مسلکی', 'د تخنیکي او مسلکي زده کړو روزنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, '400014', 'Salaries Of Professors And Employees Studying Abroad Approved', 'معاشات اساتید وکارمندان مصروف  تحصیل در خارج از کشور', 'د پروفیسورانو او کارمندانو معاشونه چې په بهر کې زده کړې کوي تصویب شوي', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, '410412', 'Project Implementation Unit (PIU)', 'تنظیم، تطبیق و مراقبت بندهای آبیاری وپروژه های تولید انتقال و توزیع برق', 'د پروژې د تطبیق واحد (PIU)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, '410794', 'Maintinance Of Water And Irrigation Dams in Center And Provinces Of MEW', '', 'د MEW په مرکز او والیتونو کې د اوبو او اوبو لګولو بندونو ساتنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, '420106', 'National Rural Access Program (NRAP) (MoPW)', 'برنامه ملي سرک های روستايی ( وزارت فوايدعامه )', 'د کلیو د لاسرسي ملي پروګرام (NRAP) (MoPW)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, '420569', 'Operation and Maintenance of Salang', 'حفظ و مراقبت سالنگها', 'د سالنګونو عملیات او ساتنه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, '430447', 'Regional Programs (RP)', 'برنامه انسجام ساحوی', 'سیمه ایز پروګرامونه (RP)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, '450189', '?Establishment of 4 transportation terminals in entrance & exit points of the cities', 'احداث 4 ترمینال ترانسپورت (باربریی، مسافر بری) در نقاط دخولی وخروجی شهر ها و تطبیق طرح ترانسپورت عامه', 'د ښارونو د ننوتلو او وتلو په لارو کې د 4 ترانسپورتي ترمینلونو جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, '450221', 'Rehabilitation and Extension Terminal Of Kandahar Airport', 'پروژه باز سازی توسعه ونوسازی ترمینل میدان هوایی کند هار', 'د کندهار د هوايي ډګر د ترمینل بیا رغونه او تمدید', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, '450222', 'Airports Security Operating and Maintenance (Kabul ,Herat, Kandahar and Mazar-e-Sharif)', 'تامین امنیت و حفظ ومراقبت میدان هوایی( کابل ,هرات,کندهار,ومزارشریف', 'د هوایي ډګرونو امنیت عملیات او ساتنه (کابل، هرات، کندهار او مزارشریف)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, '460048', 'Construction of Khusal Khan High School Educational Complex', 'اعمار کمپلیکس تعلیمی لیسه خوشحال خان', 'د خوشال خان عالي لېسې تعلیمي کمپلکس جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, '470041', 'Skills Development Programme.', 'برنامه انکشاف مهارتها', 'د مهارتونو د پراختیا پروګرام.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, '490485', 'Construction of Government and Public Buildings Program', 'برنامه ساختمان های عامه و دولتی', 'د دولتي او عامه ودانیو د جوړولو پروګرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, '500155', 'Law Project', 'پروژه طرح قوانین', 'د قانون پروژه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, '500157', 'National Action Plan on UNSCR 1325 (MoJ)', 'قظعنامه 1325 شورای امنیت ملل متحد(عدلیه)', 'د UNSCR 1325 (MoJ) په اړه د عمل ملي پلان', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, '580050', 'entral laboratory accreditation project', 'اعتباردهی لابراتوار مرکزی', 'د داخلي لابراتوار اعتبار ورکولو پروژه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, '600006', 'Construction of NEPA Centeral Building and Provinces with Surrounding Wall', 'اعمار تعمیر اداری مرکز و ولایات ریاست محیط زیست با احاطه آن', 'د NEPA د مرکزي ودانۍ او د ولایتونو د شاوخوا دیوالونو جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, '610020', 'Tools and writing of encyclopedia', 'و سايل و نوشتن دايره المعارف', 'وسیلې او د پوهنغونډ لیکل', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, '630049', 'Recruitment of Technical and Professional Employees', 'استخدام کارمندان تخنیکی و مسلکی', 'د تخنیکي او مسلکي کارمندانو استخدام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, '660015', 'Purchasing of office equipemetns', 'پروژه تهیه تجهیزات', 'د دفتري تجهیزاتو پیرود', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, '680166', 'Regional offices of &nbsp;DMAC', 'دفاترساحوی انسجام و هماهنگی تطهیر ماین', 'د &nbsp;DMAC سیمه ایز دفترونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, '680167', 'Cleaning Project Of Military Training Areas', 'پروژه پاکسازی ساحات تمرینات نظامی', 'د پوځي روزنې د سیمو د پاکولو پروژه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, '730021', 'Electronic Identities Distribution Project', 'توزیع تذکره الکترونیکی', 'د برېښنايي پېژندپاڼو د وېش پروژه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, '700001', 'Afghanistan medical councel', 'تقویت شورای طبی افغانستان', 'د افغانستان طبي شورا', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, '780001', 'AFDA', 'اداره ملی تنظیم ادویه وغذا افغانستان', 'AFDA', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, '790007', 'Design, lighting and construction of urban roads', 'دیزاین، تنویر وساختمان سرکهای شهری', 'د ښاري سړکونو ډیزاین، رڼا او جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, '820018', 'Remaining projects Of 14 Towns Of Charekar , Qalat , Mehterlam , Ghazni , Gardez , Kanadahar &nbsp;and Jalalabad', 'باقی مانده پروژه های آبرسانی 14 شهرک چاریکار، قلات، مهتر لام، غزنی، گردیز، کندهار  و جلال آباد', 'د څرخي پله، قلات، مهترلام، غزني، ګردیز، کندهار او جلال اباد د ۱۴ ښارګوټو پاتې پروژې', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, '830045', 'Dorunta hydropower plant rehabilitation', 'بازسازی توربین بند برق درونته', 'د دورونتا د اوبو بریښنا فابریکې بیا رغونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, '890001', 'Skill Building and Office Technical Support Program', 'حمایت تخنیکی اداره', 'د مهارتونو لوړولو او د دفتر تخنیکي ملاتړ پروګرام', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, '890002', 'Technical Study and Consultancy Services Railway', 'مطالعات تخنیکی وخدمات مشورتی', 'د تخنیکي مطالعې او مشورتي خدماتو ریل پټلۍ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, '890003', 'Construction of road, purchasing of equipment, and maintenance expenditures of bander e aqena railway station', 'اعمار سرک، تهیه تجهیزات مورد نیاز، بهره برداری و مصارف استیشن خط آهن بندر آقینه', 'د سړک جوړونه، د تجهیزاتو پیرود، او د بندر او اقینه ریل سټیشن د ساتنې لګښتونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, '890006', 'construction of khawaf &nbsp;herat (4th phase)', 'ساختمان خط آهن قطعه چهارم خواف - هرات', 'د هرات د خواف ساختمان (څلورم پړاو)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, '890010', 'Building of railway line From Aqina Andkhoy', 'ساختمان خط آهن آقینه – اندخوی', 'له اقينې اندخوى څخه د اورګاډي پټلۍ جوړول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, '890012', 'Purchase of Equipment and &nbsp;O&M of Railway', 'خریداری تجهیزات و ماشین الات بهره برداری و حفظ مراقبتی خط آهن', 'د تجهیزاتو پیرود او د اورګاډي O&M', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, '890014', 'Railways Operation and Maintenance Services', 'خدمات بهره برداری حفظ و مراقبت حطوط اهن', 'د ریل پټلۍ عملیات او ساتنې خدمتونه', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, '890015', 'Utilization of Mazar to Hiratan Railway Operation and Maintenance', 'بهره برداری و حفظ و مراقبت خط آهن مزار شریف الی حیرتان', 'له مزار څخه د حيرتان د اورګاډي د فعاليت او ساتنې څخه ګټه پورته کول', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, '900001', ' Policy Reserved Fund', '0', ' د پالیسۍ ساتل شوي فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, '900002', ' Disaster Contingency Fund', '0', ' د ناورین د مخنیوي صندوق', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, '900020', 'Contingency fund for financial reimbursements.', '0', 'د مالي تادیاتو لپاره بیړني فنډ.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, '900024', 'Contingency Fund for purchase of Land', '0', 'د ځمکې پیرود لپاره د بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, '900036', 'Contingency Fund for Protection of Strategic Projects', '0', 'د ستراتیژیکو پروژو د ساتنې لپاره بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, '900050', 'Contingency fund for Operations and maintenance', '0', 'د عملیاتو او ساتنې لپاره د بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, '900081', ' \nContingency Fund For Urgent And Unpredicted Expenses', 'وجوه برای مصارف عاجل وپیشبینی شده', ' \nد بیړني او غیر متوقع لګښتونو لپاره د بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, '900082', 'The Budget of Departments that Have Been Removed According to the Decision of the Cabinet', 'بودجه ادارت که نظر به فیصله کابینه خذف گردیده اند', 'د هغو ریاستونو بودیجه چې د کابینې د پرېکړې له مخې لغوه شوې ده', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, '910033', 'Contingency Fund for Foreign Currencies Exchange Balance', '0', 'د بهرنیو اسعارو د تبادلې بیلانس لپاره احتمالي فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, '910049', 'Contingency development fund for provinces', '0', 'د والیتونو لپاره د بیړني پرمختیا فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, '910058', 'Contingency fund for printing\n', '0', 'د چاپ لپاره د بیړني فنډ\n', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, '910066', ' \nContingency Fund For Development (Revenue Project that are included in the Budget Document After the Proposal is Approved By the Ministry Of Finance)', 'وجوه برای برنامه های انکشافی (پروزه های عایداتی که بعد از موافقه وزارت مالیه ومنظوری کمیسیون اقتصاد شمال سند بودجه میگردد)', ' \nد پراختیا لپاره د بیړني فنډ (د عوایدو پروژه چې د مالیې وزارت لخوا د وړاندیز له تصویب وروسته د بودیجې په سند کې شاملیږي)', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, '900001', ' Policy Reserved Fund', '0', ' د پالیسۍ ساتل شوي فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, '900002', ' Disaster Contingency Fund', '0', ' د ناورین د مخنیوي صندوق', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, '900020', 'Contingency fund for financial reimbursements.', '0', 'د مالي تادیاتو لپاره بیړني فنډ.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, '900024', 'Contingency Fund for purchase of Land', '0', 'د ځمکې پیرود لپاره د بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, '900036', 'Contingency Fund for Protection of Strategic Projects', '0', 'د ستراتیژیکو پروژو د ساتنې لپاره بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, '900050', 'Contingency fund for Operations and maintenance', '0', 'د عملیاتو او ساتنې لپاره د بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, '900081', ' \nContingency Fund For Urgent And Unpredicted Expenses', 'وجوه برای مصارف عاجل وپیشبینی شده', ' \nد بیړني او غیر متوقع لګښتونو لپاره د بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, '900082', 'The Budget of Departments that Have Been Removed According to the Decision of the Cabinet', 'بودجه ادارت که نظر به فیصله کابینه خذف گردیده اند', 'د هغو ریاستونو بودیجه چې د کابینې د پرېکړې له مخې لغوه شوې ده', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, '900083', 'Fund For Tithe & Zakat', 'وجوه برای توزیع عشر و زکات', 'د عشر او زکات فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, '090001', ' Policy Reserved Fund', '0', ' د پالیسۍ ساتل شوي فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, '090002', ' Disaster Contingency Fund', '0', ' د ناورین د مخنیوي صندوق', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, '090020', 'Contingency fund for financial reimbursements.', '0', 'د مالي تادیاتو لپاره بیړني فنډ.', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, '090024', 'Contingency Fund for purchase of Land', '0', 'د ځمکې پیرود لپاره د بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, '090036', 'Contingency Fund for Protection of Strategic Projects', '0', 'د ستراتیژیکو پروژو د ساتنې لپاره بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, '090050', 'Contingency fund for Operations and maintenance', '0', 'د عملیاتو او ساتنې لپاره د بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, '090081', ' \nContingency Fund For Urgent And Unpredicted Expenses', 'وجوه برای مصارف عاجل وپیشبینی شده', ' \nد بیړني او غیر متوقع لګښتونو لپاره د بیړني فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, '090082', 'The Budget of Departments that Have Been Removed According to the Decision of the Cabinet', 'بودجه ادارت که نظر به فیصله کابینه خذف گردیده اند', 'د هغو ریاستونو بودیجه چې د کابینې د پرېکړې له مخې لغوه شوې ده', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, '090083', 'Fund For Tithe & Zakat', 'وجوه برای توزیع عشر و زکات', 'د عشر او زکات فنډ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `measurements`
--

CREATE TABLE `measurements` (
  `id` int(11) NOT NULL,
  `en_desc` varchar(55) DEFAULT NULL,
  `pa_desc` varchar(55) DEFAULT NULL,
  `da_desc` varchar(55) DEFAULT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `measurements`
--

INSERT INTO `measurements` (`id`, `en_desc`, `pa_desc`, `da_desc`, `is_used`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Unit', 'دانه', 'دانه', 1, 1, '2024-07-07 09:17:21', '2024-07-08 23:40:06'),
(2, 'package 10', '۱۰ کڅوړه', 'بسته ۱۰', 1, 1, '2024-07-08 23:27:14', '2024-07-08 23:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `strategic_objectives` text DEFAULT NULL,
  `strategic_outcomes` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `program_subs`
--

CREATE TABLE `program_subs` (
  `id` int(11) NOT NULL,
  `budget_type_id` int(11) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `program_code` int(11) DEFAULT NULL,
  `program_name` varchar(555) DEFAULT NULL,
  `program_manager` varchar(255) DEFAULT NULL,
  `strategic_outcomes` text DEFAULT NULL,
  `strategic_objectives` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `budget_approveds`
--
ALTER TABLE `budget_approveds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_approved_b10_transfers`
--
ALTER TABLE `budget_approved_b10_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_approved_b20_transfers2`
--
ALTER TABLE `budget_approved_b20_transfers2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_approved_distributions`
--
ALTER TABLE `budget_approved_distributions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_approved_distributions_b10`
--
ALTER TABLE `budget_approved_distributions_b10`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_dev_approveds`
--
ALTER TABLE `budget_dev_approveds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_dev_b3`
--
ALTER TABLE `budget_dev_b3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_dev_b3_transfers`
--
ALTER TABLE `budget_dev_b3_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_dev_b20`
--
ALTER TABLE `budget_dev_b20`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_dev_cfs`
--
ALTER TABLE `budget_dev_cfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_dev_cf_lists`
--
ALTER TABLE `budget_dev_cf_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_dev_promises`
--
ALTER TABLE `budget_dev_promises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_dev_transfers_b20`
--
ALTER TABLE `budget_dev_transfers_b20`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_plans`
--
ALTER TABLE `budget_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_plan_activities`
--
ALTER TABLE `budget_plan_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_plan_activities_comments`
--
ALTER TABLE `budget_plan_activities_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_plan_promises`
--
ALTER TABLE `budget_plan_promises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_sub_plan`
--
ALTER TABLE `budget_sub_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_categories`
--
ALTER TABLE `code_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_donors`
--
ALTER TABLE `code_donors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_funds`
--
ALTER TABLE `code_funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_locations`
--
ALTER TABLE `code_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_objects`
--
ALTER TABLE `code_objects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_organizations`
--
ALTER TABLE `code_organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_programs`
--
ALTER TABLE `code_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_projects`
--
ALTER TABLE `code_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `measurements`
--
ALTER TABLE `measurements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_subs`
--
ALTER TABLE `program_subs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `budget_approveds`
--
ALTER TABLE `budget_approveds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `budget_approved_b10_transfers`
--
ALTER TABLE `budget_approved_b10_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `budget_approved_b20_transfers2`
--
ALTER TABLE `budget_approved_b20_transfers2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `budget_approved_distributions`
--
ALTER TABLE `budget_approved_distributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `budget_approved_distributions_b10`
--
ALTER TABLE `budget_approved_distributions_b10`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `budget_dev_approveds`
--
ALTER TABLE `budget_dev_approveds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `budget_dev_b3`
--
ALTER TABLE `budget_dev_b3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `budget_dev_b3_transfers`
--
ALTER TABLE `budget_dev_b3_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `budget_dev_b20`
--
ALTER TABLE `budget_dev_b20`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `budget_dev_cfs`
--
ALTER TABLE `budget_dev_cfs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `budget_dev_cf_lists`
--
ALTER TABLE `budget_dev_cf_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `budget_dev_promises`
--
ALTER TABLE `budget_dev_promises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `budget_dev_transfers_b20`
--
ALTER TABLE `budget_dev_transfers_b20`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `budget_plans`
--
ALTER TABLE `budget_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `budget_plan_activities`
--
ALTER TABLE `budget_plan_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budget_plan_activities_comments`
--
ALTER TABLE `budget_plan_activities_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budget_plan_promises`
--
ALTER TABLE `budget_plan_promises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `budget_sub_plan`
--
ALTER TABLE `budget_sub_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `code_categories`
--
ALTER TABLE `code_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `code_donors`
--
ALTER TABLE `code_donors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `code_funds`
--
ALTER TABLE `code_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1288;

--
-- AUTO_INCREMENT for table `code_locations`
--
ALTER TABLE `code_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- AUTO_INCREMENT for table `code_objects`
--
ALTER TABLE `code_objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `code_organizations`
--
ALTER TABLE `code_organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `code_programs`
--
ALTER TABLE `code_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `code_projects`
--
ALTER TABLE `code_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_subs`
--
ALTER TABLE `program_subs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
