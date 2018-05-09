-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2018 at 08:51 AM
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
-- Table structure for table `tabel_detail_transaksi`
--

CREATE TABLE `tabel_detail_transaksi` (
  `id_detail` varchar(10) NOT NULL,
  `no_transaksi` int(20) NOT NULL,
  `id_roti` varchar(10) NOT NULL,
  `nama_roti` varchar(30) NOT NULL,
  `harga` int(6) NOT NULL,
  `jumlah_roti` int(4) NOT NULL,
  `harga_jual` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pegawai`
--

CREATE TABLE `tabel_pegawai` (
  `id_pegawai` varchar(10) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pesanan`
--

CREATE TABLE `tabel_pesanan` (
  `id_pesan` varchar(10) NOT NULL,
  `id_roti` varchar(10) NOT NULL,
  `id_sales` varchar(10) NOT NULL,
  `nama_pemesan` varchar(30) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `tgl_ambil` date NOT NULL,
  `jam_ambil` time NOT NULL,
  `jumlah_roti` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_retur`
--

CREATE TABLE `tabel_retur` (
  `id_roti` varchar(10) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `jumlah_roti` int(11) NOT NULL,
  `total_retur` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_roti`
--

CREATE TABLE `tabel_roti` (
  `id_roti` varchar(10) NOT NULL,
  `nama_roti` varchar(30) NOT NULL,
  `harga` int(6) NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_sales`
--

CREATE TABLE `tabel_sales` (
  `id_sales` varchar(5) NOT NULL,
  `nama_sales` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_setoran`
--

CREATE TABLE `tabel_setoran` (
  `id_setoran` varchar(10) NOT NULL,
  `id_sales` varchar(10) NOT NULL,
  `tgl_setoran` datetime NOT NULL,
  `total_jual` int(6) NOT NULL,
  `potongan` int(6) NOT NULL,
  `total_setoran` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_stok_pusat`
--

CREATE TABLE `tabel_stok_pusat` (
  `id_stok_pusat` varchar(10) NOT NULL,
  `id_roti` varchar(10) NOT NULL,
  `tgl_produksi` date NOT NULL,
  `jumlah_stok_pusat` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_stok_sales`
--

CREATE TABLE `tabel_stok_sales` (
  `id_stok_sales` varchar(10) NOT NULL,
  `id_roti` varchar(10) NOT NULL,
  `id_sales` varchar(10) NOT NULL,
  `tgl_ambil` date NOT NULL,
  `jumlah_stok_sales` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi`
--

CREATE TABLE `tabel_transaksi` (
  `no_transaksi` int(20) NOT NULL,
  `id_sales` varchar(10) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `id_setoran` varchar(10) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `total_jual` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `id_roti` (`id_roti`);

--
-- Indexes for table `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tabel_pesanan`
--
ALTER TABLE `tabel_pesanan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `id_sales` (`id_sales`);

--
-- Indexes for table `tabel_retur`
--
ALTER TABLE `tabel_retur`
  ADD KEY `id_roti` (`id_roti`);

--
-- Indexes for table `tabel_roti`
--
ALTER TABLE `tabel_roti`
  ADD PRIMARY KEY (`id_roti`);

--
-- Indexes for table `tabel_sales`
--
ALTER TABLE `tabel_sales`
  ADD PRIMARY KEY (`id_sales`);

--
-- Indexes for table `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  ADD PRIMARY KEY (`id_setoran`),
  ADD KEY `id_sales` (`id_sales`);

--
-- Indexes for table `tabel_stok_pusat`
--
ALTER TABLE `tabel_stok_pusat`
  ADD PRIMARY KEY (`id_stok_pusat`),
  ADD KEY `id_roti` (`id_roti`);

--
-- Indexes for table `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  ADD PRIMARY KEY (`id_stok_sales`),
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `id_sales` (`id_sales`);

--
-- Indexes for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_setoran` (`id_setoran`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD CONSTRAINT `tabel_detail_transaksi_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_detail_transaksi_ibfk_2` FOREIGN KEY (`no_transaksi`) REFERENCES `tabel_transaksi` (`no_transaksi`);

--
-- Constraints for table `tabel_pesanan`
--
ALTER TABLE `tabel_pesanan`
  ADD CONSTRAINT `tabel_pesanan_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_pesanan_ibfk_2` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`);

--
-- Constraints for table `tabel_retur`
--
ALTER TABLE `tabel_retur`
  ADD CONSTRAINT `tabel_retur_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`);

--
-- Constraints for table `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  ADD CONSTRAINT `tabel_setoran_ibfk_1` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`);

--
-- Constraints for table `tabel_stok_pusat`
--
ALTER TABLE `tabel_stok_pusat`
  ADD CONSTRAINT `tabel_stok_pusat_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`);

--
-- Constraints for table `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  ADD CONSTRAINT `tabel_stok_sales_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`);

--
-- Constraints for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD CONSTRAINT `tabel_transaksi_ibfk_1` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`),
  ADD CONSTRAINT `tabel_transaksi_ibfk_2` FOREIGN KEY (`id_setoran`) REFERENCES `tabel_setoran` (`id_setoran`),
  ADD CONSTRAINT `tabel_transaksi_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `tabel_pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
