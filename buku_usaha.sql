-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jan 2023 pada 09.13
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buku_usaha`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `user_id`, `nama_kategori`) VALUES
(48, 24, 'Makanan'),
(49, 24, 'Minuman'),
(50, 24, 'Snack'),
(51, 25, 'Makanan'),
(52, 25, 'Minuman'),
(53, 24, 'Rumah Tangga'),
(54, 24, 'Atk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `produk_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `total_beli` decimal(10,0) NOT NULL,
  `tanggal_beli` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `produk_name`, `user_id`, `unit`, `total_beli`, `tanggal_beli`) VALUES
(34, 'Indomi Goreng', 24, 10, '25000', '2022-12-20'),
(35, 'Kripik Kentang', 24, 25, '500000', '2022-12-20'),
(36, 'Beras', 24, 12, '180000', '2022-12-21'),
(37, 'Brambang', 24, 24, '480000', '2022-12-21'),
(38, 'Beras', 24, 14, '210000', '2023-01-03'),
(39, 'KENTANG GORENG', 24, 14, '280000', '2023-01-03'),
(40, 'Kg', 24, 7, '91000', '2023-01-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `produk_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `total_untung` int(11) NOT NULL,
  `tanggal_jual` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `produk_name`, `user_id`, `unit`, `total_untung`, `tanggal_jual`) VALUES
(26, 'Kripik Kentang', 24, 2, 10000, '2022-12-20'),
(27, 'Kripik Kentang', 24, 1, 5000, '2023-01-03'),
(28, 'Beras', 24, 3, 15000, '2023-01-03');

--
-- Trigger `penjualan`
--
DELIMITER $$
CREATE TRIGGER `Update_Stok` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN
UPDATE produk SET stock = stock-NEW.unit
WHERE nama_produk = NEW.produk_name;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `satuan` varchar(120) NOT NULL,
  `hrg_beli` decimal(10,0) NOT NULL,
  `hrg_jual` decimal(10,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `kategori_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `satuan`, `hrg_beli`, `hrg_jual`, `stock`, `kategori_name`, `user_id`) VALUES
(52, 'Kripik Kentang', 'bungkus', '20000', '25000', 22, 'Snack', 24),
(53, 'Indomi Goreng', 'Buah', '2500', '3500', 10, 'Makanan', 24),
(54, 'Brambang', 'kg', '20000', '25000', 24, 'Makanan', 24),
(55, 'Beras', 'Bungkus', '15000', '20000', 23, 'Makanan', 24),
(56, 'KENTANG GORENG', 'kg', '20000', '25000', 14, 'Snack', 24),
(57, 'Gula', 'Kg', '13000', '15000', 7, 'Makanan', 24);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_username` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `namaUsaha` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_username`, `username`, `namaUsaha`, `password`) VALUES
(23, 'firdaus', 'Firdaus Speaker', '$2y$10$HuBsAuA/bYgJ4zE2SfZTR.I1E8jOeAGKLUUU1qaCxRfc2sNBvbJK2'),
(24, 'nusambatu', 'Nusambatu Berkah', '$2y$10$MNxjSq1TV0aYSDd5wwX0w.nVBuGzCvdT6vLSv2RONM272kxR82gdy'),
(25, 'dalbo', 'restu ibu', '$2y$10$7mSOOl/U/jSomLzwao5V9ug92nDCeF2YJFvEmhObCRoz0w88MMI6i');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_username` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
