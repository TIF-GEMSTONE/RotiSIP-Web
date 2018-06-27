-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2018 at 09:19 AM
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
-- Database: `tifpolij_salessip`
--

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
(32, 70002, 45),
(33, 70001, 23),
(34, 70004, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_detail_sales`
--

CREATE TABLE `tabel_detail_sales` (
  `no_transaksi` int(11) NOT NULL,
  `id_stok_sales` int(11) DEFAULT NULL,
  `id_roti` int(11) DEFAULT NULL,
  `jumlah_roti` int(11) NOT NULL,
  `sub_total_sales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_detail_sales`
--

INSERT INTO `tabel_detail_sales` (`no_transaksi`, `id_stok_sales`, `id_roti`, `jumlah_roti`, `sub_total_sales`) VALUES
(13001, 12001, 70001, 3, 9000),
(13001, 12002, 70002, 2, 7000),
(13002, 12001, 70001, 3, 9000),
(13003, 12008, 70004, 2, 16000),
(13003, 12009, 70005, 1, 9000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_detail_sip`
--

CREATE TABLE `tabel_detail_sip` (
  `no_transaksi` int(11) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `tabel_detail_sip`
--
DELIMITER $$
CREATE TRIGGER `T_sip` AFTER INSERT ON `tabel_detail_sip` FOR EACH ROW BEGIN
UPDATE tabel_stok_pusat SET jumlah_stok_pusat=jumlah_stok_pusat-NEW.jumlah
WHERE id_stok_pusat = NEW.id_stok_pusat;
END
$$
DELIMITER ;

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
(40001, 'Mukriono', 'admin', 'admin', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pesanan`
--

CREATE TABLE `tabel_pesanan` (
  `id_pesan` int(10) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `id_sales` int(11) DEFAULT NULL,
  `nama_pemesan` varchar(30) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `jumlah_roti` int(11) NOT NULL,
  `tgl_pesan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl_ambil` date NOT NULL,
  `jam_ambil` time NOT NULL,
  `alamat_antar` varchar(100) DEFAULT NULL,
  `selesai` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_pesanan`
--

INSERT INTO `tabel_pesanan` (`id_pesan`, `id_roti`, `id_sales`, `nama_pemesan`, `no_telp`, `jumlah_roti`, `tgl_pesan`, `tgl_ambil`, `jam_ambil`, `alamat_antar`, `selesai`) VALUES
(32, 70002, NULL, 'Safira', '08123456789', 45, '2018-06-05 21:46:18', '2018-06-09', '09:00:00', NULL, NULL),
(33, 70001, NULL, 'lala', '23423442', 23, '2018-06-06 01:02:38', '2018-06-06', '00:03:00', NULL, NULL),
(34, 70003, 80001, 'Gigi', '086532164325', 56, '2018-06-06 01:22:13', '2018-06-13', '00:00:00', 'Kaliurang', 1),
(35, 70001, 80001, 'Diana', '086345123641', 5, '2018-06-06 01:22:28', '2018-06-13', '00:00:00', 'Jombang', 1),
(36, 70003, 80001, 'Saiful', '083845633945', 20, '2018-06-06 01:35:17', '2018-06-22', '00:00:00', 'Jl. Nias V no.102', 1),
(37, 70003, 80001, 'Rian', '083552643967', 23, '2018-06-06 01:37:31', '2018-06-14', '00:00:00', 'Jl. Kalimantan no.48', 0),
(38, 70004, NULL, 'lala', '0812345678', 50, '2018-06-06 02:08:20', '2018-06-08', '09:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_retur`
--

CREATE TABLE `tabel_retur` (
  `id_retur` int(11) NOT NULL,
  `id_stok_sales` int(11) NOT NULL,
  `id_sales` int(11) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `jumlah_roti` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_retur`
--

INSERT INTO `tabel_retur` (`id_retur`, `id_stok_sales`, `id_sales`, `id_roti`, `jumlah_roti`, `tgl_kembali`) VALUES
(7, 12007, 80001, 70007, 2, '2018-06-14');

--
-- Triggers `tabel_retur`
--
DELIMITER $$
CREATE TRIGGER `T_retur` AFTER INSERT ON `tabel_retur` FOR EACH ROW BEGIN
UPDATE tabel_stok_sales SET jumlah_stok_sales=jumlah_stok_sales-NEW.jumlah_roti
WHERE id_stok_sales = NEW.id_stok_sales;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_roti`
--

CREATE TABLE `tabel_roti` (
  `id_roti` int(10) NOT NULL,
  `nama_roti` varchar(30) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(6) NOT NULL,
  `gambar` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_roti`
--

INSERT INTO `tabel_roti` (`id_roti`, `nama_roti`, `stok`, `harga`, `gambar`) VALUES
(70001, 'Roti Pisang', 30, 3000, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotipisang.jpg'),
(70002, 'Roti Keju', 530, 3500, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotikeju.jpg'),
(70003, 'Roti Coklat', 30, 3500, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/roticoklat.jpg'),
(70004, 'Roti Sisir', 40, 8000, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotisisir.jpg'),
(70005, 'Roti Kenong', 30, 9000, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotikenong.jpg'),
(70006, 'Roti Sobek', 20, 8500, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotisobek.jpg'),
(70007, 'Roti Tawar', 20, 10000, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotitawar.jpg'),
(70009, 'Roti Strawberry', 20, 2000, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP-Web/master/assets/images/rotistrw.jpg'),
(70010, 'Roti Maryam', 20, 3500, 'cetak.PNG');

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
(80001, 'Fahim Alfiyan', 'Jl Mastrip Sumbersari Jember', '085736795247', 'yans', '12345'),
(80002, 'Rizky Nur Faqih', 'Patrang Jember', '089649014795', 'faqih', '12345'),
(80003, 'Safira Azizah', 'Perum Mastrip', '082233851764', 'safira', '12345'),
(80004, 'anam khoirul', 'surabaya', '1234567890', 'jti', '1234');

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

--
-- Dumping data for table `tabel_setoran`
--

INSERT INTO `tabel_setoran` (`id_setoran`, `id_sales`, `tgl_setoran`, `total_jual`, `potongan`, `total_setoran`) VALUES
(90001, 80001, '2018-06-04 00:00:00', 25000, 5000, 20000),
(90002, 80002, '2018-06-05 00:00:00', 25000, 5000, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_stok_sales`
--

CREATE TABLE `tabel_stok_sales` (
  `id_stok_sales` int(10) NOT NULL,
  `id_roti` int(10) NOT NULL,
  `id_sales` int(10) NOT NULL,
  `tgl_ambil` date NOT NULL,
  `jumlah_stok_sales` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_stok_sales`
--

INSERT INTO `tabel_stok_sales` (`id_stok_sales`, `id_roti`, `id_sales`, `tgl_ambil`, `jumlah_stok_sales`) VALUES
(12001, 70001, 80001, '2018-06-04', 40),
(12002, 70002, 80001, '2018-06-04', 55),
(12003, 70003, 80001, '2018-06-04', 20),
(12004, 70004, 80001, '2018-06-04', 25),
(12005, 70005, 80001, '2018-06-04', 20),
(12006, 70006, 80001, '2018-06-04', 20),
(12007, 70007, 80001, '2018-06-04', 12),
(12008, 70004, 80002, '2018-06-04', 10),
(12009, 70005, 80002, '2018-06-04', 25),
(12010, 70001, 80003, '2018-06-05', 10),
(12011, 70003, 80003, '2018-06-05', 30),
(12012, 70004, 80003, '2018-06-05', 20),
(12013, 70003, 80004, '2018-06-07', 25),
(12014, 70001, 80002, '2018-06-27', 10),
(12015, 70002, 80002, '2018-06-27', 10),
(12016, 70003, 80002, '2018-06-27', 10),
(12017, 70006, 80002, '2018-06-27', 10),
(12018, 70007, 80002, '2018-06-27', 10),
(12019, 70009, 80002, '2018-06-27', 10),
(12020, 70010, 80002, '2018-06-27', 10),
(12021, 70003, 80003, '2018-06-27', 10),
(12022, 70005, 80003, '2018-06-27', 10),
(12023, 70006, 80003, '2018-06-27', 10),
(12024, 70007, 80003, '2018-06-27', 10),
(12025, 70009, 80003, '2018-06-27', 10),
(12026, 70010, 80003, '2018-06-27', 10),
(12027, 70001, 80004, '2018-06-27', 10),
(12028, 70002, 80004, '2018-06-27', 10),
(12029, 70004, 80004, '2018-06-27', 10),
(12030, 70005, 80004, '2018-06-27', 10),
(12031, 70006, 80004, '2018-06-27', 10),
(12032, 70009, 80004, '2018-06-27', 10),
(12033, 70007, 80004, '2018-06-27', 10),
(12034, 70010, 80004, '2018-06-27', 10);

--
-- Triggers `tabel_stok_sales`
--
DELIMITER $$
CREATE TRIGGER `T_stok` AFTER INSERT ON `tabel_stok_sales` FOR EACH ROW BEGIN
UPDATE tabel_roti SET stok=stok-NEW.jumlah_stok_sales
WHERE id_roti = NEW.id_roti;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi_sales`
--

CREATE TABLE `tabel_transaksi_sales` (
  `no_transaksi` int(11) NOT NULL,
  `id_sales` int(11) DEFAULT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_sales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_transaksi_sales`
--

INSERT INTO `tabel_transaksi_sales` (`no_transaksi`, `id_sales`, `tgl_transaksi`, `total_sales`) VALUES
(13001, 80001, '2018-06-04 04:00:00', 16000),
(13002, 80001, '2018-06-04 04:00:00', 9000),
(13003, 80002, '2018-06-04 04:00:00', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi_sip`
--

CREATE TABLE `tabel_transaksi_sip` (
  `no_transaksi` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_jual` double NOT NULL,
  `uang` double NOT NULL,
  `kembalian` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

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
  ADD KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `no_transaksi_2` (`no_transaksi`),
  ADD KEY `id_stok_sales` (`id_stok_sales`);

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
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_roti` (`id_roti`);

--
-- Indexes for table `tabel_retur`
--
ALTER TABLE `tabel_retur`
  ADD PRIMARY KEY (`id_retur`),
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `id_stok_sales` (`id_stok_sales`);

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
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_sales_2` (`id_sales`);

--
-- Indexes for table `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  ADD PRIMARY KEY (`id_stok_sales`),
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
-- AUTO_INCREMENT for table `tabel_detail_pesan`
--
ALTER TABLE `tabel_detail_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  MODIFY `id_pegawai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40002;
--
-- AUTO_INCREMENT for table `tabel_pesanan`
--
ALTER TABLE `tabel_pesanan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `tabel_retur`
--
ALTER TABLE `tabel_retur`
  MODIFY `id_retur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tabel_roti`
--
ALTER TABLE `tabel_roti`
  MODIFY `id_roti` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70011;
--
-- AUTO_INCREMENT for table `tabel_sales`
--
ALTER TABLE `tabel_sales`
  MODIFY `id_sales` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80007;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_detail_pesan`
--
ALTER TABLE `tabel_detail_pesan`
  ADD CONSTRAINT `tabel_detail_pesan_ibfk_1` FOREIGN KEY (`id_pesan`) REFERENCES `tabel_pesanan` (`id_pesan`),
  ADD CONSTRAINT `tabel_detail_pesan_ibfk_2` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`);

--
-- Constraints for table `tabel_detail_sales`
--
ALTER TABLE `tabel_detail_sales`
  ADD CONSTRAINT `tabel_detail_sales_ibfk_1` FOREIGN KEY (`no_transaksi`) REFERENCES `tabel_transaksi_sales` (`no_transaksi`),
  ADD CONSTRAINT `tabel_detail_sales_ibfk_2` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_detail_sales_ibfk_3` FOREIGN KEY (`id_stok_sales`) REFERENCES `tabel_stok_sales` (`id_stok_sales`);

--
-- Constraints for table `tabel_detail_sip`
--
ALTER TABLE `tabel_detail_sip`
  ADD CONSTRAINT `tabel_detail_sip_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_detail_sip_ibfk_2` FOREIGN KEY (`no_transaksi`) REFERENCES `tabel_transaksi_sip` (`no_transaksi`);

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
  ADD CONSTRAINT `tabel_retur_ibfk_1` FOREIGN KEY (`id_stok_sales`) REFERENCES `tabel_stok_sales` (`id_stok_sales`),
  ADD CONSTRAINT `tabel_retur_ibfk_2` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_retur_ibfk_3` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`);

--
-- Constraints for table `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  ADD CONSTRAINT `tabel_setoran_ibfk_1` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`);

--
-- Constraints for table `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  ADD CONSTRAINT `tabel_stok_sales_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_stok_sales_ibfk_2` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`);

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
