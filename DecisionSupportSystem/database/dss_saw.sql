-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2025 at 10:34 AM
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
-- Database: `dss_saw`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `nama_alternatif` varchar(35) NOT NULL,
  `hasil_alternatif` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `nama_alternatif`, `hasil_alternatif`) VALUES
(12, 'DENI (TIF)', 49.5),
(13, 'SOKID (TIF)', 62.5),
(14, 'ISKANDAR (TIF)', 44.5),
(15, 'SUGIYANTO (TIF)', 48),
(16, 'MAKSUDI (TIF)', 75.5),
(17, 'KHAIRUL ANWARUDIN (TIF)', 44.5),
(18, 'MUHAMAD IMAM (TIF)', 44.5),
(19, 'GUNADI DWI HANTORO (TIF)', 60.5),
(20, 'SABAR SANTOSO (TIF)', 68.5),
(21, 'LUKMAN NURHAKIM (TIF)', 49.5),
(22, 'Ferli (MANAJEMEN)', 100),
(23, 'HARRY GUNAWAN (TIF)', 86);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `nama_kriteria` varchar(35) NOT NULL,
  `tipe_kriteria` varchar(35) NOT NULL,
  `bobot_kriteria` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`, `tipe_kriteria`, `bobot_kriteria`) VALUES
(16, 'Pengajaran', 'benefit', 30),
(17, 'Penelitian', 'benefit', 40),
(21, 'Pengabdian', 'benefit', 20),
(22, 'Keaktifan', 'benefit', 10);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_kriteria`
--

CREATE TABLE `nilai_kriteria` (
  `id_nilai_kriteria` int(11) NOT NULL,
  `ket_nilai_kriteria` varchar(35) NOT NULL,
  `jum_nilai_kriteria` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_kriteria`
--

INSERT INTO `nilai_kriteria` (`id_nilai_kriteria`, `ket_nilai_kriteria`, `jum_nilai_kriteria`) VALUES
(14, 'Pengajaran', 30),
(15, 'Penelitian', 40),
(16, 'Pengabdian', 20),
(17, 'Keaktifan', 10);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_subkriteria`
--

CREATE TABLE `nilai_subkriteria` (
  `id_nilai_subkriteria` int(11) NOT NULL,
  `ket_nilai_subkriteria` varchar(100) NOT NULL,
  `jum_nilai_subkriteria` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_subkriteria`
--

INSERT INTO `nilai_subkriteria` (`id_nilai_subkriteria`, `ket_nilai_subkriteria`, `jum_nilai_subkriteria`) VALUES
(35, 'Penelitian | > 6 Publikasi', 5),
(36, 'Penelitian | 4–5 Publikasi', 4),
(37, 'Penelitian | 2–3 Publikasi', 3),
(38, 'Penelitian | 1 Publikasi', 2),
(39, 'Penelitian | Tidak Ada Publikasi', 1),
(55, 'Pengabdian | Tidak pernah menjadi pembicara selama setahun', 1),
(56, 'Pengabdian | Menjadi pembicara 1 kali dalam setahun', 2),
(57, 'Pengabdian | Menjadi pembicara 2–3 kali dalam setahun', 3),
(58, 'Pengabdian | Menjadi pembicara 4–5 kali dalam setahun', 4),
(59, 'Pengabdian | Menjadi pembicara > 6 kali dalam setahun', 5),
(60, 'Keaktifan | Mengikuti > 5 kegiatan per tahun', 4),
(61, 'Keaktifan | Mengikuti 3–4 kegiatan per tahun', 3),
(62, 'Keaktifan | Mengikuti 1-2 kegiatan per tahun', 2),
(63, 'Keaktifan | Tidak pernah mengikuti kegiatan', 1),
(64, 'Pengajaran | > 14 Pertemuan', 5),
(65, 'Pengajaran | 13-10 Pertemuan', 4),
(66, 'Pengajaran | 9-6 Pertemuan', 3),
(67, 'Pengajaran | 5-4 Pertemuan', 2),
(68, 'Pengajaran | 3-0 Pertemuan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rangking`
--

CREATE TABLE `rangking` (
  `id_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai_rangking` double DEFAULT NULL,
  `nilai_normalisasi` double DEFAULT NULL,
  `bobot_normalisasi` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rangking`
--

INSERT INTO `rangking` (`id_alternatif`, `id_kriteria`, `nilai_rangking`, `nilai_normalisasi`, `bobot_normalisasi`) VALUES
(12, 16, 4, 0.8, 24),
(12, 17, 1, 0.2, 8),
(12, 21, 2, 0.5, 10),
(12, 22, 3, 0.75, 7.5),
(13, 16, 4, 0.8, 24),
(13, 17, 2, 0.4, 16),
(13, 21, 3, 0.75, 15),
(13, 22, 3, 0.75, 7.5),
(14, 16, 4, 0.8, 24),
(14, 17, 1, 0.2, 8),
(14, 21, 1, 0.25, 5),
(14, 22, 3, 0.75, 7.5),
(15, 16, 5, 1, 30),
(15, 17, 1, 0.2, 8),
(15, 21, 1, 0.25, 5),
(15, 22, 2, 0.5, 5),
(16, 16, 4, 0.8, 24),
(16, 17, 3, 0.6, 24),
(16, 21, 4, 1, 20),
(16, 22, 3, 0.75, 7.5),
(17, 16, 4, 0.8, 24),
(17, 17, 1, 0.2, 8),
(17, 21, 1, 0.25, 5),
(17, 22, 3, 0.75, 7.5),
(18, 16, 4, 0.8, 24),
(18, 17, 1, 0.2, 8),
(18, 21, 1, 0.25, 5),
(18, 22, 3, 0.75, 7.5),
(19, 16, 5, 1, 30),
(19, 17, 1, 0.2, 8),
(19, 21, 3, 0.75, 15),
(19, 22, 3, 0.75, 7.5),
(20, 16, 4, 0.8, 24),
(20, 17, 4, 0.8, 32),
(20, 21, 1, 0.25, 5),
(20, 22, 3, 0.75, 7.5),
(21, 16, 4, 0.8, 24),
(21, 17, 1, 0.2, 8),
(21, 21, 2, 0.5, 10),
(21, 22, 3, 0.75, 7.5),
(22, 16, 5, 1, 30),
(22, 17, 5, 1, 40),
(22, 21, 4, 1, 20),
(22, 22, 4, 1, 10),
(23, 16, 4, 0.8, 24),
(23, 17, 4, 0.8, 32),
(23, 21, 4, 1, 20),
(23, 22, 4, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','pimpinan') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2y$10$83GUD0YkArwf00ZljOMHuuDIhb8UofRnCmmXty6xsscdWvBmQBY5a', 'admin'),
(2, 'pimpinan', '$2y$10$83GUD0YkArwf00ZljOMHuuDIhb8UofRnCmmXty6xsscdWvBmQBY5a', 'pimpinan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD PRIMARY KEY (`id_nilai_kriteria`);

--
-- Indexes for table `nilai_subkriteria`
--
ALTER TABLE `nilai_subkriteria`
  ADD PRIMARY KEY (`id_nilai_subkriteria`);

--
-- Indexes for table `rangking`
--
ALTER TABLE `rangking`
  ADD PRIMARY KEY (`id_alternatif`,`id_kriteria`),
  ADD KEY `foreign2` (`id_kriteria`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  MODIFY `id_nilai_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `nilai_subkriteria`
--
ALTER TABLE `nilai_subkriteria`
  MODIFY `id_nilai_subkriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rangking`
--
ALTER TABLE `rangking`
  ADD CONSTRAINT `foreign1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`),
  ADD CONSTRAINT `foreign2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
