-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2026 at 01:52 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id` int NOT NULL,
  `id_penulis` int NOT NULL,
  `id_kategori` int NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari_tanggal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `id_penulis`, `id_kategori`, `judul`, `isi`, `gambar`, `hari_tanggal`) VALUES
(1, 1, 1, 'Semangkuk Keberhasilan', 'Menceritakan seorang pria yang berjuang keras hingga akhirnya berhasil mendapatkan pekerjaan impiannya. Kisah ini mengingatkan bahwa proses tidak pernah mengkhianati hasil. Dukungan keluarga menjadi bahan bakar yang membuatnya terus melangkah.', '6a24cdd7ef3fa.jpg', 'Senin, 27 April 2026 | 21:07'),
(2, 1, 3, 'Pengenalan Framework Laravel untuk Pemula', 'Laravel merupakan framework PHP modern yang menyediakan berbagai fitur seperti routing, middleware, ORM Eloquent, autentikasi, dan template Blade. Framework ini membantu pengembang membangun aplikasi web secara lebih cepat dan terstruktur. Bagi pemula, Laravel menawarkan dokumentasi yang lengkap dan komunitas yang besar.', '6a24cd3deea74.jpg', 'Selasa, 28 April 2026 | 09:15'),
(3, 1, 3, 'Memahami Konsep MVC dalam Pengembangan Web', 'MVC merupakan pola arsitektur perangkat lunak yang memisahkan model, view, dan controller sehingga kode menjadi lebih rapi, mudah dipelihara, dan mudah dikembangkan. Model mengurus data, view menangani tampilan, dan controller menjadi penghubung keduanya. Pemisahan ini membuat proyek besar lebih mudah dikelola.', '6a24cd2988873.jpg', 'Rabu, 29 April 2026 | 10:30'),
(4, 1, 3, 'Eloquent ORM dan Relasi Antar Tabel di Laravel', 'Eloquent ORM memungkinkan pengembang melakukan interaksi dengan database menggunakan sintaks yang sederhana dan elegan tanpa harus menulis query SQL yang kompleks. Relasi seperti hasMany dan belongsTo memudahkan pengambilan data antar tabel. Dengan eager loading, performa aplikasi pun tetap terjaga.', '6a24cd1dc8c28.jpg', 'Kamis, 30 April 2026 | 13:45'),
(5, 1, 3, 'Blade Template Engine di Laravel', 'Blade adalah template engine bawaan Laravel yang ringan namun powerful. Dengan directive seperti extends, section, dan yield, tampilan dapat diwarisi sehingga tidak ada duplikasi kode HTML. Blade juga mendukung komponen dan perulangan yang membuat penulisan view lebih bersih.', '6a24cd1391172.jpg', 'Jumat, 1 Mei 2026 | 08:20'),
(6, 1, 3, 'Middleware dan Autentikasi di Laravel', 'Middleware bertugas menyaring request sebelum mencapai controller, misalnya memastikan pengguna sudah login. Laravel menyediakan middleware auth dan guest yang siap pakai untuk mengamankan halaman. Dengan kombinasi keduanya, area admin terlindungi sementara halaman publik tetap dapat diakses siapa saja.', '6a24cd078f3ff.jpg', 'Sabtu, 2 Mei 2026 | 16:05'),
(7, 1, 2, 'Tren Teknologi Web di Tahun 2026', 'Tahun 2026 menandai semakin matangnya teknologi web mulai dari kecerdasan buatan hingga aplikasi berbasis edge. Pengembang dituntut adaptif terhadap perubahan yang cepat. Memahami tren membantu kita memilih alat yang tepat untuk setiap kebutuhan proyek.', '6a24cdb46db42.jpg', 'Minggu, 3 Mei 2026 | 11:00'),
(8, 1, 2, 'Mengenal API dan Arsitektur REST', 'API menjadi jembatan komunikasi antar aplikasi yang berbeda. Arsitektur REST mengatur bagaimana sumber daya diakses melalui metode HTTP seperti GET dan POST. Dengan API yang dirancang baik, integrasi antar sistem menjadi lebih mudah dan terstandar.', '6a24cdac177db.jpg', 'Senin, 4 Mei 2026 | 14:25'),
(9, 1, 4, 'Cara Deploy Aplikasi Laravel ke Hosting', 'Men-deploy aplikasi Laravel meliputi langkah menyiapkan server, mengunggah kode, mengatur file env, dan menjalankan migrasi. Pastikan permission folder storage benar agar aplikasi berjalan lancar. Setelah konfigurasi selesai, aplikasi siap diakses publik melalui domain.', '6a24cd8c30be2.jpg', 'Selasa, 5 Mei 2026 | 19:40'),
(10, 1, 5, 'Tips Menulis Kode yang Rapi dan Mudah Dibaca', 'Kode yang rapi memudahkan diri sendiri maupun orang lain saat memeliharanya. Gunakan nama variabel yang bermakna, pisahkan logika menjadi fungsi kecil, dan beri komentar seperlunya. Konsistensi gaya penulisan membuat proyek terasa profesional.', '6a24cd691eb79.jpg', 'Rabu, 6 Mei 2026 | 07:50');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_artikel`
--

CREATE TABLE `kategori_artikel` (
  `id` int NOT NULL,
  `nama_kategori` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_artikel`
--

INSERT INTO `kategori_artikel` (`id`, `nama_kategori`, `keterangan`) VALUES
(1, 'Family', 'Menceritakan kisah keluarga'),
(2, 'Teknologi', 'Perkembangan teknologi terkini'),
(3, 'Pemrograman', 'Artikel seputar pemrograman dan framework'),
(4, 'Tutorial', 'Panduan dan langkah praktis'),
(5, 'Tips & Trick', 'Kiat singkat yang berguna');

-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE `penulis` (
  `id` int NOT NULL,
  `nama_depan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penulis`
--

INSERT INTO `penulis` (`id`, `nama_depan`, `nama_belakang`, `user_name`, `password`, `foto`) VALUES
(1, 'Yusuf', 'Kusuma', 'ninakusuma_', '$2y$10$gLPfoCEKLbIdriIEFrXWeuPfBckni.i7zoKzID2fz0011tEdqQC1G', 'penulis_69ef6c6f8da710.03744227.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_artikel_penulis` (`id_penulis`),
  ADD KEY `fk_artikel_kategori` (`id_kategori`);

--
-- Indexes for table `kategori_artikel`
--
ALTER TABLE `kategori_artikel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_nama_kategori` (`nama_kategori`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kategori_artikel`
--
ALTER TABLE `kategori_artikel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artikel`
--
ALTER TABLE `artikel`
  ADD CONSTRAINT `fk_artikel_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_artikel` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_artikel_penulis` FOREIGN KEY (`id_penulis`) REFERENCES `penulis` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
