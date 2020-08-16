-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2020 at 12:02 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(18, 9, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, 'Aksesoris', 'aksesoris'),
(4, 'Smart Phones', '');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5),
(21, 11, 3, 1),
(22, 12, 35, 1),
(23, 12, 36, 1),
(24, 13, 44, 2),
(25, 14, 44, 4);

-- --------------------------------------------------------

--
-- Table structure for table `predict`
--

CREATE TABLE `predict` (
  `id_recommendation` int(11) NOT NULL,
  `id_product1` int(11) NOT NULL,
  `id_product2` int(11) NOT NULL,
  `id_product3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predict`
--

INSERT INTO `predict` (`id_recommendation`, `id_product1`, `id_product2`, `id_product3`) VALUES
(16, 36, 47, 35),
(17, 35, 47, 36),
(18, 36, 35, 47),
(19, 36, 58, 35),
(20, 44, 35, 36),
(21, 60, 36, 35),
(22, 36, 35, 44),
(23, 61, 36, 35),
(24, 35, 48, 43),
(25, 43, 51, 35),
(26, 51, 35, 43),
(27, 36, 51, 35),
(28, 36, 73, 35),
(29, 68, 35, 36),
(30, 36, 35, 64),
(31, 65, 35, 36),
(32, 35, 66, 54),
(33, 35, 66, 66),
(34, 35, 66, 43),
(35, 36, 43, 40);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(27, 1, 'Dell XPS 15 9560', '<p>The world&rsquo;s smallest 15.6-inch performance laptop packs powerhouse performance and a stunning InfinityEdge display &mdash; all in our most powerful XPS laptop. Featuring the latest Intel&reg; processors.</p>\r\n\r\n<h2>Operating system</h2>\r\n\r\n<p><strong>Available with Windows 10 Home&nbsp;</strong>- Get the best combination of Windows features you know and new improvements you&#39;ll love.</p>\r\n\r\n<h2>Innovation that inspires.</h2>\r\n\r\n<p>When you&rsquo;re at the forefront of ingenuity, you get noticed. That&rsquo;s why it&rsquo;s no surprise the XPS 15 was honored. The winning streak continues.</p>\r\n\r\n<h2>Meet the smallest 15.6-inch laptop on the planet.</h2>\r\n\r\n<p><strong>The world&rsquo;s only 15.6-inch InfinityEdge display*:</strong>&nbsp;The virtually borderless display maximizes screen space by accommodating a 15.6-inch display inside a laptop closer to the size of a 14-inch, thanks to a bezel measuring just 5.7mm.<br />\r\n&nbsp;<br />\r\n<strong>Operating System: Windows 10 Pro.</strong><br />\r\n<br />\r\n<strong>One-of-a-kind design:</strong>&nbsp;Measuring in at a slim 11-17mm and starting at just 4 pounds (1.8 kg) with a solid state drive, the XPS 15 is one of the world&rsquo;s lightest 15-inch performance-class laptop.</p>\r\n\r\n<h2>A stunning view, wherever you go.</h2>\r\n\r\n<p><strong>Dazzling detail:</strong>&nbsp;With the UltraSharp 4K Ultra HD display (3840 x 2160), you can see each detail of every pixel without needing to zoom in. And with 6 million more pixels than Full HD and 3 million more than the MacBook Pro, you can edit images with pinpoint accuracy without worrying about blurriness or jagged lines.<br />\r\n<br />\r\n<strong>Industry-leading color:</strong>&nbsp;The XPS 15 is the only laptop with 100% Adobe RGB color, covering a wider color gamut and producing shades of color outside conventional panels so you can see more of what you see in real life. And with over 1 billion colors, images appear smoother and color gradients are amazingly lifelike with more depth and dimension. Included is Dell PremierColor software, which automatically remaps content not already in Adobe RGB format for onscreen colors that appear amazingly accurate and true to life.<br />\r\n<br />\r\n<strong>Easy collaboration:</strong>&nbsp;See your screen from nearly every angle with an IGZO IPS panel, providing a wide viewing angle of up to 170&deg;.&nbsp;<br />\r\n<br />\r\n<strong>Brighten your day:</strong>&nbsp;With 350 nit brightness, it&rsquo;s brighter than a typical laptop.<br />\r\n<br />\r\n<strong>Touch-friendly:</strong>&nbsp;Tap, swipe and pinch your way around the screen. The optional touch display lets you interact naturally with your technology.</p>\r\n', 'dell-xps-15-9560', 1599, 'dell-xps-15-9560.jpg', '2019-08-05', 1),
(28, 4, 'Samsung Note 8', '<p>See the bigger picture and communicate in a whole new way. With the Galaxy Note8 in your hand, bigger things are just waiting to happen.&nbsp;</p>\r\n\r\n<h3>The Infinity Display that&#39;s larger than life.&nbsp;</h3>\r\n\r\n<p>More screen means more space to do great things. Go big with the Galaxy Note8&#39;s 6.3&quot; screen. It&#39;s the largest ever screen on a Note device and it still fits easily in your hand.</p>\r\n\r\n<p>*Infinity Display: a near bezel-less, full-frontal glass, edge-to-edge screen.</p>\r\n\r\n<p>*Screen measured diagonally as a full rectangle without accounting for the rounded corners.</p>\r\n\r\n<p>Use the S Pen to express yourself in ways that make a difference. Draw your own emojis to show how you feel or write a message on a photo and send it as a handwritten note. Do things that matter with the S Pen.</p>\r\n\r\n<p>*Image simulated for illustration purpose only.</p>\r\n', 'samsung-note-8', 829, 'samsung-note-8.jpg', '2019-08-04', 1),
(29, 4, 'Samsung Galaxy S9+ [128 GB]', '<h2>The revolutionary camera that adapts like the human eye.&nbsp;</h2>\r\n\r\n<h3>Capture stunning pictures in bright daylight and super low light.</h3>\r\n\r\n<p>Our category-defining Dual Aperture lens adapts like the human eye. It&#39;s able to automatically switch between various lighting conditions with ease&mdash;making your photos look great whether it&#39;s bright or dark, day or night.</p>\r\n\r\n<p>*Dual Aperture supports F1.5 and F2.4 modes. Installed on the rear camera (Galaxy S9)/rear wide camera (Galaxy S9+).</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.samsung.com/global/galaxy/galaxy-s9/images/galaxy-s9_slow_gif_visual_l.jpg\" style=\"height:464px; width:942px\" />Add music. Make GIFs. Get likes</p>\r\n\r\n<p>Super Slow-mo lets you see the things you could have missed in the blink of an eye. Set the video to music or turn it into a looping GIF, and share it with a tap. Then sit back and watch the reactions roll in.</p>\r\n', 'samsung-galaxy-s9-128-gb', 889.99, 'samsung-galaxy-s9-128-gb.jpg', '2019-08-03', 1),
(35, 1, 'Ring', 'tesss', 'ring', 100000, 's9.jpg', '2020-08-16', 1),
(36, 1, 'Tongsis', 'tesss', 'tongsis', 100000, 's9.jpg', '2020-08-16', 1),
(37, 1, 'Tongsis Bluetooth', 'tesss', 'tongsis-bluetooth', 100000, 's9.jpg', '2020-08-14', 4),
(38, 1, 'Sarung Universal Polos (Tab 7.0)', 'tesss', 'sarung-universal-polos-tab-70', 100000, 's9.jpg', '2020-08-14', 4),
(39, 1, 'Sarung Ume (Oppo Neo 9a37)', 'tesss', 'sarung-ume-oppo-neo-9a37', 100000, 's9.jpg', '2020-08-14', 4),
(40, 1, 'Srg Pinggang Poshsagagaleno', 'tesss', 'srg-pinggang-poshsagagaleno', 100000, 's9.jpg', '2020-08-14', 4),
(41, 1, 'Popsoket', 'tesss', 'popsoket', 100000, 's9.jpg', '2020-08-14', 4),
(42, 1, 'Kabel Data Vivan Warna (Iphone 4)', 'tesss', 'kabel-data-vivan-warna-iphone-4', 100000, 's9.jpg', '2020-08-14', 4),
(43, 1, 'Kabel Data Vivan Warna (Samsung Ball)', 'tesss', 'kabel-data-vivan-warna-samsung-ball', 100000, 's9.jpg', '2020-08-14', 4),
(44, 1, 'Kabel Data Vivan Warna (Iphone 5)', 'tesss', 'kabel-data-vivan-warna-iphone-5', 100000, 's9.jpg', '2020-08-16', 5),
(45, 1, 'Temperedglass (Xiaomi Redmi 3)', 'tesss', 'temperedglass-xiaomi-redmi-3', 100000, 's9.jpg', '2020-08-14', 4),
(46, 1, 'Temperedglass Indoscreen Bening (Iphone 6)', 'tesss', 'temperedglass-indoscreen-bening-iphone-6', 100000, 's9.jpg', '2020-08-14', 4),
(47, 1, 'Temperedglass Indoscreen (SAM GAL Prime)', 'tesss', 'temperedglass-indoscreen-sam-gal-prime', 100000, 's9.jpg', '2020-08-14', 4),
(48, 1, 'Temperedglass Indoscreen Bening (Iphone 5)', 'tesss', 'temperedglass-indoscreen-bening-iphone-5', 100000, 's9.jpg', '2020-08-14', 4),
(49, 1, 'Temperedglass Indoscreen (Sam J7 Prime)', 'tesss', 'temperedglass-indoscreen-sam-j7-prime', 100000, 's9.jpg', '2020-08-14', 4),
(50, 1, 'TC Well 2A', 'tesss', 'tc-well-2a', 100000, 's9.jpg', '2020-08-14', 4),
(51, 1, 'TC Wellcomm Moganics', 'tesss', 'tc-wellcomm-moganics', 100000, 's9.jpg', '2020-08-14', 4),
(52, 1, 'TC Kepala Vivan', 'tesss', 'tc-kepala-vivan', 100000, 's9.jpg', '2020-08-14', 4),
(53, 1, 'Spiner', 'tesss', 'spiner', 100000, 's9.jpg', '2020-08-14', 4),
(54, 1, 'Hardcase Spigen (Oppo Neo 9a37)', 'tesss', 'hardcase-spigen-oppo-neo-9a37', 100000, 's9.jpg', '2020-08-14', 4),
(55, 1, 'Hardcase Spigen (Sam J3 10)', 'tesss', 'hardcase-spigen-sam-j3-10', 100000, 's9.jpg', '2020-08-14', 4),
(56, 1, 'Hardcase Spigen (Oppo a39)', 'tesss', 'hardcase-spigen-oppo-a39', 100000, 's9.jpg', '2020-08-14', 4),
(57, 1, 'Hardcase Spigen (SAM J7 Prime)', 'tesss', 'hardcase-spigen-sam-j7-prime', 100000, 's9.jpg', '2020-08-14', 4),
(58, 1, 'Hardcase Spigen (Oppo F1S)', 'tesss', 'hardcase-spigen-oppo-f1s', 100000, 's9.jpg', '2020-08-14', 4),
(59, 1, 'Softcase (Gal Grand Ma)', 'tesss', 'softcase-gal-grand-ma', 100000, 's9.jpg', '2020-08-14', 4),
(60, 1, 'Case Motif (Gal Grand Prime)', 'tesss', 'case-motif-gal-grand-prime', 100000, 's9.jpg', '2020-08-14', 4),
(61, 1, 'Case Motif (SAM J3)', 'tesss', 'case-motif-sam-j3', 100000, 's9.jpg', '2020-08-14', 4),
(62, 1, 'Case Bening (Iphone 6g)', 'tesss', 'case-bening-iphone-6g', 100000, 's9.jpg', '2020-08-14', 4),
(63, 1, 'Case Motif (Oppo Neo 9a37)', 'tesss', 'case-motif-oppo-neo-9a37', 100000, 's9.jpg', '2020-08-14', 4),
(64, 1, 'Case Motif (SAM GAL J5 2016)', 'tesss', 'case-motif-sam-gal-j5-2016', 100000, 's9.jpg', '2020-08-14', 4),
(65, 1, 'Case Motif (Oppo Neo 7)', 'tesss', 'case-motif-oppo-neo-7', 100000, 's9.jpg', '2020-08-14', 4),
(66, 1, 'Case Motif (Oppo Neo F1S)', 'tesss', 'case-motif-oppo-neo-f1s', 100000, 's9.jpg', '2020-08-14', 4),
(67, 1, 'Case Motif (Xiomi Redmi 3 Pro)', 'tesss', 'case-motif-xiomi-redmi-3-pro', 100000, 's9.jpg', '2020-08-14', 4),
(68, 1, 'Softcase Motif Iphone (5g_1)', 'tesss', 'softcase-motif-iphone-5g_1', 100000, 's9.jpg', '2020-08-14', 4),
(69, 1, 'Powerbank Robot 5200mah', 'tesss', 'powerbank-robot-5200mah', 100000, 's9.jpg', '2020-08-14', 4),
(70, 1, 'HF Sony css 06 - as 200 - e 370730790ms - 772', 'tesss', 'hf-sony-css-06-as-200-e-370730790ms-772', 100000, 's9.jpg', '2020-08-14', 4),
(71, 1, 'HF All Type', 'tesss', 'hf-all-type', 100000, 's9.jpg', '2020-08-14', 4),
(72, 1, 'Waterproof', 'tesss', 'waterproof', 100000, 's9.jpg', '2020-08-14', 4),
(73, 1, 'Super Wide Polos Gambar', 'tesss', 'super-wide-polos-gambar', 100000, 's9.jpg', '2020-08-14', 4),
(74, 1, 'OB', 'tesss', 'ob', 100000, 's9.jpg', '2020-08-14', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10'),
(11, 17, 'PAY7821-17', '2020-08-16'),
(12, 17, 'PAY5812-1720200816', '2020-08-16'),
(13, 17, 'PAY7358-1720200816', '2020-08-16'),
(14, 17, 'PAY3755-1720200816', '2020-08-16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$0SHFfoWzz8WZpdu9Qw//E.tWamILbiNCX7bqhy3od0gvK5.kSJ8N2', 1, 'Code', 'Projects', '', '', 'thanos1.jpg', 1, '', '', '2018-05-01'),
(9, 'harry@den.com', '$2y$10$Oongyx.Rv0Y/vbHGOxywl.qf18bXFiZOcEaI4ZpRRLzFNGKAhObSC', 0, 'Harry', 'Den', 'Silay City, Negros Occidental', '09092735719', 'thT46QXUTX.jpg', 1, 'k8FBpynQfqsv', 'wzPGkX5IODlTYHg', '2018-05-09'),
(12, 'christine@gmail.com', '$2y$10$ozW4c8r313YiBsf7HD7m6egZwpvoE983IHfZsPRxrO1hWXfPRpxHO', 0, 'Christine', 'becker', 'demo', '7542214500', '18.jpg', 1, '', '', '2018-07-09'),
(15, 'admin_rsud@ahmad.com', '$2y$10$Y8j/G6PMgqwWmulXFPgPsu.B1bwUwvkd0Iz2yc1xv42tLKNYQM9le', 0, 'akssss', 'aaaaaa', '', '', '', 1, 'NCuvxRSkLip3', '', '2020-08-15'),
(17, 'adminps@bipi.com', '$2y$10$z5Z9Fvl7lGxPtCg8QZx5U.xAti2VLxI/WWL.GZpHVjUb6kOvp/Iii', 0, 'haoaooa', 'eaa', '', '', '', 1, 'ofHsElaXwrIK', '', '2020-08-15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predict`
--
ALTER TABLE `predict`
  ADD PRIMARY KEY (`id_recommendation`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `predict`
--
ALTER TABLE `predict`
  MODIFY `id_recommendation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
