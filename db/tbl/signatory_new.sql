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

/*Table structure for table `signatory_designation` */

DROP TABLE IF EXISTS `signatory_designation`;

CREATE TABLE `signatory_designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sig_person_id` int(11) DEFAULT NULL,
  `sig_form_id` int(11) DEFAULT NULL,
  `sig_position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `signatory_designation` */

insert  into `signatory_designation`(`id`,`sig_person_id`,`sig_form_id`,`sig_position_id`) values (1,4,1,1),(2,5,1,2),(3,6,1,3),(4,7,1,4),(5,9,2,3),(6,5,2,5),(7,8,2,5),(8,9,3,6),(9,5,3,2),(10,8,3,7),(11,9,4,6),(12,5,4,2),(13,8,4,7),(14,5,5,2),(15,6,5,12),(16,10,6,2),(17,5,7,2),(18,6,7,12),(19,6,8,12),(20,11,9,8),(21,12,9,12),(22,2,9,9),(23,5,10,2),(24,9,10,12),(25,13,11,10),(26,14,11,11),(27,4,11,12),(28,6,11,12);

/*Table structure for table `signatory_form` */

DROP TABLE IF EXISTS `signatory_form`;

CREATE TABLE `signatory_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `signatory_form` */

insert  into `signatory_form`(`id`,`name`) values (1,'ENROLLMENT SLIP COLLEGE'),(2,'ENROLLMENT SLIP SENIOR HIGH'),(3,'ENROLLMENT SLIP JUNIOR HIGH'),(4,'ENROLLMENT SLIP ELEMENTARY'),(5,'STUDENT REGISTRATION / ASSESSMENT FORM'),(6,'STATEMENT OF ACCOUNT'),(7,'COE AND BREAK DOWN OF FEES - COLLEGE'),(8,'REPORT RATING'),(9,'TRANSCRIPT OF RECORDS'),(10,'COE AND BREAK DOWN OF FEES - HIGH SCHOOL'),(11,'GRADE SHEET');

/*Table structure for table `signatory_person` */

DROP TABLE IF EXISTS `signatory_person`;

CREATE TABLE `signatory_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `signatory_person` */

insert  into `signatory_person`(`id`,`name`,`status`) values (1,'Mommy','INACTIVE'),(2,'DR. BENGLEN B. ECLEO','ACTIVE'),(3,'Jun','INACTIVE'),(4,'MARICHU M. ESNARDO, M.A.','ACTIVE'),(5,'MERNELITA C. SAPID','ACTIVE'),(6,'JULIET D. BORJA','ACTIVE'),(7,'JANETH A. MARZAN, M.A.','ACTIVE'),(8,'RAVELYEN C. MONATO, LPT.','ACTIVE'),(9,'ANALYN C. SAPID','ACTIVE'),(10,'EMMALEN S. PACULBA','ACTIVE'),(11,'EVELINDA P. RAMIREZ','ACTIVE'),(12,'ELENA A. SILVANO, M.A.','ACTIVE'),(13,'ELESON M. TUBAT ','ACTIVE'),(14,'KEVEN L. BELINARIO ','ACTIVE');

/*Table structure for table `signatory_position` */

DROP TABLE IF EXISTS `signatory_position`;

CREATE TABLE `signatory_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `signatory_position` */

insert  into `signatory_position`(`id`,`name`,`status`) values (1,'Vice President for Academic  Affairs','ACTIVE'),(2,'Cashier','ACTIVE'),(3,'School Registrar','ACTIVE'),(4,'Guidance Coordinator','ACTIVE'),(5,'School Cashier','ACTIVE'),(6,'Basic ED. Registrar','ACTIVE'),(7,'Principal','ACTIVE'),(8,'Assistant Registrar','ACTIVE'),(9,'Vice President','ACTIVE'),(10,'System Administrator','ACTIVE'),(11,'HEMIS Incharged','ACTIVE'),(12,'Registrar','ACTIVE');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
