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
  `designation` varchar(255) DEFAULT NULL,
  `sig_person_id` int(11) DEFAULT NULL,
  `sig_form_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `signatory_designation` */

insert  into `signatory_designation`(`id`,`designation`,`sig_person_id`,`sig_form_id`) values (1,'Vice President for Academic  Affairs',4,1),(2,'Cashier',5,1),(3,'School Registrar',6,1),(4,'Guidance Coordinator',7,1),(5,'School Registrar',9,2),(6,'School Cashier',5,2),(7,'School Cashier',8,2),(8,'Basic ED. Registrar',9,3),(9,'Cashier',5,3),(10,'Principal',8,3),(11,'Basic ED. Registrar',9,4),(12,'Cashier',5,4),(13,'Principal',8,4),(14,'Cashier',10,5),(15,'Registrar',6,5),(16,'Cashier',10,6),(17,'School Cashier',5,7),(18,'School Registrar',6,7),(19,'Registrar',6,8),(20,'Assistant Registrar',11,9),(21,'Registrar',12,9),(22,'Vice President',2,9);

/*Table structure for table `signatory_form` */

DROP TABLE IF EXISTS `signatory_form`;

CREATE TABLE `signatory_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `signatory_form` */

insert  into `signatory_form`(`id`,`name`) values (1,'ENROLLMENT SLIP COLLEGE'),(2,'ENROLLMENT SLIP SENIOR HIGH'),(3,'ENROLLMENT SLIP JUNIOR HIGH'),(4,'ENROLLMENT SLIP ELEMENTARY'),(5,'STUDENT REGISTRATION / ASSESSMENT FORM'),(6,'STATEMENT OF ACCOUNT'),(7,'CERTIFICATE OF ENROLLMENT AND BREAK DOWN OF FEES'),(8,'REPORT RATING'),(9,'TRANSCRIPT OF RECORDS');

/*Table structure for table `signatory_person` */

DROP TABLE IF EXISTS `signatory_person`;

CREATE TABLE `signatory_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `signatory_person` */

insert  into `signatory_person`(`id`,`name`,`status`) values (1,'Mommy','ACTIVE'),(2,'DR. BENGLEN B. ECLEO','ACTIVE'),(3,'Jun','ACTIVE'),(4,'MARICHU M. ESNARDO, M.A.','ACTIVE'),(5,'MERNELITA C. SAPID','ACTIVE'),(6,'JULIET D. BORJA','ACTIVE'),(7,'JANETH A. MARZAN, M.A.','ACTIVE'),(8,'RAVELYEN C. MONATO, LPT.','ACTIVE'),(9,'ANALYN C. SAPID','ACTIVE'),(10,'EMMALEN S. PACULBA','ACTIVE'),(11,'EVELINDA P. RAMIREZ','ACTIVE'),(12,'ELENA A. SILVANO, M.A.','ACTIVE');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
