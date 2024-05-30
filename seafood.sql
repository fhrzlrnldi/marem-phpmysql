-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2022 at 12:22 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seafood`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilbarang` (`nilai` INT)   BEGIN
    select * from barang where harga_jual > nilai;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(4) NOT NULL,
  `id_jenis` char(2) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `stok_barang` int(11) DEFAULT NULL,
  `berat_barang` varchar(5) DEFAULT NULL,
  `harga_jual` float DEFAULT NULL,
  `gambar_barang` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `id_jenis`, `nama_barang`, `stok_barang`, `berat_barang`, `harga_jual`, `gambar_barang`) VALUES
('BR01', '1', 'Nugget', 11, '1KG', 15000, 'Nugget.jpg'),
('BR02', '2', 'Bola Udang', 10, '2KG', 50000, 'Bolaudang.jpg'),
('BR03', '3', 'Kerang bumbu', 20, '1KG', 20000, 'Kerangbumnbu.jpg'),
('BR04', '4', 'Baso Lobster', 15, '1KG', 23000, 'Basolobster.jpg'),
('BR05', '5', 'Cumi', 30, '1KG', 60000, 'Cumi.jpg'),
('BR06', '6', 'Kepiting', 25, '1KG', 50000, 'Kepiting.jpg'),
('BR07', '7', 'Oyster', 30, '1KG', 80000, 'Oyster.jpg'),
('BR08', '8', 'Sushi', 25, '1KG', 70000, 'Sushi.jpg'),
('BR09', '9', 'Gurita', 30, '1KG', 100000, 'Gurita.jpg'),
('BR10', '10', 'Tuna', 50, '1KG', 25000, 'Tuna.jpg'),
('BR11', '1', 'Ikan lele', 1, '1KG', 12000, 'lelekumis.jpg'),
('BR12', '2', 'Tahu', 20, '2KG', 10000, 'tahu.jpg'),
('BR13', '7', 'Bumbu Kunir', 7, '2KG', 10000, 'bumbukun.jpg'),
('BR14', '2', 'Ikan Teri', 120, '5KG', 120000, 'ikanteri.jpg');

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `idbarangbuat` BEFORE INSERT ON `barang` FOR EACH ROW BEGIN
    DECLARE hitung INT;
    DECLARE hasil CHAR(4);
    SET hitung = (SELECT COUNT(*) FROM barang);
    SET hasil = CONCAT('BR',LPAD(hitung+1,2,0));
    
    IF (hasil in (select id_barang from barang)) THEN
	SET hasil = CONCAT('BR',LPAD(hitung+2,2,0));
    end if;
    
    SET new.id_barang = hasil;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `calon_konsumen`
--

CREATE TABLE `calon_konsumen` (
  `id_calon_konsumen` char(6) NOT NULL,
  `id_negara` char(4) DEFAULT NULL,
  `nama_calon_konsumen` varchar(50) DEFAULT NULL,
  `email_calon_konsumen` varchar(100) DEFAULT NULL,
  `tgl_penawaran_terakhir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `calon_konsumen`
--

INSERT INTO `calon_konsumen` (`id_calon_konsumen`, `id_negara`, `nama_calon_konsumen`, `email_calon_konsumen`, `tgl_penawaran_terakhir`) VALUES
('CK0001', 'N01', 'Arif', 'arif123@gmail.com', '2022-09-12'),
('CK0002', 'N02', 'Mahendy', 'mahendyy2@gmail.com', '2022-02-22'),
('CK0003', 'N03', 'Najwa', 'mayla99@gmail.com', '2022-04-23'),
('CK0004', 'N04', 'Salma', 'azaria3@gmail.com', '2022-05-30'),
('CK0005', 'N05', 'Meirza', 'indahnarendra23@gmail.com', '2022-06-04'),
('CK0006', 'N06', 'Rio', 'ferdinand77@gmail.com', '2022-03-21'),
('CK0007', 'N07', 'Zaqy', 'nasghifar66@gmail.com', '2022-08-27'),
('CK0008', 'N08', 'Bayu', 'safutra12@gmail.com', '2022-05-26'),
('CK0009', 'N09', 'Dimas', 'ssamid78@gmail.com', '2022-03-11'),
('CK0010', 'N10', 'Rifky', 'ferrari9898@gmail.com', '2022-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `detail_jns_dok`
--

CREATE TABLE `detail_jns_dok` (
  `no_resi` char(20) NOT NULL,
  `id_jenis_dokumen` char(2) NOT NULL,
  `no_dokumen` varchar(30) DEFAULT NULL,
  `tgl_dokumen_diterima_` date DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_jns_dok`
--

INSERT INTO `detail_jns_dok` (`no_resi`, `id_jenis_dokumen`, `no_dokumen`, `tgl_dokumen_diterima_`, `file_path`) VALUES
('IDRES000000000000001', '15', '0000001', '2022-01-02', 'C:/USER/INBOX'),
('IDRES000000000000002', '15', '0000002', '2022-01-02', 'C:/USER/INBOX'),
('IDRES000000000000003', '15', '0000003', '2022-01-02', 'C:/USER/INBOX'),
('IDRES000000000000004', '15', '0000004', '2022-01-02', 'C:/USER/INBOX'),
('IDRES000000000000005', '15', '0000005', '2022-01-03', 'C:/USER/INBOX'),
('IDRES000000000000006', '15', '0000006', '2022-01-04', 'C:/USER/INBOX'),
('IDRES000000000000007', '15', '0000007', '2022-01-06', 'C:/USER/INBOX'),
('IDRES000000000000008', '15', '0000008', '2022-01-07', 'C:/USER/INBOX'),
('IDRES000000000000009', '15', '0000009', '2022-01-02', 'C:/USER/INBOX'),
('IDRES000000000000010', '15', '0000010', '2022-01-02', 'C:/USER/INBOX');

-- --------------------------------------------------------

--
-- Table structure for table `detail_katalog`
--

CREATE TABLE `detail_katalog` (
  `id_katalog` char(6) NOT NULL,
  `id_barang` char(4) NOT NULL,
  `jumlah_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_katalog`
--

INSERT INTO `detail_katalog` (`id_katalog`, `id_barang`, `jumlah_barang`) VALUES
('000123', 'BR01', 200),
('000124', 'BR02', 321),
('000125', 'BR03', 211),
('000126', 'BR04', 122),
('000127', 'BR05', 154),
('000128', 'BR06', 542),
('000129', 'BR07', 124),
('000130', 'BR08', 323),
('000131', 'BR09', 231),
('000132', 'BR10', 521);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pemesanan`
--

CREATE TABLE `detail_pemesanan` (
  `id_pemesanan` char(8) NOT NULL,
  `id_barang` char(4) NOT NULL,
  `sub_total` float(8,2) DEFAULT NULL,
  `total_berat` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pemesanan`
--

INSERT INTO `detail_pemesanan` (`id_pemesanan`, `id_barang`, `sub_total`, `total_berat`) VALUES
('PSN00001', 'BR01', 250.00, '9 kg'),
('PSN00002', 'BR02', 280.00, '8 kg'),
('PSN00003', 'BR03', 300.00, '7 kg'),
('PSN00004', 'BR04', 350.00, '6 kg'),
('PSN00005', 'BR05', 400.00, '5 kg'),
('PSN00006', 'BR06', 450.00, '4 kg'),
('PSN00007', 'BR07', 480.00, '3 kg'),
('PSN00008', 'BR08', 500.00, '2 kg'),
('PSN00009', 'BR09', 650.00, '9 kg'),
('PSN00010', 'BR10', 900.00, '10 kg'),
('PSN00012', 'BR10', 25000.00, '1');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penawaran`
--

CREATE TABLE `detail_penawaran` (
  `id_penawaran` char(8) NOT NULL,
  `id_calon_konsumen` char(6) NOT NULL,
  `status_penawaran` int(11) DEFAULT NULL,
  `balasan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_penawaran`
--

INSERT INTO `detail_penawaran` (`id_penawaran`, `id_calon_konsumen`, `status_penawaran`, `balasan`) VALUES
('PS00001', 'CK0001', 1, 'ACCEPTED'),
('PS00002', 'CK0002', 0, 'NOT RECEIVE'),
('PS00003', 'CK0003', 2, 'ACCEPTED'),
('PS00004', 'CK0004', 2, 'NOT RECEIVED'),
('PS00005', 'CK0005', 1, 'ACCEPTED'),
('PS00006', 'CK0006', 1, 'ACCEPTED'),
('PS00007', 'CK0007', 0, 'NOT RECEIVE'),
('PS00008', 'CK0008', 1, 'ACCEPTED'),
('PS00009', 'CK0009', 2, 'NOT RECEIVE'),
('PS00010', 'CK0010', 1, 'ACCEPTED');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` char(2) NOT NULL,
  `nama_jabatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
('01', ' Manajer Umum '),
('02', ' Koki '),
('03', ' Asisten Koki '),
('04', ' Koki eksekutif '),
('05', ' Manajer dapur '),
('06', ' Sous chef '),
('07', ' Station chef '),
('08', ' Barista '),
('09', ' Bartender '),
('10', ' Resepsionis '),
('11', ' Waitress '),
('12', ' Keamanan ');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis` char(2) NOT NULL,
  `nama_jenis` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis`, `nama_jenis`) VALUES
('1', ' Matang '),
('10', ' Kukus '),
('2', ' Mentah '),
('3', ' Fresh '),
('4', ' Olahan '),
('5', ' Instan  '),
('6', ' Healthy '),
('7', ' Tradisional '),
('8', ' Frozenfood '),
('9', ' Bakaran ');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_dokumen`
--

CREATE TABLE `jenis_dokumen` (
  `id_jenis_dokumen` char(2) NOT NULL,
  `nama_dokumen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_dokumen`
--

INSERT INTO `jenis_dokumen` (`id_jenis_dokumen`, `nama_dokumen`) VALUES
('11', 'Laporan penjualan perminggu'),
('12', 'Laporan penjualan perbulan'),
('13', 'Laporan penjualan pertahun'),
('14', 'Laporan pengadaan barang'),
('15', 'Laporan Keuangan'),
('16', 'Laporan Ekspor barang'),
('17', 'Laporan Import barang'),
('19', 'Laporan Pengeluaran'),
('20', 'Laporan Gaji Pegawai');

-- --------------------------------------------------------

--
-- Table structure for table `katalog_barang`
--

CREATE TABLE `katalog_barang` (
  `id_katalog` char(6) NOT NULL,
  `nama_katalog` varchar(30) NOT NULL,
  `file_katalog` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `katalog_barang`
--

INSERT INTO `katalog_barang` (`id_katalog`, `nama_katalog`, `file_katalog`) VALUES
('000123', 'Fish', 'Katalog ikan'),
('000124', 'Shrimp', 'Katalog udang'),
('000125', 'Clams', 'Katalog kerang'),
('000126', 'Lobster', 'Katalog lobster'),
('000127', 'Squid', 'Katalog cumi'),
('000128', 'Crabs', 'Katalog kepiting'),
('000129', 'Oyster', 'Katalog oyster'),
('000130', 'Sushi', 'Katalog sushi'),
('000131', 'Octopus', 'Katalog gurita'),
('000132', 'Kaviar', 'Katalog kaviar');

-- --------------------------------------------------------

--
-- Table structure for table `negara`
--

CREATE TABLE `negara` (
  `id_negara` char(4) NOT NULL,
  `nama_negara` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `negara`
--

INSERT INTO `negara` (`id_negara`, `nama_negara`) VALUES
('', 'Brazil'),
('N01', ' Indonesia '),
('N02', ' Malaysia '),
('N03', ' Vietnam '),
('N04', ' Brunei Darussalam '),
('N05', ' Filipina '),
('N06', ' Myanmar '),
('N07', ' Thailand '),
('N08', ' Singapore '),
('N09', ' Laos '),
('N10', ' India '),
('N11', 'Argentina'),
('N13', 'Afrika Selatan'),
('N14', 'Maroko'),
('N15', 'Liberia'),
('N16', 'Mesir'),
('N17', 'Mozambik'),
('N18', 'Nigeria'),
('N19', 'Zimbabwe'),
('N20', 'Afganistan'),
('N21', 'Tiongkok'),
('N22', 'Rusia');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` char(4) NOT NULL,
  `id_jabatan` char(2) DEFAULT NULL,
  `nama_pegawai` varchar(30) DEFAULT NULL,
  `telp_pegawai` varchar(15) DEFAULT NULL,
  `email_pegawai` varchar(50) DEFAULT NULL,
  `alamat_pegawai` varchar(50) DEFAULT NULL,
  `jk_pegawai` tinyint(1) DEFAULT NULL,
  `pass_pegawai` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `id_jabatan`, `nama_pegawai`, `telp_pegawai`, `email_pegawai`, `alamat_pegawai`, `jk_pegawai`, `pass_pegawai`) VALUES
('PG10', '10', 'Nikolaus Saputra', '085791113740', 'nikolausputra@gmail.com', 'Ploso Timur 7', 1, 'makhluktuhan'),
('PG11', '05', 'Tedy Firmansyah', '082382983456', 'tedy@gmail.com', 'Manyar Tegal 87', 1, 'mt57'),
('PG12', '06', 'Dimas Meidiansyah', '081235543467', 'dimas@gmail.com', 'Kalijudan', 1, 'anjaymabar'),
('PG13', '01', 'tes', '082140378381', 'user@user.com', 'Jl. Unair 99', 0, '12345'),
('PGW1', '01', 'Fharizal Renaldi Widiantara', '087272387996', 'fhrzlrnldi@gmail.com', 'Manyar Tegal 58', 0, 'fhrzlgtg99'),
('PGW2', '02', 'Naufal Fathi Ardhana', '089811025678', 'naufalfathi@gmail.com', 'Bhaskara Sari 55', 0, 'nasefull99'),
('PGW3', '03', 'Rena Eva Dewistina', '087871467676', 'renaeva@gmail.com', 'Gubeng Kertajaya 7', 1, 'renaeva1717'),
('PGW4', '04', 'Dwi Ivanti Anasya', '0895366989480', 'dwiivanti@gmail.com', 'Rungkut Asri 9', 1, 'ansystrs'),
('PGW5', '05', 'Muhammad Ali Yafi', '0895347260927', 'aliyafi@gmail.com', 'Lebak Asri Timur 27', 0, 'lokotreee'),
('PGW6', '06', 'Ahmad Kemalludin Naufal', '085155246224', 'kemalnaufal@gmail.com', 'Peneleh 8', 1, 'sepeleboy'),
('PGW7', '07', 'Thallasa al hafis', '083121611137', 'hapisganteng@gmail.com', 'Salahuddin AL 5', 1, 'onepeace'),
('PGW8', '08', 'Reinanto Saputra', '083117229103', 'reinantosap@gmail.com', 'Jazuli AL 6', 1, 'differentrei'),
('PGW9', '09', 'Dhiva Hikari', '087774476889', 'dhikari@gmail.com', 'Ngagel Jaya 8', 0, 'hikarrriii');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` char(8) NOT NULL,
  `id_pegawai` char(4) DEFAULT NULL,
  `id_pemesanan` char(8) DEFAULT NULL,
  `bukti_pembayaran` varchar(100) DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL,
  `jenis_pembayaran` varchar(20) DEFAULT NULL,
  `status_pembayaran` int(11) DEFAULT NULL,
  `total_pembayaran` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pegawai`, `id_pemesanan`, `bukti_pembayaran`, `tgl_pembayaran`, `jenis_pembayaran`, `status_pembayaran`, `total_pembayaran`) VALUES
('BY000001', 'PG10', 'PSN00001', '2022-08-18 17:28:08', '0000-00-00 00:00:00', 'OVO', 1, 255.00),
('BY000002', 'PG10', 'PSN00002', '2022-02-05 12:40:12', '0000-00-00 00:00:00', 'DANA', 1, 305.00),
('BY000003', 'PG10', 'PSN00003', '2022-03-30 11:30:56', '0000-00-00 00:00:00', 'VIA BANK', 1, 455.00),
('BY000004', 'PG10', 'PSN00004', '2022-05-06 13:27:12', '0000-00-00 00:00:00', 'VIA BANK', 1, 255.00),
('BY000005', 'PG10', 'PSN00005', '2022-05-15 21:18:22', '0000-00-00 00:00:00', 'OVO', 1, 255.00),
('BY000006', 'PG10', 'PSN00006', '2022-02-28 22:29:23', '0000-00-00 00:00:00', 'DANA', 1, 505.00),
('BY000007', 'PG10', 'PSN00007', '2022-08-05 23:22:43', '0000-00-00 00:00:00', 'VIA BANK', 1, 655.00),
('BY000008', 'PG10', 'PSN00008', '2022-05-12 11:33:12', '0000-00-00 00:00:00', 'DANA', 1, 705.00),
('BY000009', 'PG10', 'PSN00009', '2022-02-20 04:30:45', '0000-00-00 00:00:00', 'OVO', 1, 855.00),
('BY000010', 'PG10', 'PSN00010', '2022-06-10 06:50:12', '0000-00-00 00:00:00', 'VIA BANK', 1, 955.00);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` char(8) NOT NULL,
  `id_pegawai` char(4) DEFAULT NULL,
  `id_calon_konsumen` char(6) DEFAULT NULL,
  `id_penawaran` char(8) DEFAULT NULL,
  `tgl_pemesanan` datetime DEFAULT NULL,
  `status_pemesanan` char(2) DEFAULT NULL,
  `alamat_pengiriman` varchar(100) DEFAULT NULL,
  `total_harga` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `id_pegawai`, `id_calon_konsumen`, `id_penawaran`, `tgl_pemesanan`, `status_pemesanan`, `alamat_pengiriman`, `total_harga`) VALUES
('PSN00001', 'PG1', 'CK0001', 'PS00001', '2022-08-18 17:22:08', 'Va', 'Manukan', 250.00),
('PSN00002', 'PG2', 'CK0001', 'PS00002', '2022-02-05 12:34:12', 'Un', 'Pacar Keling', 300.00),
('PSN00003', 'PG3', 'CK0001', 'PS00003', '2022-03-30 11:23:56', 'Un', 'Pandeging', 450.00),
('PSN00004', 'PG4', 'CK0001', 'PS00004', '2022-05-06 13:21:12', 'Va', 'Gebang', 250.00),
('PSN00005', 'PG5', 'CK0001', 'PS00005', '2022-05-15 21:12:22', 'Va', 'Mulyorejo', 250.00),
('PSN00006', 'PG6', 'CK0001', 'PS00006', '2022-02-28 22:21:23', 'Un', 'Margomulyo', 500.00),
('PSN00007', 'PG7', 'CK0001', 'PS00007', '2022-08-05 23:12:43', 'Un', 'Jojoran', 650.00),
('PSN00008', 'PG8', 'CK0001', 'PS00008', '2022-05-12 11:13:12', 'Va', 'Suhat', 700.00),
('PSN00009', 'PG9', 'CK0001', 'PS00009', '2022-02-20 04:21:45', 'Va', 'Malioboro', 850.00),
('PSN00010', 'PG10', 'CK0007', 'PS00010', '2022-06-10 06:43:12', '01', 'Mulyoss', 950.00),
('PSN00011', 'PGW8', 'CK0002', 'PS00011', '2022-08-20 12:22:23', 'Un', 'Manyar', 150.00),
('PSN00012', 'PG13', NULL, NULL, '2022-12-19 00:00:00', 'Be', 'Jl. Unair 99', 25000.00),
('PSN00112', 'PGW1', 'CK0010', 'PS00001', '2022-12-01 13:54:00', '01', 'manyarr', 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `penawaran`
--

CREATE TABLE `penawaran` (
  `id_penawaran` char(8) NOT NULL,
  `id_katalog` char(6) DEFAULT NULL,
  `id_pegawai` char(4) DEFAULT NULL,
  `tgl_penawaran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penawaran`
--

INSERT INTO `penawaran` (`id_penawaran`, `id_katalog`, `id_pegawai`, `tgl_penawaran`) VALUES
('PS00001', '000123', 'PG1', '2022-08-18'),
('PS00002', '000124', 'PG2', '2022-02-05'),
('PS00003', '000125', 'PG3', '2022-03-30'),
('PS00004', '000126', 'PG4', '2022-05-06'),
('PS00005', '000127', 'PG5', '2022-05-15'),
('PS00006', '000128', 'PG6', '2022-02-28'),
('PS00007', '000129', 'PG7', '2022-08-05'),
('PS00008', '000130', 'PG8', '2022-05-12'),
('PS00009', '000131', 'PG9', '2022-02-20'),
('PS00010', '000132', 'PG10', '2022-06-10'),
('PS00011', '000127', 'PGW8', '2022-10-22'),
('PS020', '000124', 'PG13', '2022-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `no_resi` char(20) NOT NULL,
  `id_pegawai` char(4) NOT NULL,
  `id_pembayaran` char(8) NOT NULL,
  `status_pengiriman` tinyint(1) NOT NULL,
  `tgl_pengiriman` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`no_resi`, `id_pegawai`, `id_pembayaran`, `status_pengiriman`, `tgl_pengiriman`) VALUES
('IDRES000000000000001', 'PGW1', 'BY000001', 1, '2022-08-20'),
('IDRES000000000000002', 'PGW1', 'BY000002', 1, '0000-00-00'),
('IDRES000000000000003', 'PGW1', 'BY000003', 1, '2022-04-02'),
('IDRES000000000000004', 'PGW1', 'BY000004', 1, '2022-05-08'),
('IDRES000000000000005', 'PGW1', 'BY000005', 1, '2022-05-17'),
('IDRES000000000000006', 'PGW1', 'BY000006', 1, '2022-03-02'),
('IDRES000000000000007', 'PGW1', 'BY000007', 1, '2022-08-07'),
('IDRES000000000000008', 'PGW1', 'BY000008', 1, '2022-05-14'),
('IDRES000000000000009', 'PGW1', 'BY000009', 1, '2022-02-22'),
('IDRES000000000000010', 'PGW1', 'BY000001', 1, '2022-06-12');

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewjenisbrg`
-- (See below for the actual view)
--
CREATE TABLE `viewjenisbrg` (
`id_jenis` char(2)
,`nama_jenis` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `viewjenisbrg`
--
DROP TABLE IF EXISTS `viewjenisbrg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewjenisbrg`  AS SELECT `jenis_barang`.`id_jenis` AS `id_jenis`, `jenis_barang`.`nama_jenis` AS `nama_jenis` FROM `jenis_barang``jenis_barang`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `brg_idjns_fk` (`id_jenis`);

--
-- Indexes for table `calon_konsumen`
--
ALTER TABLE `calon_konsumen`
  ADD PRIMARY KEY (`id_calon_konsumen`),
  ADD KEY `calko_idneg_fk` (`id_negara`);

--
-- Indexes for table `detail_jns_dok`
--
ALTER TABLE `detail_jns_dok`
  ADD PRIMARY KEY (`no_resi`,`id_jenis_dokumen`),
  ADD KEY `dtjd_idjendok_fk` (`id_jenis_dokumen`);

--
-- Indexes for table `detail_katalog`
--
ALTER TABLE `detail_katalog`
  ADD PRIMARY KEY (`id_katalog`,`id_barang`),
  ADD KEY `dtktlg_idbrg_fk` (`id_barang`);

--
-- Indexes for table `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`,`id_barang`),
  ADD KEY `dtpem_idbrg_fk` (`id_barang`);

--
-- Indexes for table `detail_penawaran`
--
ALTER TABLE `detail_penawaran`
  ADD PRIMARY KEY (`id_penawaran`,`id_calon_konsumen`),
  ADD KEY `dtpen_idcalko_fk` (`id_calon_konsumen`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `jenis_dokumen`
--
ALTER TABLE `jenis_dokumen`
  ADD PRIMARY KEY (`id_jenis_dokumen`);

--
-- Indexes for table `katalog_barang`
--
ALTER TABLE `katalog_barang`
  ADD PRIMARY KEY (`id_katalog`);

--
-- Indexes for table `negara`
--
ALTER TABLE `negara`
  ADD PRIMARY KEY (`id_negara`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `peg_idjbt_fk` (`id_jabatan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `pby_idpeg_fk` (`id_pegawai`),
  ADD KEY `pby_idpem_fk` (`id_pemesanan`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `pem_idpeg_fk` (`id_pegawai`),
  ADD KEY `pem_idcalko_fk` (`id_calon_konsumen`);

--
-- Indexes for table `penawaran`
--
ALTER TABLE `penawaran`
  ADD PRIMARY KEY (`id_penawaran`),
  ADD KEY `pnw_idktlg_fk` (`id_katalog`),
  ADD KEY `pnw_idpeg_fk` (`id_pegawai`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`no_resi`),
  ADD KEY `pgr_idpeg_fk` (`id_pegawai`),
  ADD KEY `pgr_idpby_fk` (`id_pembayaran`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `brg_idjns_fk` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_barang` (`id_jenis`);

--
-- Constraints for table `calon_konsumen`
--
ALTER TABLE `calon_konsumen`
  ADD CONSTRAINT `calko_idneg_fk` FOREIGN KEY (`id_negara`) REFERENCES `negara` (`id_negara`);

--
-- Constraints for table `detail_jns_dok`
--
ALTER TABLE `detail_jns_dok`
  ADD CONSTRAINT `dtjd_idjendok_fk` FOREIGN KEY (`id_jenis_dokumen`) REFERENCES `jenis_dokumen` (`id_jenis_dokumen`),
  ADD CONSTRAINT `dtjd_nores_fk` FOREIGN KEY (`no_resi`) REFERENCES `pengiriman` (`no_resi`);

--
-- Constraints for table `detail_katalog`
--
ALTER TABLE `detail_katalog`
  ADD CONSTRAINT `dtktlg_idbrg_fk` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `dtktlg_idktlg_fk` FOREIGN KEY (`id_katalog`) REFERENCES `katalog_barang` (`id_katalog`);

--
-- Constraints for table `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  ADD CONSTRAINT `dtpem_idbrg_fk` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `dtpem_idpem_fk` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id_pemesanan`);

--
-- Constraints for table `detail_penawaran`
--
ALTER TABLE `detail_penawaran`
  ADD CONSTRAINT `dtpen_idcalko_fk` FOREIGN KEY (`id_calon_konsumen`) REFERENCES `calon_konsumen` (`id_calon_konsumen`),
  ADD CONSTRAINT `dtpen_idpen_fk` FOREIGN KEY (`id_penawaran`) REFERENCES `penawaran` (`id_penawaran`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `peg_idjbt_fk` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pby_idpeg_fk` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  ADD CONSTRAINT `pby_idpem_fk` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id_pemesanan`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pem_idcalko_fk` FOREIGN KEY (`id_calon_konsumen`) REFERENCES `calon_konsumen` (`id_calon_konsumen`),
  ADD CONSTRAINT `pem_idpeg_fk` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `penawaran`
--
ALTER TABLE `penawaran`
  ADD CONSTRAINT `pnw_idktlg_fk` FOREIGN KEY (`id_katalog`) REFERENCES `katalog_barang` (`id_katalog`),
  ADD CONSTRAINT `pnw_idpeg_fk` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pgr_idpby_fk` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayaran` (`id_pembayaran`),
  ADD CONSTRAINT `pgr_idpeg_fk` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
