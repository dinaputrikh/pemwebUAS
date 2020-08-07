-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2019 at 03:51 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `segar`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`uid`, `pid`, `qty`) VALUES
(100000, 200000, 1),
(100000, 200001, 1),
(100000, 200003, 1);

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `did` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`did`, `name`) VALUES
(300000, 'PT Aqua Golden Mississippi'),
(300001, 'Pristine 8+'),
(300002, 'Super O2'),
(300003, 'Crystalline'),
(300004, 'Club Air Mineral'),
(300005, 'Indomaret'),
(300006, 'Indomaret'),
(300007, 'Minute Maid'),
(300008, 'Mogu-Moguminuman'),
(300009, 'Floridina'),
(300010, 'Nafoura'),
(300011, 'Wong Coco Cin Cau'),
(300012, 'Nutriboost Apple'),
(300013, 'Jele Minuman Beautie Collagen'),
(300014, 'Buavita'),
(300015, 'Fruitamin Minuman Coco Bit'),
(300016, 'Ultra Juice'),
(300017, 'Jelly Shake Minuman Nata De Coco'),
(300018, 'Cocomas Coconut Water Drink'),
(300019, 'My Tea');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `txid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `placed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shipped` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `received` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kecamatan` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinsi` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `shippingfee` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `txid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` decimal(5,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `caption` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `did`, `name`, `type`, `content`, `qty`, `price`, `caption`) VALUES
(200000, 300000, 'Aqua PET', 'bottle', '0.33', 8, '3000.00', 'Kemasan 600ml'),
(200001, 300000, 'Aqua Gelas x 48', 'cup', '0.24', 18, '8000.00', 'Kemasan 1.5 Liter'),
(200002, 300000, 'Aqua Gelas', 'cup', '0.24', 33, '19000.00', 'Kemasan Aqua Galon Kosong'),
(200003, 300000, 'Aqua PET', 'bottle', '1.50', 25, '50000.00', 'Aqua galon baru');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `fname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passhash` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthplace` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kecamatan` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinsi` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joined` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `fname`, `lname`, `gender`, `email`, `username`, `passhash`, `birthplace`, `dob`, `address`, `kecamatan`, `provinsi`, `phone`, `joined`) VALUES
(100000, 'Jana', 'Juni', 'F', NULL, 'jj123', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Jakarta', '2013-10-01', 'Jalan Kuning No. 23', 'Kelapa Dua', 'Tangerang', '08214985782', '2019-05-04 04:33:34');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `user_joins` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
    IF (NEW.joined IS NULL) THEN -- change the isnull check for the default used
        SET NEW.joined = now();
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD KEY `fk_fav_pid` (`pid`),
  ADD KEY `fk_fav_uid` (`uid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`txid`),
  ADD KEY `orders_fk0` (`uid`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_details_fk0` (`txid`),
  ADD KEY `order_details_fk1` (`pid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `products_fk0` (`did`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300020;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `txid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200004;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100001;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `fk_fav_pid` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`),
  ADD CONSTRAINT `fk_fav_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_fk0` FOREIGN KEY (`txid`) REFERENCES `orders` (`txid`),
  ADD CONSTRAINT `order_details_fk1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_fk0` FOREIGN KEY (`did`) REFERENCES `distributor` (`did`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
