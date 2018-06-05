-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 05 Jun 2018 pada 01.47
-- Versi server: 10.0.35-MariaDB
-- Versi PHP: 7.1.18

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
-- Struktur dari tabel `app_data`
--

CREATE TABLE `app_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `total_dl` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rating` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `icon` varchar(120) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `app_data`
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
-- Struktur dari tabel `tabel_detail_pesan`
--

CREATE TABLE `tabel_detail_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `jumlah_roti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_detail_sales`
--

CREATE TABLE `tabel_detail_sales` (
  `no_transaksi` int(11) NOT NULL,
  `id_stok_sales` int(11) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `jumlah_roti` int(11) NOT NULL,
  `sub_total_sales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tabel_detail_sales`
--

INSERT INTO `tabel_detail_sales` (`no_transaksi`, `id_stok_sales`, `id_roti`, `jumlah_roti`, `sub_total_sales`) VALUES
(13001, 12001, 70001, 3, 9000),
(13001, 12002, 70002, 2, 7000),
(13002, 12001, 70001, 3, 9000),
(13003, 12008, 70004, 2, 16000),
(13003, 12009, 70005, 1, 9000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_detail_sip`
--

CREATE TABLE `tabel_detail_sip` (
  `no_transaksi` int(11) NOT NULL,
  `id_roti` int(11) NOT NULL,
  `id_stok_pusat` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `tabel_detail_sip`
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
-- Struktur dari tabel `tabel_pegawai`
--

CREATE TABLE `tabel_pegawai` (
  `id_pegawai` int(10) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tabel_pegawai`
--

INSERT INTO `tabel_pegawai` (`id_pegawai`, `nama_pegawai`, `username`, `password`, `level`) VALUES
(40001, 'Mukriono', 'admin', 'admin', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_pesanan`
--

CREATE TABLE `tabel_pesanan` (
  `id_pesan` int(10) NOT NULL,
  `id_roti` int(11) DEFAULT NULL,
  `id_sales` int(11) DEFAULT NULL,
  `nama_pemesan` varchar(30) NOT NULL,
  `no_telp` int(13) NOT NULL,
  `jumlah_roti` int(11) NOT NULL,
  `tgl_pesan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_ambil` date DEFAULT NULL,
  `jam_ambil` time DEFAULT NULL,
  `alamat_antar` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tabel_pesanan`
--

INSERT INTO `tabel_pesanan` (`id_pesan`, `id_roti`, `id_sales`, `nama_pemesan`, `no_telp`, `jumlah_roti`, `tgl_pesan`, `tgl_ambil`, `jam_ambil`, `alamat_antar`) VALUES
(50001, 70001, 80001, 'Diana', 2147483647, 50, '2018-06-04 09:31:09', '2018-06-07', NULL, 'Mastrip'),
(50002, 70002, 80001, 'Azizah', 2147483647, 75, '2018-06-04 09:31:09', '2018-06-08', NULL, 'Kalimantan'),
(50014, 70002, 80001, 'Kiki', 2147483647, 56, '2018-06-04 18:58:13', '2018-06-10', NULL, 'Mastrip'),
(50019, 70006, 80001, 'Jenny', 2147483647, 15, '2018-06-04 19:23:28', '2018-06-13', NULL, 'Rambi Puji');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_retur`
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
-- Trigger `tabel_retur`
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
-- Struktur dari tabel `tabel_roti`
--

CREATE TABLE `tabel_roti` (
  `id_roti` int(10) NOT NULL,
  `nama_roti` varchar(30) NOT NULL,
  `harga` int(6) NOT NULL,
  `gambar` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tabel_roti`
--

INSERT INTO `tabel_roti` (`id_roti`, `nama_roti`, `harga`, `gambar`) VALUES
(70001, 'Roti Pisang', 3000, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotipisang.jpg'),
(70002, 'Roti Keju', 3500, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotikeju.jpg'),
(70003, 'Roti Coklat', 3500, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/roticoklat.jpg'),
(70004, 'Roti Sisir', 8000, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotisisir.jpg'),
(70005, 'Roti Kenong', 9000, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotikenong.jpg'),
(70006, 'Roti Sobek', 8500, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotisobek.jpg'),
(70007, 'Roti Tawar', 10000, 'https://raw.githubusercontent.com/TIF-GEMSTONE/RotiSIP/master/images/rotitawar.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_sales`
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
-- Dumping data untuk tabel `tabel_sales`
--

INSERT INTO `tabel_sales` (`id_sales`, `nama_sales`, `alamat`, `no_telp`, `username`, `password`) VALUES
(80001, 'Fahim Alfiyan', 'Jl Mastrip Sumbersari Jember', '085736795247', 'yans', '1234'),
(80002, 'Rizky Nur Faqih', 'Patrang Jember', '089649014795', 'faqih', '12345');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_setoran`
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
-- Dumping data untuk tabel `tabel_setoran`
--

INSERT INTO `tabel_setoran` (`id_setoran`, `id_sales`, `tgl_setoran`, `total_jual`, `potongan`, `total_setoran`) VALUES
(90001, 80001, '2018-06-04 00:00:00', 25000, 5000, 20000),
(90002, 80002, '2018-06-05 00:00:00', 25000, 5000, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_stok_pusat`
--

CREATE TABLE `tabel_stok_pusat` (
  `id_stok_pusat` int(10) NOT NULL,
  `id_roti` int(10) NOT NULL,
  `tgl_produksi` date NOT NULL,
  `jumlah_stok_pusat` int(4) NOT NULL,
  `dibeli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tabel_stok_pusat`
--

INSERT INTO `tabel_stok_pusat` (`id_stok_pusat`, `id_roti`, `tgl_produksi`, `jumlah_stok_pusat`, `dibeli`) VALUES
(11001, 70001, '2018-06-04', 20, 50),
(11002, 70002, '2018-06-04', 5, 50),
(11003, 70003, '2018-06-04', 105, 35),
(11004, 70004, '2018-06-04', 40, 25),
(11005, 70005, '2018-06-04', 55, 50),
(11006, 70006, '2018-06-04', 130, 50),
(11007, 70007, '2018-06-04', 175, 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_stok_sales`
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
-- Dumping data untuk tabel `tabel_stok_sales`
--

INSERT INTO `tabel_stok_sales` (`id_stok_sales`, `id_stok_pusat`, `id_roti`, `id_sales`, `tgl_ambil`, `jumlah_stok_sales`, `dibeli`) VALUES
(12001, 11001, 70001, 80001, '2018-06-04', 40, 10),
(12002, 11002, 70002, 80001, '2018-06-04', 55, 15),
(12003, 11003, 70003, 80001, '2018-06-04', 20, 5),
(12004, 11004, 70004, 80001, '2018-06-04', 25, 3),
(12005, 11005, 70005, 80001, '2018-06-04', 20, 0),
(12006, 11006, 70006, 80001, '2018-06-04', 20, 1),
(12007, 11007, 70007, 80001, '2018-06-04', 25, 5),
(12008, 11004, 70004, 80002, '2018-06-04', 10, 5),
(12009, 11005, 70005, 80002, '2018-06-04', 25, 6);

--
-- Trigger `tabel_stok_sales`
--
DELIMITER $$
CREATE TRIGGER `T_stok` AFTER INSERT ON `tabel_stok_sales` FOR EACH ROW BEGIN
UPDATE tabel_stok_pusat SET jumlah_stok_pusat=jumlah_stok_pusat-NEW.jumlah_stok_sales
WHERE id_stok_pusat = NEW.id_stok_pusat;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_transaksi_sales`
--

CREATE TABLE `tabel_transaksi_sales` (
  `no_transaksi` int(11) NOT NULL,
  `id_sales` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_sales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tabel_transaksi_sales`
--

INSERT INTO `tabel_transaksi_sales` (`no_transaksi`, `id_sales`, `tgl_transaksi`, `total_sales`) VALUES
(13001, 80001, '2018-06-04', 16000),
(13002, 80001, '2018-06-04', 9000),
(13003, 80002, '2018-06-04', 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_transaksi_sip`
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
-- Dumping data untuk tabel `tabel_transaksi_sip`
--

INSERT INTO `tabel_transaksi_sip` (`no_transaksi`, `id_pegawai`, `tgl_transaksi`, `total_jual`, `uang`, `kembalian`) VALUES
(14001, 40001, '2018-06-04', 190000, 200000, 10000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `app_data`
--
ALTER TABLE `app_data`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tabel_detail_pesan`
--
ALTER TABLE `tabel_detail_pesan`
  ADD KEY `id_pesan` (`id_pesan`),
  ADD KEY `id_roti` (`id_roti`);

--
-- Indeks untuk tabel `tabel_detail_sales`
--
ALTER TABLE `tabel_detail_sales`
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `no_transaksi_2` (`no_transaksi`),
  ADD KEY `id_stok_sales` (`id_stok_sales`);

--
-- Indeks untuk tabel `tabel_detail_sip`
--
ALTER TABLE `tabel_detail_sip`
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `id_stok_pusat` (`id_stok_pusat`),
  ADD KEY `no_transaksi` (`no_transaksi`);

--
-- Indeks untuk tabel `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `tabel_pesanan`
--
ALTER TABLE `tabel_pesanan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `id_sales` (`id_sales`);

--
-- Indeks untuk tabel `tabel_retur`
--
ALTER TABLE `tabel_retur`
  ADD PRIMARY KEY (`id_retur`),
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_roti` (`id_roti`),
  ADD KEY `id_stok_sales` (`id_stok_sales`);

--
-- Indeks untuk tabel `tabel_roti`
--
ALTER TABLE `tabel_roti`
  ADD PRIMARY KEY (`id_roti`);

--
-- Indeks untuk tabel `tabel_sales`
--
ALTER TABLE `tabel_sales`
  ADD PRIMARY KEY (`id_sales`);

--
-- Indeks untuk tabel `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  ADD PRIMARY KEY (`id_setoran`),
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_sales_2` (`id_sales`);

--
-- Indeks untuk tabel `tabel_stok_pusat`
--
ALTER TABLE `tabel_stok_pusat`
  ADD PRIMARY KEY (`id_stok_pusat`),
  ADD KEY `id_roti` (`id_roti`);

--
-- Indeks untuk tabel `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  ADD PRIMARY KEY (`id_stok_sales`),
  ADD KEY `id_roti` (`id_stok_pusat`),
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_roti_2` (`id_roti`),
  ADD KEY `id_roti_3` (`id_roti`);

--
-- Indeks untuk tabel `tabel_transaksi_sales`
--
ALTER TABLE `tabel_transaksi_sales`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_sales` (`id_sales`);

--
-- Indeks untuk tabel `tabel_transaksi_sip`
--
ALTER TABLE `tabel_transaksi_sip`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `app_data`
--
ALTER TABLE `app_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  MODIFY `id_pegawai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40002;

--
-- AUTO_INCREMENT untuk tabel `tabel_pesanan`
--
ALTER TABLE `tabel_pesanan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50020;

--
-- AUTO_INCREMENT untuk tabel `tabel_retur`
--
ALTER TABLE `tabel_retur`
  MODIFY `id_retur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tabel_roti`
--
ALTER TABLE `tabel_roti`
  MODIFY `id_roti` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70009;

--
-- AUTO_INCREMENT untuk tabel `tabel_sales`
--
ALTER TABLE `tabel_sales`
  MODIFY `id_sales` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80003;

--
-- AUTO_INCREMENT untuk tabel `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  MODIFY `id_setoran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90003;

--
-- AUTO_INCREMENT untuk tabel `tabel_stok_pusat`
--
ALTER TABLE `tabel_stok_pusat`
  MODIFY `id_stok_pusat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11008;

--
-- AUTO_INCREMENT untuk tabel `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  MODIFY `id_stok_sales` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12010;

--
-- AUTO_INCREMENT untuk tabel `tabel_transaksi_sales`
--
ALTER TABLE `tabel_transaksi_sales`
  MODIFY `no_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13004;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tabel_detail_pesan`
--
ALTER TABLE `tabel_detail_pesan`
  ADD CONSTRAINT `tabel_detail_pesan_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabel_detail_pesan_ibfk_2` FOREIGN KEY (`id_pesan`) REFERENCES `tabel_pesanan` (`id_pesan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel_detail_sales`
--
ALTER TABLE `tabel_detail_sales`
  ADD CONSTRAINT `tabel_detail_sales_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_detail_sales_ibfk_2` FOREIGN KEY (`id_stok_sales`) REFERENCES `tabel_stok_sales` (`id_stok_sales`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabel_detail_sales_ibfk_3` FOREIGN KEY (`no_transaksi`) REFERENCES `tabel_transaksi_sales` (`no_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel_detail_sip`
--
ALTER TABLE `tabel_detail_sip`
  ADD CONSTRAINT `tabel_detail_sip_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_detail_sip_ibfk_2` FOREIGN KEY (`id_stok_pusat`) REFERENCES `tabel_stok_pusat` (`id_stok_pusat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabel_detail_sip_ibfk_3` FOREIGN KEY (`no_transaksi`) REFERENCES `tabel_transaksi_sip` (`no_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel_pesanan`
--
ALTER TABLE `tabel_pesanan`
  ADD CONSTRAINT `tabel_pesanan_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabel_pesanan_ibfk_2` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel_retur`
--
ALTER TABLE `tabel_retur`
  ADD CONSTRAINT `tabel_retur_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`),
  ADD CONSTRAINT `tabel_retur_ibfk_2` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`),
  ADD CONSTRAINT `tabel_retur_ibfk_3` FOREIGN KEY (`id_stok_sales`) REFERENCES `tabel_stok_sales` (`id_stok_sales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel_setoran`
--
ALTER TABLE `tabel_setoran`
  ADD CONSTRAINT `tabel_setoran_ibfk_1` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel_stok_pusat`
--
ALTER TABLE `tabel_stok_pusat`
  ADD CONSTRAINT `tabel_stok_pusat_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel_stok_sales`
--
ALTER TABLE `tabel_stok_sales`
  ADD CONSTRAINT `tabel_stok_sales_ibfk_1` FOREIGN KEY (`id_stok_pusat`) REFERENCES `tabel_stok_pusat` (`id_stok_pusat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabel_stok_sales_ibfk_2` FOREIGN KEY (`id_roti`) REFERENCES `tabel_roti` (`id_roti`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabel_stok_sales_ibfk_3` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel_transaksi_sales`
--
ALTER TABLE `tabel_transaksi_sales`
  ADD CONSTRAINT `tabel_transaksi_sales_ibfk_2` FOREIGN KEY (`id_sales`) REFERENCES `tabel_sales` (`id_sales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tabel_transaksi_sip`
--
ALTER TABLE `tabel_transaksi_sip`
  ADD CONSTRAINT `tabel_transaksi_sip_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tabel_pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
