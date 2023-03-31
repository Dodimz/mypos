/*
 Navicat Premium Data Transfer

 Source Server         : localhost_xampp
 Source Server Type    : MySQL
 Source Server Version : 100420
 Source Host           : localhost:3306
 Source Schema         : dlh_ihsan2

 Target Server Type    : MySQL
 Target Server Version : 100420
 File Encoding         : 65001

 Date: 31/03/2023 17:47:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang`  (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `stock` int(10) NOT NULL DEFAULT 0,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE,
  UNIQUE INDEX `barcode`(`barcode`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `unit_id`(`unit_id`) USING BTREE,
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `table_unit` (`unit_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang
-- ----------------------------
INSERT INTO `barang` VALUES (13, 'A001', 'Baju Batik', 5, 2, 10000, 18, 'Product-200712-5c4dee4425.jpeg', '2020-07-13 00:29:23', '2023-03-30 17:29:20');
INSERT INTO `barang` VALUES (14, 'J002', 'Sapi Galak', 2, 2, 10000, 27, 'Product-200712-915638c1bc.png', '2020-07-13 00:29:54', '2023-03-30 17:32:28');
INSERT INTO `barang` VALUES (15, 'B001', 'Kambing Etawa', 2, 2, 1909090, 16, 'Product-200712-88b1791df9.jpg', '2020-07-13 00:30:19', '2023-03-31 12:37:28');
INSERT INTO `barang` VALUES (16, 'C001', 'Bakso', 2, 2, 10000, 7, 'default.png', '2020-07-13 01:03:26', '2023-03-31 01:31:49');
INSERT INTO `barang` VALUES (20, 'A002', 'Haus!', 3, 6, 500000, 9, 'Product-200715-39fb7bd384.png', '2020-07-15 21:44:45', '2023-03-31 01:31:41');
INSERT INTO `barang` VALUES (21, 'A003', 'Nyoope', 3, 6, 500000, 6, 'Product-200715-cd99bd8a53.png', '2020-07-15 21:46:04', '2023-03-31 12:41:43');
INSERT INTO `barang` VALUES (22, 'A004', 'Durian Musang King', 2, 2, 1000000, 128, 'Product-200715-ed6f4517a5.png', '2020-07-15 21:49:18', '2023-03-31 12:41:39');
INSERT INTO `barang` VALUES (23, 'A007', 'Susu Kuda Liar', 3, 6, 250000, 7, 'default.png', '2020-07-16 01:14:08', '2023-03-30 16:52:42');
INSERT INTO `barang` VALUES (24, 'A008', 'Permen Kaki', 6, 4, 2000, 36, 'default.png', '2020-07-16 01:14:37', '2023-03-31 12:36:42');
INSERT INTO `barang` VALUES (25, '101', 'kaos kaki', 5, 5, 100000, 0, 'default.png', '2023-03-11 13:37:33', '2023-03-30 07:26:37');
INSERT INTO `barang` VALUES (26, '102', 'Tumblr', 4, 4, 101000, 100, 'default.png', '2023-03-11 13:38:01', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, 'Makanan', '2020-07-10 23:41:35', NULL);
INSERT INTO `category` VALUES (3, 'Minuman', '2020-07-10 23:41:45', NULL);
INSERT INTO `category` VALUES (4, 'ATK', '2020-07-12 13:29:18', NULL);
INSERT INTO `category` VALUES (5, 'Pakaian', '2020-07-12 15:34:56', NULL);
INSERT INTO `category` VALUES (6, 'Jajanan', '2020-07-13 11:50:54', NULL);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_lokasi` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'Budi Suhartono', 'L', '0821132323', 'Jagakarsa, Jaksel', '2020-07-10 23:00:21', '2020-07-10 18:02:25');
INSERT INTO `customer` VALUES (2, 'Ana', 'P', '0821132323', 'Kebon Jeruk', '2020-07-10 23:00:50', NULL);
INSERT INTO `customer` VALUES (3, 'Rizal', 'L', '0821132323', 'Depok', '2020-07-16 15:37:23', NULL);
INSERT INTO `customer` VALUES (4, 'Yuko Saputri', 'P', '0821342142', 'Kyoto', '2020-07-16 15:37:47', NULL);
INSERT INTO `customer` VALUES (5, 'Alay', 'L', '0821342142', 'Alay', '2020-07-16 15:38:02', NULL);
INSERT INTO `customer` VALUES (6, 'Berbie', 'P', '08212112', 'Jakarta Timur', '2020-07-16 15:38:20', NULL);

-- ----------------------------
-- Table structure for detail_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `detail_penjualan`;
CREATE TABLE `detail_penjualan`  (
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `discount_item` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `invoice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sale_id`) USING BTREE,
  CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `penjualan` (`sale_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_penjualan
-- ----------------------------
INSERT INTO `detail_penjualan` VALUES (2, 13, 10000, 2, 0, 20000, NULL);
INSERT INTO `detail_penjualan` VALUES (3, 13, 10000, 2, 0, 20000, NULL);
INSERT INTO `detail_penjualan` VALUES (4, 16, 10000, 4, 0, 40000, NULL);
INSERT INTO `detail_penjualan` VALUES (5, 16, 10000, 4, 0, 40000, NULL);
INSERT INTO `detail_penjualan` VALUES (7, 16, 10000, 2, 0, 20000, NULL);
INSERT INTO `detail_penjualan` VALUES (8, 16, 10000, 12, 0, 120000, NULL);
INSERT INTO `detail_penjualan` VALUES (9, 16, 10000, 4, 0, 40000, NULL);
INSERT INTO `detail_penjualan` VALUES (11, 16, 10000, 1, 0, 10000, NULL);
INSERT INTO `detail_penjualan` VALUES (13, 16, 10000, 1, 0, 10000, NULL);
INSERT INTO `detail_penjualan` VALUES (15, 24, 2000, 5, 0, 10000, NULL);
INSERT INTO `detail_penjualan` VALUES (17, 24, 2000, 6, 0, 12000, NULL);
INSERT INTO `detail_penjualan` VALUES (18, 13, 10000, 1, 0, 10000, NULL);
INSERT INTO `detail_penjualan` VALUES (21, 13, 10000, 1, 0, 10000, NULL);
INSERT INTO `detail_penjualan` VALUES (23, 20, 500000, 3, 0, 1500000, NULL);
INSERT INTO `detail_penjualan` VALUES (26, 23, 250000, 3, 0, 750000, NULL);
INSERT INTO `detail_penjualan` VALUES (27, 13, 10000, 2, 0, 20000, NULL);
INSERT INTO `detail_penjualan` VALUES (36, 22, 1000000, 1, 0, 1000000, NULL);
INSERT INTO `detail_penjualan` VALUES (40, 13, 10000, 1, 0, 10000, NULL);

-- ----------------------------
-- Table structure for keranjang
-- ----------------------------
DROP TABLE IF EXISTS `keranjang`;
CREATE TABLE `keranjang`  (
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `discount_item` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_bayar` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_table` int(11) NULL DEFAULT NULL,
  `customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT current_timestamp(0),
  `invoice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_order` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `barang` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of keranjang
-- ----------------------------
INSERT INTO `keranjang` VALUES (5, 24, 2000, 9, 0, 18000, 27, 'belum', NULL, NULL, '2023-03-26 18:29:32', NULL, NULL);
INSERT INTO `keranjang` VALUES (7, 25, 100000, 6, 0, 600000, 27, 'belum', NULL, NULL, '2023-03-26 21:17:34', 'MP2303260002', 'finis');
INSERT INTO `keranjang` VALUES (8, 25, 100000, 1, 0, 100000, 1, 'belum', NULL, NULL, '2023-03-26 21:20:04', 'MP2303260002', 'finis');
INSERT INTO `keranjang` VALUES (9, 22, 1000000, 1, 0, 1000000, 1, 'belum', NULL, NULL, '2023-03-26 21:20:32', 'MP2303260002', 'finis');
INSERT INTO `keranjang` VALUES (10, 24, 2000, 1, 0, 2000, 1, 'belum', NULL, NULL, '2023-03-26 21:20:37', 'MP2303260002', NULL);
INSERT INTO `keranjang` VALUES (11, 21, 500000, 1, 0, 500000, 1, 'belum', NULL, NULL, '2023-03-26 21:20:43', 'MP2303260002', NULL);
INSERT INTO `keranjang` VALUES (13, 21, 500000, 1, 0, 500000, 2, 'belum', NULL, NULL, '2023-03-29 23:08:05', 'MP2303290004', NULL);
INSERT INTO `keranjang` VALUES (14, 25, 100000, 1, 0, 100000, 2, 'belum', NULL, NULL, '2023-03-30 12:26:37', 'MP2303300001', 'finis');
INSERT INTO `keranjang` VALUES (15, 22, 1000000, 1, 0, 1000000, 2, 'belum', NULL, NULL, '2023-03-30 20:56:27', 'MP2303300003', 'finis');
INSERT INTO `keranjang` VALUES (16, 15, 1909090, 1, 0, 1909090, 2, 'belum', 1, NULL, '2023-03-30 20:59:50', 'MP2303300004', 'finis');
INSERT INTO `keranjang` VALUES (17, 14, 10000, 2, 0, 20000, 2, 'belum', 1, NULL, '2023-03-30 21:39:02', 'MP2303300004', 'finis');
INSERT INTO `keranjang` VALUES (18, 23, 250000, 2, 0, 500000, 2, 'belum', 1, NULL, '2023-03-30 21:52:34', 'MP2303300004', 'finis');
INSERT INTO `keranjang` VALUES (19, 24, 2000, 1, 0, 2000, 2, 'belum', 1, NULL, '2023-03-30 21:54:44', 'MP2303300004', 'finis');
INSERT INTO `keranjang` VALUES (20, 20, 500000, 1, 0, 500000, 2, 'belum', 1, NULL, '2023-03-30 22:09:17', 'MP2303300004', 'finis');
INSERT INTO `keranjang` VALUES (21, 22, 1000000, 1, 0, 1000000, 2, 'belum', 1, NULL, '2023-03-30 22:27:47', 'MP2303300005', 'finis');
INSERT INTO `keranjang` VALUES (22, 13, 10000, 1, 0, 10000, 2, 'belum', 1, NULL, '2023-03-30 22:29:20', 'MP2303300006', 'finis');
INSERT INTO `keranjang` VALUES (23, 16, 10000, 1, 0, 10000, 2, 'belum', 1, NULL, '2023-03-30 22:29:33', 'MP2303300006', 'finis');
INSERT INTO `keranjang` VALUES (24, 16, 10000, 1, 0, 10000, 2, 'belum', 0, NULL, '2023-03-30 22:32:21', 'MP2303300008', 'finis');
INSERT INTO `keranjang` VALUES (25, 14, 10000, 1, 0, 10000, 2, 'belum', 0, NULL, '2023-03-30 22:32:28', 'MP2303300008', 'finis');
INSERT INTO `keranjang` VALUES (26, 24, 2000, 1, 0, 2000, 2, 'belum', 1, NULL, '2023-03-31 17:36:42', 'MP2303310001', 'finis');
INSERT INTO `keranjang` VALUES (27, 22, 1000000, 1, 0, 1000000, 2, 'belum', 1, NULL, '2023-03-31 17:36:52', 'MP2303310001', 'finis');
INSERT INTO `keranjang` VALUES (28, 15, 1909090, 1, 0, 1909090, 2, 'belum', 1, NULL, '2023-03-31 17:37:28', 'MP2303310001', 'finis');
INSERT INTO `keranjang` VALUES (29, 22, 1000000, 1, 0, 1000000, 2, 'belum', 2, NULL, '2023-03-31 17:41:39', 'MP2303310002', 'finis');
INSERT INTO `keranjang` VALUES (30, 21, 500000, 1, 0, 500000, 2, 'belum', 2, NULL, '2023-03-31 17:41:43', 'MP2303310002', 'finis');

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan`  (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_id` int(11) NULL DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `final_price` int(11) NOT NULL,
  `cash` int(11) NOT NULL,
  `uang_kembalian` int(11) NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`sale_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
INSERT INTO `penjualan` VALUES (2, 'MP2007190001', NULL, 20000, 0, 20000, 25000, 5000, 'sam sama', '2020-07-19', 1, '2020-07-19 21:06:14');
INSERT INTO `penjualan` VALUES (3, 'MP2007190002', NULL, 20000, 0, 20000, 50000, 30000, 'iya sama sama', '2020-07-19', 1, '2020-07-19 23:13:45');
INSERT INTO `penjualan` VALUES (4, 'MP2007190003', NULL, 40000, 2000, 38000, 50000, 12000, 'sampai jumpa', '2020-07-19', 1, '2020-07-19 23:14:50');
INSERT INTO `penjualan` VALUES (5, 'MP2007190004', NULL, 40000, 2000, 38000, 50000, 12000, 'sama sama', '2020-07-19', 1, '2020-07-19 23:16:28');
INSERT INTO `penjualan` VALUES (6, 'MP2007190005', NULL, 40000, 2000, 38000, 50000, 12000, 'sama sama', '2020-07-19', 1, '2020-07-19 23:17:01');
INSERT INTO `penjualan` VALUES (7, 'MP2007190006', NULL, 20000, 5000, 15000, 15000, 0, 'terima kasih', '2020-07-19', 1, '2020-07-19 23:19:19');
INSERT INTO `penjualan` VALUES (8, 'MP2007190007', NULL, 120000, 0, 120000, 150000, 30000, 'sdasdas', '2020-07-19', 1, '2020-07-19 23:20:28');
INSERT INTO `penjualan` VALUES (9, 'MP2007200001', NULL, 40000, 5000, 35000, 50000, 15000, 'terimakasih', '2020-07-20', 1, '2020-07-20 10:01:07');
INSERT INTO `penjualan` VALUES (10, 'MP2007200002', NULL, 40000, 5000, 35000, 50000, 15000, 'terimakasih', '2020-07-20', 1, '2020-07-20 10:01:24');
INSERT INTO `penjualan` VALUES (11, 'MP2007200003', NULL, 10000, 500, 9500, 20000, 10500, 'sama sama', '2020-07-20', 1, '2020-07-20 10:02:46');
INSERT INTO `penjualan` VALUES (12, 'MP2007200004', NULL, 10000, 500, 9500, 20000, 10500, 'sama sama', '2020-07-20', 1, '2020-07-20 10:03:14');
INSERT INTO `penjualan` VALUES (13, 'MP2007200005', NULL, 10000, 500, 9500, 10000, 500, 'sama sama', '2020-07-20', 1, '2020-07-20 10:03:50');
INSERT INTO `penjualan` VALUES (14, 'MP2007200006', NULL, 10000, 500, 9500, 10000, 500, 'sama sama', '2020-07-20', 1, '2020-07-20 10:03:56');
INSERT INTO `penjualan` VALUES (15, 'MP2007230001', NULL, 10000, 2000, 8000, 12000, 4000, 'okee', '2020-07-23', 1, '2020-07-23 21:30:08');
INSERT INTO `penjualan` VALUES (16, 'MP2007230002', NULL, 10000, 2000, 8000, 12000, 4000, 'okee', '2020-07-23', 1, '2020-07-23 21:30:15');
INSERT INTO `penjualan` VALUES (17, 'MP2007230003', NULL, 12000, 2500, 9500, 10000, 500, '', '2020-07-23', 1, '2020-07-23 21:31:00');
INSERT INTO `penjualan` VALUES (18, 'MP2012200001', NULL, 10000, 0, 10000, 30000, 20000, 'sukses', '2020-12-20', 1, '2020-12-20 17:23:00');
INSERT INTO `penjualan` VALUES (19, 'MP2012200002', NULL, 10000, 0, 10000, 30000, 20000, 'sukses', '2020-12-20', 1, '2020-12-20 17:23:19');
INSERT INTO `penjualan` VALUES (20, 'MP2012200003', NULL, 10000, 0, 10000, 30000, 20000, 'sukses', '2020-12-20', 1, '2020-12-20 17:23:31');
INSERT INTO `penjualan` VALUES (21, 'MP2012200004', NULL, 10000, 0, 10000, 50000, 40000, 'sukses', '2020-12-20', 1, '2020-12-20 17:24:03');
INSERT INTO `penjualan` VALUES (22, 'MP2101280001', NULL, 520000, 0, 520000, 1000000, 480000, '', '2021-01-28', 1, '2021-01-28 16:35:19');
INSERT INTO `penjualan` VALUES (23, 'MP2106080001', NULL, 1500000, 500000, 1000000, 1000000, 0, 'mantap', '2021-06-08', 1, '2021-06-08 08:18:51');
INSERT INTO `penjualan` VALUES (24, 'MP2106080002', NULL, 1500000, 500000, 1000000, 1000000, 0, 'mantap', '2021-06-08', 1, '2021-06-08 08:19:16');
INSERT INTO `penjualan` VALUES (25, 'MP2106080003', NULL, 1500000, 500000, 1000000, 1000000, 0, 'mantap', '2021-06-08', 1, '2021-06-08 08:19:29');
INSERT INTO `penjualan` VALUES (26, 'MP2303120001', NULL, 750000, 0, 750000, 750000, 0, '', '2023-03-12', 2, '2023-03-12 20:46:48');
INSERT INTO `penjualan` VALUES (27, 'MP2303120002', NULL, 20000, 0, 20000, 20000, 0, '', '2023-03-12', 2, '2023-03-12 20:47:34');
INSERT INTO `penjualan` VALUES (28, 'MP2303240001', NULL, 250000, 0, 250000, 250000, 0, '', '2023-03-24', 2, '2023-03-24 21:22:58');
INSERT INTO `penjualan` VALUES (29, 'MP2303260001', NULL, 630000, 0, 630000, 630000, 0, '', '2023-03-26', 1, '2023-03-26 17:25:33');
INSERT INTO `penjualan` VALUES (30, 'MP2303290001', NULL, 510000, 0, 510000, 510000, 0, '', '2023-03-29', 2, '2023-03-29 23:01:35');
INSERT INTO `penjualan` VALUES (31, 'MP2303290002', NULL, 510000, 0, 510000, 510000, 0, '', '2023-03-29', 2, '2023-03-29 23:01:47');
INSERT INTO `penjualan` VALUES (32, 'MP2303290003', NULL, 510000, 0, 510000, 510000, 0, '', '2023-03-29', 2, '2023-03-29 23:04:12');
INSERT INTO `penjualan` VALUES (33, 'MP2303290004', NULL, 510000, 0, 510000, 510000, 0, '', '2023-03-29', 2, '2023-03-29 23:08:25');
INSERT INTO `penjualan` VALUES (34, 'MP2303300001', NULL, 600000, 0, 600000, 600000, 0, '', '2023-03-30', 2, '2023-03-30 20:42:29');
INSERT INTO `penjualan` VALUES (35, 'MP2303300002', NULL, 600000, 0, 600000, 600000, 0, '', '2023-03-30', 2, '2023-03-30 20:54:10');
INSERT INTO `penjualan` VALUES (36, 'MP2303300003', NULL, 1000000, 0, 1000000, 1000000, 0, '', '2023-03-30', 2, '2023-03-30 20:59:28');
INSERT INTO `penjualan` VALUES (37, 'MP2303300004', NULL, 2931090, 0, 2931090, 2931090, 0, '', '2023-03-30', 2, '2023-03-30 22:11:03');
INSERT INTO `penjualan` VALUES (38, 'MP2303300005', NULL, 3431090, 0, 3431090, 3431090, 0, '', '2023-03-30', 2, '2023-03-30 22:28:04');
INSERT INTO `penjualan` VALUES (39, 'MP2303300006', NULL, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 22:30:31');
INSERT INTO `penjualan` VALUES (40, 'MP2303300007', NULL, 10000, 0, 10000, 10000, 0, '', '2023-03-30', 2, '2023-03-30 22:30:52');
INSERT INTO `penjualan` VALUES (41, 'MP2303300008', 1, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 22:33:06');
INSERT INTO `penjualan` VALUES (42, 'MP2303300009', 1, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 22:33:23');
INSERT INTO `penjualan` VALUES (43, 'MP2303300010', 1, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 22:36:41');
INSERT INTO `penjualan` VALUES (44, 'MP2303300011', NULL, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 22:38:54');
INSERT INTO `penjualan` VALUES (45, 'MP2303300012', NULL, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 22:39:11');
INSERT INTO `penjualan` VALUES (46, 'MP2303300013', NULL, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 22:42:02');
INSERT INTO `penjualan` VALUES (47, 'MP2303300014', NULL, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 22:43:09');
INSERT INTO `penjualan` VALUES (48, 'MP2303300015', NULL, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 23:14:20');
INSERT INTO `penjualan` VALUES (49, 'MP2303300016', NULL, 20000, 0, 20000, 20000, 0, '', '2023-03-30', 2, '2023-03-30 23:20:45');
INSERT INTO `penjualan` VALUES (50, 'MP2303310001', NULL, 2911090, 0, 2911090, 0, 0, '', '2023-03-31', 2, '2023-03-31 17:40:22');
INSERT INTO `penjualan` VALUES (51, 'MP2303310002', 1, 1500000, 0, 1500000, 0, 0, '', '2023-03-31', 2, '2023-03-31 17:41:50');

-- ----------------------------
-- Table structure for stokbarang
-- ----------------------------
DROP TABLE IF EXISTS `stokbarang`;
CREATE TABLE `stokbarang`  (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `type` enum('in','out') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `supplier_id` int(11) NULL DEFAULT NULL,
  `qty` int(10) NOT NULL,
  `date` date NOT NULL,
  `created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`stock_id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `supplier_id`(`supplier_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `stokbarang_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `barang` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stokbarang_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stokbarang_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stokbarang
-- ----------------------------
INSERT INTO `stokbarang` VALUES (1, 13, 'in', 'Lusinan', 1, 15, '2020-07-15', '2020-07-15 10:59:59', 1);
INSERT INTO `stokbarang` VALUES (3, 16, 'in', 'Sekarung', NULL, 12, '2020-07-15', '2020-07-15 13:11:37', 1);
INSERT INTO `stokbarang` VALUES (4, 15, 'in', 'Sepasang', 1, 23, '2020-07-15', '2020-07-15 13:16:40', 1);
INSERT INTO `stokbarang` VALUES (6, 14, 'in', 'Daging sapi kiloan', 9, 34, '2020-07-15', '2020-07-15 21:53:37', 1);
INSERT INTO `stokbarang` VALUES (10, 20, 'in', '10 Kardus', 7, 23, '2020-07-15', '2020-07-16 00:09:58', 1);
INSERT INTO `stokbarang` VALUES (14, 15, 'out', 'hilang', NULL, 3, '2020-07-15', '2020-07-16 00:50:27', 1);
INSERT INTO `stokbarang` VALUES (15, 14, 'out', 'hilang', NULL, 4, '2020-07-15', '2020-07-16 00:50:55', 1);
INSERT INTO `stokbarang` VALUES (16, 22, 'in', '1 Kontainer', 2, 100, '2020-07-15', '2020-07-16 00:53:09', 1);
INSERT INTO `stokbarang` VALUES (17, 22, 'out', 'Rusak', NULL, 25, '2020-07-15', '2020-07-16 00:53:44', 1);
INSERT INTO `stokbarang` VALUES (19, 22, 'in', 'Borongan', NULL, 60, '2020-07-15', '2020-07-16 00:58:26', 1);
INSERT INTO `stokbarang` VALUES (20, 24, 'in', 'Permen', 1, 20, '2020-07-20', '2020-07-20 11:00:24', 2);
INSERT INTO `stokbarang` VALUES (21, 24, 'in', 'Sekarung', NULL, 15, '2020-07-20', '2020-07-20 11:48:44', 2);
INSERT INTO `stokbarang` VALUES (22, 24, 'in', 'Borongan', 1, 12, '2020-07-20', '2020-07-20 14:27:23', 2);
INSERT INTO `stokbarang` VALUES (23, 24, 'in', '', 1, 2, '2020-07-20', '2020-07-20 14:37:31', 2);
INSERT INTO `stokbarang` VALUES (24, 23, 'in', '10 Kardus', NULL, 12, '2020-07-20', '2020-07-20 14:38:36', 2);
INSERT INTO `stokbarang` VALUES (25, 21, 'in', 'Borongan', NULL, 10, '2020-11-16', '2020-11-16 07:19:27', 1);
INSERT INTO `stokbarang` VALUES (26, 13, 'in', '', NULL, 12, '2020-11-16', '2020-11-16 08:35:42', 1);
INSERT INTO `stokbarang` VALUES (27, 26, 'in', 'masuk', NULL, 100, '2023-03-11', '2023-03-11 13:38:30', 27);
INSERT INTO `stokbarang` VALUES (28, 25, 'in', 'baru beli', NULL, 10, '2023-03-11', '2023-03-11 13:38:53', 27);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, 'Toko KALI', '0821222112', 'pati', 'Toko Sembako', '2020-07-10 15:02:28', '2021-01-25 03:33:32');
INSERT INTO `supplier` VALUES (2, 'Toko ABC', '089271212', 'Klaten', 'Toko Kelontong', '2020-07-10 15:02:28', '2020-07-10 13:41:32');
INSERT INTO `supplier` VALUES (7, 'Haus!', '0821342142', 'Sawangan, Depok', 'Toko Minuman', '2020-07-15 21:52:07', NULL);
INSERT INTO `supplier` VALUES (9, 'Toko Cak Lun', '08921212', 'Semarang', 'Toko Daging', '2020-07-15 21:53:00', NULL);
INSERT INTO `supplier` VALUES (10, 'Toko C', '0821132323', 'Kalimanuk', '', '2020-07-16 01:10:59', NULL);
INSERT INTO `supplier` VALUES (11, 'James', '1212121', 'Depok', 'Tukang Kopi', '2020-07-16 01:11:17', NULL);
INSERT INTO `supplier` VALUES (12, 'raldin', '0821132323', 'Depok', 'asd', '2021-01-28 16:18:26', NULL);
INSERT INTO `supplier` VALUES (13, 'Toko Sawangan', '0821132323', 'Kalimanuk', 'Toko market', '2021-03-24 06:11:03', NULL);

-- ----------------------------
-- Table structure for table
-- ----------------------------
DROP TABLE IF EXISTS `table`;
CREATE TABLE `table`  (
  `id_table` int(255) NOT NULL AUTO_INCREMENT,
  `nama_table` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_table`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of table
-- ----------------------------
INSERT INTO `table` VALUES (1, 'meja 1');
INSERT INTO `table` VALUES (2, 'meja 2');
INSERT INTO `table` VALUES (3, 'meja 3');
INSERT INTO `table` VALUES (4, 'meja 4');
INSERT INTO `table` VALUES (5, 'meja 5');
INSERT INTO `table` VALUES (6, 'meja 6');
INSERT INTO `table` VALUES (7, 'meja 7');
INSERT INTO `table` VALUES (8, 'meja 8');

-- ----------------------------
-- Table structure for table_unit
-- ----------------------------
DROP TABLE IF EXISTS `table_unit`;
CREATE TABLE `table_unit`  (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of table_unit
-- ----------------------------
INSERT INTO `table_unit` VALUES (2, 'Kilogram', '2020-07-10 23:42:52', NULL);
INSERT INTO `table_unit` VALUES (4, 'Buah', '2020-07-13 00:57:31', NULL);
INSERT INTO `table_unit` VALUES (5, 'Pack', '2020-07-13 00:57:44', NULL);
INSERT INTO `table_unit` VALUES (6, 'Lusin', '2020-07-13 00:57:53', NULL);
INSERT INTO `table_unit` VALUES (7, 'Karton', '2020-07-13 11:51:05', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` int(1) NOT NULL COMMENT '1:admin,2:kasir',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Rizal Aldin', 'Depok', 1);
INSERT INTO `user` VALUES (2, 'kasir1', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'James', 'Solo, Jawa Tengah', 2);
INSERT INTO `user` VALUES (27, 'kasir2', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Kasir2', 'Kasir', 2);

SET FOREIGN_KEY_CHECKS = 1;
