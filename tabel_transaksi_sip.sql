-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2018 at 04:19 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rotisip`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi_sip`
--

CREATE TABLE `tabel_transaksi_sip` (
  `no_transaksi` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_jual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_transaksi_sip`
--

INSERT INTO `tabel_transaksi_sip` (`no_transaksi`, `id_pegawai`, `tgl_transaksi`, `total_jual`) VALUES
(2, 1, '2018-06-04', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_transaksi_sip`
--
ALTER TABLE `tabel_transaksi_sip`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_transaksi_sip`
--
ALTER TABLE `tabel_transaksi_sip`
  ADD CONSTRAINT `tabel_transaksi_sip_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tabel_pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
