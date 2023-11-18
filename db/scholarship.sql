/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.4.6-MariaDB : Database - djemfcst_v2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`djemfcst_v2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `djemfcst_v2`;

/*Table structure for table `scholarship_grant` */

DROP TABLE IF EXISTS `scholarship_grant`;

CREATE TABLE `scholarship_grant` (
  `SysPK_Item` decimal(10,0) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `fullDeduct` varchar(5) DEFAULT 'NO',
  `grant_amount` decimal(10,2) DEFAULT NULL,
  `Refundable` varchar(255) DEFAULT 'NO',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scholarship_grant` */

insert  into `scholarship_grant`(`SysPK_Item`,`code`,`name`,`fullDeduct`,`grant_amount`,`Refundable`,`description`) values ('-189663673',1,'GOVERNORS SCHOLAR','YES','0.00','YES',NULL),('-700414023',2,'LGU SAN JOSE','NO','10000.00','NO',NULL),('-700414023',3,'LGU BASILISA','YES','0.00','YES',NULL),('-1104078097',4,'CMC','YES','0.00','NO',NULL),('-1992503664',5,'TES','YES','0.00','NO',NULL),('-792504218',6,'TDP','NO','10000.00','NO','TABANG DUOT PANDAY'),('-263839284',7,'ACADEMIC DISCOUNT','NO',NULL,'NO',NULL);

/*Table structure for table `scholarship_grant_details` */

DROP TABLE IF EXISTS `scholarship_grant_details`;

CREATE TABLE `scholarship_grant_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `scholarship_code` int(11) DEFAULT NULL,
  `grant_amount` decimal(10,2) DEFAULT NULL,
  `deducted_amount` decimal(10,2) DEFAULT NULL,
  `is_grant` tinyint(4) DEFAULT 0,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `scholarship_grant_details` */

insert  into `scholarship_grant_details`(`id`,`student_id`,`scholarship_code`,`grant_amount`,`deducted_amount`,`is_grant`,`remarks`,`status`) values (2,9807,6,'10000.00','700.00',0,'PARTIAL','Active');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
