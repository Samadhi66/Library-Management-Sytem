-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2025 at 02:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `isbn` varchar(32) NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(160) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `total_copies` int(11) NOT NULL DEFAULT 1,
  `available_copies` int(11) NOT NULL DEFAULT 1,
  `shelf_location` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `isbn`, `title`, `author`, `category`, `total_copies`, `available_copies`, `shelf_location`, `created_at`) VALUES
(41, '9789552123456', 'Madol Doova', 'Martin Wickramasinghe', 'Novel / Sinhala', 5, 2, '', '2025-09-03 05:22:56'),
(42, '9789556973002', 'Viragaya', 'Martin Wickramasinghe', 'Classic Literature', 2, 1, '', '2025-09-03 05:32:01'),
(43, '9789552125674', 'Sinhala Jana Kavi Sangrahaya', 'Wimal Dissanayak', 'Poetry', 3, 1, '', '2025-09-03 05:33:19'),
(44, '9789550034561', 'The Cage: The Fight for Sri Lanka', 'Gordon Weis', 'History / English', 2, 0, '', '2025-09-03 05:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `student_id`, `book_id`, `issue_date`, `due_date`, `return_date`) VALUES
(1, 8, 41, '2025-09-03', '2025-09-17', NULL),
(2, 7, 43, '2025-09-16', '2025-11-17', NULL),
(3, 8, 44, '2025-08-12', '2025-09-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` enum('BORROW','DUE SOON','OVERDUE','GENERAL') NOT NULL,
  `text` varchar(255) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` enum('LIBRARIAN','STUDENT') NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(160) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `password_hash`, `created_at`) VALUES
(3, 'LIBRARIAN', 'admin', 'admin@school.com', '$2y$10$rjqIge1eH1gilt7rK2sDJ.s7VfqigEHmLNhcH2ISxb8dF107lPRLG', '2025-08-15 17:37:14'),
(7, 'STUDENT', 'D.M Mishara', 'mishara@school.com', '$2y$10$7zOzjbKv33Pt.MHadzcmTeDfIYh95G6CZCGjaUFMsuLEPznjnVC42', '2025-08-16 06:19:53'),
(8, 'STUDENT', 'D.M samadhi', 'nethmasamadhi66@gmail.com', '$2y$10$3TLd079XV0zocPusRlMOx.HzcvjVLunZfud9PKRplT8LL2eeAHKlG', '2025-09-02 18:50:05'),
(9, 'LIBRARIAN', 'Jayathilaka', 'thilaka@gmail.com', '$2y$10$GpXF2yhFcrxiSdkcXBFb4.otNWKreprL/uDufDAfMI8yPdB9mRyTO', '2025-09-02 19:06:45'),
(10, 'STUDENT', 'T.W Navodya', 'Navodya@school.com', '$2y$10$qs/HhPjS1C4NGCK1llO4pOPxT/ejr0/Xyb52KlO2gKIGlNI9USYl6', '2025-09-03 05:45:06'),
(11, 'STUDENT', 'R.M Sadamali', 'sadamali@school.com', '$2y$10$bgSmdlo.ZX4EfpvaWCCMTeRVJqwQn7KltlZVkpRJebgUai4u6H4ii', '2025-09-03 05:45:54'),
(12, 'STUDENT', 'H.M Pasindu', 'pasindu@gmail.com', '$2y$10$71L6rTgiSaAuVhez0xChfOth2sZYRyLkgMxabdXl8CaDS3Q7kfy/W', '2025-09-03 05:47:12'),
(13, 'STUDENT', 'A.M Laksara', 'lakasara@school.com', '$2y$10$BB8fXqRbWy9jeRrVy1JtUugYeQB.V3SmbUMfzf/lJOO1L5Rbdo9AK', '2025-09-03 05:48:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_loans_student` (`student_id`),
  ADD KEY `fk_loans_book` (`book_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notifications_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `fk_loans_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_loans_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
