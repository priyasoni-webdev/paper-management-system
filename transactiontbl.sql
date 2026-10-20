-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307:3307
-- Generation Time: Oct 20, 2026 at 07:46 AM
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
-- Table structure for table `transactiontbl`
--

CREATE TABLE `transactiontbl` (
  `SalesID` int(11) NOT NULL,
  `PaperTypeCode` int(11) NOT NULL,
  `SupplyDate` date NOT NULL,
  `CustomerName` varchar(225) NOT NULL,
  `QtyRequired` int(11) NOT NULL,
  `QtyIssued` int(11) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactiontbl`
--

INSERT INTO `transactiontbl` (`SalesID`, `PaperTypeCode`, `SupplyDate`, `CustomerName`, `QtyRequired`, `QtyIssued`, `Total`) VALUES
(1, 2, '2026-10-24', 'Bhavna', 2, 3, 750),
(2, 2, '2026-10-24', 'Bhavna', 2, 3, 750),
(3, 2, '2026-10-10', 'Ragav', 3, 5, 1250),
(4, 2, '2026-10-10', 'Ragav', 3, 5, 1250),
(5, 3, '2026-10-09', 'Pooja', 3, 4, 1200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactiontbl`
--
ALTER TABLE `transactiontbl`
  ADD PRIMARY KEY (`SalesID`),
  ADD KEY `PaperTypeCode` (`PaperTypeCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactiontbl`
--
ALTER TABLE `transactiontbl`
  MODIFY `SalesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactiontbl`
--
ALTER TABLE `transactiontbl`
  ADD CONSTRAINT `transactiontbl_ibfk_1` FOREIGN KEY (`PaperTypeCode`) REFERENCES `mst_tbl` (`PaperTypeCode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
