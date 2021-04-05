-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- plc 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `plc` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `plc`;

-- 테이블 plc.drum_data 구조 내보내기
CREATE TABLE IF NOT EXISTS `drum_data` (
  `IDX` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `BARCODE` varchar(200) DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL COMMENT 'I : 입고 , O : 출고',
  `IN_TIME` datetime DEFAULT NULL,
  `OUT_TIME` datetime DEFAULT NULL,
  `LOSS` char(1) DEFAULT 'F' COMMENT 'T : 불량 , F : 정상',
  `LOSS_CNT` int(11) DEFAULT 0,
  `CREATETIME` datetime DEFAULT NULL,
  `MODIFIEDTIME` datetime DEFAULT NULL,
  `DELYN` char(1) DEFAULT 'N',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.drum_data:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `drum_data` DISABLE KEYS */;
INSERT INTO `drum_data` (`IDX`, `BARCODE`, `STATUS`, `IN_TIME`, `OUT_TIME`, `LOSS`, `LOSS_CNT`, `CREATETIME`, `MODIFIEDTIME`, `DELYN`) VALUES
	(1, 'L2501', 'I', '2021-03-30 17:15:20', NULL, 'F', 0, '2021-03-30 17:15:20', NULL, 'N'),
	(2, 'L3252', 'O', '2021-03-30 17:15:22', '2021-03-30 17:15:31', 'F', 1, '2021-03-30 17:15:22', '2021-03-30 17:15:34', 'N'),
	(3, 'L2141', 'O', '2021-03-30 17:15:23', '2021-03-30 17:15:28', 'F', 0, '2021-03-30 17:15:23', NULL, 'N');
/*!40000 ALTER TABLE `drum_data` ENABLE KEYS */;

-- 테이블 plc.drum_data_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `drum_data_log` (
  `IDX_LOG` int(11) NOT NULL AUTO_INCREMENT,
  `IDX` int(11) DEFAULT NULL,
  `BARCODE` varchar(50) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `IN_TIME` datetime DEFAULT NULL,
  `OUT_TIME` datetime DEFAULT NULL,
  `LOSS` char(1) DEFAULT NULL,
  `LOSS_CNT` int(11) DEFAULT 0,
  `CREATETIME` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `CREATETIME_LOG` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`IDX_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.drum_data_log:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `drum_data_log` DISABLE KEYS */;
INSERT INTO `drum_data_log` (`IDX_LOG`, `IDX`, `BARCODE`, `STATUS`, `IN_TIME`, `OUT_TIME`, `LOSS`, `LOSS_CNT`, `CREATETIME`, `CREATETIME_LOG`) VALUES
	(1, 1, 'L2501', 'I', '2021-03-30 17:15:20', NULL, 'F', 0, '2021-03-30 17:15:20', '2021-03-30 17:15:20'),
	(2, 2, 'L3252', 'I', '2021-03-30 17:15:22', NULL, 'F', 0, '2021-03-30 17:15:22', '2021-03-30 17:15:22'),
	(3, 3, 'L2141', 'I', '2021-03-30 17:15:23', NULL, 'F', 0, '2021-03-30 17:15:23', '2021-03-30 17:15:23'),
	(4, 3, 'L2141', 'O', '2021-03-30 17:15:23', '2021-03-30 17:15:28', 'F', 0, '2021-03-30 17:15:23', '2021-03-30 17:15:28'),
	(5, 2, 'L3252', 'O', '2021-03-30 17:15:22', '2021-03-30 17:15:31', 'F', 0, '2021-03-30 17:15:22', '2021-03-30 17:15:31'),
	(6, 2, 'L3252', 'O', '2021-03-30 17:15:22', '2021-03-30 17:15:31', 'T', 1, '2021-03-30 17:15:22', '2021-03-30 17:15:34'),
	(7, 2, 'L3252', 'O', '2021-03-30 17:15:22', '2021-03-30 17:15:31', 'F', 1, '2021-03-30 17:15:22', '2021-03-30 17:15:39');
/*!40000 ALTER TABLE `drum_data_log` ENABLE KEYS */;

-- 테이블 plc.plc_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `plc_log` (
  `createTime` varchar(50) DEFAULT '',
  `code_name` varchar(50) DEFAULT '',
  `address` varchar(50) DEFAULT NULL,
  `unit_id` int(11) unsigned DEFAULT NULL,
  `value` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.plc_log:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `plc_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `plc_log` ENABLE KEYS */;

-- 테이블 plc.port_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `port_info` (
  `port` varchar(10) DEFAULT NULL,
  `port_info` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.port_info:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `port_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `port_info` ENABLE KEYS */;

-- 테이블 plc.server_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `server_info` (
  `mIDX` int(11) NOT NULL AUTO_INCREMENT,
  `machine_name` varchar(50) DEFAULT NULL,
  `machine_ip` varchar(50) DEFAULT NULL,
  `machine_plc` int(11) DEFAULT NULL,
  PRIMARY KEY (`mIDX`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.server_info:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `server_info` DISABLE KEYS */;
INSERT INTO `server_info` (`mIDX`, `machine_name`, `machine_ip`, `machine_plc`) VALUES
	(1, '설비1', '192.168.1.10', NULL),
	(2, '설비2', '192.168.1.11', NULL),
	(3, '설비3', '192.168.1.12', NULL),
	(4, '설비4', '192.168.1.13', NULL),
	(5, '설비5', '192.168.1.14', NULL);
/*!40000 ALTER TABLE `server_info` ENABLE KEYS */;

-- 테이블 plc.tbl_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_board` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `board_name` char(50) NOT NULL DEFAULT '',
  `board_addr` char(50) NOT NULL DEFAULT '',
  `board_sec` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.tbl_board:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` (`id`, `board_name`, `board_addr`, `board_sec`) VALUES
	(1, '일일 생산수량 및 불량율', 'Daily-Report.html', 10),
	(2, '주간 생산수량 및 불량율', 'Weekly-Report.html', 10),
	(3, '월간 생산수량 및 불량율', 'Monthly-Report.html', 10),
	(4, '설비별 가동룰', 'Equip-Report.html', 10);
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;

-- 테이블 plc.tbl_login_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_login_log` (
  `id` varchar(11) NOT NULL DEFAULT '',
  `Name` char(20) DEFAULT NULL,
  `login_startTime` datetime DEFAULT NULL,
  `logout_endTime` datetime DEFAULT NULL,
  `CREATTIM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.tbl_login_log:~59 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_login_log` DISABLE KEYS */;
INSERT INTO `tbl_login_log` (`id`, `Name`, `login_startTime`, `logout_endTime`, `CREATTIM`) VALUES
	('goodus', '관리자', '2021-03-23 16:02:08', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-23 16:06:45', NULL),
	('goodus', '관리자', '2021-03-23 16:08:30', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-23 16:08:35', NULL),
	('goodus', '관리자', '2021-03-23 16:08:39', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-23 16:16:33', NULL),
	('goodus', '관리자', '2021-03-23 16:21:17', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-23 16:23:49', NULL),
	('goodus', '관리자', '2021-03-23 16:23:53', NULL, NULL),
	('goodus', '관리자', '2021-03-23 16:24:14', NULL, NULL),
	('goodus', '관리자', '2021-03-23 16:24:40', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-23 16:24:43', NULL),
	('goodus1', '213123', '2021-03-23 16:25:06', NULL, NULL),
	('goodus1', '213123', NULL, '2021-03-23 16:26:51', NULL),
	('goodus', '관리자', '2021-03-23 16:27:01', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-23 16:27:16', NULL),
	('goodus', '관리자', '2021-03-23 16:27:32', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-23 16:48:56', NULL),
	('goodus', '관리자', '2021-03-23 16:49:03', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-23 16:51:10', NULL),
	('goodus1', '213123', '2021-03-23 16:51:15', NULL, NULL),
	('goodus1', '213123', NULL, '2021-03-23 16:52:11', NULL),
	('goodus', '관리자', '2021-03-23 16:52:16', NULL, NULL),
	('goodus', '관리자', '2021-03-23 16:59:38', NULL, NULL),
	('goodus', '관리자', '2021-03-24 00:04:29', NULL, NULL),
	('goodus', '관리자', '2021-03-24 00:21:37', NULL, NULL),
	('goodus', '관리자', '2021-03-24 00:22:39', NULL, NULL),
	('goodus', '관리자', '2021-03-24 18:26:52', NULL, NULL),
	('goodus', '관리자', '2021-03-24 18:50:39', NULL, NULL),
	('goodus', '관리자', '2021-03-30 11:21:09', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-30 11:23:33', NULL),
	('goodus1', '213123', '2021-03-30 11:23:46', NULL, NULL),
	('goodus', '관리자', '2021-03-30 13:35:34', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-30 13:35:42', NULL),
	('goodus', '관리자', '2021-03-30 13:37:13', NULL, NULL),
	('goodus', '관리자', '2021-03-30 14:01:42', NULL, NULL),
	('goodus', '관리자', '2021-03-30 14:01:51', NULL, NULL),
	('goodus', '관리자', '2021-03-30 14:03:55', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-30 14:09:29', NULL),
	('goodus', '관리자', '2021-03-30 14:09:41', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-30 15:14:29', NULL),
	('goodus', '관리자', '2021-03-30 15:19:08', NULL, NULL),
	('goodus', '관리자', '2021-03-30 15:29:58', NULL, NULL),
	('goodus', '관리자', '2021-03-30 15:35:30', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-30 15:35:50', NULL),
	('goodus', '관리자', '2021-03-30 15:35:57', NULL, NULL),
	('goodus', '관리자', '2021-03-30 16:20:45', NULL, NULL),
	('goodus', '관리자', '2021-03-30 16:32:57', NULL, NULL),
	('goodus', '관리자', '2021-03-30 16:42:24', NULL, NULL),
	('goodus', '관리자', '2021-03-30 16:45:50', NULL, NULL),
	('goodus', '관리자', '2021-03-30 16:53:52', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-30 16:54:01', NULL),
	('goodus', '관리자', '2021-03-30 16:54:07', NULL, NULL),
	('goodus', '관리자', '2021-03-30 16:59:55', NULL, NULL),
	('goodus', '관리자', '2021-03-30 17:22:56', NULL, NULL),
	('goodus', '관리자', '2021-03-30 17:34:18', NULL, NULL),
	('goodus', '관리자', '2021-03-31 09:25:02', NULL, NULL),
	('goodus', '관리자', '2021-03-31 11:00:27', NULL, NULL),
	('goodus', '관리자', NULL, '2021-03-31 11:21:47', NULL);
/*!40000 ALTER TABLE `tbl_login_log` ENABLE KEYS */;

-- 테이블 plc.tbl_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `ID` varchar(30) NOT NULL DEFAULT '',
  `PASSWORD` varchar(100) NOT NULL DEFAULT '',
  `NAME` varchar(30) NOT NULL DEFAULT '',
  `PHONE` varchar(38) NOT NULL DEFAULT '',
  `CREATETIME` datetime NOT NULL,
  `DELYN` char(1) NOT NULL DEFAULT 'N',
  `LEVEL` int(11) DEFAULT NULL COMMENT '1 : 유저 , 2: 관리자',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.tbl_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`ID`, `PASSWORD`, `NAME`, `PHONE`, `CREATETIME`, `DELYN`, `LEVEL`) VALUES
	('123123123', 'wrABYMK1OMOISmANw7ZkW8O5w6s=', '123123', '123123', '2021-03-12 10:47:36', 'N', 1),
	('goodus', '4444', '관리자', '1231241', '2021-03-10 21:41:46', 'N', 2),
	('goodus1', '4444', '213123', '312312', '2021-03-12 10:47:01', 'N', 1),
	('Test', 'test1111', '테스트', '010-1234-5678', '2021-03-30 15:35:14', 'N', NULL);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;

-- 테이블 plc.tbl_user_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_user_board` (
  `ID` char(20) NOT NULL DEFAULT '',
  `boardIDX` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.tbl_user_board:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_user_board` DISABLE KEYS */;
INSERT INTO `tbl_user_board` (`ID`, `boardIDX`) VALUES
	('Test', 1),
	('goodus', 1),
	('goodus', 2),
	('goodus', 3),
	('goodus', 4);
/*!40000 ALTER TABLE `tbl_user_board` ENABLE KEYS */;

-- 테이블 plc.tbl_worker_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_worker_info` (
  `wIDX` int(11) NOT NULL AUTO_INCREMENT,
  `work_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `day_worker` int(11) DEFAULT 0,
  `night_worker` int(11) DEFAULT 0,
  PRIMARY KEY (`wIDX`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 plc.tbl_worker_info:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_worker_info` DISABLE KEYS */;
INSERT INTO `tbl_worker_info` (`wIDX`, `work_date`, `day_worker`, `night_worker`) VALUES
	(1, '2021-03-24 18:16:05', 10, 0),
	(2, '2021-03-30 17:17:33', 99, 0);
/*!40000 ALTER TABLE `tbl_worker_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
