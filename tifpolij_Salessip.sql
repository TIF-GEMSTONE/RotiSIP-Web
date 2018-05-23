-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 23, 2018 at 01:58 AM
-- Server version: 10.0.35-MariaDB
-- PHP Version: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tifpolij_Salessip`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_data`
--

CREATE TABLE `app_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `total_dl` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rating` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `icon` varchar(120) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_data`
--

INSERT INTO `app_data` (`id`, `app_title`, `total_dl`, `rating`, `icon`) VALUES
(1, 'Facebook', 20099099, 5, 'facebook'),
(2, 'Twitter', 11342099, 5, 'twitter'),
(3, 'Google +', 10123023, 4, 'google'),
(4, 'Whatsapp', 10033876, 3, 'whatsapp'),
(5, 'Youtube', 10023444, 4, 'youtube'),
(6, 'Line', 9023434, 5, 'line'),
(7, 'Kakao Talk', 8247836, 3, 'kakao'),
(8, 'Linked In', 784736, 4, 'linkedin'),
(9, 'Angry Bird', 693847, 2, 'angrybird'),
(10, 'Skype', 528374, 3, 'skype');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_detail_pesan`
--

CREATE TABLE `tabel_detail_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `jumlah_roti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_detail_pesan`
--

INSERT INTO `tabel_detail_pesan` (`id_pesan`, `id_roti`, `jumlah_roti`) VALUES
(10, 1, 12),
(11, 1, 12),
(12, 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_detail_sales`
--

CREATE TABLE `tabel_detail_sales` (
  `no_transaksi` int(11) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `jumlah_roti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_detail_sip`
--

CREATE TABLE `tabel_detail_sip` (
  `no_transaksi` int(11) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `jumlah_roti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pegawai`
--

CREATE TABLE `tabel_pegawai` (
  `id_pegawai` int(10) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_pegawai`
--

INSERT INTO `tabel_pegawai` (`id_pegawai`, `nama_pegawai`, `username`, `password`, `level`) VALUES
(1, 'Mukriono', 'admin', 'admin', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pesanan`
--

CREATE TABLE `tabel_pesanan` (
  `id_pesan` int(10) NOT NULL,
  `nama_pemesan` varchar(30) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `jumlah_roti` int(11) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `tgl_ambil` date NOT NULL,
  `jam_ambil` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_pesanan`
--

INSERT INTO `tabel_pesanan` (`id_pesan`, `nama_pemesan`, `no_telp`, `id_roti`, `jumlah_roti`, `tgl_pesan`, `tgl_ambil`, `jam_ambil`) VALUES
(11, 'qqwe', '123', 1, 12, '2018-05-10', '2018-05-17', '12:21:00'),
(12, 'rezhi', '1234567890', 1, 23, '2018-05-23', '2018-05-24', '12:12:00');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_retur`
--

CREATE TABLE `tabel_retur` (
  `id_roti` int(10) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `jumlah_roti` int(11) NOT NULL,
  `total_retur` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_roti`
--

CREATE TABLE `tabel_roti` (
  `id_roti` int(10) NOT NULL,
  `nama_roti` varchar(30) NOT NULL,
  `harga` int(6) NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_roti`
--

INSERT INTO `tabel_roti` (`id_roti`, `nama_roti`, `harga`, `gambar`) VALUES
(1, 'Roti Pisang', 3000, 'roti_pisang.jpg'),
(2, 'Roti Keju', 3500, 'roti_keju.jpg'),
(3, 'Roti Coklat', 3500, 'roti_coklat.jpg'),
(4, 'Roti Sisir', 8000, 'roti_sisir.jgp'),
(5, 'Roti Kenong', 9000, 'roti_kenong.jpg'),
(6, 'Roti Sobek', 8500, 'roti_sobek.jpg'),
(7, 'Roti Tawar', 10000, 'roti_tawar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_sales`
--

CREATE TABLE `tabel_sales` (
  `id_sales` int(10) NOT NULL,
  `nama_sales` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_sales`
--

INSERT INTO `tabel_sales` (`id_sales`, `nama_sales`, `alamat`, `no_telp`, `username`, `password`) VALUES
(10001, 'Fahim Alfiyan', 'Jl Mastrip Sumbersari Jember', '085736795247', 'yans', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_setoran`
--

CREATE TABLE `tabel_setoran` (
  `id_setoran` int(10) NOT NULL,
  `id_sales` int(10) NOT NULL,
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
  `id_stok_pusat` int(10) NOT NULL,
  `id_roti` int(10) NOT NULL,
  `tgl_produksi` date NOT NULL,
  `jumlah_stok_pusat` int(4) NOT NULL,
  `dibeli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_stok_pusat`
--

INSERT INTO `tabel_stok_pusat` (`id_stok_pusat`, `id_roti`, `tgl_produksi`, `jumlah_stok_pusat`, `dibeli`) VALUES
(20001, 1, '2018-05-20', 75, 25);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_stok_sales`
--

CREATE TABLE `tabel_stok_sales` (
  `id_stok_sales` int(10) NOT NULL,
  `id_stok_pusat` int(10) NOT NULL,
  `id_roti` int(10) NOT NULL,
  `id_sales` int(10) NOT NULL,
  `tgl_ambil` date NOT NULL,
  `jumlah_stok_sales` int(4) NOT NULL,
  `dibeli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_stok_sales`
--

INSERT INTO `tabel_stok_sales` (`id_stok_sales`, `id_stok_pusat`, `id_roti`, `id_sales`, `tgl_ambil`, `jumlah_stok_sales`, `dibeli`) VALUES
(30001, 20001, 1, 10001, '2018-05-20', 21, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi_sales`
--

CREATE TABLE `tabel_transaksi_sales` (
  `no_transaksi` int(11) NOT NULL,
  `id_sales` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi_sip`
--

CREATE TABLE `tabel_transaksi_sip` (
  `no_transaksi` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_data`
--
ALTER TABLE `app_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabel_detail_pesan`
--
ALTER TABLE `tabel_detail_pesan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_roti` (`id_roti`);

--
-- Indexes for table `tabel_detail_sales`
--
ALTER TABLE `tabel_detail_sales`
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `no_transaksi` (`no_transaksi`);

--
-- Indexes for table `tabel_detail_sip`
--
ALTER TABLE `tabel_detail_sip`
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `no_transaksi` (`no_transaksi`);

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
  ADD KEY `id_roti` (`id_roti`);

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
  ADD KEY `id_roti` (`id_stok_pusat`),
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_roti_2` (`id_roti`),
  ADD KEY `id_roti_3` (`id_roti`);

--
-- Indexes for table `tabel_transaksi_sales`
--
ALTER TABLE `tabel_transaksi_sales`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_sales` (`id_sales`);

--
-- Indexes for table `tabel_transaksi_sip`
--
ALTER TABLE `tabel_transaksi_sip`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_data`
--
ALTER TABLE `app_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tabel_detail_pesan`
--
ALTER TABLE `tabel_detail_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  MODIFY `id_pegawai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tabel_pesanan`
--
ALTER TABLE `tabel_pesanan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tabel_roti`
--
ALTER TABLE `tabel_roti`
  MODIFY `id_roti` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tabel_sales`
--
ALTER TABLE `tabel_sales`
  MODIFY `id_sales` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10002;

--
-- AUTO_INCREMENT for table `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  MODIFY `id_setoran` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabel_stok_pusat`
--
ALTER TABLE `tabel_stok_pusat`
  MODIFY `id_stok_pusat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20002;

--
-- AUTO_INCREMENT for table `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  MODIFY `id_stok_sales` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30002;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_detail_pesan`
--
ALTER TABLE `tabel_detail_pesan`
  ADD CONSTRAINT `tabel_detail_pesan_ibfk_2` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`);

--
-- Constraints for table `tabel_detail_sales`
--
ALTER TABLE `tabel_detail_sales`
  ADD CONSTRAINT `tabel_detail_sales_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`);

--
-- Constraints for table `tabel_pesanan`
--
ALTER TABLE `tabel_pesanan`
  ADD CONSTRAINT `tabel_pesanan_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`);

--
-- Constraints for table `tabel_retur`
--
ALTER TABLE `tabel_retur`
  ADD CONSTRAINT `tabel_retur_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  ADD CONSTRAINT `tabel_setoran_ibfk_1` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tabel_stok_pusat`
--
ALTER TABLE `tabel_stok_pusat`
  ADD CONSTRAINT `tabel_stok_pusat_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  ADD CONSTRAINT `tabel_stok_sales_ibfk_1` FOREIGN KEY (`id_stok_pusat`) REFERENCES `tabel_stok_pusat` (`id_stok_pusat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabel_stok_sales_ibfk_2` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tabel_transaksi_sales`
--
ALTER TABLE `tabel_transaksi_sales`
  ADD CONSTRAINT `tabel_transaksi_sales_ibfk_1` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`);

--
-- Constraints for table `tabel_transaksi_sip`
--
ALTER TABLE `tabel_transaksi_sip`
  ADD CONSTRAINT `tabel_transaksi_sip_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tabel_pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
