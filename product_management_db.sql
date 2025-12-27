-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2025 at 08:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`, `parent_category_id`, `created_at`) VALUES
(1, 'Electronic', 'Electronic devices and accessorie', NULL, '2025-12-26 19:06:01'),
(2, 'Computers', 'Computers and computer accessories', NULL, '2025-12-26 19:06:01'),
(3, 'Phone', 'Mobile phones and accessorie', NULL, '2025-12-26 19:06:01'),
(4, 'Furniture', 'Office and home furniture', NULL, '2025-12-26 19:06:01'),
(5, 'Stationery', 'Office stationery items', NULL, '2025-12-26 19:06:01'),
(6, 'Wearables', 'Smart wearable devices such as fitness bands and smart watches', 1, '2025-12-27 02:04:06'),
(7, 'Networking', 'Routers, switches, and networking accessories', 2, '2025-12-27 02:04:06'),
(8, 'Audio Accessories', 'Headphones, speakers, and audio equipment', 1, '2025-12-27 02:04:06'),
(9, 'Mobile Accessories', 'Chargers, cables, power banks, and phone accessories', 3, '2025-12-27 02:04:06'),
(10, 'Storage Devices', 'External drives, USB flash drives, and memory cards', 2, '2025-12-27 02:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_transactions`
--

CREATE TABLE `inventory_transactions` (
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_type` enum('IN','OUT','ADJUSTMENT') NOT NULL,
  `quantity` int(11) NOT NULL,
  `transaction_date` datetime DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `reference_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL CHECK (`price` > 0),
  `cost_price` decimal(10,2) DEFAULT NULL,
  `quantity_in_stock` int(11) DEFAULT 0 CHECK (`quantity_in_stock` >= 0),
  `reorder_level` int(11) DEFAULT 10,
  `supplier_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `dimensions` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `sku`, `description`, `category_id`, `price`, `cost_price`, `quantity_in_stock`, `reorder_level`, `supplier_id`, `image_url`, `barcode`, `weight`, `dimensions`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Bluetooth Headphones', 'ELEC-BTH-001', 'Wireless over-ear Bluetooth headphones', 1, 120.00, 85.00, 50, 10, 1, NULL, 'BARCODE-1001', 0.45, '20x18x8', 0, 1, '2025-12-27 01:12:26', '2025-12-26 21:46:36'),
(5, 'Office Chair', 'FURN-CHR-004', 'Ergonomic office chair with lumbar support', 4, 220.00, 150.00, 20, 5, 2, NULL, 'BARCODE-1004', 12.00, '70x70x120', 1, 1, '2025-12-27 01:12:26', '2025-12-26 21:46:44'),
(6, 'A4 Paper Ream', 'STAT-PAP-005', '500 sheets A4 size paper', 5, 12.50, 9.00, 200, 50, 2, NULL, 'BARCODE-1005', 2.30, '30x21x5', 1, 1, '2025-12-27 01:12:26', '2025-12-27 01:12:26'),
(7, 'Smart Watch', 'ELEC-WCH-006', 'Fitness tracking smart watch', 1, 180.00, 130.00, 40, 10, 3, NULL, 'BARCODE-1006', 0.12, '5x5x1', 1, 1, '2025-12-27 01:12:26', '2025-12-26 22:23:37'),
(8, 'Mechanical Keyboard', 'COMP-KBD-007', 'RGB mechanical gaming keyboard', 2, 140.00, 95.00, 21, 10, 1, NULL, 'BARCODE-1007', 1.10, '45x15x4', 1, 1, '2025-12-27 01:12:26', '2025-12-26 22:23:47'),
(9, 'Wireless Power Bank', 'PHN-PWR-008', '10000mAh wireless power bank', 3, 75.00, 55.00, 48, 15, 3, NULL, 'BARCODE-1008', 0.30, '14x7x1.5', 1, 1, '2025-12-27 01:12:26', '2025-12-26 21:33:45'),
(10, 'Office Desk', 'FURN-DSK-009', 'Wooden office desk with drawers', 4, 480.00, 350.00, 8, 3, 2, NULL, 'BARCODE-1009', 28.00, '120x60x75', 1, 1, '2025-12-27 01:12:26', '2025-12-27 01:12:26'),
(11, 'Ball Point Pen Pack', 'STAT-PEN-010', 'Pack of 10 blue ball point pens', 5, 6.00, 3.50, 149, 30, 2, NULL, 'BARCODE-1010', 0.20, '15x5x2', 1, 1, '2025-12-27 01:12:26', '2025-12-27 07:30:50'),
(12, 'Portable Bluetooth Speaker', 'ELEC-SPK-011', 'Compact portable Bluetooth speaker with deep bass', 1, 95.00, 70.00, 45, 10, 3, NULL, 'BARCODE-1011', 0.60, '18x8x7', 1, 1, '2025-12-27 01:47:24', '2025-12-27 01:47:24'),
(13, 'USB-C Docking Station', 'COMP-DCK-012', 'Multi-port USB-C docking station for laptops', 2, 160.00, 120.00, 25, 8, 1, NULL, 'BARCODE-1012', 0.50, '20x9x3', 1, 1, '2025-12-27 01:47:24', '2025-12-27 01:47:24'),
(14, 'Fast Charging USB-C Cable', 'PHN-CBL-013', 'Durable USB-C fast charging cable', 3, 18.00, 9.50, 120, 25, 2, NULL, 'BARCODE-1013', 0.10, '12x4x2', 1, 1, '2025-12-27 01:47:24', '2025-12-27 01:47:24'),
(15, 'Bookshelf Cabinet', 'FURN-SHF-014', '5-tier wooden bookshelf cabinet', 4, 320.00, 240.00, 8, 4, 2, NULL, 'BARCODE-1014', 22.00, '80x30x180', 1, 1, '2025-12-27 01:47:24', '2025-12-26 21:51:02'),
(16, 'Whiteboard Marker Set', 'STAT-MRK-015', 'Set of 8 assorted color whiteboard markers', 5, 22.00, 14.00, 90, 20, 2, NULL, 'BARCODE-1015', 0.25, '14x6x3', 1, 1, '2025-12-27 01:47:24', '2025-12-27 01:47:24'),
(17, 'Laptop', 'lap-12', 'Lattitude 5410', 2, 20000.00, 18000.00, 20, 10, 8, NULL, '123456', 1.00, NULL, 1, 2, '2025-12-26 20:56:17', '2025-12-26 20:56:17'),
(18, 'Fitness Tracker Band', 'WRBL-BND-016', 'Water-resistant fitness tracker with heart rate monitor', 6, 85.00, 60.00, 55, 12, 3, NULL, 'BARCODE-1016', 0.05, '4x2x1', 1, 1, '2025-12-27 02:50:25', '2025-12-27 02:50:25'),
(19, 'Dual Band WiFi Router', 'NET-RT-017', 'High-speed dual band wireless router', 7, 210.00, 165.00, 18, 5, 1, NULL, 'BARCODE-1017', 0.90, '24x18x5', 1, 1, '2025-12-27 02:50:25', '2025-12-27 02:50:25'),
(20, 'Noise Cancelling Earbuds', 'AUD-EB-018', 'Wireless noise cancelling earbuds with charging case', 8, 160.00, 120.00, 40, 10, 3, NULL, 'BARCODE-1018', 0.08, '6x4x3', 1, 1, '2025-12-27 02:50:25', '2025-12-27 02:50:25'),
(21, 'Magnetic Phone Holder', 'MOB-HLD-019', 'Car dashboard magnetic phone holder', 9, 28.00, 15.00, 90, 20, 2, NULL, 'BARCODE-1019', 0.20, '10x6x5', 1, 1, '2025-12-27 02:50:25', '2025-12-27 02:50:25'),
(22, 'External SSD 1TB', 'STR-SSD-020', 'High-speed 1TB external solid state drive', 10, 260.00, 210.00, 22, 6, 1, NULL, 'BARCODE-1020', 0.15, '10x5x1', 1, 1, '2025-12-27 02:50:25', '2025-12-27 02:50:25'),
(23, 'Standing Desk Converter', 'FURN-STN-021', 'Adjustable standing desk converter', 4, 350.00, 270.00, 9, 3, 2, NULL, 'BARCODE-1021', 11.50, '80x60x15', 1, 1, '2025-12-27 02:50:25', '2025-12-27 02:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL CHECK (`quantity_sold` > 0),
  `unit_price` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `sale_date` datetime DEFAULT current_timestamp(),
  `customer_name` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `product_id`, `quantity_sold`, `unit_price`, `total_amount`, `sale_date`, `customer_name`, `user_id`) VALUES
(5, 9, 12, 75.00, 900.00, '2025-12-26 21:33:45', 'Shahbaz', 2),
(6, 8, 12, 140.00, 1680.00, '2025-12-26 21:47:42', 'Haziq', 2),
(7, 15, 2, 320.00, 640.00, '2025-12-26 21:51:02', 'Abdul Wahab', 2),
(8, 8, 2, 140.00, 280.00, '2025-12-26 22:23:47', 'Shozab', 2),
(9, 11, 1, 6.00, 6.00, '2025-12-27 07:30:50', 'Shozab', 2);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(150) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `contact_person`, `email`, `phone`, `address`, `created_at`) VALUES
(1, 'Tech Distributors I', 'John Smi', 'john@techdist.com', '+92-300-1234563', 'Lahore, Pakistan', '2025-12-26 19:06:01'),
(2, 'Office Supplies Co', 'Sarah Johnson', 'sarah@officesup.com', '+92-300-7654321', 'Karachi, Pakistan', '2025-12-26 19:06:01'),
(3, 'Electronics Warehouse', 'Mike Wilson', 'mike@elecware.com', '+92-321-1111111', 'Islamabad, Pakistan', '2025-12-26 19:06:01'),
(4, 'Global Tech Solutions', 'Ali Khan', 'ali@globaltech.com', '+92-301-2223344', 'Lahore, Pakistan', '2025-12-27 01:54:27'),
(5, 'Smart Gadgets Pvt Ltd', 'Usman Tariq', 'usman@smartgadgets.pk', '+92-302-5557788', 'Karachi, Pakista', '2025-12-27 01:54:27'),
(6, 'NextGen Electronics', 'Ahmed Raza', 'ahmed@nextgenelec.com', '+92-303-8889900', 'Islamabad, Pakistan', '2025-12-27 01:54:27'),
(7, 'Office Mart Supplies', 'Ayesha Malik', 'ayesha@officemart.pk', '+92-304-4445566', 'Rawalpindi, Pakistan', '2025-12-27 01:54:27'),
(8, 'Digital World Traders', 'Bilal Hussain', 'bilal@digitalworld.pk', '+92-305-7778899', 'Faisalabad, Pakistan', '2025-12-27 01:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firebase_uid` varchar(128) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` enum('admin','manager','staff') NOT NULL DEFAULT 'staff',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firebase_uid`, `username`, `email`, `full_name`, `role`, `created_at`, `updated_at`, `is_active`) VALUES
(1, '9MVEIDRWNkZuXgBekL5oABYuIJl2', 'iawais_06', 'itsawaisshahid632@gmail.com', 'Awais ', 'staff', '2025-12-26 20:03:25', '2025-12-26 20:03:25', 1),
(2, 'bYYn1R3A0TON8AXmtsKRedetvMp2', 'iawais_05', 'awais.shahid@bitbash.dev', 'Awais ', 'admin', '2025-12-26 20:09:15', '2025-12-26 20:09:15', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`),
  ADD KEY `parent_category_id` (`parent_category_id`),
  ADD KEY `idx_category_name` (`category_name`);

--
-- Indexes for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_transaction_date` (`transaction_date`),
  ADD KEY `idx_reference_number` (`reference_number`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_product_name` (`product_name`),
  ADD KEY `idx_sku` (`sku`),
  ADD KEY `idx_category_id` (`category_id`),
  ADD KEY `idx_supplier_id` (`supplier_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_sale_date` (`sale_date`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `idx_supplier_name` (`supplier_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `firebase_uid` (`firebase_uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_firebase_uid` (`firebase_uid`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD CONSTRAINT `inventory_transactions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
