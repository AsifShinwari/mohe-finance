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
-- Database: `mohe_auth_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `departements`
--

CREATE TABLE `departements` (
  `id` int(11) NOT NULL,
  `parent_department_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pa_name` varchar(255) DEFAULT NULL,
  `da_name` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departements`
--

INSERT INTO `departements` (`id`, `parent_department_id`, `name`, `pa_name`, `da_name`, `level`, `created_at`, `updated_at`) VALUES
(1, 0, 'Ministry of Higher Education', 'د لوړو زده کړو وزارت مقام', 'مقام وزارت تحصیلات عالی', 1, '2024-02-07 05:23:56', '2024-05-30 01:59:42'),
(2, 1, 'Deputy ministry of Financ & Administration', 'مالي او اداري معینیت', 'معینیت مالی و اداری', 2, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(3, 1, 'Deputy Ministry of Student Affairs', 'محصلانو چارو معینیت', 'معینیت امور محصلان', 2, '2024-02-07 05:23:56', '2024-05-30 02:01:43'),
(4, 1, 'Deputy Ministry of Academic', 'علمي معینیت', 'معینیت علمی', 2, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(5, 2, 'Directorate of Human Resources', 'بشري سرچینو ریاست', 'ریاست منابع بشری', 3, '2024-02-07 05:23:56', '2024-05-30 00:43:15'),
(6, 2, 'Directorate of Finance & Accounting', 'مالي او حسابي ریاست', 'ریاست مالی و حسابی', 3, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(7, 2, 'Directorate of Procurement', 'تدارکاتو ریاست', 'ریاست تدارکات', 3, '2024-02-07 05:23:56', '2024-05-30 00:43:36'),
(8, 2, 'Directorate of Administrative and infrastructure', 'اداري او زیربنا ریاست', 'ریاست اداری و زیربنا', 3, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(9, 2, 'Directorate of IT', 'معلوماتي ټکنالوژۍ ریاست', 'ریاست تکنالوژی معلوماتی', 3, '2024-02-07 05:23:56', '2024-05-30 00:44:01'),
(10, 2, 'Directorate of publications and relations', 'نشراتو او روابطو ریاست', 'ریاست نشرات و روابط', 3, '2024-02-07 05:23:56', '2024-05-30 00:44:20'),
(11, 3, 'Directorate of Government Student Affairs', 'دولتي محصیلینو چارو ریاست', 'ریاست امور محصلان دولتی', 3, '2024-02-07 05:23:56', '2024-05-30 01:56:01'),
(12, 3, 'Directorate of Private Student Affairs', 'د خصوصي محصیلینو چارو ریاست', 'ریاست امور محصلان خصوصی', 3, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(13, 3, 'Directorate of Evaluation and Equivalence of Academic Documents Abroad', 'خارج مرز محصیلینو د اسنادو ارزیابی ریاست', 'ریاست ارزیابی و معادله اسناد تحصیلی بیرون مرزی', 3, '2024-02-07 05:23:56', '2024-05-30 01:56:06'),
(14, 3, 'Directorate of Student Services Integration', 'زده کوونکو د خدمتونو د انسجام ریاست', 'ریاست انسجام خدمات محصلان ', 3, '2024-02-07 05:23:56', '2024-05-30 01:56:17'),
(15, 4, 'Directorate of Plan And Policy', 'پلان او پالیسی ریاست', 'ریاست پلان و پالیسی', 3, '2024-02-07 05:23:56', '2024-05-30 01:54:43'),
(16, 4, 'Directorate of Development of Academic Programs', 'علمي پروګرامونو د پراختیا ریاست', 'ریاست انکشاف برنامه های علمی', 3, '2024-02-07 05:23:56', '2024-05-30 01:54:47'),
(17, 4, 'Directorate of Quality Assurance and Accreditation', 'کیفیت د تضمین او اعتبار ورکولو څانګه', 'ریاست تضمین کیفیت واعتباردهی', 3, '2024-02-07 05:23:56', '2024-05-30 01:54:52'),
(18, 4, 'Directorate of appointment and academic promotions of professors', 'ریاست تقرر او ترفیعات علمی استادان', 'ریاست تقرر و ترفیعات علمی استادان ', 3, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(19, 4, 'Directorate of Research, Compilation and Translation', 'څېړنې، تالیف او ژباړې ریاست', 'ریاست تحقیق، تالیف و ترجمه', 3, '2024-02-07 05:23:56', '2024-05-30 01:55:02'),
(20, 4, 'Directorate of Academic curriculum', 'تعلیمي نصاب ریاست', 'ریاست نصاب تحصیلی', 3, '2024-02-07 05:23:56', '2024-05-30 01:55:07'),
(21, 1, 'Directorate Office', 'دفتر ریاست', 'ریاست دفتر', 2, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(22, 1, 'Directorate of Internal Audit', 'داخلي پلټنې ریاست', 'ریاست تفتیش داخلی', 2, '2024-02-07 05:23:56', '2024-05-30 01:49:10'),
(25, 1, 'Directorate of Da\'wat Irshad', 'دعوت ارشاد ریاست', 'ریاست دعوت ارشاد', 2, '2024-02-07 05:23:56', '2024-05-30 01:53:21'),
(26, 1, 'General Directorate of Jamias and Religious Specialties', 'دیني جامعاتو او تخصصاتو لوی ریاست', 'ریاست عمومی جامعات دیني و تخصصات', 2, '2024-02-07 05:23:56', '2024-05-30 01:53:50'),
(27, 26, 'Directorate of Evaluation and Equivalence of Documents of Universities and Religious Specialties', 'د دینی جامعاتو او تخصصاتو اسنادو ارزیابی ریاست', 'ریاست ارزیابی و معادلت اسناد جامعات و تخصصات دینی', 3, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(28, 26, 'Directorate of registration and establishment of valid religious societies', 'د معتبرو دیني ټولنو د ثبت او تاسیس ریاست', 'ریاست ثبت و ایجاد جامعات دینی معتبر', 3, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(29, 26, 'Department of document distribution and record setting', 'د اسنادو د ویش او ثبتولو ریاست', 'ریاست توزیع اسناد و تنظیم سوابق', 3, '2024-02-07 05:23:56', '2024-02-07 05:23:56'),
(30, 9, 'Technical Management', 'تخنیکي امریت', 'امریت تخنیکی', 4, '2024-02-10 08:03:38', '2024-02-10 08:03:38'),
(31, 9, 'IT Software Management', 'د معلوماتي سیستمونو امریت', 'امریت سیستم های معلوماتی', 4, '2024-02-10 08:03:38', '2024-02-10 08:03:38'),
(32, 9, 'Afghanistan Research and Education Network (AfgREN)', 'د افغانستان د څیړنې او ښوونې شبکه (افګرین)', 'شبکه تحقیق و آموزش افغانستان (افګرین)', 4, '2024-02-10 08:11:55', '2024-02-10 08:11:55'),
(33, 21, 'Qalam Makhsos', 'قلم مخصوص', 'قلم مخصوص', 0, '2024-04-17 00:35:03', '2024-04-17 00:35:03'),
(34, 21, 'Tahriraat', 'تحریرات', 'تحریرات', 0, '2024-04-17 00:36:28', '2024-04-17 00:36:28'),
(35, 21, 'Asnad Irtibat', 'اسناد ارتباط', 'اسناد ارتباط', 0, '2024-04-17 00:38:14', '2024-04-17 00:38:14'),
(37, 21, 'Approvals', 'مصوبات', 'مصوبات', 0, '2024-04-20 03:12:48', '2024-04-20 03:12:48'),
(38, 7, 'procurement Office', 'تدارکاتو شعبه', 'شعبه تدارکات', 0, '2024-04-21 00:10:45', '2024-04-21 00:10:45'),
(39, 6, 'Finance Office', 'مالي او حسابي آمریت', 'آمریت مالی و حسابی', 0, '2024-04-21 00:12:54', '2024-04-21 00:12:54'),
(40, 7, 'Plan Office', 'د پلان ګزاري آمریت', 'آمریت پلان ګزاري', 0, '2024-04-30 04:48:54', '2024-04-30 04:48:54'),
(41, 19, 'tarjama office', 'د ترجمې آمریت', 'آمریت ترجمه', 0, '2024-04-30 05:00:20', '2024-04-30 05:00:20'),
(43, 19, 'Head of Compilation', 'د تألیف آمریت', 'آمریت تألیف', 0, '2024-04-30 05:10:16', '2024-04-30 05:10:16'),
(44, 19, ' Head of Scientific journals', 'د علمی انسجام مجله آمریت', 'آمریت انسجام مجله علمی', 0, '2024-04-30 05:12:52', '2024-04-30 05:12:52'),
(45, 19, 'Head of Research', 'د څیړنې آمریت', 'آمریت تحقیق', 0, '2024-04-30 05:14:19', '2024-04-30 05:14:19'),
(46, 19, 'General manager of  digital library', 'د الکترونیکي کتابتون عمومي مدیریت', 'مدیریت عمومی کتابخانه الکترونیکی', 0, '2024-04-30 05:17:53', '2024-04-30 05:17:53'),
(49, 41, 'Natural science translation expert', 'د طبیعي علومو ژباړې کارپوه', 'کارشناس ترجمه علوم طبیعی', 0, '2024-04-30 05:24:36', '2024-04-30 05:26:41'),
(50, 41, 'Social science translation expert', 'د ټولنیزو علومو د ژباړې کارپوه', 'کارشناس ترجمه علوم اجتماعی', 0, '2024-04-30 05:29:41', '2024-04-30 05:29:41'),
(51, 43, 'Social science Compilation expert', 'د ټولنیزو علومو تألیف کارپوه', 'کارشناس تألیف علوم اجتماعی', 0, '2024-04-30 05:32:35', '2024-04-30 05:32:35'),
(52, 43, 'Natural science Compilation expert', 'د طبیعي علومو تالیف کارپوه', 'کارشناس تالیف علوم طبیعی', 0, '2024-04-30 05:33:55', '2024-04-30 05:33:55'),
(53, 44, 'Expert of national journals', 'د ملي ژورنالونو کارپوه', 'کارشناس ژورنال های ملی', 0, '2024-04-30 05:35:06', '2024-04-30 05:35:06'),
(54, 44, 'Expert of international journals', 'د نړیوالو ژورنالونو کارپوه', 'کارشناس ژورنال های بین المللی', 0, '2024-04-30 05:35:40', '2024-04-30 05:35:40'),
(55, 45, 'Natural science research expert', 'د طبیعي علومو د څیړنې کارپوه', 'کارشناس تحقیق علوم طبیعی', 0, '2024-04-30 05:36:47', '2024-04-30 05:36:47'),
(56, 45, 'Social science research expert', 'د ټولنیزو علومو د څیړنې کارپوه', 'کارشناس تحقیق علوم اجتماعی', 0, '2024-04-30 05:38:13', '2024-04-30 05:38:13'),
(57, 45, 'General manager of research', 'د څیړنې عمومي مدیریت', 'مدیریت عمومی تحقیق', 0, '2024-04-30 05:39:59', '2024-04-30 05:39:59'),
(58, 45, 'Creativity and innovation expert', 'د خلاقیت او نوښت کارپوه', 'کارشناس خلاقیت و نوآوری', 0, '2024-04-30 05:40:52', '2024-04-30 05:40:52'),
(60, 1, 'Directorate of Supervision and Evaluation of Academic Affairs', 'اکاډمیکو چارو د څارنې او ارزونې ریاست', 'ریاست نظارت و ارزیابی از امور اکادمیک ', 0, '2024-05-04 00:14:13', '2024-05-30 01:53:45'),
(62, 12, 'Database Office of Private Students', 'د خصوصي محصلانو ډیټابیس آمریت', 'آمریت ډیټابیس محصلان خصوصی', 0, '2024-05-08 06:06:38', '2024-05-08 06:10:32'),
(63, 1, 'Directorate of Foreign Relations and Management of Scholarships ', 'خارجه اړیکو او بورسیو تنظیم ریاست', 'ریاست ارتباط خارجه و تنظیم بورس ها', 0, '2024-05-13 23:59:21', '2024-05-30 01:53:55'),
(64, 14, 'Coordination and Intersectoral Relations Office ', 'د سکتورو ترمنځ اړیکو او همغږیږي آمریت', 'آمریت هماهنگی  و روابط بین سکتور ', 0, '2024-05-14 00:12:47', '2024-05-14 00:12:47'),
(65, 14, 'Cultural, Social and Sport Services Office', 'د فرهنګ، ټولنیز او ورزشو خدماتو آمریت', 'آمریت خدمات  فرهنگی و اجتماعی و ورزشی', 0, '2024-05-14 00:14:52', '2024-05-14 00:14:52'),
(66, 64, 'General Management of Media Center ', 'د رسنیو عمومي مدیریت', 'مدیریت عمومی  مرکز رسانه ها (میدیا سنتر) ', 0, '2024-05-14 00:17:06', '2024-05-14 00:17:06'),
(67, 64, 'General Management of Practical Work  ', 'د عملي کارو عمومي مدیریت', 'مدیریت عمومی تنظيم و کار عملی و ستاژ ', 0, '2024-05-14 00:19:28', '2024-05-14 00:19:28'),
(68, 64, 'General Management of Legal Training Clinic ', 'د حقوقی زده کړو کلینیک عمومي مدیریت', 'مدیریت عمومی کلینیک آموزش حقوقی ', 0, '2024-05-14 00:20:36', '2024-05-14 00:20:36'),
(69, 65, 'General Management of Career Advice ', 'د مسلکي مشورو عمومي مدیریت', 'مدیریت عمومی مشوره دهی شغلی ', 0, '2024-05-14 00:24:03', '2024-05-14 00:24:03'),
(70, 65, 'General Management of Sports ', 'د ورزش عمومي مدیریت', 'مدیریت عمومی ورزشی ', 0, '2024-05-14 00:24:59', '2024-05-14 00:24:59'),
(71, 65, 'General Managemenoft  Psychological Counseling Clinic ', ' د روانی مشورې ورکولو کلینیک عمومي مدیریت', 'مدیریت عمومی کلینیک مشاوره روانشناسی ', 0, '2024-05-14 00:26:13', '2024-05-14 00:26:13'),
(73, 16, 'Department of postgraduate programs', 'د فوق لیسانس برنامو آمریت', 'آمریت برنامه های فوق لیسانس', 0, '2024-05-21 01:02:29', '2024-05-21 01:02:29'),
(74, 73, 'General Management of governmental postgraduate programs', 'دولتي فوق لیسانس برنامو عمومي مدیر', 'مدیریت عمومی برنامه های فوق لیسانس دولتی', 0, '2024-05-21 01:03:14', '2024-05-21 01:03:14'),
(75, 73, 'General Management of private postgraduate programs', 'خصوصي  فوق لیسانس برنامو عمومي مدیر', 'مدیریت عمومی برنامه های فوق لیسانس خصوصی', 0, '2024-05-21 01:03:32', '2024-05-21 01:03:32'),
(76, 16, 'Department of governmental undergraduate programs', 'د دولتي لیسانس برنامو آمریت', 'آمریت برنامه های لیسانس دولتی', 0, '2024-05-21 01:04:08', '2024-05-21 01:04:08'),
(77, 76, 'General management of provincial governmental undergraduate programs', 'د دولتي لیسانس ولایتي برنامو عمومي مدیریت', 'مدیریت عمومی برنامه های لیسانس دولتی ولایات', 0, '2024-05-21 01:04:47', '2024-05-21 01:04:47'),
(78, 76, 'General management of central governmental undergraduate programs', 'د دولتي لیسانس مرکزي برنامو عمومي مدیریت', 'مدیریت عمومی برنامه های لیسانس دولتی مرکز', 0, '2024-05-21 01:05:00', '2024-05-21 01:05:00'),
(79, 76, 'General management of evening governmental undergraduate programs', 'د دولتي لیسانس شپنیو برنامو عمومي مدیریت', 'مدیریت عمومی برنامه های لیسانس دولتی شبانه', 0, '2024-05-21 01:05:18', '2024-05-21 01:05:18'),
(80, 16, 'Electronic learning Department', 'د برښنايي زده کړو آمریت', 'آمریت آموزش الکترونیکی', 0, '2024-05-21 01:05:57', '2024-05-21 01:05:57'),
(81, 80, 'General management of electronic learning  courses', 'دبرښنایي روزنیزو کورسونو عمومي مدیر', 'مدیریت عمومی کورس های آموزشی الکترونیکی', 0, '2024-05-21 01:06:42', '2024-05-21 01:06:42'),
(82, 16, 'Department of the integration of teaching hospitals', 'د کادري روغتونونو چارو د انسجام آمریت', 'آمریت انسجام امور شفاخانه های کادری', 0, '2024-05-21 01:07:03', '2024-05-21 01:07:03'),
(83, 82, 'General management of the integration of governmental teaching hospitals', 'د دولتي کادري روغتونونو چارو د انسجام عمومي مدیر', 'مدیریت عمومی انسجام امور شفاخانه های کادری دولتی', 0, '2024-05-21 01:07:43', '2024-05-21 01:07:43'),
(84, 82, 'General management of the integration of private teaching hospitals', 'د خصوصي کادري روغتونونو چارو د انسجام عمومي مدیر', 'مدیریت عمومی انسجام امور شفاخانه های کادری خصوصی', 0, '2024-05-21 01:07:58', '2024-05-21 01:07:58'),
(85, 16, 'Private Undergraduate Programs Department', 'خصوصي لیسانس برنامو آمریت', 'آمریت برنامه های لیسانس خصوصی', 0, '2024-05-21 01:08:33', '2024-05-21 01:08:33'),
(86, 85, 'General Management of Central Private Undergraduate Programs', 'د مرکز خصوصي لیسانس برنامو عمومي مدیر', 'مدیریت عمومی برنامه های لیسانس خصوصی مرکز', 0, '2024-05-21 01:09:06', '2024-05-21 01:09:06'),
(87, 85, 'General Management of Provincial Private Undergraduate Programs', 'د ولایتي خصوصي لیسانس برنامو عمومي مدیر', 'مدیریت عمومی برنامه های لیسانس خصوصی ولایات', 0, '2024-05-21 01:09:23', '2024-05-21 01:09:23'),
(88, 16, 'Executive general management', 'د اجرائیه عمومي مدیریت', 'مدیریت عمومی اجراییه', 0, '2024-05-21 01:10:27', '2024-05-21 01:10:27'),
(89, 16, 'Database general management', 'د ډیټابیس عمومي مدیریت', 'مدیر یت عمومی دیتابیس', 0, '2024-05-21 01:11:00', '2024-05-21 01:11:00'),
(90, 31, 'General Managment of Database', 'د ډیټابیس عمومي مدیریت', 'مدیریت عمومي ډیټابیس', 0, '2024-05-28 05:42:12', '2024-05-28 05:55:28'),
(91, 31, 'General Management of Website', 'د ویبسایټ عمومي مدیریت', 'مدیر عمومی ویبسایت', 0, '2024-05-28 05:42:58', '2024-05-28 05:42:58'),
(92, 30, 'General Managment of Hardware and Software', 'د نرم افزار او سخت افزار عمومي مدیریت ', 'مدیر عمومی نرم افزار و سخت افزار', 0, '2024-05-28 05:45:28', '2024-05-28 05:45:28'),
(93, 30, 'General Management of Network', 'د شبکو عمومي مدیریت', 'مدیریت عمومی شبکه', 0, '2024-05-28 05:46:25', '2024-05-28 05:46:25'),
(95, 30, 'General Managment of Projects', 'د پروژو عمومي مدیریت', 'مدیریت عمومي پروژه ها', 0, '2024-05-28 05:49:46', '2024-05-28 05:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `departement_id` bigint(20) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `en_name` varchar(255) DEFAULT NULL,
  `pa_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `departement_id`, `email`, `en_name`, `pa_name`, `created_at`, `updated_at`) VALUES
(1, 6, 'admin@mohe.com', 'Admin', 'اډمن', '2024-03-05 09:41:58', '2024-07-02 20:38:23'),
(2, 9, 'director@mohe.com', 'Director', 'دمعلوماتي تکنالوژی رئیس', '2024-03-05 06:18:57', '2024-03-05 06:18:57'),
(3, 7, 'procurement@mohe.com', 'Procurement', 'تدارکات', '2024-03-21 01:58:44', '2024-04-17 00:09:19'),
(4, 21, 'main@mohe.com', 'Main Office', 'ریاست دفتر', '2024-04-17 00:29:03', '2024-04-17 00:29:03'),
(5, 35, 'doc@mohe.com', 'Asnad Irtibat', 'اسناد ارتباط', '2024-04-17 00:49:07', '2024-04-17 06:37:36'),
(6, 21, 'ex_main@mohe.com', 'Ex_Officer Main Office', 'ریاست دفتر اجرائیه', '2024-04-17 00:54:49', '2024-06-01 00:35:40'),
(7, 34, 'write@mohe.com', 'Tahriraat', 'تحریرات', '2024-04-17 06:39:31', '2024-04-17 06:39:31'),
(8, 21, 'ex_Daftar@mohe.com', 'Ex_Officer Main Office', 'ریاست دفتر اجرائیه', '2024-04-20 02:52:39', '2024-04-21 00:06:47'),
(9, 9, 'Ex_Manager_IT@mohe.com', 'Ex_Manager_IT', 'معلوماتي ټکنالوژۍ اجرائیه', '2024-04-20 03:01:06', '2024-04-20 03:02:54'),
(10, 35, 'asnad@mohe.com', 'Asnad Irtibat', 'اسناد ارتباط', '2024-04-20 23:42:12', '2024-04-20 23:42:12'),
(11, 9, 'ex_it@mohe.com', 'Ex_Manager', 'د اجرائیه عمومي مدیر', '2024-04-20 23:52:52', '2024-05-27 01:07:24'),
(12, 34, 'publications@mohe.com', 'Publications', 'تحریرات', '2024-04-21 00:07:00', '2024-04-24 00:41:50'),
(13, 33, 'qalam@mohe.com', 'Qalam Makhsos', 'قلم مخصوص', '2024-04-21 00:07:26', '2024-04-21 23:53:57'),
(14, 7, 'ex_procurement@mohe.com', 'Procurement', 'تدارکات', '2024-04-21 00:07:41', '2024-04-21 00:07:41'),
(15, 6, 'ex_finance@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-04-21 00:08:21', '2024-05-29 06:07:05'),
(16, 39, 'fin_office@mohe.com', 'Finance Office', 'مالي او حسابي آمریت', '2024-04-21 00:14:53', '2024-04-21 00:14:53'),
(17, 38, 'pro_office@mohe.com', 'procurement Office', 'تدارکاتو شعبه', '2024-04-21 00:16:33', '2024-04-24 00:42:06'),
(18, 37, 'Approvals@mohe.com', 'Approvals', 'مصوبات', '2024-04-29 05:54:03', '2024-04-29 05:54:03'),
(19, 19, 'rct@mohe.com', 'RCT', 'څیړنې، تالیف او ژباړې ریاست', '2024-04-30 02:20:22', '2024-04-30 02:20:22'),
(20, 20, 'nisaab@mohe.com', 'nisaab', 'نصاب', '2024-04-30 02:24:43', '2024-04-30 02:24:43'),
(21, 41, 'trans@mohe.com', 'translation office', 'د ژباړی آمریت', '2024-05-01 23:55:16', '2024-05-01 23:55:16'),
(22, 62, 'private_db@mohe.com', 'Private Database Office ', 'خصوصي محصلانو ډیټابیس آمریت', '2024-05-08 06:08:41', '2024-05-08 06:08:41'),
(23, 14, 'std_serve@mohe.com', 'Students Service EX Manager', 'مدیر اجرائیه ریاست انسجام', '2024-05-13 00:44:08', '2024-05-13 00:44:08'),
(24, 16, 'dapd_db@mohe.com', 'DB_Manager Database', 'د ډیټابیس عمومي مدیر', '2024-05-20 01:06:05', '2024-05-20 01:06:05'),
(25, 16, 'ex_dapd@mohe.com', 'Ex_manager', 'اجرائیه عمومي مدیر', '2024-05-20 01:10:40', '2024-05-20 01:10:40'),
(26, 7, 'ex_proc@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-20 01:12:35', '2024-06-01 03:29:20'),
(27, 21, 'dir_main@mohe.com', 'Director', 'رئیس', '2024-05-27 00:53:35', '2024-05-27 00:53:35'),
(28, 9, 'dir_it@mohe.com', 'Director', 'رئیس', '2024-05-27 01:05:29', '2024-05-27 01:05:29'),
(29, 11, 'dir_gov@mohe.com', 'Director', 'رئیس', '2024-05-27 01:15:57', '2024-05-27 01:15:57'),
(30, 11, 'ex_gov@mohe.com', 'Executive Manager', 'اجرائیه مدیر', '2024-05-27 01:19:00', '2024-05-27 01:19:00'),
(31, 13, 'dir_attest@mohe.com', 'Director', 'رئیس', '2024-05-28 00:01:04', '2024-05-28 00:01:04'),
(32, 13, 'ex_attest@mohe.com', 'Executive Manager', 'اجرائیه مدیر', '2024-05-28 00:32:58', '2024-05-28 00:32:58'),
(33, 22, 'dir_invest@mohe.com', 'Director', 'رئیس', '2024-05-28 00:42:26', '2024-05-28 00:42:26'),
(34, 22, 'ex_invest@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-28 00:50:33', '2024-05-28 00:50:33'),
(35, 63, 'dir_scholar@mohe.com', 'Director', 'رئیس', '2024-05-28 01:03:34', '2024-05-28 01:03:34'),
(36, 63, 'ex_scholar@mohe.com', 'Executive Manager ', 'مدیر اجرائیه', '2024-05-28 01:15:55', '2024-05-28 01:15:55'),
(37, 10, 'dir_media@mohe.com', 'Director', 'رئیس', '2024-05-28 01:26:22', '2024-05-28 01:26:22'),
(38, 10, 'ex_media@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-28 01:29:12', '2024-05-28 01:29:12'),
(39, 15, 'dir_plan@mohe.com', 'Director', 'رئیس', '2024-05-28 01:42:09', '2024-05-28 01:42:09'),
(40, 15, 'ex_plan@mohe.com', 'Executive Manager', 'مدیر اجرائیه ', '2024-05-28 01:43:15', '2024-05-28 01:43:15'),
(41, 16, 'dir_dapt@mohe.com', 'Director', 'رئیس', '2024-05-28 02:40:31', '2024-05-28 02:40:31'),
(42, 18, 'dir_recrut@mohe.com', 'Director', 'رئیس', '2024-05-28 04:41:18', '2024-05-28 04:41:18'),
(43, 18, 'ex_prap@mohe.com', 'Ex_Manager', 'مدیر اجرائیه', '2024-05-28 04:42:43', '2024-05-28 04:42:43'),
(44, 18, 'dir_prap@mohe.com', 'Director', 'رئیس', '2024-05-28 04:46:34', '2024-05-28 04:46:34'),
(45, 17, 'dir_qaad@mohe.com', 'Director', 'رئیس', '2024-05-28 04:48:59', '2024-05-28 04:48:59'),
(46, 17, 'ex_qaad@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-28 04:49:44', '2024-05-28 04:49:44'),
(47, 25, 'dir_islamic@mohe.com', 'Directror', 'رئیس', '2024-05-28 04:55:30', '2024-05-28 04:55:30'),
(48, 25, 'ex_islamic@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-28 04:56:46', '2024-05-28 05:51:03'),
(49, 90, 'db_it@mohe.com', 'ٍEngineer Shahid Rahman', 'انجینر شاهد رحمان ', '2024-05-28 05:55:04', '2024-05-28 05:55:04'),
(50, 2, 'sec_fin_depmin@mohe.com', 'Secretory ', 'سکرتر', '2024-05-28 06:28:47', '2024-05-28 06:28:47'),
(51, 31, 'mis_it@mohe.com', 'MIS Officer', 'د معلوماتي سیسټمونو آمر', '2024-05-28 07:18:09', '2024-05-28 07:18:09'),
(52, 60, 'dir_evo@mohe.com', 'Director', 'رئیس', '2024-05-28 23:52:57', '2024-05-28 23:52:57'),
(53, 60, 'ex_evo@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-28 23:54:06', '2024-05-28 23:54:06'),
(54, 7, 'dir_proc@mohe.com', 'Director', 'رئیس', '2024-05-29 00:58:33', '2024-05-29 01:05:22'),
(55, 95, 'project_it@mohe.com', 'General Manager of IT Projects ', 'مدیر عمومي پروژه های آی ټي', '2024-05-29 02:32:37', '2024-05-29 02:32:37'),
(56, 6, 'dir_finance@mohe.com', 'Director', 'رئیس', '2024-05-29 06:08:04', '2024-05-29 06:08:04'),
(57, 8, 'dir_const@mohe.com', 'Director', 'رئیس', '2024-05-29 06:10:52', '2024-05-29 06:33:14'),
(58, 8, 'ex_const@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-29 06:11:46', '2024-05-29 06:33:25'),
(59, 19, 'dir_rct@mohe.com', 'Director', 'رئیس', '2024-05-29 06:14:27', '2024-05-29 06:14:27'),
(60, 19, 'ex_rct@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-29 06:15:47', '2024-05-29 06:15:47'),
(61, 62, 'dir_private@mohe.com', 'Director', 'رئیس', '2024-05-29 06:47:32', '2024-05-29 06:48:44'),
(62, 12, 'ex_private@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-29 06:50:54', '2024-05-29 06:50:54'),
(63, 20, 'ex_nisaab@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-05-29 06:56:57', '2024-05-29 06:56:57'),
(64, 20, 'dir_nisaab@mohe.com', 'Director', 'رئیس', '2024-05-29 06:58:26', '2024-05-29 06:58:26'),
(65, 5, 'dir_hr@mohe.com', 'Director', 'رئیس', '2024-05-29 07:01:38', '2024-05-29 07:01:38'),
(66, 5, 'ex_hr@mohe.com', 'Excecutive Manager', 'مدیر اجرائیه', '2024-05-29 07:02:19', '2024-05-29 07:02:19'),
(67, 40, 'head_proc@mohe.com', 'آمر', 'Head', '2024-06-01 00:54:12', '2024-06-01 00:54:12'),
(68, 32, 'networks.gmforign@mohe.com', 'Shamsulislam', 'شمس الاسلام ', '2024-06-02 00:57:39', '2024-06-02 01:02:18'),
(69, 32, 'afgren@mohe.com', 'Wasimullah Safi', 'وسیم الله صافی', '2024-06-02 01:04:33', '2024-06-02 01:04:33'),
(70, 6, 'dir_fin@mohe.com', 'Director', 'رئیس', '2024-06-03 03:00:34', '2024-06-03 03:00:34'),
(71, 6, 'ex_fin@mohe.com', 'Executive Manager', 'مدیر اجرائیه', '2024-06-03 03:00:41', '2024-06-03 03:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `pa_title` text DEFAULT NULL,
  `da_title` text DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Settings - View', 'web', '2024-11-02 02:38:27', '2024-11-02 02:38:27'),
(2, 'Settings - Update', 'web', '2024-11-02 02:38:32', '2024-11-02 02:38:32'),
(3, 'Roles - Create', 'web', '2024-11-02 02:46:19', '2024-11-02 02:46:19'),
(4, 'Roles - Update', 'web', '2024-11-02 02:46:25', '2024-11-02 02:46:25'),
(5, 'Roles - Delete', 'web', '2024-11-02 02:46:33', '2024-11-02 02:46:33'),
(6, 'Permissions - Create', 'web', '2024-11-02 02:47:14', '2024-11-02 02:47:14'),
(7, 'Permissions - Update', 'web', '2024-11-02 02:47:22', '2024-11-02 02:47:22'),
(8, 'Permissions - Delete', 'web', '2024-11-02 02:47:29', '2024-11-02 02:47:29'),
(9, 'Users - Create', 'web', '2024-11-02 02:48:15', '2024-11-02 02:48:15'),
(10, 'Users - Update', 'web', '2024-11-02 02:48:20', '2024-11-02 02:48:20'),
(11, 'Users - Delete', 'web', '2024-11-02 02:48:28', '2024-11-02 02:48:28'),
(12, 'Users - Lock', 'web', '2024-11-02 02:48:39', '2024-11-02 02:48:39'),
(13, 'Users - Set Permissions', 'web', '2024-11-02 02:49:12', '2024-11-02 02:49:12'),
(14, 'Users - List', 'web', '2024-11-02 02:49:52', '2024-11-02 02:49:52'),
(15, 'Roles - List', 'web', '2024-11-02 02:50:07', '2024-11-02 02:50:07'),
(16, 'Permissions - List', 'web', '2024-11-02 02:50:16', '2024-11-02 02:50:16'),
(17, 'Roles - Can Assign Persmission', 'web', '2024-11-02 02:56:56', '2024-11-02 02:56:56'),
(18, 'Funds - List', 'web', '2024-11-02 05:01:48', '2024-11-02 05:01:48'),
(19, 'Funds - Create', 'web', '2024-11-02 05:02:01', '2024-11-02 05:02:01'),
(20, 'Funds - Update', 'web', '2024-11-02 05:02:11', '2024-11-02 05:02:11'),
(21, 'Funds - Delete', 'web', '2024-11-02 05:02:17', '2024-11-02 05:02:17'),
(22, 'Object Codes - List', 'web', '2024-11-02 05:15:27', '2024-11-02 05:15:27'),
(23, 'Object Codes - Create', 'web', '2024-11-02 05:15:34', '2024-11-02 05:15:34'),
(24, 'Object Codes - Update', 'web', '2024-11-02 05:15:39', '2024-11-02 05:15:39'),
(25, 'Object Codes - Delete', 'web', '2024-11-02 05:15:44', '2024-11-02 05:15:44'),
(26, 'Organizations - List', 'web', '2024-11-02 05:28:37', '2024-11-02 05:28:37'),
(27, 'Organizations - Create', 'web', '2024-11-02 05:28:43', '2024-11-02 05:28:43'),
(28, 'Organizations - Update', 'web', '2024-11-02 05:28:48', '2024-11-02 05:28:48'),
(29, 'Organizations - Delete', 'web', '2024-11-02 05:28:53', '2024-11-02 05:28:53'),
(30, 'Programs - List', 'web', '2024-11-02 05:39:58', '2024-11-02 05:39:58'),
(31, 'Programs - Create', 'web', '2024-11-02 05:40:04', '2024-11-02 05:40:04'),
(32, 'Programs - Update', 'web', '2024-11-02 05:40:09', '2024-11-02 05:40:09'),
(33, 'Programs - Delete', 'web', '2024-11-02 05:40:13', '2024-11-02 05:40:13'),
(34, 'Projects - List', 'web', '2024-11-02 05:51:02', '2024-11-02 05:51:02'),
(35, 'Projects - Create', 'web', '2024-11-02 05:51:10', '2024-11-02 05:51:10'),
(36, 'Projects - Update', 'web', '2024-11-02 05:51:13', '2024-11-02 05:51:13'),
(37, 'Projects - Delete', 'web', '2024-11-02 05:51:17', '2024-11-02 05:51:17'),
(38, 'Locations - List', 'web', '2024-11-02 06:01:43', '2024-11-02 06:01:43'),
(39, 'Locations - Create', 'web', '2024-11-02 06:01:48', '2024-11-02 06:01:48'),
(40, 'Locations - Update', 'web', '2024-11-02 06:01:53', '2024-11-02 06:01:53'),
(41, 'Locations - Delete', 'web', '2024-11-02 06:01:57', '2024-11-02 06:01:57'),
(42, 'Measurements - List', 'web', '2024-11-02 06:06:17', '2024-11-02 06:06:17'),
(43, 'Measurements - Create', 'web', '2024-11-02 06:06:21', '2024-11-02 06:06:21'),
(44, 'Measurements - Update', 'web', '2024-11-02 06:06:26', '2024-11-02 06:06:26'),
(45, 'Measurements - Delete', 'web', '2024-11-02 06:06:30', '2024-11-02 06:06:30'),
(46, 'Budget Plan - List', 'web', '2024-11-02 06:27:34', '2024-11-02 06:27:34'),
(47, 'Budget Plan - Create', 'web', '2024-11-02 06:30:50', '2024-11-02 06:30:50'),
(48, 'Budget Plan - Update', 'web', '2024-11-02 06:30:56', '2024-11-02 06:30:56'),
(49, 'Budget Plan - Delete', 'web', '2024-11-02 06:31:02', '2024-11-02 06:31:02'),
(50, 'Budget Plan - Can Complete', 'web', '2024-11-02 06:31:15', '2024-11-02 06:31:15'),
(51, 'Approved Budget (Regular) - List', 'web', '2024-11-03 00:06:41', '2024-11-03 00:06:41'),
(52, 'Approved Budget (Regular) - Update', 'web', '2024-11-03 00:06:47', '2024-11-03 00:06:47'),
(53, 'Approved Budget (Regular) - Finalize', 'web', '2024-11-03 00:06:55', '2024-11-03 00:06:55'),
(54, 'B10 (Regular) - List', 'web', '2024-11-03 00:48:29', '2024-11-03 00:48:29'),
(55, 'B10 (Regular) - Create', 'web', '2024-11-03 00:48:34', '2024-11-03 00:48:34'),
(56, 'B10 (Regular) - Update', 'web', '2024-11-03 00:48:39', '2024-11-03 00:48:39'),
(57, 'B10 (Regular) - Delete', 'web', '2024-11-03 00:48:43', '2024-11-03 00:48:43'),
(58, 'B10 (Regular) - Lock', 'web', '2024-11-03 00:48:47', '2024-11-03 00:48:47'),
(59, 'B20 (Regular) - List', 'web', '2024-11-03 01:03:54', '2024-11-03 01:03:54'),
(60, 'B20 (Regular) - Create', 'web', '2024-11-03 01:04:00', '2024-11-03 01:04:00'),
(61, 'B20 (Regular) - Update', 'web', '2024-11-03 01:04:05', '2024-11-03 01:04:05'),
(62, 'B20 (Regular) - Delete', 'web', '2024-11-03 01:04:11', '2024-11-03 01:04:11'),
(63, 'B20 (Regular) - Lock', 'web', '2024-11-03 01:04:16', '2024-11-03 01:04:16'),
(64, 'B.External Transfer (Regular) - List', 'web', '2024-11-03 01:33:58', '2024-11-03 01:33:58'),
(65, 'B.External Transfer (Regular) - Create', 'web', '2024-11-03 01:34:04', '2024-11-03 01:34:04'),
(66, 'B.External Transfer (Regular) - Update', 'web', '2024-11-03 01:34:10', '2024-11-03 01:34:10'),
(67, 'B.External Transfer (Regular) - Delete', 'web', '2024-11-03 01:34:19', '2024-11-03 01:34:19'),
(68, 'B.External Transfer (Regular) - Lock', 'web', '2024-11-03 01:34:23', '2024-11-03 01:34:23'),
(69, 'B.Internal Transfer (Regular) - List', 'web', '2024-11-03 01:42:25', '2024-11-03 01:42:25'),
(70, 'B.Internal Transfer (Regular) - Create', 'web', '2024-11-03 01:42:34', '2024-11-03 01:42:34'),
(71, 'B.Internal Transfer (Regular) - Update', 'web', '2024-11-03 01:42:38', '2024-11-03 01:42:38'),
(72, 'B.Internal Transfer (Regular) - Delete', 'web', '2024-11-03 01:42:43', '2024-11-03 01:42:43'),
(73, 'B.Internal Transfer (Regular) - Lock', 'web', '2024-11-03 01:42:48', '2024-11-03 01:42:48'),
(74, 'B.Promises (Regular) - List', 'web', '2024-11-03 01:50:34', '2024-11-03 01:50:34'),
(75, 'B.Promises (Regular) - Create', 'web', '2024-11-03 01:50:39', '2024-11-03 01:50:39'),
(76, 'B.Promises (Regular) - Update', 'web', '2024-11-03 01:50:43', '2024-11-03 01:50:43'),
(77, 'B.Promises (Regular) - Delete', 'web', '2024-11-03 01:50:48', '2024-11-03 01:50:48'),
(78, 'B.Promises (Regular) - Lock', 'web', '2024-11-03 01:50:52', '2024-11-03 01:50:52'),
(79, 'Approved Budget (Development) - List', 'web', '2024-11-03 02:01:03', '2024-11-03 02:01:03'),
(80, 'Approved Budget (Development) - Create', 'web', '2024-11-03 02:01:07', '2024-11-03 02:01:07'),
(81, 'Approved Budget (Development) - Update', 'web', '2024-11-03 02:01:11', '2024-11-03 02:01:11'),
(82, 'Approved Budget (Development) - Delete', 'web', '2024-11-03 02:01:15', '2024-11-03 02:01:15'),
(83, 'Approved Budget (Development) - Lock', 'web', '2024-11-03 02:01:23', '2024-11-03 02:01:23'),
(84, 'B3 (Development) - List', 'web', '2024-11-03 02:35:50', '2024-11-03 02:35:50'),
(85, 'B3 (Development) - Create', 'web', '2024-11-03 02:35:54', '2024-11-03 02:35:54'),
(86, 'B3 (Development) - Update', 'web', '2024-11-03 02:35:58', '2024-11-03 02:35:58'),
(87, 'B3 (Development) - Delete', 'web', '2024-11-03 02:36:04', '2024-11-03 02:36:04'),
(88, 'B3 (Development) - Lock', 'web', '2024-11-03 02:36:08', '2024-11-03 02:36:08'),
(89, 'B20 (Development) - List', 'web', '2024-11-03 05:34:12', '2024-11-03 05:34:12'),
(90, 'B20 (Development) - Create', 'web', '2024-11-03 05:34:19', '2024-11-03 05:34:19'),
(91, 'B20 (Development) - Update', 'web', '2024-11-03 05:34:22', '2024-11-03 05:34:22'),
(92, 'B20 (Development) - Delete', 'web', '2024-11-03 05:34:27', '2024-11-03 05:34:27'),
(93, 'B20 (Development) - Lock', 'web', '2024-11-03 05:34:31', '2024-11-03 05:34:31'),
(94, 'B.E.Transfer (Development) - List', 'web', '2024-11-03 05:50:48', '2024-11-03 05:50:48'),
(95, 'B.E.Transfer (Development) - Create', 'web', '2024-11-03 05:50:52', '2024-11-03 05:50:52'),
(96, 'B.E.Transfer (Development) - Update', 'web', '2024-11-03 05:50:56', '2024-11-03 05:50:56'),
(97, 'B.E.Transfer (Development) - Delete', 'web', '2024-11-03 05:51:00', '2024-11-03 05:51:00'),
(98, 'B.E.Transfer (Development) - Lock', 'web', '2024-11-03 05:51:04', '2024-11-03 05:51:04'),
(99, 'B.I.Transfer (Development) - List', 'web', '2024-11-03 06:03:53', '2024-11-03 06:03:53'),
(100, 'B.I.Transfer (Development) - Create', 'web', '2024-11-03 06:03:57', '2024-11-03 06:03:57'),
(101, 'B.I.Transfer (Development) - Update', 'web', '2024-11-03 06:04:02', '2024-11-03 06:04:02'),
(102, 'B.I.Transfer (Development) - Delete', 'web', '2024-11-03 06:04:11', '2024-11-03 06:04:11'),
(103, 'B.I.Transfer (Development) - Lock', 'web', '2024-11-03 06:04:15', '2024-11-03 06:04:15'),
(104, 'B.Promises (Development) - List', 'web', '2024-11-03 06:11:32', '2024-11-03 06:11:32'),
(105, 'B.Promises (Development) - Create', 'web', '2024-11-03 06:11:36', '2024-11-03 06:11:36'),
(106, 'B.Promises (Development) - Update', 'web', '2024-11-03 06:11:40', '2024-11-03 06:11:40'),
(107, 'B.Promises (Development) - Delete', 'web', '2024-11-03 06:11:43', '2024-11-03 06:11:43'),
(108, 'B.Promises (Development) - Lock', 'web', '2024-11-03 06:11:49', '2024-11-03 06:11:49'),
(109, 'CF (Development) - List', 'web', '2024-11-03 06:21:21', '2024-11-03 06:21:21'),
(110, 'CF (Development) - Create', 'web', '2024-11-03 06:21:29', '2024-11-03 06:21:29'),
(111, 'CF (Development) - Update', 'web', '2024-11-03 06:21:32', '2024-11-03 06:21:32'),
(112, 'CF (Development) - Delete', 'web', '2024-11-03 06:21:36', '2024-11-03 06:21:36'),
(113, 'CF (Development) - Lock', 'web', '2024-11-03 06:21:41', '2024-11-03 06:21:41'),
(114, 'CF (Development) - Show Details', 'web', '2024-11-03 06:23:28', '2024-11-03 06:23:28'),
(115, 'CF (Development) - Create Details', 'web', '2024-11-03 06:23:47', '2024-11-03 06:23:47'),
(116, 'CF (Development) - Update Details', 'web', '2024-11-03 06:23:52', '2024-11-03 06:23:52'),
(117, 'CF (Development) - Delete Details', 'web', '2024-11-03 06:24:00', '2024-11-03 06:24:00'),
(118, 'CF (Development) - Lock Details', 'web', '2024-11-03 06:28:33', '2024-11-03 06:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `team_id` int(11) DEFAULT NULL,
  `permission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permission_user`
--

INSERT INTO `permission_user` (`team_id`, `permission_id`, `user_id`, `created_at`, `updated_at`) VALUES
(NULL, 1, 1, '2024-11-02 07:12:17', '2024-11-02 07:12:17'),
(NULL, 2, 1, '2024-11-02 07:12:19', '2024-11-02 07:12:19'),
(NULL, 15, 1, '2024-11-02 07:39:56', '2024-11-02 07:39:56'),
(NULL, 6, 1, '2024-11-02 07:39:57', '2024-11-02 07:39:57'),
(NULL, 7, 1, '2024-11-02 07:39:57', '2024-11-02 07:39:57'),
(NULL, 8, 1, '2024-11-02 07:39:58', '2024-11-02 07:39:58'),
(NULL, 16, 1, '2024-11-02 07:39:59', '2024-11-02 07:39:59'),
(NULL, 14, 1, '2024-11-02 07:47:30', '2024-11-02 07:47:30'),
(NULL, 3, 1, '2024-11-02 08:16:49', '2024-11-02 08:16:49'),
(NULL, 4, 1, '2024-11-02 08:16:50', '2024-11-02 08:16:50'),
(NULL, 5, 1, '2024-11-02 08:16:51', '2024-11-02 08:16:51'),
(NULL, 17, 1, '2024-11-02 08:16:51', '2024-11-02 08:16:51'),
(NULL, 9, 1, '2024-11-02 08:17:55', '2024-11-02 08:17:55'),
(NULL, 11, 1, '2024-11-02 08:17:57', '2024-11-02 08:17:57'),
(NULL, 10, 1, '2024-11-02 08:17:57', '2024-11-02 08:17:57'),
(NULL, 12, 1, '2024-11-02 08:17:58', '2024-11-02 08:17:58'),
(NULL, 13, 1, '2024-11-02 08:17:59', '2024-11-02 08:17:59'),
(NULL, 21, 1, '2024-11-02 09:37:40', '2024-11-02 09:37:40'),
(NULL, 20, 1, '2024-11-02 09:43:09', '2024-11-02 09:43:09'),
(NULL, 19, 1, '2024-11-02 09:43:11', '2024-11-02 09:43:11'),
(NULL, 22, 1, '2024-11-02 10:01:44', '2024-11-02 10:01:44'),
(NULL, 23, 1, '2024-11-02 10:01:45', '2024-11-02 10:01:45'),
(NULL, 18, 1, '2024-11-02 10:01:46', '2024-11-02 10:01:46'),
(NULL, 24, 1, '2024-11-02 10:01:47', '2024-11-02 10:01:47'),
(NULL, 25, 1, '2024-11-02 10:01:48', '2024-11-02 10:01:48'),
(NULL, 27, 1, '2024-11-02 10:04:33', '2024-11-02 10:04:33'),
(NULL, 28, 1, '2024-11-02 10:04:33', '2024-11-02 10:04:33'),
(NULL, 29, 1, '2024-11-02 10:04:34', '2024-11-02 10:04:34'),
(NULL, 26, 1, '2024-11-02 10:06:59', '2024-11-02 10:06:59'),
(NULL, 30, 1, '2024-11-02 10:19:34', '2024-11-02 10:19:34'),
(NULL, 31, 1, '2024-11-02 10:19:42', '2024-11-02 10:19:42'),
(NULL, 32, 1, '2024-11-02 10:19:42', '2024-11-02 10:19:42'),
(NULL, 33, 1, '2024-11-02 10:19:43', '2024-11-02 10:19:43'),
(NULL, 34, 1, '2024-11-02 10:27:18', '2024-11-02 10:27:18'),
(NULL, 35, 1, '2024-11-02 10:27:22', '2024-11-02 10:27:22'),
(NULL, 36, 1, '2024-11-02 10:27:23', '2024-11-02 10:27:23'),
(NULL, 37, 1, '2024-11-02 10:27:23', '2024-11-02 10:27:23'),
(NULL, 38, 1, '2024-11-02 10:32:25', '2024-11-02 10:32:25'),
(NULL, 39, 1, '2024-11-02 10:32:26', '2024-11-02 10:32:26'),
(NULL, 40, 1, '2024-11-02 10:32:26', '2024-11-02 10:32:26'),
(NULL, 41, 1, '2024-11-02 10:32:27', '2024-11-02 10:32:27'),
(NULL, 47, 1, '2024-11-02 11:03:29', '2024-11-02 11:03:29'),
(NULL, 48, 1, '2024-11-02 11:03:30', '2024-11-02 11:03:30'),
(NULL, 49, 1, '2024-11-02 11:03:31', '2024-11-02 11:03:31'),
(NULL, 50, 1, '2024-11-02 11:03:34', '2024-11-02 11:03:34'),
(NULL, 51, 1, '2024-11-03 04:41:40', '2024-11-03 04:41:40'),
(NULL, 46, 1, '2024-11-03 04:42:05', '2024-11-03 04:42:05'),
(NULL, 52, 1, '2024-11-03 05:21:05', '2024-11-03 05:21:05'),
(NULL, 53, 1, '2024-11-03 05:21:08', '2024-11-03 05:21:08'),
(NULL, 54, 1, '2024-11-03 05:27:07', '2024-11-03 05:27:07'),
(NULL, 55, 1, '2024-11-03 05:30:19', '2024-11-03 05:30:19'),
(NULL, 56, 1, '2024-11-03 05:30:26', '2024-11-03 05:30:26'),
(NULL, 57, 1, '2024-11-03 05:30:36', '2024-11-03 05:30:36'),
(NULL, 58, 1, '2024-11-03 05:30:43', '2024-11-03 05:30:43'),
(NULL, 60, 1, '2024-11-03 05:40:33', '2024-11-03 05:40:33'),
(NULL, 62, 1, '2024-11-03 05:40:35', '2024-11-03 05:40:35'),
(NULL, 63, 1, '2024-11-03 05:40:36', '2024-11-03 05:40:36'),
(NULL, 59, 1, '2024-11-03 05:41:48', '2024-11-03 05:41:48'),
(NULL, 64, 1, '2024-11-03 06:05:36', '2024-11-03 06:05:36'),
(NULL, 61, 1, '2024-11-03 06:05:37', '2024-11-03 06:05:37'),
(NULL, 67, 1, '2024-11-03 06:11:03', '2024-11-03 06:11:03'),
(NULL, 65, 1, '2024-11-03 06:11:09', '2024-11-03 06:11:09'),
(NULL, 66, 1, '2024-11-03 06:11:09', '2024-11-03 06:11:09'),
(NULL, 68, 1, '2024-11-03 06:11:10', '2024-11-03 06:11:10'),
(NULL, 69, 1, '2024-11-03 06:18:36', '2024-11-03 06:18:36'),
(NULL, 72, 1, '2024-11-03 06:19:07', '2024-11-03 06:19:07'),
(NULL, 73, 1, '2024-11-03 06:19:08', '2024-11-03 06:19:08'),
(NULL, 70, 1, '2024-11-03 06:29:02', '2024-11-03 06:29:02'),
(NULL, 71, 1, '2024-11-03 06:29:05', '2024-11-03 06:29:05'),
(NULL, 74, 1, '2024-11-03 06:29:19', '2024-11-03 06:29:19'),
(NULL, 75, 1, '2024-11-03 06:29:26', '2024-11-03 06:29:26'),
(NULL, 76, 1, '2024-11-03 06:29:27', '2024-11-03 06:29:27'),
(NULL, 77, 1, '2024-11-03 06:29:28', '2024-11-03 06:29:28'),
(NULL, 78, 1, '2024-11-03 06:29:29', '2024-11-03 06:29:29'),
(NULL, 79, 1, '2024-11-03 06:38:07', '2024-11-03 06:38:07'),
(NULL, 80, 1, '2024-11-03 06:38:09', '2024-11-03 06:38:09'),
(NULL, 81, 1, '2024-11-03 06:38:10', '2024-11-03 06:38:10'),
(NULL, 82, 1, '2024-11-03 06:38:11', '2024-11-03 06:38:11'),
(NULL, 83, 1, '2024-11-03 09:37:29', '2024-11-03 09:37:29'),
(NULL, 84, 1, '2024-11-03 09:46:26', '2024-11-03 09:46:26'),
(NULL, 85, 1, '2024-11-03 10:01:55', '2024-11-03 10:01:55'),
(NULL, 86, 1, '2024-11-03 10:01:57', '2024-11-03 10:01:57'),
(NULL, 87, 1, '2024-11-03 10:01:59', '2024-11-03 10:01:59'),
(NULL, 88, 1, '2024-11-03 10:02:00', '2024-11-03 10:02:00'),
(NULL, 89, 1, '2024-11-03 10:07:30', '2024-11-03 10:07:30'),
(NULL, 90, 1, '2024-11-03 10:13:24', '2024-11-03 10:13:24'),
(NULL, 91, 1, '2024-11-03 10:13:26', '2024-11-03 10:13:26'),
(NULL, 92, 1, '2024-11-03 10:13:27', '2024-11-03 10:13:27'),
(NULL, 93, 1, '2024-11-03 10:13:29', '2024-11-03 10:13:29'),
(NULL, 94, 1, '2024-11-03 10:22:31', '2024-11-03 10:22:31'),
(NULL, 95, 1, '2024-11-03 10:29:51', '2024-11-03 10:29:51'),
(NULL, 96, 1, '2024-11-03 10:29:52', '2024-11-03 10:29:52'),
(NULL, 97, 1, '2024-11-03 10:29:54', '2024-11-03 10:29:54'),
(NULL, 98, 1, '2024-11-03 10:29:55', '2024-11-03 10:29:55'),
(NULL, 99, 1, '2024-11-03 10:39:20', '2024-11-03 10:39:20'),
(NULL, 100, 1, '2024-11-03 10:39:30', '2024-11-03 10:39:30'),
(NULL, 101, 1, '2024-11-03 10:39:32', '2024-11-03 10:39:32'),
(NULL, 102, 1, '2024-11-03 10:39:33', '2024-11-03 10:39:33'),
(NULL, 103, 1, '2024-11-03 10:39:35', '2024-11-03 10:39:35'),
(NULL, 105, 1, '2024-11-03 10:49:26', '2024-11-03 10:49:26'),
(NULL, 106, 1, '2024-11-03 10:49:28', '2024-11-03 10:49:28'),
(NULL, 107, 1, '2024-11-03 10:49:30', '2024-11-03 10:49:30'),
(NULL, 108, 1, '2024-11-03 10:49:31', '2024-11-03 10:49:31'),
(NULL, 104, 1, '2024-11-03 10:49:56', '2024-11-03 10:49:56'),
(NULL, 109, 1, '2024-11-03 11:03:44', '2024-11-03 11:03:44'),
(NULL, 110, 1, '2024-11-03 11:03:50', '2024-11-03 11:03:50'),
(NULL, 111, 1, '2024-11-03 11:03:52', '2024-11-03 11:03:52'),
(NULL, 112, 1, '2024-11-03 11:03:53', '2024-11-03 11:03:53'),
(NULL, 113, 1, '2024-11-03 11:03:56', '2024-11-03 11:03:56'),
(NULL, 114, 1, '2024-11-03 11:04:03', '2024-11-03 11:04:03'),
(NULL, 115, 1, '2024-11-03 11:04:18', '2024-11-03 11:04:18'),
(NULL, 116, 1, '2024-11-03 11:04:20', '2024-11-03 11:04:20'),
(NULL, 117, 1, '2024-11-03 11:04:22', '2024-11-03 11:04:22'),
(NULL, 118, 1, '2024-11-03 11:04:24', '2024-11-03 11:04:24');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `team_id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Settings', 'web', '2024-11-02 02:34:58', '2024-11-02 02:34:58'),
(2, NULL, 'Roles', 'web', '2024-11-02 02:45:15', '2024-11-02 02:45:15'),
(3, NULL, 'Permissions', 'web', '2024-11-02 02:45:24', '2024-11-02 02:45:24'),
(4, NULL, 'Users', 'web', '2024-11-02 02:45:28', '2024-11-02 02:45:28'),
(5, NULL, 'Funds', 'web', '2024-11-02 05:00:15', '2024-11-02 05:01:19'),
(6, NULL, 'Object Codes', 'web', '2024-11-02 05:14:38', '2024-11-02 05:14:38'),
(7, NULL, 'Organizations', 'web', '2024-11-02 05:28:20', '2024-11-02 05:28:20'),
(8, NULL, 'Programs', 'web', '2024-11-02 05:39:26', '2024-11-02 05:39:26'),
(9, NULL, 'Projects', 'web', '2024-11-02 05:39:37', '2024-11-02 05:39:37'),
(10, NULL, 'Locations', 'web', '2024-11-02 05:39:44', '2024-11-02 05:39:44'),
(11, NULL, 'Measurements', 'web', '2024-11-02 06:06:01', '2024-11-02 06:06:01'),
(12, NULL, 'Budget Plan', 'web', '2024-11-02 06:25:56', '2024-11-02 06:25:56'),
(13, NULL, 'Approved Budget (Regular)', 'web', '2024-11-03 00:04:41', '2024-11-03 00:05:45'),
(14, NULL, 'B10 (Regular)', 'web', '2024-11-03 00:46:46', '2024-11-03 00:46:55'),
(15, NULL, 'B20 (Regular)', 'web', '2024-11-03 01:03:23', '2024-11-03 01:03:23'),
(16, NULL, 'B.External Transfer (Regular)', 'web', '2024-11-03 01:33:45', '2024-11-03 01:33:45'),
(17, NULL, 'B.Internal Transfer (Regular)', 'web', '2024-11-03 01:42:10', '2024-11-03 01:42:10'),
(18, NULL, 'B.Promises (Regular)', 'web', '2024-11-03 01:50:20', '2024-11-03 01:50:20'),
(19, NULL, 'Approved Budget (Development)', 'web', '2024-11-03 02:00:51', '2024-11-03 02:00:51'),
(20, NULL, 'B3 (Development)', 'web', '2024-11-03 02:35:33', '2024-11-03 02:35:33'),
(21, NULL, 'B20 (Development)', 'web', '2024-11-03 05:33:56', '2024-11-03 05:33:56'),
(22, NULL, 'B.E.Transfer (Development)', 'web', '2024-11-03 05:50:40', '2024-11-03 05:50:40'),
(23, NULL, 'B.I.Transfer (Development)', 'web', '2024-11-03 06:02:57', '2024-11-03 06:02:57'),
(24, NULL, 'B.Promises (Development)', 'web', '2024-11-03 06:11:23', '2024-11-03 06:11:23'),
(25, NULL, 'CF (Development)', 'web', '2024-11-03 06:21:15', '2024-11-03 06:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 3),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 2),
(16, 3),
(17, 2),
(18, 5),
(19, 5),
(20, 5),
(21, 5),
(22, 6),
(23, 6),
(24, 6),
(25, 6),
(26, 7),
(27, 7),
(28, 7),
(29, 7),
(30, 8),
(31, 8),
(32, 8),
(33, 8),
(34, 9),
(35, 9),
(36, 9),
(37, 9),
(38, 10),
(39, 10),
(40, 10),
(41, 10),
(42, 11),
(43, 11),
(44, 11),
(45, 11),
(46, 12),
(47, 12),
(48, 12),
(49, 12),
(50, 12),
(51, 13),
(52, 13),
(53, 13),
(54, 14),
(55, 14),
(56, 14),
(57, 14),
(58, 14),
(59, 15),
(60, 15),
(61, 15),
(62, 15),
(63, 15),
(64, 16),
(65, 16),
(66, 16),
(67, 16),
(68, 16),
(69, 17),
(70, 17),
(71, 17),
(72, 17),
(73, 17),
(74, 18),
(75, 18),
(76, 18),
(77, 18),
(78, 18),
(79, 19),
(80, 19),
(81, 19),
(82, 19),
(83, 19),
(84, 20),
(85, 20),
(86, 20),
(87, 20),
(88, 20),
(89, 21),
(90, 21),
(91, 21),
(92, 21),
(93, 21),
(94, 22),
(95, 22),
(96, 22),
(97, 22),
(98, 22),
(99, 23),
(100, 23),
(101, 23),
(102, 23),
(103, 23),
(104, 24),
(105, 24),
(106, 24),
(107, 24),
(108, 24),
(109, 25),
(110, 25),
(111, 25),
(112, 25),
(113, 25),
(114, 25),
(115, 25),
(116, 25),
(117, 25),
(118, 25);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`, `team_id`) VALUES
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL),
(1, 6, NULL),
(1, 7, NULL),
(1, 8, NULL),
(1, 9, NULL),
(1, 10, NULL),
(1, 11, NULL),
(1, 12, NULL),
(1, 13, NULL),
(1, 14, NULL),
(1, 15, NULL),
(1, 16, NULL),
(1, 17, NULL),
(1, 18, NULL),
(1, 19, NULL),
(1, 20, NULL),
(1, 21, NULL),
(1, 22, NULL),
(1, 23, NULL),
(1, 24, NULL),
(1, 25, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `en_app_name` varchar(255) DEFAULT NULL,
  `pa_app_name` varchar(255) DEFAULT NULL,
  `da_app_name` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `larg_logo` text DEFAULT NULL,
  `medium_logo` text DEFAULT NULL,
  `small_logo` text DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `en_app_name`, `pa_app_name`, `da_app_name`, `abbr`, `larg_logo`, `medium_logo`, `small_logo`, `favicon`, `created_at`, `updated_at`) VALUES
(1, 'Ministry of Higher Education', 'د لوړو زده کړو وزارت', 'وزارت تحصیلات عالی', 'MOHE', 'uploads/logo/larg_logo/rise-geo-logo.png', 'uploads/logo/medium_logo/rise-geo-logo.png', 'uploads/logo/small_logo/rise-geo-logo.png', 'uploads/logo/favicon/rise-geo-favicon.png', '2024-02-04 02:38:09', '2024-04-17 00:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pa_name` varchar(255) DEFAULT NULL,
  `da_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `pa_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `pa_name`, `email`, `image`, `email_verified_at`, `password`, `remember_token`, `is_blocked`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'اډمن', 'admin@mohe.com', 'storage/users-images/2024-04-21-04-22-20-04.png', NULL, '$2y$12$zp473gk/JlxU5hNf9FQjQuN8O5IORa1M65MKxPDxZ1GUW3VhEdM7G', '', 0, '2024-03-05 09:38:49', '2024-11-02 02:42:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`team_id`,`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  ADD KEY `model_has_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `model_has_permissions_team_foreign_key_index` (`team_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`team_id`,`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  ADD KEY `model_has_roles_role_id_foreign` (`role_id`),
  ADD KEY `model_has_roles_team_foreign_key_index` (`team_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_team_id_name_guard_name_unique` (`team_id`,`name`,`guard_name`),
  ADD KEY `roles_team_foreign_key_index` (`team_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
