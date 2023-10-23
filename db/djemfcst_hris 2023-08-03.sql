/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.4.6-MariaDB : Database - djemfcst_hris
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`djemfcst_hris` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `djemfcst_hris`;

/*Table structure for table `absenteeism` */

DROP TABLE IF EXISTS `absenteeism`;

CREATE TABLE `absenteeism` (
  `AB_ID` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `employee_number` varchar(255) DEFAULT NULL,
  `dtr_date` date DEFAULT NULL,
  `AB_Hours` double DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `Time_Start` varchar(50) DEFAULT NULL,
  `Time_End` varchar(50) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`AB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `absenteeism` */

/*Table structure for table `applicants` */

DROP TABLE IF EXISTS `applicants`;

CREATE TABLE `applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_path` varchar(255) NOT NULL,
  `file_ex` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 0 COMMENT '0 = for approval, 1 = hired, 2 = rejected',
  `is_deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `applicants` */

insert  into `applicants`(`id`,`full_path`,`file_ex`,`position`,`first_name`,`middle_name`,`last_name`,`created_at`,`status`,`is_deleted`) values (1,'storage/uploads/applications/12_03_2021_21_40_40_application_15.jpg','jpg','Quality Management Representative','Rochelle','L','Caculba','2021-12-04 05:40:40',1,0);

/*Table structure for table `application_ot` */

DROP TABLE IF EXISTS `application_ot`;

CREATE TABLE `application_ot` (
  `overtime_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_number` varchar(255) DEFAULT NULL,
  `overtime_hrs_from` double DEFAULT NULL,
  `overtime_hrs_to` double DEFAULT NULL,
  `overtime_date` date DEFAULT NULL,
  `overtime_status` varchar(255) DEFAULT 'PENDING',
  PRIMARY KEY (`overtime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `application_ot` */

/*Table structure for table `approved_employee_ot` */

DROP TABLE IF EXISTS `approved_employee_ot`;

CREATE TABLE `approved_employee_ot` (
  `SysPK_Emp` varchar(255) DEFAULT NULL,
  `UserID_Empl` varchar(255) DEFAULT NULL,
  `Name_Empl` varchar(255) DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `Group` varchar(255) DEFAULT NULL,
  `OvertimeDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `approved_employee_ot` */

/*Table structure for table `approved_ot` */

DROP TABLE IF EXISTS `approved_ot`;

CREATE TABLE `approved_ot` (
  `OT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `employee_number` varchar(255) DEFAULT NULL,
  `dtr_date` date DEFAULT NULL,
  `OT_Hours` double DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `Time_Start` varchar(50) DEFAULT NULL,
  `Time_End` varchar(50) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `stat` varchar(255) DEFAULT 'PENDING',
  PRIMARY KEY (`OT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `approved_ot` */

/*Table structure for table `cash_advances` */

DROP TABLE IF EXISTS `cash_advances`;

CREATE TABLE `cash_advances` (
  `SysPK_CshAdv` decimal(10,0) NOT NULL,
  `SysFK_Empl_CshAdv` decimal(10,0) DEFAULT NULL,
  `UserCode_CshAdv` varchar(50) DEFAULT NULL,
  `Name_CshAdv` varchar(255) DEFAULT NULL,
  `DateTrans_CshAdv` date DEFAULT NULL,
  `Amount_CshAdv` double DEFAULT NULL,
  `Balance_CshAdv` double DEFAULT NULL,
  `Terms_CshAdv` int(11) DEFAULT NULL,
  `AmortAmount_CshAdv` double DEFAULT NULL,
  `Remarks_CshAdv` varchar(255) DEFAULT NULL,
  `Description_CshAdv` varchar(255) DEFAULT NULL,
  `CompanyCode` varchar(255) DEFAULT NULL,
  `ProjectCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SysPK_CshAdv`),
  KEY `NewIndex1` (`SysFK_Empl_CshAdv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cash_advances` */

/*Table structure for table `cost_center` */

DROP TABLE IF EXISTS `cost_center`;

CREATE TABLE `cost_center` (
  `cost_center_id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_center_code` varchar(255) DEFAULT NULL,
  `cost_center` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `balance` double DEFAULT 0,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cost_center_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `cost_center` */

insert  into `cost_center`(`cost_center_id`,`cost_center_code`,`cost_center`,`address`,`balance`,`remarks`) values (1,'CC1','ADMIN & SELLING','Main Office',1000000,''),(2,'CC2','INDIRECT LABOR','MAIN OFFICE',1000000,''),(3,'CC3','MANUFACTURING','MAIN OFFICE',1000000,''),(4,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,'10000'),(6,NULL,NULL,NULL,NULL,'CC'),(7,NULL,NULL,NULL,NULL,'CC1'),(8,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `cost_center_details` */

DROP TABLE IF EXISTS `cost_center_details`;

CREATE TABLE `cost_center_details` (
  `cost_center_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_center_id` int(11) DEFAULT NULL,
  `trans_type` varchar(255) DEFAULT NULL,
  `current_balance` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `new_balance` double DEFAULT NULL,
  `date_save` date DEFAULT NULL,
  `save_by_id` int(11) DEFAULT NULL,
  `save_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cost_center_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `cost_center_details` */

insert  into `cost_center_details`(`cost_center_detail_id`,`cost_center_id`,`trans_type`,`current_balance`,`amount`,`new_balance`,`date_save`,`save_by_id`,`save_by`) values (1,1,'DEPOSIT',1000000,1000000,1000000,'2019-06-12',1,'MARK CHIN'),(2,2,'DEPOSIT',1000000,1000000,1000000,'2019-06-12',1,'MARK CHIN'),(3,3,'DEPOSIT',1000000,1000000,1000000,'2019-06-12',1,'MARK CHIN'),(4,4,'DEPOSIT',NULL,NULL,NULL,'2019-09-25',1,'MARK CHIN'),(5,4,'DEPOSIT',NULL,NULL,NULL,'2022-08-31',1,'Mark Chin'),(6,5,'DEPOSIT',NULL,NULL,NULL,'2022-08-31',1,'Mark Chin'),(7,6,'DEPOSIT',NULL,NULL,NULL,'2022-08-31',1,'Mark Chin'),(8,7,'DEPOSIT',NULL,NULL,NULL,'2022-08-31',1,'Mark Chin'),(9,8,'DEPOSIT',NULL,NULL,NULL,'2022-08-31',1,'Mark Chin');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `SysPK_Dept` int(11) NOT NULL AUTO_INCREMENT,
  `GroupName_Dept` varchar(100) DEFAULT NULL,
  `DeptCode_Dept` varchar(50) DEFAULT NULL,
  `Name_Dept` varchar(255) DEFAULT NULL,
  `Head_Dept` varchar(255) DEFAULT NULL,
  `Head_Dept_ID` varchar(20) DEFAULT NULL,
  `Location_Dept` varchar(255) DEFAULT NULL,
  `Position_Dept` varchar(50) DEFAULT NULL,
  `Position_Dept_ID` int(11) DEFAULT NULL COMMENT 'id sa employee rate',
  `Type_Dept` varchar(50) DEFAULT NULL,
  `Status_Dept` varchar(50) DEFAULT NULL,
  `Remarks_Dept` varchar(255) DEFAULT NULL,
  `Message_Dept` varchar(255) DEFAULT NULL,
  `AssistantHead_Dept` varchar(255) DEFAULT NULL,
  `AssistantHead_Dept_ID` varchar(20) DEFAULT NULL,
  `AssistPosition_Dept` varchar(50) DEFAULT NULL,
  `AssistPosition_Dept_ID` varchar(50) DEFAULT NULL,
  `WorkerType_Dept` varchar(50) DEFAULT NULL,
  `ProjectStart` date DEFAULT NULL,
  `ProjectEnd` date DEFAULT NULL,
  `isCostCenter` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`SysPK_Dept`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `department` */

insert  into `department`(`SysPK_Dept`,`GroupName_Dept`,`DeptCode_Dept`,`Name_Dept`,`Head_Dept`,`Head_Dept_ID`,`Location_Dept`,`Position_Dept`,`Position_Dept_ID`,`Type_Dept`,`Status_Dept`,`Remarks_Dept`,`Message_Dept`,`AssistantHead_Dept`,`AssistantHead_Dept_ID`,`AssistPosition_Dept`,`AssistPosition_Dept_ID`,`WorkerType_Dept`,`ProjectStart`,`ProjectEnd`,`isCostCenter`) values (1,'P0001','001','ADMIN','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(2,'P0001','002','FINANCE','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(3,'P0001','003','ACCOUNTING','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(4,'P0001','004','REGISTRAR','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(5,'P0001','005','Human Resource and Development','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(6,'P0001','006','Information and Communication Technology (ICT)','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(7,'P0001','007','Business Education','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(8,'P0001','008','Teacher Education ','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(9,'P0001','009','Hospitality and Tourism Management','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(10,'P0001','010','Art and Sciences','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(11,'P0001','011','Criminology','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(12,'P0001','012','Basic Education','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0),(13,'P0001','013','Technical Vocational','','','','',0,'','ACTIVE','','','','','','','','2019-05-28',NULL,0);

/*Table structure for table `disciplinary_action` */

DROP TABLE IF EXISTS `disciplinary_action`;

CREATE TABLE `disciplinary_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_emp_name` varchar(255) DEFAULT NULL,
  `to_emp_id` int(11) DEFAULT NULL,
  `from_emp_id` int(11) DEFAULT NULL,
  `from_emp_name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `re` varchar(255) DEFAULT NULL,
  `type_of_offense` varchar(255) DEFAULT NULL,
  `lvl_of_disciplinary` varchar(255) DEFAULT NULL,
  `impact_of_action` varchar(255) DEFAULT NULL,
  `statement_of_expectation` varchar(255) DEFAULT NULL,
  `consequence` varchar(255) DEFAULT NULL,
  `prepared_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `disciplinary_action` */

/*Table structure for table `dtr_summary` */

DROP TABLE IF EXISTS `dtr_summary`;

CREATE TABLE `dtr_summary` (
  `dtr_sum_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_no` varchar(255) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `extra_zero` double DEFAULT 0,
  `required_days` double DEFAULT 0,
  `required_hours` double DEFAULT 0,
  `actual_hour` double DEFAULT 0,
  `actual_day` double DEFAULT 0,
  `absent_hour` double DEFAULT 0,
  `paternity_leave_hour` double DEFAULT 0,
  `sil_hour` double DEFAULT 0,
  `late_min` double DEFAULT 0,
  `ut` double DEFAULT 0,
  `ot` double DEFAULT 0,
  `nd` double DEFAULT 0,
  `sun_hr` double DEFAULT 0,
  `sun_ot` double DEFAULT 0,
  `sun_nd` double DEFAULT 0,
  `spl_hr` double DEFAULT 0,
  `spl_ot` double DEFAULT 0,
  `spl_nd` double DEFAULT 0,
  `hol_hr` double DEFAULT 0,
  `hol_ot` double DEFAULT 0,
  `hol_nd` double DEFAULT 0,
  PRIMARY KEY (`dtr_sum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dtr_summary` */

/*Table structure for table `dummy_date` */

DROP TABLE IF EXISTS `dummy_date`;

CREATE TABLE `dummy_date` (
  `dummy_date_id` int(11) NOT NULL AUTO_INCREMENT,
  `dummy_date` date DEFAULT NULL,
  PRIMARY KEY (`dummy_date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

/*Data for the table `dummy_date` */

insert  into `dummy_date`(`dummy_date_id`,`dummy_date`) values (92,'2019-05-01'),(93,'2019-05-02'),(94,'2019-05-03'),(95,'2019-05-04'),(96,'2019-05-05'),(97,'2019-05-06'),(98,'2019-05-07'),(99,'2019-05-08'),(100,'2019-05-09'),(101,'2019-05-10'),(102,'2019-05-11'),(103,'2019-05-12'),(104,'2019-05-13'),(105,'2019-05-14'),(106,'2019-05-15'),(107,'2019-05-16'),(108,'2019-05-17'),(109,'2019-05-18'),(110,'2019-05-19'),(111,'2019-05-20'),(112,'2019-05-21'),(113,'2019-05-22'),(114,'2019-05-23'),(115,'2019-05-24'),(116,'2019-05-25');

/*Table structure for table `emp_cash_advance` */

DROP TABLE IF EXISTS `emp_cash_advance`;

CREATE TABLE `emp_cash_advance` (
  `ca_id` int(11) NOT NULL AUTO_INCREMENT,
  `ca_date` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `ca_amount` double DEFAULT NULL,
  `amount_deduction` double DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_cash_advance` */

/*Table structure for table `emp_cash_advance_details` */

DROP TABLE IF EXISTS `emp_cash_advance_details`;

CREATE TABLE `emp_cash_advance_details` (
  `ca_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `ca_id` int(11) DEFAULT NULL,
  `date_deducted` date DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `current_deduction` double DEFAULT NULL,
  `remaining_balance` double DEFAULT NULL,
  PRIMARY KEY (`ca_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_cash_advance_details` */

/*Table structure for table `emp_cash_bonus` */

DROP TABLE IF EXISTS `emp_cash_bonus`;

CREATE TABLE `emp_cash_bonus` (
  `bonus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bonus_date` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bonus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `emp_cash_bonus` */

insert  into `emp_cash_bonus`(`bonus_id`,`bonus_date`,`emp_id`,`emp_name`,`amount`,`remarks`) values (1,'2022-06-05',33,'ESNARDO, MARICHU MANTE',7900,'test');

/*Table structure for table `emp_dependent` */

DROP TABLE IF EXISTS `emp_dependent`;

CREATE TABLE `emp_dependent` (
  `dependent_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `dependent_full_name` varchar(255) DEFAULT NULL,
  `dependent_bday` date DEFAULT NULL,
  PRIMARY KEY (`dependent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Data for the table `emp_dependent` */

insert  into `emp_dependent`(`dependent_id`,`emp_id`,`dependent_full_name`,`dependent_bday`) values (30,17,'JAE BRENT D.BORJA',NULL),(31,25,'NERILYN A. COSCOS',NULL),(33,81,'KYLE ALEXANDER A. URBUDA','2020-03-12'),(34,81,'CLAIRE ANNE A. URBUDA','1995-11-24'),(35,47,'MARY GRACE P. LETIGIO',NULL);

/*Table structure for table `emp_displinary_actions` */

DROP TABLE IF EXISTS `emp_displinary_actions`;

CREATE TABLE `emp_displinary_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(100) DEFAULT NULL,
  `discp_date` date DEFAULT NULL,
  `cases` varchar(255) DEFAULT NULL,
  `severity` varchar(30) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `mgr_position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_displinary_actions` */

/*Table structure for table `emp_evaluation_category` */

DROP TABLE IF EXISTS `emp_evaluation_category`;

CREATE TABLE `emp_evaluation_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `emp_evaluation_category` */

insert  into `emp_evaluation_category`(`id`,`category_name`,`description`,`status`) values (1,'WORKS TO FULL POTENTIAL','','ACTIVE'),(2,'QUALITY OF WORK','QUALITY OF WORK','ACTIVE'),(3,'WORK CONSISTENCY','WORK CONSISTENCY','ACTIVE'),(4,'COMMUNICATION','','ACTIVE');

/*Table structure for table `emp_imported_dtr` */

DROP TABLE IF EXISTS `emp_imported_dtr`;

CREATE TABLE `emp_imported_dtr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `log_id` varchar(20) DEFAULT NULL,
  `employee_id` varchar(20) DEFAULT NULL,
  `employee_name` varchar(100) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_imported_dtr` */

/*Table structure for table `emp_job_description` */

DROP TABLE IF EXISTS `emp_job_description`;

CREATE TABLE `emp_job_description` (
  `job_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `job_description` longtext DEFAULT NULL,
  `jd_image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`job_description_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1790 DEFAULT CHARSET=latin1;

/*Data for the table `emp_job_description` */

insert  into `emp_job_description`(`job_description_id`,`emp_id`,`job_description`,`jd_image_path`) values (72,90,'job','storage/uploads/employees_job/10_02_2019_11_44_17_job_desc_6.png'),(73,90,'job2','storage/uploads/employees_job/10_02_2019_11_44_17_job_desc_7.png'),(74,90,'job3','storage/uploads/employees_job/10_02_2019_11_44_38_job_desc_8.png'),(1789,113,'TEST','storage/uploads/employees_job/12_11_2021_07_24_56_job_desc_26.png');

/*Table structure for table `emp_level` */

DROP TABLE IF EXISTS `emp_level`;

CREATE TABLE `emp_level` (
  `emp_lvl_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_lvl` varchar(255) DEFAULT NULL,
  `transpo_allowance` double DEFAULT NULL,
  `mobile_allowance` double DEFAULT NULL,
  `out_station_allowance` double DEFAULT NULL,
  `meal_allowance` double DEFAULT NULL,
  PRIMARY KEY (`emp_lvl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `emp_level` */

insert  into `emp_level`(`emp_lvl_id`,`emp_lvl`,`transpo_allowance`,`mobile_allowance`,`out_station_allowance`,`meal_allowance`) values (1,'Level 1',0,0,0,0),(2,'Level 2',150,300,0,200),(3,'Level 3',100,150,2000,200),(4,'Level 4',50,150,0,50),(5,'Level 5',0,0,0,50);

/*Table structure for table `emp_medical_record` */

DROP TABLE IF EXISTS `emp_medical_record`;

CREATE TABLE `emp_medical_record` (
  `medical_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `medical_record` varchar(255) DEFAULT NULL,
  `medical_record_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`medical_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_medical_record` */

/*Table structure for table `emp_organizational` */

DROP TABLE IF EXISTS `emp_organizational`;

CREATE TABLE `emp_organizational` (
  `organizational_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `organizational` longtext DEFAULT NULL,
  `organizational_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organizational_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_organizational` */

/*Table structure for table `emp_other_loan` */

DROP TABLE IF EXISTS `emp_other_loan`;

CREATE TABLE `emp_other_loan` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_date` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `loan_amount` double DEFAULT NULL,
  `amount_deduction` double DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `issued_by` int(11) DEFAULT 0,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT 0,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `emp_other_loan` */

insert  into `emp_other_loan`(`loan_id`,`loan_date`,`emp_id`,`emp_name`,`loan_amount`,`amount_deduction`,`date_from`,`date_to`,`remarks`,`issued_by`,`is_deleted`,`deleted_by`) values (1,'2022-06-01',1,'ABING, HACELJEN INCIPIDO',300,100,'2022-01-01','2022-08-31','Test Loan',81,0,0);

/*Table structure for table `emp_other_loan_details` */

DROP TABLE IF EXISTS `emp_other_loan_details`;

CREATE TABLE `emp_other_loan_details` (
  `loan_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) DEFAULT NULL,
  `date_deducted` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` double DEFAULT 0,
  `current_deduction` double DEFAULT 0,
  `current_balance` double DEFAULT 0,
  `remaining_balance` double DEFAULT 0,
  PRIMARY KEY (`loan_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_other_loan_details` */

/*Table structure for table `emp_pagibig_loan` */

DROP TABLE IF EXISTS `emp_pagibig_loan`;

CREATE TABLE `emp_pagibig_loan` (
  `pagibig_loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `pagibig_loan_date` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `loan_amount` double DEFAULT NULL,
  `amount_deduction` double DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `issued_by` int(11) DEFAULT 0,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT 0,
  PRIMARY KEY (`pagibig_loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `emp_pagibig_loan` */

insert  into `emp_pagibig_loan`(`pagibig_loan_id`,`pagibig_loan_date`,`emp_id`,`emp_name`,`loan_amount`,`amount_deduction`,`date_from`,`date_to`,`remarks`,`issued_by`,`is_deleted`,`deleted_by`) values (1,'2022-06-06',30,'EMPINADO, ETHEL ALEGADO',10000,384.8,'2022-05-01','2022-08-31','test',88,0,0);

/*Table structure for table `emp_pagibig_loan_details` */

DROP TABLE IF EXISTS `emp_pagibig_loan_details`;

CREATE TABLE `emp_pagibig_loan_details` (
  `pagibig_loan_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `pagibig_loan_id` int(11) DEFAULT NULL,
  `date_deducted` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` double DEFAULT 0,
  `current_balanace` double DEFAULT 0,
  `current_deduction` double DEFAULT 0,
  `remaining_balance` double DEFAULT 0,
  PRIMARY KEY (`pagibig_loan_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_pagibig_loan_details` */

/*Table structure for table `emp_payroll` */

DROP TABLE IF EXISTS `emp_payroll`;

CREATE TABLE `emp_payroll` (
  `payroll_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `monthly_rate` double DEFAULT 0,
  `basic_pay` double DEFAULT 0,
  `late` double DEFAULT 0,
  `ut` double DEFAULT 0,
  `absent` double DEFAULT 0,
  `gross_pay` double DEFAULT 0,
  `honorarium` double DEFAULT 0,
  `sss` double DEFAULT 0,
  `philhealth` double DEFAULT 0,
  `pagibig` double DEFAULT 0,
  `wtax` double DEFAULT 0,
  `sss_loan` double DEFAULT 0,
  `pagibig_loan` double DEFAULT 0,
  `other_loan` double DEFAULT 0,
  `canteen` double DEFAULT 0,
  `coop` double DEFAULT 0,
  `total_deduction` double DEFAULT 0,
  `net_pay` double DEFAULT 0,
  `yr` int(11) DEFAULT NULL,
  `period` varchar(255) DEFAULT '',
  `sss_er` double DEFAULT 0,
  `philhealth_er` double DEFAULT 0,
  `pagibig_er` double DEFAULT 0,
  `AccountNo` varchar(255) DEFAULT '',
  `dept_id` int(11) DEFAULT NULL,
  `department` varchar(255) DEFAULT '',
  PRIMARY KEY (`payroll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=617 DEFAULT CHARSET=latin1;

/*Data for the table `emp_payroll` */

insert  into `emp_payroll`(`payroll_id`,`date_from`,`date_to`,`emp_id`,`emp_name`,`monthly_rate`,`basic_pay`,`late`,`ut`,`absent`,`gross_pay`,`honorarium`,`sss`,`philhealth`,`pagibig`,`wtax`,`sss_loan`,`pagibig_loan`,`other_loan`,`canteen`,`coop`,`total_deduction`,`net_pay`,`yr`,`period`,`sss_er`,`philhealth_er`,`pagibig_er`,`AccountNo`,`dept_id`,`department`) values (463,'2022-06-01','2022-06-15',1,'ABING, HACELJEN INCIPIDO',10000,5000,0,0,0,NULL,0,360,150,200,0,0,0,0,0,0,710,4290,2022,'1st June',0,0,0,'2039482039',3,'ACCOUNTING'),(464,'2022-06-01','2022-06-15',10,'BANUELOS, KHAREN GRACE MALALIS',10000,5000,34.45,0,0,4965.55,0,400,150,200,0,0,0,0,0,0,750,4215.55,2022,'1st June',0,0,0,'',12,'Basic Education'),(465,'2022-06-01','2022-06-15',11,'BELINARIO, KEVIN LERTIDO',9000,4500,274.75,0,0,4225.25,0,360,135,180,0,0,0,0,0,0,675,3550.25,2022,'1st June',0,0,0,'',4,'REGISTRAR'),(466,'2022-06-01','2022-06-15',12,'BERINO, DIANE BACOLOD',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',1,'ADMIN'),(467,'2022-06-01','2022-06-15',13,'BERNADOS, JUNREY IGONG-IGONG',10000,5000,0,0,0,5000,0,400,150,200,0,0,0,0,0,0,750,4250,2022,'1st June',0,0,0,'',12,'Basic Education'),(468,'2022-06-01','2022-06-15',14,'BERTE, HAZEL RAMOS',24500,12250,140.68,0,0,12109.32,0,800,367.5,490,6.96,0,0,0,0,0,1650.54,10444.86,2022,'1st June',0,0,0,'',9,'Hospitality and Tourism Management'),(469,'2022-06-01','2022-06-15',15,'BLANCO, JASMEN OCAY',10000,5000,0,0,0,5000,0,400,150,200,0,0,0,0,0,0,750,4250,2022,'1st June',0,0,0,'',12,'Basic Education'),(470,'2022-06-01','2022-06-15',16,'BOHOL, CHANRAH MAE OCA',15000,7500,170.82,0,0,7329.18,0,600,225,300,0,0,0,0,0,0,1125,6204.18,2022,'1st June',0,0,0,'',12,'Basic Education'),(471,'2022-06-01','2022-06-15',19,'BUSANO, MARYLAND ESNARDO',18000,9000,179.15,0,0,8820.85,0,720,270,360,0,0,0,0,0,0,1350,7470.85,2022,'1st June',0,0,0,'',7,'Business Education'),(472,'2022-06-01','2022-06-15',2,'AGOCOY, MONALIZA PESTANO',15000,7500,314.37,0,0,7185.63,0,600,225,300,0,0,0,0,0,0,1125,6060.63,2022,'1st June',0,0,0,'',12,'Basic Education'),(473,'2022-06-01','2022-06-15',20,'CABITANA, BERLYN TABAMO',14500,7250,382.98,0,0,6867.02,0,580,217.5,290,0,0,0,0,0,0,1087.5,5779.52,2022,'1st June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(474,'2022-06-01','2022-06-15',21,'CALLORA., MARRYFOL RETUBES',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',7,'Business Education'),(475,'2022-06-01','2022-06-15',22,'CANOY, CHERYL UDTUJAN',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',10,'Art and Sciences'),(476,'2022-06-01','2022-06-15',23,'CREENCIA, ANAMAE TIAMZON',11000,5500,2.11,0,0,5497.89,0,440,165,220,0,0,0,0,0,0,825,4672.89,2022,'1st June',0,0,0,'',12,'Basic Education'),(477,'2022-06-01','2022-06-15',25,'COSCOS, DENNIS AVERGONZADO',22500,11250,370.35,0,0,10879.65,0,800,337.5,450,0,0,0,0,0,0,1587.5,9292.15,2022,'1st June',0,0,0,'',1,'ADMIN'),(478,'2022-06-01','2022-06-15',26,'DE LUIS, DARWIN OMAC',9000,4500,86.13,0,0,4413.87,0,360,135,180,0,0,0,0,0,0,675,3738.87,2022,'1st June',0,0,0,'',12,'Basic Education'),(479,'2022-06-01','2022-06-15',27,'DIVINAGRACIA, BEATRIZ CARREON',20000,10000,438.29,0,0,9561.71,0,800,300,400,0,0,0,0,0,0,1500,8061.71,2022,'1st June',0,0,0,'',1,'ADMIN'),(480,'2022-06-01','2022-06-15',28,'DUMAJEL, ERLYN ADOREMOS',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',7,'Business Education'),(481,'2022-06-01','2022-06-15',29,'EDRADAN, ARNAN ANTALLAN',16000,8000,0,64.31,0,7935.69,0,640,240,320,0,0,0,0,0,0,1200,6735.69,2022,'1st June',0,0,0,'',1,'ADMIN'),(482,'2022-06-01','2022-06-15',3,'AMPATIN, RITA ',10000,5000,0,0,0,0,0,400,150,200,0,0,0,0,0,0,750,0,2022,'1st June',0,0,0,'',1,'ADMIN'),(483,'2022-06-01','2022-06-15',30,'EMPINADO, ETHEL ALEGADO',18500,9250,116.85,416.04,0,8717.11,0,740,277.5,370,0,0,384.8,0,363,545,2680.3,6036.81,2022,'1st June',0,0,0,'',3,'ACCOUNTING'),(484,'2022-06-01','2022-06-15',31,'ENTRINA, ANGEL GUALDAJARA',9000,4500,22.39,0,0,4477.61,0,360,135,180,0,0,0,0,0,0,675,3802.61,2022,'1st June',0,0,0,'',3,'ACCOUNTING'),(485,'2022-06-01','2022-06-15',32,'ENSOY, HERMENIA BARNISO',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',1,'ADMIN'),(486,'2022-06-01','2022-06-15',33,'ESNARDO, MARICHU MANTE',27000,13500,56.84,0,0,13443.16,7900,800,405,540,256.23,0,0,0,0,0,1488.77,19341.92,2022,'1st June',0,0,0,'',1,'ADMIN'),(487,'2022-06-01','2022-06-15',34,'ESNARDO, RAYMART MANTE',9000,4500,33.59,0,0,4466.41,0,360,135,180,0,0,0,0,0,0,675,3791.41,2022,'1st June',0,0,0,'',1,'ADMIN'),(488,'2022-06-01','2022-06-15',35,'FERNAN, ALEX RELACION',19000,9500,150.91,0,0,9349.09,0,760,285,380,0,0,0,0,0,0,1425,7924.09,2022,'1st June',0,0,0,'',3,'ACCOUNTING'),(489,'2022-06-01','2022-06-15',39,'GISMAN, CAREN BUAL',20000,10000,302.4,0,0,9697.6,0,800,300,400,0,0,0,0,0,0,1500,8197.6,2022,'1st June',0,0,0,'',13,'Technical Vocational'),(490,'2022-06-01','2022-06-15',4,'ANDRIN, ARNEL ROMERO',10000,5000,119.62,0,0,4880.38,0,400,150,200,0,0,0,0,0,0,750,4130.38,2022,'1st June',0,0,0,'',12,'Basic Education'),(491,'2022-06-01','2022-06-15',40,'GRAVANZA, ADELAIDA RAFAEL',22000,11000,80,0,0,10920,0,800,330,440,0,0,0,0,0,0,1570,9350,2022,'1st June',0,0,0,'',1,'ADMIN'),(492,'2022-06-01','2022-06-15',41,'INSON, MERIAM DAGCUTAN',9000,4500,173.98,0,0,4326.02,0,360,135,180,0,0,0,0,0,0,675,3651.02,2022,'1st June',0,0,0,'',12,'Basic Education'),(493,'2022-06-01','2022-06-15',42,'JANGALAY, JUDELYN MEDINA',11000,5500,583.18,0,0,4916.82,0,440,165,220,0,0,0,0,0,0,825,4091.82,2022,'1st June',0,0,0,'',12,'Basic Education'),(494,'2022-06-01','2022-06-15',43,'LAID, JHESORLEY MAGANA',22000,11000,770.56,0,0,10229.44,0,800,330,440,0,0,0,0,0,0,1570,8659.44,2022,'1st June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(495,'2022-06-01','2022-06-15',44,'LASTIMOSO, DINO ROSALES',8000,4000,154.65,0,0,3845.35,0,320,120,160,0,0,0,0,0,0,600,3245.35,2022,'1st June',0,0,0,'',1,'ADMIN'),(496,'2022-06-01','2022-06-15',45,'LAPINID, MARIBEL SOLANO',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',1,'ADMIN'),(497,'2022-06-01','2022-06-15',46,'LECCIONES, DONALD GONZAGA',20000,10000,30.62,0,0,9969.38,0,800,300,400,0,0,0,0,0,0,1500,8469.38,2022,'1st June',0,0,0,'',11,'Criminology'),(498,'2022-06-01','2022-06-15',47,'LETIGIO, REJOY POGADO',9000,4500,33.59,99.91,0,4627.16,0,360,135,180,0,0,0,0,0,0,675,3952.16,2022,'1st June',0,0,0,'',12,'Basic Education'),(499,'2022-06-01','2022-06-15',48,'LICO, ROZYL ROMA',9000,4500,0,0,0,4500,0,360,135,180,0,0,0,0,0,0,675,3825,2022,'1st June',0,0,0,'',12,'Basic Education'),(500,'2022-06-01','2022-06-15',49,'LOPEZ, NORA LUMIARES',26000,13000,0,0,0,13000,0,800,390,520,174.6,0,0,0,0,0,1535.4,11115.4,2022,'1st June',0,0,0,'',1,'ADMIN'),(501,'2022-06-01','2022-06-15',5,'ARCALA, RITA TABAMO',26500,13250,71.01,385.47,0,12793.52,0,800,397.5,530,129.8,0,0,0,0,0,1597.7,10936.22,2022,'1st June',0,0,0,'',7,'Business Education'),(502,'2022-06-01','2022-06-15',50,'LULAB, AEYMH ZHAYL LAUSA',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',12,'Basic Education'),(503,'2022-06-01','2022-06-15',51,'LUMPAY, MARGIE LYN LACUMBES',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',1,'ADMIN'),(504,'2022-06-01','2022-06-15',52,'MABANAG, RUTHCELYNE SALUDO',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',12,'Basic Education'),(505,'2022-06-01','2022-06-15',53,'MALLERNA, EVELYN BAJAR',7000,3500,0,0,0,0,0,280,105,140,0,0,0,0,0,0,525,0,2022,'1st June',0,0,0,'',1,'ADMIN'),(506,'2022-06-01','2022-06-15',54,'MAMALIAS, JOAN MABOLIS',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',1,'ADMIN'),(507,'2022-06-01','2022-06-15',55,'MANEJA, JERSON OCON',16000,8000,107.18,0,0,7892.82,0,640,240,320,0,0,0,0,0,0,1200,6692.82,2022,'1st June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(508,'2022-06-01','2022-06-15',56,'MANEJA, NELIA MANGUBAT',15000,7500,122.01,0,0,7377.99,0,600,225,300,0,0,0,0,0,0,1125,6252.99,2022,'1st June',0,0,0,'',3,'ACCOUNTING'),(509,'2022-06-01','2022-06-15',57,'MANGUBAT, JONALY DESPI',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',1,'ADMIN'),(510,'2022-06-01','2022-06-15',58,'MANTE, CHRISTIAN IAN MARILLA',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,0,2022,'1st June',0,0,0,'',1,'ADMIN'),(511,'2022-06-01','2022-06-15',59,'MANTE, JESSERIE ANN',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',7,'Business Education'),(512,'2022-06-01','2022-06-15',6,'ARNOCO, ELMA MORENO',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',10,'Art and Sciences'),(513,'2022-06-01','2022-06-15',60,'MARTINES, SUSAN MORTAL',7000,3500,0,0,0,3500,0,280,105,140,0,0,0,0,0,0,525,2975,2022,'1st June',0,0,0,'',1,'ADMIN'),(514,'2022-06-01','2022-06-15',61,'MARZAN, JANETH ALGABRE',19500,9750,24.26,0,0,9725.74,0,780,292.5,390,0,0,0,0,0,0,1462.5,8263.24,2022,'1st June',0,0,0,'',1,'ADMIN'),(515,'2022-06-01','2022-06-15',62,'MARZAN, MARK BENN VILOAN',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',9,'Hospitality and Tourism Management'),(516,'2022-06-01','2022-06-15',63,'MONATO, RAVELYEN CALIPAYAN',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',12,'Basic Education'),(517,'2022-06-01','2022-06-15',64,'MONTES, GENERICK GROTES',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(518,'2022-06-01','2022-06-15',66,'NOVO, JUDYVIE EYANA',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(519,'2022-06-01','2022-06-15',67,'PACULBA, EMMALEN SALDIVAR',15000,7500,38.76,0,0,7461.24,0,600,225,300,0,0,0,0,0,0,1125,6336.24,2022,'1st June',0,0,0,'',3,'ACCOUNTING'),(520,'2022-06-01','2022-06-15',68,'PALTIQUERA, ROSLYN MABANAN',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',12,'Basic Education'),(521,'2022-06-01','2022-06-15',69,'PAREJA., THELMA POLANCOS',13000,6500,18.66,119.43,0,6361.91,0,520,195,260,0,0,0,0,0,0,975,5386.91,2022,'1st June',0,0,0,'',1,'ADMIN'),(522,'2022-06-01','2022-06-15',7,'ARRAJI, FATIMA ESPINIDO',11000,5500,283.17,0,0,5216.83,0,440,165,220,0,0,0,0,0,0,825,4391.83,2022,'1st June',0,0,0,'',12,'Basic Education'),(523,'2022-06-01','2022-06-15',70,'PASQUIL, REX TEMPLATORA',12000,6000,76.94,0,0,5923.06,0,480,180,240,0,0,0,0,0,0,900,5023.06,2022,'1st June',0,0,0,'',9,'Hospitality and Tourism Management'),(524,'2022-06-01','2022-06-15',71,'RAMIREZ, EVELINDA PARADERO',18000,9000,0,0,0,9000,0,720,270,360,0,0,0,0,0,0,1350,7650,2022,'1st June',0,0,0,'',4,'REGISTRAR'),(525,'2022-06-01','2022-06-15',72,'SALARDA, CONIE PIODO',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',8,'Teacher Education'),(526,'2022-06-01','2022-06-15',73,'SAPID, ANALYN CAPILITAN',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',12,'Basic Education'),(527,'2022-06-01','2022-06-15',74,'SAPID, MERNELITA CAPILITAN',12500,6250,202.16,0,0,6047.84,0,500,187.5,250,0,0,0,0,0,0,937.5,5110.34,2022,'1st June',0,0,0,'',1,'ADMIN'),(528,'2022-06-01','2022-06-15',75,'SAYSON, DELBERT ORTEGA',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',12,'Basic Education'),(529,'2022-06-01','2022-06-15',76,'SIAREZ, JOEL LARIOSA',23000,11500,19.81,0,0,11480.19,0,800,345,460,0,0,0,0,0,0,1605,9875.19,2022,'1st June',0,0,0,'',11,'Criminology'),(530,'2022-06-01','2022-06-15',77,'SILVANO, ELENA ABRATIGUIN',24000,12000,9.19,0,0,11990.81,0,800,360,480,0,0,0,0,0,0,1640,10350.81,2022,'1st June',0,0,0,'',4,'REGISTRAR'),(531,'2022-06-01','2022-06-15',78,'SILVANO, KIRK JASON ABRATIGUIN',10000,5000,495.71,0,0,4504.29,0,400,150,200,0,0,0,0,0,0,750,3754.29,2022,'1st June',0,0,0,'',4,'REGISTRAR'),(532,'2022-06-01','2022-06-15',79,'SINAJON, CONCORDIA GANOHAY',7000,3500,12.73,19.43,0,3844.05,0,280,105,140,0,0,0,0,0,0,525,3319.05,2022,'1st June',0,0,0,'',1,'ADMIN'),(533,'2022-06-01','2022-06-15',8,'ARTIZUELA, RUTCHILLE BARRIOS',9000,4500,49.09,0,0,4450.91,0,360,135,180,0,0,0,0,0,0,675,3775.91,2022,'1st June',0,0,0,'',1,'ADMIN'),(534,'2022-06-01','2022-06-15',80,'TUBAT, ELESON MORATO',8000,4000,24.5,0,0,3975.5,0,320,120,160,0,0,0,0,0,375,975,3000.5,2022,'1st June',0,0,0,NULL,4,'REGISTRAR'),(535,'2022-06-01','2022-06-15',81,'URBUDA, ROBERT MARQUEZ',20000,10000,407.67,38.28,0,9554.05,0,800,300,400,0,0,0,0,0,0,1500,8054.05,2022,'1st June',0,0,0,'',5,'Human Resource and Development'),(536,'2022-06-01','2022-06-15',82,'VICENTE, JOHN MARK SERAD',0,0,0,0,0,0,0,80,0,0,0,0,0,0,0,0,80,-80,2022,'1st June',0,0,0,'',13,'Technical Vocational'),(537,'2022-06-01','2022-06-15',83,'VILLEGAS, JELSON TEMPLA',9000,4500,0,0,0,0,0,360,135,180,0,0,0,0,0,0,675,0,2022,'1st June',0,0,0,'',1,'ADMIN'),(538,'2022-06-01','2022-06-15',84,'VIRTUDAZO, JOSHUA SALVE',15000,7500,70.34,0,0,7429.66,0,600,225,300,0,0,0,0,0,0,1125,6304.66,2022,'1st June',0,0,0,'',1,'ADMIN'),(539,'2022-06-01','2022-06-15',9,'BABATID, GUADALUPE INSON',13000,6500,0,0,0,0,0,520,195,260,0,0,0,0,0,0,975,0,2022,'1st June',0,0,0,'',1,'ADMIN'),(540,'2022-06-16','2022-06-30',1,'ABING, HACELJEN INCIPIDO',10000,5000,10.53,0,0,4989.47,0,450,150,200,0,0,0,100,0,0,900,4089.47,2022,'2nd June',0,0,0,'2039482039',12,'Basic Education'),(541,'2022-06-16','2022-06-30',10,'BANUELOS, KHAREN GRACE MALALIS',10000,5000,48.81,0,0,4951.19,0,450,150,200,0,0,0,0,0,0,800,4151.19,2022,'2nd June',0,0,0,'',12,'Basic Education'),(542,'2022-06-16','2022-06-30',11,'BELINARIO, KEVIN LERTIDO',9000,4500,202.4,0,0,4297.6,0,405,135,180,0,0,0,0,0,0,720,3577.6,2022,'2nd June',0,0,0,'',4,'REGISTRAR'),(543,'2022-06-16','2022-06-30',12,'BERINO, DIANE BACOLOD',8000,4000,114.84,3.83,0,3881.34,0,360,120,160,0,0,0,0,0,0,640,3241.34,2022,'2nd June',0,0,0,NULL,1,'ADMIN'),(544,'2022-06-16','2022-06-30',13,'BERNADOS, JUNREY IGONG-IGONG',10000,5000,12.44,0,0,4987.56,0,450,150,200,0,0,0,0,0,0,800,4187.56,2022,'2nd June',0,0,0,'',12,'Basic Education'),(545,'2022-06-16','2022-06-30',14,'BERTE, HAZEL RAMOS',24500,12250,60.96,0,0,12189.04,0,1102.5,367.5,490,0,0,0,0,0,0,1960,10229.04,2022,'2nd June',0,0,0,'',9,'Hospitality and Tourism Management'),(546,'2022-06-16','2022-06-30',15,'BLANCO, JASMEN OCAY',10000,5000,0,0,0,5000,0,450,150,200,0,0,0,0,0,0,800,4200,2022,'2nd June',0,0,0,'',12,'Basic Education'),(547,'2022-06-16','2022-06-30',16,'BOHOL, CHANRAH MAE OCA',15000,7500,170.82,0,0,7329.18,0,675,225,300,0,0,0,0,0,0,1200,6129.18,2022,'2nd June',0,0,0,'',12,'Basic Education'),(548,'2022-06-16','2022-06-30',19,'BUSANO, MARYLAND ESNARDO',18000,9000,168.81,0,0,8831.19,0,810,270,360,0,0,0,0,0,0,1440,7391.19,2022,'2nd June',0,0,0,'',7,'Business Education'),(549,'2022-06-16','2022-06-30',2,'AGOCOY, MONALIZA PESTANO',15000,7500,367.48,0,0,7132.52,0,675,225,300,0,0,0,0,0,0,1200,5932.52,2022,'2nd June',0,0,0,'',12,'Basic Education'),(550,'2022-06-16','2022-06-30',20,'CABITANA, BERLYN TABAMO',14500,7250,62.44,0,0,7187.56,0,652.5,217.5,290,0,0,0,0,0,0,1160,6027.56,2022,'2nd June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(551,'2022-06-16','2022-06-30',21,'CALLORA., MARRYFOL RETUBES',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',7,'Business Education'),(552,'2022-06-16','2022-06-30',22,'CANOY, CHERYL UDTUJAN',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',10,'Art and Sciences'),(553,'2022-06-16','2022-06-30',23,'CREENCIA, ANAMAE TIAMZON',11000,5500,115.79,156.85,0,5227.36,0,495,165,220,0,0,0,0,0,0,880,4347.36,2022,'2nd June',0,0,0,'',12,'Basic Education'),(554,'2022-06-16','2022-06-30',25,'COSCOS, DENNIS AVERGONZADO',22500,11250,813.91,0,0,10436.09,0,1012.5,337.5,450,0,0,0,0,0,0,1800,8636.09,2022,'2nd June',0,0,0,'',1,'ADMIN'),(555,'2022-06-16','2022-06-30',26,'DE LUIS, DARWIN OMAC',9000,4500,99.91,0,0,4400.09,0,405,135,180,0,0,0,0,0,0,720,3680.09,2022,'2nd June',0,0,0,'',12,'Basic Education'),(556,'2022-06-16','2022-06-30',27,'DIVINAGRACIA, BEATRIZ CARREON',20000,10000,355.99,0,0,9644.01,0,900,300,400,0,0,0,0,0,0,1600,8044.01,2022,'2nd June',0,0,0,'',1,'ADMIN'),(557,'2022-06-16','2022-06-30',28,'DUMAJEL, ERLYN ADOREMOS',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',7,'Business Education'),(558,'2022-06-16','2022-06-30',29,'EDRADAN, ARNAN ANTALLAN',16000,8000,7.66,0,0,7992.34,0,720,240,320,0,0,0,0,0,0,1280,6712.34,2022,'2nd June',0,0,0,'',1,'ADMIN'),(559,'2022-06-16','2022-06-30',3,'AMPATIN, RITA ',10000,5000,0,0,0,0,0,450,150,200,0,0,0,0,0,0,800,0,2022,'2nd June',0,0,0,'',1,'ADMIN'),(560,'2022-06-16','2022-06-30',30,'EMPINADO, ETHEL ALEGADO',18500,9250,58.42,0,0,9191.58,0,832.5,277.5,370,0,0,384.8,0,0,0,1864.8,7326.78,2022,'2nd June',0,0,0,'',3,'ACCOUNTING'),(561,'2022-06-16','2022-06-30',31,'ENTRINA, ANGEL GUALDAJARA',9000,4500,34.45,3.45,0,4462.1,0,405,135,180,0,0,0,0,0,0,720,3742.1,2022,'2nd June',0,0,0,'',3,'ACCOUNTING'),(562,'2022-06-16','2022-06-30',32,'ENSOY, HERMENIA BARNISO',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',1,'ADMIN'),(563,'2022-06-16','2022-06-30',33,'ESNARDO, MARICHU MANTE',27000,13500,46.51,0,0,13453.49,0,1125,405,540,193.3,0,0,0,0,0,1876.7,11190.19,2022,'2nd June',0,0,0,'',1,'ADMIN'),(564,'2022-06-16','2022-06-30',34,'ESNARDO, RAYMART MANTE',9000,4500,23.25,0,0,4476.75,0,405,135,180,0,0,0,0,0,0,720,3756.75,2022,'2nd June',0,0,0,'',1,'ADMIN'),(565,'2022-06-16','2022-06-30',35,'FERNAN, ALEX RELACION',19000,9500,196.37,0,0,9303.63,0,855,285,380,0,0,0,0,0,0,1520,7783.63,2022,'2nd June',0,0,0,'',3,'ACCOUNTING'),(566,'2022-06-16','2022-06-30',39,'GISMAN, CAREN BUAL',20000,10000,208.62,0,0,9791.38,0,900,300,400,0,0,0,0,0,0,1600,8191.38,2022,'2nd June',0,0,0,'',13,'Technical Vocational'),(567,'2022-06-16','2022-06-30',4,'ANDRIN, ARNEL ROMERO',10000,5000,9.57,62.2,0,4928.23,0,450,150,200,0,0,0,0,0,0,800,4128.23,2022,'2nd June',0,0,0,'',12,'Basic Education'),(568,'2022-06-16','2022-06-30',40,'GRAVANZA, ADELAIDA RAFAEL',22000,11000,94.74,0,0,10905.26,0,990,330,440,0,0,0,0,0,0,1760,9145.26,2022,'2nd June',0,0,0,'',1,'ADMIN'),(569,'2022-06-16','2022-06-30',41,'INSON, MERIAM DAGCUTAN',9000,4500,215.32,0,0,4284.68,0,405,135,180,0,0,0,0,0,0,720,3564.68,2022,'2nd June',0,0,0,'',12,'Basic Education'),(570,'2022-06-16','2022-06-30',42,'JANGALAY, JUDELYN MEDINA',11000,5500,424.23,0,0,5075.77,0,495,165,220,0,0,0,0,0,0,880,4195.77,2022,'2nd June',0,0,0,'',12,'Basic Education'),(571,'2022-06-16','2022-06-30',43,'LAID, JHESORLEY MAGANA',22000,11000,833.72,0,0,10166.28,0,990,330,440,0,0,0,0,0,0,1760,8406.28,2022,'2nd June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(572,'2022-06-16','2022-06-30',44,'LASTIMOSO, DINO ROSALES',8000,4000,187.57,0,0,3812.43,0,360,120,160,0,0,0,0,0,0,640,3172.43,2022,'2nd June',0,0,0,'',1,'ADMIN'),(573,'2022-06-16','2022-06-30',45,'LAPINID, MARIBEL SOLANO',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',1,'ADMIN'),(574,'2022-06-16','2022-06-30',46,'LECCIONES, DONALD GONZAGA',20000,10000,89.96,0,0,9910.04,0,900,300,400,0,0,0,0,0,0,1600,8310.04,2022,'2nd June',0,0,0,'',11,'Criminology'),(575,'2022-06-16','2022-06-30',47,'LETIGIO, REJOY POGADO',9000,4500,28.42,0,0,4471.58,0,405,135,180,0,0,0,0,0,0,720,3751.58,2022,'2nd June',0,0,0,'',12,'Basic Education'),(576,'2022-06-16','2022-06-30',48,'LICO, ROZYL ROMA',9000,4500,0,0,0,4500,0,405,135,180,0,0,0,0,0,0,720,3780,2022,'2nd June',0,0,0,'',12,'Basic Education'),(577,'2022-06-16','2022-06-30',49,'LOPEZ, NORA LUMIARES',26000,13000,0,0,0,13000,0,1125,390,520,109.6,0,0,0,0,0,1925.4,10855.4,2022,'2nd June',0,0,0,'',1,'ADMIN'),(578,'2022-06-16','2022-06-30',5,'ARCALA, RITA TABAMO',26500,13250,101.44,0,0,13148.56,0,1125,397.5,530,135.81,0,0,0,0,0,1916.69,10960.25,2022,'2nd June',0,0,0,'',7,'Business Education'),(579,'2022-06-16','2022-06-30',50,'LULAB, AEYMH ZHAYL LAUSA',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',12,'Basic Education'),(580,'2022-06-16','2022-06-30',51,'LUMPAY, MARGIE LYN LACUMBES',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',1,'ADMIN'),(581,'2022-06-16','2022-06-30',52,'MABANAG, RUTHCELYNE SALUDO',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',12,'Basic Education'),(582,'2022-06-16','2022-06-30',53,'MALLERNA, EVELYN BAJAR',7000,3500,0,0,0,0,0,315,105,140,0,0,0,0,0,0,560,0,2022,'2nd June',0,0,0,'',1,'ADMIN'),(583,'2022-06-16','2022-06-30',54,'MAMALIAS, JOAN MABOLIS',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',1,'ADMIN'),(584,'2022-06-16','2022-06-30',55,'MANEJA, JERSON OCON',16000,8000,381.26,15.31,0,7603.43,0,720,240,320,0,0,0,0,0,0,1280,6323.43,2022,'2nd June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(585,'2022-06-16','2022-06-30',56,'MANEJA, NELIA MANGUBAT',15000,7500,422.03,2.87,0,7075.1,0,675,225,300,0,0,0,0,0,0,1200,5875.1,2022,'2nd June',0,0,0,'',3,'ACCOUNTING'),(586,'2022-06-16','2022-06-30',57,'MANGUBAT, JONALY DESPI',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',1,'ADMIN'),(587,'2022-06-16','2022-06-30',58,'MANTE, CHRISTIAN IAN MARILLA',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,0,2022,'2nd June',0,0,0,'',1,'ADMIN'),(588,'2022-06-16','2022-06-30',59,'MANTE, JESSERIE ANN',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',7,'Business Education'),(589,'2022-06-16','2022-06-30',6,'ARNOCO, ELMA MORENO',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',10,'Art and Sciences'),(590,'2022-06-16','2022-06-30',60,'MARTINES, SUSAN MORTAL',7000,3500,0,0,0,3500,0,315,105,140,0,0,0,0,0,0,560,2940,2022,'2nd June',0,0,0,'',1,'ADMIN'),(591,'2022-06-16','2022-06-30',61,'MARZAN, JANETH ALGABRE',19500,9750,113.83,0,0,9636.17,0,877.5,292.5,390,0,0,0,0,0,0,1560,8076.17,2022,'2nd June',0,0,0,'',1,'ADMIN'),(592,'2022-06-16','2022-06-30',62,'MARZAN, MARK BENN VILOAN',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',9,'Hospitality and Tourism Management'),(593,'2022-06-16','2022-06-30',63,'MONATO, RAVELYEN CALIPAYAN',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',12,'Basic Education'),(594,'2022-06-16','2022-06-30',64,'MONTES, GENERICK GROTES',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(595,'2022-06-16','2022-06-30',66,'NOVO, JUDYVIE EYANA',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',6,'Information and Communication Technology (ICT)'),(596,'2022-06-16','2022-06-30',67,'PACULBA, EMMALEN SALDIVAR',15000,7500,51.68,0,0,7448.32,0,675,225,300,0,0,0,0,0,0,1200,6248.32,2022,'2nd June',0,0,0,'',3,'ACCOUNTING'),(597,'2022-06-16','2022-06-30',68,'PALTIQUERA, ROSLYN MABANAN',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',12,'Basic Education'),(598,'2022-06-16','2022-06-30',69,'PAREJA., THELMA POLANCOS',13000,6500,92.06,0,0,6407.94,0,585,195,260,0,0,0,0,0,0,1040,5367.94,2022,'2nd June',0,0,0,'',1,'ADMIN'),(599,'2022-06-16','2022-06-30',7,'ARRAJI, FATIMA ESPINIDO',11000,5500,120,0,0,5380,0,495,165,220,0,0,0,0,0,0,880,4500,2022,'2nd June',0,0,0,'',12,'Basic Education'),(600,'2022-06-16','2022-06-30',70,'PASQUIL, REX TEMPLATORA',12000,6000,121.73,0,0,5878.27,0,540,180,240,0,0,0,0,0,0,960,4918.27,2022,'2nd June',0,0,0,'',9,'Hospitality and Tourism Management'),(601,'2022-06-16','2022-06-30',71,'RAMIREZ, EVELINDA PARADERO',18000,9000,0,0,0,9000,0,810,270,360,0,0,0,0,0,0,1440,7560,2022,'2nd June',0,0,0,'',4,'REGISTRAR'),(602,'2022-06-16','2022-06-30',72,'SALARDA, CONIE PIODO',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',8,'Teacher Education'),(603,'2022-06-16','2022-06-30',73,'SAPID, ANALYN CAPILITAN',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',12,'Basic Education'),(604,'2022-06-16','2022-06-30',74,'SAPID, MERNELITA CAPILITAN',12500,6250,108.86,0,0,6141.14,0,562.5,187.5,250,0,0,0,0,0,0,1000,5141.14,2022,'2nd June',0,0,0,'',1,'ADMIN'),(605,'2022-06-16','2022-06-30',75,'SAYSON, DELBERT ORTEGA',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',12,'Basic Education'),(606,'2022-06-16','2022-06-30',76,'SIAREZ, JOEL LARIOSA',23000,11500,33.02,0,0,11466.98,0,1035,345,460,0,0,0,0,0,0,1840,9626.98,2022,'2nd June',0,0,0,'',11,'Criminology'),(607,'2022-06-16','2022-06-30',77,'SILVANO, ELENA ABRATIGUIN',24000,12000,2.3,0,0,11997.7,0,1080,360,480,0,0,0,0,0,0,1920,10077.7,2022,'2nd June',0,0,0,'',4,'REGISTRAR'),(608,'2022-06-16','2022-06-30',78,'SILVANO, KIRK JASON ABRATIGUIN',10000,5000,510.07,0,0,4489.93,0,450,150,200,0,0,0,0,0,0,800,3689.93,2022,'2nd June',0,0,0,'',4,'REGISTRAR'),(609,'2022-06-16','2022-06-30',79,'SINAJON, CONCORDIA GANOHAY',7000,3500,0,0,0,3500,0,315,105,140,0,0,0,0,0,0,560,2940,2022,'2nd June',0,0,0,'',1,'ADMIN'),(610,'2022-06-16','2022-06-30',8,'ARTIZUELA, RUTCHILLE BARRIOS',9000,4500,292.83,0,0,4207.17,0,405,135,180,0,0,0,0,0,0,720,3487.17,2022,'2nd June',0,0,0,'',1,'ADMIN'),(611,'2022-06-16','2022-06-30',80,'TUBAT, ELESON MORATO',8000,4000,36.75,0,0,3963.25,0,360,120,160,0,0,0,0,0,0,640,3323.25,2022,'2nd June',0,0,0,NULL,4,'REGISTRAR'),(612,'2022-06-16','2022-06-30',81,'URBUDA, ROBERT MARQUEZ',20000,10000,9.57,0,0,9990.43,0,900,300,400,0,0,0,0,0,0,1600,8390.43,2022,'2nd June',0,0,0,'',5,'Human Resource and Development'),(613,'2022-06-16','2022-06-30',82,'VICENTE, JOHN MARK SERAD',0,0,0,0,0,0,0,135,0,0,0,0,0,0,0,0,135,-135,2022,'2nd June',0,0,0,'',13,'Technical Vocational'),(614,'2022-06-16','2022-06-30',83,'VILLEGAS, JELSON TEMPLA',9000,4500,0,0,0,0,0,405,135,180,0,0,0,0,0,0,720,0,2022,'2nd June',0,0,0,'',1,'ADMIN'),(615,'2022-06-16','2022-06-30',84,'VIRTUDAZO, JOSHUA SALVE',15000,7500,150.72,0,0,7349.28,0,675,225,300,0,0,0,0,0,0,1200,6149.28,2022,'2nd June',0,0,0,'',1,'ADMIN'),(616,'2022-06-16','2022-06-30',9,'BABATID, GUADALUPE INSON',13000,6500,0,0,0,0,0,585,195,260,0,0,0,0,0,0,1040,0,2022,'2nd June',0,0,0,'',1,'ADMIN');

/*Table structure for table `emp_performance` */

DROP TABLE IF EXISTS `emp_performance`;

CREATE TABLE `emp_performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(20) DEFAULT NULL,
  `emp_name` varchar(55) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `period_from` date DEFAULT NULL,
  `period_to` date DEFAULT NULL,
  `reviewer` varchar(155) DEFAULT NULL,
  `reviewer_title` varchar(100) DEFAULT NULL,
  `goal` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_performance` */

/*Table structure for table `emp_performance_detail` */

DROP TABLE IF EXISTS `emp_performance_detail`;

CREATE TABLE `emp_performance_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_performanceID` int(11) DEFAULT NULL,
  `eval_cat_id` int(11) DEFAULT NULL,
  `eval_category` varchar(100) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_performance_detail` */

/*Table structure for table `emp_sched` */

DROP TABLE IF EXISTS `emp_sched`;

CREATE TABLE `emp_sched` (
  `emp_sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emp_sched_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_sched` */

/*Table structure for table `emp_skills` */

DROP TABLE IF EXISTS `emp_skills`;

CREATE TABLE `emp_skills` (
  `skills_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `skill` varchar(255) DEFAULT NULL,
  `skills_image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`skills_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_skills` */

/*Table structure for table `emp_sss_loan` */

DROP TABLE IF EXISTS `emp_sss_loan`;

CREATE TABLE `emp_sss_loan` (
  `sss_loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `sss_loan_date` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `loan_amount` double DEFAULT NULL,
  `amount_deduction` double DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `issued_by` int(11) DEFAULT 0,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT 0,
  PRIMARY KEY (`sss_loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_sss_loan` */

/*Table structure for table `emp_sss_loan_details` */

DROP TABLE IF EXISTS `emp_sss_loan_details`;

CREATE TABLE `emp_sss_loan_details` (
  `sss_loan_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sss_loan_id` int(11) DEFAULT NULL,
  `date_deducted` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` double DEFAULT 0,
  `current_deduction` double DEFAULT 0,
  `current_balance` double DEFAULT 0,
  `remaining_balance` double DEFAULT 0,
  PRIMARY KEY (`sss_loan_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_sss_loan_details` */

/*Table structure for table `emp_training_seminars` */

DROP TABLE IF EXISTS `emp_training_seminars`;

CREATE TABLE `emp_training_seminars` (
  `training_seminar_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `seminar_training` varchar(255) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `seminar_address` varchar(255) DEFAULT NULL,
  `certificate_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`training_seminar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emp_training_seminars` */

/*Table structure for table `employee_attachment` */

DROP TABLE IF EXISTS `employee_attachment`;

CREATE TABLE `employee_attachment` (
  `attachmentID` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(50) DEFAULT NULL,
  `dir_path` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`attachmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_attachment` */

/*Table structure for table `employee_type` */

DROP TABLE IF EXISTS `employee_type`;

CREATE TABLE `employee_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `employee_type` */

insert  into `employee_type`(`id`,`employee_type`,`created_at`,`updated_at`) values (1,'ADMIN','2019-03-21 00:00:00',NULL),(2,'SUB ADMIN','2019-03-21 00:00:00',NULL),(3,'PAYROLL STAFF','2019-03-21 00:00:00',NULL),(4,'HR STAFF','2019-03-21 00:00:00',NULL),(5,'EMP USER','2019-03-21 00:00:00',NULL),(6,'LINE LEADER','2019-03-21 00:00:00',NULL);

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `SysPK_Empl` int(11) NOT NULL AUTO_INCREMENT,
  `UserID_Empl` varchar(50) DEFAULT '',
  `Name_Empl` varchar(255) DEFAULT '',
  `FirstName_Empl` varchar(50) DEFAULT '',
  `MiddleName_Empl` varchar(50) DEFAULT '',
  `LastName_Empl` varchar(50) DEFAULT '',
  `Address_Empl` varchar(255) DEFAULT '',
  `Position_Empl` varchar(100) DEFAULT '',
  `Department_Empl` varchar(100) DEFAULT '',
  `SSS_Empl` varchar(50) DEFAULT '',
  `TIN_Empl` varchar(50) DEFAULT '',
  `BloodType_Empl` varchar(50) DEFAULT '',
  `EmergencyName_Empl` varchar(255) DEFAULT '',
  `EmergencyAdd_Empl` varchar(255) DEFAULT '',
  `EmergencyTelNo_Empl` varchar(50) DEFAULT '',
  `AccountNo_Empl` varchar(50) DEFAULT '',
  `TimeStart_Empl` varchar(50) DEFAULT '',
  `TimeEnd_Empl` varchar(50) DEFAULT '',
  `DoleRate_Empl` double DEFAULT 0,
  `PhotoPath_Empl` text DEFAULT NULL,
  `picture_path` varchar(255) DEFAULT '',
  `BirthDate_Empl` date DEFAULT NULL,
  `RatePerDay_Empls` double DEFAULT 0,
  `DeductCashBond_Empl` double DEFAULT 0,
  `CashCard_Empl` double DEFAULT 0,
  `DateHired_Empl` date DEFAULT NULL,
  `DatTerminated_Empl` date DEFAULT NULL,
  `Status_Empl` varchar(50) DEFAULT '',
  `Type_Empl` varchar(50) DEFAULT '',
  `Remarks_Empl` varchar(255) DEFAULT '',
  `Honorarium_Empl` double DEFAULT 0,
  `BasicSalary_Empls` double DEFAULT 0,
  `Group_Empl` varchar(50) DEFAULT '',
  `deduction_effectivity` varchar(50) DEFAULT '',
  `withHolding_effectivity` varchar(50) DEFAULT '',
  `Allowance` double DEFAULT 0,
  `Restday` varchar(255) DEFAULT '',
  `philhealth_no` varchar(255) DEFAULT '',
  `pagibig_no` varchar(255) DEFAULT '',
  `weight` varchar(255) DEFAULT '',
  `height` varchar(255) DEFAULT '',
  `gender` varchar(255) DEFAULT '',
  `resident_certificate_no` varchar(255) DEFAULT '',
  `civilStatus` varchar(255) DEFAULT '',
  `dependent` tinyint(4) DEFAULT 0,
  `gp_sss_ee` double DEFAULT 0 COMMENT 'sss employee share',
  `gp_sss_er` double DEFAULT 0 COMMENT 'sss employer''s share',
  `gp_phealth_ee` double DEFAULT 0,
  `gp_phealth_er` double DEFAULT 0,
  `gp_pagibig_ee` double DEFAULT 0,
  `gp_pagibig_er` double DEFAULT 0,
  `gp_wtax` double DEFAULT 0,
  `dept_id` varchar(100) DEFAULT '',
  `is_classified` tinyint(1) DEFAULT 0,
  `biometric_id` varchar(20) DEFAULT '',
  `transpo_allowance` double DEFAULT 0,
  `mobile_allowance` double DEFAULT 0,
  `osa_allowance` double DEFAULT 0,
  `meal_allowance` double DEFAULT 0,
  `no_of_days` double DEFAULT 0,
  `email` varchar(255) DEFAULT '',
  `contact_no` varchar(255) DEFAULT '',
  `emp_level_id` int(11) DEFAULT 0,
  `bank` varchar(255) DEFAULT '',
  `rate_type` varchar(255) DEFAULT '',
  `updated_at` datetime DEFAULT NULL,
  `cost_center_id` int(11) DEFAULT 0,
  `cost_center` varchar(255) DEFAULT '',
  `require_dtr` int(11) DEFAULT 1,
  `sick_leave_credit` double DEFAULT 0,
  `vacation_leave_credit` double DEFAULT 0,
  `maternity_leave_credit` double DEFAULT 0,
  `paternity_leave_credit` double DEFAULT 0,
  `medical_allowance_dependent` double DEFAULT 0,
  `cloathing_allowance` double DEFAULT 0,
  `laundry_allowance` double DEFAULT 0,
  PRIMARY KEY (`SysPK_Empl`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;

/*Data for the table `employees` */

insert  into `employees`(`SysPK_Empl`,`UserID_Empl`,`Name_Empl`,`FirstName_Empl`,`MiddleName_Empl`,`LastName_Empl`,`Address_Empl`,`Position_Empl`,`Department_Empl`,`SSS_Empl`,`TIN_Empl`,`BloodType_Empl`,`EmergencyName_Empl`,`EmergencyAdd_Empl`,`EmergencyTelNo_Empl`,`AccountNo_Empl`,`TimeStart_Empl`,`TimeEnd_Empl`,`DoleRate_Empl`,`PhotoPath_Empl`,`picture_path`,`BirthDate_Empl`,`RatePerDay_Empls`,`DeductCashBond_Empl`,`CashCard_Empl`,`DateHired_Empl`,`DatTerminated_Empl`,`Status_Empl`,`Type_Empl`,`Remarks_Empl`,`Honorarium_Empl`,`BasicSalary_Empls`,`Group_Empl`,`deduction_effectivity`,`withHolding_effectivity`,`Allowance`,`Restday`,`philhealth_no`,`pagibig_no`,`weight`,`height`,`gender`,`resident_certificate_no`,`civilStatus`,`dependent`,`gp_sss_ee`,`gp_sss_er`,`gp_phealth_ee`,`gp_phealth_er`,`gp_pagibig_ee`,`gp_pagibig_er`,`gp_wtax`,`dept_id`,`is_classified`,`biometric_id`,`transpo_allowance`,`mobile_allowance`,`osa_allowance`,`meal_allowance`,`no_of_days`,`email`,`contact_no`,`emp_level_id`,`bank`,`rate_type`,`updated_at`,`cost_center_id`,`cost_center`,`require_dtr`,`sick_leave_credit`,`vacation_leave_credit`,`maternity_leave_credit`,`paternity_leave_credit`,`medical_allowance_dependent`,`cloathing_allowance`,`laundry_allowance`) values (1,'1','ABING, HACELJEN INCIPIDO','HACELJEN','INCIPIDO','ABING','P-6 AURELIO, SAN JOSE, DINAGAT ISLANDS','15','Basic Education','08-2996726-9','755-185-648',NULL,NULL,NULL,NULL,'2039482039',NULL,NULL,0,NULL,'','1998-06-24',0,0,0,NULL,NULL,'REGULAR','','',0,12000,'','1-15','',0,'SUNDAY','18-250868174-8','1212-5759-6128','61kg','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'116',0,0,0,0,21.77,NULL,'09203345465',1,'Land Bank','Monthly','2022-08-23 10:10:32',0,'',0,0,0,0,0,0,0,0),(2,'2','AGOCOY, MONALIZA PESTANO','MONALIZA','PESTANO','AGOCOY','P-5 GARCIA LIBJO, DINAGAT ISLANDS','16','Basic Education','08-2965470-5','755-777-878','O','PAULINO A.  AGOCOY','P-5 GARCIA, LIBJO, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1997-08-12',0,0,0,NULL,NULL,'REGULAR','','',0,15000,'','1-15','',0,'SUNDAY','18-050184590-4','1212-5326-3810','36','149','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'74',0,0,0,0,21.77,NULL,'09071471738',1,'Land Bank','Monthly','2034-05-19 16:30:55',0,'',0,0,0,0,0,0,0,0),(3,'3','AMPATIN, RITA Nan','RITA','Nan','AMPATIN','Brgy. Santa Cruz, San Jose, Dinagat Islands','30','ADMIN',NULL,NULL,'AB+','fgf','P-3 STA.CRUZ','09305943246',NULL,NULL,NULL,0,NULL,'','1957-12-01',0,0,0,NULL,NULL,'REGULAR','','',0,10000,'','1-15','',0,'SUNDAY',NULL,NULL,'63','5\'2','Female','CCI2019 08300945','Single',0,0,0,0,0,0,0,0,'1',0,'46',0,0,0,0,21.77,NULL,'09305943246',1,'Land Bank','Monthly','2022-08-23 09:55:39',0,'',0,0,0,0,0,0,0,0),(5,'5','ARCALA, RITA TABAMO','RITA','TABAMO','ARCALA','P-6 Don Ruben, San Jose, Dinagat Islands','7','Business Education','08-19334207','190-714-905','A','MR. LUCAS P. ARCALA','P-1 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','09126984363','',NULL,NULL,0,NULL,'','1955-11-15',0,0,0,NULL,NULL,'REGULAR','','',0,26500,'','1-15','',0,'SUNDAY','18-050015958-6','1210-4988-1332','115kls','5\'2','Female',NULL,'Married',0,0,0,0,0,0,0,0,'7',0,'24',0,0,0,0,21.77,NULL,'09126894363',1,'Land Bank','Monthly','2034-05-19 16:37:50',0,'',0,0,0,0,0,0,0,0),(6,'6','ARNOCO, ELMA MORENO','ELMA','MORENO','ARNOCO','P-6 Don Ruben, San Jose, Dinagat Islands','14','Art and Sciences','34-2485533-3','745-663-466',NULL,'PETER JAN M. ESPARTERO',NULL,NULL,NULL,NULL,NULL,0,NULL,'','1992-05-10',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','18-200783121-9','1212-8040-9929',NULL,'5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'10',0,'138',0,0,0,0,21.77,NULL,'09385411330',1,'Land Bank','Monthly','2022-08-23 10:33:15',0,'',0,0,0,0,0,0,0,0),(8,'8','ARTIZUELA, RUTCHILLE BARRIOS','RUTCHILLE','BARRIOS','ARTIZUELA','P-3 SAN JUAN, SAN JOSE, DINAGAT ISLANDS','26','ADMIN','35-0181260-0','389-326-734',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1996-01-25',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','18-251199487-0','1212-8014-8427','50','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'137',0,0,0,0,21.77,'rutchilleartizuela22@gmail.com','09467192930',1,'Land Bank','Monthly','2034-05-19 16:45:01',0,'',0,0,0,0,0,0,0,0),(9,'9','BABATID, GUADALUPE INSON','GUADALUPE','INSON','BABATID','P-6 Poblacion , San Jose, Dinagat Islands','22','ADMIN',NULL,NULL,'B',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1960-12-12',0,0,0,NULL,NULL,'REGULAR','','',0,13000,'','1-15','',0,'SUNDAY',NULL,NULL,'60','5\'3','Female',NULL,'Separated',0,0,0,0,0,0,0,0,'1',0,'18',0,0,0,0,21.77,NULL,'09382000558',1,'Land Bank','Monthly','2022-08-23 09:57:28',0,'',0,0,0,0,0,0,0,0),(10,'10','BANUELOS, KHAREN GRACE MALALIS','KHAREN GRACE','MALALIS','BANUELOS','P-7 Cabunga-an, Cagdianao, Dinagat Islands','16','Basic Education','35-1636709-8','387690505',NULL,'LILIA M. BANUELOS','P-7 Cabunga-an, Cagdianao, Dinagat Islands',NULL,NULL,NULL,NULL,0,NULL,'','1998-05-29',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','18-025300983-5','1212-9427-5405','49kg','158cm','Female','CCI2019 08300945','Single',0,0,0,0,0,0,0,0,'12',0,'156',0,0,0,0,21.77,NULL,'09461055561',1,'Land Bank','Monthly','2022-10-16 01:32:58',0,'',0,0,0,0,0,0,0,0),(11,'11','BELINARIO, KEVIN LERTIDO','KEVIN','LERTIDO','BELINARIO','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','31','REGISTRAR','08-2643648-9','755-246-038',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1998-07-10',0,0,0,NULL,NULL,'REGULAR','','',0,9000,'','1-15','',0,'SUNDAY','182512125132','1212-5328-2072','60','5\'5','Male',NULL,'Single',0,0,0,0,0,0,0,0,'4',0,'83',0,0,0,0,21.77,NULL,NULL,1,'Land Bank','Monthly','2034-05-19 16:52:45',0,'',0,0,0,0,0,0,0,0),(12,'12','BERIñO, DIANE BACOLOD','DIANE','BACOLOD','BERIñO','P-5 Justiniana Edera, San Jose, Dinagat Islands','14','ADMIN','35-1875389-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1994-08-15',0,0,0,NULL,NULL,'PROBATIONARY','','',0,8400,'','1-15','',0,'SUNDAY','182010503230',NULL,'48','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'161',0,0,0,0,21.77,'dianna.j316@gmail.com','09708753701',1,'Land Bank','Monthly','2022-08-23 10:37:04',0,'',0,0,0,0,0,0,0,0),(13,'13','BERNADOS, JUNREY IGONG-IGONG','JUNREY','IGONG-IGONG','BERNADOS','P-4 POBLACION, SAN JOSE, DINAGAT ISLANDS','15','Basic Education','34-0898220-6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1989-04-06',0,0,0,NULL,NULL,'PROBATIONARY','','',0,12000,'','1-15','',0,'SUNDAY','132024369351','1060-0224-3633','65','5\'2','Male',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'105',0,0,0,0,21.77,NULL,'09506682661',1,'Land Bank','Monthly','2022-08-23 10:11:05',0,'',0,0,0,0,0,0,0,0),(14,'14','BERTE, HAZEL RAMOS','HAZEL','RAMOS','BERTE','P-6 Don Ruben, San Jose, Dinagat Islands','8','Hospitality and Tourism Management','08-2099507-8','711-935-409',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1981-05-21',0,0,0,NULL,NULL,'REGULAR','','',0,24500,'','1-15','',0,'SUNDAY','182006292799','1211-4133-1459',NULL,NULL,'Female',NULL,'Married',0,0,0,0,0,0,0,0,'9',0,'48',0,0,0,0,21.77,NULL,NULL,1,'Land Bank','Monthly','2034-05-19 17:05:33',0,'',0,0,0,0,0,0,0,0),(15,'15','BLANCO, JASMEN OCAY','JASMEN','OCAY','BLANCO','P-6 Don Ruben, San Jose, Dinagat Islands','36','Basic Education','35-0186304-4','747-256-042','O',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1998-10-21',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','180501886511','1212-8043-4710','55','5\'5','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'129',0,0,0,0,21.77,'jasmenblanco@gmail.com','09306981206',1,'Land Bank','Monthly','2034-05-19 17:08:13',0,'',0,0,0,0,0,0,0,0),(19,'19','BUSANO, MARYLAND ESNARDO','MARYLAND','ESNARDO','BUSANO','P-7 MABINI PUBLACION, SAN JOSE, DINAGAT ISLANDS','14','Business Education','08-2555074-8','755-779-951','B','JULIOS A. BUSANO','P-7 MABINI PUBLACION, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1991-08-12',0,0,0,NULL,NULL,'REGULAR','','',0,18000,'','1-15','',0,'SUNDAY','18-050152929-8','1211-4147-3502','47kg','5\'0','Female',NULL,'Married',0,0,0,0,0,0,0,0,'7',0,'9',0,0,0,0,21.77,NULL,'09463621996',1,'Land Bank','Monthly','2034-05-19 17:20:16',0,'',0,0,0,0,0,0,0,0),(20,'20','CABITANA, BERLYN TABAMO','BERLYN','TABAMO','CABITANA','P-4 CUARENTA, SAN JOSE, DINAGAT ISLANDS','33','Information and Communication Technology (ICT)','08-1853563-1','286-026-966-000','B+',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1987-01-10',0,0,0,NULL,NULL,'REGULAR','','',0,14500,'','1-15','',0,'SUNDAY','18-050099392-6','1210-8457-1510','60','5\'7','Female',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'5',0,0,0,0,21.77,NULL,'09506682944',1,'Land Bank','Monthly','2034-05-19 17:22:53',0,'',0,0,0,0,0,0,0,0),(21,'21','CALLORA., MARRYFOL RETUBES','MARRYFOL','RETUBES','CALLORA.','P-4 DELA CONCEPTION,  STO. NIÑO,  LIBJO, DINAGAT ISLANDS','14','Business Education','08-2992797-9','718-133-378','O','SAMUEL S. CALLORA','P-4 STO. NIÑO, LIBJO, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1999-06-22',0,0,0,NULL,NULL,'PROBATIONARY','','',0,11000,'','1-15','',0,'SUNDAY','182516762757','1212-6012-9856','58','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'7',0,'120',0,0,0,0,21.77,NULL,'09502059977',1,'Land Bank','Monthly','2022-08-23 10:06:36',0,'',0,0,0,0,0,0,0,0),(22,'22','CANOY, CHERYL UDTUJAN','CHERYL','UDTUJAN','CANOY','P-5 WILSON, SAN JOSE, DINAGAT ISLANDS','14','Art and Sciences','08-1575875-4','004388541000','A+',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1987-01-24',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','180252121224','1212-8043-1146','132 LBS','4\'9\"','Female',NULL,'Married',0,0,0,0,0,0,0,0,'10',0,'135',0,0,0,0,21.77,'cherylcanoy26@gmail.com','09516812694',1,'Land Bank','Monthly','2022-08-23 10:34:20',0,'',0,0,0,0,0,0,0,0),(23,'23','CREENCIA, ANAMAE TIAMZON','ANAMAE','TIAMZON','CREENCIA','P-4 SAN JOSE LIBJO(ALBOR II), DINAGAT ISLANDS','16','Basic Education',NULL,'600-805-096-000','O','ALADIN B. CREENCIA','P-4 SAN JOSE LIBJO(ALBOR II), DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1997-10-20',0,0,0,NULL,NULL,'PROBATIONARY','','',0,11000,'','1-15','',0,'SUNDAY','180253040155',NULL,'40kg','4\'11cm','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'153',0,0,0,0,21.77,NULL,'09094650254',1,'Land Bank','Monthly','2022-10-16 01:31:59',0,'',0,0,0,0,0,0,0,0),(25,'25','COSCOS, DENNIS AVERGONZADO','DENNIS','AVERGONZADO','COSCOS','P-2 LLAMERA LIBJO, DINAGAT ISLANDS','31','ADMIN','08-2723778-4','495381191000','B','AURELIO B. COSCOS SR.','P-2 LLAMERA LIBJO',NULL,'',NULL,NULL,0,NULL,'','1992-04-05',0,0,0,NULL,NULL,'REGULAR','','',0,22500,'','1-15','',0,'SUNDAY','182008944998','1211-9076-0500','60','5\'5','Male',NULL,'Single',-2,0,0,0,0,0,0,0,'1',0,'69',0,0,0,0,21.77,NULL,'09100891678',1,'Land Bank','Monthly','2034-05-19 17:36:29',0,'',0,0,0,0,0,0,0,0),(26,'26','DE LUIS, DARWIN OMAC','DARWIN','OMAC','DE LUIS','P-5 DEL PILAR, POBLACION, DINAGAT ISLANDS','16','Basic Education','08-2337798-1','004-388-541-000','O+','JIMMY O. DE LUIS',NULL,NULL,'',NULL,NULL,0,NULL,'','1992-10-16',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','18-200895771-2','1211-8130-8239','65 kls','5\'5\'\'','Male',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'140',0,0,0,0,21.77,NULL,'09305982590',1,'Land Bank','Monthly','2034-05-19 17:38:30',0,'',0,0,0,0,0,0,0,0),(27,'27','DIVINAGRACIA, BEATRIZ CARREON','BEATRIZ','CARREON','DIVINAGRACIA','P-3 SAN JUAN, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','33-4331814-2','000-407-203-000','A+','FELIPE E. DIVINAGRACIA, SR.',NULL,NULL,'',NULL,NULL,0,NULL,'','1959-10-05',0,0,0,NULL,NULL,'REGULAR','','',0,20000,'','1-15','',0,'SUNDAY','19-051526058-0','1210-7863-4699','40 KLS','4\'11\"','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'7',0,0,0,0,21.77,NULL,'09098628735',1,'Land Bank','Monthly','2034-05-02 02:39:23',0,'',0,0,0,0,0,0,0,0),(29,'29','EDRADAN, ARNAN ANTALLAN','ARNAN','ANTALLAN','EDRADAN','P-4 LUNA, SAN JOSE, DINAGAT ISLANDS','14','ADMIN','08-1094763-8','915-469-933','AB','ARTURO B. EDRADAN','P-4 LUNA DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1976-05-16',0,0,0,NULL,NULL,'REGULAR','','',0,16000,'','1-15','',0,'SUNDAY','190902078227','1830-0011-8024','85','5\'7','Male',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'49',0,0,0,0,21.77,NULL,'09129862856',1,'Land Bank','Monthly','2034-05-19 17:42:31',0,'',0,0,0,0,0,0,0,0),(30,'30','EMPINADO, ETHEL ALEGADO','ETHEL','ALEGADO','EMPINADO','P-5 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','17','ACCOUNTING','08-1719380-9','732-080-558',NULL,'RIZALINO V. EMPINADO',NULL,NULL,NULL,NULL,NULL,0,NULL,'','1985-11-14',0,0,0,NULL,NULL,'REGULAR','','',0,18500,'','1-15','',0,'SUNDAY','18-050076817-5','1211-3419-4226','48 kg','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'3',0,'23',0,0,0,0,21.77,NULL,'09093246682',1,'Land Bank','Monthly','2022-11-14 21:55:06',0,'',0,0,0,0,0,0,0,0),(31,'31','ENTRINA, ANGEL GUALDAJARA','ANGEL','GUALDAJARA','ENTRINA','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS','31','ACCOUNTING','35-1054946-9','505-643-782-00000','B','EGMEDIO L. ENTRINA','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1998-12-07',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','08-050190217-7','1212-8863-4793','51kg','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'3',0,'146',0,0,0,0,21.77,'angelkimentrina@gmail.com','09207418657',1,'Land Bank','Monthly','2034-05-19 17:45:32',0,'',0,0,0,0,0,0,0,0),(32,'32','ENSOY, HERMENIA BARNISO','HERMENIA','BARNISO','ENSOY','P-5 Aurelio, San Jose, Dinagat Islands','14','Criminology','35-1267036-5',NULL,'B+',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1996-07-29',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','18-025288154-7','1212-9470-9856','61kls.','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'11',0,'155',0,0,0,0,21.77,'hermeniaensoy@gmail.com','09480649630',1,'Land Bank','Monthly','2022-08-23 10:26:57',0,'',0,0,0,0,0,0,0,0),(33,'33','ESNARDO, MARICHU MANTE','MARICHU','MANTE','ESNARDO','P-7 MABINI, SAN JOSE, DINAGAT ISLANDS','4','ADMIN','08-1090935-9','190-717-689','B','MR. RONALDO E. ESNARDO',NULL,NULL,'',NULL,NULL,0,NULL,'','1964-11-14',0,0,0,NULL,NULL,'REGULAR','','',0,27000,'','1-15','',0,'SUNDAY','18-050015972-1','1210-4661-6817','49klg','5\'1','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'13',0,0,0,0,21.77,NULL,'09123947055',1,'Land Bank','Monthly','2034-05-19 17:49:36',0,'',0,0,0,0,0,0,0,0),(34,'34','ESNARDO, RAYMART MANTE','RAYMART','MANTE','ESNARDO','P-7 MABINI, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','35-0172475-6',NULL,NULL,'MR. ROLANDO E. ESNARDO','P-7 MABINI, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1995-03-22',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','18-050188654-6','1212-8041-1520',NULL,NULL,'Male',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'128',0,0,0,0,21.77,'reymartesnardo@gmail.com',NULL,1,'Land Bank','Monthly','2034-05-19 17:51:27',0,'',0,0,0,0,0,0,0,0),(35,'35','FERNAN, ALEX RELACION','ALEX','RELACION','FERNAN','P-5 RUBEN E. ECLEO SR. CAGDIANAO, DINAGAT ISLANDS','31','ACCOUNTING','08-1387214-0','931-105-151',NULL,'ROSIE C. FERNAN','P-5 RUBEN E. ECLEO SR. CAGDIANAO, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1972-04-27',0,0,0,NULL,NULL,'REGULAR','','',0,19000,'','1-15','',0,'SUNDAY','180500744195','1210-1486-0006','68kgs','5\'5\'\'','Male',NULL,'Married',0,0,0,0,0,0,0,0,'3',0,'42',0,0,0,0,21.77,NULL,'09468286094',1,'Land Bank','Monthly','2034-05-19 17:53:47',0,'',0,0,0,0,0,0,0,0),(38,'38','GAVIOLA, SHARIZOL LAPENIG','SHARIZOL','LAPENIG','GAVIOLA','P-5 LUNA, SAN JOSE, DINAGAT ISLANDS','31','Criminology','08-2997977-8','338-771-187',NULL,'ADELING L. GAVIOLA',NULL,NULL,'',NULL,NULL,0,NULL,'','1996-01-09',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','1500254700071','1212-0292-0328',NULL,NULL,'Male',NULL,'Single',0,0,0,0,0,0,0,0,'11',0,NULL,0,0,0,0,21.77,'gsharizol@gmail.com','09488612926',1,'Land Bank','Monthly','2034-05-19 17:56:28',0,'',0,0,0,0,0,0,0,0),(39,'39','GISMAN, CAREN BUAL','CAREN','BUAL','GISMAN','AURELIO, SAN JOSE DINAGAT ISLANDS','27','Technical Vocational','34-2323845-6','732-113-746',NULL,'CERELINA AMORA BUAL',NULL,NULL,'',NULL,NULL,0,NULL,'','1988-07-30',0,0,0,NULL,NULL,'REGULAR','','',0,20000,'','1-15','',0,'SUNDAY','182007620528','1211-4540-1687','48 kg','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'13',0,'84',0,0,0,0,21.77,NULL,'09486252971',1,'Land Bank','Monthly','2034-05-19 17:58:01',0,'',0,0,0,0,0,0,0,0),(40,'40','GRAVANZA, ADELAIDA RAFAEL','ADELAIDA','RAFAEL','GRAVANZA','P-4 POBLACION, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','09-1006849-1','188-569-864','A+','BERNARDOM. GRAVANZA','P-4 POBLACION',NULL,'',NULL,NULL,0,NULL,'','1959-07-03',0,0,0,NULL,NULL,'REGULAR','','',0,22000,'','1-15','',0,'SUNDAY','180500744187','1210-4582-8353','90','5\'2','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'12',0,0,0,0,21.77,NULL,'09305491202',1,'Land Bank','Monthly','2034-05-19 18:00:00',0,'',0,0,0,0,0,0,0,0),(41,'41','INSON, MERIAM DAGCUTAN','MERIAM','DAGCUTAN','INSON','P-3 AURELIO, SAN JOSE, DINAGAT ISLANDS','36','Basic Education','08-1835466-3','503-021-097','B+',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1985-05-23',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','18-025239430-1','121288740334','45 kg','153 cm','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'141',0,0,0,0,21.77,NULL,'09995666104',1,'Land Bank','Monthly','2022-08-24 08:20:01',0,'',0,0,0,0,0,0,0,0),(43,'43','LAID, JHESORLEY MAGANA','JHESORLEY','MAGANA','LAID','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS','9','Information and Communication Technology (ICT)','08-265153-5',NULL,NULL,'JOSEROLLY S. LAID','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1989-12-23',0,0,0,NULL,NULL,'REGULAR','','',0,22000,'','1-15','',0,'SUNDAY','182008215007','121172271911','50','167cm','Male',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'1',0,0,0,0,21.77,NULL,'09466732212',1,'Land Bank','Monthly','2034-05-19 17:51:07',0,'',0,0,0,0,0,0,0,0),(44,'44','LASTIMOSO, DINO ROSALES','DINO','ROSALES','LASTIMOSO','P-4 LLAMERA DISTRICT I','31','ADMIN','08-2842365-2','399-245-667-000','A+',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1999-08-17',0,0,0,NULL,NULL,'PROBATIONARY','','',0,8000,'','1-15','',0,'SUNDAY','182012604875','121224198436','61','5,4','Male',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'157',0,0,0,0,21.77,'dino_lastimoso@yahoo.com','09306873930',1,'Land Bank','Monthly','2034-05-19 17:54:16',0,'',0,0,0,0,0,0,0,0),(45,'45','LAPINID, MARIBEL SOLANO','MARIBEL','SOLANO','LAPINID','P-4 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','14','ADMIN',NULL,'399-852-986','B+',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1995-12-22',0,0,0,NULL,NULL,'PROBATIONARY','','',0,11000,'','1-15','',0,'SUNDAY','182010456488','121287556603','47','158','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'139',0,0,0,0,21.77,NULL,'09703748135',1,'Land Bank','Monthly','2022-08-23 10:35:50',0,'',0,0,0,0,0,0,0,0),(46,'46','LECCIONES, DONALD GONZAGA','DONALD','GONZAGA','LECCIONES','P-7 RIZAL MELGAR, BASILISA, DINAGAT ISLANDS','14','Criminology',NULL,'755-251-437',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1989-11-05',0,0,0,NULL,NULL,'REGULAR','','',0,20000,'','1-15','',0,'SUNDAY','182010427011','121257072789','53','5\'4','Male',NULL,'Single',0,0,0,0,0,0,0,0,'11',0,'52',0,0,0,0,21.77,NULL,NULL,1,'Land Bank','Monthly','2034-05-19 17:55:54',0,'',0,0,0,0,0,0,0,0),(47,'47','LETIGIO, REJOY POGADO','REJOY','POGADO','LETIGIO','P-1 MAHAYAHAY, SAN JOSE, DINAGAT ISLANDS','16','Basic Education','08-2964864-3','755-794-587-000',NULL,'JOVEN D. LETIGO','P-1 MAHAYAHAY',NULL,NULL,NULL,NULL,0,NULL,'','1992-02-19',0,0,0,NULL,NULL,'PROBATIONARY','','',0,10000,'','1-15','',0,'SUNDAY','18-200895724-0','1212-5331-9271','45','5\'2\'\'','Female',NULL,'Married',-2,0,0,0,0,0,0,0,'12',0,'103',0,0,0,0,21.77,'Letigiorejoy@gmail.com','09073759704',1,'Land Bank','Monthly','2022-08-23 10:11:51',0,'',0,0,0,0,0,0,0,0),(48,'48','LICO, ROZYL ROMA','ROZYL','ROMA','LICO','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','14','Basic Education',NULL,'503-021-350',NULL,'AURELIO M. LICO','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-07-24',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','142508631838','121294725021','46','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'142',0,0,0,0,21.77,'rozyllico@gmail.com','09510486705',1,'Land Bank','Monthly','2022-08-23 10:38:52',0,'',0,0,0,0,0,0,0,0),(49,'49','LOPEZ, NORA LUMIARES','NORA','LUMIARES','LOPEZ','P-6 AURELIO, SAN JOSE, DINAGAT ISALANDS','5','Teacher Education',NULL,'129-118-459','O','DELFIN C. LOPEZ','P-6 AURELIO, SAN JOSE, DINAGAT ISALANDS',NULL,NULL,NULL,NULL,0,NULL,'','1956-10-02',0,0,0,NULL,NULL,'REGULAR','','',0,26000,'','1-15','',0,'SUNDAY','13600116801','1700-0064-7793','130lbs','5\'4','Female',NULL,'Married',0,0,0,0,0,0,0,0,'8',0,'143',0,0,0,0,21.77,'nora.lopez@ssu.edu.ph','09187085678',1,'Land Bank','Monthly','2022-08-23 10:02:27',0,'',0,0,0,0,0,0,0,0),(50,'50','LULAB, AEYMH ZHAYL LAUSA','AEYMH ZHAYL','LAUSA','LULAB','P-1 IMELDA TUBAJON, DINAGAT ISLANDS','36','Basic Education','08-296-5403-5','738-162-169',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1997-03-31',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','18050184920','121253324833','48','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'81',0,0,0,0,21.77,NULL,'09303097087',1,'Land Bank','Monthly','2034-05-19 17:59:13',0,'',0,0,0,0,0,0,0,0),(51,'51','LUMPAY, MARGIE LYN LACUMBES','MARGIE LYN','LACUMBES','LUMPAY','GUMATO STREET MABINI, TUBAJON, DINAGAT ISLANDS','14','ADMIN',NULL,'505-843-890-000','O-','MARIVIC L. LUMPAY','GUMATO STREET MABINI, TUBAJON, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-03-27',0,0,0,NULL,NULL,'PROBATIONARY','','',0,11000,'','1-15','',0,'SUNDAY','18-251214056-5','121289337263','60','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'150',0,0,0,0,21.77,'margielynlumpay@gmail.com','09106910341',1,'Land Bank','Monthly','2022-08-23 10:36:09',0,'',0,0,0,0,0,0,0,0),(52,'52','MABANAG, RUTHCELYNE SALUDO','RUTHCELYNE','SALUDO','MABANAG','P-2 DONA HELEN, LIBJO,DINAGAT ISLANDS','16','Basic Education',NULL,'729-778-467-000',NULL,'COSME E. MABANAG','P-5 POBLACION, SAN JOSE, DINAGAT ISLANDS','09126864941',NULL,NULL,NULL,0,NULL,'','1993-03-26',0,0,0,NULL,NULL,'PROBATIONARY','','',0,13000,'','1-15','',0,'SUNDAY','18-025276500-8','121257646028','56klg','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'115',0,0,0,0,21.77,'ruthcelynemabanag@gmail.com','09489969532',1,'Land Bank','Monthly','2022-08-23 10:11:28',0,'',0,0,0,0,0,0,0,0),(53,'53','MALLERNA, EVELYN BAJAR','EVELYN','BAJAR','MALLERNA','P-4 JACQUEZ','31','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1993-10-05',0,0,0,NULL,NULL,'REGULAR','','',0,7000,'','1-15','',0,'SUNDAY',NULL,NULL,NULL,NULL,'Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'66',0,0,0,0,21.77,NULL,NULL,1,'Land Bank','Monthly','2023-01-06 03:46:48',0,'',0,0,0,0,0,0,0,0),(54,'54','MAMALIAS, JOAN MABOLIS','JOAN','MABOLIS','MAMALIAS','JACQUEZ, SAN JOSE, DINAGAT ISLANDS','36','Basic Education','35-1097866-1','505-843-733',NULL,'RENAN A. TOMINES','P - 1 JACQUEZ SAN JOSE DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1994-04-07',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','180501903165','121288463565','47kg','153 cm','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'159',0,0,0,0,21.77,NULL,'09502785825',1,'Land Bank','Monthly','2022-08-24 08:10:55',0,'',0,0,0,0,0,0,0,0),(55,'55','MANEJA, JERSON OCON','JERSON','OCON','MANEJA','P-5 AURELIO, SAN JOSE, DINAGAT ISLANDS','14','Information and Communication Technology (ICT)','0826487386','703-005-974','O',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1992-07-14',0,0,0,NULL,NULL,'REGULAR','','',0,16000,'','1-15','',0,'SUNDAY','180501772621','121252825404','50','151 cm','Male',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'20',0,0,0,0,21.77,NULL,'09105227009',1,'Land Bank','Monthly','2022-08-24 05:20:54',0,'',0,0,0,0,0,0,0,0),(56,'56','MANEJA, NELIA MANGUBAT','NELIA','MANGUBAT','MANEJA','P-1 MAHAYAHAY, SAN JOSE, DINAGAT ISLANDS','20','ACCOUNTING',NULL,'497-689-275',NULL,'JERSON O. MANEJA',NULL,'09106227009','',NULL,NULL,0,NULL,'','1993-10-17',0,0,0,NULL,NULL,'REGULAR','','',0,15000,'','1-15','',0,'SUNDAY','0826672544','121178008714','49','5\'0','Female',NULL,'Married',0,0,0,0,0,0,0,0,'3',0,'88',0,0,0,0,21.77,NULL,'09464337218',1,'Land Bank','Monthly','2034-05-19 18:11:38',0,'',0,0,0,0,0,0,0,0),(57,'57','MANGUBAT, JONALY DESPI','JONALY','DESPI','MANGUBAT','P-1 POBLACION, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','34-02272365','432-948-727','O','DEAN ELLAR','P-1 POBLACION, SAN JOSE, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1988-07-29',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','03-050567609-9',NULL,'75','5\'4','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'144',0,0,0,0,21.77,'jonalymangubat88@gmail.com','0977933087',1,'Land Bank','Monthly','2022-08-24 05:45:02',0,'',0,0,0,0,0,0,0,0),(58,'58','MANTE, CHRISTIAN IAN MARILLA','CHRISTIAN IAN','MARILLA','MANTE','P - 7 POBLACION SAN JOSE DINAGAT ISLANDS','31','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1998-05-20',0,0,0,NULL,NULL,'REGULAR','','',0,12000,'','1-15','',0,'SUNDAY',NULL,NULL,NULL,NULL,'Male',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'100',0,0,0,0,21.77,NULL,NULL,1,'Land Bank','Monthly','2022-08-23 10:08:10',0,'',0,0,0,0,0,0,0,0),(59,'59','MANTE, JESSERIE ANN','JESSERIE','ANN','MANTE','P-7 MABINI POBLACION, SAN JOSE, DINAGAT ISLANDS','14','Business Education','08-2848609-7','707-864-180-000',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1996-12-14',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','180252836053','121233357928','57','5\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'7',0,'134',0,0,0,0,21.77,'mantejayann@gmail.com','09308581204',1,'Land Bank','Monthly','2034-05-19 16:31:52',0,'',0,0,0,0,0,0,0,0),(60,'60','MARTINES, SUSAN MORTAL','SUSAN','MORTAL','MARTINES','P-1 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','19','ADMIN','35-0438076-0','509-227-559',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1969-12-25',0,0,0,NULL,NULL,'PROBATIONARY','','',0,7000,'','1-15','',0,'SUNDAY','020261422884',NULL,'50','5\'1','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'63',0,0,0,0,21.77,NULL,'09466531918',1,'Land Bank','Monthly','2034-05-19 16:48:09',0,'',0,0,0,0,0,0,0,0),(61,'61','MARZAN, JANETH ALGABRE','JANETH','ALGABRE','MARZAN','P-2 AURELIO, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','08-1388216-9','704-267-577','\"O\"','DONATO S. MARZAN','P-2 AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1976-05-25',0,0,0,NULL,NULL,'REGULAR','','',0,19500,'','1-15','',0,'SUNDAY','18-050074420-9','121054879465','60','5\'0','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'14',0,0,0,0,21.77,NULL,'0912708863',1,'Land Bank','Monthly','2034-05-19 16:35:12',0,'',0,0,0,0,0,0,0,0),(62,'62','MARZAN, MARK BENN VILOAN','MARK BENN','VILOAN','MARZAN','P-3 QUIRINO, AURELIO, SAN JOSE, DINAGAT ISLANDS','14','Hospitality and Tourism Management','35-0255770-2','750-227-885-000',NULL,'MARIANO S. MARZAN','P-3 QUIRINO, AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1995-05-14',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','18-251680051-9','121280464939','57kg','1.70m','Male',NULL,'Single',0,0,0,0,0,0,0,0,'9',0,'130',0,0,0,0,21.77,'markbennmarzan@gmail.com','09468638256',1,'Land Bank','Monthly','2034-05-19 16:37:34',0,'',0,0,0,0,0,0,0,0),(63,'63','MONATO, RAVELYEN CALIPAY','RAVELYEN','CALIPAY','MONATO','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS','24','Basic Education','08-2849224-3','742-427-116-000','AB+','RAMILO E. MONATO SR.','P-1 AURELIO, SAN JOSE, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1985-01-30',0,0,0,NULL,NULL,'REGULAR','','',0,0,'','1-15','',0,'SUNDAY','18-050177264-8','121252986799','45kg','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'3',0,0,0,0,21.77,NULL,'09306951029',1,'Land Bank','Monthly','2022-11-19 04:18:37',0,'',0,0,0,0,0,0,0,0),(64,'64','MONTES, GENERICK GROTES','GENERICK','GROTES','MONTES','P-3 STA.CRUZ, SAN JOSE, DINAGAT ISLANDS','14','Information and Communication Technology (ICT)','35-1673382-6','385-168-366',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1991-10-06',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY',NULL,'121296036292','54','164','Male',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'160',0,0,0,0,21.77,'generickmontes@gmail.com','09501810252',1,'Land Bank','Monthly','2034-05-19 16:43:45',0,'',0,0,0,0,0,0,0,0),(66,'66','NOVO, JUDYVIE EYANA','JUDYVIE','EYANA','NOVO','P-1 SAN JUAN, SAN JOSE, DINAGAT ISLANDS','14','Information and Communication Technology (ICT)','35-0360016-6','387-595-668-000',NULL,'ONOR NOVO','P-1 SAN JUAN, SAN JOSE, DINAGAT ISLANDS','09502884911','',NULL,NULL,0,NULL,'','1997-07-24',0,0,0,NULL,NULL,'PROBATIONARY','','',0,0,'','1-15','',0,'SUNDAY','182517711005','121281392304','48kg','5\'3','Female',NULL,'Single',0,0,0,0,0,0,0,0,'6',0,'136',0,0,0,0,21.77,'dyviegoodemon@gmail.com','09485640812',1,'Land Bank','Monthly','2034-05-19 16:52:31',0,'',0,0,0,0,0,0,0,0),(67,'67','PACULBA, EMMALEN SALDIVAR','EMMALEN','SALDIVAR','PACULBA','P-2 MAHAYAHAY, SAN JOSE, DINAGAT ISLANDS','11','ACCOUNTING','08-1386096-1','746-301-383-000',NULL,'ERIC MARIO L. PACULBA','P-2 MAHAYAHAY, SAN JOSE, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1977-08-15',0,0,0,NULL,NULL,'REGULAR','','',0,15000,'','1-15','',0,'SUNDAY','180500426665','1211-5743-3370','55kgs','4\'9\"','Female',NULL,'Married',0,0,0,0,0,0,0,0,'3',0,'95',0,0,0,0,21.77,NULL,'09466995940',1,'Land Bank','Monthly','2022-08-24 05:19:23',0,'',0,0,0,0,0,0,0,0),(69,'69','PAREJA., THELMA POLANCOS','THELMA','POLANCOS','PAREJA.','P-4 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','33-5089286-8','760-527-402',NULL,'ROMAN ROSAL POLANCOS','P-4 JACQUEZ, SAN JOSE, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1965-01-26',0,0,0,NULL,NULL,'REGULAR','','',0,13000,'','1-15','',0,'SUNDAY','18-050137337-9','121141486170','64','5\'2','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'15',0,0,0,0,21.77,NULL,'09491652539',1,'Land Bank','Monthly','2022-08-24 05:14:10',0,'',0,0,0,0,0,0,0,0),(70,'70','PASQUIL, REX TEMPLATORA','REX','TEMPLATORA','PASQUIL','P-4 STA. CRUZ, SAN JOSE, DINAGAT ISLANDS','14','Hospitality and Tourism Management','08-2965595-3','714-673-117-000',NULL,'ENCARNACION T. PASQUIL',NULL,NULL,'',NULL,NULL,0,NULL,'','1997-05-29',0,0,0,NULL,NULL,'REGULAR','','',0,12000,'','1-15','',0,'SUNDAY',NULL,'121253453007','75klg','5\'8\'\'','Male',NULL,'Single',0,0,0,0,0,0,0,0,'9',0,'47',0,0,0,0,21.77,NULL,'09079524184',1,'Land Bank','Monthly','2034-05-19 17:00:09',0,'',0,0,0,0,0,0,0,0),(71,'71','RAMIREZ, EVELINDA PARADERO','EVELINDA','PARADERO','RAMIREZ','P-5 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','39','REGISTRAR','08-0938795-3','190-717617','B','EDGAR N. RAMIREZ','P-5 DON RUBEN, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1960-12-25',0,0,0,NULL,NULL,'REGULAR','','',0,18000,'','1-15','',0,'SUNDAY','18-050015991-8','1210-4937-3076','164 kls','5\'2','Female',NULL,'Married',0,0,0,0,0,0,0,0,'4',0,'27',0,0,0,0,21.77,NULL,'09485319888',1,'Land Bank','Monthly','2022-05-13 06:02:09',0,'',0,0,0,0,0,0,0,0),(72,'72','SALARDA, CONIE PIODO','CONIE','PIODO','SALARDA','P-3 MAGSAYSAY, DINAGAT, DINAGAT ISLANDS','14','ADMIN','0111-3518597-0','442-776-480-000','O','MR. DEXTER E. SALARDA',NULL,'09108067942',NULL,NULL,NULL,0,NULL,'','1987-12-13',0,0,0,NULL,NULL,'PROBATIONARY','','',0,9000,'','1-15','',0,'SUNDAY','0302-5480-1379','1211-0245-0762','68kgs','5\'2\"','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'151',0,0,0,0,21.77,NULL,'09096916503',1,'Land Bank','Monthly','2022-08-23 10:30:34',0,'',0,0,0,0,0,0,0,0),(73,'73','SAPID, ANALYN CAPILITAN','ANALYN','CAPILITAN','SAPID','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','39','Basic Education','08-1719383-8','467-874-178',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1983-11-16',0,0,0,NULL,NULL,'REGULAR','','',0,0,'','1-15','',0,'SUNDAY',NULL,'121141247589','43','4\'2','Female',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'8',0,0,0,0,21.77,NULL,'09305562038',1,'Land Bank','Monthly','2034-05-19 17:04:20',0,'',0,0,0,0,0,0,0,0),(74,'74','SAPID, MERNELITA CAPILITAN','MERNELITA','CAPILITAN','SAPID','P-6 DON RUBEN, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','08-2397051-1','467-085-758',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1986-05-27',0,0,0,NULL,NULL,'REGULAR','','',0,12500,'','1-15','',0,'SUNDAY','18-050137341-7','121141247590','43','5\'0','Female',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'6',0,0,0,0,21.77,NULL,'09126898787',1,'Land Bank','Monthly','2034-05-19 17:06:08',0,'',0,0,0,0,0,0,0,0),(75,'75','SAYSON, DELBERT ORTEGA','DELBERT','ORTEGA','SAYSON','P-2 POBLACION SAN JOSE, DINAGAT ISLANDS','16','Basic Education','08-2965531-9','004-388-541','A+','ALBERTO A. SAYSON','P-2 POBLACION, SAN JOSE, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-03-06',0,0,0,NULL,NULL,'REGULAR','','',0,14500,'','1-15','',0,'SUNDAY','18-050184588-2','121253291920','48.9 klg','5\'4','Male',NULL,'Single',0,0,0,0,0,0,0,0,'12',0,'102',0,0,0,0,21.77,NULL,'09501793392',1,'Land Bank','Monthly','2022-08-31 10:05:42',0,'',0,0,0,0,0,0,0,0),(76,'76','SIAREZ, JOEL LARIOSA','JOEL','LARIOSA','SIAREZ','P-5 JUSTINIANA EDERA, SAN JOSE, DINAGAT ISLANDS','10','Criminology','08-2651533-9','755-262-084','O','JOEL G. SIAREZ SR.',NULL,NULL,'',NULL,NULL,0,NULL,'','1991-11-04',0,0,0,NULL,NULL,'REGULAR','','',0,23000,'','1-15','',0,'SUNDAY',NULL,'121166013170','56klg','162cm','Male',NULL,'Single',0,0,0,0,0,0,0,0,'11',0,'19',0,0,0,0,21.77,NULL,'09129588841',1,'Land Bank','Monthly','2034-05-19 17:10:13',0,'',0,0,0,0,0,0,0,0),(78,'78','SILVANO, KIRK JASON ABRATIGUIN','KIRK JASON','ABRATIGUIN','SILVANO','P-3 AURELIO, SAN JOSE, DINAGAT ISLANDS','38','REGISTRAR','08-1657974-1','470-204-458',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1984-03-16',0,0,0,NULL,NULL,'REGULAR','','',0,10000,'','1-15','',0,'SUNDAY',NULL,'121264435691',NULL,NULL,'Male',NULL,'Single',0,0,0,0,0,0,0,0,'4',0,'113',0,0,0,0,21.77,NULL,'09107980168',1,'Land Bank','Monthly','2034-05-19 17:13:51',0,'',0,0,0,0,0,0,0,0),(79,'79','SINAJON, CONCORDIA GANOHAY','CONCORDIA','GANOHAY','SINAJON','P-4 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','19','ADMIN',NULL,'509-227-655-000','O',NULL,NULL,NULL,'',NULL,NULL,0,NULL,'','1959-01-01',0,0,0,NULL,NULL,'REGULAR','','',0,7000,'','1-15','',0,'SUNDAY',NULL,NULL,'48','5\'3','Female',NULL,'Married',0,0,0,0,0,0,0,0,'1',0,'25',0,0,0,0,21.77,NULL,'09484851257',1,'Land Bank','Monthly','2022-05-13 05:47:52',0,'',0,0,0,0,0,0,0,0),(80,'80','TUBAT, ELESON MORATO','ELESON','MORATO','TUBAT','PLARIDEL, LIBJO, DINAGAT ISLANDS','38','REGISTRAR','35-1054964-7','399-547-959-00000',NULL,'GIBSON I TUBAT SR.','PLARIDEL, LIBJO, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-04-05',0,0,0,NULL,NULL,'PROBATIONARY','','',0,8000,'','1-15','',0,'SUNDAY','18-251197024-6','1212-8866-6742','63kgs','5\'6\"','Male',NULL,'Single',0,0,0,0,0,0,0,0,'4',0,'145',0,0,0,0,21.77,NULL,'09510398274',1,'Land Bank','Monthly','2022-07-11 07:15:40',0,'',0,0,0,0,0,0,0,0),(81,'81','URBUDA, ROBERT MARQUEZ','ROBERT','MARQUEZ','URBUDA','P-3 CAYETANO, DINAGAT, DINAGAT ISLANDS','12','Human Resource and Development','08-2651541-0','704-056-863-000','O','CLAIRE ANNE A. URBUDA','P-3 CAYETANO, DINAGAT, DINAGAT ISLANDS','09094140229','',NULL,NULL,0,NULL,'','1994-01-18',0,0,0,NULL,NULL,'REGULAR','','',0,20000,'','1-15','',0,'SUNDAY','180501653142','1211-7224-9627','85','5\'7','Male',NULL,'Married',2,0,0,0,0,0,0,0,'5',0,'17',0,0,0,0,21.77,'roberturbuda18@gmail.com','09553484643',1,'Land Bank','Monthly','2022-06-21 02:50:22',0,'',0,0,0,0,0,0,0,0),(82,'82','VICENTE, JOHN MARK SERAD','JOHN MARK','SERAD','VICENTE','P-6 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','16','Technical Vocational','08-2791020-5','708-947-301','AB+','DOMINADOR G. VICENTE','P-6 JACQUEZ, SAN JOSE, DINAGAT ISLANDS',NULL,'',NULL,NULL,0,NULL,'','1995-10-17',0,0,0,NULL,NULL,'REGULAR','','',0,0,'','1-15','',0,'SUNDAY','08-025271366-0','121210471732','50','5\'4','Male',NULL,'Single',0,0,0,0,0,0,0,0,'13',0,'89',0,0,0,0,21.77,NULL,'0927910205',1,'Land Bank','Monthly','2034-05-19 17:21:32',0,'',0,0,0,0,0,0,0,0),(84,'84','VIRTUDAZO, JOSHUA SALVE','JOSHUA','SALVE','VIRTUDAZO','P-2 JACQUEZ, SAN JOSE, DINAGAT ISLANDS','31','ADMIN','08-2965401-9','732-423-172',NULL,'ANALIZA S. VIRTUDAZO','P-2 JACQUEZ SAN JOSE',NULL,'',NULL,NULL,0,NULL,'','1996-11-23',0,0,0,NULL,NULL,'REGULAR','','',0,15000,'','1-15','',0,'SUNDAY','180501845939','121295525264','72','5\'8\'\'','Male',NULL,'Single',0,0,0,0,0,0,0,0,'1',0,'80',0,0,0,0,21.77,NULL,'09467189554',1,'Land Bank','Monthly','2034-05-19 17:20:01',0,'',0,0,0,0,0,0,0,0),(98,'85','BINGOY, JHEY - AR PAGALAN','JHEY - AR','PAGALAN','BINGOY','P - 4 DON RUBEN SAN JOSE DINAGAT DINAGAT ISLANDS','31','Hospitality and Tourism Management',NULL,'381-362-389-000','O+','CELSO SOQUIB',NULL,NULL,NULL,NULL,NULL,0,NULL,'','1997-07-27',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY','18-251458735-4',NULL,'72','5\'6\"','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9',0,'170',NULL,NULL,NULL,NULL,21.77,'jbingoy@gmail.com','09187402869',1,NULL,'Monthly','2022-08-23 10:35:30',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(99,'86','CACULBA, ROCHELLE LUA','ROCHELLE','LUA','CACULBA','P - 3 EDERA BASILISA DINAGAT DINAGAT ISLANDS','31','Basic Education','08-3009744-5','612-462-803','A','LOLITA L. CACULBA','P - 3 EDERA BASILISA DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1995-10-20',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,10000,'','1-15','',NULL,'SUNDAY','18-025257825-9','121294156788','40','4\'11\"','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'162',NULL,NULL,NULL,NULL,21.77,'rochellecaculba@gmail.com','09354753504',1,NULL,'Monthly','2022-12-11 00:33:37',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(100,'87','BILOCURA, EDSON BORLADO','EDSON','BORLADO','BILOCURA','P - 1 STA. MONICA BASILISA DINAGAT ISLANDS','14','ADMIN','08-3075640-1','612-357-070','AB+','PILARIA B. BILOCURA','P - 1 STA. MONICA BASILISA DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','2000-03-23',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY','18-050192384-0','121304057464','54','5\'2','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'164',NULL,NULL,NULL,NULL,21.77,'ebilocura@ssct.edu.ph','09486734452 09304124423',1,NULL,'Monthly','2022-08-23 10:33:59',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(103,'89','DE LEON, VANESSA ARANOUQUE','VANESSA','ARANOUQUE','DE LEON','P - 3 SERING BASILISA DINAGAT DINAGAT ISLANDS','14','Business Education',NULL,NULL,NULL,'RUBY S. ARANDUQUE','PUROK 3 SERING BASILISA DINAGAT',NULL,NULL,NULL,NULL,0,NULL,'','2000-09-07',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,9000,'','1-15','',NULL,'SUNDAY',NULL,'121302335075','53KG','155','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7',0,'178',NULL,NULL,NULL,NULL,21.77,'deleonvanessa0000@gmail.com','09124662167 09279723630',1,NULL,'Monthly','2022-10-16 05:02:26',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(104,'90','ABULE, RODEL MAMONTAYAO','RODEL','MAMONTAYAO','ABULE','P - 5 MAHAYAHAY SAN JOSE DINAGAT DINAGAT ISLANDS','38','ADMIN','08-3078853-4',NULL,NULL,'RUEL B. ABULE','P - 5 MAHAYAHAY SAN JOSE DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1999-07-02',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY',NULL,NULL,'60KG','104CM','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'172',NULL,NULL,NULL,NULL,21.77,'abulerodel999@gmail.com','09672283214',1,NULL,'Monthly','2022-08-23 10:32:29',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(105,'91','COSCOS, NERILYN AVERGONZADO','NERILYN','AVERGONZADO','COSCOS','P - 5 JUSTINIANA EDERA SAN JOSE DINAGAT ISLANDS','14','Hospitality and Tourism Management','08-3077559-2',NULL,NULL,'DENNIS A. COSCOS','P - 5 JUSTINIANA EDERA SAN JOSE DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-04-29',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY',NULL,NULL,'42','5\'2','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9',0,'168',NULL,NULL,NULL,NULL,21.77,NULL,'09122182103',1,NULL,'Monthly','2022-08-23 11:23:11',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(106,'92','REGO, MARY CAL','MARY','CAL','REGO','P - 3 AURELIO SAN JOSE DINAGAT DINAGAT ISLANDS','14','Hospitality and Tourism Management','08-3077545-3',NULL,NULL,'FEDELECIO N. REGO','P - 3 AURELIO SAN JOSE DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','2000-08-09',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY','180501923832',NULL,'46','5\'3','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9',0,'169',NULL,NULL,NULL,NULL,21.77,NULL,'09122182103',1,NULL,'Monthly','2022-08-23 11:22:14',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(107,'93','LAMPAGO, JOECENETH PRIETO','JOECENETH','PRIETO','LAMPAGO','P - 2 FERDINAND BASILISA DINAGAT DINAGAT ISLANDS','14','Teacher Education',NULL,'608-055-547','O','NONITO V. LAMPAGO','P - 2 FERDINAND BASILISA DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-08-08',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,10000,'','1-15','',NULL,'SUNDAY',NULL,NULL,'62KG','152 CM','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8',0,'171',NULL,NULL,NULL,NULL,21.77,NULL,'09452219170',1,NULL,'Monthly','2022-08-23 10:36:30',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(108,'94','PEDRABLANCA, STEPHANIE JANDAYAN','STEPHANIE','JANDAYAN','PEDRABLANCA','MABINI TUBAJON DINAGAT DINAGAT ISLANDS','16','Basic Education',NULL,'380-411-618-000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1998-03-04',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,10000,'','1-15','',NULL,'SUNDAY','18-251212867',NULL,'47kg','158','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'176',NULL,NULL,NULL,NULL,21.77,'stephaniepedrablanca30@gmail.com','09466502881',1,NULL,'Monthly','2022-08-23 10:38:15',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(109,'96','ALLAGA, JERAMIE ABIS','JERAMIE','ABIS','ALLAGA','P - 2 AURELIO SAN JOSE DINAGAT DINAGAT ISLANDS','31','REGISTRAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1999-01-11',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'54','5\'4','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',0,'180',NULL,NULL,NULL,NULL,21.77,'jeramieallaga@gmail.com','09506974275',1,NULL,'Hourly','2034-08-24 03:18:16',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(111,'97','QUIMBO, ANA MARIE GEMAO','ANA MARIE','GEMAO','QUIMBO','P - 3 LUNA SAN JOSE DINAGAT DINAGAT ISLANDS','14','Teacher Education',NULL,NULL,'O+','MARGIE G. QUIMBO','P - 3 LUNA SAN JOSE DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1999-02-08',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,10000,'','1-15','',NULL,'SUNDAY',NULL,NULL,'42KG','4\'8','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8',0,'163',NULL,NULL,NULL,NULL,21.77,'anamariequimbo695@gmail.com','09125872442',1,NULL,'Monthly','2022-10-16 05:00:36',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(112,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','CHARLIEMAGNE JOYCE','DELA - VEGA','SANCO','P - 4 LLAMERA LIBJO DINAGAT DINAGAT ISLANDS','38','Art and Sciences','0830818158',NULL,'AB+','CARILO C. SANCO','P - 4 LLAMERA LIBJO DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1999-04-02',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY',NULL,NULL,'53KG','5\'4','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10',0,'165',NULL,NULL,NULL,NULL,21.77,NULL,'09197991319',1,NULL,'Monthly','2022-08-23 10:33:37',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(113,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','JESSIE KAREN','CORPORAL','BUSTAMANTE','P - 3 AURELIO SAN JOSE DINAGAT DINAGAT ISLANDS','38','Art and Sciences','08-3078437-6',NULL,NULL,'RELINA C. BUSTAMANTE','P - 3 AURELIO SAN JOSE DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','2000-06-09',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY','18251457717',NULL,'39.5','149','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'010',0,'167',NULL,NULL,NULL,NULL,21.77,'jessiekarencorporalbustamante@gmail.com','09487274392',1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(114,'100','SARSALE, HAROLD FABIAÑA','HAROLD','FABIAÑA','SARSALE','P - 1 SAN JUAN SAN JOSE DINAGAT DINAGAT ISLANDS','16','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1996-05-04',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY','15-05035408-6','121103942586',NULL,NULL,'Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'174',NULL,NULL,NULL,NULL,21.77,'halotweb123@gmail.com','09556046831',1,NULL,'Monthly','2022-10-16 04:59:16',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(115,'101','EDRADAN, BENJIERIX QUILARIO','BENJIERIX','QUILARIO','EDRADAN','P - 1 STA. CRUZ SAN JOSE DINAGAT DINAGAT ISLANDS','31','ADMIN','08-3083005-5',NULL,NULL,'PEONITA Q. EDRADAN','P - 1 STA. CRUZ SAN JOSE DINAGAT DINAGAT ISLANDS','09482456430',NULL,NULL,NULL,0,NULL,'','1999-12-30',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8000,'','1-15','',NULL,'SUNDAY',NULL,NULL,'72','5\'8','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'173',NULL,NULL,NULL,NULL,21.77,'benjierix@gmail.com','0948245630',1,NULL,'Monthly','2022-08-23 10:30:59',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(116,'102','TOMAQUIN, JHON RAY SABUBO','JHON RAY','SABUBO','TOMAQUIN','P - 4 AURELIO SAN JOSE DINAGAT ISLANDS','26','Technical Vocational','08-3083029-1','505-634-695','O','VIRGINIA S. TOMAQUIN','P - 4 AURELIO SAN JOSE DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-06-13',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY','14-250524638-0','922228195042','60','164','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13',0,'177',NULL,NULL,NULL,NULL,21.77,'jhonray.dave13@gmail.com','0946127630',1,NULL,'Monthly','2022-12-11 00:32:21',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(117,'103','CORSADA, JESSA DELA PENA','JESSA','DELA PENA','CORSADA','P -3 BAGUMBAYAN DINAGAT DINAGAT ISLANDS','15','Basic Education',NULL,NULL,NULL,'SALVADOR D. CORSADA','P -3 BAGUMBAYAN DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1999-02-16',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'182',NULL,NULL,NULL,NULL,21.77,'jessacorsada159@gmail.com','09514055041',1,NULL,'Hourly','2022-08-24 07:04:20',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(118,'104','SALAC, CATHERINE LIMPOT','CATHERINE','LIMPOT','SALAC','P - 5 AURELIO SAN JOSE DINAGAT DINAGAT ISLANDS','15','Basic Education',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1997-09-14',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'183',NULL,NULL,NULL,NULL,21.77,'Catherinelimsal.14@gmail.com','09467646893',1,NULL,'Hourly','2034-08-24 03:26:26',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(119,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','CHARLES WILLIAM JONES','SERASPE','COMANDANTE','BRY. TAFT. SURIGAO CITY','16','Basic Education','08-308586-0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','2000-05-21',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'57kg','5\'3','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'181',NULL,NULL,NULL,NULL,21.77,'ccomandante@ssct.edu.ph','09692274730',1,NULL,'Hourly','2022-10-16 03:12:18',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(120,'106','EBANO, ANNALY VERADIO','ANNALY','VERADIO','EBANO','PLARIDEL, LIBJO, DINAGAT ISLANDS','15','Basic Education','0830852567','772-481-500-000','A+','AVELITA V. EBANO','PLARIDEL, LIBJO, DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-04-12',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,'121298791789','46','5\'2','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'184',NULL,NULL,NULL,NULL,21.77,'annebano12@gmail.com','09460683261',1,NULL,'Hourly','2022-08-30 00:23:45',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(122,'107','BLANCO, LOVELY OCAY','LOVELY','OCAY','BLANCO','P - 6 DON RUBEN SAN JOSE DINAGAT DINAGAT ISLANDS','15','Basic Education',NULL,'747-830-130-000','O+','MANUEL F. BLANCO',NULL,NULL,NULL,NULL,NULL,0,NULL,'','1994-10-25',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY','18-201196226-3','1212-4178-5177','50KG','5\'3','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'032',NULL,NULL,NULL,NULL,21.77,'blancolovely25@gmail.com','915879819/09126894545',1,NULL,'Hourly','2022-08-30 00:38:03',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(124,'108','MALBACIAS, LYNEROSE YTING','LYNEROSE','YTING','MALBACIAS','LLAMERA LIBJO DINAGAT DINAGAT ISLANDS','16','Basic Education','34-2550280-5','238831411000','O+','SHERWIN Y. MALBACIAS','PUROK 4 LLAMERA LIBJO DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1990-12-21',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY','030508233155',NULL,'55','5\'1','Female',NULL,'Married',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'175',NULL,NULL,NULL,NULL,21.77,'Lynerosemalbacias@gmail.com','09129808864/9705342653',1,NULL,'Monthly','2022-08-30 00:32:48',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(125,'109','PABLEO, WAYLAND PITOGO','WAYLAND','PITOGO','PABLEO','P - 4 CORTES BASILISA DINAGAT DINAGAT ISLANDS','14','Business Education','09-3077930-7',NULL,NULL,'WENEFREDA P. PABLEO','P - 4 CORTES BASILISA DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','2000-07-14',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,8400,'','1-15','',NULL,'SUNDAY',NULL,NULL,'70','5\'4','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7',0,'166',NULL,NULL,NULL,NULL,21.77,'waylandaladub@gmail.com','09460631789',1,NULL,'Monthly','2022-08-24 17:54:18',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(127,'110','MONATO JR., RAMILO CALIPAY','RAMILO','CALIPAY','MONATO JR.','AURELIO SAN JOSE DINAGAT DINAGAT ISLANDS','31','Basic Education',NULL,'327-955-420',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1987-09-06',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'51','5\'2','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'179',NULL,NULL,NULL,NULL,21.77,'Ramilomonato@gmail.com','09507002755',1,NULL,'Monthly','2022-08-30 00:34:29',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(128,'111','ECLEO, GLENDA BURAY','GLENDA','BURAY','ECLEO','P - 4 MAHAYAHAY SAN JOSE DINAGAT DINAGAT ISLANDS','1','ADMIN','08-1897685-0','113-140-996','A',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1937-05-10',0,0,0,NULL,NULL,'REGULAR','','',NULL,NULL,'','1-15','',NULL,'SUNDAY','400060003706',NULL,'70','5\'4','Female',NULL,'Widow',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,'09178204578',1,NULL,'Hourly','2022-09-29 20:18:45',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(129,'112','TAYPA, RENRICH COMPE','RENRICH','COMPE','TAYPA','PUROK 2 BONIFACIO STREET ROXAS TUBAJON DINAGAT','14','Criminology',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1995-01-14',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11',0,'188',NULL,NULL,NULL,NULL,21.77,NULL,'09466993040',1,NULL,'Hourly','2022-09-13 10:34:23',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(130,'113','DE GUZMAN, ARIEL GRANTOZA','ARIEL','GRANTOZA','DE GUZMAN','PUROK 6 DON RUBEN SAN JOSE DINAGAT DINAGAT ISLANDS','21','ADMIN','33-5784291-8','108-555-662-000','B','MARCIE C. SAPID','PUROK 6 DON RUBEN SAN JOSE DINAGAT DINAGAT ISLANDS','09472930016 09062080449',NULL,NULL,NULL,0,NULL,'','1977-11-09',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY','19-025421326-1',NULL,'5\'7','75KG','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'186',NULL,NULL,NULL,NULL,21.77,NULL,'09472930016 09062080449',1,NULL,'Hourly','2022-09-13 10:34:02',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(131,'114','GONZAGA, MERA AMOR OMBOY','MERA AMOR','OMBOY','GONZAGA','P - 2 R. ECLEO SR. CAGDIANAO DINAGAT ISLANDS','14','Criminology',NULL,'772420750',NULL,'MARTA GONZAGA','P - 2 R. ECLEO SR. CAGDIANAO DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1998-12-07',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY','18-251185329',NULL,'53','158','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11',0,'187',NULL,NULL,NULL,NULL,21.77,NULL,'09093839198',1,NULL,'Hourly','2022-09-13 10:33:38',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(132,'115','DONGON, JEHMIMAH FAITH TIMTIM','JEHMIMAH FAITH','TIMTIM','DONGON','P - 1 POBALCION SAN JSOE DINAGAT ISLANDS','15','Basic Education',NULL,'608-732-512-000','B','VIVIAN T. DONGON','P - 1 POBALCION SAN JSOE DINAGAT ISLANDS','09387207635',NULL,NULL,NULL,0,NULL,'','1986-08-17',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'50','49','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',0,'185',NULL,NULL,NULL,NULL,21.77,NULL,'09387207635',1,NULL,'Hourly','2022-09-13 10:32:50',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(133,'116','BOCOTA, PAUL MARK QUINTAS','PAUL MARK','QUINTAS','BOCOTA','DON RUBEN SAN JOSE DINAGAT ISLANDS','14','ADMIN',NULL,'437-354-576','O','PAUL T. BOCUTA','TAFT NAVARRO SURIGAO CITY',NULL,NULL,NULL,NULL,0,NULL,'','1991-08-17',0,0,0,NULL,NULL,'PART TIME','','',NULL,NULL,'','1-15','',NULL,'SUNDAY','18-000056222-8','1210-9188-7858','98','1.82','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,'191',NULL,NULL,NULL,NULL,21.77,'paulmark.bocota@deped.gov.ph','09208549978',1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(134,'117','BARGASAO, PERCY A.','PERCY','A.','BARGASAO','P - 4 JACQUEZ SAN JOSE DINAGAT ISLANDS','14','ADMIN',NULL,'237-192-474-000',NULL,'MERCIDITA A. BARGASAO',NULL,NULL,NULL,NULL,NULL,0,NULL,'','1983-12-17',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,'164001150769','49','5\'1','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'127',NULL,NULL,NULL,NULL,21.77,'perzab20162@gmail.com','09630548948',1,NULL,'Hourly','2022-09-27 16:40:49',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(135,'118','ACAIN, DEXTER CASIANO','DEXTER','CASIANO','ACAIN','P - 1 POBLACION SAN JOSE DINAGAT ISLANDS','14','ADMIN',NULL,NULL,'A+','LIZA R. CASIANO','P - 1 POBLACION SAN JOSE DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1996-10-05',0,0,0,NULL,NULL,'PART TIME','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'68','1.68','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'190',NULL,NULL,NULL,NULL,21.77,'dexte.acain@gmail.com','09655762173',1,NULL,'Hourly','2022-09-13 10:28:13',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(136,'119','PEREZ, MANOLO MEDINA','MANOLO','MEDINA','PEREZ','P - 1 AURELIO SAN JOSE DINAGAT ISLANDS','14','ADMIN',NULL,NULL,NULL,'DESIREE QUEEN A. PEREZ','P - 1 DON RUBEN SAN JOSE DINAGAT ISLANDS','09079633042',NULL,NULL,NULL,0,NULL,'','1987-05-21',0,0,0,NULL,NULL,'PART TIME','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'85KGS.','5\'11','Male',NULL,'Married',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'93',NULL,NULL,NULL,NULL,21.77,'djorginaperez@gmail.com','09955858442',1,NULL,'Hourly','2022-09-13 10:28:33',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(137,'120','PEREZ, DESIREE QUEEN ARCALA','DESIREE QUEEN','ARCALA','PEREZ','P - 1 DON RUBEN SAN JOSE DINAGAT ISLANDS','14','ADMIN',NULL,NULL,NULL,'MANOLO PEREZ','P - 1 AURELIO SAN JOSE DINAGAT ISLANDS','09955858442',NULL,NULL,NULL,0,NULL,'','2022-01-17',0,0,0,NULL,NULL,'PART TIME','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'65KGS.','5\'6','Female',NULL,'Married',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,NULL,NULL,21.77,'desireequeenperez@gmail.com','09079633042',1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(138,'121','MACABALES JR., GAUDENCIO S.','GAUDENCIO','S.','MACABALES JR.','P - 3 MAHAYAHAY SAN JOSE DINAGAT ISLANDS','14','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1954-11-16',0,0,0,NULL,NULL,'PART TIME','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'193',NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly','2022-09-13 10:28:55',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(139,'122','BORJA, JULIET DURAN','JULIET','DURAN','BORJA','P - 7 MABININ POBLACION SAN JOSE DINAGAT DINAGAT ISLANDS','38','REGISTRAR',NULL,'614-103-944',NULL,'EDILBERTO B. BORJA IV','P - 7 MABININ POBLACION SAN JOSE DINAGAT DINAGAT ISLANDS',NULL,NULL,NULL,NULL,0,NULL,'','1979-01-05',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY','182508688912','1210-1884-9350','50KG','5\'0','Female',NULL,'Married',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',0,'194',NULL,NULL,NULL,NULL,21.77,NULL,'09483126998',1,NULL,'Hourly','2022-12-11 00:37:59',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(140,'123','ANTIPUESTO, MARY LOVELY AVILA','MARY LOVELY','AVILA','ANTIPUESTO','P - 4 CAYETANO DINAGAT DINAGAT ISLANDS','38','ADMIN','349966404-1','777015988',NULL,'TITO J. ANTIPUESTO','P - 4 CAYETANO DINAGAT DINAGAT ISLANDS','09657445884',NULL,NULL,NULL,0,NULL,'','1997-05-17',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY','18-251675158-5','121278460481','41 KG','5\'2','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,'195',NULL,NULL,NULL,NULL,21.77,'antipuestomarylovely458@gmail.com','09668668963',1,NULL,'Hourly','2022-11-17 19:50:38',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(141,'124','ECLEO, KHAY TALAMAYAN','KHAY','TALAMAYAN','ECLEO','P - 1 NARRA ST. SAN JUAN SAN JOSE','1','ADMIN',NULL,NULL,'B+',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1993-06-19',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'5\'5FT','59KLS','Female',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,'09708849738',1,NULL,'Hourly','2022-10-16 13:45:55',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(142,'125','BULABOS, DANILO ','DANILO',NULL,'BULABOS',NULL,'1','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1985-05-17',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(143,'126','GRAVANZA, REY MARK ','REY MARK',NULL,'GRAVANZA',NULL,'1','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1995-06-17',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(144,'127','MAHILUM, IRYLL S.','IRYLL','S.','MAHILUM',NULL,'1','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1991-09-16',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(145,'128','MARZAN, DONNA JANE ','DONNA JANE',NULL,'MARZAN',NULL,'1','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1994-01-26',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(147,'130','VITORILLO, NIEL MARK ','NIEL MARK',NULL,'VITORILLO',NULL,'1','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1987-06-05',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(148,'131','CABOVERDE, JOSEPHLEE ESPINA','JOSEPHLEE','ESPINA','CABOVERDE','PUROK 2 STA. CRUZ SAN JOSE DINAGAT ISLANDS','14','Criminology',NULL,NULL,'O+',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1987-11-12',0,0,0,NULL,NULL,'PART TIME','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'110KLS','5\'6','Male',NULL,'Single',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'011',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(149,'132','PADERO, PAULINO REWAN REIL','PAULINO','REWAN REIL','PADERO','P - 4 MADASIGON ESCOLTA DINAGAT DINAGAT PROVINCE','1','ADMIN',NULL,NULL,'O+','JOANNA LORENE C. FIGUEROA- PAULINO','P - 4 MADASIGON ESCOLTA DINAGAT DINAGAT PROVINCE','09953117120',NULL,NULL,NULL,0,NULL,'','1992-02-07',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,'80KGS','162 CM','Male',NULL,'Married',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(150,'133','ECLEO, JOSLYN ITABLE','JOSLYN','ITABLE','ECLEO','P - 2 DON RUBEN SAN JOSE DINAGAT ISLANDS','14','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1992-12-14',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Female',NULL,'Married',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly','2022-12-08 09:19:33',0,'',1,NULL,NULL,NULL,NULL,0,0,0),(151,'134','DAYO, GENEVIEVE CAROLASDOLASAN','GENEVIEVE','CAROLASDOLASAN','DAYO','P - 7 POBLACION SAN JOSE DINAGAT','1','Art and Sciences',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1964-01-08',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Female',NULL,'Widow',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'010',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0),(152,'135','BAUTISTA, JR., MBA, ELEODORO E.','ELEODORO','E.','BAUTISTA, JR., MBA','BRGY. RIZAL, SURIGAO CITY','1','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','1986-05-25',0,0,0,NULL,NULL,'PROBATIONARY','','',NULL,NULL,'','1-15','',NULL,'SUNDAY',NULL,NULL,NULL,NULL,'Male',NULL,'Married',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'001',0,NULL,NULL,NULL,NULL,NULL,21.77,NULL,NULL,1,NULL,'Hourly',NULL,0,'',1,NULL,NULL,NULL,NULL,0,0,0);

/*Table structure for table `employees_dependent` */

DROP TABLE IF EXISTS `employees_dependent`;

CREATE TABLE `employees_dependent` (
  `SysPK_Empl` varchar(255) DEFAULT NULL,
  `DependentOne` varchar(255) DEFAULT NULL,
  `DependentTwo` varchar(255) DEFAULT NULL,
  `DependentThree` varchar(255) DEFAULT NULL,
  `DependentFour` varchar(255) DEFAULT NULL,
  `BirthDateOne` date DEFAULT NULL,
  `BirthDateTwo` date DEFAULT NULL,
  `BirthDateThree` date DEFAULT NULL,
  `BirthDateFour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employees_dependent` */

/*Table structure for table `employees_rate` */

DROP TABLE IF EXISTS `employees_rate`;

CREATE TABLE `employees_rate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Group_Empl` varchar(255) DEFAULT NULL,
  `Department_Empl` varchar(255) DEFAULT NULL,
  `Position_Empl` varchar(255) DEFAULT NULL,
  `DoleRate_Empl` double DEFAULT NULL,
  `RatePerDay_Empl` double DEFAULT NULL,
  `BasicSalary_Empl` double DEFAULT NULL,
  `Honorarium_Empl` double DEFAULT NULL,
  `Location_Empl` varchar(255) DEFAULT NULL,
  `Position_Code` varchar(100) DEFAULT NULL,
  `isFixedCOLA` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `employees_rate` */

insert  into `employees_rate`(`id`,`Group_Empl`,`Department_Empl`,`Position_Empl`,`DoleRate_Empl`,`RatePerDay_Empl`,`BasicSalary_Empl`,`Honorarium_Empl`,`Location_Empl`,`Position_Code`,`isFixedCOLA`) values (1,'P0001','001','President',0,0,150000,0,'MAIN OFFICE','Admin01',0),(2,'P0001','001','Vice President',0,0,100000,0,'MAIN OFFICE','Admin02',0),(3,'P0001','001','Finance Director',0,0,45000,0,'MAIN OFFICE','Finance',0),(4,'P0001','001','Vice President for Academic Affairs',0,0,25000,0,'MAIN OFFICE','VPAA',0),(5,'P0001','001','Dean of Teacher Education',0,0,25000,0,'MAIN OFFICE','Dean',0),(6,'P0001','001','College Registrar',0,0,21500,0,'MAIN OFFICE','Registrar',0),(7,'P0001','001','Dean of Business Education',0,0,23500,0,'MAIN OFFICE','Dean',0),(8,'P0001','001','Dean of Hospitality and Tourism Management',0,0,21500,0,'MAIN OFFICE','Dean',0),(9,'P0001','001','ICT Program Head',0,0,20000,0,'MAIN OFFICE','Program Head',0),(10,'P0001','001','Criminology Program Head',0,0,20000,0,'MAIN OFFICE','Program Head',0),(11,'P0001','001','Cashier',0,0,15000,0,'MAIN OFFICE','Accounting',0),(12,'P0001','001','Human Resource and Development Officer',0,0,17000,0,'MAIN OFFICE','HRDO',0),(13,'P0001','001','Arts and Sciences Program Head',0,0,25000,0,'MAIN OFFICE','Program Head',0),(14,'P0001','001','College Instructor',0,0,8000,0,'MAIN OFFICE','Instructor 1',0),(15,'P0001','001','JHS Adviser',0,0,10000,0,'MAIN OFFICE','Teacher I',0),(16,'P0001','001','SHS Adviser',0,0,10000,0,'MAIN OFFICE','Teacher II',0),(17,'P0001','001','Disbursing Officer',0,0,17500,0,'MAIN OFFICE','Accounting',0),(18,'P0001','001','Administrative Officer',0,0,17000,0,'MAIN OFFICE','Admin03',0),(19,'P0001','001','Utility & Maintenance',0,0,6000,0,'MAIN OFFICE','Admin',0),(20,'P0001','001','Bookkeeper',0,0,8000,0,'MAIN OFFICE','Accounting',0),(21,'P0001','001','Driver',0,0,8000,0,'MAIN OFFICE','Admin',0),(22,'P0001','001','Production In-Charge',0,0,12000,0,'MAIN OFFICE','Admin',0),(23,'P0001','001','Asst. Manager-Prodn. / Technical\nProduction Manager',0,0,8000,0,'MAIN OFFICE','POS023',0),(24,'P0001','001','Principal',0,0,20000,0,'MAIN OFFICE','Basic Ed.',0),(25,'P0001','001','Basic Education Registrar',0,0,13000,0,'MAIN OFFICE','Basic Ed. Reg.',0),(26,'P0001','001','Tech.Voc Registrar-Designate/ Data Encoder',0,0,8000,0,'MAIN OFFICE','TechVocScholarship',0),(27,'P0001','001','Tech.Voc. Director/Scholarship Focal',0,0,18000,0,'MAIN OFFICE','TechVocScholarship',0),(28,'P0001','001','TES Staff',0,0,8000,0,'MAIN OFFICE','TechVocScholarship',0),(29,'P0001','001','Canteen In-charge',0,0,6000,0,'MAIN OFFICE','Admin',0),(30,'P0001','001','Health Checklist In-Charge/ Information',0,0,8000,0,'MAIN OFFICE','Admin',0),(31,'P0001','001','Office Clerk',0,0,11500,0,'MAIN OFFICE','Basic Ed.',0),(32,'P0001','001','Accountant',0,0,8000,0,'MAIN OFFICE','POS032',0),(33,'P0001','001','Computer Laboratory In-Charge/ Faculty',0,0,8000,0,'MAIN OFFICE','Lab. In-Charge',0),(34,'P0001','001','Design Engineer',0,0,8000,0,'MAIN OFFICE','POS034',0),(35,'P0001','001','HR Admin Supervisor',12,0,123,0,'MAIN OFFICE','POS035',0),(36,'P0001','001','Elementary Adviser',1,0,10000,0,'MAIN OFFICE','Teacher 1',0),(37,'P0001','001','Community Extension Officer',0,0,10000,0,'MAIN OFFICE','CEO',0),(38,'P0001','001','Data Encoder/ Office Staff',0,0,8000,0,'MAIN OFFICE','Registrar',0),(39,'P0001','001','Assistant Registrar',0,0,16500,0,'MAIN OFFICE','Registrar',0);

/*Table structure for table `evaluation_batch` */

DROP TABLE IF EXISTS `evaluation_batch`;

CREATE TABLE `evaluation_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL DEFAULT 0,
  `evaluated_by` int(11) DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `evaluation_batch` */

/*Table structure for table `graduates_list` */

DROP TABLE IF EXISTS `graduates_list`;

CREATE TABLE `graduates_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `recognition_no` varchar(255) DEFAULT NULL,
  `year_graduate` varchar(255) DEFAULT NULL,
  `graduation_date` date DEFAULT NULL,
  `academic_year` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT 1 COMMENT '0-Cancel,1-Active,2-Inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `graduates_list` */

/*Table structure for table `hr_dtr_calendar` */

DROP TABLE IF EXISTS `hr_dtr_calendar`;

CREATE TABLE `hr_dtr_calendar` (
  `datefield` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hr_dtr_calendar` */

insert  into `hr_dtr_calendar`(`datefield`) values ('2023-02-01'),('2023-02-02'),('2023-02-03'),('2023-02-04'),('2023-02-05'),('2023-02-06'),('2023-02-07'),('2023-02-08'),('2023-02-09'),('2023-02-10'),('2023-02-11'),('2023-02-12'),('2023-02-13'),('2023-02-14'),('2023-02-15'),('2023-02-16'),('2023-02-17'),('2023-02-18'),('2023-02-19'),('2023-02-20'),('2023-02-21'),('2023-02-22'),('2023-02-23'),('2023-02-24'),('2023-02-25'),('2023-02-26'),('2023-02-27'),('2023-02-28');

/*Table structure for table `hr_emp_attendance` */

DROP TABLE IF EXISTS `hr_emp_attendance`;

CREATE TABLE `hr_emp_attendance` (
  `SysPK_emp_attendance` decimal(10,0) NOT NULL,
  `attendance_id` int(11) DEFAULT NULL,
  `employee_number` varchar(50) NOT NULL,
  `employee_fullName` varchar(100) DEFAULT NULL,
  `dtr_date` date NOT NULL,
  `in_am` datetime DEFAULT NULL,
  `out_am` datetime DEFAULT NULL,
  `am_note` varchar(200) DEFAULT NULL,
  `in_pm` datetime DEFAULT NULL,
  `out_pm` datetime DEFAULT NULL,
  `pm_note` varchar(200) DEFAULT NULL,
  `late` double DEFAULT 0,
  `undertime` double DEFAULT 0,
  `total_hours_worked` double DEFAULT 8,
  `status` enum('0','1','2') DEFAULT '0' COMMENT '0-active 1-removed 2-normalized',
  `att_remarks` varchar(50) DEFAULT NULL,
  `note_am_in` varchar(100) DEFAULT NULL,
  `note_am_out` varchar(100) DEFAULT NULL,
  `note_pm_in` varchar(100) DEFAULT NULL,
  `note_pm_out` varchar(100) DEFAULT NULL,
  `OB_notes` varchar(100) DEFAULT '',
  `modify_user` varchar(100) DEFAULT NULL,
  `cost_center` int(11) DEFAULT 0,
  `sched_time_in` datetime DEFAULT NULL,
  `sched_time_out` datetime DEFAULT NULL,
  `att_type` varchar(255) DEFAULT 'regular',
  `holiday_type` varchar(255) DEFAULT 'N/A',
  `leave_type` varchar(255) DEFAULT 'N/A',
  `np_hours` double DEFAULT 0,
  `ot_hours` double DEFAULT 0,
  PRIMARY KEY (`employee_number`,`dtr_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hr_emp_attendance` */

insert  into `hr_emp_attendance`(`SysPK_emp_attendance`,`attendance_id`,`employee_number`,`employee_fullName`,`dtr_date`,`in_am`,`out_am`,`am_note`,`in_pm`,`out_pm`,`pm_note`,`late`,`undertime`,`total_hours_worked`,`status`,`att_remarks`,`note_am_in`,`note_am_out`,`note_pm_in`,`note_pm_out`,`OB_notes`,`modify_user`,`cost_center`,`sched_time_in`,`sched_time_out`,`att_type`,`holiday_type`,`leave_type`,`np_hours`,`ot_hours`) values ('1924357461',0,'1','ABING, HACELJEN INCIPIDO','2023-02-01','2023-02-01 07:02:00','2023-02-01 12:04:00','','2023-02-01 12:40:00','2023-02-01 17:17:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('2012798413',0,'1','ABING, HACELJEN INCIPIDO','2023-02-02','2023-02-02 07:52:00','2023-02-02 12:09:00','','2023-02-02 12:19:00','2023-02-02 17:45:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1799318965',0,'1','ABING, HACELJEN INCIPIDO','2023-02-03','2023-02-03 07:38:00','2023-02-03 12:07:00','','2023-02-03 12:17:00','2023-02-03 17:34:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1449927464',0,'1','ABING, HACELJEN INCIPIDO','2023-02-06','2023-02-06 07:54:00','2023-02-06 12:11:00','','2023-02-06 12:21:00','2023-02-06 19:16:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1757008123',0,'1','ABING, HACELJEN INCIPIDO','2023-02-07','2023-02-07 07:42:00','2023-02-07 12:14:00','','2023-02-07 12:24:00','2023-02-07 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1300454549',0,'1','ABING, HACELJEN INCIPIDO','2023-02-08','2023-02-08 07:51:00','2023-02-08 12:18:00','','2023-02-08 12:29:00','2023-02-08 18:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1165498556',0,'1','ABING, HACELJEN INCIPIDO','2023-02-09','2023-02-09 07:38:00','2023-02-09 12:29:57','',NULL,NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('2091923201',0,'1','ABING, HACELJEN INCIPIDO','2023-02-13','2023-02-13 08:06:00','2023-02-13 12:23:00','','2023-02-13 12:33:00','2023-02-13 18:40:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1135307854',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-01','2023-02-01 07:14:00','2023-02-01 12:04:00','','2023-02-01 12:42:00','2023-02-01 17:56:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('293630703',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-02','2023-02-02 07:28:00','2023-02-02 12:01:00','','2023-02-02 12:11:00','2023-02-02 17:50:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('989819319',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-03',NULL,NULL,'','2023-02-03 14:12:10','2023-02-03 17:07:00','',0,0,NULL,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1823222804',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-06','2023-02-06 08:24:00','2023-02-06 12:04:00','','2023-02-06 12:14:00','2023-02-06 17:39:00','',0.4,0,7.6,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('51963443',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-07','2023-02-07 08:47:00','2023-02-07 12:03:00','','2023-02-07 12:13:00','2023-02-07 17:54:00','',0.78333333333333,0,7.22,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('672859354',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-08','2023-02-08 08:13:00','2023-02-08 12:04:00','','2023-02-08 12:14:00','2023-02-08 17:04:00','',0.21666666666667,0,7.78,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('537492080',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-10','2023-02-10 08:23:00','2023-02-10 12:03:00','','2023-02-10 00:00:00','2023-02-10 17:03:00','',0.38333333333333,0,3.62,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('823307942',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-13','2023-02-13 07:26:00','2023-02-13 00:00:00','','2023-02-13 12:50:00','2023-02-13 18:13:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1805799255',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-14','2023-02-14 08:14:00','2023-02-14 12:10:00','','2023-02-14 12:20:00','2023-02-14 18:35:00','',0.23333333333333,0,7.77,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1942466300',0,'10','BANUELOS, KHAREN GRACE MALALIS','2023-02-15','2023-02-15 08:17:00','2023-02-15 00:00:00','','2023-02-15 12:26:00','2023-02-15 17:31:00','',0,0,4,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1190795010',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-01','2023-02-01 07:18:00','2023-02-01 12:04:00','','2023-02-01 12:39:00','2023-02-01 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('515395706',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-02','2023-02-02 07:58:00','2023-02-02 12:08:52','','2023-02-02 12:19:38',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('260034482',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-03','2023-02-03 07:27:00','2023-02-03 12:05:00','','2023-02-03 12:18:00','2023-02-03 17:56:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1303846006',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-06','2023-02-06 08:33:00','2023-02-06 12:00:00','','2023-02-06 12:11:00','2023-02-06 17:21:00','',0.55,0,7.45,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('2056264241',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-07','2023-02-07 10:02:00','2023-02-07 12:00:00','','2023-02-07 12:14:00','2023-02-07 17:05:00','',2.0333333333333,0,5.97,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1562606466',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-08','2023-02-08 08:01:00','2023-02-08 12:28:00','','2023-02-08 13:01:00','2023-02-08 17:30:00','',0.033333333333333,0,7.96,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1880784981',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-09','2023-02-09 07:31:00','2023-02-09 12:19:00','','2023-02-09 12:30:00','2023-02-09 18:28:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('763711224',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-10','2023-02-10 07:49:00','2023-02-10 12:04:00','','2023-02-10 12:18:00','2023-02-10 17:45:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1123280413',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-13','2023-02-13 07:58:00','2023-02-13 12:14:48','','2023-02-13 18:03:03',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1813769053',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-14','2023-02-14 08:02:00','2023-02-14 12:06:00','','2023-02-14 00:00:00','2023-02-14 18:17:00','',0.033333333333333,0,3.97,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('23501893',0,'100','SARSALE, HAROLD FABIAÑA','2023-02-15','2023-02-15 09:11:00','2023-02-15 12:02:00','','2023-02-15 12:36:00','2023-02-15 17:40:00','',1.1833333333333,0,6.82,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1329771813',0,'101','EDRADAN, BENJIERIX QUILARIO','2023-02-13','2023-02-13 07:52:00','2023-02-13 12:00:00','','2023-02-13 12:11:00','2023-02-13 17:06:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('331957676',0,'101','EDRADAN, BENJIERIX QUILARIO','2023-02-14','2023-02-14 07:46:00','2023-02-14 12:00:00','','2023-02-14 12:11:00','2023-02-14 18:31:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1343620608',0,'101','EDRADAN, BENJIERIX QUILARIO','2023-02-15','2023-02-15 08:16:00','2023-02-15 12:02:00','','2023-02-15 12:12:00','2023-02-15 17:20:00','',0.26666666666667,0,7.73,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('129105138',0,'103','CORSADA, JESSA DELA PENA','2023-02-01','2023-02-01 06:23:00','2023-02-01 12:04:00','','2023-02-01 12:34:00','2023-02-01 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('718010810',0,'103','CORSADA, JESSA DELA PENA','2023-02-02','2023-02-02 07:22:00','2023-02-02 12:04:00','','2023-02-02 12:16:00','2023-02-02 17:22:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1702273880',0,'103','CORSADA, JESSA DELA PENA','2023-02-03','2023-02-03 07:40:00','2023-02-03 12:01:00','','2023-02-03 12:11:00','2023-02-03 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1234016074',0,'103','CORSADA, JESSA DELA PENA','2023-02-06','2023-02-06 07:44:00','2023-02-06 12:00:00','','2023-02-06 12:11:00','2023-02-06 17:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1250524916',0,'103','CORSADA, JESSA DELA PENA','2023-02-07','2023-02-07 07:02:00','2023-02-07 12:03:00','','2023-02-07 12:14:00','2023-02-07 17:10:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1200841183',0,'103','CORSADA, JESSA DELA PENA','2023-02-08','2023-02-08 06:45:00','2023-02-08 12:00:14','','2023-02-08 17:09:19',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1603968162',0,'103','CORSADA, JESSA DELA PENA','2023-02-09','2023-02-09 07:03:00','2023-02-09 12:17:00','','2023-02-09 12:28:00','2023-02-09 17:15:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1121915806',0,'103','CORSADA, JESSA DELA PENA','2023-02-10','2023-02-10 07:02:00','2023-02-10 12:01:00','','2023-02-10 12:11:00','2023-02-10 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('314086421',0,'103','CORSADA, JESSA DELA PENA','2023-02-13','2023-02-13 07:20:00','2023-02-13 12:01:34','','2023-02-13 18:03:00',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('282021513',0,'103','CORSADA, JESSA DELA PENA','2023-02-14','2023-02-14 06:31:00','2023-02-14 12:06:00','','2023-02-14 12:16:00','2023-02-14 18:31:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('2014153306',0,'103','CORSADA, JESSA DELA PENA','2023-02-15','2023-02-15 06:42:00','2023-02-15 12:01:00','','2023-02-15 12:12:00','2023-02-15 17:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('973119173',0,'104','SALAC, CATHERINE LIMPOT','2023-02-01','2023-02-01 07:14:00','2023-02-01 12:04:00','','2023-02-01 12:39:00','2023-02-01 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('212512223',0,'104','SALAC, CATHERINE LIMPOT','2023-02-07','2023-02-07 08:05:00','2023-02-07 12:00:00','','2023-02-07 12:12:00','2023-02-07 17:08:00','',0.083333333333333,0,7.92,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('611820893',0,'104','SALAC, CATHERINE LIMPOT','2023-02-08','2023-02-08 08:20:00','2023-02-08 12:00:00','','2023-02-08 12:12:00','2023-02-08 17:13:00','',0.33333333333333,0,7.67,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('653384273',0,'104','SALAC, CATHERINE LIMPOT','2023-02-09','2023-02-09 08:16:00','2023-02-09 12:30:00','','2023-02-09 00:00:00','2023-02-09 18:25:00','',0.26666666666667,0,3.73,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1903600178',0,'104','SALAC, CATHERINE LIMPOT','2023-02-10','2023-02-10 08:33:00','2023-02-10 12:16:00','','2023-02-10 12:27:00','2023-02-10 17:46:00','',0.55,0,7.45,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('128190527',0,'104','SALAC, CATHERINE LIMPOT','2023-02-13','2023-02-13 08:27:00','2023-02-13 12:03:00','','2023-02-13 12:55:00','2023-02-13 18:13:00','',0.45,0,7.55,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1292062303',0,'104','SALAC, CATHERINE LIMPOT','2023-02-14','2023-02-14 08:27:00','2023-02-14 12:06:00','','2023-02-14 12:16:00','2023-02-14 18:52:00','',0.45,0,7.55,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('760970813',0,'104','SALAC, CATHERINE LIMPOT','2023-02-15','2023-02-15 09:38:00','2023-02-15 12:20:00','','2023-02-15 00:00:00','2023-02-15 20:43:00','',3.2666666666667,0,4.74,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('818775305',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-01','2023-02-01 07:11:00','2023-02-01 12:05:00','','2023-02-01 12:39:00','2023-02-01 17:25:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1503202726',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-02','2023-02-02 07:50:00','2023-02-02 12:08:39','','2023-02-02 12:25:19',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('753120523',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-03','2023-02-03 07:40:00','2023-02-03 12:07:28','','2023-02-03 12:52:33',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1828307756',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-06','2023-02-06 07:57:00','2023-02-06 12:01:00','','2023-02-06 12:12:00','2023-02-06 18:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('998192982',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-07','2023-02-07 08:01:00','2023-02-07 12:05:00','','2023-02-07 12:21:00','2023-02-07 17:58:00','',0.016666666666667,0,7.98,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('917303922',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-08','2023-02-08 07:45:00','2023-02-08 12:28:00','','2023-02-08 00:00:00','2023-02-08 19:35:00','',0,0,4,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('226214450',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-09','2023-02-09 07:45:00','2023-02-09 12:16:00','','2023-02-09 00:00:00','2023-02-09 19:39:00','',0,0,4,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('800870186',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-10','2023-02-10 07:18:00','2023-02-10 00:00:00','','2023-02-10 00:00:00','2023-02-10 18:13:00','',0,0,0,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1844001274',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-13','2023-02-13 07:39:00','2023-02-13 12:18:00','','2023-02-13 00:00:00','2023-02-13 18:10:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1035209156',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-14','2023-02-14 07:51:00','2023-02-14 12:15:00','','2023-02-14 12:26:00','2023-02-14 18:49:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1468302399',0,'105','COMANDANTE, CHARLES WILLIAM JONES SERASPE','2023-02-15','2023-02-15 08:13:00','2023-02-15 12:08:00','','2023-02-15 12:20:00','2023-02-15 17:37:00','',0.21666666666667,0,7.78,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1930923797',0,'106','EBANO, ANNALY VERADIO','2023-02-01','2023-02-01 07:15:00','2023-02-01 12:05:00','','2023-02-01 12:36:00','2023-02-01 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1151183952',0,'106','EBANO, ANNALY VERADIO','2023-02-02','2023-02-02 07:32:00','2023-02-02 12:20:00','','2023-02-02 12:31:00','2023-02-02 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1262667757',0,'106','EBANO, ANNALY VERADIO','2023-02-03','2023-02-03 08:34:00','2023-02-03 12:04:00','','2023-02-03 12:15:00','2023-02-03 17:10:00','',0.56666666666667,0,7.43,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1693943014',0,'106','EBANO, ANNALY VERADIO','2023-02-06','2023-02-06 07:36:00','2023-02-06 12:00:00','','2023-02-06 12:10:00','2023-02-06 17:05:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1018792344',0,'106','EBANO, ANNALY VERADIO','2023-02-07','2023-02-07 08:09:00','2023-02-07 12:04:00','','2023-02-07 12:15:00','2023-02-07 17:08:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1223386196',0,'106','EBANO, ANNALY VERADIO','2023-02-08','2023-02-08 08:08:00','2023-02-08 12:00:00','','2023-02-08 12:10:00','2023-02-08 17:47:00','',0.13333333333333,0,7.87,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('643016880',0,'106','EBANO, ANNALY VERADIO','2023-02-09','2023-02-09 06:43:00','2023-02-09 12:17:00','','2023-02-09 12:30:00','2023-02-09 18:14:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('88405967',0,'106','EBANO, ANNALY VERADIO','2023-02-10','2023-02-10 07:29:00','2023-02-10 12:04:00','','2023-02-10 00:00:00','2023-02-10 17:02:00','',0,0,4,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('674152326',0,'106','EBANO, ANNALY VERADIO','2023-02-12','2023-02-12 08:12:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-12 08:00:00','2023-02-12 17:00:00','regular','N/A','N/A',0,0),('431276727',0,'106','EBANO, ANNALY VERADIO','2023-02-13','2023-02-13 07:25:00','2023-02-13 12:03:00','','2023-02-13 12:15:00','2023-02-13 18:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('875206806',0,'106','EBANO, ANNALY VERADIO','2023-02-14','2023-02-14 07:55:00','2023-02-14 12:05:00','','2023-02-14 00:00:00','2023-02-14 18:41:00','',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1594146688',0,'106','EBANO, ANNALY VERADIO','2023-02-15','2023-02-15 07:40:00','2023-02-15 12:01:00','','2023-02-15 12:15:00','2023-02-15 17:48:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('932340941',0,'107','BLANCO, LOVELY OCAY','2023-02-01','2023-02-01 07:15:00','2023-02-01 12:00:00','','2023-02-01 12:27:00','2023-02-01 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('564536432',0,'107','BLANCO, LOVELY OCAY','2023-02-02','2023-02-02 07:44:00','2023-02-02 12:00:00','','2023-02-02 12:51:00','2023-02-02 17:22:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('295237128',0,'107','BLANCO, LOVELY OCAY','2023-02-03','2023-02-03 07:48:00','2023-02-03 12:00:41','',NULL,NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1821917228',0,'107','BLANCO, LOVELY OCAY','2023-02-06','2023-02-06 07:44:00','2023-02-06 12:00:00','','2023-02-06 12:10:00','2023-02-06 17:11:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('149865529',0,'107','BLANCO, LOVELY OCAY','2023-02-07','2023-02-07 07:51:00','2023-02-07 12:04:00','','2023-02-07 12:19:00','2023-02-07 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1341205459',0,'107','BLANCO, LOVELY OCAY','2023-02-08','2023-02-08 07:52:00','2023-02-08 12:03:00','','2023-02-08 12:14:00','2023-02-08 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('570896953',0,'107','BLANCO, LOVELY OCAY','2023-02-09','2023-02-09 07:20:00','2023-02-09 12:18:00','','2023-02-09 12:30:00','2023-02-09 17:24:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1968471564',0,'107','BLANCO, LOVELY OCAY','2023-02-10','2023-02-10 07:51:00','2023-02-10 12:01:00','','2023-02-10 12:11:00','2023-02-10 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2067091451',0,'107','BLANCO, LOVELY OCAY','2023-02-13','2023-02-13 07:28:00','2023-02-13 12:01:00','','2023-02-13 12:48:00','2023-02-13 18:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1194378027',0,'107','BLANCO, LOVELY OCAY','2023-02-14','2023-02-14 07:45:00','2023-02-14 12:00:00','','2023-02-14 12:11:00','2023-02-14 18:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1588839436',0,'107','BLANCO, LOVELY OCAY','2023-02-15','2023-02-15 08:16:00','2023-02-15 12:00:00','','2023-02-15 12:54:00','2023-02-15 17:00:00','',0.26666666666667,0,7.73,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2076845293',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-01','2023-02-01 06:41:00','2023-02-01 12:04:00','','2023-02-01 12:41:00','2023-02-01 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1341212056',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-02','2023-02-02 07:38:00','2023-02-02 12:08:31','','2023-02-02 12:19:22',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('2081792332',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-03','2023-02-03 07:15:00','2023-02-03 12:05:00','','2023-02-03 12:16:00','2023-02-03 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('416788907',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-06',NULL,NULL,'','2023-02-06 12:15:20','2023-02-06 17:00:00','',0,0,4,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('172153795',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-07','2023-02-07 07:13:00','2023-02-07 12:15:00','','2023-02-07 00:00:00','2023-02-07 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('531705998',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-08','2023-02-08 07:20:00','2023-02-08 12:04:00','','2023-02-08 12:14:00','2023-02-08 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1364743500',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-09','2023-02-09 07:04:00','2023-02-09 12:16:00','','2023-02-09 12:28:00','2023-02-09 17:15:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('290417920',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-10','2023-02-10 07:27:00','2023-02-10 12:02:00','','2023-02-10 12:16:00','2023-02-10 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1859040268',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-13','2023-02-13 07:55:00','2023-02-13 00:00:00','','2023-02-13 12:50:00','2023-02-13 18:13:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1421192323',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-14','2023-02-14 07:08:00','2023-02-14 12:10:00','','2023-02-14 12:20:00','2023-02-14 18:51:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1830809066',0,'108','MALBACIAS, LYNEROSE YTING','2023-02-15','2023-02-15 07:16:00','2023-02-15 12:00:00','','2023-02-15 12:11:00','2023-02-15 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1547491569',0,'109','PABLEO, WAYLAND PITOGO','2023-02-01','2023-02-01 08:00:00','2023-02-01 12:09:00','','2023-02-01 12:19:00','2023-02-01 17:34:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('519138152',0,'109','PABLEO, WAYLAND PITOGO','2023-02-02','2023-02-02 08:28:00','2023-02-02 12:36:34','','2023-02-02 12:53:15',NULL,'',0.46666666666667,0,3.53,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('856641231',0,'109','PABLEO, WAYLAND PITOGO','2023-02-03','2023-02-03 07:58:00','2023-02-03 12:00:00','','2023-02-03 12:56:00','2023-02-03 17:18:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('176819540',0,'109','PABLEO, WAYLAND PITOGO','2023-02-05','2023-02-05 09:48:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-05 08:00:00','2023-02-05 17:00:00','regular','N/A','N/A',0,0),('1368166786',0,'109','PABLEO, WAYLAND PITOGO','2023-02-06','2023-02-06 08:00:00','2023-02-06 12:18:02','','2023-02-06 12:37:16',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('7168580',0,'109','PABLEO, WAYLAND PITOGO','2023-02-07','2023-02-07 07:58:00','2023-02-07 12:15:00','','2023-02-07 12:25:00','2023-02-07 19:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1032175120',0,'109','PABLEO, WAYLAND PITOGO','2023-02-08','2023-02-08 08:06:00','2023-02-08 12:11:00','','2023-02-08 12:22:00','2023-02-08 17:18:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1757630246',0,'109','PABLEO, WAYLAND PITOGO','2023-02-09','2023-02-09 08:06:00','2023-02-09 12:09:00','','2023-02-09 12:19:00','2023-02-09 18:33:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('2064462213',0,'109','PABLEO, WAYLAND PITOGO','2023-02-10','2023-02-10 07:59:00','2023-02-10 12:00:00','','2023-02-10 12:12:00','2023-02-10 17:10:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1940931921',0,'109','PABLEO, WAYLAND PITOGO','2023-02-11','2023-02-11 09:14:00','2023-02-11 11:43:29','',NULL,NULL,'',1.2333333333333,0.26666666666667,2.5,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('1898586646',0,'109','PABLEO, WAYLAND PITOGO','2023-02-13','2023-02-13 08:10:00','2023-02-13 12:29:00','','2023-02-13 12:40:00','2023-02-13 17:12:00','',0.16666666666667,0,7.83,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1378331819',0,'109','PABLEO, WAYLAND PITOGO','2023-02-14','2023-02-14 08:05:00','2023-02-14 12:05:00','','2023-02-14 12:44:00','2023-02-14 18:30:00','',0.083333333333333,0,7.92,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1887549620',0,'109','PABLEO, WAYLAND PITOGO','2023-02-15','2023-02-15 08:02:00','2023-02-15 12:19:00','','2023-02-15 12:31:00','2023-02-15 17:02:00','',0.033333333333333,0,7.97,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('50965343',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-01','2023-02-01 07:46:00','2023-02-01 12:00:00','','2023-02-01 00:00:00','2023-02-01 17:02:00','',0,0,4,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1124803619',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-02','2023-02-02 08:00:00','2023-02-02 12:00:00','','2023-02-02 00:00:00','2023-02-02 17:00:00','',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('7463932',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-03','2023-02-03 08:35:00','2023-02-03 12:02:00','','2023-02-03 13:38:00','2023-02-03 17:04:00','',1.2166666666667,0,6.79,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('207239938',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-06','2023-02-06 08:07:00','2023-02-06 12:02:00','','2023-02-06 13:30:00','2023-02-06 17:00:00','',0.61666666666667,0,7.38,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1609017882',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-07','2023-02-07 08:17:00','2023-02-07 12:00:00','','2023-02-07 13:16:00','2023-02-07 17:00:00','',0.55,0,7.45,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('143601308',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-08','2023-02-08 07:58:00','2023-02-08 12:00:00','','2023-02-08 00:00:00','2023-02-08 17:00:00','',0,0,4,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('692192895',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-09','2023-02-09 08:31:00','2023-02-09 12:00:00','','2023-02-09 13:18:00','2023-02-09 17:00:00','',0.81666666666667,0,7.18,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('143557327',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-10','2023-02-10 08:03:00','2023-02-10 12:02:34','','2023-02-10 12:24:24',NULL,'',0.05,0,3.95,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2046235567',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-13','2023-02-13 08:07:00','2023-02-13 12:00:00','','2023-02-13 13:19:00','2023-02-13 17:01:00','',0.43333333333333,0,7.56,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('596171392',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-14','2023-02-14 07:59:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 17:06:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1576713172',0,'11','BELINARIO, KEVIN LERTIDO','2023-02-15','2023-02-15 08:34:00','2023-02-15 12:03:00','','2023-02-15 12:57:00','2023-02-15 17:00:00','',0.56666666666667,0,7.43,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1509171580',0,'112','TAYPA, RENRICH COMPE','2023-02-01','2023-02-01 08:11:00','2023-02-01 12:03:00','','2023-02-01 12:38:00','2023-02-01 19:55:00','',0.18333333333333,0,7.82,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1070161442',0,'112','TAYPA, RENRICH COMPE','2023-02-02','2023-02-02 08:03:00','2023-02-02 12:00:57','','2023-02-02 12:11:25',NULL,'',0.05,0,3.95,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1088237871',0,'112','TAYPA, RENRICH COMPE','2023-02-03','2023-02-03 06:22:00','2023-02-03 12:11:00','','2023-02-03 12:21:00','2023-02-03 20:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1803141702',0,'112','TAYPA, RENRICH COMPE','2023-02-06','2023-02-06 08:33:00','2023-02-06 12:01:01','','2023-02-06 12:11:26',NULL,'',0.55,0,3.45,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('18166130',0,'112','TAYPA, RENRICH COMPE','2023-02-07','2023-02-07 08:24:00','2023-02-07 12:00:44','',NULL,NULL,'',0.4,0,3.6,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1605936485',0,'112','TAYPA, RENRICH COMPE','2023-02-08','2023-02-08 08:15:00','2023-02-08 12:01:00','','2023-02-08 12:13:00','2023-02-08 17:09:00','',0.25,0,7.75,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('605291383',0,'112','TAYPA, RENRICH COMPE','2023-02-09',NULL,'2023-02-09 12:01:19','',NULL,'2023-02-09 17:35:00','',0,0,0,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('156884727',0,'112','TAYPA, RENRICH COMPE','2023-02-10',NULL,NULL,'','2023-02-10 13:01:26','2023-02-10 17:40:00','',0.016666666666667,0,3.98,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('754734541',0,'112','TAYPA, RENRICH COMPE','2023-02-13','2023-02-13 08:15:00','2023-02-13 00:00:00','','2023-02-13 13:01:00','2023-02-13 19:14:00','',0.016666666666667,0,3.98,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1993277528',0,'112','TAYPA, RENRICH COMPE','2023-02-14','2023-02-14 07:53:00','2023-02-14 12:12:00','','2023-02-14 00:00:00','2023-02-14 19:08:00','',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('766799962',0,'112','TAYPA, RENRICH COMPE','2023-02-15',NULL,NULL,'',NULL,'2023-02-15 17:35:00','',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('942919451',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-01','2023-02-01 06:41:00','2023-02-01 12:03:00','','2023-02-01 12:28:00','2023-02-01 17:50:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('500066794',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-02','2023-02-02 05:45:00','2023-02-02 00:00:00','','2023-02-02 00:00:00','2023-02-02 19:55:00','',0,0,0,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('744067638',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-03','2023-02-03 05:09:00','2023-02-03 00:00:00','','2023-02-03 00:00:00','2023-02-03 19:13:00','',0,0,0,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('18487474',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-06','2023-02-06 07:45:00','2023-02-06 12:05:00','','2023-02-06 12:41:00','2023-02-06 17:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('277276604',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-08','2023-02-08 07:20:00','2023-02-08 12:01:00','','2023-02-08 12:39:00','2023-02-08 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1834455969',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-09','2023-02-09 07:02:00','2023-02-09 12:31:00','','2023-02-09 12:51:00','2023-02-09 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('712597997',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-10','2023-02-10 07:05:00','2023-02-10 12:08:00','','2023-02-10 12:31:00','2023-02-10 17:47:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1079997873',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-11','2023-02-11 07:56:00','2023-02-11 00:00:00','','2023-02-11 00:00:00','2023-02-11 16:40:00','',0,0,0,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('894338644',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-14','2023-02-14 06:18:00','2023-02-14 00:00:00','','2023-02-14 12:35:00','2023-02-14 19:16:00','',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('841039005',0,'113','DE GUZMAN, ARIEL GRANTOZA','2023-02-15','2023-02-15 05:17:00','2023-02-15 12:28:00','','2023-02-15 00:00:00','2023-02-15 18:22:00','',0,0,4,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('226672059',0,'115','DONGON, JEHMIMAH FAITH TIMTIM','2023-02-01','2023-02-01 07:15:00','2023-02-01 12:11:00','','2023-02-01 12:40:00','2023-02-01 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1261020652',0,'115','DONGON, JEHMIMAH FAITH TIMTIM','2023-02-07','2023-02-07 07:36:00','2023-02-07 12:03:00','','2023-02-07 12:19:00','2023-02-07 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('510420002',0,'115','DONGON, JEHMIMAH FAITH TIMTIM','2023-02-08','2023-02-08 08:02:00','2023-02-08 12:00:00','','2023-02-08 12:12:00','2023-02-08 17:10:00','',0.033333333333333,0,7.97,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1300915548',0,'115','DONGON, JEHMIMAH FAITH TIMTIM','2023-02-09','2023-02-09 07:53:00','2023-02-09 12:05:00','','2023-02-09 12:15:00','2023-02-09 17:10:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1735128159',0,'115','DONGON, JEHMIMAH FAITH TIMTIM','2023-02-10','2023-02-10 07:49:00','2023-02-10 12:03:00','','2023-02-10 12:18:00','2023-02-10 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1874389066',0,'115','DONGON, JEHMIMAH FAITH TIMTIM','2023-02-13','2023-02-13 07:17:00','2023-02-13 12:02:00','','2023-02-13 12:56:00','2023-02-13 17:35:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('885530091',0,'115','DONGON, JEHMIMAH FAITH TIMTIM','2023-02-14','2023-02-14 07:43:00','2023-02-14 12:00:00','','2023-02-14 12:11:00','2023-02-14 18:22:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('743225662',0,'115','DONGON, JEHMIMAH FAITH TIMTIM','2023-02-15','2023-02-15 07:57:00','2023-02-15 12:00:00','','2023-02-15 12:11:00','2023-02-15 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1437112368',0,'116','BOCOTA, PAUL MARK QUINTAS','2023-09-05',NULL,NULL,'',NULL,'2023-09-05 20:46:00','',0,0,NULL,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('352981604',0,'116','BOCOTA, PAUL MARK QUINTAS','2023-09-06',NULL,NULL,'',NULL,'2023-09-06 20:30:00','',0,0,NULL,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('2065738833',0,'116','BOCOTA, PAUL MARK QUINTAS','2023-09-07',NULL,NULL,'',NULL,'2023-09-07 20:44:00','',0,0,NULL,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1354661394',0,'116','BOCOTA, PAUL MARK QUINTAS','2023-09-08',NULL,NULL,'',NULL,'2023-09-08 20:40:00','',0,0,NULL,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1336204489',0,'116','BOCOTA, PAUL MARK QUINTAS','2023-09-09',NULL,NULL,'',NULL,'2023-09-09 20:59:00','',0,0,NULL,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1274917944',0,'116','BOCOTA, PAUL MARK QUINTAS','2023-09-11',NULL,NULL,'',NULL,'2023-09-11 20:33:00','',0,0,NULL,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('807627856',0,'116','BOCOTA, PAUL MARK QUINTAS','2023-09-12',NULL,NULL,'',NULL,'2023-09-12 20:38:00','',0,0,NULL,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1064886740',0,'116','BOCOTA, PAUL MARK QUINTAS','2023-09-14',NULL,NULL,'',NULL,'2023-09-14 20:35:00','',0,0,NULL,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1562730066',0,'117','BARGASAO, PERCY A.','2023-02-01',NULL,NULL,'','2023-02-01 17:18:13','2023-02-01 19:33:19','',4.3,0,-0.3,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('824795093',0,'117','BARGASAO, PERCY A.','2023-02-03',NULL,NULL,'','2023-02-03 17:20:18','2023-02-03 19:03:45','',4.333333333333333,0,-0.33,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1196411821',0,'117','BARGASAO, PERCY A.','2023-02-06',NULL,NULL,'','2023-02-06 17:14:24','2023-02-06 20:14:04','',4.233333333333333,0,-0.23,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1299548373',0,'117','BARGASAO, PERCY A.','2023-02-08',NULL,NULL,'','2023-02-08 17:07:47','2023-02-08 20:13:16','',4.116666666666666,0,-0.12,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1933264735',0,'117','BARGASAO, PERCY A.','2023-02-10',NULL,NULL,'','2023-02-10 17:10:37','2023-02-10 20:12:54','',4.166666666666667,0,-0.17,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1978814576',0,'117','BARGASAO, PERCY A.','2023-02-11','2023-02-11 09:28:36','2023-02-11 12:22:58','','2023-02-11 12:36:01','2023-02-11 17:09:04','',1.4666666666666668,0,6.529999999999999,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('1307197725',0,'117','BARGASAO, PERCY A.','2023-02-13',NULL,NULL,'','2023-02-13 17:10:46','2023-02-13 20:11:06','',4.166666666666667,0,-0.17,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('640928582',0,'117','BARGASAO, PERCY A.','2023-02-15',NULL,NULL,'','2023-02-15 17:05:27','2023-02-15 20:35:53','',4.083333333333333,0,-0.08,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('719515626',0,'12','BERIñO, DIANE BACOLOD','2023-02-01','2023-02-01 07:30:00','2023-02-01 12:11:00','','2023-02-01 12:30:00','2023-02-01 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1505103927',0,'12','BERIñO, DIANE BACOLOD','2023-02-07','2023-02-07 08:16:00','2023-02-07 12:06:00','','2023-02-07 12:19:00','2023-02-07 17:30:00','',0.26666666666667,0,7.73,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('2143698825',0,'12','BERIñO, DIANE BACOLOD','2023-02-08','2023-02-08 08:27:00','2023-02-08 12:20:02','','2023-02-08 12:30:14',NULL,'',0.45,0,3.55,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1599251194',0,'12','BERIñO, DIANE BACOLOD','2023-02-09','2023-02-09 08:10:00','2023-02-09 12:05:00','','2023-02-09 12:17:00','2023-02-09 17:30:00','',0.16666666666667,0,7.83,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('923258880',0,'12','BERIñO, DIANE BACOLOD','2023-02-10','2023-02-10 08:21:00','2023-02-10 12:06:00','','2023-02-10 12:17:00','2023-02-10 17:25:00','',0.35,0,7.65,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1103804136',0,'12','BERIñO, DIANE BACOLOD','2023-02-11','2023-02-11 07:14:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('1807310210',0,'12','BERIñO, DIANE BACOLOD','2023-02-14','2023-02-14 08:20:00','2023-02-14 00:00:00','','2023-02-14 12:25:00','2023-02-14 18:50:00','',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('295301960',0,'12','BERIñO, DIANE BACOLOD','2023-02-15',NULL,NULL,'','2023-02-15 12:13:27',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('764936719',0,'122','BORJA, JULIET DURAN','2023-02-01','2023-02-01 07:52:00','2023-02-01 12:40:00','','2023-02-01 12:51:00','2023-02-01 17:06:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1218401412',0,'122','BORJA, JULIET DURAN','2023-02-02','2023-02-02 08:03:00','2023-02-02 00:00:00','','2023-02-02 00:00:00','2023-02-02 17:01:00','',0,0,0,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1117439552',0,'122','BORJA, JULIET DURAN','2023-02-06','2023-02-06 08:21:00','2023-02-06 12:38:00','','2023-02-06 12:49:00','2023-02-06 17:00:00','',0.35,0,7.65,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1460712022',0,'122','BORJA, JULIET DURAN','2023-02-07','2023-02-07 08:05:00','2023-02-07 00:00:00','','2023-02-07 00:00:00','2023-02-07 17:01:00','',0,0,0,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('252060155',0,'122','BORJA, JULIET DURAN','2023-02-08','2023-02-08 08:00:00','2023-02-08 12:35:00','','2023-02-08 12:52:00','2023-02-08 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('942159066',0,'122','BORJA, JULIET DURAN','2023-02-09','2023-02-09 07:59:00','2023-02-09 12:30:00','','2023-02-09 12:42:00','2023-02-09 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('639113356',0,'122','BORJA, JULIET DURAN','2023-02-10','2023-02-10 08:01:00','2023-02-10 12:43:00','','2023-02-10 12:56:00','2023-02-10 17:06:00','',0.016666666666667,0,7.98,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1694049145',0,'122','BORJA, JULIET DURAN','2023-02-13','2023-02-13 08:06:00','2023-02-13 12:46:22','','2023-02-13 12:58:03',NULL,'',0.1,0,3.9,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('184899653',0,'122','BORJA, JULIET DURAN','2023-02-14','2023-02-14 07:57:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 17:38:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('44143358',0,'122','BORJA, JULIET DURAN','2023-02-15','2023-02-15 08:18:00','2023-02-15 12:43:25','','2023-02-15 12:53:55',NULL,'',0.3,0,3.7,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('762539702',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-01','2023-02-01 07:54:00','2023-02-01 12:32:00','','2023-02-01 00:00:00','2023-02-01 18:02:00','',0,0,4,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1706686247',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-02','2023-02-02 07:24:00','2023-02-02 12:01:36','','2023-02-02 12:16:22',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('431879356',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-03','2023-02-03 07:43:00','2023-02-03 12:02:00','','2023-02-03 12:29:00','2023-02-03 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1958404852',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-04','2023-02-04 08:35:00','2023-02-04 12:01:00','','2023-02-04 12:28:00','2023-02-04 17:09:00','',0.58333333333333,0,7.42,'0','','','','','','','',0,'2023-02-04 08:00:00','2023-02-04 17:00:00','regular','N/A','N/A',0,0),('1058637567',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-05','2023-02-05 08:22:00','2023-02-05 12:05:00','','2023-02-05 12:19:00','2023-02-05 17:17:00','',0.36666666666667,0,7.63,'0','','','','','','','',0,'2023-02-05 08:00:00','2023-02-05 17:00:00','regular','N/A','N/A',0,0),('2038618880',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-06','2023-02-06 07:40:00','2023-02-06 12:38:00','','2023-02-06 12:50:00','2023-02-06 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('11290206',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-07','2023-02-07 07:50:00','2023-02-07 12:31:00','','2023-02-07 12:43:00','2023-02-07 17:32:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1197404032',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-08','2023-02-08 08:07:00','2023-02-08 12:36:00','','2023-02-08 12:52:00','2023-02-08 17:02:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1677152421',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-09','2023-02-09 07:49:00','2023-02-09 12:34:00','','2023-02-09 00:00:00','2023-02-09 19:32:00','',0,0,4,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('251806077',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-10','2023-02-10 07:55:00','2023-02-10 12:08:00','','2023-02-10 00:00:00','2023-02-10 20:03:00','',0,0,4,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('511151564',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-13','2023-02-13 07:34:00','2023-02-13 12:35:00','','2023-02-13 00:00:00','2023-02-13 22:19:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1781312348',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-14','2023-02-14 07:29:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1648295392',0,'123','ANTIPUESTO, MARY LOVELY AVILA','2023-02-15','2023-02-15 07:54:00','2023-02-15 00:00:00','','2023-02-15 00:00:00','2023-02-15 19:08:00','',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1204184740',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-01','2023-02-01 07:20:00','2023-02-01 12:04:00','','2023-02-01 12:23:00','2023-02-01 17:21:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('920875258',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-02','2023-02-02 07:54:00','2023-02-02 12:09:00','','2023-02-02 12:25:00','2023-02-02 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1427159682',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-03','2023-02-03 07:37:00','2023-02-03 12:09:00','','2023-02-03 12:19:00','2023-02-03 17:23:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('898054676',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-04','2023-02-04 07:04:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-04 08:00:00','2023-02-04 17:00:00','regular','N/A','N/A',0,0),('100038271',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-06','2023-02-06 07:31:00','2023-02-06 12:04:00','','2023-02-06 12:14:00','2023-02-06 17:29:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('805217427',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-07','2023-02-07 07:24:00','2023-02-07 12:08:00','','2023-02-07 12:21:00','2023-02-07 17:30:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('2044520012',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-08','2023-02-08 07:51:00','2023-02-08 12:19:00','','2023-02-08 12:30:00','2023-02-08 17:29:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('211203683',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-09','2023-02-09 07:53:00','2023-02-09 12:01:39','','2023-02-09 13:04:35',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1279227824',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-10','2023-02-10 07:16:00','2023-02-10 12:17:00','','2023-02-10 12:27:00','2023-02-10 17:53:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1649250571',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-11','2023-02-11 07:07:00','2023-02-11 00:00:00','','2023-02-11 00:00:00','2023-02-11 14:00:00','',0,0,0,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('1460482475',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-13','2023-02-13 07:24:00','2023-02-13 12:39:00','','2023-02-13 12:50:00','2023-02-13 17:13:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1409943268',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-14','2023-02-14 07:22:00','2023-02-14 12:14:00','','2023-02-14 12:26:00','2023-02-14 18:49:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1667197588',0,'13','BERNADOS, JUNREY IGONG-IGONG','2023-02-15','2023-02-15 08:09:00','2023-02-15 12:28:00','','2023-02-15 12:39:00','2023-02-15 17:38:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1559360111',0,'14','BERTE, HAZEL RAMOS','2023-02-01','2023-02-01 08:38:00','2023-02-01 12:08:00','',NULL,'2023-02-01 17:19:00','',0,0,7.68,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1341697411',0,'14','BERTE, HAZEL RAMOS','2023-02-02','2023-02-02 09:02:00','2023-02-02 12:01:00','','2023-02-02 00:00:00','2023-02-02 17:00:00','',0,0,6.97,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1115897173',0,'14','BERTE, HAZEL RAMOS','2023-02-03','2023-02-03 08:54:00','2023-02-03 00:00:00','','2023-02-03 00:00:00','2023-02-03 17:35:00','',0,0,0,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1439778651',0,'14','BERTE, HAZEL RAMOS','2023-02-06','2023-02-06 09:13:00','2023-02-06 00:00:00','','2023-02-06 00:00:00','2023-02-06 17:39:00','',0,0,0,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('205814962',0,'14','BERTE, HAZEL RAMOS','2023-02-07','2023-02-07 08:52:00','2023-02-07 00:00:00','','2023-02-07 00:00:00','2023-02-07 17:44:00','',0,0,0,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('475141994',0,'14','BERTE, HAZEL RAMOS','2023-02-08','2023-02-08 08:49:00','2023-02-08 12:08:00','','2023-02-08 00:00:00','2023-02-08 18:44:00','',0.81666666666667,0,3.18,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1342125817',0,'14','BERTE, HAZEL RAMOS','2023-02-09','2023-02-09 09:11:00','2023-02-09 00:00:00','','2023-02-09 00:00:00','2023-02-09 17:39:00','',0,0,0,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('85482071',0,'14','BERTE, HAZEL RAMOS','2023-02-10','2023-02-10 08:55:00','2023-02-10 12:01:00','','2023-02-10 00:00:00','2023-02-10 17:29:00','',0.91666666666667,0,3.08,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1769162736',0,'14','BERTE, HAZEL RAMOS','2023-02-15','2023-02-15 09:00:00','2023-02-15 12:00:00','','2023-02-15 13:00:00','2023-02-15 17:17:00','',0,0,7.279999999999999,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1679304436',0,'15','BLANCO, JASMEN OCAY','2023-02-01','2023-02-01 07:15:00','2023-02-01 12:00:00','','2023-02-01 12:27:00','2023-02-01 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('367620033',0,'15','BLANCO, JASMEN OCAY','2023-02-02','2023-02-02 07:44:00','2023-02-02 12:00:00','','2023-02-02 12:51:00','2023-02-02 17:22:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('613961663',0,'15','BLANCO, JASMEN OCAY','2023-02-03','2023-02-03 07:48:00','2023-02-03 12:00:00','','2023-02-03 12:10:00','2023-02-03 16:46:00','',0,0.21666666666667,7.78,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('2079717195',0,'15','BLANCO, JASMEN OCAY','2023-02-06','2023-02-06 07:43:00','2023-02-06 12:00:00','','2023-02-06 12:10:00','2023-02-06 17:11:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('688306873',0,'15','BLANCO, JASMEN OCAY','2023-02-07','2023-02-07 07:51:00','2023-02-07 12:04:00','','2023-02-07 12:18:00','2023-02-07 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1522419838',0,'15','BLANCO, JASMEN OCAY','2023-02-08','2023-02-08 07:52:00','2023-02-08 12:04:00','','2023-02-08 12:14:00','2023-02-08 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('971708461',0,'15','BLANCO, JASMEN OCAY','2023-02-09','2023-02-09 07:56:00','2023-02-09 12:09:00','','2023-02-09 12:24:00','2023-02-09 17:23:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('928608443',0,'15','BLANCO, JASMEN OCAY','2023-02-10','2023-02-10 07:51:00','2023-02-10 12:00:00','','2023-02-10 12:11:00','2023-02-10 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('598267975',0,'15','BLANCO, JASMEN OCAY','2023-02-13','2023-02-13 07:28:00','2023-02-13 12:01:00','','2023-02-13 12:48:00','2023-02-13 18:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('614305165',0,'15','BLANCO, JASMEN OCAY','2023-02-14','2023-02-14 07:45:00','2023-02-14 12:00:00','','2023-02-14 12:11:00','2023-02-14 18:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1301857090',0,'15','BLANCO, JASMEN OCAY','2023-02-15','2023-02-15 08:16:00','2023-02-15 12:00:00','','2023-02-15 12:54:00','2023-02-15 17:00:00','',0.26666666666667,0,7.73,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1164015731',0,'19','BUSANO, MARYLAND ESNARDO','2023-02-01','2023-02-01 09:06:00','2023-02-01 00:00:00','','2023-02-01 12:53:00','2023-02-01 17:33:00','',0,0,4,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('740378087',0,'19','BUSANO, MARYLAND ESNARDO','2023-02-06','2023-02-06 08:32:00','2023-02-06 12:23:00','','2023-02-06 12:34:00','2023-02-06 17:23:00','',0.53333333333333,0,7.47,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('716700239',0,'19','BUSANO, MARYLAND ESNARDO','2023-02-07',NULL,'2023-02-07 12:02:06','','2023-02-07 12:13:17','2023-02-07 17:25:00','',0,0,4,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1695966593',0,'19','BUSANO, MARYLAND ESNARDO','2023-02-08','2023-02-08 08:40:00','2023-02-08 12:02:00','','2023-02-08 12:13:00','2023-02-08 17:06:00','',0.66666666666667,0,7.33,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1909019152',0,'19','BUSANO, MARYLAND ESNARDO','2023-02-09','2023-02-09 07:34:00','2023-02-09 12:08:00','','2023-02-09 12:18:00','2023-02-09 17:21:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1742731533',0,'19','BUSANO, MARYLAND ESNARDO','2023-02-10','2023-02-10 08:32:00','2023-02-10 00:00:00','','2023-02-10 00:00:00','2023-02-10 17:29:00','',0,0,0,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('232564058',0,'19','BUSANO, MARYLAND ESNARDO','2023-02-13','2023-02-13 07:21:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('461993515',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-01','2023-02-01 07:10:00','2023-02-01 12:05:00','','2023-02-01 12:39:00','2023-02-01 17:17:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1412118882',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-02','2023-02-02 08:04:00','2023-02-02 12:08:00','','2023-02-02 00:00:00','2023-02-02 13:00:00','',0.066666666666667,0,3.93,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('869604178',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-03','2023-02-03 07:33:00','2023-02-03 12:03:00','','2023-02-03 12:59:00','2023-02-03 17:34:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1674765763',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-06','2023-02-06 08:07:00','2023-02-06 12:01:00','','2023-02-06 13:00:00','2023-02-06 17:25:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1219913013',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-07','2023-02-07 08:25:00','2023-02-07 12:03:00','','2023-02-07 12:59:00','2023-02-07 18:46:00','',0.41666666666667,0,7.58,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('52657248',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-09','2023-02-09 08:09:00','2023-02-09 12:29:00','','2023-02-09 12:57:00','2023-02-09 18:26:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('103643695',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-10','2023-02-10 08:10:00','2023-02-10 12:01:00','','2023-02-10 12:59:00','2023-02-10 18:14:00','',0.16666666666667,0,7.83,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1576331996',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-13','2023-02-13 08:06:00','2023-02-13 00:00:00','','2023-02-13 12:28:00','2023-02-13 18:39:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('25678483',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-14','2023-02-14 08:30:00','2023-02-14 12:24:00','','2023-02-14 13:00:00','2023-02-14 21:12:00','',0.5,0,7.5,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1674564387',0,'2','AGOCOY, MONALIZA PESTANO','2023-02-15','2023-02-15 08:31:00','2023-02-15 12:05:00','','2023-02-15 13:02:00','2023-02-15 20:43:00','',0.55,0,7.45,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2058135266',0,'20','CABITANA, BERLYN TABAMO','2023-02-01','2023-02-01 07:19:00','2023-02-01 12:01:00','','2023-02-01 12:29:00','2023-02-01 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('576252517',0,'20','CABITANA, BERLYN TABAMO','2023-02-02','2023-02-02 07:28:00','2023-02-02 12:00:26','','2023-02-02 12:15:13',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1346688906',0,'20','CABITANA, BERLYN TABAMO','2023-02-03','2023-02-03 07:33:00','2023-02-03 12:02:00','','2023-02-03 12:15:00','2023-02-03 17:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('477934629',0,'20','CABITANA, BERLYN TABAMO','2023-02-06','2023-02-06 07:21:00','2023-02-06 12:01:00','','2023-02-06 12:22:00','2023-02-06 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('654731425',0,'20','CABITANA, BERLYN TABAMO','2023-02-07','2023-02-07 07:27:00','2023-02-07 12:00:00','','2023-02-07 12:18:00','2023-02-07 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('531891381',0,'20','CABITANA, BERLYN TABAMO','2023-02-08','2023-02-08 07:13:00','2023-02-08 12:00:00','','2023-02-08 12:21:00','2023-02-08 17:23:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('2102958427',0,'20','CABITANA, BERLYN TABAMO','2023-02-09','2023-02-09 07:19:00','2023-02-09 12:00:00','','2023-02-09 12:15:00','2023-02-09 17:13:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1780374802',0,'20','CABITANA, BERLYN TABAMO','2023-02-10','2023-02-10 07:17:00','2023-02-10 12:00:00','','2023-02-10 12:15:00','2023-02-10 17:18:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('816059892',0,'20','CABITANA, BERLYN TABAMO','2023-02-13','2023-02-13 07:33:00','2023-02-13 12:03:00','','2023-02-13 12:21:00','2023-02-13 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1996871916',0,'20','CABITANA, BERLYN TABAMO','2023-02-14','2023-02-14 06:56:00','2023-02-14 12:00:00','','2023-02-14 12:12:00','2023-02-14 18:37:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1620631952',0,'20','CABITANA, BERLYN TABAMO','2023-02-15','2023-02-15 08:58:00','2023-02-15 12:02:00','','2023-02-15 12:25:15',NULL,'',0.96666666666667,0,3.03,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('215755313',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-01','2023-02-01 07:55:00','2023-02-01 12:08:00','','2023-02-01 12:19:00','2023-02-01 17:39:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('783930245',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-02','2023-02-02 07:51:00','2023-02-02 12:37:00','','2023-02-02 12:53:00','2023-02-02 17:11:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1147500052',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-03','2023-02-03 08:09:00','2023-02-03 12:00:00','','2023-02-03 12:57:00','2023-02-03 17:18:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1035086389',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-06','2023-02-06 07:47:00','2023-02-06 12:17:00','','2023-02-06 12:36:00','2023-02-06 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('505654129',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-07','2023-02-07 07:47:00','2023-02-07 12:13:00','','2023-02-07 12:25:00','2023-02-07 17:06:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1690152910',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-08','2023-02-08 07:50:00','2023-02-08 12:11:00','','2023-02-08 12:22:00','2023-02-08 17:17:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('2046963390',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-09','2023-02-09 07:51:00','2023-02-09 12:09:00','','2023-02-09 12:20:00','2023-02-09 17:12:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1003151187',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-10','2023-02-10 07:52:00','2023-02-10 12:00:00','','2023-02-10 12:12:00','2023-02-10 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1944514212',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-13','2023-02-13 07:49:00','2023-02-13 12:28:00','','2023-02-13 12:39:00','2023-02-13 17:05:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('385452345',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-14','2023-02-14 07:39:00','2023-02-14 12:05:00','','2023-02-14 00:00:00','2023-02-14 18:11:00','',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('2089182272',0,'21','CALLORA., MARRYFOL RETUBES','2023-02-15','2023-02-15 08:12:00','2023-02-15 12:19:00','','2023-02-15 12:31:00','2023-02-15 17:02:00','',0.2,0,7.8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1502736617',0,'22','CANOY, CHERYL UDTUJAN','2023-02-02','2023-02-02 08:20:00','2023-02-02 12:00:00','','2023-02-02 13:00:00','2023-02-02 17:00:00','',0,0,7.67,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1374594831',0,'22','CANOY, CHERYL UDTUJAN','2023-02-06','2023-02-06 08:33:00','2023-02-06 12:24:00','','2023-02-06 12:36:00','2023-02-06 17:39:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('422091491',0,'22','CANOY, CHERYL UDTUJAN','2023-02-07','2023-02-07 09:39:00','2023-02-07 12:05:00','','2023-02-07 12:18:00','2023-02-07 17:30:00','',0,0,6.85,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('255516565',0,'22','CANOY, CHERYL UDTUJAN','2023-02-08','2023-02-08 08:08:00','2023-02-08 12:20:00','','2023-02-08 12:30:00','2023-02-08 17:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1737042103',0,'22','CANOY, CHERYL UDTUJAN','2023-02-09','2023-02-09 08:25:00','2023-02-09 12:05:00','','2023-02-09 12:16:00','2023-02-09 17:40:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1658166171',0,'22','CANOY, CHERYL UDTUJAN','2023-02-10','2023-02-10 07:54:00','2023-02-10 12:00:00','','2023-02-10 12:17:00','2023-02-10 17:25:00','',0,0,8,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1466470677',0,'22','CANOY, CHERYL UDTUJAN','2023-02-13','2023-02-13 08:07:00','2023-02-13 12:01:00','',NULL,NULL,'',0,0,NULL,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1663099394',0,'22','CANOY, CHERYL UDTUJAN','2023-02-14','2023-02-14 08:00:00','2023-02-14 12:15:00','','2023-02-14 12:25:00','2023-02-14 18:50:00','',0,0,8,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('130174838',0,'22','CANOY, CHERYL UDTUJAN','2023-02-15','2023-02-15 08:19:00','2023-02-15 12:00:00','','2023-02-15 12:20:00','2023-02-15 17:34:00','',0,0,8,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('924981274',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-01','2023-02-01 07:12:00','2023-02-01 12:04:00','','2023-02-01 12:42:00','2023-02-01 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('780780648',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-02','2023-02-02 08:14:00','2023-02-02 12:01:00','','2023-02-02 12:11:00','2023-02-02 17:04:00','',0.23333333333333,0,7.77,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1186967755',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-03','2023-02-03 07:39:00','2023-02-03 12:04:00','','2023-02-03 12:15:00','2023-02-03 17:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('2143086144',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-06','2023-02-06 09:45:00','2023-02-06 11:55:43','',NULL,NULL,'',1.75,0.066666666666667,2.18,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('512691498',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-07','2023-02-07 07:40:00','2023-02-07 12:00:00','','2023-02-07 12:12:00','2023-02-07 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1729329901',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-08','2023-02-08 07:25:00','2023-02-08 12:00:00','','2023-02-08 12:12:00','2023-02-08 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('446500829',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-09','2023-02-09 07:21:00','2023-02-09 12:00:00','','2023-02-09 12:10:00','2023-02-09 17:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1357700741',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-10','2023-02-10 07:46:00','2023-02-10 12:02:00','','2023-02-10 12:17:00','2023-02-10 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('288447544',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-14','2023-02-14 07:34:00','2023-02-14 12:10:00','','2023-02-14 12:20:00','2023-02-14 17:16:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('626466791',0,'23','CREENCIA, ANAMAE TIAMZON','2023-02-15','2023-02-15 07:49:00','2023-02-15 12:00:00','','2023-02-15 12:10:00','2023-02-15 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1199261994',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-01','2023-02-01 08:08:00','2023-02-01 12:06:00','','2023-02-01 12:28:00','2023-02-01 17:46:00','',0.13333333333333,0,7.87,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1359422486',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-02','2023-02-02 08:12:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1327424620',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-03','2023-02-03 08:00:00','2023-02-03 12:06:00','','2023-02-03 13:29:00','2023-02-03 18:00:00','',0.48333333333333,0,7.52,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1096568374',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-04','2023-02-04 08:40:00','2023-02-04 00:00:00','','2023-02-04 00:00:00','2023-02-04 18:12:00','',0,0,0,'0','','','','','','','',0,'2023-02-04 08:00:00','2023-02-04 17:00:00','regular','N/A','N/A',0,0),('1616100676',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-05','2023-02-05 09:37:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-05 08:00:00','2023-02-05 17:00:00','regular','N/A','N/A',0,0),('719052093',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-06','2023-02-06 08:31:00','2023-02-06 12:08:00','','2023-02-06 12:18:00','2023-02-06 19:25:00','',0.51666666666667,0,7.48,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1680054553',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-08','2023-02-08 08:23:00','2023-02-08 12:03:00','','2023-02-08 12:16:00','2023-02-08 17:16:00','',0.38333333333333,0,7.62,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('930898445',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-09','2023-02-09 08:25:00','2023-02-09 12:01:00','','2023-02-09 12:12:00','2023-02-09 17:44:00','',0.41666666666667,0,7.58,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1445241824',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-10','2023-02-10 08:30:00','2023-02-10 12:07:00','','2023-02-10 12:55:00','2023-02-10 17:58:00','',0.5,0,7.5,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('516397017',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-11','2023-02-11 09:11:00','2023-02-11 11:52:00','','2023-02-11 13:57:00','2023-02-11 20:54:00','',2.1333333333333,0.11666666666667,5.75,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('619019930',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-12',NULL,NULL,'',NULL,'2023-02-12 19:45:00','',0,0,0,'0','','','','','','','',0,'2023-02-12 08:00:00','2023-02-12 17:00:00','regular','N/A','N/A',0,0),('1040947048',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-13','2023-02-13 08:20:00','2023-02-13 12:15:00','','2023-02-13 13:01:00','2023-02-13 22:19:00','',0.35,0,7.65,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('473330001',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-14','2023-02-14 08:29:00','2023-02-14 12:24:00','','2023-02-14 12:34:00','2023-02-14 18:27:00','',0.48333333333333,0,7.52,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1786501493',0,'25','COSCOS, DENNIS AVERGONZADO','2023-02-15','2023-02-15 09:33:00','2023-02-15 12:00:00','','2023-02-15 12:33:00','2023-02-15 17:54:00','',1.55,0,6.45,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1471769225',0,'26','DE LUIS, DARWIN OMAC','2023-02-01','2023-02-01 07:39:00','2023-02-01 12:00:00','','2023-02-01 12:27:00','2023-02-01 17:57:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1204184452',0,'26','DE LUIS, DARWIN OMAC','2023-02-02','2023-02-02 08:37:00','2023-02-02 12:16:33','','2023-02-02 12:30:49',NULL,'',0.61666666666667,0,3.38,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('928842533',0,'26','DE LUIS, DARWIN OMAC','2023-02-07','2023-02-07 08:16:00','2023-02-07 00:00:00','','2023-02-07 12:54:00','2023-02-07 17:10:00','',0,0,4,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('168219703',0,'26','DE LUIS, DARWIN OMAC','2023-02-08','2023-02-08 08:28:00','2023-02-08 12:04:00','','2023-02-08 12:15:00','2023-02-08 17:13:00','',0.46666666666667,0,7.53,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('420471478',0,'26','DE LUIS, DARWIN OMAC','2023-02-09','2023-02-09 08:23:00','2023-02-09 12:23:00','','2023-02-09 12:34:00','2023-02-09 17:17:00','',0.38333333333333,0,7.62,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1616439097',0,'26','DE LUIS, DARWIN OMAC','2023-02-10','2023-02-10 08:20:00','2023-02-10 12:00:00','','2023-02-10 12:11:00','2023-02-10 17:14:00','',0.33333333333333,0,7.67,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('386868980',0,'26','DE LUIS, DARWIN OMAC','2023-02-11','2023-02-11 07:27:00','2023-02-11 10:10:31','',NULL,NULL,'',0,1.8166666666667,2.18,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('1136954159',0,'26','DE LUIS, DARWIN OMAC','2023-02-13','2023-02-13 07:49:00','2023-02-13 12:14:00','','2023-02-13 00:00:00','2023-02-13 18:20:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1329430878',0,'26','DE LUIS, DARWIN OMAC','2023-02-14','2023-02-14 08:29:00','2023-02-14 12:00:00','','2023-02-14 12:12:00','2023-02-14 18:05:00','',0.48333333333333,0,7.52,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1438155467',0,'26','DE LUIS, DARWIN OMAC','2023-02-15','2023-02-15 08:14:00','2023-02-15 00:00:00','','2023-02-15 13:11:00','2023-02-15 17:26:00','',0.18333333333333,0,3.82,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2037663249',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2023-02-01','2023-02-01 08:38:00','2023-02-01 12:25:00','','2023-02-01 00:00:00','2023-02-01 17:19:00','',0.63333333333333,0,3.37,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('721031091',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2023-02-02','2023-02-02 08:00:00','2023-02-02 12:48:00','','2023-02-02 12:50:00','2023-02-02 17:22:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('353442899',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2023-02-03','2023-02-03 08:00:00','2023-02-03 12:45:00','','2023-02-03 13:00:00','2023-02-03 17:17:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('445424244',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2023-02-06','2023-02-06 08:45:00','2023-02-06 12:00:00','','2023-02-06 12:45:00','2023-02-06 17:00:00','',0,0,7.25,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('676947875',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2023-02-07','2023-02-07 08:25:00','2023-02-07 12:00:00','','2023-02-07 12:40:00','2023-02-07 17:12:00','',0,0,7.779999999999999,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1212763366',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2023-02-10','2023-02-10 08:11:00','2023-02-10 12:00:00','','2023-02-10 12:04:00','2023-02-10 17:16:00','',0,0,8,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('310504385',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2023-02-13','2023-02-13 08:20:00','2023-02-13 12:00:00','','2023-02-13 12:15:00','2023-02-13 17:05:00','',0,0,7.75,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('193453699',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2023-02-14','2023-02-14 09:00:00','2023-02-14 12:34:00','','2023-02-14 12:50:00','2023-02-14 17:00:00','',0,0,7,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('364954545',0,'27','DIVINAGRACIA, BEATRIZ CARREON','2023-02-15','2023-02-15 08:07:00','2023-02-15 12:00:00','','2023-02-15 13:00:00','2023-02-15 17:00:00','',0,0,7.880000000000001,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('56857973',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-01','2023-02-01 06:50:00','2023-02-01 12:17:00','','2023-02-01 12:28:00','2023-02-01 17:29:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('165230350',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-02','2023-02-02 07:07:00','2023-02-02 12:06:00','','2023-02-02 12:17:00','2023-02-02 19:06:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1087547314',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-03','2023-02-03 07:01:00','2023-02-03 12:02:00','','2023-02-03 12:13:00','2023-02-03 19:14:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1288742054',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-06','2023-02-06 07:21:00','2023-02-06 00:00:00','','2023-02-06 00:00:00','2023-02-06 17:03:00','',0,0,0,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('218921706',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-07','2023-02-07 07:54:00','2023-02-07 12:26:00','','2023-02-07 12:40:00','2023-02-07 19:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('287164880',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-09','2023-02-09 07:55:00','2023-02-09 12:35:00','','2023-02-09 12:58:00','2023-02-09 17:33:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('657109525',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-10','2023-02-10 07:52:00','2023-02-10 12:00:00','','2023-02-10 13:03:00','2023-02-10 18:23:00','',0.05,0,7.95,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('757585783',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-13','2023-02-13 07:35:00','2023-02-13 12:02:00','','2023-02-13 12:16:00','2023-02-13 20:39:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('166676184',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-14','2023-02-14 07:33:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 18:36:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1267196368',0,'29','EDRADAN, ARNAN ANTALLAN','2023-02-15','2023-02-15 07:52:00','2023-02-15 12:10:00','','2023-02-15 12:27:00','2023-02-15 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1698007277',0,'3','AMPATIN, RITA Nan','2023-02-01','2023-02-01 07:38:00','2023-02-01 12:29:00','','2023-02-01 00:00:00','2023-02-01 17:01:00','',0,0,4,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1838834962',0,'3','AMPATIN, RITA Nan','2023-02-02','2023-02-02 07:48:00','2023-02-02 12:03:00','','2023-02-02 12:21:00','2023-02-02 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('76976047',0,'3','AMPATIN, RITA Nan','2023-02-03','2023-02-03 07:50:00','2023-02-03 12:07:00','','2023-02-03 12:19:00','2023-02-03 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('746683212',0,'3','AMPATIN, RITA Nan','2023-02-05',NULL,NULL,'','2023-02-05 13:55:30',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-05 08:00:00','2023-02-05 17:00:00','regular','N/A','N/A',0,0),('926468046',0,'3','AMPATIN, RITA Nan','2023-02-06','2023-02-06 07:41:00','2023-02-06 12:11:00','','2023-02-06 12:21:00','2023-02-06 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('2000525146',0,'3','AMPATIN, RITA Nan','2023-02-07','2023-02-07 07:49:00','2023-02-07 12:03:00','','2023-02-07 12:26:00','2023-02-07 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1265176035',0,'3','AMPATIN, RITA Nan','2023-02-08','2023-02-08 07:51:00','2023-02-08 12:09:00','','2023-02-08 12:23:00','2023-02-08 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('16635254',0,'3','AMPATIN, RITA Nan','2023-02-09','2023-02-09 07:44:00','2023-02-09 12:12:00','','2023-02-09 00:00:00','2023-02-09 17:01:00','',0,0,4,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1414493979',0,'3','AMPATIN, RITA Nan','2023-02-10','2023-02-10 07:50:00','2023-02-10 12:35:00','','2023-02-10 12:46:00','2023-02-10 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('982434965',0,'3','AMPATIN, RITA Nan','2023-02-13','2023-02-13 07:49:00','2023-02-13 12:15:57','','2023-02-13 12:27:44',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1227059696',0,'3','AMPATIN, RITA Nan','2023-02-14','2023-02-14 07:48:00','2023-02-14 12:12:00','','2023-02-14 12:25:00','2023-02-14 18:35:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1040190499',0,'3','AMPATIN, RITA Nan','2023-02-15','2023-02-15 07:56:00','2023-02-15 12:00:00','','2023-02-15 00:00:00','2023-02-15 17:00:00','',0,0,4,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1340742968',0,'30','EMPINADO, ETHEL ALEGADO','2023-02-06','2023-02-06 06:36:00','2023-02-06 12:58:00','','2023-02-06 13:13:00','2023-02-06 17:04:00','',0.21666666666667,0,7.78,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1737794311',0,'30','EMPINADO, ETHEL ALEGADO','2023-02-07','2023-02-07 08:09:00','2023-02-07 12:01:00','','2023-02-07 13:19:00','2023-02-07 17:01:00','',0.46666666666667,0,7.53,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('2094685776',0,'30','EMPINADO, ETHEL ALEGADO','2023-02-08','2023-02-08 08:09:00','2023-02-08 12:03:00','','2023-02-08 13:06:00','2023-02-08 17:04:00','',0.25,0,7.75,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('799405155',0,'30','EMPINADO, ETHEL ALEGADO','2023-02-09','2023-02-09 07:53:00','2023-02-09 12:08:00','','2023-02-09 12:34:00','2023-02-09 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1109867546',0,'30','EMPINADO, ETHEL ALEGADO','2023-02-10','2023-02-10 08:03:00','2023-02-10 12:01:00','','2023-02-10 12:55:00','2023-02-10 17:09:00','',0.05,0,7.95,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1417067996',0,'30','EMPINADO, ETHEL ALEGADO','2023-02-13','2023-02-13 07:54:00','2023-02-13 12:00:00','','2023-02-13 12:58:00','2023-02-13 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1626158468',0,'30','EMPINADO, ETHEL ALEGADO','2023-02-14','2023-02-14 06:25:00','2023-02-14 12:32:06','',NULL,NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('302338099',0,'30','EMPINADO, ETHEL ALEGADO','2023-02-15','2023-02-15 08:12:00','2023-02-15 12:04:00','','2023-02-15 12:54:00','2023-02-15 18:16:00','',0.2,0,7.8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1116975177',0,'32','ENSOY, HERMENIA BARNISO','2023-02-01','2023-02-01 08:11:00','2023-02-01 12:03:24','','2023-02-01 12:38:51',NULL,'',0.18333333333333,0,3.82,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('889680310',0,'32','ENSOY, HERMENIA BARNISO','2023-02-02','2023-02-02 08:02:00','2023-02-02 12:02:15','','2023-02-02 12:12:36',NULL,'',0,0,NULL,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('936244801',0,'32','ENSOY, HERMENIA BARNISO','2023-02-03','2023-02-03 08:21:00','2023-02-03 12:11:00','','2023-02-03 12:21:00','2023-02-03 20:00:00','',0.35,0,7.65,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('172115132',0,'32','ENSOY, HERMENIA BARNISO','2023-02-07','2023-02-07 06:11:00','2023-02-07 12:00:00','','2023-02-07 12:11:00','2023-02-07 20:15:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('641085893',0,'32','ENSOY, HERMENIA BARNISO','2023-02-08','2023-02-08 08:15:00','2023-02-08 12:00:00','','2023-02-08 12:14:00','2023-02-08 17:09:00','',0.25,0,7.75,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1424595279',0,'32','ENSOY, HERMENIA BARNISO','2023-02-09','2023-02-09 08:00:00','2023-02-09 12:00:00','','2023-02-09 12:11:00','2023-02-09 17:35:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('528893700',0,'32','ENSOY, HERMENIA BARNISO','2023-02-10','2023-02-10 08:32:00','2023-02-10 12:34:00','','2023-02-10 12:50:00','2023-02-10 18:50:00','',0.53333333333333,0,7.47,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1454902073',0,'32','ENSOY, HERMENIA BARNISO','2023-02-13','2023-02-13 08:15:00','2023-02-13 00:00:00','','2023-02-13 00:00:00','2023-02-13 19:14:00','',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1066937093',0,'32','ENSOY, HERMENIA BARNISO','2023-02-14','2023-02-14 07:50:00','2023-02-14 12:01:00','','2023-02-14 12:12:00','2023-02-14 19:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1948608547',0,'32','ENSOY, HERMENIA BARNISO','2023-02-15','2023-02-15 08:47:00','2023-02-15 00:00:00','','2023-02-15 00:00:00','2023-02-15 17:35:00','',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('560260307',0,'33','ESNARDO, MARICHU MANTE','2023-02-06','2023-02-06 07:18:00','2023-02-06 12:24:00','','2023-02-06 12:44:00','2023-02-06 17:31:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1452117415',0,'33','ESNARDO, MARICHU MANTE','2023-02-07','2023-02-07 07:43:00','2023-02-07 12:17:00','','2023-02-07 12:33:00','2023-02-07 17:30:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('424179422',0,'33','ESNARDO, MARICHU MANTE','2023-02-08','2023-02-08 07:35:00','2023-02-08 12:27:00','','2023-02-08 12:42:00','2023-02-08 17:32:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('255563569',0,'33','ESNARDO, MARICHU MANTE','2023-02-09','2023-02-09 07:40:00','2023-02-09 12:33:00','','2023-02-09 12:48:00','2023-02-09 17:28:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1566564872',0,'33','ESNARDO, MARICHU MANTE','2023-02-10','2023-02-10 07:44:00','2023-02-10 12:01:00','','2023-02-10 12:13:00','2023-02-10 18:47:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2020612690',0,'33','ESNARDO, MARICHU MANTE','2023-02-11','2023-02-11 08:31:00','2023-02-11 00:00:00','','2023-02-11 00:00:00','2023-02-11 17:27:00','',0,0,0,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('267458707',0,'33','ESNARDO, MARICHU MANTE','2023-02-12',NULL,'2023-02-12 07:59:06','',NULL,'2023-02-12 18:03:00','',0,0,0,'0','','','','','','','',0,'2023-02-12 08:00:00','2023-02-12 17:00:00','regular','N/A','N/A',0,0),('1885859239',0,'33','ESNARDO, MARICHU MANTE','2023-02-13','2023-02-13 07:51:00','2023-02-13 12:00:53','','2023-02-13 12:36:03',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('718241514',0,'33','ESNARDO, MARICHU MANTE','2023-02-14','2023-02-14 08:28:00','2023-02-14 12:40:00','','2023-02-14 12:56:00','2023-02-14 18:56:00','',0.46666666666667,0,7.53,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1364340840',0,'33','ESNARDO, MARICHU MANTE','2023-02-15','2023-02-15 08:13:00','2023-02-15 12:23:00','','2023-02-15 12:41:00','2023-02-15 17:44:00','',0.21666666666667,0,7.78,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('162322285',0,'34','ESNARDO, RAYMART MANTE','2023-02-01','2023-02-01 07:54:00','2023-02-01 12:01:00','','2023-02-01 12:14:00','2023-02-01 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1809077659',0,'34','ESNARDO, RAYMART MANTE','2023-02-02','2023-02-02 08:06:00','2023-02-02 12:00:00','','2023-02-02 12:11:00','2023-02-02 17:04:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('363069214',0,'34','ESNARDO, RAYMART MANTE','2023-02-03','2023-02-03 07:41:00','2023-02-03 12:04:00','','2023-02-03 12:15:00','2023-02-03 17:14:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1390969212',0,'34','ESNARDO, RAYMART MANTE','2023-02-06','2023-02-06 07:47:00','2023-02-06 12:30:00','','2023-02-06 12:41:00','2023-02-06 17:32:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1583478944',0,'34','ESNARDO, RAYMART MANTE','2023-02-07','2023-02-07 08:24:00','2023-02-07 12:06:00','','2023-02-07 13:08:00','2023-02-07 17:17:00','',0.53333333333333,0,7.47,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('139395193',0,'34','ESNARDO, RAYMART MANTE','2023-02-08','2023-02-08 08:06:00','2023-02-08 12:02:00','','2023-02-08 12:31:00','2023-02-08 17:32:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1501968796',0,'34','ESNARDO, RAYMART MANTE','2023-02-09','2023-02-09 08:05:00','2023-02-09 12:18:00','','2023-02-09 12:34:00','2023-02-09 17:20:00','',0.083333333333333,0,7.92,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('811755180',0,'34','ESNARDO, RAYMART MANTE','2023-02-10','2023-02-10 07:50:00','2023-02-10 12:07:00','','2023-02-10 12:17:00','2023-02-10 17:40:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1485202129',0,'34','ESNARDO, RAYMART MANTE','2023-02-13','2023-02-13 07:59:00','2023-02-13 12:03:00','','2023-02-13 12:15:00','2023-02-13 20:20:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('214298587',0,'34','ESNARDO, RAYMART MANTE','2023-02-14','2023-02-14 08:39:00','2023-02-14 12:50:00','','2023-02-14 14:21:00','2023-02-14 20:07:00','',2,0,6,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('314771105',0,'34','ESNARDO, RAYMART MANTE','2023-02-15','2023-02-15 08:22:00','2023-02-15 12:29:00','','2023-02-15 13:07:00','2023-02-15 17:41:00','',0.48333333333333,0,7.51,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('119213986',0,'35','FERNAN, ALEX RELACION','2023-02-01','2023-02-01 07:44:00','2023-02-01 12:00:00','','2023-02-01 12:43:00','2023-02-01 17:21:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('134400501',0,'35','FERNAN, ALEX RELACION','2023-02-02','2023-02-02 07:53:00','2023-02-02 12:08:00','','2023-02-02 12:28:00','2023-02-02 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1543572733',0,'35','FERNAN, ALEX RELACION','2023-02-03','2023-02-03 08:18:00','2023-02-03 00:00:00','','2023-02-03 12:56:00','2023-02-03 17:04:00','',0,0,4,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('773873500',0,'35','FERNAN, ALEX RELACION','2023-02-07','2023-02-07 08:14:00','2023-02-07 12:12:00','','2023-02-07 12:28:00','2023-02-07 17:06:00','',0.23333333333333,0,7.77,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1433575868',0,'35','FERNAN, ALEX RELACION','2023-02-08','2023-02-08 07:24:00','2023-02-08 12:09:00','','2023-02-08 00:00:00','2023-02-08 17:02:00','',0,0,4,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('75092890',0,'35','FERNAN, ALEX RELACION','2023-02-09','2023-02-09 07:40:00','2023-02-09 12:08:00','','2023-02-09 12:23:00','2023-02-09 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1430863766',0,'35','FERNAN, ALEX RELACION','2023-02-10','2023-02-10 08:12:00','2023-02-10 12:02:00','','2023-02-10 12:57:00','2023-02-10 17:29:00','',0.2,0,7.8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('808791171',0,'35','FERNAN, ALEX RELACION','2023-02-13','2023-02-13 07:51:00','2023-02-13 12:16:00','','2023-02-13 12:33:00','2023-02-13 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('448720751',0,'35','FERNAN, ALEX RELACION','2023-02-14','2023-02-14 08:12:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('654720805',0,'35','FERNAN, ALEX RELACION','2023-02-15','2023-02-15 08:47:00','2023-02-15 12:10:00','','2023-02-15 12:29:00','2023-02-15 18:33:00','',0.78333333333333,0,7.22,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2054748115',0,'39','GISMAN, CAREN BUAL','2023-02-01','2023-02-01 07:50:00','2023-02-01 00:00:00','','2023-02-01 00:00:00','2023-02-01 17:15:00','',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1972626738',0,'39','GISMAN, CAREN BUAL','2023-02-02','2023-02-02 07:47:00','2023-02-02 00:00:00','','2023-02-02 00:00:00','2023-02-02 17:05:00','',0,0,0,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1223039376',0,'39','GISMAN, CAREN BUAL','2023-02-03','2023-02-03 08:24:00','2023-02-03 00:00:00','','2023-02-03 00:00:00','2023-02-03 17:25:00','',0,0,0,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1870625764',0,'39','GISMAN, CAREN BUAL','2023-02-07','2023-02-07 07:45:00','2023-02-07 12:11:00','','2023-02-07 12:38:00','2023-02-07 17:37:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1418903916',0,'39','GISMAN, CAREN BUAL','2023-02-08','2023-02-08 07:53:00','2023-02-08 12:08:00','','2023-02-08 12:24:00','2023-02-08 17:46:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('9284942',0,'39','GISMAN, CAREN BUAL','2023-02-09','2023-02-09 08:39:00','2023-02-09 00:00:00','','2023-02-09 00:00:00','2023-02-09 17:08:00','',0,0,0,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('869108947',0,'39','GISMAN, CAREN BUAL','2023-02-10','2023-02-10 07:57:00','2023-02-10 00:00:00','','2023-02-10 00:00:00','2023-02-10 17:31:00','',0,0,0,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1491302784',0,'39','GISMAN, CAREN BUAL','2023-02-13','2023-02-13 07:59:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('133288273',0,'39','GISMAN, CAREN BUAL','2023-02-14',NULL,NULL,'','2023-02-14 12:01:41',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('452476948',0,'39','GISMAN, CAREN BUAL','2023-02-15','2023-02-15 08:35:00','2023-02-15 12:09:00','','2023-02-15 12:41:00','2023-02-15 17:19:00','',0,0,7.73,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1428109314',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-01','2023-02-01 07:50:00','2023-02-01 12:34:00','','2023-02-01 12:47:00','2023-02-01 17:20:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('811155220',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-02','2023-02-02 07:49:00','2023-02-02 12:32:00','','2023-02-02 12:42:00','2023-02-02 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('341134417',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-03','2023-02-03 07:43:00','2023-02-03 12:22:00','','2023-02-03 12:42:00','2023-02-03 17:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1522681155',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-04',NULL,'2023-02-04 10:16:29','','2023-02-04 13:06:59',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-04 08:00:00','2023-02-04 17:00:00','regular','N/A','N/A',0,0),('1815762174',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-06','2023-02-06 07:26:00','2023-02-06 12:23:00','','2023-02-06 12:38:00','2023-02-06 17:31:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('545824527',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-07','2023-02-07 08:06:00','2023-02-07 12:07:00','','2023-02-07 12:20:00','2023-02-07 17:24:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1286452304',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-08','2023-02-08 08:01:00','2023-02-08 12:08:00','','2023-02-08 12:18:00','2023-02-08 17:44:00','',0.016666666666667,0,7.98,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('40601656',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-09','2023-02-09 08:07:00','2023-02-09 12:06:00','','2023-02-09 12:37:00','2023-02-09 17:13:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1545999035',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-10','2023-02-10 07:57:00','2023-02-10 12:28:00','','2023-02-10 12:38:00','2023-02-10 17:15:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1363501306',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-11',NULL,'2023-02-11 07:01:09','',NULL,'2023-02-11 17:27:00','',0,0,0,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('347768651',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-13','2023-02-13 08:00:00','2023-02-13 12:21:00','','2023-02-13 12:31:00','2023-02-13 17:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1822043863',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-14','2023-02-14 07:51:00','2023-02-14 12:33:00','','2023-02-14 00:00:00','2023-02-14 19:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('230599185',0,'40','GRAVANZA, ADELAIDA RAFAEL','2023-02-15','2023-02-15 08:20:00','2023-02-15 12:49:00','','2023-02-15 13:00:00','2023-02-15 17:55:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('371637057',0,'41','INSON, MERIAM DAGCUTAN','2023-02-01','2023-02-01 06:31:00','2023-02-01 12:09:00','','2023-02-01 12:41:00','2023-02-01 17:57:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1824156030',0,'41','INSON, MERIAM DAGCUTAN','2023-02-02','2023-02-02 07:47:00','2023-02-02 12:10:00','','2023-02-02 12:22:00','2023-02-02 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('745454875',0,'41','INSON, MERIAM DAGCUTAN','2023-02-08','2023-02-08 08:44:00','2023-02-08 12:00:00','','2023-02-08 12:10:00','2023-02-08 18:22:00','',0.73333333333333,0,7.27,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('81148179',0,'41','INSON, MERIAM DAGCUTAN','2023-02-09','2023-02-09 08:13:00','2023-02-09 12:05:00','','2023-02-09 12:15:00','2023-02-09 17:12:00','',0.21666666666667,0,7.78,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1598604021',0,'41','INSON, MERIAM DAGCUTAN','2023-02-10','2023-02-10 08:11:00','2023-02-10 12:03:00','','2023-02-10 12:18:00','2023-02-10 17:22:00','',0.18333333333333,0,7.82,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2130723271',0,'41','INSON, MERIAM DAGCUTAN','2023-02-13','2023-02-13 08:33:00','2023-02-13 12:02:00','','2023-02-13 13:23:00','2023-02-13 18:55:00','',0.93333333333333,0,7.07,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1720251011',0,'41','INSON, MERIAM DAGCUTAN','2023-02-14','2023-02-14 09:00:00','2023-02-14 12:00:00','','2023-02-14 12:10:00','2023-02-14 18:54:00','',1,0,7,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('937933284',0,'41','INSON, MERIAM DAGCUTAN','2023-02-15','2023-02-15 08:38:00','2023-02-15 12:00:00','','2023-02-15 12:11:00','2023-02-15 18:09:00','',0.63333333333333,0,7.37,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2124861282',0,'43','LAID, JHESORLEY MAGANA','2023-02-01','2023-02-01 08:40:00','2023-02-01 12:05:00','','2023-02-01 12:28:00','2023-02-01 17:46:00','',0.66666666666667,0,7.33,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('402614446',0,'43','LAID, JHESORLEY MAGANA','2023-02-02','2023-02-02 09:12:00','2023-02-02 12:06:00','','2023-02-02 12:58:00','2023-02-02 17:25:00','',1.2,0,6.8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1415598358',0,'43','LAID, JHESORLEY MAGANA','2023-02-03','2023-02-03 08:41:00','2023-02-03 12:05:38','',NULL,NULL,'',0.68333333333333,0,3.32,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1055831439',0,'43','LAID, JHESORLEY MAGANA','2023-02-04','2023-02-04 08:19:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-04 08:00:00','2023-02-04 17:00:00','regular','N/A','N/A',0,0),('66681620',0,'43','LAID, JHESORLEY MAGANA','2023-02-06','2023-02-06 08:06:00','2023-02-06 12:08:00','','2023-02-06 12:18:00','2023-02-06 17:27:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('887163252',0,'43','LAID, JHESORLEY MAGANA','2023-02-09','2023-02-09 08:20:00','2023-02-09 12:08:00','','2023-02-09 12:35:00','2023-02-09 18:54:00','',0.33333333333333,0,7.67,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1175259189',0,'43','LAID, JHESORLEY MAGANA','2023-02-10','2023-02-10 08:44:00','2023-02-10 12:07:50','',NULL,NULL,'',0.73333333333333,0,3.27,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1704012006',0,'43','LAID, JHESORLEY MAGANA','2023-02-11','2023-02-11 09:06:00','2023-02-11 00:00:00','','2023-02-11 00:00:00','2023-02-11 18:08:00','',0,0,0,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('1760705438',0,'43','LAID, JHESORLEY MAGANA','2023-02-12','2023-02-12 08:53:00','2023-02-12 00:00:00','','2023-02-12 00:00:00','2023-02-12 18:03:00','',0,0,0,'0','','','','','','','',0,'2023-02-12 08:00:00','2023-02-12 17:00:00','regular','N/A','N/A',0,0),('465671443',0,'43','LAID, JHESORLEY MAGANA','2023-02-13','2023-02-13 09:16:00','2023-02-13 12:21:08','','2023-02-13 12:50:40',NULL,'',1.2666666666667,0,2.73,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1172974927',0,'43','LAID, JHESORLEY MAGANA','2023-02-14','2023-02-14 09:06:00','2023-02-14 12:06:00','','2023-02-14 13:07:00','2023-02-14 18:14:00','',1.2166666666667,0,6.78,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('667101195',0,'44','LASTIMOSO, DINO ROSALES','2023-02-01',NULL,'2023-02-01 12:05:49','','2023-02-01 12:41:50',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1816619398',0,'44','LASTIMOSO, DINO ROSALES','2023-02-07',NULL,'2023-02-07 12:04:17','','2023-02-07 13:10:35',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1516282742',0,'44','LASTIMOSO, DINO ROSALES','2023-02-08','2023-02-08 08:34:00','2023-02-08 12:07:00','','2023-02-08 00:00:00','2023-02-08 17:10:00','',0.56666666666667,0,3.43,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('393135050',0,'44','LASTIMOSO, DINO ROSALES','2023-02-09','2023-02-09 07:58:00','2023-02-09 12:23:00','','2023-02-09 12:35:00','2023-02-09 17:29:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1143247267',0,'44','LASTIMOSO, DINO ROSALES','2023-02-10','2023-02-10 08:24:00','2023-02-10 12:09:43','','2023-02-10 12:20:22',NULL,'',0.4,0,3.6,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('53048937',0,'44','LASTIMOSO, DINO ROSALES','2023-02-13','2023-02-13 08:14:00','2023-02-13 12:37:00','','2023-02-13 13:08:00','2023-02-13 18:09:00','',0.36666666666667,0,7.64,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1682218749',0,'44','LASTIMOSO, DINO ROSALES','2023-02-14','2023-02-14 08:04:00','2023-02-14 12:03:01','','2023-02-14 12:13:59',NULL,'',0.066666666666667,0,3.93,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('902758077',0,'44','LASTIMOSO, DINO ROSALES','2023-02-15','2023-02-15 08:50:00','2023-02-15 00:00:00','','2023-02-15 00:00:00','2023-02-15 17:21:00','',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1363753735',0,'45','LAPINID, MARIBEL SOLANO','2023-02-01','2023-02-01 07:06:00','2023-02-01 12:01:00','','2023-02-01 12:33:00','2023-02-01 17:15:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('245820441',0,'45','LAPINID, MARIBEL SOLANO','2023-02-02','2023-02-02 07:37:00','2023-02-02 12:02:00','','2023-02-02 12:14:00','2023-02-02 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1693312519',0,'45','LAPINID, MARIBEL SOLANO','2023-02-03','2023-02-03 08:10:00','2023-02-03 12:03:00','','2023-02-03 12:17:00','2023-02-03 17:05:00','',0.16666666666667,0,7.83,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('789504655',0,'45','LAPINID, MARIBEL SOLANO','2023-02-06','2023-02-06 07:58:00','2023-02-06 12:11:00','','2023-02-06 12:25:00','2023-02-06 17:26:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1157080083',0,'45','LAPINID, MARIBEL SOLANO','2023-02-07','2023-02-07 08:14:00','2023-02-07 12:06:00','','2023-02-07 12:20:00','2023-02-07 17:14:00','',0.23333333333333,0,7.77,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('526634700',0,'45','LAPINID, MARIBEL SOLANO','2023-02-08','2023-02-08 08:28:00','2023-02-08 12:07:00','','2023-02-08 12:27:00','2023-02-08 17:30:00','',0.46666666666667,0,7.53,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('2052188438',0,'45','LAPINID, MARIBEL SOLANO','2023-02-09','2023-02-09 08:23:00','2023-02-09 12:08:00','','2023-02-09 12:26:00','2023-02-09 17:26:00','',0.38333333333333,0,7.62,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1014219192',0,'45','LAPINID, MARIBEL SOLANO','2023-02-10','2023-02-10 08:21:00','2023-02-10 12:02:00','','2023-02-10 12:19:00','2023-02-10 17:56:00','',0.35,0,7.65,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('938222272',0,'45','LAPINID, MARIBEL SOLANO','2023-02-13','2023-02-13 07:56:00','2023-02-13 12:51:00','','2023-02-13 13:01:00','2023-02-13 20:24:00','',0.016666666666667,0,7.98,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('2093394383',0,'45','LAPINID, MARIBEL SOLANO','2023-02-14','2023-02-14 07:36:00','2023-02-14 12:14:00','','2023-02-14 12:27:00','2023-02-14 18:31:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('771703920',0,'45','LAPINID, MARIBEL SOLANO','2023-02-15','2023-02-15 08:08:00','2023-02-15 12:04:00','','2023-02-15 12:16:00','2023-02-15 17:22:00','',0.13333333333333,0,7.87,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('479028857',0,'46','LECCIONES, DONALD GONZAGA','2023-02-01','2023-02-01 06:54:00','2023-02-01 12:06:00','','2023-02-01 12:32:00','2023-02-01 17:20:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('876096502',0,'46','LECCIONES, DONALD GONZAGA','2023-02-02','2023-02-02 05:38:00','2023-02-02 00:00:00','','2023-02-02 13:15:00','2023-02-02 17:17:00','',0.25,0,3.75,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('641952392',0,'46','LECCIONES, DONALD GONZAGA','2023-02-03','2023-02-03 07:42:00','2023-02-03 12:05:00','','2023-02-03 12:16:00','2023-02-03 17:10:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1108902892',0,'46','LECCIONES, DONALD GONZAGA','2023-02-04','2023-02-04 08:08:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-04 08:00:00','2023-02-04 17:00:00','regular','N/A','N/A',0,0),('1462198989',0,'46','LECCIONES, DONALD GONZAGA','2023-02-10','2023-02-10 07:54:00','2023-02-10 12:01:00','','2023-02-10 12:19:00','2023-02-10 18:12:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('908751117',0,'46','LECCIONES, DONALD GONZAGA','2023-02-13','2023-02-13 07:25:00',NULL,'','2023-02-13 13:28:01',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1715866387',0,'46','LECCIONES, DONALD GONZAGA','2023-02-14','2023-02-14 07:46:00','2023-02-14 12:01:25','','2023-02-14 12:33:42',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1722751021',0,'46','LECCIONES, DONALD GONZAGA','2023-02-15','2023-02-15 08:04:00','2023-02-15 12:08:00','','2023-02-15 12:20:00','2023-02-15 17:25:00','',0.066666666666667,0,7.93,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('504370215',0,'47','LETIGIO, REJOY POGADO','2023-02-01','2023-02-01 07:14:00','2023-02-01 12:04:00','','2023-02-01 12:36:00','2023-02-01 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1880604013',0,'47','LETIGIO, REJOY POGADO','2023-02-07','2023-02-07 07:24:00','2023-02-07 12:08:00','','2023-02-07 12:19:00','2023-02-07 17:18:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('55409608',0,'47','LETIGIO, REJOY POGADO','2023-02-08','2023-02-08 07:26:00','2023-02-08 12:15:27','','2023-02-08 17:09:33',NULL,'',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('2009800846',0,'47','LETIGIO, REJOY POGADO','2023-02-09','2023-02-09 07:59:00','2023-02-09 12:16:00','','2023-02-09 12:28:00','2023-02-09 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1374993580',0,'47','LETIGIO, REJOY POGADO','2023-02-10','2023-02-10 07:33:00','2023-02-10 12:01:00','','2023-02-10 12:16:00','2023-02-10 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('110769288',0,'47','LETIGIO, REJOY POGADO','2023-02-13','2023-02-13 07:52:00','2023-02-13 12:04:00','','2023-02-13 12:36:00','2023-02-13 18:23:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('188166361',0,'47','LETIGIO, REJOY POGADO','2023-02-14','2023-02-14 08:00:00','2023-02-14 12:18:00','','2023-02-14 12:30:00','2023-02-14 18:49:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1046415811',0,'47','LETIGIO, REJOY POGADO','2023-02-15','2023-02-15 07:42:00','2023-02-15 12:05:00','','2023-02-15 12:19:00','2023-02-15 18:11:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('364112636',0,'48','LICO, ROZYL ROMA','2023-02-01','2023-02-01 06:57:00','2023-02-01 12:05:00','','2023-02-01 12:34:00','2023-02-01 17:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1534785809',0,'48','LICO, ROZYL ROMA','2023-02-02','2023-02-02 07:34:00','2023-02-02 12:08:46','','2023-02-02 12:19:29',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1046981887',0,'48','LICO, ROZYL ROMA','2023-02-03','2023-02-03 07:58:00','2023-02-03 12:27:00','','2023-02-03 12:39:00','2023-02-03 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('382066062',0,'48','LICO, ROZYL ROMA','2023-02-06','2023-02-06 07:25:00','2023-02-06 12:01:00','','2023-02-06 12:11:00','2023-02-06 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('864160832',0,'48','LICO, ROZYL ROMA','2023-02-07','2023-02-07 07:32:00','2023-02-07 12:00:00','','2023-02-07 12:16:00','2023-02-07 17:05:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('843832719',0,'48','LICO, ROZYL ROMA','2023-02-08','2023-02-08 07:57:00','2023-02-08 12:00:00','','2023-02-08 12:19:00','2023-02-08 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1584458269',0,'48','LICO, ROZYL ROMA','2023-02-09','2023-02-09 07:56:00','2023-02-09 12:00:00','','2023-02-09 12:10:00','2023-02-09 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1620874469',0,'48','LICO, ROZYL ROMA','2023-02-10','2023-02-10 07:52:00','2023-02-10 12:00:00','','2023-02-10 12:11:00','2023-02-10 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('670039782',0,'48','LICO, ROZYL ROMA','2023-02-13','2023-02-13 07:24:00','2023-02-13 12:03:00','','2023-02-13 12:45:00','2023-02-13 18:11:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1938589203',0,'48','LICO, ROZYL ROMA','2023-02-14','2023-02-14 08:00:00','2023-02-14 12:00:00','','2023-02-14 12:10:00','2023-02-14 18:36:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('321192668',0,'48','LICO, ROZYL ROMA','2023-02-15','2023-02-15 07:53:00','2023-02-15 12:01:00','','2023-02-15 12:56:00','2023-02-15 17:05:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('660862798',0,'49','LOPEZ, NORA LUMIARES','2023-02-01','2023-02-01 06:46:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('580792895',0,'49','LOPEZ, NORA LUMIARES','2023-02-02','2023-02-02 07:58:00','2023-02-02 00:00:00','','2023-02-02 00:00:00','2023-02-02 17:08:00','',0,0,0,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('649953508',0,'49','LOPEZ, NORA LUMIARES','2023-02-03','2023-02-03 07:43:00','2023-02-03 00:00:00','','2023-02-03 00:00:00','2023-02-03 17:09:00','',0,0,0,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('813627479',0,'49','LOPEZ, NORA LUMIARES','2023-02-06','2023-02-06 07:31:00','2023-02-06 00:00:00','','2023-02-06 00:00:00','2023-02-06 17:20:00','',0,0,0,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('2010329408',0,'49','LOPEZ, NORA LUMIARES','2023-02-07','2023-02-07 07:44:00','2023-02-07 00:00:00','','2023-02-07 00:00:00','2023-02-07 17:19:00','',0,0,0,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('27944414',0,'49','LOPEZ, NORA LUMIARES','2023-02-08','2023-02-08 07:45:00','2023-02-08 00:00:00','','2023-02-08 00:00:00','2023-02-08 17:11:00','',0,0,0,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('557408346',0,'49','LOPEZ, NORA LUMIARES','2023-02-09','2023-02-09 07:52:00','2023-02-09 00:00:00','','2023-02-09 00:00:00','2023-02-09 17:11:00','',0,0,0,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('329625874',0,'49','LOPEZ, NORA LUMIARES','2023-02-10','2023-02-10 07:37:00','2023-02-10 00:00:00','','2023-02-10 00:00:00','2023-02-10 17:28:00','',0,0,0,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1870943892',0,'49','LOPEZ, NORA LUMIARES','2023-02-13','2023-02-13 06:54:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('344342255',0,'49','LOPEZ, NORA LUMIARES','2023-02-14','2023-02-14 07:56:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 18:43:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('364364801',0,'49','LOPEZ, NORA LUMIARES','2023-02-15','2023-02-15 07:50:00','2023-02-15 00:00:00','','2023-02-15 00:00:00','2023-02-15 17:46:00','',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('887382578',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-01','2023-02-01 06:53:00','2023-02-01 12:05:00','','2023-02-01 12:40:00','2023-02-01 17:16:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('136029856',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-02','2023-02-02 08:07:00','2023-02-02 12:09:12','','2023-02-02 12:19:15',NULL,'',0.11666666666667,0,3.88,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('293490249',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-03','2023-02-03 08:24:00','2023-02-03 12:03:00','','2023-02-03 12:14:00','2023-02-03 17:34:00','',0.4,0,7.6,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('356871154',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-06',NULL,NULL,'','2023-02-06 13:26:19','2023-02-06 19:16:00','',0.43333333333333,0,3.57,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1415828277',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-07','2023-02-07 08:02:00','2023-02-07 12:14:00','','2023-02-07 12:25:00','2023-02-07 17:42:00','',0.033333333333333,0,7.97,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1659705639',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-08','2023-02-08 08:55:00','2023-02-08 12:03:00','','2023-02-08 12:13:00','2023-02-08 18:02:00','',0.91666666666667,0,7.08,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1506441506',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-09','2023-02-09 08:38:00','2023-02-09 12:29:36','',NULL,NULL,'',0.63333333333333,0,3.37,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('41539130',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-13','2023-02-13 07:52:00','2023-02-13 00:00:00','','2023-02-13 12:26:00','2023-02-13 18:40:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('2110610118',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-14','2023-02-14 08:29:00','2023-02-14 12:23:00','','2023-02-14 12:36:00','2023-02-14 19:29:00','',0.48333333333333,0,7.52,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1815718155',0,'50','LULAB, AEYMH ZHAYL LAUSA','2023-02-15','2023-02-15 08:22:00','2023-02-15 12:05:00','','2023-02-15 12:17:00','2023-02-15 19:17:00','',0.36666666666667,0,7.63,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1943156484',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-01','2023-02-01 07:06:00','2023-02-01 12:00:00','','2023-02-01 12:33:00','2023-02-01 17:15:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1631227698',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-02','2023-02-02 08:17:00','2023-02-02 12:01:00','','2023-02-02 12:14:00','2023-02-02 17:08:00','',0.28333333333333,0,7.72,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1387169299',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-03','2023-02-03 08:07:00','2023-02-03 12:00:00','','2023-02-03 12:18:00','2023-02-03 17:05:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1657078134',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-06','2023-02-06 08:27:00','2023-02-06 00:00:00','','2023-02-06 12:24:00','2023-02-06 17:26:00','',0,0,4,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('712714546',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-07','2023-02-07 08:15:00','2023-02-07 12:05:00','','2023-02-07 12:19:00','2023-02-07 17:15:00','',0.25,0,7.75,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1621921821',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-08','2023-02-08 08:22:00','2023-02-08 12:01:00','','2023-02-08 12:27:00','2023-02-08 17:30:00','',0.36666666666667,0,7.63,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1201922347',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-09','2023-02-09 08:38:00','2023-02-09 12:27:00','','2023-02-09 00:00:00','2023-02-09 17:27:00','',1.2666666666667,0,6.74,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('439647489',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-10','2023-02-10 08:22:00','2023-02-10 12:01:00','','2023-02-10 12:19:00','2023-02-10 17:56:00','',0.36666666666667,0,7.63,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('807044760',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-13','2023-02-13 08:11:00','2023-02-13 12:00:00','','2023-02-13 12:24:00','2023-02-13 21:21:00','',0.18333333333333,0,7.82,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('552317422',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-14','2023-02-14 08:03:00','2023-02-14 12:00:00','','2023-02-14 12:27:00','2023-02-14 18:31:00','',0.05,0,7.95,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('2029890263',0,'51','LUMPAY, MARGIE LYN LACUMBES','2023-02-15','2023-02-15 08:46:00','2023-02-15 12:02:00','','2023-02-15 12:16:00','2023-02-15 17:22:00','',0.76666666666667,0,7.23,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1490744191',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-01','2023-02-01 07:05:00','2023-02-01 00:00:00','','2023-02-01 12:36:00','2023-02-01 17:59:00','',0,0,4,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1181246743',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-02','2023-02-02 07:33:00','2023-02-02 12:09:17','','2023-02-02 12:22:42',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('134275862',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-03','2023-02-03 07:52:00','2023-02-03 12:07:00','','2023-02-03 12:17:00','2023-02-03 17:33:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('282720449',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-06','2023-02-06 08:06:00','2023-02-06 12:12:00','','2023-02-06 12:24:00','2023-02-06 17:21:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('833103652',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-07','2023-02-07 07:54:00','2023-02-07 12:03:00','','2023-02-07 12:14:00','2023-02-07 18:45:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('921290257',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-08','2023-02-08 08:33:00','2023-02-08 12:18:00','','2023-02-08 12:30:00','2023-02-08 17:41:00','',0.55,0,7.45,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('304719471',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-09','2023-02-09 08:00:00','2023-02-09 12:18:29','',NULL,NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1564712358',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-13','2023-02-13 08:26:00','2023-02-13 00:00:00','','2023-02-13 12:26:00','2023-02-13 18:22:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1955517175',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-14','2023-02-14 08:07:00','2023-02-14 12:23:00','','2023-02-14 12:36:00','2023-02-14 21:12:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('692987954',0,'52','MABANAG, RUTHCELYNE SALUDO','2023-02-15','2023-02-15 08:22:00','2023-02-15 12:09:00','','2023-02-15 12:20:00','2023-02-15 17:44:00','',0.36666666666667,0,7.63,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1080103083',0,'53','MALLERNA, EVELYN BAJAR','2023-02-02','2023-02-02 06:13:00','2023-02-02 12:00:00','','2023-02-02 12:14:00','2023-02-02 16:59:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1014433859',0,'53','MALLERNA, EVELYN BAJAR','2023-02-03','2023-02-03 06:06:00','2023-02-03 12:02:00','','2023-02-03 12:13:00','2023-02-03 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1074636529',0,'53','MALLERNA, EVELYN BAJAR','2023-02-06','2023-02-06 06:01:00','2023-02-06 12:03:00','','2023-02-06 12:20:00','2023-02-06 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1629226446',0,'53','MALLERNA, EVELYN BAJAR','2023-02-07','2023-02-07 05:53:00','2023-02-07 11:59:00','','2023-02-07 12:10:00','2023-02-07 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1212988105',0,'53','MALLERNA, EVELYN BAJAR','2023-02-08','2023-02-08 06:00:00','2023-02-08 12:00:00','','2023-02-08 12:16:00','2023-02-08 16:59:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('219670030',0,'53','MALLERNA, EVELYN BAJAR','2023-02-09','2023-02-09 05:54:00','2023-02-09 12:13:00','','2023-02-09 12:23:00','2023-02-09 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1770387991',0,'53','MALLERNA, EVELYN BAJAR','2023-02-10','2023-02-10 05:50:00','2023-02-10 12:03:00','','2023-02-10 12:18:00','2023-02-10 17:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1770207739',0,'53','MALLERNA, EVELYN BAJAR','2023-02-12',NULL,NULL,'','2023-02-12 13:33:18',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-12 08:00:00','2023-02-12 17:00:00','regular','N/A','N/A',0,0),('610509202',0,'53','MALLERNA, EVELYN BAJAR','2023-02-13','2023-02-13 05:59:00','2023-02-13 12:01:00','','2023-02-13 12:22:00','2023-02-13 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('763727812',0,'53','MALLERNA, EVELYN BAJAR','2023-02-14','2023-02-14 05:52:00','2023-02-14 12:04:00','','2023-02-14 12:27:00','2023-02-14 17:47:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1175048792',0,'53','MALLERNA, EVELYN BAJAR','2023-02-15','2023-02-15 05:48:00','2023-02-15 12:20:00','','2023-02-15 12:45:00','2023-02-15 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2111955793',0,'54','MAMALIAS, JOAN MABOLIS','2023-02-01','2023-02-01 07:26:00','2023-02-01 12:04:00','','2023-02-01 12:44:00','2023-02-01 16:44:00','',0,0.25,7.75,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('623662711',0,'54','MAMALIAS, JOAN MABOLIS','2023-02-08','2023-02-08 07:42:00','2023-02-08 11:48:00','','2023-02-08 12:51:00','2023-02-08 17:00:00','',0,0.18333333333333,7.82,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('61149330',0,'54','MAMALIAS, JOAN MABOLIS','2023-02-09','2023-02-09 08:08:00','2023-02-09 11:53:00','','2023-02-09 13:06:00','2023-02-09 17:00:00','',0.23333333333333,0.1,7.67,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('138846228',0,'54','MAMALIAS, JOAN MABOLIS','2023-02-10','2023-02-10 08:14:00','2023-02-10 12:00:00','','2023-02-10 13:09:00','2023-02-10 17:00:00','',0.38333333333333,0,7.62,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1364982400',0,'54','MAMALIAS, JOAN MABOLIS','2023-02-13','2023-02-13 07:48:00','2023-02-13 11:50:00','','2023-02-13 13:00:00','2023-02-13 17:00:00','',0,0.15,7.85,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1687905549',0,'54','MAMALIAS, JOAN MABOLIS','2023-02-14','2023-02-14 08:25:00','2023-02-14 11:50:00','','2023-02-14 13:39:00','2023-02-14 18:15:00','',1.0666666666667,0.15,6.78,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1720952761',0,'54','MAMALIAS, JOAN MABOLIS','2023-02-15','2023-02-15 08:19:00','2023-02-15 12:00:00','','2023-02-15 13:04:00','2023-02-15 16:12:00','',0.38333333333333,0.78333333333333,6.83,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2016805083',0,'55','MANEJA, JERSON OCON','2023-02-01','2023-02-01 08:13:00','2023-02-01 12:00:00','','2023-02-01 13:15:00','2023-02-01 17:01:00','',0.46666666666667,0,7.53,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1020971986',0,'55','MANEJA, JERSON OCON','2023-02-02','2023-02-02 08:14:00','2023-02-02 12:01:00','','2023-02-02 13:08:00','2023-02-02 17:01:00','',0.36666666666667,0,7.64,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1185287512',0,'55','MANEJA, JERSON OCON','2023-02-03','2023-02-03 08:06:00','2023-02-03 12:01:00','','2023-02-03 13:07:00','2023-02-03 17:03:00','',0.21666666666667,0,7.78,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('650505596',0,'55','MANEJA, JERSON OCON','2023-02-08','2023-02-08 07:57:00','2023-02-08 00:00:00','','2023-02-08 13:05:00','2023-02-08 17:04:00','',0.083333333333333,0,3.92,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1912194662',0,'55','MANEJA, JERSON OCON','2023-02-09','2023-02-09 08:01:00','2023-02-09 12:00:00','','2023-02-09 13:08:00','2023-02-09 17:04:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1029420621',0,'55','MANEJA, JERSON OCON','2023-02-10','2023-02-10 08:07:00','2023-02-10 12:02:00','','2023-02-10 13:00:00','2023-02-10 18:10:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1040539637',0,'55','MANEJA, JERSON OCON','2023-02-13','2023-02-13 08:14:00','2023-02-13 12:01:00','','2023-02-13 13:03:00','2023-02-13 17:03:00','',0.28333333333333,0,7.72,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1761823958',0,'55','MANEJA, JERSON OCON','2023-02-14','2023-02-14 08:12:00','2023-02-14 12:03:00','','2023-02-14 12:30:00','2023-02-14 18:14:00','',0.2,0,7.8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('883717973',0,'55','MANEJA, JERSON OCON','2023-02-15','2023-02-15 08:07:00','2023-02-15 12:02:00','','2023-02-15 12:59:00','2023-02-15 17:04:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2117163146',0,'56','MANEJA, NELIA MANGUBAT','2023-02-01','2023-02-01 08:13:00','2023-02-01 12:00:00','','2023-02-01 13:15:00','2023-02-01 17:00:00','',0.46666666666667,0,7.53,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('210796510',0,'56','MANEJA, NELIA MANGUBAT','2023-02-02','2023-02-02 08:14:00','2023-02-02 12:00:00','','2023-02-02 00:00:00','2023-02-02 17:01:00','',0.23333333333333,0,3.77,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('249224756',0,'56','MANEJA, NELIA MANGUBAT','2023-02-03','2023-02-03 08:07:00','2023-02-03 12:00:00','','2023-02-03 13:07:00','2023-02-03 17:03:00','',0.23333333333333,0,7.76,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('740256375',0,'56','MANEJA, NELIA MANGUBAT','2023-02-06','2023-02-06 07:57:00','2023-02-06 12:00:00','','2023-02-06 13:08:00','2023-02-06 17:00:00','',0.13333333333333,0,7.87,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('108518352',0,'56','MANEJA, NELIA MANGUBAT','2023-02-08','2023-02-08 07:57:00','2023-02-08 00:00:00','','2023-02-08 13:04:00','2023-02-08 17:04:00','',0.066666666666667,0,3.93,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('666230353',0,'56','MANEJA, NELIA MANGUBAT','2023-02-09','2023-02-09 08:01:00','2023-02-09 12:08:00','','2023-02-09 13:08:00','2023-02-09 17:03:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1561232216',0,'56','MANEJA, NELIA MANGUBAT','2023-02-10','2023-02-10 08:07:00','2023-02-10 12:02:00','','2023-02-10 13:00:00','2023-02-10 17:09:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('221117063',0,'56','MANEJA, NELIA MANGUBAT','2023-02-13','2023-02-13 08:14:00','2023-02-13 12:00:00','','2023-02-13 13:03:00','2023-02-13 17:03:00','',0.28333333333333,0,7.72,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('2035546574',0,'56','MANEJA, NELIA MANGUBAT','2023-02-14','2023-02-14 08:12:00','2023-02-14 12:30:00','','2023-02-14 13:24:00','2023-02-14 18:14:00','',0.6,0,7.4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1879111183',0,'56','MANEJA, NELIA MANGUBAT','2023-02-15','2023-02-15 08:07:00','2023-02-15 12:03:00','','2023-02-15 12:59:00','2023-02-15 18:25:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('180463225',0,'57','MANGUBAT, JONALY DESPI','2023-02-01','2023-02-01 07:27:00','2023-02-01 12:04:00','','2023-02-01 12:40:00','2023-02-01 17:17:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('404141152',0,'57','MANGUBAT, JONALY DESPI','2023-02-07','2023-02-07 07:20:00','2023-02-07 12:14:00','','2023-02-07 12:25:00','2023-02-07 17:33:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1543228646',0,'57','MANGUBAT, JONALY DESPI','2023-02-08','2023-02-08 08:18:00','2023-02-08 12:20:00','','2023-02-08 12:31:00','2023-02-08 18:02:00','',0.3,0,7.7,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1734703711',0,'57','MANGUBAT, JONALY DESPI','2023-02-09','2023-02-09 08:57:00','2023-02-09 12:29:00','','2023-02-09 00:00:00','2023-02-09 17:26:00','',0.95,0,3.05,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1901426235',0,'57','MANGUBAT, JONALY DESPI','2023-02-10','2023-02-10 08:48:00','2023-02-10 12:16:00','','2023-02-10 12:27:00','2023-02-10 18:13:00','',0.8,0,7.2,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2102287116',0,'57','MANGUBAT, JONALY DESPI','2023-02-11','2023-02-11 10:06:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('1701659062',0,'57','MANGUBAT, JONALY DESPI','2023-02-13','2023-02-13 07:48:00','2023-02-13 00:00:00','','2023-02-13 00:00:00','2023-02-13 18:08:00','',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('186487165',0,'57','MANGUBAT, JONALY DESPI','2023-02-14','2023-02-14 07:57:00','2023-02-14 12:36:00','','2023-02-14 00:00:00','2023-02-14 18:52:00','',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('251056202',0,'57','MANGUBAT, JONALY DESPI','2023-02-15',NULL,NULL,'','2023-02-15 13:30:01','2023-02-15 17:19:00','',0.5,0,3.5,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1477271050',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-01',NULL,NULL,'',NULL,'2023-02-01 17:37:00','',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1742294357',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-02','2023-02-02 09:00:00','2023-02-02 12:09:00','','2023-02-02 12:25:00','2023-02-02 17:00:00','',1,0,7,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('739481575',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-03','2023-02-03 08:19:00','2023-02-03 12:09:00','','2023-02-03 12:19:00','2023-02-03 17:23:00','',0.31666666666667,0,7.68,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('909221299',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-06','2023-02-06 09:23:00','2023-02-06 00:00:00','','2023-02-06 12:36:00','2023-02-06 17:38:00','',0,0,4,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('807926387',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-07','2023-02-07 09:24:00','2023-02-07 12:06:00','','2023-02-07 12:19:00','2023-02-07 17:30:00','',1.4,0,6.6,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('549269719',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-08','2023-02-08 09:38:00','2023-02-08 00:00:00','','2023-02-08 12:17:00','2023-02-08 17:19:00','',0,0,4,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('378475891',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-09','2023-02-09 09:47:00','2023-02-09 12:04:55','','2023-02-09 12:16:26',NULL,'',1.7833333333333,0,2.22,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('816566690',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-10','2023-02-10 09:39:00','2023-02-10 12:06:13','','2023-02-10 12:16:24',NULL,'',1.65,0,2.35,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('914978674',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-13','2023-02-13 09:34:00','2023-02-13 12:00:00','','2023-02-13 00:00:00','2023-02-13 22:15:00','',1.5666666666667,0,2.43,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1039865709',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-14','2023-02-14 09:07:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 18:49:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1115976525',0,'58','MANTE, CHRISTIAN IAN MARILLA','2023-02-15','2023-02-15 09:01:00','2023-02-15 12:06:00','','2023-02-15 12:19:00','2023-02-15 17:37:00','',1.0166666666667,0,6.98,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('213470032',0,'6','ARNOCO, ELMA MORENO','2023-02-01','2023-02-01 09:06:00','2023-02-01 00:00:00','','2023-02-01 00:00:00','2023-02-01 17:08:00','',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('674497431',0,'6','ARNOCO, ELMA MORENO','2023-02-02','2023-02-02 08:49:00','2023-02-02 12:09:00','','2023-02-02 12:25:00','2023-02-02 17:00:00','',0.81666666666667,0,7.18,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1143135424',0,'6','ARNOCO, ELMA MORENO','2023-02-03','2023-02-03 08:43:00','2023-02-03 00:00:00','','2023-02-03 00:00:00','2023-02-03 17:23:00','',0,0,0,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('480641242',0,'6','ARNOCO, ELMA MORENO','2023-02-06','2023-02-06 09:16:00','2023-02-06 12:24:00','','2023-02-06 12:36:00','2023-02-06 17:39:00','',1.2666666666667,0,6.73,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('699767832',0,'6','ARNOCO, ELMA MORENO','2023-02-08','2023-02-08 09:22:00','2023-02-08 12:09:00','','2023-02-08 12:22:00','2023-02-08 17:19:00','',1.3666666666667,0,6.63,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1374623608',0,'6','ARNOCO, ELMA MORENO','2023-02-09','2023-02-09 09:02:00','2023-02-09 12:16:00','','2023-02-09 00:00:00','2023-02-09 17:30:00','',2.0666666666667,0,5.94,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1995713192',0,'6','ARNOCO, ELMA MORENO','2023-02-10','2023-02-10 09:02:00','2023-02-10 12:06:00','','2023-02-10 12:16:00','2023-02-10 17:25:00','',1.0333333333333,0,6.97,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('595831358',0,'6','ARNOCO, ELMA MORENO','2023-02-11','2023-02-11 09:42:00','2023-02-11 10:14:27','',NULL,NULL,'',1.7,1.75,0.55,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('622743520',0,'6','ARNOCO, ELMA MORENO','2023-02-14','2023-02-14 09:23:00','2023-02-14 12:15:00','','2023-02-14 12:25:00','2023-02-14 18:50:00','',1.3833333333333,0,6.62,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('642271431',0,'6','ARNOCO, ELMA MORENO','2023-02-15','2023-02-15 08:00:00','2023-02-15 12:06:00','','2023-02-15 12:02:00','2023-02-15 17:37:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1729147712',0,'60','MARTINES, SUSAN MORTAL','2023-02-01','2023-02-01 06:22:00','2023-02-01 12:00:00','','2023-02-01 12:11:00','2023-02-01 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('761839980',0,'60','MARTINES, SUSAN MORTAL','2023-02-02','2023-02-02 06:04:00','2023-02-02 12:00:00','','2023-02-02 12:15:00','2023-02-02 16:58:00','',0,0.016666666666667,7.98,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1538391113',0,'60','MARTINES, SUSAN MORTAL','2023-02-03','2023-02-03 06:13:00','2023-02-03 12:00:00','','2023-02-03 12:12:00','2023-02-03 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('981033684',0,'60','MARTINES, SUSAN MORTAL','2023-02-06','2023-02-06 06:25:00','2023-02-06 12:01:00','','2023-02-06 12:13:00','2023-02-06 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('586681838',0,'60','MARTINES, SUSAN MORTAL','2023-02-07','2023-02-07 06:10:00','2023-02-07 12:00:00','','2023-02-07 12:10:00','2023-02-07 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('412958472',0,'60','MARTINES, SUSAN MORTAL','2023-02-08','2023-02-08 05:56:00','2023-02-08 12:00:00','','2023-02-08 12:18:00','2023-02-08 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1575340095',0,'60','MARTINES, SUSAN MORTAL','2023-02-09','2023-02-09 06:43:00','2023-02-09 12:00:00','','2023-02-09 12:12:00','2023-02-09 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1712143681',0,'60','MARTINES, SUSAN MORTAL','2023-02-10','2023-02-10 06:08:00','2023-02-10 12:02:00','','2023-02-10 12:15:00','2023-02-10 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('931869363',0,'60','MARTINES, SUSAN MORTAL','2023-02-13','2023-02-13 06:00:00','2023-02-13 12:05:00','','2023-02-13 12:26:00','2023-02-13 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('643086312',0,'60','MARTINES, SUSAN MORTAL','2023-02-14','2023-02-14 06:04:00','2023-02-14 12:00:00','','2023-02-14 12:24:00','2023-02-14 17:48:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('654873310',0,'60','MARTINES, SUSAN MORTAL','2023-02-15','2023-02-15 06:20:00','2023-02-15 12:02:00','','2023-02-15 12:12:00','2023-02-15 16:59:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('485309841',0,'61','MARZAN, JANETH ALGABRE','2023-02-01','2023-02-01 08:28:00','2023-02-01 12:14:00','','2023-02-01 12:28:00','2023-02-01 17:03:00','',0,0,7.58,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1954453829',0,'61','MARZAN, JANETH ALGABRE','2023-02-02','2023-02-02 07:24:00','2023-02-02 12:12:00','','2023-02-02 12:27:00','2023-02-02 17:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('374681567',0,'61','MARZAN, JANETH ALGABRE','2023-02-03','2023-02-03 08:39:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('559733492',0,'61','MARZAN, JANETH ALGABRE','2023-02-06','2023-02-06 06:44:00','2023-02-06 12:04:00','','2023-02-06 12:19:00','2023-02-06 17:12:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('728394796',0,'61','MARZAN, JANETH ALGABRE','2023-02-07','2023-02-07 06:55:00','2023-02-07 12:12:00','','2023-02-07 12:25:00','2023-02-07 17:23:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1434698032',0,'61','MARZAN, JANETH ALGABRE','2023-02-08','2023-02-08 07:21:00','2023-02-08 12:27:00','','2023-02-08 12:42:00','2023-02-08 17:14:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1870965872',0,'61','MARZAN, JANETH ALGABRE','2023-02-09','2023-02-09 07:02:00','2023-02-09 12:24:00','','2023-02-09 12:36:00','2023-02-09 17:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('652738023',0,'61','MARZAN, JANETH ALGABRE','2023-02-10','2023-02-10 07:36:00','2023-02-10 12:09:00','','2023-02-10 12:22:00','2023-02-10 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1672330482',0,'61','MARZAN, JANETH ALGABRE','2023-02-13','2023-02-13 07:18:00','2023-02-13 12:21:00','','2023-02-13 12:33:00','2023-02-13 17:06:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1994553185',0,'61','MARZAN, JANETH ALGABRE','2023-02-14','2023-02-14 07:57:00','2023-02-14 12:33:25','','2023-02-14 12:44:18',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('684684499',0,'61','MARZAN, JANETH ALGABRE','2023-02-15','2023-02-15 08:08:00','2023-02-15 12:07:00','','2023-02-15 12:18:00','2023-02-15 17:20:00','',0.13333333333333,0,7.87,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('935777977',0,'62','MARZAN, MARK BENN VILOAN','2023-02-01','2023-02-01 11:20:00','2023-02-01 00:00:00','','2023-02-01 00:00:00','2023-02-01 21:42:00','',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1688605438',0,'62','MARZAN, MARK BENN VILOAN','2023-02-02',NULL,NULL,'','2023-02-02 12:36:58',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1173555968',0,'62','MARZAN, MARK BENN VILOAN','2023-02-06','2023-02-06 09:39:00','2023-02-06 00:00:00','','2023-02-06 00:00:00','2023-02-06 21:29:00','',0,0,0,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1158116871',0,'62','MARZAN, MARK BENN VILOAN','2023-02-07',NULL,NULL,'',NULL,'2023-02-07 21:35:00','',0,0,0,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1795284834',0,'62','MARZAN, MARK BENN VILOAN','2023-02-09','2023-02-09 09:42:00','2023-02-09 00:00:00','','2023-02-09 00:00:00','2023-02-09 22:06:00','',0,0,0,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1845375199',0,'62','MARZAN, MARK BENN VILOAN','2023-02-10','2023-02-10 10:10:00','2023-02-10 00:00:00','','2023-02-10 00:00:00','2023-02-10 21:59:00','',0,0,0,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1246909187',0,'62','MARZAN, MARK BENN VILOAN','2023-02-13',NULL,NULL,'',NULL,'2023-02-13 22:43:00','',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('849173937',0,'62','MARZAN, MARK BENN VILOAN','2023-02-14','2023-02-14 11:33:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 20:18:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('232508538',0,'62','MARZAN, MARK BENN VILOAN','2023-02-15',NULL,NULL,'',NULL,'2023-02-15 21:45:00','',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2090519613',0,'64','MONTES, GENERICK GROTES','2023-02-01','2023-02-01 07:34:00','2023-02-01 12:00:00','','2023-02-01 12:11:00','2023-02-01 17:10:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('2026840724',0,'64','MONTES, GENERICK GROTES','2023-02-02','2023-02-02 07:47:00','2023-02-02 12:06:00','','2023-02-02 12:17:00','2023-02-02 17:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1586491944',0,'64','MONTES, GENERICK GROTES','2023-02-03','2023-02-03 08:02:00','2023-02-03 12:00:00','','2023-02-03 12:16:00','2023-02-03 17:30:00','',0.033333333333333,0,7.97,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('798996415',0,'64','MONTES, GENERICK GROTES','2023-02-06','2023-02-06 07:35:00','2023-02-06 12:00:00','','2023-02-06 12:18:00','2023-02-06 17:21:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1252103804',0,'64','MONTES, GENERICK GROTES','2023-02-07','2023-02-07 07:54:00','2023-02-07 12:00:00','','2023-02-07 12:12:00','2023-02-07 17:36:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('582353207',0,'64','MONTES, GENERICK GROTES','2023-02-08','2023-02-08 07:36:00','2023-02-08 12:02:00','','2023-02-08 12:17:00','2023-02-08 17:14:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('366056186',0,'64','MONTES, GENERICK GROTES','2023-02-09','2023-02-09 07:54:00','2023-02-09 12:01:00','','2023-02-09 12:56:00','2023-02-09 19:55:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1237569522',0,'64','MONTES, GENERICK GROTES','2023-02-10','2023-02-10 07:44:00','2023-02-10 12:02:00','','2023-02-10 12:21:00','2023-02-10 19:32:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('85600669',0,'64','MONTES, GENERICK GROTES','2023-02-13','2023-02-13 08:24:00','2023-02-13 12:01:00','','2023-02-13 12:56:00','2023-02-13 19:59:00','',0.4,0,7.6,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1622587186',0,'64','MONTES, GENERICK GROTES','2023-02-14','2023-02-14 07:34:00','2023-02-14 12:05:00','','2023-02-14 12:22:00','2023-02-14 18:27:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('2108258300',0,'64','MONTES, GENERICK GROTES','2023-02-15','2023-02-15 08:01:00','2023-02-15 12:01:00','','2023-02-15 12:12:00','2023-02-15 15:37:00','',0.016666666666667,1.3666666666667,6.61,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('731843701',0,'66','NOVO, JUDYVIE EYANA','2023-02-01','2023-02-01 07:56:00','2023-02-01 12:00:00','','2023-02-01 12:42:00','2023-02-01 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('181540001',0,'66','NOVO, JUDYVIE EYANA','2023-02-02','2023-02-02 07:53:00','2023-02-02 00:00:00','','2023-02-02 12:37:00','2023-02-02 17:02:00','',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('695990965',0,'66','NOVO, JUDYVIE EYANA','2023-02-03','2023-02-03 07:36:00','2023-02-03 12:00:00','','2023-02-03 12:18:00','2023-02-03 17:38:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1304948640',0,'66','NOVO, JUDYVIE EYANA','2023-02-06','2023-02-06 08:00:00','2023-02-06 12:00:00','','2023-02-06 12:12:00','2023-02-06 17:39:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1109142794',0,'66','NOVO, JUDYVIE EYANA','2023-02-07','2023-02-07 07:57:00','2023-02-07 12:00:00','','2023-02-07 12:11:00','2023-02-07 17:43:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('947361565',0,'66','NOVO, JUDYVIE EYANA','2023-02-08','2023-02-08 08:07:00','2023-02-08 12:02:00','','2023-02-08 12:16:00','2023-02-08 17:47:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('554175273',0,'66','NOVO, JUDYVIE EYANA','2023-02-09','2023-02-09 07:55:00','2023-02-09 12:00:00','','2023-02-09 12:28:00','2023-02-09 18:29:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1570532394',0,'66','NOVO, JUDYVIE EYANA','2023-02-10','2023-02-10 08:05:00','2023-02-10 12:00:00','','2023-02-10 12:27:00','2023-02-10 17:57:00','',0.083333333333333,0,7.92,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('567448447',0,'66','NOVO, JUDYVIE EYANA','2023-02-13','2023-02-13 08:10:00','2023-02-13 12:20:00','','2023-02-13 00:00:00','2023-02-13 17:08:00','',0.33333333333333,0,7.66,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('67474696',0,'66','NOVO, JUDYVIE EYANA','2023-02-14','2023-02-14 08:00:00','2023-02-14 12:02:00','','2023-02-14 12:21:00','2023-02-14 18:14:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('453449504',0,'66','NOVO, JUDYVIE EYANA','2023-02-15',NULL,'2023-02-15 12:01:23','','2023-02-15 12:14:03','2023-02-15 17:45:00','',0,1.3666666666667,6.63,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('2135065227',0,'67','PACULBA, EMMALEN SALDIVAR','2023-02-01','2023-02-01 07:54:32','2023-02-01 12:00:20','','2023-02-01 13:03:01','2023-02-01 17:06:34','',0.05,0,7.95,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('923188434',0,'67','PACULBA, EMMALEN SALDIVAR','2023-02-02','2023-02-02 08:00:59','2023-02-02 12:00:12','','2023-02-02 12:16:18','2023-02-02 17:10:39','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('228191418',0,'67','PACULBA, EMMALEN SALDIVAR','2023-02-03','2023-02-03 08:00:01','2023-02-03 12:02:04','','2023-02-03 12:29:54','2023-02-03 17:08:27','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('615460947',0,'67','PACULBA, EMMALEN SALDIVAR','2023-02-04','2023-02-04 08:00:58','2023-02-04 12:02:08','','2023-02-04 12:28:33','2023-02-04 17:09:40','',0,0,8,'0','','','','','','','',0,'2023-02-04 08:00:00','2023-02-04 17:00:00','regular','N/A','N/A',0,0),('1775946607',0,'67','PACULBA, EMMALEN SALDIVAR','2023-02-05','2023-02-05 08:05:57','2023-02-05 12:05:40','','2023-02-05 12:19:22','2023-02-05 17:17:05','',0.08333333333333333,0,7.92,'0','','','','','','','',0,'2023-02-05 08:00:00','2023-02-05 17:00:00','regular','N/A','N/A',0,0),('1222534709',0,'69','PAREJA., THELMA POLANCOS','2023-02-01','2023-02-01 08:32:00','2023-02-01 12:26:00','','2023-02-01 12:39:00','2023-02-01 17:19:00','',0.53333333333333,0,7.47,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1914259743',0,'69','PAREJA., THELMA POLANCOS','2023-02-02','2023-02-02 08:20:00','2023-02-02 00:00:00','','2023-02-02 12:19:00','2023-02-02 17:21:00','',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1751206883',0,'69','PAREJA., THELMA POLANCOS','2023-02-03','2023-02-03 08:29:00','2023-02-03 00:00:00','','2023-02-03 00:00:00','2023-02-03 17:16:00','',0,0,0,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('582005460',0,'69','PAREJA., THELMA POLANCOS','2023-02-06','2023-02-06 08:29:00',NULL,'',NULL,'2023-02-06 17:07:00','',0,0,7.630000000000001,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1962373403',0,'69','PAREJA., THELMA POLANCOS','2023-02-07','2023-02-07 08:14:00','2023-02-07 12:41:00','','2023-02-07 12:53:00','2023-02-07 17:12:00','',0.23333333333333,0,7.77,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1587542403',0,'69','PAREJA., THELMA POLANCOS','2023-02-08','2023-02-08 07:56:00','2023-02-08 12:55:00','','2023-02-08 13:09:00','2023-02-08 17:18:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1984154624',0,'69','PAREJA., THELMA POLANCOS','2023-02-09','2023-02-09 08:37:00','2023-02-09 12:36:00','','2023-02-09 12:59:00','2023-02-09 17:37:00','',0.61666666666667,0,7.38,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1188108343',0,'69','PAREJA., THELMA POLANCOS','2023-02-10','2023-02-10 08:28:00','2023-02-10 00:00:00','','2023-02-10 00:00:00','2023-02-10 17:31:00','',0,0,0,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2102694131',0,'69','PAREJA., THELMA POLANCOS','2023-02-13','2023-02-13 07:57:00','2023-02-13 12:21:00','','2023-02-13 12:34:00','2023-02-13 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1932479642',0,'69','PAREJA., THELMA POLANCOS','2023-02-14','2023-02-14 07:46:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1439837142',0,'69','PAREJA., THELMA POLANCOS','2023-02-15','2023-02-15 08:39:00','2023-02-15 12:16:16','',NULL,NULL,'',0.65,0,3.35,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1650722237',0,'70','PASQUIL, REX TEMPLATORA','2023-02-06',NULL,'2023-02-06 12:13:37','','2023-02-06 12:25:51','2023-02-06 21:21:00','',0,0,4,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('22930214',0,'70','PASQUIL, REX TEMPLATORA','2023-02-07','2023-02-07 08:40:00','2023-02-07 12:24:42','','2023-02-07 12:46:22',NULL,'',0.66666666666667,0,3.33,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('73996484',0,'70','PASQUIL, REX TEMPLATORA','2023-02-08','2023-02-08 09:00:00','2023-02-08 00:00:00','','2023-02-08 00:00:00','2023-02-08 21:44:00','',0,0,0,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('157368109',0,'70','PASQUIL, REX TEMPLATORA','2023-02-10','2023-02-10 08:45:00','2023-02-10 12:03:00','','2023-02-10 12:21:00','2023-02-10 21:16:00','',0.75,0,7.25,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('114427798',0,'70','PASQUIL, REX TEMPLATORA','2023-02-11','2023-02-11 09:21:00','2023-02-11 11:05:09','','2023-02-11 13:27:01',NULL,'',1.35,0.9,1.75,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('1257574181',0,'70','PASQUIL, REX TEMPLATORA','2023-02-13','2023-02-13 11:34:00','2023-02-13 00:00:00','','2023-02-13 00:00:00','2023-02-13 17:12:00','',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('459042511',0,'70','PASQUIL, REX TEMPLATORA','2023-02-14',NULL,NULL,'',NULL,'2023-02-14 18:33:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('783340369',0,'70','PASQUIL, REX TEMPLATORA','2023-02-15','2023-02-15 09:33:00','2023-02-15 12:14:00','','2023-02-15 12:41:00','2023-02-15 17:08:00','',1.55,0,6.45,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1724259417',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-01','2023-02-01 07:48:00','2023-02-01 12:36:00','','2023-02-01 12:47:00','2023-02-01 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('529519640',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-02','2023-02-02 07:48:00','2023-02-02 12:29:00','','2023-02-02 12:39:00','2023-02-02 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('2113850603',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-03','2023-02-03 07:45:00','2023-02-03 12:36:00','','2023-02-03 12:47:00','2023-02-03 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('94525411',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-06','2023-02-06 07:41:00','2023-02-06 12:31:00','','2023-02-06 12:45:00','2023-02-06 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1202193136',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-07','2023-02-07 07:45:00','2023-02-07 12:42:00','','2023-02-07 12:53:00','2023-02-07 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('90817882',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-08','2023-02-08 07:54:00','2023-02-08 12:48:00','','2023-02-08 12:59:00','2023-02-08 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1803920311',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-09','2023-02-09 07:46:00','2023-02-09 12:44:00','','2023-02-09 12:55:00','2023-02-09 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1446796006',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-10','2023-02-10 07:41:00','2023-02-10 12:39:00','','2023-02-10 12:53:00','2023-02-10 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1428882270',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-13','2023-02-13 07:44:00','2023-02-13 12:47:00','','2023-02-13 13:00:00','2023-02-13 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1582576041',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-14','2023-02-14 07:44:00','2023-02-14 12:02:49','','2023-02-14 12:13:48',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('691311327',0,'71','RAMIREZ, EVELINDA PARADERO','2023-02-15','2023-02-15 07:48:00','2023-02-15 12:37:00','','2023-02-15 12:53:00','2023-02-15 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('948334712',0,'72','SALARDA, CONIE PIODO','2023-02-01','2023-02-01 07:54:00','2023-02-01 12:14:00','','2023-02-01 12:25:00','2023-02-01 17:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('2112544459',0,'72','SALARDA, CONIE PIODO','2023-02-02','2023-02-02 07:59:00','2023-02-02 12:11:00','','2023-02-02 12:26:00','2023-02-02 17:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1321695708',0,'72','SALARDA, CONIE PIODO','2023-02-07','2023-02-07 07:52:00','2023-02-07 12:13:00','','2023-02-07 12:25:00','2023-02-07 17:24:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('2037705376',0,'72','SALARDA, CONIE PIODO','2023-02-08','2023-02-08 07:56:00','2023-02-08 12:27:00','','2023-02-08 12:43:00','2023-02-08 17:17:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('472966463',0,'72','SALARDA, CONIE PIODO','2023-02-09','2023-02-09 07:59:00','2023-02-09 12:24:00','','2023-02-09 12:36:00','2023-02-09 17:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1159152822',0,'72','SALARDA, CONIE PIODO','2023-02-10','2023-02-10 07:57:00','2023-02-10 12:10:00','','2023-02-10 12:21:00','2023-02-10 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1708562577',0,'72','SALARDA, CONIE PIODO','2023-02-13','2023-02-13 08:00:00','2023-02-13 12:21:00','','2023-02-13 12:32:00','2023-02-13 17:06:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('28662804',0,'72','SALARDA, CONIE PIODO','2023-02-14','2023-02-14 07:58:00','2023-02-14 12:33:00','','2023-02-14 12:44:00','2023-02-14 18:36:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1832869028',0,'72','SALARDA, CONIE PIODO','2023-02-15','2023-02-15 08:03:00','2023-02-15 12:07:00','','2023-02-15 12:18:00','2023-02-15 17:19:00','',0.05,0,7.95,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1432668455',0,'73','SAPID, ANALYN CAPILITAN','2023-02-01','2023-02-01 07:41:00','2023-02-01 00:00:00','','2023-02-01 00:00:00','2023-02-01 17:52:00','',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('2109637043',0,'73','SAPID, ANALYN CAPILITAN','2023-02-02','2023-02-02 08:44:00','2023-02-02 12:00:31','','2023-02-02 12:58:38',NULL,'',0.73333333333333,0,3.27,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('474017273',0,'73','SAPID, ANALYN CAPILITAN','2023-02-03','2023-02-03 08:31:00','2023-02-03 12:27:00','','2023-02-03 12:56:00','2023-02-03 18:07:00','',0.51666666666667,0,7.48,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1326384368',0,'73','SAPID, ANALYN CAPILITAN','2023-02-04',NULL,NULL,'','2023-02-04 14:26:43','2023-02-04 19:24:00','',0,0,NULL,'0','','','','','','','',0,'2023-02-04 08:00:00','2023-02-04 17:00:00','regular','N/A','N/A',0,0),('1697598681',0,'73','SAPID, ANALYN CAPILITAN','2023-02-06','2023-02-06 08:20:00','2023-02-06 12:37:00','','2023-02-06 12:48:00','2023-02-06 18:05:00','',0.33333333333333,0,7.67,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('545055238',0,'73','SAPID, ANALYN CAPILITAN','2023-02-07','2023-02-07 08:27:00','2023-02-07 00:00:00','','2023-02-07 13:00:00','2023-02-07 17:45:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1397874782',0,'73','SAPID, ANALYN CAPILITAN','2023-02-08','2023-02-08 08:12:00','2023-02-08 12:38:00','','2023-02-08 12:56:00','2023-02-08 17:56:00','',0.2,0,7.8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('2110028518',0,'73','SAPID, ANALYN CAPILITAN','2023-02-10','2023-02-10 08:13:00','2023-02-10 12:25:00','','2023-02-10 12:36:00','2023-02-10 18:20:00','',0.21666666666667,0,7.78,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1969233225',0,'73','SAPID, ANALYN CAPILITAN','2023-02-11','2023-02-11 09:53:00','2023-02-11 12:08:00','','2023-02-11 12:34:00','2023-02-11 18:10:00','',1.8833333333333,0,6.12,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('765850815',0,'73','SAPID, ANALYN CAPILITAN','2023-02-12','2023-02-12 08:13:00','2023-02-12 12:52:00','','2023-02-12 13:02:00','2023-02-12 20:18:00','',0,0,8,'0','','','','','','','',0,NULL,NULL,'regular','N/A','N/A',0,0),('1599667601',0,'73','SAPID, ANALYN CAPILITAN','2023-02-13','2023-02-13 08:30:00','2023-02-13 00:00:00','','2023-02-13 12:58:00','2023-02-13 21:09:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1519393905',0,'73','SAPID, ANALYN CAPILITAN','2023-02-14','2023-02-14 08:22:00','2023-02-14 12:05:00','','2023-02-14 12:26:00','2023-02-14 19:32:00','',0.36666666666667,0,7.63,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1681630817',0,'73','SAPID, ANALYN CAPILITAN','2023-02-15','2023-02-15 08:21:00','2023-02-15 12:01:00','','2023-02-15 12:49:00','2023-02-15 19:08:00','',0.35,0,7.65,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('540949621',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-01','2023-02-01 06:33:00','2023-02-01 00:00:00','','2023-02-01 13:10:00','2023-02-01 17:50:00','',0.16666666666667,0,3.83,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('887646727',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-02','2023-02-02 08:44:00','2023-02-02 12:00:39','','2023-02-02 12:58:41',NULL,'',0.73333333333333,0,3.27,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('268860535',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-03','2023-02-03 08:59:00','2023-02-03 12:40:00','','2023-02-03 12:52:00','2023-02-03 16:00:00','',0.98333333333333,0.98333333333333,6.04,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('2075406873',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-06','2023-02-06 07:48:00','2023-02-06 12:37:00','','2023-02-06 12:51:00','2023-02-06 18:05:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1955145522',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-07','2023-02-07 08:41:00','2023-02-07 12:46:00','','2023-02-07 13:00:00','2023-02-07 18:33:00','',0.68333333333333,0,7.32,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('684209558',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-08','2023-02-08 08:12:00','2023-02-08 12:39:00','','2023-02-08 12:57:00','2023-02-08 17:57:00','',0.2,0,7.8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1118140142',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-09','2023-02-09 08:36:00','2023-02-09 12:18:00','','2023-02-09 12:54:00','2023-02-09 20:16:00','',0.6,0,7.4,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1432126884',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-10','2023-02-10 08:48:00','2023-02-10 12:43:00','','2023-02-10 12:55:00','2023-02-10 18:19:00','',0.8,0,7.2,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('441479805',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-11','2023-02-11 09:53:00','2023-02-11 12:11:00','','2023-02-11 12:34:00','2023-02-11 16:10:00','',1.8833333333333,0.81666666666667,5.3,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('755044091',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-13','2023-02-13 08:30:00','2023-02-13 00:00:00','','2023-02-13 12:57:00','2023-02-13 21:09:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('649857636',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-14','2023-02-14 08:22:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 19:32:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('2079299611',0,'74','SAPID, MERNELITA CAPILITAN','2023-02-15','2023-02-15 08:19:00','2023-02-15 12:17:00','','2023-02-15 12:48:00','2023-02-15 19:08:00','',0.31666666666667,0,7.68,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('621530131',0,'75','SAYSON, DELBERT ORTEGA','2023-02-01','2023-02-01 08:08:00','2023-02-01 12:34:00','','2023-02-01 12:46:00','2023-02-01 17:10:00','',0.13333333333333,0,7.87,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('305117768',0,'75','SAYSON, DELBERT ORTEGA','2023-02-02','2023-02-02 08:06:00','2023-02-02 12:12:00','','2023-02-02 12:45:00','2023-02-02 17:01:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1214814624',0,'75','SAYSON, DELBERT ORTEGA','2023-02-03','2023-02-03 07:48:00','2023-02-03 12:07:00','','2023-02-03 12:17:00','2023-02-03 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1612233470',0,'75','SAYSON, DELBERT ORTEGA','2023-02-06','2023-02-06 08:07:00','2023-02-06 00:00:00','','2023-02-06 12:38:00','2023-02-06 17:17:00','',0,0,4,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('826611062',0,'75','SAYSON, DELBERT ORTEGA','2023-02-07','2023-02-07 08:00:00','2023-02-07 12:04:00','','2023-02-07 12:27:00','2023-02-07 17:15:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1312548851',0,'75','SAYSON, DELBERT ORTEGA','2023-02-08','2023-02-08 08:05:00','2023-02-08 12:08:00','','2023-02-08 12:21:00','2023-02-08 17:40:00','',0.083333333333333,0,7.92,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1741693061',0,'75','SAYSON, DELBERT ORTEGA','2023-02-09','2023-02-09 08:08:00','2023-02-09 12:08:00','','2023-02-09 12:20:00','2023-02-09 17:45:00','',0.13333333333333,0,7.87,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('271476422',0,'75','SAYSON, DELBERT ORTEGA','2023-02-10','2023-02-10 08:04:00','2023-02-10 12:08:00','','2023-02-10 12:18:00','2023-02-10 17:22:00','',0.066666666666667,0,7.93,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1984269628',0,'75','SAYSON, DELBERT ORTEGA','2023-02-13','2023-02-13 08:02:00','2023-02-13 12:05:00','','2023-02-13 12:51:00','2023-02-13 17:09:00','',0.033333333333333,0,7.97,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1889097579',0,'75','SAYSON, DELBERT ORTEGA','2023-02-14','2023-02-14 08:01:00','2023-02-14 12:09:00','','2023-02-14 12:21:00','2023-02-14 18:33:00','',0.016666666666667,0,7.98,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1578713211',0,'76','SIAREZ, JOEL LARIOSA','2023-02-01','2023-02-01 07:50:00','2023-02-01 12:05:00','','2023-02-01 12:51:00','2023-02-01 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('842358599',0,'76','SIAREZ, JOEL LARIOSA','2023-02-02','2023-02-02 08:05:00','2023-02-02 12:01:00','','2023-02-02 00:00:00','2023-02-02 16:58:00','',0.083333333333333,0,3.92,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1843355954',0,'76','SIAREZ, JOEL LARIOSA','2023-02-03','2023-02-03 08:26:00','2023-02-03 12:03:00','','2023-02-03 12:59:00','2023-02-03 17:17:00','',0.43333333333333,0,7.57,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('503916196',0,'76','SIAREZ, JOEL LARIOSA','2023-02-06','2023-02-06 08:03:00','2023-02-06 12:01:00','','2023-02-06 13:11:00','2023-02-06 17:25:00','',0.23333333333333,0,7.77,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1469122387',0,'76','SIAREZ, JOEL LARIOSA','2023-02-07','2023-02-07 07:52:00','2023-02-07 12:00:00','','2023-02-07 12:42:00','2023-02-07 18:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('103073639',0,'76','SIAREZ, JOEL LARIOSA','2023-02-10','2023-02-10 07:59:00','2023-02-10 12:00:00','','2023-02-10 12:23:00','2023-02-10 19:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('503887463',0,'76','SIAREZ, JOEL LARIOSA','2023-02-13','2023-02-13 08:00:00','2023-02-13 12:02:14','','2023-02-13 12:27:47',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('732519166',0,'76','SIAREZ, JOEL LARIOSA','2023-02-14','2023-02-14 07:51:00','2023-02-14 12:01:00','','2023-02-14 12:11:00','2023-02-14 19:22:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1567061760',0,'76','SIAREZ, JOEL LARIOSA','2023-02-15','2023-02-15 06:36:00','2023-02-15 12:28:00','','2023-02-15 12:41:00','2023-02-15 17:55:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1301923975',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-01','2023-02-01 08:59:00','2023-02-01 12:00:00','','2023-02-01 13:27:00','2023-02-01 17:03:00','',1.4333333333333,0,6.57,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('306741029',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-02','2023-02-02 08:06:00','2023-02-02 12:04:00','','2023-02-02 00:00:00','2023-02-02 17:00:00','',0.1,0,3.9,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('565127622',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-03',NULL,NULL,'','2023-02-03 13:08:57','2023-02-03 17:00:00','',0,0,NULL,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1283613027',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-06','2023-02-06 08:51:00','2023-02-06 12:03:00','','2023-02-06 13:25:00','2023-02-06 17:00:00','',1.2666666666667,0,6.73,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('2134091334',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-07','2023-02-07 08:50:00','2023-02-07 12:00:00','','2023-02-07 13:17:00','2023-02-07 17:00:00','',1.1166666666667,0,6.89,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1851821977',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-08','2023-02-08 08:47:00','2023-02-08 12:00:00','','2023-02-08 13:07:00','2023-02-08 17:00:00','',0.9,0,7.1,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1310238345',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-09','2023-02-09 08:35:00','2023-02-09 12:00:00','','2023-02-09 13:26:00','2023-02-09 17:00:00','',1.0166666666667,0,6.99,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1252581090',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-10','2023-02-10 08:51:00','2023-02-10 12:02:16','','2023-02-10 13:20:06',NULL,'',0.85,0,3.15,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1380077404',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-13',NULL,NULL,'','2023-02-13 13:29:07',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('969226940',0,'78','SILVANO, KIRK JASON ABRATIGUIN','2023-02-15','2023-02-15 08:34:00','2023-02-15 12:00:00','','2023-02-15 13:24:00','2023-02-15 17:10:00','',0.96666666666667,0,7.03,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('686041092',0,'79','SINAJON, CONCORDIA GANOHAY','2023-02-06','2023-02-06 06:01:00','2023-02-06 12:02:00','','2023-02-06 12:18:00','2023-02-06 17:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('2071943775',0,'79','SINAJON, CONCORDIA GANOHAY','2023-02-07','2023-02-07 05:53:00','2023-02-07 12:00:00','','2023-02-07 12:26:00','2023-02-07 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('385578752',0,'79','SINAJON, CONCORDIA GANOHAY','2023-02-08','2023-02-08 06:00:00','2023-02-08 12:03:00','','2023-02-08 12:14:00','2023-02-08 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1658365673',0,'79','SINAJON, CONCORDIA GANOHAY','2023-02-09','2023-02-09 05:54:00',NULL,'',NULL,'2023-02-09 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('948488785',0,'79','SINAJON, CONCORDIA GANOHAY','2023-02-10','2023-02-10 05:50:00','2023-02-10 12:00:00','','2023-02-10 12:20:00','2023-02-10 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('121667675',0,'79','SINAJON, CONCORDIA GANOHAY','2023-02-13','2023-02-13 06:00:00','2023-02-13 12:22:00','','2023-02-13 00:00:00','2023-02-13 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('359519339',0,'79','SINAJON, CONCORDIA GANOHAY','2023-02-14','2023-02-14 05:52:00','2023-02-14 12:04:29','','2023-02-14 12:39:35',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('330641942',0,'79','SINAJON, CONCORDIA GANOHAY','2023-02-15','2023-02-15 05:48:00','2023-02-15 12:01:00','','2023-02-15 12:26:00','2023-02-15 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('699714788',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-01','2023-02-01 07:55:00','2023-02-01 00:00:00','','2023-02-01 00:00:00','2023-02-01 17:14:00','',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('670874343',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-02','2023-02-02 07:57:00','2023-02-02 00:00:00','','2023-02-02 00:00:00','2023-02-02 17:05:00','',0,0,0,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('470773350',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-03','2023-02-03 08:45:00','2023-02-03 12:16:00','','2023-02-03 00:00:00','2023-02-03 17:06:00','',0.75,0,3.25,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1212569990',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-06','2023-02-06 08:05:00','2023-02-06 12:06:00','','2023-02-06 12:19:00','2023-02-06 17:05:00','',0.083333333333333,0,7.92,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1531172463',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-07','2023-02-07 07:44:00','2023-02-07 12:12:00','','2023-02-07 00:00:00','2023-02-07 19:06:00','',0,0,4,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('569646615',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-08','2023-02-08 08:05:00','2023-02-08 00:00:00','','2023-02-08 00:00:00','2023-02-08 17:36:00','',0,0,0,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1052102873',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-09','2023-02-09 07:52:00','2023-02-09 00:00:00','','2023-02-09 00:00:00','2023-02-09 17:40:00','',0,0,0,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('340695228',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-10','2023-02-10 08:23:00','2023-02-10 00:00:00','','2023-02-10 00:00:00','2023-02-10 17:08:00','',0,0,0,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2053713735',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-13','2023-02-13 08:21:00','2023-02-13 00:00:00','','2023-02-13 00:00:00','2023-02-13 17:23:00','',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('322270494',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-14','2023-02-14 08:01:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 17:20:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1522263120',0,'8','ARTIZUELA, RUTCHILLE BARRIOS','2023-02-15','2023-02-15 09:35:00','2023-02-15 00:00:00','','2023-02-15 00:00:00','2023-02-15 17:54:00','',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('93566396',0,'80','TUBAT, ELESON MORATO','2023-02-06','2023-02-06 08:41:00','2023-02-06 12:03:00','','2023-02-06 13:12:00','2023-02-06 17:00:00','',0.88333333333333,0,7.12,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1474844604',0,'80','TUBAT, ELESON MORATO','2023-02-07','2023-02-07 08:06:00','2023-02-07 12:00:00','','2023-02-07 13:01:00','2023-02-07 17:04:00','',0.11666666666667,0,7.88,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('2091278779',0,'80','TUBAT, ELESON MORATO','2023-02-08','2023-02-08 08:07:00','2023-02-08 12:02:00','','2023-02-08 13:02:00','2023-02-08 17:00:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1583600939',0,'80','TUBAT, ELESON MORATO','2023-02-09','2023-02-09 08:05:00','2023-02-09 12:01:00','','2023-02-09 13:04:00','2023-02-09 17:10:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('53864900',0,'80','TUBAT, ELESON MORATO','2023-02-10','2023-02-10 08:06:00','2023-02-10 12:02:00','','2023-02-10 13:03:00','2023-02-10 17:00:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1309007123',0,'80','TUBAT, ELESON MORATO','2023-02-13','2023-02-13 08:11:00','2023-02-13 12:00:00','','2023-02-13 13:04:00','2023-02-13 17:01:00','',0.25,0,7.75,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('603418447',0,'80','TUBAT, ELESON MORATO','2023-02-14','2023-02-14 08:05:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 18:34:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('997796308',0,'80','TUBAT, ELESON MORATO','2023-02-15','2023-02-15 08:28:00','2023-02-15 12:03:00','','2023-02-15 13:04:00','2023-02-15 18:51:00','',0.53333333333333,0,7.46,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('373633447',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-01','2023-02-01 07:49:00','2023-02-01 12:12:00','','2023-02-01 12:37:00','2023-02-01 19:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1709686910',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-02','2023-02-02 08:35:00','2023-02-02 12:09:05','','2023-02-02 13:13:50',NULL,'',0.58333333333333,0,3.42,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1791134834',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-03','2023-02-03 09:07:00','2023-02-03 12:14:00','','2023-02-03 12:49:00','2023-02-03 17:02:00','',1.1166666666667,0,6.88,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('2053725741',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-06','2023-02-06 07:33:00','2023-02-06 12:49:43','','2023-02-06 13:00:34',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('674518178',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-07','2023-02-07 08:40:00','2023-02-07 00:00:00','','2023-02-07 00:00:00','2023-02-07 19:39:00','',0,0,0,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1282495823',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-09','2023-02-09 09:14:00','2023-02-09 12:42:00','','2023-02-09 12:58:00','2023-02-09 22:51:00','',1.2333333333333,0,6.77,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('518024131',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-10','2023-02-10 08:57:00','2023-02-10 12:01:00','','2023-02-10 12:27:00','2023-02-10 21:12:00','',0.95,0,7.05,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('784566815',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-11',NULL,'2023-02-11 10:39:20','',NULL,'2023-02-11 18:35:00','',0,0,0,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('941904653',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-13','2023-02-13 06:51:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1316263760',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-14','2023-02-14 00:04:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 21:52:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1523180990',0,'81','URBUDA, ROBERT MARQUEZ','2023-02-15','2023-02-15 08:37:00','2023-02-15 00:00:00','','2023-02-15 00:00:00','2023-02-15 20:20:00','',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('346354148',0,'82','VICENTE, JOHN MARK SERAD','2023-02-01','2023-02-01 06:55:00','2023-02-01 12:05:23','','2023-02-01 12:41:55',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1930326052',0,'82','VICENTE, JOHN MARK SERAD','2023-02-02','2023-02-02 08:26:00','2023-02-02 12:07:00','','2023-02-02 12:51:00','2023-02-02 19:40:00','',0.43333333333333,0,7.57,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1614842370',0,'82','VICENTE, JOHN MARK SERAD','2023-02-03','2023-02-03 08:48:00','2023-02-03 12:03:00','','2023-02-03 12:13:00','2023-02-03 18:44:00','',0.8,0,7.2,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('2005781024',0,'82','VICENTE, JOHN MARK SERAD','2023-02-06','2023-02-06 09:08:00','2023-02-06 12:07:00','','2023-02-06 12:18:00','2023-02-06 19:41:00','',1.1333333333333,0,6.87,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('937738802',0,'82','VICENTE, JOHN MARK SERAD','2023-02-07','2023-02-07 09:07:00','2023-02-07 12:05:00','','2023-02-07 12:15:00','2023-02-07 18:51:00','',1.1166666666667,0,6.88,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1993779782',0,'82','VICENTE, JOHN MARK SERAD','2023-02-08','2023-02-08 08:50:00','2023-02-08 12:50:00','','2023-02-08 13:00:00','2023-02-08 19:07:00','',0.83333333333333,0,7.17,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('341204234',0,'82','VICENTE, JOHN MARK SERAD','2023-02-09','2023-02-09 08:54:00','2023-02-09 12:19:00','','2023-02-09 12:30:00','2023-02-09 20:02:00','',0.9,0,7.1,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('101918660',0,'82','VICENTE, JOHN MARK SERAD','2023-02-10','2023-02-10 07:48:00','2023-02-10 12:02:00','','2023-02-10 12:38:00','2023-02-10 18:17:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1993992514',0,'82','VICENTE, JOHN MARK SERAD','2023-02-13','2023-02-13 08:48:00','2023-02-13 12:00:00','','2023-02-13 13:07:00','2023-02-13 19:13:00','',0.91666666666667,0,7.08,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1410380570',0,'82','VICENTE, JOHN MARK SERAD','2023-02-14','2023-02-14 08:24:00','2023-02-14 12:10:00','','2023-02-14 12:21:00','2023-02-14 20:08:00','',0.4,0,7.6,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1299694530',0,'82','VICENTE, JOHN MARK SERAD','2023-02-15',NULL,NULL,'','2023-02-15 13:18:09','2023-02-15 18:44:00','',0.3,0,3.7,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('658226495',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-01','2023-02-01 07:26:00','2023-02-01 12:05:00','','2023-02-01 12:39:00','2023-02-01 17:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1366117891',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-02','2023-02-02 07:58:00','2023-02-02 12:08:00','','2023-02-02 12:20:00','2023-02-02 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('220273092',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-03','2023-02-03 07:48:00','2023-02-03 12:07:00','','2023-02-03 12:21:00','2023-02-03 17:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1196833409',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-06','2023-02-06 08:33:00','2023-02-06 12:23:00','','2023-02-06 12:34:00','2023-02-06 17:35:00','',0.55,0,7.45,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1751283609',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-07','2023-02-07 08:02:00','2023-02-07 12:06:00','','2023-02-07 12:21:00','2023-02-07 17:13:00','',0.033333333333333,0,7.97,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('468676298',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-08','2023-02-08 08:11:00','2023-02-08 12:05:00','','2023-02-08 12:26:00','2023-02-08 16:12:00','',0.18333333333333,0.78333333333333,7.04,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1714278981',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-09','2023-02-09 08:31:00','2023-02-09 12:10:00','','2023-02-09 12:20:00','2023-02-09 17:22:00','',0.51666666666667,0,7.48,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('65015963',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-10','2023-02-10 08:06:00','2023-02-10 12:10:00','','2023-02-10 12:26:00','2023-02-10 17:57:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('206731036',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-13','2023-02-13 08:08:00','2023-02-13 12:21:00','','2023-02-13 12:31:00','2023-02-13 20:24:00','',0.13333333333333,0,7.87,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('433594864',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-14','2023-02-14 08:18:00','2023-02-14 12:13:00','','2023-02-14 12:24:00','2023-02-14 18:39:00','',0.3,0,7.7,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('899487501',0,'84','VIRTUDAZO, JOSHUA SALVE','2023-02-15','2023-02-15 08:20:00','2023-02-15 12:32:00','','2023-02-15 12:53:00','2023-02-15 17:13:00','',0.33333333333333,0,7.67,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('106819366',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-01','2023-02-01 07:51:00','2023-02-01 00:00:00','','2023-02-01 00:00:00','2023-02-01 17:43:00','',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('357008986',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-02','2023-02-02 07:45:00','2023-02-02 00:00:00','','2023-02-02 12:55:00','2023-02-02 17:06:00','',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('443554777',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-03','2023-02-03 07:55:00',NULL,'','2023-02-03 17:22:39',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1765319458',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-06','2023-02-06 07:48:00','2023-02-06 00:00:00','','2023-02-06 00:00:00','2023-02-06 18:15:00','',0,0,0,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('327937935',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-07','2023-02-07 08:03:00','2023-02-07 00:00:00','','2023-02-07 00:00:00','2023-02-07 17:47:00','',0,0,0,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1936372614',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-08',NULL,'2023-02-08 12:05:04','','2023-02-08 12:50:16','2023-02-08 17:32:00','',0,0,4,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1129624214',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-09','2023-02-09 08:01:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('404958671',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-10','2023-02-10 08:14:00','2023-02-10 00:00:00','','2023-02-10 00:00:00','2023-02-10 17:53:00','',0,0,0,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2085663145',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-13','2023-02-13 08:08:00','2023-02-13 12:24:50','',NULL,NULL,'',0.13333333333333,0,3.87,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('207524424',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-14','2023-02-14 07:42:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('368889862',0,'85','BINGOY, JHEY - AR PAGALAN','2023-02-15',NULL,'2023-02-15 12:14:20','','2023-02-15 12:40:35',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1840001151',0,'86','CACULBA, ROCHELLE LUA','2023-02-01','2023-02-01 07:09:18','2023-02-01 12:06:07','','2023-02-01 12:36:25','2023-02-01 17:01:10','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1050077807',0,'86','CACULBA, ROCHELLE LUA','2023-02-02','2023-02-02 07:29:18','2023-02-02 12:20:18','','2023-02-02 12:31:08','2023-02-02 19:07:26','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1115381615',0,'86','CACULBA, ROCHELLE LUA','2023-02-03','2023-02-03 07:54:58','2023-02-03 12:04:18','','2023-02-03 12:15:34','2023-02-03 15:49:04','',0,1.1666666666666667,6.83,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('188668926',0,'86','CACULBA, ROCHELLE LUA','2023-02-06','2023-02-06 08:28:20','2023-02-06 12:00:23','','2023-02-06 12:10:36','2023-02-06 17:35:41','',0.4666666666666667,0,7.529999999999999,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('851676490',0,'86','CACULBA, ROCHELLE LUA','2023-02-07','2023-02-07 08:26:57','2023-02-07 12:04:59','','2023-02-07 12:16:21','2023-02-07 17:03:25','',0.43333333333333335,0,7.57,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1934132901',0,'86','CACULBA, ROCHELLE LUA','2023-02-08',NULL,NULL,'','2023-02-08 13:01:24','2023-02-08 17:47:48','',0.016666666666666666,0,3.98,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1616820613',0,'86','CACULBA, ROCHELLE LUA','2023-02-09','2023-02-09 08:37:58','2023-02-09 12:00:35','','2023-02-09 12:11:00','2023-02-09 18:15:56','',0.6166666666666667,0,7.38,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1792621421',0,'86','CACULBA, ROCHELLE LUA','2023-02-10','2023-02-10 08:13:52','2023-02-10 12:01:12','','2023-02-10 12:17:52','2023-02-10 17:03:00','',0.21666666666666667,0,7.779999999999999,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('87504063',0,'86','CACULBA, ROCHELLE LUA','2023-02-13','2023-02-13 07:27:34','2023-02-13 12:03:12','','2023-02-13 12:15:39','2023-02-13 18:13:46','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('899917800',0,'86','CACULBA, ROCHELLE LUA','2023-02-14','2023-02-14 08:12:51','2023-02-14 12:06:50','','2023-02-14 12:18:15','2023-02-14 18:50:53','',0.2,0,7.8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1546867483',0,'86','CACULBA, ROCHELLE LUA','2023-02-15','2023-02-15 07:52:20','2023-02-15 12:00:24','','2023-02-15 12:11:35','2023-02-15 17:37:58','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1877515586',0,'87','BILOCURA, EDSON BORLADO','2023-02-01','2023-02-01 07:55:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('787330162',0,'87','BILOCURA, EDSON BORLADO','2023-02-02','2023-02-02 07:59:00','2023-02-02 12:10:10','','2023-02-02 12:25:27',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1711539027',0,'87','BILOCURA, EDSON BORLADO','2023-02-03',NULL,'2023-02-03 12:09:02','','2023-02-03 12:19:32','2023-02-03 17:23:00','',0,0,4,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1758825216',0,'87','BILOCURA, EDSON BORLADO','2023-02-06','2023-02-06 07:30:00','2023-02-06 12:24:00','','2023-02-06 00:00:00','2023-02-06 17:39:00','',0,0,4,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1085020146',0,'87','BILOCURA, EDSON BORLADO','2023-02-07','2023-02-07 07:53:00','2023-02-07 12:06:00','','2023-02-07 12:21:00','2023-02-07 17:30:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1012457905',0,'87','BILOCURA, EDSON BORLADO','2023-02-09','2023-02-09 08:02:00','2023-02-09 12:05:00','','2023-02-09 12:16:00','2023-02-09 17:30:00','',0.033333333333333,0,7.97,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('572668351',0,'87','BILOCURA, EDSON BORLADO','2023-02-10','2023-02-10 07:54:00','2023-02-10 12:17:00','','2023-02-10 00:00:00','2023-02-10 17:25:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1789857491',0,'87','BILOCURA, EDSON BORLADO','2023-02-13','2023-02-13 07:57:00','2023-02-13 12:01:00','','2023-02-13 13:04:00','2023-02-13 17:12:00','',0.066666666666667,0,7.93,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1440530134',0,'87','BILOCURA, EDSON BORLADO','2023-02-14','2023-02-14 07:51:00','2023-02-14 12:15:00','','2023-02-14 12:26:00','2023-02-14 18:50:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('210051271',0,'87','BILOCURA, EDSON BORLADO','2023-02-15','2023-02-15 08:13:00','2023-02-15 12:06:00','','2023-02-15 12:19:00','2023-02-15 17:37:00','',0.21666666666667,0,7.78,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1251191590',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-01','2023-02-01 07:49:00','2023-02-01 12:09:00','','2023-02-01 12:19:00','2023-02-01 17:32:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('227195718',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-02','2023-02-02 07:59:00','2023-02-02 12:36:00','','2023-02-02 12:53:00','2023-02-02 17:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('70422741',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-03','2023-02-03 08:09:00','2023-02-03 12:00:00','','2023-02-03 12:56:00','2023-02-03 17:18:00','',0.15,0,7.85,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('912304335',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-06','2023-02-06 07:54:00','2023-02-06 12:18:00','','2023-02-06 12:34:00','2023-02-06 17:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1960262522',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-07','2023-02-07 08:20:00','2023-02-07 12:11:00','','2023-02-07 12:25:00','2023-02-07 17:06:00','',0.33333333333333,0,7.67,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1608015292',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-08','2023-02-08 07:55:00','2023-02-08 12:11:00','','2023-02-08 12:22:00','2023-02-08 17:18:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1154098304',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-09','2023-02-09 08:11:00','2023-02-09 12:09:00','','2023-02-09 12:19:00','2023-02-09 17:20:00','',0.18333333333333,0,7.82,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('340838675',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-10','2023-02-10 07:27:00','2023-02-10 12:00:00','','2023-02-10 12:12:00','2023-02-10 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('593873788',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-13','2023-02-13 07:58:00','2023-02-13 12:29:00','','2023-02-13 12:39:00','2023-02-13 17:13:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('789547920',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-14','2023-02-14 08:00:00','2023-02-14 12:05:00','','2023-02-14 12:44:00','2023-02-14 18:30:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('897034427',0,'89','DE LEON, VANESSA ARANOUQUE','2023-02-15','2023-02-15 07:51:00','2023-02-15 12:19:00','','2023-02-15 12:31:00','2023-02-15 17:02:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1236119121',0,'9','BABATID, GUADALUPE INSON','2023-02-01','2023-02-01 08:07:00','2023-02-01 12:12:00','','2023-02-01 00:00:00','2023-02-01 17:04:00','',0.23333333333333,0,7.76,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1573633272',0,'9','BABATID, GUADALUPE INSON','2023-02-02','2023-02-02 07:47:00','2023-02-02 12:28:00','','2023-02-02 12:45:00','2023-02-02 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1671791967',0,'9','BABATID, GUADALUPE INSON','2023-02-13','2023-02-13 07:48:00','2023-02-13 12:05:00','','2023-02-13 12:40:00','2023-02-13 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('603043323',0,'9','BABATID, GUADALUPE INSON','2023-02-14','2023-02-14 08:07:00',NULL,'','2023-02-14 12:41:16',NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('830119047',0,'9','BABATID, GUADALUPE INSON','2023-02-15','2023-02-15 08:05:00','2023-02-15 12:44:00','','2023-02-15 12:56:00','2023-02-15 16:30:00','',0.083333333333333,0.48333333333333,7.44,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1052701062',0,'90','ABULE, RODEL MAMONTAYAO','2023-02-13','2023-02-13 08:05:00','2023-02-13 12:00:00','','2023-02-13 12:11:00','2023-02-13 17:01:00','',0.083333333333333,0,7.92,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('588415703',0,'90','ABULE, RODEL MAMONTAYAO','2023-02-14','2023-02-14 08:23:00','2023-02-14 12:01:00','','2023-02-14 12:11:00','2023-02-14 17:00:00','',0.38333333333333,0,7.62,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1589912712',0,'90','ABULE, RODEL MAMONTAYAO','2023-02-15','2023-02-15 08:17:00','2023-02-15 12:02:00','','2023-02-15 12:16:00','2023-02-15 17:03:00','',0.28333333333333,0,7.72,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('384788407',0,'91','COSCOS, NERILYN AVERGONZADO','2023-02-01',NULL,NULL,'',NULL,'2023-02-01 18:11:00','',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1797115389',0,'91','COSCOS, NERILYN AVERGONZADO','2023-02-06','2023-02-06 08:04:00','2023-02-06 00:00:00','','2023-02-06 00:00:00','2023-02-06 17:01:00','',0,0,0,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('327493944',0,'91','COSCOS, NERILYN AVERGONZADO','2023-02-08','2023-02-08 08:23:00','2023-02-08 00:00:00','','2023-02-08 00:00:00','2023-02-08 17:07:00','',0,0,0,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1626409223',0,'91','COSCOS, NERILYN AVERGONZADO','2023-02-09',NULL,NULL,'',NULL,'2023-02-09 17:29:00','',0,0,0,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('2083287549',0,'91','COSCOS, NERILYN AVERGONZADO','2023-02-10',NULL,NULL,'',NULL,'2023-02-10 17:03:00','',0,0,0,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('875777329',0,'91','COSCOS, NERILYN AVERGONZADO','2023-02-12','2023-02-12 10:30:00','2023-02-12 00:00:00','','2023-02-12 00:00:00','2023-02-12 15:07:00','',0,0,0,'0','','','','','','','',0,'2023-02-12 08:00:00','2023-02-12 17:00:00','regular','N/A','N/A',0,0),('1274857374',0,'91','COSCOS, NERILYN AVERGONZADO','2023-02-13',NULL,NULL,'',NULL,'2023-02-13 21:41:00','',0,0,0,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('689345746',0,'92','REGO, MARY CAL','2023-02-01',NULL,NULL,'','2023-02-01 12:06:32','2023-02-01 18:11:00','',0,0,4,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('455392752',0,'92','REGO, MARY CAL','2023-02-03',NULL,NULL,'',NULL,'2023-02-03 17:36:00','',0,0,0,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('410253050',0,'92','REGO, MARY CAL','2023-02-06','2023-02-06 10:31:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1299930051',0,'92','REGO, MARY CAL','2023-02-07','2023-02-07 09:39:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('23720828',0,'92','REGO, MARY CAL','2023-02-12','2023-02-12 10:30:00','2023-02-12 00:00:00','','2023-02-12 00:00:00','2023-02-12 15:06:00','',0,0,0,'0','','','','','','','',0,'2023-02-12 08:00:00','2023-02-12 17:00:00','regular','N/A','N/A',0,0),('866585109',0,'92','REGO, MARY CAL','2023-02-15',NULL,NULL,'',NULL,'2023-02-15 17:59:00','',0,0,0,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('704396266',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-01','2023-02-01 07:30:00','2023-02-01 12:01:00','','2023-02-01 12:33:00','2023-02-01 17:15:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('1879223346',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-02','2023-02-02 08:10:00','2023-02-02 12:01:00','','2023-02-02 12:14:00','2023-02-02 17:08:00','',0.16666666666667,0,7.83,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('963394027',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-03','2023-02-03 08:20:00','2023-02-03 12:03:00','','2023-02-03 12:17:00','2023-02-03 17:05:00','',0.33333333333333,0,7.67,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1624687134',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-06','2023-02-06 07:31:00','2023-02-06 12:10:00','','2023-02-06 12:25:00','2023-02-06 17:26:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1357970110',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-07','2023-02-07 07:48:00','2023-02-07 12:05:00','','2023-02-07 12:19:00','2023-02-07 17:14:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('274453825',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-08','2023-02-08 07:44:00','2023-02-08 12:07:00','','2023-02-08 12:27:00','2023-02-08 17:30:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('861044815',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-09','2023-02-09 07:58:00','2023-02-09 12:08:00','','2023-02-09 12:27:00','2023-02-09 17:26:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('779276367',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-10','2023-02-10 07:59:00','2023-02-10 12:02:00','','2023-02-10 12:19:00','2023-02-10 17:56:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2070069258',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-13','2023-02-13 07:53:00','2023-02-13 12:22:13','','2023-02-13 12:34:04',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1379517592',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-14','2023-02-14 07:36:00','2023-02-14 12:00:00','','2023-02-14 12:27:00','2023-02-14 18:29:00','',0,0,8,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('2023199275',0,'93','LAMPAGO, JOECENETH PRIETO','2023-02-15','2023-02-15 08:05:00','2023-02-15 12:04:00','','2023-02-15 12:16:00','2023-02-15 17:22:00','',0.083333333333333,0,7.92,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('229754313',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-01','2023-02-01 07:14:00','2023-02-01 12:03:41','','2023-02-01 12:44:22',NULL,'',0,0,4,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('792249211',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-02','2023-02-02 09:03:00','2023-02-02 12:59:00','','2023-02-02 13:10:00','2023-02-02 17:22:00','',1.2166666666667,0,6.78,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1905854816',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-03','2023-02-03 08:46:00','2023-02-03 12:04:32','','2023-02-03 12:15:43',NULL,'',0.76666666666667,0,3.23,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('492327441',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-06','2023-02-06 08:31:00','2023-02-06 12:53:00','','2023-02-06 13:04:00','2023-02-06 17:06:00','',0.58333333333333,0,7.41,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1635992794',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-07','2023-02-07 08:42:00','2023-02-07 12:04:00','','2023-02-07 12:16:00','2023-02-07 17:36:00','',0.7,0,7.3,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1651660018',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-08','2023-02-08 08:10:00','2023-02-08 12:19:00','','2023-02-08 12:30:00','2023-02-08 17:00:00','',0.16666666666667,0,7.83,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('355481638',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-09','2023-02-09 08:58:00','2023-02-09 12:27:00','','2023-02-09 00:00:00','2023-02-09 17:17:00','',0.96666666666667,0,3.03,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('637900207',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-10','2023-02-10 08:37:00','2023-02-10 12:04:00','','2023-02-10 12:52:00','2023-02-10 17:02:00','',0.61666666666667,0,7.38,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('77850461',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-13','2023-02-13 07:58:00','2023-02-13 12:06:00','','2023-02-13 12:55:00','2023-02-13 18:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('480301732',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-14',NULL,'2023-02-14 12:11:38','','2023-02-14 13:00:01','2023-02-14 18:30:00','',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('2116069755',0,'94','PEDRABLANCA, STEPHANIE JANDAYAN','2023-02-15','2023-02-15 09:03:00','2023-02-15 12:01:00','','2023-02-15 12:58:00','2023-02-15 17:40:00','',1.05,0,6.95,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('349540407',0,'96','ALLAGA, JERAMIE ABIS','2023-02-13','2023-02-13 07:56:00','2023-02-13 12:47:00','','2023-02-13 12:59:00','2023-02-13 17:01:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1423470086',0,'96','ALLAGA, JERAMIE ABIS','2023-02-14','2023-02-14 07:41:00','2023-02-14 00:00:00','','2023-02-14 00:00:00','2023-02-14 17:37:00','',0,0,0,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1631195529',0,'96','ALLAGA, JERAMIE ABIS','2023-02-15','2023-02-15 07:47:00','2023-02-15 12:43:00','','2023-02-15 12:54:00','2023-02-15 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1708114631',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-01','2023-02-01 07:24:00','2023-02-01 12:04:00','','2023-02-01 12:33:00','2023-02-01 17:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('432842202',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-02','2023-02-02 07:58:00','2023-02-02 12:07:00','','2023-02-02 12:20:00','2023-02-02 17:00:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1489748835',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-03','2023-02-03 07:48:00','2023-02-03 12:07:00','','2023-02-03 12:20:00','2023-02-03 17:19:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('957978778',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-06','2023-02-06 08:33:00','2023-02-06 12:23:00','','2023-02-06 12:33:00','2023-02-06 17:34:00','',0.55,0,7.45,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('1878277199',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-07','2023-02-07 08:02:00','2023-02-07 12:07:00','','2023-02-07 12:21:00','2023-02-07 17:13:00','',0.033333333333333,0,7.97,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('209184827',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-08','2023-02-08 08:11:00','2023-02-08 12:05:00','','2023-02-08 12:23:00','2023-02-08 16:12:00','',0.18333333333333,0.78333333333333,7.04,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('21219020',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-09','2023-02-09 08:31:00','2023-02-09 12:08:00','','2023-02-09 12:20:00','2023-02-09 17:22:00','',0.51666666666667,0,7.48,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('1434572947',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-10','2023-02-10 08:06:00','2023-02-10 12:10:00','','2023-02-10 12:25:00','2023-02-10 17:57:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1758743700',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-13','2023-02-13 08:06:00','2023-02-13 12:02:00','','2023-02-13 12:32:00','2023-02-13 17:13:00','',0.1,0,7.9,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('15372070',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-14','2023-02-14 08:18:00','2023-02-14 12:13:00','','2023-02-14 12:24:00','2023-02-14 18:39:00','',0.3,0,7.7,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1679916585',0,'97','QUIMBO, ANA MARIE GEMAO','2023-02-15','2023-02-15 08:18:00','2023-02-15 12:06:00','','2023-02-15 12:19:00','2023-02-15 17:14:00','',0.3,0,7.7,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1469541500',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-01','2023-02-01 07:22:00','2023-02-01 12:00:00','','2023-02-01 12:11:00','2023-02-01 17:04:00','',0,0,8,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('117391695',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-02','2023-02-02 07:37:00','2023-02-02 12:03:00','','2023-02-02 12:14:00','2023-02-02 17:07:00','',0,0,8,'0','','','','','','','',0,'2023-02-02 08:00:00','2023-02-02 17:00:00','regular','N/A','N/A',0,0),('1035881398',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-03','2023-02-03 07:53:00','2023-02-03 12:02:00','','2023-02-03 12:13:00','2023-02-03 17:06:00','',0,0,8,'0','','','','','','','',0,'2023-02-03 08:00:00','2023-02-03 17:00:00','regular','N/A','N/A',0,0),('1134035630',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-06','2023-02-06 07:35:00','2023-02-06 12:00:00','','2023-02-06 12:11:00','2023-02-06 17:06:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('467529857',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-07','2023-02-07 07:50:00','2023-02-07 12:01:00','','2023-02-07 12:13:00','2023-02-07 17:10:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('1095722333',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-08','2023-02-08 07:50:00','2023-02-08 12:00:00','','2023-02-08 12:14:00','2023-02-08 17:05:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1674274956',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-09','2023-02-09 07:52:00','2023-02-09 12:00:00','','2023-02-09 12:12:00','2023-02-09 17:11:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('847977010',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-10','2023-02-10 07:45:00','2023-02-10 12:00:00','','2023-02-10 12:12:00','2023-02-10 17:14:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('2098954769',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-13','2023-02-13 07:45:00','2023-02-13 12:00:00','','2023-02-13 12:11:00','2023-02-13 17:03:00','',0,0,8,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('394230228',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-14','2023-02-14 07:57:00','2023-02-14 00:00:00','','2023-02-14 12:53:00','2023-02-14 18:35:00','',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('246174837',0,'98','SANCO, CHARLIEMAGNE JOYCE DELA - VEGA','2023-02-15','2023-02-15 07:55:00','2023-02-15 12:01:00','','2023-02-15 12:12:00','2023-02-15 17:40:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0),('1179205656',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-01','2023-02-01 07:42:00',NULL,'',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-01 08:00:00','2023-02-01 17:00:00','regular','N/A','N/A',0,0),('430093806',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-06','2023-02-06 07:59:00','2023-02-06 12:54:00','','2023-02-06 00:00:00','2023-02-06 17:09:00','',0,0,8,'0','','','','','','','',0,'2023-02-06 08:00:00','2023-02-06 17:00:00','regular','N/A','N/A',0,0),('505906675',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-07','2023-02-07 07:38:00','2023-02-07 12:01:00','','2023-02-07 12:45:00','2023-02-07 17:08:00','',0,0,8,'0','','','','','','','',0,'2023-02-07 08:00:00','2023-02-07 17:00:00','regular','N/A','N/A',0,0),('2056845999',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-08','2023-02-08 07:48:00','2023-02-08 12:02:00','','2023-02-08 12:31:00','2023-02-08 17:05:00','',0,0,8,'0','','','','','','','',0,'2023-02-08 08:00:00','2023-02-08 17:00:00','regular','N/A','N/A',0,0),('1454730200',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-09','2023-02-09 07:37:00','2023-02-09 12:01:00','','2023-02-09 12:43:00','2023-02-09 17:12:00','',0,0,8,'0','','','','','','','',0,'2023-02-09 08:00:00','2023-02-09 17:00:00','regular','N/A','N/A',0,0),('797949143',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-10','2023-02-10 07:54:00','2023-02-10 12:03:00','','2023-02-10 12:48:00','2023-02-10 18:47:00','',0,0,8,'0','','','','','','','',0,'2023-02-10 08:00:00','2023-02-10 17:00:00','regular','N/A','N/A',0,0),('1628792989',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-11','2023-02-11 08:23:00','2023-02-11 00:00:00','','2023-02-11 00:00:00','2023-02-11 17:01:00','',0,0,0,'0','','','','','','','',0,'2023-02-11 08:00:00','2023-02-11 17:00:00','regular','N/A','N/A',0,0),('1279893855',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-12',NULL,'2023-02-12 08:08:34','',NULL,NULL,'',0,0,0,'0','','','','','','','',0,'2023-02-12 08:00:00','2023-02-12 17:00:00','regular','N/A','N/A',0,0),('1453161197',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-13','2023-02-13 07:47:00','2023-02-13 12:23:00','','2023-02-13 00:00:00','2023-02-13 17:02:00','',0,0,4,'0','','','','','','','',0,'2023-02-13 08:00:00','2023-02-13 17:00:00','regular','N/A','N/A',0,0),('1678980470',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-14','2023-02-14 07:51:00','2023-02-14 12:42:00','','2023-02-14 00:00:00','2023-02-14 18:36:00','',0,0,4,'0','','','','','','','',0,'2023-02-14 08:00:00','2023-02-14 17:00:00','regular','N/A','N/A',0,0),('1137002933',0,'99','BUSTAMANTE, JESSIE KAREN CORPORAL','2023-02-15','2023-02-15 07:56:00','2023-02-15 12:01:00','','2023-02-15 12:47:00','2023-02-15 17:12:00','',0,0,8,'0','','','','','','','',0,'2023-02-15 08:00:00','2023-02-15 17:00:00','regular','N/A','N/A',0,0);

/*Table structure for table `hr_emp_leave_type` */

DROP TABLE IF EXISTS `hr_emp_leave_type`;

CREATE TABLE `hr_emp_leave_type` (
  `leave_number` int(11) NOT NULL AUTO_INCREMENT,
  `leave_code` varchar(255) DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `withPay` tinyint(1) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leave_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `hr_emp_leave_type` */

insert  into `hr_emp_leave_type`(`leave_number`,`leave_code`,`leave_type`,`withPay`,`remarks`) values (1,'VL','VACATION LEAVE',1,''),(2,'SL','SICK LEAVE',1,''),(3,'ML','MATERNITY LEAVE',1,''),(5,'BL','BIRTHDAY LEAVE',0,''),(6,'PL','PATERNITY LEAVE',1,''),(7,'SPL','SPECIAL LEAVE',1,''),(8,'FL','FORCED LEAVE',1,''),(9,'VLWOP','VACATION LEAVE W/O PAY',1,''),(10,'SLWOP','SICK LEAVE W/O PAY',1,''),(11,'PARL','PARENTAL LEAVE',1,''),(12,'MCL','MAGNA CARTA LEAVE',1,''),(13,'SPLWOP','SPECIAL LEAVE W/O PAY',0,'');

/*Table structure for table `hr_emp_leaves` */

DROP TABLE IF EXISTS `hr_emp_leaves`;

CREATE TABLE `hr_emp_leaves` (
  `leave_id` int(11) DEFAULT NULL,
  `leave_date` date NOT NULL,
  `leave_date_applied` date DEFAULT NULL,
  `leave_length_days` double DEFAULT NULL,
  `leave_type_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `leave_status` tinyint(1) DEFAULT 0 COMMENT '''0 - pending approval,1 - rejected,2 - canceled,3 - scheduled, approved,4 - taken',
  `leave_remarks` varchar(100) DEFAULT NULL,
  `leave_pay_type` enum('wp','wop') DEFAULT 'wp',
  `leave_rem_vl` double DEFAULT NULL,
  `leave_rem_sl` double DEFAULT NULL,
  `approver_id` int(11) DEFAULT NULL,
  `approver_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`leave_date`,`leave_type_id`,`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hr_emp_leaves` */

/*Table structure for table `hr_emp_monthly_dtr` */

DROP TABLE IF EXISTS `hr_emp_monthly_dtr`;

CREATE TABLE `hr_emp_monthly_dtr` (
  `emp_number` int(11) DEFAULT NULL,
  `dtr_month_date` varchar(20) DEFAULT NULL,
  `dtr_day` date DEFAULT NULL,
  `in_am` varchar(50) DEFAULT NULL,
  `out_am` varchar(50) DEFAULT NULL,
  `in_pm` varchar(50) DEFAULT NULL,
  `out_pm` varchar(50) DEFAULT NULL,
  `late` varchar(5) DEFAULT NULL,
  `undertime` varchar(5) DEFAULT NULL,
  `hours_work` varchar(5) DEFAULT NULL,
  `dtr_remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hr_emp_monthly_dtr` */

insert  into `hr_emp_monthly_dtr`(`emp_number`,`dtr_month_date`,`dtr_day`,`in_am`,`out_am`,`in_pm`,`out_pm`,`late`,`undertime`,`hours_work`,`dtr_remarks`) values (1,'February, 2023','2023-02-07','07:42','12:14','12:24','05:09','0','0','8',''),(1,'February, 2023','2023-02-08','07:51','12:18','12:29','06:02','0','0','8',''),(1,'February, 2023','2023-02-02','07:52','12:09','12:19','05:45','0','0','8',''),(1,'February, 2023','2023-02-04','','','','','0','0','0',''),(1,'February, 2023','2023-02-03','07:38','12:07','12:17','05:34','0','0','8',''),(1,'February, 2023','2023-02-06','07:54','12:11','12:21','07:16','0','0','8',''),(1,'February, 2023','2023-02-11','','','','','0','0','0',''),(1,'February, 2023','2023-02-13','08:06','12:23','12:33','06:40','0','0','8',''),(1,'February, 2023','2023-02-10','','','','','0','0','0',''),(1,'February, 2023','2023-02-14','','','','','0','0','0',''),(1,'February, 2023','2023-02-15','','','','','0','0','0',''),(1,'February, 2023','2023-02-05','','','','','0','0','0',''),(1,'February, 2023','2023-02-12','','','','','0','0','0',''),(1,'February, 2023','2023-02-01','07:02','12:04','12:40','05:17','0','0','8',''),(1,'February, 2023','2023-02-09','07:38','12:29','','','0','0','4',''),(2,'February, 2023','2023-02-07','08:25','12:03','12:59','06:46','0','0','8',''),(2,'February, 2023','2023-02-08','','','','','0','0','0',''),(2,'February, 2023','2023-02-02','08:04','12:08','12:00','01:00','0','0','4',''),(2,'February, 2023','2023-02-04','','','','','0','0','0',''),(2,'February, 2023','2023-02-03','07:33','12:03','12:59','05:34','0','0','8',''),(2,'February, 2023','2023-02-06','08:07','12:01','01:00','05:25','0','0','8',''),(2,'February, 2023','2023-02-11','','','','','0','0','0',''),(2,'February, 2023','2023-02-13','08:06','12:00','12:28','06:39','0','0','4',''),(2,'February, 2023','2023-02-10','08:10','12:01','12:59','06:14','0','0','8',''),(2,'February, 2023','2023-02-14','08:30','12:24','01:00','09:12','0','0','8',''),(2,'February, 2023','2023-02-15','08:31','12:05','01:02','08:43','1','0','7',''),(2,'February, 2023','2023-02-05','','','','','0','0','0',''),(2,'February, 2023','2023-02-12','','','','','0','0','0',''),(2,'February, 2023','2023-02-01','07:10','12:05','12:39','05:17','0','0','8',''),(2,'February, 2023','2023-02-09','08:09','12:29','12:57','06:26','0','0','8',''),(3,'February, 2023','2023-02-07','07:49','12:03','12:26','05:00','0','0','8',''),(3,'February, 2023','2023-02-08','07:51','12:09','12:23','05:01','0','0','8',''),(3,'February, 2023','2023-02-02','07:48','12:03','12:21','05:00','0','0','8',''),(3,'February, 2023','2023-02-04','','','','','0','0','0',''),(3,'February, 2023','2023-02-03','07:50','12:07','12:19','05:01','0','0','8',''),(3,'February, 2023','2023-02-06','07:41','12:11','12:21','05:00','0','0','8',''),(3,'February, 2023','2023-02-11','','','','','0','0','0',''),(3,'February, 2023','2023-02-13','07:49','12:15','12:27','','0','0','4',''),(3,'February, 2023','2023-02-10','07:50','12:35','12:46','05:04','0','0','8',''),(3,'February, 2023','2023-02-14','07:48','12:12','12:25','06:35','0','0','8',''),(3,'February, 2023','2023-02-15','07:56','12:00','12:00','05:00','0','0','4',''),(3,'February, 2023','2023-02-05','','','01:55','','0','0','0',''),(3,'February, 2023','2023-02-12','','','','','0','0','0',''),(3,'February, 2023','2023-02-01','07:38','12:29','12:00','05:01','0','0','4',''),(3,'February, 2023','2023-02-09','07:44','12:12','12:00','05:01','0','0','4',''),(6,'February, 2023','2023-02-07','','','','','0','0','0',''),(6,'February, 2023','2023-02-08','09:22','12:09','12:22','05:19','1','0','7',''),(6,'February, 2023','2023-02-02','08:49','12:09','12:25','05:00','1','0','7',''),(6,'February, 2023','2023-02-04','','','','','0','0','0',''),(6,'February, 2023','2023-02-03','08:43','12:00','12:00','05:23','0','0','0',''),(6,'February, 2023','2023-02-06','09:16','12:24','12:36','05:39','1','0','7',''),(6,'February, 2023','2023-02-11','09:42','10:14','','','2','2','1',''),(6,'February, 2023','2023-02-13','','','','','0','0','0',''),(6,'February, 2023','2023-02-10','09:02','12:06','12:16','05:25','1','0','7',''),(6,'February, 2023','2023-02-14','09:23','12:15','12:25','06:50','1','0','7',''),(6,'February, 2023','2023-02-15','08:00','12:06','12:02','05:37','0','0','8',''),(6,'February, 2023','2023-02-05','','','','','0','0','0',''),(6,'February, 2023','2023-02-12','','','','','0','0','0',''),(6,'February, 2023','2023-02-01','09:06','12:00','12:00','05:08','0','0','0',''),(6,'February, 2023','2023-02-09','09:02','12:16','12:00','05:30','2','0','6',''),(8,'February, 2023','2023-02-07','07:44','12:12','12:00','07:06','0','0','4',''),(8,'February, 2023','2023-02-08','08:05','12:00','12:00','05:36','0','0','0',''),(8,'February, 2023','2023-02-02','07:57','12:00','12:00','05:05','0','0','0',''),(8,'February, 2023','2023-02-04','','','','','0','0','0',''),(8,'February, 2023','2023-02-03','08:45','12:16','12:00','05:06','1','0','3',''),(8,'February, 2023','2023-02-06','08:05','12:06','12:19','05:05','0','0','8',''),(8,'February, 2023','2023-02-11','','','','','0','0','0',''),(8,'February, 2023','2023-02-13','08:21','12:00','12:00','05:23','0','0','0',''),(8,'February, 2023','2023-02-10','08:23','12:00','12:00','05:08','0','0','0',''),(8,'February, 2023','2023-02-14','08:01','12:00','12:00','05:20','0','0','0',''),(8,'February, 2023','2023-02-15','09:35','12:00','12:00','05:54','0','0','0',''),(8,'February, 2023','2023-02-05','','','','','0','0','0',''),(8,'February, 2023','2023-02-12','','','','','0','0','0',''),(8,'February, 2023','2023-02-01','07:55','12:00','12:00','05:14','0','0','0',''),(8,'February, 2023','2023-02-09','07:52','12:00','12:00','05:40','0','0','0',''),(9,'February, 2023','2023-02-07','','','','','0','0','0',''),(9,'February, 2023','2023-02-08','','','','','0','0','0',''),(9,'February, 2023','2023-02-02','07:47','12:28','12:45','05:00','0','0','8',''),(9,'February, 2023','2023-02-04','','','','','0','0','0',''),(9,'February, 2023','2023-02-03','','','','','0','0','0',''),(9,'February, 2023','2023-02-06','','','','','0','0','0',''),(9,'February, 2023','2023-02-11','','','','','0','0','0',''),(9,'February, 2023','2023-02-13','07:48','12:05','12:40','05:00','0','0','8',''),(9,'February, 2023','2023-02-10','','','','','0','0','0',''),(9,'February, 2023','2023-02-14','08:07','','12:41','','0','0','0',''),(9,'February, 2023','2023-02-15','08:05','12:44','12:56','04:30','0','0','7',''),(9,'February, 2023','2023-02-05','','','','','0','0','0',''),(9,'February, 2023','2023-02-12','','','','','0','0','0',''),(9,'February, 2023','2023-02-01','08:07','12:12','12:00','05:04','0','0','8',''),(9,'February, 2023','2023-02-09','','','','','0','0','0',''),(10,'February, 2023','2023-02-07','08:47','12:03','12:13','05:54','1','0','7',''),(10,'February, 2023','2023-02-08','08:13','12:04','12:14','05:04','0','0','8',''),(10,'February, 2023','2023-02-02','07:28','12:01','12:11','05:50','0','0','8',''),(10,'February, 2023','2023-02-04','','','','','0','0','0',''),(10,'February, 2023','2023-02-03','','','','','0','0','0',''),(10,'February, 2023','2023-02-06','08:24','12:04','12:14','05:39','0','0','8',''),(10,'February, 2023','2023-02-11','','','','','0','0','0',''),(10,'February, 2023','2023-02-13','07:26','12:00','12:50','06:13','0','0','4',''),(10,'February, 2023','2023-02-10','08:23','12:03','12:00','05:03','0','0','4',''),(10,'February, 2023','2023-02-14','08:14','12:10','12:20','06:35','0','0','8',''),(10,'February, 2023','2023-02-15','08:17','12:00','12:26','05:31','0','0','4',''),(10,'February, 2023','2023-02-05','','','','','0','0','0',''),(10,'February, 2023','2023-02-12','','','','','0','0','0',''),(10,'February, 2023','2023-02-01','07:14','12:04','12:42','05:56','0','0','8',''),(10,'February, 2023','2023-02-09','','','','','0','0','0',''),(11,'February, 2023','2023-02-07','08:17','12:00','01:16','05:00','1','0','7',''),(11,'February, 2023','2023-02-08','07:58','12:00','12:00','05:00','0','0','4',''),(11,'February, 2023','2023-02-02','08:00','12:00','12:00','05:00','0','0','4',''),(11,'February, 2023','2023-02-04','','','','','0','0','0',''),(11,'February, 2023','2023-02-03','08:35','12:02','01:38','05:04','1','0','7',''),(11,'February, 2023','2023-02-06','08:07','12:02','01:30','05:00','1','0','7',''),(11,'February, 2023','2023-02-11','','','','','0','0','0',''),(11,'February, 2023','2023-02-13','08:07','12:00','01:19','05:01','0','0','8',''),(11,'February, 2023','2023-02-10','08:03','12:02','12:24','','0','0','4',''),(11,'February, 2023','2023-02-14','07:59','12:00','12:00','05:06','0','0','0',''),(11,'February, 2023','2023-02-15','08:34','12:03','12:57','05:00','1','0','7',''),(11,'February, 2023','2023-02-05','','','','','0','0','0',''),(11,'February, 2023','2023-02-12','','','','','0','0','0',''),(11,'February, 2023','2023-02-01','07:46','12:00','12:00','05:02','0','0','4',''),(11,'February, 2023','2023-02-09','08:31','12:00','01:18','05:00','1','0','7',''),(12,'February, 2023','2023-02-07','08:16','12:06','12:19','05:30','0','0','8',''),(12,'February, 2023','2023-02-08','08:27','12:20','12:30','','0','0','4',''),(12,'February, 2023','2023-02-02','','','','','0','0','0',''),(12,'February, 2023','2023-02-04','','','','','0','0','0',''),(12,'February, 2023','2023-02-03','','','','','0','0','0',''),(12,'February, 2023','2023-02-06','','','','','0','0','0',''),(12,'February, 2023','2023-02-11','07:14','','','','0','0','0',''),(12,'February, 2023','2023-02-13','','','','','0','0','0',''),(12,'February, 2023','2023-02-10','08:21','12:06','12:17','05:25','0','0','8',''),(12,'February, 2023','2023-02-14','08:20','12:00','12:25','06:50','0','0','4',''),(12,'February, 2023','2023-02-15','','','12:13','','0','0','0',''),(12,'February, 2023','2023-02-05','','','','','0','0','0',''),(12,'February, 2023','2023-02-12','','','','','0','0','0',''),(12,'February, 2023','2023-02-01','07:30','12:11','12:30','05:08','0','0','8',''),(12,'February, 2023','2023-02-09','08:10','12:05','12:17','05:30','0','0','8',''),(13,'February, 2023','2023-02-07','07:24','12:08','12:21','05:30','0','0','8',''),(13,'February, 2023','2023-02-08','07:51','12:19','12:30','05:29','0','0','8',''),(13,'February, 2023','2023-02-02','07:54','12:09','12:25','05:00','0','0','8',''),(13,'February, 2023','2023-02-04','07:04','','','','0','0','0',''),(13,'February, 2023','2023-02-03','07:37','12:09','12:19','05:23','0','0','8',''),(13,'February, 2023','2023-02-06','07:31','12:04','12:14','05:29','0','0','8',''),(13,'February, 2023','2023-02-11','07:07','12:00','12:00','02:00','0','0','0',''),(13,'February, 2023','2023-02-13','07:24','12:39','12:50','05:13','0','0','8',''),(13,'February, 2023','2023-02-10','07:16','12:17','12:27','05:53','0','0','8',''),(13,'February, 2023','2023-02-14','07:22','12:14','12:26','06:49','0','0','8',''),(13,'February, 2023','2023-02-15','08:09','12:28','12:39','05:38','0','0','8',''),(13,'February, 2023','2023-02-05','','','','','0','0','0',''),(13,'February, 2023','2023-02-12','','','','','0','0','0',''),(13,'February, 2023','2023-02-01','07:20','12:04','12:23','05:21','0','0','8',''),(13,'February, 2023','2023-02-09','07:53','12:01','01:04','','0','0','4',''),(14,'February, 2023','2023-02-07','08:52','12:00','12:00','05:44','0','0','0',''),(14,'February, 2023','2023-02-08','08:49','12:08','12:00','06:44','1','0','3',''),(14,'February, 2023','2023-02-02','09:02','12:01','12:00','05:00','0','0','7',''),(14,'February, 2023','2023-02-04','','','','','0','0','0',''),(14,'February, 2023','2023-02-03','08:54','12:00','12:00','05:35','0','0','0',''),(14,'February, 2023','2023-02-06','09:13','12:00','12:00','05:39','0','0','0',''),(14,'February, 2023','2023-02-11','','','','','0','0','0',''),(14,'February, 2023','2023-02-13','','','','','0','0','0',''),(14,'February, 2023','2023-02-10','08:55','12:01','12:00','05:29','1','0','3',''),(14,'February, 2023','2023-02-14','','','','','0','0','0',''),(14,'February, 2023','2023-02-15','09:00','12:00','01:00','05:17','0','0','7',''),(14,'February, 2023','2023-02-05','','','','','0','0','0',''),(14,'February, 2023','2023-02-12','','','','','0','0','0',''),(14,'February, 2023','2023-02-01','08:38','12:08','','05:19','0','0','8',''),(14,'February, 2023','2023-02-09','09:11','12:00','12:00','05:39','0','0','0',''),(15,'February, 2023','2023-02-07','07:51','12:04','12:18','05:08','0','0','8',''),(15,'February, 2023','2023-02-08','07:52','12:04','12:14','05:04','0','0','8',''),(15,'February, 2023','2023-02-02','07:44','12:00','12:51','05:22','0','0','8',''),(15,'February, 2023','2023-02-04','','','','','0','0','0',''),(15,'February, 2023','2023-02-03','07:48','12:00','12:10','04:46','0','0','8',''),(15,'February, 2023','2023-02-06','07:43','12:00','12:10','05:11','0','0','8',''),(15,'February, 2023','2023-02-11','','','','','0','0','0',''),(15,'February, 2023','2023-02-13','07:28','12:01','12:48','06:07','0','0','8',''),(15,'February, 2023','2023-02-10','07:51','12:00','12:11','05:04','0','0','8',''),(15,'February, 2023','2023-02-14','07:45','12:00','12:11','06:04','0','0','8',''),(15,'February, 2023','2023-02-15','08:16','12:00','12:54','05:00','0','0','8',''),(15,'February, 2023','2023-02-05','','','','','0','0','0',''),(15,'February, 2023','2023-02-12','','','','','0','0','0',''),(15,'February, 2023','2023-02-01','07:15','12:00','12:27','05:00','0','0','8',''),(15,'February, 2023','2023-02-09','07:56','12:09','12:24','05:23','0','0','8',''),(19,'February, 2023','2023-02-07','','12:02','12:13','05:25','0','0','4',''),(19,'February, 2023','2023-02-08','08:40','12:02','12:13','05:06','1','0','7',''),(19,'February, 2023','2023-02-02','','','','','0','0','0',''),(19,'February, 2023','2023-02-04','','','','','0','0','0',''),(19,'February, 2023','2023-02-03','','','','','0','0','0',''),(19,'February, 2023','2023-02-06','08:32','12:23','12:34','05:23','1','0','7',''),(19,'February, 2023','2023-02-11','','','','','0','0','0',''),(19,'February, 2023','2023-02-13','07:21','','','','0','0','0',''),(19,'February, 2023','2023-02-10','08:32','12:00','12:00','05:29','0','0','0',''),(19,'February, 2023','2023-02-14','','','','','0','0','0',''),(19,'February, 2023','2023-02-15','','','','','0','0','0',''),(19,'February, 2023','2023-02-05','','','','','0','0','0',''),(19,'February, 2023','2023-02-12','','','','','0','0','0',''),(19,'February, 2023','2023-02-01','09:06','12:00','12:53','05:33','0','0','4',''),(19,'February, 2023','2023-02-09','07:34','12:08','12:18','05:21','0','0','8',''),(20,'February, 2023','2023-02-07','07:27','12:00','12:18','05:03','0','0','8',''),(20,'February, 2023','2023-02-08','07:13','12:00','12:21','05:23','0','0','8',''),(20,'February, 2023','2023-02-02','07:28','12:00','12:15','','0','0','4',''),(20,'February, 2023','2023-02-04','','','','','0','0','0',''),(20,'February, 2023','2023-02-03','07:33','12:02','12:15','05:07','0','0','8',''),(20,'February, 2023','2023-02-06','07:21','12:01','12:22','05:08','0','0','8',''),(20,'February, 2023','2023-02-11','','','','','0','0','0',''),(20,'February, 2023','2023-02-13','07:33','12:03','12:21','05:01','0','0','8',''),(20,'February, 2023','2023-02-10','07:17','12:00','12:15','05:18','0','0','8',''),(20,'February, 2023','2023-02-14','06:56','12:00','12:12','06:37','0','0','8',''),(20,'February, 2023','2023-02-15','08:58','12:02','12:25','','1','0','3',''),(20,'February, 2023','2023-02-05','','','','','0','0','0',''),(20,'February, 2023','2023-02-12','','','','','0','0','0',''),(20,'February, 2023','2023-02-01','07:19','12:01','12:29','05:01','0','0','8',''),(20,'February, 2023','2023-02-09','07:19','12:00','12:15','05:13','0','0','8',''),(21,'February, 2023','2023-02-07','07:47','12:13','12:25','05:06','0','0','8',''),(21,'February, 2023','2023-02-08','07:50','12:11','12:22','05:17','0','0','8',''),(21,'February, 2023','2023-02-02','07:51','12:37','12:53','05:11','0','0','8',''),(21,'February, 2023','2023-02-04','','','','','0','0','0',''),(21,'February, 2023','2023-02-03','08:09','12:00','12:57','05:18','0','0','8',''),(21,'February, 2023','2023-02-06','07:47','12:17','12:36','05:03','0','0','8',''),(21,'February, 2023','2023-02-11','','','','','0','0','0',''),(21,'February, 2023','2023-02-13','07:49','12:28','12:39','05:05','0','0','8',''),(21,'February, 2023','2023-02-10','07:52','12:00','12:12','05:09','0','0','8',''),(21,'February, 2023','2023-02-14','07:39','12:05','12:00','06:11','0','0','4',''),(21,'February, 2023','2023-02-15','08:12','12:19','12:31','05:02','0','0','8',''),(21,'February, 2023','2023-02-05','','','','','0','0','0',''),(21,'February, 2023','2023-02-12','','','','','0','0','0',''),(21,'February, 2023','2023-02-01','07:55','12:08','12:19','05:39','0','0','8',''),(21,'February, 2023','2023-02-09','07:51','12:09','12:20','05:12','0','0','8',''),(22,'February, 2023','2023-02-07','09:39','12:05','12:18','05:30','0','0','7',''),(22,'February, 2023','2023-02-08','08:08','12:20','12:30','05:19','0','0','8',''),(22,'February, 2023','2023-02-02','08:20','12:00','01:00','05:00','0','0','8',''),(22,'February, 2023','2023-02-04','','','','','0','0','0',''),(22,'February, 2023','2023-02-03','','','','','0','0','0',''),(22,'February, 2023','2023-02-06','08:33','12:24','12:36','05:39','0','0','8',''),(22,'February, 2023','2023-02-11','','','','','0','0','0',''),(22,'February, 2023','2023-02-13','','','','','0','0','0',''),(22,'February, 2023','2023-02-10','07:54','12:00','12:17','05:25','0','0','8',''),(22,'February, 2023','2023-02-14','08:00','12:15','12:25','06:50','0','0','8',''),(22,'February, 2023','2023-02-15','08:19','12:00','12:20','05:34','0','0','8',''),(22,'February, 2023','2023-02-05','','','','','0','0','0',''),(22,'February, 2023','2023-02-12','','','','','0','0','0',''),(22,'February, 2023','2023-02-01','','','','','0','0','0',''),(22,'February, 2023','2023-02-09','08:25','12:05','12:16','05:40','0','0','8',''),(23,'February, 2023','2023-02-07','07:40','12:00','12:12','05:03','0','0','8',''),(23,'February, 2023','2023-02-08','07:25','12:00','12:12','05:00','0','0','8',''),(23,'February, 2023','2023-02-02','08:14','12:01','12:11','05:04','0','0','8',''),(23,'February, 2023','2023-02-04','','','','','0','0','0',''),(23,'February, 2023','2023-02-03','07:39','12:04','12:15','05:07','0','0','8',''),(23,'February, 2023','2023-02-06','09:45','11:55','','','2','0','2',''),(23,'February, 2023','2023-02-11','','','','','0','0','0',''),(23,'February, 2023','2023-02-13','','','','','0','0','0',''),(23,'February, 2023','2023-02-10','07:46','12:02','12:17','05:03','0','0','8',''),(23,'February, 2023','2023-02-14','07:34','12:10','12:20','05:16','0','0','8',''),(23,'February, 2023','2023-02-15','07:49','12:00','12:10','05:04','0','0','8',''),(23,'February, 2023','2023-02-05','','','','','0','0','0',''),(23,'February, 2023','2023-02-12','','','','','0','0','0',''),(23,'February, 2023','2023-02-01','07:12','12:04','12:42','05:00','0','0','8',''),(23,'February, 2023','2023-02-09','07:21','12:00','12:10','05:02','0','0','8',''),(25,'February, 2023','2023-02-07','','','','','0','0','0',''),(25,'February, 2023','2023-02-08','08:23','12:03','12:16','05:16','0','0','8',''),(25,'February, 2023','2023-02-02','08:12','','','','0','0','0',''),(25,'February, 2023','2023-02-04','08:40','12:00','12:00','06:12','0','0','0',''),(25,'February, 2023','2023-02-03','08:00','12:06','01:29','06:00','0','0','8',''),(25,'February, 2023','2023-02-06','08:31','12:08','12:18','07:25','1','0','7',''),(25,'February, 2023','2023-02-11','09:11','11:52','01:57','08:54','2','0','6',''),(25,'February, 2023','2023-02-13','08:20','12:15','01:01','10:19','0','0','8',''),(25,'February, 2023','2023-02-10','08:30','12:07','12:55','05:58','0','0','8',''),(25,'February, 2023','2023-02-14','08:29','12:24','12:34','06:27','0','0','8',''),(25,'February, 2023','2023-02-15','09:33','12:00','12:33','05:54','2','0','6',''),(25,'February, 2023','2023-02-05','09:37','','','','0','0','0',''),(25,'February, 2023','2023-02-12','','','','07:45','0','0','0',''),(25,'February, 2023','2023-02-01','08:08','12:06','12:28','05:46','0','0','8',''),(25,'February, 2023','2023-02-09','08:25','12:01','12:12','05:44','0','0','8',''),(26,'February, 2023','2023-02-07','08:16','12:00','12:54','05:10','0','0','4',''),(26,'February, 2023','2023-02-08','08:28','12:04','12:15','05:13','0','0','8',''),(26,'February, 2023','2023-02-02','08:37','12:16','12:30','','1','0','3',''),(26,'February, 2023','2023-02-04','','','','','0','0','0',''),(26,'February, 2023','2023-02-03','','','','','0','0','0',''),(26,'February, 2023','2023-02-06','','','','','0','0','0',''),(26,'February, 2023','2023-02-11','07:27','10:10','','','0','2','2',''),(26,'February, 2023','2023-02-13','07:49','12:14','12:00','06:20','0','0','4',''),(26,'February, 2023','2023-02-10','08:20','12:00','12:11','05:14','0','0','8',''),(26,'February, 2023','2023-02-14','08:29','12:00','12:12','06:05','0','0','8',''),(26,'February, 2023','2023-02-15','08:14','12:00','01:11','05:26','0','0','4',''),(26,'February, 2023','2023-02-05','','','','','0','0','0',''),(26,'February, 2023','2023-02-12','','','','','0','0','0',''),(26,'February, 2023','2023-02-01','07:39','12:00','12:27','05:57','0','0','8',''),(26,'February, 2023','2023-02-09','08:23','12:23','12:34','05:17','0','0','8',''),(27,'February, 2023','2023-02-07','08:25','12:00','12:40','05:12','0','0','8',''),(27,'February, 2023','2023-02-08','','','','','0','0','0',''),(27,'February, 2023','2023-02-02','08:00','12:48','12:50','05:22','0','0','8',''),(27,'February, 2023','2023-02-04','','','','','0','0','0',''),(27,'February, 2023','2023-02-03','08:00','12:45','01:00','05:17','0','0','8',''),(27,'February, 2023','2023-02-06','08:45','12:00','12:45','05:00','0','0','7',''),(27,'February, 2023','2023-02-11','','','','','0','0','0',''),(27,'February, 2023','2023-02-13','08:20','12:00','12:15','05:05','0','0','8',''),(27,'February, 2023','2023-02-10','08:11','12:00','12:04','05:16','0','0','8',''),(27,'February, 2023','2023-02-14','09:00','12:34','12:50','05:00','0','0','7',''),(27,'February, 2023','2023-02-15','08:07','12:00','01:00','05:00','0','0','8',''),(27,'February, 2023','2023-02-05','','','','','0','0','0',''),(27,'February, 2023','2023-02-12','','','','','0','0','0',''),(27,'February, 2023','2023-02-01','08:38','12:25','12:00','05:19','1','0','3',''),(27,'February, 2023','2023-02-09','','','','','0','0','0',''),(29,'February, 2023','2023-02-07','07:54','12:26','12:40','07:02','0','0','8',''),(29,'February, 2023','2023-02-08','','','','','0','0','0',''),(29,'February, 2023','2023-02-02','07:07','12:06','12:17','07:06','0','0','8',''),(29,'February, 2023','2023-02-04','','','','','0','0','0',''),(29,'February, 2023','2023-02-03','07:01','12:02','12:13','07:14','0','0','8',''),(29,'February, 2023','2023-02-06','07:21','12:00','12:00','05:03','0','0','0',''),(29,'February, 2023','2023-02-11','','','','','0','0','0',''),(29,'February, 2023','2023-02-13','07:35','12:02','12:16','08:39','0','0','8',''),(29,'February, 2023','2023-02-10','07:52','12:00','01:03','06:23','0','0','8',''),(29,'February, 2023','2023-02-14','07:33','12:00','12:00','06:36','0','0','0',''),(29,'February, 2023','2023-02-15','07:52','12:10','12:27','05:09','0','0','8',''),(29,'February, 2023','2023-02-05','','','','','0','0','0',''),(29,'February, 2023','2023-02-12','','','','','0','0','0',''),(29,'February, 2023','2023-02-01','06:50','12:17','12:28','05:29','0','0','8',''),(29,'February, 2023','2023-02-09','07:55','12:35','12:58','05:33','0','0','8',''),(30,'February, 2023','2023-02-07','08:09','12:01','01:19','05:01','0','0','8',''),(30,'February, 2023','2023-02-08','08:09','12:03','01:06','05:04','0','0','8',''),(30,'February, 2023','2023-02-02','','','','','0','0','0',''),(30,'February, 2023','2023-02-04','','','','','0','0','0',''),(30,'February, 2023','2023-02-03','','','','','0','0','0',''),(30,'February, 2023','2023-02-06','06:36','12:58','01:13','05:04','0','0','8',''),(30,'February, 2023','2023-02-11','','','','','0','0','0',''),(30,'February, 2023','2023-02-13','07:54','12:00','12:58','05:00','0','0','8',''),(30,'February, 2023','2023-02-10','08:03','12:01','12:55','05:09','0','0','8',''),(30,'February, 2023','2023-02-14','06:25','12:32','','','0','0','4',''),(30,'February, 2023','2023-02-15','08:12','12:04','12:54','06:16','0','0','8',''),(30,'February, 2023','2023-02-05','','','','','0','0','0',''),(30,'February, 2023','2023-02-12','','','','','0','0','0',''),(30,'February, 2023','2023-02-01','','','','','0','0','0',''),(30,'February, 2023','2023-02-09','07:53','12:08','12:34','05:00','0','0','8',''),(32,'February, 2023','2023-02-07','06:11','12:00','12:11','08:15','0','0','8',''),(32,'February, 2023','2023-02-08','08:15','12:00','12:14','05:09','0','0','8',''),(32,'February, 2023','2023-02-02','','','','','0','0','0',''),(32,'February, 2023','2023-02-04','','','','','0','0','0',''),(32,'February, 2023','2023-02-03','08:21','12:11','12:21','08:00','0','0','8',''),(32,'February, 2023','2023-02-06','','','','','0','0','0',''),(32,'February, 2023','2023-02-11','','','','','0','0','0',''),(32,'February, 2023','2023-02-13','08:15','12:00','12:00','07:14','0','0','0',''),(32,'February, 2023','2023-02-10','08:32','12:34','12:50','06:50','1','0','7',''),(32,'February, 2023','2023-02-14','07:50','12:01','12:12','07:08','0','0','8',''),(32,'February, 2023','2023-02-15','08:47','12:00','12:00','05:35','0','0','0',''),(32,'February, 2023','2023-02-05','','','','','0','0','0',''),(32,'February, 2023','2023-02-12','','','','','0','0','0',''),(32,'February, 2023','2023-02-01','08:11','12:03','12:38','','0','0','4',''),(32,'February, 2023','2023-02-09','08:00','12:00','12:11','05:35','0','0','8',''),(33,'February, 2023','2023-02-07','07:43','12:17','12:33','05:30','0','0','8',''),(33,'February, 2023','2023-02-08','07:35','12:27','12:42','05:32','0','0','8',''),(33,'February, 2023','2023-02-02','','','','','0','0','0',''),(33,'February, 2023','2023-02-04','','','','','0','0','0',''),(33,'February, 2023','2023-02-03','','','','','0','0','0',''),(33,'February, 2023','2023-02-06','07:18','12:24','12:44','05:31','0','0','8',''),(33,'February, 2023','2023-02-11','08:31','12:00','12:00','05:27','0','0','0',''),(33,'February, 2023','2023-02-13','07:51','12:00','12:36','','0','0','4',''),(33,'February, 2023','2023-02-10','07:44','12:01','12:13','06:47','0','0','8',''),(33,'February, 2023','2023-02-14','08:28','12:40','12:56','06:56','0','0','8',''),(33,'February, 2023','2023-02-15','08:13','12:23','12:41','05:44','0','0','8',''),(33,'February, 2023','2023-02-05','','','','','0','0','0',''),(33,'February, 2023','2023-02-12','','07:59','','06:03','0','0','0',''),(33,'February, 2023','2023-02-01','','','','','0','0','0',''),(33,'February, 2023','2023-02-09','07:40','12:33','12:48','05:28','0','0','8',''),(34,'February, 2023','2023-02-07','08:24','12:06','01:08','05:17','1','0','7',''),(34,'February, 2023','2023-02-08','08:06','12:02','12:31','05:32','0','0','8',''),(34,'February, 2023','2023-02-02','08:06','12:00','12:11','05:04','0','0','8',''),(34,'February, 2023','2023-02-04','','','','','0','0','0',''),(34,'February, 2023','2023-02-03','07:41','12:04','12:15','05:14','0','0','8',''),(34,'February, 2023','2023-02-06','07:47','12:30','12:41','05:32','0','0','8',''),(34,'February, 2023','2023-02-11','','','','','0','0','0',''),(34,'February, 2023','2023-02-13','07:59','12:03','12:15','08:20','0','0','8',''),(34,'February, 2023','2023-02-10','07:50','12:07','12:17','05:40','0','0','8',''),(34,'February, 2023','2023-02-14','08:39','12:50','02:21','08:07','2','0','6',''),(34,'February, 2023','2023-02-15','08:22','12:29','01:07','05:41','0','0','8',''),(34,'February, 2023','2023-02-05','','','','','0','0','0',''),(34,'February, 2023','2023-02-12','','','','','0','0','0',''),(34,'February, 2023','2023-02-01','07:54','12:01','12:14','05:03','0','0','8',''),(34,'February, 2023','2023-02-09','08:05','12:18','12:34','05:20','0','0','8',''),(35,'February, 2023','2023-02-07','08:14','12:12','12:28','05:06','0','0','8',''),(35,'February, 2023','2023-02-08','07:24','12:09','12:00','05:02','0','0','4',''),(35,'February, 2023','2023-02-02','07:53','12:08','12:28','05:00','0','0','8',''),(35,'February, 2023','2023-02-04','','','','','0','0','0',''),(35,'February, 2023','2023-02-03','08:18','12:00','12:56','05:04','0','0','4',''),(35,'February, 2023','2023-02-06','','','','','0','0','0',''),(35,'February, 2023','2023-02-11','','','','','0','0','0',''),(35,'February, 2023','2023-02-13','07:51','12:16','12:33','05:00','0','0','8',''),(35,'February, 2023','2023-02-10','08:12','12:02','12:57','05:29','0','0','8',''),(35,'February, 2023','2023-02-14','08:12','','','','0','0','0',''),(35,'February, 2023','2023-02-15','08:47','12:10','12:29','06:33','1','0','7',''),(35,'February, 2023','2023-02-05','','','','','0','0','0',''),(35,'February, 2023','2023-02-12','','','','','0','0','0',''),(35,'February, 2023','2023-02-01','07:44','12:00','12:43','05:21','0','0','8',''),(35,'February, 2023','2023-02-09','07:40','12:08','12:23','05:08','0','0','8',''),(39,'February, 2023','2023-02-07','07:45','12:11','12:38','05:37','0','0','8',''),(39,'February, 2023','2023-02-08','07:53','12:08','12:24','05:46','0','0','8',''),(39,'February, 2023','2023-02-02','07:47','12:00','12:00','05:05','0','0','0',''),(39,'February, 2023','2023-02-04','','','','','0','0','0',''),(39,'February, 2023','2023-02-03','08:24','12:00','12:00','05:25','0','0','0',''),(39,'February, 2023','2023-02-06','','','','','0','0','0',''),(39,'February, 2023','2023-02-11','','','','','0','0','0',''),(39,'February, 2023','2023-02-13','07:59','','','','0','0','0',''),(39,'February, 2023','2023-02-10','07:57','12:00','12:00','05:31','0','0','0',''),(39,'February, 2023','2023-02-14','','','12:01','','0','0','0',''),(39,'February, 2023','2023-02-15','08:35','12:09','12:41','05:19','0','0','8',''),(39,'February, 2023','2023-02-05','','','','','0','0','0',''),(39,'February, 2023','2023-02-12','','','','','0','0','0',''),(39,'February, 2023','2023-02-01','07:50','12:00','12:00','05:15','0','0','0',''),(39,'February, 2023','2023-02-09','08:39','12:00','12:00','05:08','0','0','0',''),(40,'February, 2023','2023-02-07','08:06','12:07','12:20','05:24','0','0','8',''),(40,'February, 2023','2023-02-08','08:01','12:08','12:18','05:44','0','0','8',''),(40,'February, 2023','2023-02-02','07:49','12:32','12:42','05:08','0','0','8',''),(40,'February, 2023','2023-02-04','','10:16','01:06','','0','0','0',''),(40,'February, 2023','2023-02-03','07:43','12:22','12:42','05:19','0','0','8',''),(40,'February, 2023','2023-02-06','07:26','12:23','12:38','05:31','0','0','8',''),(40,'February, 2023','2023-02-11','','07:01','','05:27','0','0','0',''),(40,'February, 2023','2023-02-13','08:00','12:21','12:31','05:02','0','0','8',''),(40,'February, 2023','2023-02-10','07:57','12:28','12:38','05:15','0','0','8',''),(40,'February, 2023','2023-02-14','07:51','12:33','12:00','07:00','0','0','8',''),(40,'February, 2023','2023-02-15','08:20','12:49','01:00','05:55','0','0','8',''),(40,'February, 2023','2023-02-05','','','','','0','0','0',''),(40,'February, 2023','2023-02-12','','','','','0','0','0',''),(40,'February, 2023','2023-02-01','07:50','12:34','12:47','05:20','0','0','8',''),(40,'February, 2023','2023-02-09','08:07','12:06','12:37','05:13','0','0','8',''),(41,'February, 2023','2023-02-07','','','','','0','0','0',''),(41,'February, 2023','2023-02-08','08:44','12:00','12:10','06:22','1','0','7',''),(41,'February, 2023','2023-02-02','07:47','12:10','12:22','05:00','0','0','8',''),(41,'February, 2023','2023-02-04','','','','','0','0','0',''),(41,'February, 2023','2023-02-03','','','','','0','0','0',''),(41,'February, 2023','2023-02-06','','','','','0','0','0',''),(41,'February, 2023','2023-02-11','','','','','0','0','0',''),(41,'February, 2023','2023-02-13','08:33','12:02','01:23','06:55','1','0','7',''),(41,'February, 2023','2023-02-10','08:11','12:03','12:18','05:22','0','0','8',''),(41,'February, 2023','2023-02-14','09:00','12:00','12:10','06:54','1','0','7',''),(41,'February, 2023','2023-02-15','08:38','12:00','12:11','06:09','1','0','7',''),(41,'February, 2023','2023-02-05','','','','','0','0','0',''),(41,'February, 2023','2023-02-12','','','','','0','0','0',''),(41,'February, 2023','2023-02-01','06:31','12:09','12:41','05:57','0','0','8',''),(41,'February, 2023','2023-02-09','08:13','12:05','12:15','05:12','0','0','8',''),(43,'February, 2023','2023-02-07','','','','','0','0','0',''),(43,'February, 2023','2023-02-08','','','','','0','0','0',''),(43,'February, 2023','2023-02-02','09:12','12:06','12:58','05:25','1','0','7',''),(43,'February, 2023','2023-02-04','08:19','','','','0','0','0',''),(43,'February, 2023','2023-02-03','08:41','12:05','','','1','0','3',''),(43,'February, 2023','2023-02-06','08:06','12:08','12:18','05:27','0','0','8',''),(43,'February, 2023','2023-02-11','09:06','12:00','12:00','06:08','0','0','0',''),(43,'February, 2023','2023-02-13','09:16','12:21','12:50','','1','0','3',''),(43,'February, 2023','2023-02-10','08:44','12:07','','','1','0','3',''),(43,'February, 2023','2023-02-14','09:06','12:06','01:07','06:14','1','0','7',''),(43,'February, 2023','2023-02-15','','','','','0','0','0',''),(43,'February, 2023','2023-02-05','','','','','0','0','0',''),(43,'February, 2023','2023-02-12','08:53','12:00','12:00','06:03','0','0','0',''),(43,'February, 2023','2023-02-01','08:40','12:05','12:28','05:46','1','0','7',''),(43,'February, 2023','2023-02-09','08:20','12:08','12:35','06:54','0','0','8',''),(44,'February, 2023','2023-02-07','','12:04','01:10','','0','0','0',''),(44,'February, 2023','2023-02-08','08:34','12:07','12:00','05:10','1','0','3',''),(44,'February, 2023','2023-02-02','','','','','0','0','0',''),(44,'February, 2023','2023-02-04','','','','','0','0','0',''),(44,'February, 2023','2023-02-03','','','','','0','0','0',''),(44,'February, 2023','2023-02-06','','','','','0','0','0',''),(44,'February, 2023','2023-02-11','','','','','0','0','0',''),(44,'February, 2023','2023-02-13','08:14','12:37','01:08','06:09','0','0','8',''),(44,'February, 2023','2023-02-10','08:24','12:09','12:20','','0','0','4',''),(44,'February, 2023','2023-02-14','08:04','12:03','12:13','','0','0','4',''),(44,'February, 2023','2023-02-15','08:50','12:00','12:00','05:21','0','0','0',''),(44,'February, 2023','2023-02-05','','','','','0','0','0',''),(44,'February, 2023','2023-02-12','','','','','0','0','0',''),(44,'February, 2023','2023-02-01','','12:05','12:41','','0','0','0',''),(44,'February, 2023','2023-02-09','07:58','12:23','12:35','05:29','0','0','8',''),(45,'February, 2023','2023-02-07','08:14','12:06','12:20','05:14','0','0','8',''),(45,'February, 2023','2023-02-08','08:28','12:07','12:27','05:30','0','0','8',''),(45,'February, 2023','2023-02-02','07:37','12:02','12:14','05:09','0','0','8',''),(45,'February, 2023','2023-02-04','','','','','0','0','0',''),(45,'February, 2023','2023-02-03','08:10','12:03','12:17','05:05','0','0','8',''),(45,'February, 2023','2023-02-06','07:58','12:11','12:25','05:26','0','0','8',''),(45,'February, 2023','2023-02-11','','','','','0','0','0',''),(45,'February, 2023','2023-02-13','07:56','12:51','01:01','08:24','0','0','8',''),(45,'February, 2023','2023-02-10','08:21','12:02','12:19','05:56','0','0','8',''),(45,'February, 2023','2023-02-14','07:36','12:14','12:27','06:31','0','0','8',''),(45,'February, 2023','2023-02-15','08:08','12:04','12:16','05:22','0','0','8',''),(45,'February, 2023','2023-02-05','','','','','0','0','0',''),(45,'February, 2023','2023-02-12','','','','','0','0','0',''),(45,'February, 2023','2023-02-01','07:06','12:01','12:33','05:15','0','0','8',''),(45,'February, 2023','2023-02-09','08:23','12:08','12:26','05:26','0','0','8',''),(46,'February, 2023','2023-02-07','','','','','0','0','0',''),(46,'February, 2023','2023-02-08','','','','','0','0','0',''),(46,'February, 2023','2023-02-02','05:38','12:00','01:15','05:17','0','0','4',''),(46,'February, 2023','2023-02-04','08:08','','','','0','0','0',''),(46,'February, 2023','2023-02-03','07:42','12:05','12:16','05:10','0','0','8',''),(46,'February, 2023','2023-02-06','','','','','0','0','0',''),(46,'February, 2023','2023-02-11','','','','','0','0','0',''),(46,'February, 2023','2023-02-13','07:25','','01:28','','0','0','0',''),(46,'February, 2023','2023-02-10','07:54','12:01','12:19','06:12','0','0','8',''),(46,'February, 2023','2023-02-14','07:46','12:01','12:33','','0','0','4',''),(46,'February, 2023','2023-02-15','08:04','12:08','12:20','05:25','0','0','8',''),(46,'February, 2023','2023-02-05','','','','','0','0','0',''),(46,'February, 2023','2023-02-12','','','','','0','0','0',''),(46,'February, 2023','2023-02-01','06:54','12:06','12:32','05:20','0','0','8',''),(46,'February, 2023','2023-02-09','','','','','0','0','0',''),(47,'February, 2023','2023-02-07','07:24','12:08','12:19','05:18','0','0','8',''),(47,'February, 2023','2023-02-08','07:26','12:15','05:09','','0','0','8',''),(47,'February, 2023','2023-02-02','','','','','0','0','0',''),(47,'February, 2023','2023-02-04','','','','','0','0','0',''),(47,'February, 2023','2023-02-03','','','','','0','0','0',''),(47,'February, 2023','2023-02-06','','','','','0','0','0',''),(47,'February, 2023','2023-02-11','','','','','0','0','0',''),(47,'February, 2023','2023-02-13','07:52','12:04','12:36','06:23','0','0','8',''),(47,'February, 2023','2023-02-10','07:33','12:01','12:16','05:03','0','0','8',''),(47,'February, 2023','2023-02-14','08:00','12:18','12:30','06:49','0','0','8',''),(47,'February, 2023','2023-02-15','07:42','12:05','12:19','06:11','0','0','8',''),(47,'February, 2023','2023-02-05','','','','','0','0','0',''),(47,'February, 2023','2023-02-12','','','','','0','0','0',''),(47,'February, 2023','2023-02-01','07:14','12:04','12:36','05:00','0','0','8',''),(47,'February, 2023','2023-02-09','07:59','12:16','12:28','05:04','0','0','8',''),(48,'February, 2023','2023-02-07','07:32','12:00','12:16','05:05','0','0','8',''),(48,'February, 2023','2023-02-08','07:57','12:00','12:19','05:00','0','0','8',''),(48,'February, 2023','2023-02-02','07:34','12:08','12:19','','0','0','4',''),(48,'February, 2023','2023-02-04','','','','','0','0','0',''),(48,'February, 2023','2023-02-03','07:58','12:27','12:39','05:04','0','0','8',''),(48,'February, 2023','2023-02-06','07:25','12:01','12:11','05:00','0','0','8',''),(48,'February, 2023','2023-02-11','','','','','0','0','0',''),(48,'February, 2023','2023-02-13','07:24','12:03','12:45','06:11','0','0','8',''),(48,'February, 2023','2023-02-10','07:52','12:00','12:11','05:00','0','0','8',''),(48,'February, 2023','2023-02-14','08:00','12:00','12:10','06:36','0','0','8',''),(48,'February, 2023','2023-02-15','07:53','12:01','12:56','05:05','0','0','8',''),(48,'February, 2023','2023-02-05','','','','','0','0','0',''),(48,'February, 2023','2023-02-12','','','','','0','0','0',''),(48,'February, 2023','2023-02-01','06:57','12:05','12:34','05:19','0','0','8',''),(48,'February, 2023','2023-02-09','07:56','12:00','12:10','05:00','0','0','8',''),(49,'February, 2023','2023-02-07','07:44','12:00','12:00','05:19','0','0','0',''),(49,'February, 2023','2023-02-08','07:45','12:00','12:00','05:11','0','0','0',''),(49,'February, 2023','2023-02-02','07:58','12:00','12:00','05:08','0','0','0',''),(49,'February, 2023','2023-02-04','','','','','0','0','0',''),(49,'February, 2023','2023-02-03','07:43','12:00','12:00','05:09','0','0','0',''),(49,'February, 2023','2023-02-06','07:31','12:00','12:00','05:20','0','0','0',''),(49,'February, 2023','2023-02-11','','','','','0','0','0',''),(49,'February, 2023','2023-02-13','06:54','','','','0','0','0',''),(49,'February, 2023','2023-02-10','07:37','12:00','12:00','05:28','0','0','0',''),(49,'February, 2023','2023-02-14','07:56','12:00','12:00','06:43','0','0','0',''),(49,'February, 2023','2023-02-15','07:50','12:00','12:00','05:46','0','0','0',''),(49,'February, 2023','2023-02-05','','','','','0','0','0',''),(49,'February, 2023','2023-02-12','','','','','0','0','0',''),(49,'February, 2023','2023-02-01','06:46','','','','0','0','0',''),(49,'February, 2023','2023-02-09','07:52','12:00','12:00','05:11','0','0','0',''),(50,'February, 2023','2023-02-07','08:02','12:14','12:25','05:42','0','0','8',''),(50,'February, 2023','2023-02-08','08:55','12:03','12:13','06:02','1','0','7',''),(50,'February, 2023','2023-02-02','08:07','12:09','12:19','','0','0','4',''),(50,'February, 2023','2023-02-04','','','','','0','0','0',''),(50,'February, 2023','2023-02-03','08:24','12:03','12:14','05:34','0','0','8',''),(50,'February, 2023','2023-02-06','','','01:26','07:16','0','0','4',''),(50,'February, 2023','2023-02-11','','','','','0','0','0',''),(50,'February, 2023','2023-02-13','07:52','12:00','12:26','06:40','0','0','4',''),(50,'February, 2023','2023-02-10','','','','','0','0','0',''),(50,'February, 2023','2023-02-14','08:29','12:23','12:36','07:29','0','0','8',''),(50,'February, 2023','2023-02-15','08:22','12:05','12:17','07:17','0','0','8',''),(50,'February, 2023','2023-02-05','','','','','0','0','0',''),(50,'February, 2023','2023-02-12','','','','','0','0','0',''),(50,'February, 2023','2023-02-01','06:53','12:05','12:40','05:16','0','0','8',''),(50,'February, 2023','2023-02-09','08:38','12:29','','','1','0','3',''),(51,'February, 2023','2023-02-07','08:15','12:05','12:19','05:15','0','0','8',''),(51,'February, 2023','2023-02-08','08:22','12:01','12:27','05:30','0','0','8',''),(51,'February, 2023','2023-02-02','08:17','12:01','12:14','05:08','0','0','8',''),(51,'February, 2023','2023-02-04','','','','','0','0','0',''),(51,'February, 2023','2023-02-03','08:07','12:00','12:18','05:05','0','0','8',''),(51,'February, 2023','2023-02-06','08:27','12:00','12:24','05:26','0','0','4',''),(51,'February, 2023','2023-02-11','','','','','0','0','0',''),(51,'February, 2023','2023-02-13','08:11','12:00','12:24','09:21','0','0','8',''),(51,'February, 2023','2023-02-10','08:22','12:01','12:19','05:56','0','0','8',''),(51,'February, 2023','2023-02-14','08:03','12:00','12:27','06:31','0','0','8',''),(51,'February, 2023','2023-02-15','08:46','12:02','12:16','05:22','1','0','7',''),(51,'February, 2023','2023-02-05','','','','','0','0','0',''),(51,'February, 2023','2023-02-12','','','','','0','0','0',''),(51,'February, 2023','2023-02-01','07:06','12:00','12:33','05:15','0','0','8',''),(51,'February, 2023','2023-02-09','08:38','12:27','12:00','05:27','1','0','7',''),(52,'February, 2023','2023-02-07','07:54','12:03','12:14','06:45','0','0','8',''),(52,'February, 2023','2023-02-08','08:33','12:18','12:30','05:41','1','0','7',''),(52,'February, 2023','2023-02-02','07:33','12:09','12:22','','0','0','4',''),(52,'February, 2023','2023-02-04','','','','','0','0','0',''),(52,'February, 2023','2023-02-03','07:52','12:07','12:17','05:33','0','0','8',''),(52,'February, 2023','2023-02-06','08:06','12:12','12:24','05:21','0','0','8',''),(52,'February, 2023','2023-02-11','','','','','0','0','0',''),(52,'February, 2023','2023-02-13','08:26','12:00','12:26','06:22','0','0','4',''),(52,'February, 2023','2023-02-10','','','','','0','0','0',''),(52,'February, 2023','2023-02-14','08:07','12:23','12:36','09:12','0','0','8',''),(52,'February, 2023','2023-02-15','08:22','12:09','12:20','05:44','0','0','8',''),(52,'February, 2023','2023-02-05','','','','','0','0','0',''),(52,'February, 2023','2023-02-12','','','','','0','0','0',''),(52,'February, 2023','2023-02-01','07:05','12:00','12:36','05:59','0','0','4',''),(52,'February, 2023','2023-02-09','08:00','12:18','','','0','0','4',''),(53,'February, 2023','2023-02-07','05:53','11:59','12:10','05:00','0','0','8',''),(53,'February, 2023','2023-02-08','06:00','12:00','12:16','04:59','0','0','8',''),(53,'February, 2023','2023-02-02','06:13','12:00','12:14','04:59','0','0','8',''),(53,'February, 2023','2023-02-04','','','','','0','0','0',''),(53,'February, 2023','2023-02-03','06:06','12:02','12:13','05:00','0','0','8',''),(53,'February, 2023','2023-02-06','06:01','12:03','12:20','05:01','0','0','8',''),(53,'February, 2023','2023-02-11','','','','','0','0','0',''),(53,'February, 2023','2023-02-13','05:59','12:01','12:22','05:00','0','0','8',''),(53,'February, 2023','2023-02-10','05:50','12:03','12:18','05:02','0','0','8',''),(53,'February, 2023','2023-02-14','05:52','12:04','12:27','05:47','0','0','8',''),(53,'February, 2023','2023-02-15','05:48','12:20','12:45','05:00','0','0','8',''),(53,'February, 2023','2023-02-05','','','','','0','0','0',''),(53,'February, 2023','2023-02-12','','','01:33','','0','0','0',''),(53,'February, 2023','2023-02-01','','','','','0','0','0',''),(53,'February, 2023','2023-02-09','05:54','12:13','12:23','05:00','0','0','8',''),(54,'February, 2023','2023-02-07','','','','','0','0','0',''),(54,'February, 2023','2023-02-08','07:42','11:48','12:51','05:00','0','0','8',''),(54,'February, 2023','2023-02-02','','','','','0','0','0',''),(54,'February, 2023','2023-02-04','','','','','0','0','0',''),(54,'February, 2023','2023-02-03','','','','','0','0','0',''),(54,'February, 2023','2023-02-06','','','','','0','0','0',''),(54,'February, 2023','2023-02-11','','','','','0','0','0',''),(54,'February, 2023','2023-02-13','07:48','11:50','01:00','05:00','0','0','8',''),(54,'February, 2023','2023-02-10','08:14','12:00','01:09','05:00','0','0','8',''),(54,'February, 2023','2023-02-14','08:25','11:50','01:39','06:15','1','0','7',''),(54,'February, 2023','2023-02-15','08:19','12:00','01:04','04:12','0','1','7',''),(54,'February, 2023','2023-02-05','','','','','0','0','0',''),(54,'February, 2023','2023-02-12','','','','','0','0','0',''),(54,'February, 2023','2023-02-01','07:26','12:04','12:44','04:44','0','0','8',''),(54,'February, 2023','2023-02-09','08:08','11:53','01:06','05:00','0','0','8',''),(55,'February, 2023','2023-02-07','','','','','0','0','0',''),(55,'February, 2023','2023-02-08','07:57','12:00','01:05','05:04','0','0','4',''),(55,'February, 2023','2023-02-02','08:14','12:01','01:08','05:01','0','0','8',''),(55,'February, 2023','2023-02-04','','','','','0','0','0',''),(55,'February, 2023','2023-02-03','08:06','12:01','01:07','05:03','0','0','8',''),(55,'February, 2023','2023-02-06','','','','','0','0','0',''),(55,'February, 2023','2023-02-11','','','','','0','0','0',''),(55,'February, 2023','2023-02-13','08:14','12:01','01:03','05:03','0','0','8',''),(55,'February, 2023','2023-02-10','08:07','12:02','01:00','06:10','0','0','8',''),(55,'February, 2023','2023-02-14','08:12','12:03','12:30','06:14','0','0','8',''),(55,'February, 2023','2023-02-15','08:07','12:02','12:59','05:04','0','0','8',''),(55,'February, 2023','2023-02-05','','','','','0','0','0',''),(55,'February, 2023','2023-02-12','','','','','0','0','0',''),(55,'February, 2023','2023-02-01','08:13','12:00','01:15','05:01','0','0','8',''),(55,'February, 2023','2023-02-09','08:01','12:00','01:08','05:04','0','0','8',''),(56,'February, 2023','2023-02-07','','','','','0','0','0',''),(56,'February, 2023','2023-02-08','07:57','12:00','01:04','05:04','0','0','4',''),(56,'February, 2023','2023-02-02','08:14','12:00','12:00','05:01','0','0','4',''),(56,'February, 2023','2023-02-04','','','','','0','0','0',''),(56,'February, 2023','2023-02-03','08:07','12:00','01:07','05:03','0','0','8',''),(56,'February, 2023','2023-02-06','07:57','12:00','01:08','05:00','0','0','8',''),(56,'February, 2023','2023-02-11','','','','','0','0','0',''),(56,'February, 2023','2023-02-13','08:14','12:00','01:03','05:03','0','0','8',''),(56,'February, 2023','2023-02-10','08:07','12:02','01:00','05:09','0','0','8',''),(56,'February, 2023','2023-02-14','08:12','12:30','01:24','06:14','1','0','7',''),(56,'February, 2023','2023-02-15','08:07','12:03','12:59','06:25','0','0','8',''),(56,'February, 2023','2023-02-05','','','','','0','0','0',''),(56,'February, 2023','2023-02-12','','','','','0','0','0',''),(56,'February, 2023','2023-02-01','08:13','12:00','01:15','05:00','0','0','8',''),(56,'February, 2023','2023-02-09','08:01','12:08','01:08','05:03','0','0','8',''),(57,'February, 2023','2023-02-07','07:20','12:14','12:25','05:33','0','0','8',''),(57,'February, 2023','2023-02-08','08:18','12:20','12:31','06:02','0','0','8',''),(57,'February, 2023','2023-02-02','','','','','0','0','0',''),(57,'February, 2023','2023-02-04','','','','','0','0','0',''),(57,'February, 2023','2023-02-03','','','','','0','0','0',''),(57,'February, 2023','2023-02-06','','','','','0','0','0',''),(57,'February, 2023','2023-02-11','10:06','','','','0','0','0',''),(57,'February, 2023','2023-02-13','07:48','12:00','12:00','06:08','0','0','0',''),(57,'February, 2023','2023-02-10','08:48','12:16','12:27','06:13','1','0','7',''),(57,'February, 2023','2023-02-14','07:57','12:36','12:00','06:52','0','0','4',''),(57,'February, 2023','2023-02-15','','','01:30','05:19','0','0','4',''),(57,'February, 2023','2023-02-05','','','','','0','0','0',''),(57,'February, 2023','2023-02-12','','','','','0','0','0',''),(57,'February, 2023','2023-02-01','07:27','12:04','12:40','05:17','0','0','8',''),(57,'February, 2023','2023-02-09','08:57','12:29','12:00','05:26','1','0','3',''),(58,'February, 2023','2023-02-07','09:24','12:06','12:19','05:30','1','0','7',''),(58,'February, 2023','2023-02-08','09:38','12:00','12:17','05:19','0','0','4',''),(58,'February, 2023','2023-02-02','09:00','12:09','12:25','05:00','1','0','7',''),(58,'February, 2023','2023-02-04','','','','','0','0','0',''),(58,'February, 2023','2023-02-03','08:19','12:09','12:19','05:23','0','0','8',''),(58,'February, 2023','2023-02-06','09:23','12:00','12:36','05:38','0','0','4',''),(58,'February, 2023','2023-02-11','','','','','0','0','0',''),(58,'February, 2023','2023-02-13','09:34','12:00','12:00','10:15','2','0','2',''),(58,'February, 2023','2023-02-10','09:39','12:06','12:16','','2','0','2',''),(58,'February, 2023','2023-02-14','09:07','12:00','12:00','06:49','0','0','0',''),(58,'February, 2023','2023-02-15','09:01','12:06','12:19','05:37','1','0','7',''),(58,'February, 2023','2023-02-05','','','','','0','0','0',''),(58,'February, 2023','2023-02-12','','','','','0','0','0',''),(58,'February, 2023','2023-02-01','','','','05:37','0','0','0',''),(58,'February, 2023','2023-02-09','09:47','12:04','12:16','','2','0','2',''),(60,'February, 2023','2023-02-07','06:10','12:00','12:10','05:00','0','0','8',''),(60,'February, 2023','2023-02-08','05:56','12:00','12:18','05:00','0','0','8',''),(60,'February, 2023','2023-02-02','06:04','12:00','12:15','04:58','0','0','8',''),(60,'February, 2023','2023-02-04','','','','','0','0','0',''),(60,'February, 2023','2023-02-03','06:13','12:00','12:12','05:00','0','0','8',''),(60,'February, 2023','2023-02-06','06:25','12:01','12:13','05:00','0','0','8',''),(60,'February, 2023','2023-02-11','','','','','0','0','0',''),(60,'February, 2023','2023-02-13','06:00','12:05','12:26','05:00','0','0','8',''),(60,'February, 2023','2023-02-10','06:08','12:02','12:15','05:00','0','0','8',''),(60,'February, 2023','2023-02-14','06:04','12:00','12:24','05:48','0','0','8',''),(60,'February, 2023','2023-02-15','06:20','12:02','12:12','04:59','0','0','8',''),(60,'February, 2023','2023-02-05','','','','','0','0','0',''),(60,'February, 2023','2023-02-12','','','','','0','0','0',''),(60,'February, 2023','2023-02-01','06:22','12:00','12:11','05:00','0','0','8',''),(60,'February, 2023','2023-02-09','06:43','12:00','12:12','05:00','0','0','8',''),(61,'February, 2023','2023-02-07','06:55','12:12','12:25','05:23','0','0','8',''),(61,'February, 2023','2023-02-08','07:21','12:27','12:42','05:14','0','0','8',''),(61,'February, 2023','2023-02-02','07:24','12:12','12:27','05:07','0','0','8',''),(61,'February, 2023','2023-02-04','','','','','0','0','0',''),(61,'February, 2023','2023-02-03','08:39','','','','0','0','0',''),(61,'February, 2023','2023-02-06','06:44','12:04','12:19','05:12','0','0','8',''),(61,'February, 2023','2023-02-11','','','','','0','0','0',''),(61,'February, 2023','2023-02-13','07:18','12:21','12:33','05:06','0','0','8',''),(61,'February, 2023','2023-02-10','07:36','12:09','12:22','05:08','0','0','8',''),(61,'February, 2023','2023-02-14','07:57','12:33','12:44','','0','0','4',''),(61,'February, 2023','2023-02-15','08:08','12:07','12:18','05:20','0','0','8',''),(61,'February, 2023','2023-02-05','','','','','0','0','0',''),(61,'February, 2023','2023-02-12','','','','','0','0','0',''),(61,'February, 2023','2023-02-01','08:28','12:14','12:28','05:03','0','0','8',''),(61,'February, 2023','2023-02-09','07:02','12:24','12:36','05:19','0','0','8',''),(62,'February, 2023','2023-02-07','','','','09:35','0','0','0',''),(62,'February, 2023','2023-02-08','','','','','0','0','0',''),(62,'February, 2023','2023-02-02','','','12:36','','0','0','0',''),(62,'February, 2023','2023-02-04','','','','','0','0','0',''),(62,'February, 2023','2023-02-03','','','','','0','0','0',''),(62,'February, 2023','2023-02-06','09:39','12:00','12:00','09:29','0','0','0',''),(62,'February, 2023','2023-02-11','','','','','0','0','0',''),(62,'February, 2023','2023-02-13','','','','10:43','0','0','0',''),(62,'February, 2023','2023-02-10','10:10','12:00','12:00','09:59','0','0','0',''),(62,'February, 2023','2023-02-14','11:33','12:00','12:00','08:18','0','0','0',''),(62,'February, 2023','2023-02-15','','','','09:45','0','0','0',''),(62,'February, 2023','2023-02-05','','','','','0','0','0',''),(62,'February, 2023','2023-02-12','','','','','0','0','0',''),(62,'February, 2023','2023-02-01','11:20','12:00','12:00','09:42','0','0','0',''),(62,'February, 2023','2023-02-09','09:42','12:00','12:00','10:06','0','0','0',''),(64,'February, 2023','2023-02-07','07:54','12:00','12:12','05:36','0','0','8',''),(64,'February, 2023','2023-02-08','07:36','12:02','12:17','05:14','0','0','8',''),(64,'February, 2023','2023-02-02','07:47','12:06','12:17','05:07','0','0','8',''),(64,'February, 2023','2023-02-04','','','','','0','0','0',''),(64,'February, 2023','2023-02-03','08:02','12:00','12:16','05:30','0','0','8',''),(64,'February, 2023','2023-02-06','07:35','12:00','12:18','05:21','0','0','8',''),(64,'February, 2023','2023-02-11','','','','','0','0','0',''),(64,'February, 2023','2023-02-13','08:24','12:01','12:56','07:59','0','0','8',''),(64,'February, 2023','2023-02-10','07:44','12:02','12:21','07:32','0','0','8',''),(64,'February, 2023','2023-02-14','07:34','12:05','12:22','06:27','0','0','8',''),(64,'February, 2023','2023-02-15','08:01','12:01','12:12','03:37','0','1','7',''),(64,'February, 2023','2023-02-05','','','','','0','0','0',''),(64,'February, 2023','2023-02-12','','','','','0','0','0',''),(64,'February, 2023','2023-02-01','07:34','12:00','12:11','05:10','0','0','8',''),(64,'February, 2023','2023-02-09','07:54','12:01','12:56','07:55','0','0','8',''),(66,'February, 2023','2023-02-07','07:57','12:00','12:11','05:43','0','0','8',''),(66,'February, 2023','2023-02-08','08:07','12:02','12:16','05:47','0','0','8',''),(66,'February, 2023','2023-02-02','07:53','12:00','12:37','05:02','0','0','4',''),(66,'February, 2023','2023-02-04','','','','','0','0','0',''),(66,'February, 2023','2023-02-03','07:36','12:00','12:18','05:38','0','0','8',''),(66,'February, 2023','2023-02-06','08:00','12:00','12:12','05:39','0','0','8',''),(66,'February, 2023','2023-02-11','','','','','0','0','0',''),(66,'February, 2023','2023-02-13','08:10','12:20','12:00','05:08','0','0','8',''),(66,'February, 2023','2023-02-10','08:05','12:00','12:27','05:57','0','0','8',''),(66,'February, 2023','2023-02-14','08:00','12:02','12:21','06:14','0','0','8',''),(66,'February, 2023','2023-02-15','','12:01','12:14','05:45','0','1','7',''),(66,'February, 2023','2023-02-05','','','','','0','0','0',''),(66,'February, 2023','2023-02-12','','','','','0','0','0',''),(66,'February, 2023','2023-02-01','07:56','12:00','12:42','05:04','0','0','8',''),(66,'February, 2023','2023-02-09','07:55','12:00','12:28','06:29','0','0','8',''),(67,'February, 2023','2023-02-07','','','','','0','0','0',''),(67,'February, 2023','2023-02-08','','','','','0','0','0',''),(67,'February, 2023','2023-02-02','08:00','12:00','12:16','05:10','0','0','8',''),(67,'February, 2023','2023-02-04','08:00','12:02','12:28','05:09','0','0','8',''),(67,'February, 2023','2023-02-03','08:00','12:02','12:29','05:08','0','0','8',''),(67,'February, 2023','2023-02-06','','','','','0','0','0',''),(67,'February, 2023','2023-02-11','','','','','0','0','0',''),(67,'February, 2023','2023-02-13','','','','','0','0','0',''),(67,'February, 2023','2023-02-10','','','','','0','0','0',''),(67,'February, 2023','2023-02-14','','','','','0','0','0',''),(67,'February, 2023','2023-02-15','','','','','0','0','0',''),(67,'February, 2023','2023-02-05','08:05','12:05','12:19','05:17','0','0','8',''),(67,'February, 2023','2023-02-12','','','','','0','0','0',''),(67,'February, 2023','2023-02-01','07:54','12:00','01:03','05:06','0','0','8',''),(67,'February, 2023','2023-02-09','','','','','0','0','0',''),(69,'February, 2023','2023-02-07','08:14','12:41','12:53','05:12','0','0','8',''),(69,'February, 2023','2023-02-08','07:56','12:55','01:09','05:18','0','0','8',''),(69,'February, 2023','2023-02-02','08:20','12:00','12:19','05:21','0','0','4',''),(69,'February, 2023','2023-02-04','','','','','0','0','0',''),(69,'February, 2023','2023-02-03','08:29','12:00','12:00','05:16','0','0','0',''),(69,'February, 2023','2023-02-06','08:29','','','05:07','0','0','8',''),(69,'February, 2023','2023-02-11','','','','','0','0','0',''),(69,'February, 2023','2023-02-13','07:57','12:21','12:34','05:09','0','0','8',''),(69,'February, 2023','2023-02-10','08:28','12:00','12:00','05:31','0','0','0',''),(69,'February, 2023','2023-02-14','07:46','','','','0','0','0',''),(69,'February, 2023','2023-02-15','08:39','12:16','','','1','0','3',''),(69,'February, 2023','2023-02-05','','','','','0','0','0',''),(69,'February, 2023','2023-02-12','','','','','0','0','0',''),(69,'February, 2023','2023-02-01','08:32','12:26','12:39','05:19','1','0','7',''),(69,'February, 2023','2023-02-09','08:37','12:36','12:59','05:37','1','0','7',''),(70,'February, 2023','2023-02-07','08:40','12:24','12:46','','1','0','3',''),(70,'February, 2023','2023-02-08','09:00','12:00','12:00','09:44','0','0','0',''),(70,'February, 2023','2023-02-02','','','','','0','0','0',''),(70,'February, 2023','2023-02-04','','','','','0','0','0',''),(70,'February, 2023','2023-02-03','','','','','0','0','0',''),(70,'February, 2023','2023-02-06','','12:13','12:25','09:21','0','0','4',''),(70,'February, 2023','2023-02-11','09:21','11:05','01:27','','1','1','2',''),(70,'February, 2023','2023-02-13','11:34','12:00','12:00','05:12','0','0','0',''),(70,'February, 2023','2023-02-10','08:45','12:03','12:21','09:16','1','0','7',''),(70,'February, 2023','2023-02-14','','','','06:33','0','0','0',''),(70,'February, 2023','2023-02-15','09:33','12:14','12:41','05:08','2','0','6',''),(70,'February, 2023','2023-02-05','','','','','0','0','0',''),(70,'February, 2023','2023-02-12','','','','','0','0','0',''),(70,'February, 2023','2023-02-01','','','','','0','0','0',''),(70,'February, 2023','2023-02-09','','','','','0','0','0',''),(71,'February, 2023','2023-02-07','07:45','12:42','12:53','05:00','0','0','8',''),(71,'February, 2023','2023-02-08','07:54','12:48','12:59','05:00','0','0','8',''),(71,'February, 2023','2023-02-02','07:48','12:29','12:39','05:00','0','0','8',''),(71,'February, 2023','2023-02-04','','','','','0','0','0',''),(71,'February, 2023','2023-02-03','07:45','12:36','12:47','05:01','0','0','8',''),(71,'February, 2023','2023-02-06','07:41','12:31','12:45','05:00','0','0','8',''),(71,'February, 2023','2023-02-11','','','','','0','0','0',''),(71,'February, 2023','2023-02-13','07:44','12:47','01:00','05:00','0','0','8',''),(71,'February, 2023','2023-02-10','07:41','12:39','12:53','05:00','0','0','8',''),(71,'February, 2023','2023-02-14','07:44','12:02','12:13','','0','0','4',''),(71,'February, 2023','2023-02-15','07:48','12:37','12:53','05:00','0','0','8',''),(71,'February, 2023','2023-02-05','','','','','0','0','0',''),(71,'February, 2023','2023-02-12','','','','','0','0','0',''),(71,'February, 2023','2023-02-01','07:48','12:36','12:47','05:04','0','0','8',''),(71,'February, 2023','2023-02-09','07:46','12:44','12:55','05:01','0','0','8',''),(72,'February, 2023','2023-02-07','07:52','12:13','12:25','05:24','0','0','8',''),(72,'February, 2023','2023-02-08','07:56','12:27','12:43','05:17','0','0','8',''),(72,'February, 2023','2023-02-02','07:59','12:11','12:26','05:07','0','0','8',''),(72,'February, 2023','2023-02-04','','','','','0','0','0',''),(72,'February, 2023','2023-02-03','','','','','0','0','0',''),(72,'February, 2023','2023-02-06','','','','','0','0','0',''),(72,'February, 2023','2023-02-11','','','','','0','0','0',''),(72,'February, 2023','2023-02-13','08:00','12:21','12:32','05:06','0','0','8',''),(72,'February, 2023','2023-02-10','07:57','12:10','12:21','05:08','0','0','8',''),(72,'February, 2023','2023-02-14','07:58','12:33','12:44','06:36','0','0','8',''),(72,'February, 2023','2023-02-15','08:03','12:07','12:18','05:19','0','0','8',''),(72,'February, 2023','2023-02-05','','','','','0','0','0',''),(72,'February, 2023','2023-02-12','','','','','0','0','0',''),(72,'February, 2023','2023-02-01','07:54','12:14','12:25','05:02','0','0','8',''),(72,'February, 2023','2023-02-09','07:59','12:24','12:36','05:19','0','0','8',''),(73,'February, 2023','2023-02-07','08:27','12:00','01:00','05:45','0','0','8',''),(73,'February, 2023','2023-02-08','08:12','12:38','12:56','05:56','0','0','8',''),(73,'February, 2023','2023-02-02','08:44','12:00','12:58','','1','0','3',''),(73,'February, 2023','2023-02-04','','','','','0','0','0',''),(73,'February, 2023','2023-02-03','08:31','12:27','12:56','06:07','1','0','7',''),(73,'February, 2023','2023-02-06','08:20','12:37','12:48','06:05','0','0','8',''),(73,'February, 2023','2023-02-11','09:53','12:08','12:34','06:10','2','0','6',''),(73,'February, 2023','2023-02-13','08:30','12:00','12:58','09:09','0','0','4',''),(73,'February, 2023','2023-02-10','08:13','12:25','12:36','06:20','0','0','8',''),(73,'February, 2023','2023-02-14','08:22','12:05','12:26','07:32','0','0','8',''),(73,'February, 2023','2023-02-15','08:21','12:01','12:49','07:08','0','0','8',''),(73,'February, 2023','2023-02-05','','','','','0','0','0',''),(73,'February, 2023','2023-02-12','08:13','12:52','01:02','08:18','0','0','8',''),(73,'February, 2023','2023-02-01','07:41','12:00','12:00','05:52','0','0','0',''),(73,'February, 2023','2023-02-09','','','','','0','0','0',''),(74,'February, 2023','2023-02-07','08:41','12:46','01:00','06:33','1','0','7',''),(74,'February, 2023','2023-02-08','08:12','12:39','12:57','05:57','0','0','8',''),(74,'February, 2023','2023-02-02','08:44','12:00','12:58','','1','0','3',''),(74,'February, 2023','2023-02-04','','','','','0','0','0',''),(74,'February, 2023','2023-02-03','08:59','12:40','12:52','04:00','1','1','6',''),(74,'February, 2023','2023-02-06','07:48','12:37','12:51','06:05','0','0','8',''),(74,'February, 2023','2023-02-11','09:53','12:11','12:34','04:10','2','1','5',''),(74,'February, 2023','2023-02-13','08:30','12:00','12:57','09:09','0','0','4',''),(74,'February, 2023','2023-02-10','08:48','12:43','12:55','06:19','1','0','7',''),(74,'February, 2023','2023-02-14','08:22','12:00','12:00','07:32','0','0','0',''),(74,'February, 2023','2023-02-15','08:19','12:17','12:48','07:08','0','0','8',''),(74,'February, 2023','2023-02-05','','','','','0','0','0',''),(74,'February, 2023','2023-02-12','','','','','0','0','0',''),(74,'February, 2023','2023-02-01','06:33','12:00','01:10','05:50','0','0','4',''),(74,'February, 2023','2023-02-09','08:36','12:18','12:54','08:16','1','0','7',''),(75,'February, 2023','2023-02-07','08:00','12:04','12:27','05:15','0','0','8',''),(75,'February, 2023','2023-02-08','08:05','12:08','12:21','05:40','0','0','8',''),(75,'February, 2023','2023-02-02','08:06','12:12','12:45','05:01','0','0','8',''),(75,'February, 2023','2023-02-04','','','','','0','0','0',''),(75,'February, 2023','2023-02-03','07:48','12:07','12:17','05:00','0','0','8',''),(75,'February, 2023','2023-02-06','08:07','12:00','12:38','05:17','0','0','4',''),(75,'February, 2023','2023-02-11','','','','','0','0','0',''),(75,'February, 2023','2023-02-13','08:02','12:05','12:51','05:09','0','0','8',''),(75,'February, 2023','2023-02-10','08:04','12:08','12:18','05:22','0','0','8',''),(75,'February, 2023','2023-02-14','08:01','12:09','12:21','06:33','0','0','8',''),(75,'February, 2023','2023-02-15','','','','','0','0','0',''),(75,'February, 2023','2023-02-05','','','','','0','0','0',''),(75,'February, 2023','2023-02-12','','','','','0','0','0',''),(75,'February, 2023','2023-02-01','08:08','12:34','12:46','05:10','0','0','8',''),(75,'February, 2023','2023-02-09','08:08','12:08','12:20','05:45','0','0','8',''),(76,'February, 2023','2023-02-07','07:52','12:00','12:42','06:08','0','0','8',''),(76,'February, 2023','2023-02-08','','','','','0','0','0',''),(76,'February, 2023','2023-02-02','08:05','12:01','12:00','04:58','0','0','4',''),(76,'February, 2023','2023-02-04','','','','','0','0','0',''),(76,'February, 2023','2023-02-03','08:26','12:03','12:59','05:17','0','0','8',''),(76,'February, 2023','2023-02-06','08:03','12:01','01:11','05:25','0','0','8',''),(76,'February, 2023','2023-02-11','','','','','0','0','0',''),(76,'February, 2023','2023-02-13','08:00','12:02','12:27','','0','0','4',''),(76,'February, 2023','2023-02-10','07:59','12:00','12:23','07:19','0','0','8',''),(76,'February, 2023','2023-02-14','07:51','12:01','12:11','07:22','0','0','8',''),(76,'February, 2023','2023-02-15','06:36','12:28','12:41','05:55','0','0','8',''),(76,'February, 2023','2023-02-05','','','','','0','0','0',''),(76,'February, 2023','2023-02-12','','','','','0','0','0',''),(76,'February, 2023','2023-02-01','07:50','12:05','12:51','05:03','0','0','8',''),(76,'February, 2023','2023-02-09','','','','','0','0','0',''),(78,'February, 2023','2023-02-07','08:50','12:00','01:17','05:00','1','0','7',''),(78,'February, 2023','2023-02-08','08:47','12:00','01:07','05:00','1','0','7',''),(78,'February, 2023','2023-02-02','08:06','12:04','12:00','05:00','0','0','4',''),(78,'February, 2023','2023-02-04','','','','','0','0','0',''),(78,'February, 2023','2023-02-03','','','','','0','0','0',''),(78,'February, 2023','2023-02-06','08:51','12:03','01:25','05:00','1','0','7',''),(78,'February, 2023','2023-02-11','','','','','0','0','0',''),(78,'February, 2023','2023-02-13','','','01:29','','0','0','0',''),(78,'February, 2023','2023-02-10','08:51','12:02','01:20','','1','0','3',''),(78,'February, 2023','2023-02-14','','','','','0','0','0',''),(78,'February, 2023','2023-02-15','08:34','12:00','01:24','05:10','1','0','7',''),(78,'February, 2023','2023-02-05','','','','','0','0','0',''),(78,'February, 2023','2023-02-12','','','','','0','0','0',''),(78,'February, 2023','2023-02-01','08:59','12:00','01:27','05:03','1','0','7',''),(78,'February, 2023','2023-02-09','08:35','12:00','01:26','05:00','1','0','7',''),(79,'February, 2023','2023-02-07','05:53','12:00','12:26','05:00','0','0','8',''),(79,'February, 2023','2023-02-08','06:00','12:03','12:14','05:00','0','0','8',''),(79,'February, 2023','2023-02-02','','','','','0','0','0',''),(79,'February, 2023','2023-02-04','','','','','0','0','0',''),(79,'February, 2023','2023-02-03','','','','','0','0','0',''),(79,'February, 2023','2023-02-06','06:01','12:02','12:18','05:02','0','0','8',''),(79,'February, 2023','2023-02-11','','','','','0','0','0',''),(79,'February, 2023','2023-02-13','06:00','12:22','12:00','05:01','0','0','8',''),(79,'February, 2023','2023-02-10','05:50','12:00','12:20','05:00','0','0','8',''),(79,'February, 2023','2023-02-14','05:52','12:04','12:39','','0','0','4',''),(79,'February, 2023','2023-02-15','05:48','12:01','12:26','05:01','0','0','8',''),(79,'February, 2023','2023-02-05','','','','','0','0','0',''),(79,'February, 2023','2023-02-12','','','','','0','0','0',''),(79,'February, 2023','2023-02-01','','','','','0','0','0',''),(79,'February, 2023','2023-02-09','05:54','','','05:00','0','0','8',''),(80,'February, 2023','2023-02-07','08:06','12:00','01:01','05:04','0','0','8',''),(80,'February, 2023','2023-02-08','08:07','12:02','01:02','05:00','0','0','8',''),(80,'February, 2023','2023-02-02','','','','','0','0','0',''),(80,'February, 2023','2023-02-04','','','','','0','0','0',''),(80,'February, 2023','2023-02-03','','','','','0','0','0',''),(80,'February, 2023','2023-02-06','08:41','12:03','01:12','05:00','1','0','7',''),(80,'February, 2023','2023-02-11','','','','','0','0','0',''),(80,'February, 2023','2023-02-13','08:11','12:00','01:04','05:01','0','0','8',''),(80,'February, 2023','2023-02-10','08:06','12:02','01:03','05:00','0','0','8',''),(80,'February, 2023','2023-02-14','08:05','12:00','12:00','06:34','0','0','0',''),(80,'February, 2023','2023-02-15','08:28','12:03','01:04','06:51','1','0','7',''),(80,'February, 2023','2023-02-05','','','','','0','0','0',''),(80,'February, 2023','2023-02-12','','','','','0','0','0',''),(80,'February, 2023','2023-02-01','','','','','0','0','0',''),(80,'February, 2023','2023-02-09','08:05','12:01','01:04','05:10','0','0','8',''),(81,'February, 2023','2023-02-07','08:40','12:00','12:00','07:39','0','0','0',''),(81,'February, 2023','2023-02-08','','','','','0','0','0',''),(81,'February, 2023','2023-02-02','08:35','12:09','01:13','','1','0','3',''),(81,'February, 2023','2023-02-04','','','','','0','0','0',''),(81,'February, 2023','2023-02-03','09:07','12:14','12:49','05:02','1','0','7',''),(81,'February, 2023','2023-02-06','07:33','12:49','01:00','','0','0','4',''),(81,'February, 2023','2023-02-11','','10:39','','06:35','0','0','0',''),(81,'February, 2023','2023-02-13','06:51','','','','0','0','0',''),(81,'February, 2023','2023-02-10','08:57','12:01','12:27','09:12','1','0','7',''),(81,'February, 2023','2023-02-14','12:04','12:00','12:00','09:52','0','0','0',''),(81,'February, 2023','2023-02-15','08:37','12:00','12:00','08:20','0','0','0',''),(81,'February, 2023','2023-02-05','','','','','0','0','0',''),(81,'February, 2023','2023-02-12','','','','','0','0','0',''),(81,'February, 2023','2023-02-01','07:49','12:12','12:37','07:01','0','0','8',''),(81,'February, 2023','2023-02-09','09:14','12:42','12:58','10:51','1','0','7',''),(82,'February, 2023','2023-02-07','09:07','12:05','12:15','06:51','1','0','7',''),(82,'February, 2023','2023-02-08','08:50','12:50','01:00','07:07','1','0','7',''),(82,'February, 2023','2023-02-02','08:26','12:07','12:51','07:40','0','0','8',''),(82,'February, 2023','2023-02-04','','','','','0','0','0',''),(82,'February, 2023','2023-02-03','08:48','12:03','12:13','06:44','1','0','7',''),(82,'February, 2023','2023-02-06','09:08','12:07','12:18','07:41','1','0','7',''),(82,'February, 2023','2023-02-11','','','','','0','0','0',''),(82,'February, 2023','2023-02-13','08:48','12:00','01:07','07:13','1','0','7',''),(82,'February, 2023','2023-02-10','07:48','12:02','12:38','06:17','0','0','8',''),(82,'February, 2023','2023-02-14','08:24','12:10','12:21','08:08','0','0','8',''),(82,'February, 2023','2023-02-15','','','01:18','06:44','0','0','4',''),(82,'February, 2023','2023-02-05','','','','','0','0','0',''),(82,'February, 2023','2023-02-12','','','','','0','0','0',''),(82,'February, 2023','2023-02-01','06:55','12:05','12:41','','0','0','4',''),(82,'February, 2023','2023-02-09','08:54','12:19','12:30','08:02','1','0','7',''),(84,'February, 2023','2023-02-07','08:02','12:06','12:21','05:13','0','0','8',''),(84,'February, 2023','2023-02-08','08:11','12:05','12:26','04:12','0','1','7',''),(84,'February, 2023','2023-02-02','07:58','12:08','12:20','05:09','0','0','8',''),(84,'February, 2023','2023-02-04','','','','','0','0','0',''),(84,'February, 2023','2023-02-03','07:48','12:07','12:21','05:19','0','0','8',''),(84,'February, 2023','2023-02-06','08:33','12:23','12:34','05:35','1','0','7',''),(84,'February, 2023','2023-02-11','','','','','0','0','0',''),(84,'February, 2023','2023-02-13','08:08','12:21','12:31','08:24','0','0','8',''),(84,'February, 2023','2023-02-10','08:06','12:10','12:26','05:57','0','0','8',''),(84,'February, 2023','2023-02-14','08:18','12:13','12:24','06:39','0','0','8',''),(84,'February, 2023','2023-02-15','08:20','12:32','12:53','05:13','0','0','8',''),(84,'February, 2023','2023-02-05','','','','','0','0','0',''),(84,'February, 2023','2023-02-12','','','','','0','0','0',''),(84,'February, 2023','2023-02-01','07:26','12:05','12:39','05:19','0','0','8',''),(84,'February, 2023','2023-02-09','08:31','12:10','12:20','05:22','1','0','7',''),(85,'February, 2023','2023-02-07','08:03','12:00','12:00','05:47','0','0','0',''),(85,'February, 2023','2023-02-08','','12:05','12:50','05:32','0','0','4',''),(85,'February, 2023','2023-02-02','07:45','12:00','12:55','05:06','0','0','4',''),(85,'February, 2023','2023-02-04','','','','','0','0','0',''),(85,'February, 2023','2023-02-03','07:55','','05:22','','0','0','0',''),(85,'February, 2023','2023-02-06','07:48','12:00','12:00','06:15','0','0','0',''),(85,'February, 2023','2023-02-11','','','','','0','0','0',''),(85,'February, 2023','2023-02-13','08:08','12:24','','','0','0','4',''),(85,'February, 2023','2023-02-10','08:14','12:00','12:00','05:53','0','0','0',''),(85,'February, 2023','2023-02-14','07:42','','','','0','0','0',''),(85,'February, 2023','2023-02-15','','12:14','12:40','','0','0','0',''),(85,'February, 2023','2023-02-05','','','','','0','0','0',''),(85,'February, 2023','2023-02-12','','','','','0','0','0',''),(85,'February, 2023','2023-02-01','07:51','12:00','12:00','05:43','0','0','0',''),(85,'February, 2023','2023-02-09','08:01','','','','0','0','0',''),(86,'February, 2023','2023-02-07','08:26','12:04','12:16','05:03','0','0','8',''),(86,'February, 2023','2023-02-08','','','01:01','05:47','0','0','4',''),(86,'February, 2023','2023-02-02','07:29','12:20','12:31','07:07','0','0','8',''),(86,'February, 2023','2023-02-04','','','','','0','0','0',''),(86,'February, 2023','2023-02-03','07:54','12:04','12:15','03:49','0','1','7',''),(86,'February, 2023','2023-02-06','08:28','12:00','12:10','05:35','0','0','8',''),(86,'February, 2023','2023-02-11','','','','','0','0','0',''),(86,'February, 2023','2023-02-13','07:27','12:03','12:15','06:13','0','0','8',''),(86,'February, 2023','2023-02-10','08:13','12:01','12:17','05:03','0','0','8',''),(86,'February, 2023','2023-02-14','08:12','12:06','12:18','06:50','0','0','8',''),(86,'February, 2023','2023-02-15','07:52','12:00','12:11','05:37','0','0','8',''),(86,'February, 2023','2023-02-05','','','','','0','0','0',''),(86,'February, 2023','2023-02-12','','','','','0','0','0',''),(86,'February, 2023','2023-02-01','07:09','12:06','12:36','05:01','0','0','8',''),(86,'February, 2023','2023-02-09','08:37','12:00','12:11','06:15','1','0','7',''),(87,'February, 2023','2023-02-07','07:53','12:06','12:21','05:30','0','0','8',''),(87,'February, 2023','2023-02-08','','','','','0','0','0',''),(87,'February, 2023','2023-02-02','07:59','12:10','12:25','','0','0','4',''),(87,'February, 2023','2023-02-04','','','','','0','0','0',''),(87,'February, 2023','2023-02-03','','12:09','12:19','05:23','0','0','4',''),(87,'February, 2023','2023-02-06','07:30','12:24','12:00','05:39','0','0','4',''),(87,'February, 2023','2023-02-11','','','','','0','0','0',''),(87,'February, 2023','2023-02-13','07:57','12:01','01:04','05:12','0','0','8',''),(87,'February, 2023','2023-02-10','07:54','12:17','12:00','05:25','0','0','8',''),(87,'February, 2023','2023-02-14','07:51','12:15','12:26','06:50','0','0','8',''),(87,'February, 2023','2023-02-15','08:13','12:06','12:19','05:37','0','0','8',''),(87,'February, 2023','2023-02-05','','','','','0','0','0',''),(87,'February, 2023','2023-02-12','','','','','0','0','0',''),(87,'February, 2023','2023-02-01','07:55','','','','0','0','0',''),(87,'February, 2023','2023-02-09','08:02','12:05','12:16','05:30','0','0','8',''),(89,'February, 2023','2023-02-07','08:20','12:11','12:25','05:06','0','0','8',''),(89,'February, 2023','2023-02-08','07:55','12:11','12:22','05:18','0','0','8',''),(89,'February, 2023','2023-02-02','07:59','12:36','12:53','05:07','0','0','8',''),(89,'February, 2023','2023-02-04','','','','','0','0','0',''),(89,'February, 2023','2023-02-03','08:09','12:00','12:56','05:18','0','0','8',''),(89,'February, 2023','2023-02-06','07:54','12:18','12:34','05:02','0','0','8',''),(89,'February, 2023','2023-02-11','','','','','0','0','0',''),(89,'February, 2023','2023-02-13','07:58','12:29','12:39','05:13','0','0','8',''),(89,'February, 2023','2023-02-10','07:27','12:00','12:12','05:09','0','0','8',''),(89,'February, 2023','2023-02-14','08:00','12:05','12:44','06:30','0','0','8',''),(89,'February, 2023','2023-02-15','07:51','12:19','12:31','05:02','0','0','8',''),(89,'February, 2023','2023-02-05','','','','','0','0','0',''),(89,'February, 2023','2023-02-12','','','','','0','0','0',''),(89,'February, 2023','2023-02-01','07:49','12:09','12:19','05:32','0','0','8',''),(89,'February, 2023','2023-02-09','08:11','12:09','12:19','05:20','0','0','8',''),(90,'February, 2023','2023-02-07','','','','','0','0','0',''),(90,'February, 2023','2023-02-08','','','','','0','0','0',''),(90,'February, 2023','2023-02-02','','','','','0','0','0',''),(90,'February, 2023','2023-02-04','','','','','0','0','0',''),(90,'February, 2023','2023-02-03','','','','','0','0','0',''),(90,'February, 2023','2023-02-06','','','','','0','0','0',''),(90,'February, 2023','2023-02-11','','','','','0','0','0',''),(90,'February, 2023','2023-02-13','08:05','12:00','12:11','05:01','0','0','8',''),(90,'February, 2023','2023-02-10','','','','','0','0','0',''),(90,'February, 2023','2023-02-14','08:23','12:01','12:11','05:00','0','0','8',''),(90,'February, 2023','2023-02-15','08:17','12:02','12:16','05:03','0','0','8',''),(90,'February, 2023','2023-02-05','','','','','0','0','0',''),(90,'February, 2023','2023-02-12','','','','','0','0','0',''),(90,'February, 2023','2023-02-01','','','','','0','0','0',''),(90,'February, 2023','2023-02-09','','','','','0','0','0',''),(91,'February, 2023','2023-02-07','','','','','0','0','0',''),(91,'February, 2023','2023-02-08','08:23','12:00','12:00','05:07','0','0','0',''),(91,'February, 2023','2023-02-02','','','','','0','0','0',''),(91,'February, 2023','2023-02-04','','','','','0','0','0',''),(91,'February, 2023','2023-02-03','','','','','0','0','0',''),(91,'February, 2023','2023-02-06','08:04','12:00','12:00','05:01','0','0','0',''),(91,'February, 2023','2023-02-11','','','','','0','0','0',''),(91,'February, 2023','2023-02-13','','','','09:41','0','0','0',''),(91,'February, 2023','2023-02-10','','','','05:03','0','0','0',''),(91,'February, 2023','2023-02-14','','','','','0','0','0',''),(91,'February, 2023','2023-02-15','','','','','0','0','0',''),(91,'February, 2023','2023-02-05','','','','','0','0','0',''),(91,'February, 2023','2023-02-12','10:30','12:00','12:00','03:07','0','0','0',''),(91,'February, 2023','2023-02-01','','','','06:11','0','0','0',''),(91,'February, 2023','2023-02-09','','','','05:29','0','0','0',''),(92,'February, 2023','2023-02-07','09:39','','','','0','0','0',''),(92,'February, 2023','2023-02-08','','','','','0','0','0',''),(92,'February, 2023','2023-02-02','','','','','0','0','0',''),(92,'February, 2023','2023-02-04','','','','','0','0','0',''),(92,'February, 2023','2023-02-03','','','','05:36','0','0','0',''),(92,'February, 2023','2023-02-06','10:31','','','','0','0','0',''),(92,'February, 2023','2023-02-11','','','','','0','0','0',''),(92,'February, 2023','2023-02-13','','','','','0','0','0',''),(92,'February, 2023','2023-02-10','','','','','0','0','0',''),(92,'February, 2023','2023-02-14','','','','','0','0','0',''),(92,'February, 2023','2023-02-15','','','','05:59','0','0','0',''),(92,'February, 2023','2023-02-05','','','','','0','0','0',''),(92,'February, 2023','2023-02-12','10:30','12:00','12:00','03:06','0','0','0',''),(92,'February, 2023','2023-02-01','','','12:06','06:11','0','0','4',''),(92,'February, 2023','2023-02-09','','','','','0','0','0',''),(93,'February, 2023','2023-02-07','07:48','12:05','12:19','05:14','0','0','8',''),(93,'February, 2023','2023-02-08','07:44','12:07','12:27','05:30','0','0','8',''),(93,'February, 2023','2023-02-02','08:10','12:01','12:14','05:08','0','0','8',''),(93,'February, 2023','2023-02-04','','','','','0','0','0',''),(93,'February, 2023','2023-02-03','08:20','12:03','12:17','05:05','0','0','8',''),(93,'February, 2023','2023-02-06','07:31','12:10','12:25','05:26','0','0','8',''),(93,'February, 2023','2023-02-11','','','','','0','0','0',''),(93,'February, 2023','2023-02-13','07:53','12:22','12:34','','0','0','4',''),(93,'February, 2023','2023-02-10','07:59','12:02','12:19','05:56','0','0','8',''),(93,'February, 2023','2023-02-14','07:36','12:00','12:27','06:29','0','0','8',''),(93,'February, 2023','2023-02-15','08:05','12:04','12:16','05:22','0','0','8',''),(93,'February, 2023','2023-02-05','','','','','0','0','0',''),(93,'February, 2023','2023-02-12','','','','','0','0','0',''),(93,'February, 2023','2023-02-01','07:30','12:01','12:33','05:15','0','0','8',''),(93,'February, 2023','2023-02-09','07:58','12:08','12:27','05:26','0','0','8',''),(94,'February, 2023','2023-02-07','08:42','12:04','12:16','05:36','1','0','7',''),(94,'February, 2023','2023-02-08','08:10','12:19','12:30','05:00','0','0','8',''),(94,'February, 2023','2023-02-02','09:03','12:59','01:10','05:22','1','0','7',''),(94,'February, 2023','2023-02-04','','','','','0','0','0',''),(94,'February, 2023','2023-02-03','08:46','12:04','12:15','','1','0','3',''),(94,'February, 2023','2023-02-06','08:31','12:53','01:04','05:06','1','0','7',''),(94,'February, 2023','2023-02-11','','','','','0','0','0',''),(94,'February, 2023','2023-02-13','07:58','12:06','12:55','06:09','0','0','8',''),(94,'February, 2023','2023-02-10','08:37','12:04','12:52','05:02','1','0','7',''),(94,'February, 2023','2023-02-14','','12:11','01:00','06:30','0','0','4',''),(94,'February, 2023','2023-02-15','09:03','12:01','12:58','05:40','1','0','7',''),(94,'February, 2023','2023-02-05','','','','','0','0','0',''),(94,'February, 2023','2023-02-12','','','','','0','0','0',''),(94,'February, 2023','2023-02-01','07:14','12:03','12:44','','0','0','4',''),(94,'February, 2023','2023-02-09','08:58','12:27','12:00','05:17','1','0','3',''),(96,'February, 2023','2023-02-07','','','','','0','0','0',''),(96,'February, 2023','2023-02-08','','','','','0','0','0',''),(96,'February, 2023','2023-02-02','','','','','0','0','0',''),(96,'February, 2023','2023-02-04','','','','','0','0','0',''),(96,'February, 2023','2023-02-03','','','','','0','0','0',''),(96,'February, 2023','2023-02-06','','','','','0','0','0',''),(96,'February, 2023','2023-02-11','','','','','0','0','0',''),(96,'February, 2023','2023-02-13','07:56','12:47','12:59','05:01','0','0','8',''),(96,'February, 2023','2023-02-10','','','','','0','0','0',''),(96,'February, 2023','2023-02-14','07:41','12:00','12:00','05:37','0','0','0',''),(96,'February, 2023','2023-02-15','07:47','12:43','12:54','05:00','0','0','8',''),(96,'February, 2023','2023-02-05','','','','','0','0','0',''),(96,'February, 2023','2023-02-12','','','','','0','0','0',''),(96,'February, 2023','2023-02-01','','','','','0','0','0',''),(96,'February, 2023','2023-02-09','','','','','0','0','0',''),(97,'February, 2023','2023-02-07','08:02','12:07','12:21','05:13','0','0','8',''),(97,'February, 2023','2023-02-08','08:11','12:05','12:23','04:12','0','1','7',''),(97,'February, 2023','2023-02-02','07:58','12:07','12:20','05:00','0','0','8',''),(97,'February, 2023','2023-02-04','','','','','0','0','0',''),(97,'February, 2023','2023-02-03','07:48','12:07','12:20','05:19','0','0','8',''),(97,'February, 2023','2023-02-06','08:33','12:23','12:33','05:34','1','0','7',''),(97,'February, 2023','2023-02-11','','','','','0','0','0',''),(97,'February, 2023','2023-02-13','08:06','12:02','12:32','05:13','0','0','8',''),(97,'February, 2023','2023-02-10','08:06','12:10','12:25','05:57','0','0','8',''),(97,'February, 2023','2023-02-14','08:18','12:13','12:24','06:39','0','0','8',''),(97,'February, 2023','2023-02-15','08:18','12:06','12:19','05:14','0','0','8',''),(97,'February, 2023','2023-02-05','','','','','0','0','0',''),(97,'February, 2023','2023-02-12','','','','','0','0','0',''),(97,'February, 2023','2023-02-01','07:24','12:04','12:33','05:19','0','0','8',''),(97,'February, 2023','2023-02-09','08:31','12:08','12:20','05:22','1','0','7',''),(98,'February, 2023','2023-02-07','07:50','12:01','12:13','05:10','0','0','8',''),(98,'February, 2023','2023-02-08','07:50','12:00','12:14','05:05','0','0','8',''),(98,'February, 2023','2023-02-02','07:37','12:03','12:14','05:07','0','0','8',''),(98,'February, 2023','2023-02-04','','','','','0','0','0',''),(98,'February, 2023','2023-02-03','07:53','12:02','12:13','05:06','0','0','8',''),(98,'February, 2023','2023-02-06','07:35','12:00','12:11','05:06','0','0','8',''),(98,'February, 2023','2023-02-11','','','','','0','0','0',''),(98,'February, 2023','2023-02-13','07:45','12:00','12:11','05:03','0','0','8',''),(98,'February, 2023','2023-02-10','07:45','12:00','12:12','05:14','0','0','8',''),(98,'February, 2023','2023-02-14','07:57','12:00','12:53','06:35','0','0','4',''),(98,'February, 2023','2023-02-15','07:55','12:01','12:12','05:40','0','0','8',''),(98,'February, 2023','2023-02-05','','','','','0','0','0',''),(98,'February, 2023','2023-02-12','','','','','0','0','0',''),(98,'February, 2023','2023-02-01','07:22','12:00','12:11','05:04','0','0','8',''),(98,'February, 2023','2023-02-09','07:52','12:00','12:12','05:11','0','0','8',''),(99,'February, 2023','2023-02-07','07:38','12:01','12:45','05:08','0','0','8',''),(99,'February, 2023','2023-02-08','07:48','12:02','12:31','05:05','0','0','8',''),(99,'February, 2023','2023-02-02','','','','','0','0','0',''),(99,'February, 2023','2023-02-04','','','','','0','0','0',''),(99,'February, 2023','2023-02-03','','','','','0','0','0',''),(99,'February, 2023','2023-02-06','07:59','12:54','12:00','05:09','0','0','8',''),(99,'February, 2023','2023-02-11','08:23','12:00','12:00','05:01','0','0','0',''),(99,'February, 2023','2023-02-13','07:47','12:23','12:00','05:02','0','0','4',''),(99,'February, 2023','2023-02-10','07:54','12:03','12:48','06:47','0','0','8',''),(99,'February, 2023','2023-02-14','07:51','12:42','12:00','06:36','0','0','4',''),(99,'February, 2023','2023-02-15','07:56','12:01','12:47','05:12','0','0','8',''),(99,'February, 2023','2023-02-05','','','','','0','0','0',''),(99,'February, 2023','2023-02-12','','08:08','','','0','0','0',''),(99,'February, 2023','2023-02-01','07:42','','','','0','0','0',''),(99,'February, 2023','2023-02-09','07:37','12:01','12:43','05:12','0','0','8',''),(100,'February, 2023','2023-02-07','10:02','12:00','12:14','05:05','2','0','6',''),(100,'February, 2023','2023-02-08','08:01','12:28','01:01','05:30','0','0','8',''),(100,'February, 2023','2023-02-02','07:58','12:08','12:19','','0','0','4',''),(100,'February, 2023','2023-02-04','','','','','0','0','0',''),(100,'February, 2023','2023-02-03','07:27','12:05','12:18','05:56','0','0','8',''),(100,'February, 2023','2023-02-06','08:33','12:00','12:11','05:21','1','0','7',''),(100,'February, 2023','2023-02-11','','','','','0','0','0',''),(100,'February, 2023','2023-02-13','07:58','12:14','06:03','','0','0','4',''),(100,'February, 2023','2023-02-10','07:49','12:04','12:18','05:45','0','0','8',''),(100,'February, 2023','2023-02-14','08:02','12:06','12:00','06:17','0','0','4',''),(100,'February, 2023','2023-02-15','09:11','12:02','12:36','05:40','1','0','7',''),(100,'February, 2023','2023-02-05','','','','','0','0','0',''),(100,'February, 2023','2023-02-12','','','','','0','0','0',''),(100,'February, 2023','2023-02-01','07:18','12:04','12:39','05:00','0','0','8',''),(100,'February, 2023','2023-02-09','07:31','12:19','12:30','06:28','0','0','8',''),(101,'February, 2023','2023-02-07','','','','','0','0','0',''),(101,'February, 2023','2023-02-08','','','','','0','0','0',''),(101,'February, 2023','2023-02-02','','','','','0','0','0',''),(101,'February, 2023','2023-02-04','','','','','0','0','0',''),(101,'February, 2023','2023-02-03','','','','','0','0','0',''),(101,'February, 2023','2023-02-06','','','','','0','0','0',''),(101,'February, 2023','2023-02-11','','','','','0','0','0',''),(101,'February, 2023','2023-02-13','07:52','12:00','12:11','05:06','0','0','8',''),(101,'February, 2023','2023-02-10','','','','','0','0','0',''),(101,'February, 2023','2023-02-14','07:46','12:00','12:11','06:31','0','0','8',''),(101,'February, 2023','2023-02-15','08:16','12:02','12:12','05:20','0','0','8',''),(101,'February, 2023','2023-02-05','','','','','0','0','0',''),(101,'February, 2023','2023-02-12','','','','','0','0','0',''),(101,'February, 2023','2023-02-01','','','','','0','0','0',''),(101,'February, 2023','2023-02-09','','','','','0','0','0',''),(103,'February, 2023','2023-02-07','07:02','12:03','12:14','05:10','0','0','8',''),(103,'February, 2023','2023-02-08','06:45','12:00','05:09','','0','0','4',''),(103,'February, 2023','2023-02-02','07:22','12:04','12:16','05:22','0','0','8',''),(103,'February, 2023','2023-02-04','','','','','0','0','0',''),(103,'February, 2023','2023-02-03','07:40','12:01','12:11','05:00','0','0','8',''),(103,'February, 2023','2023-02-06','07:44','12:00','12:11','05:07','0','0','8',''),(103,'February, 2023','2023-02-11','','','','','0','0','0',''),(103,'February, 2023','2023-02-13','07:20','12:01','06:03','','0','0','4',''),(103,'February, 2023','2023-02-10','07:02','12:01','12:11','05:03','0','0','8',''),(103,'February, 2023','2023-02-14','06:31','12:06','12:16','06:31','0','0','8',''),(103,'February, 2023','2023-02-15','06:42','12:01','12:12','05:02','0','0','8',''),(103,'February, 2023','2023-02-05','','','','','0','0','0',''),(103,'February, 2023','2023-02-12','','','','','0','0','0',''),(103,'February, 2023','2023-02-01','06:23','12:04','12:34','05:00','0','0','8',''),(103,'February, 2023','2023-02-09','07:03','12:17','12:28','05:15','0','0','8',''),(104,'February, 2023','2023-02-07','08:05','12:00','12:12','05:08','0','0','8',''),(104,'February, 2023','2023-02-08','08:20','12:00','12:12','05:13','0','0','8',''),(104,'February, 2023','2023-02-02','','','','','0','0','0',''),(104,'February, 2023','2023-02-04','','','','','0','0','0',''),(104,'February, 2023','2023-02-03','','','','','0','0','0',''),(104,'February, 2023','2023-02-06','','','','','0','0','0',''),(104,'February, 2023','2023-02-11','','','','','0','0','0',''),(104,'February, 2023','2023-02-13','08:27','12:03','12:55','06:13','0','0','8',''),(104,'February, 2023','2023-02-10','08:33','12:16','12:27','05:46','1','0','7',''),(104,'February, 2023','2023-02-14','08:27','12:06','12:16','06:52','0','0','8',''),(104,'February, 2023','2023-02-15','09:38','12:20','12:00','08:43','3','0','5',''),(104,'February, 2023','2023-02-05','','','','','0','0','0',''),(104,'February, 2023','2023-02-12','','','','','0','0','0',''),(104,'February, 2023','2023-02-01','07:14','12:04','12:39','05:00','0','0','8',''),(104,'February, 2023','2023-02-09','08:16','12:30','12:00','06:25','0','0','4',''),(105,'February, 2023','2023-02-07','08:01','12:05','12:21','05:58','0','0','8',''),(105,'February, 2023','2023-02-08','07:45','12:28','12:00','07:35','0','0','4',''),(105,'February, 2023','2023-02-02','07:50','12:08','12:25','','0','0','4',''),(105,'February, 2023','2023-02-04','','','','','0','0','0',''),(105,'February, 2023','2023-02-03','07:40','12:07','12:52','','0','0','4',''),(105,'February, 2023','2023-02-06','07:57','12:01','12:12','06:02','0','0','8',''),(105,'February, 2023','2023-02-11','','','','','0','0','0',''),(105,'February, 2023','2023-02-13','07:39','12:18','12:00','06:10','0','0','4',''),(105,'February, 2023','2023-02-10','07:18','12:00','12:00','06:13','0','0','0',''),(105,'February, 2023','2023-02-14','07:51','12:15','12:26','06:49','0','0','8',''),(105,'February, 2023','2023-02-15','08:13','12:08','12:20','05:37','0','0','8',''),(105,'February, 2023','2023-02-05','','','','','0','0','0',''),(105,'February, 2023','2023-02-12','','','','','0','0','0',''),(105,'February, 2023','2023-02-01','07:11','12:05','12:39','05:25','0','0','8',''),(105,'February, 2023','2023-02-09','07:45','12:16','12:00','07:39','0','0','4',''),(106,'February, 2023','2023-02-07','08:09','12:04','12:15','05:08','0','0','8',''),(106,'February, 2023','2023-02-08','08:08','12:00','12:10','05:47','0','0','8',''),(106,'February, 2023','2023-02-02','07:32','12:20','12:31','05:09','0','0','8',''),(106,'February, 2023','2023-02-04','','','','','0','0','0',''),(106,'February, 2023','2023-02-03','08:34','12:04','12:15','05:10','1','0','7',''),(106,'February, 2023','2023-02-06','07:36','12:00','12:10','05:05','0','0','8',''),(106,'February, 2023','2023-02-11','','','','','0','0','0',''),(106,'February, 2023','2023-02-13','07:25','12:03','12:15','06:08','0','0','8',''),(106,'February, 2023','2023-02-10','07:29','12:04','12:00','05:02','0','0','4',''),(106,'February, 2023','2023-02-14','07:55','12:05','12:00','06:41','0','0','4',''),(106,'February, 2023','2023-02-15','07:40','12:01','12:15','05:48','0','0','8',''),(106,'February, 2023','2023-02-05','','','','','0','0','0',''),(106,'February, 2023','2023-02-12','08:12','','','','0','0','0',''),(106,'February, 2023','2023-02-01','07:15','12:05','12:36','05:01','0','0','8',''),(106,'February, 2023','2023-02-09','06:43','12:17','12:30','06:14','0','0','8',''),(107,'February, 2023','2023-02-07','07:51','12:04','12:19','05:08','0','0','8',''),(107,'February, 2023','2023-02-08','07:52','12:03','12:14','05:04','0','0','8',''),(107,'February, 2023','2023-02-02','07:44','12:00','12:51','05:22','0','0','8',''),(107,'February, 2023','2023-02-04','','','','','0','0','0',''),(107,'February, 2023','2023-02-03','07:48','12:00','','','0','0','4',''),(107,'February, 2023','2023-02-06','07:44','12:00','12:10','05:11','0','0','8',''),(107,'February, 2023','2023-02-11','','','','','0','0','0',''),(107,'February, 2023','2023-02-13','07:28','12:01','12:48','06:07','0','0','8',''),(107,'February, 2023','2023-02-10','07:51','12:01','12:11','05:04','0','0','8',''),(107,'February, 2023','2023-02-14','07:45','12:00','12:11','06:04','0','0','8',''),(107,'February, 2023','2023-02-15','08:16','12:00','12:54','05:00','0','0','8',''),(107,'February, 2023','2023-02-05','','','','','0','0','0',''),(107,'February, 2023','2023-02-12','','','','','0','0','0',''),(107,'February, 2023','2023-02-01','07:15','12:00','12:27','05:00','0','0','8',''),(107,'February, 2023','2023-02-09','07:20','12:18','12:30','05:24','0','0','8',''),(108,'February, 2023','2023-02-07','07:13','12:15','12:00','05:08','0','0','8',''),(108,'February, 2023','2023-02-08','07:20','12:04','12:14','05:04','0','0','8',''),(108,'February, 2023','2023-02-02','07:38','12:08','12:19','','0','0','4',''),(108,'February, 2023','2023-02-04','','','','','0','0','0',''),(108,'February, 2023','2023-02-03','07:15','12:05','12:16','05:01','0','0','8',''),(108,'February, 2023','2023-02-06','','','12:15','05:00','0','0','4',''),(108,'February, 2023','2023-02-11','','','','','0','0','0',''),(108,'February, 2023','2023-02-13','07:55','12:00','12:50','06:13','0','0','4',''),(108,'February, 2023','2023-02-10','07:27','12:02','12:16','05:00','0','0','8',''),(108,'February, 2023','2023-02-14','07:08','12:10','12:20','06:51','0','0','8',''),(108,'February, 2023','2023-02-15','07:16','12:00','12:11','05:04','0','0','8',''),(108,'February, 2023','2023-02-05','','','','','0','0','0',''),(108,'February, 2023','2023-02-12','','','','','0','0','0',''),(108,'February, 2023','2023-02-01','06:41','12:04','12:41','05:00','0','0','8',''),(108,'February, 2023','2023-02-09','07:04','12:16','12:28','05:15','0','0','8',''),(109,'February, 2023','2023-02-07','07:58','12:15','12:25','07:01','0','0','8',''),(109,'February, 2023','2023-02-08','08:06','12:11','12:22','05:18','0','0','8',''),(109,'February, 2023','2023-02-02','08:28','12:36','12:53','','0','0','4',''),(109,'February, 2023','2023-02-04','','','','','0','0','0',''),(109,'February, 2023','2023-02-03','07:58','12:00','12:56','05:18','0','0','8',''),(109,'February, 2023','2023-02-06','08:00','12:18','12:37','','0','0','4',''),(109,'February, 2023','2023-02-11','09:14','11:43','','','1','0','2',''),(109,'February, 2023','2023-02-13','08:10','12:29','12:40','05:12','0','0','8',''),(109,'February, 2023','2023-02-10','07:59','12:00','12:12','05:10','0','0','8',''),(109,'February, 2023','2023-02-14','08:05','12:05','12:44','06:30','0','0','8',''),(109,'February, 2023','2023-02-15','08:02','12:19','12:31','05:02','0','0','8',''),(109,'February, 2023','2023-02-05','09:48','','','','0','0','0',''),(109,'February, 2023','2023-02-12','','','','','0','0','0',''),(109,'February, 2023','2023-02-01','08:00','12:09','12:19','05:34','0','0','8',''),(109,'February, 2023','2023-02-09','08:06','12:09','12:19','06:33','0','0','8',''),(112,'February, 2023','2023-02-07','08:24','12:00','','','0','0','4',''),(112,'February, 2023','2023-02-08','08:15','12:01','12:13','05:09','0','0','8',''),(112,'February, 2023','2023-02-02','08:03','12:00','12:11','','0','0','4',''),(112,'February, 2023','2023-02-04','','','','','0','0','0',''),(112,'February, 2023','2023-02-03','06:22','12:11','12:21','08:00','0','0','8',''),(112,'February, 2023','2023-02-06','08:33','12:01','12:11','','1','0','3',''),(112,'February, 2023','2023-02-11','','','','','0','0','0',''),(112,'February, 2023','2023-02-13','08:15','12:00','01:01','07:14','0','0','4',''),(112,'February, 2023','2023-02-10','','','01:01','05:40','0','0','4',''),(112,'February, 2023','2023-02-14','07:53','12:12','12:00','07:08','0','0','4',''),(112,'February, 2023','2023-02-15','','','','05:35','0','0','0',''),(112,'February, 2023','2023-02-05','','','','','0','0','0',''),(112,'February, 2023','2023-02-12','','','','','0','0','0',''),(112,'February, 2023','2023-02-01','08:11','12:03','12:38','07:55','0','0','8',''),(112,'February, 2023','2023-02-09','','12:01','','05:35','0','0','0',''),(113,'February, 2023','2023-02-07','','','','','0','0','0',''),(113,'February, 2023','2023-02-08','07:20','12:01','12:39','05:03','0','0','8',''),(113,'February, 2023','2023-02-02','05:45','12:00','12:00','07:55','0','0','0',''),(113,'February, 2023','2023-02-04','','','','','0','0','0',''),(113,'February, 2023','2023-02-03','05:09','12:00','12:00','07:13','0','0','0',''),(113,'February, 2023','2023-02-06','07:45','12:05','12:41','05:02','0','0','8',''),(113,'February, 2023','2023-02-11','07:56','12:00','12:00','04:40','0','0','0',''),(113,'February, 2023','2023-02-13','','','','','0','0','0',''),(113,'February, 2023','2023-02-10','07:05','12:08','12:31','05:47','0','0','8',''),(113,'February, 2023','2023-02-14','06:18','12:00','12:35','07:16','0','0','4',''),(113,'February, 2023','2023-02-15','05:17','12:28','12:00','06:22','0','0','4',''),(113,'February, 2023','2023-02-05','','','','','0','0','0',''),(113,'February, 2023','2023-02-12','','','','','0','0','0',''),(113,'February, 2023','2023-02-01','06:41','12:03','12:28','05:50','0','0','8',''),(113,'February, 2023','2023-02-09','07:02','12:31','12:51','05:03','0','0','8',''),(115,'February, 2023','2023-02-07','07:36','12:03','12:19','05:09','0','0','8',''),(115,'February, 2023','2023-02-08','08:02','12:00','12:12','05:10','0','0','8',''),(115,'February, 2023','2023-02-02','','','','','0','0','0',''),(115,'February, 2023','2023-02-04','','','','','0','0','0',''),(115,'February, 2023','2023-02-03','','','','','0','0','0',''),(115,'February, 2023','2023-02-06','','','','','0','0','0',''),(115,'February, 2023','2023-02-11','','','','','0','0','0',''),(115,'February, 2023','2023-02-13','07:17','12:02','12:56','05:35','0','0','8',''),(115,'February, 2023','2023-02-10','07:49','12:03','12:18','05:04','0','0','8',''),(115,'February, 2023','2023-02-14','07:43','12:00','12:11','06:22','0','0','8',''),(115,'February, 2023','2023-02-15','07:57','12:00','12:11','05:03','0','0','8',''),(115,'February, 2023','2023-02-05','','','','','0','0','0',''),(115,'February, 2023','2023-02-12','','','','','0','0','0',''),(115,'February, 2023','2023-02-01','07:15','12:11','12:40','05:08','0','0','8',''),(115,'February, 2023','2023-02-09','07:53','12:05','12:15','05:10','0','0','8',''),(117,'February, 2023','2023-02-07','','','','','0','0','0',''),(117,'February, 2023','2023-02-08','','','05:07','08:13','4','0','0',''),(117,'February, 2023','2023-02-02','','','','','0','0','0',''),(117,'February, 2023','2023-02-04','','','','','0','0','0',''),(117,'February, 2023','2023-02-03','','','05:20','07:03','4','0','0',''),(117,'February, 2023','2023-02-06','','','05:14','08:14','4','0','0',''),(117,'February, 2023','2023-02-11','09:28','12:22','12:36','05:09','1','0','7',''),(117,'February, 2023','2023-02-13','','','05:10','08:11','4','0','0',''),(117,'February, 2023','2023-02-10','','','05:10','08:12','4','0','0',''),(117,'February, 2023','2023-02-14','','','','','0','0','0',''),(117,'February, 2023','2023-02-15','','','05:05','08:35','4','0','0',''),(117,'February, 2023','2023-02-05','','','','','0','0','0',''),(117,'February, 2023','2023-02-12','','','','','0','0','0',''),(117,'February, 2023','2023-02-01','','','05:18','07:33','4','0','0',''),(117,'February, 2023','2023-02-09','','','','','0','0','0',''),(122,'February, 2023','2023-02-07','08:05','12:00','12:00','05:01','0','0','0',''),(122,'February, 2023','2023-02-08','08:00','12:35','12:52','05:00','0','0','8',''),(122,'February, 2023','2023-02-02','08:03','12:00','12:00','05:01','0','0','0',''),(122,'February, 2023','2023-02-04','','','','','0','0','0',''),(122,'February, 2023','2023-02-03','','','','','0','0','0',''),(122,'February, 2023','2023-02-06','08:21','12:38','12:49','05:00','0','0','8',''),(122,'February, 2023','2023-02-11','','','','','0','0','0',''),(122,'February, 2023','2023-02-13','08:06','12:46','12:58','','0','0','4',''),(122,'February, 2023','2023-02-10','08:01','12:43','12:56','05:06','0','0','8',''),(122,'February, 2023','2023-02-14','07:57','12:00','12:00','05:38','0','0','0',''),(122,'February, 2023','2023-02-15','08:18','12:43','12:53','','0','0','4',''),(122,'February, 2023','2023-02-05','','','','','0','0','0',''),(122,'February, 2023','2023-02-12','','','','','0','0','0',''),(122,'February, 2023','2023-02-01','07:52','12:40','12:51','05:06','0','0','8',''),(122,'February, 2023','2023-02-09','07:59','12:30','12:42','05:01','0','0','8',''),(123,'February, 2023','2023-02-07','07:50','12:31','12:43','05:32','0','0','8',''),(123,'February, 2023','2023-02-08','08:07','12:36','12:52','05:02','0','0','8',''),(123,'February, 2023','2023-02-02','07:24','12:01','12:16','','0','0','4',''),(123,'February, 2023','2023-02-04','08:35','12:01','12:28','05:09','1','0','7',''),(123,'February, 2023','2023-02-03','07:43','12:02','12:29','05:08','0','0','8',''),(123,'February, 2023','2023-02-06','07:40','12:38','12:50','05:04','0','0','8',''),(123,'February, 2023','2023-02-11','','','','','0','0','0',''),(123,'February, 2023','2023-02-13','07:34','12:35','12:00','10:19','0','0','4',''),(123,'February, 2023','2023-02-10','07:55','12:08','12:00','08:03','0','0','4',''),(123,'February, 2023','2023-02-14','07:29','','','','0','0','0',''),(123,'February, 2023','2023-02-15','07:54','12:00','12:00','07:08','0','0','0',''),(123,'February, 2023','2023-02-05','08:22','12:05','12:19','05:17','0','0','8',''),(123,'February, 2023','2023-02-12','','','','','0','0','0',''),(123,'February, 2023','2023-02-01','07:54','12:32','12:00','06:02','0','0','4',''),(123,'February, 2023','2023-02-09','07:49','12:34','12:00','07:32','0','0','4','');

/*Table structure for table `hr_emp_service_len` */

DROP TABLE IF EXISTS `hr_emp_service_len`;

CREATE TABLE `hr_emp_service_len` (
  `empnumber` varchar(25) NOT NULL,
  `EMPname` varchar(255) DEFAULT NULL,
  `svcyears` int(11) DEFAULT NULL,
  PRIMARY KEY (`empnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hr_emp_service_len` */

/*Table structure for table `hr_emp_shift` */

DROP TABLE IF EXISTS `hr_emp_shift`;

CREATE TABLE `hr_emp_shift` (
  `emp_number` varchar(50) NOT NULL,
  `timeIn` double DEFAULT 8,
  `timeOut` double DEFAULT 5.01,
  `amIN` double DEFAULT NULL,
  `amOUT` double DEFAULT NULL,
  `pmIN` double DEFAULT NULL,
  `pmOUT` double DEFAULT NULL,
  PRIMARY KEY (`emp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hr_emp_shift` */

/*Table structure for table `hr_holidays` */

DROP TABLE IF EXISTS `hr_holidays`;

CREATE TABLE `hr_holidays` (
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  `holiday_date` date NOT NULL,
  `recurring` tinyint(1) DEFAULT 0,
  `isfullday` tinyint(1) DEFAULT NULL,
  `regular_percentage` double DEFAULT NULL,
  `restday_percentage` double DEFAULT NULL,
  `overtime_percentage` double DEFAULT NULL,
  `holiday_type` varchar(255) DEFAULT 'regular',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`holiday_date`),
  UNIQUE KEY `holiday_id` (`holiday_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `hr_holidays` */

insert  into `hr_holidays`(`holiday_id`,`description`,`holiday_date`,`recurring`,`isfullday`,`regular_percentage`,`restday_percentage`,`overtime_percentage`,`holiday_type`,`remarks`) values (1,'NEW YEAR','2013-01-01',1,1,0,0.3,0.3,'regular',NULL),(2,'ARAW NG KAGITINGAN','2013-04-09',1,1,0,0.3,0.3,'regular',NULL),(3,'LABOR DAY','2013-05-01',1,1,0,0.3,0.3,'regular',NULL),(4,'INDEPENDENCE DAY','2013-06-12',1,1,0,0.3,0.3,'regular',NULL),(5,'BONIFACIO DAY','2013-11-30',1,1,0,0.3,0.3,'regular',NULL),(6,'CHRISTMAS DAY','2013-12-25',1,1,0,0.3,0.3,'regular',NULL),(7,'RIZAL DAY','2013-12-30',1,1,0,0.3,0.3,'regular',NULL),(8,'All Soul\'s Day','2019-11-01',0,NULL,NULL,NULL,NULL,'special','NON-WORKING'),(9,'All Saint\'s Day','2019-11-02',0,NULL,NULL,NULL,NULL,'special','NON-WORKING'),(10,'holiday','2020-04-09',0,NULL,NULL,NULL,NULL,'regular','holiday'),(11,'holiday','2020-04-10',0,NULL,NULL,NULL,NULL,'regular','holiday'),(12,'test','2021-12-11',0,NULL,NULL,NULL,NULL,'regular','test'),(13,'test','2021-12-13',0,NULL,NULL,NULL,NULL,'special','test'),(14,'test2','2021-12-14',0,NULL,NULL,NULL,NULL,'regular','test3'),(15,'test4','2021-12-15',0,NULL,NULL,NULL,NULL,'special','test4');

/*Table structure for table `incident_report` */

DROP TABLE IF EXISTS `incident_report`;

CREATE TABLE `incident_report` (
  `ir_id` int(11) NOT NULL AUTO_INCREMENT,
  `ir_no` varchar(255) DEFAULT NULL,
  `incident_date` date DEFAULT NULL,
  `incident_time` time DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `emp_mngr_id` int(11) DEFAULT NULL,
  `emp_mngr_name` varchar(255) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `type_of_event` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `type_of_incident` varchar(255) DEFAULT NULL,
  `incident_details` varchar(255) DEFAULT NULL,
  `external_involvement` varchar(255) DEFAULT NULL,
  `final_outcome` varchar(255) DEFAULT NULL,
  `future_prevention` varchar(255) DEFAULT NULL,
  `supplementary_information` varchar(255) DEFAULT NULL,
  `emp_explanation` text DEFAULT NULL,
  `mngr_actions` text DEFAULT NULL,
  `prepared_by` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `date_prepared` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `incident_report` */

/*Table structure for table `inventory_imported` */

DROP TABLE IF EXISTS `inventory_imported`;

CREATE TABLE `inventory_imported` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Item_ID` varchar(50) DEFAULT '',
  `Item_Desc` varchar(100) DEFAULT '',
  `Item_Type` varchar(100) DEFAULT '',
  `Stocking` varchar(50) DEFAULT '',
  `Qty_On_Hand` int(11) DEFAULT 0,
  `Last_Unit_Cost` double DEFAULT 0,
  `Desc_For_Purchases` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `inventory_imported` */

/*Table structure for table `leave_application` */

DROP TABLE IF EXISTS `leave_application`;

CREATE TABLE `leave_application` (
  `leave_app_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_date_from` date DEFAULT NULL,
  `leave_date_to` date DEFAULT NULL,
  `no_of_days` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `with_pay` int(11) DEFAULT 0,
  PRIMARY KEY (`leave_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `leave_application` */

/*Table structure for table `leave_approval` */

DROP TABLE IF EXISTS `leave_approval`;

CREATE TABLE `leave_approval` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_app_id` int(11) DEFAULT NULL,
  `leave_date_from` date DEFAULT NULL,
  `leave_date_to` date DEFAULT NULL,
  `no_of_days` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `with_pay` int(11) DEFAULT 0,
  `approved_by_id` int(11) DEFAULT NULL,
  `approved_by` varchar(255) DEFAULT NULL,
  `approved_by_position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `leave_approval` */

/*Table structure for table `leave_monitoring` */

DROP TABLE IF EXISTS `leave_monitoring`;

CREATE TABLE `leave_monitoring` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `yr` varchar(255) DEFAULT NULL,
  `emp_pk` int(11) DEFAULT NULL,
  `emp_code` varchar(255) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `vication_leave` double DEFAULT NULL,
  `sick_leave` double DEFAULT NULL,
  `paternity_leave` double DEFAULT NULL,
  `maternity_leave` double DEFAULT NULL,
  `first_jan` double DEFAULT NULL,
  `second_jan` double DEFAULT NULL,
  `first_feb` double DEFAULT NULL,
  `second_feb` double DEFAULT NULL,
  `first_mar` double DEFAULT NULL,
  `second_mar` double DEFAULT NULL,
  `first_apr` double DEFAULT NULL,
  `second_apr` double DEFAULT NULL,
  `first_may` double DEFAULT NULL,
  `second_may` double DEFAULT NULL,
  `first_jun` double DEFAULT NULL,
  `second_jun` double DEFAULT NULL,
  `first_jul` double DEFAULT NULL,
  `second_jul` double DEFAULT NULL,
  `first_aug` double DEFAULT NULL,
  `second_aug` double DEFAULT NULL,
  `first_sep` double DEFAULT NULL,
  `second_sep` double DEFAULT NULL,
  `first_oct` double DEFAULT NULL,
  `second_oct` double DEFAULT NULL,
  `first_nov` double DEFAULT NULL,
  `second_nov` double DEFAULT NULL,
  `first_dec` double DEFAULT NULL,
  `second_dec` double DEFAULT NULL,
  `used_vication_leave` double DEFAULT NULL,
  `used_sick_leave` double DEFAULT NULL,
  `used_paternity_leave` double DEFAULT NULL,
  `used_maternity_leave` double DEFAULT NULL,
  `bal_vication_leave` double DEFAULT NULL,
  `bal_sick_leave` double DEFAULT NULL,
  `bal_paternity_leave` double DEFAULT NULL,
  `bal_maternity_leave` double DEFAULT NULL,
  `total_leave_used` double DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

/*Data for the table `leave_monitoring` */

insert  into `leave_monitoring`(`pk`,`yr`,`emp_pk`,`emp_code`,`emp_name`,`vication_leave`,`sick_leave`,`paternity_leave`,`maternity_leave`,`first_jan`,`second_jan`,`first_feb`,`second_feb`,`first_mar`,`second_mar`,`first_apr`,`second_apr`,`first_may`,`second_may`,`first_jun`,`second_jun`,`first_jul`,`second_jul`,`first_aug`,`second_aug`,`first_sep`,`second_sep`,`first_oct`,`second_oct`,`first_nov`,`second_nov`,`first_dec`,`second_dec`,`used_vication_leave`,`used_sick_leave`,`used_paternity_leave`,`used_maternity_leave`,`bal_vication_leave`,`bal_sick_leave`,`bal_paternity_leave`,`bal_maternity_leave`,`total_leave_used`) values (1,'2022',1,'1','ABING, HACELJEN INCIPIDO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-151.57),(2,'2022',2,'2','AGOCOY, MONALIZA PESTANO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-55.89),(3,'2022',3,'3','AMPATIN, RITA ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,0,0,0,-8,0,0,0,-32),(4,'2022',4,'4','ANDRIN, ARNEL ROMERO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,'2022',5,'5','ARCALA, RITA TABAMO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24,104,0,0,0,0,0,0,24,0,0,0,152,0,0,0,-152,0,0,0,-275.97),(6,'2022',6,'6','ARNOCO, ELMA MORENO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-56),(7,'2022',7,'7','ARRAJI, FATIMA ESPINIDO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,'2022',8,'8','ARTIZUELA, RUTCHILLE ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,8,0,0,0,-8,0,0,0,-192),(9,'2022',9,'9','BABATID, GUADALUPE INSON',0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,-8,0,0,-16),(10,'2022',10,'10','BANUELOS, KHAREN GRACE MALALIS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-88),(11,'2022',11,'11','BELINARIO, KEVIN ',0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,16,8,0,0,-16,-8,0,0,-104),(12,'2022',12,'12','BERINO, DIANE BACOLOD',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-112),(13,'2022',13,'13','BERNADOS, JUNREY IGONG-IGONG',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,16,0,0,0,-16,0,0,-164.92000000000002),(14,'2022',14,'14','BERTE, HAZEL RAMOS',0,0,0,0,0,0,0,0,0,0,4.4,40,0,0,0,0,24,0,56,0,8,0,0,0,0,32,0,0,80,84.4,0,0,-80,-84.4,0,0,-209.10000000000002),(15,'2022',15,'15','BLANCO, JASMEN OCAY',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,'2022',16,'16','BOHOL, CHANRAH MAE OCA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(17,'2022',17,'17','BORJA, EDILBERTO IV BURAY',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(18,'2022',18,'18','BRIONES, MERALYN ALEGADO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,'2022',19,'19','BUSANO, MARYLAND ESNARDO',0,0,0,0,0,0,7.73,16,32,0,0,0,0,0,0,0,0,0,8,0,0,0,0,24,0,0,0,0,0,87.72999999999999,0,0,0,-87.72999999999999,0,0,-204.6),(20,'2022',20,'20','CABITANA, BERLYN TABAMO',0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,4,0,0,8,0,0,16,16,0,32,0,0,8,84,0,0,-8,-84,0,0,-119.35),(21,'2022',21,'21','CALLORA., MARRYFOL RETUBES',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,16,0,0,0,-16,0,0,0,-48),(22,'2022',22,'22','CANOY, CHERYL UDTUJAN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,'2022',24,'24','COMBESTRA, EMIE ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,'2022',25,'25','COSCOS, DENNIS AVERGONZADO',0,0,0,0,8,0,32,0,0,0,40,8,0,32,0,0,0,0,16,0,0,0,0,0,0,0,0,0,40,96,0,0,-40,-96,0,0,-236),(25,'2022',23,'23','CREENCIA, ANAMAE TIAMZOM',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-40),(26,'2022',26,'26','DE LUIS, DARWIN ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(27,'2022',27,'27','DIVINAGRACIA, BEATRIZ CARREON',0,0,0,0,0,0,0,0,16,0,16,0,0,0,0,0,0,0,0,0,0,32,0,8,0,0,8,0,0,80,0,0,0,-80,0,0,-100.93),(28,'2022',28,'28','DUMAJEL, ERLYN ADOREMOS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(29,'2022',29,'29','EDRADAN, ARNAN ANTALLAN',0,0,0,0,0,0,0,0,0,0,8,8,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,24,0,0,0,-24,0,0,-136),(30,'2022',30,'30','EMPINADO, ETHEL ALEGO',0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,40,0,0,12,0,0,40,0,100,0,0,0,-100,0,0,0,-128.4),(31,'2022',32,'32','ENSOY, HERMENIA BARNISO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-120),(32,'2022',31,'31','ENTRINA, ANGEL ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-72),(33,'2022',33,'33','ESNARDO , MARICHU MANTE',0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,-8,0,0,-24),(34,'2022',34,'34','ESNARDO, RAYMART MANTE',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-4),(35,'2022',35,'35','FERNAN, ALEX RELACION',0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,16,0,8,0,0,0,0,0,0,0,0,0,32,0,0,0,-32,0,0,-108.95),(36,'2022',36,'36','FLORES, ESTELLA GEMAO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(37,'2022',37,'37','GARCIA, JAIRO ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(38,'2022',38,'38','GAVIOLA, SHARIZOL LAPINEG',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(39,'2022',39,'39','GISMAN, CAREN BUAL',0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,44,0,4.2,0,0,0,0,16,8,0,0,0,16,64.2,0,0,-16,-64.2,0,0,-80.2),(40,'2022',40,'40','GRAVANZA, ADELAIDA RAFAEL',0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,-16,0,0,-24),(41,'2022',41,'41','INSON, MERIAM ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-144),(42,'2022',42,'42','JANGALAY, JUDELYN MEDINA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(43,'2022',43,'43','LAID, JHESORLEY MAGANA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,13,0,24,8,0,45,0,0,0,-45,0,0,-69),(44,'2022',45,'45','LAPINID, MARIBEL SOLANO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(45,'2022',44,'44','LASTIMOSO, DINO ROSALES',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,16,0,0,0,-16,0,0,-152),(46,'2022',46,'46','LECCIONES, DONALD GONZAGA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-69),(47,'2022',47,'47','LETIGIO, REJOY POGADO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-208),(48,'2022',48,'48','LICO, ROZYL ROMA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(49,'2022',49,'49','LOPEZ, NORA LUMIARES',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,48,16,0,0,0,8,0,0,16,0,88,0,0,0,-88,0,0,-152),(50,'2022',50,'50','LULAB, AEYMH ZHAYL LAUSA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-206.79),(51,'2022',51,'51','LUMPAY, MARGIE LYN ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,8,0,0,0,-8,0,0,0,-8),(52,'2022',52,'52','MABANAG, RUTHCELYNE ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-87),(53,'2022',53,'53','MALLERNA, EVELYN BAJAR',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,8,0,0,16,0,0,0,-16,0,0,-28),(54,'2022',54,'54','MAMALIAS , JOAN MABOLIS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-88),(55,'2022',55,'55','MANEJA, JERSON OCON',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-195.57999999999998),(56,'2022',56,'56','MANEJA, NELIA MANGUBAT',0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,24,0,0,0,-24,0,0,-181.31),(57,'2022',57,'57','MANGUBAT, JONALY DESPI',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-40),(58,'2022',58,'58','MANTE, CHRISTIAN IAN MARILLA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-16),(59,'2022',59,'59','MANTE, JESSERIE ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-16),(60,'2022',60,'60','MARTINES, SUSAN MORTAL',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,16,0,32,0,0,0,-32,0,0,-88),(61,'2022',61,'61','MARZAN, JANETH ALGABRE',0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,0,0,0,0,24,32,0,0,0,0,0,0,56,16,0,0,-56,-16,0,0,-152),(62,'2022',62,'62','MARZAN, MARK BENN VILOAN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(63,'2022',63,'63','MONATO., RAVELYEN CALIPAYAN',0,0,0,0,0,28.58,0,0,0,0,16.4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44.980000000000004,0,0,0,-44.980000000000004,0,0,-156.98000000000002),(64,'2022',64,'64','MONTES, GENERICK GROTES',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-8),(65,'2022',65,'65','NOVA, JENIFFER LANDICHO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(66,'2022',66,'66','NOVO, JUDYVIE EYANA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-8),(67,'2022',67,'67','PACULBA, EMMALEN SALDIVAR',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-184.92000000000002),(68,'2022',68,'68','PALTIQUERA , ROSLYN ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(69,'2022',69,'69','PAREJA. , THELMA POLANCOS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-104),(70,'2022',70,'70','PASQUIL, REX TEMPLATORA',0,0,0,0,8,0,0,8,0,0,8,0,0,0,15.76,0,24,16,96,0,0,32,0,0,0,0,0,0,184,23.759999999999998,0,0,-184,-23.759999999999998,0,0,-207.76),(71,'2022',71,'71','RAMIREZ , EVELINDA PARADERO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,0,0,0,0,0,0,0,0,0,0,0,104,0,0,0,-104,0,0,0,-140.43),(72,'2022',72,'72','SALARDA, CONIE PIODO',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-152),(73,'2022',73,'73','SAPID, ANALYN CAPILITAN',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,16,24,0,8,0,0,0,0,24,40,0,0,-24,-40,0,0,-125.18),(74,'2022',74,'74','SAPID, MERNELITA CAPILITAN',0,0,0,0,0,24,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24,0,0,0,56,0,0,0,-56,0,0,-76.05),(75,'2022',75,'75','SAYSON, DELBERT ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,8,0,0,0,-8,0,0,-72),(76,'2022',76,'76','SIAREZ, JOEL  LARIOSA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-56),(77,'2022',77,'77','SILVANO, ELENA ABRATIGUIN',0,0,0,0,0,16,0,0,0,8,0,0,0,0,0,0,0,0,0,28.8,0,8,0,4,0,32,0,0,48,48.8,0,0,-48,-48.8,0,0,-122.8),(78,'2022',78,'78','SILVANO, KIRK JASON ',0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,16,0,32,0,56,0,0,0,-56,0,0,-56),(79,'2022',79,'79','SINAJON , CONCORDIA GANOHAY',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,8,0,0,0,-8,0,0,-16),(80,'2022',80,'80','TUBAT, ELESON ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,8,0,16,0,0,0,-16,0,0,-56),(81,'2022',81,'81','URBUDA, ROBERT MARQUEZ',0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,6.05,16,4,12.9,0,0,5,0,24,0,66.95,9,0,0,-66.95,-9,0,0,-186.14999999999998),(82,'2022',82,'82','VICENTE, JOHN MARK SERAD',0,0,0,0,0,0,0,0,8,8,0,0,0,0,16,0,0,0,8,0,0,0,8,0,12,0,8,8,28,48,0,0,-28,-48,0,0,-100),(83,'2022',83,'83','VILLEGAS, JELSON TEMPLA',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(84,'2022',84,'84','VIRTUDAZO, JOSHUA SALVE',0,0,0,0,0,0,0,0,0,48,16,0,32,0,32,0,16,0,16,0,8,0,0,16,0,0,0,0,64,120,0,0,-64,-120,0,0,-224);

/*Table structure for table `leaves` */

DROP TABLE IF EXISTS `leaves`;

CREATE TABLE `leaves` (
  `leave_app_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_date_from` date DEFAULT NULL,
  `leave_date_to` date DEFAULT NULL,
  `no_of_days` double DEFAULT NULL,
  `time_from` time DEFAULT '00:00:00',
  `time_to` time DEFAULT '00:00:00',
  `total_hours` double DEFAULT NULL,
  `is_half_day` int(11) DEFAULT 0,
  `emp_id` int(11) DEFAULT NULL,
  `employee_number` varchar(100) DEFAULT '',
  `leave_type_id` int(11) DEFAULT NULL,
  `is_approved` int(11) DEFAULT 0,
  `remarks` varchar(100) DEFAULT '',
  `is_deleted` int(11) DEFAULT 0,
  `approved_by` int(11) DEFAULT 0,
  `submitted_by` int(11) DEFAULT 0,
  PRIMARY KEY (`leave_app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=772 DEFAULT CHARSET=latin1;

/*Data for the table `leaves` */

insert  into `leaves`(`leave_app_id`,`leave_date_from`,`leave_date_to`,`no_of_days`,`time_from`,`time_to`,`total_hours`,`is_half_day`,`emp_id`,`employee_number`,`leave_type_id`,`is_approved`,`remarks`,`is_deleted`,`approved_by`,`submitted_by`) values (1,'2022-04-25','2022-04-26',1,'00:00:00','00:00:00',NULL,0,63,'63',2,1,'Sick Leave',1,0,1),(2,'2022-08-05','2022-08-05',0,'00:00:00','00:00:00',8,0,49,'49',2,1,'SICK LEAVE',0,0,1),(3,'2022-08-08','2022-08-08',0,'00:00:00','00:00:00',8,0,49,'49',2,1,'SICK LEAVE',0,0,1),(4,'2022-08-11','2022-08-12',1,'00:00:00','00:00:00',8,0,49,'49',2,1,'SICK LEAVE',1,0,1),(5,'2022-07-11','2022-07-19',8,'00:00:00','00:00:00',64,0,5,'5',1,1,NULL,1,0,1),(6,'2022-06-06','2022-06-06',0,'00:00:00','00:00:00',8,0,61,'61',2,1,'DRY COUGH',1,0,1),(7,'2022-05-24','2022-05-24',0,'00:00:00','00:00:00',8,0,61,'61',5,1,'BIRTHDAY',1,0,1),(8,'2022-05-17','2022-05-17',0,'00:00:00','00:00:00',8,0,61,'61',7,1,'FIESTA',0,0,1),(9,'2022-03-23','2022-03-25',2,'00:00:00','00:00:00',16,0,61,'61',7,1,NULL,1,0,1),(10,'2022-06-06','2022-06-06',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'PRC FILLING',1,0,1),(11,'2022-05-04','2022-05-04',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'PROCESSING',1,0,1),(12,'2022-04-08','2022-04-08',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'PROCESSING',1,0,1),(13,'2022-08-30','2022-08-30',NULL,'07:55:00','12:05:00',4.17,1,67,'67',7,1,'BOARD EXAM',1,0,1),(14,'2022-03-22','2022-03-25',3,'00:00:00','00:00:00',24,0,67,'67',7,1,'BOARD EXAM',1,0,1),(15,'2022-03-28','2022-03-28',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'BOARD EXAM',1,0,1),(16,'2022-08-30','2022-09-02',3,'00:00:00','00:00:00',24,0,14,'14',1,1,NULL,1,0,1),(17,'2022-08-03','2022-08-03',0,'00:00:00','00:00:00',8,0,20,'20',2,1,'sick',0,0,1),(18,'2022-06-28','2022-06-28',0,'00:00:00','00:00:00',8,0,82,'82',2,1,'sick',0,0,1),(19,'2022-03-09','2022-03-09',0,'00:00:00','00:00:00',8,0,82,'82',2,1,'sick',0,0,1),(20,'2022-03-28','2022-03-28',0,'00:00:00','00:00:00',8,0,82,'82',2,1,'sick',0,0,1),(21,'2022-05-18','2022-05-18',0,'00:00:00','00:00:00',8,0,33,'33',7,1,'eyecheckup',0,0,1),(22,'2022-01-31','2022-01-31',0,'00:00:00','00:00:00',8,0,33,'33',2,1,'DueToCough',0,0,1),(23,'2022-07-08','2022-07-08',0,'00:00:00','00:00:00',8,0,27,'27',7,1,'Alumni',0,0,1),(24,'2022-05-19','2022-05-19',0,'00:00:00','00:00:00',8,0,27,'27',7,1,'eyecheckup',0,0,1),(25,'2022-04-18','2022-04-18',0,'00:00:00','00:00:00',8,0,27,'27',2,1,'Eyecheckup',0,0,1),(26,'2022-03-21','2022-03-21',0,'00:00:00','00:00:00',8,0,27,'27',2,1,'sick',0,0,1),(27,'2022-03-08','2022-03-08',0,'00:00:00','00:00:00',8,0,27,'27',7,0,'BRGYMEETING',1,0,1),(28,'2022-03-08','2022-03-08',NULL,'12:13:00','17:09:00',4.93,1,27,'27',7,1,'BRGYMEETING',0,0,1),(29,'2022-07-18','2022-07-22',4,'00:00:00','00:00:00',32,0,71,'71',1,1,'Vacation',1,0,1),(30,'2022-06-17','2022-06-17',0,'00:00:00','00:00:00',8,0,71,'71',7,1,'WEDDING',0,0,1),(31,'2022-04-28','2022-04-28',NULL,'07:37:00','12:03:00',4.43,1,71,'71',7,1,'PROCESSING',0,0,1),(32,'2022-07-25','2022-07-25',0,'00:00:00','00:00:00',8,0,39,'39',2,1,'SICK',1,0,1),(33,'2022-02-18','2022-02-18',0,'00:00:00','00:00:00',8,0,40,'40',2,1,'LBM',0,0,1),(34,'2022-08-03','2022-08-03',NULL,'07:40:00','12:28:00',4.8,1,77,'77',2,1,'SICK',0,0,1),(35,'2022-03-04','2022-03-04',0,'00:00:00','00:00:00',8,0,77,'77',2,1,'SICK',1,0,1),(36,'2022-07-04','2022-07-04',NULL,'07:09:00','12:09:00',5,1,77,'77',7,1,'EMERGENCY',0,0,1),(37,'2022-02-07','2022-02-07',0,'00:00:00','00:00:00',8,0,77,'77',7,1,'CHECKUP',0,0,1),(38,'2022-01-11','2022-01-11',0,'00:00:00','00:00:00',8,0,77,'77',1,1,'SSSFOLLOWUP',0,0,1),(39,'2022-06-16','2022-06-16',0,'00:00:00','00:00:00',8,0,61,'61',2,1,'DRY COUGH',0,0,1),(40,'2022-03-28','2022-03-28',0,'00:00:00','00:00:00',8,0,61,'61',7,1,NULL,0,0,1),(41,'2022-07-19','2022-07-20',1,'00:00:00','00:00:00',8,0,14,'14',1,1,'Vacation',1,0,1),(42,'2022-08-30','2022-08-30',NULL,'07:36:00','12:18:00',4.7,1,14,'14',7,1,'DRADUATEK12',1,0,1),(43,'2022-04-25','2022-04-26',1,'00:00:00','00:00:00',8,0,14,'14',7,1,'DOCUMENTSUB',1,0,1),(44,'2022-04-04','2022-04-06',2,'00:00:00','00:00:00',16,0,14,'14',2,1,'SICK',1,0,1),(45,'2022-08-10','2022-08-10',0,'00:00:00','00:00:00',8,0,56,'56',2,1,'SICK',1,0,1),(46,'2022-06-30','2022-06-30',0,'00:00:00','00:00:00',8,0,56,'56',7,1,'IMP.MATEER',1,0,1),(47,'2022-08-30','2022-08-30',NULL,'08:05:00','12:00:00',3.92,1,56,'56',7,1,'IMP.MATTER',1,0,1),(48,'2022-08-30','2022-08-30',NULL,'08:05:00','12:00:00',3.92,1,56,'56',7,1,NULL,1,0,1),(49,'2022-05-31','2022-06-01',1,'00:00:00','00:00:00',8,0,56,'56',7,1,NULL,1,0,1),(50,'2022-05-27','2022-05-27',0,'00:00:00','00:00:00',8,0,49,'49',7,1,'PRCLICENSE',0,0,1),(51,'2022-04-18','2022-04-18',0,'00:00:00','00:00:00',8,0,49,'49',7,1,'PERSONAL',0,0,1),(52,'2022-04-27','2022-04-27',0,'00:00:00','00:00:00',8,0,49,'49',7,1,'PERSONAL',0,0,1),(53,'2022-05-19','2022-05-19',0,'00:00:00','00:00:00',8,0,5,'5',7,1,NULL,1,0,1),(54,'2022-05-10','2022-05-13',3,'00:00:00','00:00:00',24,0,3,'3',7,1,'PAHINA',0,0,1),(55,'2022-04-21','2022-04-21',0,'00:00:00','00:00:00',8,0,5,'5',7,1,'CHECKUP',1,0,1),(56,'2022-03-14','2022-03-14',0,'00:00:00','00:00:00',8,0,5,'5',7,1,NULL,1,0,1),(57,'2022-08-01','2022-08-01',0,'00:00:00','00:00:00',8,0,30,'30',7,0,'Special Leave',1,0,1),(58,'2022-08-30','2022-08-30',NULL,'08:11:00','12:23:00',4.2,1,39,'39',2,1,'SICK LEAVE',1,0,1),(59,'2022-07-20','2022-07-20',0,'00:00:00','00:00:00',8,0,39,'39',2,1,'SICK LEAVE',1,0,1),(60,'2022-05-25','2022-05-25',0,'00:00:00','00:00:00',8,0,39,'39',1,1,'Vacation leave',0,0,1),(61,'2022-08-01','2022-08-01',0,'00:00:00','00:00:00',8,0,30,'30',7,1,'PERSONAL MATTER',0,0,1),(62,'2022-04-21','2022-04-21',0,'00:00:00','00:00:00',8,0,30,'30',1,1,'Vacation leave',0,0,1),(63,'2022-08-31','2022-08-31',NULL,'08:12:00','12:02:00',3.83,1,30,'30',7,0,'process pag-ibig',1,0,1),(64,'2022-05-27','2022-05-27',0,'00:00:00','00:00:00',8,0,30,'30',7,1,'PERSONAL MATTER',0,0,1),(65,'2022-07-11','2022-07-12',1,'00:00:00','00:00:00',8,0,19,'19',7,0,'PREPATIOJN TO TRANSFER IN OUR NEW HOUSE AND HOUSE / BUSINESS BLESSING',1,0,1),(66,'2022-07-11','2022-07-12',1,'00:00:00','00:00:00',8,0,19,'19',7,0,'PREPATION  TO TRANSFER IN OUR NEW CHOUSE & BUSINESS BLESSING',1,0,1),(67,'2022-06-29','2022-06-30',1,'00:00:00','00:00:00',8,0,19,'19',3,0,'MY DAUGHTER WAS ADMITTED @ BASILISA HOSPITAL',1,0,1),(68,'2022-05-30','2022-05-30',0,'00:00:00','00:00:00',8,0,19,'19',7,1,'PRC RENEW @ SSCT',0,0,1),(69,'2022-05-19','2022-05-20',1,'00:00:00','00:00:00',8,0,19,'19',7,0,'EMAIL RETRIEVAL FOR ONLINE APPOINTMENT @PRC BUTUANN CITY',1,0,1),(70,'2022-03-23','2022-03-23',0,'00:00:00','00:00:00',8,0,19,'19',2,1,'SICK LEAVE',1,0,1),(71,'2022-03-25','2022-03-25',0,'00:00:00','00:00:00',8,0,19,'19',2,0,'SICK LEAVE',1,0,1),(72,'2022-02-15','2022-02-15',0,'00:00:00','00:00:00',8,0,19,'19',2,1,'SICK LEAVE',1,0,1),(73,'2022-02-17','2022-02-17',NULL,'08:16:00','12:19:00',4.05,1,19,'19',2,1,'SICK LEAVE',1,0,1),(74,'2022-02-14','2022-02-14',0,'00:00:00','00:00:00',8,0,19,'19',7,1,'MY DAUGHTER;S BIRTH DAY',1,0,1),(75,'2022-01-25','2022-01-25',0,'00:00:00','00:00:00',8,0,19,'19',7,1,'SPECIAL LEAVE',1,0,1),(76,'2022-08-31','2022-08-31',NULL,'08:12:00','12:19:00',4.12,1,19,'19',7,0,'SPECIAL LEAVE',1,0,1),(77,'2022-08-31','2022-08-31',NULL,'07:36:00','12:12:00',4.6,1,5,'5',7,0,'PAG - IBIG OFFICE',1,0,1),(78,'2022-01-25','2022-01-25',0,'00:00:00','00:00:00',8,0,5,'5',7,1,'FOLLOW UP PAG - IBIG LOAN',1,0,1),(79,'2022-08-10','2022-08-10',0,'00:00:00','00:00:00',8,0,56,'56',2,1,'SICK LEAVE',0,0,1),(80,'2022-06-30','2022-06-30',0,'00:00:00','00:00:00',8,0,56,'56',7,1,'IMPORTANT MATTER',0,0,1),(81,'2022-07-01','2022-07-01',NULL,'08:05:00','12:00:00',3.92,1,56,'56',7,1,'IMPORTANT MATTER',0,0,1),(82,'2022-05-30','2022-05-30',NULL,'08:05:00','12:00:00',3.92,1,56,'56',7,1,'IMPORTANT MATTER',0,0,1),(83,'2022-05-31','2022-06-01',1,'00:00:00','00:00:00',8,0,56,'56',7,1,'IMPORTANT MATTER',1,0,1),(84,'2022-04-06','2022-04-06',0,'00:00:00','00:00:00',8,0,56,'56',7,1,'IMPORTANT MATTER',0,0,1),(85,'2022-02-16','2022-02-16',NULL,'08:04:00','12:00:00',3.93,1,56,'56',7,1,'BABY SITTER SICKNESS OF DAUGHTER',0,0,1),(86,'2022-02-21','2022-02-21',0,'00:00:00','00:00:00',8,0,56,'56',7,1,'BABY SITTER SICKNESS OF DAUGHTER',0,0,1),(87,'2022-02-11','2022-02-11',0,'00:00:00','00:00:00',8,0,56,'56',2,1,'FEVER',0,0,1),(88,'2022-03-08','2022-03-08',0,'00:00:00','00:00:00',8,0,56,'56',7,0,'IMPORTANT MATTER',1,0,1),(89,'2022-04-06','2022-04-06',0,'00:00:00','00:00:00',8,0,56,'56',7,0,'SPECIAL LEAVE',1,0,1),(90,'2022-07-27','2022-07-29',2,'00:00:00','00:00:00',16,0,23,'23',9,0,'Vacation leave',1,0,1),(91,'2022-08-11','2022-08-12',1,'00:00:00','00:00:00',8,0,49,'49',2,1,'SICK LEAVE',1,0,1),(92,'2022-08-11','2022-08-12',1,'00:00:00','00:00:00',8,0,49,'49',2,0,'SICK LEAVE',1,0,1),(93,'2022-08-11','2022-08-11',0,'00:00:00','00:00:00',8,0,49,'49',2,1,'SICK LEAVE',0,0,1),(94,'2022-08-12','2022-08-12',0,'00:00:00','00:00:00',8,0,49,'49',2,1,'SICK LEAVE',0,0,1),(95,'2022-07-18','2022-07-22',4,'00:00:00','00:00:00',32,0,71,'71',1,1,'Vacation leave',1,0,1),(96,'2022-06-08','2022-06-08',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'PRC FILLING',0,0,1),(97,'2022-05-04','2022-05-04',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'SSS & PAG IBIG PROCESSING',0,0,1),(98,'2022-04-08','2022-04-08',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'SP PROCESSING',0,0,1),(99,'2022-03-21','2022-03-21',0,'00:00:00','00:00:00',8,0,67,'67',7,2,'BOARD EXAM',1,0,1),(100,'2022-03-21','2022-03-21',NULL,'07:15:00','12:00:00',4.75,1,67,'67',7,1,'BOARD EXAM',0,0,1),(101,'2022-03-02','2022-03-02',0,'00:00:00','00:00:00',8,0,67,'67',7,0,'BOARD EXAM',1,0,1),(102,'2022-03-23','2022-03-23',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'BOARD EXAM',0,0,1),(103,'2022-02-24','2022-02-24',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'BOARD EXAM',1,0,1),(104,'2022-03-25','2022-03-25',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'BOARD EXAM',0,0,1),(105,'2022-03-28','2022-03-28',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'BOARD EXAM',0,0,1),(106,'2022-03-22','2022-03-22',0,'00:00:00','00:00:00',8,0,67,'67',7,1,'BOARD EXAM',0,0,1),(107,'2022-01-03','2022-01-03',0,'00:00:00','00:00:00',8,0,82,'82',7,1,'REPAIRING OUR HOUSE',0,0,1),(108,'2022-01-04','2022-01-04',0,'00:00:00','00:00:00',8,0,82,'82',7,1,'REPAIRING OUR HOUSE',0,0,1),(109,'2022-01-07','2022-01-07',0,'00:00:00','00:00:00',8,0,82,'82',7,1,'REPAIRING OUR HOUSE',0,0,1),(110,'2022-08-03','2022-08-03',0,'00:00:00','00:00:00',8,0,77,'77',2,1,'SICK',1,0,1),(111,'2022-08-04','2022-08-04',0,'00:00:00','00:00:00',8,0,77,'77',2,1,'SICK LEAVE',0,0,1),(112,'2022-03-24','2022-03-24',0,'00:00:00','00:00:00',8,0,61,'61',7,1,'SPECIAL LEAVE',0,0,1),(113,'2022-03-24','2022-03-24',0,'00:00:00','00:00:00',8,0,61,'61',7,0,'SPECIAL LEAVE',1,0,1),(114,'2022-03-23','2022-03-23',0,'00:00:00','00:00:00',8,0,61,'61',7,1,'SPECIAL LEAVE',0,0,1),(115,'2022-03-25','2022-03-25',0,'00:00:00','00:00:00',8,0,61,'61',7,1,'SPECIAL LEAVE',0,0,1),(116,'2022-05-24','2022-05-24',0,'00:00:00','00:00:00',8,0,61,'61',7,1,'BIRTHDAY',0,0,1),(117,'2022-03-16','2022-03-16',0,'00:00:00','00:00:00',8,0,66,'66',7,0,'Process HUMID ID',1,0,1),(118,'2022-03-16','2022-03-16',0,'00:00:00','00:00:00',8,0,66,'66',13,1,'Process HUMID ID',0,0,1),(119,'2022-08-11','2022-08-11',0,'00:00:00','00:00:00',8,0,80,'80',10,1,'SICK LEAVE',1,0,1),(120,'2022-08-11','2022-08-11',0,'00:00:00','00:00:00',8,0,11,'11',1,0,'Vacation leave',1,0,1),(121,'2022-08-12','2022-08-12',0,'00:00:00','00:00:00',8,0,11,'11',1,0,'Vacation leave',1,0,1),(122,'2022-08-19','2022-08-19',0,'00:00:00','00:00:00',8,0,84,'84',2,1,'SICK LEAVE',1,0,1),(123,'2022-07-25','2022-07-25',0,'00:00:00','00:00:00',8,0,84,'84',1,1,'Vacation leave',0,0,1),(124,'2022-06-16','2022-06-17',1,'00:00:00','00:00:00',8,0,84,'84',2,0,'SICK LEAVE',1,0,1),(125,'2022-07-13','2022-07-13',0,'00:00:00','00:00:00',8,0,43,'43',5,1,'Daughter Birthday',0,0,1),(126,'2022-07-14','2022-07-14',0,'00:00:00','00:00:00',8,0,43,'43',5,1,'Daughter Birthday',0,0,1),(127,'2022-03-17','2022-03-17',0,'00:00:00','00:00:00',8,0,76,'76',13,0,'IMPORTANT MATTER',1,0,1),(128,'2022-03-17','2022-03-17',0,'00:00:00','00:00:00',8,0,76,'76',7,1,'IMPORTANT MATTER',0,0,1),(129,'2022-03-18','2022-03-18',0,'00:00:00','00:00:00',8,0,76,'76',7,1,'IMPORTANT MATTER',0,0,1),(130,'2022-03-21','2022-03-21',0,'00:00:00','00:00:00',8,0,76,'76',7,1,'IMPORTANT MATTER',0,0,1),(131,'2022-08-22','2022-08-22',0,'00:00:00','00:00:00',8,0,76,'76',7,0,'IMPORTANT MATTER',1,0,1),(132,'2022-03-22','2022-03-22',0,'00:00:00','00:00:00',8,0,76,'76',7,1,'IMPORTANT MATTER',0,0,1),(133,'2022-08-15','2022-08-15',0,'00:00:00','00:00:00',8,0,81,'81',1,0,'Vacation leave',1,0,1),(134,'2022-08-16','2022-08-16',0,'00:00:00','00:00:00',8,0,81,'81',1,0,'Vacation leave',1,0,1),(135,'2022-07-08','2022-07-08',0,'00:00:00','00:00:00',8,0,81,'81',7,0,'Attend Wedding & Grand Alumni',1,0,1),(136,'2022-05-04','2022-05-04',0,'00:00:00','00:00:00',8,0,81,'81',1,0,'Vacation leave',1,0,1),(137,'2022-04-19','2022-04-19',0,'00:00:00','00:00:00',8,0,81,'81',7,0,'At t end  Baptism',1,0,1),(138,'2022-04-04','2022-04-04',0,'00:00:00','00:00:00',8,0,81,'81',7,0,'Process -PRC ID OF MY WIFE',1,0,1),(139,'2022-08-31','2022-08-31',NULL,'13:11:00','17:55:00',4.73,1,81,'81',7,0,'Process -PRC ID OF MY WIFE',1,0,1),(140,'2022-02-18','2022-02-18',0,'00:00:00','00:00:00',8,0,81,'81',7,1,'TRANSACT PSA - SURIGAO CITY',1,0,1),(141,'2022-03-09','2022-03-09',0,'00:00:00','00:00:00',8,0,81,'81',7,0,'PROCESS ELECTRICITY',1,0,1),(142,'2022-03-02','2022-03-02',0,'00:00:00','00:00:00',8,0,81,'81',7,1,'TO TAKE CARE OF MY CHILD',1,0,1),(143,'2022-08-15','2022-08-15',0,'00:00:00','00:00:00',8,0,35,'35',2,1,'SICK LEAVE',0,0,1),(144,'2022-08-18','2022-08-18',0,'00:00:00','00:00:00',8,0,25,'25',1,1,'Vacation leave',0,0,1),(145,'2022-08-19','2022-08-19',0,'00:00:00','00:00:00',8,0,25,'25',1,1,'Vacation leave',0,0,1),(146,'2022-07-12','2022-07-12',0,'00:00:00','00:00:00',8,0,25,'25',7,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(147,'2022-07-13','2022-07-13',0,'00:00:00','00:00:00',8,0,25,'25',7,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(148,'2022-07-13','2022-07-13',0,'00:00:00','00:00:00',8,0,25,'25',7,0,'TAKE BOARD EXAM FOR RMP',1,0,1),(149,'2022-07-14','2022-07-14',0,'00:00:00','00:00:00',8,0,25,'25',7,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(150,'2022-07-15','2022-07-15',0,'00:00:00','00:00:00',8,0,25,'25',7,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(151,'2022-07-18','2022-07-18',0,'00:00:00','00:00:00',8,0,25,'25',7,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(152,'2022-05-25','2022-05-25',0,'00:00:00','00:00:00',8,0,25,'25',7,1,'RENEW LISCENSED ( PRC )',0,0,1),(153,'2022-05-25','2022-05-25',0,'00:00:00','00:00:00',8,0,25,'25',7,1,'RENEW LISCENSED ( PRC )',1,0,1),(154,'2022-04-27','2022-04-27',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(155,'2022-04-28','2022-04-28',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(156,'2022-04-29','2022-04-29',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(157,'2022-05-02','2022-05-02',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(158,'2022-05-03','2022-05-03',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(159,'2022-05-04','2022-05-04',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(160,'2022-05-05','2022-05-05',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(161,'2022-04-05','2022-04-05',0,'00:00:00','00:00:00',8,0,25,'25',1,1,'BIRTHDAY',0,0,1),(162,'2022-04-18','2022-04-18',0,'00:00:00','00:00:00',8,0,25,'25',1,1,'Vacation leave',0,0,1),(163,'2022-04-19','2022-04-19',0,'00:00:00','00:00:00',8,0,25,'25',1,1,'Vacation leave',0,0,1),(164,'2022-03-16','2022-03-16',0,'00:00:00','00:00:00',8,0,25,'25',7,1,'CANVASS PAINT MATERIALS',0,0,1),(165,'2022-02-22','2022-02-22',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(166,'2022-02-23','2022-02-23',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(167,'2022-02-24','2022-02-24',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(168,'2022-02-25','2022-02-25',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(169,'2022-01-18','2022-01-18',0,'00:00:00','00:00:00',8,0,25,'25',2,1,'SICK LEAVE',0,0,1),(170,'2022-05-26','2022-05-26',0,'00:00:00','00:00:00',8,0,25,'25',7,1,'RENEW LISCENSED ( PRC )',0,0,1),(171,'2022-08-04','2022-08-04',0,'00:00:00','00:00:00',8,0,46,'46',7,1,'BURIAL OF MY MOTHER',0,0,1),(172,'2022-08-05','2022-08-05',0,'00:00:00','00:00:00',8,0,46,'46',7,1,'BURIAL OF MY MOTHER',0,0,1),(173,'2022-06-13','2022-06-13',0,'00:00:00','00:00:00',8,0,46,'46',7,1,'PERSONAL MATTER',0,0,1),(174,'2022-05-24','2022-05-24',0,'00:00:00','00:00:00',8,0,46,'46',7,1,'STUDY',0,0,1),(175,'2022-01-19','2022-01-19',0,'00:00:00','00:00:00',8,0,6,'6',10,1,'SICK LEAVE',0,0,1),(176,'2022-01-20','2022-01-20',0,'00:00:00','00:00:00',8,0,6,'6',10,1,'SICK LEAVE',0,0,1),(177,'2022-01-21','2022-01-21',0,'00:00:00','00:00:00',8,0,6,'6',10,1,'SICK LEAVE',0,0,1),(178,'2022-07-05','2022-07-05',0,'00:00:00','00:00:00',8,0,6,'6',7,1,'SPECIAL LEAVE',1,0,1),(179,'2022-07-06','2022-07-06',0,'00:00:00','00:00:00',8,0,6,'6',8,1,'SPECIAL LEAVE',1,0,1),(180,'2022-07-05','2022-07-05',0,'00:00:00','00:00:00',8,0,6,'6',13,1,'SPECIAL LEAVE',0,0,1),(181,'2022-07-06','2022-07-06',0,'00:00:00','00:00:00',8,0,6,'6',13,1,'SPECIAL LEAVE',0,0,1),(182,'2022-06-16','2022-06-16',0,'00:00:00','00:00:00',8,0,29,'29',7,1,'SPECIAL LEAVE',0,0,1),(183,'2022-06-24','2022-06-24',0,'00:00:00','00:00:00',8,0,29,'29',7,1,'SPECIAL LEAVE',0,0,1),(184,'2022-05-16','2022-05-16',0,'00:00:00','00:00:00',8,0,29,'29',7,1,'BIRTHDAY',0,0,1),(185,'2022-08-15','2022-08-15',0,'00:00:00','00:00:00',8,0,12,'12',7,1,'STUDY',1,0,1),(186,'2022-07-27','2022-07-27',0,'00:00:00','00:00:00',8,0,10,'10',1,0,'Vacation leave',1,0,1),(187,'2022-07-28','2022-07-28',0,'00:00:00','00:00:00',8,0,10,'10',1,0,'Vacation leave',1,0,1),(188,'2022-07-27','2022-07-27',0,'00:00:00','00:00:00',8,0,10,'10',9,1,'Vacation leave',0,0,1),(189,'2022-07-28','2022-07-28',0,'00:00:00','00:00:00',8,0,10,'10',9,1,'Vacation leave',0,0,1),(190,'2022-07-29','2022-07-29',0,'00:00:00','00:00:00',8,0,10,'10',9,1,'Vacation leave',0,0,1),(191,'2022-04-04','2022-04-04',0,'00:00:00','00:00:00',8,0,10,'10',13,1,'PRC ID RENEWAL : GOVERNMENT ISSUED ID Processing & TOR & DIPLOMA Processing',0,0,1),(192,'2022-04-05','2022-04-05',0,'00:00:00','00:00:00',8,0,10,'10',13,1,'PRC ID RENEWAL : GOVERNMENT ISSUED ID Processing & TOR & DIPLOMA Processing',0,0,1),(193,'2022-04-06','2022-04-06',0,'00:00:00','00:00:00',8,0,10,'10',13,1,'PRC ID RENEWAL : GOVERNMENT ISSUED ID Processing & TOR & DIPLOMA Processing',0,0,1),(194,'2022-04-07','2022-04-07',0,'00:00:00','00:00:00',8,0,10,'10',13,1,'PRC ID RENEWAL : GOVERNMENT ISSUED ID Processing & TOR & DIPLOMA Processing',0,0,1),(195,'2022-08-16','2022-08-16',0,'00:00:00','00:00:00',8,0,21,'21',13,1,'SSS & PAG - IBIG UPDATE',0,0,1),(196,'2022-08-17','2022-08-17',0,'00:00:00','00:00:00',8,0,21,'21',13,1,'SSS & PAG - IBIG UPDATE',0,0,1),(197,'2022-06-17','2022-06-17',0,'00:00:00','00:00:00',8,0,21,'21',13,0,'CIVIL SERVICE EXAMINATION',1,0,1),(198,'2022-06-20','2022-06-20',0,'00:00:00','00:00:00',8,0,5,'5',13,0,'CIVIL SERVICE EXAMINATION',1,0,1),(199,'2022-06-17','2022-06-17',0,'00:00:00','00:00:00',8,0,21,'21',13,1,'CIVIL SERVICE EXAMINATION',0,0,1),(200,'2022-06-20','2022-06-20',0,'00:00:00','00:00:00',8,0,21,'21',13,1,'CIVIL SERVICE EXAMINATION',0,0,1),(201,'2022-05-04','2022-05-04',0,'00:00:00','00:00:00',8,0,72,'72',13,1,'IMPORTANT MATTER',0,0,1),(202,'2022-05-05','2022-05-05',0,'00:00:00','00:00:00',8,0,118,'104',13,0,'IMPORTANT MATTER',1,0,1),(203,'2022-05-05','2022-05-05',0,'00:00:00','00:00:00',8,0,72,'72',13,1,'IMPORTANT MATTER',0,0,1),(204,'2022-02-17','2022-02-17',0,'00:00:00','00:00:00',8,0,72,'72',13,1,'IMPORTANT MATTER',0,0,1),(205,'2022-02-18','2022-02-18',0,'00:00:00','00:00:00',8,0,72,'72',13,1,'IMPORTANT MATTER',0,0,1),(206,'2022-06-17','2022-06-17',0,'00:00:00','00:00:00',8,0,59,'59',13,1,'CIVIL SERVICE EXAMINATION',0,0,1),(207,'2022-06-20','2022-06-20',0,'00:00:00','00:00:00',8,0,59,'59',13,1,'CIVIL SERVICE EXAMINATION',0,0,1),(208,'2022-07-27','2022-07-27',0,'00:00:00','00:00:00',8,0,23,'23',9,1,'Vacation leave',0,0,1),(209,'2022-07-29','2022-07-29',0,'00:00:00','00:00:00',8,0,23,'23',9,1,'Vacation leave',0,0,1),(210,'2022-07-28','2022-07-28',0,'00:00:00','00:00:00',8,0,23,'23',9,1,'Vacation leave',0,0,1),(211,'2022-06-16','2022-06-16',0,'00:00:00','00:00:00',8,0,84,'84',2,1,'SICK LEAVE',0,0,1),(212,'2022-06-17','2022-06-17',0,'00:00:00','00:00:00',8,0,84,'84',2,1,'SICK LEAVE',0,0,1),(213,'2022-04-20','2022-04-20',0,'00:00:00','00:00:00',8,0,84,'84',2,1,'SICK LEAVE',0,0,1),(214,'2022-04-21','2022-04-21',0,'00:00:00','00:00:00',8,0,84,'84',2,1,'SICK LEAVE',0,0,1),(215,'2022-03-16','2022-03-16',0,'00:00:00','00:00:00',8,0,84,'84',8,1,'MANDATORY / FORCE LEAVE',0,0,1),(216,'2022-03-17','2022-03-17',0,'00:00:00','00:00:00',8,0,84,'84',8,1,'MANDATORY / FORCE LEAVE',0,0,1),(217,'2022-03-14','2022-03-14',0,'00:00:00','00:00:00',8,0,84,'84',2,1,'SICK LEAVE',0,0,1),(218,'2022-03-08','2022-03-08',0,'00:00:00','00:00:00',8,0,84,'84',1,1,'Vacation leave',0,0,1),(219,'2022-03-09','2022-03-09',0,'00:00:00','00:00:00',8,0,84,'84',1,1,'Vacation leave',0,0,1),(220,'2022-03-07','2022-03-07',0,'00:00:00','00:00:00',8,0,84,'84',1,1,'Vacation leave',0,0,1),(221,'2022-05-20','2022-05-20',0,'00:00:00','00:00:00',8,0,84,'84',2,1,'SICK LEAVE',0,0,1),(222,'2022-05-01','2022-05-01',0,'00:00:00','00:00:00',8,0,69,'69',5,0,'BIRTHDAY OF MY MOTHER',1,0,1),(223,'2022-05-02','2022-05-02',0,'00:00:00','00:00:00',8,0,69,'69',5,0,'BIRTHDAY OF MY MOTHER',1,0,1),(224,'2022-05-03','2022-05-03',0,'00:00:00','00:00:00',8,0,69,'69',5,0,'BIRTHDAY OF MY MOTHER',1,0,1),(225,'2022-06-01','2022-06-01',0,'00:00:00','00:00:00',8,0,69,'69',5,1,'BIRTHDAY OF MY MOTHER',1,0,1),(226,'2022-06-02','2022-06-02',0,'00:00:00','00:00:00',8,0,69,'69',5,1,'BIRTHDAY OF MY MOTHER',1,0,1),(227,'2022-06-03','2022-06-03',0,'00:00:00','00:00:00',8,0,69,'69',5,1,'BIRTHDAY OF MY MOTHER',1,0,1),(228,'2022-05-19','2022-05-19',0,'00:00:00','00:00:00',8,0,69,'69',7,1,'eye check up',0,0,1),(229,'2022-05-12','2022-05-12',0,'00:00:00','00:00:00',8,0,75,'75',7,1,'PROFESSIONAL DEVELOPMENT - PRC - IR',0,0,1),(230,'2022-05-13','2022-05-13',0,'00:00:00','00:00:00',8,0,75,'75',7,1,'PROFESSIONAL DEVELOPMENT - PRC - IR',0,0,1),(231,'2022-01-25','2022-01-25',0,'00:00:00','00:00:00',8,0,75,'75',7,1,'LET EXAMINATION',0,0,1),(232,'2022-12-06','2022-12-06',0,'00:00:00','00:00:00',8,0,75,'75',7,0,'LET EXAMINATION',1,0,1),(233,'2022-01-26','2022-01-26',0,'00:00:00','00:00:00',8,0,75,'75',7,1,'LET EXAMINATION',0,0,1),(234,'2022-01-27','2022-01-27',0,'00:00:00','00:00:00',8,0,75,'75',7,1,'LET EXAMINATION',0,0,1),(235,'2022-01-28','2022-01-28',0,'00:00:00','00:00:00',8,0,75,'75',7,1,'LET EXAMINATION',0,0,1),(236,'2022-01-31','2022-01-31',0,'00:00:00','00:00:00',8,0,75,'75',7,1,'LET EXAMINATION',0,0,1),(237,'2022-05-30','2022-05-30',0,'00:00:00','00:00:00',8,0,20,'20',2,1,'SICK LEAVE',1,0,1),(238,'2022-02-08','2022-02-08',0,'00:00:00','00:00:00',8,0,20,'20',7,1,'PERSONAL MATTER',0,0,1),(239,'2022-02-09','2022-02-09',0,'00:00:00','00:00:00',8,0,20,'20',7,1,'PERSONAL MATTER',0,0,1),(240,'2022-05-02','2022-05-02',0,'00:00:00','00:00:00',8,0,13,'13',7,1,'PERSONAL MATTER',0,0,1),(241,'2022-05-04','2022-05-04',0,'00:00:00','00:00:00',8,0,13,'13',7,1,'PERSONAL MATTER',0,0,1),(242,'2022-01-24','2022-01-24',0,'00:00:00','00:00:00',8,0,13,'13',7,1,'LET EXAMINATION',0,0,1),(243,'2022-01-25','2022-01-25',0,'00:00:00','00:00:00',8,0,13,'13',7,1,'LET EXAMINATION',0,0,1),(244,'2022-01-26','2022-01-26',0,'00:00:00','00:00:00',8,0,13,'13',7,1,'LET EXAMINATION',0,0,1),(245,'2022-01-27','2022-01-27',0,'00:00:00','00:00:00',8,0,13,'13',7,1,'LET EXAMINATION',0,0,1),(246,'2022-01-28','2022-01-28',0,'00:00:00','00:00:00',8,0,13,'13',7,1,'LET EXAMINATION',0,0,1),(247,'2022-01-31','2022-01-31',0,'00:00:00','00:00:00',8,0,13,'13',7,1,'LET EXAMINATION',0,0,1),(248,'2022-04-20','2022-04-20',0,'00:00:00','00:00:00',8,0,13,'13',7,0,'PERSONAL MATTER',1,0,1),(249,'2022-08-31','2022-08-31',NULL,'12:05:00','17:00:00',4.92,1,12,'12',7,2,'PERSONAL MATTER',1,0,1),(250,'2022-04-21','2022-04-21',0,'00:00:00','00:00:00',8,0,13,'13',7,1,'PERSONAL MATTER',1,0,1),(251,'2022-04-21','2022-04-21',NULL,'12:05:00','17:00:00',4.92,1,13,'13',7,1,'PERSONAL MATTER',0,0,1),(252,'2022-07-04','2022-07-04',0,'00:00:00','00:00:00',8,0,35,'35',7,1,'BURIAL',0,0,1),(253,'2022-07-05','2022-07-05',0,'00:00:00','00:00:00',8,0,35,'35',7,1,'BURIAL',0,0,1),(254,'2022-07-06','2022-07-06',0,'00:00:00','00:00:00',8,0,35,'35',7,1,'BURIAL',0,0,1),(255,'2022-07-07','2022-07-07',0,'00:00:00','00:00:00',8,0,35,'35',2,1,'SICK LEAVE',0,0,1),(256,'2022-07-08','2022-07-08',0,'00:00:00','00:00:00',8,0,35,'35',2,1,'SICK LEAVE',0,0,1),(257,'2022-05-02','2022-05-02',0,'00:00:00','00:00:00',8,0,35,'35',2,1,'SICK LEAVE',0,0,1),(258,'2022-05-26','2022-05-26',0,'00:00:00','00:00:00',8,0,35,'35',7,1,'DEATH ANNIVESARY MY FATHER',0,0,1),(259,'2022-04-19','2022-04-19',NULL,'12:03:00','17:00:00',4.95,1,35,'35',7,1,'REPAIR WINDOW',0,0,1),(260,'2022-04-27','2022-04-27',0,'00:00:00','00:00:00',8,0,35,'35',5,1,'BIRTHDAY LEAVE',0,0,1),(261,'2022-02-10','2022-02-10',0,'00:00:00','00:00:00',8,0,35,'35',7,1,'2ND DOSE VACCINE',0,0,1),(262,'2022-07-13','2022-07-13',0,'00:00:00','00:00:00',8,0,55,'55',7,1,'EMERGENCY',0,0,1),(263,'2022-08-18','2022-08-18',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(264,'2022-08-19','2022-08-19',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(265,'2022-08-22','2022-08-22',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(266,'2022-08-23','2022-08-23',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(267,'2022-08-24','2022-08-24',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(268,'2022-08-25','2022-08-25',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(269,'2022-08-26','2022-08-26',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(270,'2022-08-29','2022-08-29',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(271,'2022-08-30','2022-08-30',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(272,'2022-08-31','2022-08-31',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(273,'2022-09-01','2022-09-01',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(274,'2022-09-02','2022-09-02',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(275,'2022-09-03','2022-09-03',0,'00:00:00','00:00:00',8,0,70,'70',1,0,'Vacation leave',1,0,1),(276,'2022-09-05','2022-09-05',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(277,'2022-07-26','2022-07-26',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(278,'2022-08-27','2022-08-27',0,'00:00:00','00:00:00',8,0,70,'70',1,0,'Vacation leave',1,0,1),(279,'2022-08-08','2022-08-08',0,'00:00:00','00:00:00',8,0,70,'70',1,0,'Vacation leave',1,0,1),(280,'2022-07-27','2022-07-27',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(281,'2022-07-08','2022-07-08',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(282,'2022-06-23','2022-06-23',0,'00:00:00','00:00:00',8,0,70,'70',2,1,'SICK LEAVE',0,0,1),(283,'2022-06-20','2022-06-20',NULL,'13:10:00','17:03:00',3.88,1,70,'70',2,1,'SICK LEAVE',0,0,1),(284,'2022-04-27','2022-04-27',0,'00:00:00','00:00:00',8,0,70,'70',2,1,'SICK LEAVE',0,0,1),(285,'2022-02-14','2022-02-14',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(286,'2022-01-28','2022-01-28',0,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation leave',0,0,1),(287,'2022-05-30','2022-05-30',0,'00:00:00','00:00:00',8,0,74,'74',5,1,'BIRTHDAY LEAVE',0,0,1),(288,'2022-04-01','2022-04-01',NULL,'13:21:00','17:23:00',4.03,1,74,'74',7,0,'PERSONAL MATTER',1,0,1),(289,'2022-03-28','2022-03-28',0,'00:00:00','00:00:00',8,0,74,'74',2,1,'SICK LEAVE',0,0,1),(290,'2022-02-28','2022-02-28',0,'00:00:00','00:00:00',8,0,74,'74',7,0,'Eye Check Up',1,0,1),(291,'2022-01-05','2022-01-05',0,'00:00:00','00:00:00',8,0,74,'74',2,1,'SICK LEAVE',0,0,1),(292,'2022-01-06','2022-01-06',0,'00:00:00','00:00:00',8,0,74,'74',2,1,'SICK LEAVE',0,0,1),(293,'2022-01-07','2022-01-07',0,'00:00:00','00:00:00',8,0,74,'74',2,1,'SICK LEAVE',0,0,1),(294,'2022-05-02','2022-05-03',2,'00:00:00','00:00:00',16,0,13,'13',7,0,'PERSONAL MATTER',1,0,1),(295,'2022-02-04','2022-02-05',2,'00:00:00','00:00:00',16,0,52,'52',9,1,'Vacation leave',0,0,1),(296,'2022-04-22','2022-04-22',1,'00:00:00','00:00:00',8,0,52,'52',13,1,'PERSONAL MATTER',0,0,1),(297,'2022-07-11','2022-07-11',NULL,'13:25:00','17:00:00',3.58,1,55,'55',7,1,'emergency purposes',0,0,1),(298,'2022-07-12','2022-07-12',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'emergency purposes',0,0,1),(299,'2022-05-30','2022-06-02',4,'00:00:00','00:00:00',32,0,55,'55',7,1,'SPECIAL LEAVE',0,0,1),(300,'2022-04-07','2022-04-07',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'Attend TESDA Training',0,0,1),(301,'2022-02-11','2022-02-11',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'Taking care of sick WIFE',0,0,1),(302,'2022-04-22','2022-04-22',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'MASTERAL PURPOSES',0,0,1),(303,'2022-03-31','2022-03-31',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'IMPORTANT MATTER',0,0,1),(304,'2022-02-17','2022-02-18',2,'00:00:00','00:00:00',16,0,55,'55',7,1,'IMPORTANT MATTER',1,0,1),(305,'2022-08-15','2022-08-16',2,'00:00:00','00:00:00',16,0,1,'1',7,1,'PERSONAL MATTER',0,0,1),(306,'2022-08-17','2022-08-17',NULL,'12:42:00','18:18:00',5.6,1,1,'1',7,1,'PERSONAL MATTER',0,0,1),(307,'2022-09-05','2022-09-05',NULL,'07:32:00','12:00:00',4.47,1,1,'1',7,1,'PERSONAL MATTER',1,0,1),(308,'2022-04-21','2022-04-21',1,'00:00:00','00:00:00',8,0,1,'1',7,0,'PERSONAL MATTER',1,0,1),(309,'2022-01-24','2022-01-28',5,'00:00:00','00:00:00',40,0,1,'1',7,1,'LET EXAMINATION',0,0,1),(310,'2022-09-05','2022-09-05',NULL,'07:32:00','12:00:00',4.47,1,1,'1',7,0,'PERSONAL MATTER',1,0,1),(311,'2022-04-26','2022-04-26',1,'00:00:00','00:00:00',8,0,63,'63',2,0,'SICK LEAVE',1,0,1),(312,'2022-01-11','2022-01-13',3,'00:00:00','00:00:00',24,0,63,'63',2,1,'SICK LEAVE',0,0,1),(313,'2022-09-05','2022-09-05',NULL,'12:56:00','17:00:00',4.07,1,63,'63',2,0,'SICK LEAVE',1,0,1),(314,'2022-01-28','2022-01-28',1,'00:00:00','00:00:00',8,0,63,'63',7,1,'Enrollment for Master\'s / SP Driving Processing',0,0,1),(315,'2022-01-21','2022-01-21',1,'00:00:00','00:00:00',8,0,63,'63',7,1,'Update Master & Important Matter',0,0,1),(316,'2022-03-21','2022-03-22',2,'00:00:00','00:00:00',16,0,63,'63',7,1,'PRC License Renewal',0,0,1),(317,'2022-05-16','2022-05-24',9,'00:00:00','00:00:00',72,0,63,'63',7,0,'Personal important Matter',1,0,1),(318,'2022-04-25','2022-04-25',1,'00:00:00','00:00:00',8,0,63,'63',2,1,'SICK LEAVE',0,0,1),(319,'2022-04-26','2022-04-26',NULL,'13:09:00','17:21:00',4.2,1,63,'63',2,1,'SICK LEAVE',0,0,1),(320,'2022-05-16','2022-05-20',5,'00:00:00','00:00:00',40,0,63,'63',7,1,'Personal important Matter',0,0,1),(321,'2022-05-23','2022-05-25',3,'00:00:00','00:00:00',24,0,63,'63',7,1,'Personal important Matter',0,0,1),(322,'2022-01-10','2022-01-10',NULL,'07:25:00','12:00:00',4.58,1,63,'63',2,1,'SICK LEAVE',0,0,1),(323,'2022-06-29','2022-06-29',NULL,'12:55:00','18:23:00',5.47,1,2,'2',7,1,'PERSONAL MATTER',0,0,1),(324,'2022-04-26','2022-04-26',NULL,'12:52:00','19:17:00',6.42,1,2,'2',7,1,'PERSONAL MATTER',0,0,1),(325,'2022-04-08','2022-04-08',1,'00:00:00','00:00:00',8,0,2,'2',7,1,'SPECIAL LEAVE',0,0,1),(326,'2022-03-21','2022-03-21',1,'00:00:00','00:00:00',8,0,2,'2',7,1,'PERSONAL MATTER',0,0,1),(327,'2022-08-19','2022-08-21',3,'00:00:00','00:00:00',24,0,8,'8',7,1,'Emergency due to accident happened',1,0,1),(328,'2022-08-11','2022-08-13',3,'00:00:00','00:00:00',24,0,8,'8',7,1,'Emergency due to accident happened',1,0,1),(329,'2022-08-11','2022-08-12',2,'00:00:00','00:00:00',16,0,8,'8',13,0,'Emergency due to accident happened',1,0,1),(330,'2022-08-20','2022-08-21',2,'00:00:00','00:00:00',16,0,8,'8',13,1,'Emergency due to accident happened',1,0,1),(331,'2022-08-11','2022-08-13',3,'00:00:00','00:00:00',24,0,8,'8',13,1,'Emergency due to accident happened',1,0,1),(332,'2022-08-15','2022-08-19',5,'00:00:00','00:00:00',40,0,12,'12',13,1,'study leave',0,0,1),(333,'2022-08-22','2022-08-26',5,'00:00:00','00:00:00',40,0,12,'12',13,1,'study leave',0,0,1),(334,'2022-08-29','2022-08-31',3,'00:00:00','00:00:00',24,0,12,'12',7,1,'study leave',0,0,1),(335,'2022-08-16','2022-08-16',1,'00:00:00','00:00:00',8,0,73,'73',2,1,'SICK LEAVE',1,0,1),(336,'2022-05-23','2022-05-23',NULL,'13:10:00','18:18:00',5.13,1,73,'73',7,1,'attend meeting w/ my daughter in elementary',0,0,1),(337,'2022-01-28','2022-01-28',1,'00:00:00','00:00:00',8,0,73,'73',7,1,'process Sp licenses',0,0,1),(338,'2022-06-10','2022-06-10',1,'00:00:00','00:00:00',8,0,29,'29',2,1,'SICK LEAVE',0,0,1),(339,'2022-05-06','2022-05-06',1,'00:00:00','00:00:00',8,0,29,'29',7,1,'SPECIAL LEAVE',0,0,1),(340,'2022-04-18','2022-04-18',1,'00:00:00','00:00:00',8,0,29,'29',2,1,'SICK LEAVE',0,0,1),(341,'2022-04-01','2022-04-01',1,'00:00:00','00:00:00',8,0,29,'29',2,1,'SICK LEAVE',0,0,1),(342,'2022-03-21','2022-03-25',5,'00:00:00','00:00:00',40,0,29,'29',7,1,'REVIEW  & LET EXAM',0,0,1),(343,'2022-03-28','2022-03-28',1,'00:00:00','00:00:00',8,0,29,'29',7,1,'BOARD EXAM',0,0,1),(344,'2022-03-03','2022-03-04',2,'00:00:00','00:00:00',16,0,29,'29',7,1,'SPECIAL LEAVE',0,0,1),(345,'2022-02-25','2022-02-25',NULL,'14:03:00','18:06:00',4.05,1,74,'74',7,1,'Eye Check Up',1,0,1),(346,'2022-05-25','2022-05-26',2,'00:00:00','00:00:00',16,0,84,'84',1,1,'Vacation leave',0,0,1),(347,'2022-04-20','2022-04-20',NULL,'07:32:00','12:02:00',4.5,1,1,'1',7,1,'PERSONAL MATTER',0,0,1),(348,'2022-04-21','2022-04-21',1,'00:00:00','00:00:00',8,0,1,'1',7,1,'PERSONAL MATTER',0,0,1),(349,'2022-05-24','2022-05-24',1,'00:00:00','00:00:00',8,0,78,'78',2,1,'SICK LEAVE',0,0,1),(350,'2022-08-26','2022-08-26',NULL,'13:00:00','17:03:00',4.05,1,73,'73',7,1,'ATTEND MEETING ELECTRIC IN DIELCO',0,0,1),(351,'2022-08-11','2022-08-12',2,'00:00:00','00:00:00',16,0,11,'11',1,1,'Vacation leave',0,0,1),(352,'2022-08-02','2022-08-05',4,'00:00:00','00:00:00',32,0,11,'11',3,1,'MATERNITY LEAVE',0,0,1),(353,'2022-08-08','2022-08-10',3,'00:00:00','00:00:00',24,0,11,'11',3,1,'MATERNITY LEAVE',0,0,1),(354,'2022-06-17','2022-06-17',1,'00:00:00','00:00:00',8,0,11,'11',7,1,'SPECIAL LEAVE',0,0,1),(355,'2022-05-30','2022-05-30',1,'00:00:00','00:00:00',8,0,11,'11',2,1,'SICK LEAVE',0,0,1),(356,'2022-08-15','2022-08-17',3,'00:00:00','00:00:00',24,0,50,'50',7,1,'PERSONAL MATTER',1,0,1),(357,'2022-08-18','2022-08-18',1,'00:00:00','00:00:00',8,0,50,'50',7,0,'PERSONAL MATTER',1,0,1),(358,'1970-01-01','2022-08-22',738157,'00:00:00','00:00:00',5905256,0,50,'50',7,0,'SPECIAL LEAVE',1,0,1),(359,'2022-07-10','2022-07-10',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'PERSONAL MATTER',1,0,1),(360,'2022-05-30','2022-05-30',1,'00:00:00','00:00:00',8,0,50,'50',7,0,'PERSONAL MATTER',1,0,1),(361,'2022-05-24','2022-05-24',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'SPECIAL LEAVE',0,0,1),(362,'2022-05-10','2022-05-10',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(363,'2022-03-14','2022-03-14',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(364,'2022-04-25','2022-04-29',5,'00:00:00','00:00:00',40,0,50,'50',5,1,'PAPA\'S BIRTHDAY & ATTENDING WEDDING',0,0,1),(365,'2022-01-24','2022-01-24',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(366,'2022-01-19','2022-01-19',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(367,'2022-01-05','2022-01-05',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(368,'2022-07-18','2022-07-18',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(369,'2022-07-21','2022-07-22',2,'00:00:00','00:00:00',16,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(370,'2022-05-30','2022-05-30',NULL,'00:48:00','17:20:00',16.53,1,50,'50',7,1,'PERSONAL MATTER',0,0,1),(371,'2022-04-07','2022-04-07',NULL,'13:05:00','18:07:00',5.03,1,81,'81',7,0,'Process -PRC ID OF MY WIFE',1,0,1),(372,'2022-06-30','2022-06-30',NULL,'07:28:00','12:01:00',4.55,1,81,'81',7,1,'PERSONAL ENGAGEMENT',1,0,1),(373,'2022-03-28','2022-03-28',1,'00:00:00','00:00:00',8,0,81,'81',7,1,'PROCESS PRC LICENSED OF MY WIFE AT BXU',0,0,1),(374,'2022-03-29','2022-03-29',NULL,'13:21:00','17:00:00',3.65,1,81,'81',7,1,'PROCESS PRC LICENSED OF MY WIFE AT BXU',0,0,1),(375,'2022-03-03','2022-03-03',1,'00:00:00','00:00:00',8,0,81,'81',7,0,'TO TAKE CARE OF MY CHILD',1,0,1),(376,'2022-03-09','2022-03-09',1,'00:00:00','00:00:00',8,0,81,'81',7,1,'PROCESS ELECTRICITY',0,0,1),(377,'2022-02-18','2022-02-18',1,'00:00:00','00:00:00',8,0,81,'81',7,1,'TRANSACT PSA - SURIGAO CITY',0,0,1),(378,'2022-04-04','2022-04-04',1,'00:00:00','00:00:00',8,0,81,'81',7,1,'PROCESS PRC ID OF MY WIFE',0,0,1),(379,'2022-04-07','2022-04-07',NULL,'13:11:00','17:55:00',4.73,1,81,'81',7,1,'Process -PRC ID OF MY WIFE',0,0,1),(380,'2022-04-19','2022-04-19',1,'00:00:00','00:00:00',8,0,81,'81',7,1,'ATTEND BAPTISM',0,0,1),(381,'2022-05-04','2022-05-04',1,'00:00:00','00:00:00',8,0,81,'81',1,1,'Vacation leave',0,0,1),(382,'2022-07-07','2022-07-07',1,'00:00:00','00:00:00',8,0,81,'81',7,0,'Attend Wedding & Grand Alumni',1,0,1),(383,'2022-08-15','2022-08-16',2,'00:00:00','00:00:00',16,0,81,'81',1,1,'Vacation leave',0,0,1),(384,'2022-03-02','2022-03-02',1,'00:00:00','00:00:00',8,0,81,'81',7,1,'TO TAKE CARE OF MY CHILD',0,0,1),(385,'2022-08-08','2022-08-08',1,'00:00:00','00:00:00',8,0,81,'81',7,0,'Attend Wedding & Grand Alumni',1,0,1),(386,'2022-07-08','2022-07-08',1,'00:00:00','00:00:00',8,0,81,'81',7,1,'Attend Wedding & Grand Alumni',0,0,1),(387,'2022-06-30','2022-06-30',NULL,'07:30:00','12:46:00',5.27,1,81,'81',7,1,'PERSONAL ENGAGEMENT',0,0,1),(388,'2022-09-01','2022-09-02',2,'00:00:00','00:00:00',16,0,31,'31',13,1,'FATHER BIRTHDAY',0,0,1),(389,'2022-09-01','2022-09-02',2,'00:00:00','00:00:00',16,0,80,'80',5,1,'FATHER BIRTHDAY',0,0,1),(390,'2022-08-26','2022-08-26',1,'00:00:00','00:00:00',8,0,82,'82',2,1,'SICK LEAVE',0,0,1),(391,'2022-08-30','2022-09-02',4,'00:00:00','00:00:00',32,0,14,'14',1,1,'Vacation',0,0,1),(392,'2022-07-19','2022-07-20',2,'00:00:00','00:00:00',16,0,14,'14',1,1,'Vacation',0,0,1),(393,'2022-04-22','2022-04-22',NULL,'07:36:00','12:00:00',4.4,1,14,'14',2,1,'SICK',1,0,1),(394,'2022-04-25','2022-04-25',1,'00:00:00','00:00:00',8,0,14,'14',7,1,'GRADUATE STUDIES ) k212',0,0,1),(395,'2022-04-04','2022-04-06',3,'00:00:00','00:00:00',24,0,14,'14',2,1,'SICK',0,0,1),(396,'2022-06-06','2022-06-06',1,'00:00:00','00:00:00',8,0,20,'20',7,0,'PERSONAL MATTER',1,0,1),(397,'2022-06-26','2022-06-26',NULL,'17:32:00','20:53:00',3.35,1,20,'20',7,0,'PERSONAL MATTER',1,0,1),(398,'2022-06-07','2022-06-07',1,'00:00:00','00:00:00',8,0,20,'20',7,1,'PERSONAL MATTER',0,0,1),(399,'2022-06-06','2022-06-06',NULL,'17:32:00','20:53:00',3.35,1,20,'20',7,1,'PERSONAL MATTER',0,0,1),(400,'2022-04-28','2022-04-28',NULL,'07:36:00','12:00:00',4.4,1,30,'30',7,1,'process pag-ibig loan',0,0,1),(401,'2022-07-11','2022-07-12',2,'00:00:00','00:00:00',16,0,19,'19',7,1,'PREPATIOJN TO TRANSFER IN OUR NEW HOUSE AND HOUSE / BUSINESS BLESSING',0,0,1),(402,'2022-06-29','2022-06-30',2,'00:00:00','00:00:00',16,0,19,'19',3,1,'MY DAUGHTER WAS ADMITTED @ BASILISA HOSPITAL',0,0,1),(403,'2022-05-30','2022-05-30',1,'00:00:00','00:00:00',8,0,19,'19',7,1,'PRC RENEW @ SSCT',0,0,1),(404,'2022-05-19','2022-05-20',2,'00:00:00','00:00:00',16,0,19,'19',7,1,'EMAIL RETRIEVAL FOR ONLINE APPOINTMENT @PRC BUTUANN CITY',0,0,1),(405,'2022-03-23','2022-03-23',1,'00:00:00','00:00:00',8,0,19,'19',2,1,'SICK',0,0,1),(406,'2022-03-25','2022-03-25',1,'00:00:00','00:00:00',8,0,19,'19',2,1,'SICK',0,0,1),(407,'2022-02-15','2022-02-15',1,'00:00:00','00:00:00',8,0,19,'19',2,1,'SICK',0,0,1),(408,'2022-02-17','2022-02-17',NULL,'13:22:00','17:03:00',3.68,1,19,'19',2,1,'SICK',1,0,1),(409,'2022-02-14','2022-02-14',1,'00:00:00','00:00:00',8,0,19,'19',5,1,'MY DAUGHTER;S BIRTH DAY',0,0,1),(410,'2022-01-25','2022-01-25',1,'00:00:00','00:00:00',8,0,19,'19',7,1,'PERSONAL MATTER',1,0,1),(411,'2022-01-26','2022-01-26',NULL,'12:35:00','17:27:00',4.87,1,19,'19',7,1,'PERSONAL MATTER',0,0,1),(412,'2022-01-25','2022-01-25',1,'00:00:00','00:00:00',8,0,5,'5',7,1,'Following Pag - Ibig Loan',0,0,1),(413,'2022-02-09','2022-02-09',NULL,'13:02:00','17:00:00',3.97,1,5,'5',7,1,'PAG - IBIG OFFICE',0,0,1),(414,'2022-03-14','2022-03-14',1,'00:00:00','00:00:00',8,0,5,'5',7,1,'PERSONAL MATTER',0,0,1),(415,'2022-04-21','2022-04-21',1,'00:00:00','00:00:00',8,0,5,'5',7,1,'CHECK UP FOR MY SON',0,0,1),(416,'2022-05-10','2022-05-13',4,'00:00:00','00:00:00',32,0,5,'5',7,1,'Pahina at Himalayan',0,0,1),(417,'2022-05-19','2022-05-19',1,'00:00:00','00:00:00',8,0,5,'5',7,1,'PERSONAL MATTER',0,0,1),(418,'2022-07-11','2022-07-15',5,'00:00:00','00:00:00',40,0,5,'5',1,1,'Vacation',0,0,1),(419,'2022-07-18','2022-07-20',3,'00:00:00','00:00:00',24,0,5,'5',1,1,'Vacation',0,0,1),(420,'2022-06-01','2022-06-01',NULL,'07:24:00','12:05:00',4.68,1,56,'56',7,0,'PERSONAL MATTER',1,0,1),(421,'2022-06-01','2022-06-01',NULL,'07:23:00','12:10:00',4.78,1,56,'56',7,1,'IMPORTANT MATTER',1,0,1),(422,'2022-03-08','2022-03-08',1,'00:00:00','00:00:00',8,0,56,'56',7,0,'IMPORTANT MATTER',1,0,1),(423,'2022-02-11','2022-02-11',1,'00:00:00','00:00:00',8,0,56,'56',2,0,'SICK',1,0,1),(424,'2022-08-09','2022-08-10',2,'00:00:00','00:00:00',16,0,60,'60',7,1,'Filling Requirement',0,0,1),(425,'2022-03-16','2022-03-16',1,'00:00:00','00:00:00',8,0,64,'64',7,1,'Process HUMID ID',0,0,1),(426,'2022-07-18','2022-07-22',5,'00:00:00','00:00:00',40,0,71,'71',1,1,'Vacation',0,0,1),(427,'2022-08-17','2022-08-17',NULL,'12:32:00','18:30:00',5.97,1,81,'81',2,0,'Vacation',1,0,1),(428,'2022-08-17','2022-08-17',NULL,'12:35:00','18:38:00',6.05,1,81,'81',1,1,'Vacation',0,0,1),(429,'2022-08-24','2022-08-24',1,'00:00:00','00:00:00',8,0,112,'98',13,1,'Filling of Fire',0,0,1),(430,'2022-04-27','2022-04-27',1,'00:00:00','00:00:00',8,0,9,'9',2,1,'SICK',0,0,1),(431,'2022-07-05','2022-07-05',1,'00:00:00','00:00:00',8,0,51,'51',1,1,'INDEFINITE LEAVE',0,0,1),(432,'2022-09-14','2022-09-14',1,'00:00:00','00:00:00',8,0,109,'96',10,2,'FEVER',1,0,1),(433,'2022-09-14','2022-09-14',NULL,'07:43:00','22:15:00',14.53,1,109,'96',10,1,'FEVER',0,0,1),(434,'2022-09-15','2022-09-16',2,'00:00:00','00:00:00',16,0,109,'96',10,1,'FEVER',0,0,1),(435,'2022-08-31','2022-08-31',1,'00:00:00','00:00:00',8,0,19,'19',2,1,'SICK',0,0,1),(436,'2022-08-13','2022-08-13',1,'00:00:00','00:00:00',8,0,77,'77',2,1,'SICK',0,0,1),(437,'2022-08-25','2022-08-25',1,'00:00:00','00:00:00',8,0,5,'5',7,1,'PERSONAL MATTER',0,0,1),(438,'2022-09-07','2022-09-09',3,'00:00:00','00:00:00',24,0,61,'61',1,1,'REVIEW CLASS',0,0,1),(439,'2022-09-12','2022-09-12',1,'00:00:00','00:00:00',8,0,61,'61',1,1,'REVIEW CLASS',0,0,1),(440,'2022-09-16','2022-09-16',1,'00:00:00','00:00:00',8,0,61,'61',1,1,'REVIEW CLASS',0,0,1),(441,'2022-09-30','2022-09-30',1,'00:00:00','00:00:00',8,0,61,'61',1,1,'REVIEW CLASS',0,0,1),(442,'2022-08-17','2022-08-17',1,'00:00:00','00:00:00',8,0,30,'30',7,1,'PERSONAL MATTER',0,0,1),(443,'2022-09-01','2022-09-02',2,'00:00:00','00:00:00',16,0,73,'73',2,1,'SICK',0,0,1),(444,'2022-09-05','2022-09-05',1,'00:00:00','00:00:00',8,0,73,'73',2,1,'SICK',0,0,1),(445,'2022-09-07','2022-09-07',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'PERSONAL MATTER',0,0,1),(446,'2022-09-05','2022-09-05',1,'00:00:00','00:00:00',8,0,53,'53',7,1,'TO GET CERTIFICATION ITR',0,0,1),(447,'2022-08-16','2022-08-16',1,'00:00:00','00:00:00',8,0,73,'73',2,1,'SICK',0,0,1),(448,'2022-09-02','2022-09-02',1,'00:00:00','00:00:00',8,0,76,'76',7,1,'IMPORTANT MATTER',0,0,1),(449,'2022-09-05','2022-09-05',1,'00:00:00','00:00:00',8,0,76,'76',7,1,'IMPORTANT MATTER',0,0,1),(450,'2022-09-08','2022-09-08',NULL,'12:03:00','18:30:00',6.45,1,81,'81',1,1,'Vacation leave',0,0,1),(451,'2022-09-19','2022-09-23',5,'00:00:00','00:00:00',40,0,132,'115',13,1,'STUDY LEAVE',0,0,1),(452,'2022-09-26','2022-09-28',3,'00:00:00','00:00:00',24,0,132,'115',13,1,'STUDY LEAVE',0,0,1),(453,'2022-09-12','2022-09-16',5,'00:00:00','00:00:00',40,0,132,'115',13,1,'STUDY LEAVE',0,0,1),(454,'2022-09-19','2022-09-23',5,'00:00:00','00:00:00',40,0,44,'44',13,1,'STUDY LEAVE',0,0,1),(455,'2022-09-26','2022-09-28',3,'00:00:00','00:00:00',24,0,44,'44',13,1,'STUDY LEAVE',0,0,1),(456,'2022-08-30','2022-08-30',1,'00:00:00','00:00:00',8,0,1,'1',7,1,'IMPORTANT MATTER',0,0,1),(457,'2022-08-30','2022-09-02',4,'00:00:00','00:00:00',32,0,47,'47',7,1,'LET REVIEW',0,0,1),(458,'2022-09-05','2022-09-09',5,'00:00:00','00:00:00',40,0,47,'47',7,1,'LET REVIEW',0,0,1),(459,'2022-09-12','2022-09-16',5,'00:00:00','00:00:00',40,0,47,'47',7,1,'LET REVIEW',0,0,1),(460,'2022-09-19','2022-09-23',5,'00:00:00','00:00:00',40,0,47,'47',7,1,'LET REVIEW',0,0,1),(461,'2022-09-26','2022-09-26',1,'00:00:00','00:00:00',8,0,47,'47',7,1,'LET REVIEW',0,0,1),(462,'2022-09-06','2022-09-09',4,'00:00:00','00:00:00',32,0,72,'72',13,1,'REVIEW CLASS ( LET )',0,0,1),(463,'2022-09-12','2022-09-16',5,'00:00:00','00:00:00',40,0,72,'72',13,1,'REVIEW CLASS ( LET )',0,0,1),(464,'2022-09-19','2022-09-23',5,'00:00:00','00:00:00',40,0,72,'72',13,1,'REVIEW CLASS ( LET )',0,0,1),(465,'2022-09-26','2022-09-26',1,'00:00:00','00:00:00',8,0,72,'72',13,1,'REVIEW CLASS ( LET )',0,0,1),(466,'2022-09-12','2022-09-16',5,'00:00:00','00:00:00',40,0,124,'108',13,1,'REVIEW CLASS',0,0,1),(467,'2022-09-12','2022-09-16',5,'00:00:00','00:00:00',40,0,41,'41',13,1,'FINAL COACHING & LET',0,0,1),(468,'2022-09-19','2022-09-23',5,'00:00:00','00:00:00',40,0,41,'41',13,1,'REVIEW CLASS ( LET )',0,0,1),(469,'2022-09-26','2022-09-28',3,'00:00:00','00:00:00',24,0,41,'41',13,1,'REVIEW CLASS ( LET )',0,0,1),(470,'2022-09-12','2022-09-12',1,'00:00:00','00:00:00',8,0,31,'31',10,1,'SICK',0,0,1),(471,'2022-09-19','2022-09-19',1,'00:00:00','00:00:00',8,0,49,'49',2,1,'SICK',0,0,1),(472,'2022-09-26','2022-09-30',5,'00:00:00','00:00:00',40,0,114,'100',13,1,'let examination',0,0,1),(473,'2022-09-15','2022-09-16',2,'00:00:00','00:00:00',16,0,55,'55',7,1,'fever of son',0,0,1),(474,'2022-09-15','2022-09-15',NULL,'08:12:00','12:07:00',3.92,1,56,'56',7,1,'fever of son',0,0,1),(475,'2022-09-09','2022-09-09',1,'00:00:00','00:00:00',8,0,52,'52',7,1,'PERSONAL MATTER',0,0,1),(476,'2022-09-15','2022-09-16',2,'00:00:00','00:00:00',16,0,27,'27',2,1,'FEVER , ASTHMA',0,0,1),(477,'2022-09-13','2022-09-13',1,'00:00:00','00:00:00',8,0,77,'77',2,1,'SICK',0,0,1),(478,'2022-09-20','2022-09-23',4,'00:00:00','00:00:00',32,0,54,'54',13,1,'let examination',0,0,1),(479,'2022-09-26','2022-09-30',5,'00:00:00','00:00:00',40,0,54,'54',13,1,'lET EXAMINATION',0,0,1),(480,'2022-09-20','2022-09-20',1,'00:00:00','00:00:00',8,0,73,'73',1,1,'VACATION',0,0,1),(481,'2022-09-26','2022-09-30',5,'00:00:00','00:00:00',40,0,57,'57',13,1,'lET EXAMINATION',0,0,1),(482,'2022-09-28','2022-09-30',3,'00:00:00','00:00:00',24,0,47,'47',13,1,'lET EXAMINATION',0,0,1),(483,'2022-10-02','2022-10-02',1,'00:00:00','00:00:00',8,0,47,'47',13,1,'lET EXAMINATION',1,0,1),(484,'2022-09-13','2022-09-13',1,'00:00:00','00:00:00',8,0,84,'84',8,1,'FORCE LEAVE',0,0,1),(485,'2022-09-29','2022-09-29',1,'00:00:00','00:00:00',8,0,61,'61',1,1,'REVIEW CLASS',0,0,1),(486,'2022-09-28','2022-09-28',1,'00:00:00','00:00:00',8,0,139,'122',13,1,'BIRTHDAY OF MY HUSBAND',0,0,1),(487,'2022-09-27','2022-09-27',NULL,'07:36:00','12:03:00',4.45,1,139,'122',13,1,'BIRTHDAY OF MY HUSBAND',0,0,1),(488,'2022-09-27','2022-09-30',4,'00:00:00','00:00:00',32,0,73,'73',7,1,'REVIEW  & LET EXAM',0,0,1),(489,'2022-09-26','2022-09-30',5,'00:00:00','00:00:00',40,0,30,'30',1,1,'REVIEW  & LET EXAM',0,0,1),(490,'2022-09-08','2022-09-08',1,'00:00:00','00:00:00',8,0,35,'35',7,1,'PERSONAL MATTER',0,0,1),(491,'2022-09-16','2022-09-16',1,'00:00:00','00:00:00',8,0,19,'19',7,1,'NOT FEELING WELL IN THEBMORNING DUE TO MY PREGNANCY CONDITION',0,0,1),(492,'2022-09-29','2022-09-30',2,'00:00:00','00:00:00',16,0,29,'29',7,1,'LET EXAMINATION',0,0,1),(493,'2022-09-26','2022-09-30',5,'00:00:00','00:00:00',40,0,67,'67',7,1,'LET EXAMINATION',0,0,1),(494,'2022-09-23','2022-09-23',1,'00:00:00','00:00:00',8,0,53,'53',2,1,'TOOTHACHE',0,0,1),(495,'2022-09-22','2022-09-22',1,'00:00:00','00:00:00',8,0,73,'73',1,1,'Vacation leave',0,0,1),(496,'2022-09-30','2022-10-04',5,'00:00:00','00:00:00',40,0,60,'60',7,1,'EMERGENCY',0,0,1),(497,'2022-10-03','2022-10-03',1,'00:00:00','00:00:00',8,0,73,'73',1,1,'Vacation leave',0,0,1),(498,'2022-10-05','2022-10-05',1,'00:00:00','00:00:00',8,0,27,'27',2,1,'SICK',0,0,1),(499,'2022-10-07','2022-10-07',1,'00:00:00','00:00:00',8,0,31,'31',3,1,'ULTRASOUND',0,0,1),(500,'2022-10-10','2022-10-10',1,'00:00:00','00:00:00',8,0,31,'31',3,1,'ULTRASOUND',0,0,1),(501,'2022-10-07','2022-10-07',1,'00:00:00','00:00:00',8,0,80,'80',3,1,'ULTRASOUND',0,0,1),(502,'2022-10-10','2022-10-10',1,'00:00:00','00:00:00',8,0,80,'80',3,1,'ULTRASOUND',0,0,1),(503,'2022-09-23','2022-09-23',1,'00:00:00','00:00:00',8,0,19,'19',7,2,'VOMOTTING DUE TO PREGNANCY',1,0,1),(504,'2022-09-23','2022-09-23',1,'00:00:00','00:00:00',8,0,19,'19',7,1,'VOMITTING DUE PREGNANCY',0,0,1),(505,'2022-09-16','2022-09-16',1,'00:00:00','00:00:00',8,0,55,'55',7,0,'SICKNESS OF SON',1,0,1),(506,'2022-09-30','2022-09-30',1,'00:00:00','00:00:00',8,0,84,'84',2,1,'SICK',0,0,1),(507,'2022-10-03','2022-10-04',2,'00:00:00','00:00:00',16,0,84,'84',2,1,'SICK LEAVE',1,0,1),(508,'2022-09-26','2022-09-28',3,'00:00:00','00:00:00',24,0,46,'46',7,1,'FOR FAMILY MATTER',0,0,1),(509,'2022-09-16','2022-09-16',NULL,'08:00:00','12:00:00',4,1,1,'1',7,1,'SPECIAL LEAVE',0,0,1),(510,'2022-09-27','2022-09-28',2,'00:00:00','00:00:00',16,0,8,'8',10,1,'SICK LEAVE',0,0,1),(511,'2022-10-12','2022-10-12',1,'00:00:00','00:00:00',8,0,8,'8',10,1,'SICK LEAVE',0,0,1),(512,'2022-09-21','2022-09-21',1,'00:00:00','00:00:00',8,0,14,'14',2,1,'SICK LEAVE',0,0,1),(513,'2022-09-30','2022-09-30',NULL,'08:00:00','12:00:00',4,1,81,'81',2,1,'head ache',0,0,1),(514,'2022-10-11','2022-10-11',1,'00:00:00','00:00:00',8,0,20,'20',2,1,'SICK LEAVE',1,0,1),(515,'2022-10-05','2022-10-07',3,'00:00:00','00:00:00',24,0,19,'19',2,1,'SICK LEAVE',0,0,1),(516,'2022-10-10','2022-10-10',NULL,'08:00:00','12:00:00',4,1,77,'77',2,1,'MEDICAL CHECK UP',0,0,1),(517,'2022-10-11','2022-10-11',1,'00:00:00','00:00:00',8,0,139,'122',13,1,'PERSONAL MATTER',0,0,1),(518,'2022-10-10','2022-10-10',1,'00:00:00','00:00:00',8,0,20,'20',2,1,'SICK LEAVE',1,0,1),(519,'2022-10-06','2022-10-06',NULL,'08:00:00','12:00:00',4,1,39,'39',2,1,'sick',0,0,1),(520,'2022-10-14','2022-10-14',1,'00:00:00','00:00:00',8,0,39,'39',2,1,'SICK',0,0,1),(521,'2022-10-13','2022-10-13',NULL,'08:00:00','12:00:00',4,1,39,'39',2,1,'SICK',0,0,1),(522,'2022-10-25','2022-10-25',1,'00:00:00','00:00:00',8,0,20,'20',2,1,'sick',0,0,1),(523,'2022-10-23','2022-10-23',1,'00:00:00','00:00:00',8,0,13,'13',2,1,'SICK',0,0,1),(524,'2022-10-18','2022-10-19',2,'00:00:00','00:00:00',16,0,5,'5',7,1,'SPECIAL LEAVE',0,0,1),(525,'2022-10-20','2022-10-21',2,'00:00:00','00:00:00',16,0,99,'86',13,1,'license Renewal',0,0,1),(526,'2022-10-26','2022-10-26',NULL,'08:00:00','12:00:00',4,1,52,'52',7,1,'Personal matter',1,0,1),(527,'2022-10-20','2022-10-21',2,'00:00:00','00:00:00',16,0,10,'10',13,1,'family Celebration',0,0,1),(528,'2022-10-13','2022-10-14',2,'00:00:00','00:00:00',16,0,44,'44',2,1,'sick',1,0,1),(529,'2022-10-17','2022-10-17',1,'00:00:00','00:00:00',8,0,82,'82',1,1,'vacation',0,0,1),(530,'2022-10-03','2022-10-03',1,'00:00:00','00:00:00',8,0,56,'56',7,1,'Personal matter',0,0,1),(531,'2022-10-03','2022-10-03',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'Personal matter',0,0,1),(532,'2022-10-17','2022-10-17',1,'00:00:00','00:00:00',8,0,75,'75',2,1,'sick',0,0,1),(533,'2022-11-02','2022-11-02',NULL,'13:00:00','17:00:00',4,1,81,'81',7,1,'SCHEDULE OF ORDINATION FOR PRIZEHOOD AT TECC BUTUAN CITY',0,0,1),(534,'2022-11-03','2022-11-04',2,'00:00:00','00:00:00',16,0,81,'81',7,1,'SCHEDULE OF ORDINATION FOR PRIZEHOOD AT TECC BUTUAN CITY',0,0,1),(535,'2022-03-08','2022-03-08',1,'00:00:00','00:00:00',8,0,56,'56',7,1,'IMPORTANT MATTER',0,0,1),(536,'2022-05-31','2022-06-01',2,'00:00:00','00:00:00',16,0,56,'56',7,1,'SPECIAL LEAVE',0,0,1),(537,'2022-04-05','2022-04-05',1,'00:00:00','00:00:00',8,0,56,'56',7,1,'SPECIAL LEAVE',0,0,1),(538,'2022-04-07','2022-04-07',1,'00:00:00','00:00:00',8,0,56,'56',7,1,'SPECIAL LEAVE',0,0,1),(539,'2022-10-03','2022-10-03',1,'00:00:00','00:00:00',8,0,30,'30',1,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(540,'2022-10-04','2022-10-04',NULL,'08:00:00','12:00:00',4,1,30,'30',1,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(541,'2022-10-03','2022-10-03',1,'00:00:00','00:00:00',8,0,47,'47',7,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(542,'2022-04-01','2022-04-01',1,'00:00:00','00:00:00',8,0,74,'74',7,0,'PERSONAL MATTER',1,0,1),(543,'2022-02-28','2022-02-28',1,'00:00:00','00:00:00',8,0,74,'74',7,0,'Eye Check Up',1,0,1),(544,'2022-04-01','2022-04-01',NULL,'08:00:00','12:00:00',4,1,74,'74',7,2,'PERSONAL MATTER',1,0,1),(545,'2022-02-28','2022-02-28',NULL,'08:00:00','12:00:00',4,1,74,'74',7,0,'PERSONAL MATTER',1,0,1),(546,'2022-02-28','2022-02-28',NULL,'08:00:00','12:00:00',4,1,74,'74',7,1,'Eye Check Up',0,0,1),(547,'2022-04-01','2022-04-01',NULL,'08:00:00','12:00:00',4,1,74,'74',7,1,'PERSONAL MATTER',0,0,1),(548,'2022-08-15','2022-08-16',2,'00:00:00','00:00:00',16,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(549,'2022-08-17','2022-08-17',NULL,'08:00:00','12:00:00',4,1,50,'50',7,1,'PERSONAL MATTER',0,0,1),(550,'2022-06-10','2022-06-10',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(551,'2022-09-19','2022-09-23',5,'00:00:00','00:00:00',40,0,124,'108',13,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(552,'2022-09-26','2022-09-28',3,'00:00:00','00:00:00',24,0,124,'108',13,1,'TAKE BOARD EXAM FOR RMP',0,0,1),(553,'2022-02-16','2022-02-16',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'IMPORTANT MATTER',0,0,1),(554,'2022-02-18','2022-02-18',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'IMPORTANT MATTER',0,0,1),(555,'2022-10-18','2022-10-18',NULL,'08:00:00','12:00:00',4,1,52,'52',7,1,'PERSONAL MATTER',0,0,1),(556,'2022-09-29','2022-09-30',2,'00:00:00','00:00:00',16,0,44,'44',7,1,'STUDY LEAVE',0,0,1),(557,'2022-09-12','2022-09-16',5,'00:00:00','00:00:00',40,0,44,'44',13,1,'STUDY LEAVE',0,0,1),(558,'2022-10-03','2022-10-04',2,'00:00:00','00:00:00',16,0,44,'44',13,1,'STUDY LEAVE',0,0,1),(559,'2022-07-27','2022-07-27',1,'00:00:00','00:00:00',8,0,80,'80',2,1,'SICK LEAVE',0,0,1),(560,'2022-10-16','2022-10-16',1,'00:00:00','00:00:00',8,0,20,'20',2,1,'SICK LEAVE',0,0,1),(561,'2022-07-19','2022-07-19',NULL,'13:00:00','17:00:00',4,1,20,'20',2,1,'SICK LEAVE',0,0,1),(562,'2022-05-25','2022-05-25',1,'00:00:00','00:00:00',8,0,20,'20',1,1,'Vacation leave',0,0,1),(563,'2022-04-22','2022-04-22',NULL,'08:00:00','12:00:00',4,1,13,'13',7,0,'PERSONAL MATTER',1,0,1),(564,'2022-04-20','2022-04-20',1,'00:00:00','00:00:00',8,0,13,'13',7,1,'PERSONAL MATTER',0,0,1),(565,'2022-10-23','2022-10-23',1,'00:00:00','00:00:00',8,0,13,'13',2,1,'SICK',0,0,1),(566,'2022-07-20','2022-07-20',NULL,'08:00:00','12:00:00',4,1,39,'39',2,1,'SICK LEAVE',0,0,1),(567,'2022-07-19','2022-07-19',1,'00:00:00','00:00:00',8,0,39,'39',2,1,'SICK LEAVE',0,0,1),(568,'2022-07-25','2022-07-25',1,'00:00:00','00:00:00',8,0,39,'39',2,1,'SICK LEAVE',0,0,1),(569,'2022-05-02','2022-05-04',3,'00:00:00','00:00:00',24,0,69,'69',5,1,'BIRTHDAY OF MY MOTHER',0,0,1),(570,'2022-08-01','2022-08-05',5,'00:00:00','00:00:00',40,0,32,'32',3,1,'MATERNITY LEAVE',0,0,1),(571,'2022-08-08','2022-08-12',5,'00:00:00','00:00:00',40,0,32,'32',3,1,'MATERNITY LEAVE',0,0,1),(572,'2022-08-15','2022-08-19',5,'00:00:00','00:00:00',40,0,32,'32',3,1,'MATERNITY LEAVE',0,0,1),(573,'2022-07-20','2022-07-21',2,'00:00:00','00:00:00',16,0,8,'8',7,1,'Emergency due to accident happened',0,0,1),(574,'2022-07-11','2022-07-13',3,'00:00:00','00:00:00',24,0,8,'8',7,1,'Emergency due to accident happened',0,0,1),(575,'2022-11-08','2022-11-08',1,'00:00:00','00:00:00',8,0,78,'78',2,1,'SICK',1,0,1),(576,'2022-10-27','2022-10-27',1,'00:00:00','00:00:00',8,0,79,'79',2,1,'SICK',0,0,1),(577,'2022-11-04','2022-11-04',NULL,'08:00:00','12:00:00',4,1,34,'34',7,1,'PERSONAL MATTER',0,0,1),(578,'2022-11-17','2022-11-17',1,'00:00:00','00:00:00',8,0,14,'14',7,1,'COMMITTE ON PBMA ELECTION',0,0,1),(579,'2022-11-08','2022-11-10',3,'00:00:00','00:00:00',24,0,69,'69',7,1,'FAMILY REUNION',0,0,1),(580,'2022-11-03','2022-11-03',1,'00:00:00','00:00:00',8,0,14,'14',2,1,'SICK',0,0,1),(581,'2022-11-09','2022-11-09',1,'00:00:00','00:00:00',8,0,14,'14',2,1,'SICK LEAVE',0,0,1),(582,'2022-11-02','2022-11-02',1,'00:00:00','00:00:00',8,0,1,'1',7,1,'IMPORTANT MATTER',0,0,1),(583,'2022-10-25','2022-10-25',NULL,'08:00:00','12:00:00',4,1,1,'1',7,1,'IMPORTANT MATTER',0,0,1),(584,'2022-10-26','2022-10-26',NULL,'08:00:00','12:00:00',4,1,1,'1',7,1,'IMPORTANT MATTER',0,0,1),(585,'2022-11-04','2022-11-04',NULL,'08:00:00','12:00:00',4,1,52,'52',7,1,'PERSONAL MATTER',0,0,1),(586,'2022-11-02','2022-11-02',1,'00:00:00','00:00:00',8,0,52,'52',7,1,'PERSONAL MATTER',0,0,1),(587,'2022-11-02','2022-11-02',1,'00:00:00','00:00:00',8,0,2,'2',7,1,'PERSONAL MATTER',0,0,1),(588,'2022-10-26','2022-10-27',2,'00:00:00','00:00:00',16,0,35,'35',7,1,'BURIAL FATHER IN - LAW',0,0,1),(589,'2022-11-02','2022-11-04',3,'00:00:00','00:00:00',24,0,74,'74',2,1,'SICK',0,0,1),(590,'2022-11-07','2022-11-07',1,'00:00:00','00:00:00',8,0,78,'78',2,1,'SICK LEAVE',0,0,1),(591,'2022-11-08','2022-11-11',4,'00:00:00','00:00:00',32,0,77,'77',1,1,'Vacation leave',0,0,1),(592,'2022-11-14','2022-11-14',1,'00:00:00','00:00:00',8,0,46,'46',7,1,'faculty visit',0,0,1),(593,'2022-12-01','2022-12-01',1,'00:00:00','00:00:00',8,0,52,'52',7,1,'PERSONAL MATTER',0,0,1),(594,'2022-11-18','2022-11-18',1,'00:00:00','00:00:00',8,0,11,'11',7,1,'baby medical Check - up',0,0,1),(595,'2022-11-28','2022-11-29',2,'00:00:00','00:00:00',16,0,54,'54',13,1,'PERSONAL MATTER',0,0,1),(596,'2022-11-18','2022-11-18',NULL,'13:00:00','17:00:00',4,1,56,'56',7,1,'PERSONAL MATTER',0,0,1),(597,'2022-11-08','2022-11-08',1,'00:00:00','00:00:00',8,0,109,'96',10,1,'SICK LEAVE',0,0,1),(598,'2022-11-02','2022-11-02',1,'00:00:00','00:00:00',8,0,50,'50',7,1,'PERSONAL MATTER',0,0,1),(599,'2022-11-02','2022-11-02',1,'00:00:00','00:00:00',8,0,14,'14',2,1,'SICK LEAVE',0,0,1),(600,'2022-11-25','2022-11-25',1,'00:00:00','00:00:00',8,0,82,'82',1,1,'Vacation leave',0,0,1),(601,'2022-11-28','2022-11-28',NULL,'08:00:00','12:00:00',4,1,82,'82',1,1,'Vacation leave',0,0,1),(602,'2022-11-25','2022-11-25',1,'00:00:00','00:00:00',8,0,40,'40',7,1,'emergency trasaction',0,0,1),(603,'2022-11-21','2022-11-23',3,'00:00:00','00:00:00',24,0,5,'5',1,1,'Vacation leave',0,0,1),(604,'2022-11-28','2022-11-29',2,'00:00:00','00:00:00',16,0,14,'14',7,1,'STUDY LEAVE',0,0,1),(605,'2022-11-02','2022-11-02',1,'00:00:00','00:00:00',8,0,14,'14',2,1,'SICK LEAVE',0,0,1),(606,'2022-11-28','2022-11-29',2,'00:00:00','00:00:00',16,0,60,'60',2,1,'SICK LEAVE',0,0,1),(607,'2022-12-01','2022-12-01',1,'00:00:00','00:00:00',8,0,43,'43',2,1,'SICK LEAVE',0,0,1),(608,'2022-11-25','2022-11-25',NULL,'08:00:00','12:00:00',4,1,73,'73',7,1,'SPECIAL LEAVE',0,0,1),(609,'2022-11-24','2022-11-24',1,'00:00:00','00:00:00',8,0,2,'2',7,1,'SPECIAL LEAVE',0,0,1),(610,'2022-11-02','2022-11-02',1,'00:00:00','00:00:00',8,0,20,'20',2,1,'SICK LEAVE',0,0,1),(611,'2022-11-22','2022-11-22',1,'00:00:00','00:00:00',8,0,58,'58',7,1,'travel',0,0,1),(612,'2022-11-02','2022-11-02',1,'00:00:00','00:00:00',8,0,8,'8',1,1,'Vacation leave',0,0,1),(613,'2022-11-04','2022-11-04',1,'00:00:00','00:00:00',8,0,76,'76',5,1,'BIRTHDAY LEAVE',0,0,1),(614,'2022-11-22','2022-11-22',1,'00:00:00','00:00:00',8,0,58,'58',7,1,'TRAVEL',0,0,1),(615,'2022-11-18','2022-11-18',1,'00:00:00','00:00:00',8,0,39,'39',1,1,'Vacation leave',0,0,1),(616,'2022-12-13','2022-12-13',1,'00:00:00','00:00:00',8,0,1,'1',7,1,'IMPORTANT MATTER',0,0,1),(617,'2022-12-14','2022-12-14',NULL,'07:02:00','12:10:00',5.13,1,50,'50',7,1,'PERSONAL MATTER',0,0,1),(618,'2022-12-14','2022-12-14',NULL,'07:00:00','12:00:00',5,1,1,'1',7,1,'IMPORTANT MATTER',0,0,1),(619,'2022-12-17','2022-12-17',NULL,'07:00:00','12:00:00',5,1,52,'52',7,1,'PERSONAL MATTER',0,0,1),(620,'2022-12-05','2022-12-05',NULL,'07:00:00','12:00:00',5,1,52,'52',7,1,'PERSONAL MATTER',0,0,1),(621,'2022-12-14','2022-12-14',NULL,'07:00:00','12:00:00',5,1,52,'52',7,1,NULL,0,0,1),(622,'2022-11-18','2022-11-18',NULL,'07:00:00','12:00:00',5,1,56,'56',7,1,'PERSONAL MATTER',0,0,1),(623,'2022-12-15','2022-12-15',1,'00:00:00','00:00:00',8,0,56,'56',7,1,'PERSONAL MATTER',0,0,1),(624,'2022-12-12','2022-12-12',1,'00:00:00','00:00:00',8,0,73,'73',7,1,'PERSONAL MATTER',0,0,1),(625,'2022-12-05','2022-12-06',2,'00:00:00','00:00:00',16,0,109,'96',13,1,'PERSONAL MATTER',0,0,1),(626,'2022-11-28','2022-11-28',1,'00:00:00','00:00:00',8,0,49,'49',2,1,'SICK LEAVE',0,0,1),(627,'2022-12-05','2022-12-07',3,'00:00:00','00:00:00',24,0,78,'78',2,1,'SICK LEAVE',0,0,1),(628,'2022-12-09','2022-12-09',NULL,'12:30:00','17:30:00',5,1,46,'46',7,1,'IMPORTANT MATTER',0,0,1),(629,'2022-11-22','2022-11-22',NULL,'07:00:00','12:00:00',5,1,43,'43',2,1,'SICK LEAVE',0,0,1),(630,'2022-11-23','2022-11-23',1,'00:00:00','00:00:00',8,0,43,'43',2,1,'SICK LEAVE',0,0,1),(631,'2022-12-05','2022-12-05',1,'00:00:00','00:00:00',8,0,82,'82',2,1,'SICK LEAVE',0,0,1),(632,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,47,'47',7,1,'PERSONAL MATTER',0,0,1),(633,'2022-11-24','2022-11-24',NULL,'07:00:00','12:00:00',5,1,81,'81',2,1,'SICK LEAVE',0,0,1),(634,'2022-12-14','2022-12-14',1,'00:00:00','00:00:00',8,0,31,'31',7,1,'PERSONAL MATTER',0,0,1),(635,'2022-11-02','2022-11-02',1,'00:00:00','00:00:00',8,0,20,'20',2,1,'SICK LEAVE',0,0,1),(636,'2022-12-23','2022-12-23',1,'00:00:00','00:00:00',8,0,49,'49',8,1,'Forced leave',0,0,1),(637,'2022-12-26','2022-12-29',4,'00:00:00','00:00:00',32,0,49,'49',8,1,'Forced leave',0,0,1),(638,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,49,'49',2,1,'SICK',0,0,1),(639,'2022-12-07','2022-12-07',NULL,'08:00:00','12:00:00',4,1,52,'52',7,1,'personal matter',0,0,1),(640,'2022-12-22','2022-12-23',2,'00:00:00','00:00:00',16,0,30,'30',1,1,'Vacation leave',0,0,1),(641,'2022-12-29','2022-12-29',1,'00:00:00','00:00:00',8,0,31,'31',3,1,'MATERNITY LEAVE',0,0,1),(642,'2023-01-03','2023-01-31',29,'00:00:00','00:00:00',232,0,31,'31',3,1,'MATERNITY LEAVE',0,0,1),(643,'2023-02-01','2023-02-28',28,'00:00:00','00:00:00',224,0,31,'31',3,1,'MATERNITY LEAVE',0,0,1),(644,'2023-03-01','2023-03-31',31,'00:00:00','00:00:00',248,0,31,'31',3,1,'MATERNITY LEAVE',0,0,1),(645,'2022-12-09','2022-12-09',NULL,'08:00:00','12:00:00',4,1,43,'43',7,1,'SPECIAL LEAVE',0,0,1),(646,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,75,'75',7,1,'SPECIAL LEAVE',0,0,1),(647,'2022-11-14','2022-11-15',2,'00:00:00','00:00:00',16,0,20,'20',2,1,'SICK',0,0,1),(648,'2022-12-22','2022-12-22',1,'00:00:00','00:00:00',8,0,82,'82',1,1,'Vacation leave',0,0,1),(649,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,31,'31',7,1,'SPECIAL LEAVE',0,0,1),(650,'2022-12-14','2022-12-14',1,'00:00:00','00:00:00',8,0,31,'31',7,1,'SPECIAL LEAVE',0,0,1),(651,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,80,'80',2,1,'SPECIAL LEAVE',0,0,1),(652,'2022-12-23','2022-12-23',1,'00:00:00','00:00:00',8,0,1,'1',7,1,'PERSONAL MATTER',0,0,1),(653,'2023-12-02','2023-12-02',1,'00:00:00','00:00:00',8,0,46,'46',5,1,'BIRTHDAY',0,0,1),(654,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,69,'69',7,1,'Vacation leave',0,0,1),(655,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,21,'21',1,1,'Vacation leave',0,0,1),(656,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,79,'79',7,1,'divine master B-day pArade',0,0,1),(657,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,11,'11',7,1,'DIVINE MASTER BIRTHDAY',0,0,1),(658,'2022-12-01','2022-12-01',1,'00:00:00','00:00:00',8,0,60,'60',2,1,'SICK LEAVE',0,0,1),(659,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,60,'60',2,1,'SICK LEAVE',0,0,1),(660,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,78,'78',2,1,'SICK LEAVE',0,0,1),(661,'2022-01-09','2022-01-09',1,'00:00:00','00:00:00',8,0,71,'71',7,0,'SPECIAL LEAVE',1,0,1),(662,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,71,'71',7,1,'SPECIAL LEAVE',0,0,1),(663,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,77,'77',1,0,'Vacation leave',0,0,1),(664,'2022-12-23','2022-12-23',1,'00:00:00','00:00:00',8,0,77,'77',1,0,'Vacation leave',0,0,1),(665,'2022-12-27','2022-12-27',1,'00:00:00','00:00:00',8,0,77,'77',1,0,'Vacation leave',0,0,1),(666,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,9,'9',5,1,'Master Birthday',0,0,1),(667,'2022-12-28','2022-12-28',1,'00:00:00','00:00:00',8,0,63,'63',7,1,'OB GYNE CHECK - UP',0,0,1),(668,'2023-01-03','2023-01-06',4,'00:00:00','00:00:00',32,0,63,'63',2,1,'MAYOMA OPERATION',0,0,1),(669,'2023-01-09','2023-01-13',5,'00:00:00','00:00:00',40,0,63,'63',7,1,'MAYOMA OPERATION',0,0,1),(670,'2023-01-16','2023-01-16',1,'00:00:00','00:00:00',8,0,63,'63',7,1,'MAYOMA OPERATION',0,0,1),(671,'2022-12-21','2022-12-21',1,'00:00:00','00:00:00',8,0,43,'43',7,0,'SPECIAL LEAVE',1,0,1),(672,'2022-12-19','2022-12-19',1,'00:00:00','00:00:00',8,0,43,'43',2,1,'SICK LEAVE',0,0,1),(673,'2022-12-19','2022-12-19',1,'00:00:00','00:00:00',8,0,52,'52',7,1,'PERSONAL MATTER',0,0,1),(674,'2022-12-14','2022-12-14',NULL,'08:00:00','12:00:00',4,1,2,'2',7,1,'PERSONAL MATTER',0,0,1),(675,'2022-12-09','2022-12-09',NULL,'08:00:00','12:00:00',4,1,2,'2',7,1,'PERSONAL MATTER',0,0,1),(676,'2022-12-16','2022-12-16',1,'00:00:00','00:00:00',8,0,27,'27',2,1,'SICK',0,0,1),(677,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,61,'61',7,1,'DIVINE MASTER BDAY CELEBRATION',0,0,1),(678,'2022-12-16','2022-12-16',1,'00:00:00','00:00:00',8,0,53,'53',2,1,'SICK',0,0,1),(679,'2022-12-24','2022-12-24',NULL,'13:00:00','17:00:00',4,1,33,'33',7,1,'TO DPWH AS- JUDGE',0,0,1),(680,'2022-12-20','2022-12-20',1,'00:00:00','00:00:00',8,0,140,'123',13,1,'FILLING CSC',0,0,1),(681,'2022-12-23','2022-12-23',1,'00:00:00','00:00:00',8,0,140,'123',13,1,'PERSONAL MATTER',0,0,1),(682,'2022-12-20','2022-12-23',4,'00:00:00','00:00:00',32,0,13,'13',7,1,'PERSONAL MATTER',0,0,1),(683,'2022-12-26','2022-12-29',4,'00:00:00','00:00:00',32,0,13,'13',7,1,'PERSONAL MATTER',0,0,1),(684,'2022-12-22','2022-12-22',1,'00:00:00','00:00:00',8,0,43,'43',2,1,'SICK LEAVE',0,0,1),(685,'2022-12-22','2022-12-22',1,'00:00:00','00:00:00',8,0,43,'43',2,1,'SICK LEAVE',0,0,1),(686,'2023-01-03','2023-01-03',1,'00:00:00','00:00:00',8,0,21,'21',1,1,'Vacation Leave',0,0,1),(687,'2023-01-13','2023-01-13',1,'00:00:00','00:00:00',8,0,21,'21',1,1,'Vacation Leave',0,0,1),(688,'2023-01-20','2023-01-20',1,'00:00:00','00:00:00',8,0,21,'21',1,1,'Vacation Leave',0,0,1),(689,'2023-01-23','2023-01-23',1,'00:00:00','00:00:00',8,0,20,'20',2,1,NULL,0,0,1),(690,'2023-01-09','2023-01-09',1,'00:00:00','00:00:00',8,0,35,'35',1,1,'Vacation Leave',0,0,1),(691,'2023-01-04','2023-01-05',2,'00:00:00','00:00:00',16,0,55,'55',2,1,'Sick Leave',0,0,1),(692,'2023-01-06','2023-01-06',NULL,'07:00:00','12:00:00',5,1,55,'55',2,1,'Sick Leave',0,0,1),(693,'2023-01-12','2023-01-12',1,'00:00:00','00:00:00',8,0,14,'14',2,1,'Sick Leave',0,0,1),(694,'2023-01-09','2023-01-10',2,'00:00:00','00:00:00',16,0,20,'20',2,1,'Sick Leave',0,0,1),(695,'2023-01-11','2023-01-11',NULL,'07:00:00','12:00:00',5,1,20,'20',2,1,NULL,0,0,1),(696,'2023-01-26','2023-01-27',2,'00:00:00','00:00:00',16,0,14,'14',7,1,'Study Leave',0,0,1),(697,'2023-01-04','2023-01-05',2,'00:00:00','00:00:00',16,0,20,'20',2,1,'Sick Leave',0,0,1),(698,'2023-12-16','2023-12-16',1,'00:00:00','00:00:00',8,0,70,'70',1,1,'Vacation Leave',0,0,1),(699,'2023-12-28','2023-12-29',2,'00:00:00','00:00:00',16,0,70,'70',1,1,'Vacation Leave',0,0,1),(700,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,3,'3',1,1,'Vacation Leave',0,0,1),(701,'2023-01-09','2023-01-09',1,'00:00:00','00:00:00',8,0,60,'60',2,1,'Sick Leave',0,0,1),(702,'2023-01-12','2023-01-13',2,'00:00:00','00:00:00',16,0,60,'60',2,1,'Sick Leave',0,0,1),(703,'2023-12-06','2023-12-06',1,'00:00:00','00:00:00',8,0,80,'80',3,1,'maternity/paternity',0,0,1),(704,'2023-01-09','2023-01-09',1,'00:00:00','00:00:00',8,0,61,'61',2,1,'Sick Leave',0,0,1),(705,'2023-01-19','2023-01-19',1,'00:00:00','00:00:00',8,0,84,'84',2,1,'Sick Leave',0,0,1),(706,'2023-01-21','2023-01-23',3,'00:00:00','00:00:00',24,0,84,'84',2,1,'Sick Leave',0,0,1),(707,'2023-01-04','2023-01-05',2,'00:00:00','00:00:00',16,0,56,'56',1,1,'Vacation Leave',0,0,1),(708,'2023-01-06','2023-01-06',NULL,'08:00:00','12:00:00',4,1,56,'56',1,1,'Vacation Leave',0,0,1),(709,'2023-01-06','2023-01-06',1,'00:00:00','00:00:00',8,0,79,'79',2,1,'Sick Leave',0,0,1),(710,'2023-01-09','2023-01-09',1,'00:00:00','00:00:00',8,0,79,'79',2,1,'Sick Leave',0,0,1),(711,'2023-01-13','2023-01-13',1,'00:00:00','00:00:00',8,0,71,'71',1,1,'Vacation Leave',0,0,1),(712,'2023-01-16','2023-01-16',1,'00:00:00','00:00:00',8,0,71,'71',1,1,'Vacation Leave',0,0,1),(713,'2023-01-12','2023-01-12',1,'00:00:00','00:00:00',8,0,39,'39',1,1,'Vacation Leave',0,0,1),(714,'2023-12-29','2023-12-29',1,'00:00:00','00:00:00',8,0,80,'80',3,1,'maternity/paternity leave',0,0,1),(715,'2023-01-19','2023-01-20',2,'00:00:00','00:00:00',16,0,14,'14',7,1,'Study Leave',0,0,1),(716,'2023-01-03','2023-01-05',3,'00:00:00','00:00:00',24,0,81,'81',2,1,'Sick Leave',0,0,1),(717,'2023-01-18','2023-01-18',1,'00:00:00','00:00:00',8,0,78,'78',2,1,'Sick Leave',0,0,1),(718,'2022-12-09','2022-12-09',1,'00:00:00','00:00:00',8,0,8,'8',7,1,'Special Leave',0,0,1),(719,'2022-12-22','2022-12-22',1,'00:00:00','00:00:00',8,0,81,'81',1,1,'Vacation Leave',0,0,1),(720,'2022-12-27','2022-12-27',1,'00:00:00','00:00:00',8,0,81,'81',1,1,'Vacation Leave',0,0,1),(721,'2022-12-28','2022-12-28',1,'00:00:00','00:00:00',8,0,81,'81',1,1,'Vacation Leave',0,0,1),(722,'2022-12-07','2022-12-07',1,'00:00:00','00:00:00',8,0,8,'8',7,1,'Special Leave',0,0,1),(723,'2023-01-21','2023-01-21',NULL,'08:00:00','12:00:00',4,1,8,'8',7,1,'Special Leave',0,0,1),(724,'2023-01-21','2023-01-21',NULL,'08:00:00','12:00:00',4,1,74,'74',7,1,'Special Leave',0,0,1),(725,'2023-01-11','2023-01-11',1,'00:00:00','00:00:00',8,0,52,'52',7,1,'Purchased of High School Day',0,0,1),(726,'2023-01-17','2023-01-17',1,'00:00:00','00:00:00',8,0,19,'19',3,1,'Pre-natal Check-up',0,0,1),(727,'2022-12-20','2022-12-20',1,'00:00:00','00:00:00',8,0,56,'56',7,1,'Important Matters',0,0,1),(728,'2023-01-09','2023-01-09',1,'00:00:00','00:00:00',8,0,47,'47',7,1,'Personal Matter',0,0,1),(729,'2023-01-12','2023-01-12',1,'00:00:00','00:00:00',8,0,74,'74',7,1,'Family Matter',0,0,1),(730,'2023-01-21','2023-01-21',NULL,'08:00:00','12:00:00',4,1,50,'50',7,1,'Personal Matter',0,0,1),(731,'2023-01-16','2023-01-16',NULL,'08:00:00','12:00:00',4,1,50,'50',7,1,'Personal Matter',0,0,1),(732,'2023-01-17','2023-01-19',3,'00:00:00','00:00:00',24,0,76,'76',7,1,'Important Matter',0,0,1),(733,'2023-01-20','2023-01-20',NULL,'08:00:00','12:00:00',4,1,9,'9',7,1,'Personal Matter',0,0,1),(734,'2022-12-16','2022-12-16',1,'00:00:00','00:00:00',8,0,8,'8',7,1,'Special Leave',0,0,1),(735,'2022-12-29','2022-12-29',NULL,'08:00:00','12:00:00',4,1,53,'53',7,1,'Special Leave',0,0,1),(736,'2022-12-19','2022-12-19',1,'00:00:00','00:00:00',8,0,55,'55',7,1,'Important Matter',0,0,1),(737,'2022-12-20','2022-12-20',NULL,'08:00:00','12:00:00',4,1,55,'55',7,1,'Important Matter',0,0,1),(738,'2023-01-03','2023-01-03',1,'00:00:00','00:00:00',8,0,19,'19',2,1,'Cough & cold',0,0,1),(739,'2023-01-09','2023-01-11',3,'00:00:00','00:00:00',24,0,19,'19',2,1,'Cough & cold',0,0,1),(740,'2022-12-27','2022-12-28',2,'00:00:00','00:00:00',16,0,25,'25',7,1,'Personal Matter',0,0,1),(741,'2022-12-29','2022-12-29',NULL,'08:00:00','12:00:00',4,1,25,'25',7,1,'Personal Matter',0,0,1),(742,'2022-12-20','2022-12-20',1,'00:00:00','00:00:00',8,0,67,'67',7,1,'Special Leave',0,0,1),(743,'2023-02-01','2023-02-03',3,'00:00:00','00:00:00',24,0,30,'30',7,1,'Take an oath taking',0,0,1),(744,'2023-01-31','2023-01-31',1,'00:00:00','00:00:00',8,0,61,'61',7,1,'Important decision , Butuan City',0,0,1),(745,'2022-12-22','2022-12-22',NULL,'08:00:00','12:00:00',4,1,30,'30',1,1,'Vacation Leave',0,0,1),(746,'2022-12-27','2022-12-27',NULL,'08:00:00','12:00:00',4,1,30,'30',1,1,'Vacation Leave',0,0,1),(747,'2023-02-08','2023-02-08',1,'00:00:00','00:00:00',8,0,29,'29',7,1,'personal matter',0,0,1),(748,'2023-02-03','2023-02-03',1,'00:00:00','00:00:00',8,0,9,'9',7,1,'take care of my father',0,0,1),(749,'2023-02-06','2023-02-10',5,'00:00:00','00:00:00',40,0,9,'9',7,1,'take care of my father',0,0,1),(750,'2023-01-30','2023-02-03',5,'00:00:00','00:00:00',40,0,33,'33',2,1,'sick',0,0,1),(751,'2023-01-17','2023-01-17',1,'00:00:00','00:00:00',8,0,19,'19',2,1,'sick',1,0,1),(752,'2023-01-23','2023-01-23',1,'00:00:00','00:00:00',8,0,19,'19',2,1,'sick',0,0,1),(753,'2023-01-26','2023-01-26',1,'00:00:00','00:00:00',8,0,19,'19',2,1,'sick',0,0,1),(754,'2023-01-30','2023-01-30',1,'00:00:00','00:00:00',8,0,19,'19',2,1,'sick',0,0,1),(755,'2023-02-02','2023-02-03',2,'00:00:00','00:00:00',16,0,19,'19',2,1,'sick',0,0,1),(756,'2023-01-16','2023-01-20',5,'00:00:00','00:00:00',40,0,80,'80',7,1,'important matter',0,0,1),(757,'2023-01-23','2023-01-27',5,'00:00:00','00:00:00',40,0,80,'80',7,1,'personal matter',0,0,1),(758,'2023-01-30','2023-02-03',5,'00:00:00','00:00:00',40,0,80,'80',7,1,'personal matter',0,0,1),(759,'2023-02-06','2023-02-10',5,'00:00:00','00:00:00',40,0,67,'67',7,1,'review',0,0,1),(760,'2023-02-13','2023-02-17',5,'00:00:00','00:00:00',40,0,67,'67',7,1,'review',0,0,1),(761,'2023-02-20','2023-02-24',5,'00:00:00','00:00:00',40,0,67,'67',7,1,'review',0,0,1),(762,'2023-02-27','2023-03-03',5,'00:00:00','00:00:00',40,0,67,'67',7,1,'review',0,0,1),(763,'2023-03-06','2023-03-10',5,'00:00:00','00:00:00',40,0,67,'67',7,1,'review',0,0,1),(764,'2023-03-13','2023-03-17',5,'00:00:00','00:00:00',40,0,67,'67',7,1,'review',0,0,1),(765,'2023-03-20','2023-03-24',5,'00:00:00','00:00:00',40,0,67,'67',7,1,'review',0,0,1),(766,'2023-02-03','2023-02-03',1,'00:00:00','00:00:00',8,0,41,'41',13,1,'oath -taking for professional teacher',0,0,1),(767,'2023-03-06','2023-03-06',1,'00:00:00','00:00:00',8,0,41,'41',13,1,'oath -taking for professional teacher',0,0,1),(768,'2023-01-30','2023-02-03',5,'00:00:00','00:00:00',40,0,79,'79',2,1,'sick',0,0,1),(769,'2023-01-30','2023-01-31',2,'00:00:00','00:00:00',16,0,53,'53',2,1,'sick',0,0,1),(770,'2023-01-27','2023-01-27',1,'00:00:00','00:00:00',8,0,3,'3',7,1,'special leave',0,0,1),(771,'2023-02-08','2023-02-08',1,'00:00:00','00:00:00',8,0,81,'81',7,0,'Medical Check - up with my wife',0,0,1);

/*Table structure for table `memo` */

DROP TABLE IF EXISTS `memo`;

CREATE TABLE `memo` (
  `memo_id` int(11) NOT NULL AUTO_INCREMENT,
  `memo_date` date DEFAULT NULL,
  `memo_title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`memo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `memo` */

/*Table structure for table `memo_detail` */

DROP TABLE IF EXISTS `memo_detail`;

CREATE TABLE `memo_detail` (
  `memo_detail_pk` int(11) NOT NULL AUTO_INCREMENT,
  `memo_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`memo_detail_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `memo_detail` */

/*Table structure for table `pagibig_loan` */

DROP TABLE IF EXISTS `pagibig_loan`;

CREATE TABLE `pagibig_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transNo` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sysPK_Empl` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `terms` double DEFAULT NULL,
  `amortization` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pagibig_loan` */

/*Table structure for table `pagibig_setup` */

DROP TABLE IF EXISTS `pagibig_setup`;

CREATE TABLE `pagibig_setup` (
  `PAGIBIG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Gross_From` double DEFAULT NULL,
  `Gross_To` double DEFAULT NULL,
  `Multiplier_Employee` double DEFAULT NULL,
  `Multiplier_Employer` double DEFAULT NULL,
  PRIMARY KEY (`PAGIBIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pagibig_setup` */

/*Table structure for table `part_1_2_3_eval_data` */

DROP TABLE IF EXISTS `part_1_2_3_eval_data`;

CREATE TABLE `part_1_2_3_eval_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_batch_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT 0,
  `part_1_score_percentage` double DEFAULT 0,
  `part_2_score_percentage` double DEFAULT 0,
  `net_performance_rating` double DEFAULT 0,
  `p3_no_1_score` double DEFAULT 0,
  `p3_no_2_score` double DEFAULT 0,
  `percentage_score` double DEFAULT 0,
  `compensation_adjustments` double DEFAULT 0,
  `p3_deduct_1` double DEFAULT 0,
  `p3_deduct_2` double DEFAULT 0,
  `basic_salary` double DEFAULT 0,
  `superior_assessment` longtext DEFAULT NULL,
  `rated_emp_comments` longtext DEFAULT NULL,
  `hr_remarks` longtext DEFAULT NULL,
  `recommendation` longtext DEFAULT NULL,
  `remarks_approval` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_1_2_3_eval_data` */

/*Table structure for table `part_1_eval_data` */

DROP TABLE IF EXISTS `part_1_eval_data`;

CREATE TABLE `part_1_eval_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_batch_id` int(11) DEFAULT 0,
  `part_1_eval_id` int(11) DEFAULT 0,
  `emp_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) DEFAULT NULL,
  `score` double DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_1_eval_data` */

/*Table structure for table `part_1_evaluations` */

DROP TABLE IF EXISTS `part_1_evaluations`;

CREATE TABLE `part_1_evaluations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_1_scoring_id` int(11) DEFAULT 1,
  `title` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_1_evaluations` */

/*Table structure for table `part_1_scoring` */

DROP TABLE IF EXISTS `part_1_scoring`;

CREATE TABLE `part_1_scoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score1` varchar(20) DEFAULT '70',
  `score2` varchar(20) DEFAULT '90',
  `score3` varchar(20) DEFAULT '100',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_1_scoring` */

/*Table structure for table `part_2_eval_data` */

DROP TABLE IF EXISTS `part_2_eval_data`;

CREATE TABLE `part_2_eval_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_batch_id` int(11) DEFAULT 0,
  `part_2_eval_id` int(11) DEFAULT 0,
  `emp_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) DEFAULT NULL,
  `score` double DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_2_eval_data` */

/*Table structure for table `part_2_eval_data_bk` */

DROP TABLE IF EXISTS `part_2_eval_data_bk`;

CREATE TABLE `part_2_eval_data_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_batch_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `critical_task` varchar(100) DEFAULT NULL,
  `date_task_given` date DEFAULT NULL,
  `completation_target` date DEFAULT NULL,
  `actual_completation` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_2_eval_data_bk` */

/*Table structure for table `part_2_evaluations` */

DROP TABLE IF EXISTS `part_2_evaluations`;

CREATE TABLE `part_2_evaluations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_2_scoring_id` int(11) DEFAULT 1,
  `title` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_2_evaluations` */

/*Table structure for table `part_2_scoring` */

DROP TABLE IF EXISTS `part_2_scoring`;

CREATE TABLE `part_2_scoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score1` varchar(20) DEFAULT '70',
  `score2` varchar(20) DEFAULT '90',
  `score3` varchar(20) DEFAULT '100',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `part_2_scoring` */

/*Table structure for table `payroll` */

DROP TABLE IF EXISTS `payroll`;

CREATE TABLE `payroll` (
  `payroll_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `save_by_id` int(11) DEFAULT NULL,
  `save_by` varchar(255) DEFAULT NULL,
  `save_date` date DEFAULT NULL,
  PRIMARY KEY (`payroll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payroll` */

/*Table structure for table `payroll_13th_month` */

DROP TABLE IF EXISTS `payroll_13th_month`;

CREATE TABLE `payroll_13th_month` (
  `payroll_13th_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT 0,
  `bonus` double DEFAULT 0,
  `total` double DEFAULT 0,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`payroll_13th_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payroll_13th_month` */

/*Table structure for table `payroll_adjustment` */

DROP TABLE IF EXISTS `payroll_adjustment`;

CREATE TABLE `payroll_adjustment` (
  `payroll_adj_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `adjustment_date` date DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `additional_adjustment` double DEFAULT NULL,
  `additional_adjustment_remarks` varchar(255) DEFAULT NULL,
  `deduction_adjustment` double DEFAULT NULL,
  `deduction_adjustment_remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payroll_adj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payroll_adjustment` */

/*Table structure for table `payroll_deduction` */

DROP TABLE IF EXISTS `payroll_deduction`;

CREATE TABLE `payroll_deduction` (
  `deduction_id` int(11) NOT NULL AUTO_INCREMENT,
  `deduction_date` date DEFAULT NULL,
  `emp_no` varchar(255) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `coop` double DEFAULT 0,
  `sss_loan` double DEFAULT 0,
  `pagibig_loan` double DEFAULT 0,
  `cash_advance` double DEFAULT 0,
  `canteen` double DEFAULT 0,
  `remarks` varchar(255) DEFAULT '',
  PRIMARY KEY (`deduction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `payroll_deduction` */

insert  into `payroll_deduction`(`deduction_id`,`deduction_date`,`emp_no`,`emp_name`,`coop`,`sss_loan`,`pagibig_loan`,`cash_advance`,`canteen`,`remarks`) values (1,'2022-06-05','30','EMPINADO, ETHEL ALEGADO',545,0,0,0,363,'test deduction'),(3,'2022-06-15','80','TUBAT, ELESON MORATO',375,0,0,0,0,''),(4,'2022-06-11','1','ABING, HACELJEN INCIPIDO',550,0,0,0,200,'');

/*Table structure for table `payroll_detail_2` */

DROP TABLE IF EXISTS `payroll_detail_2`;

CREATE TABLE `payroll_detail_2` (
  `payroll_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `payroll_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `daily_rate` double DEFAULT 0,
  `monthly_rate` double DEFAULT 0,
  `semi_monthly_rate` double DEFAULT 0,
  `hourly_rate` double DEFAULT 0,
  `min_rate` double DEFAULT 0,
  `reg_ot_rate` double DEFAULT 0,
  `holiday_rate` double DEFAULT 0,
  `sunday_special_rate` double DEFAULT 0,
  `night_premium_rate` double DEFAULT 0,
  `standart_hour` double DEFAULT 0,
  `absent_hour` double DEFAULT 0,
  `ut` double DEFAULT 0,
  `leave` double DEFAULT 0,
  `actual_hour` double DEFAULT 0,
  `late_min` double DEFAULT 0,
  `reg_ot_hours` double DEFAULT 0,
  `sunday_special_hour` double DEFAULT 0,
  `sunday_special_ot_hour` double DEFAULT 0,
  `holiday_hour` double DEFAULT 0,
  `holiday_ot_hour` double DEFAULT 0,
  `night_premium_hour` double DEFAULT 0,
  `night_premium_holiday_hour` double DEFAULT 0,
  `night_premium_sunday_special_hour` double DEFAULT 0,
  `paternity_leave_hour` double DEFAULT 0,
  `service_incentive_hour` double DEFAULT 0,
  `total_hour` double DEFAULT 0,
  `rice_allowance` double DEFAULT 0,
  `clothing_allowance` double DEFAULT 0,
  `monetized_unused_leave_credit` double DEFAULT 0,
  `medical_allowance_dependents` double DEFAULT 0,
  `medical_allowance` double DEFAULT 0,
  `laundry_allowance` double DEFAULT 0,
  `deminis_benefits` double DEFAULT 0,
  `cola` double DEFAULT 0,
  `communication_allowance` double DEFAULT 0,
  `basic_pay` double DEFAULT 0,
  `ot_pay` double DEFAULT 0,
  `sunday_special_pay` double DEFAULT 0,
  `sunday_special_ot_pay` double DEFAULT 0,
  `holiday_pay` double DEFAULT 0,
  `holiday_ot_pay` double DEFAULT 0,
  `night_premium_pay` double DEFAULT 0,
  `night_premium_holiday_pay` double DEFAULT 0,
  `night_premium_sunday_pay` double DEFAULT 0,
  `paternity_leave_pay` double DEFAULT 0,
  `service_incentive_pay` double DEFAULT 0,
  `adjustments` double DEFAULT 0,
  `late_deduction` double DEFAULT 0,
  `gross_pay` double DEFAULT 0,
  `taxable_compensation` double DEFAULT 0,
  `sss` double DEFAULT 0,
  `philhealth` double DEFAULT 0,
  `pag_ibig` double DEFAULT 0,
  `wtax` double DEFAULT 0,
  `under_witheld` double DEFAULT 0,
  `other_deductions` double DEFAULT 0,
  `total_tax` double DEFAULT 0,
  `sss_loan` double DEFAULT 0,
  `pagibig_loan` double DEFAULT 0,
  `loan_adjustment` double DEFAULT 0,
  `cash_advance` double DEFAULT 0,
  `total_deduction` double DEFAULT 0,
  `net_pay_atm` double DEFAULT 0,
  `net_pay_should_be` double DEFAULT 0,
  `extra` double DEFAULT 0,
  `sss_er` double DEFAULT 0,
  `philhealth_er` double DEFAULT 0,
  `pagibig_er` double DEFAULT 0,
  `wtax_er` double DEFAULT 0,
  `total_er` double DEFAULT 0,
  PRIMARY KEY (`payroll_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payroll_detail_2` */

/*Table structure for table `payroll_details` */

DROP TABLE IF EXISTS `payroll_details`;

CREATE TABLE `payroll_details` (
  `payroll_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `payroll_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_code` varchar(255) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `days_work` double DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `late_hours` double DEFAULT NULL,
  `undertime_hours` double DEFAULT NULL,
  `overtime_hours` double DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `daily_rate` double DEFAULT NULL,
  `overtime_pay` double DEFAULT NULL,
  `holiday_pay` double DEFAULT NULL,
  `late_deduction` double DEFAULT NULL,
  `undertime_deduction` double DEFAULT NULL,
  `gross` double DEFAULT NULL,
  `cola` double DEFAULT NULL,
  `transportation` double DEFAULT NULL,
  `mobile` double DEFAULT NULL,
  `osa` double DEFAULT NULL,
  `meal` double DEFAULT NULL,
  `sss` double DEFAULT NULL,
  `philhealth` double DEFAULT NULL,
  `pagibig` double DEFAULT NULL,
  `wtax` double DEFAULT NULL,
  `net` double DEFAULT NULL,
  PRIMARY KEY (`payroll_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payroll_details` */

/*Table structure for table `payslip` */

DROP TABLE IF EXISTS `payslip`;

CREATE TABLE `payslip` (
  `SysPK_PaySlip` decimal(10,0) DEFAULT NULL,
  `SysFK_Empl_PaySlip` decimal(10,0) NOT NULL,
  `SysFK_CshAdv_PaySlip` decimal(10,0) DEFAULT NULL,
  `Code_PaySlip` varchar(50) DEFAULT NULL,
  `DateProcess_PaySlip` date DEFAULT NULL,
  `DateFrom_PaySlip` date NOT NULL,
  `DateTo_PaySlip` date NOT NULL,
  `Name_PaySlip` varchar(255) DEFAULT NULL,
  `DaysWork_PaySlip` double DEFAULT NULL,
  `OvertimeHours_PaySlip` double DEFAULT NULL,
  `UnderTimeHours_PaySlip` double DEFAULT NULL,
  `BasicPay_PaySlip` double DEFAULT NULL,
  `Adjustment_PaySlip` double DEFAULT NULL,
  `OvertimePay_PaySlip` double DEFAULT NULL,
  `UnderTime_PaySlip` double DEFAULT NULL,
  `GrossPay_PaySlip` double DEFAULT NULL,
  `TotalDeducstions_PaySlip` double DEFAULT NULL,
  `NetPay_PaySlip` double DEFAULT NULL,
  `SSS_PaySlip` double DEFAULT NULL,
  `Pagibig_PaySlip` double DEFAULT NULL,
  `PhilHealth_PaySlip` double DEFAULT NULL,
  `Tax_PaySlip` double DEFAULT NULL,
  `CashBond_PaySlip` double DEFAULT NULL,
  `CashAdvance_PaySlip` double DEFAULT NULL,
  `RatePerDay_PaySlip` double DEFAULT NULL,
  `DoleRate_PaySlip` double DEFAULT NULL,
  `Remarks_PaySlip` varchar(255) DEFAULT NULL,
  `HolidaySunday_PaySlip` double DEFAULT NULL,
  `HolidaySundayPay_PaySlip` double DEFAULT NULL,
  `HolidayLegal_PaySlip` double DEFAULT NULL,
  `HolidayLegalPay_PaySlip` double DEFAULT NULL,
  `HolidaySpecial_PaySlip` double DEFAULT NULL,
  `HolidaySpecialPay_PaySlip` double DEFAULT NULL,
  `PremiumRegular_PaySlip` varchar(255) DEFAULT NULL,
  `PremiumRegularPay_PaySlip` double DEFAULT NULL,
  `PremiumOvertime_PaySlip` double DEFAULT NULL,
  `PremiumOvertimePay_PaySlip` double DEFAULT NULL,
  `CashCard_PaySlip` double DEFAULT NULL,
  `Honorarium_PaySlip` double DEFAULT NULL,
  `SSSDole_PaySlip` double DEFAULT NULL,
  `PagibigDole_PaySlip` double DEFAULT NULL,
  `PhilHealthDole_Payslip` double DEFAULT NULL,
  `TaxDole_Payslip` double DEFAULT NULL,
  `Honorarium1_Payslip` double DEFAULT NULL,
  `OvertimePayDole_PaySlip` double DEFAULT NULL,
  `DaysWork_PaySlip2` double DEFAULT NULL,
  `department_code` varchar(255) DEFAULT NULL,
  `group_code` varchar(255) DEFAULT NULL,
  `HrsLate_Payslip` double DEFAULT NULL,
  `LatePay_Payslip` double DEFAULT NULL,
  `hrs_work` varchar(255) DEFAULT NULL,
  `sss_loan` double DEFAULT NULL,
  `timeStart` varchar(255) DEFAULT NULL,
  `timeEnd` varchar(255) DEFAULT NULL,
  `pagibig_loan` double DEFAULT NULL,
  `Sunday_hrsWork` double DEFAULT NULL,
  `Sunday_hrsPay` double DEFAULT NULL,
  `specialHoliday_OTHrs` double DEFAULT NULL,
  `specialHoliday_OTPay` double DEFAULT NULL,
  `logalHolday_OTHrs` double DEFAULT NULL,
  `logalHolday_OTPay` double DEFAULT NULL,
  `pagibig_id` int(11) DEFAULT NULL,
  `sss_id` int(11) DEFAULT NULL,
  `grossPay_Dole` double DEFAULT NULL,
  `Sunday_hrsPay_Dole` double DEFAULT NULL,
  `holidayOTPay_Dole` double DEFAULT NULL,
  `nightPremium` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SysFK_Empl_PaySlip`,`DateFrom_PaySlip`,`DateTo_PaySlip`),
  KEY `NewIndex1` (`SysFK_Empl_PaySlip`),
  KEY `NewIndex2` (`SysFK_CshAdv_PaySlip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payslip` */

/*Table structure for table `payslip_details` */

DROP TABLE IF EXISTS `payslip_details`;

CREATE TABLE `payslip_details` (
  `SysPK_PayDetls` decimal(10,0) NOT NULL,
  `SysFK_PaySlip_PayDetls` decimal(10,0) DEFAULT NULL,
  `SysFK_CshAdv_PayDetls` decimal(10,0) DEFAULT NULL,
  `Amount_PayDetls` double DEFAULT NULL,
  `Module_PayDetls` varchar(45) DEFAULT NULL,
  `Remarks_PayDetls` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SysPK_PayDetls`),
  KEY `SysFK_PaySlip_PayDetls` (`SysFK_PaySlip_PayDetls`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payslip_details` */

/*Table structure for table `payslip_dtr` */

DROP TABLE IF EXISTS `payslip_dtr`;

CREATE TABLE `payslip_dtr` (
  `payslip_id` int(11) DEFAULT NULL,
  `dtr_date` date DEFAULT NULL,
  `AM_IN` time DEFAULT NULL,
  `AM_OUT` time DEFAULT NULL,
  `PM_IN` time DEFAULT NULL,
  `PM_OUT` time DEFAULT NULL,
  `HRS_WORK` double DEFAULT NULL,
  `LATE` double DEFAULT NULL,
  `UNDERTIME` double DEFAULT NULL,
  `OVERTIME` double DEFAULT NULL,
  `employee_number` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT 'Regular',
  `SysPK_PaySlip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payslip_dtr` */

/*Table structure for table `payslip_pagibig` */

DROP TABLE IF EXISTS `payslip_pagibig`;

CREATE TABLE `payslip_pagibig` (
  `pagibig_id` int(11) DEFAULT NULL,
  `amortization` double DEFAULT NULL,
  `sysPK_Empl` varchar(50) DEFAULT NULL,
  `sysPK_Payslip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payslip_pagibig` */

/*Table structure for table `payslip_sss` */

DROP TABLE IF EXISTS `payslip_sss`;

CREATE TABLE `payslip_sss` (
  `sss_id` int(11) DEFAULT NULL,
  `amortization` double DEFAULT NULL,
  `sysPK_Empl` varchar(255) DEFAULT NULL,
  `sysPK_Payslip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payslip_sss` */

/*Table structure for table `performace_category` */

DROP TABLE IF EXISTS `performace_category`;

CREATE TABLE `performace_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `performace_category` */

/*Table structure for table `personel_itenirary` */

DROP TABLE IF EXISTS `personel_itenirary`;

CREATE TABLE `personel_itenirary` (
  `pi_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'PENDING',
  `travel_type` varchar(255) DEFAULT NULL COMMENT 'SPECIAL OR BUSINESS',
  PRIMARY KEY (`pi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `personel_itenirary` */

/*Table structure for table `philhealth_setup` */

DROP TABLE IF EXISTS `philhealth_setup`;

CREATE TABLE `philhealth_setup` (
  `year_id` int(11) DEFAULT NULL,
  `Salary_Bracket` int(11) DEFAULT NULL,
  `Salary_Range_from` double DEFAULT NULL,
  `Salary_Range_To` double DEFAULT NULL,
  `Salary_Base` double DEFAULT NULL,
  `Total_MonthlyPremium` double DEFAULT NULL,
  `Employee_Share` double DEFAULT NULL,
  `Employer_Share` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `philhealth_setup` */

insert  into `philhealth_setup`(`year_id`,`Salary_Bracket`,`Salary_Range_from`,`Salary_Range_To`,`Salary_Base`,`Total_MonthlyPremium`,`Employee_Share`,`Employer_Share`) values (5,1,0,7999.99,7000,175,87.5,87.5),(5,2,8000,8999.99,8000,200,100,100),(5,3,9000,9999.99,9000,225,112.5,112.5),(5,4,10000,10999.99,10000,250,125,125),(5,5,11000,11999.99,11000,275,137.5,137.5),(5,6,12000,12999.99,12000,300,150,150),(5,7,13000,13999.99,13000,325,162.5,162.5),(5,8,14000,14999.99,14000,350,175,175),(5,9,15000,15999.99,15000,375,187.5,187.5),(5,10,16000,16999.99,16000,400,200,200),(5,11,17000,17999.99,17000,425,212.5,212.5),(5,12,18000,18999.99,18000,450,225,225),(5,13,19000,19999.99,19000,475,237.5,237.5),(5,14,20000,20999.99,20000,500,250,250),(5,15,21000,21999.99,21000,525,262.5,262.5),(5,16,22000,22999.99,22000,550,275,275),(5,17,23000,23999.99,23000,0,575,287.5),(5,18,24000,24999.99,24000,600,300,300),(5,19,25000,25999.99,25000,625,312.5,312.5),(5,20,26000,26999.99,26000,650,325,325),(5,21,27000,27999.99,27000,675,337.5,337.5),(5,22,28000,28999.99,28000,700,350,350),(5,23,29000,29999.99,29000,725,362.5,362.5),(5,24,30000,30999.99,30000,750,375,375),(5,25,31000,31999.99,31000,775,387.5,387.5),(5,26,32000,32999.99,32000,800,400,400),(5,27,33000,33999.99,33000,825,412.5,412.5),(5,28,34000,34999.99,34000,850,425,425),(5,29,35000,999999999,35000,875,437.5,437.5);

/*Table structure for table `section` */

DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_code` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `head_id` decimal(10,0) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `head_position` varchar(255) DEFAULT NULL,
  `asst_head_id` decimal(10,0) DEFAULT NULL,
  `asst_head` varchar(255) DEFAULT NULL,
  `asst_head_position` varchar(255) DEFAULT NULL,
  `group_id` decimal(10,0) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `department_id` decimal(10,0) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `section` */

/*Table structure for table `shift_monitoring` */

DROP TABLE IF EXISTS `shift_monitoring`;

CREATE TABLE `shift_monitoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_lead_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `employee_number` varchar(100) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `no_of_days` double DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `is_approved` int(11) DEFAULT 1,
  `is_deleted` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `compressed_day` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shift_monitoring` */

/*Table structure for table `special_holiday` */

DROP TABLE IF EXISTS `special_holiday`;

CREATE TABLE `special_holiday` (
  `special_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `special_date` date DEFAULT NULL,
  `regular_percentage` double DEFAULT NULL,
  `restday_percentage` double DEFAULT NULL,
  `overtime_percentage` double DEFAULT NULL,
  PRIMARY KEY (`special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `special_holiday` */

/*Table structure for table `sss_loan` */

DROP TABLE IF EXISTS `sss_loan`;

CREATE TABLE `sss_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transNo` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sysPK_Empl` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `terms` double DEFAULT NULL,
  `amortization` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `deduction_effectivity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sss_loan` */

/*Table structure for table `sss_setup` */

DROP TABLE IF EXISTS `sss_setup`;

CREATE TABLE `sss_setup` (
  `sss_id` int(11) NOT NULL AUTO_INCREMENT,
  `range_from` double DEFAULT NULL,
  `range_to` double DEFAULT NULL,
  `monthly_salary` double DEFAULT NULL,
  `EC` double DEFAULT NULL,
  `ER` double DEFAULT NULL,
  `EE` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  PRIMARY KEY (`sss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

/*Data for the table `sss_setup` */

insert  into `sss_setup`(`sss_id`,`range_from`,`range_to`,`monthly_salary`,`EC`,`ER`,`EE`,`Total`) values (1,0,3250,3000,10,265,135,400),(2,3251,3749.99,3500,10,307.5,157.5,465),(3,3750,4249.99,4000,10,350,180,530),(4,4250,4749.99,4500,10,392.5,202.5,595),(5,4750,5249.99,5000,10,435,225,660),(6,5250,5749.99,5500,10,477.5,247.5,725),(7,5750,6249.99,6000,10,520,270,790),(8,6250,6749.99,6500,10,562.5,292.5,855),(9,6750,7249.99,7000,10,605,315,920),(10,7250,7749.99,7500,10,647.5,337.5,985),(11,7750,8249.99,8000,10,690,360,1050),(12,8250,8749.99,8500,10,732.5,382.5,1115),(13,8750,9249.99,9000,10,775,405,1180),(14,9250,9749.99,9500,10,817.5,427.5,1245),(15,9750,10249.99,10000,10,860,450,1310),(16,10250,10749.99,10500,10,902.5,472.5,1375),(17,10750,11249.99,11000,10,945,495,1440),(18,11250,11749.99,11500,10,987.5,517.5,1505),(19,11750,12249.99,12000,10,1030,540,1570),(20,12250,12749.99,12500,10,1072.5,562.5,1635),(21,12750,13249.99,13000,10,1115,585,1700),(22,13250,13749.99,13500,10,1157.5,607.5,1765),(23,13750,14249.99,14000,10,1200,630,1830),(24,14250,14749.99,14500,10,1242.5,652.5,1895),(25,14750,15249.99,15000,30,1305,675,1980),(26,15250,15749.99,15500,30,1347.5,697.5,2045),(27,15750,16249.99,16000,30,1390,720,2110),(28,16250,16749.99,16500,30,1432.5,742.5,2175),(29,16750,17249.99,17000,30,1475,765,2240),(30,17250,17749.99,17500,30,1517.5,787.5,2305),(31,17750,18249.99,18000,30,1560,810,2370),(32,18250,18749.99,18500,30,1602.5,832.5,2435),(33,18750,19249.99,19000,30,1645,855,2500),(34,19250,19749.99,19500,30,1687.5,877.5,2565),(35,19750,20249.99,20000,30,1730,900,2630),(36,20250,20749.99,20500,30,1772.5,922.5,2695),(37,20750,21249.99,21000,30,1815,945,2760),(38,21250,21749.99,21500,30,1857.5,967.5,2825),(39,21750,22249.99,22000,30,1900,990,2890),(40,22250,22749.99,22500,30,1942.5,1012.5,2955),(41,22750,23249.99,23000,30,1985,1035,3020),(42,23250,23749.99,23500,30,2027.5,1057.5,3085),(43,23750,24249.99,24000,30,2070,1080,3150),(44,24250,24749.99,24500,30,2112.5,1102.5,3215),(45,24750,99999999,25000,30,2155,1125,3280);

/*Table structure for table `tax_due_formula` */

DROP TABLE IF EXISTS `tax_due_formula`;

CREATE TABLE `tax_due_formula` (
  `tax_due_id` int(11) NOT NULL AUTO_INCREMENT,
  `amnt_from` double DEFAULT NULL,
  `amnt_to` double DEFAULT NULL,
  `amount_rate` double DEFAULT NULL,
  `additional_percentage` double DEFAULT NULL,
  `excess_over` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tax_due_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tax_due_formula` */

insert  into `tax_due_formula`(`tax_due_id`,`amnt_from`,`amnt_to`,`amount_rate`,`additional_percentage`,`excess_over`,`description`) values (1,0,10000,0,0.05,0,'Not over 10,00. Amount Rate = 5%'),(2,10001,30000,500,0.1,10000,'Over 10,000 But not Over 30,000. Amount Rate = 500 + 10% of Excess Over 10,000'),(3,30001,70000,2500,0.15,30000,'Over 30,000 But not Over 70,000. Amount Rate = 2,500 + 15% of Excess Over 30,000'),(4,70001,140000,8500,0.2,70000,'Over 70,000 But not Over 140,000. Amount Rate = 8,500 + 20% of Excess Over 70,000'),(5,140001,250000,22500,0.25,140000,'Over 140,000 But not Over 250,00. Amount Rate = 22,500 + 25% of Excess Over 140,000'),(6,250001,500000,50000,0.3,250000,'Over 250,000 But not Over 500,000. Amount Rate = 50,000 + 30% of Excess Over 250,000.'),(7,500001,9999999,125000,0.32,500000,'500,000 and Over. Amount Rate = 125,000 + 32% of Excess Over 500,000');

/*Table structure for table `tax_due_formula_2018` */

DROP TABLE IF EXISTS `tax_due_formula_2018`;

CREATE TABLE `tax_due_formula_2018` (
  `tax_due_id` int(11) NOT NULL AUTO_INCREMENT,
  `amnt_from` double DEFAULT NULL,
  `amnt_to` double DEFAULT NULL,
  `amount_rate` double DEFAULT NULL,
  `additional_percentage` double DEFAULT NULL,
  `excess_over` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tax_due_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tax_due_formula_2018` */

insert  into `tax_due_formula_2018`(`tax_due_id`,`amnt_from`,`amnt_to`,`amount_rate`,`additional_percentage`,`excess_over`,`description`) values (1,0,250000,0,0,0,'Not over 250,000. Amount Rate = 0'),(2,250001,400000,0,0.2,250000,'Over 250,000 But not Over 400,000. Amount Rate = 20% + of Excess Over 250,000'),(3,400001,800000,30000,0.25,400000,'Over 400,000 But not Over 800,000. Amount Rate = 30,000 + 25% of Excess Over 400,000'),(4,800001,2000000,130000,0.3,800000,'Over 800,000 But not Over 2,000,000. Amount Rate = 130,000 + 30% of Excess Over 800,000'),(5,2000001,8000000,490000,0.32,2000000,'Over 2,000,000 But not Over 8,000,000. Amount Rate = 490,000 + 32% of Excess Over 2,000,000'),(6,8000001,100000000,2410000,0.35,8000000,'Over 8,000,000. Amount Rate = 2,410,000 + 35% of Excess Over 8,000,000');

/*Table structure for table `unit` */

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `head_id` decimal(10,0) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `head_position` varchar(255) DEFAULT NULL,
  `asst_head_id` decimal(10,0) DEFAULT NULL,
  `asst_head` varchar(255) DEFAULT NULL,
  `asst_head_position` varchar(255) DEFAULT NULL,
  `group_id` decimal(10,0) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `department_id` decimal(10,0) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `unit` */

insert  into `unit`(`unit_id`,`unit_code`,`unit`,`head_id`,`head`,`head_position`,`asst_head_id`,`asst_head`,`asst_head_position`,`group_id`,`group_name`,`department_id`,`department`,`remarks`,`status`) values (1,'1','UNIT 1','-970164286','ALISER, BEN F','CEO','-2112777926','BEJOSANO, RICARTE MONLEON','','-1744143913','ENVIRO BUILD STRUCTURES CORPORATION','-43841776','ACLOVES','TEST','ACTIVE'),(2,'','UNIT 2','-970164286','ALISER, BEN F','CEO','-2112777926','BEJOSANO, RICARTE MONLEON','DOCUMENT CONTROLLER','-1744143913','ENVIRO BUILD STRUCTURES CORPORATION','-43841776','ACLOVES','TEST','ACTIVE');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `SysPK_User` decimal(10,0) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL DEFAULT 0,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `web_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hashed_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code_until` datetime DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `parent` tinyint(1) DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`),
  KEY `index_users_on_username` (`username`(10))
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `users` */

insert  into `users`(`SysPK_User`,`id`,`emp_id`,`username`,`first_name`,`last_name`,`email`,`employee_type`,`employee_type_id`,`web_password`,`hashed_password`,`salt`,`reset_password_code`,`reset_password_code_until`,`photo`,`created_at`,`updated_at`,`parent`,`status`) values ('2019032201',1,88,'admin','Mark','Chin','admin@gmail.com','ADMIN',1,'$2y$10$gDKKwPVIEebxgmBMwlbqc.Kmhed1o3jkmaS0lgaByApEJ.x5dy.ie','fc3c62f545ae6c0d8a09602d68044fbb80a9adda','6b9q5xyi',NULL,NULL,'storage/uploads/profile_picture/09_30_2019_06_49_43_profile_70.png','2015-03-08 03:21:06','2022-07-11 17:34:34',NULL,'ACTIVE'),('2019032202',95,81,'roberturbuda18@gmail.com','ROBERT','URBUDA','roberturbuda18@gmail.com','HR STAFF',4,'$2y$10$ya4wcPuLU.zrDrbPXlQJgOfNe0cH.W0wiad1yfm08M4o8Xu1IvC3S',NULL,'kz92lac0',NULL,NULL,'storage/uploads/profile_picture/04_27_2022_04_46_05_profile_109.jpeg','2022-04-27 04:46:05','2022-04-27 04:46:05',NULL,'ACTIVE');

/*Table structure for table `vehicle_details` */

DROP TABLE IF EXISTS `vehicle_details`;

CREATE TABLE `vehicle_details` (
  `vehicle_id` int(11) NOT NULL,
  `plate_number` text DEFAULT NULL,
  `make` text DEFAULT NULL,
  `body_type` text DEFAULT NULL,
  `year_model` int(4) DEFAULT NULL,
  `series` text DEFAULT NULL,
  `color` text DEFAULT NULL,
  `current_driver` text DEFAULT NULL,
  `mv_file_no` int(30) DEFAULT NULL,
  `engine_no` int(30) DEFAULT NULL,
  `chassis_no` int(30) DEFAULT NULL,
  `lto_cr_no` int(11) DEFAULT NULL,
  `lto_or_no` int(11) DEFAULT NULL,
  `lto_or_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vehicle_details` */

/*Table structure for table `vehicles_deploy` */

DROP TABLE IF EXISTS `vehicles_deploy`;

CREATE TABLE `vehicles_deploy` (
  `trip_number` int(11) NOT NULL,
  `travel_details` tinytext DEFAULT NULL,
  `passenger_names` tinytext DEFAULT NULL,
  `destination` tinytext DEFAULT NULL,
  `et_departure` tinytext DEFAULT NULL,
  `departure_odometer` int(11) DEFAULT NULL,
  `et_arrival` tinytext DEFAULT NULL,
  `arrival_odometer` int(11) DEFAULT NULL,
  `remarks` tinytext DEFAULT NULL,
  PRIMARY KEY (`trip_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vehicles_deploy` */

insert  into `vehicles_deploy`(`trip_number`,`travel_details`,`passenger_names`,`destination`,`et_departure`,`departure_odometer`,`et_arrival`,`arrival_odometer`,`remarks`) values (1,'Delivery of Stocks','Junmar II Sales','Camotes','10pm',NULL,'11PM',NULL,NULL),(2,'retrival','Jason tobes','Clarin','7AM',121,'4am',2123,NULL);

/*Table structure for table `weekly_hour_setup` */

DROP TABLE IF EXISTS `weekly_hour_setup`;

CREATE TABLE `weekly_hour_setup` (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `total_hour` double DEFAULT 0,
  `six_days` double DEFAULT 0,
  `five_days` double DEFAULT 0,
  `four_days` double DEFAULT 0,
  `three_days` double DEFAULT 0,
  PRIMARY KEY (`sched_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `weekly_hour_setup` */

insert  into `weekly_hour_setup`(`sched_id`,`total_hour`,`six_days`,`five_days`,`four_days`,`three_days`) values (1,48,8,9.6,12,16);

/*Table structure for table `withholding_setup` */

DROP TABLE IF EXISTS `withholding_setup`;

CREATE TABLE `withholding_setup` (
  `withholding_id` int(11) NOT NULL AUTO_INCREMENT,
  `salaryType` varchar(255) DEFAULT NULL,
  `employeeType` varchar(255) DEFAULT NULL,
  `dependent` int(11) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `salaryRangeFrom` double DEFAULT NULL,
  `salaryRangeTo` double DEFAULT NULL,
  `defaultTax` double DEFAULT NULL,
  PRIMARY KEY (`withholding_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `withholding_setup` */

insert  into `withholding_setup`(`withholding_id`,`salaryType`,`employeeType`,`dependent`,`percentage`,`salaryRangeFrom`,`salaryRangeTo`,`defaultTax`) values (2,'Daily','Single/Married',0,12,45000,55000,1200);

/*Table structure for table `work_group` */

DROP TABLE IF EXISTS `work_group`;

CREATE TABLE `work_group` (
  `SysPK_Grp` decimal(10,0) NOT NULL,
  `GroupCode_Grp` varchar(50) DEFAULT NULL,
  `GroupName_Grp` varchar(255) DEFAULT NULL,
  `Description_Grp` varchar(255) DEFAULT NULL,
  `Remarks_Grp` varchar(255) DEFAULT NULL,
  `Type_Grp` varchar(50) DEFAULT NULL,
  `Status_Grp` varchar(50) DEFAULT NULL,
  `SSS` varchar(255) DEFAULT NULL,
  `PHIC` varchar(255) DEFAULT NULL,
  `TIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SysPK_Grp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `work_group` */

insert  into `work_group`(`SysPK_Grp`,`GroupCode_Grp`,`GroupName_Grp`,`Description_Grp`,`Remarks_Grp`,`Type_Grp`,`Status_Grp`,`SSS`,`PHIC`,`TIN`) values ('-1744143913','P0001','DUCK-IL KOREA INCORPORATED','Lapu-Lapu City, Cebu Philippines','','203948394','ACTIVE','','','');

/*Table structure for table `wtax_formula` */

DROP TABLE IF EXISTS `wtax_formula`;

CREATE TABLE `wtax_formula` (
  `wtax_id` int(11) NOT NULL AUTO_INCREMENT,
  `amnt_from` double DEFAULT NULL,
  `amnt_to` double DEFAULT NULL,
  `amount_rate` double DEFAULT 0,
  `additional_percentage` double DEFAULT NULL,
  `compensation_level` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`wtax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `wtax_formula` */

insert  into `wtax_formula`(`wtax_id`,`amnt_from`,`amnt_to`,`amount_rate`,`additional_percentage`,`compensation_level`,`description`) values (1,0,10417,0,0,0,'none'),(2,10418,16666,0,0.2,10417,'0 + 20% over Compensation Level'),(3,16667,33332,1250,0.25,16667,'1,250 + 25% over Compensation Level'),(4,33333,83332,5416.67,0.3,33333,'5,416.67 + 30% over Compensation Level'),(5,83333,333332,20416.67,0.32,83333,'20,416.67 + 32% over Compensation Level'),(6,333333,9999999,100416.67,0.35,333333,'100,416.67 + 35% over Compensation Level');

/*Table structure for table `year_setup` */

DROP TABLE IF EXISTS `year_setup`;

CREATE TABLE `year_setup` (
  `year_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `year_setup` */

insert  into `year_setup`(`year_id`,`year`) values (5,2016),(6,2018);

/* Function  structure for function  `AGE` */

/*!50003 DROP FUNCTION IF EXISTS `AGE` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `AGE`(dob date) RETURNS int(11)
BEGIN
	#return  TRUNCATE(DATEDIFF(curdate(),dob) / 365,0);
	return (SELECT IF(MONTH(CURDATE()) = MONTH(dob) AND DAY(CURDATE()) = DAY(dob),
		TRUNCATE(DATEDIFF(CURDATE(),dob) / 365,0),
		TRUNCATE(DATEDIFF(CURDATE(),dob) / 365,0) - 1));
END */$$
DELIMITER ;

/* Function  structure for function  `TOTAL_WEEKDAYS` */

/*!50003 DROP FUNCTION IF EXISTS `TOTAL_WEEKDAYS` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `TOTAL_WEEKDAYS`(date1 DATE,
	date2 DATE
    ) RETURNS int(11)
BEGIN
	RETURN (
	SELECT ((DATEDIFF(date2, date1)) -
        ((WEEK(date2) - WEEK(date1)) * 2) -
        (case when weekday(date2) = 6 then 1 else 0 end) -
        (case when weekday(date1) = 5 then 1 else 0 end)) as DifD );
    END */$$
DELIMITER ;

/* Function  structure for function  `_getDepartmentName` */

/*!50003 DROP FUNCTION IF EXISTS `_getDepartmentName` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`user`@`%` FUNCTION `_getDepartmentName`(_DeptCode_Dept varchar(255)
) RETURNS varchar(255) CHARSET latin1
BEGIN
	return
	(
		select
			Name_Dept
		from
			department
		where
			DeptCode_Dept = _DeptCode_Dept
	);
END */$$
DELIMITER ;

/* Function  structure for function  `_getEmployeeDependent` */

/*!50003 DROP FUNCTION IF EXISTS `_getEmployeeDependent` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `_getEmployeeDependent`(_SysPK_Empl varchar(255)
) RETURNS int(11)
BEGIN
	RETURN (SELECT
			`1` + `2` + `3` + `4` AS 'dependent'
		FROM
		(
			SELECT 
				IF(age(BirthDateOne) IS NOT NULL AND age(BirthDateOne) < 21,1,0) AS '1',
				IF(age(BirthDateTwo) IS NOT NULL AND age(BirthDateOne) < 21,1,0) AS '2',
				IF(age(BirthDateThree) IS NOT NULL AND age(BirthDateOne) < 21,1,0) AS '3',
				IF(age(BirthDateFour) IS NOT NULL AND age(BirthDateOne) < 21,1,0) AS '4'
			FROM
				employees_dependent
			WHERE
				SysPK_Empl = _SysPK_Empl
		) a
		);
END */$$
DELIMITER ;

/* Function  structure for function  `_getEmployeeName` */

/*!50003 DROP FUNCTION IF EXISTS `_getEmployeeName` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`user`@`%` FUNCTION `_getEmployeeName`(_SysPK_Empl varchar(255)
) RETURNS varchar(255) CHARSET latin1
BEGIN
	return
	(
		select 
			Name_Empl
		from 
			employees
		where
			SysPK_Empl = _SysPK_Empl
	);
END */$$
DELIMITER ;

/* Function  structure for function  `_getGroupName` */

/*!50003 DROP FUNCTION IF EXISTS `_getGroupName` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`user`@`%` FUNCTION `_getGroupName`(_groupCode varchar(255)
) RETURNS varchar(255) CHARSET latin1
BEGIN
	return
	(
		select
			GroupName_Grp
		from
			work_group
		where
			GroupCode_Grp=_groupCode
	);
END */$$
DELIMITER ;

/* Function  structure for function  `_getPAGIBIG_Balance` */

/*!50003 DROP FUNCTION IF EXISTS `_getPAGIBIG_Balance` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`user`@`%` FUNCTION `_getPAGIBIG_Balance`(_sysPK_Empl VARCHAR(255)
) RETURNS double
BEGIN
RETURN
(
	select
		pagibig_loan.balance
	from
		pagibig_loan
	where
		pagibig_loan.sysPK_Empl = _sysPK_Empl and
		pagibig_loan.balance > 0
);
END */$$
DELIMITER ;

/* Function  structure for function  `_getPAGIBIG_Loan` */

/*!50003 DROP FUNCTION IF EXISTS `_getPAGIBIG_Loan` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`user`@`%` FUNCTION `_getPAGIBIG_Loan`(_date DATE,
	_sysPK_Empl VARCHAR(255),
	_deduction_effectivity VARCHAR(255)
) RETURNS double
BEGIN
RETURN
(
	SELECT
		ifNull(amortization,0)
	FROM
	(
		SELECT
			IFNULL(SUM(amortization),0) 'amortization',
			sysPK_Empl
		FROM 
			pagibig_loan
		WHERE 
			sysPK_Empl = _sysPK_Empl
		    AND balance > 0
		    AND date_started <= _date
	) a
	INNER JOIN employees
		ON(a.sysPK_Empl = employees.SysPK_Empl)
	WHERE
		deduction_effectivity = _deduction_effectivity
);
END */$$
DELIMITER ;

/* Function  structure for function  `_getSSS_Balance` */

/*!50003 DROP FUNCTION IF EXISTS `_getSSS_Balance` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`user`@`%` FUNCTION `_getSSS_Balance`(_sysPK_Empl VARCHAR(255)
) RETURNS double
BEGIN
RETURN
(
	SELECT
		sss_loan.balance
	FROM
		sss_loan
	WHERE
		sss_loan.sysPK_Empl = _sysPK_Empl AND
		sss_loan.balance > 0
);
END */$$
DELIMITER ;

/* Function  structure for function  `_getSSS_Loan` */

/*!50003 DROP FUNCTION IF EXISTS `_getSSS_Loan` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`user`@`%` FUNCTION `_getSSS_Loan`(_date DATE,
	_sysPK_Empl varchar(255),
	_deduction_effectivity varchar(255)
) RETURNS double
BEGIN
RETURN
(
	SELECT
		ifnull(amortization,0)
	FROM
	(
		SELECT
			IFNULL(SUM(amortization),0) 'amortization',
			sysPK_Empl
		FROM 
			sss_loan
		WHERE 
			sysPK_Empl = _sysPK_Empl
		    AND balance > 0
		    AND date_started <= _date
	) a
	INNER JOIN employees
		ON(a.sysPK_Empl = employees.SysPK_Empl)
	WHERE
		deduction_effectivity = _deduction_effectivity
);
END */$$
DELIMITER ;

/* Function  structure for function  `_getWithholdingTax` */

/*!50003 DROP FUNCTION IF EXISTS `_getWithholdingTax` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`user`@`%` FUNCTION `_getWithholdingTax`(_taxableIncome double,
	_employeeType varchar(255),
	_dependent tinyint,
	_salaryType varchar(255)
) RETURNS double
BEGIN
RETURN
(
	select 
		(_taxableIncome - salaryRangeFrom) * (percentage / 100) + defaultTax
	from
		withholding_setup setup
	where
		_taxableIncome >= salaryRangeFrom and
		_taxableIncome <= salaryRangeTo and
		employeeType = IF(_employeeType='Single' or _employeeType='Married','Single/Married',_employeeType) and
		dependent = _dependent and
		salaryType = _salaryType
);
END */$$
DELIMITER ;

/* Procedure structure for procedure `display_employee_payroll` */

/*!50003 DROP PROCEDURE IF EXISTS  `display_employee_payroll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `display_employee_payroll`(
	IN _dateFrom DATE,
	IN _dateTo DATE
    )
BEGIN
SELECT
	j.id,
	j.UserID,
	j.AccountNo AS 'AccountNo',
	j.EmployeeName AS 'EmployeeName',
	j.Dept AS 'Dept',
	j.DailyRate AS 'DailyRate',
	j.MonthlyRate AS 'MonthlyRate',
	j.SemiMonthlyRate AS 'SemiMonthlyRate',
	j.HourlyRate AS 'HourlyRate',
	j.MinRate AS 'MinRate',
	j.RegOTRate AS 'RegOTRate',
	j.HolidayRate AS 'HolidayRate',
	j.SunOtRate AS 'SunOtRate',
	j.NPRate AS 'NPRate',
	j.StandardHour AS 'StandardHour',
	j.AbsentHour AS 'AbsentHour',
	j.UTHour AS 'UTHour',
	j.SL_VL AS 'SL_VL',
	j.ActualHour AS 'ActualHour',
	j.LateMin AS 'LateMin',
	j.RegOTHour AS 'RegOTHour',
	j.SpclHour AS 'SpclHour',
	j.SpclOTHour AS 'SpclOTHour',
	j.HolidayHour AS 'HolidayHour',
	j.HolidayOTHour AS 'HolidayOTHour',
	j.RegularNP AS 'RegularNP',
	j.HolidayNP AS 'HolidayNP',
	j.SunNP AS 'SunNP',
	j.PaternityLeave AS 'PaternityLeave',
	j.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
	j.TotalManHour AS 'TotalManHour',
	j.RiceAllowance AS 'RiceAllowance',
	j.ClothingAllowance AS 'ClothingAllowance',
	j.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
	j.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
	j.MedicalAssistance AS 'MedicalAssistance',
	j.LaundryAllowance AS 'LaundryAllowance',
	j.Deminimis AS 'Deminimis',
	j.COLA AS 'COLA',
	j.CommunicationAllowance AS 'CommunicationAllowance',
	j.BasicPay AS 'BasicPay',
	j.RegOTPay AS 'RegOTPay',
	j.SunPay AS 'SunPay',
	j.SunOTPay AS 'SunOTPay',
	j.HolidayPay AS 'HolidayPay',
	j.HolidayOTPay AS 'HolidayOTPay',
	j.NPPay AS 'NPPay',
	j.HolidayNPPay AS 'HolidayNPPay',
	j.SunNPPay AS 'SunNPPay',
	j.PaternityLeavePay AS 'PaternityLeavePay',
	j.SILPay AS 'SILPay',
	j.AdditionalAdjustment AS 'AdditionalAdjustment',
	j.LateDeduction AS 'LateDeduction',
	j.GrossPay AS 'GrossPay',
	j.TaxableCompensation AS 'TaxableCompensation',
	j.SSS AS 'SSS',
	j.PHILHEALTH AS 'PhilHealth',
	j.PAGIBIG AS 'PAGIBIG',
	j.WTax AS 'WTax',
	j.UnderWithheld AS 'UnderWithheld',
	j.OtherDeductions AS 'OtherDeductions',
	j.TotalTax AS 'TotalTax',
	j.SSSLOAN AS 'SSSLoan',
	j.PAGIBIGLOAN 'PAGIBIGLoan',
	j.DeductionAdjustment AS 'DeductionAdjustment',
	j.CA AS 'CA',
	(j.TotalDeductions - j.WTax) AS 'TotalDeductions',
	(j.NetPay - j.WTax ) AS 'NetPay',
	(j.NetPay2 - j.WTax) AS 'NetPay2',
	j.Extra AS 'Extra',
	j.SSSER AS 'SSSER',
	j.PhilHealthER AS 'PhilHealthER',
	j.PAGIBIGER AS 'PAGIBIGER',
	j.WtaxER AS 'WtaxER',
	j.TotalER AS 'TotalER'
FROM
	(SELECT
		i.id,
		i.UserID,
		i.AccountNo AS 'AccountNo',
		i.EmployeeName AS 'EmployeeName',
		i.Dept AS 'Dept',
		i.DailyRate AS 'DailyRate',
		i.MonthlyRate AS 'MonthlyRate',
		i.SemiMonthlyRate AS 'SemiMonthlyRate',
		i.HourlyRate AS 'HourlyRate',
		i.MinRate AS 'MinRate',
		i.RegOTRate AS 'RegOTRate',
		i.HolidayRate AS 'HolidayRate',
		i.SunOtRate AS 'SunOtRate',
		i.NPRate AS 'NPRate',
		i.StandardHour AS 'StandardHour',
		i.AbsentHour AS 'AbsentHour',
		i.UTHour AS 'UTHour',
		i.SL_VL AS 'SL_VL',
		i.ActualHour AS 'ActualHour',
		i.LateMin AS 'LateMin',
		i.RegOTHour AS 'RegOTHour',
		i.SpclHour AS 'SpclHour',
		i.SpclOTHour AS 'SpclOTHour',
		i.HolidayHour AS 'HolidayHour',
		i.HolidayOTHour AS 'HolidayOTHour',
		i.RegularNP AS 'RegularNP',
		i.HolidayNP AS 'HolidayNP',
		i.SunNP AS 'SunNP',
		i.PaternityLeave AS 'PaternityLeave',
		i.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
		i.TotalManHour AS 'TotalManHour',
		i.RiceAllowance AS 'RiceAllowance',
		i.ClothingAllowance AS 'ClothingAllowance',
		i.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
		i.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
		i.MedicalAssistance AS 'MedicalAssistance',
		i.LaundryAllowance AS 'LaundryAllowance',
		i.Deminimis AS 'Deminimis',
		i.COLA AS 'COLA',
		i.CommunicationAllowance AS 'CommunicationAllowance',
		i.BasicPay AS 'BasicPay',
		i.RegOTPay AS 'RegOTPay',
		i.SunPay AS 'SunPay',
		i.SunOTPay AS 'SunOTPay',
		i.HolidayPay AS 'HolidayPay',
		i.HolidayOTPay AS 'HolidayOTPay',
		i.NPPay AS 'NPPay',
		i.HolidayNPPay AS 'HolidayNPPay',
		i.SunNPPay AS 'SunNPPay',
		i.PaternityLeavePay AS 'PaternityLeavePay',
		i.SILPay AS 'SILPay',
		i.AdditionalAdjustment AS 'AdditionalAdjustment',
		i.LateDeduction AS 'LateDeduction',
		i.GrossPay AS 'GrossPay',
		i.TaxableCompensation AS 'TaxableCompensation',
		i.SSS AS 'SSS',
		i.PHILHEALTH AS 'PhilHealth',
		i.PAGIBIG AS 'PAGIBIG',
		IF( ISNULL(i.AmountRate),0, 
			IF(	i.AmountRate=0 AND i.AmountPercentage=0,
				0, 
				IF(i.AmountRate=20416.67,
					( (i.AmountRate + ((i.TaxableCompensation - i.CompensationLevel) * i.AmountPercentage) ) + 5000 ),
					( i.AmountRate + ((i.TaxableCompensation - i.CompensationLevel) * i.AmountPercentage) ) 
				) 
			) 
		) AS 'WTax',
		i.UnderWithheld AS 'UnderWithheld',
		i.OtherDeductions AS 'OtherDeductions',
		i.TotalTax AS 'TotalTax',
		i.SSSLOAN AS 'SSSLoan',
		i.PAGIBIGLOAN 'PAGIBIGLoan',
		i.DeductionAdjustment AS 'DeductionAdjustment',
		i.CA AS 'CA',
		i.TotalDeductions AS 'TotalDeductions',
		i.NetPay AS 'NetPay',
		i.NetPay2 AS 'NetPay2',
		i.Extra AS 'Extra',
		i.SSSER AS 'SSSER',
		i.PhilHealthER AS 'PhilHealthER',
		i.PAGIBIGER AS 'PAGIBIGER',
		i.WtaxER AS 'WtaxER',
		i.TotalER AS 'TotalER'
	From
		(select
			h.id,
			h.UserID,
			h.AccountNo AS 'AccountNo',
			h.EmployeeName AS 'EmployeeName',
			h.Dept AS 'Dept',
			h.DailyRate AS 'DailyRate',
			h.MonthlyRate AS 'MonthlyRate',
			h.SemiMonthlyRate AS 'SemiMonthlyRate',
			h.HourlyRate AS 'HourlyRate',
			h.MinRate AS 'MinRate',
			h.RegOTRate AS 'RegOTRate',
			h.HolidayRate AS 'HolidayRate',
			h.SunOtRate AS 'SunOtRate',
			h.NPRate AS 'NPRate',
			h.StandardHour AS 'StandardHour',
			h.AbsentHour AS 'AbsentHour',
			h.UTHour AS 'UTHour',
			h.SL_VL AS 'SL_VL',
			h.ActualHour AS 'ActualHour',
			h.LateMin AS 'LateMin',
			h.RegOTHour AS 'RegOTHour',
			h.SpclHour AS 'SpclHour',
			h.SpclOTHour AS 'SpclOTHour',
			h.HolidayHour AS 'HolidayHour',
			h.HolidayOTHour AS 'HolidayOTHour',
			h.RegularNP AS 'RegularNP',
			h.HolidayNP AS 'HolidayNP',
			h.SunNP AS 'SunNP',
			h.PaternityLeave AS 'PaternityLeave',
			h.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
			h.TotalManHour AS 'TotalManHour',
			h.RiceAllowance AS 'RiceAllowance',
			h.ClothingAllowance AS 'ClothingAllowance',
			h.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
			h.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
			h.MedicalAssistance AS 'MedicalAssistance',
			h.LaundryAllowance AS 'LaundryAllowance',
			h.Deminimis AS 'Deminimis',
			h.COLA AS 'COLA',
			h.CommunicationAllowance AS 'CommunicationAllowance',
			h.BasicPay AS 'BasicPay',
			h.RegOTPay AS 'RegOTPay',
			h.SunPay AS 'SunPay',
			h.SunOTPay AS 'SunOTPay',
			h.HolidayPay AS 'HolidayPay',
			h.HolidayOTPay AS 'HolidayOTPay',
			h.NPPay AS 'NPPay',
			h.HolidayNPPay AS 'HolidayNPPay',
			h.SunNPPay AS 'SunNPPay',
			h.PaternityLeavePay AS 'PaternityLeavePay',
			h.SILPay AS 'SILPay',
			h.AdditionalAdjustment AS 'AdditionalAdjustment',
			h.LateDeduction AS 'LateDeduction',
			h.GrossPay AS 'GrossPay',
			h.TaxableCompensation AS 'TaxableCompensation',
			h.SSS AS 'SSS',
			h.PHILHEALTH AS 'PhilHealth',
			h.PAGIBIG AS 'PAGIBIG',
			h.WTax AS 'WTax',
			h.UnderWithheld AS 'UnderWithheld',
			h.OtherDeductions AS 'OtherDeductions',
			h.TotalTax AS 'TotalTax',
			h.SSSLOAN AS 'SSSLoan',
			h.PAGIBIGLOAN 'PAGIBIGLoan',
			h.DeductionAdjustment AS 'DeductionAdjustment',
			h.CA AS 'CA',
			h.TotalDeductions AS 'TotalDeductions',
			h.NetPay AS 'NetPay',
			h.NetPay2 AS 'NetPay2',
			h.Extra AS 'Extra',
			h.SSSER AS 'SSSER',
			h.PhilHealthER AS 'PhilHealthER',
			h.PAGIBIGER AS 'PAGIBIGER',
			h.WtaxER AS 'WtaxER',
			h.TotalER AS 'TotalER',
			(SELECT a.amount_rate FROM wtax_formula a WHERE h.TaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountRate',
			(SELECT a.additional_percentage FROM wtax_formula a WHERE h.TaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountPercentage',
			(SELECT a.compensation_level FROM wtax_formula a WHERE h.TaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'CompensationLevel'
		FROM	
			(SELECT
				g.id,
				g.UserID,
				g.AccountNo AS 'AccountNo',
				g.EmployeeName AS 'EmployeeName',
				g.Dept AS 'Dept',
				g.DailyRate AS 'DailyRate',
				g.MonthlyRate AS 'MonthlyRate',
				(g.MonthlyRate/2) AS 'SemiMonthlyRate',
				g.HourlyRate AS 'HourlyRate',
				g.MinRate AS 'MinRate',
				g.RegOTRate AS 'RegOTRate',
				g.HolidayRate AS 'HolidayRate',
				g.SunOtRate AS 'SunOtRate',
				g.NPRate AS 'NPRate',
				g.StandardHour AS 'StandardHour',
				g.AbsentHour AS 'AbsentHour',
				g.UTHour AS 'UTHour',
				'0' AS 'SL_VL',
				g.ActualHour AS 'ActualHour',
				g.LateMin AS 'LateMin',
				g.RegOTHour AS 'RegOTHour',
				g.SpclHour AS 'SpclHour',
				g.SpclOTHour AS 'SpclOTHour',
				g.HolidayHour AS 'HolidayHour',
				g.HolidayOTHour AS 'HolidayOTHour',
				g.RegularNP AS 'RegularNP',
				g.HolidayNP AS 'HolidayNP',
				g.SunNP AS 'SunNP',
				g.PaternityLeave AS 'PaternityLeave',
				g.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
				g.TotalManHour AS 'TotalManHour',
				g.RiceAllowance AS 'RiceAllowance',
				g.ClothingAllowance AS 'ClothingAllowance',
				g.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
				g.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
				g.MedicalAssistance AS 'MedicalAssistance',
				g.LaundryAllowance AS 'LaundryAllowance',
				g.Deminimis AS 'Deminimis',
				g.COLA AS 'COLA',
				g.CommunicationAllowance AS 'CommunicationAllowance',
				g.BasicPay AS 'BasicPay',
				g.RegOTPay AS 'RegOTPay',
				g.SunPay AS 'SunPay',
				g.SunOTPay AS 'SunOTPay',
				g.HolidayPay AS 'HolidayPay',
				g.HolidayOTPay AS 'HolidayOTPay',
				g.NPPay AS 'NPPay',
				g.HolidayNPPay AS 'HolidayNPPay',
				g.SunNPPay AS 'SunNPPay',
				g.PaternityLeavePay AS 'PaternityLeavePay',
				g.SILPay AS 'SILPay',
				g.AdditionalAdjustment AS 'AdditionalAdjustment',
				g.LateDeduction AS 'LateDeduction',
				g.GrossPay AS 'GrossPay',
				(
					(
						g.GrossPay - 
						(
							g.Deminimis + 
							g.COLA + 
							g.CommunicationAllowance +
							g.SSS +
							g.PHILHEALTH +
							g.PAGIBIG
						)
					)
				) AS 'TaxableCompensation',
				g.SSS AS 'SSS',
				g.PHILHEALTH AS 'PhilHealth',
				g.PAGIBIG AS 'PAGIBIG',
				g.WTax AS 'WTax',
				g.UnderWithheld AS 'UnderWithheld',
				g.OtherDeductions AS 'OtherDeductions',
				g.TotalTax AS 'TotalTax',
				g.SSSLOAN AS 'SSSLoan',
				g.PAGIBIGLOAN 'PAGIBIGLoan',
				g.DeductionAdjustment AS 'DeductionAdjustment',
				g.CA AS 'CA',
				g.TotalDeductions AS 'TotalDeductions',
				(g.GrossPay - g.TotalDeductions) AS 'NetPay',
				(g.GrossPay - g.TotalDeductions) AS 'NetPay2',
				g.Extra AS 'Extra',
				g.SSSER AS 'SSSER',
				g.PhilHealthER AS 'PhilHealthER',
				g.PAGIBIGER AS 'PAGIBIGER',
				g.WtaxER AS 'WtaxER',
				g.TotalER AS 'TotalER'	
			FROM
				(SELECT
					f.id,
					f.UserID,
					f.AccountNo_Empl AS 'AccountNo',
					f.EmpName AS 'EmployeeName',
					f.Department_Empl AS 'Dept',
					f.DailyRate AS 'DailyRate',
					f.BasicSalary AS 'MonthlyRate',
					(f.BasicSalary/2) AS 'SemiMonthlyRate',
					f.HourlyRate AS 'HourlyRate',
					f.MinRate AS 'MinRate',
					f.OTRate AS 'RegOTRate',
					f.HolidayRate AS 'HolidayRate',
					f.SpecialRate AS 'SunOtRate',
					f.NPRate AS 'NPRate',
					f.StandardHour AS 'StandardHour',
					f.AbsentHour AS 'AbsentHour',
					f.TotalUT AS 'UTHour',
					'0' AS 'SL/VL',
					/*Standar Hour - Absent Hour - Service Incentive Leave */
					f.ActualHour AS 'ActualHour',
					f.TotalLate AS 'LateMin',
					f.TotalOT AS 'RegOTHour',
					f.SpclHour AS 'SpclHour',
					f.SpclOTHour AS 'SpclOTHour',
					f.HolidayHour AS 'HolidayHour',
					f.HolidayOTHour AS 'HolidayOTHour',
					f.np_hours AS 'RegularNP',
					f.HolidayNP AS 'HolidayNP',
					f.SunNP AS 'SunNP',
					f.PaternityLeave AS 'PaternityLeave',
					f.leave_hours AS 'ServiceIncentiveLeave',
					/*ActualHour + RegOTHour + SpclHour */
					( (f.ActualHour + f.TotalOT + f.SpclHour + f.SpclOTHour + f.HolidayHour + f.HolidayOTHour) - (f.TotalLate / 60) ) AS 'TotalManHour',
					f.meal_allowance AS 'RiceAllowance',
					f.cloathing_allowance AS 'ClothingAllowance',
					'0' AS 'MonetizedUnusedLeave',
					f.medical_allowance_dependent AS 'MedicalCashAllowanceDependent',
					'0' AS 'MedicalAssistance',
					f.laundry_allowance AS 'LaundryAllowance',
					(f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance) AS 'Deminimis',
					f.COLA AS 'COLA',
					f.mobile_allowance AS 'CommunicationAllowance',
					( if(f.rate_type="Monthly",(f.BasicSalary/2),(f.HourlyRate * f.ActualHour)) -
						(f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance)
					 ) AS 'BasicPay',
					f.RegOTPay AS 'RegOTPay',
					f.SunPay AS 'SunPay',
					f.SunOTPay AS 'SunOTPay',
					f.HolidayPay AS 'HolidayPay',
					f.HolidayOTPay AS 'HolidayOTPay',
					f.NPPay AS 'NPPay',
					f.HolidayNPPay AS 'HolidayNPPay',
					f.SunNPPay AS 'SunNPPay',
					f.PaternityLeavePay AS 'PaternityLeavePay',
					f.SILPay AS 'SILPay',
					f.AdditionalAdjustment AS 'AdditionalAdjustment',
					f.LateDeduction AS 'LateDeduction',
					(
						( (f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance) +
						f.COLA + 
						f.mobile_allowance + 
						( IF(f.rate_type="Monthly",(f.BasicSalary/2),(f.HourlyRate * f.ActualHour))  -
							(f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance)
						) +
						f.RegOTPay +
						f.SunPay +
						f.SunOTPay +
						f.HolidayPay +
						f.HolidayOTPay +
						f.NPPay + 
						f.HolidayNPPay +
						f.SunNPPay +
						f.PaternityLeavePay +
						f.SILPay +
						f.AdditionalAdjustment ) -
						f.LateDeduction
					) AS 'GrossPay',
					'0' AS 'TaxableCompensation',
					f.SSS AS 'SSS',
					f.PHILHEALTH AS 'PhilHealth',
					f.PAGIBIG AS 'PAGIBIG',
					f.WTax AS 'WTax',
					f.UnderWithheld AS 'UnderWithheld',
					f.OtherDeductions AS 'OtherDeductions',
					f.TotalTax AS 'TotalTax',
					f.SSSLOAN AS 'SSSLoan',
					f.PAGIBIGLOAN 'PAGIBIGLoan',
					f.DeductionAdjustment AS 'DeductionAdjustment',
					f.CA AS 'CA',
					(f.SSS - f.PHILHEALTH - f.PAGIBIG - f.UnderWithheld - f.OtherDeductions   - f.SSSLOAN - f.PAGIBIGLOAN - f.DeductionAdjustment - f.CA) AS 'TotalDeductions',
					'0' AS 'NetPay',
					'0' AS 'NetPay2',
					'0' AS 'Extra',
					f.sss_er AS 'SSSER',
					f.ph_er AS 'PhilHealthER',
					f.pagibig_er AS 'PAGIBIGER',
					'0' AS 'WtaxER',
					(f.sss_er + f.ph_er + f.pagibig_er) AS 'TotalER'
				FROM
					(SELECT 
						e.id,
						e.UserID,
						e.EmpName,
						e.Position,
						e.BasicSalary 'BasicSalary',
						(e.BasicSalary / 2) 'MonthlyRate',
						e.DutyDays,
						e.holiday_cnt 'HolidayDays',
						e.leave_days 'LeaveDays',
						e.RegularWage 'RegularWage',
						e.OTPay 'OTPay',
						(e.SundayHrs + e.special_holiday_hrs) 'SpecialHrs',
						(e.leave_day_pay + e.leave_hour_pay) 'LeavePay',
						(e.Gross + e.OTPay + (e.normal_holiday + e.regular_holiday + e.special_holiday)) 'Gross',
						e.transpo_allowance,
						IF(e.mobile_allowance=0,0,e.mobile_allowance/2) AS 'mobile_allowance',
						e.osa_allowance,
						IF(e.meal_allowance=0,0, 
							(
								IF(e.rate_type="Daily",
									( (e.meal_allowance * (e.ActualHour + e.HolidayHour + e.SpclHour) ) / 8 ),
									( ( (e.meal_allowance/26) / 8 ) * e.ActualHour )
								)
							) 
								) AS 'meal_allowance',
						IF(e.cloathing_allowance=0,0, ( ( (e.cloathing_allowance/26) / 8 ) * e.ActualHour ) ) AS 'cloathing_allowance',
						(e.medical_allowance_dependent/2) AS 'medical_allowance_dependent',
						IF(e.laundry_allowance=0,0,
							IF(e.id=2,(e.laundry_allowance/2), ( ( (e.laundry_allowance/26) / 8 ) * e.ActualHour ) )
						) AS 'laundry_allowance',
						e.UTDeduction 'UTDeduction',
						e.COLA 'COLA',
						e.SSS_Loan 'SSSLOAN',
						e.PAGIBIG_Loan 'PAGIBIGLOAN',
						if(ISNULL(e.SSS),0,e.SSS) 'SSS',
						IF(ISNULL(e.PHILHEALTH),0,e.PHILHEALTH) 'PHILHEALTH',
						IF(ISNULL(e.PAGIBIG),0,e.PAGIBIG) 'PAGIBIG',
						e.WTax 'WTax',
						'0' AS 'UnderWithheld',
						'0' AS 'OtherDeductions',
						'0' AS 'TotalTax',
						'0' AS 'DeductionAdjustment',
						FORMAT(0,2) 'TotalAllowance',
						FORMAT(e.TotalGovDeduction,2) 'TotalGovDeduction',
						FORMAT( ( ((e.Gross + e.OTPay + (e.normal_holiday + e.regular_holiday + e.special_holiday) + (e.leave_day_pay + e.leave_hour_pay) ) - e.LateDeduction - e.UTDeduction) - (e.TotalGovDeduction)  + e.COLA - e.CA - e.SSS_Loan - e.PAGIBIG_Loan - e.sss_ee - e.ph_ee - e.pagibig_ee) , 2) 'Net',
						e.DailyRate 'DailyRate',
						e.HourlyRate 'HourlyRate',
						e.MinRate,
						e.HolidayRate 'HolidayRate',
						e.SpecialRate 'SpecialRate',
						e.OTRate 'OTRate',
						e.NPRate,
						IF(ISNULL(e.CA),0,e.CA) 'CA',
						e.SSS_Loan,
						e.PAGIBIG_Loan,
						e.sss_er,
						e.sss_ee,
						e.ph_er,
						e.ph_ee,
						e.pagibig_er,
						e.pagibig_ee,
						e.PaternityLeave,
						e.leave_days,
						e.leave_hours,
						e.leave_day_pay,
						e.leave_hour_pay,
						e.WorkingHrs,
						e.TotalLate,
						e.TotalUT,
						e.TotalOT,
						e.SundayHrs,
						e.special_holiday_hrs,
						e.special_holiday,
						e.AccountNo_Empl,
						e.Department_Empl,
						e.StandardDays,
						e.StandardHour,
						e.ot_hours,
						e.np_hours,
						e.AbsentHour,
						e.HolidayHour,
						e.HolidayOTHour,
						e.HolidayNP,
						e.SpclOTHour,
						e.SunNP,
						e.ActualHour,
						e.SpclHour,
						e.rate_type,
						(e.TotalOT * e.OTRate) 'RegOTPay',
						(e.SpclHour * e.SpecialRate) 'SunPay',
						(e.SpclOTHour * e.SpecialRate) 'SunOTPay',
						(e.HolidayHour * e.HourlyRate) AS 'HolidayPay',
						(e.HolidayOTHour * e.HolidayRate) AS 'HolidayOTPay',
						(e.np_hours * e.NPRate) AS 'NPPay',
						((2.2 * e.NPRate) * e.HolidayNP) AS 'HolidayNPPay',
						((1.43 * e.NPRate) * e.HolidayNP) AS 'SunNPPay',
						(e.PaternityLeave * e.HourlyRate)AS 'PaternityLeavePay',
						(e.leave_hours * e.HourlyRate) AS 'SILPay',
						0 AS 'AdditionalAdjustment',
						(e.TotalLate * e.HourlyRate) AS 'LateDeduction'
						
					FROM
						(SELECT 
							d.id,
							d.UserID,
							d.EmpName,
							d.Position,
							d.BasicSalary,
							d.DutyDays,
							d.RegularWage,
							(d.TotalOT * d.OTRate) 'OTPay',
							d.HolidayPay,
							(d.RegularWage + d.OTPay + d.HolidayPay) 'Gross',
							d.transpo_allowance,
							d.mobile_allowance,
							d.osa_allowance,
							d.meal_allowance,
							d.medical_allowance_dependent,
							d.cloathing_allowance,
							d.laundry_allowance,
							(d.HourlyRate * d.TotalLate) 'LateDeduction',
							(d.HourlyRate * d.TotalUT) 'UTDeduction',
							d.sss_ee 'SSS',
							d.ph_ee 'PHILHEALTH',
							d.pagibig_ee 'PAGIBIG',
							d.gp_wtax 'WTax',
							d.TotalAllowance,
							d.TotalGovDeduction,
							(d.DoleRate_Empl * d.DutyDays) 'COLA',
							d.DailyRate,
							d.HourlyRate,
							d.MinRate,
							d.HolidayRate,
							d.SpecialRate,
							d.OTRate,
							d.NPRate,
							d.CA,
							d.SSS_Loan,
							d.PAGIBIG_Loan,
							d.sss_er,
							d.sss_ee,
							d.ph_er,
							d.ph_ee,
							d.pagibig_er,
							d.pagibig_ee,
							(d.HourlyRate * d.normal_holiday_hrs) 'normal_holiday',
							(d.HolidayRate * d.regular_holiday_hrs) 'regular_holiday',
							(d.SpecialRate * (d.special_holiday_hrs + d.SundayHrs)) 'special_holiday',
							d.holiday_cnt,
							d.leave_days,
							d.leave_hours,
							d.leave_day_pay,
							d.leave_hour_pay,
							d.WorkingHrs,
							d.TotalLate,
							d.TotalUT,
							d.TotalOT,
							d.SundayHrs,
							d.special_holiday_hrs,
							d.AccountNo_Empl,
							d.Department_Empl,
							d.no_of_days,
							(d.no_of_days/2) AS 'StandardDays',
							((d.no_of_days/2)*8) AS 'StandardHour',
							d.ot_hours,
							d.np_hours,
							d.AbsentHour,
							(d.normal_holiday_hrs + d.regular_holiday_hrs) AS 'HolidayHour',
							d.HolidayOTHour,
							d.HolidayNP,
							d.SpclOTHour,
							d.SunNP,
							d.rate_type,
							/*( ((d.no_of_days/2)*8) - (d.AbsentHour + d.leave_hours) ) AS 'ActualHour', */
							( d.WorkingHrs  ) AS 'ActualHour',
							(d.special_holiday_hrs + d.SundayHrs) 'SpclHour',
							0 AS 'PaternityLeave'
						FROM
							(SELECT
								c.UserID,
								c.EmpName,
								c.Position,
								c.BasicSalary,
								c.DutyDays,
								(c.DutyDays * c.DailyRate) 'RegularWage',
								'0' AS 'OTPay',
								'0' AS 'HolidayPay',
								c.gp_sss_ee,
								c.gp_phealth_ee,
								c.gp_pagibig_ee,
								c.gp_wtax,
								c.transpo_allowance,
								c.mobile_allowance,
								c.osa_allowance,
								c.meal_allowance,
								c.medical_allowance_dependent,
								c.cloathing_allowance,
								c.laundry_allowance,
								c.no_of_days,
								c.rate_type,
								c.DailyRate,
								c.HourlyRate,
								c.MinRate,
								(SUM(c.`WorkingHrs`)) 'WorkingHrs',
								(SUM(c.`TotalLate`)) 'TotalLate',
								(SUM(c.`TotalUT`)) 'TotalUT',
								SUM(c.`TotalOT`) 'TotalOT',
								(SUM(c.`SundayHrs`)) 'SundayHrs',
								(SUM(c.`regular_holiday_hrs`)) 'regular_holiday_hrs',
								SUM(c.`special_holiday_hrs`) 'special_holiday_hrs',
								c.normal_holiday_hrs,
								( c.transpo_allowance +  c.mobile_allowance + c.osa_allowance +c.meal_allowance ) 'TotalAllowance',
								( c.gp_sss_ee +  c.gp_phealth_ee + c.gp_pagibig_ee + c.gp_wtax ) 'TotalGovDeduction',
								c.DoleRate_Empl,
								c.id,
								c.HolidayRate,
								c.SpecialRate,
								c.OTRate,
								c.NPRate,
								c.CA,
								c.SSS_Loan,
								c.PAGIBIG_Loan,
								c.sss_er,
								c.sss_ee,
								c.ph_er,
								c.ph_ee,
								c.pagibig_er,
								c.pagibig_ee,
								c.holiday_cnt,
								c.leave_days,
								c.leave_hours,
								(c.leave_days * c.DailyRate) AS 'leave_day_pay',
								(c.leave_hours * c.HourlyRate) AS 'leave_hour_pay',
								c.AccountNo_Empl,
								c.Department_Empl,
								c.ot_hours,
								c.np_hours,
								c.AbsentHour,
								c.HolidayOTHour,
								c.HolidayNP,
								(c.SpclOTHour +  c.SundayOT) AS 'SpclOTHour',
								(c.SunNP + c.SundayOT) AS 'SunNP'
								
							FROM
								(SELECT 
									IF(b.holiday_type="0", IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'WorkingHrs',
									b.Late 'TotalLate',
									b.UT 'TotalUT',
									b.OT 'TotalOT',
									IF(b.holiday_type=0, IF(b.Restday='1',b.total_hours_worked,0) ,0) 'SundayHrs',
									IF(b.holiday_type="regular",IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'regular_holiday_hrs',
									IF(b.holiday_type="special",IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'special_holiday_hrs',
									IF(b.att_type="absent",IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'AbsentHour',
									(8 * (b.holiday_cnt - b.holiday_cnt_minus) ) 'normal_holiday_hrs',
									IF(b.holiday_type="special",IF(b.Restday<>'1',b.ot_hours,0) ,0) AS 'SpclOTHour',
									IF(b.holiday_type="regular",IF(b.Restday<>'1',b.ot_hours,0) ,0) AS 'HolidayOTHour',
									IF(b.holiday_type="regular",IF(b.Restday<>'1',b.np_hours,0) ,0) AS 'HolidayNP',
									IF(b.holiday_type="special",IF(b.Restday<>'1',b.np_hours,0) ,0) AS 'SunNP',
									IF(b.holiday_type=0, IF(b.Restday='1',b.np_hours,0) ,0) AS 'SundayNP',
									IF(b.holiday_type=0, IF(b.Restday='1',b.ot_hours,0) ,0) AS 'SundayOT',
									b.UserID,
									b.EmpName,
									b.Position,
									b.BasicSalary,
									b.gp_sss_ee,
									b.gp_phealth_ee,
									b.gp_pagibig_ee,
									b.gp_wtax,
									b.transpo_allowance,
									b.mobile_allowance,
									b.osa_allowance,
									b.meal_allowance,
									b.medical_allowance_dependent,
									b.cloathing_allowance,
									b.laundry_allowance,
									b.no_of_days,
									b.rate_type,
									b.DailyRate,
									b.DutyDays,
									b.HourlyRate,
									(b.HourlyRate/60) AS 'MinRate',
									b.DoleRate_Empl,
									b.id,
									(b.HourlyRate * 2) 'HolidayRate',
									(b.HourlyRate * 1.3) 'SpecialRate',
									(b.HourlyRate * 1.25) 'OTRate',
									(b.HourlyRate * 0.1) 'NPRate',
									b.CA,
									b.SSS_Loan,
									b.PAGIBIG_Loan,
									b.sss_er,
									b.sss_ee,
									b.ph_er,
									b.ph_ee,
									b.pagibig_er,
									b.pagibig_ee,
									b.holiday_cnt,
									b.leave_days,
									b.leave_hours,
									b.AccountNo_Empl,
									b.Department_Empl,
									IF(b.holiday_type="0", IF(b.Restday<>'1',b.ot_hours,0) ,0) AS 'ot_hours',
									IF(b.holiday_type="0", IF(b.Restday<>'1',b.np_hours,0) ,0) AS 'np_hours'
								FROM 
									(SELECT 
										a.`AM IN`  'AM IN',
										a.`PM OUT`  'PM OUT',
										a.total_hours_worked,
										a.late 'Late',
										a.undertime 'UT',
										IF(ISNULL(a.OT),0,a.ot) 'OT',
										a.UserID,
										a.EmpName,
										a.Position,
										a.BasicSalary,
										a.gp_sss_ee,
										a.gp_phealth_ee,
										a.gp_pagibig_ee,
										a.gp_wtax,
										a.transpo_allowance,
										a.mobile_allowance,
										a.osa_allowance,
										a.meal_allowance,
										a.medical_allowance_dependent,
										a.cloathing_allowance,
										a.laundry_allowance,
										a.no_of_days,
										a.rate_type,
										a.DailyRate,
										IF(a.dtr_dayName=a.Restday,'1','') 'Restday',
										(a.DutyDays - a.holiday_cnt_minus) AS 'DutyDays',
										(a.DailyRate/8) 'HourlyRate',
										a.DoleRate_Empl,
										a.id,
										IF(ISNULL(a.CA),0,a.CA) 'CA',
										IF(ISNULL(a.SSS_Loan),0,a.SSS_Loan) 'SSS_Loan',
										IF(ISNULL(a.PAGIBIG_Loan),0,a.PAGIBIG_Loan) 'PAGIBIG_Loan',
										(SELECT ssser.ER/2 FROM sss_setup ssser WHERE a.BasicSalary BETWEEN ssser.range_from AND ssser.range_to LIMIT 1) 'sss_er',
										(SELECT sssee.EE/2 FROM sss_setup sssee WHERE a.BasicSalary BETWEEN sssee.range_from AND sssee.range_to LIMIT 1) 'sss_ee',
										(SELECT ((((a.BasicSalary) * 0.03) / 2)/2) ) 'ph_er',
										(SELECT ((((a.BasicSalary) * 0.03) / 2)/2) ) 'ph_ee',
										(SELECT 100/2 FROM pagibig_setup pagibig_er WHERE (a.BasicSalary/2) BETWEEN pagibig_er.Gross_From AND pagibig_er.Gross_To LIMIT 1) 'pagibig_er',
										(SELECT 100/2 FROM pagibig_setup pagibig_ee WHERE (a.BasicSalary/2) BETWEEN pagibig_ee.Gross_From AND pagibig_ee.Gross_To LIMIT 1) 'pagibig_ee',
										IF(ISNULL(a.holiday_checker),0,a.holiday_checker) AS 'holiday_type',
										a.holiday_cnt_minus AS 'holiday_cnt_minus',
										a.holiday_cnt,
										IF(ISNULL(a.leave_days),0,a.leave_days) 'leave_days',
										IF(ISNULL(a.leave_hours),0,a.leave_hours) 'leave_hours',
										a.AccountNo_Empl,
										a.Department_Empl,
										a.ot_hours,
										a.np_hours,
										a.att_type
									FROM
										(SELECT 
											IFNULL(TIME_FORMAT(hr.in_am,'%H:%i'),'00:00') 'AM IN',
											IFNULL(TIME_FORMAT(hr.out_pm,'%H:%i'),'00:00') 'PM OUT',
											IFNULL(TIME_FORMAT(e.TimeStart_Empl,'%H:%i'),'00:00') 'SCHED IN',
											IFNULL(TIME_FORMAT(e.TimeEnd_Empl,'%H:%i'),'00:00') 'SCHED OUT',
											(SELECT OT_Hours FROM approved_ot ot WHERE ot.employee_number = hr.employee_number AND ot.dtr_date=hr.dtr_date LIMIT 1) 'OT',
											hr.dtr_date,
											CAST(DAYNAME(hr.dtr_date) AS CHAR(25)) 'dtr_dayName',
											e.Restday,
											hr.employee_number 'UserID',
											e.Name_Empl 'EmpName',
											r.Position_Empl 'Position',
											IF(e.rate_type="Daily",(e.BasicSalary_Empls*e.no_of_days),e.BasicSalary_Empls) 'BasicSalary',
											e.gp_sss_ee,
											e.gp_phealth_ee,
											e.gp_pagibig_ee,
											e.gp_wtax,
											e.transpo_allowance,
											e.mobile_allowance,
											e.osa_allowance,
											e.meal_allowance,
											e.medical_allowance_dependent,
											e.cloathing_allowance,
											e.laundry_allowance,
											e.no_of_days,
											e.rate_type,
											IF(e.rate_type="Daily",e.BasicSalary_Empls,(e.BasicSalary_Empls/e.no_of_days)) 'DailyRate',
											(SELECT COUNT(*) FROM hr_emp_attendance hr2 WHERE hr2.employee_number = hr.employee_number AND hr2.dtr_date BETWEEN _dateFrom AND _dateTo  AND !ISNULL(hr2.in_am) AND !ISNULL(hr2.out_pm)) 'DutyDays',
											e.DoleRate_Empl,
											e.SysPK_Empl 'id',
											e.AccountNo_Empl,
											e.Department_Empl,
											hr.late,
											hr.undertime,
											hr.ot_hours,
											hr.np_hours,
											hr.total_hours_worked,
											hr.att_type,
											(SELECT SUM(ca.amount_deduction) FROM emp_cash_advance ca WHERE ca.emp_id = e.SysPK_Empl AND ((ca.date_from <= _dateTo) AND  (ca.date_to >= _dateTo))) 'CA',
											(SELECT SUM(sss.amount_deduction) FROM emp_sss_loan sss WHERE sss.emp_id = e.SysPK_Empl AND ((sss.date_from <= _dateTo) AND (sss.date_to >= _dateTo))) 'SSS_Loan',
											(SELECT SUM(pagibig.amount_deduction) FROM emp_pagibig_loan pagibig WHERE pagibig.emp_id = e.SysPK_Empl AND ((pagibig.date_from <= _dateTo) AND  (pagibig.date_to >= _dateTo))) 'PAGIBIG_Loan',
											(SELECT h.holiday_type FROM hr_holidays h WHERE h.holiday_date = hr.dtr_date) AS 'holiday_checker',
											(SELECT COUNT(*) FROM hr_holidays h WHERE h.holiday_date BETWEEN _dateFrom AND _dateTo ) AS 'holiday_cnt',
											(SELECT COUNT(h.holiday_date) FROM hr_holidays h,hr_emp_attendance hhr WHERE h.holiday_date = hhr.dtr_date AND hhr.employee_number = hr.employee_number) AS 'holiday_cnt_minus',
											(SELECT SUM(IF(ISNULL(l.no_of_days),0,l.no_of_days)) FROM `leaves` l WHERE e.SysPK_Empl = l.emp_id AND l.is_approved = 1 AND ((l.leave_date_from BETWEEN _dateFrom AND _dateTo) OR (l.leave_date_to BETWEEN _dateFrom AND _dateTo))) AS 'leave_days',
											(SELECT SUM(IF(ISNULL(l.total_hours),0,l.total_hours)) FROM `leaves` l WHERE e.SysPK_Empl = l.emp_id AND l.is_approved = 1 AND ((l.leave_date_from BETWEEN _dateFrom AND _dateTo) OR (l.leave_date_to BETWEEN _dateFrom AND _dateTo))) AS 'leave_hours'
										FROM 
											hr_emp_attendance hr,
											employees e,
											employees_rate r
										WHERE 
											e.UserID_Empl = hr.employee_number AND 
											e.Position_Empl = r.id AND 
											hr.dtr_date BETWEEN _dateFrom AND _dateTo
										ORDER BY e.UserID_Empl
										
										) a
									)b
								) c GROUP BY c.UserID ORDER BY c.UserID
							)d
						)e
				)f
			)g
		)h
	)i
)j
ORDER BY j.UserID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `display_employee_payroll_2` */

/*!50003 DROP PROCEDURE IF EXISTS  `display_employee_payroll_2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `display_employee_payroll_2`(
	IN _dateFrom DATE,
	IN _dateTo DATE    
    )
BEGIN
SELECT
	j.id,
	j.UserID,
	j.AccountNo AS 'AccountNo',
	j.EmployeeName AS 'EmployeeName',
	j.Dept AS 'Dept',
	j.DailyRate AS 'DailyRate',
	j.MonthlyRate AS 'MonthlyRate',
	j.SemiMonthlyRate AS 'SemiMonthlyRate',
	j.HourlyRate AS 'HourlyRate',
	j.MinRate AS 'MinRate',
	j.RegOTRate AS 'RegOTRate',
	j.HolidayRate AS 'HolidayRate',
	j.SunOtRate AS 'SunOtRate',
	j.NPRate AS 'NPRate',
	j.StandardHour AS 'StandardHour',
	j.AbsentHour AS 'AbsentHour',
	j.UTHour AS 'UTHour',
	j.SL_VL AS 'SL_VL',
	j.ActualHour AS 'ActualHour',
	j.LateMin AS 'LateMin',
	j.RegOTHour AS 'RegOTHour',
	j.SpclHour AS 'SpclHour',
	j.SpclOTHour AS 'SpclOTHour',
	j.HolidayHour AS 'HolidayHour',
	j.HolidayOTHour AS 'HolidayOTHour',
	j.RegularNP AS 'RegularNP',
	j.HolidayNP AS 'HolidayNP',
	j.SunNP AS 'SunNP',
	j.PaternityLeave AS 'PaternityLeave',
	j.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
	j.TotalManHour AS 'TotalManHour',
	j.RiceAllowance AS 'RiceAllowance',
	j.ClothingAllowance AS 'ClothingAllowance',
	j.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
	j.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
	j.MedicalAssistance AS 'MedicalAssistance',
	j.LaundryAllowance AS 'LaundryAllowance',
	j.Deminimis AS 'Deminimis',
	j.COLA AS 'COLA',
	j.CommunicationAllowance AS 'CommunicationAllowance',
	j.BasicPay AS 'BasicPay',
	j.RegOTPay AS 'RegOTPay',
	j.SunPay AS 'SunPay',
	j.SunOTPay AS 'SunOTPay',
	j.HolidayPay AS 'HolidayPay',
	j.HolidayOTPay AS 'HolidayOTPay',
	j.NPPay AS 'NPPay',
	j.HolidayNPPay AS 'HolidayNPPay',
	j.SunNPPay AS 'SunNPPay',
	j.PaternityLeavePay AS 'PaternityLeavePay',
	j.SILPay AS 'SILPay',
	j.AdditionalAdjustment AS 'AdditionalAdjustment',
	j.LateDeduction AS 'LateDeduction',
	j.GrossPay AS 'GrossPay',
	j.TaxableCompensation AS 'TaxableCompensation',
	j.SSS AS 'SSS',
	j.PHILHEALTH AS 'PhilHealth',
	j.PAGIBIG AS 'PAGIBIG',
	j.WTax AS 'WTax',
	j.UnderWithheld AS 'UnderWithheld',
	j.OtherDeductions AS 'OtherDeductions',
	j.TotalTax AS 'TotalTax',
	j.SSSLOAN AS 'SSSLoan',
	j.PAGIBIGLOAN 'PAGIBIGLoan',
	j.DeductionAdjustment AS 'DeductionAdjustment',
	j.CA AS 'CA',
	(j.TotalDeductions + j.WTax) AS 'TotalDeductions',
	(j.NetPay - j.WTax) AS 'NetPay',
	(j.NetPay2 - j.WTax) AS 'NetPay2',
	j.Extra AS 'Extra',
	j.SSSER AS 'SSSER',
	j.PhilHealthER AS 'PhilHealthER',
	j.PAGIBIGER AS 'PAGIBIGER',
	j.WtaxER AS 'WtaxER',
	j.TotalER AS 'TotalER'
FROM
	(SELECT
		i.id,
		i.UserID,
		i.AccountNo AS 'AccountNo',
		i.EmployeeName AS 'EmployeeName',
		i.Dept AS 'Dept',
		i.DailyRate AS 'DailyRate',
		i.MonthlyRate AS 'MonthlyRate',
		i.SemiMonthlyRate AS 'SemiMonthlyRate',
		i.HourlyRate AS 'HourlyRate',
		i.MinRate AS 'MinRate',
		i.RegOTRate AS 'RegOTRate',
		i.HolidayRate AS 'HolidayRate',
		i.SunOtRate AS 'SunOtRate',
		i.NPRate AS 'NPRate',
		i.StandardHour AS 'StandardHour',
		i.AbsentHour AS 'AbsentHour',
		i.UTHour AS 'UTHour',
		i.SL_VL AS 'SL_VL',
		i.ActualHour AS 'ActualHour',
		i.LateMin AS 'LateMin',
		i.RegOTHour AS 'RegOTHour',
		i.SpclHour AS 'SpclHour',
		i.SpclOTHour AS 'SpclOTHour',
		i.HolidayHour AS 'HolidayHour',
		i.HolidayOTHour AS 'HolidayOTHour',
		i.RegularNP AS 'RegularNP',
		i.HolidayNP AS 'HolidayNP',
		i.SunNP AS 'SunNP',
		i.PaternityLeave AS 'PaternityLeave',
		i.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
		i.TotalManHour AS 'TotalManHour',
		i.RiceAllowance AS 'RiceAllowance',
		i.ClothingAllowance AS 'ClothingAllowance',
		i.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
		i.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
		i.MedicalAssistance AS 'MedicalAssistance',
		i.LaundryAllowance AS 'LaundryAllowance',
		i.Deminimis AS 'Deminimis',
		i.COLA AS 'COLA',
		i.CommunicationAllowance AS 'CommunicationAllowance',
		i.BasicPay AS 'BasicPay',
		i.RegOTPay AS 'RegOTPay',
		i.SunPay AS 'SunPay',
		i.SunOTPay AS 'SunOTPay',
		i.HolidayPay AS 'HolidayPay',
		i.HolidayOTPay AS 'HolidayOTPay',
		i.NPPay AS 'NPPay',
		i.HolidayNPPay AS 'HolidayNPPay',
		i.SunNPPay AS 'SunNPPay',
		i.PaternityLeavePay AS 'PaternityLeavePay',
		i.SILPay AS 'SILPay',
		i.AdditionalAdjustment AS 'AdditionalAdjustment',
		i.LateDeduction AS 'LateDeduction',
		i.GrossPay AS 'GrossPay',
		i.TaxableCompensation AS 'TaxableCompensation',
		i.SSS AS 'SSS',
		i.PHILHEALTH AS 'PhilHealth',
		i.PAGIBIG AS 'PAGIBIG',
		IF( ISNULL(i.AmountRate),0, 
			IF(	i.AmountRate=0 AND i.AmountPercentage=0,
				0, 
				IF(i.AmountRate=20416.67,
					( (i.AmountRate + ((i.TaxableCompensation - i.CompensationLevel) * i.AmountPercentage) ) + 5000 ),
					( i.AmountRate + ((i.TaxableCompensation - i.CompensationLevel) * i.AmountPercentage) ) 
				) 
			) 
		) AS 'WTax',
		i.UnderWithheld AS 'UnderWithheld',
		i.OtherDeductions AS 'OtherDeductions',
		i.TotalTax AS 'TotalTax',
		i.SSSLOAN AS 'SSSLoan',
		i.PAGIBIGLOAN 'PAGIBIGLoan',
		i.DeductionAdjustment AS 'DeductionAdjustment',
		i.CA AS 'CA',
		i.TotalDeductions AS 'TotalDeductions',
		i.NetPay AS 'NetPay',
		i.NetPay2 AS 'NetPay2',
		i.Extra AS 'Extra',
		i.SSSER AS 'SSSER',
		i.PhilHealthER AS 'PhilHealthER',
		i.PAGIBIGER AS 'PAGIBIGER',
		i.WtaxER AS 'WtaxER',
		i.TotalER AS 'TotalER'
	From
		(select
			h.id,
			h.UserID,
			h.AccountNo AS 'AccountNo',
			h.EmployeeName AS 'EmployeeName',
			h.Dept AS 'Dept',
			h.DailyRate AS 'DailyRate',
			h.MonthlyRate AS 'MonthlyRate',
			h.SemiMonthlyRate AS 'SemiMonthlyRate',
			h.HourlyRate AS 'HourlyRate',
			h.MinRate AS 'MinRate',
			h.RegOTRate AS 'RegOTRate',
			h.HolidayRate AS 'HolidayRate',
			h.SunOtRate AS 'SunOtRate',
			h.NPRate AS 'NPRate',
			h.StandardHour AS 'StandardHour',
			h.AbsentHour AS 'AbsentHour',
			h.UTHour AS 'UTHour',
			h.SL_VL AS 'SL_VL',
			h.ActualHour AS 'ActualHour',
			h.LateMin AS 'LateMin',
			h.RegOTHour AS 'RegOTHour',
			h.SpclHour AS 'SpclHour',
			h.SpclOTHour AS 'SpclOTHour',
			h.HolidayHour AS 'HolidayHour',
			h.HolidayOTHour AS 'HolidayOTHour',
			h.RegularNP AS 'RegularNP',
			h.HolidayNP AS 'HolidayNP',
			h.SunNP AS 'SunNP',
			h.PaternityLeave AS 'PaternityLeave',
			h.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
			h.TotalManHour AS 'TotalManHour',
			h.RiceAllowance AS 'RiceAllowance',
			h.ClothingAllowance AS 'ClothingAllowance',
			h.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
			h.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
			h.MedicalAssistance AS 'MedicalAssistance',
			h.LaundryAllowance AS 'LaundryAllowance',
			h.Deminimis AS 'Deminimis',
			h.COLA AS 'COLA',
			h.CommunicationAllowance AS 'CommunicationAllowance',
			h.BasicPay AS 'BasicPay',
			h.RegOTPay AS 'RegOTPay',
			h.SunPay AS 'SunPay',
			h.SunOTPay AS 'SunOTPay',
			h.HolidayPay AS 'HolidayPay',
			h.HolidayOTPay AS 'HolidayOTPay',
			h.NPPay AS 'NPPay',
			h.HolidayNPPay AS 'HolidayNPPay',
			h.SunNPPay AS 'SunNPPay',
			h.PaternityLeavePay AS 'PaternityLeavePay',
			h.SILPay AS 'SILPay',
			h.AdditionalAdjustment AS 'AdditionalAdjustment',
			h.LateDeduction AS 'LateDeduction',
			h.GrossPay AS 'GrossPay',
			h.TaxableCompensation AS 'TaxableCompensation',
			h.SSS AS 'SSS',
			h.PHILHEALTH AS 'PhilHealth',
			h.PAGIBIG AS 'PAGIBIG',
			h.WTax AS 'WTax',
			h.UnderWithheld AS 'UnderWithheld',
			h.OtherDeductions AS 'OtherDeductions',
			h.TotalTax AS 'TotalTax',
			h.SSSLOAN AS 'SSSLoan',
			h.PAGIBIGLOAN 'PAGIBIGLoan',
			h.DeductionAdjustment AS 'DeductionAdjustment',
			h.CA AS 'CA',
			h.TotalDeductions AS 'TotalDeductions',
			h.NetPay AS 'NetPay',
			h.NetPay2 AS 'NetPay2',
			h.Extra AS 'Extra',
			h.SSSER AS 'SSSER',
			h.PhilHealthER AS 'PhilHealthER',
			h.PAGIBIGER AS 'PAGIBIGER',
			h.WtaxER AS 'WtaxER',
			h.TotalER AS 'TotalER',
			(SELECT a.amount_rate FROM wtax_formula a WHERE h.TaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountRate',
			(SELECT a.additional_percentage FROM wtax_formula a WHERE h.TaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountPercentage',
			(SELECT a.compensation_level FROM wtax_formula a WHERE h.TaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'CompensationLevel'
		FROM	
			(SELECT
				g.id,
				g.UserID,
				g.AccountNo AS 'AccountNo',
				g.EmployeeName AS 'EmployeeName',
				g.Dept AS 'Dept',
				g.DailyRate AS 'DailyRate',
				g.MonthlyRate AS 'MonthlyRate',
				(g.MonthlyRate/2) AS 'SemiMonthlyRate',
				g.HourlyRate AS 'HourlyRate',
				g.MinRate AS 'MinRate',
				g.RegOTRate AS 'RegOTRate',
				g.HolidayRate AS 'HolidayRate',
				g.SunOtRate AS 'SunOtRate',
				g.NPRate AS 'NPRate',
				g.StandardHour AS 'StandardHour',
				g.AbsentHour AS 'AbsentHour',
				g.UTHour AS 'UTHour',
				'0' AS 'SL_VL',
				g.ActualHour AS 'ActualHour',
				g.LateMin AS 'LateMin',
				g.RegOTHour AS 'RegOTHour',
				g.SpclHour AS 'SpclHour',
				g.SpclOTHour AS 'SpclOTHour',
				g.HolidayHour AS 'HolidayHour',
				g.HolidayOTHour AS 'HolidayOTHour',
				g.RegularNP AS 'RegularNP',
				g.HolidayNP AS 'HolidayNP',
				g.SunNP AS 'SunNP',
				g.PaternityLeave AS 'PaternityLeave',
				g.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
				g.TotalManHour AS 'TotalManHour',
				g.RiceAllowance AS 'RiceAllowance',
				g.ClothingAllowance AS 'ClothingAllowance',
				g.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
				g.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
				g.MedicalAssistance AS 'MedicalAssistance',
				g.LaundryAllowance AS 'LaundryAllowance',
				g.Deminimis AS 'Deminimis',
				g.COLA AS 'COLA',
				g.CommunicationAllowance AS 'CommunicationAllowance',
				g.BasicPay AS 'BasicPay',
				g.RegOTPay AS 'RegOTPay',
				g.SunPay AS 'SunPay',
				g.SunOTPay AS 'SunOTPay',
				g.HolidayPay AS 'HolidayPay',
				g.HolidayOTPay AS 'HolidayOTPay',
				g.NPPay AS 'NPPay',
				g.HolidayNPPay AS 'HolidayNPPay',
				g.SunNPPay AS 'SunNPPay',
				g.PaternityLeavePay AS 'PaternityLeavePay',
				g.SILPay AS 'SILPay',
				g.AdditionalAdjustment AS 'AdditionalAdjustment',
				g.LateDeduction AS 'LateDeduction',
				g.GrossPay AS 'GrossPay',
				(
					(
						g.GrossPay - 
						(
							g.Deminimis + 
							g.COLA + 
							g.CommunicationAllowance +
							g.SSS +
							g.PHILHEALTH +
							g.PAGIBIG
						)
					)
				) AS 'TaxableCompensation',
				g.SSS AS 'SSS',
				g.PHILHEALTH AS 'PhilHealth',
				g.PAGIBIG AS 'PAGIBIG',
				g.WTax AS 'WTax',
				g.UnderWithheld AS 'UnderWithheld',
				g.OtherDeductions AS 'OtherDeductions',
				g.TotalTax AS 'TotalTax',
				g.SSSLOAN AS 'SSSLoan',
				g.PAGIBIGLOAN 'PAGIBIGLoan',
				g.DeductionAdjustment AS 'DeductionAdjustment',
				g.CA AS 'CA',
				g.TotalDeductions AS 'TotalDeductions',
				(g.GrossPay - g.TotalDeductions) AS 'NetPay',
				(g.GrossPay - g.TotalDeductions) AS 'NetPay2',
				g.Extra AS 'Extra',
				g.SSSER AS 'SSSER',
				g.PhilHealthER AS 'PhilHealthER',
				g.PAGIBIGER AS 'PAGIBIGER',
				g.WtaxER AS 'WtaxER',
				g.TotalER AS 'TotalER'	
			FROM
				(SELECT
					f.id,
					f.UserID,
					f.AccountNo_Empl AS 'AccountNo',
					f.EmpName AS 'EmployeeName',
					f.Department_Empl AS 'Dept',
					f.DailyRate AS 'DailyRate',
					f.BasicSalary AS 'MonthlyRate',
					(f.BasicSalary/2) AS 'SemiMonthlyRate',
					f.HourlyRate AS 'HourlyRate',
					f.MinRate AS 'MinRate',
					f.OTRate AS 'RegOTRate',
					f.HolidayRate AS 'HolidayRate',
					f.SpecialRate AS 'SunOtRate',
					f.NPRate AS 'NPRate',
					f.StandardHour AS 'StandardHour',
					f.AbsentHour AS 'AbsentHour',
					f.TotalUT AS 'UTHour',
					f.leave_hours AS 'SL/VL',
					/*Standar Hour - Absent Hour - Service Incentive Leave */
					f.ActualHour AS 'ActualHour',
					f.TotalLate AS 'LateMin',
					f.TotalOT AS 'RegOTHour',
					f.SpclHour AS 'SpclHour',
					f.SpclOTHour AS 'SpclOTHour',
					f.HolidayHour AS 'HolidayHour',
					f.HolidayOTHour AS 'HolidayOTHour',
					f.np_hours AS 'RegularNP',
					f.HolidayNP AS 'HolidayNP',
					f.SunNP AS 'SunNP',
					f.PaternityLeave AS 'PaternityLeave',
					f.leave_hours AS 'ServiceIncentiveLeave',
					/*ActualHour + RegOTHour + SpclHour */
					( (f.ActualHour + f.TotalOT + f.SpclHour + f.SpclOTHour + f.HolidayHour + f.HolidayOTHour) - (f.TotalLate / 60) ) AS 'TotalManHour',
					f.meal_allowance AS 'RiceAllowance',
					f.cloathing_allowance AS 'ClothingAllowance',
					'0' AS 'MonetizedUnusedLeave',
					f.medical_allowance_dependent AS 'MedicalCashAllowanceDependent',
					'0' AS 'MedicalAssistance',
					f.laundry_allowance AS 'LaundryAllowance',
					(f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance) AS 'Deminimis',
					f.COLA AS 'COLA',
					f.mobile_allowance AS 'CommunicationAllowance',
					( (f.HourlyRate * f.ActualHour) -
						(f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance)
					 ) AS 'BasicPay',
					f.RegOTPay AS 'RegOTPay',
					f.SunPay AS 'SunPay',
					f.SunOTPay AS 'SunOTPay',
					f.HolidayPay AS 'HolidayPay',
					f.HolidayOTPay AS 'HolidayOTPay',
					f.NPPay AS 'NPPay',
					f.HolidayNPPay AS 'HolidayNPPay',
					f.SunNPPay AS 'SunNPPay',
					f.PaternityLeavePay AS 'PaternityLeavePay',
					f.SILPay AS 'SILPay',
					f.AdditionalAdjustment AS 'AdditionalAdjustment',
					f.LateDeduction AS 'LateDeduction',
					(
						( (f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance) +
						f.COLA + 
						f.mobile_allowance + 
						( (f.HourlyRate * f.ActualHour) -
							(f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance)
						) +
						f.RegOTPay +
						f.SunPay +
						f.SunOTPay +
						f.HolidayPay +
						f.HolidayOTPay +
						f.NPPay + 
						f.HolidayNPPay +
						f.SunNPPay +
						f.PaternityLeavePay +
						f.SILPay +
						f.AdditionalAdjustment ) -
						f.LateDeduction
					) AS 'GrossPay',
					'0' AS 'TaxableCompensation',
					f.SSS AS 'SSS',
					f.PHILHEALTH AS 'PhilHealth',
					f.PAGIBIG AS 'PAGIBIG',
					f.WTax AS 'WTax',
					f.UnderWithheld AS 'UnderWithheld',
					f.OtherDeductions AS 'OtherDeductions',
					f.TotalTax AS 'TotalTax',
					f.SSSLOAN AS 'SSSLoan',
					f.PAGIBIGLOAN 'PAGIBIGLoan',
					f.DeductionAdjustment AS 'DeductionAdjustment',
					f.CA AS 'CA',
					(f.SSS + f.PHILHEALTH + f.PAGIBIG + f.UnderWithheld + f.OtherDeductions   + f.SSSLOAN + f.PAGIBIGLOAN + f.DeductionAdjustment + f.CA) AS 'TotalDeductions',
					'0' AS 'NetPay',
					'0' AS 'NetPay2',
					'0' AS 'Extra',
					f.sss_er AS 'SSSER',
					f.ph_er AS 'PhilHealthER',
					f.pagibig_er AS 'PAGIBIGER',
					'0' AS 'WtaxER',
					(f.sss_er + f.ph_er + f.pagibig_er) AS 'TotalER'
				FROM
					(SELECT 
						e.id,
						e.UserID,
						e.EmpName,
						e.Position,
						e.BasicSalary 'BasicSalary',
						(e.BasicSalary / 2) 'MonthlyRate',
						e.DutyDays,
						0 'HolidayDays',
						e.leave_days 'LeaveDays',
						e.RegularWage 'RegularWage',
						e.OTPay 'OTPay',
						(e.SundayHrs + e.special_holiday_hrs) 'SpecialHrs',
						(e.leave_day_pay + e.leave_hour_pay) 'LeavePay',
						(e.Gross + e.OTPay + (e.normal_holiday + e.regular_holiday + e.special_holiday)) 'Gross',
						e.transpo_allowance,
						IF(e.mobile_allowance=0,0,e.mobile_allowance) AS 'mobile_allowance',
						e.osa_allowance,
						IF(e.meal_allowance=0,0, 
							(
								IF(e.rate_type="Daily",
									( (e.meal_allowance * (e.ActualHour + e.HolidayHour + e.SpclHour) ) / 8 ),
									( ( (e.meal_allowance/26) / 8 ) * e.ActualHour )
								)
							) 
								) AS 'meal_allowance',
						IF(e.cloathing_allowance=0,0, ( ( (e.cloathing_allowance/26) / 8 ) * e.ActualHour ) ) AS 'cloathing_allowance',
						(e.medical_allowance_dependent/2) AS 'medical_allowance_dependent',
						IF(e.laundry_allowance=0,0,
							IF(e.id=2,(e.laundry_allowance/2), ( ( (e.laundry_allowance/26) / 8 ) * e.ActualHour ) )
						) AS 'laundry_allowance',
						e.UTDeduction 'UTDeduction',
						e.COLA 'COLA',
						e.SSS_Loan 'SSSLOAN',
						e.PAGIBIG_Loan 'PAGIBIGLOAN',
						e.SSS 'SSS',
						e.PHILHEALTH 'PHILHEALTH',
						e.PAGIBIG 'PAGIBIG',
						e.WTax 'WTax',
						'0' AS 'UnderWithheld',
						e.d_coop AS 'OtherDeductions',
						'0' AS 'TotalTax',
						'0' AS 'DeductionAdjustment',
						FORMAT(0,2) 'TotalAllowance',
						FORMAT(e.TotalGovDeduction,2) 'TotalGovDeduction',
						FORMAT( ( ((e.Gross + e.OTPay + (e.normal_holiday + e.regular_holiday + e.special_holiday) + (e.leave_day_pay + e.leave_hour_pay) ) - e.LateDeduction - e.UTDeduction) - (e.TotalGovDeduction)  + e.COLA - e.CA - e.SSS_Loan - e.PAGIBIG_Loan - e.sss_ee - e.ph_ee - e.pagibig_ee - e.d_coop) , 2) 'Net',
						e.DailyRate 'DailyRate',
						e.HourlyRate 'HourlyRate',
						e.MinRate,
						e.HolidayRate 'HolidayRate',
						e.SpecialRate 'SpecialRate',
						e.OTRate 'OTRate',
						e.NPRate,
						e.CA,
						e.SSS_Loan,
						e.PAGIBIG_Loan,
						e.sss_er,
						e.sss_ee,
						e.ph_er,
						e.ph_ee,
						e.pagibig_er,
						e.pagibig_ee,
						e.PaternityLeave,
						e.leave_days,
						e.leave_hours,
						e.leave_day_pay,
						e.leave_hour_pay,
						e.WorkingHrs,
						e.TotalLate,
						e.TotalUT,
						e.TotalOT,
						e.SundayHrs,
						e.special_holiday_hrs,
						e.special_holiday,
						e.AccountNo_Empl,
						e.Department_Empl,
						e.StandardDays,
						e.StandardHour,
						e.ot_hours,
						e.np_hours,
						e.AbsentHour,
						e.HolidayHour,
						e.HolidayOTHour,
						e.HolidayNP,
						e.SpclOTHour,
						e.SunNP,
						e.ActualHour,
						e.SpclHour,
						e.rate_type,
						(e.TotalOT * e.OTRate) 'RegOTPay',
						(e.SpclHour * e.SpecialRate) 'SunPay',
						(e.SpclOTHour * e.SpecialRate) 'SunOTPay',
						(e.HolidayHour * e.HourlyRate) AS 'HolidayPay',
						(e.HolidayOTHour * e.HolidayRate) AS 'HolidayOTPay',
						(e.np_hours * e.NPRate) AS 'NPPay',
						((2.2 * e.NPRate) * e.HolidayNP) AS 'HolidayNPPay',
						((1.43 * e.NPRate) * e.HolidayNP) AS 'SunNPPay',
						(e.PaternityLeave * e.HourlyRate)AS 'PaternityLeavePay',
						(e.leave_hours * e.HourlyRate) AS 'SILPay',
						0 AS 'AdditionalAdjustment',
						(e.TotalLate * e.HourlyRate) AS 'LateDeduction',
						e.d_coop
						
					FROM
						(SELECT 
							d.id,
							d.UserID,
							d.EmpName,
							d.Position,
							d.BasicSalary,
							d.DutyDays,
							d.RegularWage,
							(d.TotalOT * d.OTRate) 'OTPay',
							d.HolidayPay,
							(d.RegularWage + d.OTPay + d.HolidayPay) 'Gross',
							d.transpo_allowance,
							d.mobile_allowance,
							d.osa_allowance,
							d.meal_allowance,
							d.medical_allowance_dependent,
							d.cloathing_allowance,
							d.laundry_allowance,
							(d.HourlyRate * d.TotalLate) 'LateDeduction',
							(d.HourlyRate * d.TotalUT) 'UTDeduction',
							d.sss_ee 'SSS',
							d.ph_ee 'PHILHEALTH',
							d.pagibig_ee 'PAGIBIG',
							d.gp_wtax 'WTax',
							d.TotalAllowance,
							d.TotalGovDeduction,
							(d.DoleRate_Empl * d.DutyDays) 'COLA',
							d.DailyRate,
							d.HourlyRate,
							d.MinRate,
							d.HolidayRate,
							d.SpecialRate,
							d.OTRate,
							d.NPRate,
							d.CA,
							d.SSS_Loan,
							d.PAGIBIG_Loan,
							d.sss_er,
							d.sss_ee,
							d.ph_er,
							d.ph_ee,
							d.pagibig_er,
							d.pagibig_ee,
							(d.HourlyRate * d.normal_holiday_hrs) 'normal_holiday',
							(d.HolidayRate * d.regular_holiday_hrs) 'regular_holiday',
							(d.SpecialRate * (d.special_holiday_hrs + d.SundayHrs)) 'special_holiday',
							d.leave_days,
							d.leave_hours,
							d.leave_day_pay,
							d.leave_hour_pay,
							d.WorkingHrs,
							d.TotalLate,
							d.TotalUT,
							d.TotalOT,
							d.SundayHrs,
							d.special_holiday_hrs,
							d.AccountNo_Empl,
							d.Department_Empl,
							d.no_of_days,
							(d.no_of_days/2) AS 'StandardDays',
							((d.no_of_days/2)*8) AS 'StandardHour',
							d.ot_hours,
							d.np_hours,
							d.AbsentHour,
							(d.normal_holiday_hrs + d.regular_holiday_hrs) AS 'HolidayHour',
							d.HolidayOTHour,
							d.HolidayNP,
							d.SpclOTHour,
							d.SunNP,
							d.rate_type,
							/*( ((d.no_of_days/2)*8) - (d.AbsentHour + d.leave_hours) ) AS 'ActualHour', */
							( d.WorkingHrs  ) AS 'ActualHour',
							(d.special_holiday_hrs + d.SundayHrs) 'SpclHour',
							d.paternity_leave_hour AS 'PaternityLeave',
							d.d_coop
						FROM
							(SELECT
								c.UserID,
								c.EmpName,
								c.Position,
								c.BasicSalary,
								c.DutyDays,
								(c.DutyDays * c.DailyRate) 'RegularWage',
								'0' AS 'OTPay',
								'0' AS 'HolidayPay',
								c.gp_sss_ee,
								c.gp_phealth_ee,
								c.gp_pagibig_ee,
								c.gp_wtax,
								c.transpo_allowance,
								c.mobile_allowance,
								c.osa_allowance,
								c.meal_allowance,
								c.medical_allowance_dependent,
								c.cloathing_allowance,
								c.laundry_allowance,
								c.no_of_days,
								c.rate_type,
								c.DailyRate,
								c.HourlyRate,
								c.MinRate,
								c.`WorkingHrs` 'WorkingHrs',
								c.`TotalLate` 'TotalLate',
								c.`TotalUT` 'TotalUT',
								c.`TotalOT` 'TotalOT',
								c.`SundayHrs` 'SundayHrs',
								c.`regular_holiday_hrs` 'regular_holiday_hrs',
								c.`special_holiday_hrs` 'special_holiday_hrs',
								c.normal_holiday_hrs,
								( c.transpo_allowance +  c.mobile_allowance + c.osa_allowance +c.meal_allowance ) 'TotalAllowance',
								( c.gp_sss_ee +  c.gp_phealth_ee + c.gp_pagibig_ee + c.gp_wtax ) 'TotalGovDeduction',
								c.DoleRate_Empl,
								c.id,
								c.HolidayRate,
								c.SpecialRate,
								c.OTRate,
								c.NPRate,
								c.CA,
								c.SSS_Loan,
								c.PAGIBIG_Loan,
								c.sss_er,
								c.sss_ee,
								c.ph_er,
								c.ph_ee,
								c.pagibig_er,
								c.pagibig_ee,
								c.leave_days,
								c.leave_hours,
								(c.leave_days * c.DailyRate) AS 'leave_day_pay',
								(c.leave_hours * c.HourlyRate) AS 'leave_hour_pay',
								c.AccountNo_Empl,
								c.Department_Empl,
								c.ot_hours,
								c.np_hours,
								c.AbsentHour,
								c.HolidayOTHour,
								c.HolidayNP,
								(c.SpclOTHour +  c.SundayOT) AS 'SpclOTHour',
								(c.SunNP + c.SpclNP) AS 'SunNP',
								c.paternity_leave_hour,
								c.d_coop
								
							FROM
								(SELECT 
									b.total_hours_worked 'WorkingHrs',
									b.Late 'TotalLate',
									b.UT 'TotalUT',
									b.OT 'TotalOT',
									b.sun_hr 'SundayHrs',
									b.hol_hr 'regular_holiday_hrs',
									b.spl_hr 'special_holiday_hrs',
									b.absent_hour 'AbsentHour',
									0 'normal_holiday_hrs',
									b.spl_ot AS 'SpclOTHour',
									b.spl_nd AS 'SpclNP',
									b.hol_ot AS 'HolidayOTHour',
									b.hol_nd AS 'HolidayNP',
									b.sun_nd AS 'SunNP',
									b.sun_ot AS 'SundayOT',
									b.UserID,
									b.EmpName,
									b.Position,
									b.BasicSalary,
									b.gp_sss_ee,
									b.gp_phealth_ee,
									b.gp_pagibig_ee,
									b.gp_wtax,
									b.transpo_allowance,
									b.mobile_allowance,
									b.osa_allowance,
									b.meal_allowance,
									b.medical_allowance_dependent,
									b.cloathing_allowance,
									b.laundry_allowance,
									b.no_of_days,
									b.rate_type,
									b.DailyRate,
									b.DutyDays,
									b.HourlyRate,
									(b.HourlyRate/60) AS 'MinRate',
									b.DoleRate_Empl,
									b.id,
									(b.HourlyRate * 2) 'HolidayRate',
									(b.HourlyRate * 1.3) 'SpecialRate',
									(b.HourlyRate * 1.25) 'OTRate',
									(b.HourlyRate * 0.1) 'NPRate',
									if(b.CA=0,b.d_cash_advance,b.CA) as 'CA',
									IF(b.SSS_Loan=0,b.d_sss_loan,b.SSS_Loan) as 'SSS_Loan',
									IF(b.PAGIBIG_Loan=0,b.d_pagibig_loan,b.PAGIBIG_Loan) as 'PAGIBIG_Loan',
									b.sss_er,
									b.sss_ee,
									if(b.id=2,(900/2),b.ph_er) "ph_er",
									IF(b.id=2,(900/2),b.ph_ee) "ph_ee",
									IF(b.gp_pagibig_er=0,b.pagibig_er, b.gp_pagibig_er) "pagibig_er",
									IF(b.gp_pagibig_ee=0,b.pagibig_ee,b.gp_pagibig_ee) "pagibig_ee",
									b.leave_days,
									b.leave_hours,
									b.AccountNo_Empl,
									b.Department_Empl,
									b.ot_hours AS 'ot_hours',
									b.np_hours AS 'np_hours',
									b.paternity_leave_hour,
									b.d_coop
								FROM 
									(SELECT 
										a.total_hours_worked,
										if(isnull(a.late_min),0,a.late_min) 'Late',
										if(isnull(a.undertime),0,a.undertime) 'UT',
										IF(ISNULL(a.ot_hours),0,a.ot_hours) 'OT',
										a.UserID,
										a.EmpName,
										a.Position,
										a.BasicSalary,
										a.gp_sss_ee,
										a.gp_phealth_ee,
										a.gp_pagibig_ee,
										a.gp_pagibig_er,
										a.gp_wtax,
										a.transpo_allowance,
										IF(DAY(_dateFrom)<=11,a.mobile_allowance,0) AS 'mobile_allowance',
										a.osa_allowance,
										a.meal_allowance,
										a.medical_allowance_dependent,
										a.cloathing_allowance,
										a.laundry_allowance,
										a.no_of_days,
										a.rate_type,
										a.DailyRate,
										(a.DutyDays) AS 'DutyDays',
										(a.DailyRate/8) 'HourlyRate',
										a.DoleRate_Empl,
										a.id,
										IF(ISNULL(a.CA),0,a.CA) 'CA',
										IF(ISNULL(a.SSS_Loan),0,a.SSS_Loan) 'SSS_Loan',
										IF(ISNULL(a.PAGIBIG_Loan),0,a.PAGIBIG_Loan) 'PAGIBIG_Loan',
										(SELECT ssser.ER/2 FROM sss_setup ssser WHERE a.BasicSalary BETWEEN ssser.range_from AND ssser.range_to LIMIT 1) 'sss_er',
										(SELECT sssee.EE/2 FROM sss_setup sssee WHERE a.BasicSalary BETWEEN sssee.range_from AND sssee.range_to LIMIT 1) 'sss_ee',
										(SELECT ((((a.BasicSalary) * 0.03) / 2)/2) ) 'ph_er',
										(SELECT ((((a.BasicSalary) * 0.03) / 2)/2) ) 'ph_ee',
										(SELECT 100/2 FROM pagibig_setup pagibig_er WHERE (a.BasicSalary/2) BETWEEN pagibig_er.Gross_From AND pagibig_er.Gross_To LIMIT 1) 'pagibig_er',
										(SELECT 100/2 FROM pagibig_setup pagibig_ee WHERE (a.BasicSalary/2) BETWEEN pagibig_ee.Gross_From AND pagibig_ee.Gross_To LIMIT 1) 'pagibig_ee',
										IF(ISNULL(a.leave_days),0,a.leave_days) 'leave_days',
										IF(ISNULL(a.leave_hours),0,a.leave_hours) 'leave_hours',
										a.AccountNo_Empl,
										a.Department_Empl,
										a.ot_hours,
										a.np_hours,
										a.sun_hr,
										a.sun_ot,
										a.sun_nd,
										a.spl_hr,
										a.spl_ot,
										a.spl_nd,
										a.hol_hr,
										a.hol_ot,
										a.hol_nd,
										a.paternity_leave_hour,
										a.absent_hour,
										IF(ISNULL(a.d_coop),0,a.d_coop) as 'd_coop',
										IF(ISNULL(a.d_sss_loan),0,a.d_sss_loan) as 'd_sss_loan',
										IF(ISNULL(a.d_pagibig_loan),0,a.d_pagibig_loan) as 'd_pagibig_loan',
										IF(ISNULL(a.d_cash_advance),0,a.d_cash_advance) as 'd_cash_advance'
										
									FROM
										(SELECT 
											hr.ot 'OT',
											e.Restday,
											hr.emp_no 'UserID',
											hr.emp_name 'EmpName',
											r.Position_Empl 'Position',
											IF(e.rate_type="Daily",(e.BasicSalary_Empls*e.no_of_days),e.BasicSalary_Empls) 'BasicSalary',
											e.gp_sss_ee,
											e.gp_phealth_ee,
											e.gp_pagibig_ee,
											e.gp_pagibig_er,
											e.gp_wtax,
											e.transpo_allowance,
											e.mobile_allowance,
											e.osa_allowance,
											e.meal_allowance,
											e.medical_allowance_dependent,
											e.cloathing_allowance,
											e.laundry_allowance,
											e.no_of_days,
											e.rate_type,
											IF(e.rate_type="Daily",e.BasicSalary_Empls,(e.BasicSalary_Empls/e.no_of_days)) 'DailyRate',
											hr.actual_day 'DutyDays',
											e.DoleRate_Empl,
											e.SysPK_Empl 'id',
											e.AccountNo_Empl,
											e.Department_Empl,
											hr.late_min,
											IF(ISNULL(hr.ut),0,hr.ut) 'undertime',
											IF(ISNULL(hr.ot),0,hr.ot) 'ot_hours',
											if(isnull(hr.nd),0,hr.nd) 'np_hours',
											hr.actual_hour 'total_hours_worked',
											(SELECT SUM(ca.amount_deduction) FROM emp_cash_advance ca WHERE ca.emp_id = e.SysPK_Empl AND ((ca.date_from <= _dateTo) AND  (ca.date_to >= _dateTo))) 'CA',
											(SELECT SUM(sss.amount_deduction) FROM emp_sss_loan sss WHERE sss.emp_id = e.SysPK_Empl AND ((sss.date_from <= _dateTo) AND (sss.date_to >= _dateTo))) 'SSS_Loan',
											(SELECT SUM(pagibig.amount_deduction) FROM emp_pagibig_loan pagibig WHERE pagibig.emp_id = e.SysPK_Empl AND ((pagibig.date_from <= _dateTo) AND  (pagibig.date_to >= _dateTo))) 'PAGIBIG_Loan',
											(hr.sil_hour/8) AS 'leave_days',
											hr.sil_hour AS 'leave_hours',
											if(ISNULL(hr.paternity_leave_hour),0,hr.paternity_leave_hour) 'paternity_leave_hour',
											IF(ISNULL(hr.sun_hr),0,hr.sun_hr) 'sun_hr',
											IF(ISNULL(hr.sun_ot),0,hr.sun_ot) 'sun_ot',
											IF(ISNULL(hr.sun_nd),0,hr.sun_nd) 'sun_nd',
											IF(ISNULL(hr.spl_hr),0,hr.spl_hr) 'spl_hr',
											IF(ISNULL(hr.spl_ot),0,hr.spl_ot) 'spl_ot',
											IF(ISNULL(hr.spl_nd),0,hr.spl_nd) 'spl_nd',
											IF(ISNULL(hr.hol_hr),0,hr.hol_hr) 'hol_hr',
											IF(ISNULL(hr.hol_ot),0,hr.hol_ot) 'hol_ot',
											IF(ISNULL(hr.hol_nd),0,hr.hol_nd) 'hol_nd',
											IF(ISNULL(hr.absent_hour),0,hr.absent_hour) 'absent_hour',
											(SELECT d.coop FROM payroll_deduction d where d.emp_no = e.UserID_Empl AND d.date_from = _dateFrom and d.date_to = _dateTo) as 'd_coop',
											(SELECT d.sss_loan FROM payroll_deduction d WHERE d.emp_no = e.UserID_Empl AND d.date_from = _dateFrom AND d.date_to = _dateTo) AS 'd_sss_loan',
											(SELECT d.pagibig_loan FROM payroll_deduction d WHERE d.emp_no = e.UserID_Empl AND d.date_from = _dateFrom AND d.date_to = _dateTo) AS 'd_pagibig_loan',
											(SELECT d.cash_advance FROM payroll_deduction d WHERE d.emp_no = e.UserID_Empl AND d.date_from = _dateFrom AND d.date_to = _dateTo) AS 'd_cash_advance'
										FROM 
											dtr_summary hr,
											employees e,
											employees_rate r
										WHERE 
											e.SysPK_Empl = hr.emp_id AND 
											e.Position_Empl = r.id AND 
											hr.date_from = _dateFrom AND
											hr.date_to = _dateTo
										ORDER BY e.UserID_Empl
										
										) a
									)b
								) c GROUP BY c.UserID ORDER BY c.UserID
							)d
						)e
				)f
			)g
		)h
	)i
)j;	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `display_employee_payroll_byDepartment` */

/*!50003 DROP PROCEDURE IF EXISTS  `display_employee_payroll_byDepartment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `display_employee_payroll_byDepartment`(
	IN _deparment VARCHAR(255),
	IN _dateFrom DATE,
	IN _dateTo DATE
    )
BEGIN
SELECT 
	e.id,
	e.UserID,
	e.EmpName,
	e.Position,
	FORMAT(e.BasicSalary,2) 'BasicSalary',
	e.DutyDays,
	e.holiday_cnt 'HolidayDays',
	e.leave_days 'LeaveDays',
	FORMAT(e.RegularWage,2) 'RegularWage',
	FORMAT(e.OTPay,2) 'OTPay',
	FORMAT((e.SundayHrs + e.special_holiday_hrs),2) 'SpecialHrs',
	FORMAT((e.normal_holiday + e.regular_holiday + e.special_holiday),2) 'HolidayPay',
	FORMAT((e.leave_day_pay + e.leave_hour_pay),2) 'LeavePay',
	FORMAT((e.Gross + e.OTPay + (e.normal_holiday + e.regular_holiday + e.special_holiday)),2) 'Gross',
	FORMAT(0,2) 'transpo_allowance',
	FORMAT(0,2) 'mobile_allowance',
	FORMAT(0,2) 'osa_allowance',
	FORMAT(0,2) 'meal_allowance',
	FORMAT(e.LateDeduction,2) 'LateDeduction',
	FORMAT(e.UTDeduction,2) 'UTDeduction',
	FORMAT(e.COLA,2) 'COLA',
	FORMAT(e.SSS_Loan,2) 'SSS_LOAN',
	FORMAT(e.PAGIBIG_Loan,2) 'PAGIBIG_LOAN',
	FORMAT(e.SSS,2) 'SSS',
	e.PHILHEALTH 'PHILHEALTH',
	FORMAT(e.PAGIBIG,2) 'PAGIBIG',
	FORMAT(e.WTax,2) 'WTax',
	FORMAT(0,2) 'TotalAllowance',
	FORMAT(e.TotalGovDeduction,2) 'TotalGovDeduction',
	FORMAT( ( ((e.Gross + e.OTPay + (e.normal_holiday + e.regular_holiday + e.special_holiday) + (e.leave_day_pay + e.leave_hour_pay) ) - e.LateDeduction - e.UTDeduction) - (e.TotalGovDeduction)  + e.COLA - e.CA - e.SSS_Loan - e.PAGIBIG_Loan - e.sss_ee - e.ph_ee - e.pagibig_ee) , 2) 'Net',
	FORMAT(e.DailyRate,2) 'DailyRate',
	FORMAT(e.HourlyRate,2) 'HourlyRate',
	FORMAT(e.HolidayRate,2) 'HolidayRate',
	FORMAT(e.SpecialRate,2) 'SpecialRate',
	FORMAT(e.OTRate,2) 'OTRate',
	e.CA,
	e.SSS_Loan,
	e.PAGIBIG_Loan,
	e.sss_er,
	e.sss_ee,
	e.ph_er,
	e.ph_ee,
	e.pagibig_er,
	e.pagibig_ee,
	e.leave_days,
	e.leave_hours,
	e.leave_day_pay,
	e.leave_hour_pay,
	e.WorkingHrs,
	e.TotalLate,
	e.TotalUT,
	e.TotalOT,
	e.SundayHrs,
	e.special_holiday_hrs,
	FORMAT(e.special_holiday,2) 'special_holiday'
	
FROM
	(SELECT 
		d.id,
		d.UserID,
		d.EmpName,
		d.Position,
		d.BasicSalary,
		d.DutyDays,
		d.RegularWage,
		(d.TotalOT * d.OTRate) 'OTPay',
		d.HolidayPay,
		(d.RegularWage + d.OTPay + d.HolidayPay) 'Gross',
		d.transpo_allowance,
		d.mobile_allowance,
		d.osa_allowance,
		d.meal_allowance,
		(d.HourlyRate * d.TotalLate) 'LateDeduction',
		(d.HourlyRate * d.TotalUT) 'UTDeduction',
		d.sss_ee 'SSS',
		d.ph_ee 'PHILHEALTH',
		d.pagibig_ee 'PAGIBIG',
		d.gp_wtax 'WTax',
		d.TotalAllowance,
		d.TotalGovDeduction,
		(d.DoleRate_Empl * d.DutyDays) 'COLA',
		d.DailyRate,
		d.HourlyRate,
		d.HolidayRate,
		d.SpecialRate,
		d.OTRate,
		d.CA,
		d.SSS_Loan,
		d.PAGIBIG_Loan,
		d.sss_er,
		d.sss_ee,
		d.ph_er,
		d.ph_ee,
		d.pagibig_er,
		d.pagibig_ee,
		(d.HourlyRate * d.normal_holiday_hrs) 'normal_holiday',
		(d.HolidayRate * d.regular_holiday_hrs) 'regular_holiday',
		(d.SpecialRate * (d.special_holiday_hrs + d.SundayHrs)) 'special_holiday',
		d.holiday_cnt,
		d.leave_days,
		d.leave_hours,
		d.leave_day_pay,
		d.leave_hour_pay,
		d.WorkingHrs,
		d.TotalLate,
		d.TotalUT,
		d.TotalOT,
		d.SundayHrs,
		d.special_holiday_hrs
	FROM
		(SELECT
			c.UserID,
			c.EmpName,
			c.Position,
			c.BasicSalary,
			c.DutyDays,
			(c.DutyDays * c.DailyRate) 'RegularWage',
			'0' AS 'OTPay',
			'0' AS 'HolidayPay',
			c.gp_sss_ee,
			c.gp_phealth_ee,
			c.gp_pagibig_ee,
			c.gp_wtax,
			c.transpo_allowance,
			c.mobile_allowance,
			c.osa_allowance,
			c.meal_allowance,
			c.no_of_days,
			c.rate_type,
			c.DailyRate,
			c.HourlyRate,
			(SUM(c.`WorkingHrs`)) 'WorkingHrs',
			(SUM(c.`TotalLate`)) 'TotalLate',
			(SUM(c.`TotalUT`)) 'TotalUT',
			SUM(c.`TotalOT`) 'TotalOT',
			(SUM(c.`SundayHrs`)) 'SundayHrs',
			(SUM(c.`regular_holiday_hrs`)) 'regular_holiday_hrs',
			SUM(c.`special_holiday_hrs`) 'special_holiday_hrs',
			c.normal_holiday_hrs,
			( c.transpo_allowance +  c.mobile_allowance + c.osa_allowance +c.meal_allowance ) 'TotalAllowance',
			( c.gp_sss_ee +  c.gp_phealth_ee + c.gp_pagibig_ee + c.gp_wtax ) 'TotalGovDeduction',
			c.DoleRate_Empl,
			c.id,
			c.HolidayRate,
			c.SpecialRate,
			c.OTRate,
			c.CA,
			c.SSS_Loan,
			c.PAGIBIG_Loan,
			c.sss_er,
			c.sss_ee,
			c.ph_er,
			c.ph_ee,
			c.pagibig_er,
			c.pagibig_ee,
			c.holiday_cnt,
			c.leave_days,
			c.leave_hours,
			(c.leave_days * c.DailyRate) AS 'leave_day_pay',
			(c.leave_hours * c.HourlyRate) AS 'leave_hour_pay'
		FROM
			(SELECT 
				IF(b.holiday_type="0", IF(b.Restday<>'1',b.total_hours_worked,0) ,'00:00:00') 'WorkingHrs',
				b.Late 'TotalLate',
				b.UT 'TotalUT',
				b.OT 'TotalOT',
				IF(b.holiday_type=0, IF(b.Restday='1',b.total_hours_worked,0) ,0) 'SundayHrs',
				IF(b.holiday_type="regular",IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'regular_holiday_hrs',
				IF(b.holiday_type="special",IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'special_holiday_hrs',
				(8 * (b.holiday_cnt - b.holiday_cnt_minus) ) 'normal_holiday_hrs',
				b.UserID,
				b.EmpName,
				b.Position,
				b.BasicSalary,
				b.gp_sss_ee,
				b.gp_phealth_ee,
				b.gp_pagibig_ee,
				b.gp_wtax,
				b.transpo_allowance,
				b.mobile_allowance,
				b.osa_allowance,
				b.meal_allowance,
				b.no_of_days,
				b.rate_type,
				b.DailyRate,
				b.DutyDays,
				b.HourlyRate,
				b.DoleRate_Empl,
				b.id,
				REPLACE(FORMAT((b.HourlyRate * 2),2),',','') 'HolidayRate',
				REPLACE(FORMAT((b.HourlyRate * 1.3),2),',','') 'SpecialRate',
				REPLACE(FORMAT((b.HourlyRate * 1.25),2),',','') 'OTRate',
				b.CA,
				b.SSS_Loan,
				b.PAGIBIG_Loan,
				b.sss_er,
				b.sss_ee,
				b.ph_er,
				b.ph_ee,
				b.pagibig_er,
				b.pagibig_ee,
				b.holiday_cnt,
				b.leave_days,
				b.leave_hours
			FROM 
				(SELECT 
					a.`AM IN`  'AM IN',
					a.`PM OUT`  'PM OUT',
					a.total_hours_worked,
					a.late 'Late',
					a.undertime 'UT',
					IF(ISNULL(a.OT),0,a.ot) 'OT',
					a.UserID,
					a.EmpName,
					a.Position,
					a.BasicSalary,
					a.gp_sss_ee,
					a.gp_phealth_ee,
					a.gp_pagibig_ee,
					a.gp_wtax,
					a.transpo_allowance,
					a.mobile_allowance,
					a.osa_allowance,
					a.meal_allowance,
					a.no_of_days,
					a.rate_type,
					a.DailyRate,
					IF(a.dtr_dayName=a.Restday,'1','') 'Restday',
					(a.DutyDays - a.holiday_cnt_minus) AS 'DutyDays',
					(a.DailyRate/8) 'HourlyRate',
					a.DoleRate_Empl,
					a.id,
					IF(ISNULL(a.CA),0,a.CA) 'CA',
					IF(ISNULL(a.SSS_Loan),0,a.SSS_Loan) 'SSS_Loan',
					IF(ISNULL(a.PAGIBIG_Loan),0,a.PAGIBIG_Loan) 'PAGIBIG_Loan',
					(SELECT ssser.ER FROM sss_setup ssser WHERE (a.BasicSalary/2) BETWEEN ssser.range_from AND ssser.range_to LIMIT 1) 'sss_er',
					(SELECT sssee.EE FROM sss_setup sssee WHERE (a.BasicSalary/2) BETWEEN sssee.range_from AND sssee.range_to LIMIT 1) 'sss_ee',
					(SELECT REPLACE(((((a.BasicSalary) * 0.0275) / 2)/2),',','') ) 'ph_er',
					(SELECT REPLACE(((((a.BasicSalary) * 0.0275) / 2)/2),',','') ) 'ph_ee',
					(SELECT 100/2 FROM pagibig_setup pagibig_er WHERE (a.BasicSalary/2) BETWEEN pagibig_er.Gross_From AND pagibig_er.Gross_To LIMIT 1) 'pagibig_er',
					(SELECT 100/2 FROM pagibig_setup pagibig_ee WHERE (a.BasicSalary/2) BETWEEN pagibig_ee.Gross_From AND pagibig_ee.Gross_To LIMIT 1) 'pagibig_ee',
					IF(ISNULL(a.holiday_checker),0,a.holiday_checker) AS 'holiday_type',
					a.holiday_cnt_minus AS 'holiday_cnt_minus',
					a.holiday_cnt,
					IF(ISNULL(a.leave_days),0,a.leave_days) 'leave_days',
					IF(ISNULL(a.leave_hours),0,a.leave_hours) 'leave_hours'
				FROM
					(SELECT 
						IFNULL(TIME_FORMAT(hr.in_am,'%H:%i'),'00:00') 'AM IN',
						IFNULL(TIME_FORMAT(hr.out_pm,'%H:%i'),'00:00') 'PM OUT',
						IFNULL(TIME_FORMAT(e.TimeStart_Empl,'%H:%i'),'00:00') 'SCHED IN',
						IFNULL(TIME_FORMAT(e.TimeEnd_Empl,'%H:%i'),'00:00') 'SCHED OUT',
						(SELECT OT_Hours FROM approved_ot ot WHERE ot.employee_number = hr.employee_number AND ot.dtr_date=hr.dtr_date LIMIT 1) 'OT',
						hr.dtr_date,
						CAST(DAYNAME(hr.dtr_date) AS CHAR(25)) 'dtr_dayName',
						e.Restday,
						hr.employee_number 'UserID',
						e.Name_Empl 'EmpName',
						r.Position_Empl 'Position',
						IF(e.rate_type="Daily",(e.BasicSalary_Empls*e.no_of_days),e.BasicSalary_Empls) 'BasicSalary',
						e.gp_sss_ee,
						e.gp_phealth_ee,
						e.gp_pagibig_ee,
						e.gp_wtax,
						e.transpo_allowance,
						e.mobile_allowance,
						e.osa_allowance,
						e.meal_allowance,
						e.no_of_days,
						e.rate_type,
						IF(e.rate_type="Daily",e.BasicSalary_Empls,(e.BasicSalary_Empls/e.no_of_days)) 'DailyRate',
						(SELECT COUNT(*) FROM hr_emp_attendance hr2 WHERE hr2.employee_number = hr.employee_number AND hr2.dtr_date BETWEEN _dateFrom AND _dateTo  AND !ISNULL(hr2.in_am) AND !ISNULL(hr2.out_pm)) 'DutyDays',
						e.DoleRate_Empl,
						e.SysPK_Empl 'id',
						hr.late,
						hr.undertime,
						hr.total_hours_worked,
						(SELECT SUM(ca.amount_deduction) FROM emp_cash_advance ca WHERE ca.emp_id = e.SysPK_Empl AND ((ca.date_from <= _dateTo) AND  (ca.date_to >= _dateTo))) 'CA',
						(SELECT SUM(sss.amount_deduction) FROM emp_sss_loan sss WHERE sss.emp_id = e.SysPK_Empl AND ((sss.date_from <= _dateTo) AND (sss.date_to >= _dateTo))) 'SSS_Loan',
						(SELECT SUM(pagibig.amount_deduction) FROM emp_pagibig_loan pagibig WHERE pagibig.emp_id = e.SysPK_Empl AND ((pagibig.date_from <= _dateTo) AND  (pagibig.date_to >= _dateTo))) 'PAGIBIG_Loan',
						(SELECT h.holiday_type FROM hr_holidays h WHERE h.holiday_date = hr.dtr_date) AS 'holiday_checker',
						(SELECT COUNT(*) FROM hr_holidays h WHERE h.holiday_date BETWEEN _dateFrom AND _dateTo ) AS 'holiday_cnt',
						(SELECT COUNT(h.holiday_date) FROM hr_holidays h,hr_emp_attendance hhr WHERE h.holiday_date = hhr.dtr_date AND hhr.employee_number = hr.employee_number) AS 'holiday_cnt_minus',
						(SELECT SUM(IF(ISNULL(l.no_of_days),0,l.no_of_days)) FROM `leaves` l WHERE e.SysPK_Empl = l.emp_id AND l.is_approved = 1 AND ((l.leave_date_from BETWEEN _dateFrom AND _dateTo) OR (l.leave_date_to BETWEEN _dateFrom AND _dateTo))) AS 'leave_days',
						(SELECT SUM(IF(ISNULL(l.total_hours),0,l.total_hours)) FROM `leaves` l WHERE e.SysPK_Empl = l.emp_id AND l.is_approved = 1 AND ((l.leave_date_from BETWEEN _dateFrom AND _dateTo) OR (l.leave_date_to BETWEEN _dateFrom AND _dateTo))) AS 'leave_hours'
					FROM 
						hr_emp_attendance hr,
						employees e,
						employees_rate r
					WHERE 
						e.UserID_Empl = hr.employee_number AND 
						e.Position_Empl = r.id AND 
						e.dept_id = _deparment AND 
						hr.dtr_date BETWEEN _dateFrom AND _dateTo
					ORDER BY e.UserID_Empl
					
					) a
				)b
			) c GROUP BY c.UserID ORDER BY c.UserID
		)d
	)e
ORDER BY e.UserID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `display_taxdue_yearly` */

/*!50003 DROP PROCEDURE IF EXISTS  `display_taxdue_yearly` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `display_taxdue_yearly`(
	in yr int
    )
BEGIN
SELECT
	f.emp_id,
	f.Employee,
	f.BasicPay,
	f.TotalGross,
	f.Bonus,
	f.13thmonth,
	f.TotalGrossSalary,
	f.NetBasicPay,
	f.sss,
	f.philhealth,
	f.pag_ibig,
	f.13thmonth_er,
	f.Deminimis,
	f.GovMandated,
	f.TotalNonTaxable,
	f.GrossTaxable,
	f.TaxableBasicSalary,
	f.13thmonth_er2,
	f.NetTaxableIncome,
	f.TaxDue,
	f.WithholdingTax,
	(f.TaxDue - f.WithholdingTax) 'TaxRefund',
	f.AmountRate,
	f.AmountPercentage,
	f.ExcessOver,
	f.Category
FROM	
	(
	SELECT
		e.emp_id,
		e.Employee,
		e.BasicPay,
		e.TotalGross,
		e.Bonus,
		e.13thmonth,
		e.TotalGrossSalary,
		e.NetBasicPay,
		e.sss,
		e.philhealth,
		e.pag_ibig,
		e.13thmonth_er,
		e.Deminimis,
		e.GovMandated,
		e.TotalNonTaxable,
		e.GrossTaxable,
		e.TaxableBasicSalary,
		e.13thmonth_er2,
		e.NetTaxableIncome,
		IF( ISNULL(e.AmountRate),
			0, 
			IF(	e.AmountRate=0 AND e.AmountPercentage=0,
				0, 
				( e.AmountRate + ((e.NetTaxableIncome - e.ExcessOver) * e.AmountPercentage) )
			) 
		) 'TaxDue',
		e.WithholdingTax,
		e.AmountRate,
		e.AmountPercentage,
		e.ExcessOver,
		e.Category
	FROM	
		(
		SELECT
			d.emp_id,
			d.Employee,
			d.BasicPay,
			d.TotalGross,
			d.Bonus,
			d.13thmonth,
			d.TotalGrossSalary,
			d.NetBasicPay,
			d.sss,
			d.philhealth,
			d.pag_ibig,
			d.13thmonth_er,
			d.Deminimis,
			d.GovMandated,
			d.TotalNonTaxable,
			d.GrossTaxable,
			d.TaxableBasicSalary,
			d.13thmonth_er2,
			d.NetTaxableIncome,
			(SELECT a.amount_rate FROM tax_due_formula_2018 a WHERE d.NetTaxableIncome BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountRate',
			(SELECT a.additional_percentage FROM tax_due_formula_2018 a WHERE d.NetTaxableIncome BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountPercentage',
			(SELECT a.excess_over FROM tax_due_formula_2018 a WHERE d.NetTaxableIncome BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'ExcessOver',
			(SELECT a.description FROM tax_due_formula_2018 a WHERE d.NetTaxableIncome BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'Category',
			d.WithholdingTax
		FROM	
			(	
			SELECT
				c.emp_id,
				c.Employee,
				c.BasicPay,
				c.TotalGross,
				c.Bonus,
				c.13thmonth,
				c.TotalGrossSalary,
				c.NetBasicPay,
				c.sss,
				c.philhealth,
				c.pag_ibig,
				c.13thmonth_er,
				c.Deminimis,
				c.GovMandated,
				c.TotalNonTaxable,
				(c.TotalGrossSalary - c.TotalNonTaxable) 'GrossTaxable',
				(c.NetBasicPay - c.GovMandated) 'TaxableBasicSalary',
				c.13thmonth_er2,
				(
					(c.NetBasicPay - c.GovMandated)
					+
					c.13thmonth_er2
				) 'NetTaxableIncome',
				c.WithholdingTax
				
			FROM
				(
				SELECT
					b.emp_id,
					b.Employee,
					b.BasicPay,
					b.TotalGross,
					b.Bonus,
					b.13thmonth,
					b.TotalGrossSalary,
					b.NetBasicPay,
					b.sss,
					b.philhealth,
					b.pag_ibig,
					b.13thmonth_er,
					b.Deminimis,
					b.GovMandated,
					(b.13thmonth_er + b.Deminimis + b.GovMandated) 'TotalNonTaxable',
					b.13thmonth_er2,
					b.WithholdingTax
				FROM	
					(
					SELECT
						a.emp_id,
						a.Employee,
						a.BasicPay,
						a.TotalGross,
						a.Bonus,
						a.13thmonth,
						(a.TotalGross + a.Bonus + a.13thmonth) 'TotalGrossSalary',
						(a.TotalGross - a.Deminimis) 'NetBasicPay',
						a.sss,
						a.philhealth,
						a.pag_ibig,
						IF(a.13thmonthTotal < 90000,a.13thmonthTotal,90000) '13thmonth_er',
						IF(a.13thmonthTotal < 90000,0,(a.13thmonthTotal-90000)) '13thmonth_er2',
						a.Deminimis,
						(a.sss + a.philhealth + a.pag_ibig) 'GovMandated',
						a.WithholdingTax
						
					FROM
						(
							SELECT 
								pp.emp_id,
								pp.emp_name AS 'Employee',
								pp.basic_pay AS 'BasicPay',
								SUM(pp.gross_pay) AS 'TotalGross',
								(SELECT a.bonus FROM payroll_13th_month a WHERE a.emp_id = pp.emp_id AND a.year = yr LIMIT 1) AS 'Bonus',
								(SELECT a.amount FROM payroll_13th_month a WHERE a.emp_id = pp.emp_id AND a.year = yr  LIMIT 1) AS '13thmonth',
								(SELECT a.total FROM payroll_13th_month a WHERE a.emp_id = pp.emp_id AND a.year = yr  LIMIT 1) AS '13thmonthTotal',
								SUM(pp.deminis_benefits) AS 'Deminimis',
								SUM(pp.sss) AS 'sss',
								SUM(pp.philhealth) AS 'philhealth',
								SUM(pp.pag_ibig) AS 'pag_ibig',
								SUM(pp.wtax) AS 'WithholdingTax'
												
							FROM 
								payroll p,
								payroll_detail_2 pp
							WHERE
								p.payroll_id = pp.payroll_id AND
								YEAR(p.date_to) = yr 
							GROUP BY pp.emp_name
							ORDER BY pp.emp_id
						)a
					)b
				)c
			)d
		)e
	)f;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_alpha_list_1604CF_7_5` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_alpha_list_1604CF_7_5` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_alpha_list_1604CF_7_5`()
BEGIN
	SELECT 
		e.TIN_Empl AS 'tinNumber',
		'' AS 'branchCode',
		e.LastName_Empl AS 'lastName',
		e.FirstName_Empl AS 'firstName',
		e.MiddleName_Empl AS 'middleName',
		e.Address_Empl AS 'address',
		'' AS 'zipcode',
		e.BirthDate_Empl AS 'birthday',
		e.contact_no AS 'telNumber',
		'VII' AS 'region',
		313 AS 'noOfDays',
		386 AS 'minimumDaily',
		/*IF(YEAR(e.DateHired_Empl)!=YEAR(CURDATE()),CONCAT(YEAR(CURDATE()),'-01-01'),e.DateHired_Empl) AS 'empFrom',*/
		IF(YEAR(e.DateHired_Empl)!=2019,'01/01/2019',e.DateHired_Empl) AS 'empFrom',
		'12/31/2019' AS 'empTo',
		'' AS 'prev_basicWage',
		'' AS 'prev_holidayPay',
		'' AS 'prev_overtimePay',
		'' AS 'prev_nightDiff',
		'' AS 'prev_hazardPay',
		'' AS 'prev_13th_others',
		'' AS 'prev_deMinimis',
		'' AS 'prev_SSS_HDMF_Philhealth_Dues',
		'' AS 'prev_salariesOthers',
		'' AS 'prev_totalNonTaxable',
		'' AS 'prev_taxableBasicWage',
		'' AS 'prev_taxable13th_others',
		'' AS 'prev_taxableSalariesOthers',
		'' AS 'prev_totalTaxable',
		'' AS 'prev_grossIncome',
		'' AS 'pres_basicWage',
		'' AS 'pres_holidayPay',
		'' AS 'pres_overtimePay',
		'' AS 'pres_nightDiff',
		'' AS 'pres_hazardPay',
		'' AS 'pres_13th_others',
		'' AS 'pres_deMinimis',
		'' AS 'pres_SSS_HDMF_Philhealth_Dues',
		'' AS 'pres_salariesOthers',
		'' AS 'pres_totalNonTaxable',
		'' AS 'pres_taxableBasicWage',
		'' AS 'pres_taxable13th_others',
		'' AS 'pres_taxableSalariesOthers',
		'' AS 'pres_totalTaxable',
		'' AS 'pres_grossIncome',
		'' AS 'totalTaxable',
		'' AS 'premiumPaidonHealth',
		'' AS 'netTaxableIncome',
		'' AS 'taxDue',
		'' AS 'prev_taxPaid',
		'' AS 'taxPaidDecember',
		'' AS 'taxRefunded',
		'' AS 'taxWithheldAjusted'
	FROM 
		employees e;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_app_count` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_app_count` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_app_count`()
BEGIN
        SELECT COUNT(*) AS "app_count"
	FROM applicants
	WHERE STATUS = '0';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_civil_status` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_civil_status` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_civil_status`()
BEGIN
	SELECT 
		(SELECT COUNT(SysPK_Empl) FROM employees WHERE civilStatus = "Single") AS 'Single',
		(SELECT COUNT(SysPK_Empl) FROM employees WHERE civilStatus = "Married") AS 'Married',
		(SELECT COUNT(SysPK_Empl) FROM employees WHERE civilStatus = "Widower") AS 'Widower';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_dtr` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_dtr` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dtr`(
	IN from_date DATE,
	IN to_date DATE
    )
BEGIN
 
SELECT
	b.emp_id,
	b.employee_fullName AS 'emp_name',
	DATE_FORMAT(b.dtr_date,'%m-%d-%Y') AS 'dtr_date',
	DATE_FORMAT(b.in_am,'%H:%i') AS 'in_am',
	DATE_FORMAT(b.out_pm,'%H:%i') AS 'out_pm',
	IF( (DAYOFWEEK(b.dtr_date) = 1)  , 0 , b.total_hours_worked) AS 'normal_hour',
	IF(b.absent=0,1,0) AS 'normal_day',
	IF( (DAYOFWEEK(b.dtr_date) = 1) , 0 , b.ot) AS 'normal_ot',
	0 AS 'holiday_hour',
	0 AS 'holiday_ot',
	IF( (DAYOFWEEK(b.dtr_date) = 1)  , b.total_hours_worked , 0) AS 'sunday_hour',
	IF( (DAYOFWEEK(b.dtr_date) = 1), b.ot , 0) AS 'sunday_ot',
	0 AS 'leave',
	b.late,
	b.undertime,
	b.absent,
	0 AS 'night_sunday',
	0 AS 'night_special',
	0 AS 'night_regular',
	b.employee_number,
	b.sched_in,
	b.sched_out,
	b.np_hours,
	b.ot_hours,
	b.att_remarks,
	b.total_hours_worked
FROM
	(SELECT
		a.emp_id,
		a.employee_fullName,
		a.dtr_date,
		a.in_am,
		a.out_pm,
		FORMAT(a.late,2) 'late',
		FORMAT(a.undertime,2) 'undertime',
		FORMAT(a.total_hours_worked,2) 'total_hours_worked',
		IF(ISNULL(a.ot),0,a.ot) AS 'ot',
		IF(ISNULL(a.absent),0,a.absent) AS 'absent',
		a.employee_number,
		date_format( if( isnull(a.sched_in) , a.sched_time_in , a.sched_in ),'%H:%i' ) as 'sched_in',
		DATE_FORMAT( IF( ISNULL(a.sched_out) , a.sched_time_out , a.sched_out ) ,'%H:%i' ) AS 'sched_out',
		a.np_hours,
		a.ot_hours,
		IF(ISNULL(a.att_remarks),"",a.att_remarks) AS 'att_remarks'
	FROM
		(SELECT 
			e.SysPK_Empl AS 'emp_id',
			a.employee_fullName,
			a.dtr_date,
			a.in_am,
			a.out_pm,
			late,
			undertime,
			total_hours_worked,
			(SELECT OT_Hours FROM approved_ot o WHERE o.employee_id = e.SysPK_Empl AND o.dtr_date = a.dtr_date) ot,
			IF(a.att_remarks="absent",8,0) AS 'absent',
			a.employee_number,
			a.sched_time_in,
			a.sched_time_out,
			(SELECT s.time_from FROM shift_monitoring s WHERE (s.date_from <= a.dtr_date AND s.date_to >= a.dtr_date) AND s.emp_id=a.employee_number LIMIT 1 ) as 'sched_in',
			(SELECT s.time_to FROM shift_monitoring s WHERE (s.date_from <= a.dtr_date AND s.date_to >= a.dtr_date) AND s.emp_id=a.employee_number LIMIT 1) AS 'sched_out',
			a.np_hours,
			a.ot_hours,
			a.att_remarks
			
		FROM hr_emp_attendance a,
			employees e
		WHERE 
			a.employee_number = e.UserID_Empl AND 
			a.dtr_date BETWEEN from_date AND to_date
		) a
	)b;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_dtr_byDepartment` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_dtr_byDepartment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dtr_byDepartment`(
	IN dept_id VARCHAR(255),
	IN from_date DATE,
	IN to_date DATE
    )
BEGIN
 
SELECT
	b.emp_id,
	b.employee_fullName AS 'emp_name',
	DATE_FORMAT(b.dtr_date,'%m-%d-%Y') AS 'dtr_date',
	DATE_FORMAT(b.in_am,'%H:%i') AS 'in_am',
	DATE_FORMAT(b.out_pm,'%H:%i') AS 'out_pm',
	IF( (DAYOFWEEK(b.dtr_date) = 1)  , 0 , b.total_hours_worked) AS 'normal_hour',
	IF(b.absent=0,1,0) AS 'normal_day',
	IF( (DAYOFWEEK(b.dtr_date) = 1) , 0 , b.ot) AS 'normal_ot',
	0 AS 'holiday_hour',
	0 AS 'holiday_ot',
	IF( (DAYOFWEEK(b.dtr_date) = 1)  , b.total_hours_worked , 0) AS 'sunday_hour',
	IF( (DAYOFWEEK(b.dtr_date) = 1), b.ot , 0) AS 'sunday_ot',
	0 AS 'leave',
	b.late,
	b.undertime,
	b.absent,
	0 AS 'night_sunday',
	0 AS 'night_special',
	0 AS 'night_regular',
	b.employee_number,
	b.sched_in,
	b.sched_out,
	b.np_hours,
	b.ot_hours,
	b.att_remarks,
	b.total_hours_worked
FROM
	(SELECT
		a.emp_id,
		a.employee_fullName,
		a.dtr_date,
		a.in_am,
		a.out_pm,
		FORMAT(a.late,2) 'late',
		FORMAT(a.undertime,2) 'undertime',
		FORMAT(a.total_hours_worked,2) 'total_hours_worked',
		IF(ISNULL(a.ot),0,a.ot) AS 'ot',
		IF(ISNULL(a.absent),0,a.absent) AS 'absent',
		a.employee_number,
		date_format( if( isnull(a.sched_in) , a.sched_time_in , a.sched_in ),'%H:%i' ) as 'sched_in',
		DATE_FORMAT( IF( ISNULL(a.sched_out) , a.sched_time_out , a.sched_out ) ,'%H:%i' ) AS 'sched_out',
		a.np_hours,
		a.ot_hours,
		IF(ISNULL(a.att_remarks),"",a.att_remarks) AS 'att_remarks'
	FROM
		(SELECT 
			e.SysPK_Empl AS 'emp_id',
			a.employee_fullName,
			a.dtr_date,
			a.in_am,
			a.out_pm,
			late,
			undertime,
			total_hours_worked,
			(SELECT OT_Hours FROM approved_ot o WHERE o.employee_id = e.SysPK_Empl AND o.dtr_date = a.dtr_date) ot,
			IF(a.att_remarks="absent",8,0) AS 'absent',
			a.employee_number,
			a.sched_time_in,
			a.sched_time_out,
			(SELECT s.time_from FROM shift_monitoring s WHERE (s.date_from <= a.dtr_date AND s.date_to >= a.dtr_date) AND s.emp_id=a.employee_number LIMIT 1 ) as 'sched_in',
			(SELECT s.time_to FROM shift_monitoring s WHERE (s.date_from <= a.dtr_date AND s.date_to >= a.dtr_date) AND s.emp_id=a.employee_number LIMIT 1) AS 'sched_out',
			a.np_hours,
			a.ot_hours,
			a.att_remarks
			
		FROM hr_emp_attendance a,
			employees e
		WHERE 
			a.employee_number = e.UserID_Empl AND 
			e.dept_id = dept_id AND
			a.dtr_date BETWEEN from_date AND to_date
		) a
	)b;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_emp_late` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_emp_late` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_emp_late`()
BEGIN
SELECT 
	d.dummy_date,
	employee_number,
	employee_fullName,
	dtr_date,
	in_am,
	out_pm,
	IF(ISNULL((SELECT h.holiday_type FROM hr_holidays h WHERE h.holiday_date = d.dummy_date LIMIT 1)),0,1) AS 'holiday'
FROM 
	hr_emp_attendance a
		RIGHT OUTER JOIN dummy_date d
		ON (d.dummy_date=a.dtr_date AND dtr_date BETWEEN '2019-08-01' AND '2019-08-15' AND employee_number = '03-001' );
	
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_emp_taxdue_yearly` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_emp_taxdue_yearly` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_emp_taxdue_yearly`(
	in yr int
    )
BEGIN
	SELECT
		e.Employee,
		format(e.BasicPay,2) as 'BasicPay',
		format(e.OTPay,2) as 'OTPay',
		FORMAT(e.HolidayPay,2) AS 'HolidayPay',
		FORMAT(e.HolidayOTPay,2) AS 'HolidayOTPay',
		FORMAT(e.SundayPay,2) AS 'SundayPay',
		FORMAT(e.SundayOTPay,2) AS 'SundayOTPay',
		FORMAT(e.NPPay,2) AS 'NPPay',
		FORMAT(e.NPHolidayPay,2) AS 'NPHolidayPay',
		FORMAT(e.NPSpecialPay,2) AS 'NPSpecialPay',
		format(e.13thMonthPay,2) as 'Month13thPay',
		format(e.NonTaxableAllowance,2) as 'NonTaxableAllowance',
		format(e.sss,2) as 'sss',
		format(e.philhealth,2) as 'philhealth',
		format(e.pag_ibig,2) as 'pag_ibig',
		format(e.GrossTaxableCompensation,2) as 'GrossTaxableCompensation',
		format(e.WithholdingTax,2) as 'WithholdingTax',
		e.dependent,
		format(e.PersonalExeption,2) as 'PersonalExeption',
		format(e.DependentExeption,2) as 'DependentExeption',
		format(e.NetTaxableCompensation,2) as 'NetTaxableCompensation',
		format(e.AmountRate,2) as 'AmountRate',
		e.AmountPercentage,
		format(e.ExcessOver,2) as 'ExcessOver',
		FORMAT(e.TaxDue,2) 'TaxDue',
		FORMAT(IF((e.TaxDue - e.WithholdingTax)  > e.WithholdingTax,(e.TaxDue - e.WithholdingTax),0),2) 'TaxPayable',
		format(IF((e.TaxDue - e.WithholdingTax)  < e.WithholdingTax,(e.TaxDue - e.WithholdingTax),0),2) 'TaxRefund',
		e.Category
	FROM
		(SELECT
			d.Employee,
			d.BasicPay,
			d.OTPay,
			d.NonTaxableAllowance,
			d.sss,
			d.philhealth,
			d.pag_ibig,
			d.GrossTaxableCompensation,
			d.WithholdingTax,
			d.dependent,
			d.13thMonthPay,
			d.PersonalExeption,
			d.DependentExeption,
			d.NetTaxableCompensation,
			d.AmountRate,
			d.AmountPercentage,
			d.ExcessOver,
			IF(ISNULL(d.AmountRate),1,0) 'TaxableChecker',
			IF( ISNULL(d.AmountRate),
				0, 
					IF(	d.AmountRate=0 AND d.AmountPercentage=0,
						0, 
						( d.AmountRate + ((d.NetTaxableCompensation - d.ExcessOver) * d.AmountPercentage) )
					) 
				) 'TaxDue',
			d.Category,
			d.HolidayPay,
			d.HolidayOTPay,
			d.SundayPay,
			d.SundayOTPay,
			d.NPPay,
			d.NPHolidayPay,
			d.NPSpecialPay
			
		FROM	
			(SELECT
				c.Employee,
				c.BasicPay,
				c.OTPay,
				c.NonTaxableAllowance,
				c.sss,
				c.philhealth,
				c.pag_ibig,
				c.GrossTaxableCompensation,
				c.WithholdingTax,
				c.dependent,
				c.13thMonthPay,
				c.PersonalExeption,
				c.DependentExeption,
				c.NetTaxableCompensation,
				(SELECT a.amount_rate FROM tax_due_formula_2018 a WHERE c.NetTaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountRate',
				(SELECT a.additional_percentage FROM tax_due_formula_2018 a WHERE c.NetTaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountPercentage',
				(SELECT a.excess_over FROM tax_due_formula_2018 a WHERE c.NetTaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'ExcessOver',
				(SELECT a.description FROM tax_due_formula_2018 a WHERE c.NetTaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'Category',
				c.HolidayPay,
				c.HolidayOTPay,
				c.SundayPay,
				c.SundayOTPay,
				c.NPPay,
				c.NPHolidayPay,
				c.NPSpecialPay
			FROM	
				(SELECT
					b.Employee,
					b.BasicPay,
					b.OTPay,
					b.NonTaxableAllowance,
					b.sss,
					b.philhealth,
					b.pag_ibig,
					b.GrossTaxableCompensation,
					b.WithholdingTax,
					b.dependent,
					b.13thMonthPay,
					b.PersonalExeption,
					b.DependentExeption,
					((b.GrossTaxableCompensation) - (b.PersonalExeption + b.DependentExeption)) AS 'NetTaxableCompensation',
					b.HolidayPay,
					b.HolidayOTPay,
					b.SundayPay,
					b.SundayOTPay,
					b.NPPay,
					b.NPHolidayPay,
					b.NPSpecialPay
				FROM
					(SELECT
						a.Employee,
						a.BasicPay,
						a.OTPay,
						a.NonTaxableAllowance,
						a.sss,
						a.philhealth,
						a.pag_ibig,
						a.WithholdingTax,
						( 	
							(	a.BasicPay + a.OTPay + a.HolidayPay + a.HolidayOTPay 
								+ a.SundayPay + SundayOTPay
								+ a.NPPay + a.NPHolidayPay + a.NPSpecialPay
								+ if(isnull(a.13thMonthPay),0,a.13thMonthPay)
							) 
							
							- 
							 (a.sss + a.philhealth + a.pag_ibig)
							-
							(a.LateDeduction)
							-
							(a.NonTaxableAllowance)
							-
							(a.OtherAllowance)
						) 'GrossTaxableCompensation',
						IF(ISNULL(a.dependent),0,a.dependent) 'dependent',
						if(isnull(a.13thMonthPay),0,a.13thMonthPay) '13thMonthPay',
						a.PersonalExeption,
						0 'DependentExeption',
						a.HolidayPay,
						a.HolidayOTPay,
						a.SundayPay,
						a.SundayOTPay,
						a.NPPay,
						a.NPHolidayPay,
						a.NPSpecialPay
					FROM
						(SELECT 
							pp.emp_name AS 'Employee',
							SUM(pp.basic_pay) AS 'BasicPay',
							SUM(pp.ot_pay) AS 'OTPay',
							SUM(pp.holiday_pay) AS 'HolidayPay',
							SUM(pp.holiday_ot_pay) AS 'HolidayOTPay',
							SUM(pp.sunday_special_pay) AS 'SundayPay',
							SUM(pp.sunday_special_ot_pay) AS 'SundayOTPay',
							SUM(pp.night_premium_pay) AS 'NPPay',
							SUM(pp.night_premium_holiday_pay) AS 'NPHolidayPay',
							SUM(pp.night_premium_sunday_pay) AS 'NPSpecialPay',
							SUM(pp.deminis_benefits) AS 'NonTaxableAllowance',
							SUM(pp.communication_allowance) AS 'CommunicationAllowance',
							SUM(pp.adjustments) AS 'OtherAllowance',
							SUM(pp.late_deduction) AS 'LateDeduction',
							SUM(pp.sss) AS 'sss',
							SUM(pp.philhealth) AS 'philhealth',
							SUM(pp.pag_ibig) AS 'pag_ibig',
							SUM(pp.wtax) AS 'WithholdingTax',
							(SELECT e.dependent FROM employees e WHERE e.SysPK_Empl = pp.emp_id) AS 'dependent',
							(select a.total from payroll_13th_month a where a.emp_id = pp.emp_id and a.year = yr limit 1) AS '13thMonthPay',
							0 AS 'PersonalExeption',
							0 AS 'DependentExeption'
							
						FROM 
							payroll p,
							payroll_detail_2 pp
						WHERE
							p.payroll_id = pp.payroll_id AND
							YEAR(p.date_to) = yr
						GROUP BY pp.emp_name
						ORDER BY pp.emp_name
						)a
					)b
				)c
			)d
		)e;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_manpower` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_manpower` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_manpower`()
BEGIN
	SELECT 
		d.Name_Dept as "department",
		p.Position_Empl as "position",
		(SELECT COUNT(*) FROM employees ee WHERE ee.Status_Empl = "REGULAR" AND ee.Position_Empl = p.id) AS 'Regular',
		(SELECT COUNT(*) FROM employees ee WHERE ee.Status_Empl = "PROBATIONARY" AND ee.Position_Empl = p.id) AS 'Probationary'
	FROM
		employees e,
		department d,
		employees_rate p
	WHERE
		-- e.dept_id = d.SysPK_Dept AND
		e.Position_Empl = p.id
	GROUP BY p.Position_Empl
	ORDER BY d.DeptCode_Dept;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_payroll` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_payroll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_payroll`(
	IN _dateFrom DATE,
	IN _dateTo DATE
    )
BEGIN
SELECT
	j.id,
	j.UserID,
	j.AccountNo AS 'AccountNo',
	j.EmployeeName AS 'EmployeeName',
	j.Dept AS 'Dept',
	j.DailyRate AS 'DailyRate',
	j.MonthlyRate AS 'MonthlyRate',
	j.SemiMonthlyRate AS 'SemiMonthlyRate',
	j.HourlyRate AS 'HourlyRate',
	j.MinRate AS 'MinRate',
	j.RegOTRate AS 'RegOTRate',
	j.HolidayRate AS 'HolidayRate',
	j.SunOtRate AS 'SunOtRate',
	j.NPRate AS 'NPRate',
	j.StandardHour AS 'StandardHour',
	j.AbsentHour AS 'AbsentHour',
	j.UTHour AS 'UTHour',
	j.SL_VL AS 'SL_VL',
	j.ActualHour AS 'ActualHour',
	j.LateMin AS 'LateMin',
	j.RegOTHour AS 'RegOTHour',
	j.SpclHour AS 'SpclHour',
	j.SpclOTHour AS 'SpclOTHour',
	j.HolidayHour AS 'HolidayHour',
	j.HolidayOTHour AS 'HolidayOTHour',
	j.RegularNP AS 'RegularNP',
	j.HolidayNP AS 'HolidayNP',
	j.SunNP AS 'SunNP',
	j.PaternityLeave AS 'PaternityLeave',
	j.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
	j.TotalManHour AS 'TotalManHour',
	j.RiceAllowance AS 'RiceAllowance',
	j.ClothingAllowance AS 'ClothingAllowance',
	j.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
	j.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
	j.MedicalAssistance AS 'MedicalAssistance',
	j.LaundryAllowance AS 'LaundryAllowance',
	j.Deminimis AS 'Deminimis',
	j.COLA AS 'COLA',
	j.CommunicationAllowance AS 'CommunicationAllowance',
	j.BasicPay AS 'BasicPay',
	j.RegOTPay AS 'RegOTPay',
	j.SunPay AS 'SunPay',
	j.SunOTPay AS 'SunOTPay',
	j.HolidayPay AS 'HolidayPay',
	j.HolidayOTPay AS 'HolidayOTPay',
	j.NPPay AS 'NPPay',
	j.HolidayNPPay AS 'HolidayNPPay',
	j.SunNPPay AS 'SunNPPay',
	j.PaternityLeavePay AS 'PaternityLeavePay',
	j.SILPay AS 'SILPay',
	j.AdditionalAdjustment AS 'AdditionalAdjustment',
	j.LateDeduction AS 'LateDeduction',
	j.GrossPay AS 'GrossPay',
	j.TaxableCompensation AS 'TaxableCompensation',
	j.SSS AS 'SSS',
	j.PHILHEALTH AS 'PhilHealth',
	j.PAGIBIG AS 'PAGIBIG',
	j.WTax AS 'WTax',
	j.UnderWithheld AS 'UnderWithheld',
	j.OtherDeductions AS 'OtherDeductions',
	j.TotalTax AS 'TotalTax',
	j.SSSLOAN AS 'SSSLoan',
	j.PAGIBIGLOAN 'PAGIBIGLoan',
	j.DeductionAdjustment AS 'DeductionAdjustment',
	j.CA AS 'CA',
	(j.TotalDeductions - j.WTax) AS 'TotalDeductions',
	(j.NetPay - j.WTax ) AS 'NetPay',
	(j.NetPay2 - j.WTax) AS 'NetPay2',
	j.Extra AS 'Extra',
	j.SSSER AS 'SSSER',
	j.PhilHealthER AS 'PhilHealthER',
	j.PAGIBIGER AS 'PAGIBIGER',
	j.WtaxER AS 'WtaxER',
	j.TotalER AS 'TotalER',
	j.bonus,
	j.canteen,
	j.coop,
	j.other_Loan,
	j.LastName,
	j.FirstName,
	j.MiddleName,
	j.UTDeduction,
	j.AbsentDeduction,
	j.dept_id
FROM
	(SELECT
		i.id,
		i.UserID,
		i.AccountNo AS 'AccountNo',
		i.EmployeeName AS 'EmployeeName',
		i.Dept AS 'Dept',
		i.DailyRate AS 'DailyRate',
		i.MonthlyRate AS 'MonthlyRate',
		i.SemiMonthlyRate AS 'SemiMonthlyRate',
		i.HourlyRate AS 'HourlyRate',
		i.MinRate AS 'MinRate',
		i.RegOTRate AS 'RegOTRate',
		i.HolidayRate AS 'HolidayRate',
		i.SunOtRate AS 'SunOtRate',
		i.NPRate AS 'NPRate',
		i.StandardHour AS 'StandardHour',
		i.AbsentHour AS 'AbsentHour',
		i.UTHour AS 'UTHour',
		i.SL_VL AS 'SL_VL',
		i.ActualHour AS 'ActualHour',
		i.LateMin AS 'LateMin',
		i.RegOTHour AS 'RegOTHour',
		i.SpclHour AS 'SpclHour',
		i.SpclOTHour AS 'SpclOTHour',
		i.HolidayHour AS 'HolidayHour',
		i.HolidayOTHour AS 'HolidayOTHour',
		i.RegularNP AS 'RegularNP',
		i.HolidayNP AS 'HolidayNP',
		i.SunNP AS 'SunNP',
		i.PaternityLeave AS 'PaternityLeave',
		i.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
		i.TotalManHour AS 'TotalManHour',
		i.RiceAllowance AS 'RiceAllowance',
		i.ClothingAllowance AS 'ClothingAllowance',
		i.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
		i.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
		i.MedicalAssistance AS 'MedicalAssistance',
		i.LaundryAllowance AS 'LaundryAllowance',
		i.Deminimis AS 'Deminimis',
		i.COLA AS 'COLA',
		i.CommunicationAllowance AS 'CommunicationAllowance',
		i.BasicPay AS 'BasicPay',
		i.RegOTPay AS 'RegOTPay',
		i.SunPay AS 'SunPay',
		i.SunOTPay AS 'SunOTPay',
		i.HolidayPay AS 'HolidayPay',
		i.HolidayOTPay AS 'HolidayOTPay',
		i.NPPay AS 'NPPay',
		i.HolidayNPPay AS 'HolidayNPPay',
		i.SunNPPay AS 'SunNPPay',
		i.PaternityLeavePay AS 'PaternityLeavePay',
		i.SILPay AS 'SILPay',
		i.AdditionalAdjustment AS 'AdditionalAdjustment',
		i.LateDeduction AS 'LateDeduction',
		i.GrossPay AS 'GrossPay',
		i.TaxableCompensation AS 'TaxableCompensation',
		i.SSS AS 'SSS',
		i.PHILHEALTH AS 'PhilHealth',
		i.PAGIBIG AS 'PAGIBIG',
		IF( ISNULL(i.AmountRate),0, 
			IF(	i.AmountRate=0 AND i.AmountPercentage=0,
				0, 
				IF(i.AmountRate=20416.67,
					( (i.AmountRate + ((i.TaxableCompensation - i.CompensationLevel) * i.AmountPercentage) ) + 5000 ),
					( i.AmountRate + ((i.TaxableCompensation - i.CompensationLevel) * i.AmountPercentage) ) 
				) 
			) 
		) AS 'WTax',
		i.UnderWithheld AS 'UnderWithheld',
		i.OtherDeductions AS 'OtherDeductions',
		i.TotalTax AS 'TotalTax',
		i.SSSLOAN AS 'SSSLoan',
		i.PAGIBIGLOAN 'PAGIBIGLoan',
		i.DeductionAdjustment AS 'DeductionAdjustment',
		i.CA AS 'CA',
		i.TotalDeductions AS 'TotalDeductions',
		i.NetPay AS 'NetPay',
		i.NetPay2 AS 'NetPay2',
		i.Extra AS 'Extra',
		i.SSSER AS 'SSSER',
		i.PhilHealthER AS 'PhilHealthER',
		i.PAGIBIGER AS 'PAGIBIGER',
		i.WtaxER AS 'WtaxER',
		i.TotalER AS 'TotalER',
		i.bonus,
		i.canteen,
		i.coop,
		i.other_Loan,
		i.LastName,
		i.FirstName,
		i.MiddleName,
		i.UTDeduction,
		i.AbsentDeduction,
		i.dept_id
	FROM
		(SELECT
			h.id,
			h.UserID,
			h.AccountNo AS 'AccountNo',
			h.EmployeeName AS 'EmployeeName',
			h.Dept AS 'Dept',
			h.DailyRate AS 'DailyRate',
			h.MonthlyRate AS 'MonthlyRate',
			h.SemiMonthlyRate AS 'SemiMonthlyRate',
			h.HourlyRate AS 'HourlyRate',
			h.MinRate AS 'MinRate',
			h.RegOTRate AS 'RegOTRate',
			h.HolidayRate AS 'HolidayRate',
			h.SunOtRate AS 'SunOtRate',
			h.NPRate AS 'NPRate',
			h.StandardHour AS 'StandardHour',
			h.AbsentHour AS 'AbsentHour',
			h.UTHour AS 'UTHour',
			h.SL_VL AS 'SL_VL',
			h.ActualHour AS 'ActualHour',
			h.LateMin AS 'LateMin',
			h.RegOTHour AS 'RegOTHour',
			h.SpclHour AS 'SpclHour',
			h.SpclOTHour AS 'SpclOTHour',
			h.HolidayHour AS 'HolidayHour',
			h.HolidayOTHour AS 'HolidayOTHour',
			h.RegularNP AS 'RegularNP',
			h.HolidayNP AS 'HolidayNP',
			h.SunNP AS 'SunNP',
			h.PaternityLeave AS 'PaternityLeave',
			h.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
			h.TotalManHour AS 'TotalManHour',
			h.RiceAllowance AS 'RiceAllowance',
			h.ClothingAllowance AS 'ClothingAllowance',
			h.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
			h.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
			h.MedicalAssistance AS 'MedicalAssistance',
			h.LaundryAllowance AS 'LaundryAllowance',
			h.Deminimis AS 'Deminimis',
			h.COLA AS 'COLA',
			h.CommunicationAllowance AS 'CommunicationAllowance',
			h.BasicPay AS 'BasicPay',
			h.RegOTPay AS 'RegOTPay',
			h.SunPay AS 'SunPay',
			h.SunOTPay AS 'SunOTPay',
			h.HolidayPay AS 'HolidayPay',
			h.HolidayOTPay AS 'HolidayOTPay',
			h.NPPay AS 'NPPay',
			h.HolidayNPPay AS 'HolidayNPPay',
			h.SunNPPay AS 'SunNPPay',
			h.PaternityLeavePay AS 'PaternityLeavePay',
			h.SILPay AS 'SILPay',
			h.AdditionalAdjustment AS 'AdditionalAdjustment',
			h.LateDeduction AS 'LateDeduction',
			h.GrossPay AS 'GrossPay',
			h.TaxableCompensation AS 'TaxableCompensation',
			h.SSS AS 'SSS',
			h.PHILHEALTH AS 'PhilHealth',
			h.PAGIBIG AS 'PAGIBIG',
			h.WTax AS 'WTax',
			h.UnderWithheld AS 'UnderWithheld',
			h.OtherDeductions AS 'OtherDeductions',
			h.TotalTax AS 'TotalTax',
			h.SSSLOAN AS 'SSSLoan',
			h.PAGIBIGLOAN 'PAGIBIGLoan',
			h.DeductionAdjustment AS 'DeductionAdjustment',
			h.CA AS 'CA',
			h.TotalDeductions AS 'TotalDeductions',
			h.NetPay AS 'NetPay',
			h.NetPay2 AS 'NetPay2',
			h.Extra AS 'Extra',
			h.SSSER AS 'SSSER',
			h.PhilHealthER AS 'PhilHealthER',
			h.PAGIBIGER AS 'PAGIBIGER',
			h.WtaxER AS 'WtaxER',
			h.TotalER AS 'TotalER',
			(SELECT a.amount_rate FROM wtax_formula a WHERE h.TaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountRate',
			(SELECT a.additional_percentage FROM wtax_formula a WHERE h.TaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'AmountPercentage',
			(SELECT a.compensation_level FROM wtax_formula a WHERE h.TaxableCompensation BETWEEN amnt_from AND amnt_to LIMIT 1) AS 'CompensationLevel',
			h.bonus,
			h.canteen,
			h.coop,
			h.other_Loan,
			h.LastName,
			h.FirstName,
			h.MiddleName,
			h.UTDeduction,
			h.AbsentDeduction,
			h.dept_id
		FROM	
			(SELECT
				g.id,
				g.UserID,
				g.AccountNo AS 'AccountNo',
				g.EmployeeName AS 'EmployeeName',
				g.Dept AS 'Dept',
				g.DailyRate AS 'DailyRate',
				g.MonthlyRate AS 'MonthlyRate',
				(g.MonthlyRate/2) AS 'SemiMonthlyRate',
				g.HourlyRate AS 'HourlyRate',
				g.MinRate AS 'MinRate',
				g.RegOTRate AS 'RegOTRate',
				g.HolidayRate AS 'HolidayRate',
				g.SunOtRate AS 'SunOtRate',
				g.NPRate AS 'NPRate',
				g.StandardHour AS 'StandardHour',
				g.AbsentHour AS 'AbsentHour',
				g.UTHour AS 'UTHour',
				'0' AS 'SL_VL',
				g.ActualHour AS 'ActualHour',
				g.LateMin AS 'LateMin',
				g.RegOTHour AS 'RegOTHour',
				g.SpclHour AS 'SpclHour',
				g.SpclOTHour AS 'SpclOTHour',
				g.HolidayHour AS 'HolidayHour',
				g.HolidayOTHour AS 'HolidayOTHour',
				g.RegularNP AS 'RegularNP',
				g.HolidayNP AS 'HolidayNP',
				g.SunNP AS 'SunNP',
				g.PaternityLeave AS 'PaternityLeave',
				g.ServiceIncentiveLeave AS 'ServiceIncentiveLeave',
				g.TotalManHour AS 'TotalManHour',
				g.RiceAllowance AS 'RiceAllowance',
				g.ClothingAllowance AS 'ClothingAllowance',
				g.MonetizedUnusedLeave AS 'MonetizedUnusedLeave',
				g.MedicalCashAllowanceDependent AS 'MedicalCashAllowanceDependent',
				g.MedicalAssistance AS 'MedicalAssistance',
				g.LaundryAllowance AS 'LaundryAllowance',
				g.Deminimis AS 'Deminimis',
				g.COLA AS 'COLA',
				g.CommunicationAllowance AS 'CommunicationAllowance',
				g.BasicPay AS 'BasicPay',
				g.RegOTPay AS 'RegOTPay',
				g.SunPay AS 'SunPay',
				g.SunOTPay AS 'SunOTPay',
				g.HolidayPay AS 'HolidayPay',
				g.HolidayOTPay AS 'HolidayOTPay',
				g.NPPay AS 'NPPay',
				g.HolidayNPPay AS 'HolidayNPPay',
				g.SunNPPay AS 'SunNPPay',
				g.PaternityLeavePay AS 'PaternityLeavePay',
				g.SILPay AS 'SILPay',
				g.AdditionalAdjustment AS 'AdditionalAdjustment',
				g.LateDeduction AS 'LateDeduction',
				g.GrossPay AS 'GrossPay',
				(
					(
						g.GrossPay - 
						(
							g.Deminimis + 
							g.COLA + 
							g.CommunicationAllowance +
							g.SSS +
							g.PHILHEALTH +
							g.PAGIBIG
						)
					)
				) AS 'TaxableCompensation',
				g.SSS AS 'SSS',
				g.PHILHEALTH AS 'PhilHealth',
				g.PAGIBIG AS 'PAGIBIG',
				g.WTax AS 'WTax',
				g.UnderWithheld AS 'UnderWithheld',
				g.OtherDeductions AS 'OtherDeductions',
				g.TotalTax AS 'TotalTax',
				g.SSSLOAN AS 'SSSLoan',
				g.PAGIBIGLOAN 'PAGIBIGLoan',
				g.DeductionAdjustment AS 'DeductionAdjustment',
				g.CA AS 'CA',
				g.TotalDeductions AS 'TotalDeductions',
				(g.GrossPay - g.TotalDeductions) + g.bonus AS 'NetPay',
				(g.GrossPay - g.TotalDeductions) + g.bonus  AS 'NetPay2',
				g.Extra AS 'Extra',
				g.SSSER AS 'SSSER',
				g.PhilHealthER AS 'PhilHealthER',
				g.PAGIBIGER AS 'PAGIBIGER',
				g.WtaxER AS 'WtaxER',
				g.TotalER AS 'TotalER',
				g.bonus,
				g.canteen,
				g.coop,
				g.other_Loan,
				g.LastName,
				g.FirstName,
				g.MiddleName,
				g.UTDeduction,
				g.AbsentDeduction,
				g.dept_id
			FROM
				(SELECT
					f.id,
					f.UserID,
					f.AccountNo_Empl AS 'AccountNo',
					f.EmpName AS 'EmployeeName',
					f.Department_Empl AS 'Dept',
					f.DailyRate AS 'DailyRate',
					f.BasicSalary AS 'MonthlyRate',
					(f.BasicSalary/2) AS 'SemiMonthlyRate',
					f.HourlyRate AS 'HourlyRate',
					f.MinRate AS 'MinRate',
					f.OTRate AS 'RegOTRate',
					f.HolidayRate AS 'HolidayRate',
					f.SpecialRate AS 'SunOtRate',
					f.NPRate AS 'NPRate',
					f.StandardHour AS 'StandardHour',
					f.AbsentHour AS 'AbsentHour',
					f.TotalUT AS 'UTHour',
					'0' AS 'SL/VL',
					/*Standar Hour - Absent Hour - Service Incentive Leave */
					f.ActualHour AS 'ActualHour',
					f.TotalLate AS 'LateMin',
					f.TotalOT AS 'RegOTHour',
					f.SpclHour AS 'SpclHour',
					f.SpclOTHour AS 'SpclOTHour',
					f.HolidayHour AS 'HolidayHour',
					f.HolidayOTHour AS 'HolidayOTHour',
					f.np_hours AS 'RegularNP',
					f.HolidayNP AS 'HolidayNP',
					f.SunNP AS 'SunNP',
					f.PaternityLeave AS 'PaternityLeave',
					f.leave_hours AS 'ServiceIncentiveLeave',
					/*ActualHour + RegOTHour + SpclHour */
					( (f.ActualHour + f.TotalOT + f.SpclHour + f.SpclOTHour + f.HolidayHour + f.HolidayOTHour) - (f.TotalLate / 60) ) AS 'TotalManHour',
					f.meal_allowance AS 'RiceAllowance',
					f.cloathing_allowance AS 'ClothingAllowance',
					'0' AS 'MonetizedUnusedLeave',
					f.medical_allowance_dependent AS 'MedicalCashAllowanceDependent',
					'0' AS 'MedicalAssistance',
					f.laundry_allowance AS 'LaundryAllowance',
					(f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance) AS 'Deminimis',
					f.COLA AS 'COLA',
					f.mobile_allowance AS 'CommunicationAllowance',
					( IF(f.rate_type="Monthly",(f.BasicSalary/2),(f.HourlyRate * f.ActualHour)) -
						(f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance)
					 ) AS 'BasicPay',
					f.RegOTPay AS 'RegOTPay',
					f.SunPay AS 'SunPay',
					f.SunOTPay AS 'SunOTPay',
					f.HolidayPay AS 'HolidayPay',
					f.HolidayOTPay AS 'HolidayOTPay',
					f.NPPay AS 'NPPay',
					f.HolidayNPPay AS 'HolidayNPPay',
					f.SunNPPay AS 'SunNPPay',
					f.PaternityLeavePay AS 'PaternityLeavePay',
					f.SILPay AS 'SILPay',
					f.AdditionalAdjustment AS 'AdditionalAdjustment',
					f.LateDeduction AS 'LateDeduction',
					(
						( (f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance) +
						f.COLA + 
						f.mobile_allowance + 
						( IF(f.rate_type="Monthly",(f.BasicSalary/2),(f.HourlyRate * f.ActualHour))  -
							(f.meal_allowance + f.cloathing_allowance + f.medical_allowance_dependent + f.laundry_allowance)
						) +
						f.RegOTPay +
						f.SunPay +
						f.SunOTPay +
						f.HolidayPay +
						f.HolidayOTPay +
						f.NPPay + 
						f.HolidayNPPay +
						f.SunNPPay +
						f.PaternityLeavePay +
						f.SILPay +
						f.AdditionalAdjustment ) -
						(f.LateDeduction + f.UTDeduction + f.AbsentDeduction)
					) AS 'GrossPay',
					'0' AS 'TaxableCompensation',
					f.SSS AS 'SSS',
					f.PHILHEALTH AS 'PhilHealth',
					f.PAGIBIG AS 'PAGIBIG',
					f.WTax AS 'WTax',
					f.UnderWithheld AS 'UnderWithheld',
					f.OtherDeductions AS 'OtherDeductions',
					f.TotalTax AS 'TotalTax',
					f.SSSLOAN AS 'SSSLoan',
					f.PAGIBIGLOAN 'PAGIBIGLoan',
					f.DeductionAdjustment AS 'DeductionAdjustment',
					f.CA AS 'CA',
					(f.SSS + f.PHILHEALTH + f.PAGIBIG + f.UnderWithheld + f.OtherDeductions + f.SSSLOAN + f.PAGIBIGLOAN + f.DeductionAdjustment + f.CA + f.canteen + f.coop + f.other_Loan) AS 'TotalDeductions',
					'0' AS 'NetPay',
					'0' AS 'NetPay2',
					'0' AS 'Extra',
					f.sss_er AS 'SSSER',
					f.ph_er AS 'PhilHealthER',
					f.pagibig_er AS 'PAGIBIGER',
					'0' AS 'WtaxER',
					(f.sss_er + f.ph_er + f.pagibig_er) AS 'TotalER',
					f.bonus,
					f.canteen,
					f.coop,
					f.other_Loan,
					f.LastName,
					f.FirstName,
					f.MiddleName,
					f.UTDeduction,
					f.AbsentDeduction,
					f.dept_id
				FROM
					(SELECT 
						e.id,
						e.UserID,
						e.EmpName,
						e.Position,
						e.BasicSalary 'BasicSalary',
						(e.BasicSalary / 2) 'MonthlyRate',
						e.DutyDays,
						e.holiday_cnt 'HolidayDays',
						e.leave_days 'LeaveDays',
						e.RegularWage 'RegularWage',
						e.OTPay 'OTPay',
						(e.SundayHrs + e.special_holiday_hrs) 'SpecialHrs',
						(e.leave_day_pay + e.leave_hour_pay) 'LeavePay',
						(e.Gross + e.OTPay + (e.normal_holiday + e.regular_holiday + e.special_holiday)) 'Gross',
						e.transpo_allowance,
						IF(e.mobile_allowance=0,0,e.mobile_allowance/2) AS 'mobile_allowance',
						e.osa_allowance,
						IF(e.meal_allowance=0,0, 
							(
								IF(e.rate_type="Daily",
									( (e.meal_allowance * (e.ActualHour + e.HolidayHour + e.SpclHour) ) / 8 ),
									( ( (e.meal_allowance/26) / 8 ) * e.ActualHour )
								)
							) 
								) AS 'meal_allowance',
						IF(e.cloathing_allowance=0,0, ( ( (e.cloathing_allowance/26) / 8 ) * e.ActualHour ) ) AS 'cloathing_allowance',
						(e.medical_allowance_dependent/2) AS 'medical_allowance_dependent',
						IF(e.laundry_allowance=0,0,
							IF(e.id=2,(e.laundry_allowance/2), ( ( (e.laundry_allowance/26) / 8 ) * e.ActualHour ) )
						) AS 'laundry_allowance',
						e.UTDeduction 'UTDeduction',
						e.COLA 'COLA',
						e.SSS_Loan 'SSSLOAN',
						e.PAGIBIG_Loan 'PAGIBIGLOAN',
						IF(ISNULL(e.SSS),0,e.SSS) 'SSS',
						IF(ISNULL(e.PHILHEALTH),0,e.PHILHEALTH) 'PHILHEALTH',
						IF(ISNULL(e.PAGIBIG),0,e.PAGIBIG) 'PAGIBIG',
						e.WTax 'WTax',
						'0' AS 'UnderWithheld',
						'0' AS 'OtherDeductions',
						'0' AS 'TotalTax',
						'0' AS 'DeductionAdjustment',
						FORMAT(0,2) 'TotalAllowance',
						FORMAT(e.TotalGovDeduction,2) 'TotalGovDeduction',
						FORMAT( ( ((e.Gross + e.OTPay + (e.normal_holiday + e.regular_holiday + e.special_holiday) + (e.leave_day_pay + e.leave_hour_pay) ) - e.LateDeduction - e.UTDeduction) - (e.TotalGovDeduction)  + e.COLA - e.CA - e.SSS_Loan - e.PAGIBIG_Loan - e.sss_ee - e.ph_ee - e.pagibig_ee) , 2) 'Net',
						e.DailyRate 'DailyRate',
						e.HourlyRate 'HourlyRate',
						e.MinRate,
						e.HolidayRate 'HolidayRate',
						e.SpecialRate 'SpecialRate',
						e.OTRate 'OTRate',
						e.NPRate,
						IF(ISNULL(e.CA),0,e.CA) 'CA',
						e.SSS_Loan,
						e.PAGIBIG_Loan,
						e.sss_er,
						e.sss_ee,
						e.ph_er,
						e.ph_ee,
						e.pagibig_er,
						e.pagibig_ee,
						e.PaternityLeave,
						e.leave_days,
						e.leave_hours,
						e.leave_day_pay,
						e.leave_hour_pay,
						e.WorkingHrs,
						e.TotalLate,
						e.TotalUT,
						e.TotalOT,
						e.SundayHrs,
						e.special_holiday_hrs,
						e.special_holiday,
						e.AccountNo_Empl,
						e.Department_Empl,
						e.StandardDays,
						e.StandardHour,
						e.ot_hours,
						e.np_hours,
						e.AbsentHour,
						e.HolidayHour,
						e.HolidayOTHour,
						e.HolidayNP,
						e.SpclOTHour,
						e.SunNP,
						e.ActualHour,
						e.SpclHour,
						e.rate_type,
						(e.TotalOT * e.OTRate) 'RegOTPay',
						(e.SpclHour * e.SpecialRate) 'SunPay',
						(e.SpclOTHour * e.SpecialRate) 'SunOTPay',
						(e.HolidayHour * e.HourlyRate) AS 'HolidayPay',
						(e.HolidayOTHour * e.HolidayRate) AS 'HolidayOTPay',
						(e.np_hours * e.NPRate) AS 'NPPay',
						((2.2 * e.NPRate) * e.HolidayNP) AS 'HolidayNPPay',
						((1.43 * e.NPRate) * e.HolidayNP) AS 'SunNPPay',
						(e.PaternityLeave * e.HourlyRate)AS 'PaternityLeavePay',
						(e.leave_hours * e.HourlyRate) AS 'SILPay',
						0 AS 'AdditionalAdjustment',
						(e.TotalLate * e.HourlyRate) AS 'LateDeduction',
						e.bonus,
						e.canteen,
						e.coop,
						e.other_Loan,
						e.LastName,
						e.FirstName,
						e.MiddleName,
						e.AbsentDeduction,
						e.dept_id
						
					FROM
						(SELECT 
							d.id,
							d.UserID,
							d.EmpName,
							d.Position,
							d.BasicSalary,
							d.DutyDays,
							d.RegularWage,
							(d.TotalOT * d.OTRate) 'OTPay',
							d.HolidayPay,
							(d.RegularWage + d.OTPay + d.HolidayPay) 'Gross',
							d.transpo_allowance,
							d.mobile_allowance,
							d.osa_allowance,
							d.meal_allowance,
							d.medical_allowance_dependent,
							d.cloathing_allowance,
							d.laundry_allowance,
							(d.HourlyRate * d.TotalLate) 'LateDeduction',
							(d.HourlyRate * d.TotalUT) 'UTDeduction',
							(d.AbsentHour * d.TotalUT) 'AbsentDeduction',
							d.sss_ee 'SSS',
							d.ph_ee 'PHILHEALTH',
							d.pagibig_ee 'PAGIBIG',
							d.gp_wtax 'WTax',
							d.TotalAllowance,
							d.TotalGovDeduction,
							(d.DoleRate_Empl * d.DutyDays) 'COLA',
							d.DailyRate,
							d.HourlyRate,
							d.MinRate,
							d.HolidayRate,
							d.SpecialRate,
							d.OTRate,
							d.NPRate,
							d.CA,
							d.SSS_Loan,
							d.PAGIBIG_Loan,
							d.sss_er,
							d.sss_ee,
							d.ph_er,
							d.ph_ee,
							d.pagibig_er,
							d.pagibig_ee,
							(d.HourlyRate * d.normal_holiday_hrs) 'normal_holiday',
							(d.HolidayRate * d.regular_holiday_hrs) 'regular_holiday',
							(d.SpecialRate * (d.special_holiday_hrs + d.SundayHrs)) 'special_holiday',
							d.holiday_cnt,
							d.leave_days,
							d.leave_hours,
							d.leave_day_pay,
							d.leave_hour_pay,
							d.WorkingHrs,
							d.TotalLate,
							d.TotalUT,
							d.TotalOT,
							d.SundayHrs,
							d.special_holiday_hrs,
							d.AccountNo_Empl,
							d.Department_Empl,
							d.no_of_days,
							(d.no_of_days/2) AS 'StandardDays',
							((d.no_of_days/2)*8) AS 'StandardHour',
							d.ot_hours,
							d.np_hours,
							d.AbsentHour,
							(d.normal_holiday_hrs + d.regular_holiday_hrs) AS 'HolidayHour',
							d.HolidayOTHour,
							d.HolidayNP,
							d.SpclOTHour,
							d.SunNP,
							d.rate_type,
							/*( ((d.no_of_days/2)*8) - (d.AbsentHour + d.leave_hours) ) AS 'ActualHour', */
							( d.WorkingHrs  ) AS 'ActualHour',
							(d.special_holiday_hrs + d.SundayHrs) 'SpclHour',
							0 AS 'PaternityLeave',
							d.bonus,
							d.canteen,
							d.coop,
							d.other_Loan,
							d.LastName,
							d.FirstName,
							d.MiddleName,
							d.dept_id
						FROM
							(SELECT
								c.UserID,
								c.EmpName,
								c.Position,
								c.BasicSalary,
								c.DutyDays,
								(c.DutyDays * c.DailyRate) 'RegularWage',
								'0' AS 'OTPay',
								'0' AS 'HolidayPay',
								c.gp_sss_ee,
								c.gp_phealth_ee,
								c.gp_pagibig_ee,
								c.gp_wtax,
								c.transpo_allowance,
								c.mobile_allowance,
								c.osa_allowance,
								c.meal_allowance,
								c.medical_allowance_dependent,
								c.cloathing_allowance,
								c.laundry_allowance,
								c.no_of_days,
								c.rate_type,
								c.DailyRate,
								c.HourlyRate,
								c.MinRate,
								(SUM(c.`WorkingHrs`)) 'WorkingHrs',
								(SUM(c.`TotalLate`)) 'TotalLate',
								(SUM(c.`TotalUT`)) 'TotalUT',
								SUM(c.`TotalOT`) 'TotalOT',
								(SUM(c.`SundayHrs`)) 'SundayHrs',
								(SUM(c.`regular_holiday_hrs`)) 'regular_holiday_hrs',
								SUM(c.`special_holiday_hrs`) 'special_holiday_hrs',
								c.normal_holiday_hrs,
								( c.transpo_allowance +  c.mobile_allowance + c.osa_allowance +c.meal_allowance ) 'TotalAllowance',
								( c.gp_sss_ee +  c.gp_phealth_ee + c.gp_pagibig_ee + c.gp_wtax ) 'TotalGovDeduction',
								c.DoleRate_Empl,
								c.id,
								c.HolidayRate,
								c.SpecialRate,
								c.OTRate,
								c.NPRate,
								c.CA,
								c.SSS_Loan,
								c.PAGIBIG_Loan,
								c.sss_er,
								c.sss_ee,
								c.ph_er,
								c.ph_ee,
								c.pagibig_er,
								c.pagibig_ee,
								c.holiday_cnt,
								c.leave_days,
								c.leave_hours,
								(c.leave_days * c.DailyRate) AS 'leave_day_pay',
								(c.leave_hours * c.HourlyRate) AS 'leave_hour_pay',
								c.AccountNo_Empl,
								c.Department_Empl,
								c.ot_hours,
								c.np_hours,
								c.AbsentHour,
								c.HolidayOTHour,
								c.HolidayNP,
								(c.SpclOTHour +  c.SundayOT) AS 'SpclOTHour',
								(c.SunNP + c.SundayOT) AS 'SunNP',
								c.bonus,
								c.canteen,
								c.coop,
								c.other_Loan,
								c.LastName,
								c.FirstName,
								c.MiddleName,
								c.dept_id
								
							FROM
								(SELECT 
									IF(b.holiday_type="0", IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'WorkingHrs',
									b.Late 'TotalLate',
									b.UT 'TotalUT',
									b.OT 'TotalOT',
									IF(b.holiday_type=0, IF(b.Restday='1',b.total_hours_worked,0) ,0) 'SundayHrs',
									IF(b.holiday_type="regular",IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'regular_holiday_hrs',
									IF(b.holiday_type="special",IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'special_holiday_hrs',
									IF(b.att_type="absent",IF(b.Restday<>'1',b.total_hours_worked,0) ,0) 'AbsentHour',
									(8 * (b.holiday_cnt - b.holiday_cnt_minus) ) 'normal_holiday_hrs',
									IF(b.holiday_type="special",IF(b.Restday<>'1',b.ot_hours,0) ,0) AS 'SpclOTHour',
									IF(b.holiday_type="regular",IF(b.Restday<>'1',b.ot_hours,0) ,0) AS 'HolidayOTHour',
									IF(b.holiday_type="regular",IF(b.Restday<>'1',b.np_hours,0) ,0) AS 'HolidayNP',
									IF(b.holiday_type="special",IF(b.Restday<>'1',b.np_hours,0) ,0) AS 'SunNP',
									IF(b.holiday_type=0, IF(b.Restday='1',b.np_hours,0) ,0) AS 'SundayNP',
									IF(b.holiday_type=0, IF(b.Restday='1',b.ot_hours,0) ,0) AS 'SundayOT',
									b.UserID,
									b.EmpName,
									b.Position,
									b.BasicSalary,
									b.gp_sss_ee,
									b.gp_phealth_ee,
									b.gp_pagibig_ee,
									b.gp_wtax,
									b.transpo_allowance,
									b.mobile_allowance,
									b.osa_allowance,
									b.meal_allowance,
									b.medical_allowance_dependent,
									b.cloathing_allowance,
									b.laundry_allowance,
									b.no_of_days,
									b.rate_type,
									b.DailyRate,
									b.DutyDays,
									b.HourlyRate,
									(b.HourlyRate/60) AS 'MinRate',
									b.DoleRate_Empl,
									b.id,
									(b.HourlyRate * 2) 'HolidayRate',
									(b.HourlyRate * 1.3) 'SpecialRate',
									(b.HourlyRate * 1.25) 'OTRate',
									(b.HourlyRate * 0.1) 'NPRate',
									b.CA,
									b.SSS_Loan,
									b.PAGIBIG_Loan,
									IF(DAY(_dateFrom) > 15,0, b.sss_er) 'sss_er',
									IF(DAY(_dateFrom) > 15,0,b.sss_ee) 'sss_ee',
									IF(DAY(_dateFrom) > 15,0,b.ph_er) 'ph_er',
									IF(DAY(_dateFrom) > 15,0,b.ph_ee) 'ph_ee',
									IF(DAY(_dateFrom) > 15,0,b.pagibig_er) 'pagibig_er',
									IF(DAY(_dateFrom) > 15,0,b.pagibig_ee) 'pagibig_ee',
									b.holiday_cnt,
									b.leave_days,
									b.leave_hours,
									b.AccountNo_Empl,
									b.Department_Empl,
									IF(b.holiday_type="0", IF(b.Restday<>'1',b.ot_hours,0) ,0) AS 'ot_hours',
									IF(b.holiday_type="0", IF(b.Restday<>'1',b.np_hours,0) ,0) AS 'np_hours',
									b.bonus,
									b.canteen,
									b.coop,
									b.other_Loan,
									b.LastName,
									b.FirstName,
									b.MiddleName,
									b.dept_id
								FROM 
									(SELECT 
										a.`AM IN`  'AM IN',
										a.`PM OUT`  'PM OUT',
										a.total_hours_worked,
										a.late 'Late',
										a.undertime 'UT',
										IF(ISNULL(a.OT),0,a.ot) 'OT',
										a.UserID,
										a.EmpName,
										a.Position,
										a.BasicSalary,
										a.gp_sss_ee,
										a.gp_phealth_ee,
										a.gp_pagibig_ee,
										a.gp_wtax,
										a.transpo_allowance,
										a.mobile_allowance,
										a.osa_allowance,
										a.meal_allowance,
										a.medical_allowance_dependent,
										a.cloathing_allowance,
										a.laundry_allowance,
										a.no_of_days,
										a.rate_type,
										a.DailyRate,
										IF(a.dtr_dayName=a.Restday,'1','') 'Restday',
										(a.DutyDays - a.holiday_cnt_minus) AS 'DutyDays',
										(a.DailyRate/8) 'HourlyRate',
										a.DoleRate_Empl,
										a.id,
										IF(ISNULL(a.CA),0,a.CA) 'CA',
										IF(ISNULL(a.SSS_Loan),0,a.SSS_Loan) 'SSS_Loan',
										IF(ISNULL(a.PAGIBIG_Loan),0,a.PAGIBIG_Loan) 'PAGIBIG_Loan',
										(SELECT ssser.ER FROM sss_setup ssser WHERE a.BasicSalary BETWEEN ssser.range_from AND ssser.range_to LIMIT 1) 'sss_er',
										(SELECT sssee.EE FROM sss_setup sssee WHERE a.BasicSalary BETWEEN sssee.range_from AND sssee.range_to LIMIT 1) 'sss_ee',
										(SELECT ((((a.BasicSalary) * 0.03) / 2)) ) 'ph_er',
										(SELECT ((((a.BasicSalary) * 0.03) / 2)) ) 'ph_ee',
										(SELECT 100/2 FROM pagibig_setup pagibig_er WHERE (a.BasicSalary/2) BETWEEN pagibig_er.Gross_From AND pagibig_er.Gross_To LIMIT 1) 'pagibig_er',
										(SELECT ((a.BasicSalary) * 0.02) )  'pagibig_ee',
										IF(ISNULL(a.holiday_checker),0,a.holiday_checker) AS 'holiday_type',
										a.holiday_cnt_minus AS 'holiday_cnt_minus',
										a.holiday_cnt,
										IF(ISNULL(a.leave_days),0,a.leave_days) 'leave_days',
										IF(ISNULL(a.leave_hours),0,a.leave_hours) 'leave_hours',
										a.AccountNo_Empl,
										a.Department_Empl,
										a.ot_hours,
										a.np_hours,
										a.att_type,
										IF(ISNULL(a.bonus),0,a.bonus) 'bonus',
										IF(ISNULL(a.canteen),0,a.canteen) 'canteen',
										IF(ISNULL(a.coop),0,a.coop) 'coop',
										IF(ISNULL(a.other_Loan),0,a.other_Loan) 'other_Loan',
										a.LastName,
										a.FirstName,
										a.MiddleName,
										a.dept_id
									FROM
										(SELECT 
											IFNULL(TIME_FORMAT(hr.in_am,'%H:%i'),'00:00') 'AM IN',
											IFNULL(TIME_FORMAT(hr.out_pm,'%H:%i'),'00:00') 'PM OUT',
											IFNULL(TIME_FORMAT(e.TimeStart_Empl,'%H:%i'),'00:00') 'SCHED IN',
											IFNULL(TIME_FORMAT(e.TimeEnd_Empl,'%H:%i'),'00:00') 'SCHED OUT',
											(SELECT OT_Hours FROM approved_ot ot WHERE ot.employee_number = hr.employee_number AND ot.dtr_date=hr.dtr_date LIMIT 1) 'OT',
											hr.dtr_date,
											CAST(DAYNAME(hr.dtr_date) AS CHAR(25)) 'dtr_dayName',
											e.Restday,
											hr.employee_number 'UserID',
											e.Name_Empl 'EmpName',
											e.LastName_Empl 'LastName',
											e.FirstName_Empl 'FirstName',
											e.MiddleName_Empl 'MiddleName',
											r.Position_Empl 'Position',
											IF(e.rate_type="Daily",(e.BasicSalary_Empls*e.no_of_days),e.BasicSalary_Empls) 'BasicSalary',
											e.gp_sss_ee,
											e.gp_phealth_ee,
											e.gp_pagibig_ee,
											e.gp_wtax,
											e.transpo_allowance,
											e.mobile_allowance,
											e.osa_allowance,
											e.meal_allowance,
											e.medical_allowance_dependent,
											e.cloathing_allowance,
											e.laundry_allowance,
											e.no_of_days,
											e.rate_type,
											IF(e.rate_type="Daily",e.BasicSalary_Empls,(e.BasicSalary_Empls/e.no_of_days)) 'DailyRate',
											(SELECT COUNT(*) FROM hr_emp_attendance hr2 WHERE hr2.employee_number = hr.employee_number AND hr2.dtr_date BETWEEN _dateFrom AND _dateTo  AND !ISNULL(hr2.in_am) AND !ISNULL(hr2.out_pm)) 'DutyDays',
											e.DoleRate_Empl,
											e.SysPK_Empl 'id',
											e.AccountNo_Empl,
											e.Department_Empl,
											hr.late,
											hr.undertime,
											hr.ot_hours,
											hr.np_hours,
											hr.total_hours_worked,
											hr.att_type,
											e.dept_id,
											(SELECT SUM(ca.amount_deduction) FROM emp_cash_advance ca WHERE ca.emp_id = e.SysPK_Empl AND ((ca.date_from <= _dateTo) AND  (ca.date_to >= _dateTo))) 'CA',
											(SELECT SUM(sss.amount_deduction) FROM emp_sss_loan sss WHERE sss.emp_id = e.SysPK_Empl AND ((sss.date_from <= _dateTo) AND (sss.date_to >= _dateTo))) 'SSS_Loan',
											(SELECT SUM(pagibig.amount_deduction) FROM emp_pagibig_loan pagibig WHERE pagibig.emp_id = e.SysPK_Empl AND ((pagibig.date_from <= _dateTo) AND  (pagibig.date_to >= _dateTo))) 'PAGIBIG_Loan',
											(SELECT SUM(sss.amount_deduction) FROM emp_other_loan sss WHERE sss.emp_id = e.SysPK_Empl AND ((sss.date_from <= _dateTo) AND (sss.date_to >= _dateTo))) 'other_Loan',
											(SELECT SUM(ca.canteen) FROM payroll_deduction ca WHERE ca.emp_no = e.SysPK_Empl AND ca.deduction_date BETWEEN _dateFrom AND _dateTo) 'canteen',
											(SELECT SUM(ca.coop) FROM payroll_deduction ca WHERE ca.emp_no = e.SysPK_Empl AND ca.deduction_date BETWEEN _dateFrom AND _dateTo) 'coop',
											(SELECT SUM(ca.amount) FROM emp_cash_bonus ca WHERE ca.emp_id = e.SysPK_Empl AND ca.bonus_date BETWEEN _dateFrom AND _dateTo) 'bonus',
											(SELECT h.holiday_type FROM hr_holidays h WHERE h.holiday_date = hr.dtr_date) AS 'holiday_checker',
											(SELECT COUNT(*) FROM hr_holidays h WHERE h.holiday_date BETWEEN _dateFrom AND _dateTo ) AS 'holiday_cnt',
											(SELECT COUNT(h.holiday_date) FROM hr_holidays h,hr_emp_attendance hhr WHERE h.holiday_date = hhr.dtr_date AND hhr.employee_number = hr.employee_number) AS 'holiday_cnt_minus',
											(SELECT SUM(IF(ISNULL(l.no_of_days),0,l.no_of_days)) FROM `leaves` l WHERE e.SysPK_Empl = l.emp_id AND l.is_approved = 1 AND ((l.leave_date_from BETWEEN _dateFrom AND _dateTo) OR (l.leave_date_to BETWEEN _dateFrom AND _dateTo))) AS 'leave_days',
											(SELECT SUM(IF(ISNULL(l.total_hours),0,l.total_hours)) FROM `leaves` l WHERE e.SysPK_Empl = l.emp_id AND l.is_approved = 1 AND ((l.leave_date_from BETWEEN _dateFrom AND _dateTo) OR (l.leave_date_to BETWEEN _dateFrom AND _dateTo))) AS 'leave_hours'
										FROM 
											hr_emp_attendance hr,
											employees e,
											employees_rate r
										WHERE 
											e.UserID_Empl = hr.employee_number AND 
											e.Position_Empl = r.id AND 
											hr.dtr_date BETWEEN _dateFrom AND _dateTo
										ORDER BY e.UserID_Empl
										
										) a
									)b
								) c GROUP BY c.UserID ORDER BY c.UserID
							)d
						)e
				)f
			)g
		)h
	)i
)j
ORDER BY j.UserID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `hr_fill_dtr_calendar` */

/*!50003 DROP PROCEDURE IF EXISTS  `hr_fill_dtr_calendar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `hr_fill_dtr_calendar`(IN start_date DATE, IN end_date DATE)
BEGIN
          DECLARE crt_date DATE;
	  SET crt_date=start_date;
	  WHILE crt_date <= end_date DO
	    INSERT INTO hr_dtr_calendar VALUES(crt_date);
	    SET crt_date = ADDDATE(crt_date, INTERVAL 1 DAY);
	  END WHILE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `hr_reset_dtr_calendar` */

/*!50003 DROP PROCEDURE IF EXISTS  `hr_reset_dtr_calendar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `hr_reset_dtr_calendar`()
BEGIN
TRUNCATE TABLE hr_dtr_calendar;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
