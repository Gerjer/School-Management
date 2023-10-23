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

/*Table structure for table `sectioning` */

DROP TABLE IF EXISTS `sectioning`;

CREATE TABLE `sectioning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_year` varchar(255) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `inorder` int(11) DEFAULT NULL,
  `section_name` varchar(255) DEFAULT NULL,
  `number_students` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `availability` int(11) DEFAULT 1,
  `status_id` int(11) DEFAULT 1,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `sectioning` */

insert  into `sectioning`(`id`,`school_year`,`subject_id`,`instructor_id`,`inorder`,`section_name`,`number_students`,`batch_id`,`category_id`,`availability`,`status_id`,`start_time`,`end_time`) values (1,'2023',1226,1,1,'A',50,165,13,0,1,'2023-05-19 14:35:11',NULL),(2,'2023',1226,1,2,'B',10,165,13,1,1,'2023-05-19 14:35:24',NULL),(3,'2023',1226,104,3,'C',7,165,13,0,1,'2023-05-19 14:46:18',NULL),(4,'2023',1227,135,1,'A',5,165,13,1,1,'2023-05-19 14:48:12',NULL),(5,'2023',1227,135,2,'B',5,165,13,1,1,'2023-05-19 14:48:22',NULL),(6,'2023',1227,135,3,'C',5,165,13,1,1,'2023-05-19 14:48:31',NULL),(7,'2023',1226,104,4,'D',5,165,13,1,1,'2023-05-22 10:48:20',NULL),(8,'2023',1226,104,5,'E',5,165,13,1,1,'2023-05-24 13:42:23',NULL),(9,'2023',1226,104,6,'F',6,165,13,1,1,'2023-05-24 13:53:56',NULL),(10,'2023',1228,2,1,'A',5,165,13,1,1,'2023-05-26 14:04:24',NULL),(11,'2023',1228,2,2,'B',5,165,13,1,1,'2023-05-26 14:04:37',NULL);

/*Table structure for table `sectioning_details` */

DROP TABLE IF EXISTS `sectioning_details`;

CREATE TABLE `sectioning_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectioning_id` int(11) DEFAULT NULL,
  `student_subject_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT 1,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

/*Data for the table `sectioning_details` */

insert  into `sectioning_details`(`id`,`sectioning_id`,`student_subject_id`,`status_id`,`start_time`,`end_time`) values (10,1,55768,1,'2023-05-21 17:18:34',NULL),(12,1,55769,1,'2023-05-21 17:19:25',NULL),(14,1,55770,1,'2023-05-21 17:20:13',NULL),(24,1,55777,1,'2023-05-21 17:50:12',NULL),(25,2,55778,1,'2023-05-21 17:52:04',NULL),(26,2,55779,1,'2023-05-21 17:54:52',NULL),(28,2,55767,1,'2023-05-21 18:00:12',NULL),(29,2,55780,1,'2023-05-21 18:01:27',NULL),(30,2,55781,1,'2023-05-21 18:02:08',NULL),(31,3,55782,1,'2023-05-21 18:09:26',NULL),(32,3,55783,1,'2023-05-21 18:14:48',NULL),(33,3,55784,1,'2023-05-21 18:19:55',NULL),(34,3,55785,1,'2023-05-21 18:21:15',NULL),(35,3,55786,1,'2023-05-21 18:23:25',NULL),(37,2,55789,1,'2023-05-24 13:25:17',NULL),(39,7,55788,1,'2023-05-24 13:26:04',NULL),(40,7,55790,1,'2023-05-24 13:44:36',NULL),(43,7,55791,1,'2023-05-24 14:06:10',NULL),(49,7,55766,1,'2023-05-24 16:15:08',NULL),(50,1,55792,1,'2023-05-24 17:44:37',NULL),(51,1,55701,1,'2023-05-26 14:18:49',NULL),(52,1,55702,1,'2023-05-26 14:18:49',NULL),(53,1,55703,1,'2023-05-26 14:18:49',NULL),(54,1,55704,1,'2023-05-26 14:18:49',NULL),(55,1,55705,1,'2023-05-26 14:18:49',NULL),(56,1,55706,1,'2023-05-26 14:18:49',NULL),(57,1,55707,1,'2023-05-26 14:18:49',NULL),(58,1,55708,1,'2023-05-26 14:18:49',NULL),(59,1,55709,1,'2023-05-26 14:18:49',NULL),(60,1,55710,1,'2023-05-26 14:18:49',NULL),(61,1,55711,1,'2023-05-26 14:18:49',NULL),(62,1,55712,1,'2023-05-26 14:18:49',NULL),(63,1,55713,1,'2023-05-26 14:18:49',NULL),(64,1,55714,1,'2023-05-26 14:18:49',NULL),(65,1,55715,1,'2023-05-26 14:18:49',NULL),(66,1,55716,1,'2023-05-26 14:18:49',NULL),(67,1,55717,1,'2023-05-26 14:18:49',NULL),(68,1,55718,1,'2023-05-26 14:18:49',NULL),(69,1,55719,1,'2023-05-26 14:18:49',NULL),(70,1,55720,1,'2023-05-26 14:18:49',NULL),(71,1,55721,1,'2023-05-26 14:18:49',NULL),(72,1,55722,1,'2023-05-26 14:18:49',NULL),(73,1,55723,1,'2023-05-26 14:18:49',NULL),(74,1,55724,1,'2023-05-26 14:18:49',NULL),(75,1,55725,1,'2023-05-26 14:18:49',NULL),(76,1,55726,1,'2023-05-26 14:18:49',NULL),(77,1,55729,1,'2023-05-26 14:18:49',NULL),(78,1,55730,1,'2023-05-26 14:18:49',NULL),(79,1,55731,1,'2023-05-26 14:18:49',NULL),(80,1,55732,1,'2023-05-26 14:18:49',NULL),(81,1,55733,1,'2023-05-26 14:18:49',NULL),(82,1,55734,1,'2023-05-26 14:18:49',NULL),(83,1,55735,1,'2023-05-26 14:18:49',NULL),(84,1,55736,1,'2023-05-26 14:18:49',NULL),(85,1,55737,1,'2023-05-26 14:18:49',NULL),(86,1,55738,1,'2023-05-26 14:18:49',NULL),(87,1,55739,1,'2023-05-26 14:18:49',NULL),(88,1,55740,1,'2023-05-26 14:18:49',NULL),(89,1,55741,1,'2023-05-26 14:18:49',NULL),(90,3,55793,1,'2023-05-30 14:21:22',NULL),(91,3,55794,1,'2023-05-30 14:22:21',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
