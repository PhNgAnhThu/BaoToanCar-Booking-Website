-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th4 14, 2025 lúc 03:57 PM
-- Phiên bản máy phục vụ: 9.1.0
-- Phiên bản PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `baotoan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banggia`
--

DROP TABLE IF EXISTS `banggia`;
CREATE TABLE IF NOT EXISTS `banggia` (
  `MaGia` int NOT NULL,
  `GiaNgayThuong` decimal(18,2) NOT NULL,
  `GiaNgayDacBiet` decimal(18,2) NOT NULL,
  `MaLoaiXe` int DEFAULT NULL,
  PRIMARY KEY (`MaGia`),
  KEY `MaLoaiXe` (`MaLoaiXe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banggia`
--

INSERT INTO `banggia` (`MaGia`, `GiaNgayThuong`, `GiaNgayDacBiet`, `MaLoaiXe`) VALUES
(1, 300000.00, 500000.00, 1),
(2, 500000.00, 700000.00, 2),
(3, 400000.00, 750000.00, 2),
(4, 350000.00, 600000.00, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietnhomchucnang`
--

DROP TABLE IF EXISTS `chitietnhomchucnang`;
CREATE TABLE IF NOT EXISTS `chitietnhomchucnang` (
  `MaNhomNguoiDung` int NOT NULL,
  `MaChucNang` int NOT NULL,
  PRIMARY KEY (`MaNhomNguoiDung`,`MaChucNang`),
  KEY `MaChucNang` (`MaChucNang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietnhomnguoidung`
--

DROP TABLE IF EXISTS `chitietnhomnguoidung`;
CREATE TABLE IF NOT EXISTS `chitietnhomnguoidung` (
  `MaNhanVien` int NOT NULL,
  `MaNhomNguoiDung` int NOT NULL,
  PRIMARY KEY (`MaNhanVien`,`MaNhomNguoiDung`),
  KEY `MaNhomNguoiDung` (`MaNhomNguoiDung`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietphieudatxe`
--

DROP TABLE IF EXISTS `chitietphieudatxe`;
CREATE TABLE IF NOT EXISTS `chitietphieudatxe` (
  `MaChiTietPhieuDat` int NOT NULL AUTO_INCREMENT,
  `MaPhieuDat` int DEFAULT NULL,
  `MaGhe` int DEFAULT NULL,
  PRIMARY KEY (`MaChiTietPhieuDat`),
  KEY `MaPhieuDat` (`MaPhieuDat`),
  KEY `MaGhe` (`MaGhe`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietphieudatxe`
--

INSERT INTO `chitietphieudatxe` (`MaChiTietPhieuDat`, `MaPhieuDat`, `MaGhe`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 23, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucnang`
--

DROP TABLE IF EXISTS `chucnang`;
CREATE TABLE IF NOT EXISTS `chucnang` (
  `MaChucNang` int NOT NULL,
  `TenChucNang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`MaChucNang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chucnang`
--

INSERT INTO `chucnang` (`MaChucNang`, `TenChucNang`) VALUES
(1, 'Tạo vé'),
(2, 'Hủy vé'),
(3, 'Xem lộ trình');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyendi`
--

DROP TABLE IF EXISTS `chuyendi`;
CREATE TABLE IF NOT EXISTS `chuyendi` (
  `MaChuyenDi` int NOT NULL,
  `MaGia` int DEFAULT NULL,
  `MaNhanVienTaiXe1` int DEFAULT NULL,
  `MaNhanVienTaiXe2` int DEFAULT NULL,
  `MaNhanVienPhuXe` int DEFAULT NULL,
  `MaLoTrinh` int DEFAULT NULL,
  `ThoiGianKhoiHanh` datetime NOT NULL,
  `loaive` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaLoaiXe` int DEFAULT NULL,
  `MaXe` int DEFAULT NULL,
  `ngayve` datetime DEFAULT NULL,
  PRIMARY KEY (`MaChuyenDi`),
  KEY `MaGia` (`MaGia`),
  KEY `MaNhanVienTaiXe1` (`MaNhanVienTaiXe1`),
  KEY `MaNhanVienTaiXe2` (`MaNhanVienTaiXe2`),
  KEY `MaNhanVienPhuXe` (`MaNhanVienPhuXe`),
  KEY `MaLoTrinh` (`MaLoTrinh`),
  KEY `fk_MaLoaiXe` (`MaLoaiXe`),
  KEY `idx_chuyendi_maxe` (`MaXe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chuyendi`
--

INSERT INTO `chuyendi` (`MaChuyenDi`, `MaGia`, `MaNhanVienTaiXe1`, `MaNhanVienTaiXe2`, `MaNhanVienPhuXe`, `MaLoTrinh`, `ThoiGianKhoiHanh`, `loaive`, `MaLoaiXe`, `MaXe`, `ngayve`) VALUES
(1, 1, 1, 2, 1, 1, '2024-11-01 08:00:00', 'Một chiều', 1, 1, NULL),
(2, 2, 2, 1, 2, 2, '2024-11-02 09:00:00', NULL, 2, 2, NULL),
(3, 3, 1, 2, 1, 2, '2025-01-15 10:30:00', 'Khứ hồi', 2, 2, '2025-01-22 16:00:00'),
(4, 2, 2, 1, 2, 1, '2025-01-15 14:00:00', 'Khứ hồi', 2, 2, '2025-01-22 19:00:00'),
(5, 2, 1, 2, 1, 1, '2025-01-10 08:30:00', 'Một chiều', 1, 1, NULL),
(6, 1, 2, 1, 2, 2, '2024-01-08 09:30:00', NULL, NULL, NULL, NULL),
(7, 2, 1, 2, 1, 2, '2025-01-15 17:00:00', 'Một chiều', 1, 1, NULL),
(8, 3, 2, 1, 1, 3, '2025-01-10 19:00:00', 'Một chiều', 1, 1, NULL),
(10, 2, 2, 1, 1, 3, '2025-01-10 20:15:00', 'Một chiều', 1, 1, NULL),
(9, 3, 1, 2, 2, 1, '2025-01-15 20:00:00', 'Khứ hồi', 2, 2, '2025-01-22 18:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diemdiqua`
--

DROP TABLE IF EXISTS `diemdiqua`;
CREATE TABLE IF NOT EXISTS `diemdiqua` (
  `MaDiaDiem` int NOT NULL,
  `TenDiaDiem` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MaLoTrinh` int DEFAULT NULL,
  PRIMARY KEY (`MaDiaDiem`),
  KEY `MaLoTrinh` (`MaLoTrinh`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `diemdiqua`
--

INSERT INTO `diemdiqua` (`MaDiaDiem`, `TenDiaDiem`, `MaLoTrinh`) VALUES
(1, 'Hà Nội', 1),
(2, 'Đà Nẵng', 1),
(3, 'Hà Nội', 2),
(4, 'Sài Gòn', 2),
(5, 'Đà Nẵng', 3),
(6, 'Sài Gòn', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diemdontra`
--

DROP TABLE IF EXISTS `diemdontra`;
CREATE TABLE IF NOT EXISTS `diemdontra` (
  `MaDiemDonTra` int NOT NULL AUTO_INCREMENT,
  `MaLoTrinh` int NOT NULL,
  `LoaiDiem` enum('don','tra') NOT NULL,
  `TenDiem` varchar(255) NOT NULL,
  PRIMARY KEY (`MaDiemDonTra`),
  KEY `MaLoTrinh` (`MaLoTrinh`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `diemdontra`
--

INSERT INTO `diemdontra` (`MaDiemDonTra`, `MaLoTrinh`, `LoaiDiem`, `TenDiem`) VALUES
(1, 1, 'don', 'Bến xe Mỹ Đình'),
(2, 1, 'tra', 'Bến xe Đà Nẵng'),
(3, 2, 'don', 'Bến xe Giáp Bát'),
(4, 2, 'tra', 'Bến xe Miền Đông'),
(5, 3, 'don', 'Bến xe Miền Đông'),
(6, 3, 'tra', 'Bến xe Đà Nẵng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `MaKhachHang` int NOT NULL,
  `HoTen` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SoDienThoai` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DiaChi` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MaNganHang` int DEFAULT NULL,
  `MaNhomNguoiDung` int DEFAULT NULL,
  `MaChucNang` int DEFAULT NULL,
  PRIMARY KEY (`MaKhachHang`),
  KEY `MaNganHang` (`MaNganHang`),
  KEY `MaNhomNguoiDung` (`MaNhomNguoiDung`),
  KEY `MaChucNang` (`MaChucNang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKhachHang`, `HoTen`, `SoDienThoai`, `DiaChi`, `MaNganHang`, `MaNhomNguoiDung`, `MaChucNang`) VALUES
(1, 'Nguyễn Văn A', '0912345678', 'Hà Nội', 1, 3, 3),
(2, 'Trần Thị B', '0918765432', 'Đà Nẵng', 2, 3, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaixe`
--

DROP TABLE IF EXISTS `loaixe`;
CREATE TABLE IF NOT EXISTS `loaixe` (
  `MaLoaiXe` int NOT NULL,
  `TenLoaiXe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SoGhe` int NOT NULL,
  PRIMARY KEY (`MaLoaiXe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaixe`
--

INSERT INTO `loaixe` (`MaLoaiXe`, `TenLoaiXe`, `SoGhe`) VALUES
(1, 'Xe giường nằm', 40),
(2, 'Xe limousine', 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lotrinh`
--

DROP TABLE IF EXISTS `lotrinh`;
CREATE TABLE IF NOT EXISTS `lotrinh` (
  `MaLoTrinh` int NOT NULL,
  `TenLoTrinh` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ThoiGianDiChuyen` time NOT NULL,
  PRIMARY KEY (`MaLoTrinh`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lotrinh`
--

INSERT INTO `lotrinh` (`MaLoTrinh`, `TenLoTrinh`, `ThoiGianDiChuyen`) VALUES
(1, 'Hà Nội - Đà Nẵng', '12:00:00'),
(2, 'Hà Nội - Sài Gòn', '19:30:00'),
(3, 'Sài Gòn - Đà Nẵng', '09:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `maughetieuchuan`
--

DROP TABLE IF EXISTS `maughetieuchuan`;
CREATE TABLE IF NOT EXISTS `maughetieuchuan` (
  `MaMauGheTieuChuan` int NOT NULL AUTO_INCREMENT,
  `MaLoaiXe` int NOT NULL,
  `MaGhe` varchar(10) NOT NULL,
  `LoaiGhe` varchar(50) NOT NULL,
  PRIMARY KEY (`MaMauGheTieuChuan`),
  KEY `MaLoaiXe` (`MaLoaiXe`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `maughetieuchuan`
--

INSERT INTO `maughetieuchuan` (`MaMauGheTieuChuan`, `MaLoaiXe`, `MaGhe`, `LoaiGhe`) VALUES
(1, 1, 'A1', 'Tầng dưới'),
(2, 1, 'A2', 'Tầng dưới'),
(3, 1, 'A3', 'Tầng dưới'),
(4, 1, 'A4', 'Tầng dưới'),
(5, 1, 'A5', 'Tầng dưới'),
(6, 1, 'A6', 'Tầng dưới'),
(7, 1, 'A7', 'Tầng dưới'),
(8, 1, 'A8', 'Tầng dưới'),
(9, 1, 'A9', 'Tầng dưới'),
(10, 1, 'A10', 'Tầng dưới'),
(11, 1, 'A11', 'Tầng dưới'),
(12, 1, 'A12', 'Tầng dưới'),
(13, 1, 'A13', 'Tầng dưới'),
(14, 1, 'A14', 'Tầng dưới'),
(15, 1, 'A15', 'Tầng dưới'),
(16, 1, 'A16', 'Tầng dưới'),
(17, 1, 'A17', 'Tầng dưới'),
(18, 1, 'A18', 'Tầng dưới'),
(19, 1, 'A19', 'Tầng dưới'),
(20, 1, 'A20', 'Tầng dưới'),
(21, 1, 'B1', 'Tầng trên'),
(22, 1, 'B2', 'Tầng trên'),
(23, 1, 'B3', 'Tầng trên'),
(24, 1, 'B4', 'Tầng trên'),
(25, 1, 'B5', 'Tầng trên'),
(26, 1, 'B6', 'Tầng trên'),
(27, 1, 'B7', 'Tầng trên'),
(28, 1, 'B8', 'Tầng trên'),
(29, 1, 'B9', 'Tầng trên'),
(30, 1, 'B10', 'Tầng trên'),
(31, 1, 'B11', 'Tầng trên'),
(32, 1, 'B12', 'Tầng trên'),
(33, 1, 'B13', 'Tầng trên'),
(34, 1, 'B14', 'Tầng trên'),
(35, 1, 'B15', 'Tầng trên'),
(36, 1, 'B16', 'Tầng trên'),
(37, 1, 'B17', 'Tầng trên'),
(38, 1, 'B18', 'Tầng trên'),
(39, 1, 'B19', 'Tầng trên'),
(40, 1, 'B20', 'Tầng trên'),
(41, 2, 'A1', 'Tầng dưới'),
(42, 2, 'A2', 'Tầng dưới'),
(43, 2, 'A3', 'Tầng dưới'),
(44, 2, 'A4', 'Tầng dưới'),
(45, 2, 'A5', 'Tầng dưới'),
(46, 2, 'A6', 'Tầng dưới'),
(47, 2, 'A7', 'Tầng dưới'),
(48, 2, 'A8', 'Tầng dưới'),
(49, 2, 'A9', 'Tầng dưới'),
(50, 2, 'A10', 'Tầng dưới'),
(51, 2, 'B1', 'Tầng trên'),
(52, 2, 'B2', 'Tầng trên'),
(53, 2, 'B3', 'Tầng trên'),
(54, 2, 'B4', 'Tầng trên'),
(55, 2, 'B5', 'Tầng trên'),
(56, 2, 'B6', 'Tầng trên'),
(57, 2, 'B7', 'Tầng trên'),
(58, 2, 'B8', 'Tầng trên'),
(59, 2, 'B9', 'Tầng trên'),
(60, 2, 'B10', 'Tầng trên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_03_19_092017_create_sessions_table', 1),
(2, '2025_03_19_092114_create_cache_table', 1),
(3, '2025_03_19_093202_create_users_table', 1),
(4, '2025_03_19_093548_create_personal_access_tokens_table', 1),
(5, '2025_03_19_114533_create_password_reset_tokens_table', 1),
(6, '2025_03_26_073054_add_phone_to_users_table', 1),
(7, '2025_03_26_074623_add_photo_to_users_table', 1),
(8, '2025_04_13_151421_create_trips_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nganhang`
--

DROP TABLE IF EXISTS `nganhang`;
CREATE TABLE IF NOT EXISTS `nganhang` (
  `MaNganHang` int NOT NULL,
  `TenNganHang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`MaNganHang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nganhang`
--

INSERT INTO `nganhang` (`MaNganHang`, `TenNganHang`) VALUES
(1, 'Ngân hàng A'),
(2, 'Ngân hàng B'),
(3, 'Ngân hàng C');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNhanVien` int NOT NULL,
  `TenNhanVien` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CCCD` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GioiTinh` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DiaChi` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MaNhomNguoiDung` int DEFAULT NULL,
  `MaChucNang` int DEFAULT NULL,
  PRIMARY KEY (`MaNhanVien`),
  KEY `MaNhomNguoiDung` (`MaNhomNguoiDung`),
  KEY `MaChucNang` (`MaChucNang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNhanVien`, `TenNhanVien`, `CCCD`, `GioiTinh`, `DiaChi`, `MaNhomNguoiDung`, `MaChucNang`) VALUES
(1, 'Phạm Văn C', '012345678912', 'Nam', 'TP.HCM', 2, 1),
(2, 'Ngô Thị D', '098765432109', 'Nữ', 'Bình Dương', 2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhomnguoidung`
--

DROP TABLE IF EXISTS `nhomnguoidung`;
CREATE TABLE IF NOT EXISTS `nhomnguoidung` (
  `MaNhomNguoiDung` int NOT NULL,
  `TenNhomNguoiDung` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`MaNhomNguoiDung`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhomnguoidung`
--

INSERT INTO `nhomnguoidung` (`MaNhomNguoiDung`, `TenNhomNguoiDung`) VALUES
(1, 'Quản trị viên'),
(2, 'Nhân viên'),
(3, 'Khách hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `password_reset_tokens_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanhoi`
--

DROP TABLE IF EXISTS `phanhoi`;
CREATE TABLE IF NOT EXISTS `phanhoi` (
  `MaPhanHoi` int NOT NULL,
  `ThoiGianPhanHoi` datetime NOT NULL,
  `NoiDung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `SoSao` int DEFAULT NULL,
  `MaChuyenDi` int DEFAULT NULL,
  `MaNhanVien` int DEFAULT NULL,
  `MaKhachHang` int DEFAULT NULL,
  PRIMARY KEY (`MaPhanHoi`),
  KEY `MaChuyenDi` (`MaChuyenDi`),
  KEY `MaNhanVien` (`MaNhanVien`),
  KEY `MaKhachHang` (`MaKhachHang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phanhoi`
--

INSERT INTO `phanhoi` (`MaPhanHoi`, `ThoiGianPhanHoi`, `NoiDung`, `SoSao`, `MaChuyenDi`, `MaNhanVien`, `MaKhachHang`) VALUES
(1, '2024-10-20 12:00:00', 'Dịch vụ tốt', 5, 1, 1, 1),
(2, '2024-10-21 14:00:00', 'Tài xế rất thân thiện', 4, 2, 2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieudatxe`
--

DROP TABLE IF EXISTS `phieudatxe`;
CREATE TABLE IF NOT EXISTS `phieudatxe` (
  `MaPhieuDat` int NOT NULL AUTO_INCREMENT,
  `MaKhachHang` int DEFAULT NULL,
  `ThoiGianDat` datetime NOT NULL,
  `MaChuyenDi` int DEFAULT NULL,
  `TongSoTien` decimal(18,2) NOT NULL,
  `HinhThucThanhToan` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TenKhachHang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SoDienThoai` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaDiemDon` int DEFAULT NULL,
  `GhiChuDiemDon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `MaDiemTra` int DEFAULT NULL,
  `GhiChu` text COLLATE utf8mb4_unicode_ci,
  `GhiChuDiemTra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `TrangThaiThanhToan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ChuaThanhToan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`MaPhieuDat`),
  KEY `MaKhachHang` (`MaKhachHang`),
  KEY `MaChuyenDi` (`MaChuyenDi`),
  KEY `fk_phieudatxe_diemdon` (`MaDiemDon`),
  KEY `fk_phieudatxe_diemtra` (`MaDiemTra`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phieudatxe`
--

INSERT INTO `phieudatxe` (`MaPhieuDat`, `MaKhachHang`, `ThoiGianDat`, `MaChuyenDi`, `TongSoTien`, `HinhThucThanhToan`, `TenKhachHang`, `SoDienThoai`, `Email`, `MaDiemDon`, `GhiChuDiemDon`, `MaDiemTra`, `GhiChu`, `GhiChuDiemTra`, `TrangThaiThanhToan`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-10-15 10:30:00', 1, 600000.00, 'Trực tiếp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(2, 2, '2024-10-16 11:00:00', 2, 500000.00, 'Chuyển khoản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(3, 1, '2025-01-01 03:34:36', 1, 600000.00, 'Chuyển khoản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(4, 1, '2025-01-01 08:25:21', 1, 600000.00, 'Trực tiếp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(5, 1, '2025-01-01 08:28:54', 1, 600000.00, 'Trực tiếp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(6, 1, '2025-01-01 08:29:04', 1, 600000.00, 'Chuyển khoản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(7, 1, '2025-01-01 08:29:05', 1, 600000.00, 'Trực tiếp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(8, 1, '2025-01-01 08:41:23', 1, 600000.00, 'Chuyển khoản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(9, 1, '2025-01-01 09:02:33', 1, 600000.00, 'Chuyển khoản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(10, 0, '2025-01-01 09:04:19', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(11, 0, '2025-01-01 09:06:13', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(12, 0, '2025-01-01 09:07:51', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(13, 0, '2025-01-01 09:08:42', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(14, 0, '2025-01-01 09:09:10', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(15, 0, '2025-01-01 09:37:36', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(16, 0, '2025-01-01 09:38:54', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(17, 0, '2025-01-01 10:02:14', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(18, 0, '2025-01-01 11:38:08', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(19, 0, '2025-01-01 11:51:16', 0, 0.00, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChuaThanhToan', NULL, NULL),
(20, NULL, '2025-04-14 14:26:52', 7, 500000.00, 'Tại nhà xe', 'PHAM NGUYEN ANH THU', '0792280515', 'anhthuphng05@gmail.com', 3, NULL, 4, NULL, NULL, 'ChuaThanhToan', '2025-04-14 07:26:52', '2025-04-14 07:26:52'),
(21, NULL, '2025-04-14 14:37:45', 7, 500000.00, 'Tại nhà xe', 'PHAM NGUYEN ANH THU', '0792280515', 'anhthuphng05@gmail.com', 3, NULL, 4, NULL, NULL, 'ChuaThanhToan', '2025-04-14 07:37:45', '2025-04-14 07:37:45'),
(22, NULL, '2025-04-14 14:38:02', 7, 500000.00, 'Tại nhà xe', 'PHAM NGUYEN ANH THU', '0792280515', 'anhthuphng05@gmail.com', 3, NULL, 4, NULL, NULL, 'ChuaThanhToan', '2025-04-14 07:38:02', '2025-04-14 07:38:02'),
(23, NULL, '2025-04-14 14:44:31', 7, 500000.00, 'Tại nhà xe', 'PHAM NGUYEN ANH THU', '0792280515', 'anhthuphng05@gmail.com', 3, NULL, 4, NULL, NULL, 'ChuaThanhToan', '2025-04-14 07:44:31', '2025-04-14 07:44:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `MaTaiKhoan` int NOT NULL AUTO_INCREMENT,
  `MaNhanVien` int DEFAULT NULL,
  `MaKhachHang` int DEFAULT NULL,
  `SoDienThoai` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MatKhau` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`MaTaiKhoan`),
  KEY `MaNhanVien` (`MaNhanVien`),
  KEY `MaKhachHang` (`MaKhachHang`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `MaNhanVien`, `MaKhachHang`, `SoDienThoai`, `MatKhau`, `role`) VALUES
(1, 1, NULL, '0123456789', '$2y$10$CZDG4i0.U4SfuMDoTFwslOlw0UQ6xdTIcsj269dZQFMOeSESAiSqi', 'admin'),
(2, NULL, NULL, '07922', '$2y$10$4/G02fhOlmq8lZyrETazCOeoknVW/0lgQIH0EcSxQI4YoesFcOkAe', 'user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trips`
--

DROP TABLE IF EXISTS `trips`;
CREATE TABLE IF NOT EXISTS `trips` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `TenLoTrinh` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DiemDi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DiemDen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ThoiGianKhoiHanh` timestamp NOT NULL,
  `GiaNgayThuong` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`, `phone`, `photo`) VALUES
(1, 'PHAM NGUYEN ANH THU', 'anhthuphng05@gmail.com', '$2y$12$7e2M5ZjsJlESzR4/dw4KVuF4v07OHIXJMiNAOiqR.cN24/QvFluoa', '2025-04-13 04:09:06', '2025-04-13 04:09:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xe`
--

DROP TABLE IF EXISTS `xe`;
CREATE TABLE IF NOT EXISTS `xe` (
  `MaXe` int NOT NULL,
  `BienSoXe` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MaLoaiXe` int DEFAULT NULL,
  `TinhTrangxe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaXe`),
  KEY `MaLoaiXe` (`MaLoaiXe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `xe`
--

INSERT INTO `xe` (`MaXe`, `BienSoXe`, `MaLoaiXe`, `TinhTrangxe`) VALUES
(1, '30A-12345', 1, 'Bình thường'),
(2, '29B-54321', 2, 'Bình thường'),
(3, '30A-25461', 1, 'Hư hỏng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xeghe`
--

DROP TABLE IF EXISTS `xeghe`;
CREATE TABLE IF NOT EXISTS `xeghe` (
  `MaXeGhe` int NOT NULL AUTO_INCREMENT,
  `MaXe` int NOT NULL,
  `MaMauGheTieuChuan` int NOT NULL,
  `TrangThai` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaXeGhe`),
  KEY `MaMauGheTieuChuan` (`MaMauGheTieuChuan`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `xeghe`
--

INSERT INTO `xeghe` (`MaXeGhe`, `MaXe`, `MaMauGheTieuChuan`, `TrangThai`) VALUES
(1, 1, 1, 'da_ban'),
(2, 1, 2, 'trống'),
(3, 1, 3, 'trống'),
(4, 1, 4, 'trống'),
(5, 1, 5, 'da_ban'),
(6, 1, 6, 'trống'),
(7, 1, 7, 'trống'),
(8, 1, 8, 'trống'),
(9, 1, 9, 'trống'),
(10, 1, 10, 'trống'),
(11, 1, 11, 'trống'),
(12, 1, 12, 'trống'),
(13, 1, 13, 'trống'),
(14, 1, 14, 'trống'),
(15, 1, 15, 'da_ban'),
(16, 1, 16, 'trống'),
(17, 1, 17, 'trống'),
(18, 1, 18, 'trống'),
(19, 1, 19, 'trống'),
(20, 1, 20, 'trống'),
(21, 1, 21, 'trống'),
(22, 1, 22, 'trống'),
(23, 1, 23, 'trống'),
(24, 1, 24, 'trống'),
(25, 1, 25, 'trống'),
(26, 1, 26, 'trống'),
(27, 1, 27, 'trống'),
(28, 1, 28, 'trống'),
(29, 1, 29, 'trống'),
(30, 1, 30, 'trống'),
(31, 1, 31, 'trống'),
(32, 1, 32, 'trống'),
(33, 1, 33, 'trống'),
(34, 1, 34, 'trống'),
(35, 1, 35, 'trống'),
(36, 1, 36, 'trống'),
(37, 1, 37, 'trống'),
(38, 1, 38, 'trống'),
(39, 1, 39, 'trống'),
(40, 1, 40, 'trống'),
(41, 2, 41, 'trống'),
(42, 2, 42, 'trống'),
(43, 2, 43, 'trống'),
(44, 2, 44, 'trống'),
(45, 2, 45, 'trống'),
(46, 2, 46, 'trống'),
(47, 2, 47, 'trống'),
(48, 2, 48, 'trống'),
(49, 2, 49, 'trống'),
(50, 2, 50, 'trống'),
(51, 2, 51, 'trống'),
(52, 2, 52, 'trống'),
(53, 2, 53, 'trống'),
(54, 2, 54, 'trống'),
(55, 2, 55, 'trống'),
(56, 2, 56, 'trống'),
(57, 2, 57, 'trống'),
(58, 2, 58, 'trống'),
(59, 2, 59, 'trống'),
(60, 2, 60, 'trống');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
