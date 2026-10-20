-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307:3307
-- Generation Time: Oct 20, 2026 at 07:47 AM
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
-- Database: `z`
--

-- --------------------------------------------------------

--
-- Table structure for table `mst_tbl`
--

CREATE TABLE `mst_tbl` (
  `PaperTypeCode` int(11) NOT NULL,
  `PaperTypeName` varchar(225) NOT NULL,
  `PriceofReam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mst_tbl`
--

INSERT INTO `mst_tbl` (`PaperTypeCode`, `PaperTypeName`, `PriceofReam`) VALUES
(1, 'A4', 200),
(2, 'A5', 250),
(3, 'Legal', 300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mst_tbl`
--
ALTER TABLE `mst_tbl`
  ADD PRIMARY KEY (`PaperTypeCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mst_tbl`
--
ALTER TABLE `mst_tbl`
  MODIFY `PaperTypeCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
